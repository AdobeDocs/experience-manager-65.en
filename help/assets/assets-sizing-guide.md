---
title: Assets Sizing Guide
description: Best practices to determine efficient metrics for estimating the infrastructure and resources required for deploying AEM Assets.
uuid: ed275e97-59d3-4945-9d1b-3351113f8ce5
contentOwner: AG
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
discoiquuid: 68e9cd31-f1db-4678-840f-75bbced53402
docset: aem65

---

# Assets Sizing Guide {#assets-sizing-guide}

When sizing the environment for an Adobe Experience Manager (AEM) Assets implementation, it is important to ensure that there are sufficient resources available in terms of disk, CPU, memory, IO, and network throughput. Sizing many of these resources requires an understanding of how many assets are being loaded into the system. If a better metric is not available, you can divide the size of the existing library by the age of the library to find the rate at which assets are created.

## Disk {#disk}

### DataStore {#datastore}

A common mistake made when sizing the required disk space for an Assets implementation is to base the calculations on the size of the raw images to be ingested into the system. By default, AEM creates three renditions in addition to the original image for use in rendering the AEM UI elements. In previous implementations, these renditions have been observed to assume twice the size of the assets that are ingested.

Most users define custom renditions in addition to the out-of-the-box renditions. In addition to the renditions, AEM Assets lets you extract sub-assets from common file types, such as InDesign and Illustrator.

Finally, AEM’s versioning capabilities store duplicates of the assets in the version history. You can configure the versions to be purged often. However, many users choose to retain versions in the system for a long time, which consumes additional storage space.

Considering these factors, you require a methodology to calculate an acceptably accurate storage space to store user assets.

1. Determine the size and number of assets that will be loaded into the system.
1. Get a representative sample of the assets to be uploaded into AEM. For instance, if you plan to load PSD, JPG, AI and PDF files into the system, you require multiple sample images of each file format. In addition, these samples should be representative of the different file sizes and complexities of images.
1. Define the renditions to be used.
1. Create the renditions in AEM using ImageMagick or Adobe’s Creative Cloud applications. In addition to the renditions that the users specify, create out-of-the-box renditions. For users who implement Scene7, you can use the IC binary to generate the PTIFF renditions to be stored in AEM.
1. If you plan to use subassets, generate them for the appropriate file types. See online documentation on how to generate subasset pages from InDesign files or PNG/PDF files from Illustrator layers.
1. Compare the size of the output images, renditions, and subassets with the original images. It allows you to generate an expected growth factor when the system is loaded. For example, if you generate renditions and subassets with a combined size of 3GB after processing 1GB of assets, the rendition growth factor is 3.
1. Determine the maximum time for which asset versions are to be maintained in the system.
1. Determine how often existing assets are modified in the system. If AEM is used as a collaboration hub in creative workflows, the amount of changes are high. If only finished assets are uploaded to the system, this number is much lower.
1. Determine how many assets are loaded into the system each month. If you are unsure, ascertain the number of assets that are currently available, and divide the number by the age of the oldest asset to calculate an approximate number.

Performing steps 1-9 helps you determine the following:

* Raw size of assets to be loaded
* Number of assets to be loaded
* Rendition growth factor
* Number of asset modifications made per month
* Number of months to maintain asset versions
* Number of new assets loaded each month
* Years of growth to allocate space for

You can specify these numbers in the Network Sizing spreadsheet to determine the total space required for your datastore. It is also a useful tool to determine the impact of maintaining asset versions or modifying assets in AEM on disk growth.

The example data populated in the tool demonstrates how important it is to perform the steps mentioned. If you size the datastore based solely on the raw images being loaded (1 TB), you may have underestimated the repository size by a factor of 15.

[Get File](assets/disk_sizing_tool.xlsx)

### Shared Datastores {#shared-datastores}

For large datastores, you can implement a shared datastore either through a shared file datastore on a network attached drive or through an S3 datastore. In this case, individual instances need not maintain a copy of the binaries. In addition, a shared datastore facilitates binary-less replication and helps reduce the bandwidth used to replicate assets to publish environments.

#### Use Cases {#use-cases}

The datastore can be shared between a primary and standby author instance to minimize the amount of time that it takes to update the standby instance with changes made in the primary instance. You can also share the datastore between the author and publish instances to minimize the traffic during replication.

#### Drawbacks {#drawbacks}

Owing to some pitfalls, sharing a datastore is not recommended in all cases.

#### Single Point of Failure {#single-point-of-failure}

Having a shared datastore, introduces a single point of failure in an infrastructure. Consider a scenario where your system has one author and two publish instances, each with their own datastore. If any one of them crashes, the other two still can continue running. However, if the datastore is shared, a single disk failure can take down the entire infrastructure. Therefore, ensure that you maintain a backup of the shared datastore from where you can restored the datastore quickly.

Deploying the AWS S3 service for shared datastores is preferred because it significantly reduces the probability of failure compared to normal disk architectures.

#### Increased Complexity {#increased-complexity}

Shared datastores also increase the complexity of operations, such as garbage collection. Normally, garbage collection for a standalone datastore can be initiated with a single click. However, shared datastores require mark sweep operations on each member that uses the datastore, in addition to running the actual collection on a single node.

For AWS operations, implementing a single central location (via S3), rather than building a RAID array of EBS volumes, can significantly offset the complexity and operational risks on the system.

#### Performance Concerns {#performance-concerns}

A shared datastore requires the binaries to be stored on a network-mounted drive that is shared between all instances. Because these binaries are accessed over a network, the system performance is adversely impacted. You can partially mitigate the impact by using a fast network connection to a fast array of disks. However, this is an expensive proposition. In the case of AWS operations, all disks are remote and require network connectivity. Ephemeral volumes lose data when the instance starts or stops.

#### Latency {#latency}

Latency in S3 implementations is introduced by the background writing threads. Backup procedures must take into account this latency. In addition, Lucene indexes may remain incomplete when making a backup. It applies to any time-sensitive file written to S3 datastore and accessed from another instance.

### Node Store/Document Store {#node-store-document-store}

It is difficult to arrive at precise sizing figures for a NodeStore or DocumentStore because of the resources consumed by the following:

* Asset metadata
* Asset versions
* Audit logs
* Archived and active workflows

Because the binaries are be stored in the datastore, each binary occupies some space. Most repositories are below 100GB in size. However, there may be larger repositories upto 1 TB in size. Additionally, to perform offline compaction, you require enough free space on the volume to rewrite the compacted repository alongside the pre-compacted version. A good rule-of-thumb is to size the disk to 1.5 times the size expected for the repository.

For the repository, use SSDs or disks with an IOPS level greater than 3Kilobyte. To eliminate chances of IOPS introducing performance bottlenecks, monitor CPU IO Wait levels for early signs of issues.

[Get File](assets/aem_environment_sizingtool.xlsx)

## Network {#network}

AEM Assets has a number of use cases that make network performance more important than on many of our AEM projects. A customer can have a fast server, but if the network connection is not large enough to support the load of the users who are uploading and downloading assets from the system, then it will still appear to be slow. There is a good methodology for determining the choke point in a user's network connection to AEM at [AEM Asset considerations for user experience, instance sizing, workflow evaluation, and network topology](/help/assets/assets-network-considerations.md).

## Limitations {#limitations}

When sizing an implementation, it is important to keep system limitations in mind. If the proposed implementation exceeds these limitations, employ creative strategies, such as partitioning the assets across multiple Assets implementations.

File size is not the only factor that contributes to out of memory (OOM) issues. It also depends on dimensions of the image. You can avoid OOM issues by providing a higher heap size when you start AEM.

In addition, you can edit the threshold size property of the `com.day.cq.dam.commons.handler.StandardImageHandler` component in Configuration Manager to use intermediate temporary file greater than zero.

## Maximum number of assets {#maximum-number-of-assets}

The limit to the number of files that can exist in a datastore can be 2.1 billion due to filesystem limitations. It is likely that the repository encounters problems due to large number of nodes long before reaching the datastore limit.

If the renditions are incorrectly generated, use the Camera Raw library. However, in this case, the longest side of the image should not be greater than 65000 pixels. In addition, the image should not contain more than 512 MP (512 x 1024 x 1024 pixels). The size of the asset does not matter.

It is difficult to accurately estimate the size of the TIFF file supported out-of-the-box (OOTB) with a specific heap for AEM because additional factors, such as pixel size influence processing. It is possible that AEM can process a file of size of 255 MB OOTB, but cannot process a file size of 18 MB bacause the latter comprises of an unusually higher number pixels compared to the former.

## Size of Assets {#size-of-assets}

By default, AEM allows you to upload assets of file sizes up to 2 GBs. To upload very large assets in AEM, see [Configuration to upload very large assets](managing-video-assets.md#configuration-to-upload-assets-that-are-larger-than-gb).

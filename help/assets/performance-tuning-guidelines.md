---
title: Performance tuning [!DNL Assets].
description: Suggestions and guidance about [!DNL Experience Manager] configuration, changes to hardware, software, and network components to remove bottlenecks and optimize the performance of [!DNL Experience Manager Assets].
contentOwner: AG
mini-toc-levels: 1
role: Architect, Admin
feature: Asset Management
exl-id: 1d9388de-f601-42bf-885b-6a7c3236b97e
---
<!-- TBD: Get reviewed by engineering. -->

# [!DNL Adobe Experience Manager Assets] performance tuning guide {#assets-performance-tuning-guide}

An [!DNL Experience Manager Assets] setup contains a number of hardware, software, and network components. Depending upon your deployment scenario, you may require specific configuration changes to hardware, software, and network components to remove performance bottlenecks.

In addition, identifying and adhering to certain hardware and software optimization guidelines helps build a sound foundation that enables your [!DNL Experience Manager Assets] deployment to meet expectations around performance, scalability, and reliability.

Poor performance in [!DNL Experience Manager Assets] can impact user experience around interactive performance, asset processing, download speed, and other areas.

In fact, performance optimization is a fundamental task that you perform before you establish target metrics for any project.

Here are certain key focus areas around which you discover and fix performance issues before they have an impact on users.

## Platform {#platform}

While Experience Manager is supported on a number of platforms, Adobe has found the greatest support for native tools on Linux and Windows, which contributes to optimum performance and ease of implementation. Ideally, you should deploy a 64-bit operating system to meet the high memory requirements of an [!DNL Experience Manager Assets] deployment. As with any Experience Manager deployment, you should implement TarMK wherever possible. While TarMK cannot scale beyond a single author instance, it is found to perform better than MongoMK. You can add TarMK offload instances to increase the workflow processing power of your [!DNL Experience Manager Assets] deployment.

### Temporary folder {#temp-folder}

To improve asset upload times, use high performance storage for the Java temporary directory. On Linux and Windows, a RAM drive or SSD could be used. In cloud-based environments, an equivalent high speed storage type could be used. For example in Amazon EC2, an [ephemeral drive](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html) drive can be used for the temporary folder.

Assuming the server has ample memory, configure a RAM drive. On Linux, run these commands to create an 8 GB RAM drive:

```shell
mkfs -q /dev/ram1 800000
 mkdir -p /mnt/aem-tmp
 mount /dev/ram1 /mnt/aem-tmp
 df -H | grep aem-tmp
```

On Windows OS, use a third-party driver to create a RAM drive or just use high performance storage such as SSD.

Once the high performance temporary volume is ready, set the JVM parameter `-Djava.io.tmpdir`. For example, you could add the JVM parameter below to the `CQ_JVM_OPTS` variable in the `bin/start` script of [!DNL Experience Manager]:

`-Djava.io.tmpdir=/mnt/aem-tmp`

## Java configuration {#java-configuration}

### Java version {#java-version}

Adobe recommends deploying [!DNL Experience Manager Assets] on Java 8 for optimum performance.

<!-- TBD: Link to the latest official word around Java.
-->

### JVM parameters {#jvm-parameters}

Set the following JVM parameters:

* `-XX:+UseConcMarkSweepGC`
* `-Doak.queryLimitInMemory`=500000
* `-Doak.queryLimitReads`=100000
* `-Dupdate.limit`=250000
* `-Doak.fastQuerySize`=true

## Data store and memory configuration {#data-store-and-memory-configuration}

### File data store configuration {#file-data-store-configuration}

Separating the data store from the segment store is recommended for all [!DNL Experience Manager Assets] users. In addition, configuring the `maxCachedBinarySize` and `cacheSizeInMB` parameters can help maximize performance. Set `maxCachedBinarySize` to the smallest file size that can be held in the cache. Specify the size of the in-memory cache to use for the datastore within `cacheSizeInMB`. Adobe recommends you set this value between 2-10 percent of the total heap size. However, load/performance testing can help determine the ideal setting.

### Configure the maximum size of the buffered image cache {#configure-the-maximum-size-of-the-buffered-image-cache}

When uploading large amounts of assets to [!DNL Adobe Experience Manager], to allow for unexpected spikes in memory consumption and to prevent JVM fails with OutOfMemoryErrors, reduce the configured maximum size of the buffered image cache. Consider an example that you have a system with a maximum heap (- `Xmx`param) of 5 GB, an Oak BlobCache set at 1 GB, and document cache set at 2 GB. In this case, the buffered cache would take maximum 1.25 GB and memory, that would leave only 0.75 GB memory for unexpected spikes.

Configure the buffered cache size in the OSGi Web Console. At `https://host:port/system/console/configMgr/com.day.cq.dam.core.impl.cache.CQBufferedImageCache`, set the property `cq.dam.image.cache.max.memory` in bytes. For example, 1073741824 is 1 GB (1024 x 1024 x 1024 = 1 GB).

From Experience Manager 6.1 SP1, if you're using a `sling:osgiConfig` node for configuring this property, make sure to set the data type to Long. For more details, see [CQBufferedImageCache consumes heap during Asset uploads](https://helpx.adobe.com/experience-manager/kb/cqbufferedimagecache-consumes-heap-during-asset-uploads.html).

### Shared data stores {#shared-data-stores}

Implementing an S3 or Shared File Datastore can help to save disk space and increase network throughput in large-scale implementations. For more information on the pros and cons of using a shared datastore, see [Assets sizing guide](/help/assets/assets-sizing-guide.md).

### S3 data store {#s-data-store}

The following S3 Data Store configuration ( `org.apache.jackrabbit.oak.plugins.blob.datastore.S3DataStore.cfg`) helped Adobe extract 12.8 TB of binary large objects (BLOBs) from an existing file data store into an S3 data store at a customer site:

```conf
accessKey=<snip>
 secretKey=<snip>
 s3Bucket=<snip>
 s3Region=us-standard
 s3EndPoint=<a href="https://s3.amazonaws.com/">s3.amazonaws.com</a>
 connectionTimeout=120000
 socketTimeout=120000
 maxConnections=80
 writeThreads=60
 concurrentUploadsThreads=30
 asyncUploadLimit=30
 maxErrorRetry=1000
 path=/opt/author/crx-quickstart/repository/datastore
 s3RenameKeys=false
 s3Encryption=SSE_S3
 proactiveCaching=true
 uploadRetries=1000
 migrateFailuresCount=400
```

## Network optimization {#network-optimization}

Adobe recommends enabling HTTPS because many companies have firewalls that sniff HTTP traffic, which adversely impacts uploads and corrupts files. For large file uploads, ensure that users have wired connections to the network because a WiFi network becomes quickly saturated. For guidelines on identifying network bottlenecks, see [Assets sizing guide](/help/assets/assets-sizing-guide.md). To assess network performance by analyzing network topology, see [Assets network considerations](/help/assets/assets-network-considerations.md).

Primarily, your network optimization strategy depends upon the amount of bandwidth available and the load on your [!DNL Experience Manager] instance. Common configuration options, including firewalls or proxies can help improve network performance. Here are some key points to bear in mind:

* Depending upon your instance type (small, moderate, large), ensure that you have sufficient network bandwidth for your Experience Manager instance. Adequate bandwidth allocation is especially important if [!DNL Experience Manager] is hosted on AWS.
* If your [!DNL Experience Manager] instance is hosted on AWS, you can benefit by having a versatile scaling policy. Upsize the instance if users expect high load. Downsize it for moderate/low load.
* HTTPS: Most users have firewalls that sniff HTTP traffic, which can adversely impact uploading of files or even corrupt files during the upload operation.
* Large file uploads: Ensure that users have wired connections to the network (WiFi connections saturate quickly).

## Workflows {#workflows}

### Transient workflows {#transient-workflows}

Wherever possible, set the [!UICONTROL DAM Update Asset] workflow to Transient. The setting significantly reduces the overheads required to process workflows because, in this case, workflows need not pass through the normal tracking and archival processes.

1. Navigate to `/miscadmin` in the [!DNL Experience Manager] deployment at `https://[aem_server]:[port]/miscadmin`.

1. Expand **[!UICONTROL Tools]** > **[!UICONTROL Workflow]** > **[!UICONTROL Models]** > **[!UICONTROL dam]**.

1. Open **[!UICONTROL DAM Update Asset]**. From the floating tool panel, switch to the **[!UICONTROL Page]** tab, and then click **[!UICONTROL Page Properties]**.

1. Select **[!UICONTROL Transient Workflow]** and click **[!UICONTROL OK]**.

   >[!NOTE]
   >
   >Some features do not support transient workflows. If your [!DNL Assets] deployment requires these features, do not configure transient workflows.

In cases where transient workflows cannot be used, run workflow purging regularly to delete archived [!UICONTROL DAM Update Asset] workflows to ensure system performance does not degrade.

Typically, execute the purging workflows on a weekly basis. However, in resource-intensive scenarios, such as during wide-scale asset ingestion, you can execute it more frequently.

To configure workflow purging, add a new Adobe Granite Workflow Purge configuration through the OSGi console. Next, configure and schedule the workflow as part of the weekly maintenance window.

If purging runs for too long, it times out. Therefore, you should ensure that your purging jobs complete to avoid situations where purging workflows fail to complete owing to the high number of workflows.

For example, after executing numerous non-transient workflows (that creates workflow instance nodes), you can execute [ACS AEM Commons Workflow Remover](https://adobe-consulting-services.github.io/acs-aem-commons/features/workflow-remover.html) on an ad-hoc basis. It removes redundant, completed workflow instances immediately rather than waiting for the Adobe Granite Workflow Purge scheduler to run.

### Maximum parallel jobs {#maximum-parallel-jobs}

By default, [!DNL Experience Manager] runs a maximum number of parallel jobs equal to the number of processors on the server. The problem with this setting is that during periods of heavy load, all of the processors are occupied by [!UICONTROL DAM Update Asset] workflows, slowing down UI responsiveness and preventing [!DNL Experience Manager] from running other processes that safeguard server performance and stability. As a good practice, set this value to half the processors that are available on the server by performing the following steps:

1. On [!DNL Experience Manager] Author, access `https://[aem_server]:[port]/system/console/slingevent`.

1. Click **[!UICONTROL Edit]** on each workflow queue that is relevant to your implementation, for example **[!UICONTROL Granite Transient Workflow Queue]**.

1. Update the value of **[!UICONTROL Maximum Parallel Jobs]** and click **[!UICONTROL Save]**.

Setting a queue to half of the available processors is a workable solution to start with. However, you may have to increase or decrease this number to achieve maximum throughput and tune it by environment. There are separate queues for transient and non-transient workflows as well as other processes, such as external workflows. If several queues set to 50% of the processors are active simultaneously, the system can get overloaded quickly. The queues that are heavily used vary greatly across user implementations. Therefore, you may have to configure them thoughtfully for maximum efficiency without sacrificing server stability.

### DAM Update Asset configuration {#dam-update-asset-configuration}

The [!UICONTROL DAM Update Asset] workflow contains a full suite of steps that are configured for tasks, such as Dynamic Media PTIFF generation and [!DNL Adobe InDesign Server] integration. However, most users may not require several of these steps. Adobe recommends you create a custom copy of the [!UICONTROL DAM Update Asset] workflow model, and remove any unnecessary steps. In this case, update the launchers for [!UICONTROL DAM Update Asset] to point to the new model.

Running the [!UICONTROL DAM Update Asset] workflow intensively can sharply increase the size of your file datatastore. Results of an experiment performed by Adobe have shown that the datastore size can increase by approximately 400 GB if around 5500 workflows are performed within 8 hours.

It is a temporary increase, and the datastore is restored to its original size after you run the datastore garbage collection task.

Typically, the datastore garbage collection task runs weekly along with other scheduled maintenance tasks.

If you have a limited disk space and run [!UICONTROL DAM Update Asset] workflows intensively, consider scheduling the garbage collection task more frequently.

#### Runtime rendition generation {#runtime-rendition-generation}

Customers use images of various sizes and formats across their website or for distribution to business partners. Because each rendition adds to the footprint of the asset in the repository, Adobe recommends using this feature judiciously. To reduce the amount of resources necessary to process and store images, you can generate these images at run time rather than as renditions during ingestion.

Many Sites customers implement an image servlet that resizes and crops images at the time they are requested, which imposes additional load on the publish instance. However, as long as these images can be cached, the challenge can be mitigated.

An alternative approach is to use Dynamic Media technology to hand-off image manipulation entirely. Additionally, you can deploy Brand Portal that not only takes over rendition generation responsibilities from the [!DNL Experience Manager] infrastructure, but also the entire publish tier.

#### ImageMagick {#imagemagick}

If you customize the [!UICONTROL DAM Update Asset] workflow to generate renditions using ImageMagick, Adobe recommends you modify the `policy.xml` file at `/etc/ImageMagick/`. By default, ImageMagick uses the entire available disk space on the OS volume, and the available memory. Make the following configuration changes within the `policymap` section of `policy.xml` to limit these resources.

```xml
<policymap>
  <!-- <policy domain="system" name="precision" value="6"/> -->
  <policy domain="resource" name="temporary-path" value="/ephemeral0/imagemagick_tmp"/>
  <policy domain="resource" name="memory" value="1000MiB"/>
  <policy domain="resource" name="map" value="1000MiB"/>
  <!-- <policy domain="resource" name="area" value="1gb"/> -->
  <policy domain="resource" name="disk" value="10000MiB"/>
  <!-- <policy domain="resource" name="file" value="768"/> -->
  <policy domain="resource" name="thread" value="1"/>
  <policy domain="resource" name="throttle" value="50"/>
  <!-- <policy domain="resource" name="time" value="3600"/> -->
</policymap>
```

In addition, set the path of ImageMagick's temporary folder in the `configure.xml` file (or by setting the environment variable `MAGICK_TEMPORARY_PATH`) to a disk partition that has sufficient space and IOPS.

>[!CAUTION]
>
>A mis-configuration can make your server unstable if ImageMagick uses all the available disk space. The policy changes required to process large files using ImageMagick may impact the [!DNL Experience Manager] performance. For more information, see [install and configure ImageMagick](/help/assets/best-practices-for-imagemagick.md).

>[!NOTE]
>
>The ImageMagick `policy.xml` and `configure.xml` files are available at `/usr/lib64/ImageMagick-&#42;/config/` instead of `/etc/ImageMagick/`.See [ImageMagick documentation](https://www.imagemagick.org/script/resources.php) for location of the configuration files.

If you are using [!DNL Experience Manager] on Adobe Managed Services (AMS), reach out to Adobe Customer Support if you plan to process lots of large PSD or PSB files. Work with Adobe Customer Support representative to implement these best practices for your AMS deployment and to choose the best possible tools and models for Adobe's proprietary formats. [!DNL Experience Manager] may not process very high-resolution PSB files that are more than 30000 x 23000 pixels.

### XMP writeback {#xmp-writeback}

XMP writeback updates the original asset whenever metadata is modified in [!DNL Experience Manager], which results in the following:

* The asset itself is modified
* A version of the asset is created
* [!UICONTROL DAM Update Asset] is run against the asset

The outcomes listed consume considerable resources. Therefore, Adobe recommends disabling XMP writeback if it is not required. For more information, see [XMP writeback](/help/assets/xmp-writeback.md).

Importing a large amount of metadata can result in resource-intensive XMP writeback activity if run workflows flag is checked. Plan such an import during lean server usage so that performance for other users is not impacted.

## Replication {#replication}

When replicating assets to a large number of publish instances, for example in a Sites implementation, Adobe recommends you use chain replication. In this case, the author instance replicates to a single publish instance which in turn replicates to the other publish instances, freeing up the author instance.

### Configure chain replication {#configure-chain-replication}

1. Choose which publish instance you want to use for chaining the replications to
1. On that publish instance add replication agents that point to the other publish instances
1. On each of those replication agents, enable "On Receive" on the "Triggers" tab

>[!NOTE]
>
>Adobe does not recommend auto-activating assets. However, if necessary, Adobe recommends doing this as the final step in a workflow, usually DAM Update Asset.

## Search indexes {#search-indexes}

Install [the latest Service Packs](/help/release-notes/release-notes.md) and performance-related hotfixes as those often include updates to system indexes. See [performance tuning tips](https://experienceleague.adobe.com/docs/experience-manager-65/assets/administer/performance-tuning-guidelines.html?lang=en) for some index optimizations.

Create custom indexes for queries that you run often. For details, see [methodology for analyzing slow queries](https://aemfaq.blogspot.com/2014/08/oak-query-log-file-analyzer-tool.html) and [crafting custom indexes](/help/sites-deploying/queries-and-indexing.md). For additional insights around query and index best practices, see [Best Practices for Queries and Indexing](/help/sites-deploying/best-practices-for-queries-and-indexing.md).

### Lucene index configurations {#lucene-index-configurations}

Some optimizations can be done on the Oak index configurations that can help improve [!DNL Experience Manager Assets] performance. Update the index configurations to improve the re-indexing time:

1. Open CRXDe `/crx/de/index.jsp` and log in as an administrative user.
1. Browse to `/oak:index/lucene`.
1. Add a `String[]` property `excludedPaths` with values `/var`, `/etc/workflow/instances`, and `/etc/replication`.
1. Browse to `/oak:index/damAssetLucene`. Add a `String[]` property `includedPaths` with value `/content/dam`. Save changes.

If your users do not need to do full-text search of assets, say for example, searching through text in PDF documents, then disable it. You improve index performance by disabling full-text indexing. To disable [!DNL Apache Lucene] text extraction, follow these steps:

1. In [!DNL Experience Manager] interface, access [!UICONTROL Package Manager].
1. Upload and install the package available at [disable_indexingbinarytextextraction-10.zip](assets/disable_indexingbinarytextextraction-10.zip).

### Guess Total {#guess-total}

When creating queries that generate large result sets, use the `guessTotal` parameter to avoid heavy memory utilization when you run them.

## Known issues {#known-issues}

### Large files {#large-files}

There are two major known issues related to large files in [!DNL Experience Manager]. When files reach sizes greater than 2 GB, cold standby synchronization can run into an out-of-memory situation. In some cases, it prevents standby sync from running. In other cases, it causes the primary instance to crash. This scenario applies to any file in [!DNL Experience Manager] that is larger than 2GB, including content packages.

Likewise, when files reach 2 GB in size while using a shared S3 data store, it may take some time for the file to be fully persisted from the cache to the filesystem. As a result, when using binary-less replication, it is possible that the binary data may not have been persisted before replication completes. This situation can lead to issues, especially if the availability of data is important.

## Performance testing {#performance-testing}

For every [!DNL Experience Manager] deployment, establish a performance testing regime that can identify and resolve bottlenecks quickly. Here are some key areas to focus on.

### Network testing {#network-testing}

For all network performance concerns from the customer, perform the following tasks:

* Test network performance from within the customer network
* Test network performance from within Adobe network. For AMS customers, work with your CSE to test from within the Adobe network.
* Test network performance from another access point
* By using a network benchmark tool
* Test against the dispatcher

### [!DNL Experience Manager] deployment testing {#aem-deployment-testing}

To minimize latency and achieve high throughput through efficient CPU utilization and load-sharing, monitor the performance of your [!DNL Experience Manager] deployment regularly. In particular:

* Run load tests against the [!DNL Experience Manager] deployment.
* Monitor upload performance and UI responsiveness.

## [!DNL Experience Manager Assets] performance checklist and impact of asset management tasks {#checklist}

* Enable HTTPS to get around any corporate HTTP traffic sniffers.
* Use a wired connection for heavy asset uploading.
* Deploy on Java 8.
* Set optimal JVM parameters.
* Configure a Filesystem DataStore or an S3 data store.
* Disable subasset generation. If it is enabled, AEM's workflow creates a separate asset for each page in a multi-page asset. Each of these pages is an individual asset that consumes additional disk space, requires versioning, and additional workflow processing. If you do not require separate pages, disable subasset generation and page extraction activities.
* Enable transient workflows.
* Tune the Granite workflow queues to limit concurrent jobs.
* Configure [!DNL ImageMagick] to limit resource consumption.
* Remove unnecessary steps from the [!UICONTROL DAM Update Asset] workflow.
* Configure workflow and version purging.
* Optimize indexes with the latest Service Packs and hotfixes. Check with Adobe Customer Support for any additional index optimizations that may be available.
* Use guessTotal to optimize query performance.
* If you configure [!DNL Experience Manager] to detect file types from the content of the files (by enabling **[!UICONTROL Day CQ DAM Mime Type Service]** in the **[!UICONTROL AEM Web Console]**), upload many files in bulk during non-peak hours as it is resource-intensive.

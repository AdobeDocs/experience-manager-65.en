---
title: Assets Performance Guide
description: Learn how to determine the optimal hardware sizing for a new Digital Asset Management (DAM) setup and how to troubleshoot performance issues
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: configuring
exl-id: fbe15e1b-830b-4752-bd02-0d239a90bc68
solution: Experience Manager, Experience Manager Sites
feature: Configuring
role: Admin
---
# Assets Performance Guide{#assets-performance-guide}

Digital Asset Management (DAM) is often used in cases where performance matters. However, the typical DAM setup contains several hardware and software components that can affect performance. This document provides the following:

* Information for system administrators on determining the optimal hardware sizing for a new Digital Asset Management setup
* Information for software developers looking to troubleshoot DAM instances with performance issues

## Performance Issues {#performance-issues}

Poor performance in digital asset management can impact the user experience in three ways: interactive performance, asset processing, and download speed. To improve performance, it is important to measure the observed performance properly and to establish target metrics.

**1. Interactive searching and browsing** Users are searching for assets or browsing the DAM Finder and complain about slow response times or that search results do not show up immediately. This is an interactive performance problem.

Interactive performance is measured in terms of page response time. This is the time that it takes from receiving the HTTP request to closing the HTTP response, which can be determined from the request log files. Typical target performance is a page response time below two seconds.

**2. Asset processing** An asset processing problem is when users are uploading assets and it takes minutes until assets are readily converted and ingested into Adobe Experience Manager (AEM) DAM.

Asset processing performance is measured in terms of average workflow process completion time. This is the time that it takes from invoking the Asset update workflow process to its completion, which can be determined from the workflow reports user interface. Typical target performance depends on the size and type of assets processed and the number of renditions. Examples of target performances could be as follows:

* below ten seconds for images smaller than 1280x1280 pixels using standard renditions
* below one minute for images smaller than 100 MB using standard renditions
* below five minutes for HD video clips shorter than one minute

**3. Download speed** A throughput issue is when downloading from AEM DAM takes long and thumbnails do not show up immediately when browsing the DAM Admin or the DAM Finder.

Throughput performance is measured in terms of download rate in kilobits per second. Typical target performance is 300 Kbps for 100 concurrent downloads.

**4. Factors influencing asset processing performance**

To be able to estimate what hardware you require to process assets, the following aspects should be accounted for:

* The resolution of images in the number of pixels
* The heap assigned to AEM's process

The number of pixels contained in the image determines the processing time - more pixels means that processing takes a longer time.
Image type, compression rate, or the related size of the file the image is stored in does not influence the overall performance significantly.

Heap has been identified to be the most important limiting factor. Whenever the asset exceeds the available free memory, the processing performance drops rapidly.

The DAM processes are well suited to be performed in parallel for large amounts. Uploading assets in a batch and multi-core processors speeds up the absolute time spent per asset.

**5. Estimating Hardware Requirements for Performing Asset Processing**

Extensive processing of digital assets requires optimized hardware resources, the most relevant factors are image size and the peak throughput of processed images.

Allocate at least 16 GB of heap and configure the [!UICONTROL DAM Update Asset] workflow to use the [Camera Raw package](/help/assets/camera-raw.md) for the ingestion of raw images.

## Understanding the System {#understanding-the-system}

A typical DAM setup consists of end users accessing DAM via a load balancer. The DAM instance might be part of a clustered setup, where each DAM instance runs in a Java&trade; Virtual machine process on either a physical machine or a virtual machine. DAM storage is either provided by a RAID disk if there are single-machine setups, or a managed network-attached storage if there are clustered setups.

The following legend describes the possible performance pitfall areas with some solutions, as appropriate.

**Network connection to end user** A slow network connection can cause throughput issues, and in some rare cases also latency issues. Sometimes the user has a slow connection from the ISP, especially in intranets. This is a sign of incorrect network topology.

**Temporary File System** A slow local file system can cause interactive performance problems, especially when searching, because the search indexes are stored on the local disk. It can also cause asset processing problems if the command-line process is being used.

**AEM DAM Finder** Interactive performance problems, often experienced in searches are caused by high CPU utilization due to many concurrent users or other CPU-consuming processes on the same instance. Moving from virtual machines to dedicated machines and making sure no other services run on the machine can help improving performance. If high CPU load is caused due to asset processing and many concurrent users, Day recommends adding additional cluster nodes.

**AEM DAM Workflow** Long-running workflow processes during asset ingestion cause asset processing performance problems. Depending on the type of assets being processed, this can indicate CPU over-utilization. Day recommends that you reduce the number of other processes running on the system and to increase the number of available CPUs by adding cluster nodes.

**NAS Connectivity** Poor network connectivity to the NAS causes interactive performance problems, because accessing new nodes during asset processing is slowed down due to network latency. Also, slow network throughput adversely affects throughput, but also asset processing performance, because loading and saving renditions is slowed down.

Reasons for bad latency and throughput in a NAS are network topology or NAS over-utilization by other services.

**Network Attached Storage** Over-used network-attached storage systems can cause an array of problems:

* Low disk space is a frequently encountered trouble that can be prevented through proper sizing of a DAM project.
* High disk latency propagates into slow access times for CRX and may result in interactive performance problems.
* Low disk throughput may result in low performance for CQ5 DAM.

## Testing for Performance {#testing-for-performance}

For every DAM project, be sure to establish a performance testing regime that can identify and resolve bottlenecks quickly. To do so, consider the following checkpoints:

1. End-to-end performance tests using JMeter - Simulate an example search-and-browse session to detect interactive performance problems.
1. Throughput and latency tests using JMeter - Running on a client computer ensures that there are no topology-related issues.
1. Standardized asset processing tests - Ingest a few example assets and measure the time. This should include external workflow integration.
1. Monitor CPU, Disk, and memory utilization of each cluster node.
1. CRX read/write performance diagnostics to identify non-processing related issues.
1. Monitor network latency and throughput from DAM cluster to your NAS.
1. Test, read, and write performance and disk latency directly on the NAS, if possible.

## Tweaking Bottlenecks {#tweaking-bottlenecks}

The following performance tweaks have been used in projects so far:

* Selective rendition generation: only generate the renditions that you need by adding conditions to the asset processing workflow, so that more costly renditions are only generated for select assets.
* Shared data store among instances: when running low on disk space this can considerably reduce the amount of disk space needed at the cost of higher configuration efforts and losing the auto-cleanup of the datastore.

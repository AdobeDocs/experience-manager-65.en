---
title: Hardware Sizing Guidelines
description: These sizing guidelines offer an approximation of the hardware resources required to deploy an AEM project.
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/MANAGING
topic-tags: managing
content-type: reference
docset: aem65
exl-id: 5837ef4f-d4e0-49d7-a671-87d5547e0d98
solution: Experience Manager, Experience Manager 6.5
feature: Compliance
role: Developer,Leader
---
# Hardware Sizing Guidelines{#hardware-sizing-guidelines}

These sizing guidelines offer an approximation of the hardware resources required to deploy an AEM project. Sizing estimates depend on the architecture of the project, the complexity of the solution, expected traffic, and the project requirements. This guide helps you to determine the hardware needs for a specific solution, or to find an upper and lower estimate for the hardware requirements.

Basic factors to consider are (in this order):

* **Network speed**

    * Network latency
    * Available bandwidth

* **Computational speed**

    * Caching efficiency
    * Expected traffic
    * Complexity of templates, applications, and components
    * Concurrent authors
    * Complexity of the authoring operation (simple content editing, MSM rollout, and so on)

* **I/O performance**

    * Performance and efficiency of the file or database storage

* **Hard Drive**

    * at least two or three times larger than the repository size

* **Memory**

    * Size of website (number of content-object, pages, and users)
    * Number of users/sessions that are active at the same time

## Architecture {#architecture}

A typical AEM setup consists of an author and a publish environment. These environments have different requirements regarding the underlying hardware size and system configuration. Detailed considerations for both environments are described in the [author environment](/help/managing/hardware-sizing-guidelines.md#author-environment-specific-calculations) and [publish environment](/help/managing/hardware-sizing-guidelines.md#publish-environment-specific-calculations) sections.

In a typical project setup, you have several environments on which to stage project phases:

* **Development environment**
  To develop new features or make significant changes. Best practice is to work using a development environment per developer (local installations on their personal systems).

* **Author test environment**
  To verify changes. The number of test environments can vary depending on the project requirements (for example, separate for QA, integration testing, or user acceptance testing).

* **Publish test environment**
  Primarily for testing social collaboration use cases and/or the interaction between author and multiple publishing instances.

* **Author production environment**
  For authors to edit content.

* **Publish production environment**
  To serve published content.

Also, the environments may vary, ranging from a single-server system running AEM and an application server, through to a highly scaled set of multi-server, multi-CPU clustered instances. Adobe recommends that you use a separate computer for each production system and that you do not run other applications on these computers.

## Generic hardware sizing considerations {#generic-hardware-sizing-considerations}

The sections below provide guidance on how to calculate hardware requirements, taking various considerations into account. For large systems, Adobe suggests that you perform a simple set of in-house benchmark tests on a reference configuration.

Performance optimization is a fundamental task that needs to be performed before any benchmarking for a specific project can be done. Make sure to apply the advice provided in the [Performance Optimization documentation](/help/sites-deploying/configuring-performance.md) before performing any benchmark tests and using their results for any hardware sizing calculations.

Hardware sizing requirements for advanced use cases need to be based on a detailed performance assessment of the project. Characteristics of advanced use cases requiring exceptional hardware resources include combinations of:

* high content payload / throughput
* extensive use of customized code, custom workflows or third-party software libraries
* integration with unsupported external systems

### Disk Space/ Hard Drive {#disk-space-hard-drive}

The disk space required depends heavily on both the volume and type of your web application. The calculations should account for the following:

* the quantity and size of pages, assets, and other repository-stored entities such as workflows, profiles, and so on.
* the estimated frequency of content changes and therefore the creation of content versions
* the volume of DAM asset renditions that will be generated
* the overall growth of content over time

Disk space is continuously monitored during Online, and Offline, Revision Cleanup. Should the available disk space drop below a critical value, the process is canceled. The critical value is 25% of the current disk footprint of the repository and it is not configurable. Adobe recommends sizing the disk at least two or three times larger than the repository size including the estimated growth.

Consider a setup of redundant arrays of independent disks (RAID, for example, RAID10) for data redundancy.

>[!NOTE]
>
>The temporary directory of a production instance should have at least 6 GB of available space.

#### Virtualization {#virtualization}

AEM runs well in virtualized environments, but there can be factors such as CPU or I/O that cannot be directly equated to physical hardware. A recommendation is to choose a higher I/O speed (in general) as this is a critical factor, usually. Benchmarking your environment is necessary to get a precise understanding of what resources are required.

#### Parallelization of AEM Instances {#parallelization-of-aem-instances}

**Fail Safeness**

A fail-safe website is deployed on at least two separate systems. If one system breaks down, another system can take over and thus compensate the system failure.

**System resources scalability**

While all systems are running, an increased computational performance is available. That additional performance is not necessarily linear with the number of cluster nodes as the relationship is highly dependent on the technical environment. See [Cluster documentation](/help/sites-deploying/recommended-deploys.md) for more information.

The estimation of how many cluster nodes are necessary is based on the basic requirements and specific use-cases of the particular web project:

* From the perspective of fail-safeness, it is necessary to determine, for all environments, how critical failure is and the failure compensation time based on how long it takes for a cluster node to recover.
* For the aspect of scalability, the number of write operations is basically the most important factor; see [Authors Working in Parallel](/help/managing/hardware-sizing-guidelines.md#authors-working-in-parallel) for the author environment and [Social Collaboration](/help/managing/hardware-sizing-guidelines.md#socialcollaborationspecificconsiderations) for the publish environment. Load balancing can be established for operations that access the system solely to process read operations; see [Dispatcher](https://experienceleague.adobe.com/docs/experience-manager-dispatcher/using/dispatcher.html) for details.

## Author environment-specific calculations {#author-environment-specific-calculations}

For benchmarking purposes, Adobe has developed some benchmark tests for standalone author instances.

* **Benchmark test 1**
  Calculate maximum throughput of a load profile where users perform a simple create page exercise on top of a base load of 300 existing pages all of a similar nature. The steps involved were logging in to the site, creating a page with a SWF and Image/Text, adding a tag cloud, then activating the page.

    * **Result**
      Maximum throughput for a simple page creation exercise such as above&mdash;considered as one transaction&mdash;is found to be 1730 transactions/hour.

* **Benchmark test 2**
  Calculate maximum throughput when load profile has a mix of fresh page creation (10%), modification of an existing page (80%) and creation then modification of a page in succession (10%). The complexity of the pages remains the same as in the profile of benchmark test 1. Basic modification of the page is done by adding an image and modifying the text content. Again, the exercise was performed on top of a base load of 300 pages of the same complexity as defined in benchmark test 1.

    * **Result**
      Maximum throughput for such a mix operation scenario was found to be 3252 transactions per hour.

>[!NOTE]
>
>The throughput rate does not distinguish between transaction types within a load profile. The approach used to measure throughput ensures that a fixed proportion of each type of transaction is included in the workload.

The above two tests clearly highlight that the throughput varies according to the type of operation. Use the activities on your environment as a base for sizing your system. You get better throughput with less intensive actions such as modify (which is also more common).

### Caching {#caching}

In the author environment the caching efficiency is typically much lower, because changes to the website are more frequent and also the content is highly interactive and personalized. Using the Dispatcher, you can cache AEM libraries, JavaScript, CSS files, and layout images. This speeds up some aspects of the authoring process. Configuring the webserver to also set headers for browser caching on these resources, reduces the number of HTTP requests and so improve the system responsiveness as experienced by the authors.

### Authors Working in Parallel {#authors-working-in-parallel}

In the author environment the number of authors that work in parallel and the load their interactions add to the system are the main limiting factors. Therefore, Adobe recommends that you scale your system based on the shared throughput of data.

For such scenarios, Adobe ran benchmark tests on a two-node shared-nothing cluster of author instances.

* **Benchmark test 1a**
  With an active-active shared-nothing cluster of 2 author instances, calculate the maximum throughput with a load profile where users perform a simple create page exercise on top of a base load of 300 existing pages, all of a similar nature.

    * **Result**
      Maximum throughput for a simple page creation exercise, such as above&mdash;considered as one transaction&mdash;is found to be 2016 transactions/hour. This is an increase of approximately 16% when compared to a standalone author instance for the same benchmark test.

* **Benchmark test 2b**
  With an active-active shared-nothing cluster of 2 author instances, calculate the maximum throughput when the load profile has a mix of fresh page creation (10%), modification of an existing pages (80%) and creation and modification a page in succession (10%). The complexity of the page remains the same as in the profile of benchmark test 1. Basic modification of the page is done by adding an image and modifying the text content. Again, the exercise was performed on top of a base load of 300 pages of complexity the same as defined in benchmark test 1.

    * **Result**
      Maximum throughput for such a mixed operation scenario was found to be 6288 transactions/hour. This is an increase of approximately 93% when compared to a standalone author instance for the same benchmark test.

>[!NOTE]
>
>The throughput rate does not distinguish between transaction types within a load profile. The approach used to measure throughput ensures that a fixed proportion of each type of transaction is included in the workload.

The above two tests clearly highlight that AEM scales well for authors who are performing basic edit operations with AEM. In general, AEM is most effective in scaling read operations.

On a typical website, most authoring happens during the project phase. After the website goes live the number of authors working in parallel usually sinks to a lower (operational mode) average.

You can calculate the number of computers (or CPUs) required for the author environment as follows:

`n = numberOfParallelAuthors / 30`

This formula can serve as a general guideline for scaling CPUs when authors are performing basic operations with AEM. It assumes that the system and the application are optimized. However, the formula will not hold true for advanced features such as MSM or Assets (see the sections below).

Also see [Parallelization](/help/managing/hardware-sizing-guidelines.md#parallelization-of-aem-instances) and [Performance Optimization](/help/sites-deploying/configuring-performance.md).

### Hardware Recommendations {#hardware-recommendations}

Usually you can use the same hardware for your author environment as is recommended for your publishing environment. Typically, website traffic is lower on authoring systems, but cache efficiency is lower too. However, the fundamental factor here is the number of authors working in parallel, together with the type of actions being made to the system. In general, AEM clustering (of the author environment) is most effective at scaling read operations; in other words, a AEM cluster scales well with authors who are performing basic edit operations.

## Publish environment-specific calculations {#publish-environment-specific-calculations}

### Caching efficiency and traffic {#caching-efficiency-and-traffic}

Cache efficiency is crucial for the website speed. The following table shows how many pages per second an optimized AEM system can handle using a reverse proxy, such as the Dispatcher:

| Cache ratio |Pages/s (peak) |Million pages/day (average) |
|---|---|---|
| 100% |1000-2000 |35-70 |
| 99% |910 |32 |
| 95% |690 |25 |
| 90% |520 |18 |
| 60% |220 |8 |
| 0% |100 |3.5 |

>[!CAUTION]
>
>Disclaimer: The numbers are based on a default hardware configuration and may vary depending on the specific hardware used.

The cache ratio is the percentage of pages that the Dispatcher can return without having to access AEM. 100% indicates that the Dispatcher answers all requests, 0% means that AEM computes every page.

### Complexity of templates and applications {#complexity-of-templates-and-applications}

If you use complex templates AEM needs more time to render a page. Pages taken from the cache are not affected by this, but the page size is still relevant when considering the overall response time. Rendering a complex page can easily take ten times longer than rendering a simple page.

### Formula {#formula}

Using the following formula, you can compute an estimate for the overall complexity of your AEM solution:

`complexity = applicationComplexity + ((1-cacheRatio) * templateComplexity)`

Based on the complexity, you can determine the number of servers (or CPU cores) you need for the publish environment as follows:

`n = (traffic * complexity / 1000 ) * activations`

The variables in the equation are as follows:

<table>
 <tbody>
  <tr>
   <td>traffic</td>
   <td>The expected peak traffic per second. You can estimate this as the number of page hits per day, divided by 35'000.</td>
  </tr>
  <tr>
   <td>applicationComplexity</td>
   <td><p>Use 1 for a simple application, 2 for a complex application, or a value in-between:</p>
    <ul>
     <li>1 - a fully anonymous, content orientated site</li>
     <li>1.1 - a fully anonymous, content orientated site with client-side/Target personalization</li>
     <li>1.5 - a content-orientated site with both anonymous and logged in sections, client-side/Target personalization</li>
     <li>1.7 - for a content-orientated site with both anonymous and logged in sections, client-side/Target personalization and some user-generated content</li>
     <li>2 - where the entire site requires login, with extensive use of user-generated content and various personalization techniques</li>
    </ul> </td>
  </tr>
  <tr>
   <td>cacheRatio</td>
   <td>The percentage of pages that come out of the Dispatcher cache. Use 1 if all pages come from the cache, or 0 if every page is computed by AEM.</td>
  </tr>
  <tr>
   <td>templateComplexity</td>
   <td>Use a value from 1 through 10 to indicate the complexity of your templates. Higher numbers indicate more complex templates, using the value 1 for sites with an average of 10 components per page, the value 5 for a page average of 40 components and 10 for an average of over 100 components.</td>
  </tr>
  <tr>
   <td>activations</td>
   <td>Number of average activations (replication of average sized pages and assets from the author to the publish tier) per hour divided by x, where x is the number of activations done on a system without performance side effects to other tasks processed by the system. You can also predefine a pessimistic initial value like x = 100.<br /> </td>
  </tr>
 </tbody>
</table>

If you have a more complex website, you also need more powerful web servers so that AEM can answer a request in an acceptable time.

>[!NOTE]
>
>&#42; Reserve enough RAM for your operating system in addition to the memory required for your JVM.

## Additional use-case specific calculations {#additional-use-case-specific-calculations}

In addition to the calculation for a default web application, consider specific factors for the following use-cases. The calculated values are to be added to the default calculation.

### Assets-specific considerations {#assets-specific-considerations}

Extensive processing of digital assets requires optimized hardware resources, the most relevant factors are image size and the peak throughput of processed images.

Allocate at least 16GB of heap and configure the [!UICONTROL DAM Update Asset] workflow to use the [Camera Raw package](/help/assets/camera-raw.md) for the ingestion of raw images.

>[!NOTE]
>
>A higher throughput of images means that the computing resources must be able to keep pace with system I/O and conversely. For example, if workflows are launched by the import of images, then uploading many images via WebDAV could cause a backlog of workflows.
>
>The use of separate disks for TarPM, data store, and search index can help to optimize the system I/O behavior (however, usually it makes sense to keep the search index locally).

>[!NOTE]
>
>See also the [Assets Performance Guide](/help/sites-deploying/assets-performance-sizing.md).

### Multi-Site Manager {#multi-site-manager}

The resource consumption when using AEM MSM on an authoring environment depends heavily on the specific use cases. Basic factors are:

* Number of Live-Copies
* Periodicity of rollouts
* Content tree size to be rolled out
* Connected functionality of the rollout actions

Testing the planned use case with a representative content excerpt can help you improve your understanding of the resource consumption. If you extrapolate the results with the planned throughput, you can assess the additional resources required for the AEM MSM.

Also, account for authors working in parallel. They will perceive performance side effects if AEM MSM use cases consume more resources than planned.

### AEM Communities sizing considerations {#aem-communities-sizing-considerations}

AEM sites that include AEM Communities features (community sites) experience a high level of interaction from site visitors (members) in the publish environment.

The sizing considerations for a community site depend on the anticipated interaction by community members and whether optimal performance for page content is of higher importance.

User-generated content (UGC) submitted members is stored separately from page content. While the AEM platform uses a node store that replicates site content from author to publish, AEM Communities uses a single, common store for UGC that is never replicated.

For the UGC store, it is necessary to choose a storage resource provider (SRP), which influences the chosen deployment.
See

* [Community Content Storage](/help/communities/working-with-srp.md)
* [Recommended Topologies for Communities](/help/communities/topologies.md)

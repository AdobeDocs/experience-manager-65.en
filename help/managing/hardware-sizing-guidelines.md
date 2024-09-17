---
title: Hardware Sizing Guidelines
description: These sizing guidelines offer an approximation of the hardware resources required to deploy an AEM project.
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

## Disk Space/ Hard Drive {#disk-space-hard-drive}

The disk space required depends heavily on both the volume and type of your web application. The calculations should account for the following:

* the quantity and size of pages, assets, and other repository-stored entities such as workflows, profiles, and so on.
* the estimated frequency of content changes and therefore the creation of content versions
* the volume of DAM asset renditions that will be generated
* the overall growth of content over time

Disk space is continuously monitored during Online, and Offline, Revision Cleanup. Should the available disk space drop below a critical value, the process is canceled. The critical value is 25% of the current disk footprint of the repository and it is not configurable. Adobe recommends sizing the disk at least two or three times larger than the repository size including the estimated growth.

Consider a setup of redundant arrays of independent disks (RAID, for example, RAID10) for data redundancy.

### Virtualization {#virtualization}

AEM runs well in virtualized environments, but there can be factors such as CPU or I/O that cannot be directly equated to physical hardware. A recommendation is to choose a higher I/O speed (in general) as this is a critical factor, usually. Benchmarking your environment is necessary to get a precise understanding of what resources are required.

### Parallelization of AEM Instances {#parallelization-of-aem-instances}

**Fail Safeness**

A fail-safe website is deployed on at least two separate systems. If one system breaks down, another system can take over and thus compensate the system failure.

**System resources scalability**

While all systems are running, an increased computational performance is available. That additional performance is not necessarily linear with the number of cluster nodes as the relationship is highly dependent on the technical environment. See [Cluster documentation](/help/sites-deploying/recommended-deploys.md) for more information.

The estimation of how many cluster nodes are necessary is based on the basic requirements and specific use-cases of the particular web project:

* From the perspective of fail-safeness, it is necessary to determine, for all environments, how critical failure is and the failure compensation time based on how long it takes for a cluster node to recover.
* For the aspect of scalability, the number of write operations is basically the most important factor. Load balancing can be established for operations that access the system solely to process read operations; see [Dispatcher](https://experienceleague.adobe.com/docs/experience-manager-dispatcher/using/dispatcher.html) for details.

### Hardware Recommendations {#hardware-recommendations}

Usually you can use the same hardware for your author environment as is recommended for your publishing environment. Typically, website traffic is lower on authoring systems, but cache efficiency is lower too. However, the fundamental factor here is the number of authors working in parallel, together with the type of actions being made to the system. In general, AEM clustering (of the author environment) is most effective at scaling read operations; in other words, a AEM cluster scales well with authors who are performing basic edit operations.

## Additional Use-case Specific Calculations {#additional-use-case-specific-calculations}

In addition to the calculation for a default web application, consider specific factors for the following use-cases. The calculated values are to be added to the default calculation.

### Assets-specific Considerations {#assets-specific-considerations}

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

### AEM Communities Sizing Considerations {#aem-communities-sizing-considerations}

AEM sites that include AEM Communities features (community sites) experience a high level of interaction from site visitors (members) in the publish environment.

The sizing considerations for a community site depend on the anticipated interaction by community members and whether optimal performance for page content is of higher importance.

User-generated content (UGC) submitted members is stored separately from page content. While the AEM platform uses a node store that replicates site content from author to publish, AEM Communities uses a single, common store for UGC that is never replicated.

For the UGC store, it is necessary to choose a storage resource provider (SRP), which influences the chosen deployment.
See

* [Community Content Storage](/help/communities/working-with-srp.md)
* [Recommended Topologies for Communities](/help/communities/topologies.md)

---
title: Performance Guidelines
seo-title: Performance Guidelines
description: This article provides general guidelines on how to optimize the performance of your AEM deployment.
seo-description: This article provides general guidelines on how to optimize the performance of your AEM deployment.
uuid: 38cf8044-9ff9-48df-a843-43f74b0c0133
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: configuring
discoiquuid: 9ccbc39e-aea7-455e-8639-9193abc1552f
feature: Configuring
exl-id: 5a305a5b-0c3d-413b-88c1-1f5abf7e1579
---
# Performance Guidelines{#performance-guidelines}

This page provides general guidelines on how to optimize the performance of your AEM deployment. If you are new to AEM, review the following pages before you start reading the performance guidelines:

* [AEM Basic Concepts](/help/sites-deploying/deploy.md#basic-concepts)
* [Overview of Storage in AEM](/help/sites-deploying/storage-elements-in-aem-6.md#overview-of-storage-in-aem)
* [Recommended Deployments](/help/sites-deploying/recommended-deploys.md)
* [Technical Requirements](/help/sites-deploying/technical-requirements.md)

Illustrated below are the deployment options available for AEM (scroll to view all the options):

<table>
 <tbody>
  <tr>
   <td><p><strong>AEM</strong></p> <p><strong>Product</strong></p> </td>
   <td><p><strong>Topology</strong></p> </td>
   <td><p><strong>Operating System</strong></p> </td>
   <td><p><strong>Application Server</strong></p> </td>
   <td><p><strong>JRE</strong></p> </td>
   <td><p><strong>Security</strong></p> </td>
   <td><p><strong>Micro Kernel</strong></p> </td>
   <td><p><strong>Datastore</strong></p> </td>
   <td><p><strong>Indexing</strong></p> </td>
   <td><p><strong>Web Server</strong></p> </td>
   <td><p><strong>Browser</strong></p> </td>
   <td><p><strong>Experience Cloud</strong></p> </td>
  </tr>
  <tr>
   <td><p>Sites</p> </td>
   <td><p>Non-HA</p> </td>
   <td><p>Windows</p> </td>
   <td><p>CQSE</p> </td>
   <td><p>Oracle</p> </td>
   <td><p>LDAP</p> </td>
   <td><p>Tar</p> </td>
   <td><p>Segment</p> </td>
   <td><p>Property</p> </td>
   <td><p>Apache</p> </td>
   <td><p>Edge</p> </td>
   <td><p>Target</p> </td>
  </tr>
  <tr>
   <td><p>Assets</p> </td>
   <td><p>Publish-HA</p> </td>
   <td><p>Solaris&trade;</p> </td>
   <td><p>WebLogic</p> </td>
   <td><p>IBM&reg;</p> </td>
   <td><p>SAML</p> </td>
   <td><p>MongoDB</p> </td>
   <td><p>File</p> </td>
   <td><p>Lucene</p> </td>
   <td><p>IIS</p> </td>
   <td><p>IE</p> </td>
   <td><p>Analytics</p> </td>
  </tr>
  <tr>
   <td><p>Communities</p> </td>
   <td><p>Author-CS</p> </td>
   <td><p>Red Hat&reg;</p> </td>
   <td><p>WebSphere&reg;</p> </td>
   <td><p>HP</p> </td>
   <td><p>Oauth</p> </td>
   <td><p>RDB/Oracle</p> </td>
   <td><p>S3/Azure</p> </td>
   <td><p>Solr</p> </td>
   <td><p>iPlanet</p> </td>
   <td><p>FireFox</p> </td>
   <td><p>Campaign</p> </td>
  </tr>
  <tr>
   <td><p>Forms</p> </td>
   <td><p>Author-Offload</p> </td>
   <td><p>HP-UX</p> </td>
   <td><p>Tomcat</p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p>RDB/DB2</p> </td>
   <td><p>MongoDB</p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p>Chrome</p> </td>
   <td><p>Social</p> </td>
  </tr>
  <tr>
   <td><p>Mobile</p> </td>
   <td><p>Author-Cluster</p> </td>
   <td><p>IBM&reg; AIX&reg;</p> </td>
   <td><p>JBoss&reg;</p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p>RDB/MySQL</p> </td>
   <td><p>RDBMS</p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p>Safari</p> </td>
   <td><p>Audience</p> </td>
  </tr>
  <tr>
   <td><p>Multi-site</p> </td>
   <td><p>ASRP</p> </td>
   <td><p>SUSE&reg;</p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p>RDB/SQLServer</p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p>Assets</p> </td>
  </tr>
  <tr>
   <td><p>Commerce</p> </td>
   <td><p>MSRP</p> </td>
   <td><p>Apple OS</p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p>Activation</p> </td>
  </tr>
  <tr>
   <td><p>Dynamic Media</p> </td>
   <td><p>JSRP</p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p>Mobile</p> </td>
  </tr>
  <tr>
   <td><p>Brand Portal</p> </td>
   <td><p>J2E</p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
  </tr>
  <tr>
   <td><p>AoD</p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
  </tr>
  <tr>
   <td><p>LiveFyre</p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
  </tr>
  <tr>
   <td><p>Screens</p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
  </tr>
  <tr>
   <td><p>Doc Security</p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
  </tr>
  <tr>
   <td><p>Process Mgt</p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
  </tr>
  <tr>
   <td><p>desktop app</p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
   <td><p> </p> </td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>The performance guidelines apply mainly to AEM Sites.

## When to Use the Performance Guidelines {#when-to-use-the-performance-guidelines}

Use the performance guidelines in the following situations:

* **First-time deployment**: When planning to deploy AEM Sites or Assets for the first time, it is important to understand the options available. Especially when configuring the Micro Kernel, Node Store, and Data Store (compared to the default settings). For example, changing the default settings of the Data Store for TarMK to File Data Store.
* **Upgrading to a new version**: When upgrading to a new version, it is important to understand the performance differences compared to the running environment. For example, upgrading from AEM 6.1 to 6.2, or from AEM 6.0 CRX2 to 6.2 OAK.
* **Response time is slow**: When the selected Nodestore architecture is not meeting your requirements, it is important to understand the performance differences compared to other topology options. For example, deploying TarMK instead of MongoMK, or using a File Data Sore instead of an Amazon S3 or Microsoft&reg; Azure Data Store.
* **Adding more authors**: When the recommended TarMK topology is not meeting the performance requirements and upsizing the Author node has reached the maximum capacity available, understand the performance differences. Compare to using MongoMK with three or more Author nodes. For example, deploying MongoMK instead of TarMK.
* **Adding more content**: When the recommended Data Store architecture is not meeting your requirements, it's important to understand the performance differences compared to other Data Store options. Example: using the Amazon S3 or Microsoft&reg; Azure Data Store instead of a File Data Store.

## Introduction {#introduction}

This chapter gives a general overview of the AEM architecture and its most important components. It also provides development guidelines and describes the testing scenarios used in the TarMK and MongoMK benchmark tests.

### The AEM Platform {#the-aem-platform}

The AEM platform consists of the following components:

![chlimage_1](assets/chlimage_1a.png)

For more information on the AEM platform, see [What is AEM](/help/sites-deploying/deploy.md#what-is-aem).

### The AEM Architecture {#the-aem-architecture}

There are three important building blocks to an AEM deployment. The **Author Instance** which is used by content authors, editors, and approvers to create and review content. When the content is approved, it is published to a second instance type named the **Publish Instance** from where it is accessed by the end users. The third building block is the **Dispatcher** which is a module that handles caching and URL filtering and is installed on the webserver. For additional information about the AEM architecture, see [Typical Deployment Scenarios](/help/sites-deploying/deploy.md#typical-deployment-scenarios).

![chlimage_1-1](assets/chlimage_1-1a.png)

### Micro Kernels {#micro-kernels}

Micro Kernels act as persistence managers in AEM. There are three types of Micro Kernels used with AEM: TarMK, MongoDB, and Relational Database (under restricted support). Choosing one to fit your need depends on the purpose of your instance and the deployment type you are considering. For additional information about Micro Kernels, see the [Recommended Deployments](/help/sites-deploying/recommended-deploys.md) page.

![chlimage_1-2](assets/chlimage_1-2a.png)

### Nodestore {#nodestore}

In AEM, binary data can be stored independently from content nodes. The location where the binary data is stored is referred to as the **Data Store**, while the location of the content nodes and properties is called the **Node Store**.

>[!NOTE]
>
>Adobe recommends TarMK to be the default persistence technology used by customers for both the AEM Author and the Publish instances.

>[!CAUTION]
>
>The Relational Database Micro Kernel is under restricted support. Contact [Adobe Customer Care](https://experienceleague.adobe.com/?support-solution=General&support-tab=home#support) before using this type of Micro Kernel.

![chlimage_1-3](assets/chlimage_1-3a.png)

### Data Store {#data-store}

When dealing with large number of binaries, it is recommended that you use an external data store instead of the default node stores to maximize performance. For example, if your project requires many media assets, storing them under the File or Azure/S3 Data Store makes accessing them faster than storing them directly inside a MongoDB.

For further details on the available configuration options, see [Configuring Node and Data Stores](/help/sites-deploying/data-store-config.md).

>[!NOTE]
>
>Adobe recommends that you choose the option of deploying AEM on Azure or Amazon Web Services (AWS) using Adobe Managed Services. Customers benefit from a team who has the experience and skills of deploying and operating AEM in these cloud computing environments. See [additional documentation on Adobe Managed Services](https://business.adobe.com/products/experience-manager/managed-services.html?aemClk=t).
>
>For recommendations on how to deploy AEM on Azure or AWS, outside of Adobe Managed Services, Adobe recommends working directly with the cloud provider. Or, work with one of Adobe's partners that support the deployment of AEM in the cloud environment of your choice. The selected cloud provider or partner is responsible for the sizing specifications, design, and implementation of the architecture they are supporting to meet your specific performance, load, scalability, and security requirements.
>
>>See also the [technical requirements](/help/sites-deploying/technical-requirements.md#supported-platforms) page.

### Search {#search-features}

Listed in this section are the custom index providers used with AEM. To know more about indexing, see [Oak Queries and Indexing](/help/sites-deploying/queries-and-indexing.md).

>[!NOTE]
>
>For most deployments, Adobe recommends using the Lucene Index. Use Solr only for scalability in specialized and complex deployments.

![chlimage_1-4](assets/chlimage_1-4a.png)

### Development Guidelines {#development-guidelines}

Develop for AEM aiming for **performance and scalability**. The following are best practices that you can follow:

**DO**

* Apply separation of presentation, logic, and content
* Use existing AEM APIs (ex: Sling) and tooling (ex: Replication)
* Develop in the context of actual content
* Develop for optimum cacheability
* Minimize number of saves (ex: by using transient workflows)
* Make sure that all HTTP end points are RESTful
* Restrict the scope of JCR observation
* Be mindful of asynchronous thread

**DON'T**

* Don't use JCR APIs directly, if you can
* Don't change /libs, but rather use overlays
* Don't use queries wherever possible
* Don't use Sling Bindings to get OSGi services in Java&trade; code, but rather use:

    * @Reference in a DS component
    * @Inject in a Sling Model
    * sling.getService() in a Sightly Use Class
    * sling.getService() in a JSP
    * a ServiceTracker
    * direct access to the OSGi service registry

For further details about developing on AEM, read [Developing - The Basics](/help/sites-developing/the-basics.md). For additional best practices, see [Development Best Practices](/help/sites-developing/best-practices.md).

### Benchmark Scenarios {#benchmark-scenarios}

>[!NOTE]
>
>All the benchmark tests displayed on this page have been performed in a laboratory setting.

The testing scenarios detailed below are used for the benchmark sections of the TarMK, MongoMk, and TarMK vs MongoMk chapters. To see which scenario was used for a particular benchmark test, read the Scenario field from the [Technical Specifications](/help/sites-deploying/performance-guidelines.md#tarmk-performance-benchmark) table.

**Single Product Scenario**

AEM Assets:

* User interactions: Browse Assets / Search Assets / Download Asset / Read Asset Metadata / Update Asset Metadata / Upload Asset / Run Upload Asset Workflow
* Execution mode: concurrent users, single interaction per user

**Mix Products Scenario**

AEM Sites + Assets:

* Sites user interactions: Read Article Page / Read Page / Create Paragraph / Edit Paragraph / Create Content Page / Activate Content Page / Author Search
* Assets user interactions: Browse Assets / Search Assets / Download Asset / Read Asset Metadata / Update Asset Metadata / Upload Asset / Run Upload Asset Workflow
* Execution mode: concurrent users, mixed interactions per user

**Vertical Use Case Scenario**

Media:

* `Read Article Page (27.4%), Read Page (10.9%), Create Session (2.6%), Activate Content Page (1.7%), Create Content Page (0.4%), Create Paragraph (4.3%), Edit Paragraph (0.9%), Image Component (0.9%), Browse Assets (20%), Read Asset Metadata (8.5%), Download Asset (4.2%), Search Asset (0.2%), Update Asset Metadata (2.4%), Upload Asset (1.2%), Browse Project (4.9%), Read Project (6.6%), Project Add Asset (1.2%), Project Add Site (1.2%), Create Project (0.1%), Author Search (0.4%)`
* Execution mode: concurrent users, mixed interactions per user

## TarMK {#tarmk}

This chapter gives general performance guidelines for TarMK specifying the minimum architecture requirements and the settings configuration. Benchmark tests are also provided for further clarification.

Adobe recommends TarMK to be the default persistence technology used by customers in all deployment scenarios, for both the AEM Author and Publish instances.

For more information about TarMK, see [Deployment Scenarios](/help/sites-deploying/recommended-deploys.md#deployment-scenarios) and [Tar Storage](/help/sites-deploying/storage-elements-in-aem-6.md#tar-storage).

### TarMK Minimum Architecture Guidelines {#tarmk-minimum-architecture-guidelines}

>[!NOTE]
>
>The minimum architecture guidelines presented below are for production environments and high traffic sites. These guidelines are **not** the [minimum specifications](/help/sites-deploying/technical-requirements.md#prerequisites) to run AEM.

To establish good performance when using TarMK, you should start from the following architecture:

* One Author instance
* Two Publish instances
* Two Dispatchers

Illustrated below are the architecture guidelines for AEM sites and AEM Assets.

>[!NOTE]
>
>Binary-less replication should be turned **ON** if the File Datastore is shared.

**Tar Architecture Guidelines for AEM Sites**

![chlimage_1-5](assets/chlimage_1-5a.png)

**Tar Architecture Guidelines for AEM Assets**

![chlimage_1-6](assets/chlimage_1-6a.png)

### TarMK Settings Guideline {#tarmk-settings-guideline}

For good performance, you should follow the settings guidelines presented below. For instructions on how to change the settings, [see this page](https://experienceleague.adobe.com/docs/experience-manager-65/deploying/configuring/configuring-performance.html?lang=en).

<table>
 <tbody>
  <tr>
   <td><strong>Setting</strong></td>
   <td><strong>Parameter</strong></td>
   <td><strong>Value</strong></td>
   <td><strong>Description</strong></td>
  </tr>
  <tr>
   <td>Sling Job Queues</td>
   <td><code>queue.maxparallel</code></td>
   <td>Set value to half of the number of CPU cores. </td>
   <td>By default the number of concurrent threads per job queue is equal to the number of CPU cores.</td>
  </tr>
  <tr>
   <td>Granite Transient Workflow Queue</td>
   <td><code>Max Parallel</code></td>
   <td>Set value to half of the number of CPU cores</td>
   <td> </td>
  </tr>
  <tr>
   <td>JVM parameters</td>
   <td><p><code>Doak.queryLimitInMemory</code></p> <p><code>Doak.queryLimitReads</code></p> <p><code>Dupdate.limit</code></p> <p><code>Doak.fastQuerySize</code></p> </td>
   <td><p>500000</p> <p>100000</p> <p>250000</p> <p>True</p> </td>
   <td>To prevent expansive queries from overloading the systems, add these JVM parameters in the AEM start script.</td>
  </tr>
  <tr>
   <td>Lucene index configuration</td>
   <td><p><code>CopyOnRead</code></p> <p><code>CopyOnWrite</code></p> <p><code>Prefetch Index Files</code></p> </td>
   <td><p>Enabled</p> <p>Enabled</p> <p>Enabled</p> </td>
   <td>For more details on the available parameters, see <a href="https://jackrabbit.apache.org/oak/docs/query/lucene.html">this page</a>.</td>
  </tr>
  <tr>
   <td>Data Store = S3 Datastore</td>
   <td><p><code>maxCachedBinarySize</code></p> <p><code>cacheSizeInMB</code></p> </td>
   <td><p>1048576 (1 MB) or smaller</p> <p>2-10% of max heap size</p> </td>
   <td>See also <a href="/help/sites-deploying/data-store-config.md#data-store-configurations">Data Store Configurations</a>.</td>
  </tr>
  <tr>
   <td>DAM Update Asset workflow</td>
   <td><code>Transient Workflow</code></td>
   <td>checked</td>
   <td>This workflow manages the update of assets.</td>
  </tr>
  <tr>
   <td>DAM MetaData Writeback</td>
   <td><code>Transient Workflow</code></td>
   <td>checked</td>
   <td>This workflow manages XMP write-back to the original binary and sets the last modified date in JCR.</td>
  </tr>
 </tbody>
</table>

### TarMK Performance Benchmark {#tarmk-performance-benchmark}

#### Technical Specifications {#technical-specifications}

The benchmark tests were performed on the following specifications:

| |**Author Node** |
|---|---|
| Server |Bare metal hardware (HP) |
| Operating System |Red Hat&reg; Linux&reg; |
| CPU / Cores |Intel(R) Xeon(R) CPU E5-2407 @2.40GHz, 8 cores  |
| RAM |32 GB |
| Disk |Magnetic |
| Java&trade; |Oracle JRE Version 8 |
| JVM Heap |16 GB |
| Product  |AEM 6.2 |
| Nodestore |TarMK |
| Datastore |File DS  |
| Scenario |Single Product: Assets / 30 concurrent threads |

#### Performance Benchmark Results {#performance-benchmark-results}

>[!NOTE]
>
>The numbers presented below have been normalized to 1 as the baseline and are not the actual throughput numbers.

![chlimage_1-7](assets/chlimage_1-7a.png) ![chlimage_1-8](assets/chlimage_1-8a.png)

## MongoMK {#mongomk}

The primary reason for choosing the MongoMK persistence backend over TarMK is to scale the instances horizontally. This ability means having two or more active author instances always running and using MongoDB as the persistence storage system. The need to run more than one author instance results generally from the fact that the CPU and memory capacity of a single server, supporting all concurrent authoring activities, is no longer sustainable.

For more information about TarMK, see [Deployment Scenarios](/help/sites-deploying/recommended-deploys.md#deployment-scenarios) and [Mongo Storage](/help/sites-deploying/storage-elements-in-aem-6.md#mongo-storage).

### MongoMK Minimum Architecture Guidelines {#mongomk-minimum-architecture-guidelines}

To establish good performance when using MongoMK, you should start from the following architecture:

* Three Author instances
* Two Publish instances
* Three MongoDB instances
* Two Dispatchers

>[!NOTE]
>
>In production environments, MongoDB is always used as a replica set with a primary and two secondaries. Reads and writes go to the primary and reads can go to the secondaries. If storage is not available, one of the secondaries can be replaced with an arbiter, but MongoDB replica sets must always be composed of an odd number of instances.

>[!NOTE]
>
>Binary-less replication should be turned **ON** if the File Datastore is shared.

![chlimage_1-9](assets/chlimage_1-9a.png)

### MongoMK Settings Guidelines {#mongomk-settings-guidelines}

For good performance, you should follow the settings guidelines presented below. For instructions on how to change the settings, [see this page](https://experienceleague.adobe.com/docs/experience-manager-65/deploying/configuring/configuring-performance.html?lang=en).

<table>
 <tbody>
  <tr>
   <td><strong>Setting</strong></td>
   <td><strong>Parameter</strong></td>
   <td><strong>Value (default)</strong></td>
   <td><strong>Description</strong></td>
  </tr>
  <tr>
   <td>Sling Job Queues</td>
   <td><code>queue.maxparallel</code></td>
   <td>Set value to half of the number of CPU cores. </td>
   <td>By default the number of concurrent threads per job queue is equal to the number of CPU cores.</td>
  </tr>
  <tr>
   <td>Granite Transient Workflow Queue</td>
   <td><code>Max Parallel</code></td>
   <td>Set value to half of the number of CPU cores.</td>
   <td> </td>
  </tr>
  <tr>
   <td>JVM parameters</td>
   <td><p><code>Doak.queryLimitInMemory</code></p> <p><code>Doak.queryLimitReads</code></p> <p><code>Dupdate.limit</code></p> <p><code>Doak.fastQuerySize</code></p> <p><code>Doak.mongo.maxQueryTimeMS</code></p> </td>
   <td><p>500000</p> <p>100000</p> <p>250000</p> <p>True</p> <p>60000</p> </td>
   <td>To prevent expansive queries from overloading the systems, add these JVM parameters in the AEM start script.</td>
  </tr>
  <tr>
   <td>Lucene index configuration</td>
   <td><p><code>CopyOnRead</code></p> <p><code>CopyOnWrite</code></p> <p><code>Prefetch Index Files</code></p> </td>
   <td><p>Enabled</p> <p>Enabled</p> <p>Enabled</p> </td>
   <td>For more details on available parameters, see <a href="https://jackrabbit.apache.org/oak/docs/query/lucene.html">this page</a>.</td>
  </tr>
  <tr>
   <td>Data Store = S3 Datastore</td>
   <td><p><code>maxCachedBinarySize</code></p> <p><code>cacheSizeInMB</code></p> </td>
   <td><p>1048576 (1 MB) or smaller</p> <p>2-10% of max heap size</p> </td>
   <td>See also <a href="/help/sites-deploying/data-store-config.md#data-store-configurations">Data Store Configurations</a>.</td>
  </tr>
  <tr>
   <td>DocumentNodeStoreService</td>
   <td><p><code>cache</code></p> <p><code>nodeCachePercentage</code></p> <p><code>childrenCachePercentage</code></p> <p><code>diffCachePercentage</code></p> <p><code>docChildrenCachePercentage</code></p> <p><code>prevDocCachePercentage</code></p> <p><code>persistentCache</code></p> </td>
   <td><p>2048</p> <p>35 (25)</p> <p>20 (10)</p> <p>30 (5)</p> <p>10 (3)</p> <p>4 (4)</p> <p>./cache,size=2048,binary=0,-compact,-compress</p> </td>
   <td><p>The default size of the cache is set to 256 MB.</p> <p>Has impact on the time that it takes to perform cache invalidation.</p> </td>
  </tr>
  <tr>
   <td>oak-observation</td>
   <td><p><code>thread pool</code></p> <p><code>length</code></p> </td>
   <td><p>min &amp; max = 20</p> <p>50000</p> </td>
   <td> </td>
  </tr>
 </tbody>
</table>

### MongoMK Performance Benchmark {#mongomk-performance-benchmark}

### Technical Specifications {#technical-specifications-1}

The benchmark tests were performed on the following specifications:

| |**Author node** |**MongoDB node** |
|---|---|---|
| Server |Bare metal hardware (HP) |Bare metal hardware (HP) |
| Operating System |Red Hat&reg; Linux&reg; |Red Hat&reg; Linux&reg; |
| CPU / Cores |Intel(R) Xeon(R) CPU E5-2407 @2.40GHz, 8 cores |Intel(R) Xeon(R) CPU E5-2407 @2.40GHz, 8 cores  |
| RAM |32 GB |32 GB |
| Disk |Magnetic - >1k IOPS |Magnetic - >1k IOPS |
| Java&trade; |Oracle JRE Version 8 |N/A |
| JVM Heap |16 GB |N/A |
| Product  |AEM 6.2 |MongoDB 3.2 WiredTiger |
| Nodestore |MongoMK |N/A |
| Datastore |File DS  |N/A |
| Scenario |Single Product: Assets / 30 concurrent threads |Single Product: Assets / 30 concurrent threads |

### Performance Benchmark Results {#performance-benchmark-results-1}

>[!NOTE]
>
>The numbers presented below have been normalized to 1 as the baseline and are not the actual throughput numbers.

![chlimage_1-10](assets/chlimage_1-10a.png) ![chlimage_1-11](assets/chlimage_1-11a.png)

## TarMK vs MongoMK {#tarmk-vs-mongomk}

The basic rule to account for when choosing between the two is that TarMK is designed for performance, while MongoMK is used for scalability. Adobe recommends TarMK to be the default persistence technology used by customers in all deployment scenarios, for both the AEM Author and Publish instances.

The primary reason for choosing the MongoMK persistence backend over TarMK is to scale the instances horizontally. This functionality means having two or more active author instances always running and using MongoDB as the persistence storage system. The need to run more than one author instance generally results from the fact that the CPU and memory capacity of a single server, supporting all concurrent authoring activities, is no longer sustainable.

For further details on TarMK vs MongoMK, see [Recommended Deployments](/help/sites-deploying/recommended-deploys.md#microkernels-which-one-to-use).

### TarMK vs MongoMk Guidelines {#tarmk-vs-mongomk-guidelines}

**Benefits of TarMK**

* Purpose-built for content management applications
* Files are always consistent and can be backed up using any file-based backup tool
* Provides a failover mechanism - see [Cold Standby](/help/sites-deploying/tarmk-cold-standby.md) for more details
* Provides high performance and reliable data storage with minimal operational overhead
* Lower TCO (total cost of ownership)

**Criteria for choosing MongoMK**

* Number of named users connected in a day: in the thousands or more
* Number of concurrent users: in the hundreds or more
* Volume of asset ingestions per day: in hundreds of thousands or more
* Volume of page edits per day: in hundreds of thousands or more
* Volume of searches per day: in tens of thousands or more

### TarMK vs MongoMK Benchmarks {#tarmk-vs-mongomk-benchmarks}

>[!NOTE]
>
>The numbers presented below have been normalized to 1 as the baseline and are not actual throughput numbers.

### Scenario 1 Technical Specifications {#scenario-technical-specifications}

<table>
 <tbody>
  <tr>
   <td><strong> </strong></td>
   <td><strong>Author OAK Node</strong></td>
   <td><strong>MongoDB Node</strong></td>
   <td> </td>
  </tr>
  <tr>
   <td>Server</td>
   <td>Bare metal hardware (HP)</td>
   <td>Bare metal hardware (HP)</td>
   <td> </td>
  </tr>
  <tr>
   <td>Operating System</td>
   <td>Red Hat&reg; Linux&reg;</td>
   <td>Red Hat&reg; Linux&reg;</td>
   <td> </td>
  </tr>
  <tr>
   <td>CPU / Cores</td>
   <td>Intel(R) Xeon(R) CPU E5-2407 @2.40GHz, 8 cores</td>
   <td>Intel(R) Xeon(R) CPU E5-2407 @2.40GHz, 8 cores</td>
   <td> </td>
  </tr>
  <tr>
   <td>RAM</td>
   <td>32 GB</td>
   <td>32 GB</td>
   <td> </td>
  </tr>
  <tr>
   <td>Disk</td>
   <td>Magnetic - &gt;1k IOPS</td>
   <td>Magnetic - &gt;1k IOPS</td>
   <td> </td>
  </tr>
  <tr>
   <td>Java&trade;</td>
   <td>Oracle JRE Version 8</td>
   <td>N/A</td>
   <td> </td>
  </tr>
  <tr>
   <td>JVM Heap16GB</td>
   <td>16 GB</td>
   <td>N/A</td>
   <td> </td>
  </tr>
  <tr>
   <td>Product </td>
   <td>AEM 6.2</td>
   <td>MongoDB 3.2 WiredTiger</td>
   <td> </td>
  </tr>
  <tr>
   <td>Nodestore</td>
   <td>TarMK or MongoMK</td>
   <td>N/A</td>
   <td> </td>
  </tr>
  <tr>
   <td>Datastore</td>
   <td>File DS </td>
   <td>N/A</td>
   <td> </td>
  </tr>
  <tr>
   <td>Scenario</td>
   <td><p><br /> Single Product: Assets / 30 concurrent threads per run</p> </td>
   <td> </td>
   <td> </td>
  </tr>
 </tbody>
</table>

### Scenario 1 Performance Benchmark Results {#scenario-performance-benchmark-results}

![chlimage_1-12](assets/chlimage_1-12a.png)

### Scenario 2 Technical Specifications {#scenario-technical-specifications-1}

>[!NOTE]
>
>To enable the same number of Authors with MongoDB as with one TarMK system, you need a cluster with two AEM nodes. A four node MongoDB cluster can handle 1.8 times the number of Authors than one TarMK instance. An eight node MongoDB cluster can handle 2.3 times the number of Authors than one TarMK instance.

<table>
 <tbody>
  <tr>
   <td><strong> </strong></td>
   <td><strong>Author TarMK Node</strong></td>
   <td><strong>Author MongoMK Node</strong></td>
   <td><strong>MongoDB Node</strong></td>
  </tr>
  <tr>
   <td>Server</td>
   <td>AWS c3.8xlarge</td>
   <td>AWS c3.8xlarge</td>
   <td>AWS c3.8xlarge</td>
  </tr>
  <tr>
   <td>Operating System</td>
   <td>Red Hat&reg; Linux&reg;</td>
   <td>Red Hat&reg; Linux&reg;</td>
   <td>Red Hat&reg; Linux&reg;</td>
  </tr>
  <tr>
   <td>CPU / Cores</td>
   <td>32</td>
   <td>32</td>
   <td>32</td>
  </tr>
  <tr>
   <td>RAM</td>
   <td>60 GB</td>
   <td>60 GB</td>
   <td>60 GB</td>
  </tr>
  <tr>
   <td>Disk</td>
   <td>SSD - 10k IOPS</td>
   <td>SSD - 10k IOPS</td>
   <td>SSD - 10k IOPS</td>
  </tr>
  <tr>
   <td>Java&trade;</td>
   <td>Oracle JRE Version 8</td>
   <td><br /> Oracle JRE Version 8</td>
   <td>N/A</td>
  </tr>
  <tr>
   <td>JVM Heap16GB</td>
   <td>30 GB</td>
   <td>30 GB</td>
   <td>N/A</td>
  </tr>
  <tr>
   <td>Product </td>
   <td>AEM 6.2</td>
   <td>AEM 6.2</td>
   <td><br /> MongoDB 3.2 WiredTiger</td>
  </tr>
  <tr>
   <td>Nodestore</td>
   <td>TarMK </td>
   <td>MongoMK</td>
   <td><br /> N/A</td>
  </tr>
  <tr>
   <td>Datastore</td>
   <td>File DS </td>
   <td><br /> File DS</td>
   <td><br /> N/A</td>
  </tr>
  <tr>
   <td>Scenario</td>
   <td><p><br /> <br /> Vertical use case: Media / 2000 concurrent threads</p> </td>
   <td></td>
   <td></td>
  </tr>
 </tbody>
</table>

### Scenario 2 Performance Benchmark Results {#scenario-performance-benchmark-results-1}

![chlimage_1-13](assets/chlimage_1-13a.png)

### Architecture Scalability Guidelines For AEM Sites and Assets {#architecture-scalability-guidelines-for-aem-sites-and-assets}

![chlimage_1-14](assets/chlimage_1-14a.png)

## Summary of Performance Guidelines  {#summary-of-performance-guidelines}

The guidelines presented on this page can be summarized as follows:

* **TarMK with File Datastore** - The recommended architecture for most customers:

    * Minimum topology: one Author instance, two Publish instances, two Dispatchers
    * Binary-less replication turned on if the File Datastore is shared

* **MongoMK with File Datastore** - The recommended architecture for horizontal scalability of the Author tier:

    * Minimum topology: three Author instances, three MongoDB instances, two Publish instances, two Dispatchers
    * Binary-less replication turned on if the File Datastore is shared

* **Nodestore** - Stored on the local disk, not a network attached storage (NAS)
* When using **Amazon S3**:

    * The Amazon S3 datastore is shared between the Author and Publish tier
    * Binary-less replication must be turned on
    * Datastore Garbage Collection requires a first run on all Author and Publish nodes, then a second run on Author

* **Custom index should be created in addition to the out of the box index** - Based on most common searches

    * Lucene indexes should be used for the custom indexes

* **Customizing workflow can substantially improve the performance** - Remove the video step in the "Update Asset" workflow, disabling listeners which are not used, and so on.

For more details, also read the [Recommended Deployments](/help/sites-deploying/recommended-deploys.md) page.

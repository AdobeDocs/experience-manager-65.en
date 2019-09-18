---
title: Configuring node stores and data stores in AEM 6
seo-title: Configuring node stores and data stores in AEM 6
description: Learn how to configure node stores and data stores and how to perform data store garbage collection.
seo-description: Learn how to configure node stores and data stores and how to perform data store garbage collection.
uuid: fc68e2ed-e510-4e4b-b305-edc9aece30f8
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: deploying
discoiquuid: 04a45d9d-9bfd-49db-8061-2f5cdbff9ab4
legacypath: /deploy/platform/data-store-config
index: y
internal: n
snippet: y
---

# Configuring node stores and data stores in AEM 6{#configuring-node-stores-and-data-stores-in-aem}

## Introduction {#introduction}

In Adobe Experience Manager (AEM), binary data can be stored independently from the content nodes. The binary data is stored in a data store, whereas content nodes are stored in a node store.

Both data stores and node stores can be configured using OSGi configuration. Each OSGi configuration is referenced using a persistent identifier (PID).

## Configuration steps {#configuration-steps}

To configure both the node store and the data store, perform these steps:

1. Copy the AEM quickstart JAR file to its installation directory.
1. Create a folder `crx-quickstart/install` in the installation directory.
1. First, configure the node store by creating a configuration file with the name of the node store option you want to use in the `crx-quickstart/install` directory.

   For example, the Document node store (which is the basis for AEM's MongoMK implementation) uses the file `org.apache.jackrabbit.oak.plugins.document.DocumentNodeStoreService.config`.

1. Edit the file, and set your configuration options.
1. Create a configuration file with the PID of the data store you want to use. Edit the file to set the configuration options.

   >[!NOTE]
   >
   >See [Node Store Configurations](#node-store-configurations) and [Data Store Configurations](#data-store-configurations) for configuration options.

1. Start AEM.

## Node Store Configurations {#node-store-configurations}

>[!CAUTION]
>
>Newer versions of Oak employ a new naming scheme and format for OSGi configuration files. The new naming scheme requires that the configuration file be named **.config** and the new format requires values to be typed and is [documented here](https://sling.apache.org/documentation/development/slingstart.html#default-configuration-format).
>
>If you upgrade from an older version of Oak, ensure that you make a backup of the `crx-quickstart/install`folder first. After the upgrade, restore the contents of the folder to the upgraded installation and modify the extension of the configuration files from **.cfg** to **.config**.
>
>In case you are reading this article in preparation for an upgrade from an **AEM 5.x** installation, ensure that you consult the [upgrade](https://docs.adobe.com/content/docs/en/aem/6-0/deploy/upgrade.html) documentation first.

#### Segment Node Store {#segment-node-store}

The segment node store is the basis of Adobe's TarMK implementation in AEM6. It uses the `org.apache.jackrabbit.oak.segment.SegmentNodeStoreService` PID for configuration.

>[!CAUTION]
>
>The PID for the Segment node store has changed from `org.apache.jackrabbit.oak.plugins.segment.SegmentNodeStoreService in previous versions` of AEM 6 to `org.apache.jackrabbit.oak.segment.SegmentNodeStoreService` in AEM 6.3. Make sure you make the necessary configuration adjustments to reflect this change.

You can configure the following options:

* `repository.home`: Path to repository home under which repository-related data is stored. By default, segment files are stored under the `crx-quickstart/segmentstore` directory.

* `tarmk.size`: Maximum size of a segment in MB. The default maximum is 256MB.
* `customBlobStore`: Boolean value indicating that a custom data store is used. The default value is true for AEM 6.3 and later versions. Prior to AEM 6.3 the default was false.

The following is a sample `org.apache.jackrabbit.oak.segment.SegmentNodeStoreService.config` file:

```shell
#Path to repo
repository.home="crx-quickstart/repository"

#Max segment size
tarmk.size=I"256"

#Custom data store
customBlobStore=B"true"
```

#### Document Node Store {#document-node-store}

The document node store is the basis of AEM's MongoMK implementation. It uses the `org.apache.jackrabbit.oak.plugins.document.DocumentNodeStoreService`* *PID. The following configuration options are available:

* `mongouri`: The [MongoURI](http://docs.mongodb.org/manual/reference/connection-string/) required to connect to Mongo Database. The default is `mongodb://localhost:27017`  

* `db`: Name of the Mongo database. The default is **Oak** ``. However, new AEM 6 installations use **aem-author** ``as the default database name.  

* `cache`: The cache size in MB. This is distributed among various caches used in DocumentNodeStore. The default is `256`  

* `changesSize`: Size in MB of capped collection used in Mongo for caching the diff output. The default is `256`  

* `customBlobStore`: Boolean value indicating that a custom data store will be used. The default is `false`.

The following is a sample `org.apache.jackrabbit.oak.plugins.document.DocumentNodeStoreService.config` file:

```shell
#Mongo server details
mongouri="mongodb://localhost:27017"

#Name of Mongo database to use
db="aem-author"

#Store binaries in custom BlobStore
customBlobStore=B"false"
```

## Data Store Configurations {#data-store-configurations}

<!--
Comment Type: draft

<note type="caution">
<p>In AEM, online compaction is paused by default. However, a known issue with AEM where an incomplete overridden configuration will enable compaction. To workaround this issue always specify pauseCompaction=B"true" for every overridden configuration.</p>
<p> </p>
</note>
-->

When dealing with large number of binaries, it is recommended that an external data store be used instead of the default node stores in order to maximize performance.

For example, if your project requires a large number of media assets, storing them under the File or S3 Data Store will make accessing them faster than storing them directly inside a MongoDB.

The File Data Store provides better performance than MongoDB, and Mongo backup and restore operations are also slower with large number of assets.

Details on the different data stores and configurations are described below.

>[!NOTE]
>
>In order to enable custom Data Stores, you need to make sure that `customBlobStore` is set to `true` in the respective Node Store configuration file ([segment node store](../../../../6-5/sites/deploying/using/data-store-config.md#segment-node-store) or [document node store](../../../../6-5/sites/deploying/using/data-store-config.md#document-node-store)).

<!--
Comment Type: draft

<h4>Oak File Blobstore</h4>
-->

<!--
Comment Type: draft

<p>The Oak File Blobstore uses the <span class="code">org.apache.jackrabbit.oak.spi.blob.FileBlobStore</span> PID for configuration.</p>
<p>These options are available:</p>
<ul>
<li><span class="code">repository.home</span>: Path to repository home under which the binary data is stored. Blob files would be stored under <i><span class="code">crx-quickstart/datastore</span></i> directory.</li>
<li><span class="code">blockSize</span>: Binary content is broken in chunks and stored on file system. This value allows to configure the size of the chunks. The default value in bytes is <span class="code">2097152</span> (2MB).</li>
<li><span class="code">blockSizeMin</span>: The minimum size of the binary chunks in bytes. Content less than this value <span class="code"></span>would be inlined. The default value is <span class="code">4096</span>.<br /> </li>
</ul>
-->

#### File Data Store {#file-data-store}

This is the implementation of [FileDataStore](http://jackrabbit.apache.org/api/2.8/org/apache/jackrabbit/core/data/FileDataStore.html) present in Jackrabbit 2. It provides a way to store the binary data as normal files on the file system. It uses the `org.apache.jackrabbit.oak.plugins.blob.datastore.FileDataStore` PID.

These configuration options are available:

* `repository.home`: Path to repository home under which various repository related data is stored. By default, binary files would be stored under `crx-quickstart/repository/datastore` directory

* `path`: Path to the directory under which the files would be stored. If specified then it takes precedence over `repository.home` value

* `minRecordLength`: The minimum size in bytes of a file stored in the data store. Binary content less than this value would be inlined.

<!--
Comment Type: draft

<note type="note">
<p>The file data store makes use of memory mapped files for fast I/O operation when persisting data to disk. Make sure you use this data store for performance sensitive AEM applications.<br /> </p>
</note>
-->

<!--
Comment Type: remark
Last Modified By: unknown unknown (ims-author-AAC0465A528DC04F0A490D44@AdobeID)
Last Modified Date: 2018-02-28T02:56:00.045-0500
<p>Hiding this as a result of DOC-7106</p>
-->

>[!NOTE]
>
>When using a NAS to store shared file data stores, make sure you use only high performing devices in order to avoid performance issues.

## Amazon S3 Data Store {#amazon-s-data-store}

AEM can be configured to store data in Amazon's Simple Storage Service (S3). It uses the `org.apache.jackrabbit.oak.plugins.blob.datastore.S3DataStore.config` PID for configuration.

In order to enable the S3 data store functionality, a feature pack containing the S3 Datastore Connector needs to be downloaded and installed. Go to the [Adobe Repository](https://repo.adobe.com/nexus/content/groups/public/com/adobe/granite/com.adobe.granite.oak.s3connector/) and download the latest version from the 1.10.x versions of the feature pack (for example, com.adobe.granite.oak.s3connector-1.10.0.zip). Additionally, you also need to download and install the latest AEM service pack as listed on the [AEM 6.5 Release Notes](../../../../6-5/release-notes/sp-release-notes.md) page.

>[!NOTE]
>
>When using AEM 6.4 with TarMK, binaries will be stored by default in the `FileDataStore`. To use TarMK with the S3 Datastore, you need to start AEM using the `crx3tar-nofds` runmode, for example:

```shell
java -jar aem6.4.jar -r crx3tar-nofds
```

Once downloaded, you can install and configure the S3 Connector as follows:

1. Extract the contents of the feature pack zip file to a temporary folder.  

1. Go to the temporary folder and navigate to the following location:

   ```xml
   jcr_root/libs/system/install
   ```

   Copy all the contents from the above location to `<aem-install>/crx-quickstart/install.`

1. If AEM is already configured to work with the Tar or MongoDB storage, remove any existing configuration files from the ***&lt;aem-install&gt;***/*crx-quickstart*/*install* folder before proceeding. The files that need to be removed are:

    * `For MongoMK: org.apache.jackrabbit.oak.plugins.document.DocumentNodeStoreService.config`
    * `For TarMK: org.apache.jackrabbit.oak.segment.SegmentNodeStoreService.config`

1. Return to the temporary location where the feature pack has been extracted, and copy the contents of the following folder:

    * `jcr_root/libs/system/config`

   to

    * `<aem-install>/crx-quickstart/install`

   Make sure you only copy the configuration files needed by your current configuration. For both a dedicated data store and a shared data store setup copy the `org.apache.jackrabbit.oak.plugins.blob.datastore.S3DataStore.config` file.

   >[!NOTE]
   >
   >In a cluster setup, perform above steps on all nodes of cluster one by one. Also, make sure to use same S3 settings for all nodes.

1. Edit the file and add the configuration options required by your setup.
1. Start AEM.

<!--
Comment Type: draft

<note type="note">
<p>The S3 connector package includes the <span class="code">oak-blob-cloud</span> bundle. As a general rule, the Oak version used should be greater than the version of the <span class="code">oak-blob-cloud</span> bundle. For example, for S3 connector version 1.4.2 (that contains oak-blob-cloud version 1.4.4), Oak 1.4.4 or higher should be used. Make sure to install the latest S3 connector package as it also includes the necessary Oak version.</p>
<p> </p>
</note>
-->

#### Upgrading to a new version of the 1.8.x S3 Connector {#upgrading-to-a-new-version-of-the-x-s-connector}

If you need to upgrade to a new version of the 1.8.x S3 connector (for example, from 1.8.0 to 1.8.1) follow these steps:

1. Stop the AEM instance.  

1. Navigate to `<aem-install>/crx-quickstart/install/15` in the AEM installation folder and make a backup of its contents.
1. After the backup, delete the old version of the S3 Connector and its dependencies by deleting all the jar files in the `<aem-install>/crx-quickstart/install/15` folder, for example:

    * **oak-blob-cloud-1.6.1.jar**
    * **aws-java-sdk-osgi-1.10.76.jar**

   >[!NOTE]
   >
   >The file names presented above are used for illustration purposes only and are not definitive.

1. Download the latest version of the 1.8.x feature pack from the [Adobe Repository](https://repo.adobe.com/nexus/content/groups/public/com/adobe/granite/com.adobe.granite.oak.s3connector/).
1. Unzip the contents to a separate folder, then navigate to `jcr_root/libs/system/install/15`.
1. Copy the jar files to **&lt;aem-install&gt;**/crx-quickstart/install/15 in the AEM installation folder. 
1. Start AEM and check the connector functionality.

You can use the configuration file with the following options:

* accessKey: The AWS access key.
* secretKey: The AWS secret access key. **Note: **Alternatively, [IAM roles](https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/java-dg-roles.html) can be used for authentication. If you are using IAM roles you no longer need to specify the `accessKey` and `secretKey`.

* s3Bucket: The bucket name.
* s3Region: The bucket region.
* path: The path of the data store. The default is **&lt;AEM install folder&gt;/repository/datastore**
* minRecordLength: The minimum size of an object that should be stored in the data store. The minimum/default is **16KB.**
* maxCachedBinarySize: Binaries with size less than or equal to this size will be stored in memory cache. The size is in bytes. The default is **17408 **(17 KB).  

* cacheSize: The size of the cache. The value is specified in bytes. The default is **64GB**.
* secret: Only to be used if using binaryless replication for shared datastore setup.
* stagingSplitPercentage: The percentage of cache size configured to be used for staging asynchronous uploads. The default value is **10**.
* uploadThreads: The number of uploads threads that are used for asynchronous uploads. The default value is **10**.
* stagingPurgeInterval: The interval in seconds for purging finished uploads from the staging cache. The default value is **300** seconds (5 minutes).
* stagingRetryInterval: The retry interval in seconds for failed uploads. The default value is **600** seconds (10 minutes).

<!--
Comment Type: draft

<note type="note">
<p>The same configuration options are available for the shared S3 data store configuration file under the name of <span class="code">org.apache.jackrabbit.oak.plugins.blob.datastore.SharedS3DataStore.config</span>. For more information, see Configuring a <a href="../../../../6-5/sites/deploying/using/data-store-config.md#configuring-a-shared-data-store">Shared Data Store</a>.<br /> </p>
</note>
-->

<!--
Comment Type: remark
Last Modified By: unknown unknown (ims-author-0436B4A35714BFF67F000101@AdobeID)
Last Modified Date: 2018-02-28T02:56:01.593-0500
<p>Removed because of <a href="https://jira.corp.adobe.com/browse/CQDOC-10350">CQDOC-10350</a>.</p>
-->

#### Bucket region options {#bucket-region-options}

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <td>US Standard</td> 
   <td><span class="code">us-standard</span></td> 
  </tr> 
  <tr> 
   <td>US West</td> 
   <td><span class="code">us-west-2</span></td> 
  </tr> 
  <tr> 
   <td>US West (Northern California)</td> 
   <td><span class="code">us-west-1</span></td> 
  </tr> 
  <tr> 
   <td>EU (Ireland)<br /> </td> 
   <td><span class="code">EU</span></td> 
  </tr> 
  <tr> 
   <td>Asia Pacific (Singapore)<br /> </td> 
   <td><span class="code">ap-southeast-1</span></td> 
  </tr> 
  <tr> 
   <td>Asia Pacific (Sydney)<br /> </td> 
   <td><span class="code">ap-southeast-2</span></td> 
  </tr> 
  <tr> 
   <td>Asia Pacific (Tokyo)</td> 
   <td><span class="code">ap-northeast-1</span></td> 
  </tr> 
  <tr> 
   <td>South America (Sao Paolo)<br /> </td> 
   <td><span class="code">sa-east-1</span></td> 
  </tr> 
 </tbody> 
</table>

<!--
Comment Type: draft

<h4>Migrating from CRX2 to CRX3 with S3 Datastore</h4>
-->

<!--
Comment Type: draft

<ol>
<li><p>Unpack the AEM 6.3 quickstart:</p>
<codeblock class="syntax shell">
java&nbsp;--Xmx4096m&nbsp;-jar&nbsp;aem-quickstart-6.3.0.jar&nbsp;-unpack
</codeblock></li>
<li><p>Download the latest version of the 1.6.x feature pack from the <a href="https://repo.adobe.com/nexus/content/groups/public/com/adobe/granite/com.adobe.granite.oak.s3connector/" target="_blank">Adobe Repository</a>.</p> </li>
<li><p>Extract the contents of the feature pack zip file to a temporary folder.</p> </li>
<li><p>Go to the temporary folder and navigate to the following location:</p>
<codeblock gutter="true" class="syntax js">
jcr_root/libs/system/install
</codeblock><p>Copy all the contents from the above location to <span class="code">&lt;aem-install&gt;/crx-quickstart/install.</span></p> </li>
<li><p>If AEM is already configured to work with the Tar or MongoDB storage, remove any existing configuration files from the <span class="code">&lt;aem-install&gt;/crx-quickstart/install</span> folder before proceeding. The files that need to be removed are:</p>
<ul>
<li>For TarMK: <span class="code">org.apache.jackrabbit.oak.document.DocumentNodeStoreService.config</span></li>
<li>For MongoMK: <span class="code">org.apache.jackrabbit.oak.segment.SegmentNodeStoreService.config from crx-quickstart/install</span><br /> </li>
</ul> </li>
<li><p>Return to the temporary location where the feature pack has been extracted, and copy the contents of the following folder:</p>
<ul>
<li><span class="code">jcr_root/libs/system/config</span></li>
</ul> <p>to</p>
<ul>
<li><span class="code">&lt;aem-install&gt;/crx-quickstart/install</span></li>
</ul> <p>Make sure you only copy the configuration files needed by your current configuration. See the details below:</p>
<ul>
<li>If a dedicated data store setup copy the <span class="code">org.apache.jackrabbit.oak.plugins.blob.datastore.S3DataStore.config</span> file.</li>
<li>If a shared data store setup copy the <span class="code">org.apache.jackrabbit.oak.plugins.blob.datastore.SharedS3DataStore.config</span> file.</li>
</ul> </li>
<li><p>Rename all files with the extension .<span class="code">config</span>.<span class="code">sample</span> to have the extension .<span class="code">config</span>.</p> </li>
<li><p>Refer to the entries in <span class="code">org.apache.jackrabbit.oak.plugins.blob.datastore.S3DataStore.config</span> and populate their values from <strong>repository.xml</strong> or <strong>aws.properties</strong> files.</p> </li>
<li><p>You can perform the migration differently, depending on the persistence type you want to choose as destination. Below is a list of all possible combinations.</p> <p><strong>For migrating to TarMK with an S3 Data Store:</strong></p>
<codeblock gutter="true" class="syntax shell">
java&nbsp;-Xmx4096m&nbsp;-jar&nbsp;aem-quickstart-6.3.0.jar&nbsp;-v&nbsp;-x&nbsp;crx2oak&nbsp;-xargs&nbsp;--&nbsp;--load-profile&nbsp;segment-custom-ds
</codeblock><p><strong>For migrating to MongoMK with an S3 Data Store:</strong></p>
<codeblock gutter="true" class="syntax shell">
java&nbsp;-Xmx4096m&nbsp;-jar&nbsp;aem-quickstart-6.3.0.jar&nbsp;-v&nbsp;-x&nbsp;crx2oak&nbsp;-xargs&nbsp;--&nbsp;--load-profile&nbsp;mongo-custom-ds&nbsp;-T&nbsp;mongo-uri=mongo://mongo-host:mongo-port&nbsp;-T&nbsp;mongo-db=mongo-database-name
</codeblock><p>Where:</p>
<ul>
<li><strong>mongo-host </strong>is the MongoDB server IP (for example: <i>127.0.0.1</i>)</li>
<li><strong>mongo-port </strong>is the MongoDB server port (for example:<strong> </strong><i>27017</i>)</li>
<li><strong>mongo-database-name</strong> is the Mongo database name (for example: <i>aem-author</i>)</li>
</ul>
<draft-comment type="draft">
<p>In this step, a helper utility <span class="code">crx2oak-quickstart-extension.jar</span> is called, which generates the file <span class="code">crx2oak.properties</span> under <span class="code">crx-quickstart/crx2oak/</span>.</p>
<p>Review the newly-generated file, and edit its properties if you require different values to suit your migration requirements.</p>
</draft-comment></li>
<li><p>Run AEM and verify that everything works as expected.</p> </li>
</ol>
-->

<!--
Comment Type: draft

<h4>The Amazon S3 Connector Features</h4>
-->

<!--
Comment Type: draft

<p><strong>Local Cache</strong></p>
<p>After installing the connector for the first time, all the data will be uploaded from the local datastore. After this first run, the local datastore will be used as a local cache. All operations (with the exception of writes) will first check for the item in the local cache and if no record is found, it will be accessed from S3.</p>
<p>The local cache has a size limit, specifiable by the <span class="code">cacheSize</span> parameter. When the size of the cache exceeds the limit, it will automatically undergo purging in order to clear older items and reclaim space. During purging, the local cache makes sure that it doesn’t delete any in-progress asynchronous uploads.</p>
<p>Things to note about the local cache mechanism:</p>
<ol>
<li>It can be disabled by setting the <span class="code">cacheSize</span> parameter to <strong>0</strong>. In this case, all operations will be performed directly in the S3 cloud and the local cache completely ignored.</li>
<li>If the size of a file exceeds the size of the local cache, it will be served directly from S3.</li>
<li>When the cache is being purged, it will not be available to the S3 data store. Files from the local cache that have pending uploads will still be available.</li>
<li>Files deleted from the S3 data store will also be deleted from the local cache.<br /> </li>
</ol>
<p><strong>Multi-Threaded Content migration from FileSystem DataStore to S3</strong></p>
<p>Multi-threading can be configured in order to speed up file operations to or from the S3 data store. This can be particularly useful for initial migrations from a local datastore where large amounts of data need to be uploaded.</p>
<p><strong>Asynchronous Upload to S3</strong></p>
<p>The <span class="code">asyncUploadLimit</span> parameter limits the number of asynchronous uploads to the S3 data store. Once this limit is reached, the next upload will be synchronous until one of asynchronous uploads completes. To disable this feature the <span class="code">asyncUploadLimit</span> parameter can be set to <strong>0</strong>. The default value is <strong>100</strong>.</p>
<p><strong>Asynchronous Upload Cache</strong></p>
<p>The connector also uses a upload cache for asynchronous uploads. It tracks their status and removes finished uploads or adds new ones to the cache when necessary.<br /> </p>
-->

<!--
Comment Type: remark
Last Modified By: unknown unknown (ims-author-0436B4A35714BFF67F000101@AdobeID)
Last Modified Date: 2018-02-28T02:56:02.868-0500
<p>No longer up to date, see CQDOC-9335.</p>
-->

**DataStore Caching**

>[!NOTE]
>
>The DataStore implementations of `S3DataStore`, `CachingFileDataStore` and `AzureDataStore` support local file system caching. The `CachingFileDataStore` implementation is useful when the DataStore is on NFS (Network File System). 
>

When upgrading from an older cache implementation (pre Oak 1.6) there is a difference in the structure of the local file system cache directory. In the old cache structure both the downloaded and the uploaded files were put directly under the cache path. The new structure segregates the downloads and uploads and stores them in two directories named `upload` and `download` under cache path. The upgrade process should be seamless and any pending uploads should be scheduled for upload and any previously downloaded files in the cache will be put in the cache on initialization.

You can also upgrade the cache offline by using the `datastorecacheupgrade` command of oak-run. For details on how to execute the command, check the [readme](https://svn.apache.org/repos/asf/jackrabbit/oak/trunk/oak-run/README.md) for the oak-run module.

The cache has a size limit and it can be configured by using the cacheSize parameter.

**Downloads**

The local cache will be checked for the record of the requested file/blob before accessing it from the DataStore. When the cache exceeds the configured limit (see the `cacheSize` parameter) while adding a file into the cache, then some of the file(s) will be evicted to reclaim space.

**Asynchronous Upload**

The cache supports asynchronous uploads to the DataStore. The files are staged locally, in the cache (on the file system), and an asynchronous job starts to upload the file. The number of asynchronous uploads is limited by the size of the staging cache. The size of the staging cache is configured by using the `stagingSplitPercentage` parameter. This parameter defines the percentage of cache size to be used for the staging cache. Also, the percentage of cache available for downloads is calculated as **(100 - `stagingSplitPercentage`) &#42; `cacheSize`**.

The asynchronous uploads are multi-threaded and the number of threads is configured by using the `uploadThreads` parameter.

The files are moved to the main download cache after the uploads are complete. When the staging cache size exceeds its limit, the files are uploaded synchronously to the DataStore until the previous asynchronous uploads are complete and space is again available in the staging cache. The uploaded files are removed from the staging area by a periodic job whose interval is configured by the `stagingPurgeInterval` parameter.

Failed uploads (for example, because of a network disruption) are put on a retry queue and retried periodically. The retry interval is configured by using the `stagingRetryInterval parameter`.

#### Configuring binaryless replication with Amazon S3 {#configuring-binaryless-replication-with-amazon-s}

In order to configure binaryless replication with S3, the following steps are required:

1. Install the author and publish instances and make sure they are started properly.
1. Go to the replication agent settings, by opening a page to *http://localhost:4502/etc/replication/agents.author/publish.html*.
1. Press the **Edit** button in the **Settings** section.
1. Change the **Serialization** type option to **Binary less**.  

1. Add the parameter " `binaryless`= `true`" in the transport uri. After the change, the uri should look similar to the following:

   *http://localhost:4503/bin/receive?sling:authRequestLogin=1&binaryless=true*

1. Restart all author and publish instances to let the changes take effect.

#### Creating a cluster using S3 and MongoDB {#creating-a-cluster-using-s-and-mongodb}

1. Unpack CQ quickstart using the following command:

   `java -jar cq-quickstart.jar -unpack`

1. After AEM has been unpacked, create a folder inside the installation directory *crx-quickstart*/*install*.  

1. Create these two files inside the `crx-quickstart` folder:

    * *org.apache.jackrabbit.oak.plugins.document.DocumentNodeStoreService*.*config*
    
    * *org.apache.jackrabbit.oak.plugins.blob.datastore.S3DataStore*.*config*

   After the files have been created, add the configuration options as needed.

1. Install the two bundles required for the S3 data store as explained above.
1. Make sure MongoDB is installed and an instance of `mongod` is running.
1. Start AEM with the following command:

   `java -Xmx1024m -XX:MaxPermSize=256M -jar cq-quickstart.jar -r crx3,crx3mongo`

1. Repeat steps 1 through 4 for the second AEM instance.
1. Start the second AEM instance.

#### Configuring a Shared Data Store {#configuring-a-shared-data-store}

1. First, create the data store configuration file on each instances that is required to share the data store:

    * If you are using a `FileDataStore`, create a file named `org.apache.jackrabbit.oak.plugins.blob.datastore.FileDataStore.config` and place it in the `<aem-install>/crx-quickstart/install` folder.
    
    * If using S3 as the data store, create a file named o `rg.apache.jackrabbit.oak.plugins.blob.datastore.S3DataStore.config` in the `<aem-install>/crx-quickstart/install` folder as above.

1. Modify the data store configuration files on each instance to point to the same data store. For more information, see [this article](../../../../6-5/sites/deploying/using/data-store-config.md#data-store-configurations).
1. If the instance has been cloned from an existing server, you need to remove the `clusterId` of the new instance by using the latest oak-run tool while the repository is offline. The command you need to run is:

   ```xml
   java -jar oak-run.jar resetclusterid < repository path | Mongo URI >
   ```

   >[!NOTE]
   >
   >If a Segment node store is configured then the repository path needs to be specified. By default, the path is `<aem-install-folder>/crx-quickstart/repository/segmentstore.` If a Document node store is configured you can use a [Mongo Connection String URI](https://docs.mongodb.org/manual/reference/connection-string/).

   >[!NOTE]
   >
   >The Oak-run tool can be downloaded from this location:
   >
   >
   >[http://mvnrepository.com/artifact/org.apache.jackrabbit/oak-run/](http://mvnrepository.com/artifact/org.apache.jackrabbit/oak-run/)
   >
   >
   >Be aware that different versions of the tool need to be used depending on the Oak version you use with your AEM installation. Please check the version requirements list below before using the tool:
   >
   >    
   >    
   >    * For Oak versions **1.2.x** use the Oak-run **1.2.12 or newer** 
   >    
   >    * For Oak versions **newer than the above**, use the version of Oak-run that matches the Oak core of your AEM installation.
   >    
   >

1. Lastly, validate the configuration. In order to do this, you need to look for a unique file added to the data store by each repository that is sharing it. The format of the files is `repository-[UUID]`, where the UUID is a unique identifier of each individual repository.

   Therefore, a proper configuration should have as many unique files as there are repositories sharing the data store.

   The files are stored differently, depending on the data store:

    * For the `FileDataStore` the files are created under the root path of the data store folder.
    * For the `S3DataStore` the files are created in the configured S3 bucket under the `META` folder.

<!--
Comment Type: draft

<note type="note">
<p>The shared data store feature is available with Oak version <strong>1.2.12</strong><br /> </p>
</note>
-->

<!--
Comment Type: draft

<note type="note">
<p>If you are planning to share an S3 data store between repositories, make sure you only use the <span class="code">org.apache.jackrabbit.oak.plugins.blob.datastore.SharedS3DataStore.config</span> file to configure all your instances. Otherwise, data loss might occur during garbage collection operations.</p>
</note>
-->

## Azure Data Store {#azure-data-store}

AEM can be configured to store data in Microsoft's Azure storage service. It uses the `org.apache.jackrabbit.oak.plugins.blob.datastore.AzureDataStore.config` PID for configuration.

In order to enable the Azure data store functionality, a feature pack containing the Azure Connector needs to be downloaded and installed. Go to the [Adobe Repository](https://repo.adobe.com/nexus/content/groups/public/com/adobe/granite/com.adobe.granite.oak.azureblobconnector/) and download the latest version from the 1.6.x versions of the feature pack (for example, com.adobe.granite.oak.azureblobconnector-1.6.3.zip).

>[!NOTE]
>
>When using AEM 6.4 with TarMK, binaries will be stored by default in the FileDataStore. To use TarMK with the Azure DataStore, you need to start AEM using the `crx3tar-nofds` runmode, for example:

```shell
java -jar aem6.4.jar -r crx3tar-nofds
```

Once downloaded, you can install and configure the Azure connector as follows:

1. Extract the contents of the feature pack zip file to a temporary folder.  

1. Go to the temporary folder and copy the contents of `jcr_root/libs/system/install` to the `<aem-install>crx-quickstart/install` folder.
1. If AEM is already configured to work with the Tar or MongoDB storage, remove any existing configuration files from the `/crx-quickstart/install` folder before proceeding. The files that need to be removed are:

   ForMongoMK:

   `org.apache.jackrabbit.oak.plugins.document.DocumentNodeStoreService.config`

   For TarMK:

   `org.apache.jackrabbit.oak.segment.SegmentNodeStoreService.config`

1. Return to the temporary location where the feature pack has been extracted and copy the contents of `jcr_root/libs/system/config` to the `<aem-install>/crx-quickstart/install` folder.
1. Edit the configuration file and add the configuration options required by your setup.
1. Start AEM.

You can use the configuration file with the following options:

* azureSas="": In version 1.6.3 of the connector, Azure Shared Access Signature (SAS) support was added. **If both SAS and storage credentials exists in the configuration file, SAS has priority.** For more information about SAS see the [official documentation](https://docs.microsoft.com/en-us/azure/storage/common/storage-dotnet-shared-access-signature-part-1). Ensure that the '=' character is escaped like '\='.

* azureBlobEndpoint="": The Azure Blob Endpoint. For example, https://&lt;storage-account&gt;.blob.core.windows.net.
* accessKey="": The storage account name. For more details about the Microsoft Azure authentication credentials, see the [official documentation](https://azure.microsoft.com/en-us/documentation/articles/storage-create-storage-account).  

* secretKey="": The storage access key. Ensure that the '=' character is escaped like '\='.  
* container="": The Microsoft Azure blob storage container name. The container is a grouping of a set of blobs. For additional details, read the [official documentation](https://msdn.microsoft.com/en-us/library/dd135715.aspx).
* maxConnections="": The concurrent number of simultaneous requests per operation. The default value is 1.
* maxErrorRetry="": Number of retries per request. The default value is 3.
* socketTimeout="": The timeout interval, in milliseconds, used for the request. The default value is 5 minutes.

Besides the settings above, the following settings can also be configured:

* path: The path of the data store. The default is `<aem-install>/repository/datastore.`
* RecordLength: The minimum size of an object that should be stored in the data store. The default is 16KB.
* maxCachedBinarySize: Binaries with size less than or equal to this size will be stored in memory cache. The size is in bytes. The default is 17408 (17 KB).
* cacheSize: The size of the cache. The value is specified in bytes. The default is 64GB.
* secret: Only to be used if using binaryless replication for shared datastore setup.
* stagingSplitPercentage: The percentage of cache size configured to be used for staging asynchronous uploads. The default value is 10.
* uploadThreads: The number of uploads threads that are used for asynchronous uploads. The default value is 10.
* stagingPurgeInterval: The interval in seconds for purging finished uploads from the staging cache. The default value is 300 seconds (5 minutes).
* stagingRetryInterval: The retry interval in seconds for failed uploads. The default value is 600 seconds (10 minutes).

>[!NOTE]
>
>All settings should be put between quotes, for example:

```shell
accessKey="ASDASDERFAERAER"
secretKey="28932hfjlkwdo8fufsdfas\=\="
```

## Data store garbage collection {#data-store-garbage-collection}

The data store garbage collection process is used to remove any unused files in the data store, thus freeing up valuable disk space in the process.

You can run data store garbage collection by:

1. Going to the JMX console located at *http://&lt;serveraddress:port&gt;/system/console/jmx*
1. Searching for **RepositoryManagement.** Once you find the Repository Manager MBean, click it to bring up the available options.
1. Scroll to the end of the page, and click the **startDataStoreGC(boolean markOnly)** link.
1. In the following dialogue, enter `false` for the `markOnly` parameter, then click **Invoke**:

   ![](assets/chlimage_1-24.png)

   >[!NOTE]
   >
   >The `markOnly` paramater signifies whether the sweep phase of garbage collection will run or not.

## Data Store Garbage Collection for a Shared Data Store {#data-store-garbage-collection-for-a-shared-data-store}

>[!NOTE]
>
>When performing garbage collection in a clustered or shared data store setup (with Mongo or Segment Tar) the log might display warnings about the inability to delete certain blob IDs. This happens because blob IDs deleted in a previous garbage collection are incorrectly referenced again by other cluster or shared nodes which do not have information about the ID deletions. As a result, when garbage collection is performed it logs a warning when it tries to delete an ID that has already been deleted in the last run. This behaviour does not affect performance or functionality.

With newer versions of AEM, data store garbage collection can also be run on data stores shared by more than one repository. In order to be able to run data store garbage collection on a shared data store, take the following steps:

1. Make sure that any maintenance tasks configured for the data store garbage collection are disabled on all repository instances sharing the data store.
1. Run the steps mentioned in [Binary Garbage Collection](../../../../6-5/sites/deploying/using/data-store-config.md#data-store-garbage-collection) individually on **all** repository instances sharing the data store. However, make sure to enter `true` for the `markOnly` parameter before clicking the Invoke button:

   ![](assets/chlimage_1-25.png)

1. After completing the above procedure on all instances, run the data store garbage collect again from **any** of the instances:

    1. Go to the JMX console and select the Repository Manager Mbean.
    1. Click on the **Click startDataStoreGC(boolean markOnly)** link.
    1. In the following dialogue, enter `false` for the `markOnly` parameter again.

   This will collate all the files found using the mark phase used before and delete the rest that are unused from the data store.


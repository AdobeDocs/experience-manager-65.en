---
title: AEM with MongoDB
seo-title: AEM with MongoDB
description: Learn about the tasks and considerations needed for a successful AEM with MongoDB deployment.
seo-description: Learn about the tasks and considerations needed for a successful AEM with MongoDB deployment.
uuid: 8028832d-10de-4811-a769-fab699c162ec
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: platform
content-type: reference
discoiquuid: cd3b979f-53d4-4274-b4eb-a9533329192a
docset: aem65

---

# AEM with MongoDB{#aem-with-mongodb}

This article aims to improve knowledge on tasks and considerations needed to successfully deploy Adobe Experience Manager with MongoDB.

For more deployment related information, consult the [Deploying and Maintaining](/help/sites-deploying/deploy.md) section of the documentation.

## When to use MongoDB with AEM {#when-to-use-mongodb-with-aem}

MongoDB will typically be used for supporting AEM author deployments where one of the following criteria is met:

* More than 1000 unique users per day;
* More than 100 concurrent users;
* High volumes of page edits;
* Large rollouts or activations.

The criteria above are only for the author instances and not for any publish instances which should all be TarMK based. The number of users refers to authenticated users, as author instances do not allow unauthenticated access.

If the criteria are not met, then a TarMK active/standby deployment is recommended to address availability. Generally, MongoDB should be considered in situations where the scaling requirements are more than what can be achieved with a single item of hardware.

>[!NOTE]
>
>Additional information on the sizing of author instances and the definition of concurrent users can be found in the [Hardware Sizing Guidelines](/help/managing/hardware-sizing-guidelines.md#authors-working-in-parallel).

### Minimal MongoDB Deployment for AEM {#minimal-mongodb-deployment-for-aem}

Below is a minimal deployment for AEM on MongoDB. For simplicity, SSL termination and HTTP Proxy components have been generalised. It consists of a single MongoDB replica set, with one primary and two secondaries.

![chlimage_1-4](assets/chlimage_1-4.png)

A minimal deployment requires 3 `mongod` instances configured as a replica set. One instance will be elected primary with the other instances being secondaries, with the election managed by `mongod`. Attached to each instance is a local disk. In order for the cluster to support the load, a minimum throughoput of 12MB/s with more than 3000 I/O Operations per Second (IOPS) is recommended.

The AEM authors are connected to the `mongod` instances, with each AEM author connecting to all three `mongod` instances. Writes are sent to the primary and reads may be read from any of the instances. Traffic is distributed based on load by a dispatcher to any one of the active AEM author instances. The OAK data store is a `FileDataStore`, and MongoDB monitoring is provided by MMS or MongoDB Ops Manager depending on the location of the deployment. Operating system level and log monitoring is provided by third party solutions like Splunk or Ganglia.

In this deployment, all the components are required for a successful implementation. Any missing component will leave the implementation non functional.

### Operating Systems {#operating-systems}

For a list of supported operating systems for AEM 6, see the [Technical Requirements page](/help/sites-deploying/technical-requirements.md).

### Environments {#environments}

Virtualized environments are supported provided there is good communication between the different technical teams running the project. This includes the team that is running AEM, the team owning the operating system and the team managing the virtualized infrastructure.

There are specific requirements covering the I/O capacity of the MongoDB instances which need to be managed by the team managing the virtualized environment. If the project makes use of a cloud deployment, such as Amazon Web Services, instances will need to be provisioned with sufficient I/O capacity and consistency to support the MongoDB instances. Otherwise, the MongoDB processes and the Oak repository will perform unreliably and erratically.

In the virtualized environments MongoDB will require specific I/O and VM configurations to ensure that the storage engine of MongoDB is not crippled by VMWare resource allocation policies. A successful implementation will ensure there are no barriers between the various teams and all are signed up to deliver the performance required.

## Hardware Considerations {#hardware-considerations}

### Storage {#storage}

In order to achieve the read and write throughput for best performance without the need for premature horizontal scaling, MongoDB generally requires SSD storage or storage with performance equivalent to SSD.

### RAM {#ram}

MongoDB versions 2.6 and 3.0 that use the MMAP storage engine require that the working set of the database and its indexes fits into RAM.

Insufficient RAM will result in a significant reduction of performance. The size of the working set and of the database is highly application dependent. While some estimates can be made, the most reliable way of determining the amount of RAM required is building the AEM application and load testing it.

To assist with the load testing process, the following ratio of working set to total database size can be assumed:

* 1:10 for SSD Storage
* 1:3 for Hard Disk Storage

This means in the case of SSD deployments, 200GB of RAM will be required for a 2TB database.

While the same limitations apply to the WiredTiger storage engine in MongoDB 3.0, the correlation between the working set, RAM and page faults is not so strong as WiredTiger does not use memory mapping in the same way the MMAP storage engine does.

>[!NOTE]
>
>Adobe recommends using the WiredTiger storage engine for AEM 6.1 deployments that are using MongoDB 3.0.

### Data Store {#data-store}

Due to the MongoDB working set limitations it is strongly recommended that the data store is maintained independent from the MongoDB. In most environments a `FileDataStore` using a NAS available to all AEM instances should be used. For situations where the Amazon Web Services are used, there is also an `S3 DataStore`. If for any reason the data store is maintained within MongoDB, the size of the datastore should be added to the total database size and the working set calculations adjusted appropriately. This may mean provisioning significantly more RAM to maintain performance without page faults.

## Monitoring {#monitoring}

Monitoring is vital for a successful implementation of the project. Whilst with sufficient knowledge it is possible to run AEM on MongoDB without monitoring, that knowledge is normally found in engineers specialized for each section of the deployment.

This typically involves an R&D engineer working on the Apache Oak Core and a MongoDB specialist.

Without monitoring at all levels detailed knowledge of the code base will be required to diagnose issues. With monitoring in place and suitable guidance on the major statistics, implementation teams will be able to react appropriately to anomalies.

Whilst it is possible to use command line tools to get a quick snapshot of the operation of a cluster, doing that in real time over many hosts is almost impossible. Command line tools rarely give historical information beyond a few minutes and never allow cross correlation between different types of metrics. A brief period of slow background `mongod` sync requires significant manual effort to correlate against I/O Wait or excessive write levels to a shared storage resource from an apparently unconnected virtual machine.

### MongoDB Cloud Manager {#mongodb-cloud-manager}

MongoDB Cloud Manager is a free service offered by MongoDB that allows monitoring and management of MongoDB instances. It provides a view into the performance and health of MongoDB cluster in real time. It manages both cloud and privately hosted instances provided the instance can reach the Cloud Manager monitoring server.

It requires an agent installed on the MongoDB instance that connects to the monitoring server. There are 3 levels of the agent:

* An automation agent that can fully automate everything on the MongoDB server,
* A monitoring agent that can monitor the `mongod` instance,
* A backup agent that can perform scheduled backups of the data.

Although using Cloud Manager for maintenance automation of a MongoDB cluster makes many of the routine tasks easier, it is not required, and neither is using it for backup. When choosing Cloud Manager to monitor, monitoring is however required.

For more information regarding MongoDB Cloud Manager, consult the [MongoDB documentation](https://docs.cloud.mongodb.com/).

### MongoDB Ops Manager {#mongodb-ops-manager}

MongoDB Ops Manager is the same software as the MongoDB Cloud Manager. Once registered, Ops Manager can be downloaded and installed locally in a private data center or on any other laptop or desktop machine. It uses a local MongoDB database to store data and communicates in exactly the same way as Cloud Manager with the managed servers. If you have security policies that prohibit a monitoring agent, MongoDB Ops Manager should be used.

### Operating System Monitoring {#operating-system-monitoring}

Operating system level monitoring is required to run an AEM MongoDB cluster.

Ganglia is a good example of such a system and it provides a picture on the range and detail of information required which goes beyond basic health metrics like CPU, load average and free disk space. To diagnose issues, lower level information such as entropy pool levels, CPU I/O Wait, sockets in FIN_WAIT2 state are required.

### Log Aggregation {#log-aggregation}

With a cluster of multiple servers, central log aggregation is a requirement for a production system. Software like Splunk supports log aggregation and allow teams to analyse the patters of behaviour of the application without having to manually collect the logs.

## Checklists {#checklists}

This section deals with various steps that you should take to ensure that your AEM and MongoDB deployments are properly set up before implementing your project.

### Network {#network}

1. First, make sure that all hosts have a DNS entry
1. All hosts should be resolvable by their DNS entry from all other routable hosts
1. All MongoDB hosts are routable from all other MongoDB hosts in the same cluster
1. MongoDB hosts can route packets to MongoDB Cloud Manager and the other monitoring servers
1. AEM Servers can route packets to all MongoDB servers
1. Packet latency between any AEM server and any MongoDB server is smaller than two milliseconds, with no packet loss and a standard distribution of one millisecond or less.
1. Ensure that there are no more than two hops between an AEM and a MongoDB server
1. There are no more than two hops between two MongoDB servers
1. There are no routers higher than OSI Level 3 between any core servers (MongoDB or AEM or any combination).
1. If VLAN trunking or any form of network tunnelling is used, it must comply with the packet latency checks.

### AEM Configuration {#aem-configuration}

#### Node Store Configuration {#node-store-configuration}

The AEM instances must be configured to use AEM with MongoMK. The basis of the MongoMK implementation in AEM is the Document Node Store.

For more information how to configure Node Stores, see [Configuring Node Stores and Data Stores in AEM](/help/sites-deploying/data-store-config.md).

Below is an example of Document Node Store configuration for a minimal MongoDB deployment:

```xml
# org.apache.jackrabbit.oak.plugins.document.DocumentNodeStoreService.config
#MongoDB server details
mongodburi=mongodb://aem:aempassword@mongodbserver1.customer.com:27000,mongodbserver2.customer.com:27000

#Name of MongoDB database to use
db=aem

#Store binaries in custom BlobStore e.g. FileDataStore
customBlobStore=true

cache=2048
blobCacheSize=1024
```

Where:

* `mongodburi`
  This is the MongoDB server AEM needs to connect to. Connections are made to all known members of the default replica set. If MongoDB Cloud Manager is used, server security is enabled. Consequently, the connection string must contain a suitable username and password. Non-enterprise versions of MongoDB only support username and password authentication. For more information on the connection string syntax, consult the [documentation](https://docs.mongodb.org/manual/reference/connection-string/).

* `db`
  The name of the database. The default for AEM is `aem-author`.

* `customBlobStore`
  If the deployment stores binaries in the database, they will form part of the working set. For that reason it is advised not to store binaries within MongoDB, perfering an alternative datastore like a `FileSystem` datastore on a NAS.

* `cache`
  The cache size in Megabytes. This is distributed among various caches used in the `DocumentNodeStore`. The default is 256MB. However, Oak read performance will benefit from a bigger cache.

* `blobCacheSize`
  Frequently used blobs may be cached by AEM to avoid refetching them from the data store. This will have more impact on performance especially when storing blobs in the MongoDB database. All the file system based Data Stores will benefit from the operating system level disk cache.

#### Data Store Configuration {#data-store-configuration}

The Data Store is used to store files of a size larger than a threshold. Below that threshold, files are stored as properties within the Document Node Store. If the `MongoBlobStore` is used, a dedicated collection is created in MongoDB to store the blobs. This collection contributes to the working set of the `mongod` instance, and will require that `mongod` has more RAM to avoid performance issues. For that reason, the recommended configuration is to avoid the `MongoBlobStore` for production deployments and use `FileDataStore` backed by a NAS shared amongst all AEM instances. Since the operating system level cache is efficient at managing files, the minimum size of a file on disk should be set at close to the block size of the disk so that the file system is used efficiently and many small documents do not contribute excessively to the working set of the `mongod` instance.

Here is a typical Data Store configuration for a minimal AEM deployment with MongoDB:

```xml
# org.apache.jackrabbit.oak.plugins.blob.datastore.FileDataStore.config
# The minimum size of an object that should be stored in this data store.
minRecordLength=4096
path=/datastore
maxCachedBinarySize=4096
cacheSizeInMB=128
```

Where:

* `minRecordLength`
  Size in bytes. Binaries less than or equal to this size are stored with the Document Node Store. Rather than storing the ID of the blob, the content of the binary is stored. For binaries greater than this size the ID of the binary is stored as a property of the Document in the nodes collection, and the body of the binary is stored in the `FileDataStore` on disk. 4096 bytes is a typical file system block size.

* `path`
  The path to the root of the data store. For a MongoMK deployment, this must be a shared file system avaiable to all AEM instances. Typically a Network Attached Storage (NAS) server is used. For cloud deployments like Amazon Web Services, the `S3DataFileStore` is also available.

* `cacheSizeInMB`
  The total size of the binary cache in Megabytes. It is used to cache binaries less than the `maxCacheBinarySize` setting.

* `maxCachedBinarySize`
  The maximum size in bytes of a binary cached in the binary cache. If a file system based Data Store is used, it is not recommended to use high values for the Data Store cache since the binaries are already cached by the operating system.

#### Disabling the Query Hint {#disabling-the-query-hint}

It is recommended that you disable the query hint sent with all queries by adding the property

`-Doak.mongo.disableIndexHint=true`

when starting AEM. This way, MongoDB will calculate on the most appropriate index to use based on internal statistics.

If the query hint is not disabled, any performance tuning of indexes will have no impact on the performance of AEM.

#### Enable Persistent Cache for MongoMK {#enable-persistent-cache-for-mongomk}

It is recommended that a persistent cache configuration is enabled for MongoDB deployments, in order to maximize speed for environments with high I/O read performance. For more details, see the [Jackrabbit Oak documentation](https://jackrabbit.apache.org/oak/docs/nodestore/persistent-cache.html).

## MongoDB Operating System Optimizations {#mongodb-operating-system-optimizations}

### Operating System Support {#operating-system-support}

MongoDB 2.6 uses a memory mapped storage engine that is sensitive to some aspects of the operating system level management between RAM and Disk. Query and read Performance of the MongoDB instance relies on avoiding or eliminating slow I/O operations often referred to as page faults. These are page faults that apply to the `mongod` process in particular. They should not be confused with operating system level page faults.

For fast operation the MongoDB database should only ever access data that is already in RAM. The data that it needs to access is made up of indexes and data. This collection of indexes and data is called the working set. Where the working set is larger than the available RAM MongoDB has to page that data in from disk incurring an I/O cost, evicting other data already in memory. If the eviction causes data to be reloaded from disk page faults will dominate and performance will degrade. Where the working set is dynamic and variable, more page faults will be incurred to support operations.

MongoDB runs on a number of operating systems including a wide variety of Linux flavors, Windows, and Mac OS. See [https://docs.mongodb.com/manual/installation/#supported-platforms](https://docs.mongodb.com/manual/installation/#supported-platforms) for additional details. Depending on your operating system choice, MongoDB has different operating system level recommendations. There are documented at [https://docs.mongodb.com/manual/administration/production-checklist-operations/#operating-system-configuration](https://docs.mongodb.com/manual/administration/production-checklist-operations/#operating-system-configuration) and summarized here for convenience.

#### Linux {#linux}

* Turn off transparent hugepages and defrag. See [Transparent Huge Pages Settings](https://docs.mongodb.com/manual/tutorial/transparent-huge-pages/) for more information.
* [Adjust the readahead settings](https://docs.mongodb.com/manual/administration/production-notes/#readahead) on the devices storing your database files to suit your use case.

    * For the MMAPv1 storage engine, if your working set is bigger that the available RAM, and the document access pattern is random, consider lowering the readahead to 32 or 16. Evaluate different settings to find an optimal value that maximizes the resident memory and lowers the number of page faults.
    * For the WiredTiger storage engine, set readahead to 0 regardless of storage media type (spinning, SSD, etc.). In general, use the recommended readahead setting unless testing shows a measurable, repeatable, and reliable benefit in a higher readahead value. [MongoDB Professional Support](https://docs.mongodb.com/manual/administration/production-notes/#readahead) can provide advice and guidance on non-zero readahead configurations.

* Disable the tuned tool if you are running RHEL 7 / CentOS 7 in a virtual environment.
* When RHEL 7 / CentOS 7 run in a virtual environment, the tuned tool automatically invokes a performance profile derived from performance throughput, which automatically sets the readahead settings to 4MB. This can negatively impact performance.
* Use the noop or deadline disk schedulers for SSD drives.
* Use the noop disk scheduler for virtualized drives in guest VMs.
* Disable NUMA or set vm.zone_reclaim_mode to 0 and run [mongod](https://docs.mongodb.com/manual/administration/production-notes/#readahead) instances with node interleaving. See: [MongoDB and NUMA Hardware](https://docs.mongodb.com/manual/administration/production-notes/#readahead) for more information.

* Adjust the ulimit values on your hardware to suit your use case. If multiple [mongod](https://docs.mongodb.com/manual/reference/program/mongod/#bin.mongod) or [mongos](https://docs.mongodb.com/manual/reference/program/mongos/#bin.mongos) instances are running under the same user, scale the ulimit values accordingly. See: [UNIX ulimit Settings](https://docs.mongodb.com/manual/reference/ulimit/) for more information.

* Use noatime for the [dbPath](https://docs.mongodb.com/manual/reference/configuration-options/#storage.dbPath) mount point.
* Configure sufficient file handles (fs.file-max), kernel pid limit (kernel.pid_max), and maximum threads per process (kernel.threads-max) for your deployment. For large systems, the following values provide a good starting point:

    * fs.file-max value of 98000,
    * kernel.pid_max value of 64000,
    * andkernel.threads-max value of 64000

* Ensure that your system has swap space configured. Refer to your operating system’s documentation for details on appropriate sizing.
* Ensure that the system default TCP keepalive is set correctly. A value of 300 often provides better performance for replica sets and sharded clusters. See: [Does TCP keepalive time affect MongoDB Deployments?](https://docs.mongodb.com/manual/faq/diagnostics/#faq-keepalive) in the Frequently Asked Questions for more information.

#### Windows {#windows}

* Consider disabling NTFS “last access time” updates. This is analogous to disabling atime on Unix-like systems.

### WiredTiger {#wiredtiger}

As of MongoDB 3.2 the default storage engine for MongoDB is the WiredTiger storage engine. This engine provides a number of robust and scalable features making it much better suited for all-around general database workloads. The following sections describe these features.

#### Document Level Concurrency {#document-level-concurrency}

WiredTiger uses document-level concurrency control for write operations. As a result, multiple clients can modify different documents of a collection at the same time.

For most read and write operations, WiredTiger uses optimistic concurrency control. WiredTiger uses only intent locks at the global, database and collection levels. When the storage engine detects conflicts between two operations, one will incur a write conflict causing MongoDB to transparently retry that operation.Some global operations, typically short lived operations involving multiple databases, still require a global “instance-wide” lock.

Some other operations, such as dropping a collection, still require an exclusive database lock.

#### Snapshots and Checkpoints {#snapshots-and-checkpoints}

WiredTiger uses MultiVersion Concurrency Control (MVCC). At the start of an operation, WiredTiger provides a point-in-time snapshot of the data to the transaction. A snapshot presents a consistent view of the in-memory data.

When writing to disk, WiredTiger writes all the data in a snapshot to disk in a consistent way across all data files. The now- [durable](https://docs.mongodb.com/manual/reference/glossary/#term-durable) data act as a checkpoint in the data files. The checkpoint ensures that the data files are consistent up to and including the last checkpoint; i.e. checkpoints can act as recovery points.

MongoDB configures WiredTiger to create checkpoints (i.e. write the snapshot data to disk) at intervals of 60 seconds or 2 gigabytes of journal data.

During the write of a new checkpoint, the previous checkpoint is still valid. As such, even if MongoDB terminates or encounters an error while writing a new checkpoint, upon restart, MongoDB can recover from the last valid checkpoint.

The new checkpoint becomes accessible and permanent when WiredTiger’s metadata table is atomically updated to reference the new checkpoint. Once the new checkpoint is accessible, WiredTiger frees pages from the old checkpoints.

Using WiredTiger, even without [journaling](https://docs.mongodb.com/manual/reference/glossary/#term-durable), MongoDB can recover from the last checkpoint; however, to recover changes made after the last checkpoint, run with [journaling](https://docs.mongodb.com/manual/core/wiredtiger/#storage-wiredtiger-journal).

#### Journal {#journal}

WiredTiger uses a write-ahead transaction log in combination with [checkpoints](https://docs.mongodb.com/manual/core/wiredtiger/#storage-wiredtiger-checkpoints) to ensure data durability.

The WiredTiger journal persists all data modifications between checkpoints. If MongoDB exits between checkpoints, it uses the journal to replay all data modified since the last checkpoint. For information on the frequency with which MongoDB writes the journal data to disk, see [Journaling Process](https://docs.mongodb.com/manual/core/journaling/#journal-process).

WiredTiger journal is compressed using the [snappy](https://docs.mongodb.com/manual/core/journaling/#journal-process) compression library. To specify an alternate compression algorithm or no compression, use the [storage.wiredTiger.engineConfig.journalCompressor](https://docs.mongodb.com/manual/reference/configuration-options/#storage.wiredTiger.engineConfig.journalCompressor) setting.

For more information see: [Journaling with WiredTiger](https://docs.mongodb.com/manual/core/journaling/#journaling-wiredtiger).

>[!NOTE]
>
>Minimum log record size for WiredTiger is 128 bytes. If a log record is 128 bytes or smaller, WiredTiger does not compress that record.
>
>You can disable journaling by setting [storage.journal.enabled](https://docs.mongodb.com/manual/reference/configuration-options/#storage.journal.enabled) to false, which can reduce the overhead of maintaining the journal.
>
>For [standalone](https://docs.mongodb.com/manual/reference/glossary/#term-standalone) instances, not using the journal means that you will lose some data modifications when MongoDB exits unexpectedly between checkpoints. For members of [replica sets](https://docs.mongodb.com/manual/reference/glossary/#term-replica-set), the replication process may provide sufficient durability guarantees.

#### Compression {#compression}

With WiredTiger, MongoDB supports compression for all collections and indexes. Compression minimizes storage use at the expense of additional CPU.

By default, WiredTiger uses block compression with the [snappy](https://docs.mongodb.com/manual/reference/glossary/#term-snappy) compression library for all collections and [prefix compression](https://docs.mongodb.com/manual/reference/glossary/#term-prefix-compression) for all indexes.

For collections, block compression with [zlib](https://docs.mongodb.com/manual/reference/glossary/#term-zlib) is also available. To specify an alternate compression algorithm or no compression, use the [storage.wiredTiger.collectionConfig.blockCompressor](https://docs.mongodb.com/manual/reference/glossary/#term-zlib) setting.

For indexes, to disable [prefix compression](https://docs.mongodb.com/manual/reference/glossary/#term-prefix-compression), use the [storage.wiredTiger.indexConfig.prefixCompression](https://docs.mongodb.com/manual/reference/configuration-options/#storage.wiredTiger.indexConfig.prefixCompression) setting.

Compression settings are also configurable on a per-collection and per-index basis during collection and index creation. See [Specify Storage Engine Options](https://docs.mongodb.com/manual/reference/method/db.createCollection/#create-collection-storage-engine-options) and [db.collection.createIndex() storageEngine](https://docs.mongodb.com/manual/reference/method/db.collection.createIndex/#createindex-options) option.

For most workloads, the default compression settings balance storage efficiency and processing requirements.

The WiredTiger journal is also compressed by default. For information on journal compression, see [Journal](https://docs.mongodb.com/manual/core/wiredtiger/#storage-wiredtiger-journal).

#### Memory Use {#memory-use}

With WiredTiger, MongoDB utilizes both the WiredTiger internal cache and the filesystem cache.

Starting in 3.4, the WiredTiger internal cache, by default, will use the larger of either:

* 50% of RAM minus 1 GB, or
* 256 MB

By default, WiredTiger uses Snappy block compression for all collections and prefix compression for all indexes. Compression defaults are configurable at a global level and can also be set on a per-collection and per-index basis during collection and index creation.

Different representations are used for data in the WiredTiger internal cache versus the on-disk format:

* Data in the filesystem cache is the same as the on-disk format, including benefits of any compression for data files. The filesystem cache is used by the operating system to reduce disk I/O.

Indexes loaded in the WiredTiger internal cache have a different data representation to the on-disk format, but can still take advantage of index prefix compression to reduce RAM usage.

Index prefix compression deduplicates common prefixes from indexed fields.

Collection data in the WiredTiger internal cache is uncompressed and uses a different representation from the on-disk format. Block compression can provide significant on-disk storage savings, but data must be uncompressed to be manipulated by the server.

Via the filesystem cache, MongoDB automatically uses all free memory that is not used by the WiredTiger cache or by other processes.

To adjust the size of the WiredTiger internal cache, see [storage.wiredTiger.engineConfig.cacheSizeGB](https://docs.mongodb.com/manual/reference/configuration-options/#storage.wiredTiger.engineConfig.cacheSizeGB) and [--wiredTigerCacheSizeGB](https://docs.mongodb.com/manual/reference/program/mongod/#cmdoption-wiredtigercachesizegb). Avoid increasing the WiredTiger internal cache size above its default value.

### NUMA {#numa}

Non Uniform Memory Access (NUMA) allows a kernel to manage how memory is mapped to the processor cores. Although this attempts to make memory access faster for cores ensuring that they are able to access the data required, NUMA interferes with MMAP introducing additional latency as reads cannot be predicted. Because of this, NUMA needs to be disabled for the `mongod` process on all operating systems that have the capability.

In essence, in a NUMA architecture memory is connected to CPUs and CPUs are connected to a bus. In a SMP or UMA architecture, memory is connected to the bus and shared by CPUs. When a thread allocates memory on a NUMA CPU it allocates it according to a policy. The default is to allocate memory attached to the thread's local CPU unless there is no free, at which point it uses memory from a free CPU at higher cost. Once allocated, the memory doesn't move between CPUs. The allocation is performed by a policy inherited from the parent thread, which ultimately is the thread that started the process.

In many databases that see the machine as a multi core uniform memory architecture, this leads to the inital CPU getting full first and the secondary CPU filling later, especially if a central thread is responsible for allocating memory buffers. The solution is to change the NUMA policy of the main thread used to start the `mongod` process.

This can be done by running the following command:

```shell
numactl --interleaved=all <mongod> -f config
```

This policy allocates memory in a round robin way over all CPU nodes ensuring an even distribution over all nodes. It does not generate the highest performance access to memory as in systems with multiple CPU hardware. About half of the memory operations will be slower and over the bus, but `mongod` has not been written to target NUMA in an optimal way, so its a reasonable compromise.

### NUMA Issues {#numa-issues}

If the `mongod` process is started from a location other than the `/etc/init.d` folder, it is probable that it will not be started with the correct NUMA policy. Depending on what the default policy is, problems can arise. This is because the various Linux package manager installers for MongoDB also install a service with configuration files located in `/etc/init.d` which perform the step outlined above. If you install and run MongoDB directly from an archive ( `.tar.gz`) then you will need to manually run mongod under the `numactl` process.

>[!NOTE]
>
>For more information on the NUMA policies available, consult the [numactl documentation](https://linux.die.net/man/8/numactl).

The MongoDB process will behave differently under different allocation policies:

```

```

* `-membind=<nodes>`
  Allocate only on the nodes listed. Mongod will not allocate memory on nodes listed and may not use all the available memory.

* `-cpunodebind=<nodes>`
  Only execute on the nodes. Mongod will only run on the nodes specified and only use memory available on those nodes.

* `-physcpubind=<nodes>`
  Only execute on CPUs (cores) listed. Mongod will only run on the CPUs listed and only use memory available on those CPUs.

* `--localalloc`
  Always allocate memory on the current node, but use all nodes the thread runs on. If one thread performs allocation, then only the memory available to that CPU will be used.

* `--preferred=<node>`
  Prefers allocation to a node, but falls back to others if the preferred node is full. Relative notation for defining a node may be used. Also, the threads run on all nodes.

Some of the policies may result in less than all the available RAM being given to the `mongod` process. Unlike MySQL, MongoDB actively avoids operating system level paging, and consequently the `mongod` process may get less memory that appears available.

#### Swapping {#swapping}

Due to the memory intensive nature of databases, operating system level swapping must be disabled. The MongoDB process will avoid swapping by design.

#### Remote Filesystems {#remote-filesystems}

Remote file systems like NFS are not recommended for MongoDB's internal data files (the mongod process database files) , because they introduce too much latency. This is not to be confused with the shared file system required for the storage of Oak Blob's (FileDataStore), where NFS is recommended.

#### Read Ahead {#read-ahead}

Read ahead needs to be tuned so that when a page is paged in using a random read, unnecessary blocks are not read from disk resulting in unnecessary consumption of I/O bandwidth.

### Linux Requirements {#linux-requirements}

#### Minimum kernel versions {#minimum-kernel-versions}

* **2.6.23** for `ext4` filesystems

* **2.6.25** for `xfs` filesystems

#### Recommended Settings for Database Disks {#recommended-settings-for-database-disks}

**Turn off atime**

It is recommended that `atime` is turned off for the disks that will contain the databases.

**Set the NOOP disk scheduler**

You can do this by:

First, checking the I/O scheduler that is currently set. This can be done by running the following command:

```shell
cat /sys/block/sdg/queue/scheduler
```

If the response is `noop` there is nothing you need to do further.

If NOOP is not the I/O scheduler that is set up, you can change it by running:

```shell
echo noop > /sys/block/sdg/queue/scheduler
```

**Adjust the read ahead value**

It is recommended that a value of 32 be used for the disks where MongoDB databases run from. This amounts to 16 kilobytes. You can set it by running:

```shell
sudo blockdev --setra <value> <device>
```

#### Enable NTP {#enable-ntp}

Make sure you have NTP installed and running on the machine that is hosting the MongoDB databases. For example, you can install it by using the yum package manager on a CentOS machine:

```shell
sudo yum install ntp
```

After the NTP daemon has been installed and has successfully started, you can check the drift file for the time offset of your server.

#### Disable Transparent Huge Pages {#disable-transparent-huge-pages}

Red Hat Linux uses a memory management algorithm called Transparent Huge Pages (THP). It is recommended you disable it if you are using the operating system for database workloads.

You can disable it by following the below procedure:

1. Open the `/etc/grub.conf` file in the text editor of your choice.
1. Add the following line to the grub.conf file:

   ```xml
   transparent_hugepage=never
   ```

1. Finally, check if the setting has taken effect by running:

   ```shell
   cat /sys/kernel/mm/redhat_transparent_hugepage/enabled
   ```

   If THP is disabled, the output of the above command should be:

   ```xml
   always madvise [never]
   ```

>[!NOTE]
>
>For more information on Transparent Huge Pages, consult this [article](https://access.redhat.com/solutions/46111).

#### Disable NUMA {#disable-numa}

In most installations where NUMA is enabled, the MongoDB daemon will disable it automatically if it is run as a service from the `/etc/init.d` folder.

Where this is not the case, you can disable NUMA on a per process level. To disable it, run these commands:

```shell
numactl --interleave=all <path_to_process>
```

Where `<path_to_process>` is the path to the mongod process.

Then, disable zone reclaim by running:

```shell
echo 0 > /proc/sys/vm/zone_reclaim_mode
```

#### Tweak the ulimit settings for the mongod process {#tweak-the-ulimit-settings-for-the-mongod-process}

Linux allows for configurable control over the allocation of resources via the `ulimit` command. This can be done on a user or on a per process basis.

It is recommended that you configure ulimit for the mongod process according to the [MongoDB Recommended ulimit Settings](https://docs.mongodb.org/manual/reference/ulimit/#recommended-ulimit-settings).

#### Test MongoDB I/O Performance {#test-mongodb-i-o-performance}

MongoDB provides a tool called `mongoperf` that is designed to test I/O performance. It is recommended you use it to test the performance of all your MongoDB instances that make up your infrastructure.

For information on how to use `mongoperf`, view the [MongoDB documentation](https://docs.mongodb.org/manual/reference/program/mongoperf/).

>[!NOTE]
>
>Note that `mongoperf` is designed to be an indicator of MongoDB performance on the platform it is run on. Because of this, the results should not be treated as definitive for the performance of a production system.
>
>For more accurate performance results, you can run complementary tests with the `fio` Linux tool.

**Test read performance on the virtual machines that make up your deployment**

After you have installed the tool, switch to the MongoDB database directory in order to run the tests. Then, start the first test by running `mongoperf`with this configuration:

```shell
echo "{nThreads:32,fileSizeMB:1000,r:true}" | mongoperf
```

The desired output should reach up to two gigabytes per second (2GB/s) and 500.000 IOPS running at 32 threads for all MongoDB instances.

Run a second test, this time using memory mapped files, by setting the `mmf:true` parameter:

```shell
echo "{nThreads:32,fileSizeMB:1000,r:true,mmf:true}" | mongoperf
```

The output of the second test should be considerably higher than the first, indicating the memory transfer performance.

>[!NOTE]
>
>When performing the tests, check the I/O usage statistics for the virtual machines in question in your operating system monitoring system. If they indicate values lower than 100 percent for I/O reads, there may be an issue with your virtual machine.

**Test the write performance of the primary MongoDB instance**

Next, check I/O write performance of the primary MongoDB instance by running `mongoperf` from the MongoDB database directory with the same settings:

```shell
echo "{nThreads:32,fileSizeMB:1000,w:true}" | mongoperf
```

The desired output should be 12 megabytes per second and reaching around 3000 IOPS, with little variation between the number of threads.

## Steps for Virtualised Environments {#steps-for-virtualised-environments}

### VMWare {#vmware}

If you are using WMWare ESX to manage and deploy your virtualized environments, make sure you perform the following settings from the ESX console in order to accommodate MongoDB operation:

1. Turn off memory ballooning
1. Pre-allocate and reserve memory for the virtual machines that will host the MongoDB databases
1. Use Storage I/O Control to allocate sufficient I/O to the `mongod` process.
1. Guarantee CPU resources of the machines hosting MongoDB by setting [CPU Reservation](https://pubs.vmware.com/vsphere-4-esx-vcenter/index.jsp?topic=/com.vmware.vsphere.vmadmin.doc_41/vsp_vm_guide/configuring_virtual_machines/t_allocate_cpu_resources.html)

1. Consider using ParaVirtual I/O drivers. For more information on how to do this, check this [knowledgebase article](https://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1010398).

### Amazon Web Services {#amazon-web-services}

For documentation on how to set up MongoDB with Amazon Web Services, check the [Configure AWS Integration](https://docs.cloud.mongodb.com/tutorial/configure-aws-settings/) article on the MongoDB website.

## Securing MongoDB Before Deployment {#securing-mongodb-before-deployment}

See this post on [securely deploying MongoDB](https://blogs.adobe.com/security/2015/07/securely-deploying-mongodb-3-0.html) for advice on how to secure the configuration of your databases before deployment.

## Dispatcher {#dispatcher}

### Choosing the Operating System for the Dispatcher {#choosing-the-operating-system-for-the-dispatcher}

In order to properly serve your MongoDB deployment, the operating system that will host the dispatcher must be running **Apache httpd** **version 2.4 or higher.**

Also, make sure that the all libraries used in your build are up to date in order to minimize security implications.

### Dispatcher Configuration {#dispatcher-configuration}

A typical Dispatcher configuration will serve between ten to twenty times more the request throughput of a single AEM instance.

Since the Dispatcher is mainly stateless, it can scale horizontally with ease. In some deployments, authors need to be restricted from accessing certain resources. Because of this, it is highly recommended you use a dispatcher with the author instances.

Running AEM without a dispatcher will require SSL termination and load balancing to be performed by another application. This is is required because sessions must have affinity to the AEM instance on which they created, a concept known as sticky connections. The purpose of this is to assure that updates to the content exhibit minimal latency.

Check the [Dispatcher documentation](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher.html) for more information on how to configure it.

### Additional Configuration {#additional-configuration}

#### Sticky Connections {#sticky-connections}

Sticky connections ensure that personalized pages and session data for one user are all composed on the same instance of AEM. This data is stored on the instance, so subsequent requests from the same user will return to the same instance.

It is recommended that sticky connections are enabled for all inner layers routing requests to the AEM instances, encouraging subsequent requests to reach the same AEM instance. This will help minimize latency that is otherwise noticeable when content is updated between instances.

#### Long Expires {#long-expires}

By default, content sent out from an AEM dispatcher has Last-Modified and Etag headers, with no indication of the expiry of the content. Whilst this ensures that the user interface always gets the latest version of the resource, it also means that the browser will perform a GET operation to check to see if the resource has changed. This may result in multiple requests to which the HTTP response is 304 (Not modified), depending on the page load. For resources that are known not to expire, setting an Expires header and removing the Last-Modified and ETag headers will cause the content to be cached and no further update requests to be made until the date in the Expires header is met.

However, using this method means that there is no reasonable way of causing the resource to expire in the browser before the Expires header expires. In order to mitigate this, the HtmlClientLibraryManager can be configured to use immutable URLs for client libraries.

These URLs are guaranteed to not change. When the body of the resource contained in the URL changes, the changes will automatically be reflected in the URL ensuring that the browser will request the correct version of the resource.

The default configuration adds a selector to the HtmlClientLibraryManager. Being a selector, the resource is cached in the dispatcher with the selector intact. Also this selector may be used to ensure the correct expiration behaviour. The default selector follows the `lc-.*?-lc` pattern. The following Apache httpd configuration directives will ensure that all requests matching that pattern are served with a suitable expiry time.

```xml
Header set Expires "Tue, 20 Jan 2037 04:20:42 GMT" "expr=(%{REQUEST_STATUS} -eq 200) && (%{REQUEST_URI} =~ /.*lc-.*?-lc.*/)"
Header set Cache-Control "public, no-transform, max-age=267840000" "expr=(%{REQUEST_STATUS} -eq 200) && (%{REQUEST_URI} =~ /.*lc-.*?-lc.*/)"
Header unset ETag "expr=(%{REQUEST_STATUS} -eq 200) && (%{REQUEST_URI} =~ /.*lc-.*?-lc.*/)"
Header unset Last-Modified "expr=(%{REQUEST_STATUS} -eq 200) && (%{REQUEST_URI} =~ /.*lc-.*?-lc.*/)"
Header unset Pragma "expr=(%{REQUEST_STATUS} -eq 200) && (%{REQUEST_URI} =~ /.*lc-.*?-lc.*/)"
```

#### No Sniff {#no-sniff}

Where content is sent out with no content-type, many browsers will attempt to guess the type of content by reading the first few bytes of the content. This is called "sniffing". Sniffing opens a security vulnerability as users that can write to the repository may upload malicious content with no content type.

For this reason its is advisable to add a `no-sniff` header to resources served by the dispatcher. However, the dispatcher does not cache headers. This means that any content served from the local filesystem will have its content type determined by its extension, rather than using the original content-type header from its AEM server of origin.

No sniff can be safely enabled if the web application is known to never serve cached resources without a file type.

You can enable No Sniff inclusively:

```xml
Header set X-Content-Type-Options "nosniff"
```

It can also be enabled selectively:

```xml
RewriteCond %{REQUEST_URI} \.(?:js|jsonp)$ [OR]
RewriteCond %{QUERY_STRING} (callback|jsonp|cb)=\w+
RewriteRule .* - [E=jsonp_request:1]
Header set X-Content-Type-Options "nosniff"  env=jsonp_request
Header setifempty Content-Type application/javascript env=jsonp_request
```

#### Content Security Policy {#content-security-policy}

The default dispatcher settings allow an open Content Security Policy, also known as CSP. This allows a page to load resources from all the domains subject to the default policies of the browser sandbox.

It is desirable to restrict where resources may be loaded from to avoid loading code into the javascript engine from untrusted or unverified foreign servers.

CSP allows for fine tuning of policies. However, in a complex application CSP headers need to be developed with care as policies that are too restrictive may break parts of the user interface.

>[!NOTE]
>
>For more information on how this work, see the [OWASP Page on Content Security Policy](https://www.owasp.org/index.php/Content_Security_Policy).

### Sizing {#sizing}

For more information on sizing, see the [Hardware Sizing Guidelines](/help/managing/hardware-sizing-guidelines.md).

### MongoDB Performance Optimization {#mongodb-performance-optimization}

For generic information on MongoDB performance, see [Analyzing MongoDB Performance](https://docs.mongodb.org/manual/administration/analyzing-mongodb-performance/).

## Known Limitations {#known-limitations}

### Concurrent Installations {#concurrent-installations}

While concurrent use of multiple AEM instances with a single database is supported by MongoMK, concurrent installations are not.

In order work around this, make sure you run the installation with a single member first, and add the other ones after the first has finished installing.

### Page Name Length {#page-name-length}

If AEM is running on a MongoMK persistence manager deployment, [page names are limited to 150 characters.](/help/sites-authoring/managing-pages.md)

>[!NOTE]
>
>[Please refer to the MongoDB documentation](https://docs.mongodb.com/manual/reference/limits/) to make yourself familiar with the known limitations and thresholds of MongoDB itself as well.


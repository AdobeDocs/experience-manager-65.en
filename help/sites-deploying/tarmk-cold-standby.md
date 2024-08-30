---
title: How to Run AEM with TarMK Cold Standby
description: Learn how to create, configure, and maintain a TarMK Cold Standby setup.
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: deploying
docset: aem65
feature: Administering
exl-id: dadde3ee-d60c-4b87-9af0-a12697148161
solution: Experience Manager, Experience Manager Sites
role: Admin
---
# How to Run AEM with TarMK Cold Standby{#how-to-run-aem-with-tarmk-cold-standby}

## Introduction {#introduction}

The Cold Standby capacity of the Tar Micro Kernel allows one or more standby Adobe Experience Manager (AEM) instances to connect to a primary instance. The sync process is one way only meaning that it is only done from the primary to the standby instances.

The purpose of the standby instances is to guarantee a live data copy of the master repository and ensure a quick switch without data loss in case the master is unavailable for any reason.

Content is synced linearly between the primary instance and the standby instances without any integrity checks for file or repository corruption. Because of this design, standby instances are exact copies of the primary instance and cannot help to mitigate inconsistencies on primary instances.

>[!NOTE]
>
>The Cold Standby feature is meant to secure scenarios where high availability is required on **Author** instances. For situations where high availability is required on **Publish** instances using the Tar Micro Kernel, Adobe recommends using a publish farm.
>
>For info on more available deployments, see the [Recommended Deployments](/help/sites-deploying/recommended-deploys.md) page.

>[!NOTE]
>
>When the Standby instance is set up, or derived from the Primary node, it only allows access to the following console (for administration-related activities):
>
>* OSGI Web Console
>
>Other consoles are not accessible.

## How it works {#how-it-works}

On the primary AEM instance, a TCP port is opened and is listening to incoming messages. Currently, there are two types of messages that the slaves send to the master:

* a message requesting the segment ID of the current head
* a message requesting segment data with a specified ID

The standby periodically requests the segment ID of the current head of the primary. If the segment is locally unknown, it is retrieved. If it is already present, the segments are compared and referenced segments are requested too, if necessary.

>[!NOTE]
>
>Standby instances are not receiving any type of requests, because they are running in sync only mode. The only section available on a standby instance is the Web Console, to facilitate bundle and services configuration.

A typical TarMK Cold Standby deployment:

![chlimage_1](assets/chlimage_1.png)

## Other characteristics {#other-characteristics}

### Robustness {#robustness}

The data flow is designed to detect and handle connection and network-related problems automatically. All packets are bundled with checksums and when problems with the connection or damaged packets occur, retry mechanisms are triggered.

#### Performance {#performance}

Enabling TarMK Cold Standby on the primary instance has almost no measurable impact on the performance. The additional CPU consumption is low and the extra hard disk and network IO should not produce and performance issues.

On the standby, you can expect high CPU consumption during the sync process. Because the procedure is not multithreaded, it cannot be sped up by using multiple cores. If no data is changed or transferred, there is no measurable activity. The connection speed varies depending on the hardware and network environment but it does not depend on the size of the repository or SSL use. Keep this in mind when estimating the time needed for an initial sync or when much data was changed in the meantime on the primary node.

#### Security {#security}

Assuming that all the instances run in the same intranet security zone the risk of a security breach is greatly reduced. Nevertheless, you can add an extra security layer by enabling SSL connections between the slaves and the master. Doing so reduces the possibility that the data is compromised by a man-in-the-middle.

Furthermore you can specify the standby instances that are allowed to connect by restricting the IP address of incoming requests. This should help to guarantee that no one in the intranet can copy the repository.

>[!NOTE]
>
>It is recommended that a load balancer be added between the Dispatcher and the servers that are part of the Cold Standby setup. The load balancer should be configured to direct user traffic only to the **primary** instance. This is necessary to ensure consistency and prevent content from getting copied on the standby instance by other means than the Cold Standby mechanism.

## Creating an AEM TarMK Cold Standby setup {#creating-an-aem-tarmk-cold-standby-setup}

>[!CAUTION]
>
>The PID for the Segment node store and the Standby store service has changed in AEM 6.3 compared to the previous versions as follows:
>
>* from org.apache.jackrabbit.oak.**plugins**.segment.standby.store.StandbyStoreService to org.apache.jackrabbit.oak.segment.standby.store.StandbyStoreService
>* from org.apache.jackrabbit.oak.**plugins**.segment.SegmentNodeStoreService to org.apache.jackrabbit.oak.segment.SegmentNodeStoreService
>
>Make the necessary configuration adjustments so they reflect this change.

To create a TarMK cold standby setup, first create the standby instances by performing a file system copy of the entire installation folder of the primary to a new location. You can then start each instance with a run mode that specifies its role ( `primary` or `standby`).

Below is the procedure that must be followed to create a setup with one master and one standby instance:

1. Install AEM.

1. Shut down your instance, and copy its installation folder to the location where the cold standby instance runs from. Even if you are running from different machines, make sure to give each folder a descriptive name (like *aem-primary* or *aem-standby*) to differentiate between the instances.
1. Go to the installation folder of the primary instance and:

    1. Check and delete any previous OSGi configurations you might have under `aem-primary/crx-quickstart/install`

    1. Create a folder called `install.primary` under `aem-primary/crx-quickstart/install`

    1. Create the required configurations for the preferred node store and data store under `aem-primary/crx-quickstart/install/install.primary`
    1. Create a file called `org.apache.jackrabbit.oak.segment.standby.store.StandbyStoreService.config` in the same location and configure it accordingly. For more information on the configuration options, see [Configuration](/help/sites-deploying/tarmk-cold-standby.md#configuration).

    1. If you are using an AEM TarMK instance with an external data store, create a folder named `crx3` under `aem-primary/crx-quickstart/install` named `crx3`

    1. Place the data store configuration file in the `crx3` folder.

   For example, if you are running an AEM TarMK instance with an external File Data Store, you need these configuration files:

    * `aem-primary/crx-quickstart/install/install.primary/org.apache.jackrabbit.oak.segment.SegmentNodeStoreService.config`
    * `aem-primary/crx-quickstart/install/install.primary/org.apache.jackrabbit.oak.segment.standby.store.StandbyStoreService.config`
    * `aem-primary/crx-quickstart/install/crx3/org.apache.jackrabbit.oak.plugins.blob.datastore.FileDataStore.config`

   Below, find sample configurations for the primary instance:

   **Sample of** **org.apache.jackrabbit.oak.segment.SegmentNodeStoreService.config**

   ```xml
   org.apache.sling.installer.configuration.persist=B"false"
   customBlobStore=B"true"
   standby=B"false"
   ```

   **Sample of org.apache.jackrabbit.oak.segment.standby.store.StandbyStoreService.config**

   ```xml
   org.apache.sling.installer.configuration.persist=B"false"
   mode="primary"
   port=I"8023"
   ```

   **Sample of org.apache.jackrabbit.oak.plugins.blob.datastore.FileDataStore.config**

   ```xml
   org.apache.sling.installer.configuration.persist=B"false"
   path="./crx-quickstart/repository/datastore"
   minRecordLength=I"16384"
   ```

1. Start the primary making sure you specify the primary run mode:

   ```shell
   java -jar quickstart.jar -r primary,crx3,crx3tar
   ```

1. Create an Apache Sling Logging Logger for the **org.apache.jackrabbit.oak.segment** package. Set the log level to "Debug" and point its log output to a separate logfile, like */logs/tarmk-coldstandby.log*. For more information, see [Logging](/help/sites-deploying/configure-logging.md).
1. Go to the location of the **standby** instance and start it by running the jar.
1. Create the same logging configuration as for the primary. Then, stop the instance.
1. Next, prepare the standby instance. You can do this by performing the same steps as for the primary instance:

    1. Delete any files that you might have under `aem-standby/crx-quickstart/install`.
    1. Create a folder called `install.standby` under `aem-standby/crx-quickstart/install`

    1. Create two configuration files called:

        * `org.apache.jackrabbit.oak.segment.SegmentNodeStoreService.config`
        * `org.apache.jackrabbit.oak.segment.standby.store.StandbyStoreService.config`

    1. Create a folder called `crx3` under `aem-standby/crx-quickstart/install`

    1. Create the data store configuration and place it under `aem-standby/crx-quickstart/install/crx3`. For this example, the file you must create is:

        * org.apache.jackrabbit.oak.plugins.blob.datastore.FileDataStore.config

    1. Edit the files and create the necessary configurations.

   Below are sample configuration files for a typical standby instance:

   **Sample of org.apache.jackrabbit.oak.segment.SegmentNodeStoreService.config**

   ```xml
   org.apache.sling.installer.configuration.persist=B"false"
   name="Oak-Tar"
   service.ranking=I"100"
   standby=B"true"
   customBlobStore=B"true"
   ```

   **Sample of org.apache.jackrabbit.oak.segment.standby.store.StandbyStoreService.config**

   ```xml
   org.apache.sling.installer.configuration.persist=B"false"
   mode="standby"
   primary.host="127.0.0.1"
   port=I"8023"
   secure=B"false"
   interval=I"5"
   standby.autoclean=B"true"
   ```

   **Sample of org.apache.jackrabbit.oak.plugins.blob.datastore.FileDataStore.config**

   ```xml
   org.apache.sling.installer.configuration.persist=B"false"
   path="./crx-quickstart/repository/datastore"
   minRecordLength=I"16384"
   ```

1. Start the **standby** instance by using the standby run mode:

   ```xml
   java -jar quickstart.jar -r standby,crx3,crx3tar
   ```

The service can also be configured by way of the Web Console, by:

1. Going to the Web Console at: *https://serveraddress:serverport/system/console/configMgr*
1. Looking for a service called **Apache Jackrabbit Oak Segment Tar Cold Standby Service** and double-click it to edit the settings.
1. Saving the settings, and restarting the instances so the new settings can take effect.

>[!NOTE]
>
>You can check the role of an instance at any time by checking the presence of the **primary** or **standby** run modes in the Sling Settings Web Console.
>
>This can be done by going to *https://localhost:4502/system/console/status-slingsettings* and checking the **"Run Modes"** line.

## First-time synchronization {#first-time-synchronization}

After the preparation is complete and the standby is started for the first time, there is heavy network traffic between the instances as the standby catches up to the primary. You can consult the logs to observe the status of the synchronization.

In the standby *tarmk-coldstandby.log*, you can see entries such as these:

```xml
    *DEBUG* [defaultEventExecutorGroup-2-1] org.apache.jackrabbit.oak.segment.standby.store.StandbyStore trying to read segment ec1f739c-0e3c-41b8-be2e-5417efc05266

    *DEBUG* [nioEventLoopGroup-3-1] org.apache.jackrabbit.oak.segment.standby.codec.SegmentDecoder received type 1 with id ec1f739c-0e3c-41b8-be2e-5417efc05266 and size 262144

    *DEBUG* [defaultEventExecutorGroup-2-1] org.apache.jackrabbit.oak.segment.standby.store.StandbyStore got segment ec1f739c-0e3c-41b8-be2e-5417efc05266 with size 262144

    *DEBUG* [defaultEventExecutorGroup-2-1] org.apache.jackrabbit.oak.segment.file.TarWriter Writing segment ec1f739c-0e3c-41b8-be2e-5417efc05266 to /mnt/crx/author/crx-quickstart/repository/segmentstore/data00016a.tar

```

In the standby's *error.log*, you should see an entry such as this:

```xml
*INFO* [FelixStartLevel] org.apache.jackrabbit.oak.segment.standby.store.StandbyStoreService started standby sync with 10.20.30.40:8023 at 5 sec.
```

In the above log snippet, *10.20.30.40* is the IP address of the primary.

In the **primary** *tarmk-coldstandby.log*, you see entries such as these:

```xml
    *DEBUG* [nioEventLoopGroup-3-2] org.apache.jackrabbit.oak.segment.standby.store.CommunicationObserver got message 's.d45f53e4-0c33-4d4d-b3d0-7c552c8e3bbd' from client c7a7ce9b-1e16-488a-976e-627100ddd8cd

    *DEBUG* [nioEventLoopGroup-3-2] org.apache.jackrabbit.oak.segment.standby.server.StandbyServerHandler request segment id d45f53e4-0c33-4d4d-b3d0-7c552c8e3bbd

    *DEBUG* [nioEventLoopGroup-3-2] org.apache.jackrabbit.oak.segment.standby.server.StandbyServerHandler sending segment d45f53e4-0c33-4d4d-b3d0-7c552c8e3bbd to /10.20.30.40:34998

    *DEBUG* [nioEventLoopGroup-3-2] org.apache.jackrabbit.oak.segment.standby.store.CommunicationObserver did send segment with 262144 bytes to client c7a7ce9b-1e16-488a-976e-627100ddd8cd
```

In this case, the "client" mentioned in the log is the **standby** instance.

Once these entries stop appearing in the log, you can safely assume that the syncing process is complete.

While the above entries show that the polling mechanism is functioning properly, it is often useful to understand if there is any data being synchronized as polling is occurring. To do so, look for entries like the following:

```xml
*DEBUG* [defaultEventExecutorGroup-156-1] org.apache.jackrabbit.oak.segment.file.TarWriter Writing segment 3a03fafc-d1f9-4a8f-a67a-d0849d5a36d5 to /<<CQROOTDIRECTORY>>/crx-quickstart/repository/segmentstore/data00014a.tar
```

Also, when running with a non-shared `FileDataStore`, messages like the following confirm that the binary files are being properly transmitted:

```xml
*DEBUG* [nioEventLoopGroup-228-1] org.apache.jackrabbit.oak.segment.standby.codec.ReplyDecoder received blob with id eb26faeaca7f6f5b636f0ececc592f1fd97ea1a9#169102 and size 169102
```

### Configuration {#configuration}

The following OSGi settings are available for the Cold Standby service:

* **Persist Configuration:** if enabled, this stores the configuration in the repository instead of the traditional OSGi configuration files. Adobe recommends that you keep this setting disabled on production systems so that the primary configuration is not pulled by the standby.

* **Mode (`mode`):** this chooses the run mode of the instance.

* **Port (port):** the port to use for communication. The default is `8023`.

* **Primary host (`primary.host`):** - the host of the primary instance. This setting is only applicable for the standby.
* **Sync interval (`interval`):** - this setting determines the interval between sync request and is only applicable for the standby instance.

* **Allowed IP-Ranges (`primary.allowed-client-ip-ranges`):** - the IP ranges that the primary allows connections from.
* **Secure (`secure`):** Enable SSL encryption. To use this setting, it must be enabled on all instances.
* **Standby Read Timeout (`standby.readtimeout`):** Timeout for requests issued from the standby instance in milliseconds. The default value used is 60000 (one minute).

* **Standby Automatic Cleanup (`standby.autoclean`):** Call the cleanup method if the size of the store increases on a sync cycle.

>[!NOTE]
>
>Adobe recommends that the primary and standby have different repository IDs to make them separately identifiable for services like Offloading.
>
>The best way to ensure that this is covered is by deleting *sling.id* on the standby and restarting the instance.

## Failover procedures {#failover-procedures}

In case the primary instance fails for any reason, you can set one of the standby instances to take the role of the primary by changing the start run mode as detailed below:

>[!NOTE]
>
>Edit the configuration files so that they match the settings used for the primary instance.

1. Go to the location where the standby instance is installed, and stop it.

1. In case you have a load balancer configured with the setup, you can remove the primary from the load balancer's configuration at this point.
1. Back up the `crx-quickstart` folder from standby installation folder. It can be used as a starting point when setting up a new standby.

1. Restart the instance using the `primary` run mode:

   ```shell
   java -jar quickstart.jar -r primary,crx3,crx3tar
   ```

1. Add the new primary to the load balancer.
1. Create and start a new standby instance. For more info, see the procedure above on [Creating an AEM TarMK Cold Standby Setup](/help/sites-deploying/tarmk-cold-standby.md#creating-an-aem-tarmk-cold-standby-setup).

## Applying Hotfixes to a Cold Standby Setup {#applying-hotfixes-to-a-cold-standby-setup}

The recommended way to apply hotfixes to a cold standby setup is by installing them to the primary instance and then cloning it into a new cold standby instance with the hotfixes installed.

You can do this by following the steps outlined below:

1. Stop the synchronization process on the cold standby instance by going to the JMX Console and using the **org.apache.jackrabbit.oak: Status ("Standby")**bean. For more information on how to do this, see the section on [Monitoring](#monitoring).
1. Stop the cold standby instance.
1. Install the hotfix on the primary instance. For more details on how to install a hotfix, see [How to Work With Packages](/help/sites-administering/package-manager.md).
1. Test the instance for issues after the installation.
1. Remove the cold standby instance by deleting its installation folder.
1. Stop the primary instance and clone it by performing a file system copy of its entire installation folder to the location of the cold standby.
1. Reconfigure the newly created clone so it acts as a cold standby instance. See [Creating an AEM TarMK Cold Standby Setup.](/help/sites-deploying/tarmk-cold-standby.md#creating-an-aem-tarmk-cold-standby-setup)
1. Start both the primary and the cold standby instances.

## Monitoring {#monitoring}

The feature exposes information using JMX or MBeans. Doing so you can inspect the current state of the standby and the master using the [JMX console](/help/sites-administering/jmx-console.md). The information can be found in an MBean of `type org.apache.jackrabbit.oak:type="Standby"`named `Status`.

**Standby**

Observing a standby instance, you expose one node. The ID is usually a generic UUID.

This node has five read-only attributes:

* `Running:` boolean value indicating whether the sync process is running or not.

* `Mode:` Client: followed by the UUID used to identify the instance. This UUID changes every time the configuration is updated.

* `Status:` a textual representation of the current state (like `running` or `stopped`).

* `FailedRequests:`the number of consecutive errors.
* `SecondsSinceLastSuccess:` the number of seconds since the last successful communication with the server. It displays `-1` if no successful communication has been made.

There are also three invokable methods:

* `start():` starts the sync process.
* `stop():` stops the sync process.
* `cleanup():` runs the cleanup operation on the standby.

**Primary**

Observing the primary exposes some general information by way of a MBean whose ID value is the port number the TarMK standby service is using (8023 by default). Most of the methods and attributes are the same as for the standby, but some differ:

* `Mode:` always shows the value `primary`.

Furthermore information for up to ten clients (standby instances) that are connected to the master can be retrieved. The MBean ID is the UUID of the instance. There are no invokable methods for these MBeans but some useful read-only attributes:

* `Name:` the ID of the client.
* `LastSeenTimestamp:` the timestamp of the last request in a textual representation.
* `LastRequest:` the last request of the client.
* `RemoteAddress:` the IP address of the client.
* `RemotePort:` the port the client used for the last request.
* `TransferredSegments:` the total number of segments transferred to this client.
* `TransferredSegmentBytes:`the total number of bytes transferred to this client.

## Cold Standby Repository Maintenance {#cold-standby-repository-maintenance}

### Revision Cleanup {#revision-clean}

>[!NOTE]
>
>If you run [Online Revision Cleanup](/help/sites-deploying/revision-cleanup.md) on the primary instance, the manual procedure presented below is not needed. Also, if you are using Online Revision Cleanup, the `cleanup ()` operation on the standby instance is performed automatically.

>[!NOTE]
>
>Do not run offline revision cleanup on the standby. It is not needed and it does not reduce the segment store size.

Adobe recommends running maintenance regularly to prevent excessive repository growth over time. To manually perform cold standby repository maintenance, follow the steps below:

1. Stop the standby process on the standby instance by going to the JMX Console and using the **org.apache.jackrabbit.oak: Status ("Standby")** bean. For more info on how to do this, see the above section on [Monitoring](/help/sites-deploying/tarmk-cold-standby.md#monitoring).

1. Stop the primary AEM instance.
1. Run the Oak compaction tool on the primary instance. For more details, see [Maintaining the Repository](/help/sites-deploying/storage-elements-in-aem-6.md#maintaining-the-repository).
1. Start the primary instance.
1. Start the standby process on the standby instance using the same JMX bean as described in the first step.
1. Watch the logs and wait for synchronization to complete. It is possible that substantial growth in the standby repository is seen currently.
1. Run the `cleanup()` operation on the standby instance, using the same JMX bean as described in the first step.

It may take longer than usual for the standby instance to complete synchronization with the primary as offline compaction effectively rewrites the repository history, thus making computation of the changes in the repositories take more time. After this process completes, the size of the repository on the standby is roughly the same size as the repository on the primary.

As an alternative, the primary repository can be copied over to the standby manually after running compaction on the primary, essentially rebuilding the standby each time compaction runs.

### Data Store Garbage Collection {#data-store-garbage-collection}

It is important to run garbage collection on file datastore instances from time to time as otherwise, deleted binaries remain on the filesystem, eventually filling up the drive. To run garbage collection, follow the below procedure:

1. Run cold standby repository maintenance as described in the section [above](/help/sites-deploying/tarmk-cold-standby.md#cold-standby-repository-maintenance).
1. After the maintenance process is completed and the instances restarted:

    * On the primary, run the data store garbage collection by way of the relevant JMX bean as described in [Running Data Store Garbage Collection via the JMX Console](/help/sites-administering/data-store-garbage-collection.md#running-data-store-garbage-collection-via-the-jmx-console).
    * On the standby, the data store garbage collection is available only by way of the **BlobGarbageCollection** MBean - `startBlobGC()`. The **RepositoryManagement** MBean is not available on the standby.

   >[!NOTE]
   >
   >In case you are not using a shared data store, run garbage collection first on primary and then on the standby.

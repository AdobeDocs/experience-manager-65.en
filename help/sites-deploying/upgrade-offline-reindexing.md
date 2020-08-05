---
title: Using Offline re-indexing to reduce downtime during upgrade
description: Learn how to use offline reindexing methodology to reduce the system downtime when performing an AEM upgrade.
contentOwner: sarchiz
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: upgrading
content-type: reference
---

# Using Offline re-indexing to reduce downtime during upgrade {#offline-reindexing-to-reduce-downtime-during-upgrades}

## Introduction {#introduction}

One of the key challenges in upgrading Adobe Experience Manager (AEM) is the downtime associated with the author environment when an in-place upgrade is performed. Content authors will not be able to access the environment during an upgrade and therefore it is desirable to minimize the amount of time it takes to perform the upgrade. For large repositories, especially AEM Assets projects, which typically have large data stores and a high level of asset uploads per hour, re-indexing of Oak indices take a significant percentage of the upgrade.

This section describes how to use the Oak-run tool to re-index the repository **before** performing the upgrade, thus reducing amount of downtime during the actual upgrade. The steps presented can be applied to [Lucene](https://jackrabbit.apache.org/oak/docs/query/lucene.html) indexes for versions AEM 6.4+.

## Overview {#overview}

New version of the AEM product introduce changes to Oak index definitions as feature-set are expanded. Changes to the Oak indices force re-indexing when upgrading the AEM instance. Re-indexing is expensive for asset deployments as text in assets (example – text in pdf) are extracted and indexed. With MongoMK repositories, data is persisted on the network, further increasing the amount of time re-indexing takes.

The problem is how to reduce the downtime window during upgrade. The solution is to **skip** the re-indexing activity during the upgrade. Instead the new indices are pre-created offline **prior** to performing the upgrade and simply imported during the upgrade.

## Approach {#approach}

![offline-reindexing-upgrade-text-extraction](assets/offline-reindexing-upgrade-process.png)

The idea is to pre-create the index before the upgrade, against the index definitions of target AEM version using the [Oak-run](indexing-via-the-oak-run-jar.html) tool. The above diagram shows the offline re-indexing approach.

1. Text from binaries are extracted first.
2. Target index definitions are created.
3. Offline indexes are created.
4. The index are then imported during upgrade process.

### Text Extraction {#text-extraction}

To enable full indexing in AEM, text from binaries such as PDF are extracted and added to the index. Usually, it’s an expensive step in the indexing process. Text extraction is an optimization step advocated especially for re-indexing asset repositories as it stores large number of binaries.

![offline-reindexing-upgrade-text-extraction](assets/offline-reindexing-upgrade-text-extraction.png)

Text from binaries stored in the system can be extracted using OakRun tool with tikka. Clone of the production system can be taken before upgrade and used it for this text extraction process. Text extraction process creates the text store through the following steps.

#### 1. Traverse the repository and gather the details of binaries

Traverse the repository to gather the details of binaries. This produces a CSV containing (path – blob id) tuple of binaries.
Execute the below command from directory (example below assumes repository home). This step generates a CSV having details on blob id of binaries.

```
java java -jar oak-run.jar tika <nodestore path> --fds-path <datastore path> --data-file text-extraction/oak-binary-stats.csv --generate
```

Where `nodestore path` is the `mongo_ur` or `crx-quickstart/repository/segmentstore/`

Use param `--fake-ds-path=temp` instead of `–fds-path` to speed up the process.

#### 2. Re-use the binary text store available in the existing index

Dump index data in the existing system and extract the text store.

Dump existing index data using the following command.

```
java -jar oak-run.jar index <nodestore path> --fds-path=<datastore path> --index-dump
```

Where `nodestore path` is the `mongo_ur` or `crx-quickstart/repository/segmentstore/`

Use the above index dump to populate the store:

```
java -jar oak-run.jar tika --data-file text-extraction/oak-binary-stats.csv --store-path text-extraction/store --index-dir ./indexing-result/index-dumps/<oak-index-name>/data populate
```

Where `oak-index-name` is the name of the full text index - i.e "lucene"

#### 3. Run the text extraction process using tikka library for the binaries missed out in the above step

```
java -cp oak-run.jar:tika-app-1.21.jar org.apache.jackrabbit.oak.run.Main tika --data-file text-extraction/oak-binary-stats.csv --store-path text-extraction/store --fds-path <datastore path> extract
```

Where `datastore path` is the path to the binary data store.

The created text store can be updated and re-used for re-indexing scenarios in the future.

More details around the text extraction process can be seen in the [Oak-run documentation](https://jackrabbit.apache.org/oak/docs/query/pre-extract-text.html).

### Offline Re-indexing {#offline-reindexing}

![offline-reindexing-upgrade-offline-reindexing](assets/offline-reindexing-upgrade-offline-reindexing.png)

Pre-create the Lucene index offline before the upgrade. If using MongoMK, it is recommended to run it directly on one of the MongoMk nodes, as this avoids network overhead.

The following steps are involved in the process of creating the index offline:

#### 1. Generate Oak Lucene Index definitions for the target AEM version

 Dump the existing index definitions. Index definitions which underwent change were generated using Adobe Granite repository bundle of target AEM version and OakRun.

 Dump the index definition from the **source** AEM instance. More details on [dumping index definitions](https://jackrabbit.apache.org/oak/docs/query/oak-run-indexing.html#async-index-data) from Oak documentation.

 ```
java -jar oak-run.jar index --fds-path <datastore path> <nodestore path> --index-definitions
 ```

 Where `datastore path` and `nodestore path` are from the **source** AEM instance.

Generate index definitions from the **target** AEM version using target version's Granite repository bundle.

 ```
java -cp oak-run.jar:bundle-com.adobe.granite.repository.jar org.apache.jackrabbit.oak.index.IndexDefinitionUpdater --in indexing-definitions_source.json --out merge-index-definitions_target.json --initializer com.adobe.granite.repository.impl.GraniteContent
```

>[!NOTE]
>
> The above index definition creation process is supported only from `oak-run-1.12.0` version. Targeting is done using the Granite repository bundle `com.adobe.granite.repository-x.x.xx.jar`.

The above steps create a JSON file (`merge-index-definitions_target.json`) which is the index definition.

#### 2. Create a checkpoint in the repository

Create a checkpoint in the production **source** AEM instance with a long lifetime. This should be done before cloning the repository.

Via OSGi felix console JMX, `<aemsourcehostt>/system/console/jmx`, Go to `CheckpointMBean` and create a checkpoint with a long enough lifetime like 200 days. For this, invoke `CheckpointMBean#createCheckpoint` with `17280000000` as argument for lifetime

Lifetime: 200 days = 17280000000 mill-seconds.

Once done, copy the created checkpoint id and validate the lifetime using JMX `CheckpointMBean#listCheckpoints`.

>[!NOTE]
>
> This checkpoint will be deleted when the index is imported later.

More details on [checkpoint creation](https://jackrabbit.apache.org/oak/docs/query/oak-run-indexing.html#out-of-band-create-checkpoint) from Oak documentation.


#### 3. Perform offline indexing for the generated index definitions

Lucene re-indexing can be done offline using Oak-run. This process creates index data in the disk `indexing-result/indexes`. It does **not** write to the repository and thus does not require stopping the running AEM instance. The created text store is fed into this process.

```
java -Doak.indexer.memLimitInMB=500 -jar oak-run.jar index <nodestore path> --reindex --doc-traversal-mode --checkpoint <checkpoint> --fds-path <datastore path> --index-definitions-file merge-index-definitions_target.json --pre-extracted-text-dir text-extraction/store

Sample <checkpoint> looks like r16c85700008-0-8
—fds-path: path to data store.
--pre-extracted-text-dir: Directory of pre-extracted text.
merge-index-definitions_target: JSON file having merged definitions for the target AEM instance. Indexes in this file will be re-indexed.
```

Usage of `--doc-traversal-mode` parameter is handy with MongoMK installations as improves the re-index time significantly by spooling repository content into a local flat file. However, it requires additional disk space of `2 x size of the repository`.

In case of MongoMK, this process can be accelerated if this step is executed in an instance closer to mongodb. If run on the same machine, network overhead can be avoided.

Additional technical details can be found in the [OakRun documentation for indexing](https://jackrabbit.apache.org/oak/docs/query/oak-run-indexing.html).

### Importing indexes {#importing-indexes}

With AEM 6.4+, AEM has the built-in capability to import indexes from disc on startup sequence. The folder `<repository>/indexing-result/indexes` is watched for the presence of index data during startup. Copy the pre-created index into the above location during the [upgrade process](in-place-upgrade.md#performing-the-upgrade) before starting with the new version of the **target** AEM jar. AEM imports it into the repository and removes the corresponding checkpoint from the system. Thus a re-index is completely avoided.

## Additional tips and troubleshooting {#troubleshooting}

Below are some helpful tips and troubleshooting instructions.

### Reduce impact on the live production system

It is recommended to clone the production system and create the offline index with it. This eliminates any potential impact on the production system. However, the checkpoint required for importing index needs to be present in the production system. Therefore creating a checkpoint before taking the clone is critical.

### Prepare a runbook and trial run

It is recommended to prepare a [runbook](https://docs.adobe.com/content/help/en/experience-manager-65/deploying/upgrading/upgrade-planning.html#building-the-upgrade-and-rollback-runbook) and perform a few trials before running the upgrade in production.

### Doc traversal mode with offline indexing

Offline indexing requires multiple traversal over the entire repository. With MongoMK installations the repository is accessed over the network impacting the performance of the indexing process. One option is to run the offline indexing process in the MongoDb replica machine itself and thus eliminating the network overhead. Another option is usage of doc traversal mode.

Doc traversal mode can be applied by adding the command line parameter `—doc-traversal` to the OakRun command for offline indexing. This mode spools a copy of the entire repository in the local disk as flat file and runs the indexing using it.

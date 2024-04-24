---
title: Oak-run.jar Indexing Use Cases
description: Learn about the various user cases for performing indexing with the Oak-run tool.
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: deploying
noindex: true
exl-id: d25e3070-080a-4594-8fdb-9f09164135fc
solution: Experience Manager, Experience Manager Sites
feature: Deploying
role: Admin
---
# Oak-run.jar Indexing Use Cases{#oak-run-jar-indexing-use-cases}

Oak-run supports indexing use cases on the command line without having to orchestrate the execution of these use cases by way of AEM's JMX console.

The overarching benefits of using the oak-run.jar index command approach for managing Oak indexes are:

1. Oak-run index command  provides  a new indexing toolset for AEM 6.4.
1. Oak-run decreases time-to-reindex which reduces reindex times on larger repositories.
1. Oak-run reduces resource consumption during reindexing in AEM, resulting in overall better system performance.
1. Oak-run provides out-of-band reindexing, supporting situations where production must be available, and cannot tolerate maintenance or downtime otherwise required to reindex.

Sections below would provide sample commands. Oak-run index command supports all NodeStore and BlobStore setups. The examples provided below are around setups having FileDataStore and SegmentNodeStore.

## Use Case 1 - Index Consistency Check {#usercase1indexconsistencycheck}

This is a use case related to index corruption. Sometimes, it was not possible to determine which of the indexes are corrupt. Therefore, Adobe has provided tooling that:

1. Performs index consistency checks on all indexes and provides a report on which indexes are valid and which are not valid;
1. The tooling is usable even if AEM is not accessible;
1. It is easy to use.

Checking for corrupt indexes can be performed by way of `--index-consistency-check` operation:

```shell
java -jar oak-run*.jar index --fds-path=/path/to/datastore  /path/to/segmentstore/ --index-consistency-check
```

This generates a report in `indexing-result/index-consistency-check-report.txt`. See below for a sample report:

```
Valid indexes :
        - /content/oak:index/enablementResourceName
        - /oak:index/cqProjectLucene
        - /oak:index/cqTagLucene
        - /oak:index/lucene
        - /oak:index/ntBaseLucene
        - /oak:index/socialLucene
    Invalid indexes :
        - /oak:index/atDamIndex
        - /oak:index/atIndex
        - /oak:index/cqPageLucene
        - /oak:index/damAssetLucene
        - /oak:index/groups
        - /oak:index/slingeventJob
        - /oak:index/users
        - /oak:index/workflowDataLucene
    Ignored indexes as these are not of type lucene:
        - /oak:index/acPrincipalName
        - /oak:index/active
```

### Benefits {#uc1benefits}

This tooling can now be used by Support and the System Administrator to determine quickly which indexes are corrupt and then reindex them.

## Use Case 2 - Index Statistics {#usecase2indexstatistics}

For diagnosing some of the cases around query performance Adobe often required existing index definition, index-related statistics from the customer setup. So far this information was scattered across multiple resources. To make troubleshooting easier, Adobe has created tooling that will:

1. Dump all index definition present on the system in a single JSON file;

1. Dump important statistics from existing indexes;

1. Dump index contents for offline analysis;

1. Is usable even if AEM is not accessible

The above operations can now be done by way of the following operation index commands:

* `--index-info` - Collects and dumps various statistics related to the indexes

* `--index-definitions` - Collects and dumps index definitions

* `--index-dump` - Dumps index content

See below an example of how the commands work in practice:

```shell
java -jar oak-run*.jar index --fds-path=/path/to/datastore  /path/to/segmentstore/ --index-info --index-definitions --index-dump
```

The reports would be generated in `indexing-result/index-info.txt` and `indexing-result/index-definitions.json`

In addition, same details are provided by way of the Web Console and would be part of the configuration dump zip. They can be accessed at the following location:

`https://serverhost:serverport/system/console/status-oak-index-defn`

### Benefits {#uc2benefits}

This tooling enables the gathering of all required details related to indexing or query issues quickly and reduce the time spent in extracting this information.

## Use Case 3 - Reindexing {#usecase3reindexing}

Depending on the [scenarios](https://jackrabbit.apache.org/oak/docs/query/indexing.html#reindexing), sometimes, reindexing must be performed. Currently, the reindexing is done by setting the `reindex` flag to `true` in the index definition node by way of CRXDE or by way of the Index Manager user interface. After the flag is set, reindexing is done asynchronously.

Some points to note around reindexing:

* Reindexing is lot slower on `DocumentNodeStore` setups compared to `SegmentNodeStore` setups where all content is local;

* With the current design, while reindexing happens, the async indexer is blocked and all other async indexes become stale and do not get updated during indexing. Because of this, if the system is in use, users may not see up-to-date results;
* Reindexing involves traversal of the whole repository which can put a high load on the AEM setup and thus impact end user experience;
* For a `DocumentNodeStore` installation where reindexing might take a considerable amount of time, if the connection to the Mongo database fails in the middle of the operation, indexing would have to be restarted from scratch;

* Sometimes, reindexing can take long time because of text extraction. This is specific for setups that have lots of PDF files, where the time spent on text extraction can impact indexing time.

To meet these objectives, the oak-run index tooling supports different modes for reindexing which can be used as required. The oak-run index command provides following benefits:

* **out-of-band reindexing** - oak-run reindexing can be done separately from a running AEM setup and thus, it minimizes the impact on the AEM instance that is in use;

* **out-of-lane reindexing** - The reindexing takes place without impacting indexing operations. This means that the async indexer can continue to index other indexes;

* **Simplified reindex for DocumentNodeStore installations** - For `DocumentNodeStore` installations, reindexing can be done with a single command which ensures that reindexing is done in the most optimal way;

* **Supports updating index definitions and introducing new index definitions**

### Reindex - DocumentNodeStore {#reindexdocumentnodestore}

For `DocumentNodeStore` installations reindexing can be done by way of a single oak-run command:

```shell
java -jar oak-run*.jar index --reindex --index-paths=/oak:index/lucene --read-write --fds-path=/path/to/datastore mongodb://server:port/aem
```

This provides following benefits

* Minimal impact on running AEM instances. Most of the reads can be done from secondary servers and running AEM caches are not adversely impacted due to all the traversal required for reindexing;
* Users can also provide a JSON of a new or updated index by way of the `--index-definitions-file` option.

### Reindex - SegmentNodeStore {#reindexsegmentnodestore}

For `SegmentNodeStore` installations reindexing can be done in one of the following ways:

#### Online Reindex - SegmentNodeStore {#onlinereindexsegmentnodestore}

Follow the established way where reindexing is done by way of setting `reindex` flag.

#### Online Reindex - SegmentNodeStore - The AEM Instance is Running {#onlinereindexsegmentnodestoretheaeminstanceisrunning}

For `SegmentNodeStore` installations, only one process can access segment files in read-write mode. Due to this, some operations in oak-run indexing require additional manual steps being taken.

This would involve the following:

1. Step text
1. Connect the `oak-run` to the same repository used by AEM in read-only mode and perform indexing. An example of how to achieve this:

   ```shell
   java -jar oak-run-1.7.6.jar index --fds-path=/Users/dhasler/dev/cq/quickstart/target/crx-quickstart/repository/datastore/ --checkpoint 26b7da38-a699-45b2-82fb-73aa2f9af0e2 --reindex --index-paths=/oak:index/lucene /Users/dhasler/dev/cq/quickstart/target/crx-quickstart/repository/segmentstore/
   ```

1. Finally, import the created index files by way of the `IndexerMBean#importIndex` operation from the path where oak-run saved the indexing files after running the above command.

In this scenario, you do not have to stop the AEM server or provision any new instance. However, as indexing involves traversal of the whole repository it would increase the I/O load on the installation, negatively impacting runtime performance.

#### Online Reindex - SegmentNodeStore - The AEM Instance is Shut Down {#onlinereindexsegmentnodestoreaeminstanceisdown}

For `SegmentNodeStore` installations, reindexing can be done by way of a single oak-run command. However, the AEM instance must be shut down.

You can trigger reindexing with the following command:

```shell
java -jar oak-run*.jar index --reindex --index-paths=/oak:index/lucene --read-write --fds-path=/path/to/datastore  /path/to/segmentstore/
```

The difference between this approach and the one explained above is that checkpoint creation and index import are done automatically. The downside is that AEM must be down during the process.

#### Out of Band Reindex - SegmentNodeStore {#outofbandreindexsegmentnodestore}

In this use case, you can perform reindexing on a cloned setup to minimize impact on the running AEM instance:

1. Create checkpoint by way of a JMX operation. You can do this by going to the [JMX Console](/help/sites-administering/jmx-console.md) and search for `CheckpointManager`. Then, click the **createCheckpoint(long p1)** operation using a high value for expiration in seconds (for example, **2592000**).
1. Copy the `crx-quickstart` folder to a new machine
1. Perform reindex by way of oak-run index command

1. Copy the generated index files to AEM server

1. Import the index files by way of JMX.

Under this use case, it is assumed that the Data Store is accessible on another instance which may not be possible if `FileDataStore` is placed on a cloud-based storage solution like EBS. This excludes the scenario where `FileDataStore` is also cloned. If the index definition does not perform fulltext indexing, then access to `DataStore` is not required.

## Use Case 4 - Updating Index Definitions {#usecase4updatingindexdefinitions}

Currently, you can shipping index definition changes by way of [ACS Ensure Index](https://adobe-consulting-services.github.io/acs-aem-commons/features/ensure-oak-index/index.html) package. This allows shipping of the index definitions by way of content package which later requires reindexing to be performed by way of setting the `reindex` flag to `true`.

This works well for smaller installations where reindexing does not take a long time. However, for large repositories, reindexing is done in a considerably larger amount of time. For such cases, we can now use the oak-run index tooling.

Oak-run now supports providing index definitions in JSON format and creation of index in out-of-band mode where no changes are performed on a live instance.

The process to consider for this use case is:

1. A developer would update the index definitions on a local instance and then generate an index definition JSON file by way of the `--index-definitions` option

1. The updated JSON is then given to the System Administrator
1. System Administrator follows the out-of-band approach and prepares the index on a different installation
1. After this is completed, the generated index files are imported on a running AEM installation.

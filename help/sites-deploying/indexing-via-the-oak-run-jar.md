---
title: Indexing via the Oak-run Jar
seo-title: Indexing via the Oak-run Jar
description: Learn how to perform indexing via the Oak-run Jar.
seo-description: Learn how to perform indexing via the Oak-run Jar.
uuid: 09a83ab9-92ec-4b55-8d24-2302f28fc2e4
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: deploying
discoiquuid: c8a505ab-a075-47da-8007-43645a8c3ce5
exl-id: dcec8c1b-13cc-486c-b1a4-62e6eb3184ad
---
# Indexing via the Oak-run Jar {#indexing-via-the-oak-run-jar}

Oak-run supports all indexing use cases on the command line without having to operate from the JMX level. Advantages of the oak-run approach are:

1. It is a new indexing toolset for AEM 6.4
1. It decreases time-to-re-index which beneficially impacts re-index times on larger repositories
1. It is reducing resource consumption during re-indexing in AEM which results in better system performance for other AEM activities
1. Oak-run provides Out-of-band support: If production conditions doesn't allow to run re-index on production instances, a cloned environment can be used for re-indexing to avoid critical performance impact.

Below you will find a list of use cases that can be leveraged when performing indexing operations via the `oak-run` tool.

## Index Consistency Checks {#indexconsistencychecks}

>[!NOTE]
>
>For more detailed information regarding this scenario, see [Use Case 1 - Index Consistency Check](/help/sites-deploying/oak-run-indexing-usecases.md#usercase1indexconsistencycheck).

* `oak-run.jar`quickly determines if Lucene oak indexes are corrupt.
* It is safe to run on an in-use AEM instance for consistency check levels 1 and 2.

![Index Consistency Checks](assets/screen_shot_2017-12-14at135758.png)

## Index Statistics {#indexstatistics}

>[!NOTE]
>
>For more detailed information regarding this scenario, see [Use Case 2 - Index Statistics](/help/sites-deploying/oak-run-indexing-usecases.md#usecase2indexstatistics)

* `oak-run.jar` dumps all index definitions, important index stats and index contents for offline analysis.
* Safe to execute on an in-use AEM instance.

![image2017-12-19_9-47-40](assets/image2017-12-19_9-47-40.png)

## Re-indexing Approach Decision Tree {#reindexingapproachdecisiontree}

This diagram is a decision tree for when to use the various re-indexing approaches.

![oak_-_reindexingwithoak-run](assets/oak_-_reindexingwithoak-run.png)

## Re-indexing MongoMK / RDMBMK {#reindexingmongomk}

>[!NOTE]
>
>For more detailed information regarding this scenario, see [Use Case 3 - Reindexing](/help/sites-deploying/oak-run-indexing-usecases.md#usecase3reindexing).

### Text Pre-extraction for SegmentNodeStore and DocumentNodeStore {#textpre-extraction}

[Text pre-extraction](/help/sites-deploying/best-practices-for-queries-and-indexing.md#how-to-perform-text-pre-extraction) (a feature that has existed with AEM 6.3) can be used to reduce the time to re-index. Text pre-extraction can be used in conjunction with all re-indexing approaches.

Depending on the `oak-run.jar` indexing approach there will be various steps on either side of the Perform Re-index step in the diagram below.

![Text Pre-extraction for SegmentNodeStore and DocumentNodeStore](assets/4.png)

>[!NOTE]
>
>Orange denotes activities where AEM must be in a maintenance window.

### Online re-indexing for MongoMK or RDBMK using oak-run.jar {#onlinere-indexingformongomk}

>[!NOTE]
>
>For more detailed information regarding this scenario, see [Reindex - DocumentNodeStore](/help/sites-deploying/oak-run-indexing-usecases.md#reindexdocumentnodestore).

This is the recommended method for re-indexing MongoMK (and RDBMK) AEM installations. No other method should be used.

This process needs to be executed only against a single AEM instance in the cluster.

![Online re-indexing for MongoMK or RDBMK using oak-run.jar](assets/5.png)

## Re-indexing TarMK {#re-indexingtarmk}

>[!NOTE]
>
>For more detailed information regarding this scenario, see [Reindex - SegmentNodeStore](/help/sites-deploying/oak-run-indexing-usecases.md#reindexsegmentnodestore).

* **Cold Standby considerations (TarMK)**

    * There are no special consideration for Cold Standby; the Cold Standby instances will sync changes as usual.

* **AEM Publish Farms (AE Publish Farms should always be TarMK)**

    * For publish farm it needs to be done for all OR execute the steps on a single publish and then clone the setup for others (taking all the usual precations when cloning AEM instances; sling.id - should link to something here)

### Online Re-Indexing for TarMK {#onlinere-indexingfortarmk}

>[!NOTE]
>
>For more detailed information regarding this scenario, see [Online Reindex - SegmentNodeStore](/help/sites-deploying/oak-run-indexing-usecases.md#onlinereindexsegmentnodestore).

This is the method used before the introduction of the new indexing capabilities of oak-run.jar. It can done by setting the `reindex=true` property on the Oak index.

This approach can be used if the time and performance effects to index are acceptable to the customer. This is often the case for small to medium sized AEM installations.

![Online Re-Indexing for TarMK](assets/6.png)

### Online Re-Indexing TarMK using oak-run.jar {#onlinere-indexingtarmkusingoak-run-jar}

>[!NOTE]
>
>For more detailed information regarding this scenario, see [Online Reindex - SegmentNodeStore - The AEM Instance is Running](/help/sites-deploying/oak-run-indexing-usecases.md#onlinereindexsegmentnodestoretheaeminstanceisrunning).

Online re-indexing of TarMK using the oak-run.jar is faster than the [Online Re-Indexing for TarMK](#onlinere-indexingfortarmk) described above. However, it also requires execution during a maintenance window; with the mention that the window will be shorter, and more steps are required to perform the re-indexing.

>[!NOTE]
>
>Orange denotes operations where AEM must be performed in a maintenance period.

![Online Re-Indexing TarMK using oak-run.jar](assets/7.png)

### Offline Re-Indexing TarMK using oak-run.jar {#offlinere-indexingtarmkusingoak-run-jar}

>[!NOTE]
>
>For more detailed information regarding this scenario, see [Online Reindex - SegmentNodeStore - The AEM Instance is Shut Down](/help/sites-deploying/oak-run-indexing-usecases.md#onlinereindexsegmentnodestoreaeminstanceisdown).

Offline re-indexing of TarMK is the simplest `oak-run.jar` based re-indexing approach for TarMK as it requires a single `oak-run.jar` comment. However, it requires the AEM instance to be shutdown.

>[!NOTE]
>
>Red denotes operations where AEM must be shut down.

![Offline Re-Indexing TarMK using oak-run.jar](assets/8.png)

### Out-of-band Re-Indexing TarMK using oak-run.jar  {#out-of-bandre-indexingtarmkusingoak-run-jar}

>[!NOTE]
>
>For more detailed information regarding this scenario, see [Out of Band Reindex - SegmentNodeStore](/help/sites-deploying/oak-run-indexing-usecases.md#outofbandreindexsegmentnodestore).

Out-of-band re-indexing minimizes the impact of re-indexing on in-use AEM instances.

>[!NOTE]
>
>Red denotes operations where AEM may be shut down.

![Out-of-band Re-Indexing TarMK using oak-run.jar](assets/9.png)

## Updating Indexing Definitions {#updatingindexingdefinitions}

>[!NOTE]
>
>For more detailed information about this scenario, see [Use Case 4 - Updating Index Definitions](/help/sites-deploying/oak-run-indexing-usecases.md#usecase4updatingindexdefinitions).

### Creating and Updating index definitions on TarMK using ACS Ensure Index {#creatingandupdatingindexdefinitionsontarmkusingacsensureindex}

>[!NOTE]
>
>ACS Ensure Index is a community supported project, and is not supported by Adobe Support.

This allows shipping index definition via content package which later results in re-indexing via setting the re-index flag to `true`. This works for smaller setups where re-indexing does not take long time.

For more info, see the [ACS Ensure Index documentation](https://adobe-consulting-services.github.io/acs-aem-commons/features/ensure-oak-index/index.html) for details.

### Creating and Updating index definitions on TarMK using oak-run.jar {#creatingandupdatingindexdefinitionsontarmkusingoak-run-jar}

If the time or performance impact of re-indexing using non `oak-run.jar` methods is too high, the following `oak-run.jar` based approach can be used to import and re-index Lucene Index definitions in a TarMK based AEM installation.

![Creating and Updating index definitions on TarMK using oak-run.jar](assets/10.png)

### Creating and Updating Index Definitions on MonogMK using oak-run.jar {#creatingandupdatingindexdefinitionsonmonogmkusingoak-run-jar}

If the time or performance impact of re-indexing using non `oak-run.jar` methods is too high, the following `oak-run.jar` based approach can be used to import and re-index Lucene Index definitions in MongoMK based AEM installations.

![Creating and Updating Index Definitions on MonogMK using oak-run.jar](assets/11.png)

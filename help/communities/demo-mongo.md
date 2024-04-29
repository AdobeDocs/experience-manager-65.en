---
title: How to set up MongoDB for Demo
description: How to set up MSRP for one author instance and one publish instance
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference

role: Admin
exl-id: 7e257b34-a0f5-47db-b1a9-e26333c287d9
solution: Experience Manager
feature: Communities
---
# How to set up MongoDB for Demo {#how-to-setup-mongodb-for-demo}

## Introduction {#introduction}

This tutorial describes how to set up [MSRP](msrp.md) for *one author* instance and *one publish* instance.

With this setup, the community content is accessible from both author and publish environments without needing to forward or reverse replicate user-generated content (UGC).

This configuration is suitable for *non-production* environments such as for development and/or demonstration.

**A *production* environment should:**

* Run MongoDB with a replica set
* Use SolrCloud
* Contain multiple publisher instances

## MongoDB {#mongodb}

### Install MongoDB {#install-mongodb}

* Download MongoDB from [https://www.mongodb.com/](https://www.mongodb.com/)

  * Choice of OS:

    * Linux&reg;
    * Mac 10.8
    * Windows 7

  * Choice of version:

    * At a minimum, use version 2.6

* Basic configuration

  * Follow the MongoDB install instructions.
  * Configure for mongod:

    * No need to configure mongos or sharding.

  * The installed MongoDB folder is called &lt;mongo-install&gt;.
  * The defined data directory path is called &lt;mongo-dbpath&gt;.

* MongoDB may run on same host as AEM or run remotely.

### Start MongoDB {#start-mongodb}

* &lt;mongo-install&gt;/bin/mongod --dbpath &lt;mongo-dbpath&gt;

This starts a MongoDB server using default port 27017.

* For Mac, increase ulimit with start arg 'ulimit -n 2048'

>[!NOTE]
>
>If MongoDB is started *after* AEM, **restart** all **AEM** instances so they properly connect to MongoDB.

### Demo Production Option: Setup MongoDB Replica Set {#demo-production-option-setup-mongodb-replica-set}

The following commands are an example of setting up a replica set with 3 nodes on localhost:

* `bin/mongod --port 27017 --dbpath data --replSet rs0&`
* `bin/mongo`

  * `cfg = {"_id": "rs0","version": 1,"members": [{"_id": 0,"host": "127.0.0.1:27017"}]}`
  * `rs.initiate(cfg)`

* `bin/mongod --port 27018 --dbpath data1 --replSet rs0&`
* `bin/mongod --port 27019 --dbpath data2 --replSet rs0&`
* `bin/mongo`

  * `rs.add("127.0.0.1:27018")`
  * `rs.add("127.0.0.1:27019")`
  * `rs.status()`

## Solr {#solr}

### Install Solr {#install-solr}

* Download Solr from [Apache Lucene](https://archive.apache.org/dist/lucene/solr/):

  * Suitable for any OS.
  * Solr version 7.0.
  * Solr requires Java&trade; 1.7 or greater.

* Basic configuration

  * Follow 'example' Solr setup.
  * No service is needed.
  * The installed Solr folder is called &lt;solr-install&gt;.

### Configure Solr for AEM Communities {#configure-solr-for-aem-communities}

To configure a Solr collection for MSRP for demo, there are two decisions to be made (select the links to main documentation for details):

1. Run Solr in standalone or [SolrCloud mode](msrp.md#solrcloudmode).
1. Install [standard](msrp.md#installingstandardmls) or [advanced](msrp.md#installingadvancedmls) multilingual search (MLS).

### Standalone Solr {#standalone-solr}

The method for running Solr may differ depending on the version and manner of installation. The [Solr reference guide](https://archive.apache.org/dist/lucene/solr/ref-guide/) is the authoritative documentation.

For simplicity, using version 4.10 as an example, start Solr in standalone mode:

* cd to &lt;solrinstall&gt;/example
* Java&trade; -jar start.jar

This process starts a Solr HTTP server using default port 8983. You can browse to the Solr Console to get a Solr console for testing.

* default Solr console: [http://localhost:8983/solr/](http://localhost:8983/solr/)

>[!NOTE]
>
>If Solr Console is not available, check the logs under &lt;solrinstall&gt;/example/logs. Look to see if SOLR is trying to bind to a specific hostname that cannot be resolved (for example, "user-macbook-pro").
>
>If so, update `etc/hosts` file with a new entry for this hostname (for example, 127.0.0.1 user-macbook-pro) to star Solr properly.

### SolrCloud {#solrcloud}

To run a basic (not production) solrCloud setup, start solr with:

* `java -Dbootstrap_confdir=./solr/collection1/conf -Dbootstrap_conf=true -DzkRun -jar start.jar`

## Identify MongoDB as Common Store {#identify-mongodb-as-common-store}

Launch the author and publish AEM instances, if necessary.

If AEM was running before MongoDB was started, then the AEM instances must be restarted.

Follow the instructions on the main documentation page: [MSRP - MongoDB Common Store](msrp.md)

## Test {#test}

To test and verify the MongoDB common store, post a comment on the publish instance and view it on the author instance, and view the UGC in MongoDB and Solr:

1. On the publish instance, browse to the [Community Components Guide](http://localhost:4503/content/community-components/en/comments.html) page and select the Comments component.
1. Sign in to post a comment:
1. Enter text in the comment text entry box and click **[!UICONTROL Post]**

   ![post-comment](assets/post-comment.png)

1. Simply view the comment on the [author instance](http://localhost:4502/content/community-components/en/comments.html) (likely still signed in as admin / admin).

   ![view-comment](assets/view-comment.png)

   Note: While there are JCR nodes under the *asipath* on author, these nodes are for the SCF framework. The actual UGC is not in JCR, it is in the MongoDB.

1. View the UGC in mongodb **[!UICONTROL Communities]** > **[!UICONTROL Collections]** > **[!UICONTROL Content]**

   ![ugc-content](assets/ugc-content.png)

1. View the UGC in Solr:

   * Browse to Solr dashboard: [http://localhost:8983/solr/](http://localhost:8983/solr/).
   * User `core selector` to select `collection1`.
   * Select `Query`.
   * Select `Execute Query`.

   ![ugc-solr](assets/ugc-solr.png)

## Troubleshooting {#troubleshooting}

### No UGC Appears {#no-ugc-appears}

1. Make sure MongoDB is installed and running properly.

1. Make sure that MSRP has been configured to be the default provider:

   * On all author and publish AEM instances, revisit the [Storage Configuration console](srp-config.md), or check the AEM repository:

   * In JCR, if [/etc/socialconfig](http://localhost:4502/crx/de/index.jsp#/etc/socialconfig/) does not contain an [srpc](http://localhost:4502/crx/de/index.jsp#/etc/socialconfig/srpc) node, it means that the storage provider is JSRP.
   * If the srpc node exists and contains node [defaultconfiguration](http://localhost:4502/crx/de/index.jsp#/etc/socialconfig/srpc/defaultconfiguration), the defaultconfiguration's properties should define MSRP to be the default provider.

1. Make sure that AEM was restarted after MSRP selected.

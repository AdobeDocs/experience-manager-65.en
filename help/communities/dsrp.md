---
title: DSRP - Relational Database Storage Resource Provider
seo-title: DSRP - Relational Database Storage Resource Provider
description: Set up AEM Communities to use a relational database as its common store
seo-description: Set up AEM Communities to use a relational database as its common store
uuid: f364e7da-ee54-4ab2-a630-7ec9239005ac
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
discoiquuid: d23acb18-6761-4290-9e7a-a434582791bd
role: Admin
exl-id: 15b3a594-efde-4702-9233-232ba1c7e5b0
---
# DSRP - Relational Database Storage Resource Provider {#dsrp-relational-database-storage-resource-provider}

## About DSRP {#about-dsrp}

When AEM Communities is configured to use a relational database as its common store, user generated content (UGC) is accessible from all author and publish instances without the need for synchronization nor replication.

See also [Characteristics of SRP Options](working-with-srp.md#characteristics-of-srp-options) and [Recommended Topologies](topologies.md).

## Requirements {#requirements}

* [MySQL](#mysql-configuration), a relational database.
* [Apache Solr](#solr-configuration), a search platform.

>[!NOTE]
>
>The default storage configuration is now stored in conf path(`/conf/global/settings/community/srpc/defaultconfiguration`) instead of etc path (`/etc/socialconfig/srpc/defaultconfiguration`). You are advised to follow the [migration steps](#zerodt-migration-steps) to make defaultsrp work as expected.

## Relational Database Configuration {#relational-database-configuration}

### MySQL Configuration {#mysql-configuration}

A MySQL installation may be shared between enablement features and common store (DSRP) within the same connections pool by using different database (schema) names and also different connections (server:port).

For installation and configuration details, see [MySQL Configuration for DSRP](dsrp-mysql.md).

### Solr Configuration {#solr-configuration}

A Solr installation may be shared between the node store (Oak) and common store (SRP) by using different collections.

If both the Oak and SRP collections are used intensively, a second Solr may be installed for performance reasons.

For production environments, SolrCloud mode provides improved performance over standalone mode (a single, local Solr setup).

For installation and configuration details, see [Solr Configuration for SRP](solr.md).

### Select DSRP {#select-dsrp}

The [Storage Configuration console](srp-config.md) allows for the selection of the default storage configuration, which identifies which implementation of SRP to use.

On author, to access the Storage Configuration console

* Sign in with administrator privileges
* From the **main menu**

  * Select **[!UICONTROL Tools]** (from the left hand pane)
  * Select **[!UICONTROL Communities]**
  * Select **[!UICONTROL Storage Configuration]**

    * As an example, the resulting location is: [http://localhost:4502/communities/admin/defaultsrp](http://localhost:4502/communities/admin/defaultsrp)
    
    >[!NOTE]
    >
    >The default storage configuration is now stored in conf path(`/conf/global/settings/community/srpc/defaultconfiguration`)      instead of etc path (`/etc/socialconfig/srpc/defaultconfiguration`). You are advised to follow the [migration steps](#zerodt-migration-steps) to make defaultsrp work as expected.

   ![dsrp-config](assets/dsrp-config.png)

* Select **[!UICONTROL Database Storage Resource Provider (DSRP)]**
* **Database Configuration**

  * **[!UICONTROL JDBC datasource name]**

    Name given to MySQL connection must be the same as entered in [JDBC OSGi configuration](dsrp-mysql.md#configurejdbcconnections)

    *default*: communities

   * **[!UICONTROL Database name]**

     Name given to schema in [init_schema.sql](dsrp-mysql.md#obtain-the-sql-script) script

      *default*: communities

* **SolrConfiguration**

  * **[Zookeeper](https://cwiki.apache.org/confluence/display/solr/Using+ZooKeeper+to+Manage+Configuration+Files) Host**

    Leave this value blank if running Solr using the internal ZooKeeper. Else, when running in [SolrCloud mode](solr.md#solrcloud-mode) with an external ZooKeeper, set this value to the URI for the ZooKeeper, such as *my.server.com:80*

    *default*: *&lt;blank&gt;*

  * **[!UICONTROL Solr URL]**

    *default*: https://127.0.0.1:8983/solr/

  * **[!UICONTROL Solr Collection]**

    *default*: collection1

* Select **[!UICONTROL Submit]**.

### Zero downtime migration steps for defaultsrp {#zerodt-migration-steps}

Follow these steps to ensure that the defaultsrp page [http://localhost:4502/communities/admin/defaultsrp](http://localhost:4502/communities/admin/defaultsrp) works as expected:

1. Rename the path at `/etc/socialconfig` to `/etc/socialconfig_old`, so that system configuration falls back to jsrp(default).
1. Go to defaultsrp page [http://localhost:4502/communities/admin/defaultsrp](http://localhost:4502/communities/admin/defaultsrp), where jsrp is configured. Click the **[!UICONTROL submit]** button so that new default configuration node is created at `/conf/global/settings/community/srpc`.
1. Delete the created default configuration `/conf/global/settings/community/srpc/defaultconfiguration`.
1. Copy the old configuration `/etc/socialconfig_old/srpc/defaultconfiguration` in place of the deleted node (`/conf/global/settings/community/srpc/defaultconfiguration`) in the previous step.
1. Delete the old etc node `/etc/socialconfig_old`.

## Publishing the Configuration {#publishing-the-configuration}

DSRP must be identified as the common store on all author and publish instances.

To make the identical configuration available in the publish environment:

* On author:

  * Navigate from main menu to **[!UICONTROL Tools]** > **[!UICONTROL Operations]** > **[!UICONTROL Replication]**
  * Double-click **[!UICONTROL Activate Tree]**
  * **Start Path**:

    * Browse to `/etc/socialconfig/srpc/`

  * Ensure `Only Modified` is not selected.
  * Select **[!UICONTROL Activate]**.

## Managing User Data {#managing-user-data}

For information regarding *users*, *user profiles* and *user groups*, often entered in the publish environment, visit:

* [User Synchronization](sync.md)
* [Managing Users and User Groups](users.md)

## Reindexing Solr for DSRP {#reindexing-solr-for-dsrp}

To reindex DSRP Solr, follow the documentation for [reindexing MSRP](msrp.md#msrp-reindex-tool), however when reindexing for DSRP, use this URL instead: **/services/social/datastore/rdb/reindex**

For example, a curl command to re-index DSRP would look like this:

```shell
curl -u admin:password -X POST -F path=/ https://host:port/services/social/datastore/rdb/reindex
```

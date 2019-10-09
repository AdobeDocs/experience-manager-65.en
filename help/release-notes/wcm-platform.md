---
title: AEM Foundation & Repository
seo-title: AEM Foundation & Repository
description: Release notes specific to Adobe Experience Manager 6.3 AEM Platform and Repository.
seo-description: Release notes specific to Adobe Experience Manager 6.3 AEM Platform and Repository.
uuid: 147b38d0-cf87-467c-a52d-3399d4af7e6e
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4
topic-tags: release-notes
content-type: reference
discoiquuid: e5dd9d0d-6d67-4430-aeb3-2be91356f624
---

# AEM Foundation & Repository {#aem-foundation-repository}

## List of changes {#list-of-changes}

### Repository {#repository}

* Oak Segment Tar MicroKernel

    * Fast compaction mode (tail compaction) for Online Revision Cleanup 
    * Improved write rates
    * Segment operations stats exposed via JMXBean
    * Duration estimate for Offline Revision Cleanup

* Oak Mongo Microkernel

    * Continuous Revision Cleanup for MongoMK replaces scheduled cleanup maintenance

* Improved efficiency for Revision Cleanup on Document Nodestores
* Please see [Apache Jackrabbit Oak Jira v. 1.8.0](https://archive.apache.org/dist/jackrabbit/oak/1.8.0/RELEASE-NOTES.txt), [Apache Jackrabbit Oak Jira v. 1.8.1](https://archive.apache.org/dist/jackrabbit/oak/1.8.1/RELEASE-NOTES.txt) and [Apache Jackrabbit Oak Jira v. 1.8.2](https://archive.apache.org/dist/jackrabbit/oak/1.8.2/RELEASE-NOTES.txt) for a full overview of fixed issues.

>[!CAUTION]
>
>* The new version of the Oak Segment Tar present since AEM 6.3 requires a repository migration. This step is mandatory if you are upgrading from an older version of TarMK or want to switch the new Segment Tar from another type of persistence. For more information on what the benefits of the new Segment Tar are, see the [Migrating to Oak Segment Tar FAQ](/help/sites-deploying/revision-cleanup.md#migrating-to-oak-segment-tar).
>

### Search &amp; Indexing {#search-amp-indexing}

* Enhanced support for Indexing Oerations via oak-run (CLI):

    * Index consistency check
    * Indexing statistics
    * Index configuration Im/Export
    * Reindexing

* Reduced Lucene related repository growth for an overall improved system performance
* Synchronous Lucene Property Indexes [(More infos)](https://wiki.apache.org/jackrabbit/Synchronous%20Lucene%20Property%20Indexes)
* Explain Query in Index Manager supports now AEM QueryBuilder syntax
* Index Manager is now exposing index metrics: size, last updated & consistency check

### User Interface {#user-interface}

* Various enhancements have been made to the UI to make it more productive an easier to use.
* New Content Tree rail to quickly navigate a hierarchy. In combination with the list view, this restores the Classic UI interaction model.
* Improved scrolling in card and list view of large folders. 
* Improved interaction with the search results - the back button restores the prior search result.
* Additional keyboard shortcuts, for most common actions, such as to open a particular rail, to edit, move and delete item, or to open properties.
* Ability to disable keyboard shortcuts (enable/disable in Preferences). 
* Stop showing time stamps across all UI relative after 7 days (set default in Preferences).

>[!CAUTION]
>
>* Adobe does not plan to make further enhancements to the Classic UI. AEM 6.4 has the Classic UI included, and customers upgrading from earlier releases can keep using it as is. Note that Classic UI remains fully supported while being deprecated [Read more](/help/sites-deploying/ui-recommendations.md).
>

### Content Distribution {#content-distribution}

* Improved replication performance to support large volume asset publishes
* Support OAuth 2.0 authentication in Distribution transport
* Improved performance for VLT packages

### Monitoring {#monitoring}

* A new System Overview provides a snapshot view on all performance-related system status & activities 
* New Health Checks:

    * Detect large Lucene indexes
    * Async indexing health
    * Large Lucene Indexes
    * Query Performance
    * Query Traversal Limits
    * Synchronized Clocks
    * System Maintenance - Revision Cleanup
    * System Maintenance - DataStore GC
    * System Maintenance - Continuous Revision GC

* User can now define the scope of the status.zip download

### Maintenance {#maintenance}

* Active deletion of Lucene binaries using a maintenance task
* RevisionGC maintenance task for MongoDB is now disabled in favor of Continuous Revision Cleanup, please see the Repository section above.  
* Version Purge configuration allows retaining a minimum number of versions  
* Version Purge stops at the end of a maintenance window. It can also be started and stopped manually and it will continue incrementally with the next start.

### Upgrade {#upgrade}

* Backward Compatibility: Backward compatible features in 6.4, helps your custom code remain compatible in most cases and reduces upgrade effort.
* Upgrade Complexity Assessment: New Pattern detector tool to assess the complexity of your upgrades.
* Sustainable Upgrades: API surface and Content Classification introduced to help you easily follow best practices for an efficient and seamless upgrade to the next version throughout your development cycle.
* Repository Restructuring: Significant restructuring (primarily /etc) to facilitate easier upgrades and promote implementation best practices. [Read more.](/help/sites-deploying/repository-restructuring.md)
* Please see the [Upgrade documentation](/help/sites-deploying/upgrade.md) for more details on these features.

### Cloud Services {#cloud-services}

* Many Cloud Services are now configurable via Touch UI; the remaining can be configured under the Legacy Cloud Services card.
* Sites and Assets folders can be configured with Cloud Services that are loaded in a context aware manner.

### Security {#security}

* Enhanced and simplified user creation UI with support for multiple user profiles.
* Improved performance for large group memberships for users.

### Projects and Workflows {#projects-and-workflows}

* Touch UI based Workflow Editor to manage workflow models in a more streamlined manner.
* Support for project task purge in maintenance tasks.


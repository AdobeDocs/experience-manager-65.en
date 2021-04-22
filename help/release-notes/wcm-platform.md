---
title: AEM Foundation and repository
description: Release notes for Adobe Experience Manager platform and repository.
exl-id: 06938419-392b-432d-ba0c-ba444b3e141c
---
# AEM Foundation and repository {#aem-foundation-repository}

## List of changes {#list-of-changes}

### Repository {#repository}

* The foundation of Adobe Experience Manager 6.5 build on top of updated versions of the OSGi-based framework (Apache Sling and Apache Felix) and the Java Content Repository: Apache Jackrabbit Oak 1.10.2.
* For an overview of fixed issues, see [Apache Jackrabbit Oak Jira v. 1.10.0](https://archive.apache.org/dist/jackrabbit/oak/1.10.0/RELEASE-NOTES.txt), [Apache Jackrabbit Oak Jira v. 1.10.1](https://archive.apache.org/dist/jackrabbit/oak/1.10.1/RELEASE-NOTES.txt) and [Apache Jackrabbit Oak Jira v. 1.10.2](https://archive.apache.org/dist/jackrabbit/oak/1.10.2/RELEASE-NOTES.txt).

>[!CAUTION]
>
>The new version of the Oak Segment Tar present since AEM 6.3 requires a repository migration. This step is mandatory if you are upgrading from an older version of TarMK or want to switch the new Segment Tar from another type of persistence. For more information on what the benefits of the new Segment Tar are, see the [Migrating to Oak Segment Tar FAQ](/help/sites-deploying/revision-cleanup.md#migrating-to-oak-segment-tar).

### Java Support {#java-support}

* New support for Java 11, as well as the already supported Java 8.
* For optimal performance, override default GC values with other values. For more information, please see the [Install & Update](/help/sites-deploying/custom-standalone-install.md) section.
* Java 11 and Java 8 maintenance updates are distributed by Adobe for customer usage in AEM-related projects, when not publicly available from Oracle.

### OSGI {#osgi}

* Added OSGi Promises and Converter utility libraries.

### Projects and Workflows {#projects-and-workflows}

* New Workflow Model editor introduced in 6.4 has been improved to include more operations like Copy and Publish, Variable support in Workflow steps and enhanced `OR` and `AND` splits.

### Search {#searching}

* Search in Oak now supports dynamic facets. For example, the filter rail in assets search show the estimated amount of results.
* QueryBuilder was extended to provide results with dynamic facets.

### Security {#security}

* Added Password expiry for admin user.

### User Interface {#user-interface}

Various enhancements have been made to the UI to make it more productive and easier to use.

* AEM 6.5 introduces new Permissions Management UI for Users and Groups that makes it easier to view and configure the entire set of privileges and restrictions without the need to go to CRXDE.
* Column Views now also only loads entries that are visible on the screen and only loads more when the user is starting to scroll. List and Card view already did that since 6.0 (improved in 6.4).
* Column Views now include the workflow status for pages/assets when applicable.
* The Select All action is a quick way to execute an action with all pages/assets in the same folder.
* The Select All action attempts to perform the action to all pages/assets, not just what has been loaded. If the action is not upgraded to handle Bulk Actions, a warning is displayed.

>[!CAUTION]
>
>Adobe will not make further enhancements to the Classic UI. Experience Manager 6.5 includes Classic UI for backward compatibility. Classic UI remains fully supported while being deprecated [Read more](/help/sites-deploying/ui-recommendations.md).

### Upgrade {#upgrade}

* The upgrade procedure largely remains the same in 6.5.
* We continue to support the Backward Compatibility , Upgrade Complexity Assessment and Sustainable Upgrades features introduced in 6.4. There have been version specific updates made to these areas where needed.
* The Pattern Detector packaging has been simplified, and there will be one package assessing upgrades to 6.5 for the available source versions.
* For details about upgrade procedure, see the [upgrade documentation](/help/sites-deploying/upgrade.md).

### Web Server {#web-server}

* The Quickstart distribution uses Eclipse Jetty 9.4.15 as servlet engine (AEM 6.4 shipped with 9.3.22).

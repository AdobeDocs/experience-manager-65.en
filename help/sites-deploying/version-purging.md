---
title: Version Purging
seo-title: Version Purging
description: This article describes the available options for version purging.
seo-description: This article describes the available options for version purging.
uuid: a9fa25c7-e60e-4665-a726-99af9aac8f70
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: configuring
content-type: reference
discoiquuid: fb4d7337-7b94-430b-80d2-f1754f823c2b
docset: aem65

feature: Configuring
exl-id: 6f0b1951-bdda-475f-b6c0-bc18de082b7c
---
# Version Purging{#version-purging}

In a standard installation AEM creates a new version of a page or node when you activate a page after updating the content.

>[!NOTE]
>
>If no content changes are made then you will see the message stating that the page has been activated, but no new version will be created

You can create additional versions on request using the **Versioning** tab of the sidekick. These versions are stored in the repository and can be restored if required.

These versions are never purged, so the repository size will grow over time and therefore need to be managed.

AEM is shipped with various mechanisms to help you manage your repository:

* the [Version Manager](#version-manager)
  This can be configured to purge old versions when new versions are created.

* the [Purge Versions](/help/sites-deploying/monitoring-and-maintaining.md#purgeversionstool) tool
  This is used as part of monitoring and maintaining your repository.
  It lets you intervene to remove old versions of a node, or a hierarchy of nodes, according to these parameters:

    * The maximum number of versions to be kept in the repository.
      When this number is exceeded, the oldest version is removed.

    * The maximum age of any version kept in the repository.
      When the age of a version exceeds this value, it is purged from the repository.

* the [Version Purge maintenance task](/help/sites-administering/operations-dashboard.md#automated-maintenance-tasks). You can schedule the Version Purge maintenance task to delete old versions automatically. As a result, this minimizes the need to manually use the Version Purge tools.

>[!CAUTION]
>
>In order to optimize the repository size you should run the version purge task frequently. The task should be scheduled outside of business hours when there is a limited amount of traffic.

## Version Manager {#version-manager}

In addition to explicit purging by using the purge tool, the Version Manager can be configured to purge old versions when new versions are created.

To configure the Version Manager, [create a configuration](/help/sites-deploying/configuring-osgi.md) for:

`PID com.day.cq.wcm.core.impl.VersionManagerImpl`

The following options are available:

* `versionmanager.createVersionOnActivation` (Boolean, default: true)
  Specifies whether to create a version when pages are activated.
  A version is created unless the replication agent is configured to suppress the creation of versions, which is honoured by the Version Manager.
  A version is created only if the activation happens on a path that is contained in `versionmanager.ivPaths` (see below).

* `versionmanager.ivPaths`(String[], default: `{"/"}`)
  Specifies the paths on which versions are implicitly created on activation if `versionmanager.createVersionOnActivation` is set to true.

* `versionmanager.purgingEnabled` (Boolean, default: false)
  Defines whether or not to enable purging when new versions are created.

* `versionmanager.purgePaths` (String[], default: {"/content"})
  Specifies on which paths to purge versions when new versions are created.

* `versionmanager.maxAgeDays` (int, default: 30)
  On version purge, any version older than the configured value will be removed. If the value is less than 1, purging will not be performed based on the age of the version.

* `versionmanager.maxNumberVersions` (int, default 5)
  On version purge, any version older than the n-th newest version will be removed. If the value is less than 1, purging is not performed based on the number of versions.

* `versionmanager.minNumberVersions` (int, default 0)
  The minimum number of versions that will be kept regardless of the age. If the value is set to a value less than 1 no minimum number of versions is retained.

>[!NOTE]
>
>It is not recommended to keep a large number of versions in the repository. So, when configuring the version purge operation be mindful not exclude too many versions from the purge otherwise the repository size will not be properly optimized. If you keep a large number versions due to business requirements, please contact Adobe support to find alternative ways of optimizing the repository size.

### Combining Retention Options {#combining-retention-options}

The options defining how which versions should be retained ( `maxAgeDays`, `maxNumberVersions`, `minNumberVersions`), can be combined depending on your requirements.

For example, when defining the maximum number of versions to retain AND the oldest version to retain:

* Setting:

    * `maxNumberVersions` = 7

    * `maxAgeDays` = 30

* With:

    * 10 versions made within the past 60 days
    * 3 of those versions created within the past 30 days

* Will mean that:

    * The last 3 versions will be retained

For example, when defining the maximum AND minimum number of versions to retain AND the oldest version to retain:

* Setting:

    * `maxNumberVersions` = 3
    * `maxAgeDays` = 30
    * `minNumberVersions` = 3

* With:

    * 5 versions made 60 days ago

* Will mean that:

    * 3 versions will be retained

## Purge Versions Tool {#purge-versions-tool}

The [Purge Versions](/help/sites-deploying/monitoring-and-maintaining.md#purgeversionstool) tool is intended for purging the versions of a node or a hierarchy of nodes in your repository. Its primary purpose is to help you reduce the size of your repository by removing old versions of your nodes.

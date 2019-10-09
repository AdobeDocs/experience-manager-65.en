---
title: CRX2OAK Migration Tool
seo-title: CRX2OAK Migration Tool
description: Release notes specific to the Adobe Experience Manager 6.4 CRX2OAK Migration tool.
seo-description: Release notes specific to the Adobe Experience Manager 6.4 CRX2OAK Migration tool.
uuid: 1b582faf-2dc6-41a2-9419-7e82347f9d6c
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4
topic-tags: release-notes
content-type: reference
discoiquuid: cfdaceac-a5b3-4070-ad4c-f1457b1e2e4b
---

# CRX2OAK Migration Tool {#crx-oak-migration-tool}

## List of Changes and Fixes {#list-of-changes-and-fixes}

### 1.8.6 (June 2018) {#june}

* OAK-7339 Fix all sidegrades breaking with UnsupportedOperationException on MissingBlobStore by introducing LoopbackBlobStore
* Use Oak 1.8.4

### 1.8.4 (April 2018) {#april}

* Use Oak version 1.8.2
* GRANITE-18104 Repo migration error from 6.3 to 6.4 should be more meaningful
* GRANITE-16571 Replace usage of SHA-1

    * The tool checksum is now SHA-512 when using --version option

* GRANITE-17601 Embed oak-upgrade in CRX2Oak with oak-blob-cloud
* GRANITE-18553 crx2oak leaves version properties on the node even when versions aren't migrated

### Version 1.6.8 (March 2017) {#version-march}

* Updated Oak version to 1.6.1 
* CQ-61847 Merge crx2oak-quickstart-extension with crx2oak (added migration profiles)
* CQ-97488 Promoting and dropping AEM run modes (by rewriting sling.options.file)
* GRANITE-12798/OAK-4260 Ability to side grade from Oak Segment to Oak Segment Tar

### Version 1.4.2 (March 2016) {#version-march-1}

* Upgrade Oak version to 1.4.1
* OAK-3846 / GRANITE-10748 Rename SNS nodes if they violate nodetype constraints
* OAK-3910 / GRANITE-10730 Migrating node inheriting from `mix:versionable` without version history
* OAK-4128 / GRANITE-11757 `RepositorySidegrade` doesn't copy root node properties

### Version 1.3.4 (January 2016) {#version-january}

* Upgrade Oak version to 1.3.16
* OAK-3844 / GRANITE-10730 Better support for versionable nodes without version histories
* OAK-3846 Rename SNS nodes if they violate nodetype constraints

### Version 1.3.2 (December 2015) {#version-december}

* Upgrades Oak version to 1.3.12
* Datastore directory shouldn't be moved after the migration (GRANITE-10447)  
* Merge crx2oak-quickstart-extension with crx2oak (CQ-61847)  
* crx2oak fails on duplicate values in repository (CQ-61906)  
* Long AEM start after migration from CQ 5.x (GRANITE-10309)  
* Support for multiple LDAP servers in crx2oak (GRANITE-9917)  
* Enforce check for max node name length (OAK-3111)  
* Support S3DataSource as the migration source (OAK-3685)

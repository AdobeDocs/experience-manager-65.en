---
title: SRP - Community Content Storage
seo-title: SRP - Community Content Storage
description: As of AEM Communities 6.1, user generated content (UGC) is stored in a single, common store provided by a storage resource provider (SRP)
seo-description: As of AEM Communities 6.1, user generated content (UGC) is stored in a single, common store provided by a storage resource provider (SRP)
uuid: 651af1d7-70e8-4b56-8c01-871cb397678e
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: administering
content-type: reference
discoiquuid: e975e026-e815-4445-be3e-b1237ed3f6b2
---

# SRP - Community Content Storage {#srp-community-content-storage}

## Introduction {#introduction}

As of AEM Communities 6.1, user-generated content (UGC) is stored in a single, common store provided by a storage resource provider (SRP). There are several SRP options from which to choose, such as ASRP, MSRP, and JSRP.

Unlike prior releases, there is no reverse/forward replication of UGC across AEM instances. Instead, the SRP makes UGC directly accessible for create, read, update, and delete (CRUD) operations from all author and publish instances, with an exception for JSRP.

Following are the [characteristics of each SRP option](#characteristics-of-srp-options), which is crucial information for the decision process when choosing the appropriate SRP and [underlying deployment](topologies.md).

For details regarding the use of SRP for UGC, see [Storage Resource Provider Overview](srp.md).

>[!NOTE]
>
>SRP applies only to community content. It does not affect where site content is stored ([node store](../../help/sites-deploying/data-store-config.md)), and does not affect the secure handling of user registration, user profiles and user groups between AEM instances (see also [Managing User Data](#managing-user-data)).

>[!CAUTION]
>
>As of AEM 6.1, [UGC is never replicated](#ugc-never-replicated).
>
>When the deployment does not include a common store, such as the default [JSRP](topologies.md#jsrp) topology, UGC will be visible only on the AEM publish or author instance on which it was entered. Only if the topology includes a publish cluster will the UGC be visible on any publish instance.

## Characteristics of SRP Options {#characteristics-of-srp-options}

[ASRP - Adobe Storage Resource Provider](asrp.md)  
With this option, the UGC is persisted remotely in a cloud service hosted and managed by Adobe. It requires an additional license and working with an account representative to provision the account for that specific license.

* Requires an associated cloud service provided and supported by Adobe to store community content
* Requires choice of a datacenter in a specific geography (US, EMEA, APAC)
* Requires all programmatic access to UGC be through the SRP API
* Suitable for TarMK publish farm
* Suitable when there is no intent to invest in local storage

>[!NOTE]
>
>There is a limit to uploading attachments to posts (or comments) in ASRP, which is 50 MB.

[MSRP - MongoDB Storage Resource Provider](msrp.md)  
With this option, the UGC is persisted directly in a local MongoDB instance.

* Requires a local, licensed install of MongoDB to store community content
* Requires a local install of Apache Solr
* Requires all programmatic access to UGC be through the SRP API
* Suitable for an existing TarMK publish farm
* Suitable for a MongoMK or RdbMK cluster
* Suitable when expecting large volumes of community content

[DSRP - Relational Database Storage Resource Provider](dsrp.md)  
With this option, the UGC is persisted directly in a local MySQL database instance.

* Requires a local install of MySQL to store community content
* Requires a local install of Apache Solr
* Requires all programmatic access to UGC be through the SRP API
* Suitable for an existing TarMK publish farm
* Suitable for a MongoMK or RdbMK cluster
* Suitable when expecting large volumes of community content

[JSRP - JCR Storage Resource Provider](jsrp.md)  
With the default option, there is no common store. The UGC is persisted only in the same JCR repository as the AEM instance in which it was entered.

* Stores community content in the JCR repository of the AEM author or publish instance to which it was posted
* Requires all programmatic access to UGC be through the SRP API
* Requires a publish cluster if more than one publish instance is deployed (there is no replication mechanism among publish instances in a TarMK farm)
* Moderation is performed only in the publish environment  (there is no reverse/forward replication mechanism between author and publish)  
* Generally best for development, demonstrations, and training

## Configuring SRP {#configuring-srp}

Specifying the default storage option, based on the underlying deployment, is made through the [Storage Configuration console](srp-config.md).

For configuration details of each option, see:

* [ASRP - Adobe Storage Resource Provider](asrp.md)
* [MSRP - MongoDB Storage Resource Provider](msrp.md)
* [DSRP - Relational Database Storage Resource Provider](dsrp.md)
* [JSRP - JCR Storage Resource Provider](jsrp.md)

If no storage option is actively selected, JSRP is enabled by default.

## Additional Information {#additional-information}

### UGC Never Replicated {#ugc-never-replicated}

In the author environment, an author creates page content and replicates it to the publish environment. When a page includes an interactive AEM Communities feature, such as comments, reviews, forum, blog, or QnA, the interaction by members (signed in site visitors) on a publish instance results in user generated content (UGC) entered in the publish environment.

Previously, this community content was reverse replicated to author instances and from author replicated to publish instances. It was problematic to maintain consistency among AEM instances with reverse and forward replication.

Beginning with AEM Communities 6.1, the need for replication of UGC has been eliminated by using shared storage for UGC, as described above.

While site content is replicated, UGC is never replicated.

### Managing User Data {#managing-user-data}

Also of interest to Communites are [*users*, *user groups*, and *user profiles*](users.md). This user-related data, when created and updated in the publish environment, needs to be made available to other publish instances when the topology is a [publish farm](../../help/sites-deploying/recommended-deploys.md#tarmk-farm).

As of AEM Communities 6.1, user-related data is synchronized using Sling distribution instead of replication. For more information visit [User Synchronization](sync.md).

### Upgrading to AEM Communities 6.2 {#upgrading-to-aem-communities}

When upgrading to AEM Communities 6.3, if pre-existing UGC needs to be retained, then steps should be taken depending on whether the AEM 5.6.1 or AEM 6.0 community used Adobe on-demand storage or on-premise storage of UGC.

For details, visit [Upgrading to AEM Communities 6.3](upgrade.md).

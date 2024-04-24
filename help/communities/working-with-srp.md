---
title: SRP - Community Content Storage
description: As of AEM Communities 6.1, user generated content (UGC) is stored in a single, common store provided by a storage resource provider (SRP)
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
docset: aem65
role: Admin
exl-id: e29aae44-67be-43d2-8004-c986412d9e63
solution: Experience Manager
feature: Communities
---
# SRP - Community Content Storage {#srp-community-content-storage}

## Introduction {#introduction}

As of AEM Communities 6.1, user-generated content (UGC) is stored in a single, common store provided by a storage resource provider (SRP). There are several SRP options from which to choose, such as ASRP, MSRP, and JSRP.

Unlike prior releases, there is no reverse/forward replication of UGC across AEM instances. Instead, the SRP makes UGC directly accessible for create, read, update, and delete (CRUD) operations from all author and publish instances, with an exception for JSRP.

Following are the [characteristics of each SRP option](#characteristics-of-srp-options), which is crucial information for the decision process when choosing the appropriate SRP and [underlying deployment](/help/communities/topologies.md).

For details regarding the use of SRP for UGC, see [Storage Resource Provider Overview](/help/communities/srp.md).

>[!NOTE]
>
>SRP applies only to community content. It does not affect where site content is stored ([node store](/help/sites-deploying/data-store-config.md)), and does not affect the secure handling of user registration, user profiles and user groups between AEM instances (see also [Managing User Data](#managing-user-data)).

>[!CAUTION]
>
>As of AEM 6.1, [UGC is never replicated](#ugc-never-replicated).
>
>When the deployment does not include a common store, such as the default [JSRP](/help/communities/topologies.md#jsrp) topology, UGC will be visible only on the AEM publish or author instance on which it was entered. Only if the topology includes a publish cluster will the UGC be visible on any publish instance.

## Characteristics of SRP Options {#characteristics-of-srp-options}

[ASRP - Adobe Storage Resource Provider](/help/communities/asrp.md)

With this option, the UGC is persisted remotely in a cloud service hosted and managed by Adobe. It requires an additional license and working with an account representative to provision the account for that specific license. ASRP requires:

* An associated cloud service provided and supported by Adobe to store community content.
* Choice of a datacenter in a specific geography (U.S., EMEA, APAC).

* All programmatic access to UGC be through the SRP API.

ASRP is suitable:

* For TarMK publish farm.
* When there is no intent to invest in local storage.

>[!NOTE]
>
>There is a limit to uploading attachments to posts (or comments) in ASRP, which is 50 MB.

[MSRP - MongoDB Storage Resource Provider](/help/communities/msrp.md)

With this option, the UGC is persisted directly in a local MongoDB instance.

MSRP requires:

* A local, licensed install of MongoDB to store community content.
* A local install of Apache Solr.
* All programmatic access to UGC be through the SRP API.

ASRP is suitable:

* For an existing TarMK publish farm.
* For a MongoMK or RdbMK cluster.
* When expecting large volumes of community content.

[DSRP - Relational Database Storage Resource Provider](/help/communities/dsrp.md)

With this option, the UGC is persisted directly in a local MySQL database instance.

DSRP requires:

* A local install of MySQL to store community content.
* A local install of Apache Solr.
* All programmatic access to UGC be through the SRP API.

DSRP is suitable:

* For an existing TarMK publish farm.
* For a MongoMK or RdbMK cluster.
* When expecting large volumes of community content.

[JSRP - JCR Storage Resource Provider](/help/communities/jsrp.md)

With the default option, there is no common store. The UGC is persisted only in the same JCR repository as the AEM instance in which it was entered.

JSRP:

* Stores community content in the JCR repository of the AEM author or publish instance to which it was posted.
* Requires all programmatic access to UGC be through the SRP API.
* Requires a publish cluster if more than one publish instance is deployed (there is no replication mechanism among publish instances in a TarMK farm).
* moderation is performed only in the publish environment (there is no reverse/forward replication mechanism between author and publish).
* Is best for development, demonstrations, and training.

## Configuring SRP {#configuring-srp}

Specifying the default storage option, based on the underlying deployment, is made through the [Storage Configuration console](/help/communities/srp-config.md).

For configuration details of each option, see:

* [ASRP - Adobe Storage Resource Provider](/help/communities/asrp.md)
* [MSRP - MongoDB Storage Resource Provider](/help/communities/msrp.md)
* [DSRP - Relational Database Storage Resource Provider](/help/communities/dsrp.md)
* [JSRP - JCR Storage Resource Provider](/help/communities/jsrp.md)

If no storage option is actively selected, JSRP is enabled by default.

## Additional Information {#additional-information}

### UGC Never Replicated {#ugc-never-replicated}

In the author environment, an author creates page content and replicates it to the publish environment. When a page includes an interactive AEM Communities feature, such as comments, reviews, forum, blog, or QnA, the interaction by members (signed in site visitors) on a publish instance results in user generated content (UGC) entered in the publish environment.

Previously, this community content was reverse replicated to author instances and from author replicated to publish instances. It was problematic to maintain consistency among AEM instances with reverse and forward replication.

Beginning with AEM Communities 6.1, the need for replication of UGC has been eliminated by using shared storage for UGC, as described above.

While site content is replicated, UGC is never replicated.

### Managing User Data {#managing-user-data}

Also of interest to CommunitIes are [*users*, *user groups*, and *user profiles*](/help/communities/users.md). This user-related data, when created and updated in the publish environment, needs to be made available to other publish instances when the topology is a [publish farm](/help/sites-deploying/recommended-deploys.md#tarmk-farm).

As of AEM Communities 6.1, user-related data is synchronized using Sling distribution instead of replication. For more information visit [User Synchronization](/help/communities/sync.md).

### Upgrading to AEM Communities 6.5 {#upgrading-to-aem-communities}

When upgrading to AEM 6.5 Communities, if pre-existing UGC needs to be retained, then steps should be taken depending on whether the AEM 5.6.1 or AEM 6.0 community used Adobe on-demand storage or on-premise storage of UGC.

For details, visit [Upgrading to AEM Communities 6.5](/help/communities/upgrade.md).

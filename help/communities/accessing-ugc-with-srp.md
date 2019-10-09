---
title: Accessing UGC with SRP
seo-title: Accessing UGC with SRP
description: When a site is configured to use ASRP or MSRP, the actual UGC is not be stored in AEM's node store (JCR)
seo-description: When a site is configured to use ASRP or MSRP, the actual UGC is not be stored in AEM's node store (JCR)
uuid: 5f9f8c9b-4c6a-45b0-96ff-14934380eba7
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: ee786a5c-b985-4d78-9063-6c79ae5e13e6
---

# Accessing UGC with SRP {#accessing-ugc-with-srp}

## About SRP {#about-srp}

All AEM Communities components and features are built on the [social component framework (SCF)](scf.md), which invokes the SocialResourceProvider API to access all user generated content (UGC).

Before a community site is created, the [storage resource provider (SRP)](working-with-srp.md) must be configured to select an implementation consistent with the underlying [topology](topologies.md). The SRP implementations are based on three storage options:

1. [ASRP](asrp.md) - Adobe on-demand storage
2. [MSRP](msrp.md) - MongoDB
3. [JSRP](jsrp.md) - JCR

## About UGC Storage {#about-ugc-storage}

What is important to know about storage of UGC is, when a site is configured to use ASRP or MSRP, the actual UGC is not be stored in AEM's [node store](../../help/sites-deploying/data-store-config.md) (JCR).

While there may be nodes in JCR which shadow the UGC to provide useful metadata, these nodes are not to be confused with the actual UGC.

See [Storage Resource Provider Overview.](srp.md)

## Best Practice {#best-practice}

When developing custom components, developers should be careful to code independently of the current chosen topology, thus retaining flexibility to move to a new topology in the future.

### Assume JCR Not Available {#assume-jcr-not-available}

Methods specific to JCR should avoided.

Methods to use:

* Sling API (Sling Resource)
  * Do not assume there are JCR nodes

* OSGi Events
  * Do not assume there are JCR events

* [Social Resource Utilities](socialutils.md#socialresourceutilities-package)
* [SCF Utilities](socialutils.md#scfutilities-package)

Methods to avoid:

* Node API
* JCR events
* Workflow launchers (which use JCR events)

### Use Search Collections {#use-search-collections}

Different SRPs can have different native query languages. It is recommended to use methods from the [com.adobe.cq.social.ugc.api](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/ugc/api/package-summary.html) package to invoke the appropriate query language.

For more information, see [Search Essentials](search-implementation.md).

## Resources {#resources}

* [Community Content Storage](working-with-srp.md) - discusses the available SRP choices for a UGC common store
* [Storage Resource Provider Overview](srp.md) - introduction and repository usage overview
* [SRP and UGC Essentials](srp-and-ugc.md) - SRP utility methods and examples
* [Search Essentials](search-implementation.md) - essential information for searching UGC
* [SocialUtils Refactoring](socialutils.md) - mapping deprecated utility methods to current SRP utility methods

---
title: Accessing UGC with SRP
seo-title: Accessing UGC with SRP
description: When a site is configured to use ASRP or MSRP, the actual UGC is not be stored in AEM's node store (JCR)
seo-description: When a site is configured to use ASRP or MSRP, the actual UGC is not be stored in AEM's node store (JCR)
uuid: c2860ef0-69c0-42a9-9169-0ea7fdfcaa79
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: ffb8e78e-ad9e-4f5a-a06c-79f096b50627
index: y
internal: n
snippet: y
---

# Accessing UGC with SRP{#accessing-ugc-with-srp}

## About SRP {#about-srp}

All AEM Communities components and features are built on the [social component framework (SCF)](/6-5/communities/using/scf.md), which calls the SocialResourceProvider API to access all user generated content (UGC).

Before a community site is created, the [storage resource provider (SRP)](../../../6-5/communities/using/working-with-srp.md) must be configured to select an implementation consistent with the underlying [topology](/6-5/communities/using/topologies.md). The SRP implementations are based on three storage options :

1. [ASRP](../../../6-5/communities/using/asrp.md) - Adobe on-demand storage
1. [MSRP](/6-5/communities/using/msrp.md) - MongoDB
1. [JSRP](/6-5/communities/using/jsrp.md) - JCR

## About UGC Storage {#about-ugc-storage}

What is important to know about storage of UGC is, when a site is configured to use ASRP or MSRP, the actual UGC is not be stored in AEM's [node store](../../../6-5/sites/deploying/using/data-store-config.md) (JCR).

While there may be nodes in JCR which shadow the UGC to provide useful metadata, these nodes are not to be confused with the actual UGC.

See [Storage Resource Provider Overview.](/6-5/communities/using/srp.md)

## Best Practice {#best-practice}

When developing custom components, developers should be careful to code independently of the current chosen topology, thus retaining flexibility to move to a new topology in the future.

### Assume JCR Not Available {#assume-jcr-not-available}

Methods specific to JCR should avoided.

Methods to use :

* Sling API (Sling Resource)

    * do not assume there are JCR nodes

* OSGi Events

    * do not assume there are JCR events

* [SocialResourceUtilities](/6-5/communities/using/socialutils.md#socialresourceutilities-package)
* [SCFUtilities](/6-5/communities/using/socialutils.md#scfutilities-package)

Methods to avoid :

* Node API
* JCR events
* workflow launchers (which use JCR events)

### Use Search Collections {#use-search-collections}

Different SRPs can have different native query languages. It is recommended to use methods from the [com.adobe.cq.social.ugc.api](/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/ugc/api/package-summary.md) package to run the appropriate query language.

For more information, see [Search Essentials](/6-5/communities/using/search-implementation.md).

## Resources {#resources}

* [Community Content Storage](../../../6-5/communities/using/working-with-srp.md) - discusses the available SRP choices for a UGC common store
* [Storage Resource Provider Overview](/6-5/communities/using/srp.md) - introduction and repository usage overview
* [SRP and UGC Essentials](/6-5/communities/using/srp-and-ugc.md) - SRP utility methods and examples
* [Search Essentials](/6-5/communities/using/search-implementation.md) - essential information for searching UGC
* [SocialUtils Refactoring](/6-5/communities/using/socialutils.md) - mapping deprecated utility methods to current SRP utility methods


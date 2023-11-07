---
title: Accessing UGC with SRP
description: When a site is configured to use ASRP or MSRP, the actual UGC is not be stored in AEM's node store (JCR)
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
docset: aem65
exl-id: 1157366f-2cc5-46e4-8ec6-e66fe5d0a0f6
---
# Accessing UGC with SRP {#accessing-ugc-with-srp}

## About SRP {#about-srp}

All AEM Communities components and features are built on the [social component framework (SCF)](/help/communities/scf.md), which calls the SocialResourceProvider API to access all user generated content (UGC).

Before a community site is created, the [storage resource provider (SRP)](/help/communities/working-with-srp.md) must be configured to select an implementation consistent with the underlying [topology](/help/communities/topologies.md). The SRP implementations are based on three storage options :

1. [ASRP](/help/communities/asrp.md) - Adobe on-demand storage
1. [MSRP](/help/communities/msrp.md) - MongoDB
1. [JSRP](/help/communities/jsrp.md) - JCR

## About UGC Storage {#about-ugc-storage}

What is important to know about storage of UGC is, when a site is configured to use ASRP or MSRP, the actual UGC is not be stored in AEM's [node store](/help/sites-deploying/data-store-config.md) (JCR).

While there may be nodes in JCR which shadow the UGC to provide useful metadata, these nodes are not to be confused with the actual UGC.

See [Storage Resource Provider Overview.](/help/communities/srp.md)

## Best Practice {#best-practice}

When developing custom components, developers should be careful to code independently of the current chosen topology, thus retaining flexibility to move to a new topology in the future.

### Assume JCR Not Available {#assume-jcr-not-available}

Methods specific to JCR should avoided.

Methods to use :

* Sling API (Sling Resource)

    * do not assume there are JCR nodes

* OSGi Events

    * do not assume there are JCR events

* [SocialResourceUtilities](/help/communities/socialutils.md#socialresourceutilities-package)
* [SCFUtilities](/help/communities/socialutils.md#scfutilities-package)

Methods to avoid :

* Node API
* JCR events
* workflow launchers (which use JCR events)

### Use Search Collections {#use-search-collections}

Different SRPs can have different native query languages. Use methods from the [com.adobe.cq.social.ugc.api](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/ugc/api/package-summary.html) package to run the appropriate query language.

For more information, see [Search Essentials](/help/communities/search-implementation.md).

## Resources {#resources}

* [Community Content Storage](/help/communities/working-with-srp.md) - discusses the available SRP choices for a UGC common store
* [Storage Resource Provider Overview](/help/communities/srp.md) - introduction and repository usage overview
* [SRP and UGC Essentials](/help/communities/srp-and-ugc.md) - SRP utility methods and examples
* [Search Essentials](/help/communities/search-implementation.md) - essential information for searching UGC
* [SocialUtils Refactoring](/help/communities/socialutils.md) - mapping deprecated utility methods to current SRP utility methods

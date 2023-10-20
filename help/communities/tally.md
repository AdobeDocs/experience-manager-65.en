---
title: Tally Essentials
description: Learn how Tally is an abstract class providing a standard method of collecting feedback from members on how they value specific products and services.
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: 0b508df9-1a24-4728-a254-f913eeb9b391
---
# Tally Essentials {#tally-essentials}

Tally is an abstract class providing a standard method of collecting feedback from members on how they value specific products and services. Anonymous feedback is not supported. Site visitors must register and sign in to participate and sign in to change their feedback. The requirement to sign in facilitates moderation and enhances the value of the feedback by preventing multiple posts.

A custom tally component can be created by extending the abstract tally class.

[Liking](essentials-liking.md) is an implementation of tally that is simple form of expressing a positive opinion.

[Voting](essentials-voting.md) is an implementation of tally that is simple form of expressing a positive or negative opinion.

[Rating](rating-basics.md) is an implementation of tally that uses a star system for expressing a range of opinions from positive to negative.

As of AEM 6.1, the poll component is no longer available.

[Reviews](reviews-basics.md) is an SCF component that is a hybrid of [comments](essentials-comments.md) and [rating](rating-basics.md).

## Essentials for Client-Side {#essentials-for-client-side}

* [Client-side Customizations](client-customize.md)

## Essentials for Server-Side {#essentials-for-server-side}

* [Tally APIs](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/tally/client/api/package-summary.html)

* [Tally Endpoints](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/tally/client/endpoints/package-summary.html)

* [Server-side Customizations](server-customize.md)

### Accessing Posted Tallies (UGC) {#accessing-posted-tallies-ugc}

UGC should be moderated using one of the standard methods for moderation.
See [Moderating User Generated Content](moderate-ugc.md).

As of AEM 6.1 Communities, use of a [common store](working-with-srp.md) for UGC includes programmatic access to UGC regardless of the chosen storage option (such as ASRP, MSRP, or JSRP).

**The location and format of the UGC in the repository is subject to change without warning**.

See:

* [Storage Resource Provider Overview](srp.md) - Introduction and repository usage overview.
* [SRP and UGC Essentials](srp-and-ugc.md) - SRP utility methods and examples.
* [Accessing UGC with SRP](accessing-ugc-with-srp.md) - Coding guidelines.
* [SocialUtils Refactoring](socialutils.md) - Mapping deprecated utility methods to current SRP utility methods.

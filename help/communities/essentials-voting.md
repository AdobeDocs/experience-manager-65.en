---
title: Voting Essentials
description: Learn how to use Voting component that allows members to rate a particular piece of content by selecting up or down arrows to indicate their opinion.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: e8ff751f-404a-498d-8e90-62a13ab593ff
solution: Experience Manager
feature: Communities
role: Developer
---
# Voting Essentials {#voting-essentials}

The voting component, a [tally](tally.md) subclass, is a useful tool that allows members to rate a particular piece of content by simply selecting up or down arrows to indicate their opinion.

Placing multiple instances of a voting component on the same page is allowed; each instance must be configured with a unique `tally name` property.

Anonymous posting of a vote is not supported. Site visitors must register and sign in to participate in voting only once. The signed in visitor (member) may change their vote at any time.

## Essentials for Client-Side {#essentials-for-client-side}

<table>
 <tbody>
  <tr>
   <td> <strong>resourceType</strong></td>
   <td>social/tally/components/hbs/voting</td>
  </tr>
  <tr>
   <td> <a href="scf.md#add-or-include-a-communities-component"><strong>includable</strong></a></td>
   <td>Yes - properties are editable in <i>design </i>mode</td>
  </tr>
  <tr>
   <td> <a href="client-customize.md#clientlibs-for-scf"><strong>clientlibs</strong></a></td>
   <td> cq.social.hbs.voting</td>
  </tr>
  <tr>
   <td> <strong>templates</strong></td>
   <td><p> /libs/social/tally/components/hbs/voting/voting.hbs<br /> /libs/social/tally/components/hbs/voting/activity-title.hbs</p> </td>
  </tr>
  <tr>
   <td><strong>CSS</strong></td>
   <td> /libs/social/tally/components/hbs/voting/clientlibs/votingcomponent.css</td>
  </tr>
  <tr>
   <td><strong>properties</strong></td>
   <td><p>See <a href="voting.md">Using Voting</a></p> </td>
  </tr>
 </tbody>
</table>

* [Client-side Customizations](client-customize.md)

## Essentials for Server-Side {#essentials-for-server-side}

* [Tally APIs](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/tally/client/api/package-summary.html)

* [Tally Endpoints](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/tally/client/endpoints/package-summary.html)

* [Server-side Customizations](server-customize.md)

### Accessing Posted Voting (UGC) {#accessing-posted-voting-ugc}

UGC should be moderated using one of the standard methods for moderation.
See [Moderating User Generated Content](moderate-ugc.md).

As of AEM 6.1 Communities, use of a [common store](working-with-srp.md) for UGC includes programmatic access to UGC regardless of the chosen storage option (such as ASRP, MSRP, or JSRP).

**The location and format of the UGC in the repository is subject to change without warning**.

See:

* [Storage Resource Provider Overview](srp.md) - introduction and repository usage overview.
* [SRP and UGC Essentials](srp-and-ugc.md) - SRP utility methods and examples.
* [Accessing UGC with SRP](accessing-ugc-with-srp.md) - coding guidelines.
* [SocialUtils Refactoring](socialutils.md) - mapping deprecated utility methods to current SRP utility methods.

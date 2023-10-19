---
title: Forum Essentials
description: Learn about the fundamentals of working with the Forum feature in Adobe Experience Manager Communities.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: 622cf6ca-f119-4310-ad14-537576bd6f6d
---
# Forum Essentials {#forum-essentials}

This page provides the essential information for working with the forum feature.

## Essentials for Client-Side {#essentials-for-client-side}

<table>
 <tbody>
  <tr>
   <td> <strong>resourceTypes</strong></td>
   <td>social/forum/components/hbs/forum<br /> social/forum/components/hbs/topic<br /> social/forum/components/hbs/post</td>
  </tr>
  <tr>
   <td> <a href="scf.md#add-or-include-a-communities-component"><strong>includible</strong></a></td>
   <td>No</td>
  </tr>
  <tr>
   <td> <a href="clientlibs.md"><strong>clientllibs</strong></a></td>
   <td>cq.ckeditor<br /> cq.social.hbs.voting<br /> cq.social.hbs.forum</td>
  </tr>
  <tr>
   <td> <strong>templates</strong></td>
   <td> /libs/social/forum/components/hbs/forum/forum.hbs<br /> /libs/social/forum/components/hbs/post/post.hbs<br /> /libs/social/forum/components/hbs/topic/topic.hbs<br /> /libs/social/forum/components/hbs/topic/list-item.hbs<br /> </td>
  </tr>
  <tr>
   <td> <strong>css</strong></td>
   <td> /libs/social/forum/components/hbs/forum/clientlibs/forum.css</td>
  </tr>
  <tr>
   <td><strong> properties</strong></td>
   <td>See <a href="forum.md">Forum Feature</a></td>
  </tr>
 </tbody>
</table>

* [Client-side Customizations](client-customize.md)

## Essentials for Server-Side {#essentials-for-server-side}

* [Forum API](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/forum/client/api/package-summary.html)

* [Forum Endpoints](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/forum/client/endpoints/package-summary.html)

* [Server-side Customizations](server-customize.md)

### Forum Function {#forum-function}

A community site structure that includes the [Forum function](functions.md#forum-function), includes a configured `forum` component, and settings affecting moderation, tagging, and translation.

### Accessing Forum Posts (UGC) {#accessing-forum-posts-ugc}

UGC should be moderated using one of the standard methods for moderation.
See [Moderating User-Generated Content](moderate-ugc.md).

As of Adobe Experience Manager 6.1 Communities, use of a [common store](working-with-srp.md) for UGC includes programmatic access to UGC regardless of the chosen storage option (such as ASRP, MSRP, or JSRP).

**The location and format of the UGC in the repository is subject to change without warning**.

See:

* [Storage Resource Provider Overview](srp.md) - Introduction and repository usage overview.
* [SRP and UGC Essentials](srp-and-ugc.md) - SRP utility methods and examples.
* [Accessing UGC with SRP](accessing-ugc-with-srp.md) - Coding guidelines.
* [SocialUtils Refactoring](socialutils.md) - Mapping deprecated utility methods to current SRP utility methods.

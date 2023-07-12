---
title: Comments Essentials
description: Comments component overview
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: 8b4034f7-2f97-45ad-96d4-51cfbeae5991
---
# Comments Essentials {#comments-essentials}

This page provides the essentials of working with the comment system (comments component) and options for managing the user-generated content (UGC) produced when members post comments or replies.

The comments component establishes a comment system such that each individual post is represented by a comment component (singular). It is the comment system which is included on the page. The comment system creates the individual comments when invoked.

## Essentials for Client-Side {#essentials-for-client-side}

<table>
 <tbody>
  <tr>
   <td> <strong>resourceType</strong></td>
   <td> social/commons/components/hbs/comments</td>
  </tr>
  <tr>
   <td> <a href="scf.md#add-or-include-a-communities-component"><strong>includible</strong></a></td>
   <td>Yes - properties are editable in <i>design </i>mode</td>
  </tr>
  <tr>
   <td> <a href="client-customize.md#clientlibs-for-scf"><strong>clientlibs</strong></a></td>
   <td>cq.ckeditor<br /> cq.social.hbs.comments<br /> cq.social.hbs.voting</td>
  </tr>
  <tr>
   <td> <strong>templates</strong></td>
   <td> /libs/social/commons/components/hbs/comments/comments.hbs<br /> </td>
  </tr>
  <tr>
   <td> <strong>CSS</strong></td>
   <td> /libs/social/commons/components/hbs/comments/clientlibs/commentsystem.css</td>
  </tr>
  <tr>
   <td><strong> properties</strong></td>
   <td> See <a href="comments.md">Using Comments</a></td>
  </tr>
 </tbody>
</table>

[Client-side Customizations](client-customize.md)

### One Instance Per Page {#one-instance-per-page}

Pagination and the use of URLs for caching and linking require that the URL be unique per comment system. Therefore, only one instance of a comment system is allowed per page.

Other features already include the comment system. These are:

* [Blog](blog-developer-basics.md)
* [Calendar](calendar-basics-for-developers.md)
* [File Library](essentials-file-library.md)
* [Forum](essentials-forum.md)
* [QnA](qna-essentials.md)
* [Reviews](reviews-basics.md)

### Flag Reason List {#flag-reason-list}

The flagging reason list can be customized by adding flagreasonlist.hbs to your app to overwrite what is in

* `/libs/social/commons/components/hbs/comments/comment/flagreasonlist.hbs`

This applies to any component which extends a comment system.

## Essentials for Server-Side {#essentials-for-server-side}

* [Comments API](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/commons/comments/api/package-summary.html)

* [Comments Endpoints](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/commons/comments/endpoints/package-summary.html)

* [Server-side Customizations](server-customize.md)

### Accessing Posted Comments (UGC) {#accessing-posted-comments-ugc}

UGC should be moderated using one of the standard methods for moderation.
See [Moderating User-Generated Content](moderate-ugc.md).

As of AEM 6.1 Communities, use of a [common store](working-with-srp.md) for UGC includes programmatic access to UGC regardless of the chosen storage option (such as ASRP, MSRP, or JSRP).

**The location and format of the UGC in the repository is subject to change without warning**.

See:

* [Storage Resource Provider Overview](srp.md) - Introduction and repository usage overview.
* [SRP and UGC Essentials](srp-and-ugc.md) - SRP utility methods and examples.
* [Accessing UGC with SRP](accessing-ugc-with-srp.md) - Coding guidelines.
* [SocialUtils Refactoring](socialutils.md) - Mapping deprecated utility methods to current SRP utility methods.

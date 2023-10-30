---
title: Reviews Essentials
description: Learn about how Reviews in AEM Communities is a composite component based on a comment system that contains one or more rating (tally) components.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: 91e0e245-a2f1-4bd7-b38f-7641fd94a547
---
# Reviews Essentials {#reviews-essentials}

This feature consists of two components that work together: reviews and review summary.

Reviews is a composite component based on a [comment system](essentials-comments.md) which contains one or more [rating](rating-basics.md) (tally) components.

Anonymous posting of a review is not supported. Site visitors must register and sign in to add a review. The signed in visitor (member) may update their review at any time.

## Essentials for Client-Side {#essentials-for-client-side}

### Reviews {#reviews}

<table>
 <tbody>
  <tr>
   <td> <strong>resourceType</strong></td>
   <td>social/reviews/components/hbs/reviews</td>
  </tr>
  <tr>
   <td> <a href="scf.md#add-or-include-a-communities-component"><strong>includable</strong></a></td>
   <td>Yes - properties are editable in <i>design </i>mode</td>
  </tr>
  <tr>
   <td> <a href="client-customize.md#clientlibs-for-scf"><strong>clientllibs</strong></a></td>
   <td>cq.social.hbs.reviews</td>
  </tr>
  <tr>
   <td> <strong>templates</strong></td>
   <td> /libs/social/reviews/components/hbs/reviews/reviews.hbs<br /> /libs/social/reviews/components/hbs/reviews/review/review.hbs<br /> /libs/social/reviews/components/hbs/reviews/review/status.hbs<br /> /libs/social/reviews/components/hbs/reviews/review/toolbar.hbs</td>
  </tr>
  <tr>
   <td> <strong>css</strong></td>
   <td> /libs/social/reviews/components/hbs/reviews/clientlibs/review.css</td>
  </tr>
  <tr>
   <td><strong>properties</strong></td>
   <td>See <a href="reviews.md">Using Reviews</a></td>
  </tr>
 </tbody>
</table>

### Review Summary {#review-summary}

|  **resourceType** |social/reviews/components/hbs/summary |
|---|---|
|  [**includable**](scf.md#add-or-include-a-communities-component) |Yes - properties are editable in *design *mode |
|  [**clientllibs**](client-customize.md#clientlibs-for-scf) |cq.social.hbs.reviews |
|  **templates** | /libs/social/reviews/components/hbs/summary/summary.hbs |
|  **css** | /libs/social/reviews/components/hbs/reviews/clientlibs/review.css |
| **properties** |See [Using Reviews](reviews.md) |

* [Client-side Customizations](client-customize.md)

## Essentials for Server-Side {#essentials-for-server-side}

* [Review API](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/review/client/api/package-summary.html)

* [Review Endpoints](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/review/client/endpoints/package-summary.html)

* [Server-side Customizations](server-customize.md)

### Accessing Posted Reviews (UGC) {#accessing-posted-reviews-ugc}

UGC should be moderated using one of the standard methods for moderation.
See [Moderating User Generated Content](moderate-ugc.md).

As of AEM 6.1 Communities, use of a [common store](working-with-srp.md) for UGC includes programmatic access to UGC regardless of the chosen storage option (such as ASRP, MSRP, or JSRP).

**The location and format of the UGC in the repository is subject to change without warning**.

See:

* [Storage Resource Provider Overview](srp.md) - Introduction and repository usage overview.
* [SRP and UGC Essentials](srp-and-ugc.md) - SRP utility methods and examples.
* [Accessing UGC with SRP](accessing-ugc-with-srp.md) - Coding guidelines.
* [SocialUtils Refactoring](socialutils.md) - Mapping deprecated utility methods to current SRP utility methods.

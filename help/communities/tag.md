---
title: Tag Essentials
description: Learn about when Communities components are configured with tagging enabled, community members can tag content they post in the publish environment.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: 6e8af8cf-1239-46f9-b2fe-4aa80abc86ea
---
# Tag Essentials {#tag-essentials}

When AEM Communities components are configured with tagging enabled, community members are able to tag the content they post in the publish environment.

The underlying infrastructure for tags applied in the publish environment is the same as for tags applied to content in the author environment, such as pages and assets:

* See [Administering Tags](../../help/sites-administering/tags.md) and [Tagging User Generated Content](tag-ugc.md) (UGC) for information about creating and managing tags.

* See [Tagging for Developers](../../help/sites-developing/tags.md) for information about the [tagging framework](../../help/sites-developing/framework.md) and including and extending tags in [custom applications](../../help/sites-developing/building.md).

* See [Using Social Tag Cloud](tagcloud.md) for information for authors on how to add a `social tag cloud` component to a page to highlight the tags applied to UGC in the publish environment.

Tagging of UGC may be enabled when configuring a [community site](sites-console.md#tagging) or one of the following features:

* [Blog](blog-feature.md)
* [Calendar](calendar.md)
* [File library](file-library.md)
* [Forum](forum.md)
* [QnA](working-with-qna.md)

## Essentials for Client-Side {#essentials-for-client-side}

### Social Tag Cloud {#social-tag-cloud}

<table>
 <tbody>
  <tr>
   <td> <strong>resourceType</strong></td>
   <td>social/commons/components/hbs/tagcloud</td>
  </tr>
  <tr>
   <td> <a href="scf.md#add-or-include-a-communities-component"><strong>includable</strong></a></td>
   <td>No</td>
  </tr>
  <tr>
   <td> <a href="clientlibs.md"><strong>clientllibs</strong></a></td>
   <td>cq.social.hbs.tagcloud</td>
  </tr>
  <tr>
   <td> <strong>templates</strong></td>
   <td> /libs/social/commons/components/hbs/tagcloud/tagcloud.hbs<br /> </td>
  </tr>
  <tr>
   <td> <strong>css</strong></td>
   <td> /libs/social/commons/components/hbs/tagcloud/clientlibs/tagcloud.css</td>
  </tr>
  <tr>
   <td><strong>properties</strong></td>
   <td>See <a href="tagcloud.md">Using Social Tag Cloud</a></td>
  </tr>
 </tbody>
</table>

* [Client-side Customizations](client-customize.md)

## Essentials for Server-Side {#essentials-for-server-side}

* [Social Tag Cloud API](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/commons/tagcloud/api/package-summary.html)

* [Social Tag Manager](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/commons/tagging/package-summary.html)

* [Server-side Customizations](server-customize.md)

## Tag Searching {#tag-searching}

As of [feature pack 1](deploy-communities.md#latestfeaturepack) (FP1), tag searching is performed using [tag titles](../../help/sites-developing/framework.md#tag-characteristics).

Before FP1, search was performed using [tag ids](../../help/sites-developing/framework.md#tagid).

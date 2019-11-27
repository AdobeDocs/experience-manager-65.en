---
title: Blog Essentials
seo-title: Blog Essentials
description: Blog overview
seo-description: Blog overview
uuid: 714cf70c-76a0-4be6-9163-a31ac6bd1643
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: eece7b8f-6ccd-4037-8713-0cd36cfd9e73
docset: aem65

---

# Blog Essentials{#blog-essentials}

As of AEM 6.1 Communities, a blog is a community activity. Blog articles are now posted from the publish environment, where previously, blog articles could only be created in the author environment and published .

Blog articles may now be created by any community member, unless restricted to privileged members.

This page provides the essential information for working with the blog feature.

>[!NOTE]
>
>The underlying infrastructure of the blog feature is the journal feature.

## Essentials for Client-Side {#essentials-for-client-side}

The blog feature is comprised of two main components that are available by adding the [Blog function](/help/communities/functions.md#blog-function) or by adding the components to a page in author edit mode.

### Blog {#blog}

<table>
 <tbody>
  <tr>
   <td> <strong>resourceType</strong></td>
   <td>social/journal/components/hbs/journal</td>
  </tr>
  <tr>
   <td> <a href="/help/communities/scf.md#add-or-include-a-communities-component"><strong>includable</strong></a></td>
   <td>No</td>
  </tr>
  <tr>
   <td> <a href="/help/communities/clientlibs.md"><strong>clientllibs</strong></a></td>
   <td>cq.ckeditor<br /> cq.social.hbs.voting<br /> cq.social.hbs.journal</td>
  </tr>
  <tr>
   <td> <strong>templates</strong></td>
   <td> /libs/social/journal/components/hbs/journal/journal.hbs<br /> /libs/social/journal/components/hbs/entry_topic/list-item.hbs</td>
  </tr>
  <tr>
   <td> <strong>css</strong></td>
   <td> /libs/social/journal/components/hbs/journal/clientlibs/journal.css</td>
  </tr>
  <tr>
   <td><strong> properties</strong></td>
   <td>see <a href="/help/communities/blog-feature.md">Blog Feature</a></td>
  </tr>
 </tbody>
</table>

### Blog Sidebar {#blog-sidebar}

|  **resourceType** |social/journal/components/hbs/sidebar |
|---|---|
|  [**includable**](/help/communities/scf.md#add-or-include-a-communities-component) |No |
|  [**clientllibs**](/help/communities/clientlibs.md) |cq.social.hbs.journal_sidebar |
|  **templates** | /libs/social/journal/components/hbs/sidebar/sidebar.hbs |
|  **css** | /libs/social/journal/components/hbs/sidebar/clientlibs/sidebar.css |
| **properties** |see [Blog Feature](/help/communities/blog-feature.md) |

* [Client-side Customizations](/help/communities/client-customize.md)

## Essentials for Server-Side {#essentials-for-server-side}

* [Blog API](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/journal/client/api/package-summary.html)

* [Blog Endpoints](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/journal/client/endpoints/package-summary.html)

* [Server-side Customizations](/help/communities/server-customize.md)

### Blog Function {#blog-function}

A community site structure that includes the [Blog function](/help/communities/functions.md#blog-function) will have configured `Blog` and `Blog Sidebar` components. The Blog function supports identifying a [privileged member user group](/help/communities/users.md#privileged-members-group).

### Accessing Blog Entries (UGC) {#accessing-blog-entries-ugc}

UGC should be moderated using one of the standard methods for moderation.
See [Moderating User Generated Content](/help/communities/moderate-ugc.md).

As of AEM 6.1 Communities, use of a [common store](/help/communities/working-with-srp.md) for UGC includes programmatic access to UGC regardless of the chosen storage option (such as ASRP, MSRP or JSRP).

**The location and format of the UGC in the repository is subject to change without warning**.

See :

* [Storage Resource Provider Overview](/help/communities/srp.md) - introduction and repository usage overview
* [SRP and UGC Essentials](/help/communities/srp-and-ugc.md) - SRP utility methods and examples
* [Accessing UGC with SRP](/help/communities/accessing-ugc-with-srp.md) - coding guidelines
* [SocialUtils Refactoring](/help/communities/socialutils.md) - mapping deprecated utility methods to current SRP utility methods

## Primary Publisher {#primary-publisher}

When the deployment is a publish farm, it is necessary to identify a primary publisher that will poll for articles scheduled to be published.

See [Primary Publisher](/help/communities/deploy-communities.md#primary-publisher) for more details.

## Allowing Rich Media {#allowing-rich-media}

The AEM platform blocks links from other websites to prevent XSS attacks as described in

* [Protect against Cross-Site Scripting (XSS)](/help/sites-developing/security.md#protect-against-cross-site-scripting-xss)

As of AEM 6.2, the modifications previously required to be made manually are included in the default AntiSamy config file.

Rich media is embeded in a blog article by selecting the `Embed Media from External Sites` icon :

![chlimage_1-199](assets/chlimage_1-199.png)


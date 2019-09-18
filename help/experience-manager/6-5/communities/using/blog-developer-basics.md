---
title: Blog Essentials
seo-title: Blog Essentials
description: Blog overview
seo-description: Blog overview
uuid: 70795295-5251-4684-bb0d-82222340282f
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: d3d5fda1-54b7-4942-9e5c-3bab333260b4
index: y
internal: n
snippet: y
---

# Blog Essentials{#blog-essentials}

As of AEM 6.1 Communities, a blog is a community activity. Blog articles are now posted from the publish environment, where previously, blog articles could only be created in the author environment and published .

Blog articles may now be created by any community member, unless restricted to privileged members.

This page provides the essential information for working with the blog feature.

>[!NOTE]
>
>The underlying infrastructure of the blog feature is the journal feature.

## Essentials for Client-Side {#essentials-for-client-side}

The blog feature is comprised of two main components that are available by adding the [Blog function](../../../6-5/communities/using/functions.md#blog-function) or by adding the components to a page in author edit mode.

### Blog {#blog}

<table border="1" cellpadding="4" cellspacing="4" width="100%"> 
 <tbody>
  <tr>
   <td> <strong>resourceType</strong></td> 
   <td>social/journal/components/hbs/journal</td> 
  </tr>
  <tr>
   <td> <a href="/6-5/communities/using/scf.md#add-or-include-a-communities-component"><strong>includable</strong></a></td> 
   <td>No</td> 
  </tr>
  <tr>
   <td> <a href="../../../6-5/communities/using/clientlibs.md"><strong>clientllibs</strong></a></td> 
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
   <td>see <a href="../../../6-5/communities/using/blog-feature.md">Blog Feature</a></td> 
  </tr>
 </tbody>
</table>

### Blog Sidebar {#blog-sidebar}

|  **resourceType** |social/journal/components/hbs/sidebar |
|---|---|
|  [**includable**](/6-5/communities/using/scf.md#add-or-include-a-communities-component) |No |
|  [**clientllibs**](../../../6-5/communities/using/clientlibs.md) |cq.social.hbs.journal_sidebar |
|  **templates** | /libs/social/journal/components/hbs/sidebar/sidebar.hbs |
|  **css** | /libs/social/journal/components/hbs/sidebar/clientlibs/sidebar.css |
| ** properties** |see [Blog Feature](../../../6-5/communities/using/blog-feature.md) |

* [Client-side Customizations](/6-5/communities/using/client-customize.md)

## Essentials for Server-Side {#essentials-for-server-side}

* [Blog API](/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/journal/client/api/package-summary.md)

* [Blog Endpoints](/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/journal/client/endpoints/package-summary.md)

* [Server-side Customizations](/6-5/communities/using/server-customize.md)

### Blog Function {#blog-function}

A community site structure that includes the [Blog function](../../../6-5/communities/using/functions.md#blog-function) will have configured `Blog` and `Blog Sidebar` components. The Blog function supports identifying a [privileged member user group](/6-5/communities/using/users.md#privileged-members-group).

### Accessing Blog Entries (UGC) {#accessing-blog-entries-ugc}

UGC should be moderated using one of the standard methods for moderation.  
See [Moderating User Generated Content](../../../6-5/communities/using/moderate-ugc.md).

As of AEM 6.1 Communities, use of a [common store](../../../6-5/communities/using/working-with-srp.md) for UGC includes programmatic access to UGC regardless of the chosen storage option (such as ASRP, MSRP or JSRP).

**The location and format of the UGC in the repository is subject to change without warning**.

See :

* [Storage Resource Provider Overview](/6-5/communities/using/srp.md) - introduction and repository usage overview
* [SRP and UGC Essentials](/6-5/communities/using/srp-and-ugc.md) - SRP utility methods and examples
* [Accessing UGC with SRP](../../../6-5/communities/using/accessing-ugc-with-srp.md) - coding guidelines
* [SocialUtils Refactoring](/6-5/communities/using/socialutils.md) - mapping deprecated utility methods to current SRP utility methods

## Primary Publisher {#primary-publisher}

When the deployment is a publish farm, it is necessary to identify a primary publisher that will poll for articles scheduled to be published.

See [Primary Publisher](../../../6-5/communities/using/deploy-communities.md#primary-publisher) for more details.

## Allowing Rich Media {#allowing-rich-media}

The AEM platform blocks links from other websites to prevent XSS attacks as described in

* [Protect against Cross-Site Scripting (XSS)](/6-5/sites/developing/using/security.md#protect-against-cross-site-scripting-xss)

As of AEM 6.2, the modifications previously required to be made manually are included in the default AntiSamy config file.

Rich media is embeded in a blog article by selecting the `Embed Media from External Sites` icon :

![](assets/chlimage_1-235.png)


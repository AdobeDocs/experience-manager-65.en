---
title: Blog Essentials
seo-title: Blog Essentials
description: Blog overview
seo-description: Blog overview
uuid: 3636cdf6-9e58-408d-9106-a744882f5719
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: 94d9a197-2359-4141-ab2a-b0f0c41bea97
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

The blog feature is comprised of two main components that are available by adding the [Blog function](../../communities/using/functions.md#blog-function) or by adding the components to a page in author edit mode.

### Blog {#blog}

<table border="1" cellpadding="4" cellspacing="4" width="100%"> 
 <tbody>
  <tr>
   <td> <strong>resourceType</strong></td> 
   <td>social/journal/components/hbs/journal</td> 
  </tr>
  <tr>
   <td> <a href="/communities/using/scf.md#add-or-include-a-communities-component"><strong>includable</strong></a></td> 
   <td>No</td> 
  </tr>
  <tr>
   <td> <a href="../../communities/using/clientlibs.md"><strong>clientllibs</strong></a></td> 
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
   <td>see <a href="../../communities/using/blog-feature.md">Blog Feature</a></td> 
  </tr>
 </tbody>
</table>

### Blog Sidebar {#blog-sidebar}

|  **resourceType** |social/journal/components/hbs/sidebar |
|---|---|
|  [**includable**](/communities/using/scf.md#add-or-include-a-communities-component) |No |
|  [**clientllibs**](../../communities/using/clientlibs.md) |cq.social.hbs.journal_sidebar |
|  **templates** | /libs/social/journal/components/hbs/sidebar/sidebar.hbs |
|  **css** | /libs/social/journal/components/hbs/sidebar/clientlibs/sidebar.css |
| ** properties** |see [Blog Feature](../../communities/using/blog-feature.md) |

* [Client-side Customizations](/communities/using/client-customize.md)

## Essentials for Server-Side {#essentials-for-server-side}

* [Blog API](/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/journal/client/api/package-summary.md)

* [Blog Endpoints](/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/journal/client/endpoints/package-summary.md)

* [Server-side Customizations](/communities/using/server-customize.md)

### Blog Function {#blog-function}

A community site structure that includes the [Blog function](../../communities/using/functions.md#blog-function) will have configured `Blog` and `Blog Sidebar` components. The Blog function supports identifying a [privileged member user group](/communities/using/users.md#privileged-members-group).

### Accessing Blog Entries (UGC) {#accessing-blog-entries-ugc}

UGC should be moderated using one of the standard methods for moderation.  
See [Moderating User Generated Content](../../communities/using/moderate-ugc.md).

As of AEM 6.1 Communities, use of a [common store](../../communities/using/working-with-srp.md) for UGC includes programmatic access to UGC regardless of the chosen storage option (such as ASRP, MSRP or JSRP).

**The location and format of the UGC in the repository is subject to change without warning**.

See :

* [Storage Resource Provider Overview](/communities/using/srp.md) - introduction and repository usage overview
* [SRP and UGC Essentials](/communities/using/srp-and-ugc.md) - SRP utility methods and examples
* [Accessing UGC with SRP](../../communities/using/accessing-ugc-with-srp.md) - coding guidelines
* [SocialUtils Refactoring](/communities/using/socialutils.md) - mapping deprecated utility methods to current SRP utility methods

## Primary Publisher {#primary-publisher}

When the deployment is a publish farm, it is necessary to identify a primary publisher that will poll for articles scheduled to be published.

See [Primary Publisher](../../communities/using/deploy-communities.md#primary-publisher) for more details.

## Allowing Rich Media {#allowing-rich-media}

The AEM platform blocks links from other websites to prevent XSS attacks as described in

* [Protect against Cross-Site Scripting (XSS)](/sites/developing/using/security.md#protect-against-cross-site-scripting-xss)

As of AEM 6.2, the modifications previously required to be made manually are included in the default AntiSamy config file.

Rich media is embeded in a blog article by selecting the `Embed Media from External Sites` icon :

![](assets/chlimage_1-199.png)


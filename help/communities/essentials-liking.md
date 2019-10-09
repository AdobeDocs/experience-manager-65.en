---
title: Liking Essentials
seo-title: Liking Essentials
description: Liking component overview
seo-description: Liking component overview
uuid: 89f16859-c901-4090-8e16-363b95c508de
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: f176c42b-b16b-42c9-af22-4b6421de5a90
pagetitle: Liking Essentials
---

# Liking Essentials {#liking-essentials}

The liking component, a [tally](tally.md) subclass, is a useful tool that allows members to express a positive opinion about a particular piece of content by simply selecting the heart icon.

Placing multiple instances of a liking component on the same page is allowed; each instance must be configured with an unique `tally name` property.

Anonymous posting of a like is not supported. Site visitors must register and sign in to participate in liking. The signed in visitor (member) may toggle like on and off at any time.

## Essentials for Client-Side {#essentials-for-client-side}

<table> 
 <tbody> 
  <tr> 
   <td> <strong>resourceType</strong></td> 
   <td>social/tally/components/hbs/liking</td> 
  </tr> 
  <tr> 
   <td> <a href="scf.md#add-or-include-a-communities-component"><strong>includable</strong></a></td> 
   <td>Yes - properties are editable in <i>design </i>mode</td> 
  </tr> 
  <tr> 
   <td> <a href="client-customize.md#clientlibs-for-scf"><strong>clientlibs</strong></a></td> 
   <td> cq.social.hbs.liking</td> 
  </tr> 
  <tr> 
   <td> <strong>templates</strong></td> 
   <td><p> /libs/social/tally/components/hbs/liking/liking.hbs<br /> /libs/social/tally/components/hbs/liking/activity-icon.hbs<br /> /libs/social/tally/components/hbs/liking/activity-title.hbs</p> </td> 
  </tr> 
  <tr> 
   <td><strong>CSS</strong></td> 
   <td> /libs/social/tally/components/hbs/liking/clientlibs/likingcomponent.css</td> 
  </tr> 
  <tr> 
   <td><strong>properties</strong></td> 
   <td><p>See <a href="liking.md">Using Liking</a></p> </td> 
  </tr> 
 </tbody> 
</table>

* [Client-side Customizations](client-customize.md)

## Essentials for Server-Side {#essentials-for-server-side}

* [Tally APIs](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/tally/client/api/package-summary.html)

* [Tally Endpoints](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/tally/client/endpoints/package-summary.html)

* [Server-side Customizations](server-customize.md)

### Accessing Posted Voting (UGC) {#accessing-posted-voting-ugc}

UGC should be moderated using one of the standard methods for moderation.  
See [Moderating User Generated Content](moderate-ugc.md).

As of AEM 6.1 Communities, use of a [common store](working-with-srp.md) for UGC includes programmatic access to UGC regardless of the chosen storage option (such as ASRP, MSRP or JSRP).

**The location and format of the UGC in the repository is subject to change without warning**.

See:

* [Storage Resource Provider Overview](srp.md) - introduction and repository usage overview
* [SRP and UGC Essentials](srp-and-ugc.md) - SRP utility methods and examples
* [Accessing UGC with SRP](accessing-ugc-with-srp.md) - coding guidelines
* [SocialUtils Refactoring](socialutils.md) - mapping deprecated utility methods to current SRP utility methods


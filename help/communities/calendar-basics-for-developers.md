---
title: Calendar Essentials
description: Learn  how to work with the Calendar feature in Experience Manager Communities. The Calendar supports the identification of privileged member user groups.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: 069e379d-c6fd-49ca-b337-df6fd466e023
---
# Calendar Essentials {#calendar-essentials}

This page provides essential information on working with the calendar feature.

## Essentials for Client-Side {#essentials-for-client-side}

<table>
 <tbody>
  <tr>
   <td> <strong>resourceType</strong></td>
   <td>social/calendar/components/hbs/calendar</td>
  </tr>
  <tr>
   <td> <a href="scf.md#add-or-include-a-communities-component"><strong>includable</strong></a></td>
   <td>No</td>
  </tr>
  <tr>
   <td> <a href="client-customize.md#clientlibs-for-scf"><strong>clientllibs</strong></a></td>
   <td>cq.social.hbs.calendar</td>
  </tr>
  <tr>
   <td> <strong>templates</strong></td>
   <td>/libs/social/calendar/components/hbs/calendar/calendar.hbs</td>
   <td> </td>
  </tr>
  <tr>
   <td> <strong>css</strong></td>
   <td>/libs/social/calendar/components/hbs/calendar/clientlibs/css/calendar.css<br /> /libs/social/calendar/components/hbs/calendar/clientlibs/css/jqueryui.css</td>
  </tr>
  <tr>
   <td><strong> properties</strong></td>
   <td>see <a href="calendar.md">Using Calendars</a></td>
  </tr>
 </tbody>
</table>

* [Client-side Customizations](client-customize.md)

## Essentials for Server-Side {#essentials-for-server-side}

* [Calendar APIs](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/calendar/client/api/package-summary.html)

* [Calendar Endpoints](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/calendar/client/endpoints/package-summary.html)

* [Server-side Customizations](server-customize.md)

### Calendar Function {#calendar-function}

A community site structure that includes the [Calendar function](functions.md#calendar-function) has a `calendar` component configured. The Calendar function supports identifying a [privileged member user group](users.md#privileged-members-group).

### Accessing Calendar Posts (UGC) {#accessing-calendar-posts-ugc}

As of AEM 6.1 Communities, use of a [common store](working-with-srp.md) for UGC includes programmatic access to UGC regardless of the chosen storage option (such as ASRP, MSRP, or JSRP).

**The location and format of the UGC in the repository is subject to change without warning**.

See:

* [Storage Resource Provider Overview](srp.md) - introduction and repository usage overview
* [SRP and UGC Essentials](srp-and-ugc.md) - SRP utility methods and examples
* [Accessing UGC with SRP](accessing-ugc-with-srp.md) - coding guidelines
* [SocialUtils Refactoring](socialutils.md) - mapping deprecated utility methods to current SRP utility methods

---
title: Assignments Essentials
seo-title: Assignments Essentials
description: Assignments feature overview for enablement communities
seo-description: Assignments feature overview for enablement communities
uuid: e49fce26-1091-4f37-93e8-c4ec85371811
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: 6bac681e-59e1-4786-9c50-6679c936cfd1
docset: aem65
exl-id: 75cef5da-4f93-4721-99c0-ad44c8ab76d4
---
# Assignments Essentials {#assignments-essentials}

Read on to know about the essential information for working with the assignments feature of [enablement community](/help/communities/overview.md#enablement-community) sites.

The assignments feature is the ability to assign enablement resources and learning paths to members of enablement communities.

## Essentials for Client-Side {#essentials-for-client-side}

<table>
 <tbody>
  <tr>
   <td> <strong>resourceType</strong></td>
   <td>social/enablement/components/hbs/myassigned</td>
  </tr>
  <tr>
   <td> <a href="/help/communities/scf.md#add-or-include-a-communities-component"><strong>includable</strong></a></td>
   <td>No</td>
  </tr>
  <tr>
   <td> <a href="/help/communities/clientlibs.md"><strong>clientllibs</strong></a></td>
   <td>cq.social.enablement.hbs.breadcrumbs<br /> cq.social.enablement.hbs.myassigned<br /> cq.social.enablement.hbs.resource<br /> cq.social.enablement.hbs.learningpath</td>
  </tr>
  <tr>
   <td> <strong>templates</strong></td>
   <td> /libs/social/enablement/components/hbs/myassigned/myassigned.hbs</td>
  </tr>
  <tr>
   <td> <strong>css</strong></td>
   <td> /libs/social/enablement/components/hbs/myassigned/clientlibs/myassigned.css</td>
  </tr>  
 </tbody>
</table>

### Completion and Success Status {#completion-and-success-status}

Completion and Success status are used in reports and status banners on Assignments.

Completion Status:

* Not Assigned
* Not Started (New)
* In Progress
* Complete

Success Status:

* Unknown
* Pass
* Fail

The only possible Combinations of Completion and Success Status are:

| **Completion** |**Success** |
|---|---|
| Not Started |Unknown |
| In Progress |Unknown |
| Complete |Pass |
| Complete |Fail |

## Essentials for Server-Side {#essentials-for-server-side}

### Reference APIs {#reference-apis}

* [Enablement API](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/enablement/reporting/model/api/package-summary.html)

* [Reporting API](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/reporting/dv/api/package-summary.html)

* [Reporting Analytics API](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/reporting/dv/model/api/package-summary.html)

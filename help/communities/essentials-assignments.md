---
title: Assignments Essentials
seo-title: Assignments Essentials
description: Assignments feature overview for enablement communities
seo-description: Assignments feature overview for enablement communities
uuid: 8310decf-174d-4e93-8c92-4a9583077b7a
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: 796781e6-5cab-4ea1-b484-0945bc8febbf
---

# Assignments Essentials {#assignments-essentials}

This page provides the essential information for working with the assignments feature of [enablement community](overview.md#enablement-community) sites.

The assignments feature is the ability to assign enablement resources and learning paths to members of enablement communities.

## Essentials for Client-Side {#essentials-for-client-side}

<table> 
 <tbody>
  <tr>
   <td> <strong>resourceType</strong></td> 
   <td>social/enablement/components/hbs/myassigned</td> 
  </tr>
  <tr>
   <td> <a href="scf.md#add-or-include-a-communities-component"><strong>includable</strong></a></td> 
   <td>No</td> 
  </tr>
  <tr>
   <td> <a href="clientlibs.md"><strong>clientllibs</strong></a></td> 
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
  <tr>
   <td><strong> properties</strong></td> 
   <td>See <a href="assignments.md">Assignments Feature</a></td> 
  </tr>
 </tbody>
</table>

### Completion and Success Status {#completion-and-success-status}

Completion and Success status are used in reports as well as status banners on Assignments.

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

### Assignments Function {#assignments-function}

A community site structure that includes the [Assignments function](functions.md#assignments-function), includes a configured ` [assignments](assignments.md)` component.

### Reference APIs {#reference-apis}

* [Enablement API](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/enablement/reporting/model/api/package-summary.html)

* [Reporting API](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/reporting/dv/api/package-summary.html)

* [Reporting Analytics API](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/reporting/analytics/api/package-summary.html)
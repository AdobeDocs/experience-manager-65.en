---
title: Maintenance Release Vehicle Definitions
seo-title: Maintenance Release Vehicle Definitions
description: This article details the various types of AEM releases, including full releases, feature packs, and services packs.
seo-description: This article details the various types of AEM releases, including full releases, feature packs, and services packs.
uuid: 388fb6f5-0249-41e2-a460-1bb4cd0f8494
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.4/SITES
content-type: reference
topic-tags: deploying
discoiquuid: 32695db5-d62d-4959-8a24-3d56b4a19904
---

# Maintenance Release Vehicle Definitions{#maintenance-release-vehicle-definitions}

This document includes details about the various types of Adobe Experience Manager (AEM) releases, including full releases, feature packs, and services packs that Adobe delivers to its customers.

## Full Release {#full-release}

<table> 
 <tbody>
  <tr>
   <td><strong>Definition</strong></td> 
   <td>
    <ul> 
     <li>Scheduled release</li> 
     <li>Supports upgrade paths for specific versions, which is defined in the release notes</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Naming</strong></td> 
   <td>
    <ul> 
     <li>Version numbers for major releases increase based on the formula X+1.Y.Z. </li> 
     <li>Version numbers for minor releases increase based on the formula X.Y+1.Z</li> 
    </ul> <p>Where X is the primary version number, Y is the secondary version number, and Z the patch number.</p> </td> 
  </tr>
  <tr>
   <td><strong>Inclusions</strong></td> 
   <td>
    <ul> 
     <li>New features</li> 
     <li>Improvements</li> 
     <li>Bug fixes</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Documentation</strong></td> 
   <td>
    <ul> 
     <li>Release notes are available on the documentation portal</li> 
     <li>Documentation on features, improvements, and bug fixes are available on the documentation portal</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Cadence</strong></td> 
   <td>Yearly</td> 
  </tr>
  <tr>
   <td><strong>Availability and Installation</strong></td> 
   <td>
    <ul> 
     <li>Delivered as a standalone product installer</li> 
     <li>Available from Licensing Website and Managed Services Licensing Website</li> 
     <li>May require content repository migration</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Level of Testing</strong></td> 
   <td>Fully validated by QA</td> 
  </tr>
 </tbody>
</table>

## Service Pack {#service-pack}

<table> 
 <tbody>
  <tr>
   <td><strong>Definition</strong></td> 
   <td>
    <ul> 
     <li>Scheduled release</li> 
     <li>Currently, cannot be rolled back</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Naming</strong></td> 
   <td>
    <ul> 
     <li>Patch release number is a single digit number</li> 
     <li>After installation, will increase the installed release number patch digit, based on the formula X.Y.Z.SPx</li> 
     <li>Where X is the primary version number, Y is the secondary version number, and Z the patch number. x is the service pack number.</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Inclusions</strong></td> 
   <td>
    <ul> 
     <li>Improvements</li> 
     <li>Bug fixes</li> 
     <li>Common Interest feature packs (if any)</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Documentation</strong></td> 
   <td>
    <ul> 
     <li>Release notes available on the documentation portal</li> 
     <li>Documentation on features, improvements, bug fixes on the documentation portal</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Cadence</strong></td> 
   <td>Quarterly</td> 
  </tr>
  <tr>
   <td><strong>Availability and Installation</strong></td> 
   <td>
    <ul> 
     <li>Delivered as a package</li> 
     <li>Available on Package Share</li> 
     <li>Requires existing functional installation</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Level of Testing</strong></td> 
   <td>
    <ul> 
     <li>All fixes QA validated</li> 
     <li>Overall package sanity with automation runs</li> 
    </ul> </td> 
  </tr>
 </tbody>
</table>

## Cumulative Fix Pack (AEM <= 6.3) {#cumulative-fix-pack-aem}

<table> 
 <tbody>
  <tr>
   <td><strong>Definition</strong></td> 
   <td>
    <ul> 
     <li>Single delivery model of releasing fixes</li> 
     <li>Aggregator content package containing content package of individual components</li> 
     <li>CFPs are rollover of hot fixes and no improvements are part of it.</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Naming</strong></td> 
   <td><p>X.Y.Z.CFPx</p> <p>Where X is the primary version number, Y is the secondary version number, and Z the patch number. x is the cumulative service pack number.</p> </td> 
  </tr>
  <tr>
   <td><strong>Inclusions</strong></td> 
   <td><p>CFP is cumulative fix pack containing fixes of all components through specified dates. For example, if a customer applies CFP3, then CFP3 = CFP1 + CFP2.</p> </td> 
  </tr>
  <tr>
   <td><strong>Documentation</strong></td> 
   <td>Release notes available on the documentation portal</td> 
  </tr>
  <tr>
   <td><strong>Cadence</strong></td> 
   <td>Monthly</td> 
  </tr>
  <tr>
   <td><strong>Availability and Installation</strong></td> 
   <td>
    <ul> 
     <li>Delivered as a package</li> 
     <li>Available on Package Share</li> 
     <li>Dependent on the latest service pack released</li> 
     <li>CFP is self-dependant. Customers need not worry about finding/resolving dependencies. CFP should be installed on latest released Service Pack.</li> 
     <li>CFP can be installed as a single package, which improves customer experience.</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Level of Testing</strong></td> 
   <td>QA validated at Integration level and regression testing</td> 
  </tr>
 </tbody>
</table>

## Oak Cumulative Fix Pack {#oak-cumulative-fix-pack}

<table> 
 <tbody>
  <tr>
   <td><strong>Definition</strong></td> 
   <td>
    <ul> 
     <li>Similar to a standard CFP, but only contains Oak related fixes</li> 
     <li>COFP is self-dependant (no dependencies). Customers need not worry about finding/resolving dependencies. [1]</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Naming</strong></td> 
   <td>oak &lt;version&gt;</td> 
  </tr>
  <tr>
   <td><strong>Inclusions</strong></td> 
   <td>COFP is cumulative fix pack containing fixes of all Oak components for a specific 1.x version. For example, if the customer applies COHF 1.x.3, then COHF 1.x.3. = COHF 1.x.1 + COHF 1.x.2.</td> 
  </tr>
  <tr>
   <td><strong>Documentation</strong></td> 
   <td> </td> 
  </tr>
  <tr>
   <td><strong>Cadence</strong></td> 
   <td><p>As necessary</p> </td> 
  </tr>
  <tr>
   <td><strong>Availability and Installation</strong></td> 
   <td>
    <ul> 
     <li>The COFP installation process has been simplified to improve customer experience. (Customers can just install a single package for all components).</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Level of Testing</strong></td> 
   <td><p>QA validated</p> </td> 
  </tr>
 </tbody>
</table>

## Hot Fix {#hot-fix}

<table> 
 <tbody>
  <tr>
   <td><strong>Definition</strong></td> 
   <td><p>Package that includes one or more files created to solve a product defect that significantly degrades essential services or significantly impacts business operations. </p> </td> 
  </tr>
  <tr>
   <td><strong>Naming</strong></td> 
   <td>cq-&lt;Release Version&gt;-hotfix-&lt;hotfix ID&gt;-&lt;hotfix version&gt;</td> 
  </tr>
  <tr>
   <td><strong>Inclusions</strong></td> 
   <td>Includes fixes for a specific issue</td> 
  </tr>
  <tr>
   <td><strong>Documentation</strong></td> 
   <td>Release notes of the public hotfixes are only available based on customer request through the AEM Support Portal.</td> 
  </tr>
  <tr>
   <td><strong>Cadence</strong></td> 
   <td>As necessary</td> 
  </tr>
  <tr>
   <td><strong>Availability and Installation</strong></td> 
   <td>
    <ul> 
     <li>Delivered as a package</li> 
     <li>Available on Package Share</li> 
     <li>Dependent on the latest service pack released</li> 
     <li>Most hot fixes are stand-alone, unless specified. Can be installed in any order. Can be verified through the Package Share Details tab of the Dependencies element.</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Level of Testing</strong></td> 
   <td>
    <ul> 
     <li>Validated by Customer Care</li> 
     <li>AEM hot fixes do not benefit from the same level of quality assurance as service packs or product releases. Therefore, they should first be validated on a staging environment as part of the quality deployment processes.</li> 
    </ul> </td> 
  </tr>
 </tbody>
</table>

## Overlay {#overlay}

<table> 
 <tbody>
  <tr>
   <td><strong>Definition</strong></td> 
   <td> </td> 
  </tr>
  <tr>
   <td><strong>Naming</strong></td> 
   <td>overlay-&lt;ticket ID&gt;</td> 
  </tr>
  <tr>
   <td><strong>Inclusions</strong></td> 
   <td>Bug fix for a JS or JSP file</td> 
  </tr>
  <tr>
   <td><strong>Documentation</strong></td> 
   <td>None</td> 
  </tr>
  <tr>
   <td><strong>Cadence</strong></td> 
   <td>As necessary</td> 
  </tr>
  <tr>
   <td><strong>Availability and Installation</strong></td> 
   <td>
    <ul> 
     <li>Delivered as package by AEM Customer Care</li> 
     <li>Not necessarily included in service packs or full releases</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Level of Testing</strong></td> 
   <td>Validated by Customer Care</td> 
  </tr>
 </tbody>
</table>

## Feature Pack {#feature-pack}

<table> 
 <tbody>
  <tr>
   <td><strong>Definition</strong></td> 
   <td>
    <ul> 
     <li>Feature Packs are add-on functionalities and are delivered via Service Packs. If an AEM version has released its last service pack, Adobe will not deliver any feature pack for it in future.</li> 
     <li>FPs contain product enhancements, scheduled for a subsequent product release, but delivered early based on the decision of Adobe's Product Management.</li> 
     <li>Features are always merged with the next major release and then backported to the AEM version required by the customer</li> 
     <li>Common Interest and GA feature packs are merged into the next service pack</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Naming</strong></td> 
   <td>cq-&lt;Release Version&gt;-featurepack-&lt;featurepack ID&gt;-&lt;featurepack version&gt;</td> 
  </tr>
  <tr>
   <td><strong>Inclusions</strong></td> 
   <td>
    <ul> 
     <li>New features</li> 
     <li>Improvements</li> 
     <li>Bug fixes (incremental product updates)</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Documentation</strong></td> 
   <td>Documentation is available on helpx.adobe.com.</td> 
  </tr>
  <tr>
   <td><strong>Cadence</strong></td> 
   <td>Varies with Product area</td> 
  </tr>
  <tr>
   <td><strong>Availability and Installation</strong></td> 
   <td>
    <ul> 
     <li>Delivered as a package</li> 
     <li>Available on Package Share. Customers accept Adobe's Terms and Conditions through Package Share.</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Level of Testing</strong></td> 
   <td>General Availability feature packs are QA validated</td> 
  </tr>
 </tbody>
</table>

* [1]: OAK fixes are not delivered as individual hot fixes. However, they are included in the subsequent Cumulative Oak hot fix. If necessary, a diagnostic build on top of the latest COFP can be made available. The precondition is that the customer has the latest COFP running. Diagnostic builds only provide the same level quality assurance as a hot fix. Therefore, they don't provide the same level of quality assurance as a cumulative fix pack, service pack, or product release. The final fix is delivered with the next COFP.


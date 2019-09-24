---
title: General Release Notes for Adobe Experience Manager 6.5
seo-title: Release Notes
description: Adobe Experience Manager 6.5 notes outlining the release information, what's new, how to install, and detailed change lists.
seo-description: Adobe Experience Manager 6.5 notes outlining the release information, what's new, how to install, and detailed change lists.
uuid: b059456b-9d2f-469b-ae44-239ba0bc59f0
contentOwner: chuesler
topic-tags: release-notes
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5
discoiquuid: 78d3b4b0-f09d-4a2e-869c-fe3e6d80020a
index: y
internal: n
snippet: y
---

# General Release Notes for Adobe Experience Manager 6.5{#general-release-notes-for-adobe-experience-manager}

## Release Information {#release-information}

<table border="1" cellpadding="1" cellspacing="0" width="781"> 
 <tbody>
  <tr>
   <th>Product</th> 
   <td>Adobe Experience Manager<br /> </td> 
  </tr>
  <tr>
   <th>Version</th> 
   <td>6.5</td> 
  </tr>
  <tr>
   <th>Type</th> 
   <td>Major Release</td> 
  </tr>
  <tr>
   <th>General availability date</th> 
   <td>April 8, 2019<br /> </td> 
  </tr>
  <tr>
   <th>Recommended Updates</th> 
   <td>See <a href="https://helpx.adobe.com/experience-manager/aem-releases-updates.html">AEM Releases and Updates</a></td> 
  </tr>
 </tbody>
</table>

### Trivia {#trivia}

The release cycle for this version of Adobe Experience Manager started April 4, 2018, went through 23 iterations of quality assurance and bug fixing, and ended on March 28th, 2019. The total number of customer related issues including enhancements and new features fixed in this release is 1345.

Adobe Experience Manager 6.5 is generally available since April 8, 2019.

![AEM 6.5 Login Screen](assets/aem65-login-v4.png)

## What's New {#what-s-new}

Adobe Experience Manager 6.5 is an upgrade release to the Adobe Experience Manager 6.4 code base. It provides new and enhanced functionality, key customer fixes, high priority customer enhancements and general bug fixes oriented toward product stabilization. It also includes Adobe Experience Manager 6.4 Service Pack releases up to SP4.

The list below provides an overview - while the subsequent pages list the full details.

### Experience Manager Foundation {#experience-manager-foundation}

Full list of changes in [AEM Foundation](release-notes/wcm-platform.md).

The platform of Adobe Experience Manager 6.5 build on top of updated versions of the OSGi-based framework (Apache Sling and Apache Felix) and the Java Content Repository: Apache Jackrabbit Oak 1.10.2.

The Quickstart uses Eclipse Jetty 9.4.15 as servlet engine.

#### Java Support  {#java-support}

* New support for Java 11, as well as the already supported Java 8
* For optimal performance, override default GC values with other values. For more information, please see the [Install & Update](sites/deploying/using/custom-standalone-install.md) section.
* Java 11 and Java 8 maintenance updates will be distributed by Adobe for customer usage in AEM-related projects, when not publicly available from Oracle

#### Java Development {#java-development}

* There are now [two versions of the Uberjar](sites/developing/using/ht-projects-maven.md#experience-manager-api-dependencies), a recommended version with public interfaces that are not marked for deprecation, as well as a version that includes interfaces marked for deprecation.

#### User Interface {#user-interface}

Various enhancements have been made to the UI to make it more productive and easier to use.

* New Permissions Management UI for Users and Groups 
* Column Views now also only loads entries that are visible on the screen and only loads more when the user is starting to scroll. List and Card view already did that since 6.0 (improved in 6.4)
* Column Views now include the workflow status for pages/assets when applicable
* The [Select All](sites/authoring/using/basic-handling.md#select-all) action is a quick way to execute an action with all pages/assets in the same folder
* The [Select All](sites/authoring/using/basic-handling.md#select-all) action attempts to perform the action to all pages/assets, not just what has been loaded. A warning dialog will be shown if the action has not been upgraded to handle Bulk Actions

>[!CAUTION]
>
>Adobe does not plan to make further enhancements to the Classic UI. AEM 6.5 has the Classic UI included, and customers upgrading from earlier releases can keep using it as is. Note that Classic UI remains fully supported while being deprecated. [Read more](sites/deploying/using/ui-recommendations.md).

#### Search & Indexing {#search-indexing}

* Search in Oak now supports dynamic facets. For exampe the filter rail in assets search show the estimated amount of results.
* QueryBuilder was extended to provide results with dynamic facets

#### Upgrade {#upgrade}

* Direct in-place upgrade to AEM 6.5 is supported for customers running AEM 6.2, 6.3 and 6.4. Customers using 5.x or 6.0/6.1 that want to use in-place upgrade need to upgrade to 6.4 first - and then upgrade to 6.5, or upgrade via transfer of the content between the instances directly to AEM 6.5.

#### Projects and Workflows {#projects-and-workflows}

* New Workflow Model editor introduced in 6.4 has been improved to include more operations like Copy and Publish, Variable support in Workflow steps and enhanced OR and AND splits.

### Experience Manager Sites {#experience-manager-sites}

Full list of changes in [AEM Sites and Add-ons](release-notes/sites.md).

#### Managed Single-page Apps {#managed-single-page-apps}

The Page Editor adds the ability to in-context edit content and compose/layout within client-side rendered experiences (also known [as SPA Editor](sites/developing/using/spa-architecture.md)). Existing single-page apps build with JavaScript framework React or Angular can be extended with the AEM SJ SDK to be made editable for practitioners.

First shipped as part of AEM 6.4 SP2, with AEM 6.5 the SPA support gains following capabilities:

* Use Template Editor to edit and configure the AEM editable parts of the SPA
* Use Multi-site Management to create country, franchise or white-labeled SPA experiences

#### Headless Content Management {#headless-content-management}

AEM has the ability to serve the content in various formats and from various levels of the stack. Some have been around since 2008 with the [Sling GET](https://sling.apache.org/documentation/bundles/rendering-content-default-get-servlets.html) and [POST Servlet](https://sling.apache.org/documentation/bundles/manipulating-content-the-slingpostservlet-servlets-post.html). Content Services ([Sling Model Exporter](https://helpx.adobe.com/experience-manager/kt/platform-repository/using/sling-model-exporter-tutorial-develop.html)) was introduced in AEM 6.3 and is the method used by the AEM SJ SDK to hydrate single-page apps. The [HTTP API for Assets](assets/using/mac-api-assets.md) is a CRUD API, that was extended for AEM 6.5.

New HTTP API capabilites:

* Added [Content Fragment support to HTTP API for Assets](assets/using/assets-api-content-fragments.md) to create, update, read and delete fragments.
* Expose lists of Content Fragments via Content Services with the [Content Fragment List Core Component](http://opensource.adobe.com/aem-core-wcm-components/library/content-fragment-list.html).
* [Core Component Library](http://opensource.adobe.com/aem-core-wcm-components/library.html) that shows the default Content Services JSON output for each component

#### Screens Add-on {#screens-add-on}

Efficiently design, deliver and optimize experiences on all digital displays from interactive kiosks to digital signage.

**Design**

* Unify experiences and content across digital and in-store with improved content reuse
* Streamlined authoring and approval/publishing workflows with support for Launches
* Edit and deliver rich interactive experiences using SPA Editor

**Deliver**

* Expanded media player support with robust on-line and offline operation (Smart Sync) able to scale to even the largest signage networks.

**Optimize**

* Personalize by location or configuration of data triggered content by using dynamic placeholders.
* Unified insights driven by Adobe Analytics integration into the AEM Screens Player

For more details on changes to AEM Screens - see the Release Notes in the [AEM Screens User Guide](/screens/user-guide.md).

### Experience Manager Assets {#experience-manager-assets}

Full list of changes in [AEM 6.5 Assets release notes](release-notes/assets.md).

AEM 6.5 introduces the following capabilities and enhancements to boost productivity of AEM users, DAM roles, and associated creative and marketing roles.

#### Integration with Adobe Creative Cloud {#integration-with-adobe-creative-cloud}

Introduction of [Adobe Asset Link](https://helpx.adobe.com/enterprise/using/adobe-asset-link.html), an in-app experience for creative users working in Adobe Creative Cloud applications, including Photoshop, Illustrator, and InDesign, streamlines collaboration between creatives and marketers in the content creation process. AEM Desktop App continues to support the needs of users working with assets from AEM on desktop, using any file type and any destkop application.

Additionally, AEM integrates with Adobe Stock to help find, preview, license and save Adobe Stock assets directly from the AEM Web UI.

![Asset Link panel in Photoshop](assets/aem65-assetlink-photoshop.png)

#### Connected Assets {#connected-assets}

Connected Assets capability is targeted at larger deployments with a number of AEM Sites deploymetns that need to leverage assets from a central AEM Assets DAM deployment. It allows for improving governance around assets managed centrally while allowing for high efficiency of supplying assets to the various Sites deployments.

### Dynamic Media {#dynamic-media}

Dynamic Media provides enhanced rich-media authoring and delivery in AEM Assets to drive cutting-edge experiences that are both immersive and personalized. With a single high-quality master asset, you can leverage our advanced cloud rendering, Smart Crop, and best-in-class viewers to deliver the most engaging experiences with industry-leading performance.

New features include:

* Support for 360-video & VR headsets
* Custom Video Thumbnails
* Enhanced accessibility support
* Hotlinking protection

#### User Experience and Search {#user-experience-and-search}

Key enhancements help to find the right assets faster by providing dynamic search facets, and to manage multiple assets more efficiently by providing ability to select all assets from any folder or search result.

### Experience Manager Forms {#experience-manager-forms}

AEM 6.5 Forms brings in several new features and enhancements. The highlights include:

* 
* 
* 
* 
* 
* Transaction reports to track the number of submitted forms, processed documents, and rendered documents
* Usability improvements to interactive communications
* Cloud-based digital signatures in adaptive forms
* Embed adaptive forms and interactive communications in a AEM Sites single page applications (SPA). 
* Support for variables in AEM Workflows  
* Data display pattern support in interactive communications
* Sorting adaptive forms and interactive communication tables
* Automated validation of input data in form data models

See the [Summary of new features and enhancements in AEM 6.5 Forms](forms/using/whats-new.md) for information about new and improved features and documentation resources.******`<sub>``<sup>``<strike>`

*** *`<sub>``<sup>``<strike>`****`<sub>``<sup>``<strike>`

### Experience Manager Communities {#communitiesreleasenotes}

AEM 6.5 adds new features and enhancements to Communities. The highlights for this release are:

* Registered member tagging (@mention) supported while authoring User Generated Content.
* Direct bulk messaging to group of members, is now supported.
* Custom filters developed and added in bulk moderation UI. A [sample project](https://github.com/Adobe-Marketing-Cloud/aem-communities-extensions/tree/master/aem-communities-moderation-filter) demonstrating filtering by tags can be used as a base to develop analogous custom filters.
* New List View provided with improved UI in Bulk Moderation.
* Separate administrators for different community sites and nested groups can be assigned, instead of a single community administrator.
* Enablement functionality of AEM 6.5 Communities supports [(SCORM) 2017.1](https://rusticisoftware.com/blog/scorm-engine-2017-released/) engine.
* Keyboard navigation support on enablement components for improved accessibility.
* Apache Solr 7.0 supported while setting up MSRP and DSRP.

For detailed list of changes, see [AEM 6.5 Communities release notes](release-notes/communities-release-notes.md).

### Experience Manager Livefyre {#experience-manager-livefyre}

You can integrate Livefyre with your AEM 6.5 instance. Information on how to integrate Livefyre with AEM is located here:

* [Integrating Livefyre](https://helpx.adobe.com/experience-manager/6-4/sites/administering/using/livefyre.html)

### Leverage Customer Focused Development {#leverage-customer-focused-development}

Adobe is using a customer focused development model that allows customers to contribute to all stages of the development process, during specification, development and testing. Our thanks goes to all contributing customers and partners in this process.

Adobe has the procedures and processes in place to enable collection, prioritization, and tracking of customer focused bug resolution and enhancement request development. The [Adobe Marketing Cloud Support Portal](http://helpx.adobe.com/marketing-cloud/contact-support.html) is integrated with the Adobe Enhancement & Defect Tracking System. Customer questions are identified and resolved with Customer Care where possible. When escalated to R&D, all customer information is captured, and used for prioritization and reporting purposes. Priority is given in development to paid support and warrantee issues and paid customer enhancements.

This process of prioritization has yielded more than 750 customer focused changes fixed in AEM 6.5.

## List of files that are part of the Release {#list-of-files-that-are-part-of-the-release}

**Foundation**

* Standalone Quickstart: cq-quickstart-6.5.0.jar
* Application Server Quickstart: cq-quickstart-6.5.0.war
* Dispatcher 4.3.2 or later for the various web servers and platforms ([download link](https://helpx.adobe.com/experience-manager/dispatcher/release-notes.html))
* Plug-in for Eclipse IDE ([read more and download](/sites/developing/using/aem-eclipse.md))  

* Extension for Brackets Code Editor ([read more and download](/sites/developing/using/aem-brackets.md))
* Maven/Gradle dependencies ([download link](https://repo.adobe.com/nexus/content/repositories/releases/com/adobe/aem/uber-jar/6.5.0/))

**Sites**

* Core Components ([GitHub project](https://github.com/adobe/aem-core-wcm-components))
* We.Retail Reference implementation ([read more](/sites/developing/using/we-retail.md))
* Maven Project Archetypes:

    * for full-stack sites: [GitHub project](https://github.com/adobe/aem-project-archetype)
    * for single-page apps with React/Angular: [GitHub project](https://github.com/adobe/aem-spa-project-archetype)

* AEM Screens Players for various target platforms ([download](http://download.macromedia.com/screens/))

* Smart Content Language Models. English is pre-installed - more languages can be downloaded

    * [German](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq630/product/smartcontent-model-de)
    * [Spanish](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq630/product/smartcontent-model-es)
    * [Italian](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq630/product/smartcontent-model-it)
    * [French](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq630/product/smartcontent-model-fr)

* AEM Modernize Tools Suite e.g. Dialog Conversion Tool. ([GitHub project](https://github.com/adobe/aem-modernize-tools))

**Assets**

* Package to add enhanced PDF Rasterizer ([read more](assets/using/aem-pdf-rasterizer.md))
* Package to add extended RAW image support ([read more](assets/using/camera-raw.md))

**Forms**

* [Packages for AEM Forms capabilities](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html)
* [AEM Forms OSGi Client SDK](https://repo.adobe.com/nexus/content/repositories/public/com/adobe/aemfd/aemfd-client-sdk/6.0.80/)

## Languages {#languages}

The user interface is available in following languages:

* English
* German
* French
* Spanish
* Italian
* Brazilian Portuguese
* Japanese
* Simplified Chinese
* Traditional Chinese (limited support)
* Korean

Experience Manager 6.5 has been certified for GB18030-2005 CITS to use the Chinese Encoding Standard.

## Install & Update {#install-update}

See [installation instructions](sites/deploying/using/custom-standalone-install.md) for setup requirements.

Please see [upgrade documentation](sites/deploying/using/upgrade.md) for detailed instructions.

## Supported Platforms {#supported-platforms}

Please find the complete matrix of supported platforms incl. Support-Level on [AEM 6.5 Technical Requirements](sites/deploying/using/technical-requirements.md)

Oak MicroKernel for  
Oak MicroKernel for  

>[!NOTE]
>
>Oracle has moved to a "Long Term Support" (LTS) model for Oracle Java SE products. Java 9 and 10 are non-LTS releases by Oracle (see [Oracle Java SE support roadmap](http://www.oracle.com/technetwork/java/eol-135779.html)). Adobe will only provide support for LTS releases of Java to run AEM in production. Therefore Java 11 is the recommended version to use with AEM 6.5.

## Deprecated and Removed Features {#deprecated-and-removed-features}

Adobe constantly evaluates capabilities in the product and over time plans to replace capabilities with more powerful versions, or decides to re-implemented selected parts to be better prepared for future expectations or extensions.

For Adobe Experience Manager 6.5, [read the list of deprecated and removed capabilities](release-notes/deprecated-removed-features.md). The page also contains pre-announcement of changes in the near future and important notice for customers that update from prior releases.

## Known Issues {#known-issues}

[List of known issues](release-notes/known-issues.md)

### Product Download and Support (Restricted Sites) {#product-download-and-support-restricted-sites}

These sites are only available to customers. If you are a customer and need access, please contact your Adobe account manager.

* [](http://daycare.day.com) [Product Download at licensing.adobe.com](http://licensing.adobe.com/)

* [Customer Support at daycare.day.com](http://daycare.day.com)


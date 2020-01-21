---
title: AEM 6.5 Service Pack Release Notes
description: Release notes specific to Adobe Experience Manager 6.5 Service Pack 3.
uuid: c7bc3705-3d92-4e22-ad84-dc6002f6fa6c
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5
discoiquuid: 25542769-84d1-459c-b33f-eabd8a535462
docset: aem65

---

# AEM 6.5 Service Pack Release Notes {#aem-service-pack-release-notes}

## Release Information {#release-information}

| Products |**Adobe Experience Manager (AEM) 6.5** |
|---|---|
| Version |6.5.3.0 |
| Type |Service Pack Release |
| Date |December 12, 2019 |
| Download URL | AEM 6.5.3.0 on [PackageShare](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq650/servicepack/AEM-6.5.3.0), [Software Distribution](https://downloads.experiencecloud.adobe.com/content/software-distribution/en/aem.html#package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.3.zip) |

## What's included in AEM 6.5.3.0 {#what-s-included-in-aem}

AEM 6.5.3.0 is an important release that includes performance, stability, security, and key customer fixes and enhancements released since the general availability of AEM 6.5 in **April 2019**. It can be installed on top of AEM 6.5.

Some key highlights of this service pack release are:

* The built-in repository (Apache Jackrabbit Oak) is updated to version 1.10.6.

* Experience Manager Assets now supports ZIP archives created using Deflate 64 algorithm.

* New column for created date, which is sortable, has been added in DAM list view and on asset search results in list view.

* Asset sorting based on Name column has been enabled in List view.

* Dynamic Media now supports Smart Crop video assets. Smart Crop is  a machine learning driven feature that re-crops a video while moving the frame to follow the focal point of the scene.

* Dynamic Media supports Smart Imaging.

* Ability to [set Out of Office](../forms/using/configure-out-of-office-settings.md) preferences in AEM workflows.

* Ability to [share Inbox or Inbox items](../forms/using/configure-shared-queues-osgi.md) with other users in AEM workflows.

* Ability to [generate Interactive Communications in a Batch mode](../forms/using/generate-multiple-interactive-communication-using-batch-api.md).

* Updated version of jQuery bundled in ContextHub to 3.4.1.

### List of changes {#list-of-changes}

#### Assets {#assets-6530-enhancements}

**Product Enhancements**

* Experience Manager Assets now supports ZIP archives created using Deflate 64 algorithm (NPR-27573).

* New column for created date, which is sortable, has been added in DAM list view and on asset search results in list view (NPR-31312).

* Asset sorting based on Name column has been allowed in List view (NPR-31299).

* The GLB, GLTF, OBJ, and STL asset files support asset preview in Asset Details page in DAM (CQ-4282277).

* ReplicationOnModifyListener event is triggered for chunk nodes during chunk upload in Dynamic Media (CQ-4281279).

* Dynamic Media now supports Smart Crop video assets. Smart Crop is  a machine learning driven feature that re-crops a video while moving the frame to follow the focal point of the scene (CQ-4278995).

* Dynamic Media supports Smart Imaging (CQ-4222249).

* Search/ browse view has been set as default view in Foundation picker if query parameters are passed in request (NPR-31601).

**Fixes**

* Metadata for some PDF documents is not updated and saved to the PDF on modifying its title (NPR-31629).

* Asset sharing does not work for assets having plus '+' character in their names (NPR-31547).

* Edits in the default search form Assets Admin * Search Rail do not work as expected (NPR-31502).

* Suggestions are not shown when using Omnisearch on assets view for searching assets (NPR-31496).

* Asset references within collections are not updated when the referenced assets are moved to another location, in cases where the same assets are referenced by different collection by different users (NPR-31486).

* Duplicate IPTC tags are added to asset metadata (NPR-31328).

* The search result count on the top right corner does not update accurately when search is triggered from the filter rail (NPR-31316).

* All the check boxes are cleared on unselecting the second level check boxes in File Type filter, and text in the search bar is not in sync with the selected/ unselected  properties (NPR-31287).

* All the members (users/ groups) cannot be removed from the Members section of a folder; on attempting to remove all the users, logged in user gets added to the list  (NPR-31171).

* Assets with plus '+' symbol in the file name cannot be deleted (NPR-31162).

* Create drop down menu, which is visible in top menu on selecting a folder, does not show 'Folder' as a create option (NPR-30877).

* Folder selection Create > FileUpload action item is missing when ACL for Deny jcr:removeChildNodes and jcr:removeNode on path are applied for a user (NPR-30840).

* DAM workflows go into stale state when certain mp4 assets are uploaded, causing all the remaining workflows to go into stale state (NPR-30662).

* Out of Memory Error is observed when a large PDF files (of several Gigabytes) is uploaded to DAM and its sub-assets are processed (NPR-30614).

* Bulk movement of assets is failing and displaying warning message (NPR-30610).

* Asset names are changed to lower case when moving assets from one folder to another in AEM running on Dynamic Media Scene 7 runmode (NPR-31630).

* Error is observed while editing a remote imageset, for the image residing in the folder named same as Scene 7 company name (NPR-31340).

* Dynamic Media assets containing references are not getting published (NPR-31180).

* Uploads from AEM Dynamic Media - Scene 7 runmode to Scene 7 are taking too long to complete (NPR-31048).

* Hotspot added to an image asset is not visible through Interactive Image Viewer in asset details page (NPR-30979).

* Huge sling jobs are created and Processing banner re-appears when actions done on assets in AEM Assets are passed to Scene 7 (NPR-30947).

* Conflict occurs on creating Language Copy of assets and assets are not uploaded to Scene 7 (NPR-30932).

* Dynamic renditions downloaded from AEM running on Dynamic Media Hybrid mode are broken (they are of text type with content 'unable to find image' instead of image content type) (NPR-30876).

* Dynamic Media Encode Video workflow is failing to generate thumbnail for the video that is migrated from Scene 7 to Dynamic Media - Scene 7 run mode (CQ-4282011).

* IpsApiException observed while migrating assets from one instance to another using different Scene 7 company IDs (CQ-4280548).

* 3D Asset thumbnail is not informative, when a supported 3D model is ingested into AEM (CQ-4283701).

* Scroll buttons are displayed in viewer, if a 3D asset has few camera views (CQ-4283322).

* Incorrect container height of an uploaded 3D model previewed in DimensionalViewer on Asset Details page (CQ-4283309).

* Videos cannot be played with SmartCropVideoViewer on Internet Explorer 11 and Safari (CQ-4281422).

* Use of move button to move multiple assets, from one folder to another, fails in AEM running on Dynamic Media - scene7 runmode (CQ-4280384).

* Distorted video is seen on asset details when MIME type is other than MP4 (CQ-4279704).

* Videos newly ingested in folders with video profile remain in processing state even after encode percentage completes to 100% (CQ-4279389).

* Moving assets from a folder creates large numbers of sling jobs (Scene 7 API calls) than ideally required (CQ-4278664).

* Names of the imageset are changed to lower case in Scene 7, when imageset (or mediaset) is created and named with appropriate naming convention in DAM (CQ-4281112).

* Scene 7 Migrator sets publish state incorrectly (CQ-4263492).

* Touch UI search (done through Omnisearch) results page automatically scrolls up and loses user's scroll position in Content Fragments (CQ-4282898).

* PDF files are not indexed and content within is not searchable (CQ-4278916).

* An error "Group not listed by user picker: expected false to equal true" is observed on adding Closed User Group with different `principalName` and `authorizableId` (CQ-4278177).

* Assets UI Column View is showing all paths regardless of specific tenant's dam root path (CQ-4278175).

* Asset selector’s search is not working as expected (CQ-4275886).

* Rendition Workflows are failing (CQ-4271928).

* DAM Event Purge deletes the latest (maxSavedActivities) event data and holds the data created earlier (NPR-31336).

* Touch UI search (done through Omnisearch) results page automatically scrolls up and loses user's scroll position (NPR-31307).

* The action bar and asset count are not updating on selecting all and then deselecting some items (folders/individual assets) in Touch UI (NPR-31118).

* An exception displays in AEM while polling for job details of an Asset (CQ-4283569).

#### Sites {#sites}

* If the LiveCopy inheritance is broken, live copy pages display language copy links instead of LiveCopy links (NPR-30980).
* For a new Blueprint, If the number of records is more than 40, only the first 40 records are displayed. Blueprint displays blank lines for the rest of the records (NPR-31182).
* When a user adds Japanese or Korean characters in the description property of a menu, the menu displays distorted characters for Japanese and Korean language text. (NPR-31331).
* Rich Text Editor (RTE) does not allow to insert an embedded Table as a list item (NPR-30879).
* Out of the box, scaffolding Rich Text Editor (RTE). applies inline font-size to elements, unexpectedly (NPR-31284).
* When a user focuses on left rail fields and uses a keyboard shortcut to paste content, it pastes the content of the page editor clipboard instead of the content copied from the left rail fields (NPR-31172).
* When a user adds a File Upload field to a multi-field, the image path is stored in the component node instead of the multi-field node (NPR-30882).
* The ResponsiveGridExporter API does not return com.day.cq.wcm.foundation.model.impl.export.AllowedComponentsExporter interface. The com.day.cq.wcm.foundation.model.impl package is declared as private package (NPR-31398).
* When a page containing some ExperienceFragments is opened in non-editor mode (either in Author without the `editor.html` prefix and `wcmmode=disabled`, or in Publisher)., the request ends in HTTP status error code 500 (NPR-30743).
* Users cannot change their password and access their profile page (NPR-31161).

#### Search and user interface {#search-ui-interface}

* When switching from the Card view to the List view on a search results page, there is a lag before the page can be scrolled (NPR-31286).

* The Select All checkbox is hidden in the List view on Sites UI (NPR-31614).

* The Select All count on a search result page is incorrect (NPR-31120).

* The metadata editor displays tags that do not exist (NPR-31119).

#### Translation {#translation}

* Two calendar pop-ups appear on selecting the Due Date option in a Translation Job (NPR-31270).

#### Platform {#platform}

* The Mime type option in the Web console does not work (NPR-31108).

* Client certificate is not accepted when configuring single sign-on (NPR-31165).

* Updates in buffer size configuration for Jetty-based HTTP service are not saved (NPR-30925).

* QueryBuilder now supports orderby ``fn:name()`` in xpath queries (NPR-31322).

* Duplicate activation tree is created on upgrading from AEM 6.3 (NPR-31513).

* Forwarded requests do not preserve response headers that are set during sling authentication (NPR-30013).

* Search within the picker components does not work (NPR-31692).

* An error is displayed when attaching a ZIP file to an AEM Communities post due to different versions of Apache POI and Apache Tika bundle (NPR-31018).

* The ``org.apache.sling.distribution.api`` bundle is hidden in the configuration manager and therefore not available to custom bundles (NPR-31720).

#### Projects {#projects}

* Switching calendar views does not work (NPR-31271).

#### Brand Portal {#assets-brand-portal}

**Product Enhancements**

* Asset Sourcing import workflow in AEM Assets is modified to fetch only the newly created assets from Brand Portal to AEM, and skip the assets that already exist in the NEW folder to avoid replication (CQ-4278527).

**Fixes**

* Incorrect icon appears on creating a new Contribution folder in Asset Sourcing feature (CQ-4282825).
* On creating a new Contribution folder, one or both subfolders (NEW and SHARED) does not appear inside the Contribution folder (CQ-4282424).
* System throws an exception if the user tries to republish Contribution folder from AEM to Brand Portal after receiving new assets in the Contribution folder from Brand Portal end (CQ-4279740).
* Creation of Contribution folder within a Contribution folder (nested folder) is prohibited to avoid complexity (CQ-4278391).
* System throws an exception on uploading the Brand Portal user list (.csv file) imported from AEM Admin Console. Only Email, FirstName, and LastName fields in the .csv file are mandatory (CQ-4278390).

#### Communities {#communities}

**Fixes**

* Quick links to manage groups (Open/Edit/Publish/Delete Groups) are not visible to the Community administrators (Group admin/Site admin) (NPR-31627).
* A submitted blog is not displayed unless the page is manually refreshed/reload (NPR-31599).
* The JCR query used by the "Mentions" feature is case sensitive and takes too long to return results (NPR-31475).
* AEM 6.5 Uber jar file throws exception, `cq-social-translation` bundle missing from AEM 6.5 Uber jar file (NPR-31186).
* Jackson Databind libraries updated to version 2.9.9.3 to address new vulnerabilities (NPR-30967).
* Activities and Notifications titles are inconsistent (NPR-30941).
* Pagination is not working properly in Communities Blogs (NPR-30914).
* Analytics reports are not populated in AEM author environment, blank page appears (NPR-30913).

#### Oak {#oak}

* Lucene index updates causing author server to slow down (NPR-31548).

#### Forms {#forms-6530}

>[!NOTE]
>
>AEM Service Pack does not include fixes for AEM Forms. They are delivered using a separate Forms add-on package. In addition, a cumulative installer is released that includes fixes for AEM Forms on JEE. For more information, see [Install AEM Forms add-on](#install-aem-forms-add-on-package) and [Install AEM Forms JEE installer](#install-aem-forms-jee-installer).

##### Forms add-on package {#forms-add-on-package-6530}

**Adaptive Forms**

* Strings contain the dictionary key while localizing adaptive forms (NPR-31110).

**Interactive Communication**

* **MissingNode.toString()** returns inaccurate results after upgrading Jackson libraries to 2.10.0 (NPR-31549).

* Text editor randomly removes space characters from the text copied from Microsoft Word (NPR-31113).

**Correspondence Management**

* Captions and tooltips do not display while migrating letters from LiveCycle ES4SP1 to AEM 6.5 (NPR-31615).

* **Textflow formatting is no more supported** error message displays while saving letters as drafts (NPR-30463).

**Workflow**

* OSGi workflow fails due to 100% CPU utilization (NPR-31233).

**HTML5 Forms**

* Generating HTML5 preview of an XDP form displays a flicker while adding instances of a subform (NPR-30909).

##### Forms JEE installer {#forms-jee-installer-6530}

**Forms - Document Services**

* SOAP web service using MTOM in a .NET project displays exceptions for AssemblerServiceClient invoke and HtmlToPDF2 methods (NPR-4281771).

**Foundation JEE**

* Action configuration does not load the process names for Invoke a Forms Workflow submit action (NPR-31478).

### Feature Packs Included {#feature-packs-included-6530}

>[!NOTE]
>
>For AEM Forms customers, it is essential to install AEM Forms add-on package after installing any AEM Service Pack, Cumulative Fix Pack, or Feature Pack.

#### Forms - Foundation JEE {#forms-foundation-jee-feature}

* AEM Forms support for Oracle 18c (NPR-29155).

## Install 6.5.3.0 {#install}

**Setup requirements**

* AEM 6.5.3.0 requires AEM 6.5. Check [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions.
* The Service Pack download is available on Adobe Package Share, which you can access directly from the AEM 6.5 instance.
* On a deployment with MongoDB and multiple instances, install AEM 6.5.3.0 on one of the Author instances using the Package Manager.
* Before installing the service pack, ensure to have a snapshot or fresh backup of your AEM instance.
* Restart the instance before installation. While that is only needed when the instance is still in update mode (and this is the case when the instance was updated from an earlier version), it is recommended if the instance was running for longer period.

>[!CAUTION]
>
>Adobe does not recommend removing or uninstalling the AEM 6.5.3.0 package.

### Install the Service Pack via Package Share {#install-service-pack-via-package-share}

Perform the following steps to install the Service Pack on an existing AEM 6.5 instance:

1. Login to Package Share within AEM or directly from your browser and download the [AEM 6.5.3.0 package](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq650/servicepack/AEM-6.5.3.0).
   (search for "AEM-6.5.3.0" to find it)

1. Install the downloaded package using Package Manager.

>[!NOTE]
>
>**Dialog on Package Manager UI sometimes exits immaturely during installation of 6.5.3.0**
>
>Therefore, it is recommended to wait for error logs to stabilize before accessing the instance. The user has to wait for specific logs related to uninstallation of updater bundle before being ensured that the installations is successful. It generally happens on Safari but can intermittently happen on any browser.

**Automatic installation**

There are two ways to automatically install AEM 6.5.3.0 into a running instance:

A. Place the package into ..*/crx-quickstart/install* folder while the server is running. The package gets installed automatically.

B. Use the [HTTP API from Package Manager](https://docs.adobe.com/content/docs/en/crx/2-3/how_to/package_manager.html) - make sure that you use cmd=install&recursive=true - so the nested packages  are  installed.

>[!NOTE]
>
>AEM 6.5.3.0 does not support Bootstrap installation.

**Validate installation**

1. The Product Information page (*/system/console/  productinfo *) should now show the updated version string `Adobe Experience Manager, Version 6.5.3.0` under Installed Products.

1. All  OSGi  bundles are either ACTIVE or FRAGMENT in the OSGi Console (Use Web Console: /system/console/bundles).
1. The OSGI bundle org.apache.jackrabbit.oak-core is on version 1.10.6 or higher (Use Web Console: /system/console/bundles).

In order to see what platforms are certified to run with this release, please refer to the [Technical Requirements](/help/sites-deploying/technical-requirements.md).

### Install AEM forms add-on package {#install-aem-forms-add-on-package}

>[!NOTE]
>
>Skip if you are not using AEM Forms. Fixes in AEM Forms are delivered through a separate add-on package.

>[!NOTE]
>
>AEM 6.5.3.0 includes a new version of [AEM Forms compatibility package](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq650/compatpack/AEM-FORMS-6.5.3.0-COMPAT). If you are using an older version of AEM Forms Compatibility Package and updating to AEM 6.5.3.0, install the latest version of AEM Forms compatibility package post installation of Forms Add-On Package.

1. Ensure that you have installed the AEM Service Pack.
1. Download the corresponding forms add-on package listed at [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) for your operating system.
1. Install the forms add-on package as described in [Installing AEM forms add-on packages](../forms/using/installing-configuring-aem-forms-osgi.md#install-aem-forms-add-on-package).

### Install AEM Forms JEE installer {#install-aem-forms-jee-installer}

>[!NOTE]
>
>Skip if you are not using AEM Forms on JEE. Fixes in AEM Forms JEE are delivered through a separate installer.

For information about installing the cumulative installer for AEM Forms JEE and post-deployment configuration, see the [release notes for patch 0007](https://helpx.adobe.com/aem-forms/quick-fixes/6-5/jee-patch-0007.html).

#### Workbench installer

As it is a full installer, the file size is more as compared to the patch version. Uninstall the previous Workbench version before installing the new one.

## Uber Jar {#uber-jar}

The Uber Jar for AEM 6.5.3.0 is available in the [Adobe Public Maven repository](https://repo.adobe.com/nexus/content/groups/public/com/adobe/aem/uber-jar/6.5.3/).

To use Uber Jar in a Maven project, refer to the article, [How to use Uber jar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM:

```shell
<dependency>
      <groupId>com.adobe.aem</groupId>
      <artifactId>uber-jar</artifactId>
      <version>6.5.3.0</version>
      <classifier>apis</classifier>
      <scope>provided</scope>
</dependency>
```

## Removed/Deprecated Features {#removed-deprecated-features}

This section lists features and capabilities that have been marked as deprecated with AEM 6.5.3.0. Generally, features that are planned to be removed in a future release are set to deprecated first, with an alternative provided.

Customers are advised to review if they make use of the feature/capability in their current deployment, and make plans to change their implementation to use the alternative provided.

| Area |Feature |Replacement |
|---|---|---|
| Integrations |The “AEM Cloud Services Opt-In” screen has been deprecated. With the AEM/Target integration updated in AEM 6.5 to support the Target Standard API, which uses authentication via Adobe IMS and I/O, and the growing role of Adobe Launch for instrumenting AEM pages for analytics and personalization, the Opt-In wizard has become functionally irrelevant.  |Configure system connections, Adobe IMS authentication, and Adobe I/O integrations via respective AEM cloud services  |

## Known Issues {#known-issues}

The following errors and warning may occur during installation of AEM 6.5.x.x and can be safely ignored:

* “When the Target integration is configured in AEM using the Target Standard API (IMS authentication), then exporting Experience Fragments to Target results in wrong offer types getting created. Instead of type “Experience Fragment”/source “Adobe Experience Manager,” Target creates several offers with type “HTML”/source “Adobe Target Classic.”
* com.adobe.granite.maintenance.impl.TaskScheduler: No maintenance windows found at granite/operations/maintenance.
* Adaptive Form server-side validation fails when aggregate functions like SUM, MAX, MIN, etc. are used. CQ-4274424
* com.adobe.granite.maintenance.impl.TaskScheduler - No maintenance windows found at granite/operations/maintenance.
* Hotspot in a Dynamic Media Interactive image is not visible while previewing the asset through Shoppable Banner viewer.

## OSGi bundles and Content Packages included {#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in AEM 6.5.3.0

List of OSGi bundles included in AEM 6.5.3.0

[Get File](assets/6530_bundles.txt)

List of Content Packages included in AEM 6.5.3.0

[Get File](assets/6530_packages.txt)

## Helpful resources {#helpful-resources}

* [AEM 6.5 release notes](/help/release-notes/release-notes.md)
* [AEM product page](https://www.adobe.com/solutions/web-experience-management.html)
* [AEM developer support](https://docs.adobe.com/content/ddc/en.html)
* [AEM 6.5 documentation](https://helpx.adobe.com/support/experience-manager/6-5.html)
* Subscribe to [Adobe Priority Product Updates](https://marketing.adobe.com/resources/help/en_US/whatsnew/)

## Restricted Sites {#restricted-sites}

These sites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact customer support](https://daycare.day.com/)

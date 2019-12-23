---
title: AEM 6.5 Service Pack Release Notes
seo-title: AEM 6.5 Service Pack Release Notes
description: Release notes specific to Adobe Experience Manager 6.5 Service Pack 3.
seo-description: Release notes specific to Adobe Experience Manager 6.5 Service Pack 3.
uuid: c7bc3705-3d92-4e22-ad84-dc6002f6fa6c
contentOwner: User
topic-tags: release-notes
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5
discoiquuid: 25542769-84d1-459c-b33f-eabd8a535462
docset: aem65
legacypath: /content/docs/en/aem/6-1/release-notes-sp1

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

## List of changes {#list-of-changes}

### Assets {#assets-6530-enhancements}

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

* Out of Memory Error is observed when a large PDF files (of several Giga Bytes) is uploaded to DAM and its sub-assets are processed (NPR-30614).

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

* An error "Group not listed by user picker: expected false to equal true" is observed on adding Closed User Group with different principalName and authorizableId (CQ-4278177).

* Assets UI Column View is showing all paths regardless of specific tenant's dam root path (CQ-4278175).

* Asset selector’s search is not working as expected (CQ-4275886).

* Rendition Workflows are failing (CQ-4271928).

* DAM Event Purge deletes the latest (maxSavedActivities) event data and holds the data created earlier (NPR-31336).

* Touch UI search (done through Omnisearch) results page automatically scrolls up and loses user's scroll position (NPR-31307).

* The action bar and asset count are not updating on selecting all and then deselecting some items (folders/individual assets) in Touch UI (NPR-31118).

* An exception displays in AEM while polling for job details of an Asset (CQ-4283569).

### Sites {#sites}

* If the LiveCopy inheritance is broken, live copy pages display language copy links instead of LiveCopy links (NPR-30980).
* For a new Blueprint, If the number of records is more than 40, only the first 40 records are displayed. Blueprint displays blank lines for the rest of the records (NPR-31182).
* When a user adds Japanese or Korean characters in the description property of a menu, the menu displays distorted characters for Japanese and Korean language text. (NPR-31331).
* Rich Text Editor (RTE) does not allow to insert an embedded Table as a list item (NPR-30879).
* Out of the box, scaffolding Rich Text Editor (RTE). applies inline font-size to elements, unexpectedly (NPR-31284).
* When a user focuses on left rail fields and uses a keyboard shortcut to paste content, it pastes the content of the page editor clipboard instead of the content copied from the left rail fields (NPR-31172).
* When a user adds a File Upload field to a multi-field, the image path is stored in the component node instead of the multi-field node (NPR-30882).
* The ResponsiveGridExporter API does not return com.day.cq.wcm.foundation.model.impl.export.AllowedComponentsExporter interface. The com.day.cq.wcm.foundation.model.impl package is declared as private package (NPR-31398).
* When a page containing some ExperienceFragments is opened in non-editor mode (either in Author without the editor.html prefix and wcmmode=disabled, or in Publisher)., the request ends in HTTP status error code 500 (NPR-30743).

### Search and user interface {#search-ui-interface}

* When switching from the Card view to the List view on a search results page, there is a lag before the page can be scrolled (NPR-31286).

* The Select All checkbox is hidden in the List view on Sites UI (NPR-31614).

* The Select All count on a search result page is incorrect (NPR-31120).

* The metadata editor displays tags that do not exist (NPR-31119).

### Translation {#translation}

* Two calendar pop-ups appear on selecting the Due Date option in a Translation Job (NPR-31270).

### Platform {#platform}

* The Mime type option in the Web console does not work (NPR-31108).

* Client certificate is not accepted when configuring single sign-on (NPR-31165).

* Updates in buffer size configuration for Jetty-based HTTP service are not saved (NPR-30925).

* QueryBuilder now supports orderby ``fn:name()`` in xpath queries (NPR-31322).

* Duplicate activation tree is created on upgrading from AEM 6.3 (NPR-31513).

* Forwarded requests do not preserve response headers that are set during sling authentication (NPR-30013).

* Search within the picker components does not work (NPR-31692).

* An error is displayed when attaching a ZIP file to an AEM Communities post due to different versions of Apache POI and Apache Tika bundle (NPR-31018).

* The ``org.apache.sling.distribution.api`` bundle is hidden in the configuration manager and therefore not available to custom bundles (NPR-31720).

### Projects {#projects}

* Switching calendar views does not work (NPR-31271).

### Brand Portal {#assets-brand-portal}

**Product Enhancements**

* Asset Sourcing import workflow in AEM Assets is modified to fetch only the newly created assets from Brand Portal to AEM, and skip the assets that already exist in the NEW folder to avoid replication (CQ-4278527).

**Fixes**

* Incorrect icon appears on creating a new Contribution folder in Asset Sourcing feature (CQ-4282825).
* On creating a new Contribution folder, one or both subfolders (NEW and SHARED) does not appear inside the Contribution folder (CQ-4282424).
* System throws an exception if the user tries to republish Contribution folder from AEM to Brand Portal after receiving new assets in the Contribution folder from Brand Portal end (CQ-4279740).
* Creation of Contribution folder within a Contribution folder (nested folder) is prohibited to avoid complexity (CQ-4278391).
* System throws an exception on uploading the Brand Portal user list (.csv file) imported from AEM Admin Console. Only Email, FirstName, and LastName fields in the .csv file are mandatory (CQ-4278390).

### Communities {#communities}

**Fixes**

* Quick links to manage groups (Open/Edit/Publish/Delete Groups) are not visible to the Community administrators (Group admin/Site admin) (NPR-31627).
* A submitted blog is not displayed unless the page is manually refreshed/reload (NPR-31599).
* The JCR query used by the "Mentions" feature is case sensitive and takes too long to return results (NPR-31475).
* AEM 6.5 Uber jar file throws exeception, cq-social-translation bundle missing from AEM 6.5 Uber jar file (NPR-31186).
* Jackson Databind libraries updated to version 2.9.9.3 to address new vulnerabilities (NPR-30967).
* Activities and Notifications titles are inconsistent (NPR-30941).
* Pagination is not working properly in Communities Blogs (NPR-30914).
* Analytics reports are not populated in AEM author environment, blank page appears (NPR-30913).

### Oak {#oak}

* Lucene index updates causing author server to slow down (NPR-31548).

### Forms {#forms-6530}

>[!NOTE]
>
>AEM Service Pack does not include fixes for AEM Forms. They are delivered using a separate Forms add-on package. In addition, a cumulative installer is released that includes fixes for AEM Forms on JEE. For more information, see [Install AEM Forms add-on](#install-aem-forms-add-on-package) and [Install AEM Forms JEE installer](#install-aem-forms-jee-installer).

### Forms add-on package {#forms-add-on-package-6530}

#### Adaptive Forms {#adaptive-forms-6530}

* Strings contain the dictionary key while localizing adaptive forms (NPR-31110).

#### Interactive Communication {#interactive-communication-6530}

* **MissingNode.toString()** returns inaccurate results after upgrading Jackson libraries to 2.10.0 (NPR-31549).

* Text editor randomly removes space characters from the text copied from Microsoft Word (NPR-31113).

#### Correspondence Management {#correspondence-management-6530}

* Captions and tooltips do not display while migrating letters from LiveCycle ES4SP1 to AEM 6.5 (NPR-31615).

* **Textflow formatting is no more supported** error message displays while saving letters as drafts (NPR-30463).

#### Workflow {#forms-workflow-6530}

* OSGi workflow fails due to 100% CPU utilization (NPR-31233).

#### HTML5 Forms {#html-forms-6530}

* Generating HTML5 preview of an XDP form displays a flicker while adding instances of a subform (NPR-30909).

### Forms JEE installer {#forms-jee-installer-6530}

#### Forms - Document Services {#forms-document-services-6530}

* SOAP web service using MTOM in a .NET project displays exceptions for AssemblerServiceClient invoke and HtmlToPDF2 methods (NPR-4281771).

#### Foundation JEE {#forms-foundation-jee-6530}

* Action configuration does not load the process names for Invoke a Forms Workflow submit action (NPR-31478).

## Feature Packs Included {#feature-packs-included-6530}

>[!NOTE]
>
>For AEM Forms customers, it is essential to install AEM Forms add-on package after installing any AEM Service Pack, Cumulative Fix Pack, or Feature Pack.

### Forms - Foundation JEE {#forms-foundation-jee-feature}

* AEM Forms support for Oracle 18c (NPR-29155).

## Hotfixes and Feature Packs included in previous Service Packs {#hotfixes-and-feature-packs-included-in-previous-service-packs}

### AEM 6.5.2.0

AEM 6.5.2.0 is an important release that includes performance, stability, security, and key customer fixes and enhancements released since the general availability of AEM 6.5 in **April 2019**. It can be installed on top of AEM 6.5.

Some key highlights of this service pack release are:

* The built-in repository (Apache Jackrabbit Oak) is updated to version 1.10.3.
* Added a configuration property to allow exporting Experience Fragments directly to user-defined workspaces for Adobe Target.
* Assets users can search visually similar images. AEM displays the smart tagged images from the DAM repository that are similar to a user-selected image. See [visual search](/help/assets/search-assets.md#visualsearch).

* Enhanced the Connected Assets functionality to add support to fetch documents from remote DAM deployments. Site Authors can now search and filter supported documents types in Content Finder. The remote documents can be added to Download component on web pages. See [use connected assets](/help/assets/use-assets-across-connected-assets-instances.md).

* EnhanceDocument type filters with more MIME types to support multi-valued options.
* Introduced an external Reprocess workflow for multi-resource support.
* Optimized a Dynamic Media performance by using default asset filters for replication.
* Restored crop/rotate Asset editing options for DMS7.
* Implemented an option to mute a video on load in VideoPlayer.
* Fix to ensure that Asset UI column view shows tenant-specific content only.
* Fix to allow style accordion changes to reflect in search results.

#### Assets {#assets}

**Product Enhancements**

* Enhanced the Connected Assets functionality to add support to fetch documents from remote DAM deployments. Site Authors can now search and filter supported documents types in Content Finder. The remote documents can be added to Download component on web pages. Hotfix for CQ-4270245. See [use connected assets](/help/assets/use-assets-across-connected-assets-instances.md).

* Assets users can search visually similar images. AEM displays the smart tagged images from the DAM repository that are similar to a user-selected image. See [visual search](/help/assets/search-assets.md#visualsearch).

**Fixes**

* Asset paths in URLs and folders metadata generated by the ACP API are not URL encoded. GRANITE-26198: Hotfix for CQ-4271814
* Unzipping an archive with a folder having a percent sign (%) in its name can not be opened using Assets interface. NPR-29989: Hotfix for CQ-4270467
* [Touch UI] During the manage publication wizard, references are added after the page in the post request body, causing all the assets to publish after the page, and when the page gets rendered, some of the assets in the publish instance get missed. NPR-29985: Hotfix for CQ-4270724
* Unrelate Asset feature does not work for related assets that have special characters (characters that become URI encoded) in the name. NPR-30387: Hotfix for CQ-4274446
* When editing a content fragment, the version is getting created with the wrong user.
* Failure during the creation of collections on Tenant based system. NPR-30114: Hotfix for CQ-4272948
* Asset UI column view is not respecting the current tenant's dam root path but accessing all tenant dam paths. NPR-30636: Hotfix for CQ-4275481
* Possible cross-site scripting (XSS) attack through restricted file alert window as the injected image can be seen. NPR-30617: Hotfix for CQ-4270133
* [MultiTenant] Tenants saving folder properties observe both success prompt and error message describing action was not successful, "Unable to edit properties. Insufficient permissions." hence, confusing them. NPR-30545: Hotfix for CQ-4275333
* Asset selector dialog does not allow selection of asset, hence unable to update source using the relate source replacement functionality. NPR-30502: Hotfix for CQ-4275029
* DAM Update Asset Workflow - In the stale state on uploading large size mp4 files. NPR-30480: Hotfix for CQ-4271352
* Create Review Task functionality does not work due to null payload making all subsequent review task-related actions to fail. NPR-30468: Hotfix for CQ-4274263
* Adobe Smart Tag connectivity issue through Datapower. NPR-30026: Hotfix for CQ-4269457
* Assets UI Column View throws an error when attempting to open the filters left the rail. NPR-30501: Hotfix for CQ-4273862
* When adding groups synced from LDAP in the Closed User Group (CUG) properties of an Asset Folder, the group do not get saved and retrieved. NPR-30615: Hotfix for CQ-4274689
* Filter search style and orientation fields do not apply the autocompleted value to the search query. NPR-30620: Hotfix for CQ-4275724
* Asset share link of a folder with space and "&" character in the name displays blank gray cards for some assets. NPR-30557: Hotfix for CQ-4270187
* Folder metadata schema form is not automatically detecting datatype and hence, not creating the related TypeHint in form submission. NPR-30599: Hotfix for CQ-4275227
* Crop and rotate Asset editing options are disabled from the DMS7 authoring UI. NPR-30118: Hotfix for CQ-4273221
* Share Link feature is not working on AEM instance with DMS7 configuration. NPR-30080, NPR-30492: Hotfix for CQ-4273651
* Adding the Dynamic Media Scene7 component to the page, and then publishing the page does not trigger the dmscene7 configuration every time. NPR-30641: Hotfix for CQ-4275962
* Added an IPSJobJournal in AEM to create only one Intrusion Prevention Systems (IPS) job per processing profile. NPR-30490: Hotfix for CQ-4273614
* [Dynamic Media] Added default filters to exclude assets from being replicated to the AEM publish node. NPR-30538: Hotfix for CQ-4274678
* Introduced an external Reprocess workflow for multi-resource support to allow folder as a payload. The workflow has two steps - reprocesses assets with no handles via metadata map to next step and reuploads all assets without asset handle to S7 in a single IPS job. For more details, see Configuring Dynamic Media Cloud Services. NPR-30489: Hotfix for CQ-4272903
* Uploading an incorrect CSV after correct CSV wipes out correct CSV. Hotfix for CQ-4277694, CQ-4277814
* The incorrect icon specific to the contribution folders to be removed. Hotfix for CQ-4277580
* On selecting a user in Asset contribution tab's user picker, the name of the user is not appearing in the table and Delete user dialog on properties page show wrong text. Hotfix for CQ-4277875
* Contributors cannot be added to the Asset contribution folder from the user picker by selecting user and clicking add. Hotfix for CQ-4277824, CQ-4278087
* Search by lower case user name does not work in the user picker. Hotfix for CQ-4277958, CQ-4277930
* Non-admins can publish assets in a new folder of an Asset contribution folder. Hotfix for CQ-4278200
* dam-user (non-admin) does not have the option of adding contributors to the Asset contribution folder. Hotfix for CQ-4278192
* "Create" button is visible in the Asset contribution folder. Hotfix for CQ-4277560
* Sorting search query by relevance returns InDesign documents along with InDesign templates. Hotfix for CQ-4273864
* If the user has an uppercase email id, users are not able to check-in for those assets which have been previously checked out. Hotfix for CQ-4276575
* The Delete operation only applies to the presets that are selected, and if the screen automatically refreshes the list after the operation, it shows other presets that have already refreshed. Hotfix for CQ-4261461
* Configuring Dynamic Media Cloud Services in DMHybrid mode results in multiple empty report suites created in Analytics, and with no report suite id stored in AEM, resulting in report suite duplication. Hotfix for CQ-4249780
* Rename operation in AEM asset to duplicated name fails to synchronize to Scene7. Hotfix for CQ-4276763
* User-Generated Content is displayed incorrectly in the search filter panel. Hotfix for CQ-4273875
* Find similar' option is not available for TIFF images. Hotfix for CQ-4278238
* Implemented option to mute video on load in VideoPlayer. Hotfix for CQ-4266465
* [Viewers] VideoViewer: poster=none works incorrectly in case of an external video used. Hotfix for CQ-4265536
* Wait icon is visible during video play on IE11 and MS Edge browsers. Hotfix for CQ-4251539
* 3.8 SDK and 5.13 viewers READMEs are not updated and contain information from previous releases. Hotfix for CQ-4273737
* Content Fragment gets versioned even before saving the changes. NPR-30616: Hotfix for CQ-4273088
* Replace Asset#getMetadata(String) with Asset#getMetadataValueFromJcr(String) in thumbnail process. NPR-30491: Hotfix for CQ-4273067
* Uploading jpg causes multiple instances of the message: "ReplicateOnModifyWorker Replicating UPDATED" for each asset, causing performance degradation.
* Unpacking zip archive using 'Extract Archive' feature causes issues with folders whose name contain percent (%) in their title. NPR-29990: Hotfix for CQ-4270467

#### Sites {#sites-6520}

* If the LiveCopy inheritance is broken, live copy pages display language copy links instead of LiveCopy links. (NPR-30980)
* For a new Blueprint, If the number of records is more than 40, only first 40 records are displayed. Blueprint displays blank lines for rest of the records. (NPR-31182)
* Rich Text Editor (RTE) plug-in of the text component displays distorted characters for Japanese and Korean language text. (NPR-31331)
* Rich Text Editor (RTE) does not allow to insert an embedded Table as a list item. (NPR-30879)
* Out of the box scaffolding Rich Text Editor (RTE) is applies inline font-size to elements, unexpectedly. (NPR-31284)
* When a user focuses on left rail fields and uses keyboard shortcut to paste content, it pastes content of page editor clipboard instead of the content copied from left rail fields. (NPR-31172)
* When a user adds a File Upload field to a multi-field, the image path is stored in the component node instead of the multi-field node. (NPR-30882)
* The ResponsiveGridExporter API does not return com.day.cq.wcm.foundation.model.impl.export.AllowedComponentsExporter interface. The com.day.cq.wcm.foundation.model.impl package is declared as private package. (NPR-31398)
* When a page containing some ExperienceFragments is opened in non-editor mode (either in Author without the editor.html prefix and wcmmode=disabled, or in Publisher), the request ends in HTTP status error code 500. (NPR-30743)

#### WCM - Page Editor {#wcm-page-editor-6520}

**Product Enhancements**

* EnhanceDocument type filters with more MIME Types to support multi valued options. Hotfix for CQ-4270694

#### Content Fragment Management {#content-fragment-management-6520}

* The query used by the Content Fragment models UI is very slow and eventually results in an error. Hotfix for CQ-4270807

#### UI - Foundation {#ui-foundation}

* Shortcuts trigger which prevents the user from using 'm,' 'p,' 'e' within specific user interfaces. NPR-30355: Hotfix for GRANITE-26346
* Closing Assets Search UI does not reset the left rail to Content selection preventing the user from opening the filter rail the second time subsequently. NPR-30509: Hotfix for CQ-4274716
* Multi-tenant environment: Asset UI top navigation is not available and throwing JavaScript error. NPR-30104: Hotfix for GRANITE-26344

#### Translation {#translation-6520}

* Translation issue - Only a few components are getting translated using Machine Translation. NPR-30079: Hotfix for CQ-4273764

#### Platform {#platform-6520}

* AEM Default Mail Sender is unable to send mail to a remote SMTP server over TLS v1.2. NPR-30476: Hotfix for GRANITE-26605

#### Projects {#projects-6520}

* dam:folderThumbnailPaths values do not get refreshed and display old thumbnails even after deleting the assets within the folder. NPR-30424: Hotfix for CQ-4273667
* When completing the "move" option, the Title and Name of the asset remains unchanged. NPR-30647: Hotfix for CQ-4276265

#### Communities {#communities-6520}

* User Sync Diagnostics is completely broken and fails to work. NPR-30004, NPR-29943: Hotfix for CQ-4270287, CQ-4271348

#### Sling {#sling}

* Upgraded instance from 6.3.3.2 to 6.5 is resulting in duplicate OSGi configurations. NPR-30130: Hotfix for CQ-4274016

#### Integration {#integration}

* The customized content is not displayed correctly on the publish instance until the restart of the instance. NPR-30377: Hotfix for CQ-4273706
* When configuring Launch on a website, the library address has a slash (/) pre-pended causing manual intervention each time. NPR-30694: Hotfix for CQ-4275501

#### Forms {#forms-6520}

>[!NOTE]
>
>AEM Service Pack does not include fixes for AEM Forms. They are delivered using a separate Forms add-on package. In addition, a cumulative installer is released that includes fixes for AEM Forms on JEE. For more information, see [Install AEM Forms add-on](#install-aem-forms-add-on-package) and [Install AEM Forms JEE installer](#forms-jee-installer).

The key highlights for AEM 6.5.2.0 forms are:

* Added 'Auto' setting to `RenderAtClient` in `PDFFormRenderOptions` API for AEM Forms OSGi.

#### Forms add-on package {#forms-add-on-package}

#### Backend Integration {#backend-integration}

* Unable to configure Form Data Model using an AWS hosted load balanced URL. NPR-30123: Hotfix for CQ-4273359
* While creating the Form Data Model (FDM) with the Web Service Definition Language (WSDL), the error message `Caused by: com.adobe.aem.dermis.exception.DermisException: java.lang.Exception: Unable to handle content type` is returned: NPR-30477: Hotfix for CQ-4272921

#### Correspondence Management {#correspondence-management}

* ``Create Correspondence UI's (CCR UI) rendition fails intermittently with below error in console:
  `- Uncaught Error: variable [object Object]is already known the letter`- NPR-30127

#### Interactive Communication {#interactive-communication}

* A field marked required in form data model is displayed as required in Create Correspondence UI (CCR UI). NPR-30623: Hotfix for CQ-4274902

#### Forms - Workflow {#forms-workflow}

* Unmapped output variables on Watched Folders cause invocation to fail. Hotfix for CQ-4264451

#### HTML5 Forms {#html-forms}

* When the custom code or project is deployed for the second time, the page does not render and the following error occurs:

  `org.apache.sling.scripting.sightly.SightlyException.`

  NPR-30539: Hotfix for CQ-4272509

* When using NonVisual Desktop Access in Browse mode to read an HTML5 form, the Chrome browser reads "graphic" before each Scalable Vector Graphic (SVG) in the form design. NPR-30449: Hotfix for CQ-4274732

#### Forms JEE installer {#forms-jee-installer}

#### Forms - Document Security {#forms-document-security}

* Applying a signature with timestamp fails with error: ALC-DSC-003-000: com.adobe.idp.dsc.DSCInvocationException: Invocation error. NPR-30820: Hotfix for CQ-4275852

#### Forms - Document Services {#forms-document-services}

* If the "SubmitURL" contains an ampersand (&), parsing errors are seen in the log when POST request is made to renderpdf servlet. NPR-30865: Hotfix for CQ-4278232

#### Forms - Foundation JEE {#forms-foundation-jee}

* HTMLtoPDF service is not show maxReuseCount in JMX console. NPR-30134, NPR-30304: Hotfix for CQ-4273763
* Adding or editing a Web Service connection by invoking web services from AEM Forms Workbench throws an error: ClassNotFoundException org.apache.axis.message.SOAPBodyElement. NPR-30105: Hotfix for CQ-4273217

## Feature Packs Included {#feature-packs-included}

>[!NOTE]
>
>For AEM Forms customers, it is essential to install AEM Forms add-on package after installing any AEM Service Pack, Cumulative Fix Pack, or Feature Pack.

### Sites {#sites-feature-packs-included}

* Added a configuration property to allow exporting Experience Fragments directly to user-defined workspaces for Adobe Target. NPR-29189: Hotfix for CQ-4249782

#### Forms - Document Services {#forms-document-services-1}

* Added 'Auto' setting to `RenderAtClient` in `PDFFormRenderOptions` API for AEM Forms OSGi. NPR-30759: Hotfix for CQ-4278193

## AEM 6.5.1.0 {#release-6510}

 AEM 6.5.1.0 is an important release that includes performance, stability, security, and key customer fixes and enhancements released since the general availability of AEM 6.5 in *April 2019.* It can be installed on top of AEM 6.5.

Some key highlights of this service pack release are:

* Enabled the inclusion of dynamic-UI-state in tracking events as custom attributes.
* Included support for the delivery of 360-degree video assets in Dynamic Media Scene 7.
* Enabled *Japanese Word Wrap* feature via the styles plugin of Rich Text Editor. For more information, see [Configure Japanese word wrap](/help/sites-administering/configure-rich-text-editor-plug-ins.md#jpwordwrap)

### Assets

* Updated DAM DMGateway interface for S3 multipart support. NPR-29740: Hotfix for CQ-4226303
* Renditions preview generates `Only empty tenantId is currently supported` error after upgrading to AEM 6.5\. NPR-29986: Hotfix for CQ-4272353
* Delete dialog is not visible to allow deletion of jobs. NPR-29720: Hotfix for CQ-4271074
* After adding asset title in the properties page, when a user attempts to close the page, AEM opens the properties page again. NPR-29627: Hotfix for CQ-4264929
* VersioningTimelineEventProvider should provide root version along with node of the type nt: version. Hotfix for GRANITE-26063
* Implemented the ability to upload and play 360 spherical videos in AEM DM-Scene7 mode. Hotfix for CQ-4265131
* Live copy retrieves incorrect status if the source is edited. Hotfix for CQ-4265451
* Enabled Multi-Site Manager support for Assets. Hotfix for CQ-4271453, CQ-4268621, CQ-4257491
* AEM interface should display an additional entry for the current version of the asset in the timeline history, displaying the latest check-in comment from Adobe Asset Link. Hotfix for CQ-4262864
* Content Fragment Timeline displays an error message when properties are missing. Hotfix for CQ-4272560
* An issue with Scene 7 video player when expanded to full screen. Hotfix for CQ-4266700
* ZoomVerticalViewer: Pan buttons should not be displayed if a single image asset is used. Hotfix for CQ-4264795
* Deleting a child node in the live copy should detach the liveRelationship. Hotfix for CQ-4270395
* The metadata schema only contains items from the global configuration and is missing the ones from the active tenant. The formPath URL value reverts to the default even when changed. NPR-29945: Hotfix for CQ-4262898
* Publish image presets to Brand Portal fails with 500 error code. NPR-29510: Hotfix for CQ-4268659

### Sites

* Empty properties and multiple properties do not propagate from blueprint during rollout. Reset live copy with blueprint does not work for components. NPR-29253: Hotfix for CQ-4264928, CQ-4264926, CQ-4267722
* CoralUI, when used with Multifield, stores the fileReferenceParameter at the component level instead of multifield level. NPR-29537: Hotfix for CQ-4266129
* Enhancement of AEM text component and Text Editor to Japanese. NPR-29785: Hotfix for CQ-4265090
* Page restored with Timewarp should refer to the correct picture at the time of versioning. NPR-29431: Hotfix for CQ-4262638
* An issue with the inheritance of Style System nodes from parent to child. NPR-29516: Hotfix for CQ-4270330
* An error message while setting up the social posting to Facebook authentication. NPR-29211: Hotfix for CQ-4266630
* The rendered thumbnail on Content Fragment shows internal calendar representation for Date and Time field. NPR-29531: Hotfix for CQ-4269362
* Opening the permissions tab in Coral2 implementation does not show the buttons. Hotfix for CQ-4269419

### Commerce

* ConstraintViolationException, when running lazy content migration for e-commerce. NPR-29247: Hotfix for CQ-4264383

### Content Fragment Management

* Parsing error when opening a Content Fragment which has characters dollar `($)` and open brace `({)`. Hotfix for CQ-4270266

### Experience Fragments

* Export AEM Experience Fragments to Adobe Target. Hotfix for CQ-4265469
* Experience Fragments export to target fails with smart image. Hotfix for CQ-4269606

* The user hits a dead end when tries to move the Experience Fragments through Omnisearch in card view. Hotfix for CQ-4263848

### WCM - Page Editor

* Reflected Cross-site scripting (XSS) when using an invalid selector. Hotfix for CQ-4270397

### Replication

* User-provided data is not escaped on output in the `cq/replication/components/agent` component, resulting in a stored Cross-site scripting (XSS) vulnerability. Hotfix for CQ-4266263

### Workflow

* Dialog participant's calendar picker field broken. NPR-29727: Hotfix for CQ-4270423

### WCM - SPA Editor

* Enabled fetching pre-rendered content from a remote endpoint. Hotfix for CQ-4270238
* Warnings in logs when opening a SPA Template Page rendered server-side. Hotfix for CQ-4270238

### WCM - MSM

* Upgrade to AEM 6.4.3 makes Multi-Site Manager take a long time to roll out. Hotfix for CQ-4271410

### Integration

* BrightEdge credentials fail with connection error. NPR-29168: Hotfix for CQ-4265872

* An exception message is displayed when trying to edit and save the AEM launch configuration. NPR-29176: Hotfix for CQ-4265782/CQ-4266153

### User Interface

* Added support for tracking dynamic-UI-states as custom attributes while tracking certain events in the foundation tracking API. Hotfix for GRANITE-26283
* Unable to set the tracking feature on the submit button. Hotfix for GRANITE-26326
* The wizard is unable to set the tracking feature on the submit button. NPR-29995, NPR-30025: Hotfix for CQ-4264289

### Communities

* Unable to align new badges in the dropdown on the member profile page. NPR-29381: Hotfix for CQ-4267987
* Visitors and members, with no moderator privileges, are able to see unapproved/pending posts by pasting the URL. NPR-29724: Hotfix for CQ-4271124, CQ-4271441
* High response time up to 40-50 seconds is observed on user sign-in for Community. NPR-29677: Hotfix for CQ-4269444

### Replication

* Replication Agent component is susceptible to a vulnerability which discloses sensitive information to unauthorized users. NPR-29611: Hotfix for GRANITE-25070

* Session leak during OAuth for every replication to Brand Portal. NPR-30001: Hotfix for GRANITE-26196

### Projects

* Publish Assets from AEM Author /content/dam/mac folder to Brand Portal doesn't work. NPR-29819: Hotfix for CQ-4271118

### Platform

* HtmlLibraryManager deletes all of the contents of crx-quickstart on cache invalidation. NPR-29863: Hotfix for GRANITE-26197

### Felix

* Memory Usage details do not show up in the system console when using Java11\. NPR-29669

### Forms

The key highlights for AEM 6.5.1.0 forms are:

* [OSGi only] Added a new attribute PAGECOUNT in Output and Forms Service.

* [OSGI only] Enabled support to create static PDFs using Forms Service.
* Enabled permissions on XMLForm.exe for administrator and root users.
* Enabled support for ADFS v3.0 for Dynamics on-premise integration.

### Forms add-on package

#### Backend Integration

* Failure in fetching protected Web Service Definition Language (WSDL). NPR-29944: Hotfix for CQ-4270777
* When AEM Forms is installed on IBM WebSphere, creating a form data model based on SOAP fails. Hotfix for CQ-4251134
* Enabled support for Active Directory Federation Services (ADFS) v3.0 for Microsoft Dynamics on-premise integration. Hotfix for CQ-4270586
* When title of a data source is changed, the form data model does not display the updated title. Hotfix for CQ-4265599
* If name of an entity or attribute contains hyphen or space, expressions fail to evaluate such entities and attributes. Hotfix for CQ-4225129

* Incorrect output is observed when a colon is present in the primitive string output. Hotfix for CQ-4260825

* Even when no content is expected from the REST API output, form data model's invoke operation throws an error. Hotfix for CQ-4268828

#### Adaptive Forms

* Unable to add new instance in Adaptive Form Fragment during lazy loading. NPR-29818: Hotfix for CQ-4269875
* Verify component does not log or display any error for Document of Record templates. Hotfix for CQ-4272999
* Added support to disable layout editor for Adaptive Forms. Hotfix for CQ-4270810
* Restored the verify step for Adaptive Forms in AEM 6.5\. Hotfix for CQ-4269583

* Adaptive Form field validation failure breaks Adobe Sign. Hotfix for CQ-4269463
* When an AEM Forms instance has more than 20 adaptive form fragments and name of all the form fragments starts with the same string, the search returns no or only recent 20 created fragments. Hotfix for CQ-4264414, CQ-4264914

* Performance issues when Adaptive Forms app is used with large dataset. . Hotfix for CQ-4235310

* When accessed through anonymous account on a publish instance, the GuideRuntime script fails to load. Hotfix for CQ-4268679

#### Forms - Interactive Communication

* Interactive Communication template does not list header and footer components in allowed component list. Hotfix for CQ-4237895
* When you create an interactive communication print template containing an image field, the title of the chart is set to blank. Hotfix for CQ-4264772
* Line color of a chart, when deleted, is set to undefined. Hotfix for CQ-4264762
* Layout layer changes made on Document Fragment disappear on performing keep changes sync. Hotfix for CQ-4266054
* Form data model element inside a Document Fragment bound to a text field does not show inheritance icon and allows binding. Hotfix for CQ-4261089
* Print Channel render API does not have the option to pass data as a parameter in the API. Hotfix for CQ-4263540
* Agent settings are not visible as Editable by Agent checkbox gets unchecked when binding type is changed from Text fragment to None/Data Model Object for String field/variable. Hotfix for CQ-4261953
* On the submission of Agent UI, resulting web data json file stores information for inheritance-cancelled unbound fields. Hotfix for CQ-4265621

#### Forms - Workflow

* When a form is resubmitted from the outbox of adaptive forms app, it results in loss of data. NPR-28345: Hotfix for CQ-4260929
* Documents are not closed while saving for non-variable cases. Hotfix for CQ-4269784
* Adaptive Forms app has dropped support for Microsoft Windows 8.1\. Hotfix for CQ-4265274
* When an image of more than 2 MB is attached as a field level attachment to a form in the Android version of AEM Forms app, the app crashes. Hotfix for CQ-4265578

* Enabled pre-population options for Interactive Communication Print Channel in Assign task. Hotfix for CQ-4265577
* Users are not able to view a shared task until they become member of the group to which the task is assigned. Hotfix for CQ-4248733
* Save or submit of JEE applications on Adaptive Form app is blocked on Windows. Hotfix for CQ-4268704
* The form data model associated with the form data model variable is not visible. Hotfix for CQ-4266554
* No support for the status variable of document sign using variable support. Hotfix for CQ-4266312
* Submissions from workspace fail with umlaut character. Hotfix for CQ-4263172
* On an upgraded setup, if the workflow is opened for editing, an error is shown instead of workflow name in watch folder user interface (UI). Hotfix for CQ-4238579

#### Forms - Management

* When an extension other than xsd or schema.json is uploaded, upload does not happen and, no error message is generated. Hotfix for CQ-4266716

#### Forms - Correspondence Management

* AEM 6.5 Forms Create Correspondence UI (CCR UI) fails to open correspondence created with AEM 6.3 Forms. Hotfix for CQ-4266392
* Sum function in XDP does not work if the DDE data type is of type number. Hotfix for CQ-4227403
* Letters in-memory cache invalidation logic to be updated, because when an asset is published, its last modified time is not updated. Hotfix for CQ-4250465
* Unable to Publish Document fragment, DD & Letters. Hotfix for CQ-4272893

### Forms JEE installer

#### PDF Generator

* CAD files to PDF conversion are failing with 64-bit JDK. NPR-29924, NPR-29925: Hotfix for CQ-4272113
* Replaced the name of PhantomJS to WebToPDF for HTMLtoPDF conversion. NPR-29933: Hotfix for CQ-4234545
* An error is generated while converting zip file to PDF. Hotfix for CQ-4268628

#### Forms - Designer

* When a full accessibility check is performed on the static PDF created using AEM Form Designer, the Primary Language check fails due to missing language attribute. Hotfix for CQ-4272923, CQ-4271002

#### Forms - Document Security

* Digital Signature with Hardware Security Module (HSM) is not working on OSGi Linux on Java 11 and Java 8\. NPR-29838: Hotfix for CQ-4270441
* Digital Signature with Hardware Security Module (HSM) is not working on JEE Linux, and all supported app servers i.e., JBoss and Websphere. NPR-29839: Hotfix for CQ-4266721
* Verifying signatures in a PDF using PDF Advanced Electronic Signatures (PAdES) generates InvalidOperationException. NPR-29842: Hotfix for CQ-4244837
* Added Document Security Extension support for Office 2019\. Hotfix for CQ-4254369, CQ-4259764

#### Forms - Document Services

* PDF fails conversion to PDF/A-1b with Form field does not have appearance dict. NPR-29940: Hotfix for CQ-4269618

* [OSGi] Unable to determine the number of pages generated during rendering. NPR-28922: Hotfix for CQ-4270870
* Enabled support for Static PDFs using Forms Service in AEM Forms OSGi. NPR-28572: Hotfix for CQ-4270869
* Unable to change the permissions on the XMLForm.exe. NPR-29828, NPR-29237: Hotfix for Q-4267080
* The static PDF created by the AEM Forms server’s output module does not populate the language attribute/tag with the language of the document created. NPR-27332: Hotfix for CQ-4271002

#### Forms - Foundation JEE

* Unavailable pdfg_srt in final artifacts causes the installer to fail. NPR-29854: Hotfix for CQ-4270137
* LCBackupMode.sh is not working. NPR-29840: Hotfix for CQ-4269424
* UDP port reference should be removed from user interface (UI) for WebSphere. Hotfix for CQ-4264782

## Feature Packs Included

### Assets - Included

* Enabled Multi-Site Manager support for Assets. For more information, see [Reuse assets using MSM for Assets](https://helpx.adobe.com/experience-manager/6-5/help/assets/reuse-assets-using-msm.html). NPR-29199: Hotfix for CQ-4259922

### Sites - Included

* Export AEM Experience Fragments to Adobe Target. For more details, see [The Experience Fragment Link Rewriter Provider - HTML](https://helpx.adobe.com/experience-manager/6-5/help/sites-developing/experience-fragments.html#TheExperienceFragmentLinkRewriterProviderHTML). Hotfix for CQ-4265469

### Forms - Document Services - Included

* [OSGi only] Added a new attribute PAGECOUNT in Output and Forms Service.. NPR-28922: Hotfix for CQ-4270870
* [OSGi only] Enabled support to create static PDFs using Forms Service. NPR-28572: Hotfix for CQ-4270869
* Enabled permissions on XMLForm.exe for administrator and root users. NPR-29237: Hotfix for CQ-4267080

## OSGi bundles and Content Packages

The following text documents list the OSGi bundles and Content Packages included in AEM 6.5.1.0

List of OSGi bundles included in AEM 6.5.1.0

[Get File](assets/6_5-bundle-list.txt)

List of Content Packages included in AEM 6.5.1.0

[Get File](assets/6_5-content-package-list.txt)

## Install 6.5.3.0 {#install}

### Setup requirements {#setup-requirements}

* AEM 6.5.3.0 requires AEM 6.5. Check [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions.
* The Service Pack download is available on Adobe Package Share, which you can access directly from the AEM 6.5 instance.
* On a deployment with MongoDB and multiple instances, install AEM 6.5.3.0 on one of the Author instances using the Package Manager.
* Before installing the service pack, ensure to have a snapshot or fresh backup of your AEM instance.
* Restart the instance before installation. While that is only needed when the instance is still in update mode (and this is the case when the instance was updated from an earlier version), it is recommended if the instance was running for longer period.

>[!CAUTION]
>
>Adobe does not recommend removing or uninstalling the AEM 6.5.3.0 package.

### Install the Service Pack via Package Share {#install-the-service-pack-via-package-share}

Perform the following steps to install the Service Pack on an existing AEM 6.5 instance:

1. Login to Package Share within AEM or directly from your browser and download the [AEM 6.5.3.0 package](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq650/servicepack/AEM-6.5.3.0).
   (search for "AEM-6.5.3.0" to find it)

1. Install the downloaded package using Package Manager.

>[!NOTE]
>
>**Dialog on Package Manager UI sometimes exits immaturely during installation of 6.5.3.0**
>
>Therefore, it is recommended to wait for error logs to stabilize before accessing the instance. The user has to wait for specific logs related to uninstallation of updater bundle before being ensured that the installations is successful. It generally happens on Safari but can intermittently happen on any browser.

### Automatic installation {#automatic-installation}

There are two ways to automatically install AEM 6.5.3.0 into a running instance:

A. Place the package into ..*/crx-quickstart/install* folder while the server is running. The package gets installed automatically.

B. Use the [HTTP API from Package Manager](https://docs.adobe.com/content/docs/en/crx/2-3/how_to/package_manager.html) - make sure that you use cmd=install&recursive=true - so the nested packages  are  installed.

>[!NOTE]
>
>AEM 6.5.3.0 does not support Bootstrap installation.

### Validate installation {#validate-installation}

1. The Product Information page (*/system/console/  productinfo *) should now show the updated version string `Adobe Experience Manager, Version 6.5.3.0` under Installed Products.

1. All  OSGi  bundles are either ACTIVE or FRAGMENT in the OSGi Console (Use Web Console: /system/console/bundles).
1. The OSGI bundle org.apache.jackrabbit.oak-core is on version 1.10.6 or higher (Use Web Console: /system/console/bundles).

In order to see what platforms are certified to run with this release, please refer to the [Technical Requirements](/help/sites-deploying/technical-requirements.md).

### Install AEM forms add-on package {#install-aem-forms-add-on-package}

#### Install AEM forms add-on {#installaemformsaddon}

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

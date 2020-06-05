---
title: AEM 6.5 Service Pack Release Notes
description: Release notes specific to Adobe Experience Manager 6.5 Service Pack 5.
docset: aem65
mini-toc-levels: 1
---

# Adobe Experience Manager 6.5 Service Pack Release Notes {#aem-service-pack-release-notes}

## Release Information {#release-information}

| Products |**Adobe Experience Manager 6.5** |
|---|---|
| Version |6.5.5.0 |
| Type |Service Pack Release |
| Date |June 04, 2020 |
| Download URL | [Package Share](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq650/servicepack/AEM-6.5.5.0), [Software Distribution ](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.5.zip) |

## What's included in Adobe Experience Manager 6.5.5.0 {#what-s-included-in-aem}

Adobe Experience Manager 6.5.5.0 is an important update that includes new features, key customer requested enhancements and performance, stability, security improvements, released since the general availability of 6.5 release in **April 2019**. It can be installed on top of Adobe Experience Manager (AEM) 6.5.

Some key features and enhancements introduced in AEM 6.5.5.0 includes:

* Customizing the column names that display in AEM Inbox.

* Improving accessibility in various areas in AEM Web Content Management (WCM) such as Page Editor, Core Components, RTE, and Admin user interface.

* Saving an Interactive Communication as a draft.

* Support for [!DNL Oracle WebLogic 12] for AEM Forms on JEE.

* Exception handling is now improved in [!DNL Adobe Experience Manager] Assets user interface flow.

* A new method `getRemoteAssetPublishURL` is added to `com.day.cq.dam.api.s7dam.scene7.ImageUrlApi` interface  to get publish URL for Dynamic Media Scene7.

* [Accessibility enhancements](#assets-6550-changes) in [!DNL Adobe Experience Manager] Assets in compliance with Web Content Accessibility Guidelines (WCAG).

* Removed Package Share integration with Adobe Experience Manager.

* The built-in repository (Apache Jackrabbit Oak) is updated to version 1.22.3.

For complete list of features, key highlights, key features introduced in AEM 6.5 service pack 5, see [What's new in Adobe Experience Manager 6.5 Service Pack 5](new-features-latest-service-pack.md) .

The following is the list of fixes provided in [!DNL Experience Manager] 6.5.5.0 release.

### Sites {#sites-6550}

* AEM Sites provides an option to publish or unpublish a page from its alias. The option does not work (NPR-33415).
* When a layout container is deleted from a template containing multiple templates, the template does not render correctly (NPR-33347).
* When an AEM Sites page is part of a large content set with multiple live-copies, the page version history preview fails to load (NPR-33311).
* When you use the Move command to rename an AEM Sites page, the page title is not updated (NPR-33264).
* When you move pages through the column view, the columns disappear (NPR-33216).
* When the name of a local component in a language copy is identical to the name of a component in the blueprint and the component is rolled out from blueprint, term _msm_moved is not added to the name of the local component (NPR-33208).  
* The Page Redirect servlet appends .html to an AEM Sites URL where ResourceType is not cq:Page (NPR-33176).
* When you paste a subtree, there is no option to decide if corresponding subpages are to be pasted or not (NPR-33149).
* The number of results in live usages of a component is limited to number 49 (NPR-33058).
* When you base a Content Fragment on a schema and it contains a mandatory text area or a path field, the Content Fragment fails to save (NPR-33007).
* When you create a custom component using the Out-of-the-box experience fragment component and use it in AEM Sites pages, AEM does not display references (usage) for the custom component (NPR-32852).
* When you rename a folder with a large number of references, many references to the folder are not updated (NPR-32765).
* When you enable the source edit option it becomes available for inline full-screen options but remains missing for edit dialog and full-screen options of the rich text editor (NPR-32763).
* If you have a multi-field and it contains a required field (such as a dropdown or a pathfield) in the page properties of a blueprint, when a page containing such a multi-field is rolled out, the page properties of the live copy are not saved. (NPR-32751)
* Screen readers cannot use the heading structure to navigate a page. In addition, the Components tab has the wrong label  (NPR-32648).
* When pagination starts, Experience Fragments Picker does not load all the items (NPR-32605).
* Author permissions to read, modify, create, and delete live copies are revoked. Each Author had to explicitly provide read and modify permissions to move pages within a Blueprint (NPR-32550).
* Content authors fail to create Launch for a page that has an integration with Adobe Analytics (NPR-32548).
* When a user resumes inheritance with synchronization, the live copy of the parent page does not synchronize with the blueprint and displays an incorrect status (NPR-32500).  
* AEM Sites editor page takes more than 15 seconds to load (NPR-32413).
* Certain fields do not display the Cancel inheritance option (NPR-32362).
* When you select a path for an Experience Fragment component and select the Open Selection Dialog checkbox, you are not navigated to the selected path in the Path Browser (NPR-32308).
* When you upgrade from AEM 6.2 to AEM 6.5, the Parsys component of static templates do not display correctly. The height of the the Parsys component is set to 0 and the components inside it are not visible. (NPR-33663).
* When a user copies and pastes a Layout Container on the same page, components in a Layout Container do not display (NPR-33648).
* Dispatcher health check displays `Invalid cookie header` warning message in the log files (NPR-33629).

### Assets {#assets-6550-changes}

**Accessibility enhancements in Experience Manager Assets**

* It is now possible to bring keyboard focus on [!UICONTROL Comments] list and clickable option to [!UICONTROL Create] version comments under [!UICONTROL Create new version] in [!UICONTROL Timeline] panel of assets (NPR-33424).

* It is now possible to reach [!UICONTROL View Settings] option for assets and change settings in [!UICONTROL View Settings] dialog using keyboard keys (NPR-33420).

* The list box drop-down of combo box (in various fields on different pages) now shows entries as a list of options that can be announced by screen readers (NPR-33516).

* The sort functionality of sortable headers (in list view, [!UICONTROL Timeline] view, and [!UICONTROL Manage Publication] page) are now announced by screen readers and sorting controls on column headers are accessible using keyboard (NPR-32979).

* The clickable elements (such as comment cards, version updates, combo boxes, and chevron icons of menus) are now focusable and actionable using keyboard (NPR-33514).

* Functionality (or purpose of action) of insights icons (for usage, impressions, and clicks) on [!UICONTROL Insights View] are now correctly announced by screen readers (NPR-33513).

* Read-only form fields (for example disabled fields on [!UICONTROL Basic tab] of asset [!UICONTROL Properties]) are now focusable using keyboard (NPR-33493, CQ-4273031).

* Labels in various input fields are now permanent labels (thus accessible) and not just placeholder labels, which disappeared when text was entered (NPR-33475).

* Different heading levels (such as page titles and section headings) are now perceived as headings with different levels to screen reader users (NPR-33471).

* Interactive user interface elements, such as links and options (on header and zoom options of assets page, folder navigation), are now accessible using a keyboard (NPR-33468, CQ-4271412).
  
* The [!UICONTROL Options], [!UICONTROL Scope], and [!UICONTROL Workflows] progress indicators on [!UICONTROL Manage Publication] page are now correctly read out by screen readers as progress indicators, instead of tabs (NPR-33416).

* The color of star rating icons (such as in [!UICONTROL Rating] section of [!UICONTROL Advanced] tab in asset [!UICONTROL Properties] or in card view) is changed for appropriate contrast to be visible to users with limited vision and without perception of color (NPR-33414).

* Chevron up arrow next to [!UICONTROL Comment] field on assets details page can now be accessed using keyboard keys (NPR-33397).

* The expanded and collapsed states of [!UICONTROL Tags] dialog on asset [!UICONTROL Properties] and left rail navigation (on assets user interface) are now correctly announced by screen readers (NPR-33396).

* Titles of all the browsed pages on [!DNL Adobe Experience Manager] Assets are now unique (NPR-33343).

* While navigating tree structure various elements of the tree view control are now correctly announced by screen readers (NPR-33304).

* Different versions of assets in [!UICONTROL Timeline] view on assets details page are now accessible using keyboard keys (NPR-33283).

* Names of search suggestions appearing in Omnisearch combo box are now announced by screen readers while using search functionality (NPR-33280).

* Clickable elements and [!UICONTROL Go to link] in [!UICONTROL References rail] are now announced by screen readers as clickable elements (NPR-33278).

* Table structure information (such as row 1, cell 1, table) of [!UICONTROL Share Link] dialog is no more announced by screen readers, when the dialog opens (NPR-33268).

* The purpose of various combo box elements (such as Path field and option to open Selection dialog in Basic tab of asset Properties) are now correctly announced by screen readers (NPR-33235).

* Information that the rows in list view table are selectable is now communicated to screen reader users when keyboard focus is on them. This information is announced when mouse is hovered on the rows (NPR-33234).

* Options (having [!UICONTROL x]) to remove each of the selected tags below the [!UICONTROL Tags] field in [!UICONTROL Basic] tab of [!UICONTROL Properties] are now accessible to screen readers (NPR-33206).  

* Calendar date picker is now focusable and actionable using keyboard by screen reader users and sighted keyboard users (NPR-33200).

* The toggle to switch between list view and card view now correctly exposes its functionality (of adjusting views) to screen reader (NPR-33069).

* Menu in the left rail is now accessible. Functionality and purpose of expanding the menu is appropriately announced by screen readers (NPR-33068).

* List box and many other user interface elements are now accessible to non-sighted screen reader users, and following information about them is announced by screen readers (NPR-33040):

  * whether user input is required on an element before form submission.
  * whether an element is not editable.
  * whether a widget is selected or not.

* The option to open filter sidebar can now be accessed using keyboard (NPR-32842, CQ-4273018).

* Check box control in column header of list view is now accessible and purpose of using the control is announced by screen readers (NPR-32722, NPR-33005).

* Labels for hours (HH) and minutes (mm) fields in calendar date picker are now permanent labels instead of placeholder labels, and do not disappear when user enters text in these fields (NPR-32720).

* The links text of notifications (that appear after clicking the bell icon) is now announced to screen reader users, who use tab to access each link (NPR-32645).

* [!UICONTROL Select], [!UICONTROL Download], [!UICONTROL Properties], and [!UICONTROL More Actions] options on asset cards in [!UICONTROL Insights View] are now accessible using keyboard (NPR-32609).

* Visually hidden content (such as content of header menu bar on search results) is no more announced by screen readers when accessed using keyboard (NPR-32606).

* Purpose of the labels on controls to move to next and previous months in calendar date picker are now announced by screen readers (NPR-32604).

* Star rating icons are now focusable and actionable using keyboard keys (NPR-32513).

* Functionality to control video volume is now accessible through tab (to focus on volume slider) and arrow keys (to adjust volume) on keyboard (NPR-32065).

* The purpose of lower bound ([!UICONTROL From]) and upper bound ([!UICONTROL To]) input fields of File Size filter is now announced to non-sighted screen reader users (NPR-32064).

* The [!UICONTROL Languages] menu in [!UICONTROL Create and Translate] form is now accessible to screen readers in browse mode (CQ-4293906).

* The [!UICONTROL References] panel is now accessible with following enhancements (NPR-33261, CQ-4293798):

  * In browse mode, screen reader focus no longer moves to hidden multiline edit fields under [!UICONTROL Site References], [!UICONTROL Asset References], [!UICONTROL Copies], and [!UICONTROL Form References] sections.

  * Screen readers now announce the role of [!UICONTROL Site References] and [!UICONTROL Language Copies] elements.

  * The focus of screen readers in browse mode shifts in a meaningful sequence to various elements.

* [!UICONTROL Metadata Schema Editor] page and its elements are now accessible using keyboard and are screen reader friendly (CQ-4290962, CQ-4272953).

* The purpose of [!UICONTROL x] icon on the option to remove currently selected tags is also announced along with the number of selected tags (CQ-4273017).

* Decorative icons and images are now ignored by screen readers, to avoid confusion for non-sighted users using screen reader (CQ-4272944).

**Issues fixed in Experience Manager Assets**

[!DNL Adobe Experience Manager] 6.5.5.0 Assets provides fixes to the following issues:

* [!UICONTROL Start] option on [!UICONTROL Create Workflow] dialog for assets in a collection is disabled, thereby preventing workflow from getting triggered (NPR-32471).

* While using cascading drop-down in metadata schemas, on selecting and saving a drop-down option containing an apostrophe (from the child drop-down) the selected apostrophe option disappears after reopening asset [!UICONTROL Properties] (NPR-32649).

* [!UICONTROL Asset Insights Sync Job] stops and fails if it encounters invalid entries (on the Analytics side) instead of moving to the next entry (NPR-32674).

* Gyroscope is not functional as motions sensors are disabled by default on mobile browsers in panoramic viewer (CQ-4272937).

* [!UICONTROL Connected Assets Configuration] wizard fails to work with 404 error, on installing 6.5.3 on 6.5.1 (NPR-32730).

* During the XMP writeback process, all custom namespace metadata properties change the custom namespace prefix to ns2 as opposed to the namespace prefix that is configured (NPR-32748).

* Lazy loading is not triggered and only 100 assets are displayed on selecting to review the tasks from notifications inbox (NPR-32750).

* `NullPointerException` is observed due to missing node preferences in newly created user profile (SAML/SSO). This error prevents newly logged in users to use [!DNL Adobe Experience Manager Stock] integration (NPR-32777).

* Traversal warnings are observed in logs on opening a smart collection containing more than 10,000 assets (NPR-32980).

* Asset names are changed to lowercase when moving assets from one folder to another in [!DNL Adobe Experience Manager] working on Dynamic Media Scene7 runmode (NPR-32995).

* A searched asset cannot be deleted after navigating to its properties from the search results and then going back to search results to delete it (NPR-32998).

* [!UICONTROL Next] option remains disabled on selecting destination folder in [!UICONTROL Move Assets] interface (NPR-33356).

* [!UICONTROL Next] option is not enabled on selecting parent node (where single child folder is visible) and then selecting child folder (NPR-33275).

* Check in and check out permissions are disabled on Adobe Asset Link (AAL) for users with delete permission, even if other permissions such as read, create, or modify are allowed to them (NPR-33272).

* Smart Crop renditions are not available in asset download dialog (NPR-33167).

* Exception is observed in logs on opening renditions rail for a PDF under a folder with smart crop profile (CQ-4294201).

* Image Presets do not publish, if [!UICONTROL Dynamic Media sync mode] is disabled by default on AEM with Dynamic Media Scene7 runmode (CQ-4294200).

* Asset processing while bulk upload gets stuck and workflow instance shows stuck instances of DAM update asset (CQ-4293916).

* Creating a Dynamic Media configuration on AEM works, but on the user interface nothing happens on selecting Save (CQ-4292442).

* Preview of f4v video assets is not working in progressive playback on Safari/Mac (CQ-4289844).

* Extra folder is created on smart-cropping an asset that is inside a parent folder with dot `.` character in its name (CQ-4289337).

* Thumbnail is broken, and video processing banner is not shown when a video is copied (CQ-4284125).

* Dimensional viewer incorrectly displays empty thumbnails in Firefox for some models with empty camera views (CQ-4283447).

* Performance issues fixed in 6.5.5.0 are (CQ-4279206):

  * It takes too long to upload large binaries to Dynamic Media Image Processing servers.

  * Thumbnail generation time on AEM increases because of Dynamic Media Scene7 architecture.

* Dynamic Media Scene7 migration issues fail for customers with large number of assets (CQ-4279206).

* Layout of video 360 viewer is broken if `setVideo` is used, and video shifts down on using `video= modifier` (CQ-4263201).

* An error message displays while installing the AEM SDL package (NPR-33175).

### Platform {#platform-6550}

* The [!DNL Sling] filter is not called if the `sling:match` map entry is created under `/etc/maps` (NPR-33362).
* AEM crashes due to segmentation fault with [!DNL Apache Lucene] (NPR-32988).
* [!DNL Jackson] core package missing from AEM uber jar file (NPR-32848).
* CRXDE Lite does not load content for users without READ permission on the `jcr:primaryType` property for a node (NPR-32611).
* [!DNL Granite] maintenance task scheduler reinitializes too often during AEM deployments (CQ-4294627).
* When an SQL query runs for a longer time, for example 7 hours, AEM stops responding (NPR-33044).

### User Interface {#ui-6550}

* Radio button selection does not persist in a multifield (NPR-33309).
* Lazy loading limit does not work for the list view (NPR-33124).
* Omnisearch results page does not display a message if there are no matches (NPR-32974).  
* Omnisearch filter returns all matches under `/content` node ignoring the selected location (NPR-32849).  

### Integrations {#integrations-6550}

* Internal cache is cleared when a page with an Adobe Target component is published (NPR-33162).
* Integration with Adobe Target does not work on [!DNL Windows Internet Explorer] 11 (NPR-33111).
* When configuring Adobe Target, the [!UICONTROL Company] and [!UICONTROL Report Suite] fields do not appear on selecting a reporting source (NPR-32502). 
* When exporting experience fragments using Adobe I/O, metadata like Source Product is not exported into Adobe Target (NPR-32159). 
* Authorized IMS users in local AEM admin group cannot create or modify IMS configurations (NPR-33045).
* Adobe Launch configurations page does not display all records (NPR-33011).
* Users in content-authors group cannot edit properties of an Adobe Target component due to JavaScript error (NPR-32996).

### Translation Projects {#translation-6550}

* Translated tags are not imported into AEM from third-party translation services (NPR-33154).
* Translation configuration page displays incorrect translation provider than the one used for the translation (NPR-32971).
* Adding an experience fragment folder to an existing translation project creates a new project (NPR-32843).
* A `NullPointerException` error is seen in the logs on running a translation job (NPR-32628).

### WCM {#wcm-6550}

* Page Editor - The [!DNL Sites] Page Editor does not allow the keyboard-only users to skip to the main content instead of shifting tab focus through all options available in the header (CQ-4293883).
* Page Editor  - Panels that use Well component and include saved data do not display due to updates in [!DNL Chrome] and [!DNL Firefox] versions (CQ-4292995).
* MSM - Deleting a component from the page does not delete the component from the published version of the page (CQ-4292360).

### Brand Portal {#assets-brand-portal-6550}

* Removing a published metadata schema from [!DNL Brand Portal] results in an error (CQ-4292063).
* If an administrator configures [!DNL Experience Manager Assets] 6.5.4 with Brand Portal via Adobe Developer Console, the [!DNL Brand Portal] user is not able to publish a contribution folder's asset from [!DNL Brand Portal] to [!DNL Experience Manager]. (NPR-33046).
* Duplicate replication of the parent folders causing conflicts (NPR-33001).

### Communities {#communities-6550}

* Cannot delete a card in moderation console using the quick edit menu option (NPR-33117).
* An error occurs on accessing the [!UICONTROL Activity Stream] page (NPR-33146).
* Groups deleted on author instance are not removed from all publish instances (NPR-33199).
* Authors, after creating a new group, are not redirected to the [!UICONTROL Community Group] section on [!DNL Internet Explorer] 11 (NPR-33205).
* Accessing a message in AEM Inbox does not change the status of the message to Read (NPR-32764).
* Editing a [!DNL Communities] group and changing the thumbnail image does not update the group thumbnail image (NPR-32599).
* A user is not able to send an email to another user in a community (NPR-32598).
* A submitted blog does not display until the user refreshes the page (NPR-32391).
* While creating a version of notifications and subscriptions of User Generated Content (UGC), an incorrect ID of the source page is stored (CQ-4279355, CQ-4289703).

### Workflow {#workflow-6550}

* The [!UICONTROL Timeline] option in the left rail takes more time to load than expected (NPR-32851).
* After restarting an AEM instance, the email for the review task for a collection includes an incorrect payload link (NPR-32774).

### Forms {#forms-6550}

>[!NOTE]
>
>AEM Service Pack does not include fixes for AEM Forms. They are delivered using a separate Forms add-on package. In addition, a cumulative installer is released that includes fixes for AEM Forms on JEE. For more information, see [Install AEM Forms add-on](#install-aem-forms-add-on-package) and [Install AEM Forms on JEE](#install-aem-forms-jee-installer).

* Correspondence Management: The order of assets in a target area shuffles after submitting a letter (NPR-33359, NPR-33153).
* Adaptive Forms: When a user edits an adaptive form, the [!UICONTROL Start Workflow] option available in the [!UICONTROL Page Information] menu does not work (NPR-33004).
* Adaptive Forms: The user is not able to save an adaptive form with more than one attachment (NPR-32997).
* Adaptive Forms: Changing the panel layout in an adaptive form results in an error (CQ-4293880).
* Adaptive Forms: A new line to a string in an adaptive forms dictionary adds `&#xa;` characters to the dictionary (NPR-33266).
* Adaptive Forms accessibility: When a user previews an adaptive form as an HTML form, the [!UICONTROL Scribble Signature] field is not able to retain tab focus (NPR-33159).
* Adaptive Forms accessibility: The error messages that display on submitting an adaptive form do not link to an `aria-describedBy` attribute (NPR-33071).
* Adaptive Forms accessibility: Fields marked mandatory in an adaptive form do not have the mandatory attribute set to True in the ARIA accessibility schema (NPR-33070).
* PDFG Service: When a user converts a text file to a PDF, Japanese characters do not render correctly (NPR-33238).
* PDFG Service: `CreatePDF` operation fails to convert a PDF file to PDF OCR format (NPR-32994).
* PDFG Service: PDF conversion fails for the 200th instance of an [!DNL OpenOffice] document (NPR-32766).
* BackendIntegration: Form data model requests fail as the refresh token expires due to incorrect inactive state (NPR-33169).
* Designer: Screen readers execute the tabbing order based on the default geographic order instead of the custom tabbing order defined in the XDP file (NPR-32160).
* Designer: If the tagging option is enabled, the subform border disappears in the generated PDF output (NPR-32778).

## Install 6.5.5.0 {#install}

**Setup requirements**

* AEM 6.5.5.0 requires AEM 6.5. Check [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions.
* The Service Pack download is available on Adobe Package Share, which you can access directly from the AEM 6.5 instance.
* On a deployment with MongoDB and multiple instances, install AEM 6.5.5.0 on one of the Author instances using the Package Manager.
* Before installing, take a snapshot or a fresh backup of your AEM instance.
* Restart the instance before installation. While that is only needed when the instance is still in update mode (and this is the case when the instance was updated from an earlier version), it is recommended if the instance was running for longer period.

>[!NOTE]
>
>Adobe does not recommend removing or uninstalling the AEM 6.5.5.0 package.

### Install the Service Pack {#install-service-pack}

Perform the following steps to install the Service Pack on an existing AEM 6.5 instance:

1. Click the [Package Share](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq650/servicepack/AEM-6.5.5.0) or [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.5.zip) link to download the package.

1. Open [Package Manager](http://localhost:4502/crx/packmgr/index.jsp) and click **Upload Package** to upload the package.

1. Select the package name and click **Install**.

>[!NOTE]
>
>**Dialog on Package Manager UI sometimes exits immaturely during installation of 6.5.5.0**
>
>Therefore, it is recommended to wait for error logs to stabilize before accessing the instance. The user has to wait for specific logs related to uninstallation of updater bundle before being ensured that the installations is successful. It generally happens on Safari but can intermittently happen on any browser.

**Automatic installation**

There are two ways to automatically install AEM 6.5.5.0 into a running instance:

A. Place the package into `../crx-quickstart/install ` folder while the server is available online. The package gets installed automatically.

B. Use the [HTTP API from Package Manager](https://docs.adobe.com/content/docs/en/crx/2-3/how_to/package_manager.html) - make sure that you use `cmd=install&recursive=true` - so the nested packages  are  installed.

>[!NOTE]
>
>AEM 6.5.5.0 does not support Bootstrap installation.

**Validate installation**

1. The Product Information page (/system/console/ productinfo) displays the updated version string `Adobe Experience Manager, Version 6.5.5.0` under Installed Products.

1. All  OSGi  bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: /system/console/bundles).
1. The OSGI bundle `org.apache.jackrabbit.oak-core` is on version 1.10.6 or higher (Use Web Console: `/system/console/bundles`).

In order to see what platforms are certified to run with this release, please refer to the [Technical Requirements](/help/sites-deploying/technical-requirements.md).

### Install AEM Forms add-on package {#install-aem-forms-add-on-package}

>[!NOTE]
>
>Skip if you are not using AEM Forms. Fixes in AEM Forms are delivered through a separate add-on package.

1. Ensure that you have installed the AEM Service Pack.
1. Download the corresponding Forms add-on package listed at [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) for your operating system.
1. Install the Forms add-on package as described in [Installing AEM Forms add-on packages](../forms/using/installing-configuring-aem-forms-osgi.md#install-aem-forms-add-on-package).

### Install AEM Forms on JEE {#install-aem-forms-jee-installer}

>[!NOTE]
>
>Skip if you are not using AEM Forms on JEE. Fixes in AEM Forms on JEE are delivered through a separate installer.

For information about installing the cumulative installer for AEM Forms on JEE and post-deployment configuration, see the [release notes for patch 0014](https://helpx.adobe.com/aem-forms/quick-fixes/6-5/jee-patch-0014.html).

### UberJar {#uber-jar}

The UberJar for AEM 6.5.5.0 is available in the [Adobe Public Maven repository](https://repo.adobe.com/nexus/content/groups/public/com/adobe/aem/uber-jar/6.5.5/).

To use UberJar in a Maven project, refer to the article, [How to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM:

```shell
<dependency>
      <groupId>com.adobe.aem</groupId>
      <artifactId>uber-jar</artifactId>
      <version>6.5.5</version>
      <classifier>apis</classifier>
      <scope>provided</scope>
</dependency>
```

## Deprecated features {#removed-deprecated-features}

This section lists features and capabilities that have been marked as deprecated with AEM 6.5.5.0. Features that are planned to be removed in a future release are set to deprecated first, with an alternate option to use.

Customers are advised to review if they make use of the feature or capability in their current deployment, and make plans to change their implementation to use the alternate option.

| Area |Feature |Replacement |
|---|---|---|
| Integrations |The **[!UICONTROL AEM Cloud Services Opt-In]** screen has been deprecated. With the AEM and Target integration updated in AEM 6.5 to support the Target Standard API, which uses authentication via Adobe IMS and I/O, and the growing role of Adobe Launch for instrumenting AEM pages for analytics and personalization, the Opt-In wizard has become functionally irrelevant.  |Configure system connections, Adobe IMS authentication, and Adobe I/O integrations via respective AEM cloud services  |

## Known issues {#known-issues}

* If you are installing [!DNL Experience Manager] 6.5.5.0 with [!DNL Java] 11, restart the server after installing the Service Pack. No restart is required if you are installing the Service Pack with [!DNL Java] 8.

* If a folder in the hierarchy is renamed in [!DNL Experience Manager Assets] and the nested folder containing an asset is published to [!DNL Brand Portal], the title of the folder is not updated in [!DNL Brand Portal] until the root folder is published again.

* While installing AEM 6.5.5.0, update of [!DNL Chrome] version 83 is causing an issue in building packages. Use other available browsers, such as [!DNL Internet Explorer] and [!DNL Firefox], or other AEM standard package installation options to resolve the issue. The issue gets resolved after installing AEM 6.5.5.0.

* Unable to send an email to the remote SMTP server using the AEM default mail sender, as it only allows communication using TLS v1.2. Remove bundle `javax.mail:mail:1.5.0-b01` from `system/console` and refresh the bundles to resolve the issue.

* When a user selects to configure a field for the first time in an adaptive form, the option to save a configuration does not display in Properties Browser. Selecting to configure some other field of the adaptive form in the same editor resolves the issue.

* If [!UICONTROL Connected assets configuration] wizard returns a 404 error message after installation, manually reinstall the `cq-remotedam-client-ui-content` and `cq-remotedam-client-ui-components` packages using the Package Manager.

* The following errors and warning messages may display during installation of AEM 6.5.x.x:
  * “When the Target integration is configured in AEM using the Target Standard API (IMS authentication), then exporting Experience Fragments to Target results in wrong offer types getting created. Instead of type “Experience Fragment”/source “Adobe Experience Manager,” Target creates several offers with type “HTML”/source “Adobe Target Classic.”
  * `com.adobe.granite.maintenance.impl.TaskScheduler`: No maintenance windows found at granite/operations/maintenance.
  * Adaptive Form server-side validation fails when aggregate functions such as  SUM, MAX, and MIN are used. CQ-4274424
  * `com.adobe.granite.maintenance.impl.TaskScheduler` - No maintenance windows found at granite/operations/maintenance.
  * Hotspot in a Dynamic Media Interactive image is not visible while previewing the asset through Shoppable Banner viewer.

## OSGi bundles and content packages included {#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in AEM 6.5.5.0:

* [List of OSGi bundles included in AEM 6.5.5.0](assets/6550_bundles.txt)

* [List of Content Packages included in AEM 6.5.5.0](assets/6550_packages.txt)

## Restricted sites {#restricted-sites}

These sites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact customer support](https://docs.adobe.com/content/help/en/customer-one/using/home.html)
For more information on accessing the support portal, see [Accessing the support portal](https://helpx.adobe.com/experience-manager/kb/accessing-aem-support-portal.html).

>[!MORELIKETHIS]
>
>* [AEM 6.5 release notes](/help/release-notes/release-notes.md)
>* [AEM product page](https://www.adobe.com/solutions/web-experience-management.html)
>* [AEM 6.5 documentation](https://helpx.adobe.com/support/experience-manager/6-5.html)
>* Subscribe to [Adobe priority product updates](https://www.adobe.com/subscription/priority-product-update.html)

---
title: [!DNL Adobe Experience Manager] 6.5 Service Pack Release Notes.
description: Release notes specific to [!DNL Adobe Experience Manager] 6.5 Service Pack 6.
docset: aem65
mini-toc-levels: 1
---

# [!DNL Adobe Experience Manager] 6.5 Service Pack Release Notes {#aem-service-pack-release-notes}

## Release information {#release-information}

| Products | Adobe Experience Manager 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.6.0                      |
| Type     | Service Pack Release         |
| Date     | September 03, 2020                |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.6.zip) |

## What's included in Adobe Experience Manager 6.5.6.0 {#what-s-included-in-aem}

Adobe Experience Manager 6.5.6.0 is an important update that includes new features, key customer requested enhancements, and performance, stability, and security improvements, that are released since the general availability of 6.5 release in **April 2019**. It can be installed on top of Adobe Experience Manager 6.5.

The key features and enhancements introduced in Adobe Experience Manager 6.5.6.0 includes:

* Publishing the asset contribution folders from Brand Portal to Experience Manager Assets is now supported through proxy server as well.

* The auto-generated groups of private folder are now cleaned up on deletion of the private folder in [!DNL Experience Manager Assets].

* The descriptions of modifiers in video [!UICONTROL Viewer] preset editor has been updated in [!DNL Dynamic Media].

* A new company setting is provided to reflect the status of [!DNL Dynamic Media] connector.

* The default options for `test` and `aiprocess` are updated to `Thumbnail`, from `Rasterize` previously in Dynamic Media, to ensure that users need to create only thumbnail and skip the page extraction and keyword extraction.

* Prefill an adaptive form at the client.

* Form data model integration with RESTful APIs on a server with two-way SSL implementation.

* Enhanced caching for translated adaptive form pages.

* Support for Adobe Sign Text Tags in Automated Forms Conversion Service.

* Support to convert colored forms to adaptive forms using [!DNL Automated Forms Conversion service].

* Support for SMB 2 and SMB 3 protocols.

* The built-in repository (Apache Jackrabbit Oak) is updated to version 1.22.4.

For a complete list of features and enhancements introduced in Experience Manager 6.5.6.0, see [What's new in Adobe Experience Manager 6.5 Service Pack 6](new-features-latest-service-pack.md).

The following is the list of fixes provided in [!DNL Experience Manager] 6.5.6.0 release.

### [!DNL Sites] {#sites-6560}

* In [!DNL Sites] or [!DNL Screens], select a Project and click [!UICONTROL Management Publications]. Users cannot advance in the [!UICONTROL Manage Publication] wizard due to user interface errors. Specifically, the [!UICONTROL Publish] option does not work (NPR-34099).
* The position of iParsys (Inherited Paragraph System) is not reverted to its original default position after deselecting [!UICONTROL Cancel Inheritance] or [!UICONTROL Disable Inheritance] options (NPR-34097).
* If the `RolloutConfigManagerFactoryImpl` is not able to load a rollout config, it does not attempt to load the missing configs. It returns the cached configurations (NPR-34092).
* In Text core component, after using source HTML edit option, the class from `em` tag is removed (NPR-34081).
* After upgrading from Experience Manager 6.3.3 to Experience Manager 6.5.3, the roll-out process takes much longer and the rollout fails with a timeout error (NPR-34049).
* The `htmlwriter` doesn't encode back the attribute values. The markup that is present in the XF markup is exported with decoded attribute values (namely `"` instead of `&#34`). It causes issues on the Target side with Visual Experience Composer that uses the XF exported (NPR-34048).
* When moving pages in [!DNL Experience Manager Sites], enhance the logging to capture the version creation failure with reason (NPR-34014).
* In [!DNL Rich Text Editor] if all text is removed then the paragraph tag gets removed as well (NPR-33976).
* When the `siteadmin` page (in Classic UI) is opened or refreshed, the options in the `New` menu are disabled (NPR-33949).

  ![Screenshot to illustrate the issue of missing menu in Classic UI](assets/33949_missing_menu.png)

* A [!DNL Content Fragment] cannot be used as a `TemplatedResource` as it fails in `ContentFragmentUsePojo` (NPR-33911).
* Synchronous and asynchronous move operations can lead to errors due to concurrent transfers. Page move operations are restricted to synchronous move only. It prevents concurrent move of pages (NPR-33875).
* [!UICONTROL Manage Publication] operation to replicate content from Author to Publish instance fails and generates a JavaScript error (NPR-33872).
* When multiple pages or assets are selected to create versions, the new version is created only for the last selected page or asset (NPR-33866).
* Move a blueprint page with live copies to another folder. When moving it to the original folder, the move operation fails without any error (NPR-33864).
* When move action is used to rename a web page in the [!DNL Sites] Console, it displays two overlapped dialogs at the last step of the wizard (NPR-33831).

  ![Screenshot to illustrate NPR-33831 issue of overlapping move dialog](assets/33831_rename_dialog.png)

* The `cq:acLinks` and `cq:acUUID` properties for [!DNL Adobe Campaign] on the copy are removed during copy and paste operation (NPR-33794).
* When attempting a rollout on a child page of a detached parent live copy, [!DNL Experience Manager] generates a null pointer exception (NPR-33676).
* The [!DNL RTE] components in a layout container are not visible when the layout container is copied and pasted again on the page. The [!DNL RTE] components are not editable but are displayed upon a page refresh (NPR-33662).
* When resizing a layout component for different breakpoints (medium and large), the layout does not behave as expected (NPR-33608).
* In inline editing mode in [!DNL RTE], dragging an image does not work for Text component (NPR-33602).
* It is possible to create a component in a blueprint page with the same name as the page name. During rollout, `_msm_moved` is suffixed to rename the component. The component is moved to the end of the [!UICONTROL Paragraph System] (NPR-33535).
* When offTime or onTime is set on many pages or assets, it is resource-intensive and slows the system during startup and shutdown (NPR-33482).
* A user with CRUD permissions on `/content/experience-fragment` is not able to delete a folder (NPR-33436).
* You can select [!UICONTROL HTML & JSON] as the option for [!UICONTROL Adobe Target export format] on a parent folder in [!DNL Experience Fragments] section. The same properties are displayed in Touch-enabled UI for the subfolders of this parent folder. However, in CRXDE, for `cq:adobeTargetExportFormat`, it displays just HTML instead of displaying `html,json` (NPR-33423).
* Publish or Unpublish from a Page Alias is not supported. Remove the option that seems to claim otherwise (NPR-33415).
* A specific tag can be moved from one location to another in [!DNL Experience Manager]. It can also be applied to different pages before and after moving. When editing the properties of the pages, the tag is not displayed for editing even though the tag is the same (NPR-33353).
* A page template does not render properly when a layout container is deleted from a template that contains multiple layout containers (NPR-33347).
* In the template editor, try to delete a template that is used by more than 100000 pages under `/content/`. An error is displayed without any error message (NPR-33312).
* Redirection to [!DNL Experience Manager] page with anchor does not work on Author instance as `PageRedirectServlets` puts query string after a URL fragment or an anchor (NPR-34288).
* Creating a brand under `/content/campaign` results in a structure that does not allow to create campaigns. [!UICONTROL Create Brand] option leaves the newly created brand without ability to create [!UICONTROL Offers and Activities] as there is no [!UICONTROL Create] option (NPR-34113).
* You can suspend the [!DNL Live Copy] of a page and inheritance are broken in as seen in the Editor mode. In the page properties, the icon representing inheritance incorrectly indicates that the inheritance exists and is not broken (NPR-34017).
* Pages with many references cannot be moved asynchronously and sometimes the move operation fails (CQ-4297969).
* A web page with `/` character in the URL becomes unresponsive while authoring. When a component is added while authoring, the CPU usage increases and browser stops responding (CQ-4295749).
* In the browse mode, NVDA does not narrate a value selected from Type/Size menu option. The visual focus is not on the selected element. User who rely on a screen reader cannot use the browse mode (CQ-4294993).
* When creating a web page, users can select [!UICONTROL Content Page] template. In the [!UICONTROL Social Media] tab, users select a [!UICONTROL Preferred XF variation]. To select an Experience Fragment in NVDA browse mode, users cannot use keyboard keys (CQ-4292669).
* Updated the handlebars library to the more secure v4.7.3 (NPR-34484).

### [!DNL Assets] {#assets-6560}

**Accessibility enhancements in Experience Manger Assets**

* Users can now access and focus the interactive user interface options in [!UICONTROL References] list of assets using keyboard keys (NPR-34115).

* Screen reader now announce the options in search filter as expandable accordions (NPR-34104).

* Search page and search result page now have more informative titles for better understanding of screen reader users (NPR-34093).

* Screen readers now announce the options to delete the selected tags in [!UICONTROL Basic] tab of asset [!UICONTROL Properties] buttons to delete the selected tags (NPR-33972).

* The elements in each row in list view are now correctly announced as the elements of the same row by screen readers (NPR-33932).

* User focus when navigating using Tab key now correctly moves to the close option in version preview (NPR-33863).

* User focus now correctly moves to search icon after Omnisearch is closed (NPR-33705).

* The actionable user interface options now have more prominent visual focus with enhanced contrast when focused using keyboard keys. Therefore, sighted keyboard users can now differentiate the focused areas (NPR-33542).

* The drag functionality using keyboard now correctly functions in [!UICONTROL Metadata Schema Editor] in browse mode of screen reader (CQ-4296326).

* In the link sharing dialog, when navigating in browse mode, the screen readers,

  * now do not narrate the table information as soon as the dialog is loaded.

  * can navigate to all the listed auto-suggestions.

  * now narrate the displayed auto-suggestions for the [!UICONTROL Add Email Address/Search] (CQ-4294232).

* Use of the Esc key to remove the quick action icons from thumbnail view no longer removes keyboard focus from the last focused item (CQ-4293554).

* Screen reader now announces text alternatives, which depict their functionality, for icons (such as chevrons) instead of their literal names (CQ-4272943).

* Keyboard focus now successfully moves to [!UICONTROL Flyout], [!UICONTROL InlineZoom], [!UICONTROL Shoppable_Banner], [!UICONTROL Zoom_dark], [!UICONTROL Zoom_light], [!UICONTROL ZoomVertical_dark], and [!UICONTROL ZoomVertical_light] options when navigating using keyboard Tab key in asset details [!UICONTROL Viewers] in Dynamic Media (CQ-4290605).

* [!UICONTROL Save & Close] option on asset [!UICONTROL Properties] page can now be accessed using keyboard keys (NPR-34107).

* Error messages due to incorrect user name and password combinations on login page are now announced by screen readers each time the error occurs (NPR-33722).

* In [!DNL Experience Manager] header section, when navigating in browse mode, screen reader now announces,

  * auto edited suggestions in [!UICONTROL Type to search] in Omnisearch.

  * the state as expanded or collapsed for [!UICONTROL Solutions], [!UICONTROL Help], [!UICONTROL Inbox] and [!UICONTROL User] options.

  * the [!UICONTROL Searching Help] status message that is displayed when user enters a search string in [!UICONTROL Search for Help] field under [!UICONTROL Help] option.
  
  ![Help menu in header](assets/Help_aem_header.png)
  
  *Figure: [!UICONTROL Search for Help] in [!UICONTROL Help] menu*
  
  * the error message if incorrect value is entered in [!UICONTROL Impersonate as] field under [!UICONTROL User] option and focus correctly moves to the text field (NPR-33804).
  
  ![User menu in header](assets/User_aem_header.png)
  
  *Figure: [!UICONTROL Impersonate as] field in [!UICONTROL User] menu in header*

* User can now move focus using keyboard keys within:

  * [!UICONTROL Search/Add Email Address] field in [!UICONTROL Link Sharing] dialog.
  
  * [!UICONTROL Add User or Group] field under [!UICONTROL Closed User Group] in [!UICONTROL Permissions] tab of folder [!UICONTROL Properties] (NPR-34452).

**Issues fixed in Experience Manager Assets**

[!DNL Adobe Experience Manager] 6.5.6.0 Assets provides fixes to the following issues:

* Preview of marketing collateral assets (such as Brochure, Flyer, and Business card) created using [!DNL Adobe InDesign] (INDD) template do not retain line breaks and paragraph breaks (NPR-34268).

* Text extraction for the uploaded PDF files does not work and full-text search for some words in a PDF file fail to fetch that PDF file (NPR-34164).

  >[!NOTE]
  >To make this fix work, restart your Adobe Experience Manager instance  after installing the Service Pack 6.5.6.0.

* Timeline of multi-page assets displays annotations applied to all the sub assets when browsing the asset in Timeline view, instead of displaying the annotations specific to the specific sub assets (NPR-34100).

* Assets folders are not getting published using [!UICONTROL Manage Publication] option if the folders contain resources in JavaScript, CSS, or JSON file formats (NPR-34090).

* Deselecting or removing the applied tags or filters in Omnisearch executes the search query multiple times, which leads to increase in the search time (NPR-34078).

* In card view when a workflow (on an asset in a folder) is in progress or pending, the page reloads until the workflow is complete or terminated. Therefore, authors cannot work on those assets in the folder for which they have to scroll down (NPR-33986).

* If user moves a published asset to a new location, then the asset gets republished even if [!UICONTROL Republish] option is deselected. This leads to many orphaned assets lying on the publish instance. The default behavior, however, is that move operation on a published asset automatically unpublishes it; this asset is republished if author selects the [!UICONTROL Republish] option when moving the asset (NPR-33934).

* The [!UICONTROL Move Assets] page for assets in collections does not load all the HTML content, such as [!UICONTROL Adjust/ Republish] option. Therefore, users cannot complete the move operation (NPR-33860).

* Moving an asset and adding special characters in the name and title of the moved assets creates an extra folder (with the same name) at the new location of the asset (NPR-33826).

* [!UICONTROL Download] button for an asset gets disabled when [!UICONTROL Email] option is selected on the [!UICONTROL Download] dialog (NPR-33730).

* The error ‘Request-URI too long’ is observed on performing bulk operations on assets, such as bulk metadata editing (NPR-33723).

* JavaScript error is observed and users cannot select or delete the choices generated in [!UICONTROL Dropdown] field by [!UICONTROL Add through JSON path] functionality in the [!UICONTROL Folder Metadata Schema Form Editor], if the uploaded JSON file has space or special characters in value (NPR-33712).

* The static renditions of assets are not updated when asset is updated using [!UICONTROL Open] option in [!DNL desktop app] or [!DNL Adobe Asset Link] and are synced back to [!DNL Adobe Experience Manager] (CQ-4296279).

* In column view the move operation on a set of assets also moves those assets which were selected before using [!UICONTROL Filter] option for them. Note that use of [!UICONTROL Filter] option deselects the previous selection (NPR-34018).

* Backslashes are added before special characters in search suggestions of assets, which have special characters in their name (NPR-33834).

* When creating rules for dropdown in [!UICONTROL Folder Metadata Schema Form], user cannot select values from [!UICONTROL Field Choices] column (CQ-4297530).

* The run-time copy of assets custom workflow model (created in `/var/workflow/models/dam`) is deleted when you install 6.5 Service Pack 5 or previous versions on 6.5 GA (NPR-34532).

   >[!NOTE]
   >
   >Upgrading to the [!DNL Experience Manager] 6.5 Service Pack 6 does not retrieve your run-time copy, if your run-time copy is deleted on installing [!DNL Experience Manager] 6.5 Service Pack 5 or previous versions on 6.5 GA. To retrieve the run-time copy, sync the design time copy of the workflow model with the run-time copy using HTTP API:
`<designModelPath>/jcr:content.generate.json`.

**Issues fixed in Dynamic Media**

* If user defines the encoding settings in edits after creating the video profile, then the smart crop settings are removed from video profiles (CQ-4299177).

* Assets flicker on page load when user toggles between side rail options (for example, [!UICONTROL Overview], [!UICONTROL Timeline], [!UICONTROL Viewers]) on asset details page (NPR-34235).

* Following issues are observed with reprocess job:

  * Job ID is missing in job handle returned by reprocess job.

  * Reprocess job for video logs only filename and not full path.
  
  * Reprocess job does not have option to set the asset type as static.

  * `ExcludeFromAVS` option is not provided (CQ-4298401).

* The Smart Crop functionality fails with error when image profile is added to a folder having multiple (for example, 11) aspect ratios (NPR-34082).

* DAM update assets workflow is triggered when user scrolls down on [!UICONTROL Workflow Archive] page on [!UICONTROL Workflow] tab within [!UICONTROL Tools] in [!DNL Adobe Experience Manager] configured with Dynamic Media Scene7 (CQ-4299727).

* Symbols in [!UICONTROL Behavior] tab of [!UICONTROL Viewer Preset Editor] are not localized (CQ-4299026).

* The main view displays image in incorrect layout that does not fit in viewer, if the viewer is in responsive mode (CQ-4298293).

* Changes to image presets in [!UICONTROL Adobe Experience Manager] do not sync to Scene7 Publishing System (CQ-4299713).

### [!DNL Commerce] {#commerce-6560}

* Links to assets from products are not refactored when assets are moved (NPR-34098).

### Platform {#platform-6560}

* Cannot download logs using the Diagnosis tool on an upgraded Experience Manager instance (NPR-34336).
* Upgrade fails with an error due to dependencies on a specific version of the `cq-wcm-api` foundation package (CQ-4300520).
* The default values for the **[!UICONTROL Connect Timeout]** and **[!UICONTROL Socket Timeout]** settings for the Default Agent (publish) configuration are not specified (NPR-33707).
* Updates to the mapping configuration under `/etc/map.publish` do not reflect on the site pages (NPR-34015).
* [API reference documentation](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/day/cq/tagging/package-summary.html) does not include the documentation for the `com.day.cq.tagging` package (CQ-4295864).

### User Interface {#ui-6560}

* The Offloading Browser interface does not display all job topics (NPR-34308).
* The Configuration Browser interface does not display all configurations (NPR-33644).
* On pressing the `Esc` key when searching for users to impersonate, the **[!UICONTROL User]** dialog closes instead of the user list (NPR-34084).

### Integrations {#integrations-6560}

* Activities with long names are not synchronized with [!DNL Adobe Target] (NPR-34254).

### Translation Projects {#translation-6560}

* A translation project is not created if the user's `authorizableID` includes special characters (NPR-33828).

### Sling {#sling-6560}

* Health Check and Pattern Detector have overlapping functionality. As a result, Heath check is removed from the product (NPR-33928).

### WCM {#wcm-6560}

* Foundation Components - When you add a foundation image component to a page and reference an image, the `Undo` operation does not work (NPR-34516).

* Unable to use the Page Move operation (CQ-4303028).

### [!DNL Communities] {#communities-6560}

* Sharing a post on social media is showing an obsolete option Google+ (NPR-33877). 

* Community member is unable to modify group template or other Group Function settings (NPR-33530). 

* Hyperlink tags on images are not generated properly in a forum post (NPR-33464).

* Accessibility failures are identified in Community Assignment feature (NPR-33442).

* The existing users of a community group added through admin console are removed from the user list on any modification in the community group console (NPR-34315). 

<!--
* Tag filters are vulnerable to sensitive information disclosure (NPR-33868).
-->

### [!DNL Forms] {#forms-6560}

>[!NOTE]
>
>[!DNL Experience Manager] Service Pack does not include fixes for [!DNL Forms]. They are delivered using a separate [!DNL Forms] add-on package. In addition, a cumulative installer is released that includes fixes for [!DNL Experience Manager Forms] on JEE. For more information, see [Install AEM Forms add-on](#install-aem-forms-add-on-package) and [Install AEM Forms on JEE](#install-aem-forms-jee-installer).

After installing the [!DNL Experience Manager Forms] 6.5.6.0 add-on package:

* Stop the [!DNL Experience Manager Forms] instance.

* Delete `bcpkix-1.51`, `bcmail-1.51`, and `bcprov-1.51` JAR files from the `crx-repository\launchpad\ext` directory.

* Delete` sling.bootdelegation.class.org.bouncycastle.jce.provider.BouncyCastleProvider` property from the `sling.properties` file.

* Restart the [!DNL Experience Manager Forms] instance.

**Adaptive Forms**

* When there is a missing adaptive form fragment, the adaptive form fails to render (NPR-34302).

* Help content description for an adaptive form fields display a paragraph HTML tag (NPR-34116).

* When you select the **[!UICONTROL Revalidate on Server]** property, the adaptive form fails to submit (NPR-33876).

* The **[!UICONTROL Submit to REST endpoint]** submit action does not work for an adaptive form (CQ-4299044).

* Accessibility: When you try to submit an adaptive form without uploading an attachment for a mandatory field, the focus does not shift to the attachment field automatically (CQ-4298065).

* When you add rows to a table of an adaptive form, the **[!UICONTROL Add to top]** and **[!UICONTROL Add to bottom]** options does not display appropriate results (CQ-4297511).

* The [!UICONTROL Value Commit] script is triggered incorrectly, which results in data loss in an adaptive form (CQ-4296874).

* Date Picker does not work correctly for localized adaptive forms (NPR-34333).

* When there is an underscore or space in the filename, you are unable to attach the file to an adaptive form (CQ-4301001).

* When a nested repeatable panel has more occurrences than its parent, all the occurrences of such the nested repeatable panel fail to prefill (NPR-33666).

* Adaptive forms have some open resource resolvers. These lead to submission failures. The issue occurs intermittently (CQ-4299407).

**Workflow**

* When a workflow approver uploads an attachment, the attachment is renamed to `undefined` (NPR-33699).

* [!DNL Experience Manager] Workflow Purge operation fails and displays the following error message (NPR-33575):

   `java.lang.UnsupportedOperationException: The query read more than 500000 nodes in memory`

* [!DNL Experience Manager Forms] app for [!DNL Windows] stops responding after submitting a form (NPR-34409).

* When you install AEM Service Pack, the **To Do** list of items does not display as links. The text for the **To Do** items include HTML tags (NPR-34317).

**Interactive Communication**

* When you include a text document fragment with nested repeatable components, the Interactive Communication fails to save (NPR-34095).

**Correspondence Management**

* When you modify a text document fragment that includes data dictionary values, the Agent UI stops responding (NPR-33930).

* Copy-pasting content from a [!DNL Microsoft Word] document to a text document fragment in a letter results in formatting issues (NPR-33536).

**Document Services**

* When you generate a PDF file from an XDP file using Output and Forms services, it results in missing and overlapping text (NPR-34237, CQ-4299331).

* When you convert an HTML file to PDF, the `MaxReuseCount` attribute is not configurable (NPR-33470).

* When you download a PDF file that includes Reader Extensions interactive features, you cannot add an attachment to the PDF file using [!DNL Adobe Reader] (NPR-33729).

**Document Security**

* Unable to execute the Sign operation with HSM-based certificates in a PDF file after installing [!DNL Experience Manager] Service Pack (NPR-34310).

**Designer**

* Unable to open XForms in Designer version 6.5.x (CQ-4295322).

* When you open Designer, the Welcome screen displays an incorrect year (CQ-4295289).

* When you install [!DNL Acrobat DC] on the server, the **[!UICONTROL Distribute Form]** option is inactive (CQ-4296304).

For information on security updates, see [Experience Manager security bulletins page](https://helpx.adobe.com/security/products/experience-manager.html).

## Install 6.5.6.0 {#install}

**Setup requirements**

* AEM 6.5.6.0 requires AEM 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions.
* The service pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html).
* On a deployment with MongoDB and multiple instances, install AEM 6.5.6.0 on one of the Author instances using the Package Manager.
* Before installing, take a snapshot or a fresh backup of your AEM instance.
* Restart the instance before installation. While that is only needed when the instance is still in update mode (and this is the case when the instance was updated from an earlier version), it is recommended if the instance was running for longer period.

>[!NOTE]
>
>Adobe does not recommend removing or uninstalling the Adobe Experience Manager 6.5.6.0 package.

### Install the Service Pack {#install-service-pack}

Perform the following steps to install the Service Pack on an existing Adobe Experience Manager 6.5 instance:

1. Download the service pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.6.zip).

1. Open Package Manager and click **[!UICONTROL Upload Package]** to upload the package. To know how to use it, see [Package Manager](https://docs.adobe.com/content/help/en/experience-manager-65/administering/contentmanagement/package-manager.html).

1. Select the package and click **[!UICONTROL Install]**.

>[!NOTE]
>
>Dialog on Package Manager UI sometimes exits during the installation of the service pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installations is successful. Typically, this happens on [!DNL Safari] but can intermittently happen on any browser.

**Automatic installation**

There are two ways to automatically install Adobe Experience Manager 6.5.6.0 on a working instance:

A. Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.

B. Use the [HTTP API from Package Manager](https://docs.adobe.com/content/docs/en/crx/2-3/how_to/package_manager.html). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Adobe Experience Manager 6.5.6.0 does not support Bootstrap installation.

**Validate installation**

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.6.0)` under [!UICONTROL Installed Products].

1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1. The OSGI bundle `org.apache.jackrabbit.oak-core` is version 1.22.3 or higher (Use Web Console: `/system/console/bundles`).

To know the platforms certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

### Install Adobe Experience Manager Forms add-on package {#install-aem-forms-add-on-package}

>[!NOTE]
>
>Skip if you are not using AEM Forms. Fixes in Adobe Experience Manager Forms are delivered through a separate add-on package.

1. Ensure that you have installed the Adobe Experience Manager Service Pack.
1. Download the corresponding Forms add-on package listed at [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) for your operating system.
1. Install the Forms add-on package as described in [Installing AEM Forms add-on packages](../forms/using/installing-configuring-aem-forms-osgi.md#install-aem-forms-add-on-package).

### Install Adobe Experience Manager Forms on JEE {#install-aem-forms-jee-installer}

>[!NOTE]
>
>Skip if you are not using AEM Forms on JEE. Fixes in Adobe Experience Manager Forms on JEE are delivered through a separate installer.

For information about installing the cumulative installer for Experience Manager Forms on JEE and post-deployment configuration, see the [release notes for patch 0018](jee-patch-installer-65.md).

### UberJar {#uber-jar}

The UberJar for Experience Manager 6.5.6.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.6-1.0/).

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM:

```shell
<dependency>
      <groupId>com.adobe.aem</groupId>
      <artifactId>uber-jar</artifactId>
      <version>6.5.6-1.0</version>  
      <scope>provided</scope>
</dependency>
```

>[!NOTE]
>
>This release onwards, UberJar and other related artifacts are available on Maven Central Repository instead of Adobe Public Maven repository (repo.adobe.com). The main UberJar file is renamed to `uber-jar-<version>.jar`. As a result, there is no `classifier`, with `apis` as the value, for the `dependency` tag.

## Deprecated features {#removed-deprecated-features}

This section lists features and capabilities that have been marked as deprecated with AEM 6.5.6.0. Features that are planned to be removed in a future release are set to deprecated first, with an alternate option to use.

Customers are advised to review if they make use of the feature or capability in their current deployment, and make plans to change their implementation to use the alternate option.

| Area | Feature | Replacement |
|---|---|---|
| Integrations | The **[!UICONTROL AEM Cloud Services Opt-In]** screen is deprecated. With the AEM and Target integration updated in AEM 6.5 to support the Target Standard API, which uses authentication via Adobe IMS and I/O, and the growing role of Adobe Launch for instrumenting AEM pages for analytics and personalization, the Opt-In wizard has become functionally irrelevant. | Configure system connections, Adobe IMS authentication, and Adobe I/O integrations via the respective AEM cloud services. |
| Connectors | The Adobe JCR Connector for Microsoft SharePoint 2010 and Microsoft SharePoint 2013 is deprecated for AEM 6.5. | N/A |

## Known issues {#known-issues}

* If you install [!DNL Experience Manager] 6.5 Service Pack 5 or previous versions on 6.5 GA, the run-time copy of your assets custom workflow model (created in `/var/workflow/models/dam`) is deleted.
To retrieve your run-time copy, Adobe suggests to sync the design time copy of the custom workflow model with its run-time copy using the HTTP API:
`<designModelPath>/jcr:content.generate.json`.

* Contact Adobe Support if you encounter issues when editing and creating cascading rules in [!UICONTROL Folder Metadata Schema Forms Editor] and [!UICONTROL Metadata Schema Forms Editor] using [!UICONTROL Define Rule] dialog. Note that the rules that are already created and saved are working as expected.

* If a folder in the hierarchy is renamed in [!DNL Experience Manager Assets] and the nested folder containing an asset is published to [!DNL Brand Portal], the title of the folder is not updated in [!DNL Brand Portal] until the root folder is published again.

* When a user selects to configure a field for the first time in an adaptive form, the option to save a configuration does not display in Properties Browser. Selecting to configure some other field of the adaptive form in the same editor resolves the issue.

* If [!UICONTROL Connected assets configuration] wizard returns a 404 error message after installation, manually reinstall the `cq-remotedam-client-ui-content` and `cq-remotedam-client-ui-components` packages using the Package Manager.

* The following errors and warning messages may display during installation of AEM 6.5.x.x:
  * “When the Target integration is configured in AEM using the Target Standard API (IMS authentication), then exporting Experience Fragments to Target results in wrong offer types getting created. Instead of type “Experience Fragment”/source “Adobe Experience Manager,” Target creates several offers with type “HTML”/source “Adobe Target Classic.”
  * `com.adobe.granite.maintenance.impl.TaskScheduler`: No maintenance windows found at granite/operations/maintenance.
  * Adaptive Form server-side validation fails when aggregate functions such as SUM, MAX, and MIN are used. CQ-4274424
  * `com.adobe.granite.maintenance.impl.TaskScheduler` - No maintenance windows found at granite/operations/maintenance.
  * Hotspot in a Dynamic Media interactive image is not visible when previewing the asset through Shoppable Banner viewer.

## OSGi bundles and content packages included {#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in AEM 6.5.6.0:

* [List of OSGi bundles included in AEM 6.5.6.0](assets/6560_bundles.txt)

* [List of Content Packages included in AEM 6.5.6.0](assets/6560_packages.txt)

## Restricted sites {#restricted-sites}

These sites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact customer support](https://docs.adobe.com/content/help/en/customer-one/using/home.html)
For more information on accessing the support portal, see [Accessing the support portal](https://helpx.adobe.com/experience-manager/kb/accessing-aem-support-portal.html).

>[!MORELIKETHIS]
>
>* [AEM 6.5 release notes](/help/release-notes/release-notes.md)
>* [AEM product page](https://www.adobe.com/marketing/experience-manager.html)
>* [AEM 6.5 documentation](https://helpx.adobe.com/support/experience-manager/6-5.html)
>* Subscribe to [Adobe priority product updates](https://www.adobe.com/subscription/priority-product-update.html)

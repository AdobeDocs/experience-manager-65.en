---
title: [!DNL Experience Manager] 6.5 service pack release notes
description: Release notes specific to [!DNL Adobe Experience Manager] 6.5 service pack 10
docset: aem65
mini-toc-levels: 1
exl-id: 28a5ed58-b024-4dde-a849-0b3edc7b8472
---
# [!DNL Adobe Experience Manager] 6.5 service pack release notes {#aem-service-pack-release-notes}

## Release information {#release-information}

| Products | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.10.0                      |
| Type     | Service Pack Release         |
| Date     | August 26, 2021                |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.9-1.0.zip) |

## What is included in [!DNL Adobe Experience Manager] 6.5.10.0 {#what-s-included-in-aem}

[!DNL Adobe Experience Manager] 6.5.10.0 includes new features, key customer-requested enhancements, and performance, stability, and security improvements, that are released since the availability of 6.5 release in April 2019. The service pack is installed on [!DNL Adobe Experience Manager] 6.5.

The key features and enhancements introduced in [!DNL Adobe Experience Manager] 6.5.10.0 are:

<!-- TBD for Anuj: 
* Should ticket numbers be mentioned in enhancements? Yes for enhancements but no ticket numbers for key highlights.
* Should these enhancements be mentioned in the new features article? - Yes, they should be but at the end it should be PM's call.
* Adjust the sequence of each list item using this order as a guide: Foundation, Sites, Assets, Forms, Commerce, and Screens.
-->

* [!DNL Experience Manager] extends the [!DNL Connected Assets] functionality to the use of [!DNL Dynamic Media] images in the applicable core components. See [use Connected Assets](/help/assets/use-assets-across-connected-assets-instances.md).

* When users download assets shared as a link (link share feature), the users can choose to download the original assets, its renditions, or both.

* A new [!DNL Camera Raw] package is available that supports [!DNL Adobe Camera Raw] v10.4. See [process images using [!DNL Camera Raw]](/help/assets/camera-raw.md).

* [!DNL Dynamic Media] provides many accessibility enhancements for Viewers. See [[!DNL Dynamic Media] updates](#dynamic-media-65100).

* [!DNL Experience Manager] directly displays a list of all the content models under a folder without content authors having to navigate through the file structure. This requires fewer clicks and improves authoring efficiency.

* Pathfield in [!DNL Sites] editor allows authors to drag assets from [!DNL Content Finder].

* Platform provides a few accessibility enhancements. See [Platform updates](#platform-65100).

For a list of all features and enhancements introduced in [!DNL Experience Manager] 6.5.10.0, see [what is new in [!DNL Adobe Experience Manager] 6.5 Service Pack 10](new-features-latest-service-pack.md).

The following is the list of fixes provided in [!DNL Experience Manager] 6.5.10.0 release.

### [!DNL Sites] {#sites-65100}

* The focus shift to another field when typing in the **[!UICONTROL Default Value]** field under the **[!UICONTROL Properties]** tab of the Content Fragment Editor (NPR-36992).

* While filtering [!DNL Content Fragment] models under a specified path, [!DNL Experience Manager] search returns all nodes with `cq:Template` instead of returning paths and nodes only for the [!DNL Content Fragment] model (SITES-1453).
* Content Fragments return `null` as the status of folders (SITES-1157).
* Experience Manager does not provide the ability to disable and enable Content Fragment Models (SITES-1088).
* When a user moves, rename, or deletes content fragments or media assets, the referenced content fragments are not automatically updated (SITES-196).
* Pasting components from one page to another produces JavaScript errors (NPR-37030).
* When page properties are viewed quickly, Page Properties for a different page are opened (NPR-37025).
* The Content Fragment allows the Content Fragment to reference itself. The picker does not support the operation (NPR-36993).
* When a user upgrades to Service Pack 9, the moving folder operation starts failing and errors are returned (SITES-1481).
* While adjusting the width of the component in the layout container on edit mode, a flicker is observed (NPR-36961).
* On promoting a launch, the changes in the promoted launch are double rolled out to the other launches. If a user promotes the double rolled out launch, the doubled contents is reflected on the source page (NPR-36893).
* [!DNL Experience Manager] adds a gray border or edge to some PNG images with transparency if you add the images to the page with the Image Core Component or if you resize using the Foundation Image component (NPR-36879).
* [!DNL Experience Manager Sites] Admin UI with a high number of templates results in slow navigation (NPR-36870).
* When a user upgrades to Service Pack 9, [!DNL Sites] pages stop working (NPR-36857).
* The `ContextHubImpl` method creates a `ResourceResolver` that is not closed. It leads to warning messages about long-running `ResourceResolver` and the service returns unexpected results at times (NPR-36853).
* On synchronizing a single live copy from blueprint page properties, all other live copies are also synchronized (NPR-36829, NPR-36522).
* When only XLS MIME type is used, the file upload function does not work as expected (NPR-36785).
* New tags with pascal case and all upper case words are not displayed in the tag field within Content Fragments (NPR-36742).
* The Single Text Element option when adding a content fragment causes text to be missing and creates odd formatting related to lists and nested lists (NPR-36565).
* When an author annotates any component on a page, deletes the component, and performs an undo on the delete operation, an error is encountered when attempting to view the Timeline data for the page in the sites console (NPR-36528).
* Page properties Bulk Editor's [!UICONTROL Save & Close] option saves changes but does not close the editor (NPR-36527).
* When a user attempts to drag and drop a new Text component to a page, the component immediately disappears (NPR-36442).
* When a user types in an ad hoc tag that includes space (the tag that does not exist on the system) and hits enter, the tag appears under the field but when the Content Fragment is saved and reopened, the ad hoc tag disappears (NPR-36441).
* The template cannot be deleted when the instance is accessed via the Dispatcher (NPR-36385).
* When a page is moved, a manual refresh of the browser is required to render the changes (NPR-36381).
* When selecting a component, you can cut or copy it with Ctrl+X or Ctrl+C (and Command+X or Command+C on Mac). When you click another component, you can paste with the toolbar, but not the keyboard (Ctrl+V or Command+V) (NPR-36379).
* When a user tries cut components using the scissor icon to move them somewhere else, a console error happens. Moreover, when pasting only one component gets moved (NPR-36378).
* AEM has a query without index on WCM or notifications, it slows down performance (NPR-36303).
* When the author restores the inheritance on the deleted inherited component there is only a checkbox to synchronize full page content after reverting inheritance, thus content authors are forced to sync the whole page even if the inheritance is restored only on one component which can cause unwanted content sync (NPR-34456, CQ-4310183).
* Live Usage of a component on Author instance does not display all the occurrences. Some components are used in more than 1000 pages but the report only displays about 40 pages (CQ-4323724).
* When there is a site structure that has lot of subpages, loading of the subpages in column view takes more time in AEM 6.5.8 as compared to AEM 6.4.8.2 (CQ-4322766).
* Uncheck 'All' does not work on the 'Rollout Page' option (NPR-37070).                                 

### [!DNL Assets] {#assets-65100}

The following issues are fixed in [!DNL Assets]:

* The value of the property `jcr:title` is not updated on the Publish instance after a folder is moved. Renaming and republishing a folder within author does not update the `jcr:title` property value of the same in the Publish instance (NPR-36369).

* If two or more assets are selected and one or more metadata fields are edited, the save operation fails with error code 500 in Safari browser (NPR-36413).

* Bulk metadata import fails because of incorrect date format (NPR-36428).

* When a selection is made in the [!UICONTROL Properties] page to update metadata, the interface is slow to respond when there are many options provided by the schema (NPR-36430).

* Search Filter using the [!UICONTROL Expiry Status] predicate is not working (NPR-36436).

* The popup menu for various fields in [!UICONTROL Folder Metadata] properties does not display the last selected values (NPR-36937, CQ-4314429).

* When searching for files and folders, if user applies a filter and selects [!UICONTROL Files & Folders], only the files are displayed but not the folder (CQ-4319543).

* The toolbar options are different when the same Collection is selected from within a folder and when it is selected from a search result (NPR-36620).

* The [!UICONTROL Quick Publish] option is not available on the search results page (NPR-36904, CQ-4317748).

* When users create live copy of an asset without specifying its extension, then after download the live copy file is not usable (NPR-36903, CQ-4326305).

* When a user is added as an owner of a child folder, then the user gets owner permission of its parent folder too and hence of the other children folders of the parent. Also, the user is not removed as owner of parent folder on attempting to remove it. (NPR-36801, CQ-4323737).

* [!DNL Assets] generates an out-of-memory exception when you attempt to create subassets for compound assets, such as a PowerPoint presentation (NPR-36668).

* When users move an asset that is already used in a published sites page, then the sites page is published again even if the option to publish is not selected (NPR-36636, CQ-4323500).

* When using the Apache Tika MIME type detection feature, the assets uploaded using the `AssetManager.createAsset` method leave a temporary file named `apache-tika-*.tmp` file in the temporary directory. This temporary file uses all the available free disk space (NPR-36545).

* All DRM-protected assets are downloaded and user selection to download specific asset is not followed (CQ-4327422).
* Cannot drag assets to `pathfield` on the user interface (NPR-36849).
* When you select an asset in the Column view, the asset details panel disappears (NPR-36667).

### [!DNL Dynamic Media] {#dynamic-media-65100}

**Issues fixed**

[!DNL Adobe Experience Manager] 6.5.10.0 [!DNL Assets] provides the following bug fix in [!DNL Dynamic Media].

* Uploaded videos to [!DNL Experience Manager] display `Process failed` after `dynamicmedia_scene7` runmode is enabled and sync is disabled (CQ-4327791).

**Accessibility enhancements**

[!DNL Adobe Experience Manager] 6.5.10.0 [!DNL Assets] provides the following accessibility enhancements in [!DNL Dynamic Media Viewers].

* Screen readers now narrate the placeholder text to search and add Email address as a required field on share assets as a link dialog, and also announces the [!UICONTROL Please fill out this field] tooltip (CQ-4327761).

* Screen readers now correctly narrate the names and purposes of various fields in the [!UICONTROL Image Preset Editor] on accessing the user interface fields using keyboard (CQ-4325677).

* Keyboard focus now appropriately moves to search tab of [!UICONTROL Viewer Presets] dialog box from asset picker of [!UICONTROL Rich Media Type] option (CQ-4324736).

* When navigating in forms mode using keyboard keys, the screen readers narrate the labels corresponding to increment and decrement options on [!UICONTROL Create] tab of [!UICONTROL Image Presets] (CQ-4323900).

* Screen readers now announce the [!UICONTROL Search and Add Email Address] option on share assets as a link dialog box (CQ-4323352).

* Keyboard focus is retained on the toolbar when navigating assets using keyboard keys (CQ-4322037).

* Screen readers now narrate the newly added [!UICONTROL Edit] field information after selecting the [!UICONTROL Add Crop] option within the [!UICONTROL Responsive Image Crop] on [!UICONTROL Edit Image Processing Profile] page (CQ-4290734).

* On [!UICONTROL Edit Image Preset] and [!UICONTROL Create Interactive Video] pages, screen readers now appropriately announce the page heading when navigating the pages using heading keyboard shortcut keys (CQ-4290730)(CQ-4290701).

* Screen readers can now recognize the various regions of the screen (such as right panel region, left panel, action toolbar, viewer toolbar landmark, and zoomable image landmark) using landmark and region shortcut keys when navigating the following pages; so that users can perform various operations using options on these regions.

  * [!UICONTROL Viewer Preset Editor] (CQ-4290729)

  * [!UICONTROL Image Set Editor] (CQ-4290710)

  * [!UICONTROL Create Interactive Video] (CQ-4290702).

* Screen readers now announce the name for the share option in the video frame, when navigating using down arrow key (CQ-4290728).

* Screen readers now narrate the names for various options in [!UICONTROL Sprite] and [!UICONTROL Background] tabs in [!UICONTROL Appearance] tab in [!UICONTROL Viewer Preset Editor] (CQ-4290727).

* Mandatory fields, like the field to edit [!UICONTROL Width], in the [!UICONTROL Basic] tab of [!UICONTROL Edit Video Encoding] page now have an asterisk symbol (*) (CQ-4290725).

* Screen readers now announce the label for the options on [!UICONTROL Image Profiles] page (CQ-4290723).

* Windows users can now navigate out of the expanded CSS editor on [!UICONTROL Viewer Preset Editor] when the focus is on the CSS Editor (CQ-4290720).

* On [!UICONTROL Basic] tab of [!UICONTROL Edit Image Preset] when navigating in Form mode, the screen readers now narrate the labels for various edit fields and options (CQ-4290717).

* Screen readers now narrate the role and state (selected or not selected) for user interface options in the left navigation on assets' details page (CQ-4290709).

* Screen readers now correctly narrate the state (selected or not selected) and link for the image toggles in the [!UICONTROL Content] tab of [!UICONTROL Create Interactive Video] page (CQ-4290707).

* Screen readers now correctly narrate the name, role, and state of various segments in the video timeline scale when navigating using down arrow key on [!UICONTROL Create Interactive Video] page (CQ-4290706).

* Screen readers now narrate the name, role, and default state (selected or not selected) and property when navigating the options in [!UICONTROL Create Interactive Video] page (CQ-4290704).

* Screen readers now narrate the name, role, and default state (selected or not selected) of options in [!UICONTROL All Assets] and [!UICONTROL All Collections] options when navigating the [!UICONTROL Publish] page (CQ-4290705).

* When you upload an unsupported video format (other than MP4) on [!UICONTROL Create Interactive Video] page, Experience Manager displays and announces error messages (CQ-4290700).

* The contrast of the numbers (time in seconds) in the timeline scale on [!UICONTROL Create Interactive Video] page now meet minimum required luminosity ratio, so that users with limited perception of color can easily read (CQ-4290699).

* Screen readers now announce the label for the [!UICONTROL Product Name] field when navigating the [!UICONTROL Create Interactive Video] page (CQ-4290697).

### Platform {#platform-65100}

The following enhancements are delivered in this service pack:

* When a user selects an item in the Tree view, the screen readers announce the selection and the toolbar options displayed at the top (NPR-36504).
* Some text and control names are easier to read for users with vision issues, as the luminosity ratio meets the minimum required ratio of 4.5:1 (NPR-36503).
* When a user uses the calendar controls, the screen reader narrates the descriptive date, month, and weekday information. When a user uses calendar shortcut key, the screen reader narrates the change in date, month, and year (NPR-36498).
* Support provided to execute custom JavaScript Clientlibs using ECMAScript 6 features without complying with strict mode. Specifically, `emitUseStrict` flag is added to the `GCCScriptProcessor` (NPR-36411).

The following bug fixes are part of this service pack:

* Custom health checks run frequently than scheduled (NPR-36985).
* The `Resourceresolver map` method returns incorrect result for alias pages (NPR-36767).
* [!DNL Experience Manager] start-up is delayed due to loading workflows (NPR-36615).

### Integrations {#integrations-65100}

* Experience Manager becomes unresponsive when the primary MongoDB node switches to another node (NPR-36566).
* [!DNL Sling content distribution] fails when performing the collection member delete operation (NPR-36521, CQ-4323578).

### User Interface {#user-interface-65100}

* Asset and Site references are not displayed in the **[!UICONTROL References]** side-panel (GRANITE-35078, GRANITE-34892).

### Translation projects {#translation-65100}

* Extra subpages in a language copy of a multi-translation project are deleted (NPR-36622).

### Workflow {#workflow-65100}

* If the server receives an out-of-office message, it reports memory alerts and stops responding (NPR-36768).

### [!DNL Communities] {#communities-65100}

* Community site pages are opening in `LoggedIn` state for anonymous guest users (NPR-36908). 

* When there is more than one page in the **[!UICONTROL Community]** > **[!UICONTROL Ideas]** > **[!UICONTROL Comments]** page, the page navigation does not work (NPR-36541). 

<!--
Need to verify with Engineering, the status is currently showing as Resolved
-->


<!--
### [!DNL Brand Portal] {#brandportal-65100}

*
--> 

### [!DNL Forms] {#forms-65100}

>[!NOTE]
>
>* [!DNL Experience Manager Forms] releases the add-on packages one week after the scheduled [!DNL Experience Manager] Service Pack release date.

### Commerce {#commerce-65100}

* The value in the **[!UICONTROL Published By]** field displayed is incorrect in the Column view (NPR-36902).
* When a Catalog is rolled out, new products are incorrectly marked as modified products (NPR-36666).
* When you recreate a deleted product, the product page is not recreated (NPR-36665).
* Modified pages are updated but the corresponding linked products are not updated on Catalog rollout (CQ-4321409, NPR-36422).
* The **[!UICONTROL Publish later]** and **[!UICONTROL Unpublish later]** workflows do not work (CQ-4327679).

For information on security updates, see [[!DNL Experience Manager] security bulletins page](https://helpx.adobe.com/security/products/experience-manager.html).

## Install 6.5.10.0 {#install}

**Setup requirements and more information**

* Experience Manager 6.5.10.0 requires Experience Manager 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions.
* The service pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html).
* On a deployment with MongoDB and multiple instances, install Experience Manager 6.5.10.0 on one of the Author instances using the Package Manager.

>[!NOTE]
>
>Adobe does not recommend removing or uninstalling the [!DNL Adobe Experience Manager] 6.5.10.0 package.

### Install the service pack {#install-service-pack}

To install the service pack on an [!DNL Adobe Experience Manager] 6.5 instance, follow these steps:

1. Restart the instance before installation if the instance is in update mode (and this is the case when the instance was updated from an earlier version). Adobe also recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the service pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.9-1.0.zip).

1. Open Package Manager and click **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package and click **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>Dialog on Package Manager UI sometimes exits during the installation of the service pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installations is successful. Typically, this happens on [!DNL Safari] but can intermittently happen on any browser.

**Automatic installation**

There are two ways to automatically install [!DNL Experience Manager] 6.5.10.0 on a working instance:

A. Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.

B. Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Adobe Experience Manager 6.5.10.0 does not support Bootstrap installation.

**Validate the installation**

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.10.0)` under [!UICONTROL Installed Products].

1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.3 or later (Use Web Console: `/system/console/bundles`).

To know the platforms certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

<!--### Install Adobe Experience Manager Forms add-on package {#install-aem-forms-add-on-package}

>[!NOTE]
>
>Skip if you are not using Experience Manager Forms. Fixes in Experience Manager Forms are delivered through a separate add-on package a week after the scheduled [!DNL Experience Manager] Service Pack release.

1. Ensure that you have installed the Adobe Experience Manager Service Pack.
1. Download the corresponding Forms add-on package listed at [AEM Forms releases](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html#forms-updates) for your operating system.
1. Install the Forms add-on package as described in [Installing AEM Forms add-on packages](../forms/using/installing-configuring-aem-forms-osgi.md#install-aem-forms-add-on-package).

>[!NOTE]
>
>Experience Manager 6.5.10.0 includes a new version of [AEM Forms Compatibility Package](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html#aem-65-forms-releases). If you are using an older version of AEM Forms Compatibility Package and updating to Experience Manager 6.5.10.0, install the latest version of the package post installation of Forms Add-On Package.

### Install Adobe Experience Manager Forms on JEE {#install-aem-forms-jee-installer}

>[!NOTE]
>
>Skip if you are not using AEM Forms on JEE. Fixes in Adobe Experience Manager Forms on JEE are delivered through a separate installer.

For information about installing the cumulative installer for Experience Manager Forms on JEE and post-deployment configuration, see the [release notes](jee-patch-installer-65.md).

>[!NOTE]
>
>After installing the cumulative installer for Experience Manager Forms on JEE, install the latest Forms add-on package, delete the Forms add-on package from the `crx-repository\install` folder, and restart the server.-->

### UberJar {#uber-jar}

The UberJar for Experience Manager 6.5.10.0 is available in the [Maven Central repository](https://repo1.maven.org/maven2/com/adobe/aem/uber-jar/6.5.9-1.0/).

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM:

```shell
<dependency>
     <groupId>com.adobe.aem</groupId>
     <artifactId>uber-jar</artifactId>
     <version>6.5.9-1.0</version>
     <scope>provided</scope>
</dependency>
```

>[!NOTE]
>
>UberJar and the other related artifacts are available on Maven Central Repository instead of Adobe Public Maven repository (`repo.adobe.com`). The main UberJar file is renamed to `uber-jar-<version>.jar`. So, there is no `classifier`, with `apis` as the value, for the `dependency` tag.

## Deprecated features {#removed-deprecated-features}

Below is a list of features and capabilities that are marked as deprecated with [!DNL Experience Manager] 6.5.7.0. Features are marked deprecated initially and later removed in a future release. An alternate option is provided.

Review if you use a feature or a capability in a deployment. Also, plan to change the implementation to use an alternate option.

| Area | Feature | Replacement |
|---|---|---|
| Integrations | The **[!UICONTROL AEM Cloud Services Opt-In]** screen is deprecated. With the Experience Manager and Adobe Target integration updated in Experience Manager 6.5 to support the Adobe Target Standard API, which uses authentication via Adobe IMS and [!DNL Adobe I/O], and the growing role of Adobe Launch for instrumenting Experience Manager pages for analytics and personalization, the opt-in wizard has become functionally irrelevant. | Configure system connections, Adobe IMS authentication, and [!DNL Adobe I/O] integrations via the respective [!DNL Experience Manager] cloud services. |
| Connectors | The Adobe JCR Connector for Microsoft® SharePoint 2010 and Microsoft® SharePoint 2013 is deprecated for Experience Manager 6.5. | N/A |

## Known issues {#known-issues}

* If you are upgrading your [!DNL Experience Manager] instance from 6.5 to 6.5.10.0 version, you can view `RRD4JReporter` exceptions in the `error.log` file. To resolve the issue, restart the instance.

* If you install [!DNL Experience Manager] 6.5 Service Pack 5 or a previous service pack on [!DNL Experience Manager] 6.5, the runtime copy of your assets custom workflow model (created in `/var/workflow/models/dam`) is deleted.
To retrieve your runtime copy, Adobe recommends to synchronize the design-time copy of the custom workflow model with its runtime copy using the HTTP API:
`<designModelPath>/jcr:content.generate.json`.

* If a folder in the hierarchy is renamed in [!DNL Assets] and a nested folder containing an asset is published to [!DNL Brand Portal], the title of the folder is not updated in [!DNL Brand Portal] until the root folder is republished.

* When a user selects to configure a field for the first time in an adaptive form, the option to save a configuration does not display in Properties Browser. Selecting to configure some other field of the adaptive form in the same editor resolves the issue.

* The following errors and warning messages may display during installation of Experience Manager 6.5.x.x:
  * “When the Adobe Target integration is configured in Experience Manager using the Target Standard API (IMS authentication), then exporting Experience Fragments to Target results in wrong offer types getting created. Instead of type “Experience Fragment”/source “Adobe Experience Manager,” Target creates several offers with type “HTML”/source “Adobe Target Classic.”
  * `com.adobe.granite.maintenance.impl.TaskScheduler`: No maintenance windows found at granite/operations/maintenance.
  * Adaptive Form server-side validation fails when aggregate functions such as SUM, MAX, and MIN are used (CQ-4274424).
  * `com.adobe.granite.maintenance.impl.TaskScheduler` - No maintenance windows found at granite/operations/maintenance.
  * Hotspot in a Dynamic Media interactive image is not visible when previewing the asset through Shoppable Banner viewer.
  * `com.adobe.cq.social.cq-social-jcr-provider bundle com.adobe.cq.social.cq-social-jcr-provider:1.3.5 (395)[com.adobe.cq.social.provider.jcr.impl.SpiSocialJcrResourceProviderImpl(2302)]` : Timeout waiting for reg change to complete unregistered.

## OSGi bundles and content packages included {#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in [!DNL Experience Manager] 6.5.10.0:

* [List of OSGi bundles included in Experience Manager 6.5.10.0](assets/6590_bundles.txt)

* [List of Content Packages included in Experience Manager 6.5.10.0](assets/6590_packages.txt)

## Restricted websites {#restricted-sites}

These websites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* See [how to contact Adobe Customer Care](https://experienceleague.adobe.com/docs/customer-one/using/home.html).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] 6.5 release notes](/help/release-notes/release-notes.md)
>* [[!DNL Experience Manager] product page](https://www.adobe.com/marketing/experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/docs/experience-manager-65.html)
>* [Subscribe to Adobe priority product updates](https://www.adobe.com/subscription/priority-product-update.html)

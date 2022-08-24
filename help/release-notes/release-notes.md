---
title: Release Notes for [!DNL Adobe Experience Manager] 6.5
description: "Find release information, what's new, install how-tos, and a detailed change list for [!DNL Adobe Experience Manager] 6.5."
mini-toc-levels: 3

---
# [!DNL Adobe Experience Manager] 6.5 Latest Service Pack Release Notes {#aem-service-pack-release-notes}

<!-- For an itemized list of all issues found in these release notes, see the following spreadsheet: https://adobe-my.sharepoint.com/:x:/r/personal/anujkapo_adobe_com/_layouts/15/Doc.aspx?sourcedoc=%7B3ea81ae4-e605-4153-b132-f2698c86f84e%7D&action=edit&wdinitialsession=d8c7b903-87fc-4f2d-9ef2-542a82169570&wdrldsc=3&wdrldc=1&wdrldr=SessionMemoryQuotaExceededDuringSession&cid=a915e87c-369a-480c-9daf-d13efc766798 -->

## Release information {#release-information}

| Product | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.14.0 <!-- UPDATE FOR EACH NEW RELEASE -->                     |
| Type     | Service Pack release         |
| Date     | August 25, 2022 <!-- UPDATE FOR EACH NEW RELEASE -->              |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.14.0.zip) <!-- UPDATE FOR EACH NEW RELEASE -->|

## What is included in [!DNL Experience Manager] 6.5.14.0 {#what-is-included-in-aem-6514} 

[!DNL Experience Manager] 6.5.14.0 includes new features, key customer-requested enhancements, bug fixes, and performance, stability, and security improvements, that are released since the initial availability of 6.5 in April 2019. [Install this service pack](#install) on [!DNL Experience Manager] 6.5. <!-- UPDATE FOR EACH NEW RELEASE -->

<!-- Some of the key features and improvements are the following:

* _REVIEWERS: WHAT ARE THE KEY FEATURES AND ENHANCEMENTS YOU WANT TO HIGHLIGHT IN THIS RELEASE?_

* Added support for password reset for Dynamic Media Classic users within Experience Manager. (ASSETS-10298) -->

<!-- UPDATE BELOW FOR EACH NEW RELEASE -->

## [!DNL Assets] {#assets-6514}

* Unable to add or view tags for PDF files. (NPR-38452)
* When you configure Connected Assets, save the configuration, reopen the configuration page, and test the already saved configuration, the test connection fails. (NPR-38507)
* Unable to add users with numeric user ID to collections. (NPR-38538)
* Experience Manager fails to process the FFmpeg installed on the author instance. (NPR-38568)
* PDF processing fails with a `NoClassDefFoundError` error message. (NPR-38741)
* The Add button under Custom Columns does not display correctly while creating an asset report for `de_DE` locale. (ASSETS-10641)
* When you upload a duplicate asset to the Digital Asset Management repository and Experience Manager detects and provides an option to delete the duplicate asset, the original asset also gets deleted from the repository. (ASSETS-10826)
* Experience Manager does not save the folder metadata correctly when you specify special characters in multifields. (ASSETS-10721)
* Unable to save Asset properties until you click **[!UICONTROL Save & Close]** twice. (ASSETS-12040)
* The screen reader only announces the `Relate` button. However, the `Relate` button also contains a submenu and can be expanded and collapsed. (ASSETS-6938)
* Required ARIA (Accessible Rich Internet Applications) attributes `aria-expanded` for `role="combo box"` is missing. (ASSETS-6928)
* In Card view, in the main file navigation area, the text content **[!UICONTROL Sort by]** does not have at least a 4.5:1 contrast ratio against their background color. (ASSETS-6926)
* Experience Manager does not identify **[!UICONTROL Select a Workflow model]** dropdown list as a required field while creating a workflow model. (ASSETS-6871)

>[!NOTE]
>
>Smart Content Services will not be available to new Experience Manager Assets On-Premise customers effective September  1, 2022. No impact to existing On-Premise and Adobe Managed Services customers who enabled this capability already.

### [!DNL Dynamic Media] {#dynamic-media-6514}

* Add support for password reset for Dynamic Media Classic user within Experience Manager. (ASSETS-10298)
* Smart Crops generated for the images with transparent background have white background. (ASSETS-13148)
* Dynamic Media do not generate thumbnails for EPS files. (ASSETS-10959)
* Assets not getting uploaded to Dynamic Media account because of missing upload parameter. (ASSETS-13165)
* Allow assets with names greater than 127 characters to be uploaded into Dynamic Media. (ASSETS-9991)
* Enablement of JavaScript ES6 (ECMAScript 6) for Dynamic Media Viewers on Experience Manager 6.5.14.0. (NPR-38393)
* Configuring the options in Dynamic Media **[!UICONTROL General Settings]** and **[!UICONTROL Publish Setup]** should not be accessible by non-administrator users. (ASSETS-8628)
* Dynamic Media **[!UICONTROL General settings]** page does not show the already configured upload parameters correctly. (ASSETS-10245)
* Experience Manager user interface does not show any failure message in case set creation/update fails. (ASSETS-10264)
* Unable to apply a saved policy to one of the containers of an editable template to let you add Dynamic Media components. (ASSETS-11044)
* Assets not getting uploaded to Dynamic Media account after running the Dynamic Media Reprocess Assets workflow on assets with incorrect job handle. (ASSETS-12084, ASSETS-9877)
* Screen reader users are impacted by the `title` attribute not being provided for `<frame>` and `<iframe>` in the **[!UICONTROL Type to Search]** dialog box. (ASSETS-5483)
* In screen readers, related and meaningful `alt=` value should be provided for multiple images that are present under **[!UICONTROL Assets]** heading in the left pane. (ASSETS-5644)
* Screen reader does not read **[!UICONTROL Mute]** and **[!UICONTROL Unmute]** button on video using Dynamic Media component. (ASSETS-10169)

## Commerce {#commerce-6514}

* Commerce products are not getting sorted using the column header and it is using _remote_ sort mode; instead, Commerce products should be getting sorted using column headers with _local_ sort mode. (CQ-4343750, NPR-38498)

## [!DNL Forms] {#forms-6514}

>[!NOTE]
>
>* [!DNL Experience Manager Forms] releases the add-on packages one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the add-on packages will release Thursday, September 1, 2022. In addition, a list of Forms fixes and enhancements will also be added to this section.

## Integrations {#integrations-6514}

* Enable JavaScript ES6 (ECMAScript6 mode or better) compilation support for the minification of the `/libs/cq/analytics/widgets.js` library. (NPR-38433)
* Enable JavaScript ES6 (ESMAScript6 mode or better) compilation support for the minification of the `/libs/cq/testandtarget/clientlibs/testandtarget/util.js` library. (NPR-38435)
* The more content there is in `/content/campaigns`, the longer the call to `targeteditor.html` (`/libs/cq/personalization/touch-ui/content/targeteditor.html`) takes when you open the Page Editor. (NPR-38663)

## Platform {#platform-6514}

* Unable to log on to Package Manager to deploy updates. (NPR-38646)
* In the assets tag picker user interface, tags appear in the order they were created. However, when there are many tags, viewing and managing the tags is difficult because they cannot be sorted. (CQ-4344279)
* Create a notification in the user interface when a user being impersonated by an administrator or anyone else using the **[!UICONTROL Impersonate as]** field. (CQ-4345288)
* In a Smart Collection, all assets were being shown when filtering using a saved search. (CQ-4345326)
* An incorrect selected assets count is shown for **[!UICONTROL Add to collection]** when **[!UICONTROL Select All]** is selected. (CQ-4345424)
* An exception message occurred when using the **[!UICONTROL Impersonate as]** field with a group or non-existent user. (CQ-4346098)

## [!DNL Sites] {#sites-6514}

* Unexpected path deletions occurred while upgrading Experience Manager from 6.5.12.0 to 6.5.13.0. (NPR-38532)

### Accessibility {#access-6514}

* In Experience Manager Sites, when you expand the **[!UICONTROL Switch display format and adjust display setting]** button, then select **[!UICONTROL List View]**, the **[!UICONTROL Drag and Drop]** button is missing an accessible name. (SITES-2863, NPR-38760)
* Screen reader must announce the accessible name such as `Show description for Archive` or `Show description for mini shopping cart`. However, the current accessible name is announced as `Info Circle button show description` for _all_ the tooltip information buttons. (SITES-3104)
* Improve undo for components that do not have inlineEditing or dropTarget feature in `cq:editConfig`. (NPR-38361)
<!-- version 2 of the description above * When out of the box components that don't have inlineEditing or dropTarget feature in the _cq_editConfig file (navigation, breadcrumb, embed) are deleted > undeleted (by way of Undo), all configurations are lost and empty placeholder reappears. Component must be reconfigured from scratch. (NPR-38361) -->
* The Style System drop-down may have been positioned at the top of the page instead of in-context of the component - for components that use `cq:editConfig` "afteredit: REFRESH_PAGE". (NPR-38384)
<!-- version 2 of description above* When selecting a style option on a component, the Styles box shifts to the upper left corner of the screen, rather than staying put below the style icon. Happens for components that have  cq:editConfig "afteredit: REFRESH_PAGE". (NPR-38384) -->
* Text component is misaligned when added to nested Layout Containers. (NPR-38193)
* An empty style tab was displayed when there was no Style System configuration for a component. The tab is now hidden when no configuration is present. (NPR-38218)
<!-- version 2 of description above * Style tab is blank on components without styles/policies. (NPR-38218) -->
* The property `useLegacyResponsiveBehaviour` works only when authenticated. (NPR-37996)
* Upgrading jquery-ui to latest version resulted in the breaking of the Editor. (SITES-5647)

### [!DNL Content Fragments] {#sites-contentfragments-6514}

* Content Fragments enumeration field validation issue the first time that the content fragment is loaded. (SITES-7140)
* Need to add Campaign personalization fields in the Rich Text Editor of the Content Fragments editor. (NPR-38526)
* When creating or editing a new content fragment in the Content Fragment editor, by way of the Dispatcher, the content fragment model is not saved. Furthermore, the Content Fragment editor is not closed, and an error is displayed in the browser log. (NPR-38691)
* Persistent query validation error. (NPR-38523)
* In the Content Fragment dialog box, under **[!UICONTROL Properties]**, the **[!UICONTROL Content Fragment]** field does not retain the saved path in the selection pop-up. (NPR-38632)
* When you create a content fragment model and add an enumeration field of the drop-down type, the correct validation for _`is required`_ fails. (NPR-38237) 

### Core Components {#sites-corecomponents-6514}

* The new Page Email component should not force you into the classic user interface while editing `/etc`. (NPR-38648)

### Page Editor {#sites-pageeditor-6514}

* The user is not able to resize the component to the desired number of columns. (NPR-38688)

### Template Editor {#sites-templateeditor-6514}

* Missing **[!UICONTROL Delete]** and **[!UICONTROL Cut]** buttons on the Menu bar in an editable template after a `cq:actions` property was customized. (NPR-38521)
* If a component includes another component, it is not possible to delete the component within the template structure because the **[!UICONTROL Delete]** button is missing from the Menu bar. (NPR-38585)

## Sling {#sling-6514}

* An increase in the number of open files on production was experienced due to a memory leak in module `DiscoveryLiteDescriptor` in `org.apache.sling.discovery.commons`, version 1.0.20. (NPR-38288)
* In Experience Manager, from **[!UICONTROL Operations]** > **[!UICONTROL Diagnosis]**, you experience an error when you select **[!UICONTROL Download Status ZIP]** > **[!UICONTROL Download]**. (NPR-38514)

## Translation projects {#translation-6514}

* Launch for subpages that were added as a reference in a parent page were not getting promoted when the `isDeep` property was set to `false`. (NPR-38531)

## User interface {#ui-6514}

* When using **[!UICONTROL Select All]** > **[!UICONTROL Quick Publish]**, Experience Manager was not publishing all the assets or showing how many assets would be published in **[!UICONTROL Card]** view or **[!UICONTROL List]** view. (NPR-38546)
* Incorrect selected assets count is shown for **[!UICONTROL Add to collection]** in **[!UICONTROL Select All]** case. (NPR-38633)
* Disabled users can still be added to Collections and Projects. (NPR-38651)
* Deleting a filter without saving the Search Form creates an error. (NPR-38698)
* A user's session cannot obtain a `ModifiableValueMap` instance for the groups in order to establish the direct group membership. (NPR-38710)

## Workflow {#workflow-6514}

* Enable JavaScript ES6 (ESMAScript6 mode or better) compilation support for the minification of the `/libs/cq/inbox/gui/components/inbox/clientlibs/commons.js` library. (NPR-38304)
* After the workflow runs and the process steps are complete, the same comment is repeated multiple times. (NPR-38364)

## Install [!DNL Experience Manager] 6.5.14.0 {#install}

<!-- Remaining content from here to bottom stays the same except for version updating as needed as per update team feedback. -->

* [!DNL Experience Manager] 6.5.14.0 requires [!DNL Experience Manager] 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions. <!-- UPDATE FOR EACH NEW RELEASE -->
* The service pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html).
* On a deployment with MongoDB and multiple instances, install [!DNL Experience Manager] 6.5.14.0 on one of the Author instances using the Package Manager.<!-- UPDATE FOR EACH NEW RELEASE -->

>[!NOTE]
>
>Adobe does not recommend removing or uninstalling the [!DNL Experience Manager] 6.5.14.0 package. <!-- UPDATE FOR EACH NEW RELEASE -->

### Install the service pack on [!DNL Experience Manager] 6.5 {#install-service-pack}

1. Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the service pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.14.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->

1. Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package, then select **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>Dialog on Package Manager UI sometimes exits during the installation of the service pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installations is successful. Typically, this issue occurs in [!DNL Safari] browser but can intermittently occur on any browser.

**Automatic installation**

There are two different methods that you can use to automatically install [!DNL Experience Manager] 6.5.14.0.<!-- UPDATE FOR EACH NEW RELEASE -->

* Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.
* Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Experience Manager 6.5.14.0 does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->

**Validate the installation**

To know the platforms that are certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.14.0)` under [!UICONTROL Installed Products]. <!-- UPDATE FOR EACH NEW RELEASE -->

1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.12 or later (Use Web Console: `/system/console/bundles`). <!-- NPR-38747 -->


### Install [!DNL Experience Manager] Forms add-on package {#install-aem-forms-add-on-package}

>[!NOTE]
>
>Skip if you are not using [!DNL Experience Manager] Forms. Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package a week after the scheduled [!DNL Experience Manager] Service Pack release.

1. Ensure that you have installed the [!DNL Experience Manager] Service Pack.
1. Download the corresponding Forms add-on package listed at [AEM Forms releases](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html#forms-updates) for your operating system.
1. Install the Forms add-on package as described in [Installing AEM Forms add-on packages](/help/forms/using/installing-configuring-aem-forms-osgi.md#install-aem-forms-add-on-package).
1. If you use letters in Experience Manager 6.5 Forms, install the [latest AEMFD Compatibility package](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html#forms-updates).

### Install [!DNL Experience Manager] Forms on JEE {#install-aem-forms-jee-installer}

>[!NOTE]
>
>Skip if you are not using AEM Forms on JEE. Fixes in [!DNL Experience Manager] Forms on JEE are delivered through a separate installer.

For information about installing the cumulative installer for [!DNL Experience Manager] Forms on JEE and post-deployment configuration, see the [release notes](jee-patch-installer-65.md).

>[!NOTE]
>
>After installing the cumulative installer for [!DNL Experience Manager] Forms on JEE, install the latest Forms add-on package, delete the Forms add-on package from the `crx-repository\install` folder, and restart the server.

### UberJar {#uber-jar}

The UberJar for [!DNL Experience Manager] 6.5.13.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.13/). <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

>[!NOTE]
>
>In Experience Manager 6.5.14.0, be aware that the UberJar version (6.5.13.0) remains the same as the previous release.

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM: <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

```shell
<dependency>
     <groupId>com.adobe.aem</groupId>
     <artifactId>uber-jar</artifactId>
     <version>6.5.13</version>
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
| Integrations | The **[!UICONTROL AEM Cloud Services Opt-In]** screen is deprecated since the [!DNL Experience Manager] and [!DNL Adobe Target] integration is updated in [!DNL Experience Manager] 6.5. The integration supports the Adobe Target Standard API. The API uses authentication by way of Adobe IMS and [!DNL Adobe I/O Runtime]. It supports the growing role of Adobe Launch to instrument [!DNL Experience Manager] pages for analytics and personalization, the opt-in wizard is functionally irrelevant. | Configure system connections, Adobe IMS authentication, and [!DNL Adobe I/O Runtime] integrations via the respective [!DNL Experience Manager] cloud services. |
| Connectors | The Adobe JCR Connector for Microsoft® SharePoint 2010 and Microsoft® SharePoint 2013 is deprecated for [!DNL Experience Manager] 6.5. | N/A |

## Known issues {#known-issues} 

<!-- THESE KNOWN ISSUES CARRY OVER EACH RELEASE. THE "PRODUCT UPDATES TEAM" IS SUPPOSED TO VERIFY EACH ISSUE AND LET YOU KNOW IF ANYTHING NEEDS TO BE ADDED, DELETED, OR CHANGED IN THE LIST.
 -->

* [AEM Content Fragment with GraphQL Index Package 1.0.3](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Fadobe%2Fpackages%2Fcq650%2Ffeaturepack%2Fcfm-graphql-index-def-1.0.3.zip)

* As [!DNL Microsoft® Windows Server 2019] does not support [!DNL MySQL 5.7] and [!DNL JBoss® EAP 7.1], [!DNL Microsoft® Windows Server 2019] does not support turnkey installations for [!DNL AEM Forms 6.5.10.0].

* If you are upgrading your [!DNL Experience Manager] instance from 6.5 to 6.5.10.0 version, you can view `RRD4JReporter` exceptions in the `error.log` file. To resolve the issue, restart the instance.

* If you install [!DNL Experience Manager] 6.5 Service Pack 10 or a previous service pack on [!DNL Experience Manager] 6.5, the runtime copy of your assets custom workflow model (created in `/var/workflow/models/dam`) is deleted.
To retrieve your runtime copy, Adobe recommends to synchronize the design-time copy of the custom workflow model with its runtime copy using the HTTP API:
`<designModelPath>/jcr:content.generate.json`.

* Users can rename a folder in a hierarchy in [!DNL Assets] and publish a nested folder to [!DNL Brand Portal]. However, the title of the folder is not updated in [!DNL Brand Portal] until the root folder is republished.

* When a user selects to configure a field for the first time in an adaptive form, the option to save a configuration does not display in Properties Browser. Selecting to configure some other field of the adaptive form in the same editor resolves the issue.

* The following errors and warning messages may display during installation of [!DNL Experience Manager] 6.5.x.x:
  * "When the Adobe Target integration is configured in [!DNL Experience Manager] using the Target Standard API (IMS authentication), then exporting Experience Fragments to Target results in wrong offer types getting created. Instead of type "Experience Fragment"/source "Adobe Experience Manager," Target creates several offers with type "HTML"/source "Adobe Target Classic."
  * `com.adobe.granite.maintenance.impl.TaskScheduler`: No maintenance windows found at granite/operations/maintenance.
  * Adaptive Form server-side validation fails when aggregate functions such as SUM, MAX, and MIN are used (CQ-4274424).
  * `com.adobe.granite.maintenance.impl.TaskScheduler` - No maintenance windows found at granite/operations/maintenance.
  * Hotspot in a Dynamic Media interactive image is not visible when previewing the asset through Shoppable Banner viewer.
  * `com.adobe.cq.social.cq-social-jcr-provider bundle com.adobe.cq.social.cq-social-jcr-provider:1.3.5 (395)[com.adobe.cq.social.provider.jcr.impl.SpiSocialJcrResourceProviderImpl(2302)]` : Timeout waiting for register change to complete unregistered.

* When trying to move/delete/publish either Content Fragments or Sites/Pages, there is an issue when Content Fragment references are fetched, as the background query fails; i.e. the functionality does not work.
  To ensure correct operation, you must add the following properties to the index definition node `/oak:index/damAssetLucene` (no reindexing is required):

   ```xml
   "tags": [
       "visualSimilaritySearch"
     ]
   "refresh": true
   ```

## OSGi bundles and content packages included {#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in [!DNL Experience Manager] 6.5.14.0: <!-- UPDATE FOR EACH NEW RELEASE -->

* [List of OSGi bundles included in Experience Manager 6.5.14.0](/help/release-notes/assets/65140_bundles.txt) <!-- UPDATE FOR EACH NEW RELEASE -->
* [List of Content Packages included in Experience Manager 6.5.14.0](/help/release-notes/assets/65140_packages.txt) <!-- UPDATE FOR EACH NEW RELEASE -->

## Restricted websites {#restricted-sites}

These websites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact Adobe Customer Support](https://experienceleague.adobe.com/docs/customer-one/using/home.html).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] product page](https://business.adobe.com/products/experience-manager/adobe-experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/docs/experience-manager-65.html)
>* [Subscribe to Adobe priority product updates](https://www.adobe.com/subscription/priority-product-update.html)

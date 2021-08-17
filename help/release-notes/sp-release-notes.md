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
* Should ticket numbers be mentioned in enhancements? 
* Should these enhancements be mentioned in the new features article?
* Adjust the sequence of each list item using this order as a guide: Foundation, Sites, Assets, Forms, Commerce, and Screens.
-->

* Experience Manager Sites introduces a self-managed user interface to configure custom `GraphQL` endpoints for their external tenants (SITES-1753).

* Additional validation in `Content Fragrament` editor to ensure uniqueness of a `Content Fragment` within the same `Content Fragment` model (SITES-1730).

* Ability to manage publication for `Models`. When selecting a `Model` and publishing it, a popup displays the list of all the referenced `Models` to be published (SITES-1496).

* [!DNL Experience Manager] extends the Connected Assets functionality to the use of [!DNL Dynamic Media] images in the applicable core components. See [use Connected Assets](/help/assets/use-assets-across-connected-assets-instances.md).

* When users download assets shared as a link (link share feature), the users can choose to download the original assets, its renditions, or both.

* A new [!DNL Camera Raw] package is available that supports [!DNL Adobe Camera Raw] v10.4. See [process images using [!DNL Camera Raw]](/help/assets/camera-raw.md).

For a list of all features and enhancements introduced in [!DNL Experience Manager] 6.5.10.0, see [what is new in [!DNL Adobe Experience Manager] 6.5 Service Pack 10](new-features-latest-service-pack.md).

The following is the list of fixes provided in [!DNL Experience Manager] 6.5.10.0 release.

### [!DNL Sites] {#sites-65100}

* When opening an existing page (Page v3 component version), the page Properties dialog does not opens and a `NullPointerException` is logged (SITES-1830).
* Adding indexes on unwanted elements and variations in `ContentFragmentReferenceResolver` introduces some new queries. It impacts performance of Experience Manager server (SITES-1822).
* The system does not accepts a valid `Content Fragement` defined in `Allowed Content Fragment Models` as a `Default Value` if the selected content fragment is not the first one in the list of allowed models. Experience Manager displays the following error message (SITES-1805).
  
  ```This fragment is not of type <model-path>```

* When creating a new `Content Fragment` in `Content Fragment` editor, the user is able to create `Content Fragment` for a disabled model (SITES-1723).

* `RTE Link` plugin currently allows to select `Content Fragments` along with all other types of assets (SITES-1537).

* When creating a new Content Fragment using the inline wizard, the `Allowed Content Fragment Models` are not visible in the select model list (SITES-1522).

* When a `Model` type is selected on the `Model Editor` page, `Edit Content Fragement` button appears on the `Fragment Reference Properties` sheet (SITES-1485).

* When adding a reference to the `Fragment Reference` field in `Content Fragment Model Editor`, only the models that are `enabled` are allowed. If the parent model is in `draft` state, it is not allowed to refer it to other `draft` models (SITES-1477).

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

* [!DNL Assets] generates an out of memory exception when you attempt to create subassets for compound assets, such as a PowerPoint presentation (NPR-36668).

* When users move an asset that is already used in a published sites page, then the sites page is published again even if the option to publish is not selected (NPR-36636, CQ-4323500).

* When using the Apache Tika MIME type detection feature, the assets uploaded using the `AssetManager.createAsset` method leave a temporary file named `apache-tika-*.tmp` file in the temporary directory. This temporary file uses all the available free disk space (NPR-36545).

* All DRM-protected assets are downloaded and user selection to download specific asset is not followed (CQ-4327422).

### [!DNL Dynamic Media] {#dynamic-media-65100}

[!DNL Adobe Experience Manager] 6.5.10.0 [!DNL Assets] provides the following bug fixes in [!DNL Dynamic Media].

<<<<<<< Updated upstream
<!--  TBD: Need to copyedit the DM a11y enh.

* The following accessibility enhancements are made in Dynamic Media Viewers:

  * VERIFY E2E : [Screen Readers- AEM Dynamic Media-Delivery-Generate copy URL/embed code for assets]: Screen readers(NVDA, JAWS, Narrator) do not announce Search/Add Email Address combobox as required in Link Sharing dialog (CQ-4327761).
  * [Forms and Validations-AEM Dynamic Media-Tools-Assets-Viewer Presets-Create-Zoom]: Screen readers (NVDA/JAWS/Narrator) Useless element mentioned in aria-labelledby attr of Selected Type dropdown element (CQ-4325677).
  * AEM Dynamic Media-Tools-Assets-Viewer Presets : Focus is not moving to Asset Picker Dialog box (CQ-4324736).
  * NumberInput should support labelledBy with decrement button announced by ScreenReader (CQ-4323900).
  * [Screen Readers- AEM Dynamic Media-Delivery-Generate copy URL/embed code for assets]: Screen readers(NVDA, JAWS, Narrator) do not announce Search/Add Email Address combobox as required in Link Sharing dialog (CQ-4323352).
  * Keyboard shortcuts to prev/next asset block access to primary toolbar (CQ-4322037).
  * [Screen Readers-AEM Dynamic Media-Create Image profile]: NVDA/JAWS/Narrator is not narrating the newly added Â‘EditÂ’ field information after selecting the Â‘Add cropÂ’ button present under the 'Responsive image cropÂ’ header. (CQ-4290734).
  * [Screen readers- AEM Dynamic Media -Assets-Image Presets-Create (Basic)]: 'H1' heading level is not implemented for the 'Image Preset Editor' page. (CQ-4290730).
  * [Screen Readers-AEM Dynamic Media-Tools-Assets-Viewer Presets-Create-Zoom]: Screen readers (NVDA/JAWS/Narrator) are not identifying the 'Multiple Landmarks' while navigating using landmark/Region shortcut keys D/R. (CQ-4290729).
  * [Screen Readers-AEM Dynamic Media-Tools-Assets-Viewer Presets-Create-Video]: Screen readers are not narrating the name for the share button in the video frame, while navigating using down arrow key. (CQ-4290728).
  * [Screen Readers-AEM Dynamic Media-Tools-Assets-Viewer Presets-Create-Zoom]: Screen readers (NVDA/JAWS/Narrator) are not narrating name for the  buttons present in 'Sprite Tab' and 'Background Tab'. (CQ-4290727).
  * [Visual Requirements-AEM Dynamic Media-Tools-Assets-Video properties-Edit-Basic]: Visual asterisk(*) symbol is not provided for mandatory 'width' edit field in the 'Basic' tab section. (CQ-4290725).
  * [Screen Readers-AEM Dynamic Media-Tools-Assets-Image profiles]: Screen readers are not narrating the label mapped information for the check boxes present in the table. (CQ-4290723).
  * [Keyboard Navigation-AEM Dynamic Media-Tools-Assets-Viewer Presets-Create-Zoom]: Alternate mechanism or Bypass blocks are not provided for the expanded 'CSS Editor', While navigating using Keyboard Tab key. (CQ-4290720).
  * [Forms and validations-AEM Dynamic Media-Assets-Image Presets-Create(Basic)]:While navigating in Screen readers Form mode (F) respective labels are not mapped with Edit fields & buttons present under Â‘BasicsÂ’ tab in Image Preset editor page. (CQ-4290717).
  * [Screen Readers-AEM Dynamic Media-Image Set Editor]: Screen readers are not recognizing  multiple landmarks in the 'Image Set Editor' page, when navigated using landmark/region (D/R) shortcuts. (CQ-4290710).
  * [Screen Readers-AEM Dynamic Media-Assets-Renditions]: Screen readers(NVDA, JAWS, Narrator) is not narrating the role(button) and state(selected/Unselected) for the interactive buttons present in the left navigation bar. (CQ-4290709).
  * [Screen Readers-AEM Dynamic Media-Create Interactive Video]: Screen readers are not narrating the state and narrating incorrect role for the images present in the 'Content' tab, when navigated in down arrow key. (CQ-4290707).
  * [Screen Readers-AEM Dynamic Media-Create Interactive Video]: Screen readers are not narrating the name, role and state for the segments present in the 'Video Timeline scale', when navigated in down arrow key. (CQ-4290706).
  * [Screen readers- AEM Dynamic Media -Assets-Publish]: Screen readers (NVDA/JAWS/Narrator) are not narrating the name, role & default check boxes state (Selected/unselected) in Â‘All AssetsÂ’ & Â‘All CollectionsÂ’ tables when navigating using table shortcut key (CQ-4290705).
  * [Screen Readers-AEM Dynamic Media-Create Interactive Video]: Screen readers are not narrating the state(collapsed/expanded) and the property(menu sub menu), when navigated to 'Shoppable video Dark' menu button in down arrow key. (CQ-4290704).
  * [Screen Readers-AEM Dynamic Media-Create Interactive Video]: Screen readers are not recognizing multiple landmarks in the page, when navigated using landmark/region (D/R) shortcuts. (CQ-4290702).
  * [Screen Readers-AEM Dynamic Media-Create Interactive Video]: Screen readers are not recognizing any headings in the page, when navigating using heading shortcut(H). (CQ-4290701).
  * [Forms & Validations-AEM Dynamic Media-Create Interactive Video]: There is no error message getting displayed after uploading an unsupported video format (i.e. other than MP4). (CQ-4290700).
  * [Visual Requirement-AEM Dynamic Media-Create Interactive Video]: The color contrast for the numbers(Seconds) present in the timeline scale fails to meet the minimum required luminosity ratio of 4.5:1. (CQ-4290699).
  * [Screen Readers-AEM Dynamic Media-Create Interactive Video]: There is no visual label provided for the 'Product Name' edit field and screen readers are also not narrating any label when navigated using down arrow/ form mode(F). (CQ-4290697).
-->

=======
>>>>>>> Stashed changes
* Uploaded videos to [!DNL Experience Manager] display `Process failed` after `dynamicmedia_scene7` runmode is enabled and sync is disabled (CQ-4327791).

[!DNL Adobe Experience Manager] 6.5.10.0 [!DNL Assets] provides the following accessibility enhancements in [!DNL Dynamic Media].

* Screen reader now announces the placeholder text to search and add Email address as a required field on share assets as a link dialog, and also announces the [!UICONTROL Please fill out this field] tooltip (CQ-4327761).

* ().

### Platform {#platform-65100}

* TBD

### Integrations {#integrations-65100}

* TBD

### Projects {#projects-65100}

* TBD

### Screens {#screens-65100}

* TBD

### Commerce {#commerce-65100}

* TBD

### Translation projects {#translation-65100}

* TBD

### Workflow {#workflow-65100}

* TBD

### [!DNL Communities] {#communities-65100}

* Community site pages are opening in `LoggedIn` state for anonymous guest users (NPR-36908). 

* When there are more than one page in the **[!UICONTROL Community]** > **[!UICONTROL Ideas]** > **[!UICONTROL Comments]** page, the page navigation does not work (NPR-36541). 

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
>* You can now develop and operate applications with [!DNL Azul Zulu] builds of [!DNL OpenJDK] for [!DNL Experience Manager Forms] on OSGi deployments.

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

### Install Adobe Experience Manager Forms add-on package {#install-aem-forms-add-on-package}

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
>After installing the cumulative installer for Experience Manager Forms on JEE, install the latest Forms add-on package, delete the Forms add-on package from the `crx-repository\install` folder, and restart the server.

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

* If you are upgrading your [!DNL Experience Manager] instance from 6.5 to 6.5.10.0 version, you can view `RRD4JReporter` exceptions in the `error.log` file. Restart the instance to resolve the issue.

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

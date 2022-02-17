---
title: Release Notes for [!DNL Adobe Experience Manager] 6.5
description: [!DNL Adobe Experience Manager] 6.5 notes outlining the release information, what's new, how to install, and detailed change lists.
exl-id: 0288aa12-8d9d-4cec-9a91-7a4194dd280a
---
# [!DNL Adobe Experience Manager] 6.5 Latest Service Pack Release Notes {#aem-service-pack-release-notes}

## Release information {#release-information}

| Products | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.12.0                      |
| Type     | Service Pack Release         |
| Date     | February 24, 2022               |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.11.zip) |

## What is included in [!DNL Adobe Experience Manager] 6.5.12.0 {#what-is-included-in-aem}

[!DNL Adobe Experience Manager] 6.5.12.0 includes new features, key customer-requested enhancements, and performance, stability, and security improvements, that are released since the availability of 6.5 release in April 2019. The service pack is installed on [!DNL Adobe Experience Manager] 6.5.

The key features and enhancements introduced in [!DNL Adobe Experience Manager] 6.5.12.0 are:

* After configuring a connection between remote DAM and Sites deployments, the assets on remote DAM are made available on the Sites deployment. You can now perform the [update, delete, rename, and move](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/assets/admin/use-assets-across-connected-assets-instances.html) operations on the remote DAM assets or folders. The updates, with some delay, are available automatically on the Sites deployment (NPR-37816).

* [Campaign-Targeting] ES6 compilation support is available for the client library (NPR-37908).
* [!DNL Experience Manager Sites] admin user interface now allows 1:many push rollouts from a live copy source by default, regardless of whether a blueprint configuration exists (CQ-4259951).
* The status of currently in-progress async operation is now made visible to users so that they do not simultaneously trigger multiple async operations on same path (NPR-37611).
* Support for IMS-based authentication is provided for Analytics 2.0 (CQ-4285474, NPR-37803, NPR-37701, NPR-37702, NPR-37703).
* API support for json offer type experience fragment is provided (NPR-37796).
* Offer request is provided for Delete offer (Experience Fragment API) in IMS (NPR-37668).

The following is the list of fixes provided in [!DNL Experience Manager] 6.5.12.0 release.

### [!DNL Sites] {#sites-65120}

The following issues are fixed in [!DNL Sites]:

* Layout of the content fragment Properties is broken as Basic and Advance tabs have no margins to the left (SITES-4484).
* Option to close banner on content fragments, that are referenced on various sites pages, is not working. This banner informs the users that the content fragment is referenced on one or more pages (SITES-4173).
* The checkboxes are not aligned in Revert Inheritance dialog box (SITES-3514).
* The template page on we-retail and wknd sites is broken, as components don't load and structure option is not available, as pageinfo.json servlet is stuck on LaunchManagerImpl.getLaunchStream (SITES-3489).
* User node publishing from Author to Publish environment is not working (NPR-38005).
* Attempt to create an experience fragment using an edited template doesn’t show the edits made to the initial page properties (NPR-37962).
* The page move operation on Experience Manager is slow (NPR-37961).
* Experience fragment translation does not update references to language copy paths (NPR-37953).
* Users without replication permissions are not able to delete or move pages, even if the pages are not activated (NPR-37936).
* Random org.apache.felix.metatype errors are observed on server (NPR-37935).
* References in Sites admin touch user interface are not displaying incoming links correctly (NPR-37934).
* Launch path to add new pages or assets is not available when selecting pages in a translation job (NPR-37912).
* Reference pages in a list component added in experience fragments are not updated to destination page when promoting the launch (NPR-37886).
* Author environment has user interface issues—such as Edit mode page title is not centered and allowed components selector on policy editor: group checkbox takes entire width of the container, so the label is rendered in the next line (NPR-37878).
* [Platform] The version number of xmlns:metatype in metatype.xml file of commons-httpclient is "http://www.osgi.org/xmlns/metatype/v1.0.0" instead of "http://www.osgi.org/xmlns/metatype/v1.2.0" (NPR-37865).  
* Errors are observed and pages fail to move when trying to a page (NPR-37864).
* [Rich Text Editor] Image does not render in the classic user interface when adding the image as a list item in Rich Text Editor (NPR-37835).
* Authors are able to apply tags that are outside of the configured root path when using tag field in a dialog(NPR-37834).
* Multifield does not render correctly in layout container and gives error (NPR-37811).
* Attempt to resize component layout in page editor doesn’t work in mobile layout (NPR-37805).
* Experience Fragment translation does not update cyclic references to language copy paths (NPR-37745).
* Use of cq-msm-lockable rich text field in page properties does not disable the field on rolling out the page and it can be modified by the authors (NPR-37714).
* On activating an experience fragment, publisher sends many activation requests to Dispatcher (NPR-37707).
* On topology change, the Sling job for asset processing gets reset resulting in the jobs that are in progress at the time of topology change getting ignored (NPR-37706).
* Quotation marks, cross, and dash are not exported to CSV when users of MacOS export sites and assets URLs (NPR-37698).
* Layout container in SPA page template is not able to register the custom CSS classes defined in the Template Policy when running react SPA pages (NPR-37697).
* Background image is not visible when user selects targeting on an experience fragment that has background in the container (NPR-37662).
* Translation job on an experience fragment is not translating all the components on that experience fragment (NPR-37660).
* Translation of experience fragments and the page containing the experience fragment does not update the launch path in the experience fragment link (NPR-37659).
* File Upload widget does not show the file name, when a file is uploaded, and dialog is saved (NPR-37634).
* The scheduled activation (publishing) of asset does not trigger on the scheduled time if the folder containing that asset is moved (NPR-37621).
* [Platform] External link checker dashboard fails to render results in [!DNL Adobe Experience Manager] WCM (NPR-37614).
* Content fragment editor does not work correctly when capital case letters are used in tag names when editing tags in the editor (NPR-37601).
* Classic user interface editor doesn't show mark up as in compare view of touch user interface (NPR-37588).
* Intermittent 500 error is logged on adding an experience fragment to translation jobs (NPR-37587).
* Authors are able to select and use date picker date even on disabled date picker (NPR-37583).
* [Foundation] Authors are not able to enter some decimal values in number field resource type in a component dialog structure for touch user interface (NPR-37059).
* The paths in libs folder get deleted on installing previous service packs (NPR-36815).
* [Commerce] The deactivation of a root folder doesn’t change deactivation status of child products in [!DNL Experience Manager Commerce] console; moreover the count of children folders of a root folder at the time of deactivation is incorrectly displayed in the user interface (CQ-4338261).
* [Localization Workflow] The content for column customization and branding customization is not localized in Admin Control dialog―on selecting icon under profile icon in [!DNL Adobe Experience Manager] inbox (CQ-4334864).
* [Communities] The content inside the table for group members is not clickable (CQ-4334404).
* [Oak] The Cold-Standby sync process is not working and is logging error (CQ-4333868).
* [Platform Foundation UI] [!DNL Experience Manager] start page appears again when user selects the [!DNL Adobe Experience Manager] icon already being on the start page (CQ-4317409).

### [!DNL Assets] {#assets-65120}

<!--
The following accessibility enhancements are available in [!DNL Assets]:

* enhancement 1
-->

The following issues are fixed in [!DNL Assets]:

* When adding an asset or folder (containing `single quote` in the name) in Connected Assets, the reference path fails and results as an exception (NPR-37712).
* When adding watermark to an asset, the watermark is always displayed in black color irrespective of the color defined by the user (NPR-37720).
* When using Connected Assets, a non-admin user is able to search for an asset even when the non-admin users are restricted to access the DAM repository (NPR-37644).
* When creating a Catalog, the `Catalog` button under the `Create` dropdown does not work (NPR-37589).
* When updating asset metadata using bulk edit, the changes applied to the dropdown fields are not saved and reset to the default values (NPR-37345).
* Deleting a folder in taking too long which impacts the overall performance (NPR-37107).
* When applying rules in metadata schema, the user is not able to view the complete value for the dropdown `Field Value` and `Field Choices` if the value is larger than the text box (CQ-4338074).
* After upgrading to version 6.5.10.0, the asset properties page reflects an unnecessary HTML rendering message (CQ-4336994).
* After upgrading to version 6.5.12.0, the review workflow fails to load the approved or rejected assets as a printable PDF (CQ-4336842).
* Sorting the assets in `List View` does not work effectively (CQ-4335298).
* When sharing assets using share link, the assets are downloaded in separate folders (CQ-4335000).
* When verifying the [!DNL Experience Manager] `Inbox` settings, the `Share` and `Out of office` tabs reflect untranslated content (CQ-4334858).

* The following fixes are related to cascading metadata in asset properties.
  * A mandatory dropdown reflects multiple error messages for each selection in the multivalue field (NPR-37859).
  * Only the last selection of the parent field is saved for the dependent uneditable field (NPR-37858).
  * The dependent dropdown (multivalue field) reflects the default value intermittently for the selected parent dropdown (NPR-37791).


### [!DNL Dynamic Media] {#dynamic-media-65120}

The following issues are fixed in [!DNL Dynamic Media]:

* The assets of a folder containing `renditions` in the folder name are not synced in `Dynamic Media` (CQ-4338428).
* When creating an image preset in `tiff` format, the preset is created but the format changes to `jpeg` (CQ-4335985).
* When modifying the `Progressive JPEG Scan` value, the dropdown value always resets to `auto`(CQ-4335971).
* The video metadata is not generated for the `mxf` videos in the asset properties (CQ-4335499).
* When reprocessing the assets, the AVS (audio and video) and transcode assets are unpublished from the target server (CQ-4335461).
* The PDF thumbnails generated are different from the first page of the actual PDF. Some parts of the image are missing in the thumbnail (CQ-4315554).
* CDN invalidation fails with a bad URL response if the `companyName` and `companyRoot` are different (CQ-4339896).

### Workflows {#workflows-65120}

* Scrolling does not work as expected if you apply filter on Inbox items (CQ-4333594).

<!--

### [!DNL Forms] {#forms-65110}


>[!NOTE]
>
>* [!DNL Experience Manager Forms] releases the add-on packages one week after the scheduled [!DNL Experience Manager] Service Pack release date.

**Adaptive Forms**

* Accessibility – When you set the `Wizard` layout for a panel in an adaptive form, the navigation buttons do not have Aria labels and role (NPR-37613).

* Validations on a date field in an adaptive form does not work, as expected (NPR-37556).

* When the label text for the Checkbox and Radio Button components is long, the text does not fit appropriately (NPR-37294).

* When you apply styling changes to the Thank You message of the AEM Forms Container component, the changes do not replicate in the source adaptive form (NPR-37284).

* Differences in the value of the `Switch` component on the user interface and in the backend (NPR-37268).

* When you use the keyboard keys to navigate to the `Submit` option and press the `Enter` key, you can submit the adaptive form multiple times (CQ-4333993).

* The Remove operation for the File Attachment component does not work, as expected (NPR-37376).

* When a label for a field exceeds 1000 characters in an adaptive form that translates to various languages, the dictionary fails to retrieve the translation of the label (CQ-4329290).

**Document Services**

* An error displays while using the Assembler service (NPR-37606):

  ```TXT
    500 Internal Server Error
  ```

* When the document attachments are passed to the Assembler service, the following exception displays (NPR-37582):

  ```TXT
    com.adobe.livecycle.assembler.client.ProcessingException: ⁪: Failed to execute the DDX
  ```

* Missing closing parenthesis from data after converting a PDF document to a PDF-A/1B PDF document (NPR-37608).

**HTML5 Forms**

* When you install AEM 6.5.10.0, the HTML preview for an XDP form does not work (NPR-37503, CQ-4331926).

* Text overlapping issues while migrating the PDF forms to HTML 5 forms in various languages (NPR-37173).

**Letters**

* When you submit a letter and reopen it in HTML view, the position of text document fragments does not remain the same (NPR-37307).

**Forms Workflow**

* In case of embedded container workflow, you get multiple workflow completion emails even after selecting the `Notify on Complete of Container Workflow` option (NPR-37280).

**Foundation JEE**

* After installing AEM 6.5 Forms Service Pack 9, the CRX repository URLs are no longer available (NPR-37592).

**Issues fixed in AEM Forms 6.5.11.1**

>[!NOTE]
>
>If you have not upgraded to AEM 6.5.11.0 Forms, install the AEM Forms 6.5.11.1 add-on package directly. If you have installed AEM 6.5.11.0 Forms, Adobe recommends to upgrade to AEM 6.5.11.1 Forms.

* Submit actions, Send Email and Invoke an AEM Workflow stop working after installing the Forms 6.5.11.0 add-on package.
* CreatePDF operation stops converting Microsoft Word documents to PDF documents after installing the Forms 6.5.11.0 add-on package.
* (JEE Only) Critical security vulnerabilities (CVE-2021-44228 and CVE-2021-45046) reported for Apache Log4j2.
* (JEE only) Assembler DSC in 6.5.11.0 patch contains incorrect metainfo like specification version and impl version.

-->


For information on security updates, see [[!DNL Experience Manager] security bulletins page](https://helpx.adobe.com/security/products/experience-manager.html).

## Install 6.5.12.0 {#install}

**Setup requirements and more information**

* Experience Manager 6.5.12.0 requires Experience Manager 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions.
* The service pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html).
* On a deployment with MongoDB and multiple instances, install Experience Manager 6.5.12.0 on one of the Author instances using the Package Manager.

>[!NOTE]
>
>Adobe does not recommend removing or uninstalling the [!DNL Adobe Experience Manager] 6.5.12.0 package.

### Install the service pack {#install-service-pack}

To install the service pack on an [!DNL Adobe Experience Manager] 6.5 instance, follow these steps:

1. Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the service pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.11.zip).

1. Open Package Manager and click **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package and click **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>Dialog on Package Manager UI sometimes exits during the installation of the service pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installations is successful. Typically, this issue occurs in [!DNL Safari] browser but can intermittently occur on any browser.

**Automatic installation**

There are two ways to automatically install [!DNL Experience Manager] 6.5.12.0 on a working instance:

A. Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.

B. Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Adobe Experience Manager 6.5.12.0 does not support Bootstrap installation.

**Validate the installation**

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.12.0)` under [!UICONTROL Installed Products].

1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.3 or later (Use Web Console: `/system/console/bundles`).

To know the platforms certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

<!-- 

### Install Adobe Experience Manager Forms add-on package {#install-aem-forms-add-on-package}

>[!NOTE]
>
>Skip if you are not using Experience Manager Forms. Fixes in Experience Manager Forms are delivered through a separate add-on package a week after the scheduled [!DNL Experience Manager] Service Pack release.

1. Ensure that you have installed the Adobe Experience Manager Service Pack.
1. Download the corresponding Forms add-on package listed at [AEM Forms releases](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html#forms-updates) for your operating system.
1. Install the Forms add-on package as described in [Installing AEM Forms add-on packages](/help/forms/using/installing-configuring-aem-forms-osgi.md#install-aem-forms-add-on-package).

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

-->

### UberJar {#uber-jar}

The UberJar for Experience Manager 6.5.12.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.11/).

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM:

```shell
<dependency>
     <groupId>com.adobe.aem</groupId>
     <artifactId>uber-jar</artifactId>
     <version>6.5.12</version>
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
| Integrations | The **[!UICONTROL AEM Cloud Services Opt-In]** screen is deprecated since the [!DNL Experience Manager] and [!DNL Adobe Target] integration is updated in Experience Manager 6.5. The integration supports the Adobe Target Standard API. The API uses authentication via Adobe IMS and [!DNL Adobe I/O] and supports the growing role of Adobe Launch to instrument [!DNL Experience Manager] pages for analytics and personalization, the opt-in wizard is functionally irrelevant. | Configure system connections, Adobe IMS authentication, and [!DNL Adobe I/O] integrations via the respective [!DNL Experience Manager] cloud services. |
| Connectors | The Adobe JCR Connector for Microsoft® SharePoint 2010 and Microsoft® SharePoint 2013 is deprecated for Experience Manager 6.5. | N/A |

## Known issues {#known-issues}

* When you install AEM 6.5 Service Pack 11 and try to download the status ZIP file, Experience Manager downloads a corrupt file. Download and install [AEM Sites SEO Index Package](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/sites-seo-index-content-1.0.0.zip) on your AEM instance before downloading the ZIP file to resolve the issue.

* As [!DNL Microsoft Windows Server 2019] does not support [!DNL MySQL 5.7] and [!DNL JBoss EAP 7.1], [!DNL Microsoft Windows Server 2019] does not support turnkey installations for [!DNL AEM Forms 6.5.10.0].

* If you are upgrading your [!DNL Experience Manager] instance from 6.5 to 6.5.10.0 version, you can view `RRD4JReporter` exceptions in the `error.log` file. To resolve the issue, restart the instance.

* If you install [!DNL Experience Manager] 6.5 Service Pack 10 or a previous service pack on [!DNL Experience Manager] 6.5, the runtime copy of your assets custom workflow model (created in `/var/workflow/models/dam`) is deleted.
To retrieve your runtime copy, Adobe recommends to synchronize the design-time copy of the custom workflow model with its runtime copy using the HTTP API:
`<designModelPath>/jcr:content.generate.json`.

* Users can rename a folder in a hierarchy in [!DNL Assets] and publish a nested folder to [!DNL Brand Portal]. However, the title of the folder is not updated in [!DNL Brand Portal] until the root folder is republished.

* When a user selects to configure a field for the first time in an adaptive form, the option to save a configuration does not display in Properties Browser. Selecting to configure some other field of the adaptive form in the same editor resolves the issue.

* The following errors and warning messages may display during installation of Experience Manager 6.5.x.x:
  * “When the Adobe Target integration is configured in Experience Manager using the Target Standard API (IMS authentication), then exporting Experience Fragments to Target results in wrong offer types getting created. Instead of type “Experience Fragment”/source “Adobe Experience Manager,” Target creates several offers with type “HTML”/source “Adobe Target Classic.”
  * `com.adobe.granite.maintenance.impl.TaskScheduler`: No maintenance windows found at granite/operations/maintenance.
  * Adaptive Form server-side validation fails when aggregate functions such as SUM, MAX, and MIN are used (CQ-4274424).
  * `com.adobe.granite.maintenance.impl.TaskScheduler` - No maintenance windows found at granite/operations/maintenance.
  * Hotspot in a Dynamic Media interactive image is not visible when previewing the asset through Shoppable Banner viewer.
  * `com.adobe.cq.social.cq-social-jcr-provider bundle com.adobe.cq.social.cq-social-jcr-provider:1.3.5 (395)[com.adobe.cq.social.provider.jcr.impl.SpiSocialJcrResourceProviderImpl(2302)]` : Timeout waiting for reg change to complete unregistered.

* When trying to move/delete/publish either Content Fragments or Sites/Pages, there is an issue when Content Fragment references are fetched, as the background query fails; i.e. the functionality does not work. 
  To ensure correct operation, you need to add the following properties to the index definition node `/oak:index/damAssetLucene` (no re-indexing is required) :

   ```xml
   "tags": [
       "visualSimilaritySearch"
     ]
   "refresh": true
   ```

## OSGi bundles and content packages included {#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in [!DNL Experience Manager] 6.5.12.0:

* [List of OSGi bundles included in Experience Manager 6.5.12.0](assets/65110_bundles.txt)

* [List of Content Packages included in Experience Manager 6.5.12.0](assets/65110_packages.txt)

## Restricted websites {#restricted-sites}

These websites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* See [how to contact Adobe Customer Support](https://experienceleague.adobe.com/docs/customer-one/using/home.html).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] product page](https://business.adobe.com/products/experience-manager/adobe-experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/docs/experience-manager-65.html)
>* [Subscribe to Adobe priority product updates](https://www.adobe.com/subscription/priority-product-update.html)

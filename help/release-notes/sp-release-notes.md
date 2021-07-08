---
title: [!DNL Experience Manager] 6.5 service pack release notes
description: Release notes specific to [!DNL Adobe Experience Manager] 6.5 service pack 9
docset: aem65
mini-toc-levels: 1
exl-id: 28a5ed58-b024-4dde-a849-0b3edc7b8472
---
# [!DNL Adobe Experience Manager] 6.5 service pack release notes {#aem-service-pack-release-notes}

## Release information {#release-information}

| Products | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.9.0                      |
| Type     | Service Pack Release         |
| Date     | May 27, 2021                |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.9-1.0.zip) |

## What is included in [!DNL Adobe Experience Manager] 6.5.9.0 {#what-s-included-in-aem}

[!DNL Adobe Experience Manager] 6.5.9.0 includes new features, key customer-requested enhancements, and performance, stability, and security improvements, that are released since the availability of 6.5 release in April 2019. The service pack is installed on [!DNL Adobe Experience Manager] 6.5.

The key features and enhancements introduced in [!DNL Adobe Experience Manager] 6.5.9.0 are:

* [!DNL Experience Manager Sites] Dynamic Media Foundation component now lets you turn on or off optimization for higher resolution devices when using responsive Image Preset or Smart Crop.

* To improve performance, the `hidden=false` condition is moved from JCR query to [!UICONTROL QueryBuilder] evaluator. To verify that a hidden predicate is working after the change, [!DNL Experience Manager] checks that any hidden folder is not displayed.

* Ability to restore deleted pages and tree on an [!DNL Experience Manager Sites] page.

* Support for a new user to refresh the access token using a refresh token for mailer configuration service.

* [Support for SMTP XOAUTH2](/help/sites-administering/notification.md#setting-up-oauth) mechanism for the mail configuration service.

* Support for [!DNL MongoDB] versions 4.2 and 4.4.

* Occurrences of names related to Hong Kong, Macau, and Taiwan are updated as per the new naming conventions for Chinese locales and regions.

* Accessibility enhancements in [!DNL Experience Manager] [[!DNL Assets]](#assets-accessibility-6590) and [[!DNL Dynamic Media]](#accessibility-dm-6590).

* Smart Imaging DPR (Device Pixel Ratio) and network bandwidth optimization lets you deliver best quality images efficiently; on devices with high-resolution displays and constrained network bandwidth. For details and timeline, see [smart imaging FAQs](/help/assets/imaging-faq.md).

* [!DNL Dynamic Media] delivery (`fmt` URL modifier) supports the next-generation image format AVIF (AV1 Image format). For more details and timeline, see [image serving and rendering API fmt](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/http-protocol-reference/command-reference/r-is-http-fmt.html).

* Ability to send a notification email to a group using [!UICONTROL Assign Task] workflow step.

* Ability to retrieve an Interactive Communication draft after modifying the source Interactive Communication.

* Set custom domain name for loading, rendering, and validating the reCAPTCHA service in [!DNL Experience Manager Forms].

* Input data enhancements for [!UICONTROL Invoke Form Data Model Service] workflow step.

* Ability to use multiple master pages in a Document of Record template in [!DNL Experience Manager Forms].

* Support page breaks in Document of Record in [!DNL Experience Manager Forms].

* The built-in repository (Apache Jackrabbit Oak) is updated to 1.22.7.

For a complete list of features and enhancements introduced in [!DNL Experience Manager] 6.5.9.0, see [what is new in [!DNL Adobe Experience Manager] 6.5 Service Pack 9](new-features-latest-service-pack.md).

>[!NOTE]
>
>Starting with Service Pack 9, [!DNL Experience Manager] customers can develop and operate their [!DNL Experience Manager] applications with distributions of the [!DNL Azul Zulu] builds of OpenJDK, standards-compliant with Java™ SE.
>Support for the [!DNL Azul Zulu] JDKs is also provided by Adobe to the [!DNL Experience Manager] customers.
>You can download the relevant versions of the [!DNL Azul Zulu] JDKs from [Adobe Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html).
>The usage rights for the Oracle Java™ technology, as distributed by Adobe, will expire by the end of December 2022. [!DNL Experience Manager] customers are encouraged to plan and implement usage for the [!DNL Azul Zulu] JDKs latest by this date. For more information about the usage of the [!DNL Oracle Java™] technology and [!DNL Azul Zulu] technology, refer to the associated [FAQs](https://experienceleague.adobe.com/docs/experience-manager-65/assets/adobe-azul-openjdk-license-agreement.pdf).

The following is the list of fixes provided in [!DNL Experience Manager] 6.5.9.0 release.

### [!DNL Sites] {#sites-6590}

* Published pages with Authentication Requirement property enabled do not redirect to the login page and return 404 error message (NPR-36354).

* When creating a hyperlink, the option to search a link does not work in the text component (NPR-35849).

* A traversal query is triggered on using the `com.day.cq.wcm.commons.ReferenceSearch` API. It impacts performance of [!DNL Experience Manager] server (NPR-36407).

* Nested layout container inside another resized layout container shows an incorrect number of columns for its child components, resulting in these components not being aligned to the grid (NPR-36359).

* External Linkchecker displays valid external links as invalid links (NPR-36289).

* After displaying references for some time, the references panel starts showing an error message (NPR-36167).

* When moving a component, the automatically created parsys, does not have the `sling:resourceType` node (NPR-36165).

* When trying to sync a livecopy (while using roll-out configs [!UICONTROL Activate on Blueprint activation] and [!UICONTROL De-activate on Blueprint activation]) if a component is deleted in the livecopy master, the sync fails and a `NullPointerException` is logged (NPR-36127).

* When a user types in improvised text for tag (tag that does not exist on the system) and presses Enter, the tag appears under the field but when the Content Fragment is saved and reopened, the improvised tag disappears (NPR-36132).

* Inbox does not have option display the status of Asynchronous Operations (NPR-36104).

* A duplicate component is created after restoring inheritance (NPR-36000).

* When using the `RemoteContentRenderingService`, the request to the `RemoteContentRendererRequestHandler.getRequest` always includes the root page for the  `ComponentExporter`, but does not include the requested page if it is not included with the root model based on the traversal depth and filtering options set. The request must always include the requested page so that the SPA has enough information to render a response (NPR-35961).

* onTime/offTime items do not activate/deactivate on the expected onTime/offTime (NPR-35936).

* When you publish a page containing an Experience Fragment that has no `cq:lastModified` property, a `NullPointerException` occurs (NPR-35914).

* When trying to resize a component within a container, resizing back to the original size is not possible. When the component container size is reduced, it is not possible to set the size back to the original (NPR-35809).

* In the roll out dialog, either triggered in the editor or from the Live Copy Overview, the status icons for detached, suspended, or not created pages is wrong (NPR-35691).

* Multi-Site Manager rollout on-page properties of master ignore rollout page and subpages checkbox (NPR-35634).

* Restore tree functionality, available in the classic UI is missing from Touch UI (CQ-4315352, CQ-4309415).

* Issues while reverting inheritance and rolling out page on an [!DNL Experience Manager Sites] page (NPR-36033).

### [!DNL Assets] {#assets-6590}

The following user experience enhancements are done in [!DNL Assets]:

* To view assets not sorted based on any of the [!UICONTROL Create], [!UICONTROL Modify], or [!UICONTROL Name] parameters, [!DNL Adobe Experience Manager] offers a [!UICONTROL None] option within [!UICONTROL Sort by] options. The [!UICONTROL None] option ensures that the assets in the Assets user interface (in Card, Column, and Insights view) are in the same order as they exist in JCR node (NPR-36356).

* To make the email ID lowercase in ACP API response from [!DNL Adobe Experience Manager] an optional setting is introduced; as the [!DNL Adobe Asset Link] users could not check-in assets if their ID was not having all characters in lowercase. The [!DNL Adobe Asset Link] panel consumes the ACP API response from [!DNL Adobe Experience Manager] (CQ-4317704).

[!DNL Adobe Experience Manager] 6.5.9.0 [!DNL Assets] provides the following accessibility enhancements.

Contrast (with background) of the following text and icons is improved, so that the users with limited vision and perception of color can comprehend:
  
* Asset title on [!UICONTROL Properties] page (NPR-35967).
* Star rating icons in [!UICONTROL Rating] sections at various places (NPR-36009).
* Text on the asset and folder Card view (NPR-35966).
* Placeholder text on the [!UICONTROL Timeline] view (NPR-35965).
* Asset names on the asset search results (NPR-35964).
* Placeholder text on the [!UICONTROL Link Sharing] dialog (NPR-35963).
* [!UICONTROL Metadata], [!UICONTROL Status], and [!UICONTROL Other] text in [!UICONTROL List] option in the [!UICONTROL View Settings] dialog (NPR-35910).
* [!UICONTROL Location] and [!UICONTROL Type to search] placeholder texts in global search (NPR-35909).
* Expand and collapse icons under the [!UICONTROL Content Tree] (NPR-35908).
* The [!UICONTROL Assets] text on the page where assets folders are displayed (NPR-35905).
* Text in [!UICONTROL Asset Metadata], [!UICONTROL Usage Statistics] within [!UICONTROL Overview] option in asset details page (NPR-35904).
* Text for shortcut keys for [!UICONTROL properties] and [!UICONTROL edit] options in asset details page (NPR-35904).

[!DNL Adobe Experience Manager] 6.5.9.0 [!DNL Assets] fixes the following issues.

* The tags created from within a tag selection element in a [!UICONTROL Folder Metadata Schema] form are not saved (NPR-36119).

* When a small ellipse is used to annotate assets, the ellipse overlaps with the number of the annotation in the print version (NPR-36114).

* Sometime, in Column view, [!DNL Experience Manager] does not prompt for duplicate asset conflict when a duplicate asset is uploaded (NPR-36048).

* Share Link dialog does not close by clicking close button if it is opened and no changes are made (NPR-36030).

* When multiple assets are selected to update the properties, sometimes either an error occurs, or properties of a deselected asset get updated (NPR-36002).

* When on asset upload whitespaces are added in the beginning or end of asset file names, with remaining characters same as the name of an existing asset in the repository, the existing asset is replaced without logging any error (NPR-36001).

* When video is played in the asset details page, the play and pause options do not function (NPR-35999).

* When unpublishing assets in bulk, Brand Portal generates an error suggesting that the request URI is too long (NPR-35954).

* When an asset with long annotation text is printed, the annotation text is trimmed, even if space is available (NPR-35948).

* The option to move to Next page is disabled on selecting the page on select Templates view on Create Catalog page (CQ-4315462).

* When update asset workflow is started on the video asset, the page refreshes repeatedly (CQ-4313375).

* DAM folders cannot be deleted or moved, and an exception is logged (NPR-35942).

### [!DNL Dynamic Media] {#dynamic-media-6590}

[!DNL Adobe Experience Manager] 6.5.9.0 [!DNL Assets] provides the following accessibility enhancements in [!DNL Dynamic Media].

* When you open the dialog to add assets using keyboard keys in [!UICONTROL Image Set] editor:
  * Screen readers narrate that the dialog is opened.
  * Keyboard focus moves to the dialog when it opens.
  * Keyboard focus moves back to Add Asset option when the dialog is closed (CQ-4312134).

* You can now add and edit Hotspots on assets using keyboard keys in Hotspot editor (CQ-4305965).

* You can now put hyperlink on hotspot through Hotspot management using keyboard keys. The screen reader focus now moves to the field to edit URL Path and option to Open selection dialog (CQ-4290735).

* Contrast (with background) of text and controls on Image Set Editor page is improved, so that the users with limited vision and perception of color can comprehend (CQ-4290733).

* You can now navigate to asset sharing options on Viewer Preset Editor and collapse the expanded share option using keyboard keys (CQ-4290724).

* You can now navigate and view tooltips on the information icons and alert icons on Basic and Advanced tabs of Edit Video Encoding page using keyboard keys (CQ-4290722).

* Screen readers now narrate the instructions for various fields in Appearance tab and Behavior tab on Viewer Preset Editor (CQ-4290721).

* When navigating the Edit Image Preset page in Form mode, screen reader narrates the purpose and names of various fields and controls (CQ-4290717).

* When navigating assets detail page, screen readers now describe the purpose of various options within Viewers (CQ-4290716).

* Contrast (with background) of the placeholder text All Renditions in Renditions option of asset details page is improved, so that users with limited vision and perception of color can comprehend (CQ-4290713).

* Visual asterisk to signify mandatory field is now provided in Title field of asset in Image Set Editor, and screen readers announce the required information for the field (CQ-4290712).

* Screen readers can now access and narrate the purpose of various interactive options within Viewers in asset details page (CQ-4290708).

Adobe Experience Manager 6.5.9.0 Assets fixes the following issues in [!DNL Dynamic Media]:

* Custom ViewerPresets and CSS are not replicated to [!DNL Dynamic Media] when [!DNL Dynamic Media] is activated selectively and disabled by [default](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/assets/dynamicmedia/config-dm.html#troubleshoot-dm-config) (NPR-36232).

* When attempting to preview video renditions on asset details page, the videos are slow to load (CQ-4320122).

* Browser page gets unresponsive and slows down when uploading more than 200 assets with Duplicate Asset Detector enabled (CQ-4319633).

* When a panoramic image asset is added on the panoramic media component on a page, then an Uncaught Reference error is logged (CQ-4317666).

* When interactive media viewer is implemented with Experience Fragment, the Experience Fragment is not opened from the publisher and an error is logged (CQ-4317655).

* [!UICONTROL Publish to Dynamic Media] option is not available within [!UICONTROL Quick Publish] options in [!UICONTROL Properties] page (CQ-4317199).

* Site Authors with read-only permissions can use smart crop functionality on assets and edit the smart cropped renditions (CQ-4316450).

* Video annotations do not work for folder paths where [!DNL Dynamic Media] configuration is not enabled, even if the [!DNL Experience Manager] instance is set-up in [!DNL Dynamic Media] mode (CQ-4314950).

* When the assets title has double byte, multi-byte, high ASCII, Cyrillic, surrogate pair, Hebrew, Arabic, and GB18030 characters, then on publishing to Dynamic Media the asset title have a question mark (&#63;) (CQ-4311872).

>Known video playback issues in Dynamic Media *on Experience Manager 6.5.9.0 only*:
>
>* <!-- CQDOC-18116 -->You cannot play video renditions from the asset's Details page on Experience Manager - Dynamic Media running in hybrid mode.
>* <!-- CQDOC-18116 -->You cannot stream videos on Experience Manager - Dynamic Media running in hybrid mode.

### Platform {#platform-6590}

* When you generate a thumbnail for a blueprint and roll out the changes to the live copy, the inheritance for some fields does not work (CQ-4319517).

* When you create a folder, select the Orderable property, and add more than 20 assets to the folder, selecting all assets in the folder displays a wrong count (CQ-4316243).

* When you refresh a page, the sorting of folder or assets does not display appropriate results (CQ-4316200).

* Handlebars JavaScript library is upgraded to v4.7.7 (NPR-36375).

* Custom bundles are not updated when installing a new code package using Package Manager (NPR-35949).

* A `resourceresolver` Sling bundle is causing `Sling:alias` query to fail (NPR-35335).

* The context path gets removed when setting up SSL in Experience Manager (NPR-35294).

* The `SegmentNotFound` exception is returned after a long running session (NPR-36405).

### Integrations {#integrations-6590}

* Unable to save page properties with inheritance enabled for Cloud Services Experience Fragments (NPR-36107).

* IMS user interface pagination and lazy loading does not display appropriate results (NPR-36046).

* When you create A4T Target configuration and select the reporting source as [!DNL Adobe Analytics], there are no Adobe Target-enabled report suites available in the dropdown list (NPR-36006).

### Projects {#projects-6590}

* Cannot save the properties of a project as the JCR path to the project is not resolved due to an extra forward slash (`/`) appended to the project path (NPR-36191).

### Screens {#screens-6590}

* [!DNL Experience Manager Screens] players cannot authenticate if a custom two-factor authentication handler is used (NPR-35854).

### Commerce {#commerce-6590}

* The [!UICONTROL Commerce Catalog] wizard fails to load more than 40 items in the Column view (CQ-4318379).

### Translation projects {#translation-6590}

* Update or Overwrite options do not display while retranslating an `es` to `es_es` page (NPR-36170).

* When the auto-approve option is selected for a project with human translation, the job status displays as `Unknown` (NPR-35981).

* When you are translating a page, the reference path of [!DNL Experience Fragments] does not update to the destination [!DNL Experience Fragment] reference path (NPR-35911).

* When you make changes in the parent and child pages and send the parent page for translation, the child pages are incorrectly translated as well (NPR-35896).

* When there are multiple concurrent translation projects for a selected page, the [!UICONTROL Go To Projects] option does not link to the latest translation project (NPR-35454).

* When you publish assets to [!DNL Dynamic Media], [!DNL Experience Manager] displays an incorrect message for unpublished tags (CQ-4315914, CQ-4315913).

* When you open a deleted job, [!DNL Experience Manager] displays an incorrect message (CQ-4315910).

### Workflow {#workflow-6590}

* When you click Complete, Delegate, or Open actions for items available in Inbox, there is no visual clue for the completion of these actions (NPR-36317).

### [!DNL Communities] {#communities-6590}

* In spam filtering, the system consumes 100% of the Java™ heap space making the Experience Manager server unresponsive (NPR-36316, NPR-36493). 
* In forums, the JCR sessions data originating from `SearchCommentSocialComponentListProvider` is leaked (NPR-36235).
* Opening a specific inbox message reflects all the messages with improper pagination and other issues (NPR-35917).

### [!DNL Brand Portal] {#brandportal-6590}

* The Asset Sourcing feature flag is auto-enabled on configuring [!DNL Experience Manager Assets] with [!DNL Brand Portal] (NPR-36010). 

### [!DNL Forms] {#forms-6590}

>[!NOTE]
>
>* [!DNL Experience Manager Forms] releases the add-on packages one week after the scheduled [!DNL Experience Manager] Service Pack release date.
>* You can now develop and operate applications with [!DNL Azul Zulu] builds of [!DNL OpenJDK] for [!DNL Experience Manager Forms] on OSGi deployments.

**Adaptive Forms**

* Language initialization issues in [!DNL Experience Manager Forms] 6.5.7.0 while generating multiple translation dictionaries (NPR-36439).
* When you add an attachment to adaptive form fragment and submit the form, [!DNL Experience Manager Forms] displays the following error message (NPR-36195):

  ```TXT
   POST /content/forms/af/attachmentissue/jcr:content/guideContainer.af.submit.jsp HTTP/1.1] com.adobe.aemds.guide.servlet.GuideSubmitServlet [AF] Invalid file name or mime type for file resulted in submission failure
  ```

* When you use human translation to update a dictionary and then preview an adaptive form, the modifications do not display (NPR-36035).

**Interactive Communications**

* When you upload an image using the Interactive Communications Print channel and edit it, the image is not visible anymore (NPR-36518).

* On editing a text asset and populating a placeholder, all the interactive elements are removed from the navigation pane (NPR-35991).

**Workflow**

* When you call the REST endpoint of an [!DNL Experience Manager Forms] service on JBoss®, [!DNL Experience Manager] displays the following error message (NPR-36305):

   ```TXT
   Invalid input. The maximum length of 2000 characters was exceeded.
   ```

**BackendIntegration**

* Unable to save a form data model while binding Read service argument to a literal value that contains a dash (NPR-36366).

**Document Security**

* When you set certification and HSM for GlobalSign, [!DNL Experience Manager Forms] displays the `Unsuported Algorithm` and `Invalid TSA Certificate` error messages while adding a timestamp to LTV (NPR-36026, NPR-36025).

**Document Services**

* Updates to [!DNL Gibson] library for integration with [!DNL Experience Manager Forms] (NPR-36211).

**Foundation JEE**

* When you select Endpoint Management on the AdminUI, [!DNL Experience Manager Forms] displays the `endpoint registry failure` error message (CQ-4320249).

For information on security updates, see [[!DNL Experience Manager] security bulletins page](https://helpx.adobe.com/security/products/experience-manager.html).

## Install 6.5.9.0 {#install}

**Setup requirements and more information**

* Experience Manager 6.5.9.0 requires Experience Manager 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions.
* The service pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html).
* On a deployment with MongoDB and multiple instances, install Experience Manager 6.5.9.0 on one of the Author instances using the Package Manager.

>[!NOTE]
>
>Adobe does not recommend removing or uninstalling the [!DNL Adobe Experience Manager] 6.5.9.0 package.

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

There are two ways to automatically install [!DNL Experience Manager] 6.5.9.0 on a working instance:

A. Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.

B. Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Adobe Experience Manager 6.5.9.0 does not support Bootstrap installation.

**Validate the installation**

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.9.0)` under [!UICONTROL Installed Products].

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
>Experience Manager 6.5.9.0 includes a new version of [AEM Forms Compatibility Package](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html#aem-65-forms-releases). If you are using an older version of AEM Forms Compatibility Package and updating to Experience Manager 6.5.9.0, install the latest version of the package post installation of Forms Add-On Package.

### Install Adobe Experience Manager Forms on JEE {#install-aem-forms-jee-installer}

>[!NOTE]
>
>Skip if you are not using AEM Forms on JEE. Fixes in Adobe Experience Manager Forms on JEE are delivered through a separate installer.

For information about installing the cumulative installer for Experience Manager Forms on JEE and post-deployment configuration, see the [release notes](jee-patch-installer-65.md).

>[!NOTE]
>
>After installing the cumulative installer for Experience Manager Forms on JEE, install the latest Forms add-on package, delete the Forms add-on package from the `crx-repository\install` folder, and restart the server.

### UberJar {#uber-jar}

The UberJar for Experience Manager 6.5.9.0 is available in the [Maven Central repository](https://repo1.maven.org/maven2/com/adobe/aem/uber-jar/6.5.9-1.0/).

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

* If you are upgrading your [!DNL Experience Manager] instance from 6.5 to 6.5.9.0 version, you can view `RRD4JReporter` exceptions in the `error.log` file. Restart the instance to resolve the issue.

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

The following text documents list the OSGi bundles and Content Packages included in [!DNL Experience Manager] 6.5.9.0:

* [List of OSGi bundles included in Experience Manager 6.5.9.0](assets/6590_bundles.txt)

* [List of Content Packages included in Experience Manager 6.5.9.0](assets/6590_packages.txt)

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

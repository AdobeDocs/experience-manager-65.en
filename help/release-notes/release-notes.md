---
title: Release Notes for [!DNL Adobe Experience Manager] 6.5
description: Find release information, what's new, install how-tos, and a detailed change list for [!DNL Adobe Experience Manager] 6.5.
mini-toc-levels: 4
solution: Experience Manager
feature: Release Information
role: User,Admin,Architect,Developer
exl-id: a52311b9-ed7a-432e-8f35-d045c0d8ea4c
---
# [!DNL Adobe Experience Manager] 6.5 Latest Service Pack Release Notes {#aem-service-pack-release-notes}

<!-- For an itemized list of all issues found in this release information, see the following spreadsheet: https://adobe-my.sharepoint.com/:x:/r/personal/anujkapo_adobe_com/_layouts/15/Doc.aspx?sourcedoc=%7B3ea81ae4-e605-4153-b132-f2698c86f84e%7D&action=edit&wdinitialsession=d8c7b903-87fc-4f2d-9ef2-542a82169570&wdrldsc=3&wdrldc=1&wdrldr=SessionMemoryQuotaExceededDuringSession -->

<!-- DO NOT DELETE THIS HIDDEN NOTE      DO NOT DELETE THIS HIDDEN NOTE
>[!NOTE]
>
>Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the add-on packages release Thursday, November 30, 2023. In addition, a list of Forms fixes and enhancements is added to this section. -->

## Release information {#release-information}

| Product | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.21.0 <!-- UPDATE FOR EACH NEW RELEASE -->                     |
| Type     | Service Pack release         |
| Date     | Thursday, June 06, 2024 <!-- UPDATE FOR EACH NEW RELEASE -->              |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.21.0.zip) <!-- UPDATE FOR EACH NEW RELEASE -->|

## What is included in [!DNL Experience Manager] 6.5.21.0 {#what-is-included-in-aem-6521}

[!DNL Experience Manager] 6.5.21.0 includes new features, key customer-requested enhancements, and bug fixes. It also includes performance, stability, and security improvements released since the initial availability of 6.5 in April 2019. [Install this Service Pack](#install) on [!DNL Experience Manager] 6.5. 

<!-- UPDATE FOR EACH NEW RELEASE -->

## Key features and enhancements

<!-- * _6.5.21.0 REVIEWERS: WHAT ARE THE KEY FEATURES AND ENHANCEMENTS THAT YOU WANT TO HIGHLIGHT IN THIS RELEASE?_ -->

Some of the key features and enhancements in this release include the following:

* A new and easier to use credential for server-to-server authentication, replacing the existing Service Account (JWT) credential. (NPR-41994)
* Apply artifacts to individual text blocks in XDPs: A new feature is introduced in Forms Designer that allows users to configure settings on individual text blocks in XDP files to control the elements which are treated as artifacts in the resulting PDFs, such as headers and footers, to make them accessible for assistive technologies. The key features include marking text blocks as artifacts, and embedding these settings in the XDP metadata. The Forms Output service applies these settings during PDF generation, ensuring proper PDF/UA tagging.
* Rule Editor enhancements in AEM Forms:
  * Support for implementing nested conditions with `When-then-else` functionality.
  * Validate or reset, panels and forms, including fields.
  * Support for modern JavaScript features such as let and arrow functions (ES10 support) within the Custom Functions.
* AutoTag API for PDF Accessibility: AEM Forms on OSGi now supports the new AutoTag API to enhance PDF for accessibility standards by adding tags: paragraphs, and lists. It makes PDFs more accessible for users with assistive technology.
* AEM Forms Designer is certified with `GB18030:2022` standard. With this certification, Now Forms Designer supports Chinese Unicode character set which allow to input Chinese characters into all editable fields and dialogs.
* 16-bit PNG support: PDF Generator's ImageToPdf service now supports conversion of PNGs with 16-bit color depth.

### [!DNL Assets]

#### Enhancements

The following is the list of enhancements included in this release:

* The IPTC tab now supports [!UICONTROL Alt Text] and [!UICONTROL Extended Description] text fields. (ASSETS-34918)

#### Accessibility fixes

The following is the list of accessibility fixes included in this release:

* If the processing status of an asset is Failed or Metadata Failed, the captions and audio tracks UI does not work appropriately. (ASSETS-37281)
* When you save an asset metadata and try to edit it, the language name does not display. (ASSETS-37281)

<!-- ### [!DNL Forms]
* A -->

<!-- UPDATE BELOW FOR EACH NEW RELEASE -->

## Fixed issues in Service Pack 21 {#fixed-issues}

### [!DNL Sites]{#sites-6521}

#### Accessibility {#sites-accessibility-6521}

* The **[!UICONTROL Saved Searches]** label is not persistent. The placeholder is being used as the only visual label for a text field. (SITES-3050)

#### Admin User Interface{#sites-adminui-6521}

* When you click **[!UICONTROL Sites]** > **[!UICONTROL Core Core Components]** > **[!UICONTROL Properties]** > **[!UICONTROL Permissions]** tab > **[!UICONTROL Effective Permission]**, the **Effective Permissions** dialog box does not open in. (SITES-17378)  

<!-- #### Classic UI{#sites-classicui-6521} 

* A -->

#### [!DNL Content Fragments]{#sites-contentfragments-6521}

* Fixed the double inclusion of the form elements. (SITES-21109)
* When creating a Content Fragment, the Close button sometimes becomes unresponsive, causing the entire page to freeze and necessitating a page refresh to close the Content Fragment. As for the version creation issue, the system is creating a new version of a Content Fragment. This issue occurs even when the user has not made any changes, simply by interacting with the RTE or a text field. (SITES-21187)

#### [!DNL Content Fragments] - GraphQL API {#sites-graphql-api-6521}

* While upgrading Adobe Experience Manager from 6.5.19.0 to 6.5.20.0, the path `/libs/cq/graphql/sites/graphiql` was getting deleted. (SITES-20098)

<!-- #### [!DNL Content Fragments] - GraphQL Query Editor{#sites-graphql-query-editor-6521}

* W -->

<!-- #### [!DNL Content Fragments] - REST API{#sites-restapi-6521}

* W -->

<!-- #### Core Backend{#sites-core-backend-6521}

* W -->

<!-- #### Core Components{#sites-core-components-6521}

* I -->

<!-- #### Campaign integration{#sites-campaign-integration-6521}

* A -->

#### Experience Fragments{#sites-experiencefragments-6521}

* Rollout of Experience Fragments from `masters/language` to `country/language` does not update cross-references. (SITES-21172)
* Templates not only specified in the `cq:allowedTemplates`, but templates that have `allowedPaths` configured at the template level, appear as options when creating a new Experience Fragment. (SITES-20855)

<!-- #### Foundation Components (Legacy){#sites-foundation-components-legacy-6521}

* T -->

<!-- #### Launches{#sites-launches-6521} -->


<!-- ### [!DNL Forms]-->

<!-- DELETED MAY 22, 2024 FROM TOTAL RELEASE CANDIDATE ISSUES * The `sourceRootResource` configured in the Launch configuration within CRXDE Lite points to content that no longer exists, leading to a malfunction when attempts are made to delete launches. Delete launches even if the page is deleted or if the path is not the same. (SITES-20750) -->


#### MSM - Live Copies{#sites-msm-live-copies-6521}

* Overlaying the Page component to add tabs in page properties. One of them is page configuration and has a property to add an Experience Fragment URL. The link configured in the page properties for the Experience Fragment does not change for any language copies created for that page. The configured link should change with the language copy URL. (SITES-19580)

#### Page Editor{#sites-pageeditor-6521}

* The edit mode applies a gray background inconsistently, which fails to comply with the WCAG (Web Content Accessibility Guidelines) color contrast standards. (SITES-20060)

### [!DNL Assets]{#assets-6521}

* If an asset is published to Brand Portal, the publishing status remains inconsistent. (ASSETS-36807)
* Assets are not deleted when you delete them from an instance using an API call. (ASSETS-35131)
* When you try to import metadata, a `question mark (?)` replaces the insertion of characters in any language other than English.  (ASSETS-35091)
* When `dc:title` property is used with data type string, the assets content tree is not working appropriately after the installation of Service Pack 6.5.19. (ASSETS-34684)
* An error is shown if there is any special character in the name of an asset. (ASSETS-33248)

#### [!DNL Dynamic Media]{#assets-dm-6521}

* In AEM 6.5.18, it does not show all the hotspots added to an asset when you edit the hotspots. However, all the hotspots work in a published asset, but you cannot edit them later if you needed to. (ASSETS-33609)
* The latest EPS files that get uploaded are not generating thumbnails after reprocessing. (ASSETS-32617)
* In Tools > Assets > Dynamic Media Publish Setup > Request Attributes tab, the inputs `Width(px)` and `Height(px)` look different in Spanish, Italian, and Portuguese. They are not aligned with each other for these locations. (ASSETS-31896)
* Effective May 1, 2024, Adobe Dynamic Media ended support for the following:
  * SSL (Secure Socket Layer) 2.0
  * SSL 3.0 
  * TLS (Transport Layer Security) 1.0 and 1.1
  * The following weak ciphers in TLS 1.2:
    * `TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384`
    * `TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA`
    * `TLS_RSA_WITH_AES_256_GCM_SHA384`
    * `TLS_RSA_WITH_AES_256_CBC_SHA256`
    * `TLS_RSA_WITH_AES_256_CBC_SHA`
    * `TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256`
    * `TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA`
    * `TLS_RSA_WITH_AES_128_GCM_SHA256`
    * `TLS_RSA_WITH_AES_128_CBC_SHA256`
    * `TLS_RSA_WITH_AES_128_CBC_SHA`
    * `TLS_RSA_WITH_CAMELLIA_256_CBC_SHA`
    * `TLS_RSA_WITH_CAMELLIA_128_CBC_SHA`
    * `TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA`
    * `TLS_RSA_WITH_SDES_EDE_CBC_SHA`

### [!DNL Forms]{#forms-6521}

#### [!DNL Adaptive Forms] {#forms-6520}

* When an Adaptive Form is submitted from an Adobe Experience Manager Publish instance to an Adobe Experience Manager Workflow, the workflow fails to save the attachments. (FORMS-14209) 
* When a user clicks the Print to PDF button on AEM Forms Service Pack 15 (6.5.15.0) on OSGi, the Client-side validation fails, it is evident by the error messages shown in the Developer Tools Console window. (FORMS-14029) 
* When a user submits a form on AEM 6.5 Forms Service Pack 17 (6.5.17.0) or AEM 6.5 Forms Service Pack 18 (6.5.18.0) or AEM 6.5 Forms Service Pack 19 (6.5.19.0), the translation of “Thank-You” messages does not function correctly. Although the messages are correctly translated in the dictionary. (FORMS-13846) 
* When a user previews a form having a Date-Picker component, the date-picker field misaligns with the other form fields. (FORMS-13763)
* When a user on the environment AEM Forms Service Pack 19 (6.5.19.0) calls the API to format numbers, the formatted numbers are not aligned with the respective Locales, and the currency signs are not displayed correctly. The issue persists regardless of the Locale parameter set to "de_DE" or "en_US". (FORMS-13759)
* When a user on the environment AEM Forms Service Pack 19 (6.5.19.0) converts 16-bit PNGs to PDFs using Img2Pdf PDFG service, it fails and is unable to "Use Acrobat Image conversion" service. (FORMS-13754) 
* On AEM Forms Service Pack 19 (6.5.19.1), when a user uploads an existing JobOptions file in the Services / PDF Generator / Adobe PDF Settings section of the administrative web interface of AEM forms JEE (adminui), the upload fails and shows an error message (FORMS-13597):
  `"An error has occurred while processing your request. Please use the breadcrumb links to navigate to another page."`
* When a user migrates from AEM Forms Service Pack 15 (6.5.15.0) to AEM Forms Service Pack (6.5.17.0) or AEM Forms Service Pack (6.5.19.0), the FD key duplicates, which causes the forms to not translate correctly. (FORMS-13461)
* When a user puts dispatchers in front of the authors supported by the deployment topology on AMS, the Assign Task submission hangs/fails. (FORMS-8010)
* Accessibility Related Fixes:
  * Icons on “formsanddocuments” page are now accessible as per the ANDI standard. (FORMS-13094) 
  * Users can access tool bar via keyboard to save or edit content on the edit page, the tool bar is enhanced as per the ANDI standard. (FORMS-13102) 
  * “Required or Mandatory” form fields are accessible as per the ANDI standard. (FORMS-13097)
* When a user adds a new table to an existing form using AEM Forms Designer on the environment AEM Forms Service Pack 19 (6.5.19.0), it crashes. (LC-3921978) 
* When a user renders an Adaptive Form on Linux environment, an extra space between the field components occur. (LC-3921957)
* When a user converts an XTG file to PostScript format using the Output Service, it fails with the error:           `(AEM_OUT_001_003:Unexpected Exception: PAExecute Failure: XFA_RENDER_FAILURE)`. (LC-3921720) 

  To resolve the issue:
    Check if the data contains special characters like Zero Width Space (0x200b). If yes, then use the flag by adding the tag `<behaviorOverride>patch-LC3921720:1</behaviorOverride> in the XCI file as shown in custom_xfa(1)-1.xci` file.

* When using AEM Forms Service Pack 18 (6.5.18.0) within a Linux environment, XMLFM crashes on CPUs not supporting AVX /AVX2 instruction featuring AMD processors. (LC-3921718)
* When a user creates a PDF from XDP using Forms Output service, the user is not able to configure "settings" on "individual text blocks" in the XDP to control what is "artifacted". (LC-3921954)

<!--
Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the AEM 6.5.21.0 Forms add-on package release is scheduled for Thursday, June 13, 2024. A list of Forms fixes and enhancements is added to this section post the release.

-->


<!-- #### [!DNL Adaptive Forms]

* THIS BUG WAS ALREADY REPORTED IN THE 6.5.20.0 RELEASE NOTES. IS IT NEEDED AGAIN IN THE 6.5.21.0 RELEASE NOTES? (AEM Forms on JEE Only) The PDF Generator service fails to enumerate the fonts available on the server. Consequently, the font selection panel on the Adobe PDF Settings page in the PDFG Admin UI remains empty, effectively preventing (un)embedding of chosen fonts. (FORMS-12095) -->


<!-- #### [!DNL Forms Designer] {#forms-designer-6521}

* W -->

### Foundation {#foundation-6521}

#### Apache Felix {#foundation-apachefelix-6521}


* Upgrade issue with AEM 6.5 Service Pack 19 (SP19) in which the Application server context-root path is missing for unauthorized requests to Apache Felix following the installation of SP19. Update to Apache Felix Web Management Console 4.9.8. (NPR-41933)

#### Campaign{#foundation-campaign-6521}

* AEM 6.5 Service Pack 15 is producing continuous error logs with significant entries. The following issues were reported:
  * 404 INFO error for missing resource at path `/libs/granite/ui/content/shell/start.html`
  * Error log entry for an uncaught SlingException due to `NullPointerException` at `CampaignsDataSourceServlet.java:147`

  Error logs should not be filled with frequent and voluminous error entries, and the AEM instance should function without issues related to missing resources or exceptions. (CQ-4357064)

#### Cloud Services{#foundation-cloudservices-6521}

* Remove Google Guava from AEM Cloud Services. (CQ-4356436)

<!-- #### Communities {#foundation-communities-6521}

* U -->


<!-- #### Content distribution{#foundation-content-distribution-6521}

* T -->

#### Granite{#foundation-granite-6521}

* You cannot select **Delete** or **Modify** without **Browse** permission in the Configuration browser. (GRANITE-51002)

#### Integrations{#foundation-integrations-6521}

* Regarding `cq-target-integration`, need to remove non-test usage of Google Guava. (CQ-4357101)
* Replacement of Service Account (JSON Web Token or JWT) credentials with OAuth2 Server-to-Server credentials (also known as Service Principals). (NPR-41994)
* Create Audience request fails with IMS (Identity Management System) configuration. (NPR-41888)
* When a customer attempts to view the Payload page, the content does not display properly due to a malformed URL; a 404 error is displayed. A missing question mark symbol in the URL, before the query parameters, caused the error. This issue requires the customer to insert the question mark symbol to view the Payload page correctly. (NPR-41957)
* Remove code and dependency of Adobe Search&Promote from AEM 6.5, which reached end of life on [September 2022 as per notice](https://experienceleague.adobe.com/en/docs/discontinued/using/search-promote). (NPR-41855)

#### Localization{#foundation-localization-6521}

* In the Templates editor, the text string *`No video available.`* is not localized. (SITES-13190)
* String after activating or deactivating a user are not localized in **Tools** > **Security** > **Users** > *any_user_name* > **Activate** > **OK**, and select *any_user_name* > **Deactivate** > **OK**. (NPR-41737)

#### Oak {#foundation-oak-6521}

* Performance regression fix - Avoid range queries on like conditions. (OAK-9481)
* New Oak version is 1.22.20. 

#### Platform{#foundation-platform-6521}

* The `Unclosed resource resolver` error is being experienced for `com.day.cq.mailer.impl.DefaultMailService`. The `MessageGatewayService` class, which is out-of-the-box, was being used without a resource resolver. The issue occurred on any page with a form submission button that sends an email using this class. (NPR-41853)
* In the **About Adobe Experience Manager** dialog box, the copyright year is still 2023. (CQ-4356349)


<!-- #### Sling{#foundation-sling-6521}

* T -->

#### Translation{#foundation-translation-6521}

* An issue with AEM 6.5.19 out-of-the-box translation status not updating as expected for a launch. After importing a translated file into a translation job associated with an AEM launch, the status was expected to change to `Approved`. Instead, the status changed to `Ready for Review`, which is not the expected behavior. (NPR-41756)
* When creating multiple configurations and going to the Translation Cloud Services configurations, not all elements are displayed in the UI. Only the first 40 elements/folder are displayed; lazy loading is triggered but not adding more content. (NPR-41829)
* Garbled characters occur if there is Japanese on the Permissions page in the Touch user interface. (NPR-41794)
* AEM 6.5.14 and 6.5.9 do not send an emoji for translation. (CQ-4357000)

#### User interface{#foundation-ui-6521}

* In Tools > Security > Users > <user_name> > Profiles, in the **Edit User Settings** dialog box, clicking Cancel does not exit the dialog box. (NPR-41793)
* The Granite `pathfield` component at `/libs/granite/ui/components/coral/foundation/form/pathfield` fails to enable the **[!UICONTROL Select]** button when an asset is selected. After the path field is popped up, and the user selects the asset checkbox, the **[!UICONTROL Select]** button is not enabled; it does not change from gray to blue. (NPR-41970)
* An issue exists with the Content Fragment Model (CFM) reference field within AEM. Despite the CFM reference field being set as mandatory, the system allows users to click Save to save content with non-CFM values in certain scenarios. The Save button should be dimmed (unavailable). (NPR-41894)
* The standard Coral user interface dialog boxes that use the `successresponse` action must trigger a Success Response after the action. But in AEM 6.5 Service Pack 19, the reload action is not invoked and no message is displayed. (NPR-41797)
* AEM Notifications links are not working in AEM 6.5 Service Pack 18. When upgrading to Service Pack 18, the AEM Notifications links are not working when selecting the messages by way of the notifications button. (NPR-41792)

<!-- #### WCM{#foundation-wcm-6521}

* T -->

#### Workflow{#foundation-workflow-6521}

* In AEM 6.5.18, repeated errors in removing from user metadata cache during purge. (NPR-41762)

## Install [!DNL Experience Manager] 6.5.21.0{#install}

<!-- Remaining content from here to bottom stays the same except for version updating as needed as per update team feedback. -->

* [!DNL Experience Manager] 6.5.21.0 requires [!DNL Experience Manager] 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions. <!-- UPDATE FOR EACH NEW RELEASE -->
* The Service Pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.21.0.zip).
* On a deployment with MongoDB and multiple instances, install [!DNL Experience Manager] 6.5.21.0 on one of the Author instances using the Package Manager.<!-- UPDATE FOR EACH NEW RELEASE -->

>[!IMPORTANT]
>
> Adobe does not recommend that you remove or uninstall the [!DNL Experience Manager] 6.5.21.0 package. As such, before you install the pack, you should create a backup of the `crx-repository` in case you must roll it back. <!-- UPDATE FOR EACH NEW RELEASE -->
<!-- For instructions to install Service Pack for Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md). -->


### Install the Service Pack on [!DNL Experience Manager] 6.5{#install-service-pack}

1. Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the Service Sack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.21.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->

1. Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package, then select **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>Dialog on Package Manager UI sometimes exits during the installation of the Service Pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installation is successful. Typically, this issue occurs in the [!DNL Safari] browser but can intermittently occur in any browser.

**Automatic installation**

There are two different methods that you can use to install [!DNL Experience Manager] 6.5.21.0.<!-- UPDATE FOR EACH NEW RELEASE -->

* Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.
* Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Experience Manager 6.5.21.0 does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->

**Validate the installation**

To know the platforms that are certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.21.0)` under [!UICONTROL Installed Products]. <!-- UPDATE FOR EACH NEW RELEASE -->

1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.20 or later (Use Web Console: `/system/console/bundles`). <!-- OAK Oak oak VERSION -MAY- NEED TO BE UPDATED FOR EACH NEW RELEASE -->

### Install Service Pack for [!DNL Experience Manager] Forms{#install-aem-forms-add-on-package}

For instructions to install the Service Pack on Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md).

>[!NOTE]
>
>The Adaptive Forms feature, available in [AEM 6.5 QuickStart](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/implementing/deploying/deploying/deploy), is designed for exploration and evaluation purposes only. For production use, it is essential to obtain a valid license for AEM Forms, as Adaptive Forms functionality requires proper licensing.

### Install GraphQL Index Package for Experience Manager Content Fragments{#install-aem-graphql-index-add-on-package}

Customers using GraphQL must install the [Experience Manager Content Fragment with GraphQL Index Package 1.1.1](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/cfm-graphql-index-def-1.1.1.zip). 

Doing so lets you add the required index definition based on the features they actually use.

Failure to install this package may result in slow or failed GraphQL queries.

>[!NOTE]
>
>Only install this package once per instance; it does not need to be reinstalled with every Service Pack.

### UberJar{#uber-jar}

The UberJar for [!DNL Experience Manager] 6.5.21.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.21/). <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM: <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

  ```shell
    <dependency>
    <groupId>com.adobe.aem</groupId>
    <artifactId>uber-jar</artifactId>
    <version>6.5.21</version>
    <scope>provided</scope>          
    </dependency>
  ```

>[!NOTE]
>
>UberJar and the other related artifacts are available on Maven Central Repository instead of Adobe Public Maven repository (`repo.adobe.com`). The main UberJar file is renamed to `uber-jar-<version>.jar`. So, there is no `classifier`, with `apis` as the value, for the `dependency` tag.


## Deprecated and removed features{#removed-deprecated-features}

See [Deprecated and removed features](/help/release-notes/deprecated-removed-features.md/).

## Known issues{#known-issues}

<!-- THESE KNOWN ISSUES CARRY OVER EACH RELEASE. THE "PRODUCT UPDATES TEAM" IS SUPPOSED TO VERIFY EACH ISSUE AND LET YOU KNOW IF ANYTHING NEEDS TO BE ADDED, DELETED, OR CHANGED IN THIS LIST.-->

<!-- * **Page publishing not working in Page Editor after upgrading to Service Pack 18 (6.5.18.0)** -->

  <!-- https://jira.corp.adobe.com/browse/SITES-15856 REMOVE FOR 6.5.19.0 --> 
  <!-- After you upgrade an instance of AEM 6.5.0.0&mdash;6.5.17.0 to AEM 6.5.19.0, when you click **Publish Page** inside the Page Editor, you are redirected to a URL that does not exist.

  To work around this issue, do one of the following:

  * Remove the following "path" property.

       `/libs/wcm/core/content/editor/jcr:content/content/items/content/header/items/headerbar/items/pageinfopopover/items/list/items/publish/granite:data`

  * Paste the correct URL directly into the browser.

       `http://localhost:4504/editor.html/libs/wcm/core/content/sites/publishpagewizard.html?item=/content/we-retail/language-masters/en/about-us.html` -->


* **Related to Oak**
  From Service Pack 13 and above, the following error log has begun to appear which affects the persistence cache:

  ```shell
  org.h2.mvstore.MVStoreException: The write format 1 is smaller than the supported format 2 [2.0.202/5]
  at org.h2.mvstore.DataUtils.newMVStoreException(DataUtils.java:1004)
      at org.h2.mvstore.MVStore.getUnsupportedWriteFormatException(MVStore.java:1059)
      at org.h2.mvstore.MVStore.readStoreHeader(MVStore.java:878)
      at org.h2.mvstore.MVStore.<init>(MVStore.java:455)
      at org.h2.mvstore.MVStore$Builder.open(MVStore.java:4052)
      at org.h2.mvstore.db.Store.<init>(Store.java:129)
  ```

  Or

  ```shell
  org.h2.mvstore.MVStoreException: The write format 1 is smaller than the supported format 2 [2.1.214/5].
  ```

  To resolve this exception, do the following:

    1. Delete the following two folders from `crx-quickstart/repository/`

        * `cache`
        * `diff-cache`

    1. Install the Service Pack, or restart Experience Manager as a Cloud Service. 
      New folders of `cache` and `diff-cache` are automatically created and you no longer experience an exception related to `mvstore` in the `error.log`.

* Update your GraphQL queries that may have used a custom API name for your content model to use the default name of the content model instead.

* A GraphQL query may use the `damAssetLucene` index instead of the `fragments` index. This action might result in GraphQL queries that fail, or take a long time to run.

  To correct the problem, `damAssetLucene` has to be configured to include the following two properties under `/indexRules/dam:Asset/properties`:

  * `contentFragment`
    * `jcr:primaryType="nt:unstructured"`
    * `name="jcr:content/contentFragment"`
    * `propertyIndex="{Boolean}true"`
    * `type="Boolean"`
  * `model`
    * `jcr:primaryType="nt:unstructured"`
    * `name="jcr:content/data/cq:model"`
    * `ordered="{Boolean}true"`
    * `propertyIndex="{Boolean}true"`
    * `type="String"`

  After the index definition is changed, a reindexing is required (`reindex` = `true`).

  After these steps, the GraphQL queries should perform faster.

* When trying to move, delete, or publish either Content Fragments, Sites, or Pages, there is an issue when Content Fragment references are fetched. The background query fails. That is, the functionality does not work.
  To ensure correct operation, you must add the following properties to the index definition node `/oak:index/damAssetLucene` (no reindexing is required):

   ```xml
   "tags": [
       "visualSimilaritySearch"
     ]
   "refresh": true
   ```

* If you upgrade your [!DNL Experience Manager] instance from 6.5.0 - 6.5.4 to the latest Service Pack on Java&trade; 11, you see `RRD4JReporter` exceptions in the `error.log` file. To stop the exceptions, restart your instance of [!DNL Experience Manager]. <!-- THIS BULLET POINT WAS UPDATED AS PER CQDOC-20021, JANUARY 23, 2023 --> 

* Users can rename a folder in a hierarchy in [!DNL Assets] and publish a nested folder to [!DNL Brand Portal]. However, the title of the folder is not updated in [!DNL Brand Portal] until the root folder is republished.

* The following errors and warning messages may be displayed during installation of [!DNL Experience Manager] 6.5.x.x:
  * "When the Adobe Target integration is configured in [!DNL Experience Manager] using the Target Standard API (IMS authentication), then exporting Experience Fragments to Target results in wrong offer types getting created. Instead of type "Experience Fragment"/source "Adobe Experience Manager," Target creates several offers with type "HTML"/source "Adobe Target Classic."
  * `com.adobe.granite.maintenance.impl.TaskScheduler`: No maintenance windows found at granite/operations/maintenance.
  * Adaptive Form server-side validation fails when aggregate functions such as SUM, MAX, and MIN are used (CQ-4274424).
  * `com.adobe.granite.maintenance.impl.TaskScheduler` : No maintenance windows found at granite/operations/maintenance.
  * The hotspot in a Dynamic Media interactive image is not visible when previewing the asset through the Shoppable Banner viewer.
  * `com.adobe.cq.social.cq-social-jcr-provider bundle com.adobe.cq.social.cq-social-jcr-provider:1.3.5 (395)[com.adobe.cq.social.provider.jcr.impl.SpiSocialJcrResourceProviderImpl(2302)]` : Timeout waiting for register change to complete unregistered.

* Starting with AEM 6.5.15, the Rhino JavaScript Engine provided by the ```org.apache.servicemix.bundles.rhino``` bundle has a new hoisting behavior. Scripts that use the strict mode (```use strict;```) have to declare their correct variables. Otherwise, they do not get run, and end up throwing a runtime error.
 
* Installing tagging related out-of-the-box content by way of an official update package resets the languages property of the `/content/cq:tags` node to default. This action is true for Service Packs, Security Service Packs, Extended Feature Packs, Cumulative Feature Packs, patches, and so on. Therefore, it is necessary to add it from the properties before installation.

### Known issue for AEM Sites {#known-issues-aem-sites-6521}

* SITES-17934 - Content Fragments - Preview fails due to DoS protection for large tree of fragments. See the [KB article about Default GraphQL Query Executor configuration options](https://experienceleague.adobe.com/en/docs/experience-cloud-kcs/kbarticles/ka-23945)

<!--

### Known issues for AEM Forms {#known-issues-aem-forms-6521}
-->

## OSGi bundles and content packages included{#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in this [!DNL Experience Manager] 6.5 Service Pack release:

* [List of OSGi bundles included in Experience Manager 6.5.21.0](/help/release-notes/assets/65210-bundles.txt) <!-- UPDATE FOR EACH NEW RELEASE -->
* [List of Content Packages included in Experience Manager 6.5.21.0](/help/release-notes/assets/65210-packages.txt) <!-- UPDATE FOR EACH NEW RELEASE -->

## Restricted websites{#restricted-sites}

These websites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact Adobe Customer Support](https://experienceleague.adobe.com/en/docs/customer-one/using/home).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] product page](https://business.adobe.com/products/experience-manager/adobe-experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/en/docs/experience-manager-65)
>* [Subscribe to Adobe Priority product updates](https://www.adobe.com/subscription/priority-product-update.html)

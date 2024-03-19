---
title: Release Notes for [!DNL Adobe Experience Manager] 6.5
description: Find release information, what's new, install how-tos, and a detailed change list for [!DNL Adobe Experience Manager] 6.5.
mini-toc-levels: 4
exl-id: a52311b9-ed7a-432e-8f35-d045c0d8ea4c
---
# [!DNL Adobe Experience Manager] 6.5 Latest Service Pack Release Notes {#aem-service-pack-release-notes}

<!-- For an itemized list of all issues found in these release notes, see the following spreadsheet: https://adobe-my.sharepoint.com/:x:/r/personal/anujkapo_adobe_com/_layouts/15/Doc.aspx?sourcedoc=%7B3ea81ae4-e605-4153-b132-f2698c86f84e%7D&action=edit&wdinitialsession=d8c7b903-87fc-4f2d-9ef2-542a82169570&wdrldsc=3&wdrldc=1&wdrldr=SessionMemoryQuotaExceededDuringSession -->

<!-- DO NOT DELETE THIS HIDDEN NOTE      DO NOT DELETE THIS HIDDEN NOTE
>[!NOTE]
>
>Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the add-on packages release Thursday, November 30, 2023. In addition, a list of Forms fixes and enhancements is added to this section. -->

## Release information {#release-information}

| Product | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.20.0 <!-- UPDATE FOR EACH NEW RELEASE -->                     |
| Type     | Service Pack release         |
| Date     | Thursday, February 22, 2024 <!-- UPDATE FOR EACH NEW RELEASE -->              |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.20.0.zip) <!-- UPDATE FOR EACH NEW RELEASE -->|

## What is included in [!DNL Experience Manager] 6.5.20.0 {#what-is-included-in-aem-6520}

[!DNL Experience Manager] 6.5.20.0 includes new features, key customer-requested enhancements, bug fixes, and performance, stability, and security improvements that have been released since the initial availability of 6.5 in April 2019. [Install this service pack](#install) on [!DNL Experience Manager] 6.5. 

<!-- UPDATE FOR EACH NEW RELEASE -->

## Key features and enhancements

<!-- * _6.5.20.0 REVIEWERS: WHAT ARE THE KEY FEATURES AND ENHANCEMENTS THAT YOU WANT TO HIGHLIGHT IN THIS RELEASE?_ -->

Some of the key features and enhancements in this release include the following:

* Dynamic Media now supports lossless HEIC image format for Apple iOS/iPadOS. See [fmt](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/http-protocol-reference/command-reference/r-is-http-fmt.html?lang=en) in the Dynamic Media Image Serving and Rendering API.

* Multisite Manager (MSM) now supports Experience Fragment structures including folders and subfolders, for efficient bulk rollout of Experience Fragments to Live Copies. 

### [!DNL Forms]

* **Transaction Reporting in AEM Forms on JEE**: Transaction reporting capability has been introduced for AEM Forms on JEE, enabling comprehensive recording of document transactions such as Conversions, Renditions, and Submissions. This enhancement boosts efficiency and facilitates better record-keeping. The feature is disabled by default. You can enable it from Admin UI.
* **Enhanced Security with ECDSA Support**: AEM Forms now offer robust support for the Elliptic Curve Digital Signature Algorithm (ECDSA) across both JEE and OSGi stacks. Users can now Sign, Certify, and Verify PDF documents with heightened security. Supported EC curve algorithms include:
  * ECDSA elliptic curve P256 with SHA256 digest algorithm
  * ECDSA elliptic curve P384 with SHA384 digest algorithm
  * ECDSA elliptic curve P512 with SHA512 digest algorithm
* **Seamless Compatibility with Windows 11 for Forms Designer**: AEM Forms Designer now supports Windows 11, ensuring smooth installation and operation. Users can confidently upgrade to Windows 11 without the hassle of reinstalling Forms Designer or worrying about compatibility issues, ensuring uninterrupted workflow.
* **Enhanced Accessibility with Custom "Caption" Role in AEM Forms Designer**: AEM Forms Designer now includes a custom accessibility role called "Caption," empowering users to create XDPs with personalized captioning elements. This feature enhances accessibility by letting users integrate custom captions into their document designs so they can improve inclusivity and user experience.

<!-- ### [!DNL Forms]

* text -->

<!-- UPDATE BELOW FOR EACH NEW RELEASE -->

## Fixed issues in Service Pack 20 {#fixed-issues}

### [!DNL Sites]{#sites-6520}

<!--#### Accessibility{#sites-accessibility-6520}

* text -->

#### Admin User Interface{#sites-adminui-6520}

* The `Workflow Title` field is marked with `*` as required, but there is no validation. (SITES-16491)

<!--#### Classic UI{#sites-classicui-6520}

* text -->

#### [!DNL Content Fragments]{#sites-contentfragments-6520}

* Nested configuration folders were no longer supported and content fragment model folders were no longer visible after upgrading to AEM 6.5.18 or to AEM 6.5.19. (SITES-18110)
* Some subfolders are not able to pick from inherited content fragment models. It must support folders without having a `jcr:content` property, even if the DAM folders created by way of the user interface have such a node. (SITES-17943)

#### [!DNL Content Fragments] - GraphQL API {#sites-graphql-api-6520}

<!-- REMOVED AS PER EMAIL FROM SAMEER DHAWAN FEBRUARY 19, 2024 * When upgrading AEM from 6.5.19.0 to 6.5.20.0, the path `/libs/cq/graphql/sites/graphiql` was getting deleted. (SITES-19530) CRITICAL -->
* When executing a GraphQL query to [filter results](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md#filtering) using optional variables, if a specific value is **not** provided for the optional variable, then the variable is ignored in the filter evaluation. (SITES-17051)

<!--#### [!DNL Content Fragments] - GraphQL Query Editor{#sites-graphql-query-editor-6520}

* text -->

#### [!DNL Content Fragments] - REST API{#sites-restapi-6520}

* With the upgrade of the `org.json` library, there was a change in how decimal numbers were deserialized. Before they were converted "by default" into Doubles and now into BigDecimals. Instead, the metadata property values, stored by way of the REST API, should get converted to Double from BigDecimal. (SITES-16857)

#### Core Backend{#sites-core-backend-6520}

* When Quick Publish of a Content Fragment is used, it continues loading and does not get published. That is, Quick Publish is not working for Content Fragments after a service pack upgrade from AEM 6.5.7 to AEM 6.5.17. When the user tried managed publish, it worked. However, when they tried Quick Publish, it was not getting published. Specifically, `com.day.cq.wcm.core.impl.reference.ActivationReferenceSearchBuilder` caused the system to thrash. (SITES-17311)
* Content fragments are not serializable with Jackson exporter: The page load breaks when there is a content fragment referred to in a page (uses Jackson exporter code) and any tag added to a content fragment. (SITES-18096) 

#### Core Components{#sites-core-components-6520}

* Installing CIF Core Components package on AEM causes `:type` value of existing components to change. The change means that they no longer render on pages that they have been added to. (SITES-17601)

#### Campaign integration{#sites-campaign-integration-6520}

* AEM was using an allowlist&ndash;also known as a `whitelist`&ndash;due to a vulnerability report. The allowlist was preventing customers from using needed functionality. (SITES-16822)

#### Experience Fragments{#sites-experiencefragments-6520}

* MSM for Experience Fragments now supports bulk-rollout to Experience Fragment content structures including folders and subfolders. (SITES-16004)

<!--#### Foundation Components (Legacy){#sites-foundation-components-legacy-6520}

* text

#### Launches{#sites-launches-6520}

* text -->

#### MSM - Live Copies{#sites-msm-live-copies-6520}

* An "`Is not modifiable`" exception is thrown when rolling out component. Specifically, an `org.apache.sling.servlets.post.impl.operations.ModifyOperation` exception is experienced during response processing. (SITES-18809)
* Unable to roll out changes to specific Live Copies of Experience Fragments. (SITES-17930)
* When a user adds an annotation to a component on a blueprint page, and then rolls it out, the annotation count on Live Copy is displayed incorrectly. (SITES-17099)
* The MSM Rollout button from parent page to child page is broken in the touch graphical user interface; when selected the following error is displayed: `Uncaught TypeError: _g.shared is undefined`. (SITES-16991)

#### Page Editor{#sites-pageeditor-6520}

* Forms Theme Editor preview is broken. When Preview is selected, only a loading icon is visible. (SITES-17164) 

### [!DNL Assets]{#assets-6520}

* Unable to validate rule-based fields in metadata editor helper and displays an error message "Missing required fields". (ASSETS-31396)
* After a PDF is moved to another location, the **[!UICONTROL View Page]** option disappears. (ASSETS-30538)
* Unable to select an image with read permissions. (ASSETS-32199)
* Unable to change card size in view settings. (ASSETS-31667)
* Upload fails while uploading .oft file type. (ASSETS-30109)
* When you try to add a custom metadata field as an additional column to the report, the checkboxes are not selected. (ASSETS-31671)
* Asset move operation does not work appropriately in Experience Manager Service Pack 16. (ASSETS-30598)

#### [!DNL Dynamic Media]{#assets-dm-6520}

* When an asset is uploaded to AEM, the `Update_asset` workflow is triggered. However, the workflow never finishes. The workflow only completes up to the product upload step. The next step is the Scene7 batch upload, but that process is not getting pulled into AEM. (ASSETS-30443)
* Need a better way to handle non-Dynamic Media videos gracefully in the Dynamic Media component. This issue was giving an exception instantiating `dynamicmedia_sly.js`. (ASSETS-31301)
* Preview works for all assets, adaptive video sets, and videos. However, it throws a 403 error for `.m3u8` files (which, incidentally, still work by way of public links). (ASSETS-31882)
* The `scene7SmartCropProcessingStatus` status corrected. Smart Crop video metadata used to show failure even when it was successful. (ASSETS-31255)

### [!DNL Forms]{#forms-6520}

<!--Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the AEM 6.5.20.0 Forms add-on package release is scheduled for Thursday, February 29, 2024. A list of Forms fixes and enhancements is added to this section post the release.-->

#### [!DNL Adaptive Forms]

* When a user tries to integrate AEM Forms to a mailing platform with an AEM published URL, AEM Forms does not add `method=post` while rendering the page. This issue occurs even though `POST` is set in the submit action with the URL. It causes the mailing platform to not recognize this as a form. (FORMS-12614)
* When a user selects the date field having a display pattern on AEM Form Service Pack 6.5.18.0, the user is not able to select the current date using the keyboard. (FORMS-12736)
* On AEM Forms Service Pack 6.5.17.0 and Service Pack 6.5.18.0, when a user switches between months in the calendar widget, the date picker component shows an extra row. (FORMS-11869)
* When a user clicks an image using the "Take a photo" in the Attachment component on an iOS device, all images are added to the folder with the same name. (FORMS-12224)
* When a user updates an existing option in a Radio button group, incorrect translation values are published. (FORMS-12575)
* When a user adds characters to an Adaptive Form on an Android&trade; device, the user can type more than the defined maximum number of characters in the Text field on focus out, on Android&trade; devices. However, it works when a user selects the HTML5 input type. (FORMS-12748)
* Due to matching labels Arial&reg; labelledby and Arial&reg; label, the screen readers are not able to distinguish between these two. To resolve the issue – the label "aria-labelledby" is replaced with "aria-describedby" for the form fields. (FORMS-12436)
* When an author uses the "Adaptive Forms - Embed (v2)" component to embed an Adaptive Form in their sites page and the embedded form contains a CAPTCHA component on it (CAPTCHA Service -> reCAPTCHA, Settings -> reCAPTCHA-v2), the site page does not render when the user tries to view the Site Page using "View as Published" on the author instance. The following error is shown as (FORMS-11859):
`Failed to construct 'URL': Invalid base URL at Object.renderRecaptcha`

* When a user tries to select the date using the date picker component, the value is not updated and shows NULL. (FORMS-12742, FORMS-12736)

* When a user upgrades to AEM Form Service Pack 6.5.19.0, after updating a new language to the existing dictionary it does not get merged with the "guideContainer" rows to add a locale to a form. (FORMS-12947)

* On AEM Forms Service Pack 6.5.19.0, the invoked webservice operation on Java&trade; 11 fails with the error (FORMS-12329):
  `java.lang.NoClassDefFoundError message:sun/misc/BASE64Decoder`

* When a user invokes "receive" operation for "EmailService" on AEM Forms Service Pack 6.5.18.0, an exception is thrown (FORMS-12050): 
  `java.util.ServiceConfigurationError: javax.mail.Provider: Provider com.sun.mail.imap.IMAPProvider not a subtype`

* When FIPS mode is enabled on AEM Forms Service Pack 6.5.18.0, creating a user under default DOM fails with the error (FORMS-11857): 
  `com.adobe.idp.cx.a: error seeding random number generator`

* When a user selects fonts in ADMINUI under the path `Home>Services>PDF Generator>Adobe PDF Settings`, it does not get selected. Moreover, in a standard or personalized profile, the list box of Fonts available is empty. As such, it is not possible to personalize the sublist of **Always embed** or **Never embed**. The user is unable to configure the font for their PDFs with PDF Generator. The logs do not show any relevant error messages. (FORMS-12095)

* On AEM Forms Service Pack 6.5.18.0, the user is unable to create security settings, it shows no error or server logs, but a pop-up error message is shown on the screen. (FORMS-12212)

* When a user on AEM Forms Service Pack 6.5.18.0 submits an Adaptive Form on the JEE workflow, the attachment in the Adaptive Form is not sent to the JEE process which causes application failure. (FORMS-12232, FORMS-12228)

* When a user converts PDF to PDF/A-2b or PDF/A-3B, it fails to convert, the error is shown as: (FORMS-12790)

  ```
  OCCD contains Order key that does not reference all layers.
  -> Optional content configuration dictionary has no Name entry.
  -> Font not embedded (and text rendering mode not 3).
  obj(65, 0)
  Page: 1
  -> Font not embedded (and text rendering mode not 3).
  obj(67, 0)
  Page: 1
  -> PDF/A entry missing. 
  -> PDF/A entry missing.
  ```

* On AEM Forms 6.5.18.0, When an Adaptive Form is published, all its dependencies, including policies, get republished, even if no modifications have been made to them. (FORMS-10454)

* When a user selects "Microsoft SharePoint" while running the configuration manager on AEM Forms 6.5.19.1 with JBoss&reg; Turnkey setup, the LiveCycle JBoss&reg; EAR installation fails, and it shows the following error: (FORMS-12463)

    ` Caused by: org.jboss.as.server.deployment.DeploymentUnitProcessingException: WFLYEE0031: Unable to process modules in application.xml for EAR ["/C:/AEM/jboss/bin/content/ adobe-livecycle-jboss.ear "], module file adobe-connectorformssharepoint-config-ejb.jar not found.`

* When a user creates a document fragment using the form data model in AEM Forms Service Pack 6.5.19.0, the variable names appear undefined on the side panel, but the variable names are shown when they are dropped onto the form panel or when they are clicked. (FORMS-13238)


#### [!DNL Forms Designer] {#forms-designer-6520}


* When a user upgrades to AEM Forms Service Pack 6.5.18.0, due to missing exception handling, XDPs passed through the output service with the tagged PDF option-enabled fail. (LC-3921757)

* When a user generates a PDF using AEM Forms Designer, heading levels are tagged in the accessibility tree along with the graphical element, for example, a rectangle box. (LC-3921687)

* On AEM Forms Designer installed via Workbench, the version information is not explicit in the `Control Panel/Programs/Programs and Features`. (LC-3921976)

<!--* When a user creates an XDP on AEM Forms Designer, the user is not able to add the custom Caption Tag. (LC-3921246)-->

* When a user creates an XDP on AEM Forms Designer, On PDF output, the Button Form tag is not nested in the parent paragraph tag (p-tag). (LC-3921719)

* When a user creates an XDP on AEM Forms Designer, On PDF output when a user navigates through the form tags, the background object is also tagged. (LC-3921687)

### Foundation {#foundation-6520}

#### Communities {#communities-6520}

* User sync diagnostics fail after successfully configuring user sync. (NPR-41693)

<!-- #### Content distribution{#foundation-content-distribution-6520}

* text -->

#### Integrations{#integrations-6520}

* Remove all code and dependencies of Adobe Search&Promote from AEM 6.5. (NPR-40856)

#### Localization{#localization-6520}

* Aria-label "close" is not localized in **[!UICONTROL Assets]** > **[!UICONTROL Files]**, select a folder, then on the toolbar, select **[!UICONTROL Properties]** > **[!UICONTROL Permissions]** tab > member name. (NPR-41705)
* There is a truncated tooltip for the **[!UICONTROL Key Store Password]** field on the SSL Setup page for locales ENG, FRA, KOR, DEU, and PTB. (NPR-41367)

#### Platform{#foundation-platform-6520}

* Issue with integrating Campaign with AEM caused by the /api servlet not returning the correct scheme in the href json. The reason was because AEM was not receiving the X-Forward-Proto header which forced the request to respond with an HTTP scheme instead of HTTPS. As such, the ability to toggle scheme selection based on an OSGI configuration should be added. (GRANITE-48454)

#### Sling{#foundation-sling-6520}

* The `org.apache.sling.resourceMerger` bundle 1.4.2 throws an exception from AEM 6.5, Service Pack 17 and later. The Sling resource merger 1.4.4 should be included in Service Pack 20. (NPR-41630)

#### Translation{#foundation-translation-6520}

* Following deployment of AEM 6.5 Service Pack 18, there was an issue with the Filters tab in the Translation Rules Editor. When a Context is selected, clicking Edit > Save, a double-quote as HTML character appears the next time you open the same Context. Essentially, translation rules were not getting saved correctly. (NPR-41624)
* Issues related to Content Fragment translations, where the translated strings are being sent back from the translation provider to AEM, but they are stuck at the `/content/projects` level and not updating the Content Fragments. (NPR-41516)
* An error message is displayed when creating a language copy. It occurs on a page that has a content fragment referenced in a page property, using content fragment models. (NPR-41441)
* Links in Experience Fragments are not adjusted to the correct language during Language Copy. Instead, the Experience Fragment points to the primary locale. (NPR-41343)

#### User interface{#foundation-ui-6520}

* Console error is experienced after an upgrade to AEM 6.5, Service Pack 18. The error is in the `coralUI3.js` file and it occurs when you select any drop-down in AEM. Specifically, it happens with an `onOverlayToggle` event. The error `Uncaught TypeError: Cannot read properties of null (reading 'innerText')` is displayed. (NPR-41467)
* In AEM, **[!UICONTROL Tools]** > **[!UICONTROL General]** > **[!UICONTROL Tagging]** > **[!UICONTROL Create]** > **[!UICONTROL Create Tag]**, entering non-latin characters in the **Title** field causes the **Name** field to be filled with just the hyphen character ( `-` ). (NPR-41623)
* Copyright year is incorrect in the `About Adobe Experience Manager` dialog box. (NPR-41526)
* There are untranslated **[!UICONTROL Profile Properties]** strings when editing user settings. Occurs in all locales. (NPR-41365)

<!-- #### WCM{#wcm-6520}

* text

#### Workflow{#foundation-workflow-6520}

* text -->

## Install [!DNL Experience Manager] 6.5.20.0{#install}

<!-- Remaining content from here to bottom stays the same except for version updating as needed as per update team feedback. -->

* [!DNL Experience Manager] 6.5.20.0 requires [!DNL Experience Manager] 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions. <!-- UPDATE FOR EACH NEW RELEASE -->
* The service pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.20.0.zip).
* On a deployment with MongoDB and multiple instances, install [!DNL Experience Manager] 6.5.20.0 on one of the Author instances using the Package Manager.<!-- UPDATE FOR EACH NEW RELEASE -->

>[!IMPORTANT]
>
> Adobe does not recommend that you remove or uninstall the [!DNL Experience Manager] 6.5.20.0 package. As such, before you install the pack, you should create a backup of the `crx-repository` in case you must roll it back. <!-- UPDATE FOR EACH NEW RELEASE -->
<!-- For instructions to install Service Pack for Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md). -->


### Install the service pack on [!DNL Experience Manager] 6.5{#install-service-pack}

1. Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the service pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.20.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->

1. Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package, then select **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>Dialog on Package Manager UI sometimes exits during the installation of the service pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installation is successful. Typically, this issue occurs in the [!DNL Safari] browser but can intermittently occur on any browser.

**Automatic installation**

There are two different methods that you can use to automatically install [!DNL Experience Manager] 6.5.20.0.<!-- UPDATE FOR EACH NEW RELEASE -->

* Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.
* Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Experience Manager 6.5.20.0 does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->

**Validate the installation**

To know the platforms that are certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.20.0)` under [!UICONTROL Installed Products]. <!-- UPDATE FOR EACH NEW RELEASE -->

1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.18 or later (Use Web Console: `/system/console/bundles`). <!-- OAK Oak oak VERSION -MAY- NEED TO BE UPDATED FOR EACH NEW RELEASE -->

### Install Service Pack for [!DNL Experience Manager] Forms{#install-aem-forms-add-on-package}

For instructions to install the service pack on Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md).

>[!NOTE]
>
>The Adaptive Forms feature, available in [AEM 6.5 QuickStart](https://experienceleague.adobe.com/docs/experience-manager-65/content/implementing/deploying/deploying/deploy.html), is designed for exploration and evaluation purposes only. For production use, it is essential to obtain a valid license for AEM Forms, as Adaptive Forms functionality requires proper licensing.

### Install GraphQL Index Package for Experience Manager Content Fragments{#install-aem-graphql-index-add-on-package}

Customers using GraphQL must install the [Experience Manager Content Fragment with GraphQL Index Package 1.1.1](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/cfm-graphql-index-def-1.1.1.zip). 

Doing so lets you add the required index definition based on the features they actually use.

Failure to install this package may result in slow or failed GraphQL queries.

>[!NOTE]
>
>Only install this package once per instance; it does not need to be reinstalled with every Service Pack.

### UberJar{#uber-jar}

The UberJar for [!DNL Experience Manager] 6.5.20.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.20/). <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM: <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

  ```shell
    <dependency>
    <groupId>com.adobe.aem</groupId>
    <artifactId>uber-jar</artifactId>
    <version>6.5.20</version>
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

* When trying to move, delete, or publish either Content Fragments, Sites, or Pages, there is an issue when Content Fragment references are fetched, as the background query fails. That is, the functionality does not work.
  To ensure correct operation, you must add the following properties to the index definition node `/oak:index/damAssetLucene` (no reindexing is required):

   ```xml
   "tags": [
       "visualSimilaritySearch"
     ]
   "refresh": true
   ```

* If you upgrade your [!DNL Experience Manager] instance from 6.5.0 - 6.5.4 to the latest service pack on Java&trade; 11, you see `RRD4JReporter` exceptions in the `error.log` file. To stop the exceptions, restart your instance of [!DNL Experience Manager]. <!-- THIS BULLET POINT WAS UPDATED AS PER CQDOC-20021, JANUARY 23, 2023 --> 

* Users can rename a folder in a hierarchy in [!DNL Assets] and publish a nested folder to [!DNL Brand Portal]. However, the title of the folder is not updated in [!DNL Brand Portal] until the root folder is republished.

* The following errors and warning messages may be displayed during installation of [!DNL Experience Manager] 6.5.x.x:
  * "When the Adobe Target integration is configured in [!DNL Experience Manager] using the Target Standard API (IMS authentication), then exporting Experience Fragments to Target results in wrong offer types getting created. Instead of type "Experience Fragment"/source "Adobe Experience Manager," Target creates several offers with type "HTML"/source "Adobe Target Classic."
  * `com.adobe.granite.maintenance.impl.TaskScheduler`: No maintenance windows found at granite/operations/maintenance.
  * Adaptive Form server-side validation fails when aggregate functions such as SUM, MAX, and MIN are used (CQ-4274424).
  * `com.adobe.granite.maintenance.impl.TaskScheduler` - No maintenance windows found at granite/operations/maintenance.
  * The hotspot in a Dynamic Media interactive image is not visible when previewing the asset through the Shoppable Banner viewer.
  * `com.adobe.cq.social.cq-social-jcr-provider bundle com.adobe.cq.social.cq-social-jcr-provider:1.3.5 (395)[com.adobe.cq.social.provider.jcr.impl.SpiSocialJcrResourceProviderImpl(2302)]` : Timeout waiting for register change to complete unregistered.

* Starting with AEM 6.5.15, the Rhino JavaScript Engine provided by the ```org.apache.servicemix.bundles.rhino``` bundle has a new hoisting behavior. Scripts that use the strict mode (```use strict;```) have to correctly declare their variables, otherwise they do not get run, instead throwing a runtime error.
 

### Known issues for AEM Forms {#known-issues-aem-forms-6520}

* The prefill service fails with a null pointer exception in Interactive Communications. (CQDOC-21355)
* Adaptive Forms let you use custom functions with ECMAScript version 5 or earlier. When a custom function uses ECMAScript version 6 or later, like 'let', 'const', or arrow functions, the rule editor might not open properly.
* Users are unable to create a Correspondence Management letter. When a user creates a letter an error with description “Object Object” appears and the letter is not created. Thumbnails for layouts also fail to load on the letter creation screen. You can install the [latest AEM 6.5 Form Service Pack 20 (6.5.20.0)](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html) to resolve the issue. (FORMS-13496)
* The interactive communications service creates the PDF document, but the user's data is not automatically populated in the form fields. The prefill service is not working as expected. You can install the [latest AEM 6.5 Form Service Pack 20 (6.5.20.0)](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html) to resolve the issue. (FORMS-13413, FORMS-13493)
* The Review and Correct (RnC) editor of automated forms conversion service fails to load. You can install the [latest AEM 6.5 Form Service Pack 20 (6.5.20.0)](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html) to resolve the issue. (FORMS-13491)
* After updating from AEM 6.5 Forms Service Pack 18 (6.5.18.0) or AEM 6.5 Forms Service Pack 19 (6.5.19.0) to AEM 6.5 Forms Service Pack 20 (6.5.20.0), users encounter a JSP compilation error. They cannot open or create adaptive forms and they’re running into errors with other AEM interfaces like the page editor, AEM Forms UI, and AEM Workflow editor. You can install the [latest AEM 6.5 Form Service Pack 20 (6.5.20.0)](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html) to resolve the issue. (FORMS-13492)

<!--Customers can install the  latest AEM 6.5 Forms Service Pack to resolve the aforementioned issues.  Here are the direct links for the supported operating systems:
* [AEM 6.5 Forms Service Pack 20 for Apple macOS](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/ADOBE-AEMFD-OSX-PKG-6.0.1192.zip)
* [AEM 6.5 Forms Service Pack 20 for Microsoft Windows](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/ADOBE-AEMFD-WIN-PKG-6.0.1192.zip)
* [AEM 6.5 Forms Service Pack 20 for Linux](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/ADOBE-AEMFD-LINUX-PKG-6.0.1192.zip)
-->

<!--Known issues in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the AEM 6.5.20.0 Forms add-on package release is scheduled for Thursday, February 29, 2024. A list of known issues for forms is added to this section post the release.-->

<!--
#### Install the servlet fragment (AEM Service Pack 6.5.14.0 or earlier)

* If you are upgrading to AEM Service Pack 6.5.15.0 or higher, and your AEM instance is operating on Tomcat 8.5.88, it is mandatory that you install the servlet fragment *before* you proceed with the installation of Service Pack 6.5.15.0 or higher.
* It is mandatory that you install the servlet fragment for all application servers except those running on JBoss&reg; EAP 7.4.0.

**To install the servlet fragment:**

1. Download the servlet fragment from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/org.apache.felix.http.servlet-api-1.2.0_fragment_full.jar).
1. Start the application server. 
1. Wait for the logs to stabilize and check the bundle state.
1. Open Web Console Bundles. The default URL is `http://[Server]:[Port]/system/console/bundles`.
1. Select **[!UICONTROL Install]** or **[!UICONTROL Update]**. 
1. Select the downloaded fragment 
`org.apache.felix.http.servlet-api-1.2.0_fragment_full.jar` 
1. Select **[!UICONTROL Install]** or **[!UICONTROL Update]**. 
1. Wait for the application server to stabilize.
1. Stop the application server.

-->

## OSGi bundles and content packages included{#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in this [!DNL Experience Manager] 6.5 Service Pack release:

* [List of OSGi bundles included in Experience Manager 6.5.20.0](/help/release-notes/assets/65200-bundles.txt) <!-- UPDATE FOR EACH NEW RELEASE -->
* [List of Content Packages included in Experience Manager 6.5.20.0](/help/release-notes/assets/65200-packages.txt) <!-- UPDATE FOR EACH NEW RELEASE -->

## Restricted websites{#restricted-sites}

These websites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact Adobe Customer Support](https://experienceleague.adobe.com/docs/customer-one/using/home.html).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] product page](https://business.adobe.com/products/experience-manager/adobe-experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/docs/experience-manager-65.html)
>* [Subscribe to Adobe priority product updates](https://www.adobe.com/subscription/priority-product-update.html)

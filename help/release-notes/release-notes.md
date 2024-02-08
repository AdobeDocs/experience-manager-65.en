---
title: Release Notes for [!DNL Adobe Experience Manager] 6.5
description: Find release information, what's new, install how-tos, and a detailed change list for [!DNL Adobe Experience Manager] 6.5.
mini-toc-levels: 4

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
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.19.0.zip) <!-- UPDATE FOR EACH NEW RELEASE -->|

## What is included in [!DNL Experience Manager] 6.5.20.0 {#what-is-included-in-aem-6520}

[!DNL Experience Manager] 6.5.20.0 includes new features, key customer-requested enhancements, bug fixes, and performance, stability, and security improvements that have been released since the initial availability of 6.5 in April 2019. [Install this service pack](#install) on [!DNL Experience Manager] 6.5. 

<!-- UPDATE FOR EACH NEW RELEASE -->

<!-- Some of the key features and improvements are the following:

* _REVIEWERS: WHAT ARE THE KEY FEATURES AND ENHANCEMENTS YOU WANT TO HIGHLIGHT IN THIS RELEASE?_ -->

## Key features and enhancements

Some of the key features and enhancements in this release include the following:


<!-- ### [!DNL Forms]

* text -->


<!-- UPDATE BELOW FOR EACH NEW RELEASE -->

## Fixed issues in Service Pack 20 {#fixed-issues}

### [!DNL Sites]{#sites-6520}

<!--#### Accessibility{#sites-accessibility-6520}

* text -->

#### Admin User Interface{#sites-adminui-6520}

* The `Workflow Title` field is marked with `*` as required, but there is no validation. (SITES-16491) NORMAL

<!--#### Classic UI{#sites-classicui-6520}

* text -->

#### [!DNL Content Fragments]{#sites-contentfragments-6520}

* Nested configuration folders were no longer supported and content fragment model folders were no longer visible after upgrading to AEM 6.5.18 or to AEM 6.5.19. (SITES-18110) MAJOR
* Some subfolders are not able to pick from inherited content fragment models. It must support folders without having a `jcr:content` property, even if the DAM folders created by way of the user interface have such a node. (SITES-17943) NORMAL

#### [!DNL Content Fragments] - GraphQL API {#sites-graphql-api-6520}

* When upgrading AEM from 6.5.19.0 to 6.5.20.0, the path `/libs/cq/graphql/sites/graphiql` was getting deleted. (SITES-19530) CRITICAL
* When executing a GraphQL query to [filter results](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md#filtering) using optional variables, if a specific value is **not** provided for the optional variable, then the variable is ignored in the filter evaluation. (SITES-17051) NORMAL

<!--#### [!DNL Content Fragments] - GraphQL Query Editor{#sites-graphql-query-editor-6520}

* text -->

#### [!DNL Content Fragments] - REST API{#sites-restapi-6520}

* With the upgrade of the `org.json` library, there was a change in how decimal numbers were deserialized. Before they were converted "by default" into Doubles and now into BigDecimals. Instead, the metadata property values, stored by way of the REST API, should get converted to Double from BigDecimal. (SITES-16857) NORMAL

#### Core Backend{#sites-core-backend-6520}

* When Quick Publish of a Content Fragment is used, it continues loading and does not get published. That is, Quick Publish is not working for Content Fragments after a service pack upgrade from AEM 6.5.7 to AEM 6.5.17. When the user tried managed publish, it worked. However, when they tried Quick Publish, it was not getting published. Specifically, `com.day.cq.wcm.core.impl.reference.ActivationReferenceSearchBuilder` caused the system to thrash. (SITES-17311) MAJOR
* Content fragments are not serializable with Jackson exporter: The page load breaks when there is a content fragment referred to in a page (uses Jackson exporter code) and any tag added to a content fragment. (SITES-18096) NORMAL 

#### Core Components{#sites-core-components-6520}

* Installing CIF Core Components package on AEM causes `:type` value of existing components to change. The change means that they no longer render on pages that they have been added to. (SITES-17601) MAJOR

#### Campaign integration{#sites-campaign-integration-6520}

* AEM was using an allowlist&ndash;also known as a whitelist&ndash;due to a vulnerability report. The allowlist was preventing customers from using needed functionality. (SITES-16822) CRITICAL

#### Experience Fragments{#sites-experiencefragments-6520}

* Make available MSM for Experience Fragments capability on AEM 6.5. (SITES-16004) MAJOR

<!--#### Foundation Components (Legacy){#sites-foundation-components-legacy-6520}

* text

#### Launches{#sites-launches-6520}

* text -->

#### MSM - Live Copies{#sites-msm-live-copies-6520}

* An "`Is not modifiable`" exception is thrown when rolling out component. Specifically, an `org.apache.sling.servlets.post.impl.operations.ModifyOperation` exception is experienced during response processing. (SITES-18809) MAJOR
* Unable to roll out changes to specific Live Copies of Experience Fragments. (SITES-17930) MAJOR
* When a user adds an annotation to a component on a blueprint page, and then rolls it out, the annotation count on Live Copy is displayed incorrectly. (SITES-17099) MAJOR
* The MSM Rollout button from parent page to child page is broken in the touch graphical user interface; when selected the following error is displayed: `Uncaught TypeError: _g.shared is undefined`. (SITES-16991) MAJOR

#### Page Editor{#sites-pageeditor-6520}

* Forms Theme Editor preview is broken. When Preview is selected, only a loading icon is visible. (SITES-17164) BLOCKER 

### [!DNL Assets]{#assets-6520}

* Unable to validate rule-based fields in metadata editor helper and displays an error message "Missing required fields". (ASSETS-31396) MAJOR
* After a PDF is moved to another location, the **[!UICONTROL View Page]** option disappears. (ASSETS-30538) MAJOR
* Unable to select an image with read permissions. (ASSETS-32199) NORMAL
* Unable to change card size in view settings. (ASSETS-31667) NORMAL
* Upload fails while uploading .oft file type. (ASSETS-30109) NORMAL
* When you try to add a custom metadata field as an additional column to the report, the checkboxes are not selected. (ASSETS-31671) MINOR
* Asset move operation does not work appropriately in Experience Manager Service Pack 16. (ASSETS-30598) MINOR

#### [!DNL Dynamic Media]{#assets-dm-6520}

* When an asset is uploaded to AEM, the `Update_asset` workflow is triggered. However, the workflow never finishes. The workflow only completes up to the product upload step. The next step is the Scene7 batch upload, but that process is not getting pulled into AEM. (ASSETS-30443) CRITICAL
* Need a better way to handle non Dynamic Media videos gracefully in the Dynamic Media component. This issue was giving an exception instantiating `dynamicmedia_sly.js`. (ASSETS-31301) MAJOR
* Preview works for all assets, adaptive video sets, and videos. However, it throws a 403 error for `.m3u8` files (which, incidentally, still work by way of public links). (ASSETS-31882) MAJOR
* The `scene7SmartCropProcessingStatus` status corrected. Smart Crop video metadata used to show failure even when it was successful. (ASSETS-31255) MINOR

### [!DNL Forms]{#forms-6520}

#### [!DNL Adaptive Forms]

<!-- Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the AEM 6.5.19.0 Forms add-on package release is scheduled for Thursday, November 30, 2023. A list of Forms fixes and enhancements would be added to this section post the release.-->

<!--* Adding Access Control List for `fd-cloudservice` user to be able to read or update the Microsoft&reg; configurations under `cloudconfigs/microsoftoffice`. (FORMS-11142) -->

<!--LEFT BULLET LIST HERE IN CASE OF REUSE BY FORMS IN THE FUTURE 
* **Document Services**
  * text
* **Adaptive Forms** 
  * text
* **Accessibility**
  * text
* **Interactive Communications**
  * text -->

<!--### Commerce{#commerce-6520}

* text -->

#### [!DNL Forms Designer]{#forms-designer-6520}

* text

<!-- ### Foundation{#foundation-6520}

* text -->

#### Communities {#communities-6520}

* User sync diagnostics fail after successfully configuring user sync. (NPR-41693) NORMAL

<!-- #### Content distribution{#foundation-content-distribution-6520}

* text -->

#### Integrations{#integrations-6520}

* Remove all code and dependencies of Adobe Search&Promote from AEM 6.5. (NPR-40856) NORMAL

#### Localization{#localization-6520}

* Aria-label "close" is not localized in **[!UICONTROL Assets]** > **[!UICONTROL Files]**, select a folder, then on the toolbar, select **[!UICONTROL Properties]** > **[!UICONTROL Permissions]** tab > member name. (NPR-41705) MAJOR
* There is a truncated tooltip for the **[!UICONTROL Key Store Password]** field on the SSL Setup page for locales ENG, FRA, KOR, DEU, and PTB. (NPR-41367) NORMAL

<!-- #### Oak{#oak-6520}

* text -->

#### Platform{#foundation-platform-6520}

* Issue with integrating Campaign with AEM caused by the /api servlet not returning the correct scheme in the href json. The reason was because AEM was not receiving the X-Forward-Proto header which forced the request to respond with an HTTP scheme instead of HTTPS. As such, the ability to toggle scheme selection based on an OSGI configuration should be added. (GRANITE-48454) MAJOR

<!-- #### Replication{#foundation-replication-6520}

* text -->

#### Sling{#foundation-sling-6520}

* The `org.apache.sling.resourceMerger` bundle 1.4.2 throws an exception from AEM 6.5, Service Pack 17 and later. The Sling resource merger 1.4.4 should be included in Service Pack 20. (NPR-41630) NORMAL

#### Translation{#foundation-translation-6520}

* Following deployment of AEM 6.5 Service Pack 18, there was an issue with the Filters tab in the Translation Rules Editor. When a Context is selected, clicking Edit > Save, a double-quote as HTML character appears the next time you open the same Context. Essentially, translation rules were not getting saved correctly. (NPR-41624) MAJOR
* Issues related to Content Fragment translations, where the translated strings are being sent back from the translation provider to AEM, but they are stuck at the `/content/projects` level and not updating the Content Fragments. (NPR-41516) MAJOR
* An error message is displayed when creating a language copy. It occurs on a page that has a content fragment referenced in a page property, using content fragment models. (NPR-41441) MAJOR
* Links in Experience Fragments are not adjusted to the correct language during Language Copy. Instead, the Experience Fragment points to the master locale. (NPR-41343) NORMAL

#### User interface{#foundation-ui-6520}

* Console error is experienced after an upgrade to AEM 6.5, Service Pack 18. The error is in the `coralUI3.js` file and it occurs when you select any drop-down in AEM. Specifically, it happens with an `onOverlayToggle` event. The error `Uncaught TypeError: Cannot read properties of null (reading 'innerText')` is displayed. (NPR-41467) MAJOR
* In AEM, **[!UICONTROL Tools]** > **[!UICONTROL General]** > **[!UICONTROL Tagging]** > **[!UICONTROL Create]** > **[!UICONTROL Create Tag]**, entering non-latin characters in the **Title** field causes the **Name** field to be filled with just the hyphen character ( `-` ). (NPR-41623) NORMAL
* Copyright year is incorrect in the `About Adobe Experience Manager` dialog box. (NPR-41526) NORMAL
* There are untranslated **[!UICONTROL Profile Properties]** strings when editing user settings. Occurs in all locales. (NPR-41365) NORMAL

<!-- #### WCM{#wcm-6520}

* text

#### Workflow{#foundation-workflow-6520}

* text -->

## Install [!DNL Experience Manager] 6.5.20.0{#install}

<!-- Remaining content from here to bottom stays the same except for version updating as needed as per update team feedback. -->

* [!DNL Experience Manager] 6.5.20.0 requires [!DNL Experience Manager] 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions. <!-- UPDATE FOR EACH NEW RELEASE -->
* The service pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.19.0.zip).
* On a deployment with MongoDB and multiple instances, install [!DNL Experience Manager] 6.5.20.0 on one of the Author instances using the Package Manager.<!-- UPDATE FOR EACH NEW RELEASE -->

>[!IMPORTANT]
>
> Adobe does not recommend that you remove or uninstall the [!DNL Experience Manager] 6.5.20.0 package. As such, before you install the pack, you should create a backup of the `crx-repository` in case you must roll it back. <!-- UPDATE FOR EACH NEW RELEASE -->
<!-- For instructions to install Service Pack for Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md). -->


### Install the service pack on [!DNL Experience Manager] 6.5{#install-service-pack}

1. Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the service pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.19.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->

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

1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.17 or later (Use Web Console: `/system/console/bundles`). <!-- NPR-41292 for 6.5.19.0 --> <!-- OAK Oak oak VERSION -MAY- NEED TO BE UPDATED FOR EACH NEW RELEASE -->

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

The UberJar for [!DNL Experience Manager] 6.5.20.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.19/). <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

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
 
### Known issues for AEM Forms

#### Supported platforms 

* JDK 11.0.20 is not supported to install AEM Forms on JEE Installer. Only JDK 11.0.19 or earlier versions are supported to install AEM Forms on JEE Installer. (FORMS-10659)

#### Installation 

* On JBoss&reg; 7.1.4 platform, when user installs Experience Manager 6.5.16.0 or later service pack, `adobe-livecycle-jboss.ear` deployment fails. (CQ-4351522, CQDOC-20159)

<!-- 
* After upgrading to AEM Forms 6.5.18.0 JBoss&reg; Turnkey full installer environment on Windows Server 2022, when compiling Output client application code using Java&trade; 11, the following compilation error may occur:
  
  ```
  error: error reading [AEM_Forms_Installation_dir]\sdk\client-libs\common\adobe-output-client.jar; java.net.URISyntaxException: 
  Illegal character in path at index 70: file:/[AEM_Forms_Installation_dir]/sdk/client-libs/common/${clover.jar.name} 1 error
  
  ```
  
  To resolve the issue, perform the following steps:
    1. Navigate to `[AEM_Forms_Installation_dir]\sdk\client-libs\common\` and unzip `adobe-output-client.jar` to extract the `Manifest.mf` file.
    1. Update the `Manifest.mf` file by removing the entry `${clover.jar.name}` from the class-path attribute. 

        >[!NOTE]
        >
        > You can also use an in-place editing tool, for example, 7-zip, to update the `Manifest.mf` file.  

    1. Save the updated the `Manifest.mf` in the `adobe-output-client.jar` archive. 
    1. Save the modified `adobe-output-client.jar` file and rerun the setup. (CQDOC-20878) -->

* After installing AEM Service Pack 6.5.20.0 full installer, the EAR deployment fails on JEE using JBoss&reg; Turnkey. <!-- UPDATE FOR EACH NEW RELEASE -->
To resolve the issue, locate the `<AEM_Forms_Installation_dir>\jboss\bin\standalone.bat` file and update `Adobe_Adobe_JAVA_HOME` to `Adobe_JAVA_HOME` for all occurrences before running the configuration manager. (CQDOC-20803)

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

#### Adaptive Forms

* When an Adaptive Form is published, all its dependencies, including policies, get republished, even if no modifications have been made to them. (FORMS-10454)
* When a user selects to configure a field for the first time in an adaptive form, the option to save a configuration does not display in Properties Browser. Selecting to configure some other field of the Adaptive Form in the same editor resolves the issue. 
* When users perform the submit action, the submission fails with an error: 
`javax.servlet.ServletException: java.lang.NoSuchMethodError`
To resolve the issue, [recompile the Sling scripts such as JSP, Java&trade;, and Sightly](https://experienceleague.adobe.com/docs/experience-cloud-kcs/kbarticles/KA-16543.html#resolution). (FORMS-8542)
* After installing AEM Service Pack 6.5.14.0 and onwards, users are unable to select a font from the JEE Admin UI for PDF documents when navigating to `Home` > `Services` > `PDF Generator` > `Adobe PDF Settings`, as the font list appears empty. (FORMS-12095)
<!-- When a form is signed using the OOTB Scribble Signature component, it appears in the image dialogue but does not preview and appears blank when you click on it. (FORMS-12073). A hotfix is available for this issue. To download and install the hotfix, see [Adobe Experience Manager Forms Hotfixes](/help/release-notes/aem-forms-hotfix.md) -->
* On AEM Forms on JEE, the HTML5 Forms that make use of the context path, fail to render. (FORMS-12485, FORMS-12691). A hotfix is available for this issue. To download and install the hotfix, see [Adobe Experience Manager Forms Hotfixes](/help/release-notes/aem-forms-hotfix.md).

#### AEM Forms on JEE 

* Critical security vulnerabilities have been reported for Struts 2 RCE, a popular and open-source web application framework for developing Java&trade; EE web applications. Adobe has released [AEM 6.5 Service Pack 19.1 (6.5.19.1)](/help/forms/using/mitigating-struts-2-rce-vulnerabilities-for-experience-manager-manager-form.md) to address the vulnerability in AEM Forms on JEE. 

<!--The font enumeration fails due to the missing Ps2Pdf service file.-->

## OSGi bundles and content packages included{#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in [!DNL Experience Manager] 6.5.20.0: <!-- UPDATE FOR EACH NEW RELEASE -->

* [List of OSGi bundles included in Experience Manager 6.5.20.0](/help/release-notes/assets/65190_bundles.txt) <!-- UPDATE FOR EACH NEW RELEASE -->
* [List of Content Packages included in Experience Manager 6.5.20.0](/help/release-notes/assets/65190_packages.txt) <!-- UPDATE FOR EACH NEW RELEASE -->

## Restricted websites{#restricted-sites}

These websites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact Adobe Customer Support](https://experienceleague.adobe.com/docs/customer-one/using/home.html).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] product page](https://business.adobe.com/products/experience-manager/adobe-experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/docs/experience-manager-65.html)
>* [Subscribe to Adobe priority product updates](https://www.adobe.com/subscription/priority-product-update.html)

---
title: Release Notes for [!DNL Adobe Experience Manager] 6.5
description: Find release information, what's new, install how-tos, and a detailed change list for [!DNL Adobe Experience Manager] 6.5.
mini-toc-levels: 4
solution: Experience Manager
feature: Release Information
role: User,Admin,Architect,Developer

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
| Version  | 6.5.21.0 <!-- UPDATE FOR EACH NEW RELEASE -->                     |
| Type     | Service Pack release         |
| Date     | Thursday, May 23, 2024 <!-- UPDATE FOR EACH NEW RELEASE -->              |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.20.0.zip) <!-- UPDATE FOR EACH NEW RELEASE -->|

## What is included in [!DNL Experience Manager] 6.5.21.0 {#what-is-included-in-aem-6521}

[!DNL Experience Manager] 6.5.21.0 includes new features, key customer-requested enhancements, bug fixes, and performance, stability, and security improvements that have been released since the initial availability of 6.5 in April 2019. [Install this service pack](#install) on [!DNL Experience Manager] 6.5. 

<!-- UPDATE FOR EACH NEW RELEASE -->

## Key features and enhancements

<!-- * _6.5.21.0 REVIEWERS: WHAT ARE THE KEY FEATURES AND ENHANCEMENTS THAT YOU WANT TO HIGHLIGHT IN THIS RELEASE?_ -->

Some of the key features and enhancements in this release include the following:

* D

### [!DNL Forms]

* A

<!-- UPDATE BELOW FOR EACH NEW RELEASE -->

## Fixed issues in Service Pack 21 {#fixed-issues}

### [!DNL Sites]{#sites-6521}

#### Accessibility{#sites-accessibility-6521}

* T

#### Admin User Interface{#sites-adminui-6521}

* When you click **[!UICONTROL Sites]** > **[!UICONTROL Core Core Components]** > **[!UICONTROL Properties]** > **[!UICONTROL Permissions]** tab > **[!UICONTROL Effective Permission]**, the **Effective Permissions** dialog box does not open in. (SITES-17378)  

#### Classic UI{#sites-classicui-6521}

* T

#### [!DNL Content Fragments]{#sites-contentfragments-6521}

* Fixed the double inclusion of the form elements. (SITES-21109)  BLOCKER
* When creating a Content Fragment, the Close button sometimes becomes unresponsive, causing the entire page to freeze and necessitating a page refresh to close the Content Fragment. As for the version creation issue, the system is creating a new version of a Content Fragment even when the user has not made any changes, simply by interacting with the RTE or a text field. (SITES-21187)  MAJOR


#### [!DNL Content Fragments] - GraphQL API {#sites-graphql-api-6521}

* While upgrading Adobe Experience Manager from 6.5.19.0 to 6.5.20.0, the path `/libs/cq/graphql/sites/graphiql` was getting deleted. (SITES-20098)  CRITICAL




#### [!DNL Content Fragments] - GraphQL Query Editor{#sites-graphql-query-editor-6521}

* W

#### [!DNL Content Fragments] - REST API{#sites-restapi-6521}

* W

#### Core Backend{#sites-core-backend-6521}

* W

#### Core Components{#sites-core-components-6521}

* I


#### Campaign integration{#sites-campaign-integration-6521}

* A

#### Experience Fragments{#sites-experiencefragments-6521}

* Rollout of Experience Fragments from `masters/language` to `country/language` does not update cross references. (SITES-20559)  BLOCKER 
* Templates not only specified in the `cq:allowedTemplates`, but templates that have `allowedPaths` configured at the template level, appear as options when creating a new Experience Fragment. (SITES-20855)  MAJOR

#### Foundation Components (Legacy){#sites-foundation-components-legacy-6521}

* T

#### Launches{#sites-launches-6521}

* The `sourceRootResource` configured in the Launch configuration within CRXDE Lite points to content that no longer exists, leading to a malfunction when attempts are made to delete launches. You should be able to delete launches even if the page is deleted or if the path is not the same. (SITES-20750)

#### MSM - Live Copies{#sites-msm-live-copies-6521}

* Overlayed the Page component to add tabs in page properties. One of them is page configuration and has a property to add an Experience Fragment URL. The link configured in the page properties for the Experience Fragment does not change for any language copies created for that page. The configured link should change with the language copy URL. (SITES-19580)  MAJOR

#### Page Editor{#sites-pageeditor-6521}

* The edit mode applies a grey background inconsistently, which fails to comply with the WCAG (Web Content Accessibilty Guidelines) color contrast standards. (SITES-20060)

### [!DNL Assets]{#assets-6521}

* U

#### [!DNL Dynamic Media]{#assets-dm-6521}

* Effective May 1, 2024, Adobe Dynamic Media is ending support for the following:
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

<!--Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the AEM 6.5.21.0 Forms add-on package release is scheduled for Thursday, May 30, 2024. A list of Forms fixes and enhancements is added to this section post the release.-->

#### [!DNL Adaptive Forms]

* W

#### [!DNL Forms Designer] {#forms-designer-6521}

* W

### Foundation {#foundation-6521}

#### Communities {#communities-6521}

* U

#### Content distribution{#foundation-content-distribution-6521}

* T

#### Integrations{#integrations-6521}

* R

#### Localization{#localization-6521}

* A

#### Platform{#foundation-platform-6521}

* I

#### Sling{#foundation-sling-6521}

* T

#### Translation{#foundation-translation-6521}

* F

#### User interface{#foundation-ui-6521}

* C

#### WCM{#wcm-6521}

* T

#### Workflow{#foundation-workflow-6521}

* T

## Install [!DNL Experience Manager] 6.5.21.0{#install}

<!-- Remaining content from here to bottom stays the same except for version updating as needed as per update team feedback. -->

* [!DNL Experience Manager] 6.5.21.0 requires [!DNL Experience Manager] 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions. <!-- UPDATE FOR EACH NEW RELEASE -->
* The service pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.20.0.zip).
* On a deployment with MongoDB and multiple instances, install [!DNL Experience Manager] 6.5.21.0 on one of the Author instances using the Package Manager.<!-- UPDATE FOR EACH NEW RELEASE -->

>[!IMPORTANT]
>
> Adobe does not recommend that you remove or uninstall the [!DNL Experience Manager] 6.5.21.0 package. As such, before you install the pack, you should create a backup of the `crx-repository` in case you must roll it back. <!-- UPDATE FOR EACH NEW RELEASE -->
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

There are two different methods that you can use to automatically install [!DNL Experience Manager] 6.5.21.0.<!-- UPDATE FOR EACH NEW RELEASE -->

* Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.
* Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Experience Manager 6.5.21.0 does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->

**Validate the installation**

To know the platforms that are certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.21.0)` under [!UICONTROL Installed Products]. <!-- UPDATE FOR EACH NEW RELEASE -->

1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.18 or later (Use Web Console: `/system/console/bundles`). <!-- OAK Oak oak VERSION -MAY- NEED TO BE UPDATED FOR EACH NEW RELEASE -->

### Install Service Pack for [!DNL Experience Manager] Forms{#install-aem-forms-add-on-package}

For instructions to install the service pack on Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md).

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

The UberJar for [!DNL Experience Manager] 6.5.21.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.20/). <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

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
 
* Installing tagging related out-of-the-box content via an official update package (including Service Packs, Security Service Packs, Extended Feature Packs, Cumulative Feature Packs, patches and the like), resets the languages property of the `/content/cq:tags` node to default. Therefore, it is necessary to add it from the properties before installation.

### Known issues for AEM Sites {#known-issues-aem-sites-6521}

* SITES-17934 - Content Fragments - Preview fails due to DoS protection for large tree of fragments. See the [KB article about Default GraphQL Query Executor configuration options](https://experienceleague.adobe.com/en/docs/experience-cloud-kcs/kbarticles/ka-23945)

### Known issues for AEM Forms {#known-issues-aem-forms-6521}

* T

## OSGi bundles and content packages included{#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in this [!DNL Experience Manager] 6.5 Service Pack release:

* [List of OSGi bundles included in Experience Manager 6.5.21.0](/help/release-notes/assets/65200-bundles.txt) <!-- UPDATE FOR EACH NEW RELEASE -->
* [List of Content Packages included in Experience Manager 6.5.21.0](/help/release-notes/assets/65200-packages.txt) <!-- UPDATE FOR EACH NEW RELEASE -->

## Restricted websites{#restricted-sites}

These websites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact Adobe Customer Support](https://experienceleague.adobe.com/en/docs/customer-one/using/home).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] product page](https://business.adobe.com/products/experience-manager/adobe-experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/en/docs/experience-manager-65)
>* [Subscribe to Adobe priority product updates](https://www.adobe.com/subscription/priority-product-update.html)

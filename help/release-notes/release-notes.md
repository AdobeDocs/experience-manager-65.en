---
title: Release Notes for [!DNL Adobe Experience Manager] 6.5
description: Find release information, what's new, install how-tos, and a detailed change list for [!DNL Adobe Experience Manager] 6.5.
mini-toc-levels: 4

---
# [!DNL Adobe Experience Manager] 6.5 Latest Service Pack Release Notes {#aem-service-pack-release-notes}

<!-- For an itemized list of all issues found in these release notes, see the following spreadsheet: https://adobe-my.sharepoint.com/:x:/r/personal/anujkapo_adobe_com/Documents/issue_tracker_sp_cfp_updates.xlsx?d=w3ea81ae4e6054153b132f2698c86f84e&csf=1&web=1&e=7yhrWb&nav=MTVfe0U0RjdDQUM3LTZCQ0EtNDk1Qy04Mjc1LTM2MUJEMzE1OEVGN30 -->

<!-- DO NOT DELETE THIS HIDDEN NOTE      DO NOT DELETE THIS HIDDEN NOTE
>[!NOTE]
>
>Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the add-on packages release Thursday, June 1, 2023. In addition, a list of Forms fixes and enhancements is added to this section. -->

## Release information {#release-information}

| Product | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.18.0 <!-- UPDATE FOR EACH NEW RELEASE -->                     |
| Type     | Service Pack release         |
| Date     | Thursday, August 24, 2023 <!-- UPDATE FOR EACH NEW RELEASE -->              |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.17.0.zip) <!-- UPDATE FOR EACH NEW RELEASE -->|

## What is included in [!DNL Experience Manager] 6.5.18.0 {#what-is-included-in-aem-6518}

[!DNL Experience Manager] 6.5.18.0 includes new features, key customer-requested enhancements, bug fixes, and performance, stability, and security improvements that have released since the initial availability of 6.5 in April 2019. [Install this service pack](#install) on [!DNL Experience Manager] 6.5. 

<!-- UPDATE FOR EACH NEW RELEASE -->

<!-- Some of the key features and improvements are the following:

* _REVIEWERS: WHAT ARE THE KEY FEATURES AND ENHANCEMENTS YOU WANT TO HIGHLIGHT IN THIS RELEASE?_ -->

Some of the key features and improvements in this release are the following:

* You can now easily add multiple subtitles and multiple audio tracks to a primary video. This capability means that your videos are accessible across a global audience. You can customize a single, published primary video to a global audience in multiple languages and adhere with accessibility guidelines for different geographical regions. Authors can also manage the subtitles and audio tracks from a single tab in the user interface. See [About multi-subtitle and multi-audio track support for videos in Dynamic Media](https://experienceleague.adobe.com/docs/experience-manager-65/assets/dynamic/video.html?lang=en#about-msma).

## Enhancements in Service Pack 18 {#enhancements-sp18}

<!-- ### Forms{#aem-forms-6518} 

* A -->


<!-- UPDATE BELOW FOR EACH NEW RELEASE -->

## Fixed issues in Service Pack 18 {#fixed-issues}

### [!DNL Sites]{#sites-6518}

* Used the Bulk Editor to update the properties of multiple pages by downloading the `tsv` Export, made changes offline, and then uploaded the `tsv` back to Experience Manager. Even though the pages were updated, the JCR Property `cq:lastModified` was not updated and in the timeline. (SITES-14072) CRITICAL
* Link reference does not get updated inside an Experience Fragment when creating a live copy or rollout of an Experience Fragment. (SITES-14759) CRITICAL
* A workflow synchronization action was added to the out-of-the-box Experience Manager standard rollout configuration, the "Rollout page and subpages", from the parent page, and async job fails with NullPointer exception. The source location page (en-us) does not exist in the parent, but exists in the target location (Live copy) (en). (SITES-12207) MAJOR
* You have 'en' page which contains `jcr:description` and sent the page for translation. The `jcr:description` is getting translated and the property is present under launch. However, when the launch is promoted, `jcr:description` is not getting updated in the page. (SITES-13146) MAJOR
* WCM (Web Content Management) IT tests were blocking the release of Service Pack 17. (SITES-13089) BLOCKER
* Localized content on Live Copy is lost after blueprint rollout. (SITES-12602) CRITICAL

#### Admin User Interface{#sites-adminui-6518}

* If a user's delete permission is removed by way of the useradmin console, the user no longer sees the 'Properties' button in the sites.html console (when selecting the page). However, this option is present if the user opens the page editor. (SITES-14341) MAJOR
* When a folder has many pages, each having many versions, when using the compare version feature, the load on the instance becomes high. When several users are using the feature at the same time, the instance can go down. (SITES-13026) MAJOR

#### [!DNL Content Fragments]{#sites-contentfragments-6518}

* A problem was discovered with the exception handling in the `RemoteAssetClientImpl`. When an IOException or RuntimeException occurs while querying the metadata, the current thread attempts to close and recreate the shared httpClient which could result in a cascade of other errors in the threads. (SITES-14092) MAJOR
* When authors fill out the rich text editor field in a content fragment, and insert an image inside a link, when the content fragment is queried through the GraphQL API, the error message `Exception while fetching data (/genericContentByPath) : null` is returned. This error only occurred if there was a link with an image inside it. Removing the image from the link made the error message go away. (SITES-13988) CRITICAL
* The GraphQL implementation of Experience Manager 6.5 was not on par with master and several important fixes were missing. (SITES-13096) BLOCKER
* A mandatory HTTP header is needed when accessing the metadata service endpoint. (SITES-13068) BLOCKER

#### Core Components{#sites-core-components-6518}

* Asset selector does not fetch updated list of assets when it is closed and reopened. If new assets are uploaded in the repository, then they are not shown in asset selector until the page containing asset selector is refreshed. (SITES-14828) CRITICAL
* Asset selector user interface, integrated in Sites editor (CS), is not responsive when window is reduced. (SITES-14127) CRITICAL
* The Adobe IMS (Identity Management System) Configuration for Asset selector integration was accepting incorrect values. (SITES-13962) NORMAL
* Asset selector, when integrated in Sites Image component, should not allow the selecting of non-image assets. (SITES-13879) MAJOR
* After successful sign-in, user is redirected to Page Editor. User has to reopen the Asset selector to pick Remote Assets. (SITES-13851) CRITICAL
* Remote Asset Picker always redirects to the Adobe IMS (Identity Management System) Stage environment. (SITES-13448, SITES-13433) BLOCKER

<!-- #### [!DNL Experience Fragments]{#sites-experiencefragments-6518}

* A -->

#### Page Editor{#sites-pageeditor-6518}

* When the author opens Page properties, the dialog box has an incorrect view. That is, an extra horizontal scrollbar and additional margins are visible. (SITES-14502) MINOR
* Styles added in Experience Manager 6.5, Service Pack 17, for anchor and body tag was causing CSS issues. Anchor tags were not showing underlined in Author. (SITES-14261) MAJOR

### [!DNL Assets]{#assets-6518}

* A

#### [!DNL Dynamic Media]{#dm-6518}

* When VTT fails to download, the video is not visible. It shows a blank screen, while the video scrubber is seen progressing forward. (ASSETS-21909) NORMAL
* Focus is not moving to multiple controls present below the video when navigating using Tab on keyboard. As such, they are not accessible. (ASSETS-25749) NORMAL

### [!DNL Forms]{#forms-6518}

* After Experience Manager, Service Pack 16 is installed on the servers, all the Interactive communication Letters starts to clock if they try to edit these letters. If they provide any sample payload to preview or view/edit the properties page, they work. However, they are not able to edit the letters. (FORMS-9067) NORMAL

<!-- ### [!DNL Commerce]{#commerce-6518}

* A -->

### Foundation{#foundation-6518}

#### Content distribution{#content-distribution-6518}

* The asset delete queue should not be blocked and no error should occur in the log file. (NPR-40570) NORMAL

<!-- #### Integrations{#integrations-6518}

* A -->

<!-- #### Oak{#oak-6518}

* A -->

#### Platform{#platform-6518}

* After a vanilla Experience Manager, Service Pack 17 install, you see errors in the `stderr.log`. Vanilla installs should not get errors. (CQ-4353637) MINOR
* Create button in Tagging screen not respecting ACL (Access Control List). (NPR-40973) MAJOR
* Unable to create, or access, or both, cache node of ContextHub on Experience Manager. (NPR-40515) CRITICAL

#### Replication{#replication-6518}

* Replication flush deletes all descendants of the requested path. (NPR-40569) NORMAL

#### Sling{#sling-6518}

* When a Link Share Report is generate, the column Link does not contain the correct values. (NPR-40798) NORMAL
* With AEM 6.5.15.0, all vanity URLs, sling aliases, and sling mapping are broken after an AEM restart. (NPR-40420) NORMAL

#### Translation projects{#translation-6518}

* Translation `rules.xml` sorted in a poor way when rules are added from the translation configuration user interface. (NPR-40431) MAJOR
* Support links with query parameters during translation. (NPR-40339) NORMAL
* Dictionary user interface is not loading for the customer after updating additional context root. (NPR-40650) MAJOR
* Error creating language copies when one of the assets is a Content Fragment that contains a multi-field with ReferenceFragment or ContentFragment types. (NPR-40892) MAJOR

#### User interface{#ui-6518}

* As described in the [Configuration Browser documentation](https://experienceleague.adobe.com/docs/experience-manager-65/administering/introduction/configurations.html?lang=en#using-configuration-browser), _The Name will become the node name in the repository_. However, in Configuration Browser, Configuration Title is used for Path in CRXDE Lite, and the Name of the Configuration is ignored. (NPR-40607) MINOR

<!-- #### WCM{#wcm-6518}

* A -->

#### Workflow{#workflow-6518}

* Reverting an asset version keeps the asset status in processing mode. (NPR-41029) NORMAL
* Sorting issue on Assets and Projects user interface. Some have overlaid the custom columns on Assets and Projects user interface as per business requirements. They have implemented a sort using the out-of-the-box property `sortable=true`. However, they are seeing inconsistencies in sorting when there are many entries under Projects or Assets user interface. (NPR-41027) NORMAL
* Logs are getting filled up with `NullPointerException` in the `EMailNotificationService`, and emails, which workflows should send, are not getting sent. (NPR-40898) NORMAL
<!-- REMOVED BY ENGINEERING FROM TOTAL RELEASE CANDIDATE LIST  * The timeline is not providing references to the selected content. (NPR-40806) MAJOR-->

## Install [!DNL Experience Manager] 6.5.18.0{#install}

<!-- Remaining content from here to bottom stays the same except for version updating as needed as per update team feedback. -->

* [!DNL Experience Manager] 6.5.18.0 requires [!DNL Experience Manager] 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions. <!-- UPDATE FOR EACH NEW RELEASE -->
* The service pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.17.0.zip).
* On a deployment with MongoDB and multiple instances, install [!DNL Experience Manager] 6.5.18.0 on one of the Author instances using the Package Manager.<!-- UPDATE FOR EACH NEW RELEASE -->

>[!IMPORTANT]
>
> Adobe does not recommend that you remove or uninstall the [!DNL Experience Manager] 6.5.18.0 package. As such, before you install the pack, you should create a backup of the `crx-repository` in case you must roll it back. <!-- UPDATE FOR EACH NEW RELEASE -->
<!-- For instructions to install Service Pack for Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md). -->


### Install the service pack on [!DNL Experience Manager] 6.5{#install-service-pack}

1. Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the service pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.17.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->

1.  Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1.  Select the package, then select **[!UICONTROL Install]**.

1.  To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>Dialog on Package Manager UI sometimes exits during the installation of the service pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installations is successful. Typically, this issue occurs in [!DNL Safari] browser but can intermittently occur on any browser.

**Automatic installation**

There are two different methods that you can use to automatically install [!DNL Experience Manager] 6.5.18.0.<!-- UPDATE FOR EACH NEW RELEASE -->

* Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.
* Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Experience Manager 6.5.18.0 does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->

**Validate the installation**

To know the platforms that are certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

1.  The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.18.0)` under [!UICONTROL Installed Products]. <!-- UPDATE FOR EACH NEW RELEASE -->

1.  All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1.  The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.15 or later (Use Web Console: `/system/console/bundles`). <!-- NPR-40398 for 6.5.17.0 --> <!-- OAK Oak oak VERSION -MAY- NEED TO BE UPDATED FOR EACH NEW RELEASE -->

### Install Service Pack for [!DNL Experience Manager] Forms{#install-aem-forms-add-on-package}

For instructions to install the service pack on Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md).

### Install GraphQL Index Package for Experience Manager Content Fragments{#install-aem-graphql-index-add-on-package}

Customers using GraphQL must install the [Experience Manager Content Fragment with GraphQL Index Package 1.1.1](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/cfm-graphql-index-def-1.1.1.zip). 

Doing so lets you add the required index definition based on the features they actually use.

Failure to install this package may result in slow or failed GraphQL queries.

>[!NOTE]
>
>Only install this package once per instance; it does not need to be reinstalled with every Service Pack.

### UberJar{#uber-jar}

The UberJar for [!DNL Experience Manager] 6.5.18.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.17/). <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM: <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

```shell
<dependency>
     <groupId>com.adobe.aem</groupId>
     <artifactId>uber-jar</artifactId>
     <version>6.5.18</version>
     <scope>provided</scope>
</dependency>
```

>[!NOTE]
>
>UberJar and the other related artifacts are available on Maven Central Repository instead of Adobe Public Maven repository (`repo.adobe.com`). The main UberJar file is renamed to `uber-jar-<version>.jar`. So, there is no `classifier`, with `apis` as the value, for the `dependency` tag.

## Deprecated features{#removed-deprecated-features}

Below is a list of features and capabilities that are marked as deprecated with [!DNL Experience Manager] 6.5.7.0. Features are marked deprecated initially and later removed in a future release. An alternate option is provided.

Review if you use a feature or a capability in a deployment. Also, plan to change the implementation to use an alternate option.

| Area | Feature | Replacement |
|---|---|---|
| Integrations | The screen **[!UICONTROL Experience Manager Cloud Services Opt-In]** is deprecated since the [!DNL Experience Manager] and [!DNL Adobe Target] integration is updated in [!DNL Experience Manager] 6.5. The integration supports the Adobe Target Standard API. The API uses authentication by way of Adobe IMS and [!DNL Adobe I/O Runtime]. It supports the growing role of Adobe Launch to instrument [!DNL Experience Manager] pages for analytics and personalization, the opt-in wizard is functionally irrelevant. | Configure system connections, Adobe IMS authentication, and [!DNL Adobe I/O Runtime] integrations via the respective [!DNL Experience Manager] cloud services. |
| Connectors | The Adobe JCR Connector for Microsoft&reg; SharePoint 2010 and Microsoft&reg; SharePoint 2013 is deprecated for [!DNL Experience Manager] 6.5. | N/A |

## Known issues{#known-issues}

<!-- THESE KNOWN ISSUES CARRY OVER EACH RELEASE. THE "PRODUCT UPDATES TEAM" IS SUPPOSED TO VERIFY EACH ISSUE AND LET YOU KNOW IF ANYTHING NEEDS TO BE ADDED, DELETED, OR CHANGED IN THIS LIST.
 -->
<!-- REMOVED AS PER CQDOC-20022, JANUARY 23, 2023 * If you install [!DNL Experience Manager] 6.5 Service Pack 10 or a previous service pack on [!DNL Experience Manager] 6.5, the runtime copy of your assets custom workflow model (created in `/var/workflow/models/dam`) is deleted.
To retrieve your runtime copy, Adobe recommends to synchronize the design-time copy of the custom workflow model with its runtime copy using the HTTP API:
`<designModelPath>/jcr:content.generate.json`. -->

* Update your GraphQL queries that may have used a custom API name for your content model to using the default name of the content model instead.

* A GraphQL query may use the `damAssetLucene` index instead of the `fragments` index. This action might result in GraphQL queries that fail, or take a long time to run.

  To correct the problem, `damAssetLucene` has to be configured to include the following two properties:

  * `contentFragment`
  * `model`

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

* As [!DNL Microsoft&reg; Windows Server 2019] does not support [!DNL MySQL 5.7] and [!DNL JBoss&reg; EAP 7.1], [!DNL Microsoft&reg; Windows Server 2019] does not support turnkey installations for [!DNL Experience Manager Forms 6.5.10.0].

* If you upgrade your [!DNL Experience Manager] instance from 6.5.0 - 6.5.4 to the latest service pack on Java&trade; 11, you see `RRD4JReporter` exceptions in the `error.log` file. To stop the exceptions, restart your instance of [!DNL Experience Manager]. <!-- THIS BULLET POINT WAS UPDATED AS PER CQDOC-20021, JANUARY 23, 2023 --> 

* Users can rename a folder in a hierarchy in [!DNL Assets] and publish a nested folder to [!DNL Brand Portal]. However, the title of the folder is not updated in [!DNL Brand Portal] until the root folder is republished.

* When a user selects to configure a field for the first time in an adaptive form, the option to save a configuration does not display in Properties Browser. Selecting to configure some other field of the adaptive form in the same editor resolves the issue.

* The following errors and warning messages may display during installation of [!DNL Experience Manager] 6.5.x.x:
  * "When the Adobe Target integration is configured in [!DNL Experience Manager] using the Target Standard API (IMS authentication), then exporting Experience Fragments to Target results in wrong offer types getting created. Instead of type "Experience Fragment"/source "Adobe Experience Manager," Target creates several offers with type "HTML"/source "Adobe Target Classic."
  * `com.adobe.granite.maintenance.impl.TaskScheduler`: No maintenance windows found at granite/operations/maintenance.
  * Adaptive Form server-side validation fails when aggregate functions such as SUM, MAX, and MIN are used (CQ-4274424).
  * `com.adobe.granite.maintenance.impl.TaskScheduler` - No maintenance windows found at granite/operations/maintenance.
  * Hotspot in a Dynamic Media interactive image is not visible when previewing the asset through Shoppable Banner viewer.
  * `com.adobe.cq.social.cq-social-jcr-provider bundle com.adobe.cq.social.cq-social-jcr-provider:1.3.5 (395)[com.adobe.cq.social.provider.jcr.impl.SpiSocialJcrResourceProviderImpl(2302)]` : Timeout waiting for register change to complete unregistered.

* On JBoss&reg; 7.1.4 platform, when user installs Experience Manager 6.5.16.0 or later service pack, `adobe-livecycle-jboss.ear` deployment fails.
* JDK version higher than 1.8.0_281 are not supported for WebLogic JEE server.   
* Starting with AEM 6.5.15, the Rhino JavaScript Engine provided by the ```org.apache.servicemix.bundles.rhino``` bundle has a new hoisting behavior. Scripts that use the strict mode (```use strict;```) have to correctly declare their variables, otherwise they do not get run, instead throwing a runtime error.

## OSGi bundles and content packages included{#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in [!DNL Experience Manager] 6.5.18.0: <!-- UPDATE FOR EACH NEW RELEASE -->

* [List of OSGi bundles included in Experience Manager 6.5.18.0](/help/release-notes/assets/65170_bundles.txt) <!-- UPDATE FOR EACH NEW RELEASE -->
* [List of Content Packages included in Experience Manager 6.5.18.0](/help/release-notes/assets/65170_packages.txt) <!-- UPDATE FOR EACH NEW RELEASE -->

## Restricted websites{#restricted-sites}

These websites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact Adobe Customer Support](https://experienceleague.adobe.com/docs/customer-one/using/home.html).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] product page](https://business.adobe.com/products/experience-manager/adobe-experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/docs/experience-manager-65.html)
>* [Subscribe to Adobe priority product updates](https://www.adobe.com/subscription/priority-product-update.html)

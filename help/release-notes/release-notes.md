---
title: Release Notes for [!DNL Adobe Experience Manager] 6.5
description: Find release information, what's new, install how-tos, and a detailed change list for [!DNL Adobe Experience Manager] 6.5.
mini-toc-levels: 3


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
| Version  | 6.5.17.0 <!-- UPDATE FOR EACH NEW RELEASE -->                     |
| Type     | Service Pack release         |
| Date     | Thursday, May 25, 2023 <!-- UPDATE FOR EACH NEW RELEASE -->              |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?pack[…]be/packages/cq650/servicepack/aem-service-pkg-6.5.16.0.zip) <!-- UPDATE FOR EACH NEW RELEASE -->|

## What is included in [!DNL Experience Manager] 6.5.17.0 {#what-is-included-in-aem-6517}

[!DNL Experience Manager] 6.5.17.0 includes new features, key customer-requested enhancements, bug fixes, and performance, stability, and security improvements that are released since the initial availability of 6.5 in April 2019. [Install this service pack](#install) on [!DNL Experience Manager] 6.5. <!-- UPDATE FOR EACH NEW RELEASE -->

<!-- Some of the key features and improvements are the following:

* _REVIEWERS: WHAT ARE THE KEY FEATURES AND ENHANCEMENTS YOU WANT TO HIGHLIGHT IN THIS RELEASE?_ -->


<!-- UPDATE BELOW FOR EACH NEW RELEASE -->

## [!DNL Assets]{#assets-6517}

* When you publish more than 40 PDFs simultaneously, [!DNL Experience Manager] stops responding and becomes unavailable for some time. (ASSETS-21789)
* If you are logged in as a test user, you cannot see the Assets related to a particular Asset when you click properties of an Asset. (ASSETS-21648)
* While editing Assets using `Desktop Actions`, if you try to check in more than five Assets at once, `Limit Reached` error is displayed and the selected Assets are checked out. (ASSETS-21121)
* Unable to sort Assets by name in a Collection. (ASSETS-20924)
* Unable to set dimensions on Assets of an image format type. (ASSETS-20835)
* When you select any file in a Collection and click `Download`, and then navigate to the email checkbox and expand it, regular text and email link is not recognizable due to background color. (ASSETS-17349)
* The tooltip text and its background on the Search/Add Email Address field does not display appropriate contrast ratio while sharing a link. (ASSETS-17347)
* When you expand `Notifications`, the text does not display properly due to paragraph spacing. (ASSETS-17345)
* When you copy an Asset in Collection, `Public Collection` checkbox does not display appropriately. (ASSETS-17343)
* Elements use ARIA attributes without a role. (ASSETS-17325)
* The link is not descriptive when you expand `Notifications`. (ASSETS-17283)
* When you navigate and expand the [!DNL Smart Crop] button, the content appears like a list but not marked up as an unordered list. As a result, the screen reader does not recognize the unordered list and read it as plain text. (ASSETS-17247)
* The `Sort By` label is not associated to its respective drop-down. As a result, the screen reader does not recognize the drop-down options. (ASSETS-17239)
* Unable to move forward or backward using the tab or arrow keys from keyboard when you are trying to add a new user using `Add user` combo-box. (ASSETS-17233)
* Screen reader does not correctly convey the information for the Workflows step (ASSETS-17285).

## [!DNL Assets] - [!DNL Dynamic Media]{#dm-6517}

* Hotspot images disappear in the Carousel Set viewer. (ASSETS-20855)
* Card view of assets folders render in minutes when using Dynamic Media renditions of video assets. (ASSETS-21153)
* Connection to Dynamic Media is broken when a Dynamic Media Cloud Configuration exists already. (ASSETS-23057)

## [!DNL Commerce]{#commerce-6517}

* Moved tags are garbage collected but are still referenced by products under `/var`. (CQ-4351337)

## [!DNL Forms]{#forms-6517}

>[!NOTE]
>
>Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the add-on packages release Thursday, June 1, 2023. In addition, a list of Forms fixes and enhancements is added to this section.

## Integrations{#integrations-6517}

* When converting an Adobe Target IMS configuration to a User credential one in legacy cloud configurations, the `connectedWhen` property does not change. This issue makes all the calls go as if the configuration was still IMS-based. (CQ-4352810)
* Adding `modifyProperties` permission to `fd-cloudservice` system user for Adobe Sign configuration. (FORMS-6164)
* With Experience Manager integrated with Adobe Target, when you create an AB test activity, it does not synch up the audiences associated with it, to Target. (NPR-40085)

## Platform{#platform-6517}

* In the Experience Manager Tag Management user interface (/aem/tags/), the namespaces, and tags appear in the order they are created. However, when there are many namespaces and tags, the ability to view and manage them is difficult. This issue is because they cannot be sorted in any other way. (NPR-39620)
* Google closure version update needed because Minification js is not working for some client libraries. (NPR-40043)

## [!DNL Sites]{#sites-6517}

* Performance drop in LinkCheckerTransformer. (SITES-11661)
* Language copies of a page were not getting updated as expected. (SITES-11191)
* Opening non-campaign pages call `targeteditor.html` unnecessarily. Remove the `targeteditor` call when not needed. (SITES-12469)
* Live copies cannot be created for pages with annotations. (SITES-12154)
* Rollout of pages is working on Experience Manager 6.5.16. (SITES-12008)
* Out of memory; high garbage collection activity due to `NotificationManagerImpl`. `NotificationManager` bundle upgrade to AEM 6.5. (SITES-11440)
* Retrieving Sites references fails on servlet. (SITES-10901)

### [!DNL Sites] - Admin User Interface{#sites-adminui-6517}

* The preview window for the thumbnail image selector cannot be closed. (SITES-10459)

### [!DNL Sites] - [!DNL Content Fragments]{#sites-contentfragments-6517}

* Configuration for connecting to Polaris service object (URL, credentials, callback, and so on). (SITES-12149)
* Usage of `SemanticDataType.REFERENCE` should support "Remote-Asset-IDs". (SITES-12127)
* Integrate Polaris Asset Selector into Content Fragment editor. (SITES-12125)
* A mandatory http header was necessary to access the metadata service endpoint. (SITES-13068)

### [!DNL Sites] - Core Components{#sites-core-components-6517}

* The property `cq-msm-lockable` has the wrong redirect value in the Foundation page component. (SITES-10904)

### [!DNL Sites] - [!DNL Experience Fragments]{#sites-experiencefragments-6517}

* Selecting an Externalizer configuration in an Experience Fragment when you export to Adobe Target causes the incorrect externalized URL to be sent. (SITES-12402)
* Remove non-inclusive terms; apply inclusive terms guidelines. (SITES-11244)


### [!DNL Sites] - Page Editor{#sites-pageeditor-6517}

* No thumbnail is displayed for a carousel set in the Experience Manager content finder side rail. (SITES-8593)


## Sling{#sling-6517}

* Sling `ResourceMerger` consumes a high amount of CPU when provided with a fictitious path, causing a denial of service. (NPR-40338)


## Translation projects{#translation-6517}

* The `translationrules.xml` is sorted poorly when adding a rule to a property by way of the translation configuration user interface. (NPR-40431)
* Language Copy is not created when the user is not configuring non-mandatory fields. (NPR-40036)

## User interface{#ui-6517}

* Cancel button in Page properties is inactive; it should take you to the Site Admin user interface. (NPR-40501)


## WCM{#wcm-6517}

* TEXT

## Workflow{#workflow-6517}

* Workflow Console changes. (NPR-40502)
* `SegmentNotfound errors` in the logs on a production author instance, caused by unclosed Resource resolver in class `com.day.cq.workflow.impl.email.EMailNotificationServic`. (NPR-40187)
* A closed unclosed `ResourceResolver` exception is getting logged. (ASSETS-22495)
* Experience Manager author crashes when PSD/PDF with huge `DocumentAncestors` metadata attributes is uploaded. (ASSETS-22966)
* Session leak in class `InboxSharingCache` with `user-reader-service`. (CQ-4352513)
* Incomplete user and group list is displayed when "Workflow Initiator Participant Chooser" step lists the users & groups for the Participant step. This issue occurred when one group was also a member of another group. (NPR-40055)

## Install [!DNL Experience Manager] 6.5.17.0{#install}

<!-- Remaining content from here to bottom stays the same except for version updating as needed as per update team feedback. -->

* [!DNL Experience Manager] 6.5.17.0 requires [!DNL Experience Manager] 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions. <!-- UPDATE FOR EACH NEW RELEASE -->
* The service pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html).
* On a deployment with MongoDB and multiple instances, install [!DNL Experience Manager] 6.5.17.0 on one of the Author instances using the Package Manager.<!-- UPDATE FOR EACH NEW RELEASE -->

>[!IMPORTANT]
>
> Adobe does not recommend that you remove or uninstall the [!DNL Experience Manager] 6.5.17.0 package. As such, before you install the pack, you should create a backup of the `crx-repository` in case you must roll it back. <!-- UPDATE FOR EACH NEW RELEASE -->
<!-- For instructions to install Service Pack for AEM Forms, see [AEM Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md). -->


### Install the service pack on [!DNL Experience Manager] 6.5{#install-service-pack}

1.  Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1.  Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1.  Download the service pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.15.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->

1.  Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1.  Select the package, then select **[!UICONTROL Install]**.

1.  To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>Dialog on Package Manager UI sometimes exits during the installation of the service pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installations is successful. Typically, this issue occurs in [!DNL Safari] browser but can intermittently occur on any browser.

**Automatic installation**

There are two different methods that you can use to automatically install [!DNL Experience Manager] 6.5.17.0.<!-- UPDATE FOR EACH NEW RELEASE -->

* Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.
* Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Experience Manager 6.5.17.0 does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->

**Validate the installation**

To know the platforms that are certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

1.  The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.17.0)` under [!UICONTROL Installed Products]. <!-- UPDATE FOR EACH NEW RELEASE -->

1.  All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1.  The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.14 or later (Use Web Console: `/system/console/bundles`). <!-- NPR-39939 for 6.5.16.0 --> <!-- NPR-39436 for 6.5.15.0 --> <!-- OAK Oak oak VERSION -MAY- NEED TO BE UPDATED FOR EACH NEW RELEASE -->

### Install Service Pack for [!DNL Experience Manager] Forms{#install-aem-forms-add-on-package}

For instructions to install the service pack on AEM Forms, see [AEM Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md).

### Install GraphQL Index Package for Experience Manager Content Fragments{#install-aem-graphql-index-add-on-package}

Customers using GraphQL should install the [AEM Content Fragment with GraphQL Index Package 1.0.5](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Fadobe%2Fpackages%2Fcq650%2Ffeaturepack%2Fcfm-graphql-index-def-1.0.5.zip). 

Doing so lets you add the required index definition based on the features they actually use.

Failure to install this package may result in slow or failed GraphQL queries.

>[!NOTE]
>
>Only install this package once per instance; it does not need to be reinstalled with every Service Pack.

### UberJar{#uber-jar}

The UberJar for [!DNL Experience Manager] 6.5.17.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.15/). <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

>[!NOTE]
>
>In Experience Manager 6.5.16.0, the UberJar version (6.5.15.0) remains the same as the previous release.


To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM: <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

```shell
<dependency>
     <groupId>com.adobe.aem</groupId>
     <artifactId>uber-jar</artifactId>
     <version>6.5.15</version>
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
| Integrations | The screen **[!UICONTROL AEM Cloud Services Opt-In]** is deprecated since the [!DNL Experience Manager] and [!DNL Adobe Target] integration is updated in [!DNL Experience Manager] 6.5. The integration supports the Adobe Target Standard API. The API uses authentication by way of Adobe IMS and [!DNL Adobe I/O Runtime]. It supports the growing role of Adobe Launch to instrument [!DNL Experience Manager] pages for analytics and personalization, the opt-in wizard is functionally irrelevant. | Configure system connections, Adobe IMS authentication, and [!DNL Adobe I/O Runtime] integrations via the respective [!DNL Experience Manager] cloud services. |
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

* As [!DNL Microsoft&reg; Windows Server 2019] does not support [!DNL MySQL 5.7] and [!DNL JBoss&reg; EAP 7.1], [!DNL Microsoft&reg; Windows Server 2019] does not support turnkey installations for [!DNL AEM Forms 6.5.10.0].

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

* When trying to move, delete, or publish either Content Fragments, Sites, or Pages, there is an issue when Content Fragment references are fetched, as the background query fails. That is, the functionality does not work.
  To ensure correct operation, you must add the following properties to the index definition node `/oak:index/damAssetLucene` (no reindexing is required):

   ```xml
   "tags": [
       "visualSimilaritySearch"
     ]
   "refresh": true
   ```

* In AEM Forms, POP3 protocol does not work with email endpoints for Microsoft&reg; Office 365.
* On JBoss&reg; 7.1.4 platform, when user installs AEM 6.5.16.0 service pack, `adobe-livecycle-jboss.ear` deployment fails. 

## OSGi bundles and content packages included{#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in [!DNL Experience Manager] 6.5.17.0: <!-- UPDATE FOR EACH NEW RELEASE -->

* [List of OSGi bundles included in Experience Manager 6.5.16.0](/help/release-notes/assets/65160_bundles.txt) <!-- UPDATE FOR EACH NEW RELEASE -->
* [List of Content Packages included in Experience Manager 6.5.16.0](/help/release-notes/assets/65160_packages.txt) <!-- UPDATE FOR EACH NEW RELEASE -->

## Restricted websites{#restricted-sites}

These websites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact Adobe Customer Support](https://experienceleague.adobe.com/docs/customer-one/using/home.html).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] product page](https://business.adobe.com/products/experience-manager/adobe-experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/docs/experience-manager-65.html)
>* [Subscribe to Adobe priority product updates](https://www.adobe.com/subscription/priority-product-update.html)

---
title: Release Notes for [!DNL Adobe Experience Manager] 6.5
description: Find release information, what's new, install how-tos, and a detailed change list for [!DNL Adobe Experience Manager] 6.5.
mini-toc-levels: 3


---
# [!DNL Adobe Experience Manager] 6.5 Latest Service Pack Release Notes {#aem-service-pack-release-notes}

<!-- For an itemized list of all issues found in these release notes, see the following spreadsheet: https://adobe-my.sharepoint.com/:x:/r/personal/anujkapo_adobe_com/Documents/issue_tracker_sp_cfp_updates.xlsx?d=w3ea81ae4e6054153b132f2698c86f84e&csf=1&web=1&e=WRAZ43&nav=MTVfezk2OTJDQTNFLUI4QTQtNDY2RS05NEVCLUQ5QjcyNEVENkJDNn0 -->

## Release information {#release-information}

| Product | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.16.0 <!-- UPDATE FOR EACH NEW RELEASE -->                     |
| Type     | Service Pack release         |
| Date     | Thursday, February 23, 2023 <!-- UPDATE FOR EACH NEW RELEASE -->              |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.15.0.zip) <!-- UPDATE FOR EACH NEW RELEASE -->|

## What is included in [!DNL Experience Manager] 6.5.16.0 {#what-is-included-in-aem-6516}

[!DNL Experience Manager] 6.5.16.0 includes new features, key customer-requested enhancements, bug fixes, and performance, stability, and security improvements, that are released since the initial availability of 6.5 in April 2019. [Install this service pack](#install) on [!DNL Experience Manager] 6.5. <!-- UPDATE FOR EACH NEW RELEASE -->

<!-- Some of the key features and improvements are the following:

* _REVIEWERS: WHAT ARE THE KEY FEATURES AND ENHANCEMENTS YOU WANT TO HIGHLIGHT IN THIS RELEASE?_

* Added support for password reset for Dynamic Media Classic users within Experience Manager. (ASSETS-10298) -->

<!-- UPDATE BELOW FOR EACH NEW RELEASE -->

## [!DNL Assets] {#assets-6516}


### [!DNL Assets] - [!DNL Dynamic Media] {#dm-6516} 


## Commerce {#commerce-6516}


## [!DNL Forms] {#forms-6516}

>[!NOTE]
>
>Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the add-on packages release Thursday, March 2, 2023. In addition, a list of Forms fixes and enhancements is added to this section.

<!--
### [!DNL Forms] Fixes {#forms-fixes-6516}
-->

## [!DNL Sites] {#sites-6516}

* Current `cq-wcm-core` artifactory release does not have the POM. (SITES-10983)
* The rollout preview action should not list the page to be created. (SITES-10355, CQ-4266213)
* Rollout after MSM detach recreates the detached page. (SITES-9841)
* Creating a launch is timing out; user must wait many minutes on a loading screen before the request times out. (SITES-9051)
* The Rollout Page user interface is displaying non-existent parent page paths. You can rollout the page with a success message, but the child page is not rolled out due to the parent page never getting rolled out in the first place. (SITES-8621)

### [!DNL Sites] - Core Components {#sites-core-components-6516}

* Centralise the link processing on e-mail pages so that model customisations are not needed anymore. (SITES-9002)

### [!DNL Sites] - Foundation Components {#sites-foundation-components-6516}

* (SITES-7989)


### [!DNL Sites] - Admin User Interface {#sites-adminui-6516}

* CSV Export is not exporting all the pages under the selected page. (SITES-9390)

### [!DNL Sites] - Accessibility {#sites-access-6516}

### [!DNL Sites] - [!DNL Content Fragments] {#sites-contentfragments-6516}

* Unable to print a content fragment's JSON. The reason is because the GraphQL query cannot be generated when you open the content fragment's Preview page. (SITES-8619)
* When re-opening the Content Fragment Model Editor, all **[!UICONTROL Date and Time]** fields are defaulting to Date & Time type. (SITES-8401)

### [!DNL Sites] - [!DNL Experience Fragments] {#sites-experiencefragments-6516}

* You are unable to move an experience fragment to another folder even if the template is listed under allowed templates. (SITES-8601)
* (SITES-7989)

### [!DNL Sites] - Fluid XP {#sites-fluidxp-6516}

### [!DNL Sites] - Page Editor {#sites-pageeditor-6516}

* Update dependencies for the resource resolver improvement made in SITES-8464 in which page rendering in Authoring mode created a high number of `TemplatedResourceImpl` objects. (SITES-9350)


## Sling {#sling-6516}


## Translation projects {#translation-6516}


## User interface {#ui-6516}

* When changing to a smaller resolution, the DatePicker does not display the AM/PM select doesn't display or change visibly. (NPR-39948)


## WCM {#wcm-6516}

* The rollout preview action should not list the page to be created. (CQ-4266213, SITES-10355) 

## Workflow {#workflow-6516}



## Install [!DNL Experience Manager] 6.5.16.0 {#install}

<!-- Remaining content from here to bottom stays the same except for version updating as needed as per update team feedback. -->

* [!DNL Experience Manager] 6.5.16.0 requires [!DNL Experience Manager] 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions. <!-- UPDATE FOR EACH NEW RELEASE -->
* The service pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html).
* On a deployment with MongoDB and multiple instances, install [!DNL Experience Manager] 6.5.16.0 on one of the Author instances using the Package Manager.<!-- UPDATE FOR EACH NEW RELEASE -->

>[!IMPORTANT]
>
>Adobe does not recommend that you remove or uninstall the [!DNL Experience Manager] 6.5.16.0 package. As such, before you install the pack, you should create a backup of the `crx-repository` in case you need to roll it back. <!-- UPDATE FOR EACH NEW RELEASE -->

### Install the service pack on [!DNL Experience Manager] 6.5 {#install-service-pack}

1. Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the service pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.15.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->

1. Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package, then select **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>Dialog on Package Manager UI sometimes exits during the installation of the service pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installations is successful. Typically, this issue occurs in [!DNL Safari] browser but can intermittently occur on any browser.

**Automatic installation**

There are two different methods that you can use to automatically install [!DNL Experience Manager] 6.5.16.0.<!-- UPDATE FOR EACH NEW RELEASE -->

* Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.
* Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Experience Manager 6.5.16.0 does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->

**Validate the installation**

To know the platforms that are certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.16.0)` under [!UICONTROL Installed Products]. <!-- UPDATE FOR EACH NEW RELEASE -->

1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.13 or later (Use Web Console: `/system/console/bundles`). <!-- NPR-39436 for 6.5.15.0 --> <!-- OAK VERSION -MAY- NEED TO BE UPDATED FOR EACH NEW RELEASE -->

### Install [!DNL Experience Manager] Forms add-on package {#install-aem-forms-add-on-package}

>[!NOTE]
>
>Skip if you are not using [!DNL Experience Manager] Forms.

<!-- 
Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package a week after the scheduled [!DNL Experience Manager] Service Pack release.
-->

1. Ensure that you have installed the [!DNL Experience Manager] service pack.
1. Download the corresponding Forms add-on package listed at [AEM Forms releases](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html#forms-updates) for your operating system.
1. Install the Forms add-on package as described in [Installing AEM Forms add-on packages](/help/forms/using/installing-configuring-aem-forms-osgi.md#install-aem-forms-add-on-package).
1. If you use letters in Experience Manager 6.5 Forms, install the [latest AEMFD Compatibility package](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html#forms-updates).

### Install [!DNL Experience Manager] Forms on JEE {#install-aem-forms-jee-installer}

>[!NOTE]
>
>Skip if you are not using AEM Forms on JEE. Fixes in [!DNL Experience Manager] Forms on JEE are delivered through a separate installer.

Perform the following steps for all the AEM Forms on JEE environments using any application servers other than JBoss EAP 7.4.0.
1. Install [AEM Forms JEE Patch](jee-patch-installer-65.md). The includes all fixed issues for all components of AEM 6.5 Forms on JEE. 
1. Install the [Fragment for AEM 6.5 Forms on JEE Service Pack 15](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/org.apache.felix.http.servlet-api-1.2.0_fragment_full.jar). The fragment adds the dependencies required to install AEM Service Pack 15 (6.5.16.0).
1. After installing the fragment, wait for the application server to stabilize.
1. [Install the service pack on Experience Manager 6.5](#install-service-pack).

   >[!NOTE]
   >
   >If you install the latest [AEM service pack (6.5.16.0)](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.15.0.zip), prior to installing the [Fragment for AEM 6.5 Forms on JEE Service Pack 15](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/org.apache.felix.http.servlet-api-1.2.0_fragment_full.jar) on your AEM 6.5 Forms on JEE environment, the CRX/bundle and the start page can stop working and you encounter the service unavailable error. To resolve the issue, perform the actions [listed here](/help/forms/using/aem-service-pack-installation-solution.md).
   
1. Install the [latest Forms add-on package](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html), delete the Forms add-on package from the `crx-repository\install` folder, and restart the server.

### UberJar {#uber-jar}

The UberJar for [!DNL Experience Manager] 6.5.16.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.15/). <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM: <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

```shell
<dependency>
     <groupId>com.adobe.aem</groupId>
     <artifactId>uber-jar</artifactId>
     <version>6.5.16</version>
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
| Connectors | The Adobe JCR Connector for Microsoft&reg; SharePoint 2010 and Microsoft&reg; SharePoint 2013 is deprecated for [!DNL Experience Manager] 6.5. | N/A |

## Known issues {#known-issues}

<!-- THESE KNOWN ISSUES CARRY OVER EACH RELEASE. THE "PRODUCT UPDATES TEAM" IS SUPPOSED TO VERIFY EACH ISSUE AND LET YOU KNOW IF ANYTHING NEEDS TO BE ADDED, DELETED, OR CHANGED IN THIS LIST.
 -->

* [AEM Content Fragment with GraphQL Index Package 1.0.5](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Fadobe%2Fpackages%2Fcq650%2Ffeaturepack%2Fcfm-graphql-index-def-1.0.5.zip)
  This package is needed for customers using GraphQL; this enables them to add the required index definition based on the features they actually use.

* As [!DNL Microsoft&reg; Windows Server 2019] does not support [!DNL MySQL 5.7] and [!DNL JBoss&reg; EAP 7.1], [!DNL Microsoft&reg; Windows Server 2019] does not support turnkey installations for [!DNL AEM Forms 6.5.10.0].

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

The following text documents list the OSGi bundles and Content Packages included in [!DNL Experience Manager] 6.5.16.0: <!-- UPDATE FOR EACH NEW RELEASE -->

* [List of OSGi bundles included in Experience Manager 6.5.16.0](/help/release-notes/assets/65150_bundles.txt) <!-- UPDATE FOR EACH NEW RELEASE -->
* [List of Content Packages included in Experience Manager 6.5.16.0](/help/release-notes/assets/65150_packages.txt) <!-- UPDATE FOR EACH NEW RELEASE -->

## Restricted websites {#restricted-sites}

These websites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact Adobe Customer Support](https://experienceleague.adobe.com/docs/customer-one/using/home.html).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] product page](https://business.adobe.com/products/experience-manager/adobe-experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/docs/experience-manager-65.html)
>* [Subscribe to Adobe priority product updates](https://www.adobe.com/subscription/priority-product-update.html)

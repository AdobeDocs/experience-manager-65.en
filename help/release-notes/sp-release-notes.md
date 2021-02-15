---
title: Adobe Experience Manager 6.5 Service Pack Release Notes
description: Release notes specific to Adobe Experience Manager 6.5 Service Pack 8
docset: aem65
mini-toc-levels: 1
---

# [!DNL Adobe Experience Manager] 6.5 Service Pack Release Notes {#aem-service-pack-release-notes}

## Release information {#release-information}

| Products | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.8.0                      |
| Type     | Service Pack Release         |
| Date     | February 25, 2021                |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.8.zip) |

<!-- TBD: Update the SD link when SP8 is available. -->

## What's included in [!DNL Adobe Experience Manager] 6.5.8.0 {#what-s-included-in-aem}

[!DNL Adobe Experience Manager] 6.5.8.0 is an important update that includes new features, key customer requested enhancements, and performance, stability, and security improvements, that are released since the availability of 6.5 release in April 2019. The service pack is installed on [!DNL Adobe Experience Manager] 6.5.

The key features and enhancements introduced in [!DNL Adobe Experience Manager] 6.5.8.0 are:

* key feature 1

* The built-in repository (Apache Jackrabbit Oak) is updated to version [TBD].

For a complete list of features and enhancements introduced in [!DNL Experience Manager] 6.5.8.0, see [What is new in [!DNL Adobe Experience Manager] 6.5 Service Pack 8](new-features-latest-service-pack.md).

The following is the list of fixes provided in [!DNL Experience Manager] 6.5.8.0 release.

### [!DNL Sites] {#sites-6580}

* When a page is moved to blueprint, the destination of links is not updated (NPR-35724).
* Tizen based player fails to authenticate on certain browsers. The issue occurs with browsers that do not support the samesite=none attribute (NPR-35589).
* An unlocked responsive container does not display allowed components (NPR-35565).
* When you create a live copy of a newly added page, the language master creates two copies for each domain (NPR-35545).
* The timer thread-locks sometimes and blocks some other threads. Hence, the AEM instance stops responding for an indefinite time (NPR-35534).
* When you search a specific asset in the side rail, the result contains some not-searched assets (NPR-35524).
* When you enable SSL for an Experience Manager instance, the context path is removed (NPR-35477).
* When you create a list, add some text as the first element, add a table as the second element, and add a list inside the table, the parent list distorts (NPR-35465).
* When you use different plugins on consecutive list items, an extra <br> tag is added to the list items (NPR-35464).
* When a list is placed between two paragraphs, you cannot add a table to the list (NPR-35356).
* When you start an AEM instance upgrade from AEM 6.3 to AEM 6.5, the upgrade instance takes longer to start (NPR-35323).
* When you replicate an AEM asset that includes a bracket (). in the name, the replication fails (GRANITE-27004).
* When you add headings to a Rich Text Editor, the paragraph button is disabled (NPR-35256).
* When you add an item to an existing list, it deletes the succeeding collapsible or toggle list (NPR-35206).
* When the Rollout page option is selected, a dialog box with all the available live copies appears, and automatic rollout takes place. The live copies of pages are rolled out to all geographies without user action (NPR-35138).
* When you use the include children option, the Manage Publication option does not list all pages. Only 22 pages are listed (NPR-35086). 
* When a policy is edited, the text component does not retain the policy changes (NPR-35070).
* When indenting some items in a numbered list, all items keep the same number although numbering should start from 1 for items with the same indentation (CQ-4313011).
* When minification is enabled, you are not able to edit any page or component. The issues started after installing AEM 6.5 Service Pack 7 (CQ-4311133).
* Omni search and asset filters return irrelevant or no results (CQ-4312322).
* When multiple pages simultaneously access a client library, the HTML library manager fails to load the client library. It leads to the incorrect rendering of pages (NPR-35538).
* The context path gets removed automatically when you set up an SSL in [!DNL Experience Manager] (NPR-35294).
* Package manager does not logout users after clicking the Logout option (NPR-35160).

### [!DNL Assets] {#assets-6580}

[!DNL Adobe Experience Manager] 6.5.8.0 [!DNL Assets] fixes the following issues and provides the following enhancements.

* Upon restoring a previous version of an asset, the event DamEvent.Type RESTORED is not triggered in the OSGi console (NPR-35789).
* `IndexWriter.merge` causes `OutOfMemoryError` error as smart tagging functionality creates large `/oak:index/lucene` and `/oak:index/ntBaseLucene` indices (NPR-35709).
* An error message is displayed when trying to save an [!UICONTROL Asset Contribution] type folder with multibyte characters in the name (NPR-35605).
* When cascading metadata sub-type fields are used, an incorrect 'Please fill out this field' error occurs (NPR-35643).
* When an existing asset is dragged on the [!DNL Assets] user interface and a new version is created, the changes in the metadata are not persistent (NPR-34940).
* When creating rules in metadata schema editor for a cascading menu, the [!UICONTROL Dependant On] option repeats the same name (NPR-35596).
* Similarity search does not work after editing [!UICONTROL Assets Admin Search Rail] (NPR-35588).
* From within a folder if you open asset search in the left rail by clicking [!UICONTROL Filter], the filter in [!UICONTROL Status] > [!UICONTROL Checkout] > [!UICONTROL Checked out] does not work (NPR-35530).
* If you attempt to delete all Smart Tags of an asset and save the changes, the tags are not removed even though the user interface indicates that the changes are saved (NPR-35519).
* Users are not able to rearrange or sort assets in list view in an orderable folder (NPR-35516).
* If you edit the default metadata schema, the tags field in asset's [!UICONTROL Properties] page changes into a text field. This allows unaware users to add tags in an ad-hoc manner and tags are stored as a string in the repository (NPR-35478).
* When downloading an asset, if you provide a name that does not have a valid email address, the download option is unavailable. However, if another option in the download dialog is selected, the button is enabled, but an email is not sent (NPR-35365).
* Users are unable to check-in assets after editing those in [!DNL Adobe InDesign] and receive error about lack of permissions (NPR-35341).
* Handlebars JavaScript library is upgraded to v4.7.6 (NPR-35333).
* Metadata editor interface stops working as expected when you start from bulk metadata edit and de-select items until a single item remains selected (NPR-35144).
* Global navigation does not open the correct console when clicked from within `assets.html` page (CQ-4312311).
* [!DNL Assets] does not display RGB rendition for an asset that has RGB rendition (CQ-4310190).
* The [!UICONTROL Relate] option in menu is not displayed properly in the [!UICONTROL Properties] page (CQ-4310188).
* If filetype filter for documents is used to search assets and create a Smart Collection, the filter is not applied when the collection is accessed. Instead, all types of assets are displayed in the search (NPR-35759).
* You cannot drag and add assets in a Lightbox from the [!DNL Assets] user interface (NPR-35901).

#### [!DNL Dynamic Media] {#dynamic-media-6580}

* The URL option for RESS image preset is enabled on the asset details page. Now, both URL and RESS options are available on the asset details page when RESS image preset is selected in the dynamic renditions section. (CQ-4311241)
* Interactive media component - interactive video does not work if the user has [!DNL Experience Manager] with selective publish configuration (CQ-4311054).
* If you move assets across folders, the synchronization between [!DNL Experience Manager] and [!DNL Dynamic Media–Scene7] via API is very slow (CQ-4310001).
* When using Omnisearch, the size of the logs increases significantly (CQ-4309153).
* When selective sync is enabled and an asset is copied (not moved) into a sync folder it does not sync as expected (CQ-4307122).
* For uploaded assets that get auto-published to DM, the status does not display Published on AEM. Also, the Dynamic Media Publish status column does not show the correct published status (CQ-4306415).

### [!DNL Commerce] {#commerce-6580}

* Unable to create a custom tag for all products in Commerce (CQ-4310682).

* Product asset reference update causes replication threads to be in the wait state until the ProductAssetListener thread completes its commits to the JCR (NPR-35269).

### Platform {#platform-6580}

* When you use a Coral Tab View component with no tabs and then trigger a Foundation validator, the following error occurs (NPR-35636):

  ```TXT
   Uncaught TypeError: Cannot set property 'invalid' of undefined
    at enable (foundation.js:10703)
    at foundation.js:10710
  ```

* SCD forward replication fails for Delete events for nodes that include a comma in the name (NPR-35191).

* After you upgrade to AEM 6.5.7, the builds start failing. The reason is, an old version or no of jackson-core is embedded in the uber-jar (GRANITE-33006).

### User Interface {#ui-6580}

* When you switch from Card view to List view for documents in a folder in the Assets console, sorting does not work appropriately (NPR-35842).

* When you hyperlink text in a text component, the search feature does not display appropriate results (NPR-35849).

* When a value is not provided to a hidden field that is marked required, it blocks you from saving a component (NPR-35219).

### Integrations {#integrations-6580}

* When you use different values for IMS Tenant ID and Target Client code, [!DNL Experience Manager] fails to integrate with [!DNL Adobe Target] (NPR-35342).

### Translation Projects {#translation-6580}

* Issues when exporting or importing a translation job in [!DNL Experience Manager] (NPR-35259).

### Campaign {#campaign-6580}

* When you create a campaign page using an out-of-the-box template in Touch UI and open the Email tab on the page properties dialog, the personalization variable for the subject and body fields remains disabled (CQ-4312388).

### [!DNL Communities] {#communities-6580}

* On adding a page structure to a community group, the [!UICONTROL Group] title in the breadcrumb is changed to the title of the first [!UICONTROL Page] (NPR-35803).
* Unlike moderators, a standard community member is not able to access and edit any draft post (NPR-35339).
* Broken access control and denial of service with DSRPReindexServlet which brings the communities site down until the indexing is complete (NPR-35591).
* Removing [!UICONTROL All Users] from the [!UICONTROL Administrators] field does not actually remove them from the back-end (NPR-35592, NPR-35611).
* The [!UICONTROL Compose Message] component does not return any result when the entered text is a partial-match (NPR-35666).

### [!DNL Brand Portal] {#brandportal-6580}

* Adding a member to an [!UICONTROL Asset Contribution] type folder shows [!UICONTROL Add User or Group] caption in the user interface, although only Brand Portal active users are supported and not groups (NPR-35332).

### [!DNL Forms] {#forms-6580}

>[!NOTE]
>
>[!DNL Experience Manager Forms] releases the add-on packages one week after the scheduled [!DNL Experience Manager] Service Pack release date.

For information on security updates, see [Experience Manager security bulletins page](https://helpx.adobe.com/security/products/experience-manager.html).

## Install 6.5.8.0 {#install}

**Setup requirements and more information**

* Experience Manager 6.5.8.0 requires Experience Manager 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions.
* The service pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html).
* On a deployment with MongoDB and multiple instances, install Experience Manager 6.5.8.0 on one of the Author instances using the Package Manager.

>[!NOTE]
>
>Adobe does not recommend removing or uninstalling the [!DNL Adobe Experience Manager] 6.5.8.0 package.

### Install the Service Pack {#install-service-pack}

Perform the following steps to install the Service Pack on an existing Adobe Experience Manager 6.5 instance:

1. Restart the instance before installation if the instance is in update mode (and this is the case when the instance was updated from an earlier version). Adobe also recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [Experience Manager] instance.

1. Download the service pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.7.zip).

1. Open Package Manager and click **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package and click **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>Dialog on Package Manager UI sometimes exits during the installation of the service pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installations is successful. Typically, this happens on [!DNL Safari] but can intermittently happen on any browser.

**Automatic installation**

There are two ways to automatically install Adobe Experience Manager 6.5.8.0 on a working instance:

A. Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.

B. Use the [HTTP API from Package Manager](https://docs.adobe.com/content/docs/en/crx/2-3/how_to/package_manager.html). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Adobe Experience Manager 6.5.8.0 does not support Bootstrap installation.

**Validate installation**

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.8.0)` under [!UICONTROL Installed Products].

1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.3 or later (Use Web Console: `/system/console/bundles`).

To know the platforms certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

### Install Adobe Experience Manager Forms add-on package {#install-aem-forms-add-on-package}

>[!NOTE]
>
>Skip if you are not using Experience Manager Forms. Fixes in Experience Manager Forms are delivered through a separate add-on package a week after the scheduled [!DNL Experience Manager] Service Pack release.

1. Ensure that you have installed the Adobe Experience Manager Service Pack.
1. Download the corresponding Forms add-on package listed at [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) for your operating system.
1. Install the Forms add-on package as described in [Installing AEM Forms add-on packages](../forms/using/installing-configuring-aem-forms-osgi.md#install-aem-forms-add-on-package).

>[!NOTE]
>
>AEM 6.5.8.0 includes a new version of [AEM Forms Compatibility Package](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html?lang=en#aem-65-forms-releases). If you are using an older version of AEM Forms Compatibility Package and updating to AEM 6.5.8.0, install the latest version of the package post installation of Forms Add-On Package.

### Install Adobe Experience Manager Forms on JEE {#install-aem-forms-jee-installer}

>[!NOTE]
>
>Skip if you are not using AEM Forms on JEE. Fixes in Adobe Experience Manager Forms on JEE are delivered through a separate installer.

For information about installing the cumulative installer for Experience Manager Forms on JEE and post-deployment configuration, see the [release notes](jee-patch-installer-65.md).

### UberJar {#uber-jar}

The UberJar for Experience Manager 6.5.8.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.7/).

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM:

```shell
<dependency>
     <groupId>com.adobe.aem</groupId>
     <artifactId>uber-jar</artifactId>
     <version>6.5.7</version>
     <scope>provided</scope>
</dependency>
```

>[!NOTE]
>
>UberJar and the other related artifacts are available on Maven Central Repository instead of Adobe Public Maven repository (`repo.adobe.com`). The main UberJar file is renamed to `uber-jar-<version>.jar`. So, there is no `classifier`, with `apis` as the value, for the `dependency` tag.

## Deprecated features {#removed-deprecated-features}

Below is a list of features and capabilities that are marked as deprecated with [!DNL Experience Manager] 6.5.7.0. Features are marked deprecated initially and later removed in a future release. An alternate option is usually provided.

Review if you use a feature or a capability in a deployment. Also, plan to change the implementation to use an alternate option.

| Area | Feature | Replacement |
|---|---|---|
| Integrations | The **[!UICONTROL AEM Cloud Services Opt-In]** screen is deprecated. With the Experience Manager and Adobe Target integration updated in Experience Manager 6.5 to support the Adobe Target Standard API, which uses authentication via Adobe IMS and I/O, and the growing role of Adobe Launch for instrumenting Experience Manager pages for analytics and personalization, the Opt-In wizard has become functionally irrelevant. | Configure system connections, Adobe IMS authentication, and [!DNL Adobe I/O] integrations via the respective Experience Manager cloud services. |
| Connectors | The Adobe JCR Connector for Microsoft SharePoint 2010 and Microsoft SharePoint 2013 is deprecated for Experience Manager 6.5. | N/A |

## Known issues {#known-issues}

* If you face issues in [!DNL Experience Manager] response due to locked Component Registry timer, [install this package](https://mvnrepository.com/artifact/org.apache.felix/org.apache.felix.scr/2.1.20). The resolution to these issues is scheduled to be included in the next [Experience Manager Service Pack release](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/update-releases-roadmap.html?lang=en#aem-on-prem-managed-services).

* Ignore the following errors in the `error.log` file during the installation of Experience Manager 6.5.7.0:

   ```TXT
   com.day.cq.dam.cq-dam-core bundle com.day.cq.dam.cq-dam-core:5.12.276 (331)[com.day.cq.dam.core.impl.collection.CollectionCreationListenerDummy] :  Cannot register component (org.osgi.service.component.ComponentException: The component name 'com.day.cq.dam.core.impl.collection.CollectionCreationListenerDummy' has already been registered by Bundle 331 (com.day.cq.dam.cq-dam-core) as Component of Class com.day.cq.dam.core.impl.collection.CollectionCreationListenerDummy)

   com.day.cq.dam.cq-dam-core bundle com.day.cq.dam.cq-dam-core:5.12.276 (331)[com.day.cq.dam.core.impl.team.MediaPortalShareHandlerDummy(1314)] : Could not load implementation object class com.day.cq.dam.core.impl.team.MediaPortalShareHandlerDummy (java.lang.ClassNotFoundException: com.day.cq.dam.core.impl.team.MediaPortalShareHandlerDummy not found by com.day.cq.dam.cq-dam-core [331])

   com.day.cq.dam.cq-dam-core bundle com.day.cq.dam.cq-dam-core:5.12.276 (331)[com.day.cq.dam.core.impl.collection.CollectionCreationListenerDummy(1316)] : Could not load implementation object class com.day.cq.dam.core.impl.collection.CollectionCreationListenerDummy (java.lang.ClassNotFoundException: com.day.cq.dam.core.impl.collection.CollectionCreationListenerDummy not found by com.day.cq.dam.cq-dam-core [331])

   com.day.cq.dam.cq-dam-core bundle com.day.cq.dam.cq-dam-core:5.12.276 (331)[com.day.cq.dam.core.impl.team.MediaPortaltRoleProviderDummy(1315)] : Could not load implementation object class com.day.cq.dam.core.impl.team.MediaPortaltRoleProviderDummy (java.lang.ClassNotFoundException: com.day.cq.dam.core.impl.team.MediaPortaltRoleProviderDummy not found by com.day.cq.dam.cq-dam-core [331])

   com.day.cq.dam.cq-dam-core bundle com.day.cq.dam.cq-dam-core:5.12.276 (331)BundleComponentActivator : Unexpected failure enabling component holder com.day.cq.dam.core.impl.collection.CollectionCreationListenerDummy (java.lang.IllegalStateException: Could not load implementation object class com.day.cq.dam.core.impl.collection.CollectionCreationListenerDummy)

   com.day.cq.dam.cq-dam-core bundle com.day.cq.dam.cq-dam-core:5.12.276 (331)BundleComponentActivator : Unexpected failure enabling component holder com.day.cq.dam.core.impl.team.MediaPortaltRoleProviderDummy (java.lang.IllegalStateException: Could not load implementation object class com.day.cq.dam.core.impl.team.MediaPortaltRoleProviderDummy)

   com.day.cq.dam.cq-dam-core bundle com.day.cq.dam.cq-dam-core:5.12.276 (331)[com.day.cq.dam.core.impl.team.MediaPortaltRoleProviderDummy] :  Cannot register component (org.osgi.service.component.ComponentException: The component name 'com.day.cq.dam.core.impl.team.MediaPortaltRoleProviderDummy' has already been registered by Bundle 331 (com.day.cq.dam.cq-dam-core) as Component of Class com.day.cq.dam.core.impl.team.MediaPortaltRoleProviderDummy)

   com.day.cq.dam.cq-dam-core bundle com.day.cq.dam.cq-dam-core:5.12.276 (331)[com.day.cq.dam.core.impl.team.MediaPortalShareHandlerDummy] :  Cannot register component (org.osgi.service.component.ComponentException: The component name 'com.day.cq.dam.core.impl.team.MediaPortalShareHandlerDummy' has already been registered by Bundle 331 (com.day.cq.dam.cq-dam-core) as Component of Class com.day.cq.dam.core.impl.team.MediaPortalShareHandlerDummy)

   com.day.cq.dam.cq-dam-core bundle com.day.cq.dam.cq-dam-core:5.12.276 (331)BundleComponentActivator : Unexpected failure enabling component holder com.day.cq.dam.core.impl.team.MediaPortalShareHandlerDummy (java.lang.IllegalStateException: Could not load implementation object class com.day.cq.dam.core.impl.team.MediaPortalShareHandlerDummy)
   ```

* If you are upgrading your [!DNL Experience Manager] instance from 6.5 to 6.5.7.0 version, you can view `RRD4JReporter` exceptions in the `error.log` file. Restart the instance to resolve the issue.

* If you install [!DNL Experience Manager] 6.5 Service Pack 5 or a previous service pack on [!DNL Experience Manager] 6.5, the runtime copy of your assets custom workflow model (created in `/var/workflow/models/dam`) is deleted.
To retrieve your runtime copy, Adobe recommends to synchronize the design-time copy of the custom workflow model with its runtime copy using the HTTP API:
`<designModelPath>/jcr:content.generate.json`.

* Contact Adobe Customer Care if you encounter issues when editing and creating cascading rules in [!UICONTROL Folder Metadata Schema Forms Editor] and [!UICONTROL Metadata Schema Forms Editor] using [!UICONTROL Define Rule] dialog. The rules that are already created and saved are working as expected.

* If a folder in the hierarchy is renamed in [!DNL Experience Manager Assets] and the nested folder containing an asset is published to [!DNL Brand Portal], the title of the folder is not updated in [!DNL Brand Portal] until the root folder is published again.

* When a user selects to configure a field for the first time in an adaptive form, the option to save a configuration does not display in Properties Browser. Selecting to configure some other field of the adaptive form in the same editor resolves the issue.

* If [!UICONTROL Connected assets configuration] wizard returns a 404 error message after installation, manually reinstall the `cq-remotedam-client-ui-content` and `cq-remotedam-client-ui-components` packages using the Package Manager.

* The following errors and warning messages may display during installation of Experience Manager 6.5.x.x:
  * “When the Adobe Target integration is configured in Experience Manager using the Target Standard API (IMS authentication), then exporting Experience Fragments to Target results in wrong offer types getting created. Instead of type “Experience Fragment”/source “Adobe Experience Manager,” Target creates several offers with type “HTML”/source “Adobe Target Classic.”
  * `com.adobe.granite.maintenance.impl.TaskScheduler`: No maintenance windows found at granite/operations/maintenance.
  * Adaptive Form server-side validation fails when aggregate functions such as SUM, MAX, and MIN are used. CQ-4274424
  * `com.adobe.granite.maintenance.impl.TaskScheduler` - No maintenance windows found at granite/operations/maintenance.
  * Hotspot in a Dynamic Media interactive image is not visible when previewing the asset through Shoppable Banner viewer.

## OSGi bundles and content packages included {#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in [!DNL Experience Manager] 6.5.8.0:

* [List of OSGi bundles included in Experience Manager 6.5.8.0](assets/6570_bundles.txt)

* [List of Content Packages included in Experience Manager 6.5.8.0](assets/6570_packages.txt)

## Restricted websites {#restricted-sites}

These websites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* See [how to contact customer support](https://experienceleague.adobe.com/docs/customer-one/using/home.html).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] 6.5 release notes](/help/release-notes/release-notes.md)
>* [[!DNL Experience Manager] product page](https://www.adobe.com/marketing/experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/docs/experience-manager-65.html)
>* Subscribe to [Adobe priority product updates](https://www.adobe.com/subscription/priority-product-update.html)

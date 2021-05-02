---
title: [!DNL Experience Manager] 6.5 service pack release notes
description: Release notes specific to [!DNL Adobe Experience Manager] 6.5 service pack 8
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
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.8.zip) |

<!-- TBD: Update the SD link when SP8 is available. Same link is duplicated below in install -->

## What is included in [!DNL Adobe Experience Manager] 6.5.9.0 {#what-s-included-in-aem}

[!DNL Adobe Experience Manager] 6.5.9.0 includes new features, key customer-requested enhancements, and performance, stability, and security improvements, that are released since the availability of 6.5 release in April 2019. The service pack is installed on [!DNL Adobe Experience Manager] 6.5.

The key features and enhancements introduced in [!DNL Adobe Experience Manager] 6.5.9.0 are:

<!-- TBD:
* Using the Connected Assets functionality, it is now possible to connect up to 3 [!DNL Sites] instances with 1 [!DNL Assets] instances. The configuration user interface now allows the administrators to provide the details of these [!DNL Sites] instances. -->

* Key feature 1

* Key feature 2

For a complete list of features and enhancements introduced in [!DNL Experience Manager] 6.5.9.0, see [what is new in [!DNL Adobe Experience Manager] 6.5 Service Pack 9](new-features-latest-service-pack.md).

The following is the list of fixes provided in [!DNL Experience Manager] 6.5.9.0 release.

### [!DNL Sites] {#sites-6590}

* Bug fix 1

### [!DNL Assets] {#assets-6590}

[!DNL Adobe Experience Manager] 6.5.9.0 [!DNL Assets] fixes the following issues and provides the following enhancements.

* To verify that a hidden predicate is working after the change, [!DNL Experience Manager] checks that any hidden folder is not displayed on the interface. To improve performance, the `hidden=false` condition is moved from JCR query to QueryBuilder evaluator (NPR-36291).

* Added a global [!DNL Dynamic Media] configuration to prevent any synchronize, publish, or upload actions to [!DNL Dynamic Media] from [!DNL Experience Manager]. This configuration overrides all the other configurations, for example selective sync (NPR-36280).

* Asset Livecopy rendition can be modified without cancelling the inheritance (NPR-36234).

* Custom `ViewerPresets` and CSS are not replicated to [!DNL Dynamic Media] when [!DNL Dynamic Media] is activated selectively and disabled by default (NPR-36232).

* The tags created from within a tag selection element in a [!UICONTROL Folder Metadata Schema] form are not saved (NPR-36119).

* You can use ellipsis as an annotation to review assets. When a small ellipses is used, the ellipse overlaps with the number of the annotation in the print version (NPR-36114).

* In Column view, in some cases, [!DNL Experience Manager] does not prompt for duplicate asset conflict when a duplicate asset is uploaded (NPR-36048).

* Share Link dialog does not close by clicking close button if it is opened and no changes are made (NPR-36030).

#### [!DNL Dynamic Media] {#dynamic-media-6590}

* Bug fix 1

### [!DNL Commerce] {#commerce-6590}

* Bug fix 1

### Platform {#platform-6590}

* Bug fix 1

### User Interface {#ui-6590}

* Bug fix 1

### Integrations {#integrations-6590}

* Bug fix 1

### Translation projects {#translation-6590}

* Bug fix 1

### Campaign {#campaign-6590}

* Bug fix 1

### [!DNL Communities] {#communities-6590}

* Bug fix 1

### [!DNL Brand Portal] {#brandportal-6590}

* Bug fix 1

### [!DNL Forms] {#forms-6590}

>[!NOTE]
>
>[!DNL Experience Manager Forms] releases the add-on packages one week after the scheduled [!DNL Experience Manager] Service Pack release date.

* Bug fix 1

For information on security updates, see [Experience Manager security bulletins page](https://helpx.adobe.com/security/products/experience-manager.html).

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

1. Download the service pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.8.zip).

1. Open Package Manager and click **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package and click **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>Dialog on Package Manager UI sometimes exits during the installation of the service pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installations is successful. Typically, this happens on [!DNL Safari] but can intermittently happen on any browser.

**Automatic installation**

There are two ways to automatically install Adobe Experience Manager 6.5.9.0 on a working instance:

A. Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.

B. Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Adobe Experience Manager 6.5.9.0 does not support Bootstrap installation.

**Validate installation**

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.9.0)` under [!UICONTROL Installed Products].

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
>AEM 6.5.9.0 includes a new version of [AEM Forms Compatibility Package](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html?lang=en#aem-65-forms-releases). If you are using an older version of AEM Forms Compatibility Package and updating to AEM 6.5.9.0, install the latest version of the package post installation of Forms Add-On Package.

### Install Adobe Experience Manager Forms on JEE {#install-aem-forms-jee-installer}

>[!NOTE]
>
>Skip if you are not using AEM Forms on JEE. Fixes in Adobe Experience Manager Forms on JEE are delivered through a separate installer.

For information about installing the cumulative installer for Experience Manager Forms on JEE and post-deployment configuration, see the [release notes](jee-patch-installer-65.md).

>[!NOTE]
>
>After installing the cumulative installer for Experience Manager Forms on JEE, install the latest Forms add-on package, delete the Forms add-on package from the `crx-repository\install` folder, and restart the server.

### UberJar {#uber-jar}

The UberJar for Experience Manager 6.5.9.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.8/).

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM:

```shell
<dependency>
     <groupId>com.adobe.aem</groupId>
     <artifactId>uber-jar</artifactId>
     <version>6.5.8</version>
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

* If you are upgrading your [!DNL Experience Manager] instance from 6.5 to 6.5.9.0 version, you can view `RRD4JReporter` exceptions in the `error.log` file. Restart the instance to resolve the issue.

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
  * Adaptive Form server-side validation fails when aggregate functions such as SUM, MAX, and MIN are used (CQ-4274424).
  * `com.adobe.granite.maintenance.impl.TaskScheduler` - No maintenance windows found at granite/operations/maintenance.
  * Hotspot in a Dynamic Media interactive image is not visible when previewing the asset through Shoppable Banner viewer.
  * `com.adobe.cq.social.cq-social-jcr-provider bundle com.adobe.cq.social.cq-social-jcr-provider:1.3.5 (395)[com.adobe.cq.social.provider.jcr.impl.SpiSocialJcrResourceProviderImpl(2302)]` : Timeout waiting for reg change to complete unregistered.

## OSGi bundles and content packages included {#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in [!DNL Experience Manager] 6.5.9.0:

* [List of OSGi bundles included in Experience Manager 6.5.9.0](assets/6580_bundles.txt)

* [List of Content Packages included in Experience Manager 6.5.9.0](assets/6580_packages.txt)

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

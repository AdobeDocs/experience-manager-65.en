---
title: AEM 6.5 Service Pack Release Notes
description: Release notes specific to Adobe Experience Manager 6.5 Service Pack 4.
uuid: c7bc3705-3d92-4e22-ad84-dc6002f6fa6c
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5
discoiquuid: 25542769-84d1-459c-b33f-eabd8a535462
docset: aem65
mini-toc-levels: 1
---

# Adobe Experience Manager 6.5 Service Pack Release Notes {#aem-service-pack-release-notes}

## Release Information {#release-information}

| Products |**Adobe Experience Manager 6.5** |
|---|---|
| Version |6.5.4.0 |
| Type |Service Pack Release |
| Date |March 05, 2020 |
| Download URL | [PackageShare](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq650/servicepack/AEM-6.5.4.0), [Software Distribution(Beta)](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.4.zip) |

## What's included in Adobe Experience Manager 6.5.4.0 {#what-s-included-in-aem}

Adobe Experience Manager 6.5.4.0 is an important update that includes new features, key customer requested enhancements and performance, stability, security improvements, released since the general availability of 6.5 release in **April 2019**. It can be installed on top of Adobe Experience Manager (AEM) 6.5.

Some key features and enhancements introduced in AEM 6.5.4.0 include:

* AEM Assets is now configured with Brand Portal through Adobe I/O Console.

* A new [Generate printable Output](../forms/using/aem-forms-workflow-step-reference.md) step is now available for AEM Forms workflows.

* [Multi-column support](../forms/using/resize-using-layout-mode.md) for layout mode for adaptive forms and Interactive Communications.

* Support for [Rich Text](../forms/using/designing-form-template.md) in HTML5 forms.

* [Accessibility enhancements](new-features-latest-service-pack.md#accessibility-enhancements) in Experience Manager Assets.

* The built-in repository (Apache Jackrabbit Oak) is updated to version 1.10.8.

* You can now sync selective content subtrees to *Dynamic Media - Scene7 mode* instead of all available at `content/dam`.

* Form data model integration with SOAP web service now supports choice groups or attributes on elements.

* SOAP input or output and complex data structures now support Dynamic Group Substitution.

For complete list of features, key highlights, key features introduced in previous AEM 6.5 service packs, see [What's new in Adobe Experience Manager 6.5 Service Pack 4](new-features-latest-service-pack.md).

### Sites {#sites-fixes}

* When a URL of an AEM Sites pages contains a colon ( : ) or percentage symbol (%), the underlying browser stop responding and CPU cycles show a spike (NPR-32369, NPR-31918).

* When an AEM Sites page is opened for editing and a component is copied, the paste action remains unavailable for some placeholders (NPR-32317).

* When the Manage Publication wizard is opened, an Experience Fragment linked to a Core Component is not displayed in the lists of published references (NPR-32233).

* Live copy overview in Touch UI takes much longer than Classic UI to render (NPR-32149).

* When server-time and machine-time are in different time zones, scheduled publish time displays server time in Touch UI, whereas in Classic UI, machine time is displayed (NPR-32077).

* AEM Sites fails to open a page with a suffix in the URL (NPR-32072).

* When a user edits a Content Fragment, a deleted variation of the Content Fragment is restored (NPR-32062).

* Users are allowed to save a Content Fragment without providing any information in the required fields (NPR-31988).

* kernel.js and ui.js are not pre-complied or cached. It leads to additional time in rendering pages (NPR-31891).

* When PageEventAuditListener is enabled, the length of the commit queue increases. It impacts the performance of many operations such as bulk publishing, navigation, bulk asset movement (NPR-31890).

* When Experience Fragments are dragged, high response time is observed (NPR-31878).

* When you select the Drag component here option in a responsive grid’s placeholder, a GET request is sent and the request results in HTTP 403 error (NPR-31845).

* When moving the content within the same folder, the page move option is disabled (NPR-31840).

* In editable templates structure mode, the allowed components list in layout container displays incorrect results. Only components with design dialog are displayed in the layout container (NPR-31816).

* When a page has read-only permissions for a user, the Open properties option is visible in sites.html but not in editor.html (NPR-31770).

* When a user clicks the Create button, the page option is not available (NPR-31756).

* Unable to synchronize campaign in Adobe campaign containing OOTB (Out of the box) design importer component (NPR-31728).

* When you try to change a bullet list to numbered list, only the first two items of the list are changed (NPR-31636).

* When a page is un-authored and the child node is selected, the selection dialogue still displays the initial node. When the page is authored and user clicks browse, the page redirects to the root node instead of the authored node (NPR-31618).

* The view configuration dialog box does not work properly for Inbox customization workflow feature (NPR-32503 and NPR-32492).

* An error message displays while viewing workflow information using Inbox (CQ-4282168).

### Assets {#assets-6540-enhancements}

* The button to trigger workflow on assets collection page is disabled (NPR-32471).

* A folder with no name gets created in SPS (Scene7 Publishing System) while moving an asset from one folder to another in Experience Manager with Dynamic Media Scene7 configuration (NPR-32440).

* The action to move all the assets (using Select All and then move) to a folder containing published assets fails with error (NPR-32366).

* Rendition generation for assets with ${extension} fail (NPR-32294).

* Version history URLs are displayed under Referenced By field on assets Property page (NPR-31889).

* ZIP file downloaded from DAM can't be opened using WinZip (NPR-32293).

* Original permissions of a folder are updated when Folder Settings are opened to change folder title or thumbnail image and then saved (NPR-32292).

* Calendar icon for activation scheduled is not showing in Status column (in Classic UI of DAM asset listing) for assets the activation of which is scheduled for a later date and time (NPR-32291).

* Snippet creation using snippet templates gives error on searching for collections during the snippet creation process (NPR-32290).

* Multiple search queries get fired when multiple tags are selected from search filter (NPR-32143).

* Experience Manager Assets UI displays truncated filenames when assets with more than 50 characters in filename are uploaded (NPR-32054).

* All the check boxes in Filter panel are cleared when the first and the second check boxes are cleared, when level two check boxes of the check box tree in Adobe Stock were selected (NPR-31919).

* Files and Folder search using Omnisearch facets gives exception (NPR-31872).

* Field highlighting for mandatory field selection in metadata editor is not removed even after selecting the required field, when the dependency rules are set in corresponding metadata schema form (NPR-31834).

* Complete names of leaf level tags (from tags hierarchy) do not show in asset Properties page (NPR-31820).

* Use of back command from asset Properties page on Safari browser gives error (NPR-31753).

* Touch UI search (done through Omnisearch) results page automatically scrolls up and loses user's scroll position (NPR-31307).

* Assets detail page of PDF assets do not show action buttons except To Collection and Add Rendition buttons in Experience Manager running on Dynamic Media Scene7 run mode (CQ-4286705).

* Assets take too long to process through the batch upload process of Scene7 (CQ-4286445).

* Save button does not import Remote Set when user has not made any changes in Set Editor in Dynamic Media Client (CQ-4285690).

* 3D asset thumbnail is not informative, when a supported 3D model is ingested into AEM (CQ-4283701).

* The unprocessed status of smart crop video viewer preset appears twice on the banner text alongside the preset name (CQ-4283517).

* Incorrect container height of an uploaded 3D model previewed in 3D viewer is observed on asset’s details page (CQ-4283309).

* Carousel Editor does not open in IE 11 on Experience Manager Dynamic Media Hybrid mode (CQ-4255590).

* Keyboard focus gets stuck in Email drop-down in Download dialog, in Chrome and Safari browsers (NPR-32067).

* Sync all content checkbox is not enabled by default while trying to add DM cloud config on AEM (CQ-4288533).

### Foundation UI {#foundation-ui-6540}

* Mouse control shifts to previous filter field instead of staying in the existing filter field while searching assets using Filter panel (NPR-32538).

* Platform Tagging: Search for tags by typing in the tag fields shows tags outside the root boundaries and does not respect the `rootPath` property of tag fields (NPR-31895).

* Platform UI: Path browser breaks if invalid path is added in text field (NPR-31884).

* Notification gets hidden behind a sticky menu on page selection (NPR-31628).

### Platform {#platform-sling-6540}

* (HTL) Underscores replace colons in the path section of URL (NPR-32231).

### Projects {#projects-6540}

* Create button is not visible to the user even if the user has permission to create project in the subfolder (NPR-31832).

### Projects Translation {#projects-translation-6540}

* Translation project creation breaks the UI when the Trim Spaces option is activated in `Apache Sling JSP Script Handler` (NPR-32154).

* Error in UI and Null point exception in error logs is observed when any tag, to be translated, is added to a translation project (NPR-31896).

### Integrations {#integrations-6540}

* Launch library URL generation is based only on `path` and `library_name` values from the Launch API, and is not based on `library_path` value (NPR-31550).

* An error message displays while processing LiveFyre related items (FYR-12420).

### WCM Template Editor {#wcm-template-editor-6540}

* In editable templates structure mode, allowed components list in layout container is not displaying link button component (CQ-4282099).

### WCM Page Editor {#wcm-page-editor-6540}

* Error is observed on selecting an overlay and then selecting responsive grid Drag components here (CQ-4283342).

### Campaign Targeting {#campaign-targeting-6540}

* Target cloud configuration fails with the error get mboxes request failed (CQ-4279880).

### Brand Portal {#assets-brand-portal}

* Brand Portal users are not able to publish contribution folder assets to AEM Assets on upgrading to Adobe I/O on AEM 6.5.4 (CQDOC-15655). 

  This issue will be fixed in the next service pack AEM 6.5.5. 
  
  For immediate fix on AEM 6.5.4, it is recommended to [download the hotfix](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq650/hotfix/cq-6.5.0-hotfix-33041) and install on your author instance.


* Metadata schema drop-down values are not visible in asset properties(CQ-4283287).

* Metadata subschema do not display tabs based on mimetype in asset properties (CQ-4283288).

* Unpublish metadata schema populates an error message although the schema is removed at backend.

* Preview image do not display for a published asset (CQ-4285886).

* User is unable to publish or unpublish assets containing single quote in the name (CQ-4272686).

* Terms and conditions do not display while downloading multiple assets (CQ-4281224).

* Minor security vulnerabilities addressed.

### Communities {#communities}

* Create Member form is displayed as a blank page (NPR-31997).

* User is unable to view the Analytics report on author instance (NPR-30913).

### Oak- Indexing and Queries {#oak-indexing-6540}

* MS Word and MS Excel documents, containing JPEG image, when parsed with Tika parser fail to parse and class not found error is observed (NPR-31952).

### Forms {#forms-6530}

>[!NOTE]
>
>AEM Service Pack does not include fixes for AEM Forms. They are delivered using a separate Forms add-on package. In addition, a cumulative installer is released that includes fixes for AEM Forms on JEE. For more information, see [Install AEM Forms add-on](#install-aem-forms-add-on-package) and [Install AEM Forms on JEE](#install-aem-forms-jee-installer).

* Correspondence Management: Letters display extra characters after submission to post process workflows (NPR-32626).

* Correspondence Management: Letters display a drop-down placeholder as a text component after submission to post-process workflows (NPR-32539).

* Correspondence Management: The default values defined in the letter template do not display in the Preview mode (NPR-32511).

* Mobile Forms: The submit button displays as expanded in size while rendering an XDP form in an HTML version (NPR-32514).

* Document Services: URL access issues for Letters and some other pages after applying Service Pack 2 (NPR-32508, NPR-32509).

* Document Services: If the number of transactions on a server exceeds a specific limit, the HTML to PDF conversion fails and the file type settings are removed from AEM Forms server (NPR-32204).

* Adaptive Forms: Browser accessibility tool reports failures in adaptive forms according to the WCAG2 Level AA guidelines (NPR-32312, NPR-32309, CQ-4285439).

* Adaptive Forms: Chrome browser accessibility tool reports a best practice failure (NPR-32310).

* Adaptive Forms: Translation issues while configuring an adaptive form embedded in an AEM Sites page (NPR-32168).

* Workbench: An error message displays while using Get PDF Properties operation for PDF Utilities service (NPR-32150).

* Document Security: A protected PDF file fails to open offline with DisableGlobalOfflineSynchronizationData option set to True (NPR-32078).

* Designer: If the tagging option is enabled, the subform border disappears in the generated PDF output (NPR-32547, NPR-31983, NPR-31950).

* Designer: If there are merged cells in a table, the accessibility test fails for the output PDF file converted from an XDP form using the output service (CQ-4285372).

* Foundation JEE: If an AEM Forms server is disconnected from a cluster, caching issues prevent it from reconnecting to the server (NPR-32412).

## Install 6.5.4.0 {#install}

**Setup requirements**

* AEM 6.5.4.0 requires AEM 6.5. Check [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions.
* The Service Pack download is available on Adobe Package Share, which you can access directly from the AEM 6.5 instance.
* On a deployment with MongoDB and multiple instances, install AEM 6.5.4.0 on one of the Author instances using the Package Manager.
* Before installing the service pack, ensure to have a snapshot or fresh backup of your AEM instance.
* Restart the instance before installation. While that is only needed when the instance is still in update mode (and this is the case when the instance was updated from an earlier version), it is recommended if the instance was running for longer period.

>[!CAUTION]
>
>Adobe does not recommend removing or uninstalling the AEM 6.5.4.0 package.

### Install the Service Pack via Package Share {#install-service-pack-via-package-share}

Perform the following steps to install the Service Pack on an existing AEM 6.5 instance:

1. Login to Package Share from within AEM or directly from your browser and download the [AEM 6.5.4.0 package](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq650/servicepack/AEM-6.5.4.0).

1. Install the downloaded package using Package Manager.

>[!NOTE]
>
>**Dialog on Package Manager UI sometimes exits immaturely during installation of 6.5.4.0**
>
>Therefore, it is recommended to wait for error logs to stabilize before accessing the instance. The user has to wait for specific logs related to uninstallation of updater bundle before being ensured that the installations is successful. It generally happens on Safari but can intermittently happen on any browser.

**Automatic installation**

There are two ways to automatically install AEM 6.5.4.0 into a running instance:

A. Place the package into ..*/crx-quickstart/install* folder while the server is available online. The package gets installed automatically.

B. Use the [HTTP API from Package Manager](https://docs.adobe.com/content/docs/en/crx/2-3/how_to/package_manager.html) - make sure that you use cmd=install&recursive=true - so the nested packages  are  installed.

>[!NOTE]
>
>AEM 6.5.4.0 does not support Bootstrap installation.

**Validate installation**

1. The Product Information page (/system/console/ productinfo) displays the updated version string `Adobe Experience Manager, Version 6.5.4.0` under Installed Products.

1. All  OSGi  bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: /system/console/bundles).
1. The OSGI bundle org.apache.jackrabbit.oak-core is on version 1.10.6 or higher (Use Web Console: /system/console/bundles).

In order to see what platforms are certified to run with this release, please refer to the [Technical Requirements](/help/sites-deploying/technical-requirements.md).

### Install AEM Forms add-on package {#install-aem-forms-add-on-package}

>[!NOTE]
>
>Skip if you are not using AEM Forms. Fixes in AEM Forms are delivered through a separate add-on package.

>[!NOTE]
>
>AEM 6.5.4.0 includes a new version of [AEM Forms Compatibility package](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq650/compatpack/AEM-FORMS-6.5.3.0-COMPAT). If you are using an older version of AEM Forms Compatibility package and updating to AEM 6.5.4.0, install the latest version of AEM Forms Compatibility package post installation of Forms add-On Package.

1. Ensure that you have installed the AEM Service Pack.
1. Download the corresponding Forms add-on package listed at [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) for your operating system.
1. Install the Forms add-on package as described in [Installing AEM Forms add-on packages](../forms/using/installing-configuring-aem-forms-osgi.md#install-aem-forms-add-on-package).

### Install AEM Forms on JEE {#install-aem-forms-jee-installer}

>[!NOTE]
>
>Skip if you are not using AEM Forms on JEE. Fixes in AEM Forms on JEE are delivered through a separate installer.

For information about installing the cumulative installer for AEM Forms on JEE and post-deployment configuration, see the [release notes for patch 0011](https://helpx.adobe.com/aem-forms/quick-fixes/6-5/jee-patch-0011.html).

#### Workbench installer

As it is a full installer, the file size is more as compared to the patch version. Uninstall the previous Workbench version before installing the new one.

### UberJar {#uber-jar}

The UberJar for AEM 6.5.4.0 is available in the [Adobe Public Maven repository](https://repo.adobe.com/nexus/content/groups/public/com/adobe/aem/uber-jar/6.5.4/).

To use UberJar in a Maven project, refer to the article, [How to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM:

```shell
<dependency>
      <groupId>com.adobe.aem</groupId>
      <artifactId>uber-jar</artifactId>
      <version>6.5.4</version>
      <classifier>apis</classifier>
      <scope>provided</scope>
</dependency>
```

## Deprecated features {#removed-deprecated-features}

This section lists features and capabilities that have been marked as deprecated with AEM 6.5.4.0. Features that are planned to be removed in a future release are set to deprecated first, with an alternate option to use.

Customers are advised to review if they make use of the feature or capability in their current deployment, and make plans to change their implementation to use the alternate option.

| Area |Feature |Replacement |
|---|---|---|
| Integrations |The **[!UICONTROL AEM Cloud Services Opt-In]** screen has been deprecated. With the AEM and Target integration updated in AEM 6.5 to support the Target Standard API, which uses authentication via Adobe IMS and I/O, and the growing role of Adobe Launch for instrumenting AEM pages for analytics and personalization, the Opt-In wizard has become functionally irrelevant.  |Configure system connections, Adobe IMS authentication, and Adobe I/O integrations via respective AEM cloud services  |

## Known issues {#known-issues}

* If **Connected assets configuration** wizard returns a 404 error message after installation, manually reinstall the **cq-remotedam-client-ui-content** and **cq-remotedam-client-ui-components** packages using the Package Manager.
* The following errors and warning messages may display during installation of AEM 6.5.x.x:
  * “When the Target integration is configured in AEM using the Target Standard API (IMS authentication), then exporting Experience Fragments to Target results in wrong offer types getting created. Instead of type “Experience Fragment”/source “Adobe Experience Manager,” Target creates several offers with type “HTML”/source “Adobe Target Classic.”
  * com.adobe.granite.maintenance.impl.TaskScheduler: No maintenance windows found at granite/operations/maintenance.
  * Adaptive Form server-side validation fails when aggregate functions such as  SUM, MAX, and MIN are used. CQ-4274424
  * com.adobe.granite.maintenance.impl.TaskScheduler - No maintenance windows found at granite/operations/maintenance.
  * Hotspot in a Dynamic Media Interactive image is not visible while previewing the asset through Shoppable Banner viewer.

## OSGi bundles and content packages included {#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in AEM 6.5.4.0

List of OSGi bundles included in AEM 6.5.4.0

[Get File](assets/6540_bundles.txt)

List of Content Packages included in AEM 6.5.4.0

[Get File](assets/6540_packages.txt)

## Restricted sites {#restricted-sites}

These sites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact customer support](https://daycare.day.com/public/contact.html)
For more information on accessing the support portal, see [Accessing the support portal](https://helpx.adobe.com/experience-manager/kb/accessing-aem-support-portal.html).

>[!MORE LIKE THIS]
>
>* [AEM 6.5 release notes](/help/release-notes/release-notes.md)
>* [AEM product page](https://www.adobe.com/solutions/web-experience-management.html)
>* [AEM 6.5 documentation](https://helpx.adobe.com/support/experience-manager/6-5.html)
>* Subscribe to [Adobe priority product updates](https://www.adobe.com/subscription/priority-product-update.html)

---
title: Release Notes for [!DNL Adobe Experience Manager] 6.5
description: "[!DNL Adobe Experience Manager] 6.5 notes outlining the release information, what's new, how to install, and detailed change lists."
exl-id: 0288aa12-8d9d-4cec-9a91-7a4194dd280a
---
# [!DNL Adobe Experience Manager] 6.5 Latest Service Pack Release Notes {#aem-service-pack-release-notes}

## Release information {#release-information}

| Products | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.13.0                      |
| Type     | Service Pack release         |
| Date     | May 26, 2022               |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.13.0.zip) |

## What is included in [!DNL Adobe Experience Manager] 6.5.13.0 {#what-is-included-in-aem}

[!DNL Adobe Experience Manager] 6.5.13.0 includes new features, key customer-requested enhancements, and performance, stability, and security improvements, that are released since the availability of 6.5 release in April 2019. The service pack is installed on [!DNL Adobe Experience Manager] 6.5.

The key features and enhancements introduced in [!DNL Adobe Experience Manager] 6.5.13.0 are the following:

>[!IMPORTANT]
>
>WHO PROVIDES THIS CONTENT? I DON'T HAVE IT OR KNOW WHERE TO FIND IT.

The following issues are fixed in [!DNL Experience Manager] 6.5.13.0:

>[!IMPORTANT]
>
>WHO PROVIDES THIS CONTENT? I DON'T HAVE IT OR KNOW WHERE TO FIND IT.

## [!DNL Assets] {#assets-6513}

The following enhancements and fixes were made in [!DNL Assets]:

* When a dropdown is configured as Disable edit in the metadata schema, when editing an asset metadata and saving changes, the disabled Dropdown field value deleted. (NPR-38389)
* FFMpeg transcoding process step fails for mp4 without video, preventing workflow completion. (NPR-38116)
* Improvements in AssetReferenceSearch in 6.5. (NPR-38061)
* FFmpeg transcoding workflow failing for FLV Video profile. (CQ-4343249)
* Browser performance issues in Metadata editor. (CQ-4341359)
* Smart Collection issue when filtering by Publish status. (CQ-4341191)
* Unable to change Label "Sort by" and drop-down in Assets Console by language preference. (CQ-4339306)
* User experience issue with Metadata Schema rules for drop-down list. (ASSETS-9442)
* Assets Metadata disabled drop-down not retaining values. (ASSETS-8918)
* Unable to display correct annotation when asset is viewed using "More details" in Column view. (ASSETS-8851)
* Create version with a duplicate does not work. (ASSETS-8607)

* Asset able to be published while in 'Check Out' state by other non-admin user. (NPR-38128)
* Dimensional viewer is not functional on Chrome 97. (CQ-4340456)
* Asset download button does not show complete menu on the asset Details page. (CQ-4336703)
* Unlocalized "Allow download of renditions of file" and "Search/Add Email Address" strings in link sharing dialog box. (CQ-4330540)
* The string `[[0]] selected` is untranslated in Manage Publication Add Items dialog box. (CQ-4330491)

### [!DNL Dynamic Media] {#dynamic-media-6513}

The following issues are fixed in [!DNL Dynamic Media]:

<!-- VULNERABILITY ISSUE - REMOVED AND ADDED TO https://wiki.corp.adobe.com/display/DXContent/Security+and+Vulnerability+issues+for+SP+and+CFP+releases * Zero day exploit with the Java™ Spring Core Framework (CVE-2022-22963) impacting Adobe Experience Manager 6.5.12. (ASSETS-9031) -->
* Token based secure preview for Dynamic Media assets on AEM Authors. (ASSETS-4995)
* When creating an Image Preset for Dynamic Media in Experience Manager, the allowed maximum is limited to 2000x2000 pixels in the user interface. When the value is increased to 2001 pixels for either width or height, the **[!UICONTROL Save]** button is deactivated. (ASSETS-5691)
* User can prevent certain file formats from getting uploaded to Dynamic Media. (ASSETS-5693)
* Accessibility - Visually challenged users who rely on screen readers are getting impacted if the Alt attribute is not implemented on an image on Image presets user interface. (ASSETS-9817)
* Accessibility - Screen readers are getting impacted as screen readers narrate unlabeled image for the images present in the "Timeline segment" and in the "Actions" tab, when navigated to in the down arrow mode. (ASSETS-5651)
* Accessibility - Screen readers are getting impacted as Screen readers (NVDA/JAWS) do not narrate the Descriptive name (Send Email) for the "Send Email" button in the "EmailLink" dialog box in Video player, while navigating using (Browse/Cursor) modes. (ASSETS-5641)
* Accessibility - Keyboard focus is not moving to the "Redo" button which appears after invoking the "Undo" button in the Image Set Editor page, while navigating using the TAB key on the keyboard. (ASSETS-5582)
* Accessibility - Users who rely on screen readers are getting impacted as the Alt attribute is not provided for an Image Set image which is present under the Properties heading. (ASSETS-5576)
* Accessibility - Screen readers are not narrating the heading role for `Cannot save this set` text in the `Cannot save this set` alert, while navigating using heading shortcut key `H`, and Down Arrow key. (ASSETS-5569)
* Accessibility - Users who rely on screen readers are getting impacted to navigate through the forms. They find difficulties understanding the information about the form controls if NVDA is not narrating the label information for the "Width and height" spin controls, present under the Responsive Image Crop header while navigating in NVDA form mode ‘F’. (ASSETS-5393)
* After adding a Dynamic Media component on a site and after publishing the page, the newly added Dynamic Media asset is not visible on the published page, nor it is viewable in the Preview page. This issue occurred for both image and video asset types. (ASSETS-9467)

## Commerce {#commerce-6513}

The following issues are fixed in Commerce:

* "everyone" has jcr:write on `/content/usergenerated/etc/commerce/smartlists`. (NPR-35230)
* Local sorting of Commerce Products does not work anymore. (CQ-4343750)
* Unable to Quick Publish a product from search results page after changing properties. (CQ-4343318)

## CRX {#crx-6513}

The following issue is fixed in CRX:

* Not possible to download a package if it has the special character `+` in the package name. (NPR-38102)

## [!DNL Forms] {#forms-65130}

<!-- KHUSHWANT IS OVER THIS SECTION -->

>[!NOTE]
>
>* [!DNL Experience Manager Forms] releases the add-on packages one week after the scheduled [!DNL Experience Manager] Service Pack release date.

<!-- **Adaptive Forms**



**Form Data Model**



**Interactive Communication**



**Document Services**



**Document Security**



**Foundation JEE**



**Workflow** -->

## Granite {#granite-6513}

The following issues are fixed in Granite:

* Omnisearch returns result for users without read rights. (NPR-38373)
* Enable ES6 for `/libs/granite/configurations/clientlibs/confbrowser`. (NPR-38300)

## Integrations {#integrations-6513}

The following issue is fixed in Integrations:

* Leak of resource resolver sessions on Test and Target service from deprecated UserInfoServlet. (NPR-38112)
<!-- VULNERABILITY ISSUE - REMOVED AND ADDED TO https://wiki.corp.adobe.com/display/DXContent/Security+and+Vulnerability+issues+for+SP+and+CFP+releases * AEM‑OP‑13 ‑ HTTP Parameter Pollution in `com.day.cq.searchpromote.impl.servlet`. (NPR-38033) -->
<!-- VULNERABILITY ISSUE - REMOVED AND ADDED TO https://wiki.corp.adobe.com/display/DXContent/Security+and+Vulnerability+issues+for+SP+and+CFP+releases * Analytics 2.0 IMS support added to Experience Manager 6.5. (NPR-37914) -->

## Oak - Indexing and Queries {#oak-6513}

The following issue is fixed in Oak:

* The Oak version for 6.5.13.0 is now updated to 1.22.11. (NPR-38084)

<!-- VULNERABILITY ISSUE - REMOVED AND ADDED TO https://wiki.corp.adobe.com/display/DXContent/Security+and+Vulnerability+issues+for+SP+and+CFP+releases * Create a CFP based on latest 6.5.12 and update Oak-related bundle versions. (NPR-38144) -->

## Platform {#platform-6513}

The following issues are fixed in Platform:

<!-- VULNERABILITY ISSUE - REMOVED AND ADDED TO https://wiki.corp.adobe.com/display/DXContent/Security+and+Vulnerability+issues+for+SP+and+CFP+releases * RTC : Universal XSS through cq-rewriter HtmlParser. (NPR-38064) -->
* Upgrade dependency of `org.apache.httpcomponents.httpclient` in Experience Manager 6.5. (NPR-37999)
* High Author load due to path field suggestions. (CQ-4341826)
* User must refresh the page when they change the project from Card view to Calendar view. (CQ-4340368)
* Tags are lost due to permissions restrictions. (CQ-4339543)
* Multiple issues reported with Search and Filter in Path Selection not working. (CQ-4339402)
* Stop using DTM on 6.5 - switch to Launch for Omega Instrumentation and add Gainsight support. (CQ-4337809)
* Restrict pathfield component search function based on the pathfield filter property that is set. (CQ-4309556)
* Experience Manager Platform 6.5: Chinese Locale Naming Fixes. (CQ-4308978)
* Switch to Launch for Omega Instrumentation. (NPR-38377)
* Experience Manager Platform 6.5: Chinese locale-naming fixes. (CQ-4308978)

## Replication {#replication-6513}

The following issue is fixed in Replication:

* Publishing of user Node Failing from Author to Publisher. (NPR-38005)

## [!DNL Sites] {#sites-6513}

The following issues are fixed in [!DNL Sites]:

* If the customer is trying to access the editor of the content fragment models, they get a query error because of too many fragments on the dam. (SITES-6284)
* Virtual container support. (SITES-5762)
* Upgrading jquery-ui to latest version resulted in the breaking of the Editor. (SITES-5647)
* A moved page is broken after Service Pack 12 (6.5.12.0). (SITES-5298)
* Paths were getting deleted when AEM 6.5.12.0 was installed on existing 6.5.11.0 instance. (SITES-5088)
* Apple 6.5.10 system crashing when using CF model editor, due to erroneous feature toggle check. (SITES-4967)
* Adapt external index package to use selection Policy (fragment versus asset index). (SITES-4784)
<!-- VULNERABILITY ISSUE - REMOVED AND ADDED TO https://wiki.corp.adobe.com/display/DXContent/Security+and+Vulnerability+issues+for+SP+and+CFP+releases * Identify and remove Odin specific code from 6.5. (SITES-3574) -->
* Allow new email templated under campaign and ambit. (NPR-38445)
* TemplatedResource valueMap should allow deep reads as per ValueMap API. (NPR-38439)
* When selecting a style option on a component, the Styles box shifts to the upper left corner of the screen, rather than staying put below the style icon. Happens for components that have  cq:editConfig “afteredit: REFRESH_PAGE”. (NPR-38384)
* When out of the box components that don't have inlineEditing or dropTarget feature in the _cq_editConfig file (navigation, breadcrumb, embed) are deleted > undeleted (by way of Undo), all configurations are lost and empty placeholder reappears. Component must be reconfigured from scratch. (NPR-38361)
* Updated Image is not visible When a new image is dragged on top of an existing image the updated image is not visible in RTE - Classic UI. (NPR-38141)
* Some strings in the Content Fragment Model editor are not localized. (NPR-38126)
* For invalid tags, graceful handling of error message is not working as expected. (NPR-38106)
* The unique field validation query is now fixed. (NPR-38142)
* Text component is misaligned when added to nested Layout Containers. (NPR-38193)
* The "Approve for Adobe Campaign" workflow was only running for pages which are of type or extending the resource types: "mcm/neolane/components/newsletter", "mcm/campaign/components/newsletter" and "mcm/campaign/components/campaign_newsletterpage". (NPR-38204)
* Update of Content Fragment references is returning an invalid JSON response via Dispatcher. (NPR-38205)
* Content Fragment Model Rich Text Validation Prevents Blocks Saving a Content Fragment Model. (NPR-38210)
* Context hub UI models are not rendering properly without hard page refresh. (NPR-38212)
* Content Fragment issue with the boolean property not showing Field Text in "title" rather showing 'Property Name'. (NPR-38244)
* An unexpected error message is coming in Postman, when executing the graphQL persisted query having query variables. (NPR-38251)
* Job queue configuration is incorrect. (NPR-38269)
* Template changes do not get published until you publish a page that uses that template. (NPR-38274)
* Unclosed ResourceResolver in com.day.cq.wcm.workflow.impl.WcmWorkflowServiceImpl.autoSubmitPageAfterModification (NPR-38286)
* When using the Navigate to Page action in the References for an Experience Fragment, it opens the wrong page. (NPR-38062)
* Error while executing persisted query with query variable via Postman. (NPR-38057)
* After applying SP11 to the Publish instance of AEM 6.5.6, the display result of the Content Fragment set in the published page changes. (NPR-38055)
* The Configuration Manager now allows you to set the Content Fragment Model config on a sub-config folder. (NPR-38054)
* Cannot remove users from user groups. (NPR-38041)
* The property useLegacyResponsiveBehaviour only works when authenticated. (NPR-37996)
* When editing Content Fragment from the Assets Search Rail results page, it throws 'Not Found' error. (NPR-37810)
* Sites SEO enhancements to 6.5. (NPR-38219)
* Style tab is blank on components without styles/policies. (NPR-38218)
* Layout properties coming from XF Template not observed in side of a Page. (NPR-38214)

## Sling {#sling-6513}

The following issues are fixed in Sling:

* Memory leak in `DiscoveryLiteDescriptor`. (NPR-38288)
* Update `sling-javax.activation` bundle with fix of SLING-8777. (NPR-38077)
<!-- VULNERABILITY ISSUE - REMOVED AND ADDED TO https://wiki.corp.adobe.com/display/DXContent/Security+and+Vulnerability+issues+for+SP+and+CFP+releases * Security issues reported under `org.apache.sling.scripting.jst`. (NPR-38067) -->

## Translation projects {#translation-6513}

The following issues are fixed in translation projects:

* Multiple launches getting created for referenced pages/xf. (NPR-38263)
* Changed behavior of adding pages to translation projects since Service Pack 10. The translation project does not contain a newly created page [ex: test-page-women-2] on the list, when selected parent of the newly created page [not the newly created page directly]. (NPR-38256)
* Add `cq:isTranslationLaunch` property in Launches created by Translation Project. (NPR-38224)
* Launch is getting created for a page having a referenced XF which has an asset in it. (NPR-38199)
* Experience Manager update translation memory does not work. (NPR-38196)
* Enable ES6 for `/libs/cq/gui/components/projects/admin/translation/job/addcontent/clientlibs.js`. (NPR-38306)
* Latest 18n package for translations for Experience Manager 6.5. (CQ-4339505)

## User interface {#ui-6513}

The following issues are fixed in the user interface:

* When you are on start page > Tools section and click the Adobe Experience Manager icon, the Adobe Experience Manager Navigation screen should pop up. (NPR-38417)
* Enable ES6 for `/libs/granite/ui/references/clientlibs/coral/references`. (NPR-38303)
* Enable ES6 for `/libs/granite/datavisualization/clientlibs/d3-3.x`. (NPR-38302)
<!-- VULNERABILITY ISSUE - REMOVED AND ADDED TO https://wiki.corp.adobe.com/display/DXContent/Security+and+Vulnerability+issues+for+SP+and+CFP+releases * AEM‑OP‑09 ‑ Persistent cross‑site scripting selecting paths in templates. (NPR-38301) -->
* Date picker in touch UI displays in Korean. (NPR-38079)
* Authoring dialog with multifields, upon reordering the fields loosing the radio button selection value. (NPR-38063)

## WCM {#wcm-6513}

The following issue is fixed in WCM:

* Experience Manager MCM (Campaign) 6.5: Chinese Locale Naming Fixes. (CQ-4308973)

## Install 6.5.13.0 {#install}

**Setup requirements and more information** 

<!-- Remaining content from here to bottom stays the same except for version updating as needed -->

* Experience Manager 6.5.13.0 requires Experience Manager 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions.
* The service pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html).
* On a deployment with MongoDB and multiple instances, install Experience Manager 6.5.13.0 on one of the Author instances using the Package Manager.

>[!NOTE]
>
>Adobe does not recommend removing or uninstalling the [!DNL Adobe Experience Manager] 6.5.13.0 package.

### Install the service pack {#install-service-pack}

To install the service pack on an [!DNL Adobe Experience Manager] 6.5 instance, follow these steps:

1. Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the service pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.13.0.zip).

1. Open Package Manager and click **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package and click **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>Dialog on Package Manager UI sometimes exits during the installation of the service pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installations is successful. Typically, this issue occurs in [!DNL Safari] browser but can intermittently occur on any browser.

**Automatic installation**

There are two ways to automatically install [!DNL Experience Manager] 6.5.13.0 on a working instance:

A. Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.

B. Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Adobe Experience Manager 6.5.13.0 does not support Bootstrap installation.

**Validate the installation**

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.13.0)` under [!UICONTROL Installed Products].

1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.3 or later (Use Web Console: `/system/console/bundles`).

To know the platforms certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

### Install Adobe Experience Manager Forms add-on package {#install-aem-forms-add-on-package}

>[!NOTE]
>
>Skip if you are not using Experience Manager Forms. Fixes in Experience Manager Forms are delivered through a separate add-on package a week after the scheduled [!DNL Experience Manager] Service Pack release.

1. Ensure that you have installed the Adobe Experience Manager Service Pack.
1. Download the corresponding Forms add-on package listed at [AEM Forms releases](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html#forms-updates) for your operating system.
1. Install the Forms add-on package as described in [Installing AEM Forms add-on packages](/help/forms/using/installing-configuring-aem-forms-osgi.md#install-aem-forms-add-on-package).

### Install Adobe Experience Manager Forms on JEE {#install-aem-forms-jee-installer}

>[!NOTE]
>
>Skip if you are not using AEM Forms on JEE. Fixes in Adobe Experience Manager Forms on JEE are delivered through a separate installer.

For information about installing the cumulative installer for Experience Manager Forms on JEE and post-deployment configuration, see the [release notes](jee-patch-installer-65.md).

>[!NOTE]
>
>After installing the cumulative installer for Experience Manager Forms on JEE, install the latest Forms add-on package, delete the Forms add-on package from the `crx-repository\install` folder, and restart the server.

### UberJar {#uber-jar}

The UberJar for Experience Manager 6.5.13.0 is available in the [Maven Central repository](https://repo1.maven.org/maven2/com/adobe/aem/uber-jar/6.5.12/).

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM:

```shell
<dependency>
     <groupId>com.adobe.aem</groupId>
     <artifactId>uber-jar</artifactId>
     <version>6.5.13</version>
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
| Integrations | The **[!UICONTROL AEM Cloud Services Opt-In]** screen is deprecated since the [!DNL Experience Manager] and [!DNL Adobe Target] integration is updated in Experience Manager 6.5. The integration supports the Adobe Target Standard API. The API uses authentication by way of Adobe IMS and [!DNL Adobe I/O]. It supports the growing role of Adobe Launch to instrument [!DNL Experience Manager] pages for analytics and personalization, the opt-in wizard is functionally irrelevant. | Configure system connections, Adobe IMS authentication, and [!DNL Adobe I/O] integrations via the respective [!DNL Experience Manager] cloud services. |
| Connectors | The Adobe JCR Connector for Microsoft® SharePoint 2010 and Microsoft® SharePoint 2013 is deprecated for Experience Manager 6.5. | N/A |

## Known issues {#known-issues} 

<!-- THESE KNOWN ISSUES CARRY OVER EACH RELEASE. THE "PRODUCT UPDATES TEAM" IS SUPPOSED TO VERIFY EACH ISSUE AND LET YOU KNOW IF ANYTHING NEEDS TO BE ADDED, DELETED, OR CHANGED IN THE LIST.
 -->

* If you are using Content Fragments and GraphQL, Adobe recommends that you install the following packages on top of 6.5.12.0:

<!-- VULNERABILITY ISSUE - REMOVED AND ADDED TO https://wiki.corp.adobe.com/display/DXContent/Security+and+Vulnerability+issues+for+SP+and+CFP+releases * [AEM 6.5.12 Sites HotFix-NPR-38144](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Fadobe%2Fpackages%2Fcq650%2Fhotfix%2Faem-service-pkg-6.5.12.0-NPR-38144-B0002.zip) (this hot fix replaces SP12, but can be installed on top of SP12) -->
  
* [AEM Content Fragment with GraphQL Index Package 1.0.3](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Fadobe%2Fpackages%2Fcq650%2Ffeaturepack%2Fcfm-graphql-index-def-1.0.3.zip)

* As [!DNL Microsoft® Windows Server 2019] does not support [!DNL MySQL 5.7] and [!DNL JBoss® EAP 7.1], [!DNL Microsoft® Windows Server 2019] does not support turnkey installations for [!DNL AEM Forms 6.5.10.0].

* If you are upgrading your [!DNL Experience Manager] instance from 6.5 to 6.5.10.0 version, you can view `RRD4JReporter` exceptions in the `error.log` file. To resolve the issue, restart the instance.

* If you install [!DNL Experience Manager] 6.5 Service Pack 10 or a previous service pack on [!DNL Experience Manager] 6.5, the runtime copy of your assets custom workflow model (created in `/var/workflow/models/dam`) is deleted.
To retrieve your runtime copy, Adobe recommends to synchronize the design-time copy of the custom workflow model with its runtime copy using the HTTP API:
`<designModelPath>/jcr:content.generate.json`.

* Users can rename a folder in a hierarchy in [!DNL Assets] and publish a nested folder to [!DNL Brand Portal]. However, the title of the folder is not updated in [!DNL Brand Portal] until the root folder is republished.

* When a user selects to configure a field for the first time in an adaptive form, the option to save a configuration does not display in Properties Browser. Selecting to configure some other field of the adaptive form in the same editor resolves the issue.

* The following errors and warning messages may display during installation of Experience Manager 6.5.x.x:
  * “When the Adobe Target integration is configured in Experience Manager using the Target Standard API (IMS authentication), then exporting Experience Fragments to Target results in wrong offer types getting created. Instead of type “Experience Fragment”/source “Adobe Experience Manager,” Target creates several offers with type “HTML”/source “Adobe Target Classic.”
  * `com.adobe.granite.maintenance.impl.TaskScheduler`: No maintenance windows found at granite/operations/maintenance.
  * Adaptive Form server-side validation fails when aggregate functions such as SUM, MAX, and MIN are used (CQ-4274424).
  * `com.adobe.granite.maintenance.impl.TaskScheduler` - No maintenance windows found at granite/operations/maintenance.
  * Hotspot in a Dynamic Media interactive image is not visible when previewing the asset through Shoppable Banner viewer.
  * `com.adobe.cq.social.cq-social-jcr-provider bundle com.adobe.cq.social.cq-social-jcr-provider:1.3.5 (395)[com.adobe.cq.social.provider.jcr.impl.SpiSocialJcrResourceProviderImpl(2302)]` : Timeout waiting for reg change to complete unregistered.

* When trying to move/delete/publish either Content Fragments or Sites/Pages, there is an issue when Content Fragment references are fetched, as the background query fails; i.e. the functionality does not work.
  To ensure correct operation, you must add the following properties to the index definition node `/oak:index/damAssetLucene` (no re-indexing is required) :

   ```xml
   "tags": [
       "visualSimilaritySearch"
     ]
   "refresh": true
   ```

## OSGi bundles and content packages included {#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in [!DNL Experience Manager] 6.5.13.0:

* [List of OSGi bundles included in Experience Manager 6.5.13.0](assets/65130_bundles.txt)

* [List of Content Packages included in Experience Manager 6.5.13.0](assets/65130_packages.txt)

## Restricted websites {#restricted-sites}

These websites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* See [how to contact Adobe Customer Support](https://experienceleague.adobe.com/docs/customer-one/using/home.html).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] product page](https://business.adobe.com/products/experience-manager/adobe-experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/docs/experience-manager-65.html)
>* [Subscribe to Adobe priority product updates](https://www.adobe.com/subscription/priority-product-update.html)

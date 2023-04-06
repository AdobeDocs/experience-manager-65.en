---
title: General Release Notes for [!DNL Adobe Experience Manager] 6.5
description: "[!DNL Adobe Experience Manager] 6.5 notes outlining the release information, what's new, how to install, and detailed change lists."
exl-id: b3d4a527-44ca-4eb6-b393-f3e8117cf1a6
---
# General Release Notes for [!DNL Adobe Experience Manager] 6.5{#general-release-notes-for-adobe-experience-manager}

## Release Information {#release-information}

| Product | [!DNL Adobe Experience Manager] |
|---|---|
| Version | 6.5 |
| Type | Major release |
| General availability date | April 8, 2019 |
| Recommended Updates | See [AEM recent updates](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/aem-releases-updates.html?lang=en). |

### Trivia {#trivia}

The release cycle for this version of [!DNL Adobe Experience Manager] started April 4, 2018, went through 23 iterations of quality assurance and bug fixing, and ended on March 28, 2019. The total number of customer-related issues including enhancements and new features fixed in this release is 1345.

[!DNL Adobe Experience Manager] 6.5 is generally available since April 8, 2019.

![AEM 6.5 Login Screen](/help/assets/assets/aem65-login-v4.png)

## What's New {#what-s-new}

[!DNL Adobe Experience Manager] 6.5 is an upgrade release to the [!DNL Adobe Experience Manager] 6.4 code base. It provides new and enhanced functionality, key customer fixes, high priority customer enhancements, and general bug fixes oriented toward product stabilization. It also includes [!DNL Adobe Experience Manager] 6.4 Service Pack releases up to SP4.

The list below provides an overview - while the subsequent pages list the full details.

### [!DNL Experience Manager Foundation] {#experience-manager-foundation}

The platform of [!DNL Adobe Experience Manager] 6.5 build on top of updated versions of the OSGi-based framework (Apache Sling and Apache Felix) and the Java&trade; Content Repository: Apache Jackrabbit Oak 1.10.2.

The Quickstart uses Eclipse Jetty 9.4.15 as servlet engine.

#### Java&trade; Support  {#java-support}

* New support for Java&trade; 11, and the already supported Java&trade; 8.
* For optimal performance, override default GC values with other values. For more information, see the [install and update](/help/sites-deploying/custom-standalone-install.md) section.
* Java&trade; 11 and Java&trade; 8 maintenance updates are distributed by Adobe for customer usage in AEM-related projects, when not publicly available from Oracle.

#### Java&trade; Development {#java-development}

* There are now [two versions of the Uberjar](/help/sites-developing/ht-projects-maven.md#experience-manager-api-dependencies), a recommended version with public interfaces that are not marked for deprecation, and a version that includes interfaces marked for deprecation.

#### User Interface {#user-interface}

Various enhancements have been made to the UI to make it more productive and easier to use.

* New Permissions Management UI for Users and Groups.
* Column Views now also only load entries that are visible on the screen and only loads more when the user is starting to scroll. List and Card view already did that since 6.0 (improved in 6.4).
* Column Views now include the workflow status for pages/assets when applicable.
* The [Select All](/help/sites-authoring/basic-handling.md#select-all) action is a quick way to execute an action with all pages/assets in the same folder.
* The [Select All](/help/sites-authoring/basic-handling.md#select-all) action attempts to perform the action to all pages/assets, not just what has been loaded. A warning dialog is displayed if the action is not upgraded to handle Bulk Actions.

>[!CAUTION]
>
>Adobe does not plan to make further enhancements to the Classic UI. AEM 6.5 has the Classic UI included, and customers upgrading from earlier releases can keep using it as is. Classic UI remains fully supported while being deprecated. [Read more](/help/sites-deploying/ui-recommendations.md).

#### Search and Indexing {#indexing-and-search}

* Search in Oak now supports dynamic facets. For example, the filter rail in assets search shows the estimated number of results.
* QueryBuilder was extended to provide results with dynamic facets.

#### Upgrade {#upgrade}

* Direct in-place upgrade to AEM 6.5 is supported for customers running AEM 6.2, 6.3 and 6.4. Customers using 5.x or 6.0/6.1 that want to use in-place upgrade need to upgrade to 6.4 first. Then, upgrade to 6.5, or upgrade by way of transfer of the content between the instances directly to AEM 6.5.
* The upgrade procedure largely remains the same in 6.5.
* We continue to support the Backward Compatibility , Upgrade Complexity Assessment and Sustainable Upgrades features introduced in 6.4. There have been version-specific updates made to these areas where needed.
* The Pattern Detector packaging is now simplified. There is one package that assesses upgrades to 6.5 for the available source versions.
* For details about upgrade procedure, see the [upgrade documentation](/help/sites-deploying/upgrade.md).

#### Projects and Workflows {#projects-and-workflows}

* New Workflow Model editor introduced in 6.4 has been improved to include more operations like Copy and Publish, Variable support in Workflow steps and enhanced `OR` and `AND` splits.

#### Repository {#repository}

* The foundation of Adobe Experience Manager 6.5 build on top of updated versions of the OSGi-based framework (Apache Sling and Apache Felix) and the Java&trade; Content Repository: Apache Jackrabbit Oak 1.10.2.
* For an overview of fixed issues, see [Apache Jackrabbit Oak Jira v. 1.10.0](https://archive.apache.org/dist/jackrabbit/oak/1.10.0/RELEASE-NOTES.txt), [Apache Jackrabbit Oak Jira v. 1.10.1](https://archive.apache.org/dist/jackrabbit/oak/1.10.1/RELEASE-NOTES.txt) and [Apache Jackrabbit Oak Jira v. 1.10.2](https://archive.apache.org/dist/jackrabbit/oak/1.10.2/RELEASE-NOTES.txt).

>[!CAUTION]
>
>The new version of the Oak Segment Tar, present since AEM 6.3, requires a repository migration. This step is mandatory if you are upgrading from an older version of TarMK or want to switch the new Segment Tar from another type of persistence. For more information on what the benefits of the new Segment Tar are, see the [Migrating to Oak Segment Tar FAQ](/help/sites-deploying/revision-cleanup.md#migrating-to-oak-segment-tar).

#### OSGI {#osgi}

* Added OSGi Promises and Converter utility libraries.

#### Security {#security}

* Added Password expiration for admin user.

#### Web Server {#web-server}

* The Quickstart distribution uses Eclipse Jetty 9.4.15 as servlet engine (AEM 6.4 shipped with 9.3.22).

### [!DNL Experience Manager] Sites {#experience-manager-sites}

#### Managed Single-page Apps {#managed-single-page-apps}

The Page Editor adds the ability to in-context edit content and compose/layout within client-side rendered experiences (also known [as SPA Editor](/help/sites-developing/spa-architecture.md)). Existing single-page apps build with JavaScript framework React or Angular can be extended with the AEM SJ SDK to be made editable for practitioners.

First shipped as part of AEM 6.4 SP2, with AEM 6.5 the SPA support gains following capabilities:

* Use Template Editor to edit and configure the AEM editable parts of the SPA
* Use Multi-site Management to create country, franchise, or white-labeled SPA experiences

#### Headless Content Management {#headless-content-management}

AEM can serve the content in various formats and from various levels of the stack. Some have been around since 2008 with the [Sling GET](https://sling.apache.org/documentation/bundles/rendering-content-default-get-servlets.html) and [POST Servlet](https://sling.apache.org/documentation/bundles/manipulating-content-the-slingpostservlet-servlets-post.html). Content Services ([Sling Model Exporter](https://experienceleague.adobe.com/docs/experience-manager-learn/foundation/development/develop-sling-model-exporter.html?lang=en)) was introduced in AEM 6.3 and is the method used by the AEM SJ SDK to hydrate single-page apps. The [HTTP API for Assets](/help/assets/mac-api-assets.md) is a CRUD API, that was extended for AEM 6.5.

New HTTP API capabilities:

* Added [Content Fragment support to HTTP API for Assets](/help/assets/assets-api-content-fragments.md) to create, update, read, and delete fragments.
* Expose lists of Content Fragments via Content Services with the [Content Fragment List Core Component](https://www.aemcomponents.dev).
* [Core Component Library](https://www.aemcomponents.dev) that shows the default Content Services JSON output for each component

#### Screens Add-on {#screens-add-on}

Efficiently design, deliver, and optimize experiences on all digital displays from interactive kiosks to digital signage.

* Unify experiences and content across digital and in-store with improved content reuse
* Streamlined authoring and approval/publishing workflows with support for Launches
* Edit and deliver rich interactive experiences using SPA Editor
* Using Launches to plan future content changes for signage content
* Metered playback in a sequence channel
* Auto create project structure using a source file such as an Excel sheet
* Expanded media player support with robust on-line and offline operation (Smart Sync) able to scale to even the largest signage networks.
* Personalize by location or configuration of data triggered content by using dynamic placeholders.
* Unified insights driven by Adobe Analytics integration into the AEM Screens Player

For more details on changes to AEM Screens - see the Release Notes in the [AEM Screens User Guide](https://experienceleague.adobe.com/docs/experience-manager-screens/user-guide/aem-screens-introduction.html?lang=en).

#### Component &amp; Template Development {#component-amp-template-development}

* Maven Project Archetype 18+ for new projects, see [GitHub for release notes](https://github.com/adobe/aem-project-archetype/releases).
* Single-page App Maven Project Archetype 1.0.6+ for new projects, see [GitHub for release notes](https://github.com/adobe/aem-spa-project-archetype/releases).
* HTL version 1.4, see [GitHub for release notes](https://github.com/adobe/htl-spec/releases/tag/1.4).

  * "in" operator for strings, arrays, and objects:

    ```html
    ${'a' in 'abc'}
    ${100 in myArray}
    ${'a' in myObject}
    ```

  * Variable declarations with data-sly-set :
    `<sly data-sly-set.title="${currentPage.title}"/>${title}`

  * List and repeat control parameters: begin, step, end:
    `<h2 data-sly-repeat="${currentPage.listChildren @ begin = 1, step=2}">${item.title}</h2>`

  * Identifiers for data-sly-unwrap:

    ```html
    <div data-sly-unwrap.isUnwrapped="${myCondition || myOtherCondition}">
    text <span data-sly-test="${isUnwrapped}>is unwrapped</code>
    </div>
    ```

  * Support for negative numbers

* Core Components 2.3.2+, see [GitHub for release notes](https://github.com/adobe/aem-core-wcm-components/releases).
* Grid System for Layout Container, see [GitHub](https://github.com/Adobe-Marketing-Cloud/aem-responsivegrid).
* Clientlib Manager: made Google Closure Compiler default to minification of JavaScript clientlibs (old default was Yahoo YUI) and updated Google Closure Compiler to version v20190121
* Template Editor and Policies

  * Create and edit templates for single-page apps that are using the JS SDK (also called SPA Editor)

* Reference Site We.Retail 4.0, see [GitHub for release notes](https://github.com/Adobe-Marketing-Cloud/aem-sample-we-retail/releases).
* Toolkit to upgrade existing sites to use the latest editor capabilities, see [GitHub repository](https://github.com/adobe/aem-modernize-tools)

>[!CAUTION]
>
>AEM includes version 1.12.4 of the jQuery library to provide maximum compatibility with existing custom code. Modifications have been done by Adobe to address known security issues.

#### Site Administration {#site-administration}

* The [Reference](/help/sites-authoring/author-environment-tools.md#references) rail has a new section to list internal links that are pointing to the page selected. This is useful when planning to take a page offline or delete - to see what pages need to be adjusted before taking them offline.
* The [list view](/help/sites-authoring/basic-handling.md#list-view) has a new workflow column that shows the status when the page is in a workflow.
* In the [page properties](/help/sites-authoring/editing-page-properties.md), it's now possible to browse for existing assets when assigning a Thumbnail to the page (Thumbnail tab).

#### Page Editor {#page-editor}

* Allow in-context editing and composition of single-page app experiences build with React and Angular client-side components that are using the JS SDK (also called SPA Editor)
* Scaffolding Mode is only shown if the page has a scaffolding page configured.

#### Content Fragments &amp; Editor {#content-fragments-amp-editor}

* New [Annotations](/help/assets/content-fragments/content-fragments-variations.md#viewing-editing-deleting-annotations) rail in Content Fragment Editor to make general comments and see comments made within the text (also show up in Timeline rail)
* Ability to set the default content type of a multi-line text element in a [Content Fragment model](/help/assets/content-fragments/content-fragments-models.md) to simple text, rich text, or markdown
* Add [comment/annotations](/help/assets/content-fragments/content-fragments-variations.md#annotating-a-content-fragment) by selecting text in the RTE (full-screen view)
* [Compare versions](/help/assets/content-fragments/content-fragments-managing.md#comparing-fragment-versions) of a Content Fragment side-by-side via Reference rail
* The assets Download Report now shows Content Fragments accordingly
* Add [Content Fragment support to Assets HTTP API](/help/assets/assets-api-content-fragments.md) via /api.json. There are APIs for create, update, read, and delete of Content Fragments.

#### Experience Fragments {#experience-fragments}

* Improved the indexing of [Experience Fragments](/help/sites-authoring/experience-fragments.md), so their content is found in search for pages where they are being used.
* The [Export to Target](/help/sites-administering/experience-fragments-target.md) option now lets you send the Experience Fragment as JSON (default is HTML) or both.

#### Translation {#translation}

* Simplify creating Translation Projects by using Project Masters.
* Simplify executing Translation Projects by setting translation jobs to approved status by default.
* Allow updating translated pages with changes in 3rd-party Translation Memory.
* Allow exporting translation jobs in JSON format.
* Update Microsoft&reg; Translation integration to use V3 API.

#### Multi-Site Management (MSM) {#multi-site-management-msm}

* For roll-out configs that use PushOnModify, better handling of page move operation to avoid inconsistent state.
* Creating a page inside the livecopy structure creates a standalone page by default.
* Use MSM features in single-page apps that are using the JS SDK (also called SPA Editor)

#### Launches {#launches}

* New review and approval workflow for launches, and ability to only promote approved launch pages
* Added [option in UI to choose to delete the Launch right after the promotion step](/help/sites-authoring/launches-promoting.md#promoting-launch-pages)

#### Content Targeting & Simulation {#content-targeting-simulation}

* ContextHub data layer and client-side rules engine JavaScript has been updated to use jQuery 3 by default.

#### AEM and Adobe Target {#aem-amp-adobe-target}

>[!CAUTION]
>
>Currently:
>
>* Only `at.js 1.x` is supported if you are using Adobe Target as your targeting engine within AEM's Activities console. 
>
>* Both `at.js. 1.x` and `at.js 2.x` are supported if you are using Experience Fragment export to Target and running Activities within Target's console. 

* Adobe Target integration now uses the Target Standard API. Earlier versions of AEM use the Target Classic HTTP API which is now deprecated.
* Adobe Target `mbox.js` version 63 is included. Adobe strongly recommends that you switch the implementation to `at.js` v1.x.
* `at.js` version 1.5.0 is now included. Adobe recommends that you use [Adobe Experience Platform Launch](https://business.adobe.com/products/experience-platform/launch.html) to provision `at.js` v1.x into the site.

#### AEM and Adobe Analytics {#aem-amp-adobe-analytics}

* `s_code.js` H.27.5 is included. Adobe recommends that you switch implementation to `AppMeasurement.js`
* `AppMeasurement.js` v1.8.0 is included. Adobe recommends that you use [Adobe Experience Platform Launch](https://business.adobe.com/products/experience-platform/launch.html) to provision AppMeasurement.js into the site.

#### AEM and Commerce {#aem-commerce}

Improvements to the Commerce Integration Framework are on a faster release cycle since AEM 6.4. [Learn more here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/content-and-commerce/integrations/magento.html).

#### Communities Add-On {#communities-add-on}

To obtain the latest release, see the [Deploying Communities](/help/communities/deploy-communities.md) section of the documentation.

##### Enhancements to community engagement {#enhancements-to-community-engagement}

**@Mentions support**
AEM Communities now allows registered users to tag (mention) other registered members to elicit their attention, in User Generated Content. The tagged (mentioned) members are then notified, with deep link to the corresponding User Generated Content. Users can, however, opt to disable/enable the web and email notifications.

![At mentions support](/help/release-notes/assets/at-mentions.png)

Community users do not need to search for their first name, last name, or user name to see if anyone has reached out to them or needs their attention. Moreover, it allows the UGC authors to seek response from specific registered users who can best address the issue and add inputs.

The community administrators need to **Enable Mention** on community components to allow registered users use the functionality on those components.

**Group messaging**

Registered community members can now send direct messages in bulk to groups through a single email composition, instead of sending the same message individually to group members. To allow [group messaging](/help/communities/configure-messaging.md), enable both the instances of [Messaging Operations Service](/help/communities/messaging.md#group-messaging).

![Group message](/help/release-notes/assets/group-messaging.png)

##### Enhancements to Bulk Moderation {#enhancements-to-bulk-moderation}

Custom filters in Bulk Moderation

[Custom filters](/help/communities/moderation.md#custom-filters) can now be developed and added to Bulk Moderation UI.

A [sample project](https://github.com/Adobe-Marketing-Cloud/aem-communities-extensions/tree/master/aem-communities-moderation-filter) that demonstrates filtering through tags is available in [GitHub](https://github.com/Adobe-Marketing-Cloud/aem-communities-extensions/tree/master/aem-communities-moderation-filter). This project can be used as a base to develop analogous custom filters.

![Custom filters](/help/release-notes/assets/custom-tag-filter.png)

**List View in Bulk Moderation**

New List View with improved UI has been provided in bulk moderation to display User Generated Content entries.

![Bulk moderation in list view](/help/release-notes/assets/list-view-moderation.png)

##### Enhancements to Site and Group Management {#enhancements-to-site-and-group-management}

**Author side site and group administrators**

Communities, AEM 6.5 onwards, allows decentralized administration (and management) of different community sites and groups/ nested groups. Organizations hosting multiple community sites and nested groups can now select members for administrator roles on Author side at the time of site (and group) creation.

![Site administrator](/help/release-notes/assets/site-admin.png)

Site Administrators can create a group at any level of hierarchy and become the default administrators. These administrators can later be removed by other group administrators. Group administrators can manage their group G1 and create a subgroup nested under G1.

##### Enhancements to enablement {#enhancements-to-enablement}

**SCORM 2017.1 support**

The enablement functionality of AEM 6.5 Communities support Shareable Content Object Reference Model [(SCORM) 2017.1](https://rusticisoftware.com/blog/scorm-engine-2017-released/) engine.

* Keyboard navigation support on enablement components
* Enablement components (for example Catalog and Course Playing, Assignments, File Library) in AEM Communities support keyboard navigation for improved accessibility.

##### Other enhancements {#other-enhancements}

* Solr 7 support
* AEM 6.5 Communities support Apache Solr 7.0 version of the search platform while setting up MSRP and DSRP.

### [!DNL Experience Manager Assets] {#experience-manager-assets}

AEM 6.5 introduces the following capabilities and enhancements to boost productivity of AEM users, DAM roles, and associated creative and marketing roles.

#### Integration with [!DNL Adobe Creative Cloud] and creative workflows {#integration-with-adobe-creative-cloud-and-creative-workflows}

[!DNL Adobe Experience Manager] offers various ways to integrate with [!DNL Adobe Creative Cloud] and share assets for use in workflows where the creative and marketing or business teams collaborate closely. [!DNL Experience Manager] 6.5 continues to improve on the integration and streamlines it further to expose more opportunities and streamline the existing methods.

Read on to know the specific capabilities and integrations of [!DNL Experience Manager] 6.5 that you can use to best support your content velocity use cases.

##### Adobe Asset Link {#aal}

[!DNL Adobe Asset Link] strengthens collaboration between creatives and marketers in the content creation process. Creatives can access content stored in [!DNL Experience Manager Assets], without leaving the apps that they are most familiar with. Creatives can seamlessly browse, search, check out, and check in assets using the in-app panel in [!DNL Adobe Photoshop], [!DNL Adobe Illustrator], and [!DNL Adobe InDesign] apps.

[!DNL Adobe Asset Link] is a part of [Creative Cloud for enterprise](https://www.adobe.com/creativecloud/business/enterprise.html) offering. For more information about it, including necessary configuration of your [!DNL Experience Manager] deployment, see [Adobe Asset Link](https://helpx.adobe.com/enterprise/using/adobe-asset-link.html).

![Search assets in Adobe Photoshop](/help/release-notes/assets/asset_search_photoshop.png)

##### [!DNL Adobe Stock] integration {#stock}

Your organization can use its [!DNL Adobe Stock] enterprise plan within [!DNL Experience Manager Assets] to ensure that licensed assets are broadly available for your creative and marketing projects. You can quickly find, preview, and license [!DNL Adobe Stock] assets that are saved in Experience Manager, using the powerful DAM capabilities of [!DNL Experience Manager].

[!DNL Adobe Stock] service provides designers and businesses with access to millions of high-quality, curated, royalty-free photos, vectors, illustrations, videos, templates, and 3D assets for all their creative projects.

For more info, see [Use Adobe Stock assets in Experience Manager Assets](/help/assets/aem-assets-adobe-stock.md).

![Preview Adobe Stock image and license from within Experience Manager Assets](/help/release-notes/assets/stock_image_preview_license_options.png)

*Figure: Preview [!DNL Adobe Stock] image and license from within [!DNL Experience Manager Assets].*

![Search and filter the licensed Adobe Stock images in Experience Manager](/help/release-notes/assets/aem-search-filters2.jpg)

*Figure: Search and filter the licensed [!DNL Adobe Stock] images in [!DNL Experience Manager].*

##### Dynamic references in [!DNL Adobe InDesign] {#dynamic-references-in-indesign}

[!DNL Experience Manager Assets] used in [!DNL Adobe InDesign] files are dynamic. The references update automatically if the referenced assets moves in the repository. For more information, see [how to manage compound assets](/help/assets/managing-linked-subassets.md).

#### Brand Portal capabilities {#brand-portal-capabilities}

[!DNL Experience Manager Assets Brand Portal] helps you easily acquire, effectively control, and securely distribute the approved assets to external vendors/agencies and internal business users across devices. It helps improve the efficiency of asset sharing, accelerates the time-to-market for assets, and eliminates the risk of non-compliant usage and unauthorized access.

For more information, see [What's new in Brand Portal](https://experienceleague.adobe.com/docs/experience-manager-brand-portal/using/introduction/whats-new.html?lang=en).

#### Connected Assets {#connectedassets}

In large enterprises the infrastructure required to create websites can be distributed. At times, the website creation capabilities and the required digital assets reside in different silos.

[!DNL Experience Manager Sites] offers capabilities to create web pages and [!DNL Experience Manager Assets] is the Digital Asset Management (DAM) system that supplies the required assets for websites. [!DNL Experience Manager] now supports the above use case by integrating [!DNL Sites] and [!DNL Assets]. See [how to configure and use Connected Assets feature](/help/assets/use-assets-across-connected-assets-instances.md).

![Drag an asset from an [!DNL Experience Manager] deployment on a [!DNL Sites] page of a different [!DNL Experience Manager] deployment](/help/release-notes/assets/connected-assets-drag-and-drop-only.gif)

*Figure: Drag an asset from an [!DNL Experience Manager] deployment on a [!DNL Sites] page on a different [!DNL Experience Manager] deployment.*

#### Dynamic Media {#dynamic-media}

[!DNL Dynamic Media] provides enhanced rich-media authoring and delivery in [!DNL Experience Manager Assets] to drive cutting-edge experiences that are immersive and personalized. By uploading a single high-quality primary asset and using Adobe's advanced cloud rendering and viewers, you can deliver any combination of renditions on-the-fly to support your organization's media strategy.

For more details on new [!DNL Dynamic Media] features, see [Dynamic Media Release Notes](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/release-notes/s7rn2017.html).

##### 360 video support {#video-support}

Manage your 360-video files directly in [!DNL Experience Manager] using the cutting edge viewers to deliver VR-experiences to desktops, mobile, and VR-headsets. For more information, see [Using 360 Video](/help/assets/360-video.md).

##### Custom video thumbnails {#custom-video-thumbnails}

You can now customize the thumbnails for your video assets using frames from the video itself or other content stored in the DAM. For additional instructions, see [About Video Thumbnails](/help/assets/video.md#about-video-thumbnails-in-dynamic-media-scene-mode).

##### Accessibility enhancements {#accessibility-enhancements}

[!DNL Dynamic Media] viewers now support enhanced accessibility features like Aria-support, screen-readers, and Alt-text. For additional details, see [Viewers Reference Guide](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/library/homeviewers.html).

#### Search experience enhancement {#experience-enhancement-for-searching}

[!DNL Experience Manager] 6.5 onwards, marketers can discover the desired assets faster from the search results page. The search facets are updated with the number of assets even before applying the search filter. Seeing the expected count against the filter helps users navigate through the search results efficiently. For more information, see [Search assets in Experience Manager](/help/assets/search-assets.md).

![See the number of assets without filtering search results in search facets](/help/assets/assets/asset_search_results_in_facets_filters.png)

*Figure: See the number of assets without filtering search results in search facets.*

#### Usability enhancement {#usability-enhancement}

You can now select all the loaded assets within a folder or from a search result in one go. It helps you to manage multiple assets quickly. The check box selects all the assets that fit the scenario, say a search result, and not just the assets that are visible in the [!DNL Experience Manager] interface.

![Use Select All option to select all the loaded assets in one click.](/help/release-notes/assets/select-all-in-aem-assets.gif)

*Figure: Use the Select All option to select all the loaded assets in one click.*

#### Metadata enhancements {#metadata-enhancements}

[!DNL Assets] let you create metadata schemas for asset folders, which define the layout and metadata displayed in folder properties pages. You can now assign a folder metadata schema to an existing folder or when creating a folder. For more information, see [Folder metadata schema](/help/assets/metadata-config.md#folder-metadata-schema).

When specifying cascading metadata, the choices can be loaded from a JSON file at the run-time, say instead of typing manually in the form. For more information, see [cascading metadata](/help/assets/metadata-schemas.md#cascading-metadata).

#### Reporting enhancements {#reporting-enhancements}

The Content Fragments and link shares are included in the downloaded report now. For more information, see [Assets reports](/help/assets/asset-reports.md).

### [!DNL Adobe Experience Manager Forms] {#experience-manager-forms}

AEM 6.5 Forms bring in several new features and enhancements. The highlights include:

* Transaction reports to track the number of submitted forms, processed documents, and rendered documents
* Usability improvements to interactive communications
* Cloud-based digital signatures in adaptive forms
* Embed adaptive forms and interactive communications in an AEM Sites single page application (SPA).
* Support for variables in AEM Workflows
* Data display pattern support in interactive communications
* Sorting adaptive forms and interactive communication tables
* Automated validation of input data in form data models

See the [Summary of new features and enhancements in AEM 6.5 Forms](/help/forms/using/whats-new.md) for information about new and improved features and documentation resources.

### Use Customer-focused Development {#leverage-customer-focused-development}

Adobe is using a customer focused development model that allows customers to contribute to all stages of the development process, during specification, development, and testing. Our thanks go to all contributing customers and partners in this process.

Adobe has the procedures and processes in place to enable collection, prioritization, and tracking of customer-focused bug resolution and enhancement request development. The [Experience Manager Support portal](https://experienceleague.adobe.com/?support-solution=Experience+Manager#support) is integrated with the Adobe Enhancement and Defect Tracking System. Customer questions are identified and resolved by Customer Support team where possible. When escalated to R&D, all customer information is captured, and used for prioritization and reporting purposes. Priority is given in development to paid support, warrantee issues, and customer-paid enhancements.

This process of prioritization has yielded more than 750 customer focused changes fixed in AEM 6.5.

## List of files that are part of the Release {#list-of-files-that-are-part-of-the-release}

**Foundation**

* Standalone Quickstart: `cq-quickstart-6.5.0.jar`.
* Application Server Quickstart: `cq-quickstart-6.5.0.war`.
* Dispatcher 4.3.2 or later for the various web servers and platforms. See [download link](https://experienceleague.adobe.com/docs/experience-manager-dispatcher/using/getting-started/release-notes.html)
* Plug-in for Eclipse IDE ([read more and download](/help/sites-developing/aem-eclipse.md))

* Extension for Brackets Code Editor ([read more and download](/help/sites-developing/aem-brackets.md))
* Maven/Gradle dependencies ([download link](https://repo1.maven.org/maven2/com/adobe/aem/uber-jar/6.5.0/))

**Sites**

* Core Components ([GitHub project](https://github.com/adobe/aem-core-wcm-components))
* We.Retail Reference implementation ([read more](/help/sites-developing/we-retail.md))
* Maven Project Archetypes:

  * for full-stack sites: [GitHub project](https://github.com/adobe/aem-project-archetype)
  * for single-page apps with React/Angular: [GitHub project](https://github.com/adobe/aem-spa-project-archetype)

* AEM Screens Players for various target platforms ([download](https://download.macromedia.com/screens/))

* Smart Content Language Models. English is preinstalled - more languages can be downloaded

  * [German](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq630/product/smartcontent-model-de)
  * [Spanish](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq630/product/smartcontent-model-es)
  * [Italian](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq630/product/smartcontent-model-it)
  * [French](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq630/product/smartcontent-model-fr)

* AEM Modernize Tools Suite, for example, Dialog Conversion Tool. ([GitHub project](https://github.com/adobe/aem-modernize-tools))

**Assets**

* Package to add enhanced PDF Rasterizer ([read more](/help/assets/aem-pdf-rasterizer.md))
* Package to add extended RAW image support ([read more](/help/assets/camera-raw.md))

**Forms**

* [Packages for AEM Forms capabilities](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html)
* [AEM Forms OSGi Client SDK](https://repo1.maven.org/maven2/com/adobe/aemfd/aemfd-client-sdk/)

## Languages {#languages}

The user interface is available in following languages:

* English
* German
* French
* Spanish
* Italian
* Brazilian Portuguese
* Japanese
* Simplified Chinese
* Traditional Chinese (limited support)
* Korean

[!DNL Experience Manager] 6.5 has been certified for GB18030-2005 CITS to use the Chinese Encoding Standard.

## Install and Update {#install-update}

For setup requirements, see [installation instructions](/help/sites-deploying/custom-standalone-install.md).

For detailed instructions, see [upgrade documentation](/help/sites-deploying/upgrade.md).

## Supported Platforms {#supported-platforms}

Find the complete matrix of supported platforms including support-level on [AEM 6.5 technical requirements](/help/sites-deploying/technical-requirements.md).

>[!NOTE]
>
>Oracle has moved to a Long Term Support (LTS) model for Oracle Java&trade; SE products. Java&trade; 9 and 10 are non-LTS releases by Oracle. See [Oracle Java&trade; SE support roadmap](https://www.oracle.com/technetwork/java/eol-135779.html). Adobe supports LTS releases of Java&trade; to only run AEM in production. Java&trade; 11 is the recommended version to use with AEM 6.5.

## Deprecated and Removed Features {#deprecated-and-removed-features}

Adobe constantly evaluates capabilities in the product and over time plans to replace capabilities with more powerful versions, or decides to reimplemented selected parts to be better prepared for future expectations or extensions.

For [!DNL Adobe Experience Manager] 6.5, [read the list of deprecated and removed capabilities](/help/release-notes/deprecated-removed-features.md). The page also contains pre-announcement of changes coming in the future and important notice for customers that update from prior releases.

## Known Issues {#known-issues}

### Platform {#platform}

* An issue is reported where the CRX-Quickstart, and its contents, are deleted.

  On each of these actions, ensure that the property `htmllibmanager.fileSystemOutputCacheLocation` is not an empty string:

  1. Calling `/libs/granite/ui/content/dumplibs.rebuild.html?invalidate=true`.
  2. Upgrading to AEM 6.5.
  3. Executing "lazy content migration" on AEM 6.5.

  A [Knowledge Base](https://helpx.adobe.com/experience-manager/kb/avoid-crx-quickstart-deletion-in-aem-6-5.html) article is available with further details and the workaround for this issue.

* If you are using JDK 11 with AEM 6.5 instance, some of the pages might display as blank after deploying some packages. The following error message displays in the log file:

   ```java
   *ERROR* [OsgiInstallerImpl] org.apache.sling.scripting.sightly bundle org.apache.sling.scripting.sightly:1.1.2.1_4_0 (558)[org.apache.sling.scripting.sightly.impl.engine.extension.use.JavaUseProvider(3345)] : Error during instantiation of the implementation object (java.lang.NoClassDefFoundError: jdk/internal/reflect/ConstructorAccessorImpl)
   java.lang.NoClassDefFoundError: jdk/internal/reflect/ConstructorAccessorImpl
   ```

To resolve this error:

  1. Stop the AEM instance. Go to `<aem_server_path_on_server>crx-quickstart\conf` and open the `sling.properties` file. Adobe recommends taking a backup of this file.

  1. Search for `org.osgi.framework.bootdelegation=`. Add `jdk.internal.reflect,jdk.internal.reflect.*` properties to display the result as.

  ```java
  org.osgi.framework.bootdelegation=sun.*,com.sun.*,jdk.internal.reflect,jdk.internal.reflect.*
  ```

1. Save the file and restart the AEM instance.

### Sites {#sites}

* **Working with Page Versions**: [If a page has been moved, you can no longer perform a preview on any versions made before the move](/help/sites-authoring/working-with-page-versions.md#previewing-a-version).

### Assets {#assets}

* **Search:** Search does not result any returns if the search string contains leading spaces ([OAK-4786](https://issues.apache.org/jira/browse/OAK-4786))
* **Folder Metadata Schema**: After adding a choice button, the ID and Value field are not rendered as expected and the delete functionality does not work. (CQ-4261144)
* When renaming an asset, it is not possible to use a whitespace in the asset name. (CQ-4266403)

### Forms {#forms}

* When AEM Forms is installed on Linux&reg; operating system, Digital Signature with Hardware Security Module do not work. (CQ-4266721)  
* (AEM Forms on WebSphere&reg; only) The **Forms Workflow** &gt; **Task Search** option does not return any result if you search for an **Administrator** with **Username** as the search criteria. (CQ-4266457)  

* AEM Forms fail to convert TIF and TIFF files with JPEG compression to PDF Documents. (CQ-4265972)
* The **AEM Forms Assets Scanner** and **Letter to Interactive Communication Migration** options do not work on the **AEM Forms Migration** page. (CQ-4266572)  

* (JBoss&reg; 7 only) When you upgrade from a previous version to AEM 6.5 Forms and the previous version had processes (.lca) that created and used a copy of the default submit or default render process, HTML5 Forms using such processes (.lca) fails to perform the required actions. (CQ-4243928)
* In an adaptive from, when a form data model service is invoked from the rule editor to dynamically update values of the image choice component, values of the image choice component are not updated. (CQ-4254754)
* AEM Forms Designer installer requires the 32-bit version of [Visual C++ redistributable runtime package 2012](https://docs.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170) and [Visual C++ redistributable runtime packages 2013](https://support.microsoft.com/en-us/topic/update-for-visual-c-2013-and-visual-c-redistributable-package-5b2ac5ab-4139-8acc-08e2-9578ec9b2cf1). Ensure that the previously mentioned redistributable runtime packages are installed before starting the installation. (CQ-4265668)

* PDF Generator does not support smart card-based authentication. When an administrator enables the Group Policy `Interactive Logon: Require Smart card` on a Windows server, all the existing PDF Generator users are invalidated.

* When an adaptive form is configured to dynamically update values of a component and the publish instance that hosts the form is accessed through the Dispatcher, the functionality to dynamically update values of a field stop working. To resolve the issue, on the publish instance, open CRXDE, navigate to `/libs/fd/af/runtime/clientlibs/guideChartReducer`, and create the property listed in below.

  * Name: allowProxy
  * Type: Boolean
  * Value: true
  * Protected: False
  * Mandatory: False
  * Multiple: False
  * Auto Created: False

  The property enables the client libraries under the runtime folder to access proxies. (CQ-4268679)

* When AEM Forms is started, the `SAX Security Manager could not be setup` warning appears.
* When you open a PDF protected with AEM Forms Document Security on an Apple iOS or iPadOS running version 20.10.00 of Adobe Acrobat Reader
* When you submit a form containing a standard HTML upload field from an Apple iOS device, sometimes, the content of the file is not sent and a 0-byte file is received at the other end. Apple iOS 15.1 provides a fix for the issue.

## Product Download and Support (Restricted Sites) {#product-download-and-support-restricted-sites}

The following sites are available only to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product Download at licensing.adobe.com](https://licensing.adobe.com/).

* Product updates, patches, and packages for additional functionality on [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html).

* [Customer Support via Admin Console](https://adminconsole.adobe.com/). For more information, see [New Adobe Customer Support Experience](https://experienceleague.adobe.com/docs/customer-one/using/home.html?lang=en).

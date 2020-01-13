---
title: AEM Sites Release Notes
description: Release notes specific to Adobe Experience Manager 6.4 Sites.
uuid: 676ead61-3d97-4f23-b616-c647d590bc8f
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.4
discoiquuid: f82e9bd4-f7b6-492d-8e02-593e74fa1058
docset: aem65

---

# AEM Sites Release Notes{#aem-sites-release-notes}

See the following for AEM Sites 6.5 enhancements in detail:

## Component &amp; Template Development {#component-amp-template-development}

* Maven Project Archetype 18+ for new projects, see [Github for release notes](https://github.com/Adobe-Marketing-Cloud/aem-project-archetype/releases).
* Single-page App Maven Project Archetype 1.0.6+ for new projects, see [Github for release notes](https://github.com/adobe/aem-spa-project-archetype/releases).
* HTL version 1.4, see [Github for release notes](https://github.com/adobe/htl-spec/releases/tag/1.4).

    * “in” operator for strings, arrays and objects:

      ```
      ${'a' in 'abc’}
       ${100 in myArray}
       ${'a' in myObject}
      ```

    * Variable declarations with data-sly-set :
      `<sly data-sly-set.title="${currentPage.title}"/>${title}`

    * List and repeat control parameters: begin, step, end:
      `<h2 data-sly-repeat="${currentPage.listChildren @ begin = 1, step=2}">${item.title}</h2>`

    * Identifiers for data-sly-unwrap:

      ```
      <div data-sly-unwrap.isUnwrapped="${myCondition || myOtherCondition}">
       text <span data-sly-test="${isUnwrapped}>is unwrapped</code>
       </div>
      ```

    * Support for negative numbers

* Core Components 2.3.2+, see [Github for release notes](https://github.com/Adobe-Marketing-Cloud/aem-core-wcm-components/releases).
* Grid System for Layout Container, see [Github](https://github.com/Adobe-Marketing-Cloud/aem-responsivegrid).
* Clientlib Manager: made Google Closure Compiler default to minification of JavaScript clientlibs (old default was Yahoo YUI) and updated Google Closure Compiler to version v20190121
* Template Editor and Policies

    * Create and edit templates for single-page apps that are using the JS SDK (also called SPA Editor)

* Reference Site We.Retail 4.0, see [Github for release notes](https://github.com/Adobe-Marketing-Cloud/aem-sample-we-retail/releases).
* Toolkit to upgrade existing sites to leverage the latest editor capabilities, see [Github repository](https://github.com/adobe/aem-modernize-tools)

>[!CAUTION]
>
>AEM includes version 1.12.4 of the jQuery library to provide maximum compatibility with existing custom code. Modifications have been done by Adobe to address known security issues.

## Site Administration {#site-administration}

* The [Reference](/help/sites-authoring/author-environment-tools.md#references) rail has a new section to list internal links that are pointing to the page selected. This is useful when planning to take a page offline or delete - to see what pages need to be adjusted before taking them offline.
* The [list view](/help/sites-authoring/basic-handling.md#list-view) has a new workflow column that shows the status when the page is currently in a workflow.
* In the [page properties](/help/sites-authoring/editing-page-properties.md), it's now possible to browse for existing assets when assigning a Thumbnail to the page (Thumbnail tab).

## Page Editor {#page-editor}

* Allow in-context editing and composition of single-page app experiences build with React and Angular client-side components that are leveraging the JS SDK (also called SPA Editor)
* Scaffolding Mode is only shown if the page has a scaffolding page configured.

## Content Fragments &amp; Editor {#content-fragments-amp-editor}

* New [Annotations](/help/assets/content-fragments-variations.md#viewing-editing-deleting-annotations) rail in Content Fragment Editor to make general comments and see comments make within the text (also show up in Timeline rail)
* Ability to set the default content type of a multi-line text element in a [Content Fragment model](/help/assets/content-fragments-models.md) to simple text, rich text or markdown
* Add [comment/annotations](/help/assets/content-fragments-variations.md#annotating-a-content-fragment) by selecting text in the RTE (full-screen view)
* [Compare versions](/help/assets/content-fragments-managing.md#comparing-fragment-versions) of a Content Fragment side-by-side via Reference rail
* The assets Download Report now shows Content Fragments accordingly
* Add [Content Fragment support to Assets HTTP API](/help/assets/assets-api-content-fragments.md) via /api.json. There are APIs for create, update, read and delete of Content Fragments.

## Experience Fragments {#experience-fragments}

* Improved the indexing of [Experience Fragments](/help/sites-authoring/experience-fragments.md), so their content is found in search for pages where they are being used
* The [Export to Target](/help/sites-administering/experience-fragments-target.md) option now allows to send the Experience Fragment as JSON (default is HTML), or both

## Translation {#translation}

* Simplify creating Translation Projects by using Project Masters
* Simplify executing Translation Projects by setting translation jobs to approved status by default
* Allow updating translated pages with changes in 3rd-party Translation Memory
* Allow exporting translation jobs in JSON format
* Update Microsoft Translation integration to use V3 API

## Multi-Site Management (MSM) {#multi-site-management-msm}

* For roll-out configs that use PushOnModify, better handling of page move operation to avoid inconsistent state
* Creating a new page inside the livecopy structure will now by default create a standalone page
* Use MSM features in single-page apps that are using the JS SDK (also called SPA Editor)

## Launches {#launches}

* New review and approval workflow for launches, and ability to only promote approved launch pages
* Added [option in UI to choose to delete the Launch right after the promotion step](/help/sites-authoring/launches-promoting.md#promoting-launch-pages)

## Content Targeting & Simulation {#content-targeting-simulation}

* ContextHub data layer and client-side rules engine JavaScript has been updated to use jQuery 3 by default.

## AEM and Adobe Target {#aem-amp-adobe-target}

>[!CAUTION]
>
>at.js 2.x is not supported with AEM at the point of the AEM 6.5 release. Please use latest version of at.js 1.x

* Adobe Target integration is can now use the Target Standard API. Earlier versions of AEM use the Target Classic HTTP API which is now deprecated.
* Adobe Target `mbox.js` version 63 is included. Adobe strongly recommends to switch implementation to `at.js` v1.x.
* `at.js` version 1.5.0 is now included. Adobe recommends that you use [Adobe Experience Platform Launch](https://www.adobe.com/experience-platform/launch.html) to provision `at.js` v1.x into the site.

## AEM and Adobe Analytics {#aem-amp-adobe-analytics}

* `s_code.js` H.27.5 is included. Adobe recommends that you switch implementation to `AppMeasurement.js`
* `AppMeasurement.js` v1.8.0 is included. Adobe recommends to use [Adobe Experience Platform Launch](https://www.adobe.com/experience-platform/launch.html) to provision AppMeasurement.js into the site.

## AEM and Commerce {#aem-commerce}

Improvements to the Commerce Integration Framework are on a faster release cycle since AEM 6.4. [Learn more here](https://www.adobe.io/apis/experiencecloud/commerce-integration-framework/docs.html).

## Communities Add-On {#communities-add-on}

See [Communities Release Notes page](../release-notes/communities-release-notes.md)

## Screens Add-On {#screens-add-on}

* Using Launches to plan future content changes for signage content
* Metered playback in a sequence channel
* Auto create project structure using a source file e.g. Excel sheet

For more details on changes to AEM Screens - see the Release Notes in the [AEM Screens User Guide](https://docs.adobe.com/content/help/en/experience-manager-screens/user-guide/aem-screens-introduction.html).

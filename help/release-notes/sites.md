---
title: AEM Sites Release Notes
seo-title: AEM Sites
description: Release notes specific to Adobe Experience Manager 6.4 Sites.
seo-description: Release notes specific to Adobe Experience Manager 6.4 Sites.
uuid: 593928ec-5d1a-4a88-bd73-897421c5984a
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.4
topic-tags: release-notes
content-type: reference
discoiquuid: 40225441-7cfe-4395-ac71-60504b42e764
---

# AEM Sites Release Notes {#aem-sites-release-notes}

## Sites {#sites}

See the following for AEM Sites 6.4 enhancements in detail:

### Site Administration {#site-administration}

* New Content Tree rail to quickly navigate a site hierarchy. In combination with the list view, this restores the Classic UI interaction model to browse a site.
* Improved scrolling in card and list view of large folders. 
* Improved interaction with the search results - the back button restores the prior search result.
* Additional keyboard shortcuts, for most common actions, such as to open a particular rail, to edit, move and delete pages, or to open properties.
* Ability to disable keyboard shortcuts (enable/disable in Preferences). 
* Stop showing time stamps across all UI relative after 7 days (set default in Preferences).

### Page Editor {#page-editor}

* Updated device list for responsive site preview, now including Apple iPhone 8, 8 Plus and X, and Samsung S7
* Moved default location for template design information away from /etc/design to support sites specific settings in /conf. Customers that upgrade from prior AEM releases can remain using /etc/design.

### Component &amp; Template Development {#component-amp-template-development}

* Project Archetype 13+, see [Github for release notes](https://github.com/Adobe-Marketing-Cloud/aem-project-archetype/releases).
* HTL version 1.3.1, see [Github for release notes](https://github.com/Adobe-Marketing-Cloud/htl-spec/releases/tag/1.3.1).
* Core Components 2.0.4+, see [Github for release notes](https://github.com/Adobe-Marketing-Cloud/aem-core-wcm-components/releases).
* Style System

    * Added an all-new concept to assign CSS classes to components and allow users in Page Editor to select from a subset of styles via UI
    * Added ability to define the HTML element name rendered around the component e.g. &lt;main&gt;, &lt;aside&gt;

* Grid System for Layout Container, see [Github](https://github.com/Adobe-Marketing-Cloud/aem-responsivegrid).
* Template Editor and Policies

    * Policies now support Style System configurations per component, per container, per template.
    * Improved support for defining layout in templates on editable components

* Reference Site We.Retail 3.0, see [Github for release notes](https://github.com/Adobe-Marketing-Cloud/aem-sample-we-retail/releases).

>[!CAUTION]
>
>AEM includes version 1.12.4 of the jQuery library to provide maximum compatibility with existing custom code. Modifications have been done by Adobe to address known security issues.

### Content Fragments &amp; Editor {#content-fragments-amp-editor}

* Introduced Structured Content Models as foundation for content fragments

    * Model editor UI
    * Pre-configured data elements for content fragment models (single-line text, multi-line text, number, boolean, date&time, enumeration, content reference, tags)

* Improved the usability of the AEM Content Fragment editor

    * View-all-elements overview
    * Full-screen editing for single elements
    * Enhanced rich text editing capabilities (bulleted lists, numbered lists, indendentation, hyperlinks, tables, find&replace, spell check)

* Added enhanced output options for AEM Content Fragments

    * New Content Fragment component, as part of Core Components. [See code on GitHub.](https://github.com/Adobe-Marketing-Cloud/aem-core-wcm-components/tree/master/extension/contentfragment/content/src/content/jcr_root/apps/core/wcm/extension/components/contentfragment/v1/contentfragment)
    * Content Services support with JSON output via Sling Model Exporter

### Experience Fragments {#experience-fragments}

* Introduced Experience Fragment Building Blocks, to facilitate re-using content between Experience Fragments variations by grouping components and by allowing easy reference within variations.
* Added the ability to add Experience Fragments to translation projects via the reference rail
* Addrf the ability to start workflows with Experience Fragments via the timeline rail
* Reference rail now shows where an Experience Fragment is being used in AEM   
* Configuration of template locations now allows authors to define on a global or folder level what Experience Fragment templates are allowed to use
* Faceted search now supports advanced filtering, such as published/non-published, exported to social media and Adobe Target
* Added single social media login when exporting Experience Fragments to Pinterest or Facebook
* Integrated AEM Experience Fragments with Adobe Target. Synchronizing Experience Fragments to Target will create offers in Adobe Target that can be used with Target's Visual Experience Composer to embed it in any Target enabled experience.

### Translation {#translation}

* Enhanced the usability of AEM Translation projects:

    * Support for multiple target languages in one project
    * Option to automatically promote and delete translation launches
    * Option to schedule recurring execution of translation projects (daily, weekly, monthly, yearly)
    * Enhanced translation project tiles with more detailed status information

* Introduced Reverse Translation Memory Update, to update translation memory in 3rd-party translation management system after local content edits in AEM
* Translation workflows now support grouped language roots
* Added ability to assign arbitrary names to language roots, and use JCR property for mapping to ISO code
* Smart translation updates now recognize new pages that were added to a language master branch 
* Introduced translation status reporting in Sites Admin list view

### Multi-Site Management (MSM) {#multi-site-management-msm}

* Improved MSM scalability by using an Oak-based index vs in-memory (LiveCopyIndex)

### Launches {#launches}

* Improved performance of launches that contain large site tree and if there are many Launches active
* Improved auto-promotion and publish of launches with multiple root pages.
* Fixed an issue that prevented the responsive device preview to work with pages edited in context of a launch.

### Content Targeting & Simulation {#content-targeting-simulation}

* Support folders to organize segments based on site/context (CQ-94620)
* Moved default location for segments into /conf to have site/context specific Segment lists.

### AEM &amp; Adobe Target&nbsp; {#aem-amp-adobe-target-nbsp}

* Integrated AEM Experience Fragments with Adobe Target. Synchronizing Experience Fragments to Target will create offers in Adobe Target that can be used with Target's Visual Experience Composer to embed it in any Target enabled experience.
* Adobe Target mbox.js version 63 now included. Adobe recommends to switch implementation to at.js.
* at.js version 1.2.2 now included. Adobe recommends to use either Dynamic Tag Management (DTM) or [Adobe Experience Platform Launch](https://www.adobe.com/enterprise/cloud-platform/launch.html) to provision at.js into the site.

### AEM &amp; Adobe Analytics {#aem-amp-adobe-analytics}

* s_code.js H.27.5 now included. Adobe recommends to switch implementation to AppMeasurement.js
* AppMeasurement.js 1.8.0 now included. Adobe recommends to use either Dynamic Tag Management (DTM) or [Adobe Experience Platform Launch](https://www.adobe.com/enterprise/cloud-platform/launch.html) to provision AppMeasurement.js into the site.

## Communities Add-On {#communities-add-on}

See [Communities Release Notes page](/help/release-notes/communities-release-notes.md)

## Screens Add-On {#screens-add-on}

* Added support for Screens Players to be connecting to AEM publish servers for command & control and channel downloads (instead of directly to AEM author).
* Added ability to group channel assignments in Schedules
* Channel assignments now have start and end date
* Device Dashboard now shows player shell and firmware version
* Device Dashboard list shows connection status of player
* Added Google Chrome OS support for AEM Screens Player 
* Added Microsoft Windows 10 for AEM Screens Player


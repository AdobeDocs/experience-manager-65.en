---
title: SPA Page Component
description: In an SPA the page component does not provide the HTML elements of its child components, but instead delegates this to the SPA framework. This document explains how this makes the page component of an SPA unique.
contentOwner: bohnert
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: spa
content-type: reference
docset: aem65
exl-id: 0e9e2350-67ef-45c3-991f-6c1cd98fe93d
solution: Experience Manager, Experience Manager Sites
feature: Developing,SPA Editor
role: Developer
---

# SPA Page Component{#spa-page-component}

In an SPA the page component does not provide the HTML elements of its child components, but instead delegates this to the SPA framework. This document explains how this makes the page component of an SPA unique.

{{ue-over-spa}}

## Introduction {#introduction}

The page component for an SPA does not provide the HTML elements of its child components via a JSP or HTL file and resource objects. This operation is delegated to the SPA framework. The representation of child components is fetched as a JSON data structure (that is, the model). The SPA components are then added to the page according to the provided JSON model. As such the page component initial body composition differs from its pre-rendered HTML counterparts.

## Page Model Management {#page-model-management}

The resolution and the management of the page model is delegated to a provided [ `PageModelManager`](/help/sites-developing/spa-blueprint.md#pagemodelmanager) module. The SPA must interact with the `PageModelManager` module when it initializes to fetch the initial page model and register for model updates - mostly produced when the author is editing the page via the Page Editor. The `PageModelManager` is accessible by SPA project as a npm package. Being an interpreter between AEM and the SPA, the `PageModelManager` is meant to accompany the SPA.

To allow the page to be authored, a client library named `cq.authoring.pagemodel.messaging` must be added to provide a communication channel between the SPA and the page editor. If the SPA page component inherits from the page wcm/core component then there are the following options to make the `cq.authoring.pagemodel.messaging` client library category available:

* If the template is editable, add the client library category to the page policy.
* Add the client library category using the `customfooterlibs.html` of the page component.

Do not forget to limit the inclusion of the `cq.authoring.pagemodel.messaging` category to the context of the page editor.

## Communication Data Type {#communication-data-type}

The communication data type is set an HTML element inside the AEM Page component using the `data-cq-datatype` attribute. When the communication data type is set to JSON, the GET requests hit the Sling Model endpoints of a component. After an update occurs in the page editor, the JSON representation of the updated component is sent to the Page Model library. The Page Model library then warns the SPA of updates.

**SPA Page Component - `body.html`**

```
<div id="page"></div>
```

In addition to being good practice not to delay the DOM generation, the SPA framework requires the scripts to be added at the end of the body.

**SPA Page Component -`customfooterlibs.html`**

```
<sly data-sly-use.clientLib="${'/libs/granite/sightly/templates/clientlib.html'}"></sly>
<sly data-sly-test="${wcmmode.edit || wcmmode.preview}"
     data-sly-call="${clientLib.js @ categories='cq.authoring.pagemodel.messaging'}"></sly>
<sly data-sly-call="${clientLib.js @ categories='we-retail-journal-react'}"></sly>
```

The meta resource properties that describe the SPA content:

**SPA Page Component - `customheaderlibs.html`**

```
<meta property="cq:datatype" data-sly-test="${wcmmode.edit || wcmmode.preview}" content="JSON"/>
<meta property="cq:wcmmode" data-sly-test="${wcmmode.edit}" content="edit"/>
<meta property="cq:wcmmode" data-sly-test="${wcmmode.preview}" content="preview"/>
<meta property="cq:pagemodel_root_url" data-sly-use.page="com.adobe.cq.sample.spa.journal.models.AppPage" content="${page.rootUrl}"/>
<sly data-sly-use.clientlib="/libs/granite/sightly/templates/clientlib.html">
    <sly data-sly-call="${clientlib.css @ categories='we-retail-journal-react'}"/>
</sly>
```

>[!NOTE]
>
>The default model selector is statically set when requesting the Sling Model representation of a component.

## Meta Properties {#meta-properties}

* `cq:wcmmode`: WCM mode of the editors (for example, page, template)
* `cq:pagemodel_root_url`: URL of the root model of the App. Crucial when directly accessing a child page since the child page model is a fragment of the app root model. The ` [PageModelManager](/help/sites-developing/spa-page-component.md)` then systematically recomposes the application initial model as entering the application from its root entry point.

* `cq:pagemodel_router`: Enable or disable the ` [ModelRouter](/help/sites-developing/spa-routing.md)` of the `PageModelManager` library

* `cq:pagemodel_route_filters`: Comma separated list or regular expressions to provide routes the ` [ModelRouter](/help/sites-developing/spa-routing.md)` must ignore.

>[!CAUTION]
>
>This document uses the We.Retail Journal app for demonstration purposes only. Do not use for any project work.
>
>Any AEM project should use the [AEM Project Archetype](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/developing/archetype/overview.html), which supports SPA projects using React or Angular and uses the SPA SDK.All SPA projects on AEM should be based on the Maven Archetype for SPA Starter Kit.

## Page Editor Overlay Synchronization {#page-editor-overlay-synchronization}

The synchronization of the overlays is guaranteed by the very same Mutation Observer provided by the `cq.authoring.page` category.

## Sling Model JSON Exported Structure Configuration {#sling-model-json-exported-structure-configuration}

When the routing capabilities are enabled, the assumption is that the JSON export of the SPA contains the different routes of the application thanks to the JSON export of the AEM navigation component. The JSON output of the AEM navigation component can be configured in the SPA's root page content policy through the following two properties:

* `structureDepth`: Number corresponding to the depth of the tree exported
* `structurePatterns`: Regex of array of regexes corresponding to the page to be exported

This can be shown in the SPA sample content in `/conf/we-retail-journal/react/settings/wcm/policies/we-retail-journal/react/components/structure/page/root`.

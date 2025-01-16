---
title: SPA Model Routing
description: For single page applications in AEM, the app is responsible for the routing. This document describes the routing mechanism, the contract, and options available.
contentOwner: bohnert
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: spa
content-type: reference
exl-id: eaef65ec-2e4d-490f-8158-d48d738e3409
solution: Experience Manager, Experience Manager Sites
feature: Developing,SPA Editor
role: Developer
---

# SPA Model Routing{#spa-model-routing}

For single page applications in AEM, the app is responsible for the routing. This document describes the routing mechanism, the contract, and options available.

{{#ue-over-spa}}

## Project Routing {#project-routing}

The App owns the routing and is then implemented by the project front end developers. This document describes the routing specific to the model returned by the AEM server. The page model data structure exposes the URL of the underlying resource. The front end project can use any custom or third-party library providing routing functionalities. Once a route expects a fragment of model, a call to the `PageModelManager.getData()` function can be made. When a model route has changed an event must be triggered to warn listening libraries such as the Page Editor.

## Architecture {#architecture}

For a detailed description, see the [PageModelManager](/help/sites-developing/spa-blueprint.md#pagemodelmanager) section of the SPA Blueprint document.

## ModelRouter {#modelrouter}

The `ModelRouter` - when enabled - encapsulates the HTML5 History API functions `pushState` and `replaceState` to guarantee a given fragment of model is pre-fetched and accessible. It then notifies the registered front end component that the model has been modified.

## Manual vs Automatic Model Routing {#manual-vs-automatic-model-routing}

The `ModelRouter` automates the fetching of fragments of the model. But as any automated tooling it comes with limitations. When needed the `ModelRouter` can be disabled or configured to ignore paths using meta properties (See the Meta Properties section of the [SPA Page Component](/help/sites-developing/spa-page-component.md) document). Front end developers can then implement their own model routing layer by requesting the `PageModelManager` to load any given fragment of model using the `getData()` function.

>[!NOTE]
>
>The [We.Retail Journal](https://github.com/adobe/aem-sample-we-retail-journal) sample React project illustrates the automated approach while the Angular project illustrates the manual one. A semi-automated approach would also be valid use-case.

>[!CAUTION]
>
>The current version of the `ModelRouter` only support the use of URLs that points to the actual resource path of Sling Model entry points. It does not support the use of Vanity URLs or aliases.

## Routing Contract {#routing-contract}

The current implementation is based on the assumption that the SPA project uses the HTML5 History API for routing to the different application pages.

### Configuration {#configuration}

The `ModelRouter` supports the concept of model routing as it listens for `pushState` and `replaceState` calls to prefetch model fragments. Internally it triggers the `PageModelManager` to load the model that corresponds to a given URL and fires a `cq-pagemodel-route-changed` event that other modules can listen to.

By default, this behavior is automatically enabled. To disable it, the SPA should render the following meta property:

```
<meta property="cq:pagemodel_router" content="disabled"\>
```

Note that every route of the SPA should correspond to an accessible resource in AEM (for example, " `/content/mysite/mypage"`) since the `PageModelManager` will automatically try to load the corresponding page model once the route is selected. Though, if needed, the SPA can also define a "block list" of routes that should be ignored by the `PageModelManager`:

```
<meta property="cq:pagemodel_route_filters" content="route/not/found,^(.*)(?:exclude/path)(.*)"/>
```

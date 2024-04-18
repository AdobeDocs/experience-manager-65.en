---
title: Components Overview

description: Components are modular units which realize specific functionality to present your content on your website


contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: components
content-type: reference

exl-id: 9e30c969-2692-4380-943a-b022ee900ce8
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Components Overview{#components-overview}

This page provides an overview of Adobe Experience Manager (AEM) components such as those [used for page authoring](/help/sites-authoring/default-components-foundation.md).

## What are Components? {#what-exactly-is-a-component}

* Modular units which realize specific functionality to present your content on your website.
* Re-usable.
* Developed as self-contained units within one folder of the repository.
* Have no hidden configuration files.
* Can contain other components.
* Can run anywhere within any AEM system. They can also be limited to run under specific components.
* Have a standardized user interface.
* Have edit behavior that can be configured.
* Use dialog boxes that are built using sub-elements based on Granite UI components
* Are developed using [HTL](https://experienceleague.adobe.com/docs/experience-manager-htl/content/overview.html) (recommended) or JSP.
* Can be developed to create customized components that extend the default functionality.

Because components are modular, you can:

* Develop a new component on your local instance.
* Deploy it to your test environment.
* Deploy it to your live authoring environment, where they allow authors and/or administrators to add and configure content.
* Deploy it to your live publish environment(s), where they are used to render content for visitors to your website. Certain components, for example, for Communities, also accept input from your users.

Each AEM component:

* Is a resource type.
* Is a collection of scripts that completely realize a specific function.
* Can function in *isolation*, meaning either within AEM or a portal.

## Out-of-the-Box Components Within AEM {#out-of-the-box-components-within-aem}

AEM comes with a variety of [out-of-the-box components](/help/sites-authoring/default-components.md) that provide comprehensive functionality including:

* Paragraph System ( `parsys`)
* Page ( `responsivegrid` - touch-enabled UI only)
* Text
* Image, with accompanying text
* Toolbar

The components provided and their usage within the [sample We.Retail websites](/help/sites-developing/we-retail.md) provided illustrate how to implement and use components. The components are provided with all source code and can be used as is or as starting points for modified or extended components.

### Core Components and Foundation Components {#core-components-and-foundation-components}

There are two sets of Adobe-provided AEM components available:

* [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/introduction.html)
* [Foundation Components](/help/sites-authoring/default-components-foundation.md)

**Core Components** were introduced with AEM 6.3 and offer flexible and feature-rich authoring functionality. The [We.Retail reference site](/help/sites-developing/we-retail.md) illustrates how the core components can be used and represent the current best-practices of component development.

**Foundation Components** have been available with AEM for many versions and are available out-of-the-box in a standard AEM installation. Although still supported, most have been deprecated, are no longer enhanced, and are based on legacy technologies.

>[!NOTE]
>
>[Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/introduction.html) represent the current best practices for component design and development and serve as reference implementations.
>
>[AEM Modernization Tools](modernization-tools.md) can help the migration to Core Components.

### Viewing Available Components {#viewing-available-components}

For an overview of all the available components in your AEM instance, use the [Components Console](/help/sites-authoring/default-components-console.md).

Alternatively, you can also use CRXDE Lite to get a list of all the components available in the repository.

1. In **[!UICONTROL CRXDE Lite]**, select **[!UICONTROL Tools]** from the toolbar, then **[!UICONTROL Query]**, which opens the **[!UICONTROL Query]** tab.

1. In the **[!UICONTROL Query]** tab, select `XPath` as **[!UICONTROL Type]**.

1. In the **[!UICONTROL Query]** input field, enter following string:

   `//element(*, cq:Component)`

1. Click **[!UICONTROL Execute]** and the components are listed.

## Additional resources {#further-reading}

The following pages provide more detailed information about developing these&mdash;and other&mdash;components:

* [AEM Components - The Basics](/help/sites-developing/components-basics.md)
* [Developing AEM Components](/help/sites-developing/developing-components.md)
* [Developing AEM Components - Code Samples](/help/sites-developing/developing-components-samples.md)
* [Configuring Multiple In-Place Editors](/help/sites-developing/multiple-inplace-editors.md)
* [Developer Mode](/help/sites-developing/developer-mode.md)
* [Testing Your UI](/help/sites-developing/hobbes.md)
* [Components for Content Fragments](/help/sites-developing/components-content-fragments.md)
* [Obtaining Page Information in JSON Format](/help/sites-developing/pageinfo.md)
* [Internationalizing Components](/help/sites-developing/i18n.md)
* [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/introduction.html)
* [Using Hide Conditions](/help/sites-developing/hide-conditions.md)
* Classic UI

    * [AEM Components (Classic UI)](/help/sites-developing/developing-components-classic.md)
    * [Using and Extending Widgets (Classic UI)](/help/sites-developing/widgets.md)
    * [Using xtypes (Classic UI)](/help/sites-developing/xtypes.md)
    * [Developing Forms (Classic UI)](/help/sites-developing/developing-forms.md)

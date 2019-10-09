---
title: Components Console
seo-title: Components Console
description: null
seo-description: null
uuid: 308b7fa1-9525-43f3-8c15-1076485b3f8c
contentOwner: Chris Bohnert
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: page-authoring
content-type: reference
discoiquuid: 8774c38a-abd2-4dc2-868e-d6760c96f3f6
---

# Components Console{#components-console}

The Components console allows you to browse through all components defined for your instance and view key information for each component.

It can be accessed from **Tools** -&gt; **General** -&gt; **Components**. In the console, card and list view are available. Because there is no tree structure for components, column view is not available.

![chlimage_1-301](assets/chlimage_1-301.png)

>[!NOTE]
>
>The Component Console shows all components in the system. The [Component Browser](/help/sites-authoring/author-environment-tools.md#components-browser) shows components that are available to authors and hides any component groups that begin with a period ( `.`).

## Search {#search-features}

With the **Content Only** icon (top left) you can open the **Search** panel to search and/or filter the components:

![chlimage_1-302](assets/chlimage_1-302.png) 

## Component Details {#component-details}

To view details about a specific component tap/click on the required resource. Three tabs provide:

* **Properties**

  ![screen_shot_2018-03-27at165847](assets/screen_shot_2018-03-27at165847.png)

  On the Properties tab you can:

    * View the general properties of the component.
    * View how the [icon or abbreviation has been defined](/help/sites-developing/components-basics.md#component-icon-in-touch-ui) for the component.

        * Clicking the source of the icon will take you to that component.

    * View the **Resource Type** and **Resource Super Type** (if defined) for the component.

        * Clicking the Resource Super Type will take you to that component.

  >[!NOTE]
  >
  >Because `/apps` is not editable at runtime, the Components Console is read-only.

* **Policies**

  ![chlimage_1-303](assets/chlimage_1-303.png)

* **Live Usage**

  ![chlimage_1-304](assets/chlimage_1-304.png)

  >[!CAUTION]
  >
  >Due to the nature of the information being collected for this view, it can take a while to be collated/displayed.

* **Documentation**

  If the developer has provided [documentation for the component](/help/sites-developing/developing-components.md#documenting-your-component), it will appear on the **Documentation** tab. If there is no documentation available, the **Documentation** tab will not be shown.

  ![chlimage_1-305](assets/chlimage_1-305.png)


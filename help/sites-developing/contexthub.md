---
title: ContextHub
description: ContextHub is a framework for storing, manipulating, and presenting context data
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: personalization
content-type: reference
exl-id: 3fd50655-7461-4900-a3b8-c01b04c7ba7a
solution: Experience Manager, Experience Manager Sites
feature: Developing,Personalization
role: Developer
---
# ContextHub{#contexthub}

ContextHub is a framework for storing, manipulating, and presenting context data. The client-side JavaScript API enables you to access the data for personalizing content.

>[!NOTE]
>
>The [We.Retail reference implementation](/help/sites-developing/we-retail.md) implements ContextHub and can serve as a reference as you integrate ContextHub into your own project.

>[!CAUTION]
>
>The path containing the sample ContextHub configuration that is used by the [We.Retail reference implementation](/help/sites-developing/we-retail.md) ( `/libs/settings/cloudsettings/legacy`) should only be used as a reference for creating your own configuration.
>
>Do not use in a project as your own ContextHub configuration.

## Persistence {#persistence}

ContextHub stores persist context data on the client. The ContextHub JavaScript API enables you to access stores to create, update, and delete data as necessary. As such, ContextHub represents a data layer on your pages.

Each ContextHub store is an instance of a predefined store type:

* ContextHub provides several [sample store types](/help/sites-developing/ch-samplestores.md).
* Use AEM consoles to [create stores](ch-configuring.md#creating-a-contexthub-store).
* Developers can [create custom store types](/help/sites-developing/ch-extend.md#creating-custom-store-candidates).
* Developers can [access store data](/help/sites-developing/ch-adding.md#interacting-with-contexthub-stores) via JavaScript.

## Segmentation {#segmentation}

ContextHub includes a segmentation engine that manages segments and determines which segments are resolved for the current context. Several segments are defined. You can use the JavaScript API to [determine resolved segments](/help/sites-developing/ch-adding.md#determining-resolved-contexthub-segments).

## Presentation {#presentation}

The [ContextHub toolbar](/help/sites-authoring/ch-previewing.md) enables marketers and authors to see and manipulate store data for simulating the user experience when authoring pages. The toolbar consists of groups of UI modules that provide access to ContextHub stores.

Each ContextHub UI module is an instance of a predefined module type:

* ContextHub provides several [sample module types](/help/sites-developing/ch-samplemodules.md).
* Use AEM consoles to [add UI modules](ch-configuring.md#adding-a-ui-module), and to [group them in UI modes](ch-configuring.md#adding-a-ui-mode).

* Developers can [create custom module types](/help/sites-developing/ch-extend.md#creating-contexthub-ui-module-types).

Developers need to [add the ContextHub component to the page](/help/sites-developing/ch-adding.md).

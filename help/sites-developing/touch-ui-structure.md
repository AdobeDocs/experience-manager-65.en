---
title: Structure of the Adobe Experience Manager Touch-Enabled UI
description: The touch-optimized UI, as implemented in Adobe Experience Manager, has several underlying principles and is made up of several key elements
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: introduction
content-type: reference
exl-id: e562b289-5d8b-4fa8-ad1c-fff5f807a45e
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Structure of the Adobe Experience Manager Touch-Enabled UI{#structure-of-the-aem-touch-enabled-ui}

The Adobe Experience Manager (AEM) touch-enabled UI has several underlying principles and is made up of several key elements:

## Consoles {#consoles}

### Basic Layout and Resizing {#basic-layout-and-resizing}

The UI caters for both mobile and desktop devices, though rather than creating two styles Adobe has decided to use one style that works for all screens and devices.

All modules use the same basic layout, in AEM this can be seen as:

![chlimage_1-142](assets/chlimage_1-142.png)

The layout adheres to a responsive design style and will accommodate itself to the size of the device/window you are using.

For example, when the resolution goes below 1024 px (as on a mobile device) the display will be adjusted accordingly:

![chlimage_1-143](assets/chlimage_1-143.png)

### Header Bar {#header-bar}

![chlimage_1-144](assets/chlimage_1-144.png)

The header bar shows global elements including:

* the logo and the specific product/solution that you are currently using; for AEM this also forms a link to the Global Navigation
* Search
* icon for accessing the help resources
* icon for accessing other Solutions
* an indicator of (and access to) any alerts or Inbox items that are waiting for you
* the user icon, together with a link to your profile management

### Toolbar {#toolbar}

This is contextual to your location and surfaces tools relevant to controlling the view or assets in the page below. The toolbar is product-specific, but there is some commonality to the elements.

In any location the toolbar shows the actions currently available:

![chlimage_1-145](assets/chlimage_1-145.png)

Also dependent on whether a resource is selected:

![chlimage_1-146](assets/chlimage_1-146.png)

### Left Rail {#left-rail}

The left rail can be opened/hidden as required to show:

* **Timeline**
* **References**
* **Filter**

The default is **Content Only** (rail hidden).

![chlimage_1-147](assets/chlimage_1-147.png)

## Page Authoring {#page-authoring}

When authoring pages, the structural areas are as follows.

### Content Frame {#content-frame}

The page content is rendered in the content frame. The content frame is independent of the editor&mdash;to ensure that there are no conflicts due to CSS or JavaScript.

The content frame is on the right-hand section of the window, under the toolbar.

![chlimage_1-148](assets/chlimage_1-148.png)

### Editor Frame {#editor-frame}

The editor frame realizes the editing features.

The editor frame is a container (abstract) for all the *page authoring elements*. It lives on top of the content frame, and includes:

* the top toolbar
* the side panel
* all the overlays
* any other page authoring element; for example, the component toolbar

![chlimage_1-149](assets/chlimage_1-149.png)

### Side Panel {#side-panel}

This contains two default tabs that let you select assets and components. They can be dragged from here and dropped onto the page.

The side panel is hidden by default. When selected it will either be shown at the left side, or will slide across to cover the entire window (when the window size is below a width of 1024 px; as, for example, on a mobile device).

![chlimage_1-150](assets/chlimage_1-150.png)

### Side Panel - Assets {#side-panel-assets}

In the Assets tab you can select from the range of assets. You can also filter on a specific term, or select a group.

![chlimage_1-151](assets/chlimage_1-151.png)

### Side Panel - Asset Groups {#side-panel-asset-groups}

In the Asset tab, there is a drop-down that you can use to select the specific asset groups.

![chlimage_1-152](assets/chlimage_1-152.png)

### Side Panel - Components {#side-panel-components}

In the Components tab, you can select from the range of components. You can also filter on a specific term, or select a group.

![chlimage_1-153](assets/chlimage_1-153.png)

### Overlays {#overlays}

These overlay the content frame and are used by the [layers](#layer) to realize the mechanics of how you can interact (transparently) with the components and their content.

The overlays live in the editor frame (with all other page authoring elements), though they actually overlay the appropriate components in the content frame.

![chlimage_1-154](assets/chlimage_1-154.png)

### Layer {#layer}

A layer is an independent bundle of functionality that can be activated to:

* provide a different view of the page
* let you manipulate and/or interact with a page

The layers provide sophisticated functionality for the entire page, as opposed to specific actions on an individual component.

AEM comes with several layers already implemented for page authoring; including for example, edit, preview, annotate.

>[!NOTE]
>
>Layers are a powerful concept that affects the user's view of and interaction with the page content. When developing your own layers, you must ensure that the layer cleans up when it is exited.

### Layer Switcher {#layer-switcher}

The layer switcher lets you choose the layer you want to use. When closed, it indicates the layer currently in use.

The layer switcher is available as a drop-down from the toolbar (at the top of the window, within the editor frame).

![chlimage_1-155](assets/chlimage_1-155.png)

### Component Toolbar {#component-toolbar}

Each instance of a component reveals its toolbar when clicked (either once or with a slow double-click). The toolbar contains the specific actions (for example, copy, paste, open-editor) that are available for the component instance (Editable) on the page.

Depending on the space available, the component toolbars are positioned at the top-, or bottom-, right corner of the appropriate component.

![chlimage_1-156](assets/chlimage_1-156.png)

## Further Information {#further-information}

For more details about the concepts around the touch-enabled UI, read [Concepts of the AEM Touch-Enabled UI](/help/sites-developing/touch-ui-concepts.md).

For more technical information, see [JS documentation set](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/jsdoc/ui-touch/editor-core/index.html) for the touch-enabled page editor.

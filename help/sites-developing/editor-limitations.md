---
title: Editor Limitations
description: The editor in the touch-enabled UI uses overlays to interact with content confined in an iframe. This interaction creates some limitations in both usage of the editor and also for developers.
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: introduction
exl-id: fd64f5dc-dfff-466b-8cdd-3c24ea1a15c8
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Editor Limitations{#editor-limitations}

The editor in the touch-enabled UI uses overlays to interact with content confined in an iframe. This interaction creates some limitations in both usage of the editor and also for developers. This page summarizes these limitations and provides solutions or work-arounds where possible.

## Functional Limitations {#functional-limitations}

An author may encounter the following functional limitations when using the editor to author pages.

### Links Not Active {#links-not-active}

When [editing a page](/help/sites-authoring/editing-content.md), links are not active.

* [Switch to **Preview** mode](/help/sites-authoring/editing-content.md#preview-mode) to navigate using the links in your content.

### Structure Pages {#structure-pages}

Pages cannot be named `structure`. Pages that are named `structure` are not editable in the page editor.

## CSS Limitations {#css-limitations}

A developer may encounter the following limitations with the editor's interactions with CSS.

### Absolutely Positioned Elements {#absolutely-positioned-elements}

Absolutely positioned elements can cause issues in the position of their overlay.

* If this happens, make sure that the dimensions of the absolutely positioned element are correct because the editor creates an overlay with the exact same dimensions.

### vh Units {#vh-units}

`vh` units are not supported because the iframe height must be automatically adjusted by Adobe Experience Manager (AEM).

### Fixed Background Images {#fixed-background-images}

Fixed background images may not be displayed as fixed when scrolling because it is embedded within an iframe.

* Selecting **View Page as Published** in the header bar actions displays the page properly.

### 100% Height {#height}

100% height is not supported on a page's body element.

* A work-around is possible to implement a fullscreen body by "stretching" the body element as follows:

```xml
body {
    position: absolute;
    top: 0;
    bottom: 0;
    right: 0;
    left: 0;
}
```

### Margin Collapsing {#margin-collapsing}

Margin collapsing problems can be seen if the first child element of the body element has a margin.

* The solution is to add a clearfix at the body element level such as follows:

```xml
body:before, body:after{
    content: ' ';
    display: table;
}
```

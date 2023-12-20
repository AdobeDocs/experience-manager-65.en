---
title: Component Sideloading
description: Communities component sideloading is useful when a web page is designed as a simple, single page app that dynamically alters what is displayed depending on what is selected by the site visitor
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: 960e132c-b370-43d1-bd8f-e7d0ded7c0b3
---
# Component Sideloading {#component-sideloading}

## Overview {#overview}

Communities component sideloading is useful when a web page is designed as a simple, single page app that dynamically alters what is displayed depending on what is selected by the site visitor.

This is accomplished when Communities components do not exist in the page template, but instead are dynamically added following a site visitor's selection.

Since the social component framework (SCF) has a lightweight presence, only SCF components that exist at the time of initial page load are registered. For a dynamically added SCF component to be registered after page load, SCF must be invoked to "sideload" the component.

When a page is designed to sideload Communities components, it is possible to cache the entire page.

The steps to dynamically add SCF components are:

1. [Add the component to the DOM](#dynamically-add-component-to-dom)

1. [Sideload the component](#sideload-by-invoking-scf) using one of two methods:

* [Dynamic inclusion](#dynamic-inclusion)
  * Boostrap all dynamically added components
* [Dynamic loading](#dynamic-loading)
  * Add one specific component on-demand

>[!NOTE]
>
>Sideloading of [non-existing resources](scf.md#add-or-include-a-communities-component) is not supported.

## Dynamically Add Component to DOM {#dynamically-add-component-to-dom}

Whether the component is dynamically included or dynamically loaded, it must first be added to the DOM.

When adding the SCF component, the most common tag to use is the DIV tag, but other tags may be used as well. Because SCF only examines the DOM when the page initially loads, this addition to the DOM will go unnoticed until SCF is explicitly invoked.

Whatever tag is used, at a minimum, the element must conform to the normal SCF root element pattern by containing these two attributes:

* **data-component-id**
  
  The effective path to the added component.

* **data-scf-component**
  
  The resourceType of the component.

Following is one example of an added comments component:

```xml
<div
    class="scf-commentsystem scf translation-commentsystem"
    data-component-id="<%= currentPage.getPath()%>/jcr:content/content-left/comments"
    data-scf-component="social/commons/components/hbs/comments"
>
</div>
```

## Sideload by Invoking SCF {#sideload-by-invoking-scf}

### Dynamic Inclusion {#dynamic-inclusion}

Dynamic inclusion uses a boostrap request that results in SCF examining the DOM and bootsrapping all SCF components found on the page.

To initialize SCF components anytime after page load, simply fire a JQuery event like this:

`$(document).trigger(SCF.events.BOOTSTRAP_REQUEST);`

### Dynamic Loading {#dynamic-loading}

Dynamic loading provides control over loading SCF components.

Instead of bootstrapping all SCF components found in the DOM, it is possible to specify a specific SCF component to load using this JavaScript method:

`SCF.addComponent(document.getElementById(*someId*));`

Where `someId` is the value of the `data-component-id` attribute.

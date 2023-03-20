---
title: Developer Mode
seo-title: Developer Mode
description: Developer mode opens a side panel with several tabs that provide a developer with infomation about the current page
seo-description: Developer mode opens a side panel with several tabs that provide a developer with infomation about the current page
uuid: 8301ab51-93d6-44f9-a813-ba7f03f54485
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: components
content-type: reference
discoiquuid: 589e3a83-7d1a-43fd-98b7-3b947122829d
docset: aem65
exl-id: aef0350f-4d3d-47f4-9c7e-5675efef65d9
---
# Developer Mode{#developer-mode}

When editing pages in AEM, several [modes](/help/sites-authoring/author-environment-tools.md#modestouchoptimizedui) are available, including Developer mode. This opens a side panel with several tabs that provide a developer with infomation about the current page. The three tabs are:

* **[Components](#components)** for viewing sructure and performance information.
* **[Tests](#tests)** for running tests and analyzing the results.
* **[Errors](#errors)** to see any problems occuring.

These help a developer to:

* Discover: what pages are composed of.
* Debug: what is happening where and when, which in turn helps to resolve issues.
* Test: does the application behave as expected.

>[!CAUTION]
>
>Developer mode:
>
>* Is only available in the touch-enabled UI (when editing pages).
>* Is not available on mobile devices or small windows on desktop (due to space restrictions).
>
>   * This occurs when the width is less than 1024px.  
>* Is only available to users who are members of the `administrators` group.

>[!CAUTION]
>
>Developer mode is only available on a standard author instance that is not using the nosamplecontent run-mode.
>
>If required it can be configured for use:
>
>* on an author instance using nosamplecontent run-mode
>* a publish instance
>
>It should be disabled again after use.

>[!NOTE]
>
>See the:
>
>* Knowledge Base article, [Troubleshooting AEM TouchUI issues](https://helpx.adobe.com/experience-manager/kb/troubleshooting-aem-touchui-issues.html), for further tips and tools.
>* AEM Gems session about [AEM 6.0 Developer Mode](https://experienceleague.adobe.com/docs/experience-manager-gems-events/gems/gems2014/aem-developer-mode.html?lang=en).
>

## Opening Developer Mode {#opening-developer-mode}

Developer mode is implemented as a side panel to the page editor. To open the panel, select **Developer** from the mode selector in the toolbar of the page editor:

![chlimage_1-11](assets/chlimage_1-11.png)

The panel is divided into two tabs:

* **[Components](/help/sites-developing/developer-mode.md#components)** - This shows a component tree, similar to the [content tree](/help/sites-authoring/author-environment-tools.md#content-tree) for authors

* **[Errors](/help/sites-developing/developer-mode.md#errors)** - When problems occur, details are shown for each component.

### Components {#components}

![chlimage_1-12](assets/chlimage_1-12.png)

This shows a component tree that:

* Outlines the chain of components and templates rendered on the page (SLY, JSP, etc.). The tree can be expanded to show context within the hierarchy.
* Shows the server-side computational time needed to render the component.
* Allows you to expand the tree and select specific components within the tree. Selection provides access to component details; such as:

    * Repository path
    * Links to scripts (accessed in CRXDE Lite)

* Selected components (in the content flow, indicated by a blue border) will be highlighted in the content tree (and vice versa).

This can help to:

* Determine and compare the rendering time per component.
* See and understand the hierarchy.
* Understand, and then improve, the page loading time by finding slow components.

Each component entry can show (for example):

![chlimage_1-13](assets/chlimage_1-13.png)

* **View Details**: a link to a list that shows:

    * all component scripts used to render the component.
    * the repository content path for this specific component.

  ![chlimage_1-14](assets/chlimage_1-14.png)

* **Edit Script**: a link that:

    * opens the component script in CRXDE Lite.

* Expanding a component entry (arrow head) can also show:

    * The hierarchy within the selected component.
    * Rendering times for the selected component in isolation, any individual components nested within it, and the combined total.

  ![chlimage_1-15](assets/chlimage_1-15.png)

>[!CAUTION]
>
>Some links point to scripts under `/libs`. However, these are for reference only, you **must not** edit anything under `/libs`, as any changes you do make may be lost. This is due to the fact that this branch is liable to changes whenever you upgrade or apply a hotfix/feature pack. Any changes you require should be made under `/apps`, see [Overlays and Overrides](/help/sites-developing/overlays.md).

### Errors {#errors}

![chlimage_1-16](assets/chlimage_1-16.png)

Hopefully the **Errors** tab will always be empty (as above), but when problems occur the following details are shown for each component:

* A warning if the component writes an entry to the error log, together with details of the error and direct links to the appropriate code within CRXDE Lite.
* A warning if the component opens an admin session.

For example, in a situation where a undefined method is called, the resulting error will be shown in the **Errors** tab:

![chlimage_1-17](assets/chlimage_1-17.png)

The component entry in the tree of the Components tab will also be marked with an indicator when an error occurs.

### Tests {#tests}

>[!CAUTION]
>
>In AEM 6.2, the testing features of Developer mode was re-implemented as a standalone Tools application.
>
>For full details see [Testing Your UI](/help/sites-developing/hobbes.md).

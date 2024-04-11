---
title: Components for Content Fragments
description: Adobe Experience Manager (AEM) content fragments are created and managed as page-independent assets
contentOwner: AEM Docs
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: components
content-type: reference
docset: aem65
pagetitle: Components for Content Fragments
exl-id: f2edd9b2-f231-42f3-a25e-428cd1d96c2a
solution: Experience Manager, Experience Manager Sites
feature: Developing,Content Fragments
role: Developer
---
# Components for Content Fragments{#components-for-content-fragments}

## Components for Fragment Authoring {#components-for-fragment-authoring}

>[!CAUTION]
>
>It is not recommended to extend or change the actual components used in the Fragment Editor as they are still subject to change.

See the [Content Fragment Management API - Client-Side](/help/sites-developing/customizing-content-fragments.md#the-content-fragment-management-api-client-side).

## Components for Page Authoring {#components-for-page-authoring}

>[!CAUTION]
>
>The [Content Fragment Core Component](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/wcm-components/content-fragment-component.html) is now recommended. See [Developing Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/developing/overview.html) for more details.
>
>This section details the original component delivered for use with content fragments (**Content Fragment** in the **General** group).

>[!NOTE]
>
>See also [Content Fragments Configuring Components for Rendering](/help/sites-developing/content-fragments-config-components-rendering.md) for further information.

Adobe Experience Manager (AEM) content fragments are [created and managed as page-independent assets](/help/assets/content-fragments/content-fragments.md). They let you create channel-neutral content, together with (possibly channel-specific) variations. [You can then use these fragments, and their variations, when authoring your content pages](/help/sites-authoring/content-fragments.md). You can also use an existing content fragment asset by [dragging it from the asset browser to the page](/help/sites-authoring/content-fragments.md#adding-a-content-fragment-to-your-page) (as for other asset-based components, such as the foundation component Image). The out-of-the-box content fragment component displays only one [element](/help/assets/content-fragments/content-fragments.md#constituent-parts-of-a-content-fragment) of the referenced content fragment. Using the component dialog you can define the [element, variation and range of fragment paragraphs](/help/assets/content-fragments/content-fragments.md#constituent-parts-of-a-content-fragment) that you want to display on the page.

>[!NOTE]
>
>This Content Fragment component was introduced in AEM 6.2 as an enhanced version of the Article component, which has been deprecated.

>[!NOTE]
>
>Content Fragments are not supported in the classic UI.

### Definition {#definition}

The **Content Fragment** component is used to hold a reference to a content fragment asset (effectively enhanced text assets). The resource type for the content fragment is:

`dam/cfm/components/contentfragment/contentfragment`

The reference is defined in the property:

`fileReference`

Only the editor of the touch-enabled UI fully supports content fragment components, which include the client library:

`cq.authoring.editor.plugin.cfm`

This library adds features, specific to content fragments, to the editor. For example, support for the ability to add and configure content fragments on the page, the ability to search for content fragment assets in the asset browser, and for associated content in the side panel is available.

### In-Between Content {#in-between-content}

The **Content Fragmen**t component lets you drop additional components in-between the different paragraphs of the displayed [element](/help/assets/content-fragments/content-fragments.md#constituent-parts-of-a-content-fragment). Basically, the element displayed is composed of different paragraphs (each paragraph is marked by a carriage return). Between each of those paragraphs, you can insert content using other components.

From a technical viewpoint, each paragraph of the displayed element lives in its own parsys, and each component that you add in-between the paragraphs are (under the hood) inserted into the parsys.

In other words, if the instance of the content fragment component is composed of three paragraphs, then the component has three different parsys in the repository. All the in-between content that is added to the content fragment is actually be located inside these parsys.

In the repository, the in-between content is stored relative to its position inside the overall paragraph structure, that is, it is not attached to the actual paragraph content.

To illustrate this, consider that you have the following:

* An instance of a content fragment composed of three paragraphs
* And that some content has already been inserted after the second paragraph

  * This means that the content is stored in the second parsys.

Basically, if the paragraph structure of this instance changes (by changing the variation, element, or range of paragraphs displayed), it could affect the in-between content displayed when the content fragment content:

* Is edited and another paragraph is added before the second paragraph:

  * The in-between content is displayed after the newly created paragraph (the second parsys now holds the newly created paragraph).

* Is edited and the second paragraph is removed:

  * The in-between content is displayed after the paragraph that was previously the third (the second parsys now holds the previous third paragraph).

* Is configured so that only the first paragraph is shown:

  * The in-between content is not displayed (the second parsys is not rendered anymore due to the new configuration).

### Customizing the Content Fragment Component {#customizing-the-content-fragment-component}

To use the out-of-the-box content fragment component as a blueprint for extension you should respect the following contract:

* Reuse the HTL rendering script and its associated POJO so you can see how the in-between content feature is implemented.
* Reuse the content fragment node: `cq:editConfig`

  * The `afterinsert`/ `afteredit`/ `afterdelete` listeners are used to trigger JS events. These events are handled in the `cq.authoring.editor.plugin.cfm` client library to display the associated content in the side panel.
  * The `cq:dropTargets` are configured to support dragging content fragment assets.
  * `cq:inplaceEditing` is configured to support authoring of a content fragment in the page editor. The fragment in-place editor is defined in the `cq.authoring.editor.plugin.cfm` client library and allows a quick link to open the current [element/variation](/help/assets/content-fragments/content-fragments.md#constituent-parts-of-a-content-fragment) in the [fragment editor](/help/assets/content-fragments/content-fragments-variations.md).

### Asset Rewriting Before Rendering {#asset-rewriting-before-rendering}

Content Fragment Management uses an internal rendering process to generate the final HTML output for a page. This is used internally by the Content Fragment component, but also by the background process that updates referenced fragments on referencing pages.

Internally, the Sling Rewriter is used for that rendering. The respective configuration is found at `/libs/dam/config/rewriter/cfm` and can be adjusted, if necessary. See the [Apache Sling Rewriter](https://sling.apache.org/documentation/bundles/output-rewriting-pipelines-org-apache-sling-rewriter.html) for more information.

>[!CAUTION]
>
>If you do adjust/overlay the configuration of the rewriter:
>
>* `/libs/dam/config/rewriter/cfm` 
>
>Then the `serializerType` **must** be updated to:
>
>* `serializerType="html5-serializer"`

The out-of-the-box configuration uses the following transformers:

* `transformer-cfm-payloadfilter` - for retrieving the `body` part ( `<body>...</body>`) of the fragment's HTML only

* `transformer-cfm-parfilter` - filters out unwanted paragraphs if a paragraph range is specified (as can be done with the Content Fragment component)
* `transformer-cfm-assetprocessor` - is used internally for retrieving a list of the assets that are embedded in the fragment

The rendering process is exposed through [`com.adobe.cq.dam.cfm.content.FragmentRenderService`](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/dam/cfm/ContentFragment.html) and can be used (for example) by custom components, if necessary.

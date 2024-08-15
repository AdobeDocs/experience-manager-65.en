---
title: Customizing Page Authoring
description: Adobe Experience Manager (AEM) provides various mechanisms to let you customize page authoring functionality.
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: extending-aem
content-type: reference
exl-id: 90594588-db8e-4d4c-a208-22c1c6ea2a2d
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Customizing Page Authoring{#customizing-page-authoring}

>[!CAUTION]
>
>This document describes how to customize page authoring in the modern, touch-enabled UI and does not apply to the classic UI.

Adobe Experience Manager (AEM) provides various mechanisms to let you customize the page authoring functionality (and the [consoles](/help/sites-developing/customizing-consoles-touch.md)) of your authoring instance.

* Clientlibs

  Clientlibs let you extend the default implementation to realize new functionality, while reusing the standard functions, objects, and methods. When customizing, you can create your own clientlib under `/apps.` The new clientlib must:

    * depend on the authoring clientlib `cq.authoring.editor.sites.page`
    * be part of the appropriate `cq.authoring.editor.sites.page.hook` category

* Overlays

  Overlays are based on node definitions and let you overlay the standard functionality (in `/libs`) with your own customized functionality (in `/apps`). When creating an overlay a 1:1 copy of the original is not required, as the [sling resource merger](/help/sites-developing/sling-resource-merger.md) allows for inheritance.

>[!NOTE]
>
>For more information, see [JS documentation set](https://developer.adobe.com/experience-manager/reference-materials/6-5/jsdoc/ui-touch/editor-core/index.html).

These can be used in many ways to extend the page authoring functionality in your AEM instance. A selection is covered below (at a high level).

>[!NOTE]
>
>For more information see the following:
>
>* Using and creating [clientlibs](/help/sites-developing/clientlibs.md).
>* Using and creating [overlays](/help/sites-developing/overlays.md).
>* [Granite](https://developer.adobe.com/experience-manager/reference-materials/6-5/granite-ui/api/jcr_root/libs/granite/ui/index.html)
>* [Structure of the AEM Touch-Enabled UI](/help/sites-developing/touch-ui-structure.md) for details of the structural areas used for page authoring.
>


>[!CAUTION]
>
>***Do not*** change anything in the `/libs` path.
>
>The reason is because the content of `/libs` is overwritten, the next time you upgrade your instance (and may well be overwritten when you apply either a hotfix or feature pack).
>
>The recommended method for configuration and other changes is:
>
>1. Recreate the required item (that is, as it exists in `/libs`) under `/apps`
>1. Make any changes within `/apps`

## Add New Layer (Mode) {#add-new-layer-mode}

When you are editing a page, there are various [modes](/help/sites-authoring/author-environment-tools.md#page-modes) available. These modes are implemented using [layers](/help/sites-developing/touch-ui-structure.md#layer). These allow access to differing types of functionality for the same page content. The standard layers are: edit, preview, annotate, developer, and targeting.

### Layer Example: Live Copy Status {#layer-example-live-copy-status}

A standard AEM instance provides the MSM layer. This accesses data related to [multisite management](/help/sites-administering/msm.md) and highlights it in the layer.

To see it in action, you may edit any [We.Retail language copy](/help/sites-developing/we-retail-globalized-site-structure.md) page (or any other live copy page) and select the **Live Copy Status** mode.

You can find the MSM layer definition (for reference) in:

`/libs/wcm/msm/content/touch-ui/authoring/editor/js/msm.Layer.js`

### Code Sample {#code-sample}

This is a sample package showing how to create a layer (mode), which is a new layer for MSM view.

CODE ON GITHUB

You can find the code of this page on GitHub

* [Open aem-authoring-new-layer-mode project on GitHub](https://github.com/Adobe-Marketing-Cloud/aem-authoring-new-layer-mode)
* Download the project as [a ZIP file](https://github.com/Adobe-Marketing-Cloud/aem-authoring-new-layer-mode/archive/master.zip)

## Add New Selection Category to Asset Browser {#add-new-selection-category-to-asset-browser}

The asset browser shows assets of various types/categories (for example, images and documents). The assets can also be filtered by these asset categories.

### Code Sample {#code-sample-1}

`aem-authoring-extension-assetfinder-flickr` is a sample package showing how to add a group to the asset finder. This example connects to [Flickr](https://www.flickr.com)'s public stream and shows them in the side panel.

CODE ON GITHUB

You can find the code of this page on GitHub

* [Open aem-authoring-extension-assetfinder-flickr project on GitHub](https://github.com/Adobe-Marketing-Cloud/aem-authoring-extension-assetfinder-flickr)
* Download the project as [a ZIP file](https://github.com/Adobe-Marketing-Cloud/aem-authoring-extension-assetfinder-flickr/archive/master.zip)

## Filtering Resources {#filtering-resources}

When authoring pages, the user must often select from resources (for example, pages, components, and assets). This can take the form of a list, for example,  from which the author must choose an item.

To keep the list to a reasonable size and also relevant to the use case, a filter can be implemented in the form of a custom predicate. For example, if the [`pathbrowser`](https://developer.adobe.com/experience-manager/reference-materials/6-5/granite-ui/api/jcr_root/libs/granite/ui/index.html) [Granite](/help/sites-developing/touch-ui-concepts.md#granite-ui) component is used to allow the user to select the path to a particular resource, the paths presented can be filtered in the following way:

* Implement the custom predicate by implementing [`com.day.cq.commons.predicate.AbstractNodePredicate`](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/day/cq/commons/predicate/package-summary.html) interface.
* Specify a name for the predicate, and refer that name when using the `pathbrowser`.

For further detail on creating a custom predicate, see [Implementing a Custom Predicate Evaluator for the Query Builder](/help/sites-developing/implementing-custom-predicate-evaluator.md).

>[!NOTE]
>
>Implementing a custom predicate by implementing `com.day.cq.commons.predicate.AbstractNodePredicate` interface works in the classic UI as well.
>
>See [this knowledge base article](https://helpx.adobe.com/experience-manager/using/creating-custom-cq-tree.html) for an example of implementing a custom predicate in the classic UI.

## Add New Action to a Component Toolbar {#add-new-action-to-a-component-toolbar}

Each component (usually) has a toolbar that provides access to a range of actions that can be taken on that component.

### Code Sample {#code-sample-2}

`aem-authoring-extension-toolbar-screenshot` is a sample package showing how to create a custom toolbar action to render components.

CODE ON GITHUB

You can find the code of this page on GitHub

* [Open aem-authoring-extension-toolbar-screenshot project on GitHub](https://github.com/Adobe-Marketing-Cloud/aem-authoring-extension-toolbar-screenshot)
* Download the project as [a ZIP file](https://github.com/Adobe-Marketing-Cloud/aem-authoring-extension-toolbar-screenshot/archive/master.zip)

## Add New In-Place Editor {#add-new-in-place-editor}

### Standard In-Place Editor {#standard-in-place-editor}

In a standard AEM installation:

1. `/libs/cq/gui/components/authoring/editors/clientlibs/core/js/editors/editorExample.js`

   Holds definitions of the various editors available.

1. There is a connection between the editor and each resource type (as in component) that can use it:

    * `cq:inplaceEditing`

      for example:

        * `/libs/foundation/components/text/cq:editConfig`
        * `/libs/foundation/components/image/cq:editConfig`

            * property: `editorType`

              Defines the type of inline editor that is used when the in-place editing is triggered for that component; for example, `text`, `textimage`, `image`, `title`.

1. Additional configuration details of the editor can be configured using a `config` node containing configurations and a `plugin` node to contain necessary plugin configuraiton details.

   The following is an example of defining aspect ratios for the image cropping plugin of the image component. Because of the potential of limited screen size, the crop aspect ratios were moved to full screen editor and can only be seen there.

   ```xml
   <cq:inplaceEditing
           jcr:primaryType="cq:InplaceEditingConfig"
           active="{Boolean}true"
           editorType="image">
           <config jcr:primaryType="nt:unstructured">
               <plugins jcr:primaryType="nt:unstructured">
                   <crop jcr:primaryType="nt:unstructured">
                       <aspectRatios jcr:primaryType="nt:unstructured">
                           <_x0031_6-10
                               jcr:primaryType="nt:unstructured"
                               name="16 : 10"
                               ratio="0.625"/>
                       </aspectRatios>
                   </crop>
               </plugins>
           </config>
   </cq:inplaceEditing>
   ```

   >[!CAUTION]
   >
   >AEM crop ratios, as set by the `ratio` property, are defined as **height/width**. This differs from the conventional definition of width/height and is done for legacy compatibility reasons. The authoring users will not be aware of any difference provided you define the `name` property clearly since this is what is displayed in the UI.

#### Creating a New In-Place Editor {#creating-a-new-in-place-editor}

To implement a new in-place editor (within your clientlib):

>[!NOTE]
>
>For example, see:
>`/libs/cq/gui/components/authoring/editors/clientlibs/core/js/editors/editorExample.js`

1. Implement:

    * `setUp`
    * `tearDown`

1. Register the editor (includes the constructor):

    * `editor.register`

1. Provide the connection between the editor and every resource type (as in component) that can use it.

#### Code Sample for Creating a New In-Place Editor {#code-sample-for-creating-a-new-in-place-editor}

`aem-authoring-extension-inplace-editor` is a sample package showing how to create an in-place editor in AEM.

CODE ON GITHUB

You can find the code of this page on GitHub

* [Open aem-authoring-extension-inplace-editor project on GitHub](https://github.com/Adobe-Marketing-Cloud/aem-authoring-extension-inplace-editor)
* Download the project as [a ZIP file](https://github.com/Adobe-Marketing-Cloud/aem-authoring-extension-inplace-editor/archive/master.zip)

#### Configuring Multiple In-Place Editors {#configuring-multiple-in-place-editors}

It is possible to configure a component so that it has multiple in-place editors. When multiple in-place editors are configured, you can select the appropriate content and open the appropriate editor. See the [Configuring Multiple In-Place Editors](/help/sites-developing/multiple-inplace-editors.md) documentation for more information.

## Add a New Page Action {#add-a-new-page-action}

To add a new page action to the page toolbar, for example, a **Back to Sites** (console) action.

### Code Sample {#code-sample-3}

`aem-authoring-extension-header-backtosites` is a sample package showing how to create a custom header bar action to jump back to the Sites console.

CODE ON GITHUB

You can find the code of this page on GitHub

* [Open aem-authoring-extension-header-backtosites project on GitHub](https://github.com/Adobe-Marketing-Cloud/aem-authoring-extension-header-backtosites)
* Download the project as [a ZIP file](https://github.com/Adobe-Marketing-Cloud/aem-authoring-extension-header-backtosites/archive/master.zip)

## Customizing the Request for Activation Workflow {#customizing-the-request-for-activation-workflow}

The out-of-the-box workflow, **Request for Activation**:

* Will automatically appear on the appropriate menu when a content author **does not have** the appropriate replication rights, but **does have** membership of DAM-Users and Authors. 

* Otherwise, nothing is displayed, as replication rights have been removed.

To have customized behavior on such activation, you can overlay the **Request for Activation** workflow:

1. In `/apps` overlay the **Sites** wizard:

   `/libs/wcm/core/content/common/managepublicationwizard`

   >[!NOTE]
   >
   >This itself, overrides the common instance of:
   >
   >`/libs/cq/gui/content/common/managepublicationwizard`

1. Update the [workflow model](/help/sites-developing/workflows-models.md) and related configurations/scripts as required.
1. Remove the right to the [ `replicate` action](/help/sites-administering/security.md#actions) from all appropriate users for all relevant pages; to have this workflow triggered as a default action when any of the users try to publish (or replicate) a page.

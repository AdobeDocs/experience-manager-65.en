---
title: Configuring Multiple In-Place Editors
seo-title: Configuring Multiple In-Place Editors
description: It is possible to configure your component so that it has multiple in-place editors
seo-description: It is possible to configure your component so that it has multiple in-place editors
uuid: 4abbfcd5-fe1b-4c02-b115-97db20e60e1e
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: components
content-type: reference
discoiquuid: 0fac1e4a-f08f-4c46-b070-cb1d5a05b6e0
---

# Configuring Multiple In-Place Editors{#configuring-multiple-in-place-editors}

It is possible to configure your component so that it has multiple in-place editors within the touch-enabled UI.

When configured you can select the appropriate content and open the appropriate editor. For example:

![chlimage_1-8](assets/chlimage_1-8.png) 

## Configuring Multiple Editors {#configuring-multiple-editors}

To enable multiple in-place editors the structure of a `cq:InplaceEditingConfig` node type has been enhanced with the definition of `cq:ChildEditorConfig` node type.

For example:

```
   /**
       * Configures inplace editing of a component.
       *
       * @prop active true to activate inplace editing for the component
       * @prop editorType ID of inplace editor to use
       * @prop cq:childEditors collection of {@link cq:ChildEditorConfig} nodes.
       * @prop configPath path to editor's config (optional)
       * @node config editor's config (used if no configPath is specified; optional)
     */
    [cq:InplaceEditingConfig] > nt:unstructured
      - active (boolean)
      - editorType (string)
      + cq:childEditors (nt:base) = nt:unstructured
      - configPath (string)
      + config (nt:unstructured) = nt:unstructured

    /**
      * Configures one child editor for a subcomponent. The name of the this node will
      * be used as DD id.
      *
      * @prop type type of the inline editor. eg: ["image"]
      * @prop title totle od the inline editor
      * @prop icon icon to represent the inline editor
    */
    [cq:ChildEditorConfig] > nt:unstructured
      orderable
      - type (string)
      - title (string)
```

To configure multiple editors:

1. On the node `cq:inplaceEditing` (of type `cq:InplaceEditingConfig`) define the property:

    * Name:`editorType` 
    * Type: `String`
    * Value: `hybrid`

1. Under this node create a new node:

    * Name: `cq:ChildEditors`
    * Type: `nt:unstructured`

1. Under the `cq:childEditors` node create a new node for each in-place editor:

    * Name: the name of each node should be the name of the property that it represents (as with drop targets). For example, `image`, `text`.
    * Type: cq: `ChildEditorConfig`

   >[!NOTE]
   >
   >There is a correlation between the defined drop targets and the child editors. The name of the `cq:ChildEditorConfig` node will be considered to be the drop target ID, for use as a parameter to the selected child editor. If the editable sub area does not have a drop target (e.g. as with a text component) then the name of the child editor is still considered as an ID to identify the corresponding editable area.

1. On each of these nodes ( `cq:ChildEditorConfig`) define the properties:

    * Name: `type`
    * Value: name of the registered in-place editor; for example, `image`, `text`

    * Name: `title`
    * Value: the title that you want to display in the components selection list (of available editors); for example, `Image`, `Text`

### Additional Configuration for Rich Text Editors {#additional-configuration-for-rich-text-editors}

Configuration for multiple Rich Text Editors is slightly different as you can configure each individual RTE instance separately.

>[!NOTE]
>
>For further details see [Configuring the Rich Text Editor](/help/sites-administering/rich-text-editor.md).

To have multiple RTEs you need a configuration for each in-place RTE:

* Under `cq:InplaceEditingConfig` define a `config` node.

    * Under the `config` node define each individual RTE configuration.

```xml
    texttext
        cq:dialog
        cq:editConfig
            cq:inplaceEditing
                cq:childEditors
                    config
                        text1
                            rtePlugins
                        text2
                            rtePlugins
```

>[!NOTE]
>
>Recommended best practice is to define the `config` node under `cq:InplaceEditingConfig` as each individual RTE can have a different configuration. 
>
>However, for RTE, the `configPath` property is supported when there is only one instance of text editor (editable sub-area) in the component. This use of `configPath` is provided to support backwards compatibility with older UI dialogs of the component.

## Code Samples {#code-samples}

**CODE ON GITHUB**

You can find the code of this page on GitHub

* [Open aem-authoring-hybrideditors project on GitHub](https://github.com/Adobe-Marketing-Cloud/aem-authoring-hybrideditors)
* Download the project as [a ZIP file](https://github.com/Adobe-Marketing-Cloud/aem-authoring-hybrideditors/archive/master.zip)

## Adding an In-Place Editor {#adding-an-in-place-editor}

For general information about adding an in-place editor see the document [Customizing Page Authoring](/help/sites-developing/customizing-page-authoring-touch.md#add-new-in-place-editor).

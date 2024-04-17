---
title: Configure RTE for multiple in-place editors.
description: Create multiple in-place editors in Adobe Experience Manager by configuring Rich Text Editor.
contentOwner: AG
exl-id: 03030317-8b7d-408a-bdfd-619824d7260c
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Configure multiple in-place editors {#configure-multiple-in-place-editors}

You can configure Rich Text Editor in Adobe Experience Manager so that it has multiple in-place editors. When configured you can select the appropriate content and open the appropriate editor.

![A specific in-place editor](assets/rte-inplace-editor.png)

## Configure multiple editors {#configure-multiple-editors}

To enable multiple in-place editors the structure of a `cq:InplaceEditingConfig` node type has been enhanced with the definition of `cq:ChildEditorConfig` node type.

For example:

```js
   /**
       * Configures in-place editing of a component.
       *
       * @prop active true to activate in-place editing for the component.
       * @prop editorType ID of in-place editor to use.
       * @prop cq:childEditors collection of {@link cq:ChildEditorConfig} nodes.
       * @prop configPath path to editor's config (optional).
       * @node config editor's config (used if no configPath is specified; optional).
     */
    [cq:InplaceEditingConfig] > nt:unstructured
      - active (boolean)
      - editorType (string)
      + cq:childEditors (nt:base) = nt:unstructured
      - configPath (string)
      + config (nt:unstructured) = nt:unstructured

    /**
      * Configures one child editor for a sub-component. The name of the this node is
      * used as DD ID.
      *
      * @prop type type of the inline editor. For example, ["image"].
      * @prop title Title of the inline editor.
      * @prop icon Icon to represent the inline editor.
    */
    [cq:ChildEditorConfig] > nt:unstructured
      orderable
      - type (string)
      - title (string)
```

To configure multiple editors, follow these steps:

1. On the node `cq:inplaceEditing` (of type `cq:InplaceEditingConfig`) define the following properties:

    * Name:`editorType`
    * Type: `String`
    * Value: `hybrid`

1. Under this node, create a node:

    * Name: `cq:ChildEditors`
    * Type: `nt:unstructured`

1. Under `cq:childEditors` node, create a node for each in-place editor:

    * Name: The name of each node is the name of the property that it represents, as is the case with drop targets. For example, `image` and `text`.
    * Type: `cq:ChildEditorConfig`

   >[!NOTE]
   >
   >There is a correlation between the defined drop targets and the child editors. The name of the `cq:ChildEditorConfig` node is considered as the drop target ID, for use as a parameter to the selected child editor. If the editable sub area does not have a drop target, for example, in a text component, then the name of the child editor is still considered as an ID to identify the corresponding editable area.

1. On each of these nodes (`cq:ChildEditorConfig`) define the properties:

    * Name: `type`.
    * Value: The name of the registered in-place editor; for example, `image` and `text`.

    * Name: `title`.
    * Value: The title displayed in the components selection list of the available editors. For example, `Image` and `Text`.

### Additional configuration for Rich Text Editors {#additional-configuration-for-rich-text-editors}

Configuration for multiple Rich Text Editors is slightly different as you can configure each individual RTE instance separately. For details, see [configure the Rich Text Editor](/help/sites-administering/rich-text-editor.md). To have multiple RTEs create a configuration for each in-place RTE. Adobe recommends creating the new configuration node under `cq:InplaceEditingConfig` as each individual RTE can have a different configuration. Under the new node create each individual RTE configuration.

```xml
    texttext
        cq:dialog
        cq:editConfig
            cq:inplaceEditing
                cq:childEditors
                    someconfig
                        text1
                            rtePlugins
                        text2
                            rtePlugins
```

>[!NOTE]
>
>However, for RTE, the `configPath` property is supported when there is only one instance of text editor (editable sub-area) in the component. This use of `configPath` is provided to support backwards compatibility with older user interface dialogs of the component.

>[!CAUTION]
>
>Do not name the RTE configuration node as `config`. Otherwise, the RTE configurations are available for only the administrators and not for the users in the group `content-author`.

## Code samples {#code-samples}

You can find the code of this page on [aem-authoring-hybrideditors project on GitHub](https://github.com/Adobe-Marketing-Cloud/aem-authoring-hybrideditors). You can download the complete project as [a ZIP archive](https://github.com/Adobe-Marketing-Cloud/aem-authoring-hybrideditors/archive/master.zip).

## Add an in-place editor {#add-an-in-place-editor}

For general information about adding an in-place editor see the document [customize page authoring](/help/sites-developing/customizing-page-authoring-touch.md#add-new-in-place-editor).

>[!MORELIKETHIS]
>
>* [Configure Rich Text Editor in Experience Manager](/help/sites-administering/rich-text-editor.md).

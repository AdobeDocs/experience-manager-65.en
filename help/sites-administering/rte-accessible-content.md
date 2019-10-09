---
title: Configuring RTE for Producing Accessible Sites
seo-title: Configuring RTE for Producing Accessible Sites
description: Learn how to configure the AEM Rich Text Editor to produce accessible sites.
seo-description: Learn how to configure the AEM Rich Text Editor to produce accessible sites.
uuid: 87539fee-3ecc-49f4-af3d-8dde72399c28
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: operations
content-type: reference
discoiquuid: ff0f006d-461c-4cc4-b6eb-d665f3f3b498
---

# Configuring RTE for Producing Accessible Sites {#configuring-rte-for-producing-accessible-sites}

AEM supports both:

* standard accessibility features, including alternate text for images
* as well as additional features that can be accessed when creating content with components that use the rich text editor (RTE)

>[!NOTE]
>
>See also:
>
>* our [Quick Guide to WCAG 2.0](/help/managing/qg-wcag.md) for further details
>* [Creating accessible content (WCAG 2.0 conformance)](/help/sites-authoring/creating-accessible-content.md)  
>

Content authors can use features of the RTE to provide accessibility information while adding content to a page. This can include adding structural information through headings and paragraph elements.

You can [configure and customize these features by configuring RTE plugins](#configuring-the-plugin-features) for the component. For example, the `paraformat` plugin allows you to add additional block level semantic elements, including extending the number of heading levels supported beyond the basic `H1`, `H2` and `H3` provided by default.

The RTE is available in a variety of components from both the touch-enabled and the classic UI. However, the primary component for using the RTE is the **Text** component.

The **Text** component in AEM is available for both the touch-enabled and the classic UIs. The following images show the rich text editor with a range of plugins enabled, including `paraformat`:

* The **Text** component in the touch-enabled UI:

  ![Text component (RTE) in full-screen-mode in the touch-enabled UI.](assets/chlimage_1-206.png)

* The **Text** component in the classic UI:

  ![Edit dialog (RTE) of the text component in the classic UI.](assets/chlimage_1-207.png)

>[!NOTE]
>
>There are differences between the RTE features available in the classic UI and the touch-enabled UI. For more details see
>
>* [Plugins and their Features](/help/sites-administering/rich-text-editor.md#aboutplugins)
>* [Plugins and their Features - Touch enabled UI](/help/sites-administering/rich-text-editor.md#aboutplugins)
>

## Configuring the Plugin Features {#configuring-the-plugin-features}

Full instructions on configuring the RTE are available on the [Configuring the Rich Text Editor](/help/sites-administering/rich-text-editor.md) page. This covers all issues, including the key steps:

* [Plugins and their Features](/help/sites-administering/rich-text-editor.md#aboutplugins)
* [Configuration Locations](/help/sites-administering/rich-text-editor.md#understand-the-configuration-paths-and-locations)
* [Activate a Plugin and Configure the features Property](/help/sites-administering/rich-text-editor.md#enable-rte-functionalities-by-activating-plug-ins)
* [Configuring Other Functionality of the RTE](/help/sites-administering/rich-text-editor.md#enable-rte-functionalities-by-activating-plug-ins)

By configuring a plugin within the appropriate `rtePlugins` sub-branch in CRXDE Lite (see the following image), you can activate either all or specific features for that plugin. 

![CRXDE Lite showing an example rtePlugin.](assets/chlimage_1-208.png) 

### Example - Specifying Paragraph Formats Available in RTE Selection Field {#example-specifying-paragraph-formats-available-in-rte-selection-field}

New semantic block formats may be made available for selection by:

1. Depending on your RTE, determine and navigate to the [configuration location](/help/sites-administering/rich-text-editor.md#understand-the-configuration-paths-and-locations).
1. [Enable the Paragraphs selection field](/help/sites-administering/rich-text-editor.md); by [activating the plugin](/help/sites-administering/rich-text-editor.md#enable-rte-functionalities-by-activating-plug-ins).
1. [Specify the formats you want to have available in the Paragraphs selection field](/help/sites-administering/rich-text-editor.md).
1. The paragraph formats are then available to the content author from the selection fields in the RTE. They can be accessed:

    * Using the paragraph ([pilcrow](https://en.wikipedia.org/wiki/Pilcrow)) icon in the touch-enabled UI:

   ![Paragraph (pilcrow) icon.](do-not-localize/chlimage_1-7.png)

    * Using the **Format** field (drop-down selector) in the classic UI.

With structural elements available in the RTE via the paragraph format options, AEM provides a good basis for the development of accessible content. Content authors cannot use the RTE to format font size or colors or other related attributes, preventing the creation of inline formatting. Instead they must select the appropriate structural elements, such as headings and use global styles chosen from the Styles option. This ensures clean markup, greater options for users who browse with their own style sheets and correctly structured content.

## Use of the Source Edit Feature {#use-of-the-source-edit-feature}

In some cases, content authors will find it necessary to examine and adjust the HTML source code created using the RTE. For example, a piece of content created within the RTE may require additional markup to ensure compliance with WCAG 2.0. This can be done with the [source edit](/help/sites-administering/rich-text-editor.md#aboutplugins) option of the RTE. You can specify the [ `sourceedit` feature on the `misctools` plugin](/help/sites-administering/rich-text-editor.md#aboutplugins).

>[!CAUTION]
>
>Use the `sourceedit` feature carefully. Typing errors and/or unsupported features can introduce more problems.

## Adding Support for Additional HTML Elements and Attributes {#adding-support-for-additional-html-elements-and-attributes}

To further extend the accessibility features of AEM, it is possible to extend the existing components based on the RTE (such as the **Text** and **Table** components) with additional elements and attributes.

The following procedure illustrates how to extend the **Table** component with a **Caption** element that provides information about a data table to assistive technology users:

### Example - Adding the Caption to the Table Properties Dialog {#example-adding-the-caption-to-the-table-properties-dialog}

In the constructor of the `TablePropertiesDialog`, add an additional text input field that is used for editing the caption. Note that `itemId` must be set to `caption` (i.e. the DOM attribute’s name) to automatically handle its content.

In **Table** you must explicitly set or remove the attribute to/from the DOM element. The value is passed by the dialog in the `config` object. Note that DOM attributes should be set/removed using the corresponding `CQ.form.rte.Common` methods ( `com` is a shortcut for `CQ.form.rte.Common`) to avoid common pitfalls with browser implementations.

>[!NOTE]
>
>This procedure is only suitable for the classic UI.

### Step by Step Instructions {#step-by-step-instructions}

1. Start CRXDE Lite. For example: [http://localhost:4502/crx/de/](http://localhost:4502/crx/de/)
1. Copy:

   `/libs/cq/ui/widgets/source/widgets/form/rte/commands/Table.js`

   to:

   `/apps/cq/ui/widgets/source/widgets/form/rte/commands/Table.js`

   >[!NOTE]
   >
   >You may need to create intermediate folders if they do not already exist.

1. Copy:

   `/libs/cq/ui/widgets/source/widgets/form/rte/plugins/TablePropertiesDialog.js`

   to:

   `/apps/cq/ui/widgets/source/widgets/form/rte/plugins/TablePropertiesDialog.js`.

1. Open the following file for editing (open with double-click):

   `/apps/cq/ui/widgets/source/widgets/form/rte/plugins/TablePropertiesDialog.js`

1. In the `constructor` method, before the line reading:

   ```
   var dialogRef = this;
   ```

   Add the following code:

   ```
   editItems.push({
       "itemId": "caption",
       "name": "caption",
       "xtype": "textfield",
       "fieldLabel": CQ.I18n.getMessage("Caption"),
       "value": (this.table && this.table.caption ? this.table.caption.textContent : "")
   });
   ```

1. Open the following file:

   `/apps/cq/ui/widgets/source/widgets/form/rte/commands/Table.js`.

1. Add the following code at the end of the `transferConfigToTable` method:

   ```
   /**
    * Adds Caption Element
    */
   var captionElement; 
   if (dom.firstChild && dom.firstChild.tagName.toLowerCase() == "caption") 
   {
      captionElement = dom.firstChild;
   }
   if (config.caption)
   {
       var captionTextNode = document.createTextNode(config.caption)
       if (captionElement)
       {
          dom.replaceNode(captionElement.firstChild,captionTextNode); 
       } else
       {
           captionElement = document.createElement("caption");
           captionElement.appendChild(captionTextNode);
           if (dom.childNodes.length>0)
           {
              dom.insertBefore(captionElement, dom.firstChild);
           } else
           {
              dom.appendChild(captionElement);
           }
       }
   } else if (captionElement) 
   {
     dom.removeChild(captionElement);
   }
   ```

1. Save your changes using **Save All …**

>[!NOTE]
>
>A plain text field is not the only type of input allowed for the value of the caption element. Any ExtJS widget, that provides the caption’s value through its `getValue()` method, could be used.
>
>To add editing capabilities for further additional elements and attributes, ensure that both:
>
>* The `itemId` property for each corresponding field is set to the name of the appropriate DOM attribute (`TablePropertiesDialog`).  
>* The attribute is set and/or removed on the DOM element explicitly (`Table`).


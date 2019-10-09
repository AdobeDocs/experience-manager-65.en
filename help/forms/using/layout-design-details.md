---
title: Layout Design
seo-title: Layout Design
description: Layout Design Details explains how you can create layouts to be used for your letters or Interactive Communications.
seo-description: Layout Design Details explains how you can create layouts to be used for your letters or Interactive Communications.
uuid: b21af474-07f5-4bfe-af7d-0c322e2452ae
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/FORMS
topic-tags: correspondence-management
topic-tags: interactive-communications
discoiquuid: 046b1bf9-1ac7-4e2e-ab37-6fe5422dfa20
---

# Layout Design {#layout-design}

XFA form templates or XDPs are the templates for:

* [Letters](/help/forms/using/create-letter.md)
* [Print channel](/help/forms/using/web-channel-print-channel.md#printchannel) of [Interactive Communications](/help/forms/using/interactive-communications-overview.md)

* Layout Fragments

An XDP is designed in Adobe Forms Designer. This article provides details about how to design your XDPs for creating effective correspondences/Interactive Communications such as where to use form fields or target areas and when to use layout fragments.

## Creating a layout for letters or for Interactive Communications' print channel {#creating-a-layout-for-letters-or-for-interactive-communications-print-channel}

A layout defines the graphical layout of a letter/print channel of an Interactive Communication. The layout can contain typical form fields such as “Address” and "Reference Number". It also contains empty subforms that denote target areas. Create the layout in form designer and when completed the Application Specialist uploads it to AEM server. From there, you can select the layout when creating a correspondence template or print channel of an Interactive Communication. 

![Designer: create a layout](assets/claimsubrogationlayout.png)

Follow these steps to create layouts for letters/print channel of Interactive Communications:

1. Analyze the layout and determine the content that is being repeated across all pages; usually page header and footer fit into this category. This content is placed on master pages of layout. The remaining content goes to body pages of the layout. In a policy jacket, the logo and company address can be added to master page header and footer. For example, Notice of Cancelation uses the same layout. 
1. When designing body pages, divide page content into sections. Each section is designed as a subform embedded in layout itself or as a fragment layout. If section contains table, model the section as a layout fragment.
1. A Layout can be designed as follows:

    1. Make each section as a separate subform containing all elements of the section.
    1. Make each section subform child of same parent subform. Parent subform's layout are set to flow to allow the sections to shift below in case of large data is merged in previous sections.
    1. Section Primary residence can be reused across other layouts as well. Create it as a fragment layout.
    1. Section Additional interest details contains only two elements placed one below another, can contain large data, and is designed as flowed.
    1. Other sections contain elements at specific positions so they are designed as positioned layout.
    1. Break a section into subforms if the section contains elements at specific positions, and these elements contain large amounts of data. Then arrange the subforms to achieve the desired behavior.
    1. For Primary residence section, add a placeholder target area. This placeholder is bound to fragment Primary residence at the time of letter/Interactive Communication designing.
    1. Upload the layout (and the fragment, if any, that uses the layout) into the AEM Forms server.

## Using schema {#using-schema}

You can use a schema in a layout or layout fragment , but it is not required. If you use a schema, ensure the following:

1. Layout and all the fragment layouts used in a letter/Interactive Communication use same schema as the letter/Interactive Communication.
1. All fields required to be populated with data are bound to the schema.

## Creating relatable fields {#creating-relatable-fields}

By default, all fields are considered relatable to various other data sources. If your layout contains any fields that are not relatable to a data source, name the field with an "_int" (internal) suffix; for example, pageCount_int.

A relatable field must:

* be an XFA &lt;field&gt; or &lt;exclGroup&gt;
* have an XFA binding reference
* if it is an &lt;exclGroup&gt;, it must have at least one child radio button field; otherwise, its value type cannot be determined

A relatable field must:

* have a name

A relatable field must not:

* Include an "_int" suffix in its name
* have binding set as "none"
* be a child of an &lt;exclGroup&gt; element

As long as a relatable field meets the criteria described above, it can be in any location and at any nesting depth in the layout. You can use relatable fields within master pages.

Fields are more flexible in their layout configuration than target area subforms; however they are tied to a single value type. You can make a field large, or set it to a fixed width and height, and so on. The resolved module or rule result is pushed into the field.

## Deciding when to use subforms and text&nbsp;fields {#deciding-when-to-use-subforms-and-text-nbsp-fields}

Use a subform if you want to capture multiple module content in a top-down vertical-flow layout (multiple paragraphs or images). Your layout must handle the fact that the subform grows in height to accommodate its contents. If you cannot be certain that the length of the content associated to the subform/target never exceeds the space reserved for the subform in the layout, create the subform as a child within a flowed subform container. This process ensures that layout objects below the subform flows downward as the subform grows.

Use a field if you want to capture module data or data dictionary element data into your layout's schema (because fields are bound to data) or to display module content on a master page. Remember that content in a master page cannot flow with body page content, so you must ensure that the image field is used as a header logo. This table provides more criteria for deciding when to use a subform or a field in a layout.

<table> 
 <tbody> 
  <tr> 
   <td><p><strong>Use a subform when</strong></p> </td> 
   <td><p><strong>Use a text field when</strong></p> </td> 
  </tr> 
  <tr> 
   <td><p>It contains a combination of elements, such as a Last Name and First Name</p> </td> 
   <td><p>It contains a single element, such as a Policy Number.</p> </td> 
  </tr> 
  <tr> 
   <td><p>It includes multiple paragraphs</p> </td> 
   <td><p>Text is wrapped and justified</p> </td> 
  </tr> 
  <tr> 
   <td><p>Repeating, optional, and conditional data groups are bound to subforms, to reduce the risk of design errors that could occur if scripts are used to achieve the same results</p> </td> 
   <td><p>Elements such as your organization’s logo and address appear on all pages of a letter/Interactive Communication. In this case, create form fields for those elements and place them on the master page. If you set the field binding to "No Data Binding", the no fields appear as relatable fields in the Letter/Interactive Communication Editor. If you want to relate some type of content to these fields, they must have binding.</p> <p>If your company address contains more than one line of data, use text field with the "Allow Multiple Lines" option to represent the address on the layout.</p> <p>If a text field's data type is set to plain text, the plain text version of the module output is used instead of the rich text version (all formatting is discarded). To preserve the formatting, set the text field’s data type to rich text.</p> </td> 
  </tr> 
  <tr> 
   <td><p>Text is flowed</p> </td> 
   <td><p>Text fields and image fields are used on master pages. Master pages cannot use subforms as target areas.</p> </td> 
  </tr> 
  <tr> 
   <td><p>Objects are grouped and organized without binding the subform to a data element</p> </td> 
   <td><p> </p> </td> 
  </tr> 
  <tr> 
   <td><p>There is a text field inside the subform. The subform can grow and not overwrite other objects below it on the layout.</p> </td> 
   <td><p>You need easy access to its data in the post process.</p> </td> 
  </tr> 
 </tbody> 
</table>

## Setting up repetitive elements {#setting-up-repetitive-elements}

When elements such as your organization’s logo and address appear on all pages of a letter/Interactive Communication, create form fields for those elements and place them on the master page. Use Name (Field Name) binding for these fields.

## Specify the server&nbsp;render format {#specify-the-server-nbsp-render-format}

Use the layout’s server render format to Dynamic XML Form; otherwise, any letters/Interactive Communications based on this layout cannot render correctly. By default, the server render format in Forms Designer is set to Dynamic XML Form. To ensure that you are using the correct format:

* In Designer, click **[!UICONTROL File > Form Properties > Default]**, and ensure that the PDF Render/Format setting is set to Dynamic XML Form.


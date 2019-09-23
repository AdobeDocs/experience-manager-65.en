---
title: Inline styling of adaptive form components
seo-title: Inline CSS properties for adaptive form components
description: While you can apply custom styles on an adaptive form, you can also apply inline CSS properties on individual components of an adaptive form.
seo-description: While you can apply custom styles on an adaptive form, you can also apply inline CSS properties on individual components of an adaptive form.
uuid: 7a31eca5-e3ba-4b3c-a7e7-588ef875173c
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: author
discoiquuid: 5096c32d-b0ef-43e3-969b-216d833d0dc1
index: y
internal: n
snippet: y
---

# Inline styling of adaptive form components{#inline-styling-of-adaptive-form-components}

You can define the overall appearance and style of an adaptive form by specifying styles using [theme editor](../../forms/using/themes.md). Also, you can apply inline CSS styles to individual adaptive form components and preview the changes on the fly. Inline styles override styling provided in the theme.

<!--
Comment Type: draft

<p>With the help of the following image of a text component, let’s first learn about the different part of an adaptive form component on which you can apply styles. </p>
-->

<!--
Comment Type: draft

<img alt="Parts of an adaptive form component" imagerotate="0" src="assets/inline-style-components.png" title="Parts of an adaptive form component" />
-->

<!--
Comment Type: draft

<p>Different parts on an adaptive form component called out in the above image are as follows:</p>
<p>A.<strong> Label</strong>: caption for the component. <br /> B.<strong> Field</strong>: area that encompasses all parts of the component<br /> C.<strong> Widget</strong>: area where user specifies or selects a value for the field<br /> D.<strong> Help</strong>: short description, long description, and help indicator for the component</p>
-->

<!--
Comment Type: draft

<note>
<p>You can only style the appearance of the label. To change lable text, use the Title propertly of the text box in the edit mode. For more information, see <a href="../../forms/using/introduction-forms-authoring.md#page-toolbar" target="_blank">Page Toolbar</a>. </p>
</note>
-->

## Apply inline CSS properties {#apply-inline-css-properties}

To add inline styles to a component:

1. Open your form in the form editor, and change the mode to styling mode. To change the mode to styling mode, in the page toolbar, tap ![](assets/canvas-drop-down.png) &gt; **Style**.
1. Select a component in the page, and tap the edit button ![](assets/edit-button.png). Styling properties open in the sidebar.

   You can also select components from the form hierarchy tree in the sidebar. Form hierarchy tree is available as Form Objects in the sidebar.

   You can also select a component from the sidebar. In the Style mode, you can see components listed under Form Objects. However, Form Objects list in the sidebar lists components such as fields and panels. Fields and panels are generic components that can contain components such as text-box and radio-buttons.

   When you select a component from the sidebar, you see all the sub-components listed and the properties of the selected component. You can select a specific sub-component and style it. 

1. Click a tab in the sidebar to specify CSS properties. You can specify properties such as:

    * Dimensions & Position (Display setting, padding, height, width, margin, position, z-index, float, clear, overflow)
    * Text (Font family, weight, color, size, line height, and alignment)
    * Background (Image and gradient, background color)
    * Border (Width, style, color, radius)
    * Effects (Shadow, Opcacity)
    * Advanced (Lets you write custom CSS for the component)

1. Similarly, you can apply styles for other parts of a component such as Widget, Caption, and Help.
1. Tap **Done** to confirm the changes or **Cancel** to discard the changes.

## Example: inline styles for a field component {#example-inline-styles-for-a-field-component}

The following images depict a text field before and after inline styles are applied to it.

![Text box component before inline styling is applied](assets/no-style.png)

Text box component before applying inline style properties

Notice the change in text box style as shown in the following image after applying the following CSS properties.

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <td width="161"><p>Selector</p> </td> 
   <td width="123"><p>CSS property</p> </td> 
   <td width="104"><p>Value</p> </td> 
   <td width="227"><p>Effect</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="161"><p>Field</p> </td> 
   <td valign="top" width="123"><p>border</p> </td> 
   <td valign="top" width="104"><p>Border width =2px</p> <p>Border style=Solid</p> <p>Border color=#1111</p> </td> 
   <td valign="top" width="227"><p>Creates a Black 2px wide border around the field</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="161"><p>Text box</p> </td> 
   <td valign="top" width="123"><p>background-color</p> </td> 
   <td valign="top" width="104"><p>#6495ED</p> </td> 
   <td valign="top" width="227"><p>Changes the background color to CornflowerBlue (#6495ED)</p> <p>Note: You can specify a color name or its hex code in the value field.</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="161"><p>Label</p> </td> 
   <td valign="top" width="123"><p>Dimenstions &amp; Position &gt; width</p> </td> 
   <td valign="top" width="104"><p>100px</p> </td> 
   <td valign="top" width="227"><p>Fixes the width as 100px for the label</p> </td> 
  </tr> 
  <tr> 
   <td>Field Help Icon</td> 
   <td>Text &gt; Font Color</td> 
   <td>#2ECC40</td> 
   <td>Changes the color of the help icon face.</td> 
  </tr> 
  <tr> 
   <td valign="top" width="161"><p>Long description</p> </td> 
   <td valign="top" width="123"><p>text-align</p> </td> 
   <td valign="top" width="104"><p>center</p> </td> 
   <td valign="top" width="227"><p>Aligns the long description for help to center</p> </td> 
  </tr> 
 </tbody> 
</table>

![Text box style after inline styling is applied](assets/applied-style.png)

Text box component after applying inline style properties

Following the steps above, you can select and style other components, such as panels, submit buttons, and radio buttons.

>[!NOTE]
>
>Styling properties vary based on the component you select.


---
title: Inline styling of adaptive form components

description: While you can apply custom styles on an adaptive form, you can also apply inline CSS properties on individual components of an adaptive form.


products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: author

docset: aem65
feature: "Adaptive Forms,Foundation Components"
exl-id: 67cfecb8-c31d-4192-904d-7bfaa1a31ea5
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Inline styling of adaptive form components {#inline-styling-of-adaptive-form-components}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-foundation-components/configure-layout-of-an-adaptive-form/inline-style-adaptive-forms.html)                  |
| AEM 6.5     | This article         |

You can define the overall appearance and style of an adaptive form by specifying styles using [theme editor](../../forms/using/themes.md). Also, you can apply inline CSS styles to individual adaptive form components and preview the changes on the fly. Inline styles override styling provided in the theme.

## Apply inline CSS properties {#apply-inline-css-properties}

To add inline styles to a component:

1. Open your form in the form editor, and change the mode to styling mode. To change the mode to styling mode, in the page toolbar, select ![canvas-drop-down](assets/canvas-drop-down.png) &gt; **Style**.
1. Select a component in the page, and select the edit button ![edit-button](assets/edit-button.png). Styling properties open in the sidebar.

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
1. Select **Done** to confirm the changes or **Cancel** to discard the changes.

## Example: inline styles for a field component {#example-inline-styles-for-a-field-component}

The following images depict a text field before and after inline styles are applied to it.

![Text box component before inline styling is applied](assets/no-style.png)

Text box component before applying inline style properties

Notice the change in text box style as shown in the following image after applying the following CSS properties.

<table>
 <tbody>
  <tr>
   <td><p>Selector</p> </td>
   <td><p>CSS property</p> </td>
   <td><p>Value</p> </td>
   <td><p>Effect</p> </td>
  </tr>
  <tr>
   <td><p>Field</p> </td>
   <td><p>border</p> </td>
   <td><p>Border width =2px</p> <p>Border style=Solid</p> <p>Border color=#1111</p> </td>
   <td><p>Creates a Black 2px wide border around the field</p> </td>
  </tr>
  <tr>
   <td><p>Text box</p> </td>
   <td><p>background-color</p> </td>
   <td><p>#6495ED</p> </td>
   <td><p>Changes the background color to CornflowerBlue (#6495ED)</p> <p>Note: You can specify a color name or its hex code in the value field.</p> </td>
  </tr>
  <tr>
   <td><p>Label</p> </td>
   <td><p>Dimenstions &amp; Position &gt; width</p> </td>
   <td><p>100px</p> </td>
   <td><p>Fixes the width as 100px for the label</p> </td>
  </tr>
  <tr>
   <td>Field Help Icon</td>
   <td>Text &gt; Font Color</td>
   <td>#2ECC40</td>
   <td>Changes the color of the help icon face.</td>
  </tr>
  <tr>
   <td><p>Long description</p> </td>
   <td><p>text-align</p> </td>
   <td><p>center</p> </td>
   <td><p>Aligns the long description for help to center</p> </td>
  </tr>
 </tbody>
</table>

![Text box style after inline styling is applied](assets/applied-style.png)

Text box component after applying inline style properties

Following the steps above, you can select and style other components, such as panels, submit buttons, and radio buttons.

>[!NOTE]
>
>Styling properties vary based on the component you select.

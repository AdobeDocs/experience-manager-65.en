---
title: Customize layout and positioning of error messages of an adaptive form
description: You can customize the layout and positioning of the error messages of an adaptive for. 
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: customization
docset: aem65
exl-id: 5cb3ee55-f411-4692-84f7-89bf6ade729d
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Customize layout and positioning of error messages of an adaptive form{#customize-layout-and-positioning-of-error-messages-of-an-adaptive-form}

You can customize the layout and positioning of the error messages of an adaptive form. You can perform the following customizations:

* Customize the location and layout of the caption of a field without changing the corresponding CSS properties  
* Customize the position of inline error messages
* Customize content of dynamic help indicator
* Customize the position of the field components (caption, widget, short description, long description, and help indicator components) without changing the corresponding CSS properties

## Customize layout of fields {#customize-layout-of-fields}

You can customize the layout of a single field or of all the fields to change the position of caption and error messages. 

To apply a custom layout to a field, do the following:

### Customize layout of a single field {#customize-layout-of-a-single-field}

1. Open the form in **Style** mode. To open the form in style mode, in the page toolbar select ![canvas-drop-down](assets/canvas-drop-down.png) &gt; **Style**.
1. In the sidebar, under **Form Objects**, select the field and select the edit button ![edit-button](assets/edit-button.png).
1. Select the state of the field that you want to customize, and specify the styling for that state. 

   ![Specifying inline styling of a field](assets/edit-error-state.png)

### Customize layout of all the fields of a form {#customize-layout-of-all-the-fields-of-a-form}

With AEM Forms, you can now create a theme and apply it to your form. Theme editor lets you specify the styling of form components in one place. When you create a theme, you specify styling at a component level. For more information on themes, see [Themes in AEM Forms](../../forms/using/themes.md).

Create a theme using Theme Editor to customize the layout of all fields in your form. After you create a theme, perform the following steps to apply it to a form:

1. Open your form in edit mode. 
1. In the edit mode, select a component, then select ![field-level](assets/field-level.png) &gt; **Adaptive Form Container**, and then select ![cmppr](assets/cmppr.png).
1. In the sidebar, under Adaptive Form Theme, select the theme you have created using the Theme Editor.

## Create a custom field layout {#create-a-custom-field-layout}

1. Open CRXDE Lite. The default URL is https://'[server]:[port]'/crx/de.
1. Copy a field layout from the /libs/fd/af/layouts/field node (For example, defaultFieldLayout) to the /apps node (For example, /apps/af-field-layout).
1. Rename the copied node and the defaultFieldLayout.jsp file. For example, errorOnRight.jsp.  

1. Change the value of the qtip and jcr:description properties of the copied node. For example, change the value of the properties to Error On Right  

1. To add new styles and behavior, create a client library in the /etc node.

   For example, at the location /etc/af-field-layout-clientlib, create the node client-library. Add the categories property with value af.field.errorOnRight and style.less file with the following code:

   ```css
   
   .widgetErrorWrapper {
    
    height: 38px;
    margin: 5px;
   
    .guideFieldWidget{
    width: 60%;
    float: left; 
    }
   
    .guideFieldError{
    overflow:hidden;
    width:40%; 
    }
   
   }

   ```

1. To enhance the appearance and behavior, include the client library created in the layout file (errorOnRight.jsp).
1. Open the edit dialog box of the field and select the **Styling** tab. In the **Configure Field Layout** drop-down box, select the newly created layout, and click **OK**.

The ErrorOnRight.zip package contains code to show error messages on the right side of fields.

[Get File](assets/erroronright.zip)

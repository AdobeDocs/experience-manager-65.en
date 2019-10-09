---
title: Customize layout and positioning of error messages of an adaptive form
seo-title: Customize layout and positioning of error messages of an adaptive form
description: You can customize layout and positioning of the error messages of an adaptive for. 
seo-description: You can customize layout and positioning of the error messages of an adaptive for. 
uuid: 18b6d770-8b68-4aa0-b866-6325a6ceabcf
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/FORMS
topic-tags: customization
discoiquuid: e1431ad9-3bae-4ac3-97e2-96dcbfce1f71
---

# Customize layout and positioning of error messages of an adaptive form {#customize-layout-and-positioning-of-error-messages-of-an-adaptive-form}

You can customize layout and positioning of the error messages of an adaptive form. You can perform the following customizations:

* Customize location and layout of the caption of a field without making any change to the corresponding CSS properties  
* Customize position of inline error messages
* Customize content of dynamic help indicator
* Customize position of the field components (caption, widget, short description, long description, and help indicator components) without making any change to the corresponding CSS properties

## Customize layout of fields {#customize-layout-of-fields}

You can customize the layout of a single field or of all the fields to change the position of caption and error messages. Perform the following steps to apply a custom layout to a field:

### Customize layout of a single field {#customize-layout-of-a-single-field}

Perform the following steps to apply a custom layout to a single field:

1. Open the form in **Style** mode. To open the form in style mode, in the page toolbar tap ![canvas-drop-down](assets/canvas-drop-down.png) &gt; **Style**. 
1. In the sidebar, under Form Objects**,** select the field and tap the edit button ![edit-button](assets/edit-button.png).
1. Select the state of the field you want to customize, and specify the styling for that state. 

   ![Specifying inline styling of a field](assets/edit-error-state.png)

### Customize layout of all the fields of a form {#customize-layout-of-all-the-fields-of-a-form}

With AEM Forms, you can now create a theme and apply it to your form. Theme editor lets you specify styling of form components in one place. When you create a theme, you specify styling at a component level. For more information on themes, see [Themes in AEM Forms](/help/forms/using/themes.md).

Create a theme using Theme Editor to customize layout of all fields in your form. After you create a theme, perform the following steps to apply it to a form:

1. Open your form in edit mode. 
1. In the edit mode, select a component, then tap ![field-level](assets/field-level.png) &gt; **Adaptive Form Container**, and then tap ![cmppr](assets/cmppr.png).
1. In the sidebar, under Adaptive Form Theme, select the theme you have created using the Theme Editor.

## Create a custom field layout {#create-a-custom-field-layout}

1. Open CRXDE lite. The default URL is `https://[Server]:[Port]/crx/de`.
1. Copy a field layout from the /libs/fd/af/layouts/field node (For example, defaultFieldLayout) to the /apps node (For example, /apps/af-field-layout).
1. Rename the copied node and the defaultFieldLayout.jsp file. For example, errorOnRight.jsp.  

1. Change value of the qtip and jcr:description properties of the copied node. For example, change the value of the properties to Error On Right  

1. To add new styles and behavior, create a client library in the /etc node.

   For example, at the location /etc/af-field-layout-clientlib, create the node client-library. Add the categories property with value af.field.errorOnRight and style.less file with following code:

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
1. Open the edit dialog of the field select the **Styling **tab. In the **Configure Field Layout** drop-down box, select the newly created layout, and click **OK**.

The ErrorOnRight.zip package contains code to show error messages on the right side of fields.

[Get File](assets/erroronright.zip)

---
title: How to Create an Adaptive Form?
description: Learn how to create an Adaptive Form using [!DNL Experience Manager Forms]. Adaptive Forms are responsive HTML5 forms that streamline information gathering and processing. Dig deeper on how to create an Adaptive Form based on a Form Data Model and XML or JSON schema.
Keywords: create adaptive form core component, create core component based adaptive form, creare adaptive form
products: SG_EXPERIENCEMANAGER/6.5/FORMS
contentOwner: Khushwant Singh
topic-tags: Adaptive Forms
docset: aem65
role: Admin, Developer
feature: "Adaptive Forms,Core Components"
solution: Experience Manager, Experience Manager Forms
exl-id: ee596672-b0b5-42e9-a139-72f90287bf3b
---
# Create Core Components based Adaptive Forms {#creating-an-adaptive-form-core-components}


<span class="preview"> Adobe recommends using Core Components to [add Adaptive Forms to an AEM Sites Page](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md) or to [create standalone Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md). </span>

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service     | [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-core-components/create-an-adaptive-form-on-forms-cs/creating-adaptive-form-core-components.html)|
| AEM 6.5  |    This Article                  |

<!--**Applies to:** ✅ Adaptive Form Core Components ❎ [Adaptive Form Foundation Components](/help/forms/using/create-adaptive-form.md).-->

Adaptive Forms let you create forms that are engaging, responsive, dynamic, and adaptive. AEM Forms provide business user-friendly UI to quickly create Adaptive Forms. The UI offers quick tab navigation to easily select pre-configured template, styling, fields, and submission options to create an Adaptive Form. 

Before you start, learn about the type of Forms components available to you:

* [Adaptive Forms Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html?lang=en): These are standardized data capture components. These components provide customization capabilities, reduced development time, and lower maintenance costs for your digital enrollment experiences. A developer can easily customize and style these components. Adobe recommends using these modern and extensible components to develop Adaptive Forms.  

* [Adaptive Forms Foundation Components](creating-adaptive-form.md): These are classic (old) data capture components. You can continue to use these to edit your existing foundation components based Adaptive Form. If you are creating forms, Adobe recommends using  [Adaptive Forms Core Components](/help/forms/using/create-adaptive-form.md) to create an Adaptive Forms. 

## Pre-requisites

You require the following to create an Adaptive Form:

* **Enable Adaptive Forms Core Components for your environment**: AEM Archetype project version 41 or later is required to [enable Core Components for your environment](/help/forms/using/enable-adaptive-forms-core-components.md). On enabling the Core Components for your environment, the **Adaptive Forms (Core Component)** template and Canvas theme are added to your environment.     

* **An Adaptive Form template**: A template provides a basic structure and defines appearance (layouts and styles) of an Adaptive Form. It has pre-formatted components containing certain properties and content structure. It also provides the options to define a theme and a submit action. The theme defines the look and feel and submit action defines the action to take on submission of an Adaptive Form. You can also deploy [sample templates](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/sample-themes-templates-form-data-models-core-components.html) to your environment. These help you start creating forms swiftly.

    >[!NOTE]
    >
    > If you do not have, **Adaptive Forms (Core Component)** template on your environment, [Enable Adaptive Forms Core Components for your environment](/help/forms/using/enable-adaptive-forms-core-components.md). On enabling the Core Components for your environment, the **Adaptive Forms (Core Component)** template is added to your environment.

* **An Adaptive Form theme**: A theme contains styling details for the components and panels. Styles include properties such as background colors, state colors, transparency, alignment, and size. When you apply a theme, the specified style reflects on the corresponding components.  The `Canvas` theme is added by default, when you enable core components for your environment. You can  [download and customize the standard themes](create-or-customize-themes-for-adaptive-forms-core-components.md). For **out of the box** themes you can deploy [sample themes](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/sample-themes-templates-form-data-models-core-components.html) to your environment. These help you start styling your forms and provide a base structure to create or customize a theme as per your business requirements.

* **Permissions**: Add your users to [!DNL forms-users] group. The members of the [!DNL forms-users] group have permissions to create an Adaptive Form. For detailed list of forms-specific user groups, see [Groups and permissions](forms-groups-privileges-tasks.md).

<!--
>[!NOTE]
>
>
> In addition to the given themes and templates when you enable Core Components, you can also deploy the latest out-of-the box [sample themes and templates](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/sample-themes-templates-form-data-models-core-components.html) to your AEM environment for use in Core Components based Adaptive Forms.
-->

## Create an Adaptive Form {#create-an-adaptive-form}

1. Login to your local [AEM author instance](https://experienceleague.adobe.com/docs/experience-manager-65/deploying/deploying/deploy.html?lang=en#author-and-publish-installs). 

1. Enter your credentials on the Experience Manager login page. After you are logged in, in the upper-left corner, select **[!UICONTROL Adobe Experience Manager]** &gt; **[!UICONTROL Forms]** &gt; **[!UICONTROL Forms & Documents]**.

1. Select **[!UICONTROL Create]**  &gt; **[!UICONTROL Create Adaptive Forms]**. 

1. Select a Adaptive Forms Core Components template and click **[!UICONTROL Next]**.

1. The **[!UICONTROL Add Properties]** appears. Specify the values for following property fields. The Title and Name fields are mandatory:

    * **[!UICONTROL Title:]** Specifies the display name of the form. The title helps you identify the form in the [!DNL Experience Manager Forms] user interface.
    * **[!UICONTROL Name:]** Specifies the name of the form. A node with the specified name is created in the repository. As you start typing a title, value for the name field is automatically generated. You can change the suggested value. The name field can include only alphanumeric characters, hyphens, and underscores. 
    * **[!UICONTROL Description:]** Specifies the detailed information about the form.
    * **[!UICONTROL Theme Client Library]:** Specifies the theme for an Adaptive Form. By default, the `adaptiveform.theme.canvas3` theme is selected. You can also choose a different theme from the **[!UICONTROL Theme Client Library]** drop-down menu.
    * **[!UICONTROL Configuration Container:]**  Defines a location where configuration files for Adaptive Forms are stored. These configuration files contain settings and properties related to the behavior and appearance of Adaptive Forms.
    * **[!UICONTROL Tags:]** Specifies tags to uniquely identify the Adaptive Form. Tags help in searching the form. To create tags, type new tag names in the **[!UICONTROL Tags]** box.
1. Select **[!UICONTROL Create]**. An Adaptive Form is created and a dialog to open the form for editing appears.


1. Select **[!UICONTROL Edit]** to open the newly created form in a new tab. The form opens for editing and displays the contents available in the template. It also displays the sidebar to customize the newly created form.


## Use Adaptive Forms Core Components to create your form

After opening the form for editing, you can use available Adaptive Forms Core Components to add form fields to your form. You can drag-and-drop or use the + [insert component] option to add these components to a form. See, AEM Core Components documentation to learn about available [Adaptive Forms Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html?lang=en#components). You can also visit [https://aemcomponents.dev/](https://aemcomponents.dev/) to view available core components in action.

## Configure Submit Action for an Adaptive Form {#configure-submit-action-for-form}

A Submit Action lets you choose the destination of data captured by way of an Adaptive Form. It is triggered when a user clicks the Submit button on an Adaptive Form. Adaptive forms include some out of the box submit actions. You can also extend a default submit actions to create your own custom submit action. To configure a Submit Action for your form:

1. Open the Content browser, and select the **[!UICONTROL Guide Container]** component of your Adaptive Form. 
1. Click the Guide Container properties ![Guide properties](/help/forms/using/assets/configure-icon.svg) icon. The Adaptive Form Container dialog box opens. 

1. Click the  **[!UICONTROL Submission]** tab. 

    ![Click the Wrench icon to open Adaptive Form Container dialog box to configure a submit action](/help/forms/using/assets/adaptive-forms-submit-message.png)

1. Select and configure a **[!UICONTROL Submit action]**, based on your requirements. For detailed information about Submit Actions, see [Adaptive Form Submit Action](/help/forms/using/configuring-submit-actions.md)

<!--
    
    ![Click the Wrench icon to open Adaptive Form Container dialog box to configure Data Models for the Adaptive Form Container component](/help/forms/assets/adaptive-forms-container.png)

-->

## Redirect the user to a page or show a thank you message on form submission

On submission of a form, you can redirect the user to another webpage or a message. To redirect the user or configure the thank you message:

1. Open the Content browser, and select the **[!UICONTROL Guide Container]** component of your Adaptive Form. 
1. Click the Guide Container properties ![Guide properties](/help/forms/using/assets/configure-icon.svg) icon. The Adaptive Form Container dialog box opens.  
1. Open the **[!UICONTROL Submission]** tab. 

    ![Click the Wrench icon to open Adaptive Form Container dialog box to configure a redirect page or thank you message](/help/forms/using/assets/adaptive-forms-submit-message.png)

    * To configure a Redirect URL, for on Submit option, select the **[!UICONTROL Redirect to URL]** option, and browse and select an AEM Sites page, or provide URL of an external page.  
  
    * To configure a custom or thank you message, for on Submit option, select the **[!UICONTROL Show Message]** option, and provide a message in the **[!UICONTROL Message content]** box. It is a rich text box, you can use the full screen option to view all the available rich text items. 

## Configure a Schema or Form Data Model for an Adaptive Form {#configure-schema-or-data-model-for-form}

You can use the Form Data Model to connect a form to a Data Source to send and receive data based on user actions. You can also connect a form to a JSON schema to receive the submitted data in a pre-defined format. Based on the requirement, connect your form to a JSON schema or Form data model:

* [Create a JSON Schema and upload to your environment](/help/forms/using/adaptive-form-json-schema-form-model.md)  
* [Create a Form Data Model](/help/forms/using/create-form-data-models.md) 

### Configure a JSON Schema or Form Data Model for your form

To configure a JSON Schema or Form Data Model for your form:

1. Open the Content browser, and select the **[!UICONTROL Guide Container]** component of your Adaptive Form. 
1. Click the Guide Container properties ![Guide properties](/help/forms/using/assets/configure-icon.svg) icon. The Adaptive Form Container dialog box opens. 
1. Open the **[!UICONTROL Data Model]** tab. 
    
    ![Click the Wrench icon to open Adaptive Form Container dialog box to configure a JSON schema or form data model](/help/forms/using/assets/adaptive-forms-select-form-data-model-or-json-schema.png)

1. Select and configure a JSON Schema or Form Data Model, based on your requirements: 

    * When you select the **[!UICONTROL Form Model]** option, use the **[!UICONTROL Select Form Data Model]** option to select a pre-configured Form Data Model.
    * When you select the **[!UICONTROL Schema]** option, use the **[!UICONTROL Schema]** option to select a JSON schema for your form.

1. Click **[!UICONTROL Done]**.

>[!NOTE]
>
> You can edit the JSON Schema or Form Data Model for an Adaptive Form using the Guide Container properties.  

## Configure a pre-fill service  {#configure-prefill-service-for-form}

You can use the prefill service to auto fill fields of an Adaptive Form using existing data. When a user opens a form, the values for those fields are prefilled. You can:

* [Create a custom pre-fill service](/help/forms/using/prepopulate-adaptive-form-fields.md)
* [Use Form Data Model Prefill service](#fdm-prefill-service)

### Use Form Data Model Prefill service to prepopulate fields of an Adaptive Form {#fdm-prefill-service}

You can use the Form Data Model Prefill service to prepopulate fields of an Adaptive Form using a Form Data Model or a custom pre-fill service. The Form Data Model Prefill service uses the [Get Service of configured Form Data Model](work-with-form-data-model.md#add-data-model-objects-and-services-add-data-model-objects-and-services) to retrieve data. To use Form Data Model Prefill service for an Adaptive Form:

1. Open the Content browser, and select the **[!UICONTROL Guide Container]** component of your Adaptive Form. 
1. Click the Guide Container properties ![Guide properties](/help/forms/using/assets/configure-icon.svg) icon. The Adaptive Form Container dialog box opens. 
1. Click the Adaptive Form Container properties ![Adaptive Form Container properties](/help/forms/using/assets/configure-icon.svg) icon. The Adaptive Form Container dialog box to configure Data Models opens. 
![Click the Wrench icon to open Adaptive Form Container dialog box to configure a redirect page or thank you message](/help/forms/using/assets/adaptive-forms-container-prefill-service.png)
1. Select a form data model. Open the **[!UICONTROL Basic]** tab. In the prefill service, select **[!UICONTROL Form Data Model Prefill Service]**. 
1. Click **[!UICONTROL Done]**. Your Adaptive form is now configured to use Form Data Model Prefill. You can now, use the [rule editor](rule-editor.md) to create rules to prepopulate fields of the form.

## How to rename an AEM Adaptive Form ?{#rename-an-AEM-Adaptive-Form}

To rename an adaptive form, perform the following steps:

1. Select an adaptive form in your AEM Forms user interface.
1. Click on the **Properties** located on the upper rail.

    ![Properties](/help/forms/using/assets/rename-form-properties.png)

1. Change the name of the form in the **Title** tab, as shown in the image below.
1. Click **Save and Close**.

    ![Rename an AEM Adaptive Form](/help/forms/using/assets/rename-form-title.png)


<!--
## Edit Form Model properties of an Adaptive Form {#edit-form-model}

1. Select the Adaptive Form and select ![Page information](/help/forms/using/assets/configure-icon.svg) > **[!UICONTROL Open Properties]**. The Form Properties page opens. 

1. Go to the **[!UICONTROL Form Model]** tab and choose a form model. If the Adaptive Form is without a form model, you have the freedom to choose either a JSON schema or a form data model. On the other hand, if the Adaptive Form is already based on a form model, you have the option to switch to another form model of the same type. For instance, if the form is using a JSON schema, you can easily switch to another JSON schema, and similarly if the form is using a Form Data Model, you can switch to another Form Data Model. 

1. Select **[!UICONTROL Save]** to save the properties.
-->

## What's Next

* [Use rule editor to add dynamic behaviour to form](rule-editor.md)
* [Create or customize themes for Core Components based Adaptive Forms](create-or-customize-themes-for-adaptive-forms-core-components.md)


## See also

* [Create a Core Components based Adaptive Form](create-an-adaptive-form-core-components.md)
* [Create or Add an Adaptive Form to an AEM Sites Page or Experience Fragment](create-or-add-an-adaptive-form-to-aem-sites-page.md)
* [Sample themes templates and form data models](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/sample-themes-templates-form-data-models-core-components.html)

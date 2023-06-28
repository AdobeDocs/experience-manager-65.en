---
title: Create or add an Adaptive Form to AEM Sites page
description: Discover how to effortlessly create or seamlessly add an Adaptive Form to your AEM Sites page. Learn step-by-step techniques and best practices for integrating dynamic and customizable forms into your website, optimizing your digital experiences for maximum impact.
feature: Adaptive Forms
exl-id: 1813ccfc-87ce-46fa-a1d5-5edffd91efb0
---
# Create or add an Adaptive Form to AEM Sites page {#create-or-add-an-adaptive-form-to-aem-sites-page}

| Version | Article link |
| -------- | ---------------------------- |
| AEM 6.5  |   This article                |
| AEM as a Cloud Service     | [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/create-or-add-an-adaptive-form-to-aem-sites-page.html)         |

With AEM Forms, you can seamlessly incorporate adaptive forms into your web pages. This allows your visitors to conveniently fill and submit forms without ever leaving the page they are on. By doing so, they can effortlessly stay engaged with other elements of the website while actively interacting with the form. 

You can use AEM Page Editor to quickly create and add multiple forms to your AEM Sites pages. Using AEM Page Editor allows content authors to create seamless data capture experiences within a Sites page using the power of adaptive forms components including dynamic behavior, validations, data integration, generate document of record and business process automation. It also allows you to use various features of AEM Sites pages like, versioning, targeting, translation, and multi-site manager.

AEM Forms provide Adaptive Form Container and Adaptive Forms – Embed components. You can use Adaptive Form Container to create a new form in an Experience Fragment or AEM Sites page, while Adaptive Forms – Embed component allows you to add an existing Adaptive Form or create a new form using Adaptive Forms Editor. 

![](/help/forms/using/assets/adaptive-form-in-sites-page.png)

## Benefits of using Adaptive Form Container component in AEM Page Editor or Experience Fragment

Using Adaptive Form Container in AEM Page Editor allows you to create seamless data capture experiences within a Sites page using the power of Adaptive Forms components including dynamic behavior, validations, data integration, generate document of record and business process automation. It also allows you to use various features of AEM Sites pages like, versioning, targeting, translation, and multi-site manager, enhancing the overall form creation and management experience. Let's explore some of these features:

* **Versioning:** AEM Sites pages offer [robust versioning capabilities](/help/sites-authoring/working-with-page-versions.md), allowing you to track and manage different versions of your forms. This enables you to make changes and enhancements to forms while maintaining the ability to roll back to previous versions if needed. Versioning ensures a controlled and organized approach to form development and evolution.
* **Targeting (Integration with Adobe Target):** With AEM Sites pages targeting capabilities, you can also [personalize the form experience for different audiences](/help/sites-administering/target.md). By leveraging user segments and targeting criteria, you can tailor the form's content, design, or behavior to specific groups of users. This enables you to provide a personalized and relevant form experience, increasing engagement and conversion rates.
* **Translation:** AEM Sites [seamless integration with translation services](/help/sites-administering/translation.md), allowing you to translate forms into multiple languages easily. This feature simplifies the localization process, ensuring that your forms are accessible to a global audience. You can manage translations efficiently within AEM translation projects, reducing time and effort required for multilingual form support. Refer considerations section for more information on translation.  
* **Multi-site Management and Live Copy:** AEM Sites provide robust [Multi-site Management and Live Copy capabilities](/help/sites-administering/msm.md), enabling you to create and manage multiple websites within a single environment. This feature now allows you to reuse forms across different sites, ensuring consistency and reducing duplication efforts. With centralized control and management, you can efficiently maintain and update forms across multiple websites.
* **Themes:** AEM Sites pages provide a framework for designing and maintaining consistent visual styles across multiple web pages. These define colors, fonts, style sheets, and other visual elements that contribute to the overall look and feel of the website. [You can use the themes designed for an AEM Sites page for an Adaptive Form, saving time and effort](/help/sites-authoring/style-system.md). 
* **Tagging:** AEM Sites pages allow you to [assign tags or labels to a page, an asset, or other content](/help/sites-authoring/tags.md). Tags are keywords or metadata labels that provide a way to categorize and organize content based on specific criteria. You can assign one or more tags to pages, assets, or any other content items within AEM to improve search and categorize the assets. 
* **Locking and Unlocking content:** AEM Sites allow users to [control access and modifications to pages](/help/sites-authoring/editing-content.md#locking-a-page-locking-a-page) within the AEM Sites environment. When a page is locked, it means that it is protected from unauthorized changes or edits by other users. Only the user who has locked the content or a designated administrator can unlock it to allow modifications. 


## Various options to add an Adaptive Form in AEM Page Editor

You can take full advantage of this feature by utilizing the following options:

* **Add a custom Adaptive Form to an AEM Sites page:** Build a brand-new form from scratch, tailoring it specifically to your requirements and design preferences.

* **Add a custom Adaptive Form to an Experience Fragments:** Extend the reach of your forms by adding them to AEM Experience Fragments, allowing for seamless reuse across multiple pages or sites.

* **Add multiple forms to an AEM Sites page or Experience Fragment:**  Add multiple forms to a page to provide multiple choices to users based on their preferences and requirements. These can a combination of brand-new form from scratch and existing forms.

* **Convert an Adaptive Form to Experience Fragment:** Convert an Adaptive Form added to an AEM Sites page to an Experience Fragment for reusing the form across multiple AEM Sites pages.

* **Create and add forms based on approved templates to an AEM Sites page:** Leverage pre-approved templates to quickly create forms that align with your organization's branding guidelines and design standards. The option is available only for Adaptive Forms created with Adaptive Forms Editor or Adaptive Forms - Embed component. 

* **Add existing forms to an AEM Sites page:** Easily integrate forms that you have already created into your websites, enabling visitors to interact with them directly. The option is available only for Adaptive Forms created with Adaptive Forms Editor or Adaptive Forms - Embed component. 

## Considerations {#consideration}

* When you use the Adaptive Form Container to create or add a form, the forms undergo translation and localization through the AEM Sites translation flow. For each language, a separate copy (language copy) of the sites page and corresponding forms is generated and when a content author modifies a rule in a form on the parent page, the same changes must be made in all language copies of the form. Adaptive Form Container also allows you to use various features of AEM Sites pages like, versioning, targeting, translation, and multi-site manager.

* When you create or add a form using the Adaptive Form-embed component, the forms undergo translation and localization using the AEM Forms translation flow. In this case, a single form is maintained and referenced in all the language copies of the Sites pages. Adaptive Form-embed component does not provide access to various features of AEM Sites pages like, versioning, targeting, translation, and multi-site manager.


## Before you start {#before-you-start}

+++  Enable Adaptive Forms Core Components for your environment

Ensure that the [Adaptive Forms Core Components are enabled for your environment](https://experienceleague.adobe.com/docs/experience-manager-headless-adaptive-forms/using/quick-setup/enable-headless-adaptive-forms-and-core-components.html?lang=en). 

+++ 

+++  Add Adaptive Forms Client Libraries to your AEM Sites page and Experience Fragment page components 

To enable complete functionality of the Adaptive Forms Container component, add the Customheaderlibs and Customfooterlibs client libraries to your AEM Sites page using the deployment pipeline. To add the libraries:

  1. Login to your AEM Author instance and open CRX DE. The default URL for an Author instance running locally is `http://localhost:4502/crx/de`.  

  1. Open the `/apps/[your-sites-project]/components/page/customheaderlibs.html` file and add the following code to the file:

         ```
             //Customheaderlibs.html
             <sly data-sly-use.clientlib="core/wcm/components/commons/v1/templates/clientlib.html">
             <sly data-sly-call="${clientlib.css @ categories='core.forms.components.runtime.all'}"/>
             </sly> 

         ```

  1. Open the `/apps/[your-sites-project]/components/page/customfooterlibs.html` file and add the following code to the file:

         ```

             //customfooterlibs.html
             <sly data-sly-use.clientlib="core/wcm/components/commons/v1/templates/clientlib.html">
             <sly data-sly-test="${!wcmmode.edit}" data-sly-call="${clientlib.js @ categories='core.forms.components.runtime.all', async=true}"/>
             </sly> 
         ```

  1. Open the `/apps/[your-sites-project]/components/xfpage/customheaderlibs.html` file and add the following code to the file:

         ```
             //Customheaderlibs.html
             <sly data-sly-use.clientlib="core/wcm/components/commons/v1/templates/clientlib.html">
             <sly data-sly-call="${clientlib.css @ categories='core.forms.components.runtime.all'}"/>
             </sly> 

         ```

  1. Open the `/apps/[your-sites-project]/components/customfooterlibs.html` file and add the following code to the file:

         ```

             //customfooterlibs.html
             <sly data-sly-use.clientlib="core/wcm/components/commons/v1/templates/clientlib.html">
             <sly data-sly-test="${!wcmmode.edit}" data-sly-call="${clientlib.js @ categories='core.forms.components.runtime.all', async=true}"/>
             </sly> 
         ```

  1. Repeat the above steps all the Author and Publish instances in your environment. 

+++ 

+++ Enable Adaptive Forms Container

To enable [!UICONTROL Adaptive Forms Container] component in template's policy, perform the following steps:

  1. Open the AEM Sites page or Experience Fragment for editing. To open the page for editing, select the page, and click Edit.
  1. Open the template of your Sites or Experience Fragment page. To open the template, go to the [!UICONTROL Page Information] ![Page Information](/help/forms/using/assets/Smock_Properties_18_N.svg) > [!UICONTROL Edit Template]. It opens the corresponding template in template editor.
  1. In the Structure view, click the **[!UICONTROL Policy]** ![Policy](/help/forms/using/assets/Smock_FeedManagement_18_N.svg) icon in the menu bar. In the **[!UICONTROL Allowed Components]** list and select the **[!UICONTROL Adaptive Forms Container]**  checkbox under the **[AEM Archetype Project Name] - Adaptive Form**.
  1. Click **[!UICONTROL Done]**.

  >[!VIDEO](https://video.tv.adobe.com/v/3419370?quality=12&learn=on)

+++

## Create an Adaptive Form {#create-an-adaptive-form-in-sites-editor-or-experience-fragment}

You can create a brand-new form from scratch, tailoring it specifically to your requirements and design preferences, directly in an AEM Sites page or in Experience Fragment. For single-use forms, direct authoring to an AEM Sites page is recommended, while Experience Fragments are ideal for forms that need to be reused across multiple pages on your website.

* [Create a form in an AEM Sites page](#create-an-adaptive-form-in-sites-editor)
* [Create a form in an Experience Fragment](#create-an-adaptive-form-in-experience-fragment) 
* [Convert an Adaptive Form in AEM Sites page to an Experience Fragment](#convert-an-adaptive-form-in-sites-page-to-an-experience-fragment) 

### Create a form in an AEM Sites page {#create-an-adaptive-form-in-sites-editor}

You can use the Adaptive Form Container component in AEM Page Editor to create a custom form. The component allows you to create a form by dragging and dropping the form components. The form components are based on Core Components. You can easily customize these as per the requirement of your organization. 

>[!VIDEO](https://video.tv.adobe.com/v/3419284?quality=12&learn=on)

To create an Adaptive Form in a Sites page: 

1. Open the AEM Sites page in edit mode.
1. Drag-and-drop the **[!UICONTROL Adaptive Forms Container]** component from the Component Browser to the Sites page. It creates a space on the page for the form. You can use the layout mode to change the Size of the container space. 
1. Drag-and-drop Adaptive Form Core Components to the container space to create the form. 
1. Add the Submit button. 

Next, you [set the Submit Action](#configure-submit-action-for-form) and advanced properties. 

### Create a form in an Experience Fragment {#create-an-adaptive-form-in-experience-fragment}

You can extend the reach of your forms by adding them to AEM Experience Fragments, allowing for seamless reuse across multiple pages or sites. For example, you can include a newsletter signup form within an Experience Fragment. This allows you to conveniently reuse the fragment across multiple pages of your website, eliminating the need to recreate the form repeatedly. Any updates or modifications made to the newsletter signup form within the Experience Fragment are automatically propagated to all the pages where it is utilized. This streamlines the process and ensures a seamless user experience while simplifying the management of your website's forms. 

To create an Adaptive Form in an Experience Fragment:

1. Open an Experience Fragment.
1. Drag-and-drop the **[!UICONTROL Adaptive Forms Container]** component from the Component Browser to the Experience Fragment. 
1. Drag-and-drop Adaptive Form Core Components to the container space in the Experience Fragment to create the form. 
1. Add the Submit button. 

Next, you [set the Submit Action](#configure-submit-action-for-form) and advanced properties. 

### Convert an Adaptive Form in AEM Sites page to an Experience Fragment {#convert-an-adaptive-form-in-sites-page-to-an-experience-fragment}

You can convert an existing Adaptive Form in a Sites Page Editor to an Experience Fragment to reuse the form across multiple pages or sites. 

To convert an Adaptive Form in AEM Sites page to an Experience Fragment:

1. Open the AEM Sites page containing the Adaptive Form (in Adaptive Forms Container component) in edit mode.
1. Open the Content Tree, and select the **[!UICONTROL Adaptive Forms Container]** that hosts your Adaptive Form. An AEM Sites page can host multiple Adaptive Forms. So, carefully select the correct Adaptive Forms Container. 
1. On the menu bar, select the ![Convert to experience fragment variation icon](/help/forms/using/assets/Smock_FilingCabinet_18_N.svg) Convert to Experience Fragment variation icon. 
    ![](/help/forms/using/assets/convert-form-in-sites-page-to-an-experience-fragment.png)
    
    A dialog box to convert the Adaptive Form container to a new Experience Fragment or add to an existing Experience Fragment appears 
1. On the Convert to Experience Fragment variation dialog box, set values for the following options:

    * **Action:** Select to create a new Experience Fragment or Add to an existing Experience Fragment.
    * **Parent path:** Specify path of the folder to host the Experience Fragment in. The option is available only for creating a new Experience Fragment. 
    * **Template:** Specify path of the Experience Fragment template. If you don't have an Experience Fragment template, [create it](/help/sites-developing/experience-fragments.md). The option is available only for adding Adaptive Form to an existing Experience Fragment. 
    * **Fragment title:** Specify title of the Experience Fragment. The title uniquely identifies an Experience Fragment 


## Configure Submit Action for the form {#configure-submit-action-for-form}

A Submit Action allows you to choose the destination of data captured via an Adaptive Form. It is triggered when a user clicks the Submit button on an Adaptive Form. Adaptive forms include some out of the box submit actions. You can also extend a default submit actions to create your own custom submit action. To configure a Submit Action for your form:

1. Open the AEM Page Editor or Experience Fragment that contains the Adaptive Form.
1. Open the Content Tree, and select the **[!UICONTROL Adaptive Forms Container]** that hosts your Adaptive Form. An AEM Sites page can host multiple Adaptive Forms. So, carefully select the correct Adaptive Forms Container. 
1. Click the Adaptive Form Container properties ![Adaptive Form Container properties](/help/forms/using/assets/configure-icon.svg) icon. The Adaptive Form Container dialog box to configure submit actions opens. 
![](/help/forms/using/assets/adaptive-forms-container.png)
1. Select and configure a Submit action, based on your requirements. For detailed information about Submit Actions, see [Adaptive Form Submit Action](configuring-submit-actions.md)


## Configure a Schema or Form Data Model for a form {#configure-schema-or-data-model-for-form}

You can use the Form Data Model to connect a form to a Data Source to send and receive data based on user actions. You can also connect a form to a JSON schema to receive the submitted data in a pre-defined format. 

Before you connect a form to a schema or Form data model

* [Create a JSON Schema and upload to your environment](adaptive-form-json-schema-form-model.md)
* [Create a Form Data Model](create-form-data-models.md)

To configure a JSON Schema or Form Data Model for your form:

1. Open the AEM Page Editor or Experience Fragment that contains the Adaptive Form.
1. Open the Content Tree, and select the **[!UICONTROL Adaptive Forms Container]** that hosts your Adaptive Form. An AEM Sites page can host multiple Adaptive Forms. So, carefully select the correct Adaptive Forms Container. 
1. Click the Adaptive Form Container properties ![Adaptive Form Container properties](/help/forms/using/assets/configure-icon.svg) icon. The Adaptive Form Container dialog box to configure Data Models opens. 
![](/help/forms/using/assets/form-data-model-adaptive-forms-container.png)
1. Select and configure a JSON Schema or Form Data Model, based on your requirements. For detailed information about Submit Actions, see [Adaptive Form Submit Action](configuring-submit-actions.md). 

    * When you select the **[!UICONTROL Form Model]** option, use the **[!UICONTROL Select Form Data Model]** option to select a pre-configured Form Data Model.
    * When you select the **[!UICONTROL Schema]** option, use the **[!UICONTROL Schema]** option to select a JSON schema for your form.

1. Click **[!UICONTROL Done]**.

## Configure a pre-fill service for a form {#configure-prefill-service-for-form}

You can use the prefill service to auto fill fields of an Adaptive Form using existing data. When a user opens a form, the values for those fields are prefilled. You can:

* [Create a custom pre-fill service](prepopulate-adaptive-form-fields.md)
* [Use Form Data Model Prefill service](#fdm-prefill-service) 

### Use Form Data Model Prefill service {#fdm-prefill-service}

You can use the Form Data Model Prefill service to prepopulate fields of a form using a configured Form Data Model. The Form Data Model Prefill service uses the [Get Service of configured Form Data Model](work-with-form-data-model.md#add-data-model-objects-and-services-add-data-model-objects-and-services) to retrieve data. To use Form Data Model Prefill service for an Adaptive Form:

1. Open the AEM Page Editor or Experience Fragment that contains the Adaptive Form.
1. Open the Content Tree, and select the **[!UICONTROL Adaptive Forms Container]** that hosts your Adaptive Form. An AEM Sites page can host multiple Adaptive Forms. So, carefully select the correct Adaptive Forms Container. 
1. Click the Adaptive Form Container properties ![Adaptive Form Container properties](/help/forms/using/assets/configure-icon.svg) icon. The Adaptive Form Container dialog box to configure Data Models opens. 
![](/help/forms/using/assets/prefill-service-fdm-aem-sites-page-editor.png)
1. Select a form data model. Open the **[!UICONTROL Basic]** tab. In the prefill service, select **[!UICONTROL Forms Portal Draft Prefill Service]**. 
1. Click **[!UICONTROL Done]**.

## Redirect the user to a new user on form submission or show a thank you message

On submission of a form, you can redirect the user to another webpage or a message. To redirect the user or configure the thank you message:

1. Open the AEM Page Editor or Experience Fragment that contains the Adaptive Form.
1. Open the Content Tree, and select the **[!UICONTROL Adaptive Forms Container]** that hosts your Adaptive Form. An AEM Sites page can host multiple Adaptive Forms. So, carefully select the correct Adaptive Forms Container. 
1. Click the Adaptive Form Container properties ![Adaptive Form Container properties](/help/forms/using/assets/configure-icon.svg) icon. The Adaptive Form Container dialog box to configure Data Models opens. 
1. Open the **[!UICONTROL Submission]** tab. 

    * To configure a Redirect URL, for on Submit option, select the Redirect to URL option, and provide an absolute address or a Redirect URL or relative path of an AEM Sites page.  
  
    * To configure a custom or thank you message, for on Submit option, select the Show Message option, and provide a message in the Message content box. It is a rich text box, you can use the full screen option to view all the available rich text items.

---
title: Content Fragment Models
seo-title: Content Fragment Models
description: Content Fragment Models are used to create content fragments with structured content.
seo-description: Content Fragment Models are used to create content fragments with structured content.
uuid: 776c0b19-f650-461e-adc4-65f3ba53c4f3
content-type: reference
topic-tags: content-fragments
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
discoiquuid: 05083146-da15-476d-a12a-342212701916
index: y
internal: n
snippet: y
---

# Content Fragment Models{#content-fragment-models}

Content Fragment Models define the structure of content for your [content fragments](../../assets/using/content-fragments.md).

## Enable Content Fragment Models {#enable-content-fragment-models}

<!--
Comment Type: remark
Last Modified By: unknown unknown (ims-author-57F1056A4CD116590A746C15@AdobeID)
Last Modified Date: 2017-09-18T09:44:41.058-0400
<p>need a link once the conf manager has been documented</p>
<p>See <a href="https://jira.corp.adobe.com/browse/CQDOC-6654">https://jira.corp.adobe.com/browse/CQDOC-6654</a></p>
-->

>[!CAUTION]
>
>If do you not enable **Content Fragment Models** the **Create** option will not be available for creating new models.

To enable content fragment models you need to:

* Enable the use of content fragment models in the configuration manager
* Apply the configuration to your Assets folder

### Enable Content Fragment Models in Configuration Manager {#enable-content-fragment-models-in-configuration-manager}

To [create a new Content Fragment Model](#creating-a-content-fragment-model) you **must** first enable them using the Configuration Manager:

1. Navigate to **Tools**, **General**, then open the **Configuration Browser**.
1. Select the location appropriate to your website.
1. Use **Create** to open the dialog, where you:

    1. Specify a **Title**. 
    1. Select **Content Fragment Models** to enable their use.

   ![](assets/cfm-6420-09.png)

1. Select **Create** to save the definition.

### Apply the Configuration to your Assets Folder {#apply-the-configuration-to-your-assets-folder}

<!--
Comment Type: remark
Last Modified By: Alison Heimoz (aheimoz)
Last Modified Date: 2018-01-31T01:12:19.457-0500
<p>need a link to the standard Assets documentation once available</p>
<p>see <a href="https://jira.corp.adobe.com/browse/CQDOC-11913">https://jira.corp.adobe.com/browse/CQDOC-11913</a><br /> </p>
-->

When the configuration **global** is enabled for content fragment models, then any models that users create can be used in any Assets folder.

To use other configurations (i.e. excluding global) with a comparable Assets folder, then you have to define the connection. This is done using **Configuration** in the **Cloud Services** tab of the **Folder Properties** of the appropriate folder.

## Creating a Content Fragment Model {#creating-a-content-fragment-model}

1. Navigate to **Tools**, **Assets**, then open **Content Fragment Models**.
1. Navigate to the folder appropriate to your [configuration](#enable-content-fragment-models).
1. Use **Create** to open the wizard.

   >[!CAUTION]
   >
   >If the [use of content fragment models have not been enabled](#enable-content-fragment-models), the **Create** option will not be available.

1. Specify the **Model Title**. You can also add a **Description** if required.

   ![](assets/cfm-6420-10.png)

1. Use **Create** to save the empty model. A message will indicate the success of the action, you can select **Open** to immediately edit the model, or **Done** to return to the console.

## Defining your Content Fragment Model {#defining-your-content-fragment-model}

The content fragment model effectively defines the structure of the resulting content fragments. Using the model editor you can add, and configure, the required fields:

>[!CAUTION]
>
>Editing an existing content fragment model can impact dependent fragments.

1. Navigate to **Tools**, **Assets**, then open **Content Fragment Models**.  

1. Navigate to the folder holding your content fragment model.
1. Open the required model for **Edit**; use either the quick action, or select the model and then the action from the toolbar.

   Once open the model editor shows:

    * left: fields already defined
    * right: **Data Types** available for creating fields (and **Properties** for use once fields have been created)

   >[!NOTE]
   >
   >When a field as **Required**, the **Label** indicated in the left pane will be marked with an asterix (**&#42;**).

   ![](assets/cfm-6420-12.png)

1. **To Add a Field**

    * Drag a required data type to the required location for a field:

   ![](assets/cfm-6420-11.png)

    * Once a field has been added to the model, the right panel will show the **Properties** that can be defined for that particular data type. Here you can define what is required for that field. For example:

   ![](assets/cfm-6420-13.png)

   >[!NOTE]
   >
   >For the data type **Multi line text** it is possible to define the **Default Type** as either:
   >
   >    
   >    
   >    * **Rich Text  
   >      **
   >    * **Markdown ** 
   >    
   >    * **Plain Text**
   >    
   >    
   >
   >If not specified, the default value **Rich Text** is used for this field.   
   >
   >
   >Changing the **Default Type** in a content fragment model will only take effect on an existing, related, content fragment after that fragment is opened in the editor and saved.

1. **To Remove a Field**

   Select the required field, then click/tap the trash-can icon. You will be asked to confirm the action.

   ![](assets/cf-32.png)

1. After adding all required fields, and defining the properties, use **Save** to persist the definition. For example:

   ![](assets/cfm-6420-14.png)

## Deleting a Content Fragment Model {#deleting-a-content-fragment-model}

>[!CAUTION]
>
>Deleting a content fragment model can impact dependent fragments.

To delete a content fragment model:

1. Navigate to **Tools**, **Assets**, then open **Content Fragment Models**.  

1. Navigate to the folder holding your content fragment model.
1. Select your model, followed by **Delete** from the toolbar.

   >[!NOTE]
   >
   >If the model is referenced a warning will be given. Take action appropriately.

## Publishing a Content Fragment Model {#publishing-a-content-fragment-model}

Content fragment models need to be published when/before any dependent content fragments are published.

To publish a content fragment model:

1. Navigate to **Tools**, **Assets**, then open **Content Fragment Models**.  

1. Navigate to the folder holding your content fragment model.
1. Select your model, followed by **Publish** from the toolbar.

   >[!NOTE]
   >
   >If you publish a content fragment for which the model has not yet been published, a selection list will indicate this and the model will be published with the fragment.


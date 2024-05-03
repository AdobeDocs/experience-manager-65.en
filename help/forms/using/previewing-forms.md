---
title: Previewing a form
description: You can preview your forms before publishing or activating to ensure it meets the expectations. Preview options may vary across the supported form types.
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: author
discoiquuid: 377d804d-4a75-4c93-8125-d2660cf56418
feature: Adaptive Forms, Foundation Components
exl-id: aed5703e-4fe6-4839-9657-c660ac48521e
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Previewing a form {#previewing-a-form}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

## Overview {#overview}

In AEM Forms, you can preview the forms and documents present in the repository. Preview helps to know exactly how the forms look and behave when they are released to the end users.

When previewing forms, they are rendered in interactive interface and the user can fill the forms with data. When previewing documents, they are rendered in non-interactive mode and the user can only view the document. For forms, an additional option of Custom Preview is available. Using this option, you can preview the form using data from an XML file. The data fills up some or all fields of the form being previewed.

The following table lists the preview options available for different types of supported forms:

<table>
 <tbody>
  <tr>
   <td><strong>Asset type</strong><br /> </td>
   <td><strong>Available preview options</strong><br /> </td>
  </tr>
  <tr>
   <td>Document</td>
   <td>PDF preview</td>
  </tr>
  <tr>
   <td>PDF Form</td>
   <td>PDF preview and Preview with Data<br /> </td>
  </tr>
  <tr>
   <td>adaptive form</td>
   <td>HTML preview and HTML preview with Data</td>
  </tr>
  <tr>
   <td>Form Template</td>
   <td>PDF preview, PDF preview with Data, HTML preview, HTML preview with Data<br /> </td>
  </tr>
 </tbody>
</table>

## Previewing a form {#previewing-a-form-1}

1. Select an asset you want to preview, and click Preview ![aem6forms_preview](assets/aem6forms_preview.png) in the actions toolbar.

   >[!NOTE]
   >
   >To select an asset, switch to List view from the default Card view. Click ![aem6forms_viewlist](assets/aem6forms_viewlist.png) or ![aem6forms_viewcard](assets/aem6forms_viewcard.png) to switch views.

1. Clicking Preview lists the possible preview options applicable for the selected Asset Type. Click the desired option to render the selected asset in a new tab.

   Your options are:

    * Preview as HTML
    * Preview with Data
    * Preview as PDF (available for form templates)

## Preview with Data {#preview-with-data}

When you select **Preview with Data**, you can see how the form looks with real data entered in it. Preview with Data option lets you upload an XML that contains sample user data. The sample user data is used to populate the preview form in the format you choose.

1. Select an asset, click Preview ![aem6forms_preview](assets/aem6forms_preview.png), and select **Preview with Data**.
1. In the Preview Form dialog, provide FormData as an XML file. Click Preview to render the form with the merged data from XML.

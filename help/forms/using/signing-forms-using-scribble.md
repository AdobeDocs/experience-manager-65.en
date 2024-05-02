---
title: Apply electronic signatures to a form using scribble signatures
description: Learn how to sign AEM Adaptive Forms using the scribble signature. You can use the scribble signature and signature step to draw the signature on a form. 
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: author
docset: aem65
feature: Adaptive Forms, Foundation Components
exl-id: 096f61b0-59f4-4699-9093-8fb1ed81fded
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Apply electronic signatures to a form using scribble signatures{#apply-electronic-signatures-to-a-form-using-deprecated-scribble-signatures}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>


| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-foundation-components/add-components-to-an-adaptive-form/signing-forms-using-scribble.html)                  |
| AEM 6.5     | This article         |


You can use the **Scribble Signature** component and **Signature Step** component to draw (Scribble) signature on an adaptive form. The Signature step component displays a PDF version of the adaptive form. You require a Document of Record option enabled or form template based adaptive forms to use the Signature step component.

![Scribble sign dialog](/help/forms/using/assets/scribble-signature.png)

## Various Options available in Signature Window

* **A:** Click the **Paint Brush** icon to draw your signature on canvas.
* **B:** Click the **Clear** icon to clear the signature on canvas.
* **C:** Click the **Geolocation** icon to add geolocation along with the signature.
* **D:** Click the **Keyboard** icon to type your name on canvas. 

 Once you select the Done![aem_6_3_forms_save](assets/aem_6_3_forms_save.png) icon in Scribble signature window, you cannot edit the signature. In case, if you want to edit the signature, you have to disregard the current signature and re-sign using the above Paint Brush/Keyboard option.

You can select the **Configure** ![configure](assets/configure.png) icon to set the aspect ratio of Scribble Signature canvas. 
* When the aspect ratio of the Scribble Signature canvas is less than 1, the geolocation information is added at the bottom of the Scribble Signature canvas.

* When the aspect ratio of the Scribble Signature canvas is more than 1, the geolocation information is added to the right-side of the Scribble Signature canvas. 
 
 ![scribble signature-bottom](/help/forms/using/assets/scribble-signature-aspectratio.PNG)


   >[!NOTE]
   >
   >Signatures are always saved in a PNG format.
   >
   
## Configure an adaptive form to use Scribble Signature {#configure-an-adaptive-form-to-use-scribble-signature}

1. Create a Document of Record option enabled or form template based adaptive form. For step-by-step information, see [Creating an adaptive form](../../forms/using/creating-adaptive-form.md).
1. Drag-and-drop the **Scribble Signature** component from component browser to the adaptive form.
1. Select the **Configure** ![configure](assets/configure.png) icon. It opens properties browser and displays properties of the Scribble Signature component. Configure properties of the Scribble Signature component.
1. Drag-and-drop the Signature Step component from component browser to the adaptive form.

   >[!NOTE]
   >
   >The Signature Step component takes up full width available for the form. It is recommended to not have any other component on the section containing the Signature Step component.
   >

1. In the Content browser, select **Form Container**, and select the **Configure** ![configure](/help/forms/using/assets/configure.png) icon. It opens properties browser and displays Adaptive Form container properties. Navigate to **Adaptive Form Container** &gt; **Electronic Signature** and deselect the **Enable Adobe Sign** option. Select the Done ![aem_6_3_forms_save](assets/aem_6_3_forms_save.png) icon to save the changes.

   >[!NOTE]
   >
   >When you add a Signature Step component to an adaptive form, the Enable Adobe Sign option is selected automatically.
   >

1. Select the **Configure** ![configure](assets/configure.png) icon. It opens properties browser and displays Signature step properties. Configure the following properties:

    * **Element Name**: Specify name of the component.

    * **Title:** Specify unique title of the component.
    * **Template message:** Specify the message to be displayed while the signature PDF is being loaded. Adobe Sign services take some time to prepare and load signature PDF.
    * **Signing Service:** Select the **Scribble Signature** option.

    * **CSS Class**: Specify CSS class of the client library, if any. Use [themes](../../forms/using/themes.md) and [in-line styles](../../forms/using/inline-style-adaptive-forms.md) instead of CSS Class.

   Select the Done ![aem_6_3_forms_save](assets/aem_6_3_forms_save.png) icon to save the changes. The Signature is configured sucessfully.

   Now, when you fill a form, a PDF version of adaptive form is displayed and options to sign the PDF document are provided. For detailed information, see [Sign an adaptive form using Scribble Signature](../../forms/using/signing-forms-using-scribble.md#sign-an-adaptive-form-using-scribble-signature).

## Sign an adaptive form using Scribble Signature {#sign-an-adaptive-form-using-scribble-signature}

1. After you fill an adaptive form and reach the Signature Step page, the signature screen is displayed.

   ![Scribble sign dialog](/help/forms/using/assets/esignscribblesign.jpg)

1. Click **[!UICONTROL Sign]**. The scribble sign dialog appears. Sign the form and click the Done ![aem_6_3_forms_save](assets/aem_6_3_forms_save.png) icon to save the signature.

   ![Scribble sign dialog](/help/forms/using/assets/scribblewidget.png)

1. Click complete to finish the signing process.

   ![Complete the signing process](/help/forms/using/assets/scribblecomplete.jpg)

The signatures are added to the form and the form control moves to the next panel.

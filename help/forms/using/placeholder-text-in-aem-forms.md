---
title: Placeholder text in AEM Forms 

description: Placeholder text is intended to aid the user with data entry when the control has no value. It could be a sample value or a brief description of the expected format.


products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: author

docset: aem65
feature: Adaptive Forms, Foundation Components
exl-id: 6b6e27b5-8b4e-489c-9e72-4d256692c1ca
solution: Experience Manager, Experience Manager Forms
role: "User, Developer"
---
# Placeholder text in AEM Forms {#placeholder-text-in-aem-forms}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

The placeholder text represents a word or short phrase. It is intended to aid the user with data entry when the control has no value. A placeholder text could be a sample value or a brief description of the expected format. The placeholder text is shown before the user enters a value, it is removed when the user enters or selects a value.

>[!NOTE]
>
>The placeholder text, if specified, must have a value that contains no new line characters.

![Date component with and without placeholder text](assets/dat-picker-place-holder-text.png)

**A.** Date component with placeholder text **B.** Date component without placeholder text

AEM Forms support placeholder text for Password box, Date picker, Numeric box, and text box fields.  
Placeholder texts are not supported for the native HTML5 date widget. To specify a Placeholder text:

1. Right-click a component which supports Placeholder Text and click **Edit**. The Edit component dialog box appears.  

1. Open the **Title and text** tab. 
1. Specify a word or a short phrase in the **Placeholder text box**. Click **OK**.

>[!NOTE]
>
>Placeholder text is not supported on Microsoft Internet Explorer 9.

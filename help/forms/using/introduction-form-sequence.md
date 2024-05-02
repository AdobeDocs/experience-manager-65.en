---
title: Introduction to multi-step form sequence
description: With AEM Forms, you can define a sequence of form panels in which you want users to navigate and fill an adaptive form.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: author
docset: aem65
feature: Adaptive Forms, Foundation Components
exl-id: 1333c6cb-15cc-429b-a13e-5d23afdee69a
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Introduction to multi-step form sequence{#introduction-to-multi-step-form-sequence}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes an older approach to authoring Adaptive Forms using foundation components. </span>

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-foundation-components/configure-layout-of-an-adaptive-form/introduction-form-sequence.html)                  |
| AEM 6.5     | This article         |


Adaptive forms let Form Authors create a multi-step data capture experience with great ease. It comes with built-in support for creating multiple panels and associating each panel with different navigation patterns. Form Authors can group form fields in logical sections and represent a group as a panel. The overall navigation between panels is controlled using the panel layout. Authors can choose to arrange panels in different layouts, for example, placing sequentially using the Wizard layout or in an ad-hoc manner using the Tabbed layout. For information about panel layouts, see [Layout capabilities of adaptive forms](../../forms/using/layout-capabilities-adaptive-forms.md).

In a typical form-filling experience, there are more steps involved than just capturing data. A complete form submission can include other steps, like signing the form digitally, verifying the information filled in the form, and processing payments. It differs from case to case.

If your use case mandates a set of steps for data capturing or there are regulations that need certain steps to be followed, AEM Forms provide a way to enforce that common structure across forms. The premeditated implementation of a form structure defines the sequence of steps for a form. ![Example of a multi-step form sequence](assets/formpipeline.png)

Example of a multi-step form sequence

Let's take a use case where you need to create a sequence for fill, verify, sign, and confirmation steps for a form. To create such a sequence, the steps are as follows:

1. Define a form template and add the required panel to it. There should be one panel for each step in the sequence. However, you can include sub-panels inside a panel.

   In this example, the following panels can be added:

    * **Fill**: It contains forms fields for capturing data. Here, you can include nested sub-panels to create sections for different types of information, such as personal, family, and financial.  
    
    * **Verify**: It contains the **Verify** component that can be used in an XFA-based adaptive form. It displays the information captured in the Fill panel in read-only mode for verification.  
    
    * **E-sign**: It contains the **Sign** component that can be used in an XFA-based adaptive form. it provides the following signing services:

        * Adobe Document Cloud eSign services
        * Scribble signature

    * **Confirmation**: It contains the **Summary** component that displays a message confirming the form submission after a user signs the form and reaches the Confirmation (Summary) step in the sequence. Authors can configure the text of the Summary component, show a thank you message, show a link to the generated PDF, and so on.

1. Select the layout of the root panel as **[!UICONTROL Wizard]**.
1. Complete the remaining steps so you can create the form template. See [Creating a custom adaptive form template](../../forms/using/custom-adaptive-forms-templates.md).

After you have defined the form sequence in the form template, you can use it to create forms that have the basic structure defined as the sequence in place. You can always customize the form to suit your requirements.

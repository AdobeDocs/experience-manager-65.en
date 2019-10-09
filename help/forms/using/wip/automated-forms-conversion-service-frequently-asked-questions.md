---
title: "Automated Forms Conversion service: frequently asked questions"
seo-title: "Automated Forms Conversion service: frequently asked questions"
description: null
seo-description: null
uuid: 76057e9c-63e5-415d-b1b5-bd06e8cbf245
discoiquuid: f8766420-a74c-4bbc-95d0-8452fb98663f
---

# Automated Forms Conversion service: frequently asked questions {#automated-forms-conversion-service-frequently-asked-questions}

<!--Theses sections used to be an accordion until converted to straight Markdown. When accordions are enabled, revert-->

**Does the service support all formats of PDF forms? What all languages are supported?**

*   The service can convert non-interactive PDF forms into adaptive forms. It has limited support for AcroForms and XFA-based PDF forms. The service does not support scanned forms.  
    
*   The service converts only English-languag forms to adaptive forms. You can translate converted adaptive forms to another language using AEM translation workflow.

We are regularly adding support for other source types. Keep the [What’s supported](/help/forms/using/wip/aem-forms-automated-forms-conversion-service-beta.md) section on your watchlist for a regular update on newly added features and capabilities.

**Can the service produce an XDP instead of an adaptive form?**

The service does not produce an XDP output for the time being. We are regularly adding features and to the service. Keep the [What’s supported](/help/forms/using/wip/aem-forms-automated-forms-conversion-service-beta.md) section on your watchlist for a regular update on newly added features and capabilities.

**What is the type of generated schema?**

The service generates JSON schema.

**Can the service convert Microsoft Word forms to adaptive forms?**

No, the service does not convert Microsoft Word forms to adaptive forms. You can save a Microsoft Word forms as PDF and convert the PDF to an adaptive form.

**Can the service convert scanned paper forms and colored forms to adaptive forms?**

The service can convert non-interactive PDF forms to adaptive forms. It has limited support for AcroForms and XFA-based PDF forms. Scanned forms and colored forms are not supported for the time being. We are regularly adding features and to the service. Keep the [What’s supported](/help/forms/using/wip/aem-forms-automated-forms-conversion-service-beta.md) section on your watchlist for a regular update on newly added features and capabilities.

**The service has failed to convert forms. What is the reason and how to resolve the issue?**

The most common reasons for the service to fail are:

*   Secured PDF forms are provided for the conversion. Do not use password protected, Document Security protected, or any other protected PDF forms for conversion.
*   Internet connection is interrupted. Ensure that you are connected to the internet during the conversion.
*   Service URL is not provided or provided service URL is incorrect. Specify correct service URL in the cloud configuration.

**Does using custom fonts impact conversion?**

When a non-interactive PDF form is converted to an adaptive form, to improve the quality of conversion, the fonts are embedded in the PDF form. The support for embedding fonts is restricted to non-interactive PDF forms. To optimize the conversion of AcroForm and XFA-based PDF forms, fallback fonts are used.

Only forms available in the custom fonts directory listed in the **Customer fonts directory** field of the **CQ-DAM-Handler-Gibson Font Manager Service** configuration are embedded in non-interactive PDF form.

**Does the service identify and use fonts of source PDF in output adaptive forms?**

Adaptive forms use [themes to style a form](/help/forms/using/themes.md). The service uses the fonts and font styles specified in the theme applied during the conversion. You can change fonts and font styles of the theme to provide a distinct look and feel to the fonts of an adaptive form.

**Some form objects are not converted to adaptive form components. How to resolve the issue?**

Automated Forms Conversion service is trained on a large set of forms. However, there are some fields and styles in PDF forms which are easily visible to the human eye but difficult to understand for the service. The service can fail to identify such fields. You can use the [Review and Correct](/help/forms/using/wip/review-correct-ui-edited.md) editor to help identify missing or incorrectly identified fields. For example, if a choice group is identified as a panel or a text box is not identified. You can use the Review and Correct editor make improvements and regenerate the adaptive form to get an output closer to the desired experience.

**Some corrections are repeated across forms. Can the service identify and fix all such instances in future conversions?**

*   You can share such patterns with Adobe and opt in to the program where you share your forms with Adobe to improve the accuracy of the service. Once you provide the permission, the service is trained on your forms and patterns. It helps improve the accuracy and fix patterns in future conversions.
*   You can also use meta-model to map the form objects to adaptive form component of your choice and pre-configure validations, rules, data patterns, help text, and accessibility properties for the components. All the specified properties are applied during the conversion. For example, one set of your forms provide combo box to select a hospital and other set provides radio buttons to select a hospital. You can use meta-model to decide, after the conversion, all hospital fields are represented as drop-down list component in the adaptive form.

**What are the options for forms with sensitive data like personally identifiable information (PII) information?**

The service supports only blank or unfilled forms. Do not upload filled forms or forms with personally identifiable information (PII) .  

**Where should the header and footers be placed?**

Place header and footer in adaptive forms template. If your form has header and footer, the service detects and replaces these header and footer during the conversion with header and footer available in adaptive form template. If any extra header or footer is included in the adaptive form, you can use the [Review and Correct](/help/forms/using/wip/review-correct-ui-edited.md) editor to fix or remove such header or footer.

**How much time does the service save in comparison to the manual process of planning, creating assets (themes, templates), creating, and publishing an adaptive form?**

The amount of time depends on the size, complexity, and various other factors. In general, in comparison to the manual process of planning, creating assets (themes, templates), and creating an adaptive form, the conversion service has forms ready for deployment in a production environment in almost half time. The service saves approximately 50% of your time in comparison to manual process.

**How to request a new feature or report an issue?**

Contact Adobe Support to request a feature or to report a bug.

During the beta phase, Adobe support can log a JIRA issue on with the following details to report an issue:

JIRA field

Options and Description

Project

*   CQ: Use the CQ  project to report bug or improvements in the conversion service.
*   CQDOC: Use the CQDOC  project to report bug or improvements in the documentation.

Issue Type

*   Bug: Use the Bug issue type when the behavior is not as expected or documented instructions are incorrect.
*   Improvement: Use the Improvement issue type when a key aspect of the feature is missing and should be provided or documented instructions are insufficient to understand or use the feature.

Component  

Forms - Sensei

FixVersion  

AFF 1.0.0 L&lt;xx&gt;, where &lt;xx&gt; is the version number of the [release](https://wiki.corp.adobe.com/pages/viewpage.action?spaceKey=lc&title=Automated+Forms+Conversion+Service+Beta+-+Latest+Builds).

Label  

Flamingo-BETA

Description

Provide the following information in the description field:  

*   Problem statement
*   Steps to reproduce the issue  
*   Actual result of the conversion  
*   Expected result of the conversion  
*   Attach collaterals or provide links to download

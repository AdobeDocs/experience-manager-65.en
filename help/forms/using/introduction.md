---
title: Introduction to HTML5 forms

description: HTML5 forms is a new capability in Adobe Experience Manager 6.0 (AEM 6.0) software that can render XFA form templates in HTML5 format.
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms
docset: aem65
feature: HTML5 Forms
exl-id: 0facca18-ffa1-420c-859a-6f1f2c449d71
solution: Experience Manager, Experience Manager Forms
role: "Admin, User, Developer"
---
# Introduction to HTML5 forms{#introduction-to-html-forms}

HTML5 forms is a new capability in Adobe Experience Manager 6.0 (AEM 6.0) software that can render XFA form templates in HTML5 format. This capability enables the rendering of forms on mobile devices and desktop browsers on which XFA-based PDF is not supported. HTML5 forms not only supports the existing capabilities of XFA form templates but also adds new capabilities, such as scribble signature, for mobile devices.

HTML5 forms generates documents based on standard HTML5 constructs. You can view HTML5 forms in all modern browsers that support HTML5. It does not require installing any additional browser plug-ins for the browsers. For more information about supported browsers, see [Supported client platforms](https://adobe.com/go/learn_aemforms_supportedplatforms_63).

![HTML5 form preview](do-not-localize/mobile_form_on_an_ipad_date_14.png)

## Key capabilities of HTML5 forms {#key-capabilities-of-html-forms-br}

* Renders existing XFA forms in HTML5 supported on all compatible browsers.
* Leverages standard XFA form design capabilities to target forms for mobile devices.
* Uses dynamic XFA capabilities in HTML5 format.
* Uses highly accurate SVG text layout (SVG 1.1) to match with the PDF text layout.
* Provides Support for JavaScript and FormCalc.
* Dynamically assembles fragments into interactive forms based on data-driven events or user input.
* Provides support for custom CSS to match appearance of the forms according to your enterprise standards.
* Enables custom widgets to offer a rich data capture experience.
* Provides support for integration with web apps.

### Multichannel publishing {#multichannel-publishing}

Form developers can use an XFA template to render forms in PDF and HTML5 formats. This capability is beneficial in scenarios where you have a large set of XFA forms that require minimal changes to adapt to HTML5 forms design practices. You can render the existing XFA forms to HTML5 to target various devices where XFA-based PDF is not yet supported.

## Manage HTML5 forms {#manage-html-forms}

AEM also provides a unified view for listing and managing all form templates using AEM Forms UI. You can activate, deactivate, publish, and preview forms. For more information, see [Introduction to managing forms](../../forms/using/introduction-managing-forms.md).

### Forms customization {#forms-customization}

HTML5 forms renders form templates using standard HTML5 constructs. This makes it simple to customize and extend forms in HTML5 format using web technologies, primarily CSS, and JavaScript. You can easily customize the appearance of existing widgets, create your own custom widgets, or use custom styles in forms. For more information about creating custom widgets and customizing existing widgets, see [Plug in custom widgets with HTML5 forms](../../forms/using/custom-widgets.md).

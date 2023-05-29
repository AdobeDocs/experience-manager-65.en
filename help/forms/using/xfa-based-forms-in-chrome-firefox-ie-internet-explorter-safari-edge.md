---
title: Unable to open XFA-based PDF forms in Google Chrome, Firefox, Microsoft&reg; Edge, Microsoft&reg; Internet Explorer, or Apple Safari
description: Unable to open XFA-based PDF forms in Google Chrome, Firefox, Microsoft&reg; Edge, Microsoft&reg; Internet Explorer, or Apple Safari
seo-title: Unable to open XFA-based PDF forms in Google Chrome, Firefox, Microsoft Edge, Microsoft Internet Explorer, or Apple Safari
feature: Adaptive Forms
exl-id: fdd15315-e0d6-4d80-acb4-2e0ecec716c4
---
# Unable to open XFA-based PDF forms in Google Chrome, Firefox, Microsoft&reg; Edge, Microsoft&reg; Internet Explorer, or Apple Safari{#unable-to-open-XFA-based-PDF-forms-in-Google-Chrome-Firefox-Microsoft-Edge-Microsoft-Internet-Explorer-or-Apple-Safari}

Many recent browser versions have included their own limited support for XFA-based PDF forms. Although these browsers can open XFA-based PDF forms, the capabilities provided are limited. If you are not able to open or submit an XFA-based PDF form in a modern browser, use one of the following methods:

* Use [Adobe&reg; Acrobat&reg;](https://www.adobe.com/acrobat.html) or [Adobe&reg; Adobe&reg; Reader&reg;](https://get.adobe.com/reader/), version 8 or later to open and submit XFA-based PDF Forms. 
* Acrobat and Reader, on Microsoft&reg; Windows&reg;, allow you to configure to open PDFs in Protected View mode, which prevents XFA-based PDF forms from opening. Ensure that the Protected View mode in your Acrobat or Reader is disabled. For more information, see [Protected View (Windows only)](https://helpx.adobe.com/in/reader/using/protected-mode-windows.html).
* (For Forms Developers) Adobe Experience Manager Forms also provides support to:

    * [render XFA-based forms into HTML5 Forms](https://experienceleague.adobe.com/docs/experience-manager-65/forms/html5-forms/introduction.html?#key-capabilities-of-html-forms-br) such that the forms can be opened in browsers with HTML5 support, including those browsers running on mobile devices like iPad. The HTML5 rendition of the forms maintains the layout of the form design and supports most form logic (such as JavaScript, form calc, and form validations) embedded in the XFA form template.
    * [convert XFA-based forms to mobile responsive Adaptive Forms](https://experienceleague.adobe.com/docs/experience-manager-65/forms/adaptive-forms-basic-authoring/creating-adaptive-form.html?#create-an-adaptive-form-based-on-an-xfa-form-template). These forms provide a responsive layout, personalization capabilities, and dynamically adapt to user responses by adding or removing fields or sections as required. They also provide out of the box connectors for various data sources, Document of Record capabilities, and easy connection to Adobe Analytics for performance evaluation. For more information, see [Key features and capabilities](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/forms-overview/home.html?lang=en)
This way, your technology investments in XFA forms are protected and continue to provide optimal experience for your end users. For more information, see [Adobe Experience Manager Forms product documentation](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/forms-overview/home.html).

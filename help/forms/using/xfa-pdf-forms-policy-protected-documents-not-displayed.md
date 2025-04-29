---
title: Display issues for XFA-based PDF forms and policy-protected documents
description: Display issues for XFA-based PDF forms and policy-protected documents
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: Security
geptopics: SG_AEMFORMS/categories/jee
role: Admin
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
exl-id: c9beefac-14e9-466c-b5bd-44ffab1fb820
---
# Display issues for XFA-based PDF forms and policy-protected documents

Check for the following reasons if you are not able to open an XFA-based PDF form or a policy-protected document using Adobe LiveCycle Rights Management:

* XFA-based PDF forms and policy-protected documents require Adobe&reg; Acrobat&reg; or Adobe&reg; Reader&reg;, version 8 and later. See [Adobe Downloads](https://www.adobe.com/downloads.html) for downloading the latest Reader or Acrobat.
* Browsers such as Mozilla Firefox and Google Chrome offer a built-in PDF viewer that does not support XFA-based PDF forms. To view XFA-based PDF forms in these browsers, you must configure to open PDFs using Acrobat or Reader. For more information, see XFA-based PDF forms on Mozilla Firefox and Google Chrome.
* Acrobat and Reader, on Microsoft&reg; Windows&reg;, allow you to configure to open PDFs in Protected View mode, which prevents XFA-based PDF forms and policy-protected documents from opening. Ensure that the Protected View mode in your Acrobat or Reader is disabled. For more information, see [Protected View (Windows only)](https://helpx.adobe.com/acrobat/kb/end-of-support-acrobat-x-reader-x.html).
* If you are trying to access XFA-based PDF forms or policy-protected documents on your mobile device, consider the following:

    * Opening policy-protected documents on mobile devices requires Adobe Reader for mobile. For more information, see [Adobe Reader mobile app](https://www.adobe.com/in/acrobat/mobile/acrobat-reader.html).
    * iOS, Android, and Blackberry mobile devices and smartphones do not support the Adobe Reader plug-in with XFA forms. LiveCycle ES4 provides a service that targets mobile devices using HTML5; the form creator must use that service to allow forms to be used on these devices.
    * If you are using the Metro style on a Windows 8 mobile device, change to the Classic view or leverage HTML5 with LiveCycle ES4.

>[!NOTE]
>
>LiveCycle ES4 provides support for rendering XFA-based forms into HTML5 such that the forms can be opened in browsers with HTML5 support, including those running on mobile devices like iPad. The HTML5 rendition of the forms maintains the layout of the form design and supports most form logic (such as JavaScript, form calc, and form validations) embedded in the XFA form template. This way, your technology investments in XFA forms are easily carried over to the devices where running the Adobe Reader plugin is not feasible. 
>For more information, see Upgrading to [LiveCycle product documentation](https://business.adobe.com/products/experience-manager/forms/aem-forms.html).

[Legal Notices](https://chl-author-preview.corp.adobe.com/content/help/en/legal/legal-notices.html)    |    [Online Privacy Policy](https://www.adobe.com/privacy.html)

---
title: How to open XFA-based PDF forms on Firefox and Chrome
description: How to open XFA-based PDF forms on Firefox and Chrome
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: Security
geptopics: SG_AEMFORMS/categories/jee
role: Admin
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
exl-id: b084c705-41d6-4dd5-ac37-c23600250336
---
# How to open XFA-based PDF forms on Firefox and Chrome

## Issue

The built-in PDF viewer introduced with Mozilla Firefox and Google Chrome do not support XFA-based PDF forms. Therefore, XFA-based PDF forms do not open in later versions of Firefox and Chrome.

## Solution

To use XFA-based PDF forms on Firefox and Chrome, perform the following steps to configure Firefox and Chrome to open PDFs using Adobe Reader or Adobe Acrobat.

>[!NOTE] 
> 
> Ensure that you have Adobe Reader or Adobe Acrobat installed on your machine.

### Configure Firefox

1. In Firefox, choose **Tools > Options**.

1. In the Options dialog, click **Applications**.

1. In the Applications tab, type PDF in the search field. 

1. For Portable Document Format (PDF) content type in the search result, select **Use Adobe Acrobat (in Firefox)** from the Action drop-down list.
    ![use-adobe-acrobat](/help/forms/using/assets/use-adobe-acrobat.png)
1. Click OK.

1. Restart Firefox.

### Configure Chrome

1. In Chrome, go to chrome://plugins/.

1. Click Disable under Chrome PDF Viewer, and click Enable under Adobe PDF Plug-In.
    ![chrome-pdf-viewer](/help/forms/using/assets/chrome-image.png)
For more information, see [Adobe PDF plug-in](https://support.google.com/chrome/?hl=en&visit_id=638803785294106945-2276548125&rd=4&topic=3421431#topic=7439538) documentation by Google.

>[!NOTE] 
> 
> LiveCycle ES4 provides support for rendering XFA-based forms into HTML5 such that the forms can be opened in browsers with HTML5 support, including those running on mobile devices like iPad. The HTML5 rendition of the forms maintains the layout of the form design and supports most form logic (such as JavaScript, form calc, and form validations) embedded in the XFA form template. This way, your technology investments in XFA forms are carried over easily to devices where running of the Adobe Reader plugin is not feasible.
>For more information, see [LiveCycle product documentation](https://business.adobe.com/products/experience-manager/forms/aem-forms.html).

[Legal Notices](https://chl-author-preview.corp.adobe.com/content/help/en/legal/legal-notices.html)    |    [Online Privacy Policy](https://www.adobe.com/privacy.html)
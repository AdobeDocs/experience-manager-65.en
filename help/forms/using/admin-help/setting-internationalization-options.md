---
title: Setting internationalization options
description: Learn how to specify the locale used to render forms and how to specify the character set used to encode the output stream.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_forms
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 6cf82c2b-29f0-49d5-a138-99d7801d5a28
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Setting internationalization options{#setting-internationalization-options}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

## Specify the locale used to render forms {#specify-the-locale-used-to-render-forms}

You can specify the locale used when rendering a PDF form. The fields on a PDF form use the specified locale to display data. For example, if the locale is set to German, the form uses German decimal separators for numeric values. The locale is also used to send validation messages to client devices, such as web browsers, as part of HTML transformations.

1. In administration console, click Services &gt; Forms.
1. Under Internationalization, in the Language list, select the locale used to render a form. The default value is English (United States).
1. Click Save.

## Specify the character set used to encode the output stream {#specify-the-character-set-used-to-encode-the-output-stream}

1. Under Internationalization, in the Character Set list, select a character set. This setting is dependent on the API used, either renderHTMLForm or renderPDFForm. To specify a character set other than those listed, select Custom and specify an encoding value in the box that is displayed.

   For HTML transformations, AEM forms supports character encoding values defined by the `java.nio.charset` package. If sFormPreference is PDFForm, only specific character sets are supported. The character set must be a valid canonical name. The default value is ISO-8859-1.

1. Click Save.

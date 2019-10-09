---
title: Setting internationalization options
seo-title: Setting internationalization options
description: Learn how to specify the locale used to render forms and how to specify the character set used to encode the output stream.
seo-description: Learn how to specify the locale used to render forms and how to specify the character set used to encode the output stream.
uuid: bb77f5f3-634f-4285-9b10-c4dd40085e69
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_forms
products: SG_EXPERIENCEMANAGER/6.4/FORMS
discoiquuid: e845d13f-bef2-442d-af9a-4f92d7616a46
---

# Setting internationalization options{#setting-internationalization-options}

## Specify the locale used to render forms {#specify-the-locale-used-to-render-forms}

You can specify the locale used when rendering a PDF form. The fields on a PDF form use the specified locale to display data. For example, if the locale is set to German, the form uses German decimal separators for numeric values. The locale is also used to send validation messages to client devices, such as web browsers, as part of HTML transformations.

1. In administration console, click Services &gt; Forms.
1. Under Internationalization, in the Language list, select the locale used to render a form. The default value is English (United States).
1. Click Save.

## Specify the character set used to encode the output stream {#specify-the-character-set-used-to-encode-the-output-stream}

1. Under Internationalization, in the Character Set list, select a character set. This setting is dependent on the API used, either renderHTMLForm or renderPDFForm. To specify a character set other than those listed, select Custom and specify an encoding value in the box that is displayed.

   For HTML transformations, AEM forms supports character encoding values defined by the `java.nio.charset` package. If sFormPreference is PDFForm, only specific character sets are supported. The character set must be a valid canonical name. The default value is ISO-8859-1.

1. Click Save.


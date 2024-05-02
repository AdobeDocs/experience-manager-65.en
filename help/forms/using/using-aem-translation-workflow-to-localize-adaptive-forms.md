---
title: Using AEM translation workflow to localize adaptive forms and document of record

description: Learn to use AEM translation workflows to localize adaptive forms and document of record.


content-type: reference
topic-tags: develop

noindex: true
feature: Adaptive Forms, Foundation Components
exl-id: ebec03a3-67a0-4ecd-84bb-8580388e048a
solution: Experience Manager, Experience Manager Forms
role: "User, Developer"
---
# Using AEM translation workflow to localize adaptive forms and document of record {#using-aem-translation-workflow-to-localize-adaptive-forms-and-document-of-record}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

Localized forms help you serve a wider audience across geographies. Adobe Experience Manager translation workflow helps you localize adaptive forms and their documents of record . You can use **machine translation** or **human translators** to localize an adaptive form.

This article explains the process to use AEM translation workflow with adaptive forms and documents of record.

## Localizing an adaptive form and document of record using machine translation {#localizing-an-adaptive-form-and-document-of-record-using-machine-translation}

The machine translation service immediately translates your content in adaptive form and document of record. AEM Forms is pre-configured to use a trial version of Microsoft Translator for machine translation. Perform the following steps to enable machine translation for your adaptive forms and document of record:

1. On the AEM Forms UI, select a form, and select the **Add Dictionary** option.
1. In **Add Dictionary to Translation Project** screen, select the **Create a new translation project** or **Add to an existing translation project** option.
1. In the **Project Title** field, specify the title. For example, `Government Reference Site - German locale.`
1. In the **Target Languages** field, specify a locale (For example, `German(de)`), and click **Done**. You can specify multiple locales. The form is translated to all the locales specified in the **Target Languages** field.
1. In the Dictionary Added dialog box, click **Open Projects**. In the Projects screen, open the newly created project.
1. Click the **ellipses** at the bottom of the **Translation Summary** tile. The Translation Summary screen opens.
1. Click the **Edit** icon at the top of the **Translation Summary** screen. Open the **Translation** tab and select Machine Translation in the **Translation Method** screen. Select the appropriate **Translation Provider** and **Cloud Configuration**. Click the **Done** icon at the top of the screen.
1. On the **Translation Job** tile, click the ![aem62forms_downarrow](assets/aem62forms_downarrow.png) icon, and click **Start**. The status of the tile changes to Draft. On completion of the translation, the status changes to **Ready for review**. Refresh the page after a few minutes and verify the status.
1. After the status changes to **Ready for review** on the **Translation Job** tile, open the form in a browser window. A localized version of the form is displayed.

   >[!NOTE]
   >
   >* Before opening the localized version of form in the browser window, ensure that the locale of the browser is set to match the locale of the form. For example, if the form is translated to German(de) language then set the locale of the browser to German(de).
   >* Adaptive form components do not support right to left (RTL) languages. For example, Hebrew.

   Along with the Adaptive form, the auto-generated document of record is also localized.

   For more information on Document of Record settings and configuration, see:

   [Document of Record Template Configuration](/help/forms/using/generate-document-of-record-for-non-xfa-based-adaptive-forms.md#p-document-of-record-template-configuration-p)

   [Document of Record settings](/help/forms/using/generate-document-of-record-for-non-xfa-based-adaptive-forms.md#p-document-of-record-settings-p)

1. [Customize the branding information of the document of record](/help/forms/using/generate-document-of-record-for-non-xfa-based-adaptive-forms.md) and ensure that the browser locale is set to the same language to which you have localized the Adaptive Form using machine language. The browser locale helps localize the branding information in the document of record.
1. To view the localized document of record, select Generate Preview. The document of record PDF is generated and opened in a new tab in your browser.

## Localizing an adaptive form and its document of record using Human Translation {#localizing-an-adaptive-form-and-its-document-of-record-using-human-translation}

In Human translation the content is sent to a translation provider and translated by professional translators. When complete, the translated content is returned and imported into AEM. When your translation provider is integrated with AEM, content is automatically sent between AEM and the translation provider.

For translation, a dictionary containing files in XLIFF format is shared with the professional translators. The dictionary includes a separate XLIFF file for each locale. Each XLIFF file contains text that will be displayed to the end users and placeholders for the corresponding localized text.

Perform the following steps to localize a form and its document of record using Human Translators:

1. [Connect AEM with your translation service provider](/help/sites-administering/tc-tic.md) and [create translation integration framework configurations](/help/sites-administering/tc-tic.md).

1. [Associate the pages of your language master](/help/sites-administering/tc-tic.md) with the translation service and framework configurations.

1. [Identify the type of content](/help/sites-administering/tc-rules.md) to translate.

1. [Prepare the content for translation](/help/sites-administering/tc-prep.md) by authoring the language master and creating the root pages of language copies.

1. [Create translation projects](/help/sites-administering/tc-manage.md) to gather the content to translate and to prepare the translation process.

1. Use the translation projects to [manage the content translation process](/help/sites-administering/tc-manage.md).

>[!NOTE]
>
>* Adaptive form components do not support right to left (RTL) languages. For example, Hebrew.
>

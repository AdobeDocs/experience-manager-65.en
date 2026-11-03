---
title: Translating Content for Multilingual Sites
description: Learn how to translate content for multilingual sites.
contentOwner: Guillaume Carlino
feature: Language Copy
exl-id: 6ccfe612-8cfd-4ca2-ad01-8e4af36d44fa
solution: Experience Manager, Experience Manager Sites
role: Admin
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: c45915cf-e157-4af7-a80d-97b905bcb3a5
    internal-label: Experience Manager Sites
feature_v2:
  - id: d9d38edd-df1b-480c-8f5e-72b62576f390
    internal-label: Site and page features
subfeature_v2:
  - id: e15a4109-ae5d-497d-b301-31149e35aed4
    internal-label: Language Copy Wizard
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
---
# Translating Content for Multilingual Sites {#translating-content-for-multilingual-sites}

Automate the translation of page content, assets, and user-generated content to create and maintain multilingual websites. To automate translation workflows, you integrate translation service providers with AEM and create projects for translating content into multiple languages. AEM supports human and machine translation workflows.

* Human translation: Content is sent to your translation provider and translated by professional translators. When complete, the translated content is returned and imported into AEM. When your translation provider is integrated with AEM, content is automatically sent between AEM and the translation provider.
* Machine translation: The machine translation service immediately translates your content.

Translating content involves the following steps:

1. [Connect AEM with your translation service provider](/help/sites-administering/tc-tic.md#connecting-to-a-translation-service-provider) and [create translation integration framework configurations](/help/sites-administering/tc-tic.md).
1. [Associate the pages of your language master](/help/sites-administering/tc-tic.md#configuring-pages-for-translation) with the translation service and framework configurations.
1. [Identify the type of content](/help/sites-administering/tc-rules.md) to translate.
1. [Prepare the content for translation](/help/sites-administering/tc-prep.md) by authoring the language master and creating the root pages of language copies.
1. [Create translation projects](/help/sites-administering/tc-manage.md) to gather the content to translate and to prepare the translation process.
1. Use the translation projects to [manage the content translation process](/help/sites-administering/tc-manage.md).

If your translation service provider does not provide a connector to integration with AEM, AEM supports the manual extraction and re-insertion of translation content in XML format.

>[!NOTE]
>
>Your user needs to be a member of the projects-administrators group to use the Language Copy features.

## Best Practices {#best-practices}

The [Translation Best Practices](/help/sites-administering/tc-bp.md) page contains important information regarding your implementation.

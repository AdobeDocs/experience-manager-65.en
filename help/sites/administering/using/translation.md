---
title: Translating Content for Multilingual Sites
seo-title: Translating Content for Multilingual Sites
description: Learn how to translate content for multilingual sites.
seo-description: Learn how to translate content for multilingual sites.
uuid: bc647cc2-8e21-451d-8738-05e2e1135454
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: site-features
content-type: reference
discoiquuid: 3ef02371-9bad-4589-8f16-1723fbbc92d0
legacypath: /content/docs/en/aem/6-0/administer/integration/third-party-services/machine-translation
index: y
internal: n
snippet: y
---

# Translating Content for Multilingual Sites{#translating-content-for-multilingual-sites}

Automate the translation of page content, assets, and user-generated content to create and maintain multilingual websites. To automate translation workflows, you integrate translation service providers with AEM and create projects for translating content into multiple languages. AEM supports human and machine translation workflows.

* Human translation: Content is sent to your translation provider and translated by professional translators. When complete, the translated content is returned and imported into AEM. When your translation provider is integrated with AEM, content is automatically sent between AEM and the translation provider. 
* Machine translation: The machine translation service immediately translates your content.

Translating content involves the following steps:

1. [Connect AEM with your translation service provider](/sites/administering/using/tc-tic.md#connecting-to-a-translation-service-provider) and [create translation integration framework configurations](/sites/administering/using/tc-tic.md). 

1. [Associate the pages of your language master](/sites/administering/using/tc-tic.md#configuring-pages-for-translation) with the translation service and framework configurations.
1. [Identify the type of content](/sites/administering/using/tc-rules.md) to translate.
1. [Prepare the content for translation](/sites/administering/using/tc-prep.md) by authoring the language master and creating the root pages of language copies.
1. [Create translation projects](/sites/administering/using/tc-manage.md#main-pars_title_4) to gather the content to translate and to prepare the translation process.
1. Use the translation projects to [manage the content translation process](/sites/administering/using/tc-manage.md).

If your translation service provider does not provide a connector to integration with AEM, AEM supports the manual extraction and re-insertion of translation content in XML format.

>[!NOTE]
>
>Your user needs to be a member of the project-administrators group to use the Language Copy features.

## Best Practices {#best-practices}

The [Translation Best Practices](/sites/administering/using/tc-bp.md) page contains important information regarding your implementation.

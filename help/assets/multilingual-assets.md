---
title: Multilingual asset
description: Learn how to automate workflows for translating assets, including binaries, metadata, and tags into multiple languages.
contentOwner: AG
feature: Asset Management
role: Admin
exl-id: edccf23c-087e-4253-babb-dd4c6610517d
hide: true
solution: Experience Manager, Experience Manager Assets
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: d09181b5-a36a-43de-ba01-36641440bc43
    internal-label: Experience Manager Assets
feature_v2:
  - id: 7d2b2ec8-499c-5434-9ffd-9218cd71f683
    internal-label: Asset Management
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
---
# Multilingual assets {#multilingual-assets}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service  |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/assets/admin/translate-assets.html?lang=en)                  |
| AEM 6.5     | This article         |

[!DNL Adobe Experience Manager Assets] lets you automate translation workflows on assets (including binaries, metadata, and tags) to generate assets in other languages for use in multilingual projects.

To automate translation workflows, you integrate translation service providers with [!DNL Experience Manager] and create projects for translating assets into multiple languages. [!DNL Experience Manager] supports human and machine translation workflows.

Human translation: The translated assets are returned and imported into [!DNL Experience Manager]. When your translation provider is integrated with [!DNL Experience Manager], assets are automatically sent between [!DNL Experience Manager] and the translation provider.

Machine translation: The machine translation service immediately translates the metadata and tags for assets.

Translating assets includes the following:

1. [Connect Experience Manager with the translation service provider](/help/sites-administering/tc-tic.md#connecting-to-a-translation-service-provider)
1. [Create translation integration framework configurations](/help/sites-administering/tc-tic.md)
1. [Prepare assets for translation](preparing-assets-for-translation.md)
1. [Apply translation cloud services to folders](transition-cloud-services.md)
1. [Create translation projects](translation-projects.md)

If your translation service provider does not provide a connector to integrate with [!DNL Experience Manager], use an [alternative process](/help/sites-administering/tc-manage.md#exporting-a-translation-job).

Also see, [Create translation projects for content fragments](creating-translation-projects-for-content-fragments.md).

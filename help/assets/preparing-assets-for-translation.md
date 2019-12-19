---
title: Preparing assets for translation
description: Create language root folders to prepare for translating multilingual assets.
uuid: 8a146234-60c0-4ee6-8f54-1275c887be23
contentOwner: AG
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
discoiquuid: 61f86320-71a6-4d3c-839d-155a2083d995

---

# Prepare assets for translation {#preparing-assets-for-translation}

Multilingual assets means assets with binaries, metadata, and tags in multiple languages. Generally, binaries, metadata, and tags for assets exist in one language, which are then translated to other languages for use in multilingual projects.

In Adobe Experience Manager (AEM) Assets, multilingual assets are included in folders, where each folder contains the assets in a different language.

Each language folder is called a language copy. The root folder of a language copy, known as the language root, identifies the language of the content in the language copy. For example, */content/dam/it* is the Italian language root for the Italian language copy. Language copies must use a [correctly-configured language root](preparing-assets-for-translation.md#creating-a-language-root) so that the correct language is targeted when translations of source assets are performed.

The language copy for which you originally add assets is the language master. The language master is the source that is translated into other languages. A sample folder hierarchy includes several language roots:

    /content
    &nbsp; &nbsp; /- dam
    &nbsp; &nbsp; &nbsp; |- en
    &nbsp; &nbsp; &nbsp; |- fr
    &nbsp; &nbsp; &nbsp; |- de
    &nbsp; &nbsp; &nbsp; |- es
    &nbsp; &nbsp; &nbsp; |- it
    &nbsp; &nbsp; &nbsp; |- ja
    &nbsp; &nbsp; &nbsp; |- zh

Perform the following steps to prepare your assets for translation:

1. Create the language root of your language master. For example, the language root of the English language copy in the sample folder hierarchy is `/content/dam/en`. Ensure that the language root is correctly configured according to the information in [Create a Language Root](preparing-assets-for-translation.md#creating-a-language-root).

1. Add assets to your language master.
1. Create the language root of each target language for which you require a language copy.

## Creating a Language Root {#creating-a-language-root}

To create the language root, you create a folder and use an ISO language code as the value for the Name property. After you create the language root, you can create a language copy at any level within the language root.

For example, the root page of the Italian language copy of the sample hierarchy has `it` as the Name property. The Name property is used as the name of the asset node in the repository, and therefore determines the path of the assets. (`https://[aem_server]:[port]/assets.html/content/dam/it/`).

1. From the Assets console, click/tap **[!UICONTROL Create]** and choose **[!UICONTROL Folder]** from the menu.

   ![chlimage_1-120](assets/chlimage_1-120.png)

1. In the **[!UICONTROL Name]** field type the country code in the format of `<language-code>`.

   ![chlimage_1-121](assets/chlimage_1-121.png)

1. Click or tap **[!UICONTROL Create]**. The language root is created in the Assets console.

## Viewing Language Roots {#viewing-language-roots}

AEM interface provides a **[!UICONTROL References]** panel that displays a list of language roots that have been created within AEM Assets.

1. In the Assets console, select the language master for which you want to create language copies.
1. Click or tap the GlobalNav icon, and choose **[!UICONTROL References]** to open the [!UICONTROL Reference] pane.

   ![chlimage_1-122](assets/chlimage_1-122.png)

1. In the References pane, click or tap **[!UICONTROL Language Copies]**. The [!UICONTROL Language Copies] panel shows the language copies of the assets.

   ![chlimage_1-123](assets/chlimage_1-123.png)

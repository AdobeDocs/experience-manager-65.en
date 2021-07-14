---
title: Variations - Authoring Fragment Content
seo-title: Variations - Authoring Fragment Content
description: Variations allow you to author content for the fragment, then create variations of that content according to purpose (if required).
seo-description: Variations allow you to author content for the fragment, then create variations of that content according to purpose (if required).
uuid: 0844f271-79bc-4f76-8031-d388b81d6feb
contentOwner: Alison Heimoz
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: content-fragments
content-type: reference
discoiquuid: 324df1da-78fa-460f-a744-3504259f1d4a
docset: aem65

feature: Content Fragments
role: User, Admin
exl-id: ded05f24-ab5c-4195-b5c4-704a9fd93c7e
---
# Variations - Authoring Fragment Content{#variations-authoring-fragment-content}

[Variations](/help/assets/content-fragments/content-fragments.md#constituent-parts-of-a-content-fragment) are a significant feature of content fragments, as they allow you to create and edit copies of the master content for use on specific channels, and/or scenarios.

From the **Variations** tab you can:

* [Enter the content](#authoring-your-content) for your fragment
* [Create and manage variations](#managing-variations) of the **Master** content

Perform a range of other actions depending on the data-type being edited; for example:

* [Insert visual assets into your fragment](#inserting-assets-into-your-fragment) (images)
* Select between [Rich Text](#rich-text), [Plain Text](#plain-text) and [Markdown](#markdown) for editing

* [Upload Content](#uploading-content)

* [View key statistics](#viewing-key-statistics) (about multi-line text)
* [Summarize Text](#summarizing-text)

* [Synchronize variations with Master content](#synchronizing-with-master)

>[!CAUTION]
>
>After a fragment has been published and/or referenced, AEM will display a warning when an author opens the fragment for editing again. This is to warn that changes to the fragment will affect the referenced pages as well.

## Authoring your Content {#authoring-your-content}

When you open your content fragment for editing, the **Variations** tab will be open by default. Here you can author the content, for Master or any variations you have. You can:

* make edits directly in the **Variations** tab
* open the [full-screen editor](#full-screen-editor) to:

    * select the [Format](#formats)
    * see more editing options (for [Rich Text](#rich-text) format)

    * access a range of [actions](#actions)

For example:

* Editing a simple fragment

  A simple fragment consists of one multi-line text field (visual assets can be added from the full-screen editor).

  ![cfm-6420-21](assets/cfm-6420-21.png)

* Editing a fragment with structured content

  A structured fragment contains various fields, of various data-types, that were defined in the content model. For any multi-line fields the [full-screen editor](#full-screen-editor) is available.

  ![cfm-6420-16](assets/cfm-6420-16.png)

### Full-Screen Editor {#full-screen-editor}

When editing a multi-line text field you can open the full-screen editor:

![cf-fullscreeneditor-icon](assets/cf-fullscreeneditor-icon.png)

The full-screen editor provides:

* Access to various [actions](#actions)
* Depending on the [format](#formats), additional formatting options ([Rich Text](#rich-text))

### Actions {#actions}

The following actions are also available (for all the [formats](#formats)) when the full-screen editor (i.e. multi-line text) is open:

* Select the [format](#formats) ([Rich Text](#rich-text), [Plain Text,](#plain-text) [Markdown](#markdown))

* [Show Text Statistics](#viewing-key-statistics)

* [Upload content](#uploading-content)
* [Synchronize with Master](#synchronizing-with-master) (when editing a variation)
* [Summarize Text](#summarizing-text)
* [Annotate](/help/assets/content-fragments/content-fragments-variations.md#annotating-a-content-fragment) your text

* [Insert visual assets into your fragment](#inserting-assets-into-your-fragment) (images)

### Formats {#formats}

The options for editing multi-line text depend on the format selected:

* [Rich Text](#rich-text)
* [Plain Text](#plain-text)
* [Markdown](#markdown)

The format can be selected when the full-screen editor.

### Rich Text {#rich-text}

Rich text editing allows you to format:

* Bold
* Italic
* Underline
* Alignment: left, center, right
* Bulleted list
* Numbered list
* Indentation: increase, decrease
* Create/Break hyperlinks
* Open the full-screen editor, where the following formatting options are available:

    * Paste Text/from Word
    * Insert a table
    * Paragraph style: Paragraph, Heading 1/2/3
    * [Insert visual assets](#inserting-assets-into-your-fragment)
    * Search
    * Find/Replace
    * Spellchecker
    * [Annotations](/help/assets/content-fragments/content-fragments-variations.md#annotating-a-content-fragment)

The [actions](#actions) are also accessible from the full-screen editor.

### Plain Text {#plain-text}

Plain Text allows for rapid entry of content without formatting or markdown information. You can also open the full-screen editor for further [actions](#actions).

>[!CAUTION]
>
>If you select **Plain Text** you might lose any formatting, markdown and/or assets that you have inserted in either **Rich Text** or **Markdown**.

### Markdown {#markdown}

>[!NOTE]
>
>For full information see the [Markdown](/help/assets/content-fragments/content-fragments-markdown.md) documentation.

This allows you to format your text using markdown. You can define:

* Headings
* Paragraphs and Line Breaks
* Links
* Images
* Block Quotes
* Lists
* Emphasis
* Code Blocks
* Backslash Escapes

You can also open the full-screen editor for further [actions](#actions).

>[!CAUTION]
>
>If you switch between **Rich Text** and **Markdown** you might experience unexpected effects with Block Quotes and Code Blocks, as these two formats can have differences in how they are handled.

### Viewing Key Statistics {#viewing-key-statistics}

When the full-screen editor is open, the action **Text Statistics** will display a range of information about the text. For example:

![cfx-6420-22](assets/cfx-6420-22.png)

### Uploading Content {#uploading-content}

To ease the process of authoring content fragments you can upload text, prepared in an external editor, and add it directly to the fragment.

### Summarizing Text {#summarizing-text}

Summarizing text is designed to help users reduce the length of their text to a predefined number of words, while keeping the key points and overall meaning.

>[!NOTE]
>
>On a more technical level the system keeps the sentences which it rates as providing the *best ratio of information density and uniqueness* according to specific algorithms.

>[!CAUTION]
>
>The content fragment must have a valid language (ISO code) folder as an ancestor; this is used to determine the language model to be used.
>
>For example, `en/` as in the following path:
>
>`/content/dam/my-brand/en/path-down/my-content-fragment`

>[!CAUTION]
>
>English is available out-of-the-box.
>
>Other languages are available as Language Model Packages from Software Distribution:
>
>* [French (fr) from Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq630/product/smartcontent-model-fr)
>* [German (de) from Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq630/product/smartcontent-model-de)
>* [Italian (it) from Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq630/product/smartcontent-model-it)
>* [Spanish (es) from Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq630/product/smartcontent-model-es)
>

1. Select **Master** or the required variation.
1. Open the full-screen editor.

1. Select **Summarize text** from the toolbar.

   ![cf-17](assets/cf-17.png)

1. Specify the target number of words and select **Start**:
1. The original text is displayed side-by-side with the proposed summarization:

    * Any sentences to be eliminated are highlighted in red, with strike-through.
    * Click on any highlighted sentence to keep it in the summarized content.
    * Click on any non-highlighted sentence to have it eliminated.

   ![cfm-6420-23](assets/cfm-6420-23.png)

1. Select **Summarize** to confirm the changes.

### Annotating a Content Fragment {#annotating-a-content-fragment}

To annotate a fragment:

1. Select **Master** or the required variation.
1. Open the full-screen editor.
1. Select some text. The **Annotate** icon becomes available.

   ![cfm-6420-24](assets/cfm-6420-24.png)

1. A dialog will open. Here you can enter your annotation.

1. Close the full-screen editor and **Save** the fragment.

### Viewing, Editing, Deleting Annotations {#viewing-editing-deleting-annotations}

Annotations:

* Are indicated by the highlight on the text, in both full-screen and normal mode of the editor. Full details of an annotation can then be viewed, edited, and/or deleted, by clicking on the highlighted text, which will re-open the dialog.

  >[!NOTE]
  >
  >A drop-down selector is provided if multiple annotations have been applied to one piece of text.

* When you delete the entire text to which the annotation was applied, the annotation is deleted as well.

* Can be listed, and deleted, by selecting the **Annotations** tab in the fragment editor.

  ![cfm-6420-25](assets/cfm-6420-25.png)

* Can be viewed, and deleted, in [Timeline](/help/assets/content-fragments/content-fragments-managing.md#timeline-for-content-fragments) for the selected fragment.

### Inserting Assets into your Fragment {#inserting-assets-into-your-fragment}

To ease the process of authoring content fragments you can add [Assets](/help/assets/manage-assets.md) (images) directly to the fragment.

They will be added to the paragraph sequence of the fragment without any formatting; formatting can be done when the [fragment is used/referenced on a page](/help/sites-authoring/content-fragments.md).

>[!CAUTION]
>
>These assets cannot be moved or deleted on a referencing page, this must be done in the fragment editor.
>
>However, formatting of the asset (e.g. size) must be done in the [page editor](/help/sites-authoring/content-fragments.md). The representation of the asset in the fragment editor is purely for authoring the content flow.

>[!NOTE]
>
>There are various methods of adding [images](/help/assets/content-fragments/content-fragments.md#fragments-with-visual-assets) to the fragment and/or page.

1. Position the cursor at the position you want to add the image.
1. Use the **Insert Asset** icon to open the search dialog.

   ![cf-insertasset-icon](assets/cf-insertasset-icon.png)

1. In the dialog you can either:

    * navigate to the required asset in DAM
    * search for the asset in DAM

   Once located, select the required asset by clicking on the thumbnail.

1. Use **Select** to add the asset to the paragraph system of your content fragment at the current location.

   >[!CAUTION]
   >
   >If, after adding an asset, you change format to:
   >
   >* **Plain Text**: the asset will be completely lost from the fragment.
   >* **Markdown**: the asset will not be visible, but will still be there when you return to **Rich Text**.

## Managing Variations {#managing-variations}

### Creating a Variation {#creating-a-variation}

Variations allow you to take the **Master** content and vary it according to purpose (if required).

To create a new variation:

1. Open your fragment and ensure that the side panel is visible.
1. Select **Variations** from the icon bar in the side panel.
1. Select **Create Variation**.
1. A dialog will open, specify the **Title** and **Description** for the new variation.
1. Select **Add**; the fragment **Master** will be copied to the new variation, which is now open for [editing](#editing-a-variation).

   >[!NOTE]
   >
   >When creating a new variation it is always **Master** that is copied, not the variation that is currently open.

### Editing a Variation {#editing-a-variation}

You can make changes to the variation content after either:

* [Creating your variation](#creating-a-variation).
* Opening an existing fragment, then selecting the required variation from the side panel.

![cfm-6420-26](assets/cfm-6420-26.png)

### Renaming a Variation {#renaming-a-variation}

To rename an existing variation:

1. Open your fragment and select **Variations** from the side panel.
1. Select the required variation.
1. Select **Rename** from the **Actions** drop down.

1. Enter the new **Title** and/or **Description** in the resulting dialog box.

1. Confirm the **Rename** action.

>[!NOTE]
>
>This only affects the variation **Title**.

### Deleting a Variation {#deleting-a-variation}

To delete an existing variation:

1. Open your fragment and select **Variations** from the side panel.
1. Select the required variation.
1. Select **Delete** from the **Actions** drop down.

1. Confirm the **Delete** action in the dialog.

>[!NOTE]
>
>You cannot delete **Master**.

### Synchronizing with Master {#synchronizing-with-master}

**Master** is an integral part of a content fragment and by definition it holds the master copy of the content, whereas the variations hold the individual updated and tailored versions of that content. When Master is updated it is possible that these changes are also relevent to the variations and, therefore, need to be propagated to them..

When editing a variation you have access to the action for synchronizing the current element of the variation with Master. This allows you to automatically copy changes made to Master to the required variation.

>[!CAUTION]
>
>Synchronization is only available to copy changes *from **Master** to the variation*.
>
>Only the current element of the variation will be synchronized.
>
>Synchronization only works on the **Multi line text** data-type.
>
>Transferring changes *from a variation to **Master*** is not available as an option.

1. Open your content fragment in the fragment editor. Ensure that the **Master** has been edited.
1. Select a specific variation, then the appropriate synchronization action from either:

    * the **Actions** drop down selector - **Sync current element with master**

    * the toolbar of the full-screen editor - **Sync with master**

1. Master and the variation will be shown side-by-side:

    * green indicates content added (to the variation)
    * red indicates content removed (from the variation)

   ![cfm-6420-27](assets/cfm-6420-27.png)

1. Select **Synchronize**, the variation will updated and shown.

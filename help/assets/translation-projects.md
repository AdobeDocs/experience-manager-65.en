---
title: Create translation projects
description: Learn how to create translation projects in [!DNL Adobe Experience Manager].
contentOwner: AG
role: Developer, Admin
feature: Translation
exl-id: 8990feca-cfda-4974-915e-27aa9d8f2ee1
solution: Experience Manager, Experience Manager Assets
---
# Create translation projects {#creating-translation-projects}

To create a language copy, trigger one of the following language copy workflows available under the References rail in the [!DNL Experience Manager] user interface.

* **Create and translate**: In this workflow, assets to be translated are copied to the language root of the language to which you want to translate. In addition, depending upon the options you choose, a translation project is created for the assets in the Projects console. Depending on the settings, the translation project can be started manually or allowed to run automatically as soon as the translation project is created.

* **Update language copies**: Run this workflow to translate an additional group of assets and include it in a language copy for a particular locale. In this case, the translated assets are added to the target folder that already contains previously translated assets.

>[!PREREQUISITES]
>
>* Users who create translation projects are members of the group `projects-administrators`.
>* Translation service provider supports the translation of binaries.

## Create and translate workflow {#create-and-translate-workflow}

You use the create and translate workflow to generate language copies for a particular language for the first time. The workflow provides the following options:

* Create structure only.
* Create a translation project.
* Add to existing translation project.

### Create structure only {#create-structure-only}

Use the **[!UICONTROL Create structure only]** option to create a target folder hierarchy within the target language root to match the hierarchy of the source folder within the source language root. In this case, source assets are copied to the destination folder. However, no translation project is generated.

1. In the [!DNL Assets] interface, select the source folder for which you want to create a structure in the target language root.

1. Open the **[!UICONTROL References]** pane and click **[!UICONTROL Language Copies]** under **[!UICONTROL Copies]**.

   ![Language copies](assets/translation-language-copies.png)

1. Click **[!UICONTROL Create & Translate]**. From the **[!UICONTROL Target Languages]** list, select the language for which you want to create a folder structure.

1. From the **[!UICONTROL Project]** list, choose **[!UICONTROL Create structure only]**.

1. Click **[!UICONTROL Create]**. The new structure for the target language is listed under **[!UICONTROL Language Copies]**.

   ![language copies](assets/lang-copy2.png)

1. Click the structure from the list, and then click **[!UICONTROL Reveal in Assets]** to navigate to the folder structure within the target language.

   ![reveal-in-assets](assets/reveal-in-assets.png)

### Create a translation project {#create-a-new-translation-project}

If you use this option, assets to be translated are copied to the language root of the language to which you want to translate. Depending upon the options you choose, a translation project is created for the assets in the Projects console. Depending on the settings, the translation project can be started manually or runs automatically as soon as the translation project is created.

1. In the [!DNL Assets] user interface, select the source folder for which you want to create a Language copy.
1. Open the **[!UICONTROL References]** pane and click **[!UICONTROL Language Copies]** under **[!UICONTROL Copies]**.

   ![chlimage_1-63](assets/chlimage_1-63.png)

1. Click **[!UICONTROL Create & Translate]** at the bottom.

1. From the **[!UICONTROL Target Languages]** list, select the languages for which you want to create a folder structure.

1. From the **[!UICONTROL Project]** list, select **[!UICONTROL Create a new translation project]**.

1. In the **[!UICONTROL Project Title]** field, enter a title for the project.

1. Click **[!UICONTROL Create]**. [!DNL Assets] from the source folder are copied to the target folders for the locales you selected in step 4.

   ![language copies](assets/lang-copy2.png)

1. To navigate to the folder, select the language copy, and click **[!UICONTROL Reveal in Assets]**.

   ![reveal-in-assets](assets/reveal-in-assets.png)

1. Navigate to the Projects console. The translation folder is copied to the Projects console.

   ![chlimage_1-70](assets/chlimage_1-70.png)

1. Open the folder to view the translation project.

   ![chlimage_1-71](assets/chlimage_1-71.png)

1. Click the project to open the details page.

   ![chlimage_1-72](assets/chlimage_1-72.png)

1. To view the status of the translation job, click the ellipsis at the bottom of the **[!UICONTROL Translation Job]** tile.

   ![chlimage_1-73](assets/chlimage_1-73.png)

   For more details around job statuses, see [Monitoring the Status of a Translation Job](/help/sites-administering/tc-manage.md#monitoring-the-status-of-a-translation-job).

1. Navigate to the [!DNL Assets] user interface, and open the [!UICONTROL Properties] page for each of the translated assets to view the translated metadata.

   ![view the translated metadata in asset Properties page](assets/translated-metadata-asset-properties.png)

   *Figure: Translated metadata in the asset properties page.*

   >[!NOTE]
   >
   >This feature is available both for assets and folders. When an asset is selected instead of a folder, the entire hierarchy of folders up to the language root is copied to create a language copy for the asset.

### Add to existing translation project {#add-to-existing-translation-project}

If you use this option, the translation workflow runs for assets that you add to the source folder after running a previous translation workflow. Only the newly-added assets are copied to the target folder that contains previously translated assets. No new translation project is created in this case.

1. In the [!DNL Assets] UI, navigate to the source folder that contains untranslated assets.
1. Select an asset you want to translate, and open the **[!UICONTROL Reference pane]**. The **[!UICONTROL Language Copies]** section displays the number of translation copies that are currently available.
1. Click **[!UICONTROL Language Copies]** under **[!UICONTROL Copies]**. A list of available translation copies is displayed.
1. Click **[!UICONTROL Create & Translate]** at the bottom.

1. From the **[!UICONTROL Target Languages]** list, select the languages for which you want to create a folder structure.

1. From the **[!UICONTROL Project]** list, select **[!UICONTROL Add to existing translation project]** to run the translation workflow on the folder.

   >[!NOTE]
   >
   >If you choose the **[!UICONTROL Add to existing translation project]** option, your translation project is added to a pre-existing project only if your project settings exactly match the settings of the pre-existing project. Otherwise, a new project is created.

1. From the **[!UICONTROL Existing translation project]** list, select a project to add the asset for translation.

1. Click **[!UICONTROL Create]**. The assets to be translated are added to the target folder. The updated folder is listed under the **[!UICONTROL Language Copies]** section.

   ![chlimage_1-79](assets/chlimage_1-79.png)

1. Navigate to the Projects console, and open the existing translation project you added to.
1. Click the translation project view the project details page.

   ![chlimage_1-80](assets/chlimage_1-80.png)

1. Click the ellipsis at the bottom of the **Translation Job** tile to view the assets in the translation workflow. The translation job list also displays entries for asset metadata and tags. These entries indicate that the metadata and tags for the assets are also translated.

   >[!NOTE]
   >
   >If you delete the entry for tags or metadata, no tags or metadata are translated for any of the assets.

   >[!NOTE]
   >
   >If the asset you add to the translation job includes subassets, select the subassets and remove them for the translation to proceed without any glitches.

1. To start the translation for the assets, click the arrow on the **[!UICONTROL Translation Job]** tile and select **[!UICONTROL Start]** from the list.

   ![chlimage_1-81](assets/chlimage_1-81.png)

   A message notifies the commencement of the translation job.

1. To view the status of the translation job, click the ellipsis at the bottom of the **[!UICONTROL Translation Job]** tile.

   ![chlimage_1-83](assets/chlimage_1-83.png)

   For more details, see [Monitoring the Status of a Translation Job](/help/sites-administering/tc-manage.md#monitoring-the-status-of-a-translation-job).

1. After the translation completes, the status changes to Ready to Review. Navigate to the [!DNL Assets] user interface, and open the Properties page for each of the translated assets to view the translated metadata.

## Update language copies {#update-language-copies}

Run this workflow to translate any additional set of assets and include it in a language copy for a particular locale. In this case, the translated assets are added to the target folder that already contains previously translated assets. Depending upon the choice of options, a translation project is created or an existing translation project is updated for the new assets. The Update language copies workflow includes the following options:

* Create a translation project
* Add to existing translation project

### Create a translation project {#create-a-new-translation-project-1}

If you use this option, a translation project is created for the set of assets for which you want to update a language copy.

1. From the [!DNL Assets] UI, select the source folder where you added an asset.
1. Open the **[!UICONTROL References]** pane, and click **[!UICONTROL Language Copies]** under **[!UICONTROL Copies]** to display the list of language copies.
1. Select the check box before **[!UICONTROL Language Copies]**, and then select the target folder corresponding to the appropriate locale.

   ![select language copy](assets/lang-copy1.png)

1. Click **[!UICONTROL Update language copies]** at the bottom.

1. From the **[!UICONTROL Project]** list, choose **[!UICONTROL Create a new translation project]**.

1. In the **[!UICONTROL Project Title]** field, enter a title for the project.

1. Click **[!UICONTROL Start]**.
1. Navigate to the Projects console. The translation folder is copied to the Projects console.

   ![chlimage_1-88](assets/chlimage_1-88.png)

1. Open the folder to view the translation project.

   ![chlimage_1-89](assets/chlimage_1-89.png)

1. Click the project to open the details page.

   ![chlimage_1-90](assets/chlimage_1-90.png)

1. To start the translation for the assets, click the arrow on the **[!UICONTROL Translation Job]** tile and select **[!UICONTROL Start]** from the list.

   ![chlimage_1-91](assets/chlimage_1-91.png)

   A message notifies the commencement of the translation job.

1. To view the status of the translation job, click the ellipsis at the bottom of the **[!UICONTROL Translation Job]** tile.

   ![chlimage_1-93](assets/chlimage_1-93.png)

   For more details around job statuses, see [Monitoring the Status of a Translation Job](../sites-administering/tc-manage.md#monitoring-the-status-of-a-translation-job).

1. Navigate to the [!DNL Assets] user interface, and open the Properties page for each of the translated assets to view the translated metadata.

### Add to existing translation project {#add-to-existing-translation-project-1}

If you use this option, the set of assets are added to an existing translation project to update the language copy for the locale you choose.

1. From the [!DNL Assets] UI, select the source folder where you added an asset folder.
1. Open the **[!UICONTROL References pane]**, and click **[!UICONTROL Language Copies]** under **[!UICONTROL Copies]** to display the list of language copies.

   ![chlimage_1-94](assets/chlimage_1-94.png)

1. Select the check box before **[!UICONTROL Language Copies]**, which selects all language copies. Unselect other copies except the language copy (copies) corresponding to the locale(s) to which you want to translate.

   ![select language copy](assets/lang-copy1.png)

1. Click **[!UICONTROL Update language copies]** at the bottom.

1. From the **[!UICONTROL Project]** list, choose **[!UICONTROL Add to existing translation project]**.

1. From the **[!UICONTROL Existing translation project]** list, select a project to add the asset for translation.

1. Click **[!UICONTROL Start]**.
1. See steps 9-14 of [Add to existing translation project](translation-projects.md#add-to-existing-translation-project) to complete the rest of the procedure.

## Create temporary language copies {#creating-temporary-language-copies}

When you run a translation workflow to update a language copy with edited versions of original assets, the existing language copy is preserved until you approve the translated assets. [!DNL Adobe Experience Manager Assets] stores the newly-translated assets at a temporary location and updates the existing language copy after you explicitly approve the assets. If you reject the assets, the language copy remains unchanged.

1. Click the source root folder under **[!UICONTROL Language Copies]** for which you already created a language copy, and then click **[!UICONTROL Reveal in Assets]** to open the folder in [!DNL Experience Manager Assets].

   ![chlimage_1-99](assets/chlimage_1-99.png)

1. From the [!DNL Assets] interface, select an asset you already translated and click **[!UICONTROL Edit]** from the toolbar to open the asset in edit mode.
1. Edit the asset and then save the changes.
1. Perform steps 2-14 of the [Add to existing translation project](#add-to-existing-translation-project) procedure to update the language copy.
1. Click the ellipsis at the bottom of the **[!UICONTROL Translation Job]** tile. From the list of assets in the **[!UICONTROL Translation Job]** page, you can clearly view the temporary location where the translated version of the asset is stored.

   ![chlimage_1-101](assets/chlimage_1-101.png)

1. Select the checkbox next to **[!UICONTROL Title]**.
1. From the toolbar, click **[!UICONTROL Accept Translation]** ![accept translation](assets/do-not-localize/thumb-up.png) and then click **[!UICONTROL Accept]** in the dialog to overwrite the translated asset in the target folder with the translated version of the edited asset.

   >[!NOTE]
   >
   >To enable the translation workflow to update the destination assets, accept both the asset and metadata.

   Click **[!UICONTROL Reject Translation]** ![reject translation](assets/do-not-localize/thumb-down.png) to retain the originally translated version of the asset in the target locale root and reject the edited version.

1. To view the translated metadata, navigate to the [!DNL Assets] console and open the [!UICONTROL Properties] page for each of the translated assets.

## Tips and limitations {#tips-limitations}

* If you launch a translation workflow for complex assets, such as PDF and [!DNL Adobe InDesign] files, their subassets or renditions (if any) are not submitted for translation.
* If you use machine translation, the asset binaries are not translated.

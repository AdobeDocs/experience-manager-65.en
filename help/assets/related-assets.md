---
title: Related assets
description: Learn how to relate digital assets that share some common attributes. Also create source-derived relationships between digital assets.
contentOwner: AG
role: User
feature: Collaboration,Asset Management
exl-id: ddb69727-74a0-4a4d-a14e-7d3bb5ceea2a
solution: Experience Manager, Experience Manager Assets
---
# Related assets {#related-assets}

[!DNL Adobe Experience Manager Assets] lets you manually relate assets based on the needs of your organization using the related assets feature. For example, you can relate a license file with an asset or an image/video on a similar topic. You can relate assets that share certain common attributes. You can also use the feature to create source/derived relationships between assets. For example, if you have a PDF file that is generated from an INDD file, you can relate the PDF file to its source INDD file.

Using this feature, you have the flexibility to share a low resolution PDF file or JPG file with vendors or agencies and make the high resolution INDD file available only on request.

>[!NOTE]
>
>Only the users with edit permissions on assets can relate and unrelate the assets.

## Relate assets {#relating-assets}

1. From the [!DNL Experience Manager] interface, open the **[!UICONTROL Properties]** page for an asset that you want to relate.

   ![open an asset's Properties page to relate the asset](assets/asset-properties-relate-assets.png)

   *Figure: [!DNL Assets] [!UICONTROL Properties] page to relate assets.*

   Alternatively, select the asset from the list view.

   ![chlimage_1-273](assets/chlimage_1-273.png)

   You can also select the asset from a collection.

   ![chlimage_1-274](assets/chlimage_1-274.png)

1. To relate another asset with the asset you selected, click **[!UICONTROL Relate]** ![relate assets](assets/do-not-localize/link-relate.png) from the toolbar.
1. Do one of the following:

    * To relate the source file for the asset, select **[!UICONTROL Source]** from the list.
    * To relate a derived file, select **[!UICONTROL Derived]** from the list.
    * To create a two-way relationship between the assets, select **[!UICONTROL Others]** from the list.

1. From the **[!UICONTROL Select Asset]** screen, navigate to the location of the asset you want to relate, and select it.

   ![chlimage_1-277](assets/chlimage_1-277.png)

1. Click **[!UICONTROL Confirm]**.
1. Click **[!UICONTROL OK]** to close the dialog. Depending on your choice of relationship in step 3, the related asset is listed under under an appropriate category in the **[!UICONTROL Related]** section. For example, if the asset you related is the source file for the current asset, it is listed under **[!UICONTROL Source]**.

   ![chlimage_1-278](assets/chlimage_1-278.png)

1. To un-relate an asset, click **[!UICONTROL Unrelate]** ![unrelate assets](assets/do-not-localize/link-unrelate-icon.png) from the toolbar.

1. Select the assets you want to un-relate from the **[!UICONTROL Remove Relations]** dialog, and the click **[!UICONTROL Unrelate]**.

   ![chlimage_1-280](assets/chlimage_1-280.png)

1. Click **[!UICONTROL OK]** to close the dialog. The assets for which you removed relations are deleted from the list of related assets under the **[!UICONTROL Related]** section.

## Translate related assets {#translating-related-assets}

Creating source/ derived relationships between assets using the related assets feature is also helpful in translation workflows. When you run a translation workflow on a derived asset, [!DNL Experience Manager Assets] automatically fetches any asset that the source file references and includes it for translation. This way, the asset referenced by the source asset is translated along with the source and derived assets. For example, consider a scenario where your English language copy includes a derived asset and its source file as shown.

![chlimage_1-281](assets/chlimage_1-281.png)

If the source file is related to another asset, [!DNL Experience Manager Assets] fetches the referenced asset and includes it for translation.

![asset Properties page shows source file of the related asset to include for translation](assets/asset-properties-source-asset.png)

*Figure: Source asset of the related assets to include for translation.*

1. Translate the assets in the source folder to a target language by following the steps in [Create a translation project](translation-projects.md#create-a-new-translation-project). For example, in this case, translate your assets to French.

1. From the [!UICONTROL Projects] page, open the translation folder.

1. Click the project tile to open the details page.

   ![chlimage_1-284](assets/chlimage_1-284.png)

1. Click the ellipses below the Translation Job card to view the translation status.

   ![chlimage_1-285](assets/chlimage_1-285.png)

1. Select the asset and then click **[!UICONTROL Reveal in Assets]** from the toolbar to view the translation status for the asset.

   ![chlimage_1-286](assets/chlimage_1-286.png)

1. To verify whether the assets related to the source have been translated, click the source asset.

1. Select the asset that is related to the source, and then click **[!UICONTROL Reveal in Assets]**. The translated related asset is displayed.

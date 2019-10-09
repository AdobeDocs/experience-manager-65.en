---
title: Related Assets
seo-title: Related Assets
description: Learn how to relate assets that share certain common attributes. You can also use the feature to create source/derived relationships between assets.
seo-description: Learn how to relate assets that share certain common attributes. You can also use the feature to create source/derived relationships between assets.
uuid: 6a2b1105-1cb0-48ca-bd1d-0ee034b8a0c1
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: managing-assets
content-type: reference
discoiquuid: 2bd38e3b-a244-4f18-b081-f10c4eb0149b
---

# Related Assets {#related-assets}

Adobe Experience Manager (AEM) Assets lets you manually relate assets based on the needs of your organization using the Related Assets feature. For example, you can relate a license file with an asset or an image/video on a similar topic. You can relate assets that share certain common attributes. You can also use the feature to create source/derived relationships between assets. For example, if you have a PDF file that is generated from an INDD file, you can relate the PDF file to its source INDD file.

This way, you have the flexibility to share a low resolution file (for example PDF/JPG) to vendors/agencies and make available the high resolution file (for example INDD) only on request.

## Relating assets {#relating-assets}

1. From the Assets interface, open the properties page for an asset you want to relate. 

   ![chlimage_1-272](assets/chlimage_1-272.png)

   Alternatively, select the asset from the list view.

   ![chlimage_1-273](assets/chlimage_1-273.png)

   You can also select the asset from a collection.

   ![chlimage_1-274](assets/chlimage_1-274.png)

1. To relate another asset with the asset you selected, click/tap the **[!UICONTROL Relate]** icon from the toolbar.

   ![chlimage_1-275](assets/chlimage_1-275.png)

1. Do one of the following:

    * To relate the source file for the asset, select **[!UICONTROL Source]** from the list.
    * To relate a derived file, select **[!UICONTROL Derived]** from the list.
    * To create a two-way relationship between the assets, select **[!UICONTROL Others]** from the list.

   ![chlimage_1-276](assets/chlimage_1-276.png)

1. From the **[!UICONTROL Select Asset]** screen, navigate to the location of the asset you want to relate, and select it.

   ![chlimage_1-277](assets/chlimage_1-277.png)

1. Click/tap the **[!UICONTROL Confirm]** icon.
1. Click/tap **[!UICONTROL OK]** to close the dialog. Depending on your choice of relationship in step 3, the related asset is listed under under an appropriate category in the **[!UICONTROL Related]** section. For example, if the asset you related is the source file for the current asset, it is listed under **[!UICONTROL Source]**.

   ![chlimage_1-278](assets/chlimage_1-278.png)

1. To unrelate an asset, click/tap the **[!UICONTROL Unrelate]** icon from the toolbar.

   ![chlimage_1-279](assets/chlimage_1-279.png)

1. Select the asset(s) you want to unrelate from the **[!UICONTROL Remove Relations]** dialog, and the click/tap **[!UICONTROL Unrelate]**. 

   ![chlimage_1-280](assets/chlimage_1-280.png)

1. Click/Tap **[!UICONTROL OK]** to close the dialog. The assets for which you removed relations are deleted from the list of related assets under the **[!UICONTROL Related]** section.

## Translating Related Assets {#translating-related-assets}

Creating source/derived relationships between assets using the Related Assets feature is also helpful in translation workflows. When you run a translation workflow on a derived asset, AEM Assets automatically fetches any asset that the source file references and includes it for translation. This way, the asset referenced by the source asset is translated along with the source and derived assets. For example, consider a scenario where your English language copy includes a derived asset and its source file as shown.

![chlimage_1-281](assets/chlimage_1-281.png)

If the source file is related to another asset, AEM Assets fetches the refenced asset and includes it for translation.

![chlimage_1-282](assets/chlimage_1-282.png)

1. Translate the assets in the source folder to a target language by following the steps in [Create a new translation project](translation-projects.md#create-a-new-translation-project). For example, in this case, translate your assets to French.
1. From the Projects page, open the translation folder.

   ![chlimage_1-283](assets/chlimage_1-283.png)

1. Click/Tap the project tile to open the details page.

   ![chlimage_1-284](assets/chlimage_1-284.png)

1. Click/tap the ellipses below the Translation Job card to view the translation status. 

   ![chlimage_1-285](assets/chlimage_1-285.png)

1. Select the asset and then click/tap **[!UICONTROL Reveal in Assets]** from the toolbar to view the translation status for the asset.

   ![chlimage_1-286](assets/chlimage_1-286.png)

1. To verify whether the assets related to the source have been translated, click/tap the source asset.

   ![chlimage_1-287](assets/chlimage_1-287.png)

1. Select the asset that is related to the source, and then click/tap **[!UICONTROL Reveal in Assets]**. The translated related asset is displayed.

   ![chlimage_1-288](assets/chlimage_1-288.png)


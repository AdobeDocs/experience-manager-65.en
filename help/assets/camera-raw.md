---
title: Camera Raw Support
description: Learn how to enable Camera Raw support in Adobe Experience Manager (AEM) Assets.
uuid: b0463513-ca1f-41b4-adaf-040cdc1ddd26
contentOwner: AG
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
discoiquuid: e5f3dfb7-5a9f-4ee0-8ec1-fcb50bcb76e3
docset: aem65

---

# Camera Raw Support{#camera-raw-support}

The Camera Raw package enables support for various raw file formats, such as .cr2, .nef, .raf, and so on. The Camera Raw functionality is supported in AEM to render your assets in JPEG format. The supported pacakge is available at [https://blogs.adobe.com/lightroomjournal/2017/03/acr-9-9-now-available.html](https://blogs.adobe.com/lightroomjournal/2017/03/acr-9-9-now-available.html).

>[!NOTE]
>
>The functionality supports only JPEG renditions. It is supported on Windows 64 Bit, Mac OS, and RHEL 7.x.

To enable Camera Raw support in Adobe Experience Manager (AEM) Assets:

1. Download the Camera Raw package version [1.3.16](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/aem630/product/assets/aem-assets-cameraraw-pkg) from the Package Share.
1. Access `https://[AEM server]:[Port]/workflow`. Open the **[!UICONTROL DAM Update Asset]** workflow.
1. Open the **[!UICONTROL Process Thumbnails]** step.

1. Provide the following configuration in the **[!UICONTROL Thumbnails]** tab:

    * Thumbnails: `140:100:false, 48:48:false, 319:319:false`
    * Skip Mime Types: `skip:image/dng, skip:image/x-raw-(.*)`

   ![chlimage_1-128](assets/chlimage_1-128.png)

1. In the **[!UICONTROL Web Enabled Image]** tab, specify the following:

    * Skip List: `audio/mpeg, video/(.*), image/dng, image/x-raw-(.*)`

   ![chlimage_1-129](assets/chlimage_1-129.png)

1. From SideKick, add the **[!UICONTROL Camera Raw/DNG Handler]** step below the **[!UICONTROL Thumbnail creation]** step.
1. In the **[!UICONTROL Camera Raw/DNG Handler]** step, provide the following configuration in the **[!UICONTROL Arguments]** tab:

   Mime Types: `image/dng, image/x-raw-(.*)`

   Command:

    * `DAM_Raw_Converter ${directory}/${filename} ${directory} cq5dam.web.1280.1280.jpeg 1280 1280`
    * `DAM_Raw_Converter ${directory}/${filename} ${directory} cq5dam.thumbnail.319.319.jpeg 319 319`
    * `DAM_Raw_Converter ${directory}/${filename} ${directory} cq5dam.thumbnail.140.100.jpeg 140 100`
    * `DAM_Raw_Converter ${directory}/${filename} ${directory} cq5dam.thumbnail.48.48.jpeg 48 48`

   ![chlimage_1-130](assets/chlimage_1-130.png)

1. Click **[!UICONTROL Save]**.

   You can now import camera raw files into AEM Assets.

   >[!NOTE]
   >
   >Linux, Windows, and Mac (with 64-bit JVM) support the Camera Raw package.

   After you install the Camera RAW package and configure the required workflow, **[!UICONTROL Image Adjust]** option appears in the list of panes.

   ![chlimage_1-131](assets/chlimage_1-131.png)

   Click **[!UICONTROL Image Adjust]** from the list and use the options in the **[!UICONTROL Image Adjust]** pane to make lightweight edits to your image.

   ![chlimage_1-132](assets/chlimage_1-132.png)

>[!NOTE]
>
>Ensure that the above configuration is the same as the **[!UICONTROL Sample DAM Update Asset With Camera RAW and DNG Handling Step]** configuration.

After saving the edits to a Camera Raw image, a new rendition `AdjustedPreview.jpg` is generated for the image. For other image types except Camera Raw, the changes are reflected in all the renditions.

>[!NOTE]
>
>The Camera Raw library has limitations around the total pixels it can process at a time. Currently, it can process a maximum of 1073741824 (1024 x 1024 x 1024) pixels.

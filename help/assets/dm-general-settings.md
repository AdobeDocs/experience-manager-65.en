---
title: Configure Dynamic Media General Settings
description: Learn how to manage General Settings in Dynamic Media. You can set your publish server name and origin server name here and set an image overwrite option. There are also default upload options for unsharp masking of images, and upload options for how you want to process PostScript, Adobe Photoshop, PDF, and Adobe Illustrator files.
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: administering
content-type: reference
feature: Image Profiles
role: User, Admin
mini-toc-levels: 4
exl-id: 55cc7c57-87a0-4bfb-b226-36d01d36849a
solution: Experience Manager, Experience Manager Assets
---
# Configure Dynamic Media General Settings

Configuring **[!UICONTROL Dynamic Media General Settings]** is available only if:

* You are running Dynamic Media in Scene7 mode. See [Enable Dynamic Media in Scene7 mode](/help/assets/config-dms7.md#enabling-dynamic-media-in-scene-mode).
* You have an *existing* **[!UICONTROL Dynamic Media Configuration]** (in **[!UICONTROL Cloud Services]**) in Adobe Experience Manager 6.5.11 or above. See [Create a Dynamic Media Configuration in Cloud Services](/help/assets/config-dms7.md#configuring-dynamic-media-cloud-services).
* You are an Experience Manager system administrator with administrator privileges.

Dynamic Media General Settings is intended for use by experienced web site developers and programmers. Adobe Dynamic Media recommends that users who change these publish settings be familiar with Dynamic Media on Adobe Experience Manager and basic imaging technology.

On account creation, Adobe Dynamic Media automatically provides the assigned servers for your company. These servers are used to construct URL strings for your web site and applications. These URL calls are specific to your account.

The Dynamic Media Publish Setup page establishes default settings that determine how assets are delivered from Adobe Dynamic Media servers to web sites or applications. If no setting is specified, the Adobe Dynamic Media server delivers an asset according to a default setting that was configured on the Dynamic Media Publish Setup page.

See also [Optional - Setup and configuration of Dynamic Media - Scene7 mode settings](/help/assets/config-dms7.md#optional-setup-and-configuration-of-dynamic-media-scene7-mode-settings) for more optional configuration tasks.

>[!NOTE]
>
>Upgrading from Dynamic Media Classic to Dynamic Media on Adobe Experience Manager? The General Settings page and [Publish Setup](/help/assets/dm-publish-settings.md) page in Dynamic Media are pre-populated with the values taken from your Dynamic Media Classic account. The exceptions are all the values that are listed under the **[!UICONTROL Default upload options]** area of the General Settings page. Those values are already in Experience Manager. As such, any changes that you make under **[!UICONTROL Default upload options]**, across any of the five tabs, by way of the Experience Manager user interface, are reflected in Dynamic Media, not in Dynamic Media Classic. All other settings and values in the General Settings page and the [Publish Setup](/help/assets/dm-publish-settings.md) page are maintained between Dynamic Media Classic and Dynamic Media on Experience Manager.

**To configure Dynamic Media General Settings:**

1. In Experience Manager Author mode, select the Experience Manager logo to access the global navigation console.
1. In the left rail, select the Tools icon, then go to **[!UICONTROL Assets]** > **[!UICONTROL Dynamic Media General Settings]**.
1. In the Server page, set your **[!UICONTROL Published Server Name]** and **[!UICONTROL Origin Server Name]**, and then use the five tabs to configure default upload options for Image Editing, and for Postscript, Photoshop, PDF, and Illustrator files.

   * [Server](#server-general-setting)
   * [Upload to Application](#upload-to-application)
   * [Image Editing](#image-editing-tab) tab
   * [PostScript](#postscript-tab) tab
   * [Photoshop](#photoshop-tab) tab
   * [PDF](#pdf-tab) tab
   * [Illustrator](#illustrator-tab) tab

   ![Dynamic Media General Settings page](/help/assets/assets-dm/dm-general-settings.png)
   *Dynamic Media General Settings page, with the **[!UICONTROL Image Editing]** tab selected.*<br><br>

1. When you are finished, near the upper-right corner of the page, select **[!UICONTROL Save]**.

## Server {#server-general-setting}

On account creation, Adobe Dynamic Media automatically provides the assigned servers for your company. These servers are used to construct URL strings for your web site and applications. These URL calls are specific to your account.

| Option | Description |
| --- | --- |
| **[!UICONTROL Published Server Name]** | Required.<br>The name must use `https://` in the path.<br>This server is the live CDN (Content Deliver Network) server used in all system-generated URL calls that are specific to your account. Do not change this server name unless you are instructed to do so by Adobe Technical Support.|
| **[!UICONTROL Origin Server Name]** | Required.<br>This server is used for quality assurance testing only. Do not change this server name unless instructed to do so by Adobe Technical Support. |

## Upload to Application {#upload-to-application}

* **[!UICONTROL Overwrite Images]**

    Adobe Dynamic Media does not allow two files to have the same name. Each item’s Adobe Dynamic Media ID (the image name minus the filename extension) must be unique. Because of this rule, **[!UICONTROL Upload to Application]** has an overwrite. The exact effect of this option depends on the specified Overwrite Images option you have chosen. These options specify how replacement images are uploaded: whether they replace the original images, or become duplicate images. Duplicate images are renamed with a `-1`. For example, `chair.tif` is renamed `chair-1.tif`. These options affect images uploaded to a different folder than the original or images with a different filename extension from the original, such as JPG, TIF, or PNG.

    >[!NOTE]
    >
    >To maintain consistency with Experience Manager, select the Overwrite Images option **[!UICONTROL Overwrite in current folder, same base name/extension]**.

    | Overwrite Images option | Description |
    | --- | --- |
    | **[!UICONTROL Overwrite in current folder, same base name/extension]** | *Default* for new Dynamic Media accounts only.<br>This option is the strictest rule for replacement. It requires that you upload the replacement image to the same folder as the original, and that the replacement image has the same filename extension as the original. If these requirements are not met, a duplicate is created.<br>*To maintain consistency with Experience Manager, select this option*. |
    | **[!UICONTROL Overwrite in current folder, same base name regardless of extension]** | Requires that you upload the replacement image to the same folder as the original, however the filename extension can be different from the original. For example, chair.tif replaces chair.jpg. |
    | **[!UICONTROL Overwrite in any folder, same base asset name/extension]** | Requires that the replacement image has the same filename extension as the original image (for example, chair.jpg must replace chair.jpg, not chair.tif). However, you can upload the replacement image to a different folder than the original. The updated image resides in the new folder; the file can no longer be found in its original location. |
    | **[!UICONTROL Overwrite in any folder, same base asset name regardless of extension]** | This option is the most inclusive replacement rule. You can upload a replacement image to a different folder than the original, upload a file with a different filename extension, and replace the original file. If the original file is in a different folder, the replacement image resides in the new folder to which it was uploaded. |

* **[!UICONTROL Preserve Crop]**

    Controls the preservation of any existing manual crop definition.

    See also `preserveCrop` in [UploadPostJob](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-production-api/data-types/r-upload-post-job.html) and [ReprocessAssetsJob](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-production-api/data-types/r-reprocess-assets-job.html), both in the Dynamic Media Viewers Reference Guide.

## Default Upload Options {#default-upload-options}

### Image Editing tab {#image-editing-tab}

This filter lets you fine-tune a sharpening filter effect on the final downsampled image. It helps you control the intensity of the effect, the radius of the effect (as measured in pixels), and a threshold of contrast that is ignored.

The Unsharp Mask effect uses the same options as Photoshop’s Unsharp Mask filter. Contrary to what the name suggests, Unsharp Mask is a sharpening filter.

| Unsharp Mask options |Description |
| --- | --- |
| **[!UICONTROL Amount]** | Required.<br>Controls the amount of contrast that is applied to edge pixels.<br>Think of it as the intensity of the effect. The main difference between the amount values of Unsharp Mask in Adobe Dynamic Media and the amount values in Adobe Photoshop, is that Photoshop has an amount range of 1% to 500%. Whereas in Adobe Dynamic Media, the value range is `0.0` to `5.0`. A value of 5.0 in Adobe Dynamic Media is the rough equivalent of 500% in Photoshop; a value of 0.9 is the equivalent of 90%, and so on. |
| **[!UICONTROL Radius]** | Required.<br>Controls the radius of the effect.<br>The value range is `0` to `250`. The effect is run on all pixels in an image and radiates out from all pixels in all directions. The radius is measured in pixels. For example, to get a similar sharpening effect for a 2000 x 2000 pixel image and 500 x 500 pixel image, you would set a radius of two pixels on the 2000 x 2000 pixel image. Then set a radius value of one pixel on the 500 x 500 pixel image. A larger value is used for an image that has more pixels. |
| **[!UICONTROL Threshold]** | Required.<br>Threshold is a range of contrast that is ignored when the Unsharp Mask filter is applied. This effect is important so that no "noise" is introduced to an image when this filter is used. The value range is `0` - `255`, which is the number of brightness steps in a grayscale image. `0`=black, `128`=50% gray and `255`=white.<br>A threshold value of `12` ignores slight variations is skin tone brightness to avoid adding noise, but still add edge contrast to contrasty areas such as where eyelashes meet skin.<br>If you have a photo of someone’s face, the Unsharp Mask affects the contrasty parts of the image. For example, where eyelashes and skin meet to create an obvious area of contrast, and the smooth skin itself. Even the smoothest skin exhibits subtle changes in brightness values. If you do not use a threshold value, the filter accentuates these subtle changes in skin pixels. In turn, a noisy and undesirable effect is created while contrast on the eyelashes is increased, enhancing sharpness.<br>To avoid this issue, a threshold value is introduced that tells the filter to ignore pixels that do not change contrast dramatically, like smooth skin.<br>In the zipper graphic shown earlier, notice the texture next to the zippers. Image noise is exhibited because the threshold values were too low to suppress the noise. |
| **[!UICONTROL Monochrome]** | Select to unsharp-mask image brightness (intensity).<br>Deselect to unsharp-mask each color component separately. |

See also [Sharpen images in Adobe Dynamic Media and on Image Server](/help/assets/assets/sharpening_images.pdf).

### PostScript tab {#postscript-tab}

You can rasterize Adobe PostScript® files, maintain transparent backgrounds, choose a resolution, and choose a color space.

You can use Adobe PostScript® (EPS) files in Adobe Dynamic Media. Adobe Dynamic Media offers commands for configuring these files as you upload them.

When you upload PostScript (EPS) image files, you can format them in various ways. You can rasterize the files, maintain the transparent background, choose a resolution, and choose a color space.

| PostScript option | Description |
| --- | --- |
| **[!UICONTROL Processing]** | Choose Rasterize to convert vector graphics in the file to the bitmap format. |
| **[!UICONTROL Maintain transparent background in rendered images]** | Preserves the background transparency of the file. |
| **[!UICONTROL Resolution (pixel/inch)]** | Determines the resolution setting. This setting determines how many pixels are displayed per inch in the file. |
| **[!UICONTROL Color space]** | &bull; **[!UICONTROL Detect automatically]** - Retains the color space of the file.<br>&bull; **[!UICONTROL Force as RGB]** - Converts to the RGB color space.<br>&bull; **[!UICONTROL Force as CMYK]** - Converts to the CMYK color space.<br>&bull; **[!UICONTROL Force as Grayscale]** - Converts to the Grayscale color space.|

### Photoshop tab {#photoshop-tab}

You can create templates from Adobe® Photoshop® files, maintain layers, specify how layers are named, extract text, and specify how images are anchored into templates.

| Photoshop option | Description |
| --- | --- |
| **[!UICONTROL Maintain layers]** | Rips the layers in the PSD, if any, into individual assets. The asset layers remain associated with the PSD. You can view them by opening the PSD file in Detail View and selecting the layer panel. See Viewing and editing layers in a PSD file. |
| **[!UICONTROL Create template]** | Creates a template from the layers in the PSD file. |
| **[!UICONTROL Extract text]** | Extracts the text so that users can search for text in a Viewer. |
| **[!UICONTROL Extend layers to background size]** | Extends the size of ripped image layers to the size of the background layer. |
| **[!UICONTROL Layer naming]** | Extends the size of ripped image layers to the size of the background layer.<br>&bull; **[!UICONTROL Layer name]** - Names the images after their layer names in the PSD file. For example, a layer named Price Tag in the original PSD file becomes an image named Price Tag. However, if the layer names in the PSD file are default Photoshop layer names (Background, Layer 1, Layer 2, and so on), the images are named after their layer numbers in the PSD file. <br>&bull; **[!UICONTROL Photoshop and layer number]** - Names the images after their layer numbers in the PSD file, ignoring original layer names. Images are named with the Photoshop filename and an appended layer number. For example, the second layer of a file called `Spring Ad.psd` is named `Spring Ad_2` even if it had a non-default name in Photoshop.<br>&bull; **[!UICONTROL Photoshop and layer name]** - Names the images after the PSD file followed by the layer name or layer number. The layer number is used if the layer names in the PSD file are default Photoshop layer names. For example, a layer named `Price Tag` in a PSD file named `SpringAd` is named `Spring Ad_Price Tag`. A layer with the default name Layer 2 is called `Spring Ad_2`. |
| **[!UICONTROL Anchor]** | Specify how images are anchored in templates that are generated from the layered composition produced from the PSD file. By default, the anchor is the center. A center anchor allows replacement images to best fill the same space, no matter the aspect ratio of the replacement image. Images with a different aspect that replace this image, when referencing the template and using parameter substitution, effectively occupy the same space. Change to a different setting if your application requires the replacement images to fill the allocated space in the template. |

### PDF tab {#pdf-tab}

You can choose to rasterize the files, extract search words and links, set the resolution, and choose a color space.

| PDF option | Description |
| --- | --- |
| **[!UICONTROL Processing]** | &bull; **[!UICONTROL None]** - No processing of the PDF is done.<br>&bull; **[!UICONTROL Thumbnail]** - Rips each page in the PDF file and converts it to a thumbnail image.<br> &bull; **[!UICONTROL Rasterize]** - Rips the pages in the PDF file and converts vector graphics to bitmap images. To create an eCatalog, choose this option. |
| **[!UICONTROL Extract]** | &bull; **[!UICONTROL None]** - No search words or links are extracted from the PDF.<br>&bull; **[!UICONTROL Search words]** - Extracts search words from the PDF file so that the file can be searched by keyword in an eCatalog Viewer.<br>&bull; **[!UICONTROL Links]** - Extracts links from the PDF files and coverts them to Image Maps that are used in an eCatalog Viewer.<br>&bull; **[!UICONTROL Search words and links]** - Extracts both search words and links for use in an eCatalog viewer. |
| **[!UICONTROL Resolution (pixel/inch)]** | Determines the resolution setting. This setting determines how many pixels are displayed per inch in the PDF file. The default is 150. |
| **[!UICONTROL Color space]** | &bull; **[!UICONTROL Detect automatically]** - Maintains the color space of the PDF file.<br>&bull; **[!UICONTROL Force as RGB]** - Converts to the RGB color space.<br>&bull; **[!UICONTROL Force as CMYK]** - Converts to the CMYK color space.<br>&bull; **[!UICONTROL Force as Grayscale]** - Converts to the Grayscale color space.  |

### Illustrator tab {#illustrator-tab}

You can rasterize Adobe Illustrator® files, maintain transparent backgrounds, choose a resolution, and choose a color space.

You can use Adobe® Illustrator® (AI) files in Adobe Dynamic Media. Adobe Dynamic Media offers commands for configuring these files as you upload them.

When you upload Illustrator (AI) image files, you can format them in various ways. You can rasterize the files, maintain the transparent background, choose a resolution, and choose a color space. Options for formatting PostScript and Illustrator files are available on the Upload screen under PostScript Options and Illustrator Options in the Upload Job Options box.


| Illustrator option | Description |
| --- | --- |
| **[!UICONTROL Processing]** | Choose Rasterize to convert vector graphics in the file to the bitmap format. |
| **[!UICONTROL Maintain transparent background in rendered images]** | Preserves the background transparency of the file. |
| **[!UICONTROL Resolution (pixel/inch)]** | Determines the resolution setting. This setting determines how many pixels are displayed per inch in the file. |
| **[!UICONTROL Color space]** | &bull; **[!UICONTROL Detect automatically]** - Retains the color space of the file.<br>&bull; **[!UICONTROL Force as RGB]** - Converts to the RGB color space.<br>&bull; **[!UICONTROL Force as CMYK]** - Converts to the CMYK color space.<br>&bull; **[!UICONTROL Force as Grayscale]** - Converts to the Grayscale color space.|

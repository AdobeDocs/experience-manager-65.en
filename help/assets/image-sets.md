---
title: Image Sets
description: Learn how to work with Image Sets in Dynamic Media
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
docset: aem65
feature: Image Sets,Asset Management
role: User, Admin
exl-id: 2a536745-fa13-4158-8761-2ac5b6e1893e
solution: Experience Manager, Experience Manager Assets
---
# Image Sets {#image-sets}

Image Sets give users an integrated viewing experience, where users can see different views of an item by selecting a thumbnail image. Image Sets let you present alternative views of an item and the viewer offers zooming tools for examining images closely.

Image sets are designated by a banner with the word `IMAGESET`. In addition, if the Image Set is published, then the publish date, indicated by the **[!UICONTROL World]** icon is on the banner along with the last modification date, indicated by the **[!UICONTROL Pencil]** icon displays.

![Image Set](assets/chlimage_1-339.png)

Within the Image Set, you can also create swatches by creating an Image Set and adding thumbnails.

This application is useful for when you want to show an item in a different color, pattern, or finish. To create an Image Set with color swatches, you need one image for each different color, pattern, or finish you want to present to users. You also need one color, pattern, or finish swatch for each color, pattern, or finish.

For example, suppose you want to present images of caps with different color bills; the bills are red, green, and blue. In this case, you need three shots of the same cap. You need one shot with a red, one with a green, and one with a blue bill. You also need a red, green, and blue color swatch. The color swatches serve as the thumbnails that users select in the Swatch Set Viewer to see the red-billed, green-billed, or blue-billed cap.

>[!NOTE]
>
>For information on the Assets user interface, see [Manage assets](/help/assets/manage-assets.md).

When you create an Image Set, Adobe recommends the following best practices and enforces the following limits:

| Limit type | Best practice | Limit imposed |
| --- | --- | --- |
| Number of duplicate assets per set | No duplicates | 20&Dagger; |
| Maximum number of images per set | 5-10 images per set  | 1000 |

&Dagger; Best practice is to not have duplicate assets in a set. The limit is 20 duplicates for a single asset. If you add another duplicate for that asset&mdash;within that set&mdash;the request either gives an error or ignores the duplicate.

See also [Dynamic Media limitations](/help/assets/limitations.md).

## Quick Start: Image Sets {#quick-start-image-sets}

**To get you up and running quickly:**

1. [Upload your primary source images for multiple views](#uploading-assets-in-image-sets).

   Start by uploading the images for your Image Sets. When you choose images, remember that your customers can zoom on images in the Image Set Viewer. Make sure that the images are least 2000 pixels in the largest dimension for optimal zoom detail. Dynamic Media can render images up to 25 MP (megapixels) each. For example, you could use a 5000 x 5000 MP image or any other size combination up to 25 MP.

   See [Dynamic Media - Supported raster image formats](/help/assets/assets-formats.md#supported-raster-image-formats-dynamic-media) for a list of formats supported by Image Sets.

<!--    Adobe Experience Manager Assets supports many image file formats, but lossless TIFF, PNG, and EPS images are recommended. -->

1. [Create an Image Set](#creating-image-sets).

   In Image Sets, users select thumbnail images in the Image Set Viewer.

   To create an Image Set in Assets, go to **[!UICONTROL Create]** > **[!UICONTROL Image Sets]**. Then, add images and select **[!UICONTROL Save]**.

   You can also create image sets automatically through [batch set presets](/help/assets/config-dms7.md). 
   >[!IMPORTANT]
   >
   >Batch sets are created by the IPS (Image Production System) as part of asset ingestion and are available only in Dynamic Media - Scene7 mode.

   See [Prepare Image Set assets for upload and uploading your files](#uploading-assets-in-image-sets).

   See [Work with Selectors](/help/assets/working-with-selectors.md).

1. Add [Image Set Viewer presets](/help/assets/managing-viewer-presets.md), as needed.

   Administrators can create or modify Image Set Viewer Presets. To see your Image Set with a viewer preset, select the Image Set, and in the left-rail drop-down menu, select **[!UICONTROL Viewers]**.

   Navigate to **[!UICONTROL Tools]** > **[!UICONTROL Assets]** > **[!UICONTROL Viewer Presets]** if you want to create or edit viewer presets.

1. (Optional) [View an Image Set](/help/assets/image-sets.md#viewing-image-sets) that were created using batch set presets.
1. [Preview Image Sets](/help/assets/previewing-assets.md).

   Select the Image Set and you can preview it. Select the thumbnail icons so you can examine your Image Set in the selected Viewer. You can choose different viewers from the **[!UICONTROL Viewers]** menu, available from the left rail drop-down menu.

1. [Publish an Image Set](/help/assets/publishing-dynamicmedia-assets.md).

   Publishing an Image Set activates the URL and embed code. In addition, you must [publish any custom viewer preset](/help/assets/managing-viewer-presets.md) that you have created. Out-of-the box viewer presets are already published.

1. [Link URLs to your Web Application](/help/assets/linking-urls-to-yourwebapplication.md) or [Embed the Video or Image Viewer](/help/assets/embed-code.md).

   Experience Manager Assets creates URL calls for Image Sets and activates them after you publish the image sets. You can copy these URLs when you preview assets. Alternatively, you can embed them on your web site.

   Select the Image Set, then in the left rail drop-down menu, select **[!UICONTROL Viewers]**.

   See [Link an Image Set to a web page](/help/assets/linking-urls-to-yourwebapplication.md) and [Embed the Video or Image Viewer](/help/assets/embed-code.md).

To edit Image Sets, see [Edit Image Sets](#editing-image-sets). In addition, you can view and edit [Image Set properties](/help/assets/manage-assets.md#editing-properties).

If you have issues creating sets, see Images and Sets in [Troubleshooting Dynamic Media - Scene7 mode](/help/assets/troubleshoot-dms7.md#images-and-sets).

## Upload assets in Image Sets {#uploading-assets-in-image-sets}

Start by uploading the images for your Image Sets. When you choose images, remember that your customers can zoom on images in the Image Set Viewer. Make sure that the images are least 2000 pixels in the largest dimension. Image Sets supports many image file formats, but lossless TIFF, PNG, and EPS images are recommended.

You can upload images for Image Sets as you would [upload any other asset in Assets](/help/assets/manage-assets.md#uploading-assets).

See [Dynamic Media - Supported raster image formats](/help/assets/assets-formats.md#supported-raster-image-formats-dynamic-media) for a list of formats supported by Image Sets.

### Prepare Image Set assets for upload {#preparing-image-set-assets-for-upload}

Before creating Image Sets, make sure that the images are the right size and format.

To create a multiple-view Image Set, you need images that show an item from different points of view or show different aspects of the same item. The goal is to highlight the important features of an item so viewers have a complete picture of what it looks like or does.

Because users can zoom images in Image Sets, make sure that the images are at least 2000 pixels in the largest dimension. <!-- Assets support many image file formats, but lossless TIFF, PNG, and EPS images are recommended. -->

>[!NOTE]
>
>In addition, if you are using thumbnails to indicate product swatches, you must do the following:
>
>You need vignettes or different shots of the same image showing it in different colors, patterns, or finishes. You also need thumbnail files that correspond to the different colors, patterns, or finishes. For example, to present thumbnails with an Image Set showing the same jacket in black, brown, and green, you need:
>
>* A black, brown, and green shot of the same jacket.
>* A black, brown, and green color thumbnail.

## Create an Image Set {#creating-image-sets}

You can create Image Sets through the user interface or via the API. This section describes how to create Image Sets in the UI.

>[!NOTE]
>
>You can also create image sets automatically through [batch set presets](/help/assets/config-dms7.md#creating-batch-set-presets-to-auto-generate-image-sets-and-spin-sets).
>**Important:** Batch sets are created by the IPS (Image Production System) as part of asset ingestion and are available only in Dynamic Media - Scene7 mode.

When you add assets to your set, they are automatically added in alphanumeric order. You can manually reorder or sort assets after they have been added.

>[!NOTE]
>
>Image sets are not supported for assets with "," (comma) in the file name.

When you create an Image Set, Adobe recommends the following best practices and enforces the following limits:

| Limit type | Best practice | Limit imposed |
| --- | --- | --- |
| Number of duplicate assets per set | No duplicates | 20&Dagger; |
| Maximum number of images per set | 5-10 images per set  | 1000 |

&Dagger; Best practice is to not have duplicate assets in a set. The limit is 20 duplicates for a single asset. If you add another duplicate for that asset&mdash;within that set&mdash;the request either gives an error or ignores the duplicate.

See also [Dynamic Media limitations](/help/assets/limitations.md).

**To create an Image Set:**

1. In Experience Manager, select the Experience Manager logo to access the global navigation console, then go to **[!UICONTROL Navigation]** > **[!UICONTROL Assets]**. Navigate to where you want to create an Image Set, then go to **[!UICONTROL Create]** > **[!UICONTROL Image Set]** to open the Image Set Editor page.

   You can also create the set from inside a folder that contains your assets.

   ![6_5_imagesets-createpulldown](assets/6_5_imagesets-createpulldown.png)

1. In the Image Set Editor page, in the **[!UICONTROL Title]** field, enter a name for the Image Set. The name appears in the banner across the Image Set. Optionally, enter a description.

   ![6_5_imageset-creatingnewset](assets/6_5_imageset-creatingnewset.png)

1. Do either one of the following:

    * Near the upper-left corner of the Image Set Editor page, select **[!UICONTROL Add Asset]**.

    * Near the middle of the Image Set Editor page, select **[!UICONTROL Tap to open Asset Selector]**.

   Select the assets that you want to include in your Image Set. Selected assets have a checkmark icon over them. When you are finished, near the upper-right corner of the page, select **[!UICONTROL Select]**.

   With the Asset Selector, you can search for assets by typing in a keyword and tapping or clicking **[!UICONTROL Return]**. You can also apply filters to refine your search results. You can filter by path, collection, file type, and tag. Select the filter and then select the **[!UICONTROL Filter]** icon on the toolbar. Change the view by tapping the View icon and selecting **[!UICONTROL Column View]**, **[!UICONTROL Card View]**, or **[!UICONTROL List View]**.

   See [Work with Selectors](/help/assets/working-with-selectors.md).

   ![6_5_imageset-addingassets](assets/6_5_imageset-addingassets.png)

1. When you add assets to your set, they are automatically added in alphanumeric order. You can manually reorder or sort assets after you add them.

   If necessary, drag an asset's Reorder icon to the right of the asset's file name to reorder images up or down the set list.

   ![6_5_imageset-reorderassets](assets/6_5_imageset-reorderassets.png)

   If you want to change a thumbnail or swatch, select the **+** **thumbnail** icon next to the image and navigate to the thumbnail or swatch you want. When done selecting all the images select **[!UICONTROL Save]**.

1. (Optional) Do any of the following:

    * To delete an image, select the image and select **[!UICONTROL Delete Asset]**.

    * To apply a preset, near the upper-right corner of the page, select **[!UICONTROL Preset]**, then select a preset to apply to all the assets at once.

   >[!NOTE]
   >
   >When creating the Image Set, you can change the Image Set thumbnail or allow Experience Manager to select the thumbnail automatically based on the assets in the Image Set. To select a thumbnail, select **[!UICONTROL Change thumbnail]** above the Title field on the Image Set Editor page, then select any image (you can navigate to other folders to find images as well). If you have selected a thumbnail, and then decide that you want Experience Manager to generate one from the Image Set, select **[!UICONTROL Switch to]** > **[!UICONTROL Automatic thumbnail]**.

1. Select **[!UICONTROL Save]**. Your newly created Image Set appears in the folder you created it in.

## View an Image Set {#viewing-image-sets}

You can create image sets either in the user interface or automatically using [batch set presets](/help/assets/config-dms7.md#creating-batch-set-presets-to-auto-generate-image-sets-and-spin-sets).

>[!IMPORTANT]
>
>Batch sets are created by the IPS [Image Production System] as part of asset ingestion and are available only in Dynamic Media - Scene7 mode.)

However, sets created using batch set presets, do *not* appear in the user interface. You can view these sets in three different ways. (These methods are available even if you created the image sets in the user interface).

* Open the properties of an individual asset. Properties indicate what sets the selected asset is referenced or a member of. Select the name of the set if you want to see the entire set.

  ![6_5_imageset-assetproperties](assets/6_5_imageset-assetproperties2.png)

* From a member image of any set. Select the **[!UICONTROL Sets]** menu to display the sets that the asset is a member of.

  ![6_5_imageset-setspulldownmenu](assets/6_5_imageset-setspulldownmenu.png)

* From search, you can select **[!UICONTROL Filter]**, then expand **[!UICONTROL Dynamic Media]** and select **[!UICONTROL Sets]**.

  The search returns matching sets that were manually created in the UI or automatically created through batch set presets. For automated sets, the search query is conducted using "Starts with" search criteria which is different from Experience Manager search which is based on using "Contains" search criteria. Setting the filter to **[!UICONTROL Sets]** istheonly way to search automated sets.

  ![chlimage_1-134](assets/chlimage_1-134.png)

>[!NOTE]
>
>You can view sets by way of the user interface as described in [Edit Image Sets](#editing-image-sets).

## Edit an Image Set {#editing-image-sets}

You can perform various editing tasks on Image Sets such as the following:

* Add images to the Image Set.
* Reorder images in the Image Set.
* Delete assets in the Image Set.
* Apply viewer presets.
* Delete the Image Set.

**To edit an Image Set:**

1. Do any one of the following:

    * Hover over an Image Set asset, then select **[!UICONTROL Edit]** (pencil icon).
    * Hover over an Image Set asset, select **[!UICONTROL Select]** (checkmark icon), then select **[!UICONTROL Edit]** on the toolbar.
    * Select on an Image Set asset, then select **[!UICONTROL Edit]** (pencil icon) on the toolbar.

1. To edit the images in the Image Set, do any of the following:

    * To reorder assets, drag an image to a new location (select the reorder icon to move items).
    * To sort items in ascending or descending order, select the column heading.
    * To add an asset or update an existing asset, select the **[!UICONTROL Add Asset]**. Navigate to an asset, select it, then select **[!UICONTROL Select]** near the upper-right corner of the page.
        >[!NOTE]
        >
        >If you delete the image that Experience Manager uses for the thumbnail by replacing it with another image, the original asset still displays.
    * To delete an asset, select it and select **[!UICONTROL Delete Asset]**.
    * To apply a preset, near the upper-right corner of the page, select **[!UICONTROL Preset]**, then select a viewer preset.
    * To add or change a thumbnail, select the thumbnail icon next to the right of the asset. Navigate to the new thumbnail or swatch asset, select it, then select **[!UICONTROL Select]**.
    * To delete an entire Image Set, navigate to the Image Set, select it, and select **[!UICONTROL Delete]**.

   >[!NOTE]
   >
   >You can edit the images in an Image Set by navigating to the set, select **[!UICONTROL Set Members]** in the left rail, and then select the Pencil icon on an individual asset to open the editing window.

1. Select **[!UICONTROL Save]** when you are done editing.

## Preview an Image Set {#previewing-image-sets}

See [Previewing assets](/help/assets/previewing-assets.md).

## Publish an Image Set {#publishing-image-sets}

See [Publishing Assets](/help/assets/publishing-dynamicmedia-assets.md).

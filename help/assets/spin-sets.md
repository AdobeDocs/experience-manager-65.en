---
title: Spin Sets
description: Learn how to work with spin sets in Dynamic Media
uuid: 379a20a3-6a17-499a-b0f1-3a835b97aa7b
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
discoiquuid: 8e9b3815-2893-4e6b-ac41-77720b42d56b
docset: aem65

feature: Spin Sets,Asset Management
role: User, Admin
exl-id: 758ad754-15de-4e72-9b7d-ab49c51d7d4f
---
# Spin Sets{#spin-sets}

A Spin Set simulates the real-world act of turning an object to examine it. Spin Sets make it possible to view items from any angle, gaining the key visual details from any angle.

A Spin Set simulates a 360-degree viewing experience. Dynamic Media offers single-axis Spin Sets in which viewers can rotate an item. Moreover, users can “free-form” zoom and pan any of the views with a few simple mouse-clicks. In this way, users can examine an item more closely from a particular viewpoint.

Spin Sets are designated by a banner with the word **[!UICONTROL SPINSET]**. In addition, if the Spin Set is published, then the publish date, indicated by the **[!UICONTROL World]** icon is on the banner along with the last modification date, indicated by the **[!UICONTROL Pencil]** icon displays.

![chlimage_1-](assets/chlimage_1-380.png)

>[!NOTE]
>
>For information on the Assets user interface, see [Manage assets](/help/assets/manage-assets.md).

## Quick Start: Spin Sets {#quick-start-spin-sets}

To get you up and running quickly with Spin Sets, follow these steps:

1. [Upload your images for multiple views](#uploading-assets-for-spin-sets).

   At minimum, you need 8-12 shots of an item for a one-dimensional Spin Set and 16-24 for a two-dimensional Spin Set. The shots must be taken at regular intervals to give the impression that the item is rotating and being flipped. For example, if a one-dimensional Spin Set includes 12 shots, rotate the item 30 degrees (360/12) for each shot.

1. [Create Spin Sets](#creating-spin-sets).

   To create a Spin Set, select **[!UICONTROL Create > Spin Set]** and then name the set, choose the assets, and choose the order the images appear.

   See [Working with Selectors](/help/assets/working-with-selectors.md).

   >[!NOTE]
   >
   >You can also create spin sets automatically through [batch set presets](/help/assets/config-dms7.md#creating-batch-set-presets-to-auto-generate-image-sets-and-spin-sets). **Important:** Batch sets are created by the IPS (Image Production System) as part of asset ingestion and are available only in Dynamic Media - Scene7 mode.

1. Set up [Spin Set Viewer presets](/help/assets/managing-viewer-presets.md), as needed.

   Administrators can create or modify Spin Set Viewer Presets. To see your spin set with a viewer preset, select the spin set, and in the left-rail drop-down menu, select **Viewers**.

   See **[!UICONTROL Tools > Assets > Viewer Presets]** to create or edit viewer presets.

   See [Adding and editing viewer presets](/help/assets/managing-viewer-presets.md).

1. [Viewing Spin Sets](#viewing-spin-sets).

   You can view and access sets created by way of batch set presets in three different ways. (Sets created using batch set presets, do *not* appear in the user interface.)

1. [Preview Spin Sets](/help/assets/previewing-assets.md).

   Select the Spin Set and you can preview it. Rotate the Spin Set. You can choose different viewers from the **[!UICONTROL Viewers]** menu, available from the left rail drop-down menu.

1. [Publish Spin Sets](/help/assets/publishing-dynamicmedia-assets.md).

   Publishing a Spin Set activates the URL and Embed string. In addition, you must [publish the viewer preset](/help/assets/managing-viewer-presets.md).

1. [Link URLs to your Web Application](/help/assets/linking-urls-to-yourwebapplication.md) or [Embed the Video or Image Viewer](/help/assets/embed-code.md).

   AEM Assets creates URL calls for Spin Sets and activates them after you publish the spin sets. You can copy these URLs when you preview assets. Alternatively you can embed them on your web site.

   Select the Spin Set, then in the left rail drop-down menu, select **[!UICONTROL Viewers]**.

   See [Linking a Spin Set to a web page](/help/assets/linking-urls-to-yourwebapplication.md) and [Embedding the Video or Image Viewer](/help/assets/embed-code.md).

If you need to, you can [edit Spin Sets](#editing-spin-sets). In addition, you can view and modify [Spin Set properties](/help/assets/manage-assets.md#editing-properties).

## Uploading Assets for Spin Sets {#uploading-assets-for-spin-sets}

At minimum, you need 8-12 shots of an item for a one-dimensional Spin Set and 16-24 for a two-dimensional Spin Set. The shots must be taken at regular intervals to give the impression that the item is rotating and being flipped. For example, if a one-dimensional Spin Set includes 12 shots, rotate the item 30 degrees (360/12) for each shot.

You can upload images for the Spin Sets as you would [upload any other asset in AEM Assets](/help/assets/manage-assets.md).

### Guidelines for capturing images for your Spin Set {#guidelines-for-shooting-spin-set-images}

The following are some best practices around spin set images. In general, the more images you have in a Spin Set, the better the image spinning effect is. However, including many images in the set also increases the amount of time it takes for the images to load. AEM recommends these guidelines for shooting images for use in Spin Sets:

* At minimum, use 8-12 images in a one-dimensional spin set and 16-24 images in a two-dimensional Spin Set. A minimum of 8 images is necessary to be able to turn 360 degrees. One-dimensional Spin Sets are more common as creating two-dimensional Spin Sets is labor intensive.
* Use a lossless format; TIFF and PNG are recommended.
* Mask all images so the item appears on a pure white or other high-contrast background. Optionally, add shadows.
* Make sure that product details are well lighted and in focus.
* Take spin images for fashion clothing with a mannequin or model. Often the mannequin is either completely masked (using a glass mannequin) or a stylized mannequin/dressform is shown in the image. You can create an on-model spin set by defining the number of angles. Mark each angle with tape on the floor to guide the model to step and look in the direction of each shot.

## Creating Spin Sets {#creating-spin-sets}

This section describes how to create Spin Sets in AEM.

>[!NOTE]
>
>You can also create spin sets automatically through [batch set presets](/help/assets/config-dms7.md#creating-batch-set-presets-to-auto-generate-image-sets-and-spin-sets). **Important:** Batch sets are created by the IPS (Image Production System) as part of asset ingestion and are available only in Dynamic Media - Scene7 mode.
>
>See "Creating batch set presets to auto-generate Image Sets and Spin Sets" in [Configuring Dynamic Media - Scene7 mode](/help/assets/config-dms7.md#creating-batch-set-presets-to-auto-generate-image-sets-and-spin-sets).
>

>[!NOTE]
>
>The order in which images appear in a spin set matter. Be sure to order them so that the spin is a smooth 360 degree view.

**To create Spin Sets:**

1. In Assets, navigate to where you want to create a spin set, click **[!UICONTROL Create]**, and select **[!UICONTROL Spin Set]**. You can also create the set from inside a folder that contains your assets. The Spin Set Editor displays.

   ![6_5_spinset-createpulldownmenu](assets/6_5_spinset-createpulldownmenu.png)

1. In the Spin Set Editor, in the **[!UICONTROL Title]** field, enter a name for the Spin Set. The name appears in the banner across the Spin Set. Optionally, enter a description.

   ![6_5_spinset-spinseteditortitle](assets/6_5_spinset-spinseteditortitle.png)

   >[!NOTE]
   >
   >When creating the spin set, you can change the spin set thumbnail or allow AEM to select the thumbnail automatically based on the assets in the spin set. To select a thumbnail, click **[!UICONTROL Change thumbnail]** and select any image (you can navigate to other folders to find images as well). If you have selected a thumbnail and then decide that you want AEM to generate one from the spin set, select **[!UICONTROL Switch to Automatic thumbnail]**.

1. Do either one of the following:

    * Near the upper-left corner of the Spin Set Editor page, tap **[!UICONTROL Add Asset]**.

    * Near the middle of the Spin Set Editor page, tap **[!UICONTROL Tap to open Asset Selector]**.

   Tap to select assets that you want to include in your Spin Set. Selected assets have a checkmark icon over them. When you are finished, near the upper-right corner of the page, tap **[!UICONTROL Select]**.

   With the Asset Selector, you can search for assets by typing in a keyword and tapping **[!UICONTROL Return]**. You can also apply filters to refine your search results. You can filter by path, collection, file type, and tag. Select the filter and then tap the **[!UICONTROL Filter]** icon on the toolbar. Change the view by tapping the View icon and selecting **[!UICONTROL Column View]**, **[!UICONTROL Card View]**, or **[!UICONTROL List View]**.

   See [Working with Selectors](/help/assets/working-with-selectors.md).

   ![chlimage_1-383](assets/chlimage_1-383.png)

1. When you add assets to your set, they are automatically added in alphanumeric order. You can manually re-order or sort assets after you add them.

   If necessary, drag an asset's Reorder icon to the right of the asset's file name to re-order images up or down the set list.

   ![Reordering Frame 11 in the spin set by dragging it to a new location](assets/6_5_spinset-reorderassets.png).

   Reordering Frame 11 in the spin set by dragging it to a new location.

1. (Optional) Do any of the following:

    * To delete an image, select the image and tap **[!UICONTROL Delete Asset]**.

    * To apply a preset, near the upper-right corner of the page, tap **[!UICONTROL Preset]**, then select a preset to apply to all the assets at once.

1. Click **[!UICONTROL Save]**. Your newly created Spin Set appears in the folder you created it in.

## Viewing Spin Sets {#viewing-spin-sets}

You can create spin sets either in the user interface or automatically using [batch set presets](/help/assets/config-dms7.md#creating-batch-set-presets-to-auto-generate-image-sets-and-spin-sets). However, sets created using batch set presets, do *not* appear in the user interface. You can access sets created via batch set presets in three different ways. (These methods are available even if you created the spin sets in the user interface).

>[!NOTE]
>
>You can also view sets by way of the user interface as described in [Editing Spin Sets](#editing-spin-sets).

**To view Spin Sets:**

1. When opening the properties of an individual asset. Properties indicate what sets the selected asset is a member of (under **[!UICONTROL Member of Sets]**). Click the name of the set to see the entire set.

   ![chlimage_1-156](assets/chlimage_1-384.png)

1. From a member image of any set. Select the **[!UICONTROL Sets]** menu to display the sets that the asset is a member of.

   ![chlimage_1-157](assets/chlimage_1-385.png)

1. From search, you can Select **[!UICONTROL Filters]**, then expand **[!UICONTROL Dynamic Media]** and select **[!UICONTROL Sets]**.

   The search returns matching sets that were manually created in the UI or automatically created through batch set presets. For automated sets, the search query is conducted using `Starts with` search criteria which is different from AEM search which is based on using `Contains` search criteria. Setting the filter to **[!UICONTROL Sets]** is the only way to search automated sets.

   ![chlimage_1-158](assets/chlimage_1-386.png)

## Editing Spin Sets {#editing-spin-sets}

You can perform a variety of editing tasks on Spin Sets such as the following:

* Add images to the Spin Set.
* Re-order images in the Spin Set.
* Delete assets in the Spin Set.
* Apply viewer presets.
* Delete the Spin Set.

**To edit a Spin Set:**

1. Do any one of the following:

    * Hover over a Spin Set asset, then tap **[!UICONTROL Edit]** (pencil icon).
    * Hover over a Spin Set asset, tap **[!UICONTROL Select]** (checkmark icon), then tap **[!UICONTROL Edit]** on the toolbar.

    * Tap on a Spin Set asset, then tap **[!UICONTROL Edit]** (pencil icon) on the toolbar.

1. To edit the Spin Set, do any of the following:

    * To reorder images, drag an image to a new location (select the reorder icon to move items).
    * To sort items in ascending or descending order, click the column heading.
    * To add an asset or update an existing asset, click **[!UICONTROL Add Asset]**. Navigate to an asset, select it, then tap **[!UICONTROL Select]** near the upper-right corner.
    If you delete the image that AEM uses for the thumbnail by replacing it with another image, the original asset still displays.
    * To delete an asset, select it and click or tap **[!UICONTROL Delete Asset]**.
    * To apply a preset, tap or click the Preset icon and select a preset.
    * To delete an entire Spin Set, navigate to the Spin Set, select it, and select **[!UICONTROL Delete]**
    >[!NOTE]
    >
    >You can edit the images in a Spin Set by navigating to the set, tap **[!UICONTROL Set Members]** in the left rail, and then tap the Pencil icon on an individual asset to open the editing window.

1. Click **[!UICONTROL Save]** when done editing.

## Previewing Spin Sets {#previewing-spin-sets}

See [Previewing Assets](/help/assets/previewing-assets.md).

## Publishing Spin Sets {#publishing-spin-sets}

See [Publishing Assets](/help/assets/publishing-dynamicmedia-assets.md).

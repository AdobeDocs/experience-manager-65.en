---
title: Working with 3D assets in Dynamic Media
seo-title: Working with 3D assets in Dynamic Media
description: Learn how to work with 3D assets in Dynamic Media
seo-description: Learn how to work with 3D assets in Dynamic Media
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: introduction
content-type: reference
---

# Working with 3D assets in Dynamic Media {#working-with-three-d-assets-dm}

Dynamic Media lets you upload, manage, view, and deliver 3D assets as immersive experiences. 

* One-click publishing (using **[!UICONTROL Quick Publish]** on the toolbar) of 3D images to generate its URL.
* Optimized support for viewing 3D assets with the high-quality, interactive Dimensional viewer preset powered by Adobe Dimension. The viewer preset includes, among other things, a collection of interactive camera controls that let you orbit, zoom, and pan.
* The 3D Media WCM component lets you easily add 3D assets to your AEM Sites pages.

There is no installation or configuration of any kind to use 3D assets in Dynamic Media.

![shoe in 3d](/help/assets/assets-dm/3d-dimensional-viewer-quickpublish-url-embed2.png)

<!-- See also [Dynamic Media 3D Release Notes](/help/release-notes/aem3d-release-notes.md). -->

## Supported 3D file formats in Dynamic Media {#supported-three-d-file-formats-in-dm} 

Dynamic Media supports the following 3D file formats: 

|3D file extension |File format | MIME type |Notes |
|---|---|---|---|
| GLB |Binary GL Transmission|model/gltf-binary | Includes the textures with the asset instead of referencing them as external images.|
| OBJ |WaveFront 3D Object File|application/x-tgif ||
| STL |Stereolithography|application/vnd.ms-pki.stl ||
| USDZ |Universal Scene Description Zip archive|model/vnd.usdz+zip |*Support for ingestion only; no viewing or interaction is available.* USDZ is Apple's proprietary 3D format that can only be view by Safari or iOS.|

## Quick Start: 3D assets in Dynamic Media {#quick-start-three-d}

The following step-by-step workflow description is designed to help you get up and running quickly with 3D assets in Dynamic Media - Scene7 mode. 

>[!NOTE]
>
>3D assets are not supported in Dynamic Media - Hybrid mode.

Before you work with 3D assets in Dynamic Media, make sure that your AEM administrator has already enabled and configured Dynamic Media Cloud Services in Dynamic Media - Scene7 mode.

See [Configuring Dynamic Media Cloud Services](/help/assets/config-dms7.md#configuring-dynamic-media-cloud-services) in Configuring Dynamic Media - Scene7 mode and [Troubleshooting Dynamic Media - Scene7 mode.](/help/assets/troubleshoot-dms7.md)

1. **Upload 3D assets**

    * [Uploading your 3D assets for use in Dynamic Media](/help/assets/managing-assets-touch-ui.md#uploading-assets).
    * [Supported 3D file formats for upload in Dynamic Media](#supported-three-d-file-formats-in-dm).

1. **Manage 3D assets**

    * Organize and search 3D assets

        * [Organizing digital assets](/help/assets/organize-assets.md#organize-digital-assets).
        * [Searching 3D assets](/help/assets/search-assets.md).
        * [Using custom predicates to filter search results](/help/assets/search-assets.md#custompredicates).

    * View 3D assets

        * [Viewing and interacting with 3D assets](#viewing-three-d-assets).
        * [Managing the Dimensional viewer preset](/help/assets/managing-viewer-presets.md).

    * Work with 3D asset metadata

        * [Managing metadata for digital assets](/help/assets/metadata.md).
        * [Metadata schemas](/help/assets/metadata-schemas.md).

1. **Publish 3D assets**

    * [Publishing Dynamic Media 3D assets](#publishing-three-d-assets)

## About viewing and interacting with 3D assets {#viewing-three-d-assets}

This section describes how to view and interact with 3D assets two different ways: from within the asset details page and from within the 3D Media component in Sites.

The interactive 3D viewer includes, among other things, a collection of interactive camera controls that let you orbit, zoom, and pan the 3D asset.

Be aware that the time it takes to open a 3D asset in the Asset Details page view depends on several factors. These factors include such things as the following:

* Bandwidth to the server.
* Latencies to the server
* Complexity of the image.

In addition, the capabilities of the client computer-such as a workstation, notebook, or mobile touch device-are also important to consider when you manipulate the camera interactively. A reasonably powerful system with good graphics capabilities can make the interactive 3D viewing experience smoother and more favorable.

>[!TIP]
>
>You can open the Dimensional viewer preset in the Viewer Preset Editor to practice navigating a 3D asset without the need to first upload any 3D files. The Dimensional viewer preset has a built-in 3D asset for you to interact with.
>
>See [Managing viewer presets](/help/assets/managing-viewer-presets.md).

## Viewing and interacting with a 3D asset from the asset details page {#viewing-three-d-assets-from-asset-details-page}

See also [Previewing assets using the software interface](/help/assets/previewing-assets.md).

**To view and interact with a 3D asset from the asset details page**

1. Make sure you have uploaded 3D assets into AEM.

    See [Uploading your 3D assets for use in Dynamic Media](/help/assets/managing-assets-touch-ui.md#uploading-assets).

1. From AEM, on the **[!UICONTROL Navigation]** page, tap **[!UICONTROL Assets > Files]**.
1. Near the upper-right corner of the page, from the **[!UICONTROL View]** drop-down list, tap **[!UICONTROL Card View]**.
1. Navigate to a 3D asset that you want to view.
1. Tap the card of the 3D asset to open it in the asset details page.  
1. On the details view page for the 3D asset, do any of the following:

    * **Turn your camera** &ndash; Orbit your view around the 3D scene and objects.
      * _Mouse_: Left click + drag.
      * _Touch screen_: Single-finger press + drag.
    * **Pan your camera** &ndash; Pan your view left, right, up, or down.
      * _Mouse_: Right click + drag.
      * _Touch screen_: Two-finger press + drag.
    * **Zoom your camera** &ndash; Zoom your camera to move in and out of areas of the 3D scene.
      * _Mouse_: Scroll wheel.
      * _Touch screen_: Two-finger pinch.
    * **Recenter your camera** &ndash; Recenter your camera to a point on a object in the 3D scene.
      * _Mouse_: Double-click.
      * _Touch screen_: Double-tap.
    * **Reset** &ndash; Near the lower-right corner of the page, tap the Reset icon to restore the view target point to the center of the 3D asset. Reset also moves the camera closer or further away to show the asset in its entirety and at a reasonable viewing size.
    * **Full screen mode** &ndash; To enter full screen mode, in the lower-right corner of the page, tap the Fullscreen icon.

1. In the upper-right corner of the page, tap **[!UICONTROL Close]** to return to the Assets page.

## Viewing and interacting with a 3D asset inside a 3D Media component {#interacting-with-asset-inside-three-d-media-component}

When a web page is in **[!UICONTROL Edit]** mode, no interaction is possible with a 3D asset. To make the asset interactive, you can use the **[!UICONTROL Preview]** feature to view the web page in the page editor with full access to the functionality of the 3D Media component.

>[!IMPORTANT]
>
>You can accomplish this task only after you have added a 3D Media component to a web page and assigned a 3D asset to the component. See [Adding the 3D Media component to a web page](#adding-the-three-d-media-component-to-a-web-page) and [Assigning a 3D asset to a 3D Media component](#assigning-a-three-d-asset-to-the-component).

See also [Previewing assets using the software interface](/help/assets/previewing-assets.md).

**To view and interact with a 3D asset inside a 3D Media component**

1. While a web page is in **[!UICONTROL Edit]** mode, do either one of the following:

    * Near the upper-right of the page, click **[!UICONTROL Preview]** to enter **[!UICONTROL Preview]** mode.
    * Delete `/editor.html` from the page URL in the browser.

    ![3D asset showing inside the 3D Media component](/help/assets/assets-dm/3d-asset-in-3d-media.png)
    A fully interactive 3D asset as displayed in **[!UICONTROL Preview]** mode.

1.  While in **[!UICONTROL Preview]** mode, do any of the following:

    * **Turn your camera** &ndash; Orbit your view around the 3D scene and objects.
      * _Mouse_: Left click + drag.
      * _Touch screen_: Single-finger press + drag.
    * **Pan your camera** &ndash; Pan your view left, right, up, or down.
      * _Mouse_: Right click + drag.
      * _Touch screen_: Two-finger press + drag.
    * **Zoom your camera** &ndash; Zoom your camera to move in and out of areas of the 3D scene.
      * _Mouse_: Scroll wheel.
      * _Touch screen_: Two-finger pinch.
    * **Recenter your camera** &ndash; Recenter your camera to a point on a object in the 3D scene.
      * _Mouse_: Double-click.
      * _Touch screen_: Double-tap.
    * **Reset** &ndash; Near the lower-right corner of the page, tap the Reset icon to restore the view target point to the center of the 3D asset. Reset also moves the camera closer or further away to show the asset in its entirety and at a reasonable viewing size.
    * **Full screen mode** &ndash; To enter full screen mode, in the lower-right corner of the page, tap the Fullscreen icon.

## About working with the 3D Media component {#working-with-three-d-media-component}

Dynamic Media includes a Dynamic Media 3D Media component that you can use in AEM Sites to enable interactive viewing of 3D models on your web pages.

* [Adding the 3D Media component to the page template](#adding-three-d-media-component-to-page-template)
* [Adding the 3D Media component to a web page](#adding-the-three-d-media-component-to-a-web-page)
  * [Optional &ndash; Configuring the 3D Media component](#configuring-the-three-d-component)
* [Assigning a 3D asset to the 3D Media component](#assigning-a-three-d-asset-to-the-component)


## Adding the 3D Media component to the page template {#adding-three-d-media-component-to-page-template}

1. Navigate to **[!UICONTROL Tools > General > Templates]**.  
1. Navigate to the page template that you want to enable the 3D component in and select the template.  
1. Tap **[!UICONTROL Edit]** to open the template.
1. Near the upper-right of the page, in the drop-down menu, select **[!UICONTROL Structure]** mode, if it is not already active.

   ![3d-media-component-structure](/help/assets/assets-dm/3d-media-component-structure.png)

1. Tap an empty area in the **[!UICONTROL Layout Container]** region to select it and open its associated toolbar.  
1. On the toolbar, tap the **[!UICONTROL Policy]** icon to open the **[!UICONTROL Policy Editor]**.
1. In the **[!UICONTROL Properties]** section, under the **[!UICONTROL Allowed Components]** tab, scroll to **[!UICONTROL Dynamic Media]**, then expand the list and check **[!UICONTROL 3D Media]**.
1. Tap **[!UICONTROL Done]** to save the changes and close the **[!UICONTROL Policy Editor]**.

   You can now place the Dynamic Media 3D Media component on all pages that use this template.

## Adding the 3D Media component to a web page {#adding-the-three-d-media-component-to-a-web-page}

If you are using Adobe Experience Manager as your web content management system you can add 3D assets to your web pages by way of the 3D Media component.

See also [Adding Dynamic Media assets to pages](/help/assets/adding-dynamic-media-assets-to-pages.md).

1. Open AEM Sites and select the web page to which you want to add the Dynamic Media 3D Media component.  
1. Tap the **[!UICONTROL Edit]** (pencil) icon to open the page into the page editor. Make sure **[!UICONTROL Edit]** mode is selected near the upper-right of page.

   ![3d-media-component-add](/help/assets/assets-dm/3d-media-component-edit.png)

1. On the toolbar, tap the Side Panel icon to toggle or "turn on" the display of the panel.  

1. In the side panel, tap the plus sign icon to open the **[!UICONTROL Components]** list.

    ![3d-media-component-drag-drop](/help/assets/assets-dm/3d-assets-filter.png)

1. Drag the **[!UICONTROL 3D Media]** component from the **[!UICONTROL Components]** list to the location on the page where you want the 3D viewer to appear. 

You are now ready to assign a 3D asset to the component.

See [Assigning a 3D asset to the a 3D Media component](#assigning-a-three-d-asset-to-the-component).

### Optional &ndash; Configuring the 3D Media component {#configuring-the-three-d-component}

1. In the AEM Sites page editor, select the **[!UICONTROL 3D Media Viewer]** component that you previously added to the page.  
1. Tap the **[!UICONTROL Configuration]** icon (wrench) to open the component configuration dialog box.

    ![3d-media-component-config](/help/assets/assets-dm/3d-media-component-config.png)

1. In the 3D Media dialog box, from the Viewer Preset drop-down list, select **[!UICONTROL Dimensional]** to assign the Dimensional viewer preset to the component.

    ![3d-media-component-edit-config](/help/assets/assets-dm/3d-media-component-edit-config.png)

1. In the upper-right corner, tap the check mark to save your changes.

## Assigning a 3D asset to the 3D Media component {#assigning-a-three-d-asset-to-the-component}

After you have added a 3D Media component to a web page, you can assign a 3D asset to it.

See [Adding the 3D Media component to a web page](#adding-the-three-d-media-component-to-a-web-page).

1. In the AEM Sites page editor, click the **[!UICONTROL Assets]** icon to open **[!UICONTROL Assets]** in the side panel.  
1. In the drop-down list, select **[!UICONTROL 3D]** to show only 3D asset file types.
1. In the side panel, search for or scroll to the 3D asset that you want to view on the page being edited.
1. Drag the 3D asset from the Assets side panel and drop it onto the **[!UICONTROL 3D Media]** component that you previously added to the page.

    ![Assign 3d asset to 3d Media component](/help/assets/assets-dm/3d-asset-add.png)

>[!NOTE]
>
>While a web page is in the AEM Sites **[!UICONTROL Edit]** mode, the 3D Media component displays the 3D asset but no interaction with the asset is possible. To make the asset interactive, you can use the **[!UICONTROL Preview]** feature to view the web page in the page editor with full access to the functionality of the 3D Media component.

## Publishing Dynamic Media 3D assets {#publishing-three-d-assets}

Dynamic Media accepts a variety of 3D file formats that are supported as *static content* in Dynamic Media. Static content means that you can upload and published 3D assets, but there is no support for *dynamic* imaging or image refitting that is associated with the 3D asset. The reason is because Dynamic Media Imaging Server does not recognize 3D formats. As such, after you publish a 3D asset in Dynamic Media, you have an instant URL that you can copy. The URL for the 3D asset follows the usual Dynamic Media URL structure. However, you cannot edit any parameters in the asset's URL, unlike traditional image assets in Dynamic Media.

In the **[!UICONTROL Card View]**, a small globe icon appears directly below an asset's name and to the left of its date and time to indicate that it is published. In the **[!UICONTROL List View]**, a **[!UICONTROL Published]** column indicates which assets are published or which are not.

See also [Publishing Dynamic Media assets](publishing-dynamicmedia-assets.md).

See also [Publishing Pages](/help/sites-authoring/publishing-pages.md).

>[!MORELIKETHIS]
>
>If you are using a third-party web content management system, you can link or embed 3D assets to your web pages.
>
>See [Linking URLs to your web application](linking-urls-to-yourwebapplication.md).
>

**To publish Dynamic Media 3D assets**

1. Open a 3D asset (GLB, OBJ, or STL file format) to view it in the asset details page.
1. On the toolbar, tap **[!UICONTROL Quick Publish]**.

    ![3d-asset-quick-publish](/help/assets/assets-dm/3d-asset-quick-publish.png)

1. Tap **[!UICONTROL Close]** to exit the dialog box and return to the asset details page.
1. From the drop-down list to the left of the 3D asset's file name, tap **[!UICONTROL Renditions]**.

    ![3d-asset-renditions](/help/assets/assets-dm/3d-asset-renditions.png)

1. Tap **[!UICONTROL original]**. When a 3D asset is published (or "activated") the URL button appears near the bottom-left corner of the page if all of the following 3D asset conditions are met:
    * The 3D asset is a supported format (GLB, OBJ, STL, and USDZ).
    * The 3D asset was ingested into the Dynamic Media Image Production System (IPS).
    * The 3D asset is published.

    ![3d-asset-url](/help/assets/assets-dm/3d-asset-url.png)

1. Tap **[!UICONTROL URL]** to display the 3D asset's production URL. 

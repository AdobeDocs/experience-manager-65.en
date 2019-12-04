---
title: Previewing Assets
seo-title: Previewing Assets
description: Learn how to preview assets in dynamic media
seo-description: Learn how to preview assets in dynamic media
uuid: 09e97245-373b-4d50-8ba3-5d1034a29988
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
discoiquuid: bb8c355c-4475-45ec-9096-0975f0ce2c27
docset: aem65

---

# Previewing assets{#previewing-assets}

You can use Preview to see how a digital asset that you have uploaded looks when it is viewed by a customer in their own web browser. The default embedded, cross-device viewer that is assigned to the asset is used for the Preview.

A viewer is a collection of various settings or "presets," such as the viewer display size, zoom behavior, color schemes, borders, fonts, and so forth, that determine how users view rich-media assets on their computer screens and mobile devices.

Besides using the dedicated Preview feature for video, spin sets, and image sets, you can also preview an asset by using viewer presets that you have created. Or, use image presets to preview renditions of images.

* [Applying Image Presets](/help/assets/image-presets.md)
* [Applying Viewer Presets](/help/assets/viewer-presets.md)

>[!NOTE]
>
>When you are on a webpage (Sites) in AEM, you cannot preview assets in **Edit** mode. You need to go to **Preview** mode by clicking **Preview** in the upper right-hand corner.

To enable or disable viewer presets in the user interface, see [Managing Viewer Presets](/help/assets/managing-viewer-presets.md).

**To preview assets**

1. From **[!UICONTROL Adobe Experience Manager**, on the **[!UICONTROL Navigation** page, tap **[!UICONTROL Assets]**, then **[!UICONTROL Files]** to access assets.
1. Near the upper-right corner of the page, from the **[!UICONTROL View]** drop-down list, tap **[!UICONTROL List View]**.
1. (Optional) Use the **[!UICONTROL Type]** column to sort the assets by the type you want to preview.
1. Under the **[!UICONTROL Title]** column, click the title name (not the thumbnail image) of the asset you want to preview.
1. Depending on the asset type you clicked, do any one of the following:

    <table>
    <tbody>
      <tr>
      <td><strong>Asset type you clicked</strong><br /> </td>
      <td><strong>Able to preview asset in a particular rendition?</strong></td>
      <td><strong>Able to preview asset in a particular viewer?</strong></td>
      </tr>
      <tr>
      <td><p>Image</p> </td>
      <td>Yes</td>
      <td>Yes</td>
      <td><p><strong>To preview asset in a particular rendition</strong></p>
        <ul>
        <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Click <strong>Renditions </strong>from the list, then select a particular rendition that you want to preview.</li>
        </ul> <p><strong>To preview asset in a particular viewer</strong></p>
        <ul>
        <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Click <strong>Viewers</strong> from the list, then select a viewer that you want to apply to the asset.</li>
        </ul> <p>Use the <strong>+</strong> and <strong>- </strong>icons to increase or decrease the zoom of the selected image, respectively. Click <strong>Reset</strong> to return the image to the original zoom.<br /> If you are on a mobile device, double-tap the image to zoom in by steps. When you reach maximum zoom, double-tap the image again to reset the zoom state. Drag across the image to pan.</p> </td>
      </tr>
      <tr>
      <td>Multimedia</td>
      <td>Yes</td>
      <td>Yes</td>
      <td><p><strong>To preview asset in a particular rendition</strong></p>
        <ul>
        <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Click <strong>Renditions </strong>from the list, then select a particular rendition that you want to preview.</li>
        </ul> <p>Selecting a higher-resolution video rendition to preview may cause the video to appear truncated. That is because the rendition preview shows you the exact resolution that your customers will see it, all in the context of the embedded viewer that is used for the preview.</p> <p>When you preview an adaptive video set at the Asset level the renditions are grouped into one playback experience. That is, the adaptive video is sized properly for viewing and played back using the best resolution in the context of your viewing device and connection speed.<br /> </p> <p><strong>To preview an asset in a particular viewer</strong></p>
        <ul>
        <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Click <strong>Viewers</strong> from the list, then select a viewer that you want to apply to the asset.</li>
        </ul> </td>
      </tr>
      <tr>
      <td>Image set</td>
      <td>No</td>
      <td>Yes</td>
      <td><p><strong>To preview an asset in a particular viewer</strong></p>
        <ul>
        <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Click <strong>Viewers</strong> from the list, then select a viewer that you want to apply to the asset.</li>
        </ul> <p>Use the <strong>+</strong> and <strong>- </strong>icons to increase or decrease the zoom of the selected image, respectively. Click <strong>Reset</strong> to return the image to the original zoom.<br /> If you are on a mobile device, double-tap the image to zoom in by steps. When you reach maximum zoom, double-tap the image again to reset the zoom state. Drag across the image to pan.</p> </td>
      </tr>
      <tr>
      <td>Spin set</td>
      <td>No</td>
      <td>Yes</td>
      <td><p><strong>To preview an asset in a particular viewer</strong></p>
        <ul>
        <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Click <strong>Viewers</strong> from the list, then select a viewer that you want to apply to the asset.</li>
        </ul> <p>Use the <strong>+</strong> and <strong>- </strong>icons to increase or decrease the zoom of the selected image, respectively. Click <strong>Reset</strong> to return the image to the original zoom.<br /> If you are on a mobile device, double-tap the image to zoom in by steps. When you reach maximum zoom, double-tap the image again to reset the zoom state. Drag across the image to pan.</p> </td>
      </tr>
      <tr>
      <td>Mixed Media set</td>
      <td>No</td>
      <td>Yes</td>
      <td><p><strong>To preview an asset in a particular viewer</strong></p>
        <ul>
        <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Click <strong>Viewers</strong> from the list, then select a viewer that you want to apply to the asset.</li>
        </ul> <p>Use the <strong>+</strong> and <strong>- </strong>icons to increase or decrease the zoom of the selected image, respectively. Click <strong>Reset</strong> to return the image to the original zoom.<br /> If you are on a mobile device, double-tap the image to zoom in by steps. When you reach maximum zoom, double-tap the image again to reset the zoom state. Drag across the image to pan.</p> </td>
      </tr>
      <tr>
      <td>Carousel set</td>
      <td>No</td>
      <td>Yes</td>
      <td><strong>To preview an asset in a particular viewer</strong>
        <ul>
        <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Select a viewer that you want to apply to the asset.</li>
        </ul> </td>
      </tr>
      <tr>
      <td>360 Video<br /> </td>
      <td>Yes</td>
      <td>Yes</td>
      <td><p><strong>To preview asset in a particular rendition</strong></p>
        <ul>
        <li>Near the upper-left corner of the page, tap the icon so the drop-down list appears. Select <strong>Renditions</strong>, then select the rendition that you want to preview.</li>
        </ul> <p><strong>To preview asset in a particular viewer</strong></p>
        <ul>
        <li>Near the upper-left corner of the page, tap the icon so the drop-down list appears. Select <strong>Viewers</strong>, then select a viewer that you want to apply to the asset.</li>
        </ul> <p>Use the <strong>+</strong> and <strong>- </strong>icons to increase or decrease the zoom of the selected image, respectively. Click <strong>Reset</strong> to return the image to the original zoom.<br /> If you are on a mobile device, double-tap the image to zoom in by steps. When you reach maximum zoom, double-tap the image again to reset the zoom state. Drag across the image to pan.</p> </td>
      </tr>
    </tbody>
    </table>

## Previewing 3D assets{#previewing-3d-assets}

Experience Manager supports the upload, delivery, and interactive preview of 3D assets as part of the authoring process. 

The interactive 3D viewer is available from the asset details page in AEM. The viewer includes, among other things, a collection of interactive camera controls that let you orbit, zoom, and pan the 3D asset. 

### Supported formats for 3D preview{#supported-3d-previewing-assets} 

Interactive 3D preview supports the following file formats: 

|3D file extension |File format | MIME type |Notes |
|-|-|-|-|
| GLB |Binary GL Transmission|model/gltf-binary ||
| GLTF |GL Transmission Format|model/gltf+json |See **Note** below. |
| OBJ |WaveFront 3D Object File|application/x-tgif ||
| STL |Stereolithography|application/vnd.ms-pki.stl ||
| DN |Adobe Dimension|model/x-adobe-dn |Support for ingestion only; preview not available.|
| USDZ |Universal Scene Description Zip archive|model/vnd.usdz+zip |Support for ingestion only; preview not available.|

**Note**: If materials do not render in preview of a gLTF model, make sure they are named properly and located in a `textures` folder in the same root folder as the model, similar to the following:

    Asset (folder)
        model.gltf
        model.bin
        textures (folder)
            material_0_baseColor.jpeg
            material_0_normal.jpeg

### Performance considerations when you preview 3D assets{#performance-3d-previewing-assets}

The time it takes to open a 3D asset in the asset details view page depends on several factors such things as bandwidth, image complexity, and latencies to the server.

In addition, the capabilities of the client computer&mdash;such as a workstation, notebook, or mobile touch device&mdash;are also important to consider when you manipulate the camera interactively. A reasonably powerful system with good graphics capabilities can make the interactive 3D viewing experience smoother and more favorable. 

**To preview 3D assets**

1. Make sure you have uploaded 3D assets into AEM.
    See [Supported formats for 3D preview](#supported-3d-previewing-assets) and [Uploading assets](/help/assets/managing-assets-touch-ui.md#uploading-assets).
1. From AEM, on the **[!UICONTROL Navigation]** page, tap **[!UICONTROL Assets > Files]**.

    ![Navigation page](/help/assets/assets/navigation-assets.png
    )

1. Near the upper-right corner of the page, from the View drop-down list, tap **[!UICONTROL Card View]**, then navigate to a 3D asset that you want to preview.

    ![3D card select](/help/assets/assets/3d-card-select.png)
    _In Card View, tap the card of the 3D asset you want to preview._

1. Tap the card of the 3D asset to open it in the asset details view page.

    ![Interactive 3D preview](/help/assets/assets/3d-preview.png)
    _Interactive preview of a 3D asset in the asset details view page._ 
1. On the asset details view page for the 3D asset, do any of the following:
    * **Turn your camera**&mdash;Orbit your view around the 3D scene and objects.
      * _Mouse_: Left click + drag.
      * _Touch screen_: Single-finger press + drag. 
    * **Pan your camera**&mdash;Pan your view left, right, up, or down.
      * _Mouse_: Right click + drag.
      * _Touch screen_: Two-finger press + drag.
    * **Zoom your camera**&mdash;Zoom your camera to move in and out of areas of the 3D scene.
      * _Mouse_: Scroll wheel.
      * _Touch screen_: Two-finger pinch.
    * **Recenter your camera**&mdash;Recenter your camera to a point on a object in the 3D scene.
      * _Mouse_: Double-click.
      * _Touch screen_: Double-tap.
    * **Reset**&mdash;Near the lower-right corner of the page, tap the Reset icon to restore the view target point to the center of the 3D asset. Reset also moves the camera closer or further away to show the asset in its entirety and at a reasonable viewing size. 
    * **Full screen mode**&mdash;To enter full screen mode, in the lower-right corner of the page, tap the Fullscreen icon.

1. When you are finished, near the upper-right corner of the page, tap **[!UICONTROL Close]**.

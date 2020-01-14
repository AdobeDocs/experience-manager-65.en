---
title: Previewing 3D assets
seo-title: Previewing 3D assets
description: Learn how to preview 3D assets
seo-description: Learn how to preview 3D assets
contentOwner: Rick Brough
docset: aem65

---

# Previewing 3D assets{#previewing-3d-assets}

Experience Manager supports the upload, delivery, and interactive preview of 3D assets as part of the authoring process.

The interactive 3D viewer is available from the asset details page in AEM. The viewer includes, among other things, a collection of interactive camera controls that let you orbit, zoom, and pan the 3D asset. 

## Supported formats for 3D preview{#supported-3d-previewing-assets} 

Interactive 3D preview supports the following file formats: 

|3D file extension |File format | MIME type |Notes |
|---|---|---|---|
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

## Performance considerations when you preview 3D assets{#performance-3d-previewing-assets}

The time it takes to open a 3D asset in the asset details view page depends on several factors such things as bandwidth, image complexity, and latencies to the server.

In addition, the capabilities of the client computer&mdash;such as a workstation, notebook, or mobile touch device&mdash;are also important to consider when you manipulate the camera interactively. A reasonably powerful system with good graphics capabilities can make the interactive 3D viewing experience smoother and more favorable. 

**To preview 3D assets**

1. Make sure you have uploaded 3D assets into AEM.
    See [Supported formats for 3D preview](#supported-3d-previewing-assets) and [Uploading assets](/help/assets/managing-assets-touch-ui.md#uploading-assets).
1. From AEM, on the **[!UICONTROL Navigation]** page, tap **[!UICONTROL Assets > Files]**.

    ![Navigation page](/help/assets/assets-dm/navigation-assets.png
    )

1. Near the upper-right corner of the page, from the View drop-down list, tap **[!UICONTROL Card View]**, then navigate to a 3D asset that you want to preview.

    ![3D card select](/help/assets/assets-dm/3d-card-select.png)
    _In Card View, tap the card of the 3D asset you want to preview._

1. Tap the card of the 3D asset to open it in the asset details view page.

    ![Interactive 3D preview](/help/assets/assets-dm/3d-preview.png)
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

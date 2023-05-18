---
title: Preview 3D assets
description: Learn how to preview 3D assets in Experience Manager.
contentOwner: Rick Brough
docset: aem65
feature: 3D Assets
role: User
exl-id: fdebbc2b-c04d-4cdd-b7c2-8e9a2a854e79
hide: yes
---
# Preview 3D assets in Adobe Experience Manager {#previewing-3d-assets-aem}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service  |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/assets/manage/previewing-3d-assets.html?lang=en)                  |
| AEM 6.5     | This article         |

Experience Manager supports the upload, delivery, and interactive preview of 3D assets as part of the authoring process.

The interactive 3D viewer is available from the asset details page in Experience Manager. The viewer includes, among other things, a collection of interactive camera controls that let you orbit, zoom, and pan the 3D asset.

<!-- See also [Working with 3D assets in Dynamic Media](/help/assets/assets-3d.md). -->

## Supported formats for 3D preview in Experience Manager {#supported-3d-previewing-assets} 

Interactive 3D preview supports the following file formats: 

|3D file extension |File format | MIME type |Notes |
|---|---|---|---|
| GLB | Binary GL Transmission | model/gltf-binary | |
| GLTF | GL Transmission Format | model/gltf+json | See **Note** below. |
| OBJ | WaveFront 3D Object File | application/x-tgif | |
| STL | Stereolithography | application/vnd.ms-pki.stl | |
| DN | Adobe Dimension | model/x-adobe-dn | Support for ingestion only; preview not available.|
| USDZ | Universal Scene Description Zip archive | model/vnd.usdz+zip | Support for ingestion only; preview not available.|

>[!NOTE]
>
>If materials do not render in preview of a gLTF model, make sure they are named properly and in a `textures` folder in the same root folder as the model, similar to the following:

    Asset (folder)
        model.gltf
        model.bin
        textures (folder)
            material_0_baseColor.jpeg
            material_0_normal.jpeg

## Performance considerations when you preview 3D assets in Experience Manager{#performance-3d-previewing-assets}

The time it takes to open a 3D asset in the asset details view page depends on several factors such things as bandwidth, image complexity, and latencies to the server.

In addition, the capabilities of the client computer &ndash; such as a workstation, notebook, or mobile touch device &ndash; are also important to consider when you manipulate the camera interactively. A reasonably powerful system with good graphics capabilities can make the interactive 3D viewing experience smoother and more favorable.

**To preview 3D assets in Experience Manager:**

1. Make sure you have uploaded 3D assets into Experience Manager.
    See [Supported formats for 3D preview](#supported-3d-previewing-assets) and [Upload Assets](/help/assets/manage-assets.md#uploading-assets).
1. From Experience Manager, on the **[!UICONTROL Navigation]** page, select **[!UICONTROL Assets]** > **[!UICONTROL Files]**.

    ![Navigation page](/help/assets/assets-dm/navigation-assets.png
    )

1. Near the upper-right corner of the page, from the View drop-down list, select **[!UICONTROL Card View]**, then navigate to a 3D asset that you want to preview.

    ![3D card select](/help/assets/assets-dm/3d-card-select.png)
    _In Card View, select the card of the 3D asset you want to preview._

1. Select the card of the 3D asset.

    ![Interactive 3D preview](/help/assets/assets-dm/3d-preview.png)
    _Interactive preview of a 3D asset in the asset details view page._ 
1. On the asset details view page for the 3D asset, do any of the following:

    | View | Description | Mouse action | Touch screen action |
    | --- | --- | --- | --- |
    | **Turn your camera** | Orbit your view around the 3D scene and objects. | Left click + drag. | Single-finger press + drag. |
    | **Pan your camera**  | Pan your view left, right, up, or down. | Right click + drag. | Two-finger press + drag. |
    | **Zoom your camera**  | Move in and out of areas in the 3D scene. | Scroll wheel. | Two-finger pinch. |
    | **Recenter your camera**  | Recenter your camera to a point on an object in the 3D scene. | Double-click. | Double-tap. |
    | **Reset**  | Near the lower-right corner of the page, select the Reset icon to restore the view target point to the center of the 3D asset. Reset also moves the camera closer or further away to show the asset in its entirety and at a reasonable viewing size.  |   |   |
    | **Full screen mode**  | To enter full screen mode, in the lower-right corner of the page, select the Fullscreen icon.  |   |   |

1. When you are finished, near the upper-right corner of the page, select **[!UICONTROL Close]**.

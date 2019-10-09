---
title: Rendering 3D assets
seo-title: Rendering 3D assets
description: Learn how to render 3D assets you manipulated and saved in AEM to create 2D images for your web pages.
seo-description: Learn how to render 3D assets you manipulated and saved in AEM to create 2D images for your web pages.
uuid: ee4d669c-72b1-4f7a-9a68-a7c6d59c7856
contentOwner: Rick Brough
topic-tags: 3D
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
discoiquuid: 5b044519-d034-4f05-98c5-f1b299a3ea37
---

# Rendering 3D assets {#rendering-d-assets}

You can render 3D assets you have manipulated and saved in AEM to create 2D images for use on your web content pages.

See [Editing Your Page Content](/help/sites-authoring/qg-page-authoring.md#editing-your-page-content).

## Performance considerations when rendering 3D assets {#performance-considerations-when-rendering-d-assets}

Rendering 3D content consumes significant server resources such as the CPU and memory. As such, rendering can often take large amounts of time. Render times vary significantly depending on various factors, in addition to the obvious model size and server hardware:

* **Renderer selection**.  

  The default Rapid Refine™ renderer in AEM 3D trades off some quality for faster render times. Still, it produces high-quality results for many applications. Renderers provided by way of third-party applications (for example V-Ray™ or NVIDIA® Mental Ray® deployed in Autodesk® Maya® or Autodesk® 3ds Max®) are broadly configurable and the performance versus quality tradeoff is made when the stage is designed.

* **IBL versus traditional lighting**.  

  While this factor is of less consequence for the default Rapid Refine renderer, third-party renderers such as Mental Ray are substantially slower to render with IBL stages than when using traditional point or spot lights.

The Rapid Refine renderer typically takes several few minutes to render larger images. However, third-party renderers often take many minutes, even hours when configured for maximum quality.

Conversion, processing, and render jobs are queued on the server as needed to prevent server overload. The message "Waiting for rendering..." is shown on recently uploaded assets in the Card View. This status indicates that other processing or rendering jobs must finish before the current render job can start.

>[!NOTE]
>
>A 3D asset is always rendered with the original materials, regardless of what materials are shown in the AEM 3D interactive view. This functionality applies to both the built-in Rapid Refine renderer and all native renderers.

**To render 3D assets**:

1. Open a 3D asset for viewing.

   See [Viewing 3D assets](viewing-3d-assets.md).

1. From Adobe Experience Manager, on the **[!UICONTROL Navigation]** page, tap **[!UICONTROL Assets]**.
1. Near the upper-right corner of the page, from the **[!UICONTROL View]** drop-down list, tap **[!UICONTROL Card View]**.
1. Navigate to a 3D object that you want to render.
1. Tap the card of the 3D object to open it in the asset details page.
1. Near the upper-left corner of the page, tap the drop-down list, then select **[!UICONTROL Render]**.

   ![chlimage_1-369](assets/chlimage_1-369.png)

1. Near the upper-right corner of the asset details page, tap the **[!UICONTROL Stage Selector]** icon (spotlight), then select a stage name with the background and lighting that you want to apply to the 3D object.

   See [About the use of stages in AEM 3D](about-the-use-of-stages-in-aem-3d.md).

   ![chlimage_1-370](assets/chlimage_1-370.png)

   **[!UICONTROL Stage Selector]** icon

1. On the **[!UICONTROL Render]** drop-down list on the left side of the asset details page, select a renderer.

   The default **Rapid Refine** renderer is always available. If the stage you selected is a native format, the corresponding third-party renderer is also made available in the list for you to select.

   See [About the use of stages in AEM 3D](about-the-use-of-stages-in-aem-3d.md).

1. Do the following:

    * In the **[!UICONTROL Width]** and **[!UICONTROL Height]** fields, enter the pixel width and height that you want your image rendered.
    * In the **[!UICONTROL Image Name]** field, enter the name of the rendered image.
    * In the **[!UICONTROL Export Path]** field, enter the path where you want the rendered image stored. Or, tap the **[!UICONTROL Browse]** icon and navigate to a location.
    * (Optional) Select or deselect the **[!UICONTROL Overwrite existing imag]e** check box.

1. Near the upper-right corner of the asset details page, tap the **[!UICONTROL Camera Selector]** icon. Select a camera view that you want to apply to the rendered image.

   Left and right bars or top and bottom bars are a visual indicator as to which parts of the view will be rendered. When the camera is provided by the selected stage, you can select a pre-defined camera.

   ![chlimage_1-371](assets/chlimage_1-371.png)

   **[!UICONTROL Camera Selector]** icon

1. Tap **[!UICONTROL Start Render]** to begin the rendering process.

   A message is temporarily displayed to indicate that rendering has started. For convenience, this message also includes a link to the selected Output Folder so you can navigate to it directly.


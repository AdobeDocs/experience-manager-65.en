---
title: Setting up a standard stage with Autodesk Maya and Mental Ray
seo-title: Setting up a standard stage with Autodesk Maya and Mental Ray
description: Learn how to set up a standard stage with Autodesk Maya and Mental Ray.
seo-description: Learn how to set up a standard stage with Autodesk Maya and Mental Ray.
uuid: 05c4858b-6261-4de3-a87a-03dd6bc519a4
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: authoring
content-type: reference
discoiquuid: f30c4039-3bbf-4d02-a9b5-bda6ccce16b9
---

# Setting up a standard stage with Autodesk Maya and Mental Ray{#setting-up-a-standard-stage-with-autodesk-maya-and-mental-ray}

1. In Maya, create a new, empty scene.
1. Create a (temporary) reference to a representative model. Doing so helps to facilitate evaluating lighting, setting up cameras, and configuring the renderer.

1. Add lights as usual. Currently, AEM 3D supports the following light types:

    * Directional lights
    * Spot lights
    * Point lights

   Other light types are ignored or converted to one of the above supported types when the stage is uploaded into AEM 3D. The converted types are used when you view the asset and when you render using the built-in Rapid Refine renderer. The original light types are used when rendering with Maya.

1. Create a ground plane, if required, and apply a suitable material.

   Adobe recommends that you set up a ground plane as single-sided. Doing so ensures that you can view the asset from below in AEM 3D without the ground plane hiding the asset.

1. (Optional) Create and configure cameras.

   Have the cameras "look" toward the center of the scene where the asset will be inserted. Be sure you set the cameras to renderable.

1. Set up rendering with Mental Ray.

   Configure the **[!UICONTROL Render Settings]** with the following suggestions:

    * **[!UICONTROL Common]** tab

      Deselect the **[!UICONTROL Alpha channel (mask)]** check box for all [!UICONTROL Renderable Cameras].
  
    * **[!UICONTROL Quality]** tab

        * **[!UICONTROL Overall quality]** `- 0.5` or less
        * **[!UICONTROL Indirect Diffuse (GI) Mode]** - `Final Gather`
        * **[!UICONTROL Filter Size]** - `2.0`, `2.0`

    * Render the scene at the typical image sizes that you expect to use. If necessary, refine the lights, or [!UICONTROL Render settings], or do both to achieve the results you want. 
  
      Be aware that rendering with Mental Ray, using image-based lighting, is very slow and CPU-intensive. Adobe recommends that you configure the lowest quality settings that are still capable of producing the desired render quality.

1. Remove the reference that you created in step 2.
1. Save the scene, then exit Autodesk Maya.
1. Upload the scene into AEM and wait for upload processing to complete.

   See [Uploading Assets](/help/assets/managing-assets-touch-ui.md#uploading-assets).

   If Autodesk® Maya® is not configured on the AEM server, export an FBX from Maya and upload it into AEM.

1. Open Asset Properties in AEM. Set Title to a suitable string that will appear in the Stage Selector drop-down list. Verify that **[!UICONTROL Class]** is set to **[!UICONTROL 3D Stage]**. Save and exit.
1. Open a 3D asset, select the new stage, and verify that it previews and renders as expected.


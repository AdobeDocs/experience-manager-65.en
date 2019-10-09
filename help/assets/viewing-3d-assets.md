---
title: Viewing 3D assets
seo-title: Viewing 3D assets
description: Learn about the interactive 3D viewer available from the asset details page in AEM and how to use it to view 3D assets.
seo-description: Learn about the interactive 3D viewer available from the asset details page in AEM and how to use it to view 3D assets.
uuid: 7d8133ac-3110-4979-8e19-e65090e791be
contentOwner: Rick Brough
topic-tags: 3D
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
discoiquuid: 65040923-a8a8-4e27-82c0-67a04348e238
---

# Viewing 3D assets {#viewing-d-assets}

This document describes both how to view 3D assets in asset details and how to view assets that are in the 3D component in sites.

## Viewing 3D assets in the Asset Details page {#viewing-d-assets-in-the-asset-details-page}

The interactive 3D viewer is available from the asset details page in AEM. The viewer includes, among other things, a collection of interactive camera controls that let you orbit, zoom, and pan the 3D asset.

![chlimage_1-139](assets/chlimage_1-139.png)

Besides using the default stages in AEM 3D, you can also use stages that you have created in a third-party application and uploaded into AEM.

See [About the use of stages in AEM 3D](about-the-use-of-stages-in-aem-3d.md).

>[!NOTE]
>
>To view a 3D asset, your device or desktop browser must be WebGL-enabled. Also, the underlying graphics hardware must have sufficient capabilities and memory to render models of the desired size and complexity. Certain preview features, such as cast shadow, are not available on all browsers.

### Performance considerations when you view 3D assets {#performance-considerations-when-you-view-d-assets}

The time it takes to open a 3D asset in the asset details page view depends on several factors. These factors include such things as the following:

* Bandwidth and latencies to the server.
* Model size (number of faces).
* Number and size of maps.
* Complexity of the stage. For example, the size of the IBL image.

In addition, the capabilities of the client computer-such as a workstation, notebook, or mobile touch device-are also important to consider when you manipulate the camera interactively. A reasonably powerful system with good graphics capabilities can make the interactive 3D viewing experience smoother and more favorable.

**To view 3D assets**:

1. Make sure you have uploaded 3D assets into AEM. 
   
   See [About the uploading and processing of 3D assets in AEM](upload-processing-3d-assets.md).

1. From AEM, on the **[!UICONTROL Navigation]** page, tap **[!UICONTROL Assets]**.
1. Near the upper-right corner of the page, from the **[!UICONTROL View]** drop-down list, tap **[!UICONTROL Card View]**.
1. Navigate to a 3D asset that you want to view.
1. Tap the card of the 3D asset to open it in the asset details page.  
1. Do any of the following:

   * In the lower-right corner of the asset details page, use the camera control palette to change various views of the asset.
  
      If you use a non-touch input device without a scroll wheel, such as a classic Apple single-button mouse, you can still change the zoom or perspective of a 3D asset, while in each respective mode. You accomplish the action by pressing and holding down the `SHIFT`key while depressing the mouse button and dragging up or down.  

      When using a touch pad on a typical notebook computer, it is often difficult to control the zoom or perspective behaviors with the two-finger gesture. In such cases, you can press and hold down `SHIFT`during the action. This kind of effort reduces the velocity of the pinch gesture and makes it easier to achieve the exact zoom level or perspective that you want. Alternately, you can use a one finger drag up or down while the `SHIFT`key is pressed to affect zoom or perspective behaviors.

    <table> 
    <tbody> 
      <tr> 
      <td><strong>Camera control name</strong><br /> </td> 
      <td><strong>Description</strong></td> 
      </tr> 
      <tr> 
      <td><p>Zoom</p> <p>or</p> <p>Persp</p> </td> 
      <td><p>Tap or click to toggle between Zoom and Perspective modes.</p> <p>Or, press and hold down the <code>ALT/OPTION</code> key during the action to temporarily toggle to Perspective<br /> mode. Release the key to revert to Zoom mode.</p> 
      <ul> 
      <li><strong>Zoom</strong>-Dolly in and out behavior which moves the camera closer or further away from the asset<br /> that you are viewing. Zoom is the default behavior for the scroll wheel on a mouse (if available0, for two-finger pinch gestures on mobile devices, or when you hold down the Shift key while dragging up or down using the left mouse button.</li> 
      <li><strong>Perspective</strong>-Changes the focal length (also known as field-of-view) of the camera while maintaining the relative size of the asset in the view. Perspective is the alternate behavior for the scroll wheel (if available), for two-finger pinch gestures on mobile devices, or when you hold down the Shift key while dragging up or down using the left mouse button.</li> 
      </ul> </td> 
      </tr> 
      <tr> 
      <td><p>Orbit</p> <p>or</p> <p>Pan</p> </td> 
      <td><p>Tap or click to toggle between Orbit and Pan modes.</p> <p>Or, press and hold the <code>ALT/OPTION</code> key during the action to temporarily toggle to Pan mode. Release the key to revert to Orbit mode.</p> 
      <ul> 
      <li><strong>Orbit</strong>- Moves the viewing camera on a sphere centered on a target point which is located near the center of the 3D asset be default. Orbit is the default behavior for a left-button drag or a single touch drag on mobile devices.</li> 
      <li><strong>Pan</strong>-Moves the camera in the viewing plane. The target point is moved correspondingly, so subsequent orbit actions will move the camera around a new target point. Pan is the alternate behavior for the left-button drag and single touch drag.</li> 
      </ul> </td> 
      </tr> 
      <tr> 
      <td><p>Examine</p> <p>or</p> <p>Target</p> </td> 
      <td><p>Tap or click to toggle between Examine and Target modes.</p> 
      <ul> 
      <li><strong>Examine</strong>-Tap or click to enter Target mode.</li> 
      <li><strong>Target</strong>-Tap or click a point anywhere on the 3D asset to center the view on that part of the asset.<br /> Orbit actions use the new target point.</li> 
      </ul> </td> 
      </tr> 
      <tr> 
      <td>Reset</td> 
      <td>Tap or click to restore the view target point to the center of the model. Reset also moves the camera<br /> closer or further away to show the asset in its entirety and at a reasonable viewing size.</td> 
      </tr> 
    </tbody> 
    </table>

    * Near the upper-right corner of the asset details page, tap the **[!UICONTROL Stage Selector]** icon. Select a stage name with the background and lighting that you want to apply to the 3D asset.

   ![chlimage_1-140](assets/chlimage_1-140.png)

   Stages provide the environment-background, ground plane, and lighting-in which the 3D model is viewed. 

   See [About the use of stages in AEM 3D](about-the-use-of-stages-in-aem-3d.md).

    * Near the upper-right corner of the asset details page, tap the **[!UICONTROL Camera Selector]** icon, then select a camera view that you want to apply to the 3D asset.

   ![chlimage_1-141](assets/chlimage_1-141.png)

   Stages often provide pre-defined cameras. You can re-select the current camera to restore it to its pre-defined settings. 

   See [About the use of stages in AEM 3D](about-the-use-of-stages-in-aem-3d.md).

1. In the upper-right corner of the page, tap **[!UICONTROL Save]**.
1. Do one of the following:

    * Render the 3D asset.  

      See [Rendering 3D assets](rendering-3d-assets.md).
  
    * In the upper-right corner of the page, tap **[!UICONTROL Close]** to return to the Assets page.

## Viewing 3D assets in the Sites 3D component {#viewing-d-assets-in-the-sites-d-component}

>[!NOTE]
>
>This section applies only to the classic webGL viewer used for 3D asset types other than Adobe Dimension.

Depending on the type of device, you access the 3D component features in a variety of ways.

For more information, see the following:

* [Touchscreen devices](#touchscreen-devices)
* [Touchpad devices](#touchpad-devices)
* [Mouse and trackball devices](#mouse-and-trackball-devices)

See also [Previewing a web page that has a 3D component](using-the-3d-sites-component.md#previewing-a-web-page-that-has-a-d-component).

![screen_shot_2017-12-11at145654](assets/screen_shot_2017-12-11at145654.png) 

### Touchscreen devices {#touchscreen-devices}

To work with 3D components with touchscreen devices:

1. Use a one-finger drag or swipe to move ("orbit") the viewpoint ("camera") around the object. You can view the object from any direction.  

1. Use a two-finger pinch to move the camera closer to or farther away from the object. This action is similar to zooming in or out and lets you inspect details on the object. Alternatively, press and hold the + or - buttons to move the camera closer or farther away from the object.  

1. Use a two-finger drag to pan the camera. This action moves the camera laterally to let you look at different parts of the object while zoomed in. Alternatively, tap the **[!UICONTROL Orbit/Pan Toggle]** button to toggle to Pan mode, then use a one-finger drag to pan the camera. Tap the **[!UICONTROL Orbit/Pan Toggle]** button to revert to **[!UICONTROL Orbit]** mode.  

1. Tap **[!UICONTROL Reset Viewer]** to reset the camera. This action brings the object back into full view and, if enabled, resumes auto-spin.  

1. Tap **[!UICONTROL Full Screen]** to enter full-screen mode (if supported by the device). Tap **[!UICONTROL Full Screen]** again to restore the 3D viewer to page-embedded mode.

### Touchpad devices {#touchpad-devices}

To work with 3D components with touchpad devices:

1. Use a one-finger drag while holding the (left) touchpad button down to move ("orbit") the viewpoint ("camera") around the object. You can view the object from any direction.  

1. Use a two-finger drag down or up with touchpad buttons up to move the camera closer to or farther away from the object. This action is similar to zooming in or out and allows inspecting details on the object. Alternatively, click and hold the **[!UICONTROL Zoom In]** or **[!UICONTROL Zoom Out]** buttons to move the camera closer or farther away from the object.  

1. Use a one-finger drag while holding the **ALT/option** key and the (left) touchpad button to pan the camera. This action moves the camera laterally to let you look at different parts of the object while zoomed in. Alternatively, click the **[!UICONTROL Orbit/Pan Toggle]** button to toggle to **[!UICONTROL Pan]** mode, then use a one-finger drag while holding the (left) button to pan the camera. Click the **[!UICONTROL Orbit/Pan Toggle]** button again to revert to **[!UICONTROL Orbit]** mode.  

1. Click **[!UICONTROL Reset Viewer]** to reset the camera. This action brings the object back into full view and, if enabled, resumes auto-spin.  

1. Click **[!UICONTROL Full Screen]** to enter full-screen mode. Use the **Escape** key on your keyboard or click **[!UICONTROL Full Screen]** again to restore the 3D viewer to page-embedded mode.

### Mouse and trackball devices {#mouse-and-trackball-devices}

To work with 3D components with mouse and trackball devices:

1. Drag while holding the left mouse button down to move ("orbit") the viewpoint ("camera") around the object. You can view the object from any direction.  

1. Use the scroll wheel to move the camera closer to or farther away from the object. This is similar to zooming in or out and lets you inspect details on the object. Alternatively, click and hold the **[!UICONTROL Zoom In]** or **[!UICONTROL Zoom Out]** buttons to move the camera closer or farther away from the object.  

1. Drag while holding the **ALT/option** key and the left mouse button to pan the camera. This moves the camera laterally to allow looking at different parts of the object while zoomed in. Alternatively, click the **[!UICONTROL Orbit/Pan Toggle]** button to toggle to **[!UICONTROL Pan]** mode, then drag while holding the left mouse button to pan the camera. Click the **[!UICONTROL Orbit/Pan Toggle]** again to revert to **[!UICONTROL Orbit]** mode.
1. Click **[!UICONTROL Reset Viewer]** to reset the camera. This action brings the object back into full view and, if enabled, resumes auto-spin.
1. Click **[!UICONTROL Full Screen]** to enter full-screen mode. Use the **[!UICONTROL Escape]** key on your keyboard or click **[!UICONTROL Full Screen]** again to restore the 3D viewer to page-embedded mode.


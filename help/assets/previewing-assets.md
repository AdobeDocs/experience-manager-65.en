---
title: Preview assets
description: Learn how to preview assets, such as videos and images, in Dynamic Media, by applying image presets and viewer presets.
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
docset: aem65
feature: Asset Management
role: User, Admin
exl-id: 84f0c406-4ab6-48c7-8223-61a8c3ade363
solution: Experience Manager, Experience Manager Assets
---
# Preview assets using the software interface {#previewing-assets}

You can use Preview to see how a digital asset that you have uploaded looks when it is viewed by a customer in their own web browser. The default embedded, cross-device viewer that is assigned to the asset is used for the Preview.

A viewer is a collection of various settings or *presets*, such as the viewer display size, zoom behavior, color schemes, borders, and fonts. These presets determine how users view rich-media assets on their computer screens and mobile devices.

Besides using the dedicated Preview feature for video, spin sets, and image sets, you can also preview an asset by using viewer presets that you have created. Or, use image presets to preview renditions of images.

* [Apply Image Presets](/help/assets/image-presets.md)
* [Apply Viewer Presets](/help/assets/viewer-presets.md)

>[!NOTE]
>
>When you are on a webpage (Sites) in Adobe Experience Manager, you cannot preview assets in **Edit** mode. Go to Preview mode by clicking **[!UICONTROL Preview]** in the upper right-hand corner of the page.

To enable or disable viewer presets in the user interface, see [Manage Viewer Presets](/help/assets/managing-viewer-presets.md).

**To preview assets using the software interface:**

1. From **[!UICONTROL Adobe Experience Manager]**, on the **[!UICONTROL Navigation]** page, select **[!UICONTROL Assets]**, then **[!UICONTROL Files]** to access assets.
1. Near the upper-right corner of the page, from the **[!UICONTROL View]** drop-down list, select **[!UICONTROL List View]**.
1. (Optional) Use the **[!UICONTROL Type]** column to sort the assets by the type you want to preview.
1. Under the **[!UICONTROL Title]** column, click the title name (not the thumbnail image) of the asset you want to preview.
1. Depending on the asset type you clicked, do any one of the following:


    <table>
    <tbody>
      <tr>
      <td><strong>Asset type you clicked</strong><br /> </td>
      <td><strong>Able to preview asset in a particular rendition?</strong></td>
      <td><strong>Able to preview asset in a viewer?</strong></td>
      <td> </td>
      </tr>
      <tr>
      <td><p>3D</p> </td>
      <td>No</td>
      <td>Yes</td>
      <td><p><strong>To preview a 3D asset in the Dimensional viewer</strong></p>
      <ul>
      <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Select <strong>Viewers</strong> from the list, then select the Dimensional viewer.</li>
      <li>Select <strong>Reset</strong> if you want to return the image to the original zoom.</li>
      <li>Select <strong>Fullscreen</strong> to maximize the viewer on the display device.</li>
      </ul>
      <p><strong>Navigating the 3D scene</strong></p>
      <ul>
      <li><p><strong>Turn your 3D camera</strong> - Orbit your view around the 3D scene and objects.</p> Mouse: Left click + Drag </p> Touch-screen: Press + Drag</p></li>
      <li><p><strong>Pan your camera</strong> - Pan your view left, right, up, and down.</p> Mouse: Right-click + Drag </p> Touch-screen: Two-finger press + Drag</p></li>
      <li><p><strong>Zoom your camera</strong> - Zoom your camera so you can move in and out of areas in the 3D scene.</p> Mouse: Scroll wheel </p> Touch-screen: Finger pinch</p></li>
      <li><p><strong>Recenter your camera</strong> - Orbit your view around the 3D scene and objects.</p> Mouse: Double-click </p> Touch-screen: Double-select</li></ul></td>
      </tr>
      <tr>
      <td><p>Image</p> </td>
      <td>Yes</td>
      <td>Yes</td>
      <td><p><strong>To preview asset in a particular rendition</strong></p>
      <ul>
      <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Select <strong>Renditions </strong>from the list, then select a particular rendition that you want to preview.</li>
      </ul> <p><strong>To preview asset in a particular viewer</strong></p>
      <ul>
      <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Select <strong>Viewers</strong> from the list, then select a viewer that you want to apply to the asset.</li>
      </ul> <p>Use the <strong>+</strong> and <strong>&ndash;</strong> icons to increase or decrease the zoom of the selected image, respectively. Select <strong>Reset</strong> if you want to return the image to the original zoom.<br /> If you are on a touch-screen, double-select the image to zoom in by steps. When you reach maximum zoom, double-select the image again to reset the zoom state. Drag across the image to pan.</p> </td>
      </tr>
      <tr>
      <td>Multimedia</td>
      <td>Yes</td>
      <td>Yes</td>
      <td><p><strong>To preview asset in a particular rendition</strong></p>
      <ul>
      <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Select <strong>Renditions </strong>from the list, then select a particular rendition that you want to preview.</li>
      </ul> <p>Selecting a higher-resolution video rendition to preview may cause the video to appear truncated. This issue is because the rendition preview shows you the exact resolution that your customers are going to see all in the context of the embedded viewer that is used for the preview.</p> <p>When you preview an adaptive video set at the Asset level, the renditions are grouped into one playback experience. That is, the adaptive video is sized properly for viewing and played back using the best resolution in the context of your viewing device and connection speed.<br /> </p> <p><strong>To preview an asset in a particular viewer</strong></p>
      <ul>
      <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Select <strong>Viewers</strong> from the list, then select a viewer that you want to apply to the asset.</li>
      </ul> </td>
      </tr>
      <tr>
      <td>Image set</td>
      <td>No</td>
      <td>Yes</td>
      <td><p><strong>To preview an asset in a particular viewer</strong></p>
      <ul>
      <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Select <strong>Viewers</strong> from the list, then select a viewer that you want to apply to the asset.</li>
      </ul> <p>Use the <strong>+</strong> and <strong>&ndash;</strong> icons so you can increase or decrease the zoom of the selected image, respectively. Select <strong>Reset</strong> if you want to return the image to the original zoom.<br /> If you are on a touch-screen, double-select the image to zoom in by steps. When you reach maximum zoom, double-select the image again to reset the zoom state. Drag across the image to pan.</p> </td>
      </tr>
      <tr>
      <td>Spin set</td>
      <td>No</td>
      <td>Yes</td>
      <td><p><strong>To preview an asset in a particular viewer</strong></p>
      <ul>
      <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Select <strong>Viewers</strong> from the list, then select a viewer that you want to apply to the asset.</li>
      </ul> <p>Use the <strong>+</strong> and <strong>&ndash;</strong> icons to increase or decrease the zoom of the selected image, respectively. Select <strong>Reset</strong> if you want to return the image to the original zoom.<br /> If you are on a touch-screen, double-select the image to zoom in by steps. When you reach maximum zoom, double-select the image again to reset the zoom state. Drag across the image to pan.</p> </td>
      </tr>
      <tr>
      <td>Mixed Media set</td>
      <td>No</td>
      <td>Yes</td>
      <td><p><strong>To preview an asset in a particular viewer</strong></p>
      <ul>
      <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Select <strong>Viewers</strong> from the list, then select a viewer that you want to apply to the asset.</li>
      </ul> <p>Use the <strong>+</strong> and <strong>&ndash;</strong> icons to increase or decrease the zoom of the selected image, respectively. Select <strong>Reset</strong> if you want to return the image to the original zoom.<br /> If you are on a touch-screen, double-select the image to zoom in by steps. When you reach maximum zoom, double-select the image again to reset the zoom state. Drag across the image to pan.</p> </td>
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
      <li>Near the upper-left corner of the page, select the icon so the drop-down list appears. Select <strong>Renditions</strong>, then select the rendition that you want to preview.</li>
      </ul> <p><strong>To preview asset in a particular viewer</strong></p>
      <ul>
      <li>Near the upper-left corner of the page, select the icon so the drop-down list appears. Select <strong>Viewers</strong>, then select a viewer that you want to apply to the asset.</li>
      </ul> <p>Use the <strong>+</strong> and <strong>&ndash;</strong> icons to increase or decrease the zoom of the selected image, respectively. Select <strong>Reset</strong> if you want to return the image to the original zoom.<br /> If you are on a touch-screen, double-select the image to zoom in by steps. When you reach maximum zoom, double-select the image again to reset the zoom state. Drag across the image to pan.</p> </td>
      </tr>
    </tbody>
    </table>

## Preview assets using a keyboard {#keyboard-navigation-asset-preview}

1. From the Assets user interface, navigate to a folder that contains an asset you want to preview.

1. In the folder, press the `<Tab>` key or arrow keys on your keyboard to select the asset.

1. Press `<Enter>` so you can open the selected asset in Preview mode.

1. Do any of the following:

   * To zoom in, press `<Tab>` to move focus to the zoom in (+) icon, then press `<Enter>` one or more times to zoom in incrementally. 
   * To zoom out, press `<Tab>` to move focus to the zoom out (&ndash;) icon, then press `<Enter>` one or more times to zoom out incrementally.
   * To move the view of a *zoomed* asset horizontally or vertically, press the respective arrow keys.
   * Press `<Shift>` + `<Tab>` so you can reset the view and place focus back on the asset.

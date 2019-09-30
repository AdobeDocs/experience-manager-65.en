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

# Previewing Assets{#previewing-assets}

You can use Preview to see how a digital asset looks when it is viewed by a customer in their own web browser. The default embedded, cross-device viewer that is assigned to the asset is used for the Preview.

A viewer is a collection of various settings or "presets," such as the viewer display size, zoom behavior, color schemes, borders, fonts, and so forth, that determine how users view rich-media assets on their computer screens and mobile devices.

Besides using the dedicated Preview feature for video, spin sets, and image sets, you can also preview an asset by using viewer presets that you have created. Or, use image presets to preview renditions of images.

* [Applying Image Presets](/assets/using/image-presets.md)
* [Applying Viewer Presets](/assets/using/viewer-presets.md)

>[!NOTE]
>
>When you are on a webpage (Sites) in AEM, you cannot preview assets in **Edit** mode. You need to go to **Preview** mode by clicking **Preview** in the upper right-hand corner.

To enable or disable viewer presets in the user interface, see [Managing Viewer Presets](../../assets/using/managing-viewer-presets.md).

To preview assets:

1. From **Adobe Experience Manager**, on the **Navigation **page, tap **Assets, **then** Files **to access assets. 
1. Near the upper-right corner of the page, from the View drop-down list, tap **List View**.
1. (Optional) Use the **Type** column to sort the assets by the type you want to preview.
1. Under the **Title** column, click the title name (not the thumbnail image) of the asset you want to preview.
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
    </ul> <p style="margin-left: 40px;">Use the <strong>+</strong> and <strong>- </strong>icons to increase or decrease the zoom of the selected image, respectively. Click <strong>Reset</strong> to return the image to the original zoom.<br /> If you are on a mobile device, double-tap the image to zoom in by steps. When you reach maximum zoom, double-tap the image again to reset the zoom state. Drag across the image to pan.</p> </td> 
  </tr>
  <tr>
   <td>Multimedia</td> 
   <td>Yes</td> 
   <td>Yes</td> 
   <td><p><strong>To preview asset in a particular rendition</strong></p> 
    <ul> 
     <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Click <strong>Renditions </strong>from the list, then select a particular rendition that you want to preview.</li> 
    </ul> <p style="margin-left: 40px;">Selecting a higher-resolution video rendition to preview may cause the video to appear truncated. That is because the rendition preview shows you the exact resolution that your customers will see it, all in the context of the embedded viewer that is used for the preview.</p> <p style="margin-left: 40px;">When you preview an adaptive video set at the Asset level the renditions are grouped into one playback experience. That is, the adaptive video is sized properly for viewing and played back using the best resolution in the context of your viewing device and connection speed.<br /> </p> <p><strong>To preview an asset in a particular viewer</strong></p> 
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
    </ul> <p style="margin-left: 40px;">Use the <strong>+</strong> and <strong>- </strong>icons to increase or decrease the zoom of the selected image, respectively. Click <strong>Reset</strong> to return the image to the original zoom.<br /> If you are on a mobile device, double-tap the image to zoom in by steps. When you reach maximum zoom, double-tap the image again to reset the zoom state. Drag across the image to pan.</p> </td> 
  </tr>
  <tr>
   <td>Spin set</td> 
   <td>No</td> 
   <td>Yes</td> 
   <td><p><strong>To preview an asset in a particular viewer</strong></p> 
    <ul> 
     <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Click <strong>Viewers</strong> from the list, then select a viewer that you want to apply to the asset.</li> 
    </ul> <p style="margin-left: 40px;">Use the <strong>+</strong> and <strong>- </strong>icons to increase or decrease the zoom of the selected image, respectively. Click <strong>Reset</strong> to return the image to the original zoom.<br /> If you are on a mobile device, double-tap the image to zoom in by steps. When you reach maximum zoom, double-tap the image again to reset the zoom state. Drag across the image to pan.</p> </td> 
  </tr>
  <tr>
   <td>Mixed Media set</td> 
   <td>No</td> 
   <td>Yes</td> 
   <td><p><strong>To preview an asset in a particular viewer</strong></p> 
    <ul> 
     <li>Near the upper-left corner of the page, click the icon so the drop-down list appears. Click <strong>Viewers</strong> from the list, then select a viewer that you want to apply to the asset.</li> 
    </ul> <p style="margin-left: 40px;">Use the <strong>+</strong> and <strong>- </strong>icons to increase or decrease the zoom of the selected image, respectively. Click <strong>Reset</strong> to return the image to the original zoom.<br /> If you are on a mobile device, double-tap the image to zoom in by steps. When you reach maximum zoom, double-tap the image again to reset the zoom state. Drag across the image to pan.</p> </td> 
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


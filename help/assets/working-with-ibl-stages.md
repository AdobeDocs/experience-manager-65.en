---
title: About working with IBL stages
seo-title: About working with IBL stages
description: AEM 3D supports image-based lighting (IBL) for both interactive viewing and rendering with the built-in Adobe Rapid Refine™ renderer and third-party renderers.
seo-description: AEM 3D supports image-based lighting (IBL) for both interactive viewing and rendering with the built-in Adobe Rapid Refine™ renderer and third-party renderers.
uuid: 495ba9cc-02f5-4ce5-9503-9f61ca5482db
contentOwner: Rick Brough
topic-tags: 3D
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
discoiquuid: 658ff671-16b9-41bd-ba24-b77a32b3346b
---

# About working with IBL stages {#about-working-with-ibl-stages}

AEM 3D supports image-based lighting (IBL) for both interactive viewing and rendering with the built-in Adobe Rapid Refine™ renderer and third-party renderers. You can create IBL stages with common authoring tools such as Autodesk® Maya® or Autodesk® 3ds Max®.

## Images for IBL {#images-for-ibl}

Images used for image-based lighting should have HDR (High Dynamic Range) for best results. They must be in lat/long format with spherical mapping providing full coverage of the environment.

Currently, AEM 3D only supports 32-bit TIFFs. If necessary, use Adobe Photoshop or a similar tool to convert the HDR image to a TIFF using the following settings in the Adobe Photoshop TIFF Export dialog box:

* **[!UICONTROL Bit depth]** - 32-bit (Float)
* **[!UICONTROL Pixel Order]** - Interleaved (RGBRGB)
* **[!UICONTROL Image Compression]** - LZW
* **[!UICONTROL Byte Order** - IBM PC

While a single HDR image is often sufficient for IBL stages, AEM 3D provides additional control over IBL effects by allowing up to three separate images:

* **Diffuse Lighting Environment Image** &ndash; This type of image should be an HDR image, but can be relatively small, as the image will be heavily filtered prior to using it for diffuse lighting.
* **Reflection Environment Image** &ndash; This type of image is used to create reflections in object surfaces. It can be a standard 8-bit RGB image of a size and resolution that provides the desired quality and sharpness of reflections. If an HDR image is specified, AEM 3D converts it to 8-bit RGB prior to using a proprietary algorithm.
* **Background Environment Image** &ndash; This type of image is used as a background. It can be a standard 8-bit RGB image and should have a size/resolution/level of detail desired for the stage background. If an HDR image is specified, AEM 3D converts it to 8-bit RGB using a proprietary algorithm. ``

>[!NOTE]
>
>The conversion algorithm may have difficulty with certain IBL images. This difficulty can result in backgrounds that are too bright or overly saturated in Preview or when rendering with Rapid Refine. In such situations, Adobe recommends that you use Photoshop or a similar tool to manually convert the IBL image to an 8-bit RGB image. Upload this image separately and attach it to the stage as the Background Environment Image. The Diffuse Lighting and Reflection Environment images must always be 32-bit TIFFs.

## Adjusting the IBL stage appearance {#adjusting-the-ibl-stage-appearance}

You can fine-tune the appearance of the IBL stage with the following stage properties:

<table> 
 <tbody> 
  <tr> 
   <td><strong>Property</strong><br /> </td> 
   <td><strong>Description</strong></td> 
  </tr> 
  <tr> 
   <td>IBL Sun Details</td> 
   <td><p>Lets you adjust the direction and strength of the supplemental light source that simulates the sun. <span class="diff-html-added">This light source increases the lighting brightness and causes the object to cast a drop-shadow onto the ground plane. Shadow casting is supported when rendering with Rapid Refine and for previewing with Google Chrome; however, it is currently not supported by other browsers.</span></p> 
    <ul> 
     <li><strong>lat</strong> - The vertical position of the sun light source (<code>0.0</code>-<code>1.0</code>).<br /> A setting of <code>0.0</code> is at the horizon (vertical center of the Diffuse Lighting Environment Image); <code>1.0</code> is at the zenith (top edge of the Diffuse Lighting Environment Image).</li> 
     <li><strong>long</strong> - The horizontal position of the sun light source (<code>0.0</code>-<code>1.0</code>).<br /> A setting of 0.0 corresponds to the left; 1.0 corresponds to the right edge of the Diffuse Lighting Environment Image.<br /> </li> 
     <li><strong>bright</strong> - The brightness of the sun light source. Increase this value to brighten the sunlight source; decrease this value to darken. <br /> A setting of <code>0</code> turns off supplemental lighting and disables cast shadows. The parameter does not affect environment reflections.<br /> </li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td>IBL Camera Height</td> 
   <td>If the IBL background appears distorted near the horizon, it is possible to reduce or eliminate the distortion by adjusting this property. <br /> </td> 
  </tr> 
  <tr> 
   <td>Environment Lighting</td> 
   <td><p><span class="diff-html-added">Lets you control the diffuse lighting. You may need to adjust this property manually to correct the lighting brightness if the Diffuse Lighting Environment Image is unusually bright or dark (for example, night scenes).</span></p> 
    <ul> 
     <li><strong>r, g, b</strong> - Currently not used.</li> 
     <li><strong>bright</strong> - <span class="diff-html-added">Brightness multiplier. Increasing or decreasing this value increases or decreases the overall lighting intensity (both the basic IBL lighting and the brightness of the sunlight source).</span></li> 
    </ul> </td> 
  </tr> 
 </tbody> 
</table>

## Increasing the spherical background diameter of an IBL stage {#increasing-the-spherical-background-diameter-of-an-ibl-stage}

IBL stages use spherical background images that are 20 meters diameter by default. Such stages work well for objects up to 10 meters. However, if you are showing larger objects, you can increase the spherical background diameter of an IBL stage.

**To increase the spherical background diameter of an IBL stage**:

1. In CRXDE Lite, navigate to the stage whose spherical background diameter you want to increase. For example,

   `/content/dam/test3d/stage-helipad.fbx`

1. Expand the stage node to `jcr:content/metadata`.
1. Set the property `dam:gPlaneRadius` to the desired millimeter value.

   For rendering efficiency, Adobe recommends that you limit this value to approximately the largest dimension of the largest object that you intend to shown on the stage.

   For example, a jet plane model that is 20 meters long displays well if `dam:gPlaneRadius=20000`.

1. Near the upper-left corner of the CRXDE Lite page, tap **[!UICONTROL Save All]**.


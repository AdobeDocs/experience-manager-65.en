---
title: AEM 3D Release Notes
seo-title: AEM 3D Release Notes
description: Release notes specific to 3D content in Adobe Experience Manager Assets.
seo-description: Release notes specific to 3D content in Adobe Experience Manager Assets.
uuid: 6675951f-86f0-4ec5-97e4-d247f6faf913
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4
topic-tags: release-notes
content-type: reference
topic-tags: 3D
discoiquuid: 9789d031-fb7e-415a-a9c3-8b8fde978238
---

# AEM 3D Release Notes {#aem-d-release-notes}

AEM-6.4-DynamicMedia-3D version 3.1.0 (October 10, 2018)

The AEM 3D feature pack enables support for 3D content in AEM Assets. It provides capabilities to upload, manage, preview, and render 3D assets. Support for viewing and rendering is optimized for individual objects (rather than complex scenes with multiple objects).

AEM 3D supports Adobe Dimension (Dn) and glTF asset types. The implementation for these asset types is substantially different from that for traditional 3D types described in this documentation. See [Working with Adobe Dimension assets](/help/assets/working-dimension-assets.md).

Also included are server-side integrations with Autodesk® Maya® (Windows only). When you install and configure Maya on the same server as AEM you enable support for native Maya file formats, including high-quality rendering with the NVIDIA® mental ray® Standalone plug-in for Maya. Installing and configuring 3ds Max on the server enables support for the native .max file format.

See [Integrating with Autodesk Maya](/help/assets/integrate-maya-with-3d.md).

See also [Installing and configuring AEM 3D Assets](/help/assets/install-config-3d.md) and [Advanced configuration settings](/help/assets/advanced-config-3d.md).

See also [Working with 3D assets](/help/assets/assets-3d.md).

## System requirements {#system-requirements}

**Prerequisites**

* AEM 6.4.2 (AEM 6.4 with Service Pack 2)  
* Autodesk® FBX® SDK 2016.1.2

**Supported operating systems**

* Microsoft Windows 2012 Server or later
* Apple OS X El Capitan 10.6 or later
* RedHat Enterprise Linux 7.3

**Supported web browsers for AEM Assets**

* Google Chrome 53 or later (recommended).
* Apple Safari 9.1 or later.
* Firefox 48 or later.
* Microsoft Edge 25.10586 or later.

Other browsers may not support interactive viewing of 3D content in AEM. Only Google Chrome supports cast shadows in Preview.

**Hardware requirements and recommendations**

* CPU - 3D processing and rendering is very demanding on a computer's CPU. As such, a contemporary server with a minimum of eight CPU cores is recommended.
* Memory - A minimum of 32 GB is recommended.
* Mass storage - High bandwidth SSD storage is recommended.  

  On upload, 3D assets are converted to a proprietary format for fast, interactive viewing. Depending on the type of 3D asset, storage space of 2-3x the size of the uploaded 3D asset is required.

See also [Working with 3D assets](/help/assets/assets-3d.md).

## Installing and configuring AEM 3D {#installing-and-configuring-aem-d}

See [Installing and configuring AEM 3D](/help/assets/install-config-3d.md).

See also [Integrating AEM 3D with Autodesk Maya](/help/assets/integrate-maya-with-3d.md) and [Integrating AEM 3D with Autodesk 3ds Max](/help/assets/integrating-aem-3d-with-autodesk-3ds-max.md).

## Supported 3D File Formats {#supported-d-file-formats}

<table> 
 <tbody>
  <tr>
   <td><strong>Format</strong></td> 
   <td><strong>Description</strong></td> 
   <td><strong>Platforms</strong></td> 
   <td><strong>Notes</strong></td> 
  </tr>
  <tr>
   <td>DN</td> 
   <td>Adobe Dimension</td> 
   <td>All</td> 
   <td>Requires access to a cloud-based conversion service.</td> 
  </tr>
  <tr>
   <td>GLTZ</td> 
   <td>Zipped gITF</td> 
   <td>All</td> 
   <td> </td> 
  </tr>
  <tr>
   <td>GLB</td> 
   <td>Binary gITF</td> 
   <td>All</td> 
   <td>Download only (GLB renditions ar create for DN assets).</td> 
  </tr>
  <tr>
   <td>OBJ</td> 
   <td>Wavefront OBJ 3D </td> 
   <td>All</td> 
   <td> </td> 
  </tr>
  <tr>
   <td>FBX</td> 
   <td>Autodesk FBX (Kaydara Filmbox)</td> 
   <td>All</td> 
   <td>The Autodesk FBX SDK must be installed on the Author node.</td> 
  </tr>
  <tr>
   <td>MA, MB</td> 
   <td>Native Autodesk Maya</td> 
   <td>Windows only</td> 
   <td>Autodesk Maya is required on the Author node to enable these file formats. See <a href="/help/assets/integrate-maya-with-3d.md" target="_blank">Integrating AEM 3D with Autodesk Maya</a>.</td> 
  </tr>
  <tr>
   <td>JT</td> 
   <td>Siemens PLM Open CAD</td> 
   <td>Windows only</td> 
   <td>Autodesk Maya is required on the Author node to enable these file formats. See <a href="/help/assets/integrate-maya-with-3d.md">Integrating AEM 3D with Autodesk Maya</a>.</td> 
  </tr>
  <tr>
   <td>*</td> 
   <td><p>Additional 3D input formats supported by Autodesk Maya can be enabled.</p> <p>See <a href="/help/assets/integrate-maya-with-3d.md#enabling-additional-formats-supported-by-maya" target="_blank">Enabling Additional Formats Supported by Maya</a>.</p> </td> 
   <td>Windows only</td> 
   <td>Autodesk Maya is required on the Author node to enable these file formats. See <a href="/help/assets/integrate-maya-with-3d.md">Integrating AEM 3D with Autodesk Maya</a>.</td> 
  </tr>
  <tr>
   <td>MAX</td> 
   <td>Native Autodesk 3ds Max</td> 
   <td>Windows only</td> 
   <td>Autodesk 3ds Max is required on the author node to enable this file format. See <a href="/help/assets/integrating-aem-3d-with-autodesk-3ds-max.md">Integrating AEM 3D with Autodesk 3ds Max</a>.</td> 
  </tr>
 </tbody>
</table>

## Enhancements and new features {#enhancements-and-new-features}

Version 3.0

* Support for Autodesk 3ds Max native file format.
* Various changes and bug fixes to improve stability, quality, and user experience.
* Configuration settings moved to `/libs/settings/dam/v3d/`

Version 3.1

* Limited support for the Adobe Dimension native file format (.dn).
* A new 3D viewer for glTF assets.
* A new interface to a cloud-based, Adobe-managed conversion service hosted in Amazon AWS. Initially, this service only converts from Dn to glTF formats.

## Restrictions and known issues {#restrictions-and-known-issues}

### Adobe Dimension support {#adobe-dimension-support}

* This version of AEM3D has limited support for .dn files created with Adobe Dimension.
* During upload processing AEM leverages a cloud-based, Adobe-hosted conversion service to create a glTF rendition from the native .dn file. Access to the conversion service and select Amazon AWS endpoints is required.
* A new glTF viewer is provided which supports viewing of Dn assets in AEM Assets and in Sites/Screens. Support for Stages in the viewer is not yet available.
* Dn models can embed IBL lights and backgrounds which are displayed, if present. Alternatively, the viewer applies default lighting, or a default background color, or both.
* High-quality rendering for Dn assets is not yet available.
* Dependencies such as texture maps are embedded in Dn assets and cannot be managed explicitly in AEM.

### Compatibility {#compatibility}

* **Running as a Windows service is not supported (Windows only)** - This may work but it has not been tested.
* **Dynamic Media** ( `dynamicmedia-scene7` mode) - Compatibility of AEM3D with the new Dynamic Media solution released with AEM 6.4 is not yet fully verified. If Dynamic Media and AEM3D is deployed together, it is recommended that you place 3D assets and their dependencies only in an area of the AEM Assets repository that is not assigned to Dynamic Media. This recommendation is especially important for 32-bit TIFF files which are required for 3D Stages but are not supported by Dynamic Media.

### General {#general}

* **Resolve Dependencies shortcut** - This shortcut is available in the Card View on 3D assets. Asset cards in the Card View show the "Unresolved Dependencies" banner. The shortcut opens the **Basic Properties** tab instead of the **Dependencies** tab. Workaround: manually navigate to the Dependencies tab.

* **Stage selector not available** - 3D assets that include lights are automatically tagged by AEM as 3D stages. No Stages selector is available for stages in the Detail view. To mark a 3D asset as a 3D object, navigate to **Basic Properties**, change **Asset Class** to **3D Object**, then click **Save**.

* **Downloading 3D assets with dependents and renditions** - When downloading 3D assets from AEM with both **Dependencies** and **Rendition(s)** checked, the download includes not only the renditions of the primary 3D asset, but also the renditions of all dependents.

* **Autodesk 3ds Max integration** - Rendering with 3ds Max is not supported at this time.

### File type restrictions {#file-type-restrictions}

* **Mathematica (.ma) files** - Mathematica files use the same file suffix as native Maya files. When the Feature Pack is installed and the Maya .ma file format is enabled, AEM3D's attempt to ingest Mathematica files as Maya files fail. Such assets display an error banner in the Card view.  

* **Targa (.tga) image files** - Older 3D model files may include references to TGA files. This format is not supported by AEM. Adobe recommends that you convert such files to a different format before you upload the 3D assets into AEM.
* **HDR images** - HDR images are used for stages with image-based lighting (IBL). Currently, only 32-bit TIFF images are supported for this purpose.
* **32-bit TIFF images** - 32-bit TIFF images are used for stages with image-based lighting. AEM does not support the creation of renditions for these assets, resulting in blank thumbnails, and preview is not possible. The asset still functions correctly when used with an IBL stage.
* **Autodesk 3ds Max (.max) files** - If Autodesk 3ds Max is installed and configured on the Author nodes, AEM supports the ingestion and conversion of .max files. Use of .max files as stages is not supported at this time.

### Automatic dependency resolution {#automatic-dependency-resolution}

* **Unresolved file dependencies after upload** - When 3D assets and their dependents are uploaded with the same upload operation, it is possible that some dependents are not resolved automatically. This issue is more likely to occur if the dependent files are large. To correct this issue, access the **Properties/Dependencies** page of the asset that shows unresolved dependents after upload. The previously unresolved dependents should now be shown. Click **Save** to finalize the asset. To prevent this issue in the future, you can upload all dependents in a separate transaction before you upload the 3D objects.

* **Case-sensitivity** - Automatic dependency resolution attempts to match file names in a case-sensitive fashion. For example, if the original dependency found in the 3D asset is `image.jpg`, the dependency resolves to an asset named `Image.jpg`, `image.JPG`, or any other case variation.

### 3D stages {#d-stages}

* **Thumbnails for stages** - The auto-generated thumbnails for stages may not represent the stage accurately.
* **Stage geometry for non-IBL stages** - The Rapid Refine renderer does not render geometry from stages with non-IBL lighting, including backgrounds and ground planes. Such geometry still displays reasonably in the asset Detail view (3D preview).  

* **FBX stages with IBL lighting** - You can upload FBX stages with IBL lighting. However, the FBX format does not have provisions to transfer the IBL image name. As such, file dependency resolution fails. The IBL image must be assigned manually to the stage after upload. You can assign the same 32-bit TIFF image to the three dependencies which are **Diffuse Lighting Environment Image**, **Reflection Envrionment Image**, and **Background Envrionment Image**, or different images may be assigned.  

* **Background image of IBL stages** - For some IBL scenes, the background image may have poor quality such as being too bright or too blurry. To maximize the visual quality of the image background of IBL stages, Adobe recommends that you prepare a separate high-resolution 8-bit JPEG image and attach it to the IBL stage as the **Background Environment Image**.

* **Black image when rendering with Maya using an IBL stage** - This problem is likely caused by Maya not finding the IBL image dependency because the original IBL image referenced by the stage was replaced by an image with a different name. To avoid this issue, make sure that at least one of the three dependencies referenced by the Maya IBL stage has the same name as the original IBL file reference in the Maya file.
* **Reversed background image for IBL stage** - The images for IBL stages are intentionally flipped horizontally to match the behavior of the NVIDIA mental ray renderer provided with Autodesk Maya. Workaround: Flip the images used for IBL stages in Photoshop before you upload them.
* **Brightness of IBL stages** - The automatic analysis of the IBL image may result in a scene that is too dark or too bright. To adjust the lighting brightness of IBL stages, navigate to **Basic Properties** and adjust the **bright** value of **Environment Lighting** as needed.

### AEM Sites 3D Component {#aem-sites-d-component}

* **One 3D component per page** - At this time, only one instance of the 3D component is allowed on each web page. If more than one 3D component is added to the same page, none of the 3D components function correctly.
* **3D View missing when previewing in Sites** - When you use **Preview** in Sites, the page must be reloaded in the browser to fully initialize the 3D viewer. This is not an issue when you view the web page directly (that is, when `edit.html` is removed from the path) either on the Author nodes or the Publish nodes.

* **Full-screen mode not available on iOS devices** - The full-screen button is not available on iOS devices, regardless of the browser used.

### Publishing 3D Content {#publishing-d-content}

* **3D Component configuration** - You must install the 3D Feature Pack on all active Publish nodes and each node must be configured with **CRXDE Lite** to the same configuration options at `/libs/settings/dam/v3D/WebGLSites`.

* **Missing textures, background, or lighting after publishing** - The **Publish** mechanism in AEM Sites automatically publishes the page's primary dependencies, including the 3D model and the 3D stage referenced by the 3D component. 3D stages and 3D models typically depend on secondary assets for IBL images and texture maps, which the Sites Publish mechanism does not publish automatically. Workaround: publish all 3D assets from Assets prior to publishing the web page from Sites. Doing so ensures that all dependencies for 3D assets are available on the Publish nodes.


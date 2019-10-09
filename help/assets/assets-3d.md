---
title: Working with 3D assets
seo-title: Working with 3D assets
description: Learn how to work with 3D assets in AEM 3D
seo-description: Learn how to work with 3D assets in AEM 3D
uuid: a1c1bb29-9d3d-4025-8142-ed9719434bf9
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: introduction
content-type: reference
discoiquuid: 32143da1-09c8-45ce-b50d-32adf6efe383
---

# Working with 3D assets {#working-with-d-assets}

AEM 3D (Adobe Experience Manager 3D) lets you upload, manage, view, and render 3D content. Support for viewing and rendering is optimized for individual objects.

See also [AEM 3D Release Notes](/help/release-notes/aem3d-release-notes.md).

See also [Installing and configuring AEM 3D](install-config-3d.md).

## About models and stages in AEM 3D {#about-models-and-stages-in-aem-d}

AEM 3D lets you view and render high-quality static, stand-alone 3D models in pre-defined environments called Stages. Basically, a stage provides "lighting" for the 3D scene and the settings for rendering in a native application such as Autodesk® Maya® or Autodesk 3ds Max®. In addition, the stage can optionally include pre-defined cameras, backgrounds, and ground plane geometry.

Uploaded 3D files that contain lights are assumed to be a stage. You can revert such assets to be simple 3D objects by opening the asset in the asset details page. Tap **[!UICONTROL View Properties]**, then tap the **[!UICONTROL Basic]** tab. Under the Metadata heading, from the Asset Class drop-down list, select **[!UICONTROL 3D object]**.

When you create 3D models for use in AEM 3D, be aware of the following:

* Your 3D model files should contain only one object, with no backgrounds, ground planes, scene lighting, or cameras.
* Place the model above the ground plane. This positioning is especially important when you view or render with stages that provide a ground plane. A configuration setting is available (and enabled by default) that causes the object to be moved above the ground plane when previewing or rendering with Rapid Refine. This setting does not affect rendering with third-party renderers (for example, by way of Maya), and thus objects that are not located above the ground plane may be partially hidden.  
* Position the model so that it is reasonably centered laterally around the coordinate system origin (0,0,0). Doing so ensures a good interactive viewing experience for you.
* Other than texture maps, external file references are supported. Therefore, you must embed any referenced content in the primary model file before you upload it into AEM.  

  See [About the uploading and processing of 3D assets in AEM](upload-processing-3d-assets.md).

* The general scene lighting is provided by the stage. As such, Adobe does not recommend that you include lights with 3D model files. You can include lights in the model. However, they must be specific to the model only. For example, it may be necessary to include additional lighting to brighten a part of the object that is obscured by other parts. Therefore, it would not be sufficiently visible with just the stage lights.  

## Supported files in AEM 3D {#supported-files-in-aem-d}

A typical 3D asset has a primary model file and none or more referenced files. Referenced files include such things as texture maps or **IBL (Image-Based Lighting)** images.

### About the primary 3D model file {#about-the-primary-d-model-file}

The primary 3D model file contains the actual 3D model geometry and definitions for the (default) materials that are applied to the model surfaces. AEM 3D supports the following primary 3D model file formats:

* Wavefront OBJ file format (`.obj`)  

  The OBJ format requires one or more separate, external MTL files (Material Template Library) (`.mtl`).

* Autodesk FBX (Filmbox) file format (`.fbx`)  

  The Autodesk 3D file interchange format; both binary and ASCII formats.  

  When you create FBX files in third-party applications, Adobe recommends the following configuration settings (see table below). These settings can help you achieve the best results for 3D files that you intend to use in AEM. The option names are taken from the **[!UICONTROL Autodesk Maya FBX Export Options]** dialog box.

<table> 
 <tbody> 
  <tr> 
   <td><strong>Option in Autodesk Maya FBX Export dialog box</strong></td> 
   <td><strong>Description</strong></td> 
  </tr> 
  <tr> 
   <td>Preserve References<br /> </td> 
   <td><p>Deselect.</p> <p>AEM 3D currently does not support external references.</p> </td> 
  </tr> 
  <tr> 
   <td>Smooth Mesh<br /> </td> 
   <td>Select.</td> 
  </tr> 
  <tr> 
   <td>Convert NURBS surfaces to</td> 
   <td><strong>Software Render Mesh</strong></td> 
  </tr> 
  <tr> 
   <td>Animation</td> 
   <td><p>Select or deselect.</p> <p>If you choose to select this option, AEM 3D ignores the animation information in the file.</p> </td> 
  </tr> 
  <tr> 
   <td>Cameras</td> 
   <td><p>Select for <strong>3D stages</strong>.</p> <p>Deselect for 3D models.</p> </td> 
  </tr> 
  <tr> 
   <td>Lights</td> 
   <td><p>Select for <strong>3D stages</strong>.</p> <p>Deselect for <strong>3D models</strong>.</p> </td> 
  </tr> 
  <tr> 
   <td>Units - Automatic</td> 
   <td>Select. AEM 3D converts on import.</td> 
  </tr> 
  <tr> 
   <td>Axis Conversion - Up Axis</td> 
   <td><p><strong>Y-up</strong></p> <p>Y-up gives consistent results when you export from Maya and is the preferred coordinate system for FBX files in this AEM 3D release.</p> </td> 
  </tr> 
  <tr> 
   <td>Embed Media</td> 
   <td>Both options are supported. If embedded is selected, AEM 3D extracts the embedded media to an adjacent folder that has the same name as the model file with <code>.fbm</code> appended to it.</td> 
  </tr> 
  <tr> 
   <td>FBX File Format - Type</td> 
   <td>Both <strong>Binary </strong>or <strong>ASCII </strong>are supported.</td> 
  </tr> 
  <tr> 
   <td>FBX File Format - Version</td> 
   <td>FBX 2014/2015 is recommended. Other versions may also work fine.</td> 
  </tr> 
 </tbody> 
</table>

The following additional file formats are supported if Autodesk Maya is installed and configured on AEM authoring servers:

* Autodesk Maya  

  Both ASCII `.ma` and binary `.mb` formats.

* `Jupiter Tesselation (ISO 14306-1).jt`.  

  An industry-standard CAD data exchange, collaboration, and product visualization format.

### Support for texture map files {#support-for-texture-map-files}

Material definitions in 3D model files can include references to external image files that provide texture maps. AEM 3D supports the following types of texture map files:

* Diffuse color textures
* Specular color textures
* Ambient color textures
* Displacement paps (also called Bump maps)
* Normal maps
* Opacity maps
* Roughness maps (also called Gloss, Reflectivity, or Cosine Power maps)

Materials in the primary 3D model file can reference other types of maps which are ignored by AEM 3D.

### IBL (Image-Based Lighting) images {#ibl-image-based-lighting-images}

A 3D model file that defines a stage can reference a single IBL environment image. Currently, AEM 3D supports only 32-bit TIFF images in latitude/longitude format for diffuse IBL and for reflections. For the spherical scene background, 8-bit RGB images are also supported.

See [About working with IBL stages](working-with-ibl-stages.md).

>[!NOTE]
>
>File references&ndash;other than those described above&ndash;that are present in the primary 3D model file are currently ignored. AEM 3D does not support references to secondary 3D model files.
>
>Y-up is the preferred coordinate system for FBX files this release.

## Material shading in a primary 3D model file {#material-shading-in-a-primary-d-model-file}

The original native model file can contain material definitions that are used with shaders such as Blinn, Lambert, or with procedural shaders. These potentially complex materials are supported only when you render using the corresponding native application (such as Autodesk Maya).

For viewing purposes or when you render using the default Rapid Refine™ renderer, all materials are either simplified, substituted, or both so they can be used with a Phong-like shader. This shader supports a limited set of attributes. Other attributes in the material definition are ignored.

See [Viewing 3D assets](viewing-3d-assets.md).

See [Rendering 3D assets](rendering-3d-assets.md).

## Naming materials in a primary 3D model file {#naming-materials-in-a-primary-d-model-file}

A *surface* is defined as the surface area of a 3D model covered by the same material. This material also provides the name for the surface. As such, Adobe recommends that you name the materials included in primary 3D model files accordingly. For example, the use of specific names such as "Body", "Windows", "Tires", or "Rims" is preferred to the use of vague names such as "Red", "Glass", "Rubber", "Aluminum".


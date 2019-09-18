---
title: Assets file format best practices
seo-title: Assets file format best practices
description: Best practices for file support in AEM Assets.
seo-description: Best practices for file support in AEM Assets.
uuid: 7b5c6ea4-d048-4558-85cc-3ea662d3ee27
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: administering
content-type: reference
discoiquuid: 8b4c2a8d-ec9f-4db9-9518-a8f5f86c0c4f
index: y
internal: n
snippet: y
---

# Assets file format best practices{#assets-file-format-best-practices}

AEM Assets supports many proprietary and third-party file format libraries to cater to diverse file support requirements of users. The supported Adobe libraries include, Adobe Camera Raw, Gibson, Adobe PDF Rasterizer, and Adobe InDesign Server. In addition, AEM Assets supports third-party libraries, including ImageMagick, TwelveMonkeys, and so on.

For the supported file formats, see [Assets supported formats](../../../6-5/assets/using/assets-formats.md).

## Adobe Camera Raw library {#adobe-camera-raw-library}

For optimal performance, Adobe recommends using Adobe Camera Raw library for:

* RAW
* DNG

The Adobe Camera Raw library supports CMYK color profile as input. However, it generates the output in RGB colorspace and supports output in JPEG format only. It does not retain the source file colorspace (for example CMYK) in the thumbnails.

For more information, see [Camera Raw support](../../../6-5/assets/using/camera-raw.md) in AEM Assets.

## Adobe PDF Rasterizer library {#adobe-pdf-rasterizer-library}

For best results, Adobe recommends using the Adobe PDF Rasterizer library for the following files:

* Heavy, content intensive PDF files
* AI files with thumbnails not generated out of the box
* For AI files with SPOT (PMS) colors

Thumbnails and previews generated using PDF Rasterizer are better in quality compared to out-of-the-box raster output. The Adobe PDF Rasterizer library does not support any color space conversion. Irrespective of the color space of the source PDF file, Adobe PDF Rasterizer generates RGB output only. 

## Adobe InDesign Server {#adobe-indesign-server}

Adobe recommends that you use Adobe InDesign Server to extract Adobe InDesign-specific renditions, such as IDML and HTML. For more information, see [Adding AEM assets as references in Adobe InDesign](../../../6-5/assets/using/managing-linked-subassets.md#addingaemassetsasreferencesinadobeindesign).

## Dynamic Media  {#dynamic-media}

Dynamic Media generates and delivers multiple variations of rich content in real time through its global, scalable, and performance-optimized network. It serves interactive viewing experiences and streamlines the digital campaign management process. For details around enabling Dynamic Media, see [Configuring Dynamic Media](../../../6-5/assets/using/config-dynamic.md).

Currently, Dynamic Media can support videos up to 20 GB of content per file.

## ImageMagick library {#imagemagick-library}

Adobe recommends using the ImageMagick library in the following scenarios:

* To generate thumbnail renditions for EPS files
* To preserve image profile information
* To preserve transparency
* To process PSD and PSB files

To know how to set up the ImageMagic library in AEM, see [Using ImageMagick](/6-5/assets/using/media-handlers.md#an-example-using-imagemagick). For optimum usage, see [Best Practices for Configuring ImageMagick](../../../6-5/assets/using/best-practices-for-imagemagick.md).

## Image Transcoding Library {#image-transcoding-library}

The Adobe Imaging Transcoding Library is an image-processing solution that performs core image-handling functions, including image encoding, transcoding, resampling, resizing, and so on.

Imaging Transcoding library supports the following MIME types:

* JPG/JPEG
* PNG (8 bit and 16 bit)
* GIF
* BMP
* TIFF/Compressed TIFF (apart from 32 Bit Tiffs and PTiffs).  
* ICO
* ICN

For details, see [Imaging Transcoding Library](../../../6-5/assets/using/imaging-transcoding-library.md).

<!--
Comment Type: draft

<h2>TIFF file support</h2>
-->

<!--
Comment Type: draft

<p>AEM Assets encounters out-of-memory issues not only if the size of the image you upload is large but also if its dimensions exceed recommended limits. Generally, you can avoid such issues with large TIFF files by using FLITE or Image Transcoding Library, instead of using heap memory.<br /> </p>
<p>In addition, open Configuration Manager and set the <span class="code">threshold size to use intermediate temporary file</span> property of the <span class="code">com.day.cq.dam.commons.handler.StandardImageHandler</span> component to a value greater than 0.</p>
<p>Adobe does not recommend using Camera Raw for TIFF processing (due to CMYK issues). If renditions are generated incorrectly, you may want to check by regenerating using the Camera Raw library. However, the Camera Raw library cannot process images that have more than 65000 pixels on their longest side. Moreover, irrespective of the file size, the Camera Raw library can only process images that contain a maximum of 512 MP (512 x 1024 x 1024 pixels).</p>
-->

<!--
Comment Type: draft

<h3>Working with TIFF files</h3>
-->

<!--
Comment Type: draft

<p>It is difficult to accurately determine the maximum size of a TIFF image that can be processed. In addition to the size of the file, the ability to process depends on other factors, such as pixel size. For example, the Camera Raw library may be able to process a 255-MB TIFF file out of the box. However, it may fail to process an 18-MB file if it has a huge pixel difference. Also, Camera Raw library cannot be used to process CMYK TIFF images.<br /> </p>
<p>The following table lists the sizes of Camera Raw-generated TIFF files that have been validated with a 14 GB heap space.</p>
-->

<!--
Comment Type: draft

<note type="note">
<p>In general, increasing heap size helps processing larger files efficiently. However, when processing compressed files (ZIP files), low resolution files may not be processed.</p>
</note>
-->

<!--
Comment Type: draft

<table border="1" cellpadding="1" cellspacing="0" width="100%">
<tbody>
<tr>
<td><strong>Size</strong> (MB)</td>
<td><strong>Dimension</strong> (px)</td>
</tr>
<tr>
<td>18</td>
<td>18897 x 47244</td>
</tr>
<tr>
<td>38.3</td>
<td>8301 x 3429</td>
</tr>
<tr>
<td>39.9</td>
<td>3936 x 2624</td>
</tr>
<tr>
<td>46.6</td>
<td>3008 x 2008</td>
</tr>
<tr>
<td>51.5</td>
<td>3000 x 3000</td>
</tr>
<tr>
<td>72</td>
<td>2048 x 3072</td>
</tr>
<tr>
<td>91.4</td>
<td>3264 x 2448</td>
</tr>
<tr>
<td>91.5</td>
<td>4000 x 4000</td>
</tr>
<tr>
<td>143</td>
<td>5000 x 5000</td>
</tr>
<tr>
<td>225.1</td>
<td>5433 x 7240</td>
</tr>
</tbody>
</table>
-->


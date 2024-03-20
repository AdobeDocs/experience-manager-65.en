---
title: Best practices to process the supported file formats
description: Best practices to process the various supported file types using [!DNL Experience Manager Assets].
contentOwner: AG
role: Admin
feature: Asset Management,Developer Tools
exl-id: da080f12-4cf7-4c26-901b-cd40d9c00bcb
solution: Experience Manager, Experience Manager Assets
---
# Assets file format best practices {#assets-file-format-best-practices}

[!DNL Adobe Experience Manager Assets] supports many proprietary and third-party file format libraries to cater to diverse file support requirements of users. The supported Adobe libraries include, [!DNL Adobe Camera Raw], Gibson, Adobe PDF Rasterizer, and [!DNL Adobe InDesign Server]. In addition, [!DNL Experience Manager Assets] supports third-party libraries, including [!DNL ImageMagick], [!DNL TwelveMonkeys], and so on.

For the supported file formats, see [Assets supported formats](/help/assets/assets-formats.md).

>[!TIP]
>
>If you are using [!DNL Experience Manager] on Adobe Managed Services (AMS), reach out to Adobe Customer Support if you plan to process lots of large PSD or PSB files. Work with Adobe Customer Support representative to implement these best practices for your AMS deployment and to choose the best possible tools and models for Adobe's proprietary formats. [!DNL Experience Manager] may not process very high-resolution PSB files that are more than 30000 x 23000 pixels.

## [!DNL Adobe Camera Raw] library {#adobe-camera-raw-library}

For optimal performance, Adobe recommends using [!DNL Adobe Camera Raw] library for RAW and DNG files.

[!DNL Adobe Camera Raw] library supports CMYK color profile as input. However, it generates the output in RGB colorspace and supports output in JPEG format only. It does not retain the source file colorspace (for example, CMYK) in the thumbnails.

For more information, see [Camera Raw support](/help/assets/camera-raw.md).

## Adobe PDF Rasterizer library {#adobe-pdf-rasterizer-library}

For best results, Adobe recommends using the Adobe PDF Rasterizer library for the following files:

* Heavy, content intensive PDF files
* AI files with thumbnails not generated out of the box
* For AI files with SPOT (PMS) colors

Thumbnails and previews generated using PDF Rasterizer are better in quality compared to out-of-the-box raster output. The Adobe PDF Rasterizer library does not support any colorspace conversion. Irrespective of the colorspace of the source PDF file, Adobe PDF Rasterizer generates only RGB output.

## [!DNL Adobe InDesign Server] {#adobe-indesign-server}

Adobe recommends that you use [!DNL Adobe InDesign Server] to extract [!DNL Adobe InDesign]-specific renditions, such as IDML and HTML. For more information, see [Adding Experience Manager assets as references in Adobe InDesign](/help/assets/managing-linked-subassets.md#refai).

## [!DNL Dynamic Media] {#dynamic-media}

[!DNL Dynamic Media] generates and delivers multiple variations of rich content in real time through its global, scalable, and performance-optimized network. It serves interactive viewing experiences and streamlines the digital campaign management process. For details around enabling [!DNL Dynamic Media], see [Configuring Dynamic Media](/help/assets/config-dynamic.md).

Currently, [!DNL Dynamic Media] can support videos up to 15 GB of content per file.

## ImageMagick library {#imagemagick-library}

Adobe recommends using the ImageMagick library in the following scenarios:

* To generate thumbnail renditions for EPS files.
* To preserve image profile information.
* To preserve transparency.
* To process PSD and PSB files.

To know how to set up the [!DNL ImageMagick] library in [!DNL Experience Manager], see [Using ImageMagick](/help/assets/media-handlers.md#an-example-using-imagemagick). For optimum usage, see [Best Practices for Configuring ImageMagick](/help/assets/best-practices-for-imagemagick.md).

## Image Transcoding Library {#image-transcoding-library}

The Adobe Imaging Transcoding Library is an image-processing solution that performs core image-handling functions, including image encoding, transcoding, re-sampling, resizing, and so on.

Imaging Transcoding Library supports the following MIME types:

* JPG/JPEG
* PNG (8 bit and 16 bit)
* GIF
* BMP
* TIFF/Compressed TIFF (apart from 32 Bit Tiffs and PTiffs).
* ICO
* ICN

For details, see [Imaging Transcoding Library](/help/assets/imaging-transcoding-library.md).

---
title: Using PDF Rasterizer
description: This article describes how to generate high-quality thumbnails and renditions using the Adobe PDF Rasterizer library.
uuid: 583e8cb6-92c0-4818-a130-dbbb9a3cdca4
contentOwner: AG
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
discoiquuid: 52d6c489-aa19-4e27-a429-1acae1af4825
docset: aem65

---

# Using PDF Rasterizer {#using-pdf-rasterizer}

Sometimes, when you upload large, content-intensive PDF or AI files to Adobe Experience Manager (AEM) Assets, the default library may not generate an accurate output. In such cases, Adobe's PDF Rasterizer library can generate more reliable and accurate output compared to the output from a default library.

Adobe recommends using the PDF Rasterizer library for the following:

* Heavy, content intensive AI/PDF files
* AI/PDF files with thumbnails not generated out of the box
* AI files with Pantone Matching System (PMS) colors

Thumbnails and previews generated using PDF Rasterizer are better in quality compared to out-of-the-box output and, therefore, provide consistent viewing experience across devices. The Adobe PDF Rasterizer library does not support any color space conversion. It always outputs to RGB irrespective of the color space of the source file.

1. Install the PDF Rasterizer package on your AEM instance from [Package Share](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq640/product/assets/aem-assets-pdf-rasterizer-pkg).

   >[!NOTE]
   >
   >The PDF Rasterizer library is available for Windows and Linux only.

1. Access the AEM Assets workflow console at `https://[server]:[port]/workflow`.

   Open the DAM Update Asset workflow page.

1. To prevent the thumbnail and web rendition generation for PDF and AI files using the default methods, follow these steps:

    * Open the **Process Thumbnails** step, and add *application/pdf* or *application/postscript* in the **Skip Mime Types** field under the **Thumbnails** tab as necessary.

   ![skip_mime_types-2](assets/skip_mime_types-2.png)

    * In the **Web Enabled Image** tab, add *application/pdf* or *application/postscript* under **Skip List** depending upon your requirements.

   ![web_enabled_imageskiplist](assets/web_enabled_imageskiplist.png)

1. Open the **Rasterize PDF/AI Image Preview Rendition** step, and remove the MIME type for which you want to skip the default generation of preview image renditions. For example, remove the MIME type *application/pdf*, *application/postscript,* or *application/illustrator *from the **MIME Types** list.

   ![process_arguments](assets/process_arguments.png)

1. Drag the **PDF Rasterizer Handler** step from the side panel to below the **Process Thumbnails** step.
1. Configure the following arguments for the **PDF Rasterizer Handler** step:

    * Mime Types: *application/pdf *or *application/postscript*

    * Commands: `PDFRasterizer -d -p 1 -s 1280 -t PNG -i ${file}`
    * Add Thumbnail sizes: 319:319, 140:100, 48:48. Add custom thumbnail configuration, if necessary.

   The command line arguments for the `PDFRasterizer` command can include the following:

   **-d**: Flag to enable smooth rendering of text, vector artwork, and images. Creates better quality images. However, including this parameter causes the command to run slowly and increase the size of images.

   `-p`: Page number. Default value is all pages. '&#42;' denotes all pages.

   **-s**: Maximum image dimension (height or width). This is converted to DPI for each page. If pages are of different size, each page can potentially scale by different amount. The default is actual page size.

   **-t**: Output image type. Valid types are JPEG, PNG, GIF, and BMP. The default value is JPEG.

   **-i**: Path for input PDF. It is a mandatory parameter.

   `-h`: Help

1. To delete intermediate renditions, select **Delete Generated Rendition**.
1. To let PDF Rasterize generate web renditions, select **Generate Web Rendition**.

   ![generate_web_renditions1](assets/generate_web_renditions1.png)

1. Specify the settings in the **Web Enabled Image** tab.

   ![web_enabled_image1](assets/web_enabled_image1.png)

1. Save the workflow.
1. To enable PDF Rasterizer to process PDF pages with PDF libraries, open the **DAM Process Subasset** model from the Workflow console.
1. From the side panel, dragthePDF Rasterizer Handler step under the **Create Web-Enabled Image Rendition** step.
1. Configure the following arguments for the **PDF Rasterizer Handler** step:

    * Mime Types: *application/pdf *or *application/postscript*

    * Commands: `PDFRasterizer -d -p 1 -s 1280 -t PNG -i ${file}`
    * Add Thumbnail sizes: 319:319, 140:100, 48:48. Add custom thumbnail configuration, if necessary.

   The command line arguments for the PDFRasterizer command can include the following:

   **-d**: Flag to enable smooth rendering of text, vector artwork, and images. Creates better quality images. However, including this parameter causes the command to run slowly and increase the size of images.

   **-p**: Page number. Default value is all pages. '&#42;' denotes all pages.

   **-s**: Maximum image dimension (height or width). This is converted to DPI for each page. If pages are of different size, each page can potentially scale by different amount. The default is actual page size.

   **-t**: Output image type. Valid types are JPEG, PNG, GIF, and BMP. The default value is JPEG.

   **-i**: Path for input PDF. It is a mandatory parameter.

   **-h**: Help

1. To delete intermediate renditions, select **Delete Generated Rendition**.
1. To let PDF Rasterize generate web renditions, select **Generate Web Rendition**.

   ![generate_web_renditions](assets/generate_web_renditions.png)

1. Specify the settings in the **Web Enabled Image** tab.

   ![web_enabled_image-1](assets/web_enabled_image-1.png)

1. Save the workflow.
1. Upload a PDF or AI file to AEM Assets. PDF Rasterizer generates the thumbnails and web renditions for the file.


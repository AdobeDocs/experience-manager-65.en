---
title: Converting files using PDF Generator
description: The PDF Generator service converts native file formats to PDF. It also converts PDF to other file formats and optimizes the size of PDF documents.

contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/working_with_pdf_generator
products: SG_EXPERIENCEMANAGER/6.5/FORMS

feature: PDF Generator
exl-id: 0e2c12b5-24c8-4aca-8826-cb661051ce4f
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Converting files using PDF Generator{#converting-files-using-pdf-generator}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

You can use the PDF Generator web pages to convert files.

## Create a PDF file {#create-a-pdf-file}

1. In administration console, click Services &gt; PDF Generator &gt; Create PDF.
1. Click Browse to find and select the file.

   >[!NOTE]
   >
   >PDF Generator is able to automatically detect the file type of .doc, .xls, .ppt, and .rtf files, even when the file name is missing the file extension. This feature does not work with .docx, .xlsx, and .pptx files.

1. Under Configuration Settings, select Use Custom Settings or Upload Settings File.

    * If you are using custom settings, select an Adobe PDF setting, security setting, and file type setting and specify a time out.

      The Adobe PDF settings are applicable only to PS-to-PDF, EPS-to-PDF, PRN-to-PDF, Image-to-PDF with OCR on, and Native-to-PDF conversions. The time-out setting specifies the maximum time the conversion takes to complete. The default is 270 seconds. These settings are not used during Image-to-PDF and OpenOffice-to-PDF conversions.

    * If you are uploading a settings file, type its path and name in the box, or click Browse to find and select the file.

1. (Optional) Under XMP Metadata File, type the path and name of the XMP file, or click Browse to find and select the file. An XMP file can be used to include standard metadata information. (See [About XMP files](converting-files-using-pdf-generator.md#about-xmp-files).)
1. Click Create. When the file is created, a link to it appears. If an error occurs during conversion, a warning appears. If you are creating a Postscript file, the warning also contains a link to the log file.
1. Click the link for the PDF file. The file opens in Acrobat.

### About XMP files {#about-xmp-files}

PDF documents that PDF Generator creates in Acrobat 5.0 or later contain document metadata in XML format. *Metadata* includes information about the document and its contents, such as author's name, keywords, and copyright information that search utilities can use.

The document metadata contains (but is not limited to) information that also appears on the Description tab of the Document Properties dialog box in Acrobat. Changes that are made on the Description tab are reflected in the document metadata. Document metadata can be extended and modified by using third-party products.

Adobe Extensible Metadata Platform (XMP) provides Adobe applications with a common XML framework that standardizes the creation, processing, and interchange of document metadata across publishing workflows. You can save and import the document metadata XML source code in XMP format, making it easy to share metadata among various documents. For more information about XMP files, see [Extensible Metadata Platform (XMP)](https://www.adobe.com/products/xmp/) and [Adobe XMP Developer Center](https://www.adobe.com/devnet/xmp.html).

You can create XMP files in Acrobat.

## Convert an HTML file or ZIP file to PDF {#convert-an-html-file-or-zip-file-to-pdf}

You can use PDF Generator to convert the following types of files to Adobe PDF:

* HTML files, which you can convert by uploading an HTML file or by specifying the URL of a web page or website.
* Archived files (ZIP), which can contain HTML files, image files, or both.

If the ZIP file contains more than one HTML file at the lowest level of its folder hierarchy, the ZIP file must also contain an index.htm or index.html file.

>[!NOTE]
>
>* The HTML to PDF feature requires certain fonts in the system font directory. On Linux, Solaris, and AIX systems, the system font directory must contain the Courier font. On Windows systems, the system font directory must contain Times New Roman.
>
>* (UNIX-based system only) One of the following Japanese fonts should be available on AEM Forms server to convert a web page with Japanese font to a PDF document.
>
>  * "Sazanami Gothic"
>  * "Kozuka Gothic Pro-VI"
>  * "Kozuka Mincho Pro-VI"
>  * "Sazanami Gothic"
>  * "Kozuka Mincho Pr6N"
>  * "Sazanami Mincho"
>  * "Adobe Heiti Std"
>  * "Adobe Song Std"
>
>* To upload a file from the local file system, use the Upload File option on the HTML to PDF page.

1. In administration console, click Services &gt; PDF Generator &gt; HTML to PDF.
1. Specify the file to convert by doing one of the following tasks:

    * In Upload File, type the path and filename of the HTML file or ZIP file, or click Browse to locate and select it.
    * In the Specify URL box, type the URL of the page or website to convert.

    >[!NOTE]
    >
    >The file that you are converting must have a filename extension of .html, .htm, or .zip.  

1. Specify the configuration settings:

    * To use custom settings, select Use Custom Settings, specify the security and file type settings, and specify a time-out value. The default value is 270 seconds.

    >[!NOTE]
    >
    >If you configured the Generate PDF service to use Acrobat WebCapture, the File Type Settings that you select on this page do not affect the PDF produced. Instead, make the appropriate changes to the version of Acrobat that is installed on the server.  

    * To use an existing settings file, select Upload Settings File and click Browse to go to the file location.

1. To upload an XMP file, click Browse and go to the file location. An XMP file can be used to include standard metadata information. (See [About XMP files](converting-files-using-pdf-generator.md#about-xmp-files).)
1. Click Create. When the file is created, a link to the PDF file appears.
1. Click the link to view the PDF document in Acrobat.

## Export a PDF file to another file format (Windows Only) {#export-a-pdf-file-to-another-file-format-windows-only}

You can export PDF files to various file formats, as described in the Generate PDF Service chapter of [Services Reference](https://www.adobe.com/go/learn_aemforms_services_63).

1. In administration console, click Services &gt; PDF Generator &gt; Export PDF.
1. Click Browse to locate the PDF file to export.
1. In the Export PDF file to list, select the format to export the PDF file to.
1. In the Specify A Timeout box, enter the time to wait before the application times out. The default value is 270 seconds.

   The Conversion Time that is displayed when the file is converted may be larger than the value you specify here. The Conversion Time includes the time spent waiting for the thread or process, time taken to convert the file, and the time taken by the fallback converter (if applicable). time. The Specify a Timeout value is just the time taken to convert the file.

1. (Optional) In the **Specify custom Preflight profile** option, click Browse, and select a [custom Preflight profile](https://helpx.adobe.com/acrobat/using/preflight-profiles-acrobat-pro.html). Preflight profiles are only used while converting documents to PDF archive (PDF/A) format.
1. Click Export. When the conversion is complete, a link to the exported file appears.
1. Click the link to view the converted file.

## Optimize a PDF (Windows Only) {#optimize-a-pdf}

PDF Generator supports reducing the size of PDF files.

>[!NOTE]
>
>Optimizing a digitally signed document removes and invalidates the digital signatures.

1. In administration console, click Services &gt; PDF Generator &gt; Optimize PDF.
1. Click Browse to locate the PDF file to optimize.
1. Specify the configuration settings:

    * To use custom settings, select Use Custom Settings, specify the file type settings, and specify a time-out value. The default value is 270 seconds.
    * To use an existing settings file, select Upload Settings File and click Browse to go to the file location.

1. Click Create.

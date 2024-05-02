---
title: Configuring file type settings
description: Learn how to configure file type settings. In PDF Generator, you can set up the application setting for supported file types to configure file type settings.

geptopics: SG_AEMFORMS/categories/working_with_pdf_generator
products: SG_EXPERIENCEMANAGER/6.5/FORMS
content-type: reference

feature: PDF Generator
exl-id: 1a6640cc-22ef-41d5-a0c6-7a2c2dabcef1
solution: Experience Manager, Experience Manager Forms
role: "User, Developer"
---
# Configuring file type settings {#configuring-file-type-settings}

In PDF Generator, you can set up the application settings for supported file types. On Windows, you can set up the application settings for each supported file type. On UNIX and Linux, you can set up the application settings for HTML-to-PDF and OpenOffice.

On the File Type Settings page, you can perform these tasks:

* [Create or edit a File Type setting](#create-or-edit-file-type-settings)
* Specify which file type settings to use by default (see [Importing and exporting PDF Generator configuration files](/help/forms/using/admin-help/importing-exporting-pdf-generator-configuration.md))
* [Change the default settings](/help/forms/using/admin-help/configuring-file-type-settings.md#change-the-default-settings)
* [Enable PDF/A support](/help/forms/using/admin-help/enable-pdf-a-support.md)
* [Delete a File Type setting](/help/forms/using/admin-help/enable-pdf-a-support.md)

>[!NOTE]
>
>The file type settings are not available for the fallback convertors such as Acrobat for HTML to PDF conversion, Microsoft PowerPoint, Microsoft Word, and Microsoft Excel.

## Create or edit File Type settings {#create-or-edit-file-type-settings}

Create or edit a file type setting to specify how the application handles the conversion of supported file types. On Windows, you can set up the application settings for each supported file type. On UNIX and Linux, you can set up the application settings for HTML-to-PDF and OpenOffice.

1. In administration console, click **[!UICONTROL Services]** > **[!UICONTROL PDF Generator]** > **[!UICONTROL File Type Settings]**.
1. Click New or click the name of a setting.
1. In the Filename Extensions box, type the filename extensions, separated by commas, for file types that are accepted for this application. Do not include the period before or a space between the extensions. The default is `bmp,gif,jpeg,jpg,tif,tiff,png`.
1. (Optional) To use optical code recognition (OCR) of text in graphics or images, select Use OCR and set the following options:

**Primary OCR Language:** The language for the OCR engine to use to identify the characters. The default is English (US).

**PDF Output Style:** Select Searchable Image to have a bitmap image of the pages in the foreground and the scanned text on an invisible layer beneath. The appearance of the page does not change, but the text becomes selectable and readable. Select Formatted Text & Graphics to reconstruct the original page by using recognized text, fonts, pictures, and other graphic elements. The default is Searchable Image (Exact).

**Downsample Images:** Decreases the number of pixels in color, grayscale, and monochrome images. Downsampling of scanned images is performed after OCR is complete. The default is Lowest (600 dpi). This option is not available if you set PDF output style to Searchable Image (Exact).

1. Complete the required information in these sections:

   [Importing and exporting PDF Generator configuration files](/help/forms/using/admin-help/importing-exporting-pdf-generator-configuration.md)

   [Adobe PDF export settings (Windows only)](#adobe-pdf-export-settings-windows-only)

   [HTML-to-PDF settings](#html-to-pdf-settings)

   [Flash videos to PDF settings](#flash-videos-to-pdf-settings)

   [XPS to PDF settings](#xps-to-pdf-settings)

   [PDF optimizer settings](/help/forms/using/admin-help/configuring-file-type-settings.md)

   [Microsoft Excel settings (Windows only)](/help/forms/using/admin-help/configuring-file-type-settings.md#microsoft-excel-settings-windows-only)

   [Microsoft PowerPoint settings (Windows only)](/help/forms/using/admin-help/configuring-file-type-settings.md#microsoft-powerpoint-settings-windows-only)

   [Microsoft Project settings (Windows only)](/help/forms/using/admin-help/configuring-file-type-settings.md#microsoft-project-settings-windows-only)

   [Microsoft Word settings (Windows only)](/help/forms/using/admin-help/configuring-file-type-settings.md#microsoft-word-settings-windows-only)

   [Microsoft Visio settings (Windows only)](#visio)

   [Microsoft Publisher settings (Windows only)](/help/forms/using/admin-help/configuring-file-type-settings.md#microsoft-publisher-settings-windows-only)

   [AutoCAD settings (Windows only)](/help/forms/using/admin-help/configuring-file-type-settings.md#autocad-settings-windows-only)

   [OpenOffice settings](/help/forms/using/admin-help/configuring-file-type-settings.md#openoffice-settings)

   [Other applications' settings (Windows only)](/help/forms/using/admin-help/configuring-file-type-settings.md#other-applications-settings-windows-only)

   To go to another section, click its link on the web page or use the **[!UICONTROL Next]** or **[!UICONTROL Previous]** buttons.

1. After you complete all the sections, click **[!UICONTROL Save]** or **[!UICONTROL Save As]** and provide a name for the setting.

Support for various file types can be customized. (See " [Adding Support for Additional Native File Formats](https://help.adobe.com/en_US/AEMForms/6.1/ProgramLC/WS624e3cba99b79e12e69a9941333732bac8-7756.2.html)" in [Programming with AEM forms](https://www.adobe.com/go/learn_lc_programming_11).)

## Change the default settings {#change-the-default-settings}

You can change the default value for the Adobe PDF settings, security settings, and file type settings that apply to newly created sources. Changing the defaults does not affect the settings of existing sources.

1. In Administration Console, click **[!UICONTROL Services > PDF Generator]**.
1. On the **[!UICONTROL Adobe PDF Settings]**, **[!UICONTROL File Type Settings]**, or **[!UICONTROL Security Settings]** page, click **[!UICONTROL Set Default Settings]**.
1. Select your preferred default settings. One or more of the following settings are available on the Set Default Settings page:

   **[!UICONTROL Adobe PDF Setting]**: The original default is Standard (Acrobat 6).

   **[!UICONTROL Security Settings]**: The original default is No Security (Acrobat 5).

   **[!UICONTROL File Type Settings]**: The original default is Standard.

1. Click **[!UICONTROL Save]**.

## Delete a File Type setting {#delete-a-file-type-setting}

You can delete a file type setting that is no longer used.

1. In administration console, click **[!UICONTROL Services > PDF Generator> File Type Settings]**.
1. Select the check box beside the setting to delete. You can select multiple sources. Settings that do not have a check box next to them are always included with PDF Generator and cannot be deleted.
1. Click **[!UICONTROL Delete]** and, on the Delete Confirmation page, click **[!UICONTROL Delete]**.

## Image to PDF settings {#image-to-pdf-settings}

The following options determine how image files are converted to PDF. For instructions about accessing these settings, see [Create or edit file type settings](configuring-file-type-settings.md#create-or-edit-file-type-settings).

**Filename Extensions:** Comma-separated list of filename extensions that can be converted.

**Try Fallback Converter:** PDF Generator can use either Java&trade; or Acrobat to convert image files to PDF. When this option is selected and a conversion fails or reaches the specified time-out limit, PDF Generator attempts the conversion by using the alternate method. If alternate method fails or reaches the specified time-out limit, an exception is written to the log file.

>[!NOTE]
>
>JPEG 2000 files can only be converted using Acrobat.

**Use OCR:** Specifies whether to apply OCR (optical character recognition) to the PDF. OCR software enables you to search, correct, and copy the text in the PDF.

***note**: The OCR PDF (searchable PDF) feature is supported only on Microsoft Windows.*

**Primary OCR Language:** Specifies the language for the OCR engine to use to identify the characters.

**PDF Output Style:** Determines the type of PDF to produce. All formats apply OCR and font and page recognition to the text images and convert them to normal text.

**Searchable Image:** Ensures that text is searchable and selectable. This option keeps the original image, deskews it as needed, and places an invisible text layer over it. The Downsample Images option determines whether the image is downsampled and to what extent.

**Searchable Image (Exact):** Ensures that text is searchable and selectable. This option keeps the original image and places an invisible text layer over it. Recommended for cases that require maximum fidelity to the original image.

**ClearScan:** Synthesizes a new Type 3 font that closely approximates the original, and preserves the page background by using a low-resolution copy.

**Downsample Images:** Decreases the number of pixels in color, grayscale, and monochrome images after OCR is complete. Choose the degree of downsampling to apply. Higher-numbered options do less downsampling, which produces higher-resolution PDFs.

## Adobe PDF export settings (Windows only) {#adobe-pdf-export-settings-windows-only}

The Export File Type setting in the Adobe PDF export settings section is used for converting a PDF file to another format. The default is HTML 4.01 with cascading style sheets (CSS) 1.0 (*.htm, *.html).

For instructions about accessing this setting, see [Create or edit file type settings](configuring-file-type-settings.md#create-or-edit-file-type-settings).

## HTML-to-PDF settings {#html-to-pdf-settings}

The following options determine how HTML files are converted to PDF. For instructions about accessing these options, see [Create or edit file type settings](configuring-file-type-settings.md#create-or-edit-file-type-settings).

**Try Fallback Converter:** PDF Generator can use either Java&trade; or Acrobat to convert HTML files to PDF. When this option is selected and a conversion fails or reaches the specified time-out limit, PDF Generator attempts the conversion by using the alternate method. If alternate method fails or reaches the specified time-out limit, an exception is written to the log file.

**Default Encoding:** Sets the input encoding of the file text from a menu of operating systems and alphabets. Uses the selection shown in the Default Encoding option only if the HTML source file does not specify a type of encoding.

**Force Selected Encoding:** Ignores any encoding that is specified in the HTML source file and uses the selection shown in the Default Encoding option.

### Spidering settings {#spidering-settings}

*Spidering* scans web pages for links to other web pages. When a link to another web page is encountered, the destination page is fetched and included in the PDF document that is generated. Enable these options to set the number of levels to be fetched and converted to PDF:

**Get Only X Levels:** Spiders and converts pages up to a depth of the specified level from the base page URL. A value of 1 converts only the supplied URL.

**Get Entire Site:** Converts the entire site, starting from the provided URL.

**Stay On Same Path:** Any links that point to pages that are not on the same relative path as the base URL are not converted during spidering.

**Stay On Same Server:** Any links that point to pages on different servers are not converted during spidering. Only links that point to the same server as the specified URL are converted.

### Page conversion settings {#page-conversion-settings}

Enable these options to specify how the HTML pages are converted. Based on the page size, the width, height, and margin values adjust accordingly.

**Page Size:** Choose custom and specify the width and height, or select predefined dimensions.

**Orientation:** Select either portrait or landscape for the converted PDF document.

**Margins:** Specifies the margins (Top, Bottom, Left, and Right) in the generated PDF document.

**Add Bookmarks To PDF:** Adds bookmarks to the PDF document.

**Enable Tagged PDF:** Embeds tags in the PDF document.

**Set Initial View Settings:** Lets you configure Document Options, Window Options, and User Interface Options. These settings determine how the content is initially displayed.

### Document Options {#document-options}

Enable these options to specify how to display content, how to display pages in the PDF document, and how to specify the magnification level:

**Show:** Select the panes to be open in Acrobat when the PDF document is opened.

**Page Layout:** Select the type of page layout for the PDF document.

**Magnification:** Choose preset magnification for the initial view of the PDF document or select a custom value. Choosing a default setting indicates that the default Acrobat magnification is used.

**Open To Page Number:** Specify the page number that the PDF opens to.

### Window Options {#window-options}

Enable these options to specify how the window is sized and displayed.

**Resize Window To Initial Page:** Resizes the Acrobat window to the size of the initial page.

**Center Window On Screen:** Opens the window in the center of the screen.

**Open In Full Screen Mode:** Opens the window in full screen mode.

**Show:** Displays the document title or filename in the window.

### User Interface Options {#user-interface-options}

Enable these options to specify the window appearance:

**Hide Menu Bar:** Hides the menu bar in the PDF document.

**Hide Toolbars:** Hides the toolbars in the PDF document.

**Hide Window Controls:** Hides the window controls in the PDF document.

## Flash videos to PDF settings {#flash-videos-to-pdf-settings}

PDF Generator supports the ability to submit a video for Adobe Flash (SWF or FLV file) and create a PDF file with a video for Adobe Flash embedded in it. This conversion does not require Adobe Flash Player to be installed on the Forms Server. For instructions about accessing this option, see [Create or edit file type settings](configuring-file-type-settings.md#create-or-edit-file-type-settings).

**Filename Extensions:** Comma-separated list of filename extensions that can be converted.

## XPS to PDF settings {#xps-to-pdf-settings}

XML Paper Specification (XPS) is used in Windows Printing machine. This is a Microsoft format and can be created from any Microsoft Office application. AEM forms provides the ability to convert XPS files PDF.

**Filename Extensions:** A comma-separated list of all the XPS filename extensions that can be converted. Currently there is one format: .xps.

## PDF optimizer settings {#pdf-optimizer-settings}

PDF Generator supports the ability to reduce the size of PDF files. Whether you use all these settings or only a few depends on how you intend to use the files and on the essential properties that a file must have. In most cases, the default settings are appropriate for maximum efficiency - saving space by removing embedded fonts, compressing images, and removing items from the files that are no longer needed.

>[!NOTE]
>
>Optimizing a digitally signed document removes and invalidates the digital signatures.

For instructions about accessing this setting, see [Create or edit file type settings](configuring-file-type-settings.md#create-or-edit-file-type-settings).

**Target PDF Version:** Specifies the version of Acrobat that the PDF is compatible with.

### Fonts {#fonts}

1. Select **Fonts.**
1. Select one of the following options:

   **Unembed all fonts:** Unembeds all embedded fonts.

   **Do not unembed any font:** Does not unembed any fonts.

   **Unembed some fonts:** Unembeds only the specified fonts. Follow these steps to specify the fonts that you want to unembed:

    * If necessary, select a different fonts directory from the **Font source** drop-down menu. This drop-down menu lists fonts directories specified in **Home &gt; Settings &gt; Core System &gt; Core Configurations**.
    * Select one or more fonts from the **Available Fonts** list and click **Add**. These fonts are added to the **Fonts to Unembed** list.
    * If you want to unembed some fonts that do not exist on the Forms Server, enter the names of those fonts in the **Add fonts to unembed** box. Click **Add**.

   >[!NOTE]
   >
   >*If you want to unembed some fonts whose subsets are embedded in the document, prefix the font name with the + sign. For example, "+Helvetica".*

1. If you want to embed only the in-use subsets of the embedded fonts, select **Subset all embedded fonts**.

   >[!NOTE]
   >
   >*If you're using this option in combination with **Unembed some fonts**, fonts in the **Add fonts to unembed** list are still completely unembedded.*

   >[!NOTE]
   >
   >*Font subsetting is the technique of embedding only a portion of a font. A font subset contains only the characters used in your document.*

### Transparency {#transparency}

If your PDF document includes artwork that contains transparency, you can use the PDF Optimizer settings to flatten transparency and reduce file size.

>[!NOTE]
>
>If Acrobat 4.0 and later is selected as the Target PDF version, all transparent objects are flattened. For other Target PDF versions, transparency is supported and you can configure the transparency settings.

Select **Transparency** to configure the transparency settings while optimizing PDF documents.

**Transparency level** Specifies the amount of vector information that will be preserved. Higher settings preserve more vector objects, while lower settings rasterize more vector objects; intermediate settings preserve simple areas in vector form and rasterize complex ones. Select the lowest setting to rasterize all the artwork.

>[!NOTE]
>
>The amount of rasterization that occurs, depends on the complexity of the page and the types of overlapping objects.

**Line Art and Text** Resolution to which all objects, including images, vector artwork, text, and gradients, are rasterized. The supported values are 1 pixels per inch (ppi) to 9600 ppi.

>[!NOTE]
>
>Line Art and Text resolution should generally be set to 600-1200 ppi to provide high-quality rasterization, especially on serif or small point sized type.

**Gradient and Meshes** Resolution to which gradient and meshes are rasterized. The supported values are 1 ppi to 1200 ppi.

>[!NOTE]
>
>Gradient and mesh resolution should generally be set to 150-300 ppi because the quality of the gradients, drop shadows, and feathers do not improve with higher resolutions, but printing time and file size increase.

**Convert All Text to Outlines** Converts all type objects (point type, area type, and path type) to outlines and discards all type glyph information on pages containing transparency. This option ensures that the width of text stays consistent during flattening. Note that enabling this option will cause small fonts to appear slightly thicker when viewed in Acrobat or printed on low-resolution desktop printers. It does not affect the quality of the type printed on high-resolution printers or imagesetters.

**Convert All Strokes to Outlines** Converts all strokes to simple filled paths on pages containing transparency. This option ensures that the width of strokes stays consistent during flattening. Note that enabling this option causes thin strokes to appear slightly thicker and may degrade flattening performance.

**Clip Complex Regions** Ensures that the boundaries between vector artwork and rasterized artwork fall along object paths. This option reduces stitching artifacts that result when part of an og

<!--
NOTE to WRITER: Unfinished sentence above.
-->

>[!NOTE]
>
>Some print drivers process raster and vector art differently, sometimes resulting in color stitching. You may be able to minimize stitching problems by disabling some print-driver specific color-management settings. These settings vary with each printer, so see the documentation that came with your printer for details.

Preserve Overprint: Blends the color of transparent artwork with the background color to create an overprint effect.

The following table shows common types of printers and their resolution measured in dpi, their default screen ruling measured in lines per inch (lpi), and a resampling resolution for images measured in pixels per inch (ppi). For example, if you were printing to a 600-dpi laser printer, you would enter 170 for the resolution at which to resample images.

**Images** Select Images to specify compression and resampling options for color, grayscale, and monochrome images. You may want to experiment with these options to find an appropriate balance between file size and image quality.The resolution setting for color and grayscale images should be 1.5 to 2 times the line screen ruling at which the file will be printed. The resolution for monochrome images should be the same as the output device, but saving a monochrome image at a resolution higher than 1500 dpi increases the file size without noticeably improving image quality. Images that will be magnified, such as maps, may require higher resolutions.

>[!NOTE]
>
>Resampling monochrome images can have unexpected viewing results, such as no image display. If this happens, turn off resampling and convert the file again. This problem is most likely to occur with subsampling, and least likely with bicubic downsampling.

<table>
 <tbody>
  <tr>
   <th><p><strong>Printer resolution</strong></p> </th>
   <th><p><strong>Default line screen</strong></p> </th>
   <th><p><strong>Image resolution</strong></p> </th>
  </tr>
  <tr>
   <td><p>300 dpi (laser printer)</p> </td>
   <td><p>60 lpi</p> </td>
   <td><p>120 ppi</p> </td>
  </tr>
  <tr>
   <td><p>600 dpi (laser printer)</p> </td>
   <td><p>85 lpi</p> </td>
   <td><p>170 ppi</p> </td>
  </tr>
  <tr>
   <td><p>1200 dpi (imagesetter)</p> </td>
   <td><p>120 lpi</p> </td>
   <td><p>240 ppi</p> </td>
  </tr>
  <tr>
   <td><p>2400 dpi (imagesetter)</p> </td>
   <td><p>150 lpi</p> </td>
   <td><p>300 ppi</p> </td>
  </tr>
 </tbody>
</table>

#### Discard Objects {#discard-objects}

* Select **Discard Objects** to specify objects to remove from the PDF and to optimize curved lines in CAD drawings.
* **Discard All Form Submission, Import And Reset Actions**: Disables all actions that are related to submitting or importing form data, and resets form fields. This option retains form objects that actions are linked to.
* **Discard All JavaScript Actions**: Removes from the PDF any actions that use JavaScript.
* **Discard Embedded Page Thumbnails**: Removes embedded page thumbnails. This option is useful for large documents, which can take a long time to draw page thumbnails after you click the Pages button.
* **Convert Smooth Lines To Curves**: Reduces the number of control points used to build curves in CAD drawings, which results in smaller PDF files and faster onscreen rendering.
* **Discard Embedded Print Settings**: Removes embedded print settings, such as page scaling and duplex mode, from the document.
* **Discard Bookmarks**: Removes all bookmarks from the document.
* **Flatten Form Fields**: Makes form fields unusable with no change to their appearance. Form data is merged with the page to become page content.
* **Discard All Alternate Images**: Removes all versions of an image except the version that is destined for onscreen viewing. Some PDFs include multiple versions of the same image for different purposes, such as low-resolution onscreen viewing and high-resolution printing.
* **Discard Document Tags**: Removes tags from the document, which also removes the accessibility and reflow capabilities for the text.
* **Detect And Merge Image Fragments**: Looks for images or masks that are fragmented into thin slices and tries to merge the slices into a single image or mask.
* **Discard Embedded Search Index**: Removes embedded search indexes, which reduces file size.

#### Discard User Data {#discard-user-data}

Select **Discard User Data** to remove any personal information that you do not want to distribute or share with other users.

* **Discard All Comments, Forms And Multimedia**: Removes all comments, forms, form fields, and multimedia from the PDF.
* **Discard All Object Data**: Removes all objects from the PDF.
* **Discard External Cross References**: Removes links to other documents. Links that jump to other locations within the PDF are not removed.
* **Discard Hidden Layer Content And Flatten Visible Layers**: Decreases file size. The optimized document looks like the original PDF but does not contain layer information.
* **Discard Document Information And Metadata**: Removes information in the document information dictionary and all metadata streams. (Use the Save As command to restore metadata streams to a copy of the PDF.)
* **Discard File Attachments**: Removes all file attachments, including attachments added to the PDF as comments. (PDF Optimizer does not optimize attached files.)
* **Discard Private Data Of Other Applications**: Strips information from a PDF document that is useful only to the application that created the document. This setting does not affect the functionality of the PDF, but it does decrease the file size.

### Clean Up {#clean-up}

Select **Clean Up** to remove unnecessary items from the document.
These items include elements that are obsolete or unnecessary for your intended use of the document. Removing certain elements can seriously affect the functionality of the PDF. By default, only elements that do not affect functionality are selected. If you are unsure of the implications of removing other options, use the default selections.

**Compression**

Select one of the following Flate compression options from the drop-down menu:

* Compress entire file
* Compress document structure
* Remove compression
* Leave compression untouched

**Use Flate To Encode Streams That Are Not Encoded**: Applies Flate compression to all streams that are not encoded.

**Discard Invalid Bookmarks**: Removes bookmarks that point to pages in the document that are deleted.

**Discard Unreferenced Named Destinations**: Removes named destinations that are not being referenced internally from within the PDF document. This option does not check for links from other PDF files or websites.

**Optimize The PDF For Fast Web View**: Restructures a PDF document for page-at-a-time downloading (byte-serving) from web servers.

**In Streams That Use LZW Encoding, Use Flate Instead**: Applies Flate compression to all content streams and images that use LZW encoding.

**Discard Invalid Links**: Removes links that jump to invalid destinations.

**Optimize Page Content**: Converts all end-of-line characters to space characters, which improves Flate compression.

## Microsoft Excel settings (Windows only) {#microsoft-excel-settings-windows-only}

These options determine how Microsoft Excel files are converted. For instructions about accessing these options, see [Create or edit file type settings](#create-or-edit-file-type-settings).

**Try OpenOffice As Fallback Converter**: When this option is selected and a conversion using Microsoft Excel fails or reaches the specified time-out limit, PDF Generator attempts the conversion by using OpenOffice. If the conversion using OpenOffice fails or reaches the specified time-out limit, an exception is written to the log file.

**Filename Extensions**: Specifies the filename extensions for file types, separated by commas, that are accepted for this application. The default is `xls,xlsx`. Do not include a period before or a space between the extensions.

**Create PDF/A-1a Compliant File**: Forces the use of the PDF/A-1b:2005 RGB Adobe PDF setting.

**Add Bookmarks To Adobe PDF**: Converts Excel worksheet names to bookmarks. This option is selected by default.

**Fit Worksheet To A Single Page**: Reduces the size of the text to fit the worksheet on a single page.

**Convert Entire Workbook**: Converts all worksheets in the Excel file. If this option is not selected, only the current page is converted.

**Run Macros Automatically**: Runs any macros in the Excel document (such as a macro that inserts the current time) before converting the document.

**Convert Document Information**: Adds PDF document properties based on the document information in the source file. This includes information such as document title, author, subject, and keywords.

**Add Links To Adobe PDF**: Converts hyperlinks in the source file to hyperlinks in the PDF document.

**Attach Source File To Adobe PDF**: When this option is selected, the original Excel spreadsheet is inserted as an attachment inside the generated PDF document.

**Enable Accessibility And Reflow With Tagged Adobe PDF**: Embeds tags inside the PDF document to enable accessibility and reflow.

**List Of Excel Addins To Load**: By default (for security reasons), no Excel add-ins are run when an Excel file is converted to PDF. To allow certain Excel add-ins to run during conversion, provide a comma-separated list of the names of the add-ins.

**List Of Worksheets To Convert**: When this box is empty, all worksheets in the Excel spreadsheet are included in the generated PDF. To selectively convert a subset of the worksheets, provide a comma-separated list of worksheet names.

## Microsoft PowerPoint settings (Windows only) {#microsoft-powerpoint-settings-windows-only}

These options determine how Microsoft PowerPoint files are converted. For instructions about accessing these options, see [Create or edit file type settings](/help/forms/using/admin-help/configuring-file-type-settings.md#create-or-edit-file-type-settings).

**[!UICONTROL Try OpenOffice As Fallback Converter]**: When this option is selected and a conversion using Microsoft PowerPoint fails or reaches the specified time-out limit, PDF Generator attempts the conversion by using OpenOffice. If the conversion using OpenOffice fails or reaches the specified time-out limit, an exception is written to the log file.

**[!UICONTROL Filename Extensions]**: Specifies the filename extensions for file types, separated by commas, that are accepted for this application. The default is ppt,pptx. Do not include a period before or a space between the extensions.

**[!UICONTROL Convert Document Information]**: Adds document information from the Properties dialog box of the source file, including title, subject, author, keywords, manager, company, category, and comments. This option is selected by default.

**[!UICONTROL Add Bookmarks To Adobe PDF]**: Converts PowerPoint titles to bookmarks. This option is selected by default.

**[!UICONTROL Attach Source File To Adobe PDF]**: Adds the source file to the PDF file as an attachment. This option is deselected by default.

**[!UICONTROL Enable Accessibility And Reflow With Tagged Adobe PDF]**: Embeds tags into the PDF file. This option is deselected by default.

**[!UICONTROL Convert Multimedia To PDF Multimedia]**: Converts multimedia to PDF multimedia, where possible. This option is selected by default.

**[!UICONTROL Convert Speaker Notes]**: Converts speaker notes to PDF.

**[!UICONTROL Run Macros Automatically]**: Runs any macros in the PowerPoint document (such as a macro that inserts the current time) before converting the document.

**[!UICONTROL PDF Layout Based On PowerPoint Printer Settings]**: Uses PowerPoint printer settings to lay out the PDF document.

**[!UICONTROL Add Links To Adobe PDF]**: Preserves existing links when the file is converted. The appearance of links is generally unchanged. Links can be created only if the Enable Accessibility option is also selected. This option is deselected by default.

**[!UICONTROL Save Slide Transitions In Adobe PDF]**: Converts slide transitions. This option is selected by default.

**[!UICONTROL Save Animations In Adobe PDF]**: Saves converted animations in the PDF file.

**[!UICONTROL Convert Hidden Slides To PDF Pages]**: Converts hidden slides.

**[!UICONTROL Create PDF/A-1a Compliant File]**: Forces the use of the PDF/A-1b:2005 RGB Adobe PDF setting. A few PowerPoint features are not converted when you produce a PDF file. If a PowerPoint transition does not have an equivalent transition in Acrobat, a similar transition is substituted. If multiple animation effects are in the same slide, a single effect is used. Page transitions and bullet fly-ins are converted.

## Microsoft Project settings (Windows only) {#microsoft-project-settings-windows-only}

These options determine how Microsoft Project files are converted. For instructions about accessing these options, see [Create or edit file type settings](#create-or-edit-file-type-settings).

1. **[!UICONTROL Filename Extensions:]** Specifies the filename extensions for file types, separated by commas, that are accepted for this application. The default is `mpp`. Do not include a period before or a space between the extensions.

1. **[!UICONTROL Convert Document Information]**: Adds document information from the Properties dialog box of the source file, including title, subject, author, keywords, manager, company, category, and comments. This option is selected by default.
1. **[!UICONTROL Attach Source File To Adobe PDF]**: Adds the source file to the PDF file as an attachment.
1. **[!UICONTROL Create PDF/A-1a Compliant File]**: Forces the use of the PDF/A-1b:2005 RGB Adobe PDF setting.
1. **[!UICONTROL Run Macros Automatically]**: Runs any macros in the Microsoft Project document (such as a macro that inserts the current time) before converting the document.

## Microsoft Word settings (Windows only) {#microsoft-word-settings-windows-only}

These options determine how Microsoft Word files are converted. For instructions about accessing these options, see [Create or edit file type settings](#create-or-edit-file-type-settings).

**[!UICONTROL Try OpenOffice As Fallback Converter]**: When this option is selected and a conversion using Microsoft Word fails or reaches the specified time-out limit, PDF Generator attempts the conversion by using OpenOffice. If the conversion using OpenOffice fails or reaches the specified time-out limit, an exception is written to the log file.

**[!UICONTROL Filename Extensions]**: Specifies the filename extensions for file types, separated by commas, that are accepted for this application. The default is `doc,docx,rtf,txt`. Do not include a period before or a space between the extensions.

**[!UICONTROL Convert Document Information]**: Adds document information from the Properties dialog box of the source file, including title, subject, author, keywords, manager, company, category, and comments. This option is selected by default.

**[!UICONTROL Add Bookmarks To Adobe PDF]**: Converts headings to bookmarks. This option is selected by default.

**[!UICONTROL Attach Source File To Adobe PDF]**: Adds the source file to the PDF file as an attachment.

**[!UICONTROL Convert Cross-References And Table Of Contents To Links]**: Converts all cross-references and table of contents entries to links. This option is selected by default.

**[!UICONTROL Enable Accessibility And Reflow With Tagged Adobe PDF]**: Embeds tags into the PDF file. This option is selected by default.

**[!UICONTROL Create PDF/A-1a Compliant File]**: If selected, forces the PDF/A-1b:2005 RGB Adobe PDF setting to be used.

**[!UICONTROL Run Macros Automatically]**: Runs any macros in the Word document (such as a macro that inserts the current time) before converting the document.

**[!UICONTROL Preserve Document Markup In Adobe PDF]**: Converts markup in the Word document to annotations in the PDF file.

**[!UICONTROL Add Links To Adobe PDF]**: Converts hyperlinks in the source file to hyperlinks in the PDF document.

**[!UICONTROL Convert Footnote And Endnote Links]**: Creates links from the footnote and endnote citations to notes in the PDF document.

**[!UICONTROL Convert Displayed Comments To Notes in Adobe PDF]**: Converts comments in the Word document to text notes in the PDF document.

**[!UICONTROL Enable Advanced Tagging]**: Adds advanced tags for enhanced accessibility.

**[!UICONTROL Convert All Styles To Bookmarks]**: Converts all styles in the Word document to bookmarks in the PDF document.

**[!UICONTROL Convert specified styles to bookmarks]**: Converts the styles that you define in the **[!UICONTROL Styles with levels]** field to bookmarks in the PDF document.

**[!UICONTROL Styles With Levels]**: Specifies which styles in the Word document are converted to bookmarks in the PDF document. Also specifies the level of the bookmarks. To use this feature, deselect the **[!UICONTROL Convert All Styles To Bookmarks]** option and specify the style names in the following format:

**styleName1=level1[,styleName2=level2...]**

If a Microsoft Word style name includes a comma (,) or equal sign (=), precede the special characters with the escape character ("\_). For example, specify a style named "Heading, 1" as Heading\, 1.

**Acrobat PDFMaker Encoding:** Specifies the encoding type of the input plain-text files to the Acrobat PDFMaker. For example, if you are using a UTF-8 encoded file, select UTF-8 for best results.

## Microsoft Visio settings (Windows only) {#visio}

**Convert Document Information**: Adds document information from the Properties dialog box of the source file, including title, subject, author, keywords, manager, company, category, and comments. This option is selected by default. This option is enabled by default.

**Add Links To Adobe PDF**: Preserves all links. This option is selected by default.

**Add Bookmarks To Adobe PDF**: Converts headings to bookmarks. This option is selected by default.

**Attach Source File To Adobe PDF**: Adds the source file to the PDF file as an attachment.

**Always Flatten Layers In Adobe PDF**: Flattens all Visio layers.

**Convert All Pages**: Converts all pages of the Visio file.

**Open Layers Panel When Viewed In Adobe Acrobat**: If Visio layers are not flattened, opens a window where you can specify the layers that are preserved in the PDF file when opened using Acrobat. This option is selected by default.

**Create PDF/A-1b Compliant File**: Forces the use of the Adobe PDF Setting PDF/A-1b:2005 (RGB).

**Convert Comments To Adobe PDF Comments**: Converts Visio notes to PDF comments.

## Microsoft Publisher settings (Windows only) {#microsoft-publisher-settings-windows-only}

These options determine how Microsoft Publisher files are converted. For instructions about accessing these options, see [Create or edit file type settings](#create-or-edit-file-type-settings).

**[!UICONTROL Filename Extensions]**: Specifies the filename extensions for file types, separated by commas, that are accepted for this application. The default is `pub`. Do not include a period before or a space between the extensions.

## AutoCAD settings (Windows only) {#autocad-settings-windows-only}

These options determine how AutoCAD files are converted. For instructions about accessing these options, see [Create or edit file type settings](/help/forms/using/admin-help/configuring-file-type-settings.md#create-or-edit-file-type-settings).

**[!UICONTROL Filename Extensions]**: Specifies the filename extensions for file types, separated by commas, that are accepted for this application. The default is `dwg`. Do not include a period before or a space between the extensions.

**[!UICONTROL Convert Document Information]**: Adds document information from the Properties dialog box of the source file, including title, subject, author, keywords, manager, company, category, and comments. This option is selected by default.

**[!UICONTROL Add Bookmarks To Adobe PDF]**: Converts headings to bookmarks.

**[!UICONTROL Always Flatten Layers In Adobe PDF]**: Flattens all AutoCAD layers.

**[!UICONTROL Open Layers Pane When Viewed In Adobe Acrobat]**: Shows the layers structure when the PDF is opened in Acrobat.

**[!UICONTROL Convert All Layouts]**: Includes all layouts in the PDF.

**[!UICONTROL Convert Model Space to 3D]**: When selected, the model space layout is converted to a 3D annotation in the PDF.

**[!UICONTROL Add Links To Adobe PDF]**: If selected, preserves all links.

**[!UICONTROL Attach Source File To Adobe PDF]**: Adds the source file to the PDF file as an attachment.

**[!UICONTROL Create PDF/A-1b Compliant File]**: Forces the use of the PDF/A-1b Adobe PDF setting.

**[!UICONTROL Convert All Layers]**: By default, PDF Generator converts only the default layer of AutoCAD files to PDF instead of all layers within the file. Select this option to convert all layers of the file.

**[!UICONTROL Embed Scale Information]**: Preserves drawing scale information.

**[!UICONTROL Convert Current Layout]**: Includes only the current layout in the PDF.

**[!UICONTROL List Of AutoCAD Layouts To Convert]**: An AutoCAD drawing can have multiple layouts. When this box is empty, all layouts in the AutoCAD drawing are included in the generated PDF document. To selectively convert a subset of the layouts, provide a comma-separated list of layout names.

## OpenOffice settings {#openoffice-settings}

These options determine how OpenOffice files are converted. For instructions about accessing these options, see [Create or edit file type settings](/help/forms/using/admin-help/configuring-file-type-settings.md#create-or-edit-file-type-settings).

**Try PDFMaker As Fallback Converter**: When this option is selected and a conversion using OpenOffice fails or reaches the specified time-out limit, PDF Generator attempts the conversion by using PDFMaker. If the conversion using PDFMaker fails or reaches the specified time-out limit, an exception is written to the log file.

**Filename Extensions**: Specify the filename extensions for file types, separated by commas, that are accepted for this application. The default is `odt,odp,ods,odg,odf,sxw,sxi,sxd`. Do not include a period before or a space between the extensions.

**Range**: Convert all pages or specify particular pages or a page range. If a page range is not defined, all pages are converted. To export a range of pages, use the format 3-6. To export single pages, use the format 7;9;11. You can export a combination of page ranges and single pages by using a format such as 3-6;8;10;12.

**Page Orientation**: For plain text files only, select either portrait or landscape for the converted PDF document.

**Images**: Configure how images are converted. EPS images with embedded previews are exported only as previews. EPS images without embedded previews are exported as empty placeholders. With lossless compression of images, all pixels are preserved. With JPEG compression of images and a high-quality level, almost all pixels are preserved. With a low-quality level, some pixels get lost and artifacts are introduced, but file sizes are reduced.

**General**: Enable the options to convert a tagged PDF or to export Writer and FormCalc document notes, Impress slide transition effects, or blank pages to the PDF. When tags are exported, the file size can increase by large amounts. Some tags that are exported are tables of contents, hyperlinks, and controls.

You can also specify how forms are submitted. The options are XML, FDF, PDF, or HTML. This setting overrides the control's URL property that you set in the document. Only one common setting can be selected for the PDF document:

* PDF (sends the whole document)
* FDF (sends the control contents)
* HTML
* XML

**Tagged PDF**: Enables creation of tagged PDF from OpenOffice documents. Tagged PDF contains information about the structure of the document contents. This can help when displaying the document on devices with different screens, and when using screen reader software. It also helps accessibility software to perform various useful operations with the PDF document, such as reading aloud the contents of the PDF document.

**Export Notes**: Converts the notes in OpenOffice documents to notes in the generated PDF document.

**Use Transition Effects**: Converts the slide transition effects in OpenOffice presentations to corresponding PDF transition effects.

**Submit Forms In Format**: Creates a PDF form that can be filled out and printed by the user of the PDF document.

**Export Automatically Inserted Blank Pages**: When this option is selected, automatically inserted blank pages are included in the generated PDF document. This is useful if you are printing a PDF document double-sided. For example, a book may be configured so that the first page of chapter always starts on an odd-numbered page. If the previous chapter ends on an odd-numbered page, OpenOffice insets a blank even-numbered page. This option controls whether to include that even-numbered page in the generated PDF.

## Other application settings (Windows only) {#other-applications-settings-windows-only}

You cannot change the settings for other applications through administration console; they display the filename extensions for the supported file types. For instructions about accessing these settings, see [Create or edit file type settings](https://help.adobe.com/en_US/AEMForms/6.1/AdminHelp/WS92d06802c76abadb-5145d5d12905ce07e7-7e42.2.html).

* Corel WordPerfect: `wpd`
* Adobe PageMaker: `pmd, pm6, p65, pm`
* Adobe FrameMaker: `fm`
* Adobe Photoshop: `psd`

Support for these file types may need to be customized. For more information, see "Adding Support for Additional Native File Formats" in [Programming with AEM forms](https://www.adobe.com/go/learn_aemforms_programming_62).

For help on configuring a PDFG network printer, see [Setting up a PDFG network printer (Windows only)](/help/forms/using/admin-help/setting-pdfg-network-printer-windows.md).

---
title: Configuring Adobe PDF settings
description: Learn how to configure Adobe PDF settings visible on the Adobe PDF Settings page. You can use any of the predefined PDF settings or create your own.

contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/working_with_pdf_generator
products: SG_EXPERIENCEMANAGER/6.5/FORMS

feature: PDF Generator
exl-id: 1bcb8429-c06e-4bd3-b422-4c512084dd09
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Configuring Adobe PDF settings{#configuring-adobe-pdf-settings}

The Adobe PDF Settings page shows the conversion settings that you can specify for your sources to use. You can use any of the predefined PDF settings or create your own. The PDF settings determine precisely how files are converted and their resultant PDF structure and features. Adobe PDF settings were previously known as Distiller® parameters or job options.

On the Adobe PDF Settings page, you can do the following tasks:

* View the predefined PDF settings. (See [About the predefined PDF settings](configuring-pdf-settings.md#about-the-predefined-pdf-settings).)
* Create a PDF setting or edit one that you created previously. (See [Add or edit PDF settings](configuring-pdf-settings.md#add-or-edit-pdf-settings).)
* Specify default PDF settings. (See [Change the default settings](/help/forms/using/admin-help/configuring-file-type-settings.md#change-the-default-settings))
* Upload a PDF settings file to the server. (See [Upload PDF settings](configuring-pdf-settings.md#upload-pdf-settings).)
* Delete customized PDF settings. (See [Delete PDF settings](configuring-pdf-settings.md#delete-pdf-settings).)
* Upload and download prologue and epilogue files. (See [Uploading and downloading prologue and epilogue files](configuring-pdf-settings.md#uploading-and-downloading-prologue-and-epilogue-files).)

Adobe PDF settings are applicable only to the PDFMaker based conversions. These include the following conversions:

* Microsoft Word document (DOC, DOCX, RTF, TXT)
* Microsoft Excel document (XLS, XLSX)
* Microsoft PowerPoint document (PPT, PPTX)
* Microsoft Project document (MPP)
* Microsoft Visio document (VSD)

>[!NOTE]
>
>On using OpenOffice to convert above formats, Adobe PDF settings are not applied.

## About the predefined PDF settings {#about-the-predefined-pdf-settings}

PDF Generator provides several predefined PDF settings for your use. You cannot modify these predefined settings; however, you can create a setting based on an existing one by editing the setting and saving it under a new name.

**High Quality Print:** Creates PDF files for high-quality output. This setting:

* downsamples color and grayscale images at 300 dpi
* downsamples monochrome images at 1200 dpi
* prints to a higher image resolution
* uses other settings to preserve the maximum amount of information about the original document.

These PDF files can be opened in Adobe Acrobat 5 and Adobe Acrobat Reader® 5 or later.

**Oversized Pages:** Creates PDF documents that are suitable for reliable viewing and printing of engineering drawings that are larger than 200 x 200 inches. Created PDF documents can be opened in Adobe Acrobat Professional and Acrobat Standard, version 7 or later, and Adobe Reader 7 or later.

**PDF/A-1B 2005 CMYK / PDF/A-1B 2005 RGB:** Checks incoming jobs for compliance to the ISO standard for long-term preservation (archival) of electronic documents and creates PDF/A files only if compliant. These files are primarily used for archiving. Compliant files can contain only text, raster images, and vector objects; they cannot contain encryption and scripts. In addition, all fonts must be embedded so that the documents can be opened and viewed as created. PDF/A-1b uses PDF 1.4 and converts all colors to either CMYK or RGB, depending on which standard you choose. PDF files that are created with this settings file can be opened in Acrobat 5 and Acrobat Reader 5 and later. For more information about PDF/A, see Adobe and industry standards.

**PDF/X-1a 2001:** Checks incoming jobs for PDF/X-1a compliance, and creates PDF files only if compliant. PDF/X-1a is an ISO standard for graphic content exchange. PDF/X-1a requires all fonts to be embedded, the appropriate PDF boxes to be specified, and color to appear as either CMYK or spot colors. PDF files that meet PDF/X-1a requirements are targeted to a specific output condition, such as web offset printing according to Specifications Web Offset Publications. For more information about PDF/X, see Adobe and industry standards.

**PDF/X-3 2002:** Checks incoming jobs for PDF/X-3 compliance and creates PDF files only if compliant. Like PDF/X-1a, PDF/X-3 is an ISO standard for graphic content exchange. The main difference is that PDF/X-3 supports device-independent color.

**Press Quality:** Creates PDF files for high-quality print production (for example, on an imagesetter or platesetter). In this case, file size is not a consideration. The objective is to maintain all the information in a PDF file that a commercial printer or prepress service provider needs to print the document correctly. This set of options:

* downsamples color and grayscale images at 300 dpi
* downsamples monochrome images at 1200 dpi
* embeds subsets of all fonts used in the document
* prints to a higher image resolution,
* does not automatically rotate pages based on the orientation of the text or document structuring conventions (DSC) comments
* uses other settings to preserve the maximum amount of information about the original document.

Print jobs fail if they have fonts that cannot be embedded. These PDF files can be opened in Acrobat 5 and Acrobat Reader 5 and later.

>[!NOTE]
>
>Before you create a PDF file to send to a commercial printer or prepress service provider, determine the output resolution and other settings, or request a .joboptions file with the recommended settings. You may need to customize the Adobe PDF settings for a particular provider and then provide a .joboptions file of your own.

**Smallest File Size:** Creates PDF files for displaying on the web or an intranet, or for distribution through an email system for onscreen viewing. This set of options uses compression, downsampling, and a relatively low image resolution. It converts all colors to sRGB and does not embed fonts unless necessary. It also optimizes files for byte serving. These PDF files can be opened in Acrobat 5 and Acrobat Reader 5.0 and later.

**Standard:** Creates PDF files to print to desktop printers or digital copiers, publish on a CD, or send to a client as a publishing proof. This set of options uses compression and downsampling to reduce the file size. It also embeds subsets of all fonts that are used in the file, converts all colors to sRGB, and prints to a medium resolution to create a reasonably accurate rendition of the original document. Notice that Microsoft Windows font subsets are not embedded by default. These PDF files can be opened in Acrobat 5 and Acrobat Reader 5.0 and later.

## Add or edit PDF settings {#add-or-edit-pdf-settings}

PDF settings determine precisely how files are converted and their resultant PDF structure and features. Define a new PDF setting or edit one that you created previously. You cannot modify predefined settings, but you can create a setting based on an existing one by editing the setting and saving it under a new name.

1. In administration console, click Services &gt; PDF Generator &gt; Adobe PDF Settings.
1. Either click New or click the name of an existing setting.
1. On the New/Edit Adobe PDF Setting page, complete the required information in these sections:

   [General options](configuring-pdf-settings.md#general-options)

   [Images options](configuring-pdf-settings.md#images-options)

   [Fonts options](configuring-pdf-settings.md#fonts-options)

   [Color options](configuring-pdf-settings.md#color-options)

   [Advanced options](configuring-pdf-settings.md#advanced-options)

   [Standards reporting and compliance options](configuring-pdf-settings.md#standards-reporting-and-compliance-options)

   [Initial view options](configuring-pdf-settings.md#initial-view-options)

   To go to another section, click its link on the web page or use the Next and Previous buttons.

1. After you complete the information in all sections, click Save or Save As and provide a name for the setting.

## Upload PDF settings {#upload-pdf-settings}

You can have PDF settings available on the PDF Generator server by uploading them from a local computer or a network location.

1. In administration console, click Services &gt; PDF Generator &gt; Adobe PDF Settings, and click Upload.
1. On the Upload Adobe PDF Setting page, click Browse, locate the PDF settings file, and click Open.
1. Click OK and then click OK again.

## Delete PDF settings {#delete-pdf-settings}

You can permanently delete PDF settings if they are no longer required.

1. In administration console, click Services &gt; PDF Generator &gt; Adobe PDF Settings.
1. Select the check box beside the setting to delete. You can select multiple settings.
1. Click Delete and, on the Delete Confirmation page, click Delete again.

## General options {#general-options}

Use the general options to specify the version of Acrobat to use for file compatibility and other file and device options. For instructions about accessing the General options, see [Add or edit PDF settings](configuring-pdf-settings.md#add-or-edit-pdf-settings).

### File Options {#file-options}

**Compatibility:** The compatibility level of the PDF file. For documents that will be widely distributed, consider selecting Acrobat 4 (PDF 1.3) or Acrobat 5 (PDF 1.4) to ensure that all users can view and print the document. If you create files by using Acrobat 5 compatibility or later, they may not be compatible with earlier versions of Acrobat. The following subsections show some of the differences between PDF files that are created using different levels of Acrobat compatibility.

<table>
 <tbody>
  <tr>
   <th><p>Acrobat 4 (PDF 1.3)</p> </th>
   <th><p>Acrobat 5 (PDF 1.4)</p> </th>
   <th><p>Acrobat 6 (PDF 1.5)</p> </th>
   <th><p>Acrobat 7 (PDF 1.6) and Acrobat 8 (PDF 1.7)</p> </th>
  </tr>
  <tr>
   <td><p>Can be opened with Acrobat 3.0 and Acrobat Reader 3.0 and later.</p> </td>
   <td><p>Can be opened with Acrobat 3.0 and Acrobat Reader 3.0 and later. Features specific to later versions may be lost or not viewable.</p> </td>
   <td><p>Most can be opened with Acrobat 4 and Acrobat Reader 4.0 and later. Features specific to later versions may be lost or not viewable.</p> </td>
   <td><p>Most can be opened with Acrobat 4 and Acrobat Reader 4.0 and later. Features specific to later versions may be lost or not viewable.</p> </td>
  </tr>
  <tr>
   <td><p>Cannot contain artwork that uses live transparency effects. Any transparency must be flattened before converting to PDF 1.3.</p> </td>
   <td><p>Supports the use of live transparency in artwork. (Acrobat Distiller feature flattens transparency.)</p> </td>
   <td><p>Supports the use of live transparency in artwork. (Acrobat Distiller feature flattens transparency.)</p> </td>
   <td><p>Supports the use of live transparency in artwork. (Acrobat Distiller feature flattens transparency.)</p> </td>
  </tr>
  <tr>
   <td><p>Layers are not supported.</p> </td>
   <td><p>Layers are not supported.</p> </td>
   <td><p>Preserves layers when you create PDF files from applications that support the generation of layered PDF documents, such as Adobe Illustrator® CS or Adobe InDesign® CS and later.</p> </td>
   <td><p>Preserves layers when you create PDF files from applications that support the generation of layered PDF documents, such as Illustrator CS or InDesign CS and later.</p> </td>
  </tr>
  <tr>
   <td><p>DeviceN color space with 8 colorants is supported.</p> </td>
   <td><p>DeviceN color space with 8 colorants is supported.</p> </td>
   <td><p>DeviceN color space with up to 31 colorants is supported.</p> </td>
   <td><p>DeviceN color space with up to 31 colorants is supported.</p> </td>
  </tr>
  <tr>
   <td><p>Multibyte fonts can be embedded. (Distiller converts the fonts when embedding.)</p> </td>
   <td><p>Multibyte fonts can be embedded.</p> </td>
   <td><p>Multibyte fonts can be embedded.</p> </td>
   <td><p>Multibyte fonts can be embedded.</p> </td>
  </tr>
  <tr>
   <td><p>40-bit RC4 security is supported.</p> </td>
   <td><p>128-bit RC4 security is supported.</p> </td>
   <td><p>128-bit RC4 security is supported.</p> </td>
   <td><p>128-bit RC4 and 128-bit AES (Advanced Encryption Standard) security supported.</p> </td>
  </tr>
 </tbody>
</table>

**Object Level Compression:** Consolidates small objects (each of which are not compressible itself) into streams that can then be efficiently compressed.

**Off:** Does not compress any structural information in the PDF document. Select this option if you want users to view, navigate, and interact with bookmarks and other structural information by using Acrobat 5 and later.

**Tags Only:** Compresses structural information in the PDF document. Using this option results in a PDF file that can be opened and printed by using Acrobat 5. Users cannot view any accessibility, structure, or tagged PDF information in Acrobat 5 or Acrobat Reader 5.0, but they can view this information in Acrobat 6 and Adobe Reader 6.0.

**Auto-Rotate Pages:** Sets the automatic rotation of pages based on the orientation of the text or DSC comments. For example, some pages (such as pages that contain tables) may require the user to turn them sideways to read them. Select Individually to rotate each page based on the direction of the text on that page. Select Collectively By File to rotate all pages in the document based on the orientation of most text.

>[!NOTE]
>
>If Process DSC Comments is selected in the Advanced settings and if %%Viewing Orientation comments are included, these comments take precedence in determining page orientation.

**Binding:** Specifies whether to display a PDF file with left-side or right-side binding. This setting affects the display of pages in the Facing Page - Continuous layout and the display of thumbnails side by side.

**Resolution:** Sets the emulation for the resolution of a printer for input files that adjust their behavior according to the resolution of the printer they are printing to. For most input files, a higher resolution setting results in larger but higher-quality PDF files, and a lower setting results in smaller but lower-quality PDF files. Most commonly, resolution determines the number of steps in a gradient or blend. You can enter a value from 72 to 4000. Keep this setting as the default unless you plan to print the PDF file to a specific printer and you want to emulate the resolution defined in the original input file.

>[!NOTE]
>
>Increasing the resolution setting increases file size and may slightly increase the time required to process some files.

**All Pages or Pages From:** Specifies which pages to convert. Leave the To box empty to create a range from the page number you enter in the From box to the end of the file.

**Optimize For Fast Web View:** Restructures the file for page-at-a-time downloading (byte serving) from web servers. This option compresses text and line art, regardless of what you selected as compression settings on the Images tab. Compression results in faster access and viewing when downloading the file from the web or a network. By default, this option is not enabled.

### Default Page Size {#default-page-size}

The Default Page Size options specify the page size to use when one is not specified in the original file. Typically, Adobe PostScript files include this information, except for Encapsulated PostScript (EPS) files, which give a bounding box size but not a page size. The maximum page size allowed is 15,000,000 inches (31,800,000 cm) in either direction. These options configure the default page size:

**Width:** Width of the page

**Height:** Height of the page

**Units:** Units to use for the width and height settings

## Images options {#images-options}

The Images options specify compression and resampling for images. You can experiment with these options to find an appropriate balance between file size and image quality. For instructions about accessing the Images settings, see [Add or edit PDF settings](configuring-pdf-settings.md#add-or-edit-pdf-settings).

These options configure color, grayscale, and monochrome images:

**Downsample:** Set a value for each type of image. To downsample color, grayscale, or monochrome images, PDF Generator combines pixels in a sample area to make one larger pixel. Provide the resolution of your output device in dots per inch (dpi) and enter a resolution in dpi in the For Images Above box. For images with a resolution above this threshold, PDF Generator combines pixels, as needed, to reduce the resolution of the image (pixels per inch) to the specified dpi setting. To turn off downsampling, select Off. Here are the options:

**Average Downsampling To:** Averages the pixels in a sample area and replaces the entire area with the average pixel color at the specified resolution.

**Bicubic Downsampling To:** Uses a weighted average to determine pixel color and usually yields better results than the simple averaging method of downsampling. Bicubic is the slowest but most precise method and results in the smoothest tonal gradations.

**Subsampling To:** Selects a pixel in the center of the sample area and replaces the entire area with that pixel at the specified resolution. Subsampling significantly reduces the conversion time compared to downsampling, but it results in images that are less smooth and continuous.

The resolution setting for color and grayscale should be 1.5 to 2 times the line screen ruling that the file will be printed at. (Providing you do not go below this recommended resolution setting, images that contain no straight lines, or geometric or repeating patterns, are not affected by a lower resolution.) The resolution for monochrome images should be the same as the output device. However, saving a monochrome image at a resolution higher than 1500 dpi increases the file size without noticeably improving image quality.

Also consider whether users need to magnify a page. For example, if you are creating a PDF document of a map, consider using a higher image resolution so that users can zoom in on the map.

>[!NOTE]
>
>Resampling monochrome images can have unexpected viewing results, such as no image display. If this problem occurs, turn off resampling and convert the file again. This problem is most likely to occur with subsampling and least likely to occur with bicubic downsampling.

This table shows contains types of printers and their resolution measured in dpi, their default screen ruling measured in lines per inch (lpi), and a resampling resolution for images that are measured in pixels per inch (ppi). For example, to print to a 600-dpi laser printer, enter 170 for the resolution to resample images at.

<table>
 <tbody>
  <tr>
   <th><p>Printer resolution</p> </th>
   <th><p>Default line screen</p> </th>
   <th><p>Image resolution</p> </th>
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

**Compression:** Set a value to apply to color, grayscale, and monochrome images. For color and grayscale images, also set the image quality:

* For color or grayscale images, select ZIP to apply compression that works well on images that have large areas of single colors or repeating patterns. Examples are screen shots, simple images created with paint programs, and monochrome images that contain repeating patterns. Select JPEG, quality minimum to maximum, to apply compression that is suitable for grayscale or color images, such as continuous-tone photographs that contain more detail than can be reproduced on the screen or in print. Select Automatic (JPEG) to automatically determine the best quality for color and grayscale images.
* For monochrome images, select CCITT Group 4, CCITT Group 3, ZIP, JPEG200, Automatic (JPEG2000), or Run Length compression.

Make sure that monochrome images are scanned as monochrome and not as grayscale. Scanned text is sometimes saved as grayscale images by default. Grayscale text that is compressed with the JPEG compression method is not clear and may be unreadable.

**Image Quality:** Configures the image quality for color and grayscale images. The options are minimum, low, medium, high, and maximum.

**Anti-alias To Gray:** Smooths jagged edges in monochrome images. Select 2 bit, 4 bit, or 8 bit to specify 4, 16, or 256 levels of gray. (Anti-aliasing may blur small type or thin lines.)

>[!NOTE]
>
>Compression of text and line art is always on.

**Image Policy:** Set a policy for color, grayscale, and monochrome images. If the image resolution falls below the specified resolution, you can still select to proceed (Ignore), provide a warning message, or cancel the job.

## Fonts options {#fonts-options}

The Fonts options specify which fonts to embed in a PDF file and whether to embed a subset of characters that are used in the PDF file. For instructions about accessing the Fonts options, see [Add or edit PDF settings](configuring-pdf-settings.md#add-or-edit-pdf-settings).

>[!NOTE]
>
>When you combine PDF files with the same font subset, PDF Generator attempts to combine the font subsets.

**Embed All Fonts:** Embeds all fonts that are used in the file. Font embedding is required for PDF/X compliance.

**Subset Embedded Fonts When Percent Of Characters Used&#xA;Is Less Than:** If you select this option, specify a threshold percentage to embed only a subset of the fonts. For example, if the threshold is 35 and less than 35% of the characters are used, PDF Generator embeds only those characters. Only fonts with appropriate permission bits are embedded.

**When Embedding Fails:** Specifies how PDF Generator responds if it cannot find a font to embed when processing a file. You can have PDF Generator ignore the request and substitute the font, warn you and substitute the font, or cancel processing of the current job.

**Font Source:** The location of the fonts that PDF Generator uses.

### Specify which fonts to embed {#specify-which-fonts-to-embed}

1. In administration console, click Services &gt; PDF Generator &gt; Adobe PDF Settings.
1. Click New or click the name of a setting.
1. Click Fonts and deselect Embed all fonts.
1. From the Font source list, select a font source and click Go to refresh the list of fonts in the box on the left.
1. Click a font in the box on the left. Then click Add beside the appropriate box to move it to the Always Embed list or Never Embed list. Repeat for each font. Use Ctrl-click to select multiple fonts to move.
1. To remove a font from the Always Embed or Never Embed list, select it and click Remove beside the appropriate box. This action does not remove the font from your system; it just removes the reference to it in the list.
1. If the font you want to specify does not appear, type its name in the Add Font box, and then click Always Embed or Never Embed. Font names cannot contain alphanumeric characters.

>[!NOTE]
>
>A TrueType font can contain a setting that the font designer added that prevents the font from being embedded in PDF files.

>[!NOTE]
>
>Fonts are picked from the Windows system font cache and a system restart is required to update the cache. After specifying the Customer font directory, ensure that you restart the system on which AEM forms is installed.

## Color options {#color-options}

The Color options set all color management information for PDF Generator. For instructions about accessing the Color options, see [Add or edit PDF settings](configuring-pdf-settings.md#add-or-edit-pdf-settings).

### Adobe Color Settings {#adobe-color-settings}

**Settings File:** This list contains a list of color settings that are also used in major graphics applications, such as Adobe Photoshop and Adobe Illustrator. The color setting you select determines the other Adobe color settings on this page. For example, if you select a setting other than None, all options other than those for Device-Dependent Data are predefined and dimmed. You can edit the Color Management Policies and Working Spaces settings only if you select None for Settings File.

### Color Management Policies {#color-management-policies}

If you selected None for the Settings File, the Color Management Policies area specifies how PDF Generator converts unmanaged color in a PostScript file.

**Leave Color Unchanged:** Leaves device-dependent colors unchanged and preserves device-independent colors as the nearest possible equivalent in PDF. This option is useful to print shops that have calibrated all their devices, used that information to specify color in the file, and output only to those devices.

**Tag Everything for Color Management:** Embeds an International Color Consortium profile when distilling files and calibrates color in the images, which makes colors in the resultant PDF files device-independent if you selected Acrobat 4 (PDF 1.3) or later compatibility. However, device-dependent color spaces in files (RGB, Grayscale, and CMYK) are converted to device-independent color spaces (CalRGB, CalGray, and LAB).

**Tag Only Images for Color Management:** Embeds ICC profiles only in images, not text or graphics, when distilling files if you selected Acrobat 4 (PDF 1.3) compatibility. This option prevents black text from undergoing any color shift. However, device-dependent color spaces in images (RGB, Grayscale, and CMYK) are converted to device-independent color spaces (CalRGB, CalGray, and LAB). Text and graphics are not converted.

**Convert All Colors to sRGB or Convert All Colors to&#xA;CMYK:** Calibrates color in the file, making the color device-independent, similar to Tag Everything for Color Management. If you selected Acrobat 4 (PDF 1.3) or later compatibility and convert to sRGB, the CMYK and RGB images are converted to sRGB.

Regardless of the compatibility option you select, grayscale images are left unchanged. This usually reduces the size and increases the display speed of PDF files because less information is needed to describe RGB images than to describe CMYK images. Because RGB is the native color space that is used on monitors, no color conversion is necessary during display, which contributes to fast online viewing. This option is recommended if the PDF file is for use online or with low-resolution printers.

**Document Rendering Intent:** The method to map colors between color spaces. The result of any particular method depends on the profiles of the color spaces. For example, some profiles produce identical results with different methods. These options are available:

>[!NOTE]
>
>In all cases, intents may be ignored or overridden by color management operations that occur after the creation of the PDF file.

**Preserve:** Means that the intent is specified in the output device rather than in the PDF file. In many output devices, Relative Colorimetric is the default intent.

**Perceptual:** Maintains the relative color values among the original pixels as they are mapped to the destination gamut. This method preserves the visual relationship between colors, although the color values themselves may change.

**Saturation:** Maintains the relative saturation values of the original pixels. This method is suitable for business graphics, where the exact relationship between colors is not as important as having bright saturated colors.

**Relative Colorimetric:** Remaps the white point of the source space to the white point of the destination space.

**Absolute Colorimetric:** Disables the matching of white and black points when converting colors. This method is not recommended unless you must preserve signature colors, such as those used in trademarks or logos.

### Working Spaces {#working-spaces}

For all values in the list under Color Management Policies, other than Leave Color Unchanged, select from the lists in the Working Space area to specify which ICC profiles are used for defining and calibrating the grayscale, RGB, and CMYK color spaces in distilled PDF files. These options are available:

**Gray:** Defines the color space of all grayscale images in files. This option is available only if you chose Tag Everything for Color Management or Tag Only Images for Color Management. The default ICC profile for gray images is Gray Gamma 2.2. You can also select None to prevent grayscale images from being converted.

**RGB:** Defines the color space of all RGB images in files. The default, sRGB IEC61966-2.1, is generally a good choice because it is becoming an industry standard and many output devices recognize it. You can also select None to prevent RGB images from being converted.

**CMYK:** Defines the color space of all CMYK images in files. The default is U.S. Web Coated (SWOP) v2. You can also select None to prevent CMYK images from being converted.

>[!NOTE]
>
>Selecting None for all three of the working spaces has the same effect as selecting Leave Color Unchanged.

**Preserve CMYK Values For Calibrated CMYK Color Spaces:** When selected, device-independent CMYK values are treated as device-dependent (DeviceCMYK) values, device-independent color spaces are discarded, and PDF/X-1a files use the Convert All Colors To CMYK value. When deselected, device-independent color spaces convert to CMYK if the color management policy is set to Convert All Colors To CMYK.

### Device-Dependent Data {#device-dependent-data}

These options apply if you work with documents that are created with high-end documentation and graphics applications, such as Adobe Illustrator and Adobe InDesign. For more information, see the documentation that came with the application.

Transfer functions are used for artistic effect and to adjust for the specifications of a specific output device. For example, a file that is intended for output on a particular imagesetter may contain transfer functions that compensate for the dot gain that is inherent with that printer.

**Preserve Under Color Removal And Black Generation:** Retains these settings if they exist in the PostScript file. Black generation calculates the amount of black to be used when you are trying to reproduce a particular color. Undercolor removal (UCR) reduces the amount of cyan, magenta, and yellow components to compensate for the amount of black that the black generation added. Because it uses less ink, UCR is generally used for newsprint and uncoated stock.

**When Transfer Functions Are Found:** Determines what to do when transfer functions are found:

**Preserve:** Retains the transfer functions that are traditionally used to compensate for dot gain or dot loss that may occur when an image is transferred to film. Dot gain occurs when the ink dots that make up a printed image are larger (for example, due to spreading on paper) than in the halftone screen; dot loss occurs when the dots print smaller. With this option, the transfer functions are kept as part of the file and are applied to the file when the file is output.

**Apply:** Does not keep the transfer function but applies it to the file, which changes the colors in the file. This option is useful for creating color effects in a file. By default, this option is selected for new settings.

**Remove:** Removes any applied transfer functions. Remove applied transfer functions unless the PDF file will be output to the same device that the source PostScript file was created for.

**Preserve Halftone Information:** Retains any halftone information in files. Halftone information consists of dots that control how much ink halftone devices deposit at a specific location on the paper. Varying the dot size and density creates the illusion of variations of gray or continuous color. For a CMYK image, four halftone screens are used, one for each ink that is used in the printing process.

In traditional print production, a halftone is produced by placing a halftone screen between a piece of film and the image, and then exposing the film. Electronic equivalents, such as in Adobe Photoshop, let users specify the halftone screen attributes before they produce the film or paper output. Halftone information is intended for use with a particular output device.

## Advanced options {#advanced-options}

The Advanced options specify which Document Structuring Conventions (DSC) comments to keep in the PDF file and how to set other options that affect the conversion from PostScript. In a PostScript file, DSC comments contain information about the file (such as the originating application, creation date, and page orientation). They also provide structure for page descriptions in the file (such as beginning and ending statements for a prologue section). DSC comments can be useful when your document is going to print or press. For instructions about accessing the Advanced options, see [Add or edit PDF settings](configuring-pdf-settings.md#add-or-edit-pdf-settings).

When working with the Advanced options, it is helpful to have an understanding of the PostScript language and how it is translated to PDF. (See [Adobe PostScript 3](https://www.adobe.com/products/postscript/main.html).)

**Allow PostScript File to Override Adobe PDF Settings:** Uses settings that are stored in a PostScript file instead of the current Adobe PDF settings file. Before processing a PostScript file, you can place parameters in the file to control the following aspects:

* compression of text and graphics
* downsampling and encoding of sampled images
* embedding of Type 1 fonts and instances of Type 1 Multiple Master fonts

**Allow PostScript XObjects:** PostScript XObjects store information that appears on many pages of the same file, such as a background image or header and footer information. Using PostScript XObjects can result in faster printing but requires more printer memory. To prevent PostScript XObjects from being created, deselect this option if you create PDF files with Acrobat 5 (PDF 1.4) or later compatibility.

**Convert Gradients to Smooth Shades:** Converts blends to smooth shades for Acrobat 4 and later, making PDF files smaller and potentially improving the quality of final output. PDF Generator converts gradients from Adobe Illustrator, Adobe InDesign, Adobe FreeHand MX, CorelDraw, Quark Xpress, and Microsoft PowerPoint.

**Convert Smooth Lines to Curves:** Reduces the amount of control points used to build curves in CAD drawings, which results in smaller PDFs and faster onscreen rendering.

**Preserve Level 2 Copypage Semantics:** Uses the copypage operator that is defined in LanguageLevel 2 PostScript instead of in LanguageLevel 3 PostScript. If you have a PostScript file and select this option, a copypage operator copies the page. If this option is not selected, the equivalent of a showpage operation is executed, but the graphics state is not reinitialized.

**Preserve Overprint Settings:** Retains any overprint settings in files being converted to PDF. Overprinted colors are two or more inks printed on top of each other. For example, when a cyan ink prints over a yellow ink, the resultant overprint is a green color. Without overprinting, the underlying yellow would not be printed, resulting in a cyan color.

**Overprinting Default Is Nonzero Overprinting:** Prevents overprinted objects with zero CMYK values from knocking out CMYK objects that are underneath them. This effect is accomplished by inserting the OPM 1 graphics state parameter into the PDF file wherever the Setoverprint operator is present.

**Save Adobe PDF Settings Inside PDF File:** Embeds the settings file that is used to create the PDF file. You can open and view the settings file (which has a .joboptions filename extension) in the File Attachments dialog box in Acrobat. The Adobe PDF settings file becomes an item in the EmbeddedFiles tree inside the PDF file.

**Save Original JPEG Images In PDF If Possible:** Processes any compressed JPEG images (images that are already compressed using DCT encoding) without recompressing them. If this option is selected, PDF Generator decompresses JPEG images to ensure that they are not corrupt. However, it does not recompress valid images, therefore processing the original image untouched. With this option is selected, performance improves because only decompression (not recompression) occurs, and image data and metadata are preserved.

**Save Portable Job Ticket Inside PDF File:** Preserves a PostScript job ticket in a PDF file. The job ticket contains information about the PostScript file, such as the page size, resolution, and trapping information, instead of information about content. This information can be used later in a workflow or for printing the PDF.

**Use Prologue.ps and Epilogue.ps:** Sends a prologue and epilogue file with each job. These files have many purposes. For example, prologue files can be edited to specify cover pages. Epilogue files can be edited to resolve a series of procedures in a PostScript file. You can upload or download the files. (See Uploading and downloading prologue and epilogue files.)

**Process DSC Comments:** Maintains DSC information from a PostScript file. These suboptions are available:

**Log DSC Warnings:** Displays warning messages about problematic DSC comments during processing and adds them to a log file.

**Preserve EPS Information From DSC:** Retains information, such as the originating application and creation date for an EPS file. If this option is deselected, the page is sized and centered based on the upper-left corner of the upper-left object and lower-right corner of the lower-right object on the page.

**Preserve OPI Comments:** Retains information required to replace a For Placement Only (FPO) image or comment with the high-resolution image located on servers that support Open Prepress Interface (OPI) versions 1.3 and 2.0.

**Preserve Document Information From DSC:** Retains information such as the title, creation date, and time. When you open a PDF file in Acrobat, this information appears in the Document Properties Description panel.

**Resize Page and Center Artwork For EPS Files:** Centers an EPS image and resizes the page to fit closely around the image. This option applies only to jobs that consist of a single EPS file.

## Standards reporting and compliance options {#standards-reporting-and-compliance-options}

PDF Generator can check document contents in a PostScript file to ensure that they meet the standard PDF/X-1a, PDF/X-3, or PDF/A criteria before creating the PDF file. For PDF/X-compliant files, you can also require that the PostScript file meets additional criteria by selecting other options under "Standards reporting and compliance". The availability of options depends on the standard you select.

PDF/X-compliant files are primarily used as a standardized format for the exchange of PDF files that are intended for high-resolution print production. Unless you are creating a PDF document for print production, you can ignore the PDF/X compliance standards.

PDF/A-compliant files are primarily used for archiving. Because long-term preservation is the goal, the document must contain only what is needed for opening and viewing throughout the intended life of the document. For example, PDF/A-compliant files can contain only text, raster images, and vector objects; they cannot contain encryption and scripts. In addition, all fonts must be embedded so that the documents can be opened and viewed as created. In other words, PDF/A-compliant documents are *thinner* than their PDF/X counterparts, which are intended for high-end production.

>[!NOTE]
>
>If you set up a watched folder for creating PDF/A-compliant files, make sure that you do not add security to the folder; the PDF/A standard does not allow encryption.

For instructions about accessing the Standards reporting and compliance options, see [Add or edit PDF settings](configuring-pdf-settings.md#add-or-edit-pdf-settings).

**Compliance Standard:** Select a standard to produce a report that indicates whether the file complies with the requirements and, if not, what problems were encountered. When Compatibility on the General Settings page is set to Acrobat 4.0, the following options are enabled. When Compatibility is set to Acrobat 5.0, only the Acrobat 5.0 options are available to select. When Compatibility is set to an alternative option, the following options are dimmed:

* PDF/X-1a (Acrobat 4.0 compatible)
* PDF/X-3 (Acrobat 4.0 compatible)
* PDF/X-1a (Acrobat 5.0 compatible)
* PDF/X-3 (Acrobat 5.0 compatible)
* PDF/A-1b (Acrobat 5.0 compatible)

### Options for PDF/X standards {#options-for-pdf-x-standards}

**When Not Compliant:** Specifies whether to create the PDF file if the PostScript file does not comply with PDF/X requirements. This option is available when Compliance Standard on the Standards Reporting and Compliance page is set to an option other than None.

**Continue:** Creates a PDF file.

**Cancel Job:** Creates a PDF file only if the PostScript file meets the PDF/X requirements of the selected report options and is otherwise valid. If both PDF/X report options are selected and the PostScript file meets only one set of the PDF/X criteria (for example, PDF/X-3), PDF Generator creates the compliant file.

**If Neither TrimBox Nor ArtBox Are Specified:** Available when Compliance Standard on the Standards Reporting and Compliance page is set to an option other than None.

**Report As Error:** Flags the PostScript file as noncompliant if one of the reporting options is selected and a trim box or art box is missing from any page.

**Set TrimBox To MediaBox With Offsets:** Computes values in points for the trim box based on the offsets for the media box of respective pages if neither the trim box nor art box is specified. The trim box is always as small or smaller than the enclosing media box.

**If BleedBox Is Not Specified:** Available when Compliance Standard on the Standards Reporting and Compliance page is set to an option other than None.

**Set BleedBox To MediaBox:** Uses the media box values for the bleed box if the bleed box is not specified.

**Set BleedBox To TrimBox With Offsets:** Computes values in points for the bleed box based on the offsets for the trim box of respective pages if the bleed box is not specified. The bleed box is always as large or larger than the enclosed trim box.

**Default Values If Not Specified In The Document:** This option is available when Compliance Standard on the Standards Reporting and Compliance page is set to an option other than None.

**Output Intent Profile Name:** Indicates the characterized printing condition that the document is prepared for. If a document does not specify an OutputIntent name, PDF Generator uses the selected value from this menu. You can select one of the names that are supplied or enter a name in the space provided. If your workflow requires that the document specify the output intent, select None. Any document that does not meet the requirement fails compliance checking.

**Output Condition Identifier:** Indicates the reference name specified by the registry of the output intent profile name.

**Output Condition:** Describes the intended printing condition. This entry can be useful for the intended receiver of the PDF document.

**Registry Name (URL):** Indicates the web address for more information about the registry. The URL is automatically entered for ICC registry names.

**Trapped:** Indicates the state of trapping in the document. PDF/X compliance requires a value of True or False. If the document does not specify the trapped state, the value provided here is used. If your workflow requires that the document specifies the trapped state, select Leave Undefined. Any document that does not meet the requirement fails compliance checking.

### Options for PDF/A standard {#options-for-pdf-a-standard}

These options are enabled when Compatibility (in the General area) is set to Acrobat 4 (PDF 1.3) or Acrobat 5 (PDF 1.4).

**When Not Compliant:** Specifies whether to create the PDF file if the PostScript file does not comply with PDF/A requirements.

**Continue:** Creates a PDF file even if the PostScript file does not meet the requirements of the standard.

**Cancel Job:** Creates a PDF file only if the PostScript file meets PDF/A requirements and is otherwise valid.

**Output Intent Profile Name:** Indicates the characterized printing condition for which the document has been prepared and is required for PDF/A compliance. If your workflow requires that the document specifies Output Intent information, select "None". The document will fail compliance checking if this information is not provided.

**Output Condition:** Describes the intended printing condition. This entry is not required, but can be used to provide useful information to the intended receiver of the PDF document.

## Initial view options {#initial-view-options}

These options are organized into three areas: Document Options, Window Options, and User Interface Options. For instructions about accessing the Initial view options, see [Add or edit PDF settings](configuring-pdf-settings.md#add-or-edit-pdf-settings).

To use any options, select Set Initial View Settings.

### Document Options {#document-options}

The document options control the appearance of the document within the document window, such as the magnification level and how it scrolls.

**Show:** Determines which panes and tabs are displayed in the application window by default. Bookmarks Panel and Page opens the document pane and displays the Bookmarks tab.

**Page Layout:** Determines whether the document is viewed in single-page, facing-page, continuous page, or continuous facing-page mode.

**Magnification:** Sets the zoom level used to display the document when opened. The default uses the user-configured magnification value in the Acrobat or Adobe Reader preferences.

**Open To Page Number:** Sets the page that the document opens at, which is usually page 1.

>[!NOTE]
>
>Setting Default for the magnification and page layout options uses the individual user settings in the Page Display preferences within Acrobat or Adobe Reader.

### Window options {#window-options}

The window options determine how the window adjusts in the screen area when a user opens the document. However, the options have no effect when a PDF document is viewed inside a web browser.

**Resize Window To Initial Page:** Adjusts the document window to fit snugly around the opening page, according to the options that you selected under Document Options.

**Center Window On Screen:** Positions the window in the center of the screen area.

**Open In Full Screen Mode:** Maximizes the document window and displays the document without the menu bar, toolbar, or window controls.

**Show:** Filename shows the filename in the title bar of the window. Document title shows the document title in the title bar of the window.

### User interface options {#user-interface-options}

The user interface options determine which controls are displayed or hidden when the user opens the document.

**Hide Menu Bar:** If selected, hides the menu bar

**Hide Toolbars:** If selected, hides the toolbars

**Hide Window Controls:** If selected, hides the window controls

>[!NOTE]
>
>If you hide the menu bar and toolbar, users cannot apply commands and select tools unless they know the keyboard shortcuts when they open the file in Acrobat.

## Uploading and downloading prologue and epilogue files {#uploading-and-downloading-prologue-and-epilogue-files}

Prologue files are used to add custom PostScript code that execute at the beginning of every PostScript job being distilled. Epilogue files are used to add custom PostScript code that execute at the end of every PostScript job. You can download prologue and epilogue files from the server to save them locally. You may want to download the files to configure them independently or to upload them to another location or to another computer.

These files have many purposes. For example, prologue files can be edited to specify cover pages; epilogue files can be edited to resolve a series of procedures in a PostScript file. You can also select and upload the prologue and epilogue files to send with each job.

### Download a prologue or epilogue file {#download-a-prologue-or-epilogue-file}

1. In administration console, click Services &gt; PDF Generator &gt; Adobe PDF Settings.
1. Click New or click the name of a setting.
1. Click Advanced and then, beside the Use Prologue.ps and Epilogue.ps option, click Download.
1. On the Download Prologue and Epilogue Files page, click Prologue.ps or Epilogue.ps and click Save.

### Upload a prologue or epilogue file {#upload-a-prologue-or-epilogue-file}

1. In administration console, click Services &gt; PDF Generator &gt; Adobe PDF Settings.
1. Click New or click the name of a setting.
1. Click Advanced and then, beside the Use Prologue.ps And Epilogue.ps option, click Upload.
1. On the Upload Prologue and Epilogue Files page, click Browse to select a prologue or an epilogue file.
1. Locate the file and click Open.
1. To use the file, ensure that Use Prologue.ps And Epilogue.ps is selected in the Advanced area of the New/Edit Adobe PDF Setting page.
1. Click Save

>[!NOTE]
>
>PDF Generator supports prologue and epilogue files only for conversion of PostScript and Encapsulated PostScript files to PDF.

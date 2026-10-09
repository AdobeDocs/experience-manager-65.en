---
title: Importing and exporting PDF Generator configuration files
description: Learn how to import and export PDF Generator configuration files.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/working_with_pdf_generator
products: SG_EXPERIENCEMANAGER/6.5/FORMS
feature: PDF Generator
exl-id: b363b23a-29bb-4ea4-a8f2-5ba9fe3c7b27
solution: Experience Manager, Experience Manager Forms
role: User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: b26425d0-6fde-5e02-bfd6-e560e2fa86c9
    internal-label: PDF Generator
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Importing and exporting PDF Generator configuration files {#importing-and-exporting-pdf-generator-configuration-files}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

The configuration file contains the PDF Generator conversion information, including the PDF, file type, and security settings.

>[!NOTE]
>
>You cannot change the time-out setting for PDF Generator by importing a custom native2pdfconfig.xml file. The time-out setting in that file is for informational purposes only, and displays the current setting in PDF Generator. To change the time-out setting, see "Setting PDF Generator performance parameters" in [Installing and Deploying AEM forms](https://www.adobe.com/go/learn_aemforms_installJBoss_63).

## Export your current configuration file {#export-your-current-configuration-file}

1. In administration console, click Services &gt; PDF Generator &gt; Configuration Files &gt; Export Configuration.
1. To export the settings, select the appropriate option:

    * To export all named settings, select Download Entire Configuration.
    * To export only one Adobe PDF setting, security setting, or file type setting, select Download Minimal Configuration.

      If you are exporting a minimal configuration, select the Adobe PDF, security, and file type settings to export.

1. Click Download and save the XML file in an appropriate location.

## Import a configuration file {#import-a-configuration-file}

>[!NOTE]
>
>Your system will be reconfigured based on the information in the imported file.

1. In administration console, click Services &gt; PDF Generator &gt; Configuration Files &gt; Import Configuration.
1. Select Import An Existing Configuration File.
1. To specify the file location in the Configuration File box, click Browse to find and select the file, and then click **Import**.

## Convert all layers within AutoCAD files {#convert-all-layers-within-autocad-files}

By default, PDF Generator converts only the default layer of AutoCAD files to PDF instead of all the layers within the file. To convert all the layers, follow this procedure.

1. In administration console, click Services &gt; PDF Generator &gt; Configuration Files &gt; Export Configuration.
1. Select Download Entire Configuration and click Download.
1. In a text editor, open the downloaded file and, under the `AutoCAD` tag within the `PDFMaker` tag, add the text `convertAllPages="true"`.
1. In administration console, click Services &gt; PDF Generator &gt; Configuration Files &gt; Import Configuration.
1. Select Import An Existing Configuration File, specify the updated file, and click Import.

   Any AutoCAD files that are converted by using the modified configuration file will have all layers converted.

## Reset your configuration to the original settings installed with PDF Generator {#reset-your-configuration-to-the-original-settings-installed-with-pdf-generator}

1. In administration console, click Services &gt; PDF Generator &gt; Configuration Files &gt; Import Configuration.
1. Select Reset Configuration To Default Settings and click Import.

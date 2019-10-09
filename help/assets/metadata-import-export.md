---
title: Bulk Metadata Import and Export
seo-title: Bulk Metadata Import and Export
description: This article describes how to import and export metadata in bulk.
seo-description: This article describes how to import and export metadata in bulk.
uuid: 176b7b5e-a1d5-40fe-a651-bfa36c4b409a
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: administering
discoiquuid: f7e30ec4-62fd-43b7-a650-f61034f7a2db
---

# Bulk Metadata Import and Export {#bulk-metadata-import-and-export}

AEM Assets lets you import asset metadata in bulk using a CSV file. You can do bulk updates for the recently uploaded assets or the existing assets by importing a CSV file. You can also ingest asset metadata in bulk from third-party system in CSV format.

## Import metadata {#import-metadata}

The metadata import is asynchronous and does not impede the system performance. Simultaneous update of the metadata for multiple assets can be resource-intensive because of XMP writeback activity if workflow flag is checked. Plan such an import during lean server usage so that performance for other users is not impacted.

>[!NOTE]
>
>To import metadata on custom namespaces, first register the namespaces.

1. Navigate to the Assets user interface, and tap/click Create **[!UICONTROL Create]** from the toolbar.
1. From the menu, select **[!UICONTROL Metadata]**.
1. On the **[!UICONTROL Metadata Import]** page, tap/click the **[!UICONTROL Select File]**.  Select the CSV file with the metadata.
1. Specify the following parameters:

   <table> 
    <tbody>
    <tr>
    <td><p>Batch Size</p> </td> 
    <td><p>Number of assets in a batch for which metadata is to be imported. Default value is 50. Maximum value is 100.</p> </td> 
    </tr>
    <tr>
    <td><p>Field Separator</p> </td> 
    <td><p>Default value is comma. You can specify any other character.</p> </td> 
    </tr>
    <tr>
    <td><p>Multi value Delimiter</p> </td> 
    <td><p>Separator for metadata values. Default value is |.</p> </td> 
    </tr>
    <tr>
    <td><p>Launch Workflows</p> </td> 
    <td><p>False by default. When set to <em>true</em> and default Launcher settings are in effect for the DAM Metadata WriteBack Workflow (that writes metadata to the binary XMP data). Enabling launch workflows slows the system down. </p> </td> 
    </tr>
    <tr>
    <td><p>Asset Path Column Name</p> </td> 
    <td><p>Defines the column name for the CSV file with assets.</p> </td> 
    </tr>
    </tbody>
   </table>

1. Tap/click **[!UICONTROL Import]** from the toolbar. After the metadata is imported, a notification is sent to your Notification inbox. Navigate to asset property page and verify whether the metadata values are correctly imported for assets.

<!-- TBD: Format characters in the table using backticks and add UICONTROL after table is converted to MD
-->

## Export Metadata {#export-metadata}

You can export metada for multiple assets in a CSV format. The metadata is exported asynchronously and does not impact the performance of the system. To export metadata, AEM traverses through the properties of the asset node `jcr:content/metadata` and its child nodes and exports the metadata properties in a CSV file.

A few use cases for exporting metadata in bulk are:

* Import the metadata in a third-party system when migrating assets.
* Share asset metadata with a wider project team.
* Test or audit the metadata for compliance.
* Externalize the metadata for separate localization.

1. Select the asset folder that contains assets for which you want to export metadata. From the toolbar, select **[!UICONTROL Export metadata]**.

1. In the Metadata Export dialog, specify a name for the CSV file. To export metadata for assets in subfolders, select **[!UICONTROL Include assets in sub-folders]**.

   ![export_metadata_page](assets/export_metadata_page.png)

1. Select the desired options. Provide a filename and if necessary a date.
1. In the **[!UICONTROL Properties to be exported]** specify whether you want to export all or specific properties. If you choose **[!UICONTROL Selective]** properties to be exported, add the desired properties.

1. From the toolbar, tap/click **[!UICONTROL Export]**. A message confirms that the metadata is exported. Close the message.

1. Open the inbox notification for the export job. Select the job and click **[!UICONTROL Open]** from the toolbar. To download the CSV file with the metadata, tap/click **[!UICONTROL CSV Download]** from the toolbar. Click **[!UICONTROL Close]**.

   ![csv_download](assets/csv_download.png)
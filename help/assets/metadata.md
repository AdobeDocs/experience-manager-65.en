---
title: Manage metadata of your digital assets in [!DNL Adobe Experience Manager].
description: Learn about the types of metadata an how [!DNL Adobe Experience Manager Assets] helps manage metadata for assets to allow easier categorization and organization of assets. [!DNL Experience Manager] makes it possible to automatically organize and process assets based on their metadata.
contentOwner: AG
---

# Manage metadata of your digital assets {#managing-metadata-for-digital-assets}

[!DNL Adobe Experience Manager Assets] keeps metadata for every asset. It allows easier categorization and organization of assets and it helps people who are looking for a specific asset. With the ability to extract metadata from files uploaded to [!DNL Experience Manager Assets], metadata management integrates with the creative workflow. With the ability to keep and manage metadata with your assets, you can automatically organize and process assets based on their metadata.

## How to edit or add metadata {#how-to-edit-or-add-metadata}

Metadata is additional information about the asset that can be searched. It is automatically extracted when you upload an image. You can edit the existing metadata or add new metadata properties to existing field, for example, when a metadata field is blank.

Organizations need controlled and reliable metadata vocabularies. Hence [!DNL Experience Manager Assets] does not allow for on-demand adding of new metadata properties. Developers and not authors can add new metadata fields for assets. See [create metadata property for assets](meta-edit.md#editing-metadata-schema).

### Edit metadata for an asset {#editing-metadata-for-an-asset}

To edit metadata, follow these steps:

1. Do one of the following:

    * From the [!DNL Assets] interface, select the asset and click **[!UICONTROL View Properties]** from the toolbar.
    * From the asset thumbnail, select the **[!UICONTROL View Properties]** quick action.
    * From the asset page, click **[!UICONTROL View Properties]** ![Assets info icon](assets/do-not-localize/info-circle-icon.png) from the toolbar.

   The asset page displays all the asset's metadata. The metadata is extracted when the asset is uploaded (ingested) into [!DNL Experience Manager].

   ![Select Properties of an asset to view its metadata](assets/asset-metadata.png)

   *Figure: Edit or add metadata on asset [!UICONTROL Properties] page.*

1. Make edits to the metadata under the various tabs, as required, and when completed, click **[!UICONTROL Save]** from the toolbar to save your changes. Click **[!UICONTROL Close]** to return to the [!DNL Assets] web interface.

   >[!NOTE]
   >
   >If a text field is empty, there is no existing metadata set. You can enter a value into the field and save it to add that metadata property.

Any changes to the metadata of an asset are written back to the original binary as part of its XMP data. The metadata write-back workflow adds the metadata to the original binary. Changes made to the existing properties (such as `dc:title`) are overwritten and new properties (including custom properties like `cq:tags`) are added with the schema.

XMP write-back is supported and enabled for the platforms and file formats described in [technical requirements.](/help/sites-deploying/technical-requirements.md)

### Edit metadata schema {#editing-metadata-schema}

For details, see [edit metadata schema forms](metadata-schemas.md#edit-metadata-schema-forms).

### Register a custom namespace within [!DNL Experience Manager] {#registering-a-custom-namespace-within-aem}

You can add your own namespaces within [!DNL Experience Manager]. Just as there are predefined namespaces such as `cq`, `jcr`, and `sling`, you can have a namespace for your repository metadata and XML processing.

1. Access the node type administration page `https://[aem_server]:[port]/crx/explorer/nodetypes/index.jsp`.
1. To access the namespace administration page, click **[!UICONTROL Namespaces]** at the top of the page.
1. To add a namespace, click **[!UICONTROL New]** at the bottom of the page.
1. Specify a custom namespace in the XML namespace convention. Specify the ID in the form of a URI and an associated prefix for the ID. Click **[!UICONTROL Save]**.

## Edit metadata properties of multiple assets {#editing-metadata-properties-of-multiple-assets}

[!DNL Adobe Enterprise Manager Assets] lets you edit the metadata of multiple assets simultaneously so you can quickly propagate common metadata changes to assets in bulk. You can also edit the metadata for multiple collections in bulk. Use the properties page to perform metadata changes on multiple assets or collections:

* Change metadata properties to a common value
* Add or modify tags

To customize the metadata properties page, including adding, modifying, deleting metadata properties, use the schema editor.

>[!NOTE]
>
>The bulk editing methods work for assets available in a folder or a collection. For the assets that are available across folders or match a common criteria, it is possible to [bulk update the metadata after searching](search-assets.md#metadataupdates).

1. In the [!DNL Assets] user interface, navigate to the location of the assets you want to edit.
1. Select the assets for which you want to edit common properties.
1. From the toolbar, click **[!UICONTROL Properties]** to open the properties page for the selected assets.

   >[!NOTE]
   >
   >When you select multiple assets, the lowest common parent form is selected for the assets. In other words, the properties page only displays metadata fields that are common across the properties pages of all the individual assets.

1. Modify the metadata properties for selected assets under the various tabs.
1. To view the metadata editor for a specific asset, deselect the remaining assets in the list. The metadata editor fields are populated with the metadata for the particular asset.

   >[!NOTE]
   >
   >* In the properties page, you can remove assets from the asset list by deselecting them. The asset list has all the assets selected by default. The metadata for assets that you remove from the list is not updated.
   >* At the top of assets list, select the check box near **[!UICONTROL Title]** to toggle between selecting the assets and clearing the list.

1. To select a different metadata schema for the assets, click **[!UICONTROL Settings]** from the toolbar, and select the desired schema.
1. Save the changes.
1. To append the new metadata with the existing metadata in fields that contain multiple values, select **[!UICONTROL Append mode]**. If you do not select this option, the new metadata replaces the existing metadata in the fields. Click **[!UICONTROL Submit]**.

   >[!CAUTION]
   >
   >For single-value fields, the new metadata is not appended to the existing value in the field even if you select **[!UICONTROL Append mode]**.

## Import and export asset metadata in bulk {#import-and-export-asset-metadata-in-bulk}

[!DNL Adobe Experience Manager Assets] lets you import asset metadata in bulk using a CSV file. You can do bulk updates for the recently uploaded assets or the existing assets by importing a CSV file. You can also ingest asset metadata in bulk from third-party system in CSV format.

### Import metadata {#import-metadata}

The metadata import is asynchronous and does not impede system performance. Simultaneous update of the metadata for multiple assets can be resource-intensive because of XMP writeback activity if workflow flag is checked. Plan such an import during lean server usage so that performance for other users is not impacted.

>[!NOTE]
>
>To import metadata on custom namespaces, first register the namespaces.

1. Navigate to the [!DNL Assets] user interface, and click **[!UICONTROL Create]** from the toolbar.
1. From the menu, select **[!UICONTROL Metadata]**.
1. In the **[!UICONTROL Metadata Import]** page, click **[!UICONTROL Select File]**. Select the CSV file with the metadata.
1. Specify the following parameters. See a sample CSV file at [metadata-import-sample-file.csv](assets/metadata-import-sample-file.csv).

    | Metadata import parameters | Description |
    |:---|:---|
    | [!UICONTROL Batch Size] | Number of assets in a batch for which metadata is to be imported. Default value is 50. Maximum value is 100. |
    | [!UICONTROL Field Separator] | Default value is `,` (a comma). You can specify any other character. |
    | [!UICONTROL Multi Value Delimiter] | Separator for metadata values. Default value is `|`. |
    | [!UICONTROL Launch Workflows] | False by default. When set to `true` and default Launcher settings are in effect for the [!UICONTROL DAM Metadata WriteBack] workflow (that writes metadata to the binary XMP data). Enabling launch workflows slows the system down. |
    | [!UICONTROL Asset Path Column Name] | Defines the column name for the CSV file with assets. |

1. Click **[!UICONTROL Import]** from the toolbar. After the metadata is imported, a notification is displayed in [!UICONTROL Notification] inbox.

1. To verify correct import, navigate to an asset's [!UICONTROL Properties] page and verify the values in the fields.

To add date and timestamp when importing metadata, use `YYYY-MM-DDThh:mm:ss.fff-00:00` format for date and time. Date and time are separated by `T`, `hh` is hours in 24-hour format, `fff` is nanoseconds, and `-00:00` is timezone offset. For example, `2020-03-26T11:26:00.000-07:00` is March 26, 2020 at 11:26:00.000 AM PST time.

>[!CAUTION]
>
>If the date format does not match `YYYY-MM-DDThh:mm:ss.fff-00:00`, the date values are not set. The date formats of exported metadata CSV file is in the format `YYYY-MM-DDThh:mm:ss-00:00`. If you want to import it, convert it to the acceptable format by adding the nanoseconds value denoted by `fff`.

### Export metadata {#export-metadata}

You can export metadata for multiple assets in a CSV format. The metadata is exported asynchronously and does not impact the performance of the system. To export metadata, [!DNL Experience Manager] traverses through the properties of the asset node `jcr:content/metadata` and its child nodes and exports the metadata properties in a CSV file.

A few use cases for exporting metadata in bulk are:

* Import the metadata in a third-party system when migrating assets.
* Share asset metadata with a wider project team.
* Test or audit the metadata for compliance.
* Externalize the metadata to localize it separately.

1. Select the asset folder that contains assets for which you want to export metadata. From the toolbar, select **[!UICONTROL Export metadata]**.

1. In the [!UICONTROL Metadata Export] dialog, specify a name for the CSV file. To export metadata for assets in subfolders, select **[!UICONTROL Include assets in subfolders]**.

   ![Interface and options to export metadata of all assets in a folder](assets/export_metadata_page.png "Interface and options to export metadata of all assets in a folder")

1. Select the desired options. Provide a filename and if necessary a date.

1. In the **[!UICONTROL Properties to be exported]** field, specify whether you want to export all or specific properties. If you choose Selective properties to be exported, add the desired properties.  

1. From the toolbar, click **[!UICONTROL Export]**. A message confirms that the metadata is exported. Close the message.

1. Open the inbox notification for the export job. Select the job and click **[!UICONTROL Open]** from the toolbar. To download the CSV file with the metadata, click **[!UICONTROL CSV Download]** from the toolbar. Click **[!UICONTROL Close]**.

   ![Dialog  to download the CSV file containing metadata exported in bulk](assets/csv_download.png)

   *Figure: Dialog to download the CSV file containing metadata exported in bulk.*

### Configure limit for bulk metadata update {#configlimit}

To prevent DOS like situation, Enterprise Manager limits the number of parameters supported in a Sling request. When updating metadata of many assets in one go, you may reach the limit and the metadata does not get updated for more assets. Enterprise Manager generates the following warning in the logs:

`org.apache.sling.engine.impl.parameters.Util Too many name/value pairs, stopped processing after 10000 entries`

To change the limit, access **[!UICONTROL Tools]** > **[!UICONTROL Operations]** > **[!UICONTROL Web Console]** and change the value of **[!UICONTROL Maximum POST Parameters]** in **[!UICONTROL Apache Sling Request Parameter Handling]** OSGi configuration.

<!--  TBD for later: Complete this section. Take help from Metadata IRD for DDAM. Also, look at metadata features in Forrester analysis.
-->

<!-- TBD: Try filling the available information in these topics to the extent possible. As and when complete, publish the sections live.

## Understand metadata handling in Experience Manager {#metadata-possibilities-with-aem}

Describe the journey of an assets' metadata. What all happens to metadata when an asset is added to Experience Manager.

## Add metadata to your digital assets {#add-metadata}

Typically, the applications that create digital assets add some metadata to the assets created. Before uploading an asset to Experience Manager, you can edit and modify metadata using either the native application used to create an asset or using some metadata editors. When you upload an asset to Experience Manager, the metadata is processed.

## Metadata of assets, folders, and collections {#metadata-of-assets-folders-collections}

## Modify metadata of an asset, folder, or collection {#modify-metadata}

## Modify metadata in bulk {#modify-metadata-in-bulk}

[!DNL Adobe Enterprise Manager Assets] lets you edit the metadata of multiple assets simultaneously so you can quickly propagate common metadata changes to assets in bulk. You can also edit the metadata for multiple collections in bulk.

Use the properties page to perform metadata changes on multiple assets or collections:

* Change metadata properties to a common value
* Add or modify tags

To customize the metadata properties page, including adding, modifying, deleting metadata properties, use the schema editor.

>[!NOTE]
>
>The bulk editing methods work for assets available in a folder or a collection. For the assets that are available across folders or match a common criteria, it is possible to [bulk update the metadata after searching](search-assets.md#metadataupdates).

1. In the [!DNL Assets] user interface, navigate to the location of the assets you want to edit.
1. Select the assets for which you want to edit common properties.
1. From the toolbar, click **[!UICONTROL Properties]** to open the properties page for the selected assets.

   >[!NOTE]
   >
   >When you select multiple assets, the lowest common parent form is selected for the assets. In other words, the properties page only displays metadata fields that are common across the properties pages of all the individual assets.

1. Modify the metadata properties for selected assets under the various tabs.
1. To view the metadata editor for a specific asset, deselect the remaining assets in the list. The metadata editor fields are populated with the metadata for the particular asset.

   >[!NOTE]
   >
   >* In the properties page, you can remove assets from the asset list by deselecting them. The asset list has all the assets selected by default. The metadata for assets that you remove from the list is not updated.
   >* At the top of assets list, select the check box near **[!UICONTROL Title]** to toggle between selecting the assets and clearing the list.

1. To select a different metadata schema for the assets, click **[!UICONTROL Settings]** from the toolbar, and select the desired schema.
1. Save the changes.
1. To append the new metadata with the existing metadata in fields that contain multiple values, select **[!UICONTROL Append mode]**. If you do not select this option, the new metadata replaces the existing metadata in the fields. click **[!UICONTROL Submit]**.

   >[!CAUTION]
   >
   >For single-value fields, the new metadata is not appended to the existing value in the field even if you select **[!UICONTROL Append mode]**.

## Configure limit for bulk metadata update {#limit-bulk-metadata-updates}

To prevent DOS like situation, Enterprise Manager limits the number of parameters supported in a Sling request. When updating metadata of many assets in one go, you may reach the limit and the metadata does not get updated for more assets. Enterprise Manager generates the following warning in the logs:

`org.apache.sling.engine.impl.parameters.Util Too many name/value pairs, stopped processing after 10000 entries`

To change the limit, access **[!UICONTROL Tools]** > **[!UICONTROL Operations]** > **[!UICONTROL Web Console]** and change the value of **[!UICONTROL Maximum POST Parameters]** in **[!UICONTROL Apache Sling Request Parameter Handling]** OSGi configuration.

-->

## Tips and limitations {#best-practices-limitations}

* The metadata updates via Touch-UI changes the metadata properties in the `dc` namespace. Any updates made via the HTTP API changes the metadata properties in the `jcr` namespace. See [how to update metadata using HTTP API](/help/assets/mac-api-assets.md#update-asset-metadata).
* The CSV file for importing assets metadata is in a very specific format. To save effort and time and to avoid unintended errors, you can start creating the CSV using the format of an exported CSV file.
* When importing metadata using a CSV file, the required date date format is `YYYY-MM-DDThh:mm:ss.fff-00:00`. If any other format is used, then the date values are not set. The date formats of exported metadata CSV file is in the format `YYYY-MM-DDThh:mm:ss-00:00`. If you want to import it, convert it to the acceptable format by adding the nanoseconds value denoted by `fff`.
* To import metadata on custom namespaces, first register the namespaces.
* Property Picker displays properties that are used in schema editors and search forms. Property Picker does not pick metadata properties from an asset.

>[!MORELIKETHIS]
>
>* [Metadata concepts and understanding](metadata-concepts.md).
>* [Edit metadata properties of multiple collections](managing-collections-touch-ui.md#editing-collection-metadata-in-bulk)
>* [How to edit or add metadata](meta-edit.md).
>* [Edit metadata properties of multiple collections](managing-collections-touch-ui.md#editing-collection-metadata-in-bulk)
>* [Metadata import and export in Experience Manager Assets](https://docs.adobe.com/content/help/en/experience-manager-learn/assets/metadata/metadata-import-feature-video-use.html)

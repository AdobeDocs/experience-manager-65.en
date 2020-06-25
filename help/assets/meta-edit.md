---
title: How to edit or add metadata
description: Learn about asset metadata in [!DNL Adobe Experience Manager Assets] an various ways by which you can edit asset metadata.
contentOwner: AG
---

# How to edit or add metadata {#how-to-edit-or-add-metadata}

Metadata is additional information about the asset that can be searched. It is automatically extracted when you upload an image. You can edit the existing metadata or add new metadata properties to existing fields (for example, when a metadata field is blank).

Because organizations need controlled and reliable metadata vocabularies, [!DNL Experience Manager Assets] does not allow for on demand adding of new metadata properties. Although authors cannot add new metadata fields for assets, developers can. See [create metadata property for assets](meta-edit.md#editing-metadata-schema).

## Edit metadata for an asset {#editing-metadata-for-an-asset}

To edit metadata, follow these steps:

1. Do one of the following:

    * From the [!DNL Assets] interface, select the asset and click **[!UICONTROL View Properties]** from the toolbar.
    * From the asset thumbnail, select the **[!UICONTROL View Properties]** quick action.
    * From the asset page, click **[!UICONTROL View Properties]** ![chlimage_1-168](assets/chlimage_1-168.png) from the toolbar.

   The asset page displays all the asset's metadata. The metadata is extracted when the asset is uploaded (ingested) into [!DNL Experience Manager].

   ![select asset Properties to view metadata](assets/asset-metadata.png)

   *Figure: Edit or add metadata on asset [!UICONTROL Properties] page.*

1. Make edits to the metadata under the various tabs, as required, and when completed, click **[!UICONTROL Save]** from the toolbar to save your changes. Click **[!UICONTROL Close]** to return to the [!DNL Assets] web interface.

   >[!NOTE]
   >
   >If a text field is empty, there is no existing metadata set. You can enter a value into the field and save it to add that metadata property.

Any changes to the metadata of an asset are written back to the original binary as part of its XMP data. The metadata write-back workflow adds the metadata to the original binary. Changes made to the existing properties (such as `dc:title`) are overwritten and new properties (including custom properties like `cq:tags`) are added with the schema.

XMP write-back is supported and enabled for the platforms and file formats described in [technical requirements.](/help/sites-deploying/technical-requirements.md)

## Edit metadata schema {#editing-metadata-schema}

For details, see [edit metadata schema forms](metadata-schemas.md#edit-metadata-schema-forms).

## Register a custom namespace within [!DNL Experience Manager] {#registering-a-custom-namespace-within-aem}

You can add your own namespaces within [!DNL Experience Manager]. Just as there are predefined namespaces such as `cq`, `jcr`, and `sling`, you can have a namespace for your repository metadata and XML processing.

1. Go to the node type administration page `https:[aem_server]:[port]/crx/explorer/nodetypes/index.jsp`.
1. Click **[!UICONTROL Namespaces]** at the top of the page. The namespace administration page is displayed in a window.

1. To add a namespace, click **[!UICONTROL New]** at the bottom.
1. Specify a custom namespace in the XML namespace convention. Specify the ID in the form of a URI and an associated prefix for the id. Click **[!UICONTROL Save]**.

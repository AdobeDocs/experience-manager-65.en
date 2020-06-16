---
title: XMP writeback to renditions
description: Learn how the XMP writeback feature propagates the metadata changes for an asset to all or specific renditions of the asset.
contentOwner: AG
---

# XMP writeback to renditions {#xmp-writeback-to-renditions}

The XMP writeback feature in [!DNL Adobe Experience Manager Assets] replicates asset metadata changes to the renditions of the asset. When you change the metadata for an asset from within [!DNL Experience Manager Assets] or while uploading the asset, changes are initially stored within the asset node in CRXDe. The XMP writeback feature propagates the metadata changes to all or specific renditions of the asset.

Consider a scenario where you modify the [!UICONTROL Title] property of the asset titled `Classic Leather` to `Nylon`.

![metadata](assets/metadata.png)

In this case, the [!DNL Experience Manager Assets] saves the changes to the **[!UICONTROL Title]** property in the `dc:title` parameter for the asset metadata stored in the asset hierarchy.

![metadata_stored](assets/metadata_stored.png)

However, [!DNL Experience Manager Assets] does not automatically propagate any metadata changes to the renditions of an asset.

The XMP Writeback feature lets you propagate the metadata changes to all or specific renditions of the asset. However, the changes are not stored under the metadata node in the asset hierarchy. Instead, this feature embeds the changes in the binary files for the renditions.

## Enabling XMP writeback {#enabling-xmp-writeback}

To enable the metadata changes to be propagated to the renditions of the asset when uploading it, modify the **[!UICONTROL Adobe CQ DAM Rendition Maker]** configuration in Configuration Manager.

1. To open Configuration Manager, access `https://[aem_server]:[port]/system/console/configMgr`.
1. Open the **[!UICONTROL Adobe CQ DAM Rendition Maker]** configuration.
1. Select the **[!UICONTROL Propagate XMP[!UICONTROL ** option, and then save the changes.

   ![chlimage_1-135](assets/chlimage_1-346.png)

## Enabling XMP writeback for specific renditions {#enabling-xmp-writeback-for-specific-renditions}

To let the XMP Writeback feature propagate metadata changes to select renditions, specify these renditions to the XMP Writeback Process workflow step of [!UICONTROL DAM Metadata WriteBack] workflow. By default, this step is configured with the original rendition.

For the XMP Writeback feature to propagate metadata to the rendition thumbnails 140.100.png and 319.319.png, perform these steps.

1. In the Experience Manager interface, navigate to **[!UICONTROL Tools]** &gt; **[!UICONTROL Workflow]** &gt; **[!UICONTROL Models]**.
1. From the Models page, open the **[!UICONTROL DAM Metadata Writeback]** workflow model.
1. In the **[!UICONTROL DAM Metadata Writeback]** properties page, open the **[!UICONTROL XMP Writeback Process]** step.
1. In the [!UICONTROL Step Properties] dialog box, click the **[!UICONTROL Process]** tab.
1. In the **Arguments** box, add `rendition:cq5dam.thumbnail.140.100.png,rendition:cq5dam.thumbnail.319.319.png`, andd then click **OK**.

   ![step_properties](assets/step_properties.png)

1. Save the changes.
1. To regenerate the pyramid TIFF renditions for [!DNL Dynamic Media] images with the new attributes, add the **[!UICONTROL Dynamic Media Process Image Assets]** step to the [!UICONTROL DAM Metadata Writeback] workflow.

   PTIFF renditions are only created and stored locally in a Dynamic Media Hybrid implementation.

1. Save the workflow.

The metadata changes are propagated to the renditions renditions thumbnail.140.100.png and thumbnail.319.319.png of the asset, and not the others.

>[!NOTE]
>
>For XMP writeback issues in 64 bit Linux, see [How to enable XMP write-back on 64-bit RedHat Linux](https://helpx.adobe.com/experience-manager/kb/enable-xmp-write-back-64-bit-redhat.html).
>
>For more information about supported platforms, see [XMP metadata write-back prerequisites](/help/sites-deploying/technical-requirements.md#requirements-for-aem-assets-xmp-metadata-write-back).

## Filtering XMP metadata {#filtering-xmp-metadata}

[!DNL Experience Manager Assets] supports both blocked list and allowed list filtering of properties/nodes for XMP metadata that is read from asset binaries and stored in JCR when assets are ingested.

Filtering using a blocked list lets you import all XMP metadata properties except the properties that are specified for exclusion. However, for asset types such as INDD files that have huge amounts of XMP metadata (for example 1000 nodes with 10,000 properties), the names of nodes to be filtered are not always known in advance. If filtering using a blocked list allows a large number of assets with numerous XMP metadata to be imported, the AEM instance/cluster can encounter stability issues, for example clogged observation queues.

Filtering of XMP metadata via allowed list resolves this issue by letting you define the XMP properties to be imported. This way, any other or unknown XMP properties are ignored. For backward compatibility, you can add some of these properties to the filter that uses a blocked list.

>[!NOTE]
>
>Filtering works only for the properties derived from XMP sources in asset binaries. For the properties derived from non-XMP sources, such as EXIF and IPTC formats, the filtering does not work. For example, the date of asset creation is stored in property named `CreateDate` in EXIF TIFF. Experience Manager stores this value in a metadata field named `exif:DateTimeOriginal`. As the source is a non-XMP source, filtering does not work on this property.

<!-- TBD: The instructions don't seem to match the UI. I see com.day.cq.dam.commons.metadata.XmpFilterBlackWhite.description
in Config Manager. And the settings are,
com.day.cq.dam.commons.metadata.XmpFilterBlackWhite.xmp.filter.apply_whitelist.name
com.day.cq.dam.commons.metadata.XmpFilterBlackWhite.xmp.filter.whitelist.name
com.day.cq.dam.commons.metadata.XmpFilterBlackWhite.xmp.filter.apply_blacklist.name
com.day.cq.dam.commons.metadata.XmpFilterBlackWhite.xmp.filter.blacklist.name
 
TBD: Make updates to configurations for allow and block list after product updates are done.
-->

1. To open Configuration Manager, access `https://[aem_server]:[port]/system/console/configMgr`.
1. Open the **[!UICONTROL Adobe CQ DAM XmpFilter]** configuration.
1. To apply filtering via an allowed list, select **[!UICONTROL Apply Allowlist to XMP Properties]**, and specify the properties to be imported in the **[!UICONTROL Allowed XML Names for XMP filtering]** box.

   ![chlimage_1-136](assets/chlimage_1-347.png)

1. To filter out blocked XMP properties after applying filtering via allowed list, specify those in the **[!UICONTROL Blocked XML Names for XMP filtering]** box.

   >[!NOTE]
   >
   >The **[!UICONTROL Apply Blocklist to XMP Properties]** option is selected by default. In other words, filtering using a blocked list is enabled by default. To disable such filtering, deselect the **[!UICONTROL Apply Blocklist to XMP Properties]** option.

1. Save the changes.

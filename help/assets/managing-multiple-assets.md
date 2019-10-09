---
title: Bulk edit metadata of multiple assets and collections
seo-title: Bulk edit metadata of multiple assets and collections
description: Learn how to edit the metadata of many assets and collections simultaneously to quickly propagate common metadata changes.
seo-description: Learn how to edit the metadata of many assets and collections in bulk.
uuid: 115a6e39-2f1b-4d07-bec6-30b149524a60
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
discoiquuid: 5ca217a3-3806-4647-800c-2e3658df00b8
---

# Managing Multiple Assets and Collections {#managing-multiple-assets-and-collections}

Learn how to edit the metadata of multiple assets and collections simultaneously to quickly propagate common metadata changes.

Adobe Enterprise Manager (AEM) Assets lets you edit the metadata of multiple assets simultaneously so you can quickly propagate common metadata changes to assets in bulk. You can also edit the metadata for multiple collections in bulk.

Use the properties page to perform metadata changes on multiple assets or collections:

* Change metadata properties to a common value
* Add or modify tags

To customize the metadata properties page, including adding, modifying, deleting metadata properties, use the Schema editor.

>[!NOTE]
>
>The bulk editing methods work for assets available in a folder or a collection. For the assets that are available across folders or match a common criteria, it is possible to update the metadata in bulk from asset search results.

## Editing metadata properties of multiple assets {#editing-metadata-properties-of-multiple-assets}

1. In the Assets user interface, navigate to the location of the assets you want to edit.
1. Select the assets for which you want to edit common properties.
1. From the toolbar, tap/click the **[!UICONTROL Properties]** icon to open the properties page for the selected assets.

   >[!NOTE]
   >
   >When you select multiple assets, the lowest common parent form is selected for the assets. In other words, the properties page only displays metadata fields that are common across the properties pages of all the individual assets.

1. Modify the metadata properties for selected assets under the various tabs.
1. To view the metadata editor for a specific asset, deselect the remaining assets in the list. The metadata editor fields are populated with the metadata for the particular asset.

   >[!NOTE]
   >
   >* In the properties page, you can remove assets from the asset list by deselecting them. The asset list has all the assets selected by default. The metadata for assets that you remove from the list is not updated.
   >* At the top of assets list, select the check box near **Title** to toggle between selecting the assets and clearing the list.

1. To select a different metadata schema for the assets, tap/click the **[!UICONTROL Settings]** icon from the toolbar, and select the desired schema.
1. Save the changes.
1. To append the new metadata with the existing metadata in fields that contain multiple values, select **[!UICONTROL Append mode]**. If you do not select this option, the new metadata replaces the existing metadata in the fields. Tap/click **[!UICONTROL Submit]**.

   >[!CAUTION]
   >
   >For single-value fields, the new metadata is not appended to the existing value in the field even if you select **[!UICONTROL Append mode]**.

## Editing metadata properties of multiple collections {#editing-metadata-properties-of-multiple-collections}

1. From the Collections console, select the collections you want to edit.
1. From the toolbar, tap/click the **[!UICONTROL Properties]** icon to open the properties page for the selected collections.
1. Modify the metadata properties for selected collections under the various tabs.

   >[!NOTE]
   >
   >The metadata you add for the selected collections overwrites the previous metadata for these collections, except for tags. Any tags you add in the **[!UICONTROL Tags]** field, are appended to the existing list of tags in the metadata.

1. To view the metadata properties for a specific collection, deselect the remaining collections in the collections list. The metadata editor fields are populated with the metadata for the particular collection.

   >[!NOTE]
   >
   >* In the collection properties page, you can remove collections from the list of collections by deselecting them. The collections list has all the collections selected by default. The metadata for collections that you remove is not updated.
   >* At the top of the list, select the check box near **Title** to toggle between selecting the collections and clearing the list.

1. Save the changes.

## Configure limit for bulk metadata update {#configure-limit-for-bulk-metadata-update}

To prevent DOS like situation, AEM limits the number of parameters supported in a Sling request. When updating metadata of many assets in one go, you may reach the limit and the metadata does not get updated for more assets. AEM generates the following warning in the logs:

`org.apache.sling.engine.impl.parameters.Util Too many name/value pairs, stopped processing after 10000 entries`

To change the limit, access **[!UICONTROL Tools > Operations > Web Console]** and change the value of [!UICONTROL Maximum POST Parameters] in [!UICONTROL Apache Sling Request Parameter Handling] OSGi configuration.

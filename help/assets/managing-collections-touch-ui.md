---
title: Managing Collections
description: Understand the concept of collection in AEM Assets. Learn how to collections, manage, edit, and collections with other users.
uuid: b23c4cf5-fb3d-45cb-b393-d3b9dc6b03bb
contentOwner: AG
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
discoiquuid: f2b11641-a88d-453b-8ec7-b5c83c78578f
docset: aem65

---

# Managing Collections {#managing-collections}

A collection is a set of assets within Adobe Experience Manager (AEM) Assets. Use collections to share assets between users.

* A collection can include assets from different locations.
* You can share collections with various users that are assigned different levels of privileges, including viewing, editing, and so on.

You can share multiple collections with a user. Each collection contains references to assets. The referential integrity of assets is maintained across collections.

Collections are of the following types, based on the way they collate assets:

* A collection that contains a static reference list of assets, folders, and other collections

* A Smart collection that dynamically includes assets based on a search criteria

## Navigating the Collections console {#navigating-the-collections-console}

To open the **[!UICONTROL Collections]** console:

1. Tap or click the AEM logo.
1. From the Navigation page, go to **[!UICONTROL Assets]** &gt; **[!UICONTROL Collections]**. The **[!UICONTROL Collections]** console is displayed.

## Creating a collection {#creating-a-collection}

You can create a collection either with [static references](#creating-a-collection-with-static-references) or based on a [search criteria-based filter](#creating-a-smart-collection). You can also create a collection from a lightbox.

### Creating a collection with static references {#creating-a-collection-with-static-references}

You can create a collection with static references, for example a collection with references to assets, folders, collections, spin sets, and image sets.

1. Navigate to the **[!UICONTROL Collections]** console.
1. From the toolbar, tap/click **[!UICONTROL Create]**.
1. In the **[!UICONTROL Create Collection]** page, enter a title and an optional description for the collection.
1. Add members to the collection and assign appropriate permissions. Alternatively, select **[!UICONTROL Public Collection]** to allow all users to access the collection.

   >[!NOTE]
   >
   >To enable the members to share collections with other users, provide the `dam-users` group read permissions at the path `home/users`. Give permission to the users at `/content/dam/collections` location to allow the users to view the Collections in pop up lists. Alternatively, make the user a part of `dam-users` group.

1. (Optional) Add a thumbnail image for the collection.
1. Tap/click **[!UICONTROL Create]**, and then tap/click **[!UICONTROL OK]** to close the dialog. A collection with the specified title and properties is opened in the Collections console.

   >[!NOTE]
   >
   >AEM Assets lets you create review tasks for a collection similar to the way you create review tasks for an assets folder.

   To add assets to the collection, navigate to the Assets user interface. For details, see [Adding assets to a collection](/help/assets/managing-collections-touch-ui.md#adding-assets-to-a-collection).

### Create collections using Dropzone {#create-collections-using-dropzone}

You can drag assets from the Assets UI to a collection. You can also create a copy of a collection and drag the assets there.

1. From the Assets UI, select the assets you want to add to a collection.
1. Drag the assets to the **[!UICONTROL Drop in Collection]** zone.

   ![drop_in_collection](assets/drop_in_collection.png)

   Release the mouse button when the Dropzone becomes active, and its label changes to **[!UICONTROL Drop to Add]**.

   ![drop_to_add](assets/drop_to_add.png)

   Alternatively, tap/click the **[!UICONTROL To Collection]** icon from the toolbar.

   ![chlimage_1-6](assets/chlimage_1-6.png)

1. In the **[!UICONTROL Add To Collection]** page, tap/click the **[!UICONTROL Create Collection]** icon from the toolbar.

   If you want to add the assets to an existing collection, select it from the page, and tap/click **[!UICONTROL Add]**. By default, the most recently updated collection is selected.

1. In the **[!UICONTROL Create New Collection]** dialog, specify a name for the collection. If you want the collection to be accessible to all users, select **[!UICONTROL Public Collection]**.
1. Tap/click **[!UICONTROL Continue]** to create the collection.

### Creating a smart collection {#creating-a-smart-collection}

A Smart Collection uses a search criteria to dynamically populate assets. You can create a Smart Collection using only files and not folders or files and folders.

1. Navigate to the Assets UI, and tap/click the **[!UICONTROL Search]** icon.
1. Enter search keyword in the Omni Search box and press Enter. Tap/click the GlobalNav icon to display the Filters panel and apply a search filter from the Search panel.
1. From the **[!UICONTROL Files & Folders]** list, select **[!UICONTROL Files]**.

   ![files_option](assets/files_option.png)

1. Tap/click **[!UICONTROL Save Smart Collection]**.
1. Specify a name for the collection. Select **[!UICONTROL Public]** to add the DAM Users group with the Viewer role to the smart collection.

   ![save_collection](assets/save_collection.png)

   >[!NOTE]
   >
   >If you select **[!UICONTROL Public]**, the smart collection becomes available to everyone with the Owner role after you create it.
   >
   >
   >If you deselect the **[!UICONTROL Public]** option, the DAM user group is no longer associated with the smart collection.

1. Tap/click **[!UICONTROL Save]** to create the smart collection, and then close the message box to complete the process.

   The new smart collection is also added to the **[!UICONTROL Saved Searches]** list.

   ![collection_listing](assets/collection_listing.png)

   The label of the **[!UICONTROL Create Smart Selection]** button changes to **[!UICONTROL Edit Smart Selection]**. To edit the settings of the smart collection, select **[!UICONTROL Files]** from the **[!UICONTROL Files & Folders]** list. Then, tap/click the **[!UICONTROL Edit Smart Selection]** button.

   ![chlimage_1-7](assets/chlimage_1-7.png)

## Adding assets to a collection {#adding-assets-to-a-collection}

You can add assets to a collection that contains a list of referenced assets or folders.

>[!NOTE]
>
>Smart collections use a search query to populate assets. Therefore, static references to assets and folders are not applicable to them.

1. In the Assets UI, navigate to the location of the asset that you want to add to a collection.
1. Select the asset and tap/click the **[!UICONTROL To Collection]** icon from the toolbar.

   ![chlimage_1-8](assets/chlimage_1-8.png)

   Alternatively, you can drag the asset to the **[!UICONTROL Drop in Collection]** zone. Release the mouse button when the drop zone becomes active and its label changes to **[!UICONTROL Drop to Add]**.

1. In the **[!UICONTROL Add To Collection]** page, select the collection to which you want to add the asset.
1. Tap/click **[!UICONTROL Add]**, and then close the confirmation message. The asset is added to the collection.

## Editing a smart collection {#editing-a-smart-collection}

Smart collections are built by saving a search so you can alter their content by modifying the search parameters of the [saved search](#editing-saved-searches).

1. In the Assets UI, tap/click the **[!UICONTROL Search]** icon from the toolbar.

   ![chlimage_1-9](assets/chlimage_1-9.png)

1. With the cursor in the Omnisearch box, press the Return key.
1. Tap/click the GlobalNav icon to display the Filters panel.
1. From the **[!UICONTROL Saved Searches]** list, select the smart collection you want to modify. The Search panel displays the filters configured for the saved search.

   ![select_smart_collection](assets/select_smart_collection.png)

1. From the **[!UICONTROL Files & Folders]** list, select **[!UICONTROL Files]**.
1. Modify one or more filters, as necessary. Tap/click **[!UICONTROL Edit Smart Collection]**.

   You can also edit the name of the smart collection.

   ![edit_smart_collectiondialog](assets/edit_smart_collectiondialog.png)

1. Tap/click **[!UICONTROL Save]**. The **[!UICONTROL Edit Smart Collection]** dialog appears.
1. Tap/click **[!UICONTROL Overwrite]** to replace the original smart collection with the edited collection. Alternatively, select **[!UICONTROL Save As]** to save the edited collection separately.
1. In the confirmation dialog, tap/click **[!UICONTROL Save]** to complete the process.

## Viewing and editing collection metadata {#viewing-and-editing-collection-metadata}

Collection metadata comprises data about the collection, including any tags that are added.

1. From the Collections console, select a collection and tap/click the **[!UICONTROL Properties]** icon from the toolbar.
1. In the **[!UICONTROL Collection Metadata]** page, view the collection metadata from the **[!UICONTROL Basic]** and **Advanced** tabs.
1. Modify the metadata, as necessary, and then tap/click **[!UICONTROL Save & Close]** from the toolbar to save the changes.

### Editing collection metadata in bulk {#editing-collection-metadata-in-bulk}

You can edit the metadata of multiple collections simultaneously. This functionality helps you quickly replicate common metadata in multiple collections.

1. In the Collections console, select two or more collections for which you want to edit metadata.
1. From the toolbar, tap/click the **[!UICONTROL Properties]** icon.
1. In the **[!UICONTROL Collection Metadata]** page, edit the metadata under the **[!UICONTROL Basic]** and **[!UICONTROL Advanced]** tabs, as necessary.
1. Tap/click **[!UICONTROL Save & Close]** from the toolbar, and then close the confirmation dialog to complete the process.
1. To append the new metadata with the existing metadata, select **[!UICONTROL Apend mode]**. If you do not select this option, the new metadata replaces the existing metadata in the fields. Tap/click **[!UICONTROL Submit]**.

   >[!NOTE]
   >
   >The Append mode works only for fields that can contain multiple values. For fields that can contain only a single value, the new metadata is not appended to the existing value in the field even if you select **[!UICONTROL Append mode]**.

## Searching {#searching}

The Search feature within Collections supports both [Searching for Collections](#searching-collections) and [Searching for assets within a Collection](#searching-within-collections).

### Searching Collections {#searching-collections}

You can search collections from the Collections console. When you search with keywords in the Omnisearch box, AEM Assets searches for collection names, metadata, and the tags added to the collections.

If you search for collections from the top level, only individual collections are returned in search results. Assets or folders within the collections are excluded. In all other cases (for example, within an individual collection or in a folder hierarchy), all relevant assets, folders, and collections are returned.

### Searching within Collections {#searching-within-collections}

In the Collections console, tap/click a collection to open it.

Within a collection, AEM Asset search is restricted to assets (and their tags and metadata) within the collection that you are viewing. When you search within a folder, all matching assets and child folders within the current folder are returned. When you search within a collection, only matching assets, folders, and other collections that are direct members of the collection are returned.

## Editing Collection Settings {#editing-collection-settings}

You can edit collection settings, such as title and description, or to add members to a collection.

1. Select a collection, and tap/click the **[!UICONTROL Settings]** icon in the toolbar. Alternatively, use the **[!UICONTROL Settings]** quick action from the collection thumbnail.
1. Modify the collection settings in the **[!UICONTROL Collection Settings]** page. For example, modify the collection title, descriptions, members, and permissions as discussed in [Adding Collections](#creating-a-collection).

1. Tap/click **[!UICONTROL Save]** to save the changes.

   ![chlimage_1-10](assets/chlimage_1-10.png)

## Deleting a collection {#deleting-a-collection}

1. From the Collections console, select one or more collections and tap/click the delete icon in the toolbar.

   ![chlimage_1-11](assets/chlimage_1-11.png)

1. In the dialog, tap/click **[!UICONTROL Delete]** to confirm the delete action.

   >[!NOTE]
   >
   >You can also detete Smart collections by [deleting saved searches](#deleting-saved-searches).

## Downloading a collection {#downloading-a-collection}

When you download a collection, the entire hierarchy of assets within the collection is downloaded, including folders and child collections.

1. From the Collections console, select one or more collections to download.
1. From the toolbar, tap/click the download icon.
1. In the **[!UICONTROL Download]** dialog, tap/click **[!UICONTROL Download]**. If you want to download the renditions of the assets within the collection, select **[!UICONTROL Renditions]**. Select the **[!UICONTROL Email]** option to send an email notification to the owner of the collection.

   When you select a collection to download, the complete folder hierarchy under the collection is downloaded. To include each collection you download (including assets in child collections nested under the parent collection) in an individual folder, select **[!UICONTROL Create separate folder for each asset]**.

## Creating nested collections {#creating-nested-collections}

You can add a collection to another collection, thereby creating a nested collection.

1. From the Collections console, select the desired collection or group of collections, and tap or click the **[!UICONTROL To Collection]** icon in the toolbar.

   ![chlimage_1-12](assets/chlimage_1-12.png)

1. From the **[!UICONTROL Add To Collection]** page, select the collection in which to add the collection.

   >[!NOTE]
   >
   >The most recently updated collection is selected by default in the **[!UICONTROL Add To Collection]** page.

1. Tap/click **[!UICONTROL Add]**. A message confirms that the collection is added to the target collection in the **[!UICONTROL Select Destination]** page. Close the message to complete the process.

>[!NOTE]
>
>Smart collections cannot be nested. In other words, Smart collections cannot contain any other collection.

## Saved searches {#saved-searches}

In the Assets UI, you can search or filter assets based on certain rules, search criteria, or custom search facets. If you save these as **[!UICONTROL Saved Searches]**, you can access them later from the **[!UICONTROL Saved Searches]** list in the Filter panel. Creating a saved search also creates a smart collection.

![saved_searches_list](assets/saved_searches_list.png)

### Creating Saved Searches {#creating-saved-searches}

Saved searches are created when you create a smart collection. Smart collections are automatically added to the **[!UICONTROL Saved Searches]** list. The Saved Searches query for the collection is saved in the `dam:query` property in crxde at the relative location `/content/dam/collections/`.

>[!NOTE]
>
>You can share smart collections in the same way as you share static collections.

### Editing Saved Searches {#editing-saved-searches}

Editing saved searches is the same as editing smart collections. For details, see [Editing a smart collection](/help/assets/managing-collections-touch-ui.md#editing-a-smart-collection).

### Deleting Saved Searches {#deleting-saved-searches}

1. Navigate to the Assets UI, and tap/click the Search icon on the toolbar.

   ![chlimage_1-13](assets/chlimage_1-13.png)

1. With the cursor in the Omni Search box, press the Return key.
1. Click or tap the GlobalNav icon to display the Filters panel.

1. From the **Saved Searches** list, tap/click the **Delete** icon next to the smart collection you want to delete.

   ![select_smart_collection-1](assets/select_smart_collection-1.png)

1. In the dialog, tap/click **Delete** to delete the saved search.

## Running a workflow on a collection {#running-a-workflow-on-a-collection}

You can run a workflow for the assets within a collection. If the collection contains nested collections, the workflow also runs on the assets within the nested collections. However, if the collection and the nested collection contain duplicate assets, the workflow only runs once for such assets.

1. From the Collections console, select a collection on which you want to run a workflow.
1. Tap/click the GlobalNav icon, and choose **Timeline** from the list.
1. From the timeline, click or tap the Caret icon at the bottom, and then tap/click **Start Workflow**.

   ![chlimage_1-14](assets/chlimage_1-14.png)

1. In the **Start Workflow** section, select a workflow model from the list. For example, select the **DAM Update Asset** model.
1. Enter a title for the workflow, and tap/click **Start**.
1. In the dialog, tap/click **Proceed**. The workflow runs on all the assets in the collection.

## See also {#see-also}

* [Configure AEM Assets email notifications](/help/sites-administering/notification.md#assetsconfig)
* [Edit metadata properties of multiple Collections](/help/assets/managing-multiple-assets.md)
* [Create a review task for Collections](/help/assets/bulk-approval.md)


---
title: Organize digital assets
description: Organize your digital assets.
uuid: 3baf6563-c90e-4bf6-8c04-c68877e3f146
contentOwner: AG
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
discoiquuid: 5877f8f8-1f4b-430c-a173-13c40b233c33
docset: aem65

---

# Organize digital assets {#organize-digital-assets}

All digital assets, metadata and content of Microsoft Office and PDF documents are extracted and made searchable. Search allows sophisticated filtering on assets and fully respects the proper permissions. Metadata is covered in detail in metadata in Digital Asset Management.

AEM Assets supports multiple ways of organizing content. You can organize them in a hierarchical manner using folders or you can organize them in an unordered, ad-hoc manner, using for example tags. Users can edit tags in the DAM Asset Editor where sub-assets, renditions, and metadata are displayed.

## Create folders {#create-folders}

When organizing a collection of assets, for example, all *Nature* images, you can create folders to keep them together. You can use folders to categorize and organize your assets. AEM Assets does not require you to organize assets in folders to work better.

>[!NOTE]
>
>Sharing an Assets folder (in Marketing Cloud) of the type `sling:OrderedFolder`, is not supported. If you want to share a folder, do not select Ordered when creating a folder.

1. Navigate to the place in your digital assets folder where you want to create a new folder.
1. In the menu, click **[!UICONTROL Create]**. Select **[!UICONTROL New Folder]**.
1. In the **[!UICONTROL Title]** field, provide a folder name. By default, DAM uses the title that you provided as the folder name. Once the folder is created, you can override the default and specify another folder name.
1. Click **[!UICONTROL Create]**. Your folder is displayed in the digital assets folder.

![new asset folder is instantly displayed in the folder list](assets/create-asset-folder.png)

## Add CUG properties to folders {#add-cug-properties-to-folders}

You can limit who can access certain folders in Assets by making the folder part of a closed user group (CUG). To make a folder part of a CUG:

1. In Assets, right-click the folder you want to add closed user group properties for and select **[!UICONTROL Properties]**.  

1. Click the **[!UICONTROL CUG]** tab.

   ![chlimage_1-76](assets/chlimage_1-76.png)

1. Select the **[!UICONTROL Enabled]** check box to make the folder and its assets available only to a closed user group.  

1. Browse to the login page, if there is one, to add that information. Add admitted groups by clicking **[!UICONTROL Add item]**. If necessary, add the realm. Click **[!UICONTROL OK]** to save your changes.

## Use tags to organize assets {#use-tags-to-organize-assets}

You can use folders or tags or both to organize assets. Adding tags to assets makes them more easy to retrieve during a search. See [Tagging](/help/sites-authoring/tags.md) for more information on tagging.

To add tags to an asset:

1. In the Digital Asset Manager, double-click the asset to open it.
1. In the **[!UICONTROL Tags]** area, click the pop-up menu to reveal the available tags. Select tags as appropriate to add a tag. To delete a tag, hover the mouse over the tag and click the **x** to delete it.
1. Click **[!UICONTROL Save]** to save any tags you added.

![Apply tags to assets to organize and categorize them](assets/add-tags-to-assets.png)

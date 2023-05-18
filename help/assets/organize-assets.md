---
title: Organize your digital assets
description: Organize your digital assets, images, files, folders, and so on using Experience Manager.
contentOwner: AG
role: User
feature: Asset Management,Search
exl-id: d6f815b5-e4fc-4f8c-a6c1-9e50035ab9f2
hide: yes
---
# Organize your digital assets {#organize-digital-assets}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service  |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/assets/manage/organize-assets.html?lang=en)                  |
| AEM 6.5     | This article         |

All digital assets, metadata and content of Microsoft Office and PDF documents are extracted and made searchable. Search allows sophisticated filtering on assets and fully respects the proper permissions. Metadata is covered in detail in metadata in Digital Asset Management.

[!DNL Experience Manager Assets] supports multiple ways of organizing content. You can organize them in a hierarchical manner using folders or you can organize them in an unordered, ad-hoc manner, using for example tags. Users can edit tags in the DAM Asset Editor where sub-assets, renditions, and metadata are displayed.

## Organize assets in folders {#organize-using-folders}

The most basic way to organize assets is to save these in folders. It is analogous to organizing files in folders in our local filesystem. For more information about how to create and manage folders, see [Manage assets](manage-assets.md). How you name files and folders, how you arrange sub-folders, and how you handle the files within these folders can have a significant impact on how those assets are processed. By using consistent and appropriate file and folder naming strategies, along with good metadata practice, you can make the most of your digital assets repository.

* In most cases, your digital assets repository is always growing. Therefore, it is important to formalize metadata use, folder structure, and file naming early in the content creation cycle.
* Use folders only to impose a consistent storage structure for your digital assets. This consistency helps your process and manage your assets better. For example, assets placed in the following types of folders can help you use appropriate [profiles to use for asset processing](processing-profiles.md):

  * **Development folders**: contains digital assets that you are currently working on.
  * **Client folders**: contains digital assets based on clients or project names.
  * **Primary folders**: contains original, source digital assets.
  * **Rendition folders**: contains renditions and copies of the original, source digital assets.
  * **File Size folders**: contains digital assets based on small, medium, or large file sizes.
  * **Staging folders**: contains digital assets that are ready to publish live on your website.
  * **MIME type folders**: contains digital assets that are specific to MIME types such as images, documents, and multimedia.
  * **Archive folders**: contains retired digital assets.
  * **Date-based folders**: contains digital assets based on a creation date or a last modified date.

* Create a directory of folders that are not likely to change so that any customization or automation continues to work. For example, the assigned processing profiles continue to work.
* If an asset is already published, then you use [!DNL Experience Manager] to move the asset to another folder, and re-publish from its new location, the original published asset location is still available, along with the newly re-published asset. The original published asset, however, is *lost* to [!DNL Experience Manager] and cannot be unpublished. Therefore, as a best practice, first unpublish an asset and then move it to a different folder.

## Organize assets using tags {#use-tags-to-organize-assets}

Using tags, as a metadata, you can easily search assets, create collections using the search results, boost search ranking for some assets, and leverage AI algorithms of Adobe Sensei for asset discovery.

[!DNL Adobe Experience Manager Assets] uses a self-learning algorithm to create highly descriptive tags that allow you to find the right asset in just a few clicks. Smart tagging uses Adobe Sensei, our artificial intelligence and machine learning framework, which can be trained to recognize and apply both standard and business-specific tags to imagery. Smart Tags can also identify content, individual words, or phrases and automatically apply descriptive tags to assets

For more information, see the following articles:

* [About tags in Experience Manager](/help/sites-authoring/tags.md)
* [Edit asset metadata](metadata.md)
* [Enhanced Smart Tags in Assets](enhanced-smart-tags.md)

## Organize as collections {#organize-as-collections}

With asset collections in [!DNL Experience Manager Assets], you can streamline the ability to create, edit and share assets between users. Create several types of collections based on the way you use them, including collections that contain a static reference list of assets, folders and collections, as well as collections that pull in assets based on search criteria.  You also can create collections with assets from different locations and share them with multiple users with different levels of access, viewing and editing privileges.

For more information, see [manage collections](manage-collections.md)

<!-- TBD items: add screenshots where applicable
Any hints/recommendations of when to use what method of organizing? Some examples of how organizing helps towards a better taxonomy and improved content velocity.
Add back links to blog posts by marketing?
-->

## Organize your assets to use profiles {#organize-to-use-profiles}

A processing profile contains [!DNL Assets] processing commands that apply to assets that get uploaded to pre-defined folders. Profiles are used to automate the processing of contents of a folder or freshly uploaded assets. You can leverage profiles to organize your assets better.

Standardizing metadata usage, file naming, and folder structure ensures that as your pool of digital assets grows, you can apply processing profiles to folders with greater precision and consistency.

>[!MORELIKETHIS]
>
>* [Profiles to process metadata, images, and videos](processing-profiles.md).
>* [Metadata profiles](/help/assets/metadata-config.md#metadata-profiles).
>* [Video profiles](video-profiles.md).
>* [Dynamic Media image profiles](image-profiles.md).

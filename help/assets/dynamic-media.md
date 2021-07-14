---
title: Working with Dynamic Media
description: Learn how to use Dynamic Media to deliver assets for consumption on web, mobile, and social sites.
uuid: 4dc0f436-d20e-4e8b-aeff-5515380fa44d
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: introduction
content-type: reference
discoiquuid: a8063d43-923a-42ac-9a16-0c7fadd8f73f
role: User, Admin
exl-id: f8a80b22-b1a6-475f-b3f1-b2f47822f21d
feature: Collaboration,Asset Management
---
# Working with Dynamic Media {#working-with-dynamic-media}

[Dynamic Media](https://business.adobe.com/products/experience-manager/assets/dynamic-media.html) helps deliver rich visual merchandising and marketing assets on demand, automatically scaled for consumption on web, mobile, and social sites. Using a set of primary source assets, Dynamic Media generates and delivers multiple variations of rich content in real time through its global, scalable, performance-optimized network.

Dynamic media serves interactive viewing experiences, including zoom, 360-degree spin, and video. Dynamic media uniquely incorporates the workflows of the Adobe Experience Manager digital asset management (Assets) solution to simplify and streamline the digital campaign management process.

<!-- >ARTICLE IS MISSING. GIVES 404 [!NOTE]
>
>A Community article is available on [Working with Adobe Experience Manager and Dynamic Media](https://helpx.adobe.com/experience-manager/using/aem_dynamic_media.html). -->

## What you can do with Dynamic Media {#what-you-can-do-with-dynamic-media}

Dynamic Media lets you manage your assets before publishing them. How to work with assets in general is covered in detail in [Working with Digital Assets](manage-assets.md). General topics include uploading, downloading, editing, and publishing assets; viewing and editing properties, and searching for assets.

Dynamic Media-only features include the following:

* [Carousel Banners](carousel-banners.md)
* [Image Sets](image-sets.md)
* [Interactive Images](interactive-images.md)
* [Interactive Videos](interactive-videos.md)
* [Mixed Media Sets](mixed-media-sets.md)
* [Panoramic Images](panoramic-images.md)

* [Spin Sets](spin-sets.md)
* [Video](video.md)
* [Delivering Dynamic Media Assets](delivering-dynamic-media-assets.md)
* [Managing Assets](managing-assets.md)
* [Using Quickviews to create custom pop-ups](custom-pop-ups.md)

See also [Setting up Dynamic Media](administering-dynamic-media.md).

>[!NOTE]
>
>To understand the differences between using Dynamic Media and integrating Dynamic Media Classic with Adobe Experience Manager, see [Dynamic Media Classic integration versus Dynamic Media](/help/sites-administering/scene7.md#aem-scene-integration-versus-dynamic-media).

## Dynamic Media enabled versus Dynamic Media disabled {#dynamic-media-on-versus-dynamic-media-off}

You can tell whether Dynamic Media is enabled (turned on) by the following characteristics:

* Dynamic renditions are available when downloading or previewing assets.
* Image sets, spin sets, mixed media sets are available.
* PTIFF renditions are created.

When you click an image asset, the view of the asset is different with Dynamic Media [enabled](config-dynamic.md#enabling-dynamic-media). Dynamic Media uses the on-demand HTML5 viewers.

### Dynamic renditions {#dynamic-renditions}

Dynamic renditions such as image and viewer presets (under **[!UICONTROL Dynamic]**) are available when Dynamic Media is enabled.

![chlimage_1-358](assets/chlimage_1-358.png)

### Image sets, spins sets, mixed media sets {#image-sets-spins-sets-mixed-media-sets}

Image sets, spin sets, and mixed media sets are available if Dynamic Media is enabled.

![chlimage_1-359](assets/chlimage_1-359.png)

### PTIFF renditions {#ptiff-renditions}

Dynamic media enabled assets include `pyramid.tiffs`.

![chlimage_1-360](assets/chlimage_1-360.png)

### Asset views change {#asset-views-change}

With Dynamic Media enabled, you can zoom in and out by clicking the `+` and `-` buttons. You can also click/tap to zoom into certain area. Revert brings you to the original version and you can make the image full screen by clicking the diagonal arrows. Dynamic Media enabled looks like this:

![chlimage_1-361](assets/chlimage_1-361.png)

With Dynamic Media disabled you can zoom in and out and revert to the original size:

![chlimage_1-362](assets/chlimage_1-362.png)

---
title: About AEM Assets
seo-title: About AEM Assets
description: Learn what is digital asset management, its use cases, and Adobe's AEM Asset offering.
seo-description: Learn what is digital asset management, its use cases, and Adobe's AEM Asset offering.
uuid: f9c9e14c-65d1-45e5-9572-d3f908c84ea1
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
discoiquuid: 7c851395-5f10-4311-899a-e73328f57e85
---

# About Assets {#about-assets}

Assets is a Digital Asset Management (DAM) tool that is fully integrated with the AEM platform and enables your enterprise to share and distribute digital assets. Users across an organization can manage, store, and access images, videos, documents, audio clips, and rich media such as Flash files for use on the web, in print, and for digital distribution.

## What is Digital Asset Management? {#what-is-digital-asset-management}

Assets provides enterprise-wide sharing and distribution of an organization’s key digital assets. Users across an organization can store, manage, and access digital assets such as images, graphics, audio, video, and documents through a Web interface (or a CIFS or WebDAV folder).

Completely integrated into AEM, AEM Assets lets you do the following:

* Add and share images, documents, audio files, and video files in a variety of file formats.
* Manage assets by grouping them by tags, lightboxes, or stars (your favorites). Add annotations to assets.
* Find assets by searching file names, the full text of documents, and by searching dates, document type, and tags.
* Add or edit metadata information for assets. Metadata is automatically versioned together with the corresponding asset. You can import or export asset metadata. 
* Perform image editing functions such as scaling and adding image filters. Import and export multiple digital assets simultaneously using a WebDAV or CIFS folder. 
* Use workflows and notifications to allow joint processing and downloading of any set of assets and manage access rights to assets.

### AEM Assets fully integrated in CQ WCM {#aem-assets-fully-integrated-in-cq-wcm}

AEM Assets is fully integrated with CQ WCM and functionality is available using the DAM icon:

<!-- TBD: Update image for branding -->

![screen_shot_2012-04-17at15946pm](assets/screen_shot_2012-04-17at15946pm.png) ![screen_shot_2012-04-17at20100pm](assets/screen_shot_2012-04-17at20100pm.png)

Assets managed within CQ DAM can then be accessed via the content finder of WCM:

<!-- TBD: Update image for branding -->

![screen_shot_2012-04-17at20214pm](assets/screen_shot_2012-04-17at20214pm.png)

>[!NOTE]
>
>The basic navigation of user interface is the same as the rest of AEM - see [Overview of the GUI Console](/help/sites-authoring/qg-page-authoring.md) for full details.

### Digital Asset Management versus Image Component {#digital-asset-management-versus-image-component}

When determining whether to put an image into AEM Assets or use CQ's image component, consider the image lifecycle:

* If the image has the same lifecycle as the page, use the Image Component.
* If the image has a separate life cycle, for example, if you use the image twice or outside WCM, use AEM Assets.

## What are Digital Assets? {#what-are-digital-assets}

An asset is a digital document, image, video, or audio (or part thereof) that can have multiple renditions and can have sub-assets (for example, layers in a photoshop file, slides in a powerpoint file, pages in a pdf, files in a ZIP).

An asset is essentially a binary plus metadata plus renditions plus sub-assets. See the [DAM Performance Guide](/help/sites-deploying/assets-performance-sizing.md) for detailed information.

>[!CAUTION]
>
>Uploading and/or editing a large volume of assets (particularly images) can impact the performance of your CQ instance.

### AEM Assets Terminology {#aem-assets-terminology}

When working with digital assets in AEM, you need to understand the following terminology:

* **Collection:** A collection of assets, either based on physical location (folder), common properties (saved search folder), or user selection (lightbox folders).

* **Metadata:** Assets have metadata; for example, author, expiry date, DRM Information (Digital Rights Management), and so on. Metadata is under access control. AEM Assets supports the following various common metadata schemata out of the box:

  * **Dublin Core**: including author, description, date, subject, and so on.
  * **IPTC**: including event, model, location, and so on.
  * **WCM**: including page properties, on- and offtimes, and so on.

* **Tagging:** Assets can be tagged and classified. See Using Tags and Administering Tags.

* **Renditions:** A rendition is the binary representation of an asset. Assets always have a primary representation - that of the uploaded file. They can have any number of additional representations that are created, for example by customized workflow steps or when an asset is uploaded. Renditions may be of a different size, with a different resolution, with an added watermark, or some other changed characteristic.

* **Versions:** Versioning creates a snapshot of digital assets at a specific point in time. You can restore assets to previous versions. See Versioning in AEM Assets.

* **Sub-assets:** Sub-assets are assets that make up an asset, for example, layers in an Adobe Photoshop file or pages in a PDF file. In AEM Assets, you can manage sub-assets as you would assets.

### How to Work With Assets {#how-to-work-with-assets}

You perform an action on an asset or collection. Actions can create or modify assets, collections, and renditions. Many of the basic actions you perform on assets - upload, delete, update, save sub-assets - trigger preconfigured workflows. These are automatically turned on in AEM Assets and are described in detail in AEM Assets media handlers.

The tasks you can perform with these preconfigured workflows:

* Save the asset in, or delete the asset from, the repository.
* Extract, and save, metadata for the asset; the individual metadata items are saved as XMP.
* Generate renditions and thumbnails for the asset; including automatic resizing and cropping where necessary.
* Transcode the asset where necessary. For example, video for mobile and web usage is transcoded with 24 frames per second, download video with 30 frames per second. Audio for mobile and web usage is transcoded with 128 kbps, audio for download with 192 kbps.

Of course, you can apply workflows manually as well. See [AEM Assets Media Handlers](media-handlers.md)for a list of default workflows.

## AEM DAM and AEM MediaLibrary {#cq-dam-vs-cq-medialibrary}

See [AEM DAM and AEM MediaLibrary](medialibrary.md) for information on the differences.

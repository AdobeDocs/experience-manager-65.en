---
title: Introduction to [!DNL Adobe Experience Manager Assets]
description: Create, manage, process, and distribute digital assets in Experience Manager. These guides describe best practices, accessibility features, and how to use AEM 6.5 assets.
hide: yes
feature: Asset Management
role: Leader, Developer, User
exl-id: 68239634-a2e8-414e-a866-cd8082641ee8
solution: Experience Manager, Experience Manager Assets
---

# About [!DNL Adobe Experience Manager Assets] as a DAM solution {#administering-assets}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service  |    [Click here](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/assets/overview)                  |
| AEM 6.5     | This article         |

AEM [!DNL Assets] is a Digital Asset Management (DAM) tool that is a part of the [!DNL Experience Manager] platform and enables your enterprise to manage and distribute digital assets. Users across an organization can manage, store, and access many types of digital assets such as images, videos, documents, audio clips, 3D files, and rich media for use on the web, in print, and for digital distribution.

## What is Digital Asset Management? {#what-is-digital-asset-management}

[!DNL Assets] provides enterprise-wide sharing and distribution of an organization's key digital assets. Users across an organization can store, manage, and access digital assets such as images, graphics, audio, video, and documents through a Web interface (or a CIFS or WebDAV folder).

[!DNL Assets] capability of [!DNL Experience Manager] lets you do the following:

* Add and share images, documents, audio files, and video files in various file formats.
* Manage assets by grouping them by tags, lightbox, or stars (your favorites). Add annotations to assets.
* Find assets by searching file names, the full text of documents, and by searching dates, document type, and tags.
* Add or edit metadata information for assets. Metadata is automatically versioned together with the corresponding asset. You can import or export asset metadata.
* Perform image editing functions such as scaling and adding image filters. Import and export multiple digital assets simultaneously using a WebDAV or CIFS folder.
* Use workflows and notifications to allow joint processing and downloading of any set of assets and manage access rights to assets.

### [!DNL Experience Manager Assets] is integrated with [!DNL Experience Manager Sites] {#aem-assets-fully-integrated-in-cq-wcm}

[!DNL Assets] completely integrates with [!DNL Sites] and works seamlessly for all use cases. For example, when authoring web pages, the [!DNL Sites] authors can find and use the digital assets via the Content Finder. The user interface of [!DNL Assets] is the same as that of [!DNL Sites]. See an [overview of Sites](/help/sites-authoring/page-authoring.md) for full details.

The basic user interface is the same as that of [!DNL Sites]. See [Overview of the Sites](/help/sites-authoring/page-authoring.md) for full details.

### Digital Asset Management versus image component {#digital-asset-management-versus-image-component}

When determining whether to put an image into the DAM repository or use an image component, consider the image lifecycle:

* If the image has the same lifecycle as the page, use the Image component.
* If the image has a separate life cycle, for example, if you use the image twice or outside WCM, use [!DNL Assets].

## What are digital assets? {#what-are-digital-assets}

An asset is a digital document, image, video, or audio (or part thereof) that can have multiple renditions. It can also have sub-assets, for example, layers in a Photoshop file, slides in a PowerPoint file, pages in a pdf, files in a ZIP.

An asset is essentially a binary plus metadata plus renditions plus sub-assets. See the [DAM Performance Guide](/help/sites-deploying/assets-performance-sizing.md) for detailed information.

>[!CAUTION]
>
>Uploading and/or editing a large volume of assets (particularly images) can impact the performance of your [!DNL Experience Manager] deployment.

### [!DNL Experience Manager Assets] terminology {#aem-assets-terminology}

When working with digital assets in [!DNL Experience Manager], it helps if you understand the following terminology:

* **Collection**: A collection of assets, either based on physical location (folder), common properties (saved search folder), or user selection (lightbox folders).

* **Metadata** [!DNL Assets] have metadata; for example, author, expiry date, and DRM Information (Digital Rights Management). Metadata is under access control. [!DNL Assets] supports the following various common metadata schemata out of the box:

  * Dublin Core: including author, description, date, subject, and so on.
  * IPTC: including event, model, location, and so on.
  * WCM: including page properties, [!UICONTROL On Time] and [!UICONTROL Off Time], and so on.

* **Tagging**: [!DNL Assets] can be tagged and classified. See [organizing assets](/help/assets/organize-assets.md).

* **Renditions**: A rendition is the binary representation of an asset. [!DNL Assets] always have a primary representation - that of the uploaded file. They can have any number of additional representations that are created, for example, by customized workflow steps or when an asset is uploaded. Renditions may be of a different size, with a different resolution, with an added watermark, or some other changed characteristic.

* **Versions**: Versioning creates a snapshot of digital assets at a specific point in time. You can restore assets to previous versions. See [versioning in [!DNL Assets]](manage-assets.md#asset-versioning).

* **Sub-assets**: Sub-assets are assets that make up an asset, for example, layers in an [!DNL Adobe Photoshop] file or pages in a PDF file. In [!DNL Assets], you can manage sub-assets as you would assets.

### How to work with digital assets {#how-to-work-with-assets}

You perform an action on an asset or collection. Actions can create or modify assets, collections, and renditions. Many of the basic actions you perform on assets - upload, delete, update, save sub-assets - trigger pre-configured workflows. These are automatically turned on in [!DNL Assets] and are described in detail in [!DNL Assets] media handlers.

The tasks you can perform with these pre-configured workflows:

* Save the asset in, or delete the asset from, the repository.
* Extract, and save, metadata for the asset; the individual metadata items are saved as XMP.
* Generate renditions and thumbnails for the asset; including automatic resizing and cropping where necessary.
* Transcode the asset where necessary. For example, video for mobile and web usage is transcoded with 24 frames per second, download video with 30 frames per second. Audio for mobile and web usage is transcoded with 128 Kbps, audio for download with 192 Kbps.

You can apply workflows manually as well. See [Assets Media Handlers](media-handlers.md)for a list of default workflows.

## [!DNL Experience Manager Assets] and [!DNL Media Library] {#cq-dam-vs-cq-medialibrary}

See [Assets and Media Library](medialibrary.md) for information on the differences.

>[!MORELIKETHIS]
>
>* [Video Introduction - Experience Manager Assets as a modern DAM](https://www.youtube.com/watch?v=PBwQqZgC-yo)
>* [Understand metadata concepts](/help/assets/metadata-concepts.md)

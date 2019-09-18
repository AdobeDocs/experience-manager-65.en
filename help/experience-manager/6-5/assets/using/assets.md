---
title: Administering Assets
seo-title: Administering Assets
description: Learn about the activities typically performed by an AEM Assets administrator.
seo-description: Learn about the activities typically performed by an AEM Assets administrator.
uuid: 0185e283-9d62-489f-8eff-61205ee50e63
contentOwner: Chiradeep Majumdar
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: administering
content-type: reference
discoiquuid: 25bd6601-b03b-44f9-9617-f8400efdcc5e
index: y
internal: n
snippet: y
---

# Administering Assets{#administering-assets}

<!--
Comment Type: remark
Last Modified By: unknown unknown (ims-author-77F410094CD97C4F0A746C1B@AdobeID)
Last Modified Date: 2017-11-30T05:28:15.147-0500
<p>Needs to be rebranded to Assets. And text below needs updating.</p>
<p> </p>
<p>Really needs an update! </p>
-->

Assets is a digital asset management tool that is fully integrated with the AEM platform and enables your enterprise to share and distribute digital assets. Users across an organization can manage, store, and access images, videos, documents, audio clips, and rich media such as Flash files for use on the web, in print, and for digital distribution.

The following activities are those that you typically perform as a digital asset administrator:

* [AEM Assets vs. AEM MediaLibrary](../../../6-5/assets/using/medialibrary.md)
* [Assets Supported Formats](../../../6-5/assets/using/assets-formats.md)
* [Integrating AEM Assets with InDesign Server](../../../6-5/assets/using/indesign.md)
* [Managing Metadata for Digital Assets](/6-5/assets/using/metadata.md)
* [Search Facets](/6-5/assets/using/custom-search-facets.md)
* [Camera Raw Support](../../../6-5/assets/using/camera-raw.md)
* [Metadata Schemas](../../../6-5/assets/using/metadata-schemas.md)
* [Profiles for Processing Metadata, Images, and Videos](../../../6-5/assets/using/processing-profiles.md)
* [XMP writeback to renditions](../../../6-5/assets/using/xmp-writeback.md)
* [Installing and Configuring Video Transcoder with FFmpeg](/6-5/assets/using/video-transcoder.md)
* [Watermarking](../../../6-5/assets/using/watermarking.md)
* [Asset link sharing](../../../6-5/assets/using/link-sharing.md)
* [Best Practices for Assets](../../../6-5/assets/using/best-practices-for-assets.md)
* [Detecting MIME Type of Assets Using Apache Tika](/6-5/assets/using/detect-asset-mime-type-with-tika.md)
* [Configuring Asset Upload Restrictions](/6-5/assets/using/configuring-asset-upload-restrictions.md)
* [Using PDF Rasterizer](../../../6-5/assets/using/aem-pdf-rasterizer.md)
* [Multi-tenancy for Collections, Snippets, and Snippet TemplatesAsset Templates](/6-5/assets/using/multi-tenancy.md)
* [Support for IPTC Metadata](/6-5/assets/using/iptc-support.md)
* [Imaging Transcoding Library](../../../6-5/assets/using/imaging-transcoding-library.md)
* [Serial Uploads](/6-5/assets/using/serial-uploads.md)
* [Digital Rights Management in Assets](/6-5/assets/using/drm.md)

For supported file formats, see [Assets Supported Formats](../../../6-5/assets/using/assets-formats.md).

For information about extending CQ DAM, see [Customizing and Extending CQ DAM](/6-5/assets/using/extending-assets.md). To learn how authors add assets to web pages, see [Working with Assets](/6-5/assets/using/author-assets.md).

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

![](assets/screen_shot_2012-04-17at15946pm.png) ![](assets/screen_shot_2012-04-17at20100pm.png)

Assets managed within CQ DAM can then be accessed via the content finder of WCM:

![](assets/screen_shot_2012-04-17at20214pm.png)

>[!NOTE]
>
>The basic GUI handling is the same as the rest of WCM - see [Overview of the GUI Console](../../../6-5/sites/authoring/using/page-authoring.md) for full details.

### Digital Asset Management versus Image Component {#digital-asset-management-versus-image-component}

When determining whether to put an image into AEM Assets or use CQ's image component, consider the image lifecycle:

* If the image has the same lifecycle as the page, use the Image Component.
* If the image has a separate life cycle, for example, if you use the image twice or outside WCM, use AEM Assets.

## What are Digital Assets? {#what-are-digital-assets}

An asset is a digital document, image, video, or audio (or part thereof) that can have multiple renditions and can have sub-assets (for example, layers in a photoshop file, slides in a powerpoint file, pages in a pdf, files in a ZIP).

An asset is essentially a binary plus metadata plus renditions plus sub-assets. See the [DAM Performance Guide](/6-5/sites/deploying/using/assets-performance-sizing.md) for detailed information.

>[!CAUTION]
>
>Uploading and/or editing a large volume of assets (particularly images) can impact the performance of your CQ instance.

### AEM Assets Terminology {#aem-assets-terminology}

When working with digital assets in AEM, you need to understand the following terminology:

**Collection** A collection of assets, either based on physical location (folder), common properties (saved search folder), or user selection (lightbox folders).

**Metadata**

Assets have metadata; for example, author, expiry date, DRM Information (Digital Rights Management), and so on. Metadata is under access control. AEM Assets supports the following various common metadata schemata out of the box:

* Dublin Core: including author, description, date, subject, and so on.
* IPTC: including event, model, location, and so on.
* WCM: including page properties, on- and offtimes, and so on.

<!--
Comment Type: draft

<p>Metadata is covered in detail in <a href="/6-5/assets/using/metadata.md">Metadata for Digital Asset Management</a>.</p>
-->

<!--
Comment Type: remark
Last Modified By: unknown unknown (ltrielof)
Last Modified Date: 2017-11-30T05:28:15.442-0500
<p>I think we need a better guide to the supported metadata properties. I am thinking of going through all metadata properties that we support OOTB, writing a one-line description for each one and suggesting something along the lines: "If you need a description, use dc:description from the Dublin Core Namespace"</p>
-->

<!--
Comment Type: remark
Last Modified By: Alva Ware-Bevacqui (alvawb)
Last Modified Date: 2017-11-30T05:28:15.451-0500
<p>Maybe those descriptions can go in the Metadata for Digital Asset Management document?</p>
-->

**Tagging** Assets can be tagged and classified. See Using Tags and Administering Tags.

**Renditions** A rendition is the binary representation of an asset. Assets always have a primary representation - that of the uploaded file. They can have any number of additional representations that are created, for example by customized workflow steps or when an asset is uploaded. Renditions may be of a different size, with a different resolution, with an added watermark, or some other changed characteristic.

**Versions** Versioning creates a snapshot of digital assets at a specific point in time. You can restore assets to previous versions. See Versioning in AEM Assets.

**Sub-assets** Sub-assets are assets that make up an asset, for example, layers in an Adobe Photoshop file or pages in a PDF file. In AEM Assets, you can manage sub-assets as you would assets.

### How to Work With Assets {#how-to-work-with-assets}

You perform an action on an asset or collection. Actions can create or modify assets, collections, and renditions. Many of the basic actions you perform on assets - upload, delete, update, save sub-assets - trigger preconfigured workflows. These are automatically turned on in AEM Assets and are described in detail in AEM Assets media handlers.

The tasks you can perform with these preconfigured workflows:

* save the asset in, or delete the asset from, the repository.
* extract, and save, metadata for the asset; the individual metadata items are saved as XMP.
* generate renditions and thumbnails for the asset; including automatic resizing and cropping where necessary.
* transcode the asset where necessary. For example, video for mobile and web usage is transcoded with 24 frames per second, download video with 30 frames per second. Audio for mobile and web usage is transcoded with 128 kbps, audio for download with 192 kbps.

Of course, you can apply workflows manually as well. See [AEM Assets Media Handlers](/6-5/assets/using/media-handlers.md)for a list of default workflows.

## CQ DAM vs. CQ MediaLibrary {#cq-dam-vs-cq-medialibrary}

See [CQ DAM and the CQ MediaLibrary](../../../6-5/assets/using/medialibrary.md) for information on the differences.

<!--
Comment Type: remark
Last Modified By: Geoffroy Schneck (gschneck)
Last Modified Date: 2017-11-30T05:28:15.554-0500
<p>On the FAQ Above, "How can I prevent my users from using DAM if I did not license DAM?", there is still mention of the CQ 5.3 remove-dam package .<br /> <br /> This one has not been updated for CQ 5.4 and 5.5, see Bug #35137 .<br /> <br /> I then think this FAQ should be updated as well..</p>
<p></p>
-->


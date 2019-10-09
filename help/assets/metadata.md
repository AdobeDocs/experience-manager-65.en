---
title: Managing Metadata for Digital Assets
seo-title: Managing Metadata for Digital Assets
description: Learn about the types of metadata an how AEM Assets helps manage metadata for assets to allow easier categorization and organization of assets. With the ability to keep and manage arbitrary metadata with your assets, AEM Assets makes it possible to automatically organize and process assets based on their metadata.
seo-description: Learn about the types of metadata an how AEM Assets helps manage metadata for assets to allow easier categorization and organization of assets. With the ability to keep and manage arbitrary metadata with your assets, AEM Assets makes it possible to automatically organize and process assets based on their metadata.
uuid: 29215e51-b315-440a-9480-5b5a0ee76547
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
discoiquuid: 7acc1cab-d167-4299-bd13-8eb800a1112e
---

# Managing Metadata for Digital Assets {#managing-metadata-for-digital-assets}

Adobe Experience Manager (AEM) Assets keeps metadata for every asset. This allows for a easier categorization and organization of assets and it helps people who are looking for a specific asset. With the ability to extract metadata from files uploaded to AEM Assets, metadata management integrates with the creative workflow. With the ability to keep and manage arbitrary metadata with your assets, AEM Assets makes it possible to automatically organize and process assets based on their metadata. Finally AEM Assets end-user interface, the [DAM Finder](/help/sites-classic-ui-authoring/manage-assets-classic-using-share-page.md) can be [customized by site owners and developers](extending-assets.md)to reflect the metadata you are using in your organization.

* [XMP Metadata](xmp.md)
* [How to edit or add metadata](meta-edit.md)
* [Metadata Schemata Reference](meta-ref.md)

## Why we need metadata {#why-we-need-metadata}

Metadata means data about data. In this regard, data refers to the asset you are dealing with, for instance an image. Metadata is important because it allows users to manage assets more efficiently.

Metadata is the collection of all the data available for this image, but that is not necessarily contained in that image, for instance:

* the name of the asset
* the time and date it was last modified
* the size of the image as it was stored in the repository
* the name of the folder it is contained in

These are the basic metadata properties that AEM can manage for assets, which allows users to see all assets, for example, ordered by their last modification date - useful when trying to discover what assets have recently been added to the repository.

You can add more high-level data to digital assets, for example:

* the type of asset (is it an image, a video, an audio clip or a document?)
* the owner of the asset
* the title of the asset
* the description of the asset
* the tags that have been assigned to an asset

More metadata helps you further categorize assets and is helpful as the amount of digital information grows. While it is possible for a single person to manage a list of a few hundred files simply based on their file names, this approach falls short when the number of people involved and the number of assets managed grows.

As metadata is added to assets, the value of the asset grows, because the asset becomes

* more accessible - people can find it much easier
* easier to manage - you can find assets with the same set of properties easier and apply changes to them
* more complex - the more metadata you have added to an asset, the more important managing metadata becomes

For these reasons, AEM Assets provides you with the right means of creating, managing, and exchanging metadata for your digital assets.

## Metadata Basics {#metadata-basics}

Metadata is extracted from assets when they are imported (ingested). In addition, adding metadata helps you categorize assets even further.

This section covers the types of metadata and encoding standards.

### Types of metadata {#types-of-metadata}

There are two basic types of metadata:

* technical metadata
* descriptive metadata

#### Technical metadata {#technical-metadata}

Technical metadata is useful for software applications that are dealing with digital assets and should not be maintained manually. Technical metadata can be determined automatically by AEM Assets and other software and may change when the asset is modified. The available technical metadata of an asset depends largely on the file type of the asset. Examples of technical metadata are as follows:

* the size of a file
* the dimensions (height and width) of an image
* the bitrate of an audio- or video-file
* the resolution (level of detail) of an image

#### Descriptive metadata {#descriptive-metadata}

Descriptive metadata is metadata concerned with the application domain, for example, the business that an asset is coming from. Descriptive metadata cannot be determined automatically. It has to be created manually or semi-automatically. For instance, a GPS-enabled camera can automatically track the latitude and longitude an image was taken at and add this information to the image's metadata.

Because of the high cost of the manual effort required to create descriptive metadata information, standards have been established to ease the exchange of metadata across software systems and organizations.

AEM Assets supports all relevant standards for metadata management.

Because of the importance of metadata and the high manual involvement required to create metadata, standards have been established that make it easier to exchange.

### Encoding Standards {#encoding-standards}

There are a variety of ways that metadata can be embedded into files. A selection of encoding standards are supported:

* XMP: used by AEM Assets to store the extracted metadata within the repository.
* ID3: for audio and video files.
* EXIF: for image files.
* Other/Legacy: from Microsoft Word, Powerpoint, Excel and so on.

#### XMP {#xmp}

XMP means Extensible Metadata Platform and is the metadata standard that is used by AEM Assets for all metadata management. Besides offering universal metadata encoding that can be embedded into all file formats, XMP provides a rich content model and is supported by Adobe and other companies, so that users of XMP in combination with AEM Assets have a powerful platform to build upon.

#### ID3 {#id}

Data stored in these ID3 tags is displayed when you play back a digital audio file on either your computer or a portable MP3 player.

ID3 tags are designed for the MP3 file format. Additional information on formats:

* ID3 tags work in MP3 and MP3pro files.
* WAV has no tags.
* WMA has proprietary tags that does not allow open source implementation.
* Ogg Vorbis uses Xiph Comments embedded in the Ogg container.
* AAC uses a proprietary tagging format.

#### EXIF {#exif}

EXIF means Exchangeable image file format and is the most popular metadata format used in digital photography. It provides a way of embedding a fixed vocabulary of metadata properties in a number of file formats such as

* JPEG
* TIFF
* RIFF
* WAV

A major limitation of EXIF is that it is not supported by other popular image file formats such as BMP, GIF, or PNG.

EXIF stores metadata as pairs of a metadata name and a metadata value. These metadata name-value-pairs are also called tags, not to be confused with the tagging in AEM.

As EXIF is automatically created by modern digital cameras and supported through modern graphics software, it can be seen as the lowest common denominator for metadata management.

Most of the metadata fields defined by EXIF are of a highly technical nature and of limited use for descriptive metadata management. For this reason, AEM Assets offers mapping of EXIF properties into [common metadata schemata](metadata-schemas.md) and into [XMP](xmp-writeback.md), the powerful metadata format AEM Assets uses for metadata management.

#### Other Metadata {#other-metadata}

Other metadata that can be embedded from files include Microsoft Word, Powerpoint, Excel, and so on.

## Metadata Schemata {#metadata-schemata}

Metadata schemas are predefined sets of metadata property definitions that can be used in a wide variety of applications. Properties are always associated with an asset, meaning that the properties are “about” the resource.

You can also design your own metadata schemata if none exist that meet your needs (be careful, however, not to duplicate something that already exists). Within an organization, separating schemata makes it easier to share metadata among organizations.

AEM provides you with an out-of-the-box list of the most popular metadata schemata, allowing you to jumpstart your metadata strategy and pick the metadata properties that you need from an already-defined schemata.

The metadata schemata supported are listed in the following section.

### Standard Metadata {#standard-metadata}

* dc - Dublin Core - the most important and widely used set of metadata
* DICOM - Digital Imaging and Communications in Medicine
* Iptc4xmpCore & iptc4xmpExt - International Press Communications Standard - lots of subject-specific metdata
* rdf - Resource Description Framework - for generic semantic web metadata
* xmp - Extensible Metadata Platform
* xmpBJ - Basic Job Ticketing

### Application-Specific Metadata {#application-specific-metadata}

>[!NOTE]
>
>Application-specific metadata includes technical and descriptive metadata. If you use these, other applications may not be able to use the metadata. For example, if you have an asset with Adobe Photoshop metadata and another image-rendering application tries to access the metadata, it may not be able to.
>
>If you find that you have a lot of application-specific metadata in your assets, you can create a workflow step that changes the application-specific property to a standard one.

* acdsee - metadata managed by the ACDSee program [www.acdsee.com/](https://www.acdsee.com/)
* album - Adobe Photoshop Album
* cq - used by AEM Assets
* dam - used by AEM Assets
* dex - Optima SC Description Explorer
* crs - Adobe Photoshop Camera Raw
* lr - Adobe Lightroom
* mediapro - IView MediaPro
* MicrosoftPhoto & MP - Microsoft Photo
* pdf & pdfx
* photoshop & psAux - Adobe Photoshop

### Digital Rights Management Metadata {#digital-rights-management-metadata}

* cc - creative commons
* xmpRights
* plus - Picture Licensing Universal System - https://www.useplus.com/
* prism - https://www.idealliance.org/prism-metadata Publishing Requirements for Industry Standard Metadata
* prl - Prism Rights Language
* pur - Prism Usage Rights
* xmpPlus - integration of PLUS with XMP

### Photography-Specific Metadata {#photography-specific-metadata}

* exif - lots of technical information from camera, including GPS position
* crs - photoshop camera raw
* Iptc4xmpCore and iptc4xmpExt
* TIFF - image metadata (not only for TIFF images)

### Print-Specific Metadata {#print-specific-metadata}

* pdf and pdfx - Adobe PDF and third-party applications
* prism - [www.prismstandard.org](https://www.prismstandard.org) Publishing Requirements for Industry Standard Metadata
* xmp
* xmpPG - xmp for paged text

### Multimedia-Specific Metadata {#multimedia-specific-metadata}

* xmpDM - Dynamic Media
* xmpMM - Media Management

## Metadata-driven Workflows {#metadata-driven-workflows}

Creating metadata-driven workflows helps you automate some processes, which improved efficiency. In a metadata-driven workflow, the workflow management system reads the workflow and as a result performs some pre-defined action.

For example, some of the ways you could use metadata-driven workflows:

* The workflow can check whether an image has a title. If it does not, the system notifies a particular user to add a title.
* The workflow can check whether a copyright notice on an asset allows for distribution. If it does, the system sends the asset to one server. If it does not, the system sends the asset to another server.


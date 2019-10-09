---
title: XMP Metadata
seo-title: XMP Metadata
description: Learn about the XMP (Extensible Metadata Platform) metadata standard used by AEM Assets for metadata management. XMP provides a standard format for the creation, processing, and interchange of metadata for a wide variety of applications.
seo-description: Learn about the XMP (Extensible Metadata Platform) metadata standard used by AEM Assets for metadata management. XMP provides a standard format for the creation, processing, and interchange of metadata for a wide variety of applications.
uuid: ec27fdd7-4e5d-48fe-9acd-cbdf3a3450e5
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: administering
content-type: reference
discoiquuid: 7c7a9683-9c3a-4cc6-99c2-4749aeb14aa0
---

# XMP Metadata {#xmp-metadata}

XMP (Extensible Metadata Platform) is the metadata standard used by AEM Assets for all metadata management. XMP provides a standard format for the creation, processing, and interchange of metadata for a wide variety of applications.

Aside from offering universal metadata encoding that can be embedded into all file formats, XMP provides a rich [content model](xmp.md#xmp-core-concepts) and is [supported by Adobe](xmp.md#advantages-of-xmp) and other companies, so that users of XMP in combination with AEM Assets have a powerful platform to build upon.

The [XMP specification](https://www.adobe.com/devnet/xmp.html) is available from Adobe.

## What is XMP? {#what-is-xmp}

AEM Assets natively supports the XMP - the Extensible Metadata Platform spearheaded by Adobe. XMP is a standard for processing and storing standardized and proprietary metadata in digital assets. XMP is designed to be the common standard that allows multiple applications to work effectively with metadata.

Production professionals, for example, use the built-in XMP support within Adobe's applications to pass information across multiple file formats. The AEM Assets repository extracts the XMP metadata and uses it to manage the content lifecycle and offers the ability to create automation workflows.

XMP standardizes how metadata is defined, created, and processed by providing a data model, a storage model, and schemas. All of these concepts are covered in this section.

All legacy metadata from EXIF, ID3, or Microsoft Office is automatically translated to XMP, which can be extended to support customer-specific metadata schema, such as product catalogs.

Metadata in XMP consists of a set of properties. These properties are always associated with a  
particular entity referred to as a resource; that is, the properties are “about” the resource. In the case of XMP, the resource is always the asset.

### Adobe {#adobe}

Adobe first introduced the XMP standard as part of the Adobe Acrobat software product. Since then, the XMP standard has been widely adopted.

### XMP Ecosystem {#xmp-ecosystem}

XMP defines a [metadata](https://en.wikipedia.org/wiki/Metadata) model that can be used with any defined set of metadata items. XMP also defines particular [schemas](https://en.wikipedia.org/wiki/XML_schema) for basic properties useful for recording the history of a resource as it passes through multiple processing steps, from being photographed, [scanned](https://en.wikipedia.org/wiki/Image_scanner), or authored as text, through photo editing steps (such as [cropping](https://en.wikipedia.org/wiki/Cropping_%28image%29) or color adjustment), to assembly into a final image. XMP allows each software program or device along the way to add its own information to a digital resource, which can then be retained in the final digital file.

XMP is most commonly serialized and stored using a subset of the [W3C](https://en.wikipedia.org/wiki/World_Wide_Web_Consortium) [Resource Description Framework](https://en.wikipedia.org/wiki/Resource_Description_Framework) (RDF), which is in turn expressed in [XML](https://en.wikipedia.org/wiki/XML).

## Advantages of XMP {#advantages-of-xmp}

XMP has the following advantages over other encoding standards and schemata:

* XMP-based metadata is very powerful and fine-grained.   
* XMP lets you have multiple values for one property.
* XMP has standardized encoding, which lets you easily exchange metadata.
* XMP is extensible. You can add addtional information into your assets.

### Extensible {#extensible}

The XMP standard is designed to be extensible, allowing you to add custom types of metadata into the XMP data. EXIF, on the other hand, does not - it has a fixed list of properties that cannot be extended.

>[!NOTE]
>
>XMP generally does not allow binary data types to be embedded. To carry binary data in XMP, for example, thumbnail images, they must be encoded in an XML-friendly format such as Base64.

## XMP Core Concepts {#xmp-core-concepts}

The following sections describe the core concepts of XMP, including namespaces and schemata, properties and values, and language alternatives.

### Namespaces and Schemata {#namespaces-and-schemata}

An XMP schema is a set of property names in a common XML namespace that includes  
the data type and descriptive information. An XMP schema is identified by its XML namespace URI. Using namespaces prevents conflicts between properties in different schemas that have the same name but a different meaning.

For example, the **Creator** property in two independently designed schemas might mean the person who created the asset or it could mean the application that created the asset (for example, Adobe Photoshop).

### Properties and Values {#properties-and-values}

XMP may include properties from one or more of the schemas.

For example, a typical subset used by many Adobe applications might include the following:

* Dublin core schema: dc:title, dc:creator, dc:subject, dc:format, dc:rights
* XMP basic schema: xmp:CreateDate, xmp:CreatorTool, xmp:ModifyDate, xmp:metadataDate
* XMP rights management schema: xmpRights:WebStatement, xmpRights:Marked
* XMP media management schema: xmpMM:DocumentID

### Language Alternatives {#language-alternatives}

XMP offers you the ability to add an **xml:lang** property to text properties to specify the language of the text.  


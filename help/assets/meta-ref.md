---
title: Metadata schemata reference
description: Learn about standard conventions for describing asset metadata, including Dublin Core, IPTC, and other metadata schema. 
uuid: f37126b9-0f78-4621-b442-1ff5b2573275
contentOwner: AG
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: administering
content-type: reference
discoiquuid: 9a294f60-9004-40dd-a3f9-9dd151b6b1f2
docset: aem65

---

# Metadata schemata reference {#metadata-schemata-reference}

The following reference includes information about a particular metadata schemata (in alphabetical order) as well as a list of properties and their definitions.

## Dublin Core {#dublin-core}

Dublin Core metadata provides a standardized set of conventions for describing assets to make them easier to find. In AEM Assets, the Dublin Core describes digital assets including video, sound, images, and documents.

The simple Dublin Core Metadata Element Set (DCMES) contains 15 metadata elements as listed in the following table. Each Dublin Core element is optional and can be repeated. You can add or delete Dublin Core metadata information as you would for media type-specific metadata.

In addition to the DCMES, there are other metadata elements created by the Dublin Core Initiative. See the [Dublin Core Initiative](https://dublincore.org/) for more information.

| Property | Description |
|---|---|
| contributor | The person or company responsible for making contributions to the content. |
| coverage | The geographic location or time period that the asset covers. |
| creator | The person or company responsible for creating the content. |
| date | Date or period of time associated with the asset. |
| description | More information about the asset. |
| format | The file format, physical medium, or dimensions of the asset. AEM uses dc:format to denote the mime-type of the asset. |
| identifier | A unique reference to the asset. |
| language | The language of the asset (for example, en for English). |
| publisher | The person or company responsible for making the asset available. |
| relation | A related asset. |
| rights | Information about who has the rights to this asset. |
| source | A related asset from which the asset is derived. |
| subject | The topic of the asset. |
| title | A name for the asset. |
| type | The nature or genre of the asset. |

## IPTC {#iptc}

The International Press Telecommunications Council (IPTC) is a consortium of news agencies around the world - one of its goals is to develop and maintain technical standards. The IPTC defined a set of photo metadata standards for images that is almost universally accepted among photographers. These metadata standards were part of the broader standard known as the IPTC Information Interchange Model (IIM) created in the 1990s.

Although the IPTC header information has been mostly superseded by XMP, an IPTC core schema and an extension schema are available for XMP. In image programs, both XMP and IPTC properties are synchronized.

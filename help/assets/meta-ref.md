---
title: Metadata Schemata Reference
seo-title: Metadata Schemata Reference
description: Learn about standard conventions for describing asset metadata, including Dublin Core, IPTC, and other metadata schema. 
seo-description: Learn about standard conventions for describing asset metadata, including Dublin Core, IPTC, and other metadata schema. 
uuid: 842cce16-af42-470f-ae6b-976c41d6a25e
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: administering
content-type: reference
discoiquuid: 8a7dd9b0-7d41-491f-afc9-d9c59ffcb8ac
---

# Metadata Schemata Reference {#metadata-schemata-reference}

The following reference includes information about a particular metadata schemata (in alphabetical order) as well as a list of properties and their definitions.


## Dublin Core {#dublin-core}

Dublin Core metadata provides a standardized set of conventions for describing assets to make them easier to find. In AEM Assets, the Dublin Core describes digital assets including video, sound, images, and documents.

The simple Dublin Core Metadata Element Set (DCMES) contains 15 metadata elements as listed in the following table. Each Dublin Core element is optional and can be repeated. You can add or delete Dublin Core metadata information as you would for media type-specific metadata.

In addition to the DCMES, there are other metadata elements created by the Dublin Core Initiative. See the [Dublin Core Initiative](http://dublincore.org/) for more information.

<table> 
 <tbody>
  <tr>
   <td><strong>Property</strong></td> 
   <td><strong>Description</strong></td> 
  </tr>
  <tr>
   <td>contributor</td> 
   <td>The person or company responsible for making contributions to the content.</td> 
  </tr>
  <tr>
   <td>coverage</td> 
   <td>The geographic location or time period that the asset covers.<br /> </td> 
  </tr>
  <tr>
   <td>creator</td> 
   <td>The person or company responsible for creating the content.</td> 
  </tr>
  <tr>
   <td>date</td> 
   <td>Date or period of time associated with the asset.<br /> </td> 
  </tr>
  <tr>
   <td>description</td> 
   <td>More information about the asset.</td> 
  </tr>
  <tr>
   <td>format</td> 
   <td>The file format, physical medium, or dimensions of the asset. AEM uses <code>dc:format</code> to denote the mime-type of the asset.<br /> </td> 
  </tr>
  <tr>
   <td>identifier</td> 
   <td>A unique reference to the asset.</td> 
  </tr>
  <tr>
   <td>language</td> 
   <td>The language of the asset (for example, en for English).</td> 
  </tr>
  <tr>
   <td>publisher</td> 
   <td>The person or company responsible for making the asset available.</td> 
  </tr>
  <tr>
   <td>relation</td> 
   <td>A related asset.</td> 
  </tr>
  <tr>
   <td>rights</td> 
   <td>Information about who has the rights to this asset.</td> 
  </tr>
  <tr>
   <td>source</td> 
   <td>A related asset from which the asset is derived.</td> 
  </tr>
  <tr>
   <td>subject</td> 
   <td>The topic of the asset.<br /> </td> 
  </tr>
  <tr>
   <td>title</td> 
   <td>A name for the asset.</td> 
  </tr>
  <tr>
   <td>type</td> 
   <td>The nature or genre of the asset.</td> 
  </tr>
 </tbody>
</table>

## IPTC {#iptc}

The International Press Telecommunications Council (IPTC) is a consortium of news agencies around the world - one of its goals is to develop and maintain technical standards. The IPTC defined a set of photo metadata standards for images that is almost universally accepted among photographers. These metadata standards were part of the broader standard known as the IPTC Information Interchange Model (IIM) created in the 1990s.

Although the IPTC header information has been mostly superseded by XMP, an IPTC core schema and an extension schema are available for XMP. In image programs, both XMP and IPTC properties are synchronized.

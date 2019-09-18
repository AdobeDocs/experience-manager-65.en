---
title: Metadata Schemata Reference
seo-title: Metadata Schemata Reference
description: Learn about standard conventions for describing asset metadata, including Dublin Core, IPTC, and other metadata schema. 
seo-description: Learn about standard conventions for describing asset metadata, including Dublin Core, IPTC, and other metadata schema. 
uuid: 9e2b2c3a-56b4-485d-b4ff-ca6ef28fdb8b
contentOwner: Chiradeep Majumdar
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: administering
content-type: reference
discoiquuid: 8eb22ec5-5e1f-404c-9ee7-97480fb6628b
index: y
internal: n
snippet: y
---

# Metadata Schemata Reference{#metadata-schemata-reference}

The following reference includes information about a particular metadata schemata (in alphabetical order) as well as a list of properties and their definitions.

<!--
Comment Type: draft

<h3>CC</h3>
-->

<!--
Comment Type: draft

<table border="1" cellpadding="1" cellspacing="0" width="400">
<tbody>
<tr>
<td><strong>Property</strong></td>
<td><strong>Description</strong></td>
</tr>
<tr>
<td>License</td>
<td> </td>
</tr>
</tbody>
</table>
-->

### Dublin Core {#dublin-core}

Dublin Core metadata provides a standardized set of conventions for describing assets to make them easier to find. In AEM Assets, the Dublin Core describes digital assets including video, sound, images, and documents.

The simple Dublin Core Metadata Element Set (DCMES) contains 15 metadata elements as listed in the following table. Each Dublin Core element is optional and can be repeated. You can add or delete Dublin Core metadata information as you would for media type-specific metadata.

In addition to the DCMES, there are other metadata elements created by the Dublin Core Initiative. See the [Dublin Core Initiative](http://dublincore.org/) for more information.

<table border="1" cellpadding="1" cellspacing="0" width="400"> 
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
   <td>The file format, physical medium, or dimensions of the asset. AEM uses <span class="code">dc:format</span> to denote the mime-type of the asset.<br /> </td> 
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

<!--
Comment Type: draft

<h3>EXIF</h3>
-->

<!--
Comment Type: draft

<table border="1" cellpadding="1" cellspacing="0" width="400">
<tbody>
<tr>
<td><strong>Property</strong></td>
<td><strong>Description</strong></td>
</tr>
<tr>
<td>GPSAltitude</td>
<td> </td>
</tr>
<tr>
<td>GPSDestLatitude</td>
<td> </td>
</tr>
<tr>
<td>GPSDestLongitude</td>
<td> </td>
</tr>
<tr>
<td>ISO</td>
<td> </td>
</tr>
<tr>
<td>LightSource</td>
<td> </td>
</tr>
</tbody>
</table>
-->

### IPTC {#iptc}

The International Press Telecommunications Council (IPTC) is a consortium of news agencies around the world - one of its goals is to develop and maintain technical standards. The IPTC defined a set of photo metadata standards for images that is almost universally accepted among photographers. These metadata standards were part of the broader standard known as the IPTC Information Interchange Model (IIM) created in the 1990s.

Although the IPTC header information has been mostly superseded by XMP, an IPTC core schema and an extension schema are available for XMP. In image programs, both XMP and IPTC properties are synchronized.

<!--
Comment Type: draft

<h4>iptcCore</h4>
-->

<!--
Comment Type: draft

<table border="1" cellpadding="1" cellspacing="0" width="400">
<tbody>
<tr>
<td><strong>Property</strong></td>
<td><strong>Description</strong></td>
</tr>
<tr>
<td>CountryCode</td>
<td> </td>
</tr>
<tr>
<td>CreatorCity</td>
<td> </td>
</tr>
<tr>
<td>CreatorAddress</td>
<td> </td>
</tr>
<tr>
<td>CreatorPostalCode</td>
<td> </td>
</tr>
<tr>
<td>CreatorRegion</td>
<td> </td>
</tr>
<tr>
<td>CreatorWorkEmail</td>
<td> </td>
</tr>
<tr>
<td>CreatorWorkTelephone</td>
<td> </td>
</tr>
<tr>
<td>CreatorWorkURL</td>
<td> </td>
</tr>
<tr>
<td>IntellectualGenre</td>
<td> </td>
</tr>
<tr>
<td>Location</td>
<td> </td>
</tr>
<tr>
<td>Scene</td>
<td> </td>
</tr>
<tr>
<td>SubjectCode</td>
<td> </td>
</tr>
</tbody>
</table>
-->

<!--
Comment Type: draft

<h4>iptcExt</h4>
-->

<!--
Comment Type: draft

<table border="1" cellpadding="1" cellspacing="0" width="400">
<tbody>
<tr>
<td><strong>Property</strong></td>
<td><strong>Description</strong></td>
</tr>
<tr>
<td>License</td>
<td> </td>
</tr>
</tbody>
</table>
-->

<!--
Comment Type: draft

<p>iptcExt</p>
<p>- AdditionalModelInformation </p>
<p>- ArtworkCopyrightNotice </p>
<p>- ArtworkCreator </p>
<p>- ArtworkDateCreated </p>
<p>- ArtworkSource</p>
<p>- ArtworkSourceInventoryNo </p>
<p>- ArtworkTitle</p>
<p>- ControlledVocabularyTerm</p>
<p>- DigitalImageGUID</p>
<p>- DigitalSourceFileType</p>
<p>- Event</p>
<p>- LocationCreatedCity</p>
<p>- LocationCreatedCountryCode</p>
<p>- LocationCreatedCountryName</p>
<p>- LocationCreatedProvinceState</p>
<p>- LocationCreatedSublocation</p>
<p>- LocationCreatedWorldRegion</p>
<p>- LocationShownCity </p>
<p>- LocationShownCountryCode </p>
<p>- LocationShownCountryName </p>
<p>- LocationShownProvinceState </p>
<p>- LocationShownSublocation </p>
<p>- LocationShownWorldRegion</p>
<p>- MaxAvailHeight </p>
<p>- MaxAvailWidth </p>
<p>- ModelAge </p>
<p>- OrganisationInImageCode </p>
<p>- OrganisationInImageName</p>
<p>- PersonInImage</p>
<p>- RegistryItemID</p>
-->

<!--
Comment Type: draft

<h3>Plus</h3>
-->

<!--
Comment Type: draft

<table border="1" cellpadding="1" cellspacing="0" width="400">
<tbody>
<tr>
<td><strong>Property</strong></td>
<td><strong>Description</strong></td>
</tr>
<tr>
<td>License</td>
<td> </td>
</tr>
</tbody>
</table>
-->

<!--
Comment Type: draft

<p>AdultContentWarning</p>
<p>- CopyrightOwnerID</p>
<p>- CopyrightOwnerName</p>
<p>- CopyrightOwnerImageID</p>
<p>- CopyrightStatus</p>
<p>- EndUserID</p>
<p>- EndUserName</p>
<p>- FileNameAsDelivered</p>
<p>- ImageAlterationConstraints (colorization, cropping, de-colorization, flipping, merging, retouching)</p>
<p>- LicenseeID</p>
<p>- LicenseeName</p>
<p>- LicenseeEndDate</p>
<p>- LicenseeTransactionID</p>
<p>- LicenseStartDate</p>
<p>- LicenseTransactionDate</p>
<p>- LicensorCity</p>
<p>- LicensorCountry</p>
<p>- LicensorEmail</p>
<p>- LicensorExtendedAddress</p>
<p>- LicensorName</p>
<p>- LicensorPostalCode</p>
<p>- LicensorRegion</p>
<p>- LicensorStreetAddress</p>
<p>- LicensorTelephone1</p>
<p>- LicensorTelephone2</p>
<p>- LicensorURL</p>
<p>- MediaConstraints</p>
<p>- MediaSummaryCode</p>
<p>- ModelReleaseStatus</p>
<p>- Reuse</p>
<p>- TermsAndConditionsText</p>
<p>- TermsAndConditionsURL</p>
<p> </p>
-->

<!--
Comment Type: draft

<h3>Prism</h3>
-->

<!--
Comment Type: draft

<table border="1" cellpadding="1" cellspacing="0" width="400">
<tbody>
<tr>
<td><strong>Property</strong></td>
<td><strong>Description</strong></td>
</tr>
<tr>
<td>AggregationType</td>
<td> </td>
</tr>
</tbody>
</table>
-->

<!--
Comment Type: draft

<p>prism</p>
<p>- AggregationType</p>
<p>- AlternateTitle</p>
<p>- Channel</p>
<p>- ComplianceProfile</p>
<p>- CorporateEntity</p>
<p>- CoverDate</p>
<p>- CoverDisplayDate</p>
<p>- DateRecieved</p>
<p>- Distributor</p>
<p>- Edition</p>
<p>- EIssn</p>
<p>- EmbargoDate</p>
<p>- EndingPage</p>
<p>- Event</p>
<p>- ExpirationDate</p>
<p>- Genre</p>
<p>- HasAlternative</p>
<p>- HasCorrection</p>
<p>- HasPreviousVersion</p>
<p>- HasTranslation</p>
<p>- Industry</p>
<p>- ISBN</p>
<p>- IsCorrectionOf</p>
<p>- ISSN</p>
<p>- IssueIdentifier</p>
<p>- IssueName</p>
<p>- IsTranslationOf</p>
-->

<!--
Comment Type: draft

<h3>PRL</h3>
-->

<!--
Comment Type: draft

<table border="1" cellpadding="1" cellspacing="0" width="400">
<tbody>
<tr>
<td><strong>Property</strong></td>
<td><strong>Description</strong></td>
</tr>
<tr>
<td>Geography</td>
<td> </td>
</tr>
<tr>
<td>Usage</td>
<td> </td>
</tr>
</tbody>
</table>
-->

<!--
Comment Type: draft

<h3>Pur</h3>
-->

<!--
Comment Type: draft

<table border="1" cellpadding="1" cellspacing="0" width="400">
<tbody>
<tr>
<td><strong>Property</strong></td>
<td><strong>Description</strong></td>
</tr>
<tr>
<td>License</td>
<td> </td>
</tr>
</tbody>
</table>
-->

<!--
Comment Type: draft

<p>Agreement</p>
<p>- ExclusivityEndDate</p>
<p>- ImageSizeRestriction</p>
<p>- Restrictions</p>
<p>- ReuseProhibited</p>
<p>- UsageFee</p>
-->

<!--
Comment Type: draft

<h3>Tiff</h3>
-->

<!--
Comment Type: draft

<table border="1" cellpadding="1" cellspacing="0" width="400">
<tbody>
<tr>
<td><strong>Property</strong></td>
<td><strong>Description</strong></td>
</tr>
<tr>
<td>License</td>
<td> </td>
</tr>
</tbody>
</table>
-->

<!--
Comment Type: draft

<p>- ImageHeight</p>
<p>- ImageWidth</p>
<p>- Make</p>
<p>- Model</p>
<p>- Orientation</p>
<p>- XResolution</p>
<p>- YResolution</p>
<p>- ResolutionUnit</p>
-->

<!--
Comment Type: draft

<h3>XMP</h3>
-->

<!--
Comment Type: draft

<table border="1" cellpadding="1" cellspacing="0" width="400">
<tbody>
<tr>
<td><strong>Property</strong></td>
<td><strong>Description</strong></td>
</tr>
<tr>
<td>License</td>
<td> </td>
</tr>
</tbody>
</table>
-->

<!--
Comment Type: draft

<p>Advisory</p>
<p>- CreateDate</p>
<p>- CreatorTool</p>
<p>- Identifier</p>
<p>- Label</p>
<p>- MetadataDate</p>
<p>- ModifyDate</p>
<p>- Nickname</p>
<p>- Rating</p>
-->

<!--
Comment Type: draft

<h3>XMPDM</h3>
-->

<!--
Comment Type: draft

<table border="1" cellpadding="1" cellspacing="0" width="400">
<tbody>
<tr>
<td><strong>Property</strong></td>
<td><strong>Description</strong></td>
</tr>
<tr>
<td>License</td>
<td> </td>
</tr>
</tbody>
</table>
-->

<!--
Comment Type: draft

<p>- Album</p>
<p>- Artist</p>
<p>- AudioCompressor</p>
<p>- AudioSampleRate</p>
<p>- Composer</p>
<p>- ContributedMediaWebStatement</p>
<p>- DurationScale</p>
<p>- DurationValue</p>
<p>- Engineer</p>
<p>- Genre</p>
<p>- Instrument</p>
<p>- Key</p>
<p>- Loop</p>
-->

<!--
Comment Type: draft

<h3>Other Schemata</h3>
-->

<!--
Comment Type: draft

<p>There are hundreds of <a href="http://www.dlib.indiana.edu/~jenlrile/metadatamap/">additional standards</a> available.<br /> </p>
-->

<!--
Comment Type: remark
Last Modified By: Alva Ware-Bevacqui (alvawb)
Last Modified Date: 2018-01-05T16:19:24.827-0500
<p>We can add to this list later on. There are hundreds of standards, perhaps we can link to the <a href="http://www.dlib.indiana.edu/~jenlrile/metadatamap/">seeing standards poster</a>.<br /> </p>
<p>awb - link added</p>
-->


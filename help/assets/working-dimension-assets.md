---
title: Working with Adobe Dimension assets
seo-title: Working with Adobe Dimension assets
description: Working with Adobe Dimension assets in AEM 3D.
seo-description: Working with Adobe Dimension assets in AEM 3D.
uuid: 476e6758-b3a1-42ba-a18d-bfc407c6a72e
contentOwner: Rick Brough
topic-tags: 3D
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
content-type: reference
discoiquuid: 4a601c2a-4ea1-4308-8ae8-704155f63c21
---

# Working with Adobe Dimension assets {#working-with-adobe-dimension-assets}

The AEM 3D feature pack provides support for Adobe Dimension assets (`.dn` files) in AEM Assets , AEM Sites, and AEM Screens.

A new 3D viewer based on the glTF open standard provides preview and Sites and Screens viewing capabilities for Adobe Dimension assets.

## About the cloud-based conversion service {#about-the-cloud-based-conversion-service}

When a Dimension asset is uploaded to AEM, a copy of the file is forwarded to an Adobe-managed cloud-based service hosted in Amazon AWS. This service converts from the Adobe-proprietary Dimension file format to the open standard glTF format. The converted 3D model is packaged as a binary glTF (`.glb`). AEM stores the converted model with the primary Dimension asset as a rendition.

You can configure the `.glb` conversion format using one of two ways (see [Installing and configuring AEM 3D](install-config-3d.md) for instructions):

* Include Adobe-specific extensions to maximize the visual quality when using the Adobe glTF viewer to view Dimension assets in AEM Assets, AEM Sites, or AEM Screens. This makes the `.glb` renditions incompatible with most third-party applications.
* Exclude Adobe-specific extensions to achieve compatibility of the `.glb` rendition with third-party applications. This limits the visual quality when viewing in AEM Assets, AEM Sites, or AEM Screens (for example, no IBL lighting) to simulate the quality of typical third-party applications.

Transfer of the Dimension/glTF files to or from Amazon AWS and their temporary storage in AWS are fully secured. These files persist in Amazon AWS a minimal amount of time; typically, no more than a few minutes during normal operations.

To enable support for Dimension assets, you must obtain credentials from Adobe for accessing the conversion service. See [Installing and configuring AEM 3D](install-config-3d.md).

>[!NOTE]
>
>If you install and use the provided credentials, you understand and agree that your Adobe Dimension 3D assets will be transferred to--and processed by--the Adobe-managed, cloud-based conversion service hosted in Amazon AWS.

### Viewing on AEM Assets {#viewing-on-aem-assets}

The AEM 3D feature pack includes a new viewer based on the glTF open standard which is used to view Adobe Dimension assets. This viewer is selected automatically when opening a Dimension file or a zipped glTF into the Detail view in AEM Assets or with the 3D component in AEM Sites.

Note that the glTF viewer's user interface is somewhat different from the standard 3D viewer that is used for all other 3D asset types.

#### See also the following: {#see-also-the-following}

* [AEM 3D release notes](/help/release-notes/aem3d-release-notes.md) for restrictions and limitations applicable to Dn assets and the glTF viewer.
* [Working with the 3D Sites component](using-the-3d-sites-component.md) for component properties specific to Adobe Dimension assets.
* [Installing and configuring AEM 3D](install-config-3d.md) to configure the cloud-based conversion service.


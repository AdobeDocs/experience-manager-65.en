---
title: AEM Assets vs. AEM MediaLibrary
seo-title: AEM Assets vs. AEM MediaLibrary
description: Frequently asked questions around AEM Assets and. AEM Media Library, including differences between the two.
seo-description: Frequently asked questions around AEM Assets and. AEM Media Library, including differences between the two.
uuid: 61c4c12f-1d8c-4276-ab9d-3d9ed0a66542
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: administering
content-type: reference
discoiquuid: 7d81d7fd-27d1-4d87-9248-dfcf6c52ffb3
---

# AEM Assets vs. AEM MediaLibrary {#aem-assets-vs-aem-medialibrary}

Adobe Experience Manager (AEM) Assets is an integral part of the AEM platform. This smooth integration is seen as a major advantage of AEM and ensures consistency in content management and high productivity for content authors.

## Frequently asked questions {#frequently-asked-questions}

### What is AEM Assets? {#what-is-aem-assets}

AEM Assets is an application on the AEM Platform that allows our customers to manage their digital assets (images, videos, documents and audio clips) in a web-based repository. AEM Assets includes Metadata-support, Renditions, the Digital Asset Management Finder and the AEM Assets Administration UI.

### What is the AEM Media Library? {#what-is-the-aem-media-library}

The AEM Media Library is a designated part of the AEM WCM content repository where images and other shared resources are stored. The Media Library uses the Digital Asset Management capabilities of AEM WCM.

### What do I get from AEM Assets that is not part of AEM WCM? {#what-do-i-get-from-aem-assets-that-is-not-part-of-aem-wcm}

Unique features that are only available to customers of AEM Assets are:

1. the ability to extract and edit metadata other than title, tags and description.  
1. the AEM Assets Admin, available from the welcome screen by clicking the second button next to the siteadmin  
1. the Geometrixx Asset Share example DAM finder  
1. All components being used in the Geometrixx Asset Share - namely: Query Builder, Category Predicate, Date Predicate, Generic Predicate, Lens Deck, Mosaic Lens, List Lens, iFrame Lens and all Asset-related actions  
1. All workflow steps related to Digital Asset Management, namely AEM Assets Ingestion, AEM Assets Deletion, AEM Assets Sub-Asset-Handling, AEM Assets metadata extraction  
1. libraries including "dam" im package space

Using these features requires a valid license of AEM Assets.

### Is AEM Assets available as a separate Package? {#is-aem-assets-available-as-a-separate-package}

No. To ease installation and deployment, all AEM Applications and add-ons are delivered in one single package with all functionality included. This does not imply that you have permission to use all features in the package.

#### I want to edit metadata of digital assets. Do I need AEM Assets? {#i-want-to-edit-metadata-of-digital-assets-do-i-need-aem-assets}

If you are planning to edit metadata other than title, description and tags, it is required to license AEM Assets.

#### I want to use the category predicate on my website. Do I need AEM Assets? {#i-want-to-use-the-category-predicate-on-my-website-do-i-need-aem-assets}

Yes, the category predicate, together with all other components used in Geometrixx Press Center are part of AEM Assets and require an AEM Assets license.

#### I want to automatically resize images upon import. Do I need AEM Assets? {#i-want-to-automatically-resize-images-upon-import-do-i-need-aem-assets}

Yes. Image resizing and automatic workflow-driven transformation as well as the ability to manage renditions is part of AEM Assets and requires an AEM Assets license.

### I want to resize images using a customized image component. Do I need AEM Assets? {#i-want-to-resize-images-using-a-customized-image-component-do-i-need-aem-assets}

The image component is part of AEM WCM. The graphics library that is being used by the image component (but also by AEM Assets) is part of the AEM platform and does not require an AEM Assets license.

### How can I prevent my users from using AEM Assets if I did not license AEM Assets? {#how-can-i-prevent-my-users-from-using-aem-assets-if-i-did-not-license-aem-assets}

You can remove all AEM Assets-specific workflows, components, taxonomies, options and the AEM Assets admin from AEM. Doing so prevents your users from accidentially using AEM Assets features that you did not license.

### I want to add images to a page and want to crop and resize these images. Do I need AEM Assets? {#i-want-to-add-images-to-a-page-and-want-to-crop-and-resize-these-images-do-i-need-aem-assets}

For this use case it is not required to buy AEM Assets, even the use of the Media Library is not required to use images on a website as the smart image component allows uploading images directly into the page.

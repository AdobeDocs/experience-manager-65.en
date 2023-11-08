---
title: Adding Fonts for Graphic-Rendering
seo-title: Adding Fonts for Graphic-Rendering
description: AEM lets you generate graphics incorporating text dynamically taken from your content
seo-description: AEM lets you generate graphics incorporating text dynamically taken from your content
uuid: 67d9b10f-e986-4d29-bde2-10e08075fe17
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: platform
content-type: reference
discoiquuid: 6af48ef5-75e6-4b66-bc0d-ecf254b1c4ef
exl-id: 725c81d0-0258-4118-8b01-29fd7bcaf9b3
---
# Adding Fonts for Graphic-Rendering{#adding-fonts-for-graphic-rendering}

AEM lets you generate graphics incorporating text dynamically taken from your content.

To do this you can also load and use your own fonts.

Currently all implementations of the Java Platform support [TrueType](https://en.wikipedia.org/wiki/Truetype) fonts.

1. Open CRXDE Lite and navigate to your project application folder:

   `/apps/<your-project>/`

1. Under `/apps/<your-project>/` create a node:

    * **Name**: `fonts`
    * **Type**: `sling:Folder`

   Save all changes.

1. Copy the font files into this folder; for example, using WebDAV.

   >[!NOTE]
   >
   >Font files in the repository must have the suffix `*.ttf` or `*.TTF`.

1. Update the [OSGi configuration](/help/sites-deploying/configuring-osgi.md) of [Day Commons GFX Font Helper](/help/sites-deploying/osgi-configuration-settings.md). Add the path to your fonts folder; that is, `/apps/<your-project>/fonts`.

1. Return to CRXDE Lite. You should now see a `.fontlist` node in your folder containing the name of the imported fonts.

   These fonts are now ready to be used in the Java API.

For full details of how to use the fonts with the Java API, see the [documentation for the Font class of the Java API](https://download.oracle.com/javase/6/docs/api/java/awt/Font.html).

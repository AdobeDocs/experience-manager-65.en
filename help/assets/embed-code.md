---
title: Embedding the Dynamic Media Video or Image viewer on a web page
seo-title: Embedding the Dynamic Media Video or Image viewer on a web page
description: Learn how to embed Dynamic Media video or images on a web page
seo-description: Learn how to embed Dynamic media video or images on a web page
uuid: 6f786521-eb6c-4c80-8c15-9bf97b56818f
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
discoiquuid: 4ae76d8a-208f-4099-9f17-a94df424685e
---

# Embedding the Dynamic Media Video or Image viewer on a web page {#embedding-the-video-or-image-viewer-on-a-web-page}

Use the **[!UICONTROL Embed Code]** feature when you want to play the video or view an asset embedded on a web page. You copy the embed code to the clipboard so you can paste it in your web pages. Editing of the code is not permitted in the **[!UICONTROL Embed Code]** dialog box.

You embed URLs only if you are _not_ using AEM as your WCM. If you are using AEM as your WCM, [you add the assets directly on your page.](adding-dynamic-media-assets-to-pages.md)

See [Linking URLs to your Web Application.](linking-urls-to-yourwebapplication.md)

See [Delivering Optimized Images for a Responsive Site.](responsive-site.md)

>[!NOTE]
>
>The embed code is not available to copy until you have published the selected asset. In addition, you must also publish the viewer preset or image preset.
>
>See [Publishing Assets](publishing-dynamicmedia-assets.md).
>
>See [Publishing Viewer Presets](managing-viewer-presets.md#publishing-viewer-presets).
>
>See [Publishing Image Presets](managing-image-presets.md#publishing-image-presets).

**To embed the Dynamic Media Video or Image viewer on a web page**

1. Navigate to the *published* video or image asset whose embed code you want to copy.

   Remember that the embed code is only available to copy *after* you have first *published* the assets. In addition, the viewer preset or image preset must also be published.

   See [Publishing Assets.](publishing-dynamicmedia-assets.md)

   See [Publishing Viewer Presets](managing-viewer-presets.md#publishing-viewer-presets).

   See [Publishing Image Presets](managing-image-presets.md#publishing-image-presets).

1. In the left rail, select the drop-down menu and tap **[!UICONTROL Viewers]**.
1. In the left rail, tap a viewer preset name. The viewer preset is applied to the asset.
1. Tap **[!UICONTROL Embed]**.
1. In the **[!UICONTROL Embed Code]** dialog box, copy the entire code to the clipboard, and then tap **[!UICONTROL Close]**.
1. Paste the embed code into your web pages.

## Using HTTP/2 to deliver your Dynamic Media assets {#using-http-to-deliver-your-dynamic-media-assets}

HTTP/2 is the new, updated web protocol that improves the way browsers and servers communicate. It provides faster transfer of information and reduces the amount of processing power that is needed. Delivery of Dynamic Media assets can now be over HTTP/2 which provides better response and load times.

See [HTTP2 Delivery of Content](http2.md) for complete details on getting started using HTTP/2 with your Dynamic Media account.

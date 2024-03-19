---
title: Embed the Dynamic Media Video, Image viewer, or Dimensional viewer on a web page
description: Learn how to embed Dynamic Media video, images, or 3D images on a web page
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
feature: Viewers
role: User, Admin
exl-id: 203ea349-ef4c-421c-b4b6-76ee9d46ec34
solution: Experience Manager, Experience Manager Assets
---
# Embed the Dynamic Media Video, Image viewer, or Dimensional viewer on a web page {#embedding-the-video-or-image-viewer-on-a-web-page}

Use the **[!UICONTROL Embed Code]** feature when you want to play the video or view an asset embedded on a web page. You copy the embed code to the clipboard so you can paste it in your web pages. Editing of the code is not permitted in the **[!UICONTROL Embed Code]** dialog box.

You embed URLs only if you are *not* using Adobe Experience Manager as your WCM. If you are using Experience Manager as your WCM, [you add the assets directly on your page](adding-dynamic-media-assets-to-pages.md).

See [Link URLs to your Web Application](linking-urls-to-yourwebapplication.md).

See [Deliver optimized images for a responsive site](responsive-site.md).

>[!NOTE]
>
>The embed code is not available to copy until you have published the selected asset. In addition, you must also publish the viewer preset or image preset.
>
>See [Publish assets](publishing-dynamicmedia-assets.md).
>
>See [Publish Viewer Presets](managing-viewer-presets.md#publishing-viewer-presets).
>
>See [Publish Image Presets](managing-image-presets.md#publishing-image-presets).

**To embed the Dynamic Media Video, Image viewer, or Dimensional viewer on a web page:**

1. Navigate to the *published* video or image asset whose embed code you want to copy.

   Remember that the embed code is only available to copy *after* you have first *published* the assets. In addition, the viewer preset or image preset must also be published.

   See [Publish assets](publishing-dynamicmedia-assets.md).

   See [Publish Viewer Presets](managing-viewer-presets.md#publishing-viewer-presets).

   See [Publish Image Presets](managing-image-presets.md#publishing-image-presets).

1. In the left rail, select the drop-down menu and select **[!UICONTROL Viewers]**.
1. In the left rail, select a viewer preset name. The viewer preset is applied to the asset.
1. Select **[!UICONTROL Embed]**.
1. In the **[!UICONTROL Embed Code]** dialog box, copy the entire code to the clipboard, and then select **[!UICONTROL Close]**.
1. Paste the embed code into your web pages.

## Using HTTP/2 to deliver your Dynamic Media assets {#using-http-to-deliver-your-dynamic-media-assets}

HTTP/2 is the new, updated web protocol that improves the way browsers and servers communicate. It provides faster transfer of information and reduces the amount of processing power that is needed. Delivery of Dynamic Media assets can now be over HTTP/2 which provides better response and load times.

See [HTTP2 Delivery of Content](http2.md) for complete details on getting started using HTTP/2 with your Dynamic Media account.

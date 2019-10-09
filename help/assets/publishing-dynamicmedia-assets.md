---
title: Publishing Dynamic Media Assets
seo-title: Publishing Dynamic Media Assets
description: How to publish dynamic media assets
seo-description: How to publish dynamic media assets
uuid: b1bee905-86cf-4284-8d4e-067e11557899
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
discoiquuid: 99d7025f-d022-4213-83c0-815a4712c573
---

# Publishing Dynamic Media Assets {#publishing-dynamic-media-assets}

You publish your Dynamic Media assets by selecting the assets and tapping **[!UICONTROL Publish]**. After your dynamic media assets are published, they are available to you for including in a web page via URL or by way of embedding.

You can also instantly publish assets that you upload&mdash;without any user intervention. See [Configuring Dynamic Media - Scene7 mode](config-dms7.md).

In the **[!UICONTROL Card View]**, a small globe icon appears directly below an asset's name to indicate that it is published. In the **[!UICONTROL List View]**, a **[!UICONTROL Published]** column indicates which assets are published or which are not.

>[!NOTE]
>
>If an asset is already published, then you use AEM to move the asset to another folder, and re-publish from its new location, the original published asset location is still available, along with the newly re-published asset. The original published asset, however, is "lost" to AEM and cannot be unpublished. Therefore, as a best practice, unpublish assets first before you move them to a different folder.

If you intend to publish video assets immediately after encoding them, make sure encoding is completely done. When videos are still being encoded, the system lets you know that a video processing workflow is in progress. When video encoding is done, you should be able to preview the video renditions. At that point, it is safe for you to publish the videos without incurring any publishing errors.

See also [Linking URLs to your Web Application](linking-urls-to-yourwebapplication.md).

See also [Embedding the Video Viewer on a Web Page.](embed-code.md)

>[!NOTE]
>
>* Assets must be published in order to use the URL. If the assets are not published, copying and pasting the URL into a web browser will not work.
>* Image presets and viewer presets must be activated and published for live delivery.
>

For detailed information on publishing a set or asset, see [Publishing Assets.](managing-assets-touch-ui.md)

## HTTP/2 delivery of Dynamic Media assets {#http-delivery-of-dynamic-media-assets}

AEM now supports the delivery of all Dynamic Media content (images and video) over HTTP/2. That is, a published URL or embed code for the image or video is available to be integrated with any application that accepts a hosted asset. That published asset is then delivered by way of HTTP/2 protocol. This method of delivery improves the way browsers and servers communicate, allowing for better response and load times of all your Dynamic Media assets.

See [HTTP/2 delivery of content frequently asked questions](/help/sites-administering/scene7-http2faq.md) to learn more.

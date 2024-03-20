---
title: Publishing Dynamic Media Assets
description: Learn how to publish Dynamic Media assets, such as videos and images, including the HTTP/2 delivery of such assets. 
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
role: User, Admin
exl-id: 750627fc-2a29-43ff-867e-55cb2e371043
feature: Publishing
solution: Experience Manager, Experience Manager Assets
---
# Publish Dynamic Media assets {#publishing-dynamic-media-assets}

You publish your Dynamic Media assets by selecting the assets you have already uploaded and tapping **[!UICONTROL Publish]** or **[!UICONTROL Quick Publish]**. After your Dynamic Media assets are published, they are available to you for including in a web page by way of a URL or by embedding the code on the web page.

You can also instantly publish assets that you upload &ndash; without any user intervention. See [Configure Dynamic Media - Scene7 mode](config-dms7.md).
Or, you can selectively publish assets to either Dynamic Media or Adobe Experience Manager, mutually exclusive of each other, using **[!UICONTROL Selective Publish]** at the folder level. See [Work with Selective Publish in Dynamic Media](/help/assets/selective-publishing.md).

In the **[!UICONTROL Card View]**, a small globe icon appears directly below an asset's name and to the left of the date and time to indicate that it is published. In the **[!UICONTROL List View]**, a **[!UICONTROL Published]** column indicates which assets are published or which are not.

>[!NOTE]
>
>If an asset is already published, use Experience Manager to move the asset to another folder, and republish from its new location. The original published asset location is still available, along with the newly republished asset. The original published asset, however, is "lost" to Experience Manager and cannot be unpublished. Therefore, as a best practice, unpublish assets first before you move them to a different folder.

If you intend to publish video assets immediately after encoding them, make sure that encoding is done. While videos are being encoded, the system lets you know that a video processing workflow is in progress. When video encoding is done, you can preview the video renditions. At that point, it is safe for you to publish the videos without incurring any publishing errors.

See also [Link URLs to your Web Application](linking-urls-to-yourwebapplication.md).

See also [Embed the Dynamic Media Video or Image viewer on a web page](embed-code.md)

>[!NOTE]
>
>* Assets must be published to use the URL. If the assets are not published, copying, and pasting the URL into a web browser does not work.
>* Image presets and viewer presets must be activated and published for live delivery.
>

For detailed information on publishing a set or asset, see [Publish assets](manage-assets.md).

## HTTP/2 delivery of Dynamic Media assets {#http-delivery-of-dynamic-media-assets}

Experience Manager now supports the delivery of all Dynamic Media content (images and video) over HTTP/2. That is, a published URL or embed code for the image or video is available to be integrated with any application that accepts a hosted asset. That published asset is then delivered by way of HTTP/2 protocol. This method of delivery improves the way browsers and servers communicate, allowing for better response and load times of all your Dynamic Media assets.

To learn more, see [HTTP/2 delivery of content frequently asked questions](/help/sites-administering/scene7-http2faq.md).

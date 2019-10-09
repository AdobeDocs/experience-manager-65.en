---
title: Video renditions
seo-title: Video renditions
description: null
seo-description: null
uuid: a02f9ec1-30d9-4cbb-8746-8391ac614f0a
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: managing-assets
content-type: reference
discoiquuid: 1601b473-7227-4a56-bb7c-289de2987e4b
---

# Video renditions {#video-renditions}

Adobe Experience Manager (AEM) Assets generates video renditions for video assets of various formats including OGG, FLV, and so on.

AEM Assets supports static and dynamic renditions (DM-encoded renditions) for media assets.

Static renditions are generated natively using FFMPEG (installed and available on the system path) and stored in the content repository.

The DM-encoded renditions are stored in the proxy server and served at runtime.

AEM assets provide playback support for these renditions on the client side.

To view the renditions of a particular video asset, open its asset page, and tap the Global Navigation icon. Then, choose **[!UICONTROL Renditions]** from the list.

![chlimage_1-478](assets/chlimage_1-478.png)

The list of video renditions are displayed in the **[!UICONTROL Renditions]** panel. 

![chlimage_1-479](assets/chlimage_1-479.png)

To configure the proxy server for DM-encoded renditions, [configure Dynamic Media Cloud services.](config-dynamic.md)

To generate video renditions with desired parameters, [create a corresponding video profile](video-profiles.md).

After you configure the proxy server and create video profiles, you can include this video preset in a processing profile and apply the processing profile to a folder.

>[!NOTE]
>
>Audio playback do not work for OGG and WAV files on Internet Explorer 11. An error "Invalid Source " shows up on the asset details page for assets with extension OGG or WAV.
>
>On MS Edge and iPad , OGG files do not play and raise an Unsupported format error.


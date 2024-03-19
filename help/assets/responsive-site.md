---
title: Delivering Optimized Images for a Responsive Site
description: How to use the responsive code feature to deliver optimized images
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
feature: Asset Management
role: User, Admin
exl-id: 753d806f-5f44-4d73-a3a3-a2a0fc3e154b
solution: Experience Manager, Experience Manager Assets
---
# Deliver optimized images for a responsive site {#delivering-optimized-images-for-a-responsive-site}

Use the Responsive code feature when you want to share the code for responsive serving with your web developer. You copy the responsive (**[!UICONTROL RESS]**) code to the clipboard so you can share it with the web developer.

This feature makes sense to use if your website is on a third-party WCM. However, if your website is on Adobe Experience Manager instead, an offsite image server renders the image and supplies it to the web page.

See also [Embed the Video Viewer on a Web Page](embed-code.md).

See also [Link URLs to your Web Application](linking-urls-to-yourwebapplication.md).

**To deliver optimized images for a responsive site:**

1. Navigate to the image you want supply responsive code for and in the drop-down menu, select **[!UICONTROL Renditions]**.

   ![chlimage_1-408](assets/chlimage_1-408.png)

1. Select a responsive image preset. The **[!UICONTROL URL]** and **[!UICONTROL RESS]** buttons appear.

   ![chlimage_1-409](assets/chlimage_1-208.png)

   >[!NOTE]
   >
   >The selected asset *and* the selected image preset or viewer preset must be published to make the **[!UICONTROL URL]** or **[!UICONTROL RESS]** buttons available.
   >
   >Dynamic Media - Hybrid mode requires you to publish image presets; Dynamic Media - Scene7 mode automatically publishes image presets.

1. Select **[!UICONTROL RESS]**.

    ![chlimage_1-410](assets/chlimage_1-410.png)

1. In the **[!UICONTROL Embed Responsive Image]** dialog box, select, and copy the responsive code text and paste it in your web site to access the responsive asset.
1. Edit the default breakpoints in the embed code to match the breakpoints of the responsive web site, directly in the code. In addition, test the different image resolutions being served at different page breakpoints.

## Use HTTP/2 to delivery your Dynamic Media assets {#using-http-to-delivery-your-dynamic-media-assets}

HTTP/2 is the new, updated web protocol that improves the way browsers and servers communicate. It provides faster transfer of information and reduces the amount of processing power that is needed. Delivery of Dynamic Media assets is supported using HTTP/2 which provides better response and load times.

See [HTTP2 Delivery of Content](http2.md) for complete details on getting started using HTTP/2 with your Dynamic Media account.

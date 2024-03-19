---
title: Deliver Dynamic Media assets
description: Learn how to deliver Dynamic Media assets, such as video and images, to your web pages.
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
docset: aem65
role: User, Admin
exl-id: 274af114-845a-46bd-b091-802cf589687a
feature: Asset Management,Renditions
solution: Experience Manager, Experience Manager Assets
---
# Deliver Dynamic Media assets{#delivering-dynamic-media-assets}

How you can deliver your Dynamic Media assets - both video and images - depends on how your website is implemented.

With Dynamic Media, you have several options:

* If your website is hosted on Adobe Experience Manager, then you want to add the Dynamic Media assets directly to your page.
* If your website is not on Experience Manager, then you have the choice of either:

  * Embedding your video or image on your website.
  * Link URLs to your web application. Use linking when you want to deliver a video player as a pop-up or modal window.
  * If your site is responsive, you can [deliver optimized images](/help/assets/responsive-site.md).

>[!NOTE]
>
>Smart imaging works with your existing image presets and uses intelligence at the last millisecond of delivery to further reduce image file size based on browser or network connection speed. See [Smart Imaging](/help/assets/imaging-faq.md) for more information.

For more information, see the following topics:

* [Add Dynamic Media assets to web pages](/help/assets/adding-dynamic-media-assets-to-pages.md)
* [Embed the Video or Image Viewer on a web page](/help/assets/embed-code.md)
* [Activate hotlink protection in Dynamic Media](/help/assets/hotlink-protection.md)
* [Link URLs to your web application](/help/assets/linking-urls-to-yourwebapplication.md)
* [Deliver optimized images for a responsive site](/help/assets/responsive-site.md)
* [HTTP2 delivery of content](/help/assets/http2.md)
* [Invalidate your CDN cache by way of Dynamic Media Classic](/help/assets/invalidate-cdn-cache-dm-classic.md)
* [Use Rulesets to transform URLs](/help/assets/using-rulesets-to-transform-urls.md)


## HTTP/2 delivery of Dynamic Media assets {#http-delivery-of-dynamic-media-assets}

Experience Manager now supports the delivery of all Dynamic Media content (images and video) over HTTP/2. That is, a published URL or embed code for the image or video is available to be integrated with any application that accepts a hosted asset. That published asset is then delivered by way of HTTP/2 protocol. This method of delivery improves the way browsers and servers communicate, allowing for better response and load times of all your Dynamic Media assets.

To learn more, see [HTTP/2 delivery of content frequently asked questions](/help/sites-administering/scene7-http2faq.md).

---
title: Delivering Dynamic Media Assets
seo-title: Delivering Dynamic Media Assets
description: Learn how to deliver dynamic media assets
seo-description: Learn how to deliver dynamic media assets
uuid: e87754a9-4c34-4658-9971-cd7ceb26523f
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: dynamic-media
content-type: reference
discoiquuid: ec394bd3-2fa6-4f50-b974-bc10f643ecac
---

# Delivering Dynamic Media Assets {#delivering-dynamic-media-assets}

How you can deliver your dynamic media assets - both video and images - depends on how your website is implemented.

With Dynamic Media you have several options:

* If your website is hosted on AEM, then you want to add the dynamic media assets directly to your page. 
* If your website is not on AEM, then you have the choice of either:

    * Embedding your video or image on your website.
    * Link URLs to your web application. Use linking when you want to deliver a video player as a pop-up or modal window.
    * If your site is responsive, you can [deliver optimized images.](responsive-site.md)

>[!NOTE]
>
>Smart imaging works with your existing image presets and uses intelligence at the last millisecond of delivery to further reduce image file size based on browser or network connection speed. See [Smart Imaging](imaging-faq.md) for more information.

For more information, see the following topics:

* [Adding Dynamic Media Assets to web pages](adding-dynamic-media-assets-to-pages.md)
* [Embedding the Video or Image Viewer on a web page](embed-code.md)
* [Activating hotlink protection in Dynamic Media](https://helpx.adobe.com/experience-manager/6-4/assets/using/hotlink-protection.html)
* Integrating digital non-visible watermarking (Digimarc) with Dynamic Media (coming soon)  
* [Linking URLs to your web application](linking-urls-to-yourwebapplication.md)
* [Delivering optimized images for a responsive site](responsive-site.md)
* [HTTP2 delivery of content](http2.md)
* [Invalidating your CDN cached content](invalidate-cdn-cached-content.md)
* [Using Rulesets to transform URLs](using-rulesets-to-transform-urls.md)

## HTTP/2 delivery of Dynamic Media assets {#http-delivery-of-dynamic-media-assets}

AEM now supports the delivery of all Dynamic Media content (images and video) over HTTP/2. That is, a published URL or embed code for the image or video is available to be integrated with any application that accepts a hosted asset. That published asset is then delivered by way of HTTP/2 protocol. This method of delivery improves the way browsers and servers communicate, allowing for better response and load times of all your Dynamic Media assets.

See [HTTP/2 Delivery of Content Frequently Asked Questions](/help/sites-administering/scene7-http2faq.md) to learn more.

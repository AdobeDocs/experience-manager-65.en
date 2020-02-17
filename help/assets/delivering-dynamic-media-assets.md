---
title: Delivering Dynamic Media Assets
description: Learn how to deliver dynamic media assets
uuid: 23eddf83-34f5-4aae-8b81-d1cd7a098a7e
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
discoiquuid: e3b44330-d476-49c6-b7ba-079d0d60e500
docset: aem65

---

# Delivering Dynamic Media Assets{#delivering-dynamic-media-assets}

How you can deliver your dynamic media assets - both video and images - depends on how your website is implemented.

With Dynamic Media you have several options:

* If your website is hosted on AEM, then you want to add the dynamic media assets directly to your page.
* If your website is not on AEM, then you have the choice of either:

  * Embedding your video or image on your website.
  * Link URLs to your web application. Use linking when you want to deliver a video player as a pop-up or modal window.
  * If your site is responsive, you can [deliver optimized images.](/help/assets/responsive-site.md)

>[!NOTE]
>
>Smart imaging works with your existing image presets and uses intelligence at the last millisecond of delivery to further reduce image file size based on browser or network connection speed. See [Smart Imaging](/help/assets/imaging-faq.md) for more information.

For more information, see the following topics:

* [Adding Dynamic Media Assets to Web Pages](/help/assets/adding-dynamic-media-assets-to-pages.md)
* [Embedding the Video or Image Viewer on a Web Page](/help/assets/embed-code.md)
* [Activating hotlink protection in Dynamic Media](https://helpx.adobe.com/experience-manager/6-4/help/assets/hotlink-protection.html)
* [Linking URLs to your Web Application](/help/assets/linking-urls-to-yourwebapplication.md)
* [Delivering Optimized Images for a Responsive Site](/help/assets/responsive-site.md)
* [HTTP2 Delivery of Content](/help/assets/http2.md)
* I [nvalidating your CDN cached content](/help/assets/invalidate-cdn-cached-content.md)
* [Using Rulesets to Transform URLs](/help/assets/using-rulesets-to-transform-urls.md)

## HTTP/2 delivery of Dynamic Media assets {#http-delivery-of-dynamic-media-assets}

AEM now supports the delivery of all Dynamic Media content (images and video) over HTTP/2. That is, a published URL or embed code for the image or video is available to be integrated with any application that accepts a hosted asset. That published asset is then delivered by way of HTTP/2 protocol. This method of delivery improves the way browsers and servers communicate, allowing for better response and load times of all your Dynamic Media assets.

See [HTTP/2 Delivery of Content Frequently Asked Questions](/help/sites-administering/scene7-http2faq.md) to learn more.

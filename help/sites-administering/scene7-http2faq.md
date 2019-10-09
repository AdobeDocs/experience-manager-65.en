---
title: HTTP2 Delivery of Content FAQ
seo-title: HTTP2 Delivery of Content FAQ
description: Learn about HTTP2 content delivery.
seo-description: Learn about HTTP2 content delivery.
uuid: e837c3e0-6e48-46f1-b510-847c9976807a
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: integration
content-type: reference
discoiquuid: afbe9f80-c2a3-4a46-b9d6-4c9406667d7f
---

# HTTP2 Delivery of Content FAQ{#http-delivery-of-content-faq}

Adobe is excited to announce the availability of HTTP/2 delivery of content. When using HTTP/2 you will notice an overall performance increase.

## What is HTTP/2? {#what-is-http}

HTTP/2 improves the way browsers and servers communicate, allowing for faster transfer of information while reducing the amount of processing power that is needed.

The following website describes HTTP/2 and its benefits in a brief and simple manner:

[https://www.engadget.com/2015/02/24/what-you-need-to-know-about-http-2/](https://www.engadget.com/2015/02/24/what-you-need-to-know-about-http-2/)

## What are the key benefits of moving to HTTP/2 for content delivery? {#what-are-the-key-benefits-of-moving-to-http-for-content-delivery}

Performance improvement varies widely based on factors such as your website's code, how you are using Scene7, the consumer's device, screen and location, and so on.

Adobe's own testing yielded the following results:

* For images, response time improved 7%-28% depending on device and browser. The most notable performance gains were on iOS devices.
* For viewers, load time performance improved up 15%.

The following demonstration illustrates the difference between HTTP/1 versus HTTP/2 loading:

[https://http2.akamai.com/demo](https://http2.akamai.com/demo)

## Am I eligible to switch over to HTTP/2? {#am-i-eligible-to-switch-over-to-http}

To use HTTP/2, you must meet the following requirements:

* Use secure HTTPS for your rich media requests.
* Use the Adobe-bundled CDN (content delivery network) as part of your Dynamic Media Classic license.
* Use a dedicated domain (that is, `images.company.com` or `mycompany.scene7.com`), not a generic Dynamic Media Classic domain (that is, `s7d1.scene7.com`, `s7d2.scene7.com`, or `s7d13.scene7.com`).

  To find your domains, [log into your instance of Scene7 Publishing System](https://www.adobe.com/marketing-cloud/experience-manager/scene7-login.html) for each company account.

  Click **[!UICONTROL Setup > Application Setup > General Settings]**. Look for the field labelled **Published Server Name**. If you are currently using a generic Scene7 domain, you can request moving over to your own custom domain as part of this transition.

## What is the process for enabling HTTP/2 for my Dynamic Media Classic account? {#what-is-the-process-for-enabling-http-for-my-scene-account}

You must initiate an Adobe Technical Support (`s7support@adobe.com`) request to switch over to HTTP/2; it is not automatically done for you.

1. Provide the following information in your support request:

     * Primary contact name, email, and phone number.
     * All domains to be transitioned over to HTTP2. That is, `images.company.com` or `mycompany.scene7.com`.

     To find your domains, [log into your instance of Scene7 Publishing System](https://www.adobe.com/marketing-cloud/experience-manager/scene7-login.html) for each company account.

     Click **[!UICONTROL Setup > Application Setup > General Settings]**. Look for the field labelled **[!UICONTROL Published Server Name]**.

     * Verify that you use secure HTTPS for rich media requests.
     * Verify you are using the CDN through Adobe and not managed with a direct relationship.
     * Verify you are using a dedicated domain. That is, `images.company.com` or `mycompany.scene7.com`, not a generic Scene7 domain such as `s7d1.scene7.com`, `s7d2.scene7.com`, `s7d13.scene7.com`.

     To find your domains, [log into your instance of Scene7 Publishing System](https://www.adobe.com/marketing-cloud/experience-manager/scene7-login.html) for each company account.

     Click **[!UICONTROL Setup > Application Setup > General Settings]**. Look for the field labelled **[!UICONTROL Published Server Name]**. If you are currently using a generic Scene7 domain, you can request moving over to your own custom domain as part of this transition.

     1. Technical Support adds you to the HTTP/2 customer waitlist based on the order in which requests were submitted.
     1. When Adobe is ready to handle your request, Support will contact you to coordinate the transition and set a target date.
     1. You will be notified after completion and can verify a successful transition over to HTTP2.

## When can I expect to be transitioned over to HTTP/2? {#when-can-i-expect-to-be-transitioned-over-to-http}

Requests are processed in the order that they are received by Technical Support.

>[!NOTE]
>
>There may be a long lead time because the transition to HTTP/2 involves clearing the cache. Therefore, only a few customer transitions can be handled at a time.

## What are the risks with moving to HTTP/2? {#what-are-the-risks-with-moving-to-http}

The transition to HTTP/2 clears out your cache at the CDN because it involves moving to a new CDN configuration.

The non-cached content directly hits Adobe's origin servers until the cache is rebuilt again. Because of this, Adobe plans to handle a few customer transitions at a time so that acceptable performance is maintained when pulling requests from our origin.

## How can you verify whether a URL or website is activated with HTTP/2? {#how-can-you-verify-whether-a-url-or-website-is-activated-with-http}

You need to download an externsion to use with your Web browser. For Firefox and Chrome there is an extension called **[!UICONTROL HTTP/2 and SPDY Indicator]**. Browsers only support HTTP/2 securely, so it is necessary to call a URL with HTTPS to verify. If HTTP/2 is supported, this is indicated by the extension in the form of a blue Flash symbol, and a header "X-Firefox-Spdy" : "h2".

---
title: HTTP2 Delivery of Content
seo-title: HTTP2 Delivery of Content
description: HTTP/2 improves the way browsers and servers communicate, allowing for faster transfer of information while reducing the amount of needed processing power.
seo-description: HTTP/2 improves the way browsers and servers communicate, allowing for faster transfer of information while reducing the amount of needed processing power.
uuid: d9deb945-bdf5-4d6b-95c8-8bae4442e618
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
discoiquuid: c8e145ad-f021-4043-8190-62151775e296
---

# HTTP2 Delivery of Content {#http-delivery-of-content}

Adobe is excited to announce the availability of HTTP/2 delivery of content with the overall benefit of improved performance.

## What is HTTP/2? {#what-is-http}

HTTP/2 improves the way browsers and servers communicate, allowing for faster transfer of information while reducing the amount of processing power that is needed.

The following website describes HTTP/2 and its beneifts in a brief and simple manner:

[https://www.engadget.com/2015/02/24/what-you-need-to-know-about-http-2/](https://www.engadget.com/2015/02/24/what-you-need-to-know-about-http-2/)

## What are the key benefits of moving to HTTP/2 for content delivery? {#what-are-the-key-benefits-of-moving-to-http-for-content-delivery}

Performance improvement varies widely based on factors such as your website's code, how you are using Dynamic Media, the consumer's device, screen and location, and so on.

Adobe's own testing yielded the following results:

* For images, response time improved 7%-28% depending on device and browser. The most notable performance gains were on iOS devices.
* For viewers, load time performance improved up 15%.

The following demonstration illustrates the difference between HTTP/1 versus HTTP/2 loading:

[https://http2.akamai.com/demo](https://http2.akamai.com/demo)

## Am I eligible to switch over to HTTP/2? {#am-i-eligible-to-switch-over-to-http}

To use HTTP/2, you must meet the following requirements:

* Use secure HTTPS for your rich media requests.
* Use the Adobe-bundled CDN (content delivery network) as part of your Dynamic Media license.
* Use a dedicated (non- company-h.assetsadobe#.com) domain.

  If you already have a dedicated domain, you can opt-in by way of Technical Support.

  If you do not have a dedicated domain, Adobe will schedule your transition to HTTP/2 in 2018.

## What is the process for enabling HTTP/2 for my Dynamic Media account? {#what-is-the-process-for-enabling-http-for-my-dynamic-media-account}

You must initiate the request to switch over to HTTP/2; it is not automatically done for you.

1. Initiate a Technical Support request to switch over to HTTP2. See [Accessing the AEM Support Portal](https://helpx.adobe.com/experience-manager/kb/accessing-aem-support-portal.html).

    1. Provide the following information in your support request:

        1. Primary contact name, email, phone.
        1. All domains to be transitioned over to HTTP2.
        1. Verify you are using secure HTTPS for rich media requests.
        1. Verify you are using the CDN through Adobe and are not managed with a direct relationship.
        1. Verify you are using a dedicated domain. If you use Dynamic Media, then you already are using a dedicated domain.

    1. Technical Support will add you to the HTTP/2 customer waitlist based in the order in which requests were submitted.
    1. When Adobe is ready to handle your request, support will contact you to coordinate the transition and set a target date.
    1. You will be notified after completion and can verify successful transition over to HTTP2.

       Because the browser does not state this fact, it is necessary to download an extension.

       For Firefox and Chrome there is an extension called "HTTP/2 and SPDY Indicator". Browsers only support http/2 securely, so it is necessary to call a URL with https to verify. If http/2 is supported, this is indicated by the extension in the form of a blue Flash symbol, and a header "X-Firefox-Spdy" : "h2".

## When can I expect to be transitioned over to HTTP/2? {#when-can-i-expect-to-be-transitioned-over-to-http}

Requests will be processed in the order in which they are received by Technical Support.

>[!NOTE]
>
>There may be a long lead time because the transition to HTTP/2 involves clearing the cache. Therefore, only a few customer transitions can be handled at a time.

## What are the risks with moving to HTTP/2? {#what-are-the-risks-with-moving-to-http}

The transition to HTTP/2 clears out your cache at the CDN because it involves moving to a new CDN configuration.

The non-cached content directly hits Adobe's origin servers until the cache is rebuilt again. Because of this, Adobe plans to handle a few customer transitions at a time so that acceptable performance is maintained when pulling requests from our origin.

## How can you verify whether a URL or website is activated with HTTP/2? {#how-can-you-verify-whether-a-url-or-website-is-activated-with-http}

Because the browser does not state this fact, it is necessary to download an extension.

For Firefox and Chrome there is an extension called "HTTP/2 and SPDY Indicator". Browsers only support http/2 securely, so it is necessary to call a URL with https to verify. If http/2 is supported, this is indicated by the extension in the form of a blue Flash symbol, and a header "X-Firefox-Spdy" : "h2".

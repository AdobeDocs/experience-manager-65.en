---
title: HTTP2 Delivery of Content FAQ
description: Learn about HTTP2 content delivery and how it can increase the overall performance of your web content.
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: integration
content-type: reference
exl-id: 2428914c-5fb0-439e-a1ef-8ee30b890f58
solution: Experience Manager, Experience Manager Sites
feature: Integration
role: Admin
---
# HTTP2 Delivery of Content FAQ{#http-delivery-of-content-faq}

Adobe is excited to announce the availability of HTTP/2 delivery of content. When you use HTTP/2, an overall performance increase is noticed.

## What is HTTP/2? {#what-is-http}

HTTP/2 improves the way browsers and servers communicate, allowing for faster transfer of information while reducing the amount of processing power that is needed.

The following website describes HTTP/2 and its benefits in a brief and simple manner:

[What you must know about HTTP/2](https://www.engadget.com/2015-02-24-what-you-need-to-know-about-http-2.html).

## What are the key benefits of moving to HTTP/2 for content delivery? {#what-are-the-key-benefits-of-moving-to-http-for-content-delivery}

Performance improvement varies widely based on factors such as your website's code, how you use Dynamic Media, the customer's device, screen, and location.

Adobe's own testing yielded the following results:

* For images, response time improved 7%-28% depending on device and browser. The most notable performance gains were on iOS devices.
* For viewers, load-time performance improved up 15%.

The following demonstration illustrates the difference between HTTP/1 versus HTTP/2 loading:

[https://http2.akamai.com/demo](https://http2.akamai.com/demo)

## Am I eligible to switch over to HTTP/2? {#am-i-eligible-to-switch-over-to-http}

To use HTTP/2, you must meet the following requirements:

* Use secure HTTPS for your rich media requests.
* Use the Adobe-bundled CDN (content delivery network) as part of your Dynamic Media license.
* Use a dedicated domain (that is, `images.company.com` or `mycompany.scene7.com`), not a generic Dynamic Media domain (that is, `s7d1.scene7.com`, `s7d2.scene7.com`, or `s7d13.scene7.com`).

  To find your domains, open the [Dynamic Media Classic desktop application](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/getting-started/signing-out.html#getting-started), then sign in to your company account or accounts. Then navigate to **[!UICONTROL Setup]** > **[!UICONTROL Application Setup]** > **[!UICONTROL General Settings]**. Look for the field labeled **Published Server Name**. If you are currently using a generic Dynamic Media domain, you can request moving over to your own custom domain as part of this transition.

## What is the process for enabling HTTP/2 for my Dynamic Media account? {#what-is-the-process-for-enabling-http-for-my-scene-account}

1. [Use the Admin Console to create a support case](https://helpx.adobe.com/enterprise/using/support-for-experience-cloud.html) and request to switch over to HTTP/2; it is not automatically done for you.
1. Provide the following information in your support case:

     * Primary contact name, email, and phone number.
     * All domains to be transitioned over to HTTP2. That is, `images.company.com` or `mycompany.scene7.com`.

        To find your domains, open the [Dynamic Media Classic desktop application](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/getting-started/signing-out.html#getting-started), then sign in to your company account or accounts. Then navigate to **[!UICONTROL Setup]** > **[!UICONTROL Application Setup]** > **[!UICONTROL General Settings]**. Look for the field labeled **[!UICONTROL Published Server Name]**.

     * Verify that you use secure HTTPS for rich media requests.
     * Verify you are using the CDN through Adobe and not managed with a direct relationship.
     * Verify you are using a dedicated domain. That is, `images.company.com` or `mycompany.scene7.com`, not a generic Dynamic Media domain such as `s7d1.scene7.com`, `s7d2.scene7.com`, `s7d13.scene7.com`.

        To find your domains, open the [Dynamic Media Classic desktop application](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/getting-started/signing-out.html#getting-started), then sign in to your company account or accounts. Then navigate to **[!UICONTROL Setup]** > **[!UICONTROL Application Setup]** > **[!UICONTROL General Settings]**. Look for the field labeled **[!UICONTROL Published Server Name]**. If you are currently using a generic Dynamic Media domain, you can request moving over to your own custom domain as part of this transition.

1. Adobe Customer Support adds you to the HTTP/2 customer waitlist based on the order in which requests were submitted.
1. When Adobe is ready to handle your request, Support contacts you to coordinate the transition and set a target date.
1. You will be notified after completion and can verify a successful transition over to HTTP2.

## When can I expect to transition over to HTTP/2? {#when-can-i-expect-to-be-transitioned-over-to-http}

Requests are processed in the order that they are received by Adobe Customer Support.

>[!NOTE]
>
>There is a long lead time because the transition to HTTP/2 involves clearing the cache. Therefore, only a few customer transitions can be handled at a time.

## What are the risks with moving to HTTP/2? {#what-are-the-risks-with-moving-to-http}

The transition to HTTP/2 clears out your cache at the CDN because it involves moving to a new CDN configuration.

The non-cached content directly hits Adobe's origin servers until the cache is rebuilt again. Because of this action, Adobe plans to handle a few customer transitions at a time so that acceptable performance is maintained when pulling requests from Adobe's origin.

## How can you verify whether a URL or website is activated with HTTP/2? {#how-can-you-verify-whether-a-url-or-website-is-activated-with-http}

Download an extension that you can use with your Web browser. For Firefox and Chrome, there is an extension called **[!UICONTROL HTTP/2 and SPDY Indicator]**. Browsers only support HTTP/2 securely, so it is necessary to call a URL with HTTPS to verify. If HTTP/2 is supported, it is indicated by the extension in the form of a blue Flash symbol, and a header "X-Firefox-Spdy" : "h2".

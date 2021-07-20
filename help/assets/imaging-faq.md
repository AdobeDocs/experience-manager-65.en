---
title: Smart Imaging
description: Smart Imaging applies each user's unique viewing characteristics to automatically serve the right images optimized for their experience, resulting in better performance and engagement.
contentOwner: Rick Brough
topic-tags: dynamic-media
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
discoiquuid: bf8c6bbd-847d-43d7-9ff4-7231bfd8d107
feature: Asset Management,Renditions
role: User, Admin
exl-id: e427d4ee-d5c8-421b-9739-f3cf2de36e41
---

# Smart Imaging {#smart-imaging}

## What is "Smart Imaging"? {#what-is-smart-imaging}

Smart Imaging technology applies Adobe Sensei AI capabilities and works with existing "image presets" to enhance image delivery performance by automatically optimizing image format, size, and quality based on client browser capabilities.

>[!NOTE]
>
>This feature requires that you use the out-of-the-box CDN (Content Delivery Network) that is bundled with Adobe Experience Manager Dynamic Media. Any other custom CDN is not supported with this feature.

Smart Imaging also benefits from the added performance boost of being fully integrated with Adobe’s best-in-class premium CDN service. This service finds the optimal internet route between servers, networks, and peering points. It finds a route that has the lowest latency and lowest packet loss rate instead of using the default route on the Internet.

The following image asset examples depict the added Smart Imaging optimization:

| Image<br>(URL) | Thumbnail | Size<br> (JPEG) | Size (WebP)<br> (with Smart Imaging) | % reduction |
|---|---|---|---|---|
| [Image 1](https://techsupport.scene7.com/is/image/TechSupport/SmartImaging_6?hei=500&fmt=jpg&qlt=85&resmode=bisharp&op_usm=5,0.125,5,0) | ![picture1](/help/assets/assets-dm/picture1.png) | 73.75 KB | 45.92 KB | 38% |
| [Image 2](https://techsupport.scene7.com/is/image/TechSupport/SmartImaging_3?hei=500&fmt=jpg&qlt=85&resmode=bisharp&op_usm=5,0.125,5,0) | ![picture2](/help/assets/assets-dm/picture2.png) | 191 KB | 70.66 KB | 63% |
| [Image 3](https://techsupport.scene7.com/is/image/TechSupport/SmartImaging_2?hei=500&fmt=jpg&qlt=85&resmode=bisharp&op_usm=5,0.125,5,0) | ![picture3](/help/assets/assets-dm/picture3.png) | 96.64 KB | 39.44 KB | 59% |
| [Image 4](https://techsupport.scene7.com/is/image/TechSupport/SmartImaging_1?hei=500&qlt=85&resmode=bisharp&op_usm=5,0.125,5,0) | ![picture4](/help/assets/assets-dm/picture4.png) | 315.80 KB | 178.19 KB | 44% |
| | | | |  Average = 51% |

Similar to the above, Adobe also ran a test with 7009 URLs from live customer sites. They were able to achieve an average of 38% further file size optimization for JPEG. For PNG with WebP format, they were able to achieve an average of 31% further file size optimization. This kind of optimization is possible because of the capability of Smart Imaging.

On the mobile web, the challenges are compounded by two factors:

* Large variety of devices with different form factors and high-resolution displays.
* Constrained network bandwidth.

In terms of images, the goal is to serve the best quality images as efficiently as possible.

### About device pixel ratio optimization {#dpr}

Device pixel ratio (DPR) &ndash; also known as CSS pixel ratio &ndash; is the relation between a device’s physical pixels and logical pixels. Especially with the advent of retina screens, the pixel resolution of modern mobile devices is growing at a fast rate.

Enabling Device Pixel Ratio optimization renders the image at the native resolution of the screen which makes it look crisp.

Turning on Smart Imaging DPR configuration automatically adjusts the requested image based on pixel density of the display the request is being served from. Currently, the pixel density of the display comes from Akamai CDN header values.

| Permitted values in the URL of an image | Description |
|---|---|
| `dpr=off` | Turn off DPR optimization at an individual image URL level.| 
| `dpr=on,dprValue` | Override the DPR value detected by Smart Imaging, with a custom value (as detected by any client-side logic or other means). Permitted value for `dprValue` is any number greater than 0. Specified values of 1.5, 2, or 3 are typical. |

>[!NOTE]
>
>* You can use `dpr=on,dprValue` even if the company level DPR setting as off.
>* Owing to DPR optimization, when the resultant image is greater than the MaxPix Dynamic Media setting, MaxPix width is always recognized by maintaining the image's aspect ratio.

| Requested Image size | DPR value | Delivered image size |
|---|---|---|
| 816x500 | 1 | 816x500 |
| 816x500 | 2 | 1632x1000 |

See also [When working with images](/help/assets/adding-dynamic-media-assets-to-pages.md#when-working-with-images) and [When working with Smart Crop](/help/assets/adding-dynamic-media-assets-to-pages.md#when-working-with-smart-crop).

### About network bandwidth optimization {#network-bandwidth-optimization}

Turning on Network Bandwidth automatically adjusts the image quality that is served based on actual network bandwidth. For poor network bandwidth, DPR optimization is automatically turned off, even if it is already on.

If desired, your company can opt out of network bandwidth optimization at the individual image level by appending `network=off` to the URL of the image.

| Permitted value in the URL of an image | Description |
|---|---|
| `network=off` | Turns off network optimization at an individual image URL level. |

>[!NOTE]
>
>DPR and network bandwidth values are based on the detected client-side values of the bundled CDN. These values are sometimes inaccurate. For example, iPhone5 with DPR=2 and iPhone12 with DPR=3, both show DPR=2. Still, for high-resolution devices, sending DPR=2 is better than sending DPR=1. Coming soon: Adobe is working on client-side code to accurately determine an end user's DPR.

## What are the key benefits of the latest Smart Imaging? {#what-are-the-key-benefits-of-smart-imaging}

Because images constitute most of a page's load time, the performance improvement can have a profound impact on a Business such as higher conversion, time spent on site, and lower site bounce rate.

Enhancements in latest version of Smart Imaging:

* Improved Google SEO ranking for web pages that use the latest Smart Imaging.
* Serves optimized content immediately (at run-time).
* Uses Adobe Sensei technology to convert according to the quality (qlt) specified in the image request.
* Smart Imaging can be turned off using the “bfc” URL parameter.
* TTL (Time To Live) independent. Previously, a minimum TTL of 12 hours was mandatory for Smart Imaging to work.
* Previously, both the original and derivative images were cached, and it was a 2-step process to invalidate cache. In latest Smart Imaging, only the derivatives get cached, allowing a single-step cache invalidation process.
* Customers that use custom headers in their ruleset benefit from the latest Smart Imaging, as these headers are not blocked, unlike the previous version of Smart Imaging. For example, "Timing Allow Origin", "X-Robot" as suggested in [Add a custom header value to image responses|Dynamic Media Classic](https://helpx.adobe.com/experience-manager/scene7/kb/base/scene7-rulesets/add-custom-header-val-image.html).

## Are there any licensing costs associated with smart imaging? {#are-there-any-licensing-costs-associated-with-smart-imaging}

No. Smart Imaging is included with your existing license of either Dynamic Media Classic or Adobe Experience Manager - Dynamic Media (On-prem, AMS, and Adobe Experience Manager as a Cloud Service). 

>[!NOTE]
>
>Smart Imaging is not available to Dynamic Media - Hybrid customers.

## How does smart imaging work? {#how-does-smart-imaging-work}

When an image is requested by a consumer, Smart Imaging checks the user characteristics and convert to the appropriate image format based on the browser in use. These format conversions are done in a manner that does not degrade visual fidelity. Smart imaging automatically converts images to different formats based on browser capability in the following manner.

<!--   * Safari 14.0 +
    * Safari 14 only with iOS 14.0 and above and macOS BigSur and above -->

* Automatically convert to WebP for the following browsers:
  * Chrome
  * Firefox
  * Microsoft® Edge
  * Safari (across iOS, macOS, iPadOS), provided browser and OS version support WebP
  * Android™
  * Opera
* Legacy browser support for the following:

    | Browser | Browser/OS version | Format |
    | --- | --- | --- |
    | Safari | Earlier than iOS/iPad 14.0 or macOS BigSur | JPEG2000 |
    | Edge | Earlier than 18 | JPEGXR |
    | Internet Explorer | 9+ | JPEGXR |
* For browsers that do not support these formats, the originally requested image format is served.

If the original image size is smaller than what Smart Imaging produces, then the original image is served.

## What image formats are supported? {#what-image-formats-are-supported}

The following image formats are supported for Smart Imaging:

* JPEG
* PNG

<!-- CQDOC-15846 For any other format mentioned in a URL, you should explicity turn off Smart Imaging.  Append modifier `bfc=off` to the URL for file formats other than JPEG and PNG. You can accomplish this by using either one of the following methods:

* Use a ruleset if the `fmt` modifier is mentioned in the URL. 
* Append in URL modifiers field of the presets concerned.

Adobe is working on a permanent fix that does not require you to append `bfc=off` for `fmt !=JPEG` or `fmt !=PNG`. This topic will be updated after the fix is delivered. -->

## How does Smart Imaging work with my existing image presets that are already in use? {#how-does-smart-imaging-work-with-our-existing-image-presets-that-are-already-in-use}

Smart Imaging works with your existing “image presets” and observes all of your image settings except for quality (`qlt`) and format (`fmt`) if the requested file format is JPEG or PNG. For format conversion, Smart Imaging maintains full visual fidelity as defined by your image preset settings, but at a smaller file size. If original image size is smaller than what Smart Imaging produces, then the original image is served.

<!-- CQDOC-15846 In addition, if your image presets are used to return `fmt !=JPEG` or `fmt !=PNG`, be sure append `bfc=off` in the preset modifier field to return the requested file format. -->

## Do I have to change any URLs, image presets, or deploy any new code on my site for Smart Imaging? {#will-i-have-to-change-any-urls-image-presets-or-deploy-any-new-code-on-my-site-for-smart-imaging}

Smart Imaging works seamlessly with your existing image URLs and image presets if you configure Smart Imaging on your existing custom domain. In addition, Smart Imaging does not require you to add any code on your website to detect a user's browser. It is all handled automatically.

In case you must configure a new custom domain to use Smart Imaging, the URLs must be updated to reflect this custom domain.

To understand pre-requisites for Smart Imaging, see [Am I eligible to use Smart Imaging?](#am-i-eligible-to-use-smart-imaging)

<!-- No. Smart Imaging works seamlessly with your existing image URLs and image presets. In addition, Smart Imaging does not require you to add any code on your website to detect a user's browser. All of this is handled automatically. -->

<!-- As mentioned earlier, Smart Imaging supports only JPEG and PNG image formats. For other formats, you need to append the `bfc=off` modifier to the URL as described earlier. -->

## Does Smart Imaging working with HTTPS? How about HTTP/2? {#does-smart-imaging-working-with-https-how-about-http}

Smart Imaging works with images delivered over HTTP or HTTPS. In addition, it also works over HTTP/2.

## Am I eligible to use smart imaging? {#am-i-eligible-to-use-smart-imaging}

To use Smart Imaging, your company's Dynamic Media Classic or Dynamic Media on Experience Manager account must meet the following requirements:

* Use the Adobe-bundled CDN (Content Delivery Network) as part of your license.
* Use a dedicated domain (for example, `images.company.com` or `mycompany.scene7.com`), not a generic domain (for example, `s7d1.scene7.com`, `s7d2.scene7.com`, or `s7d13.scene7.com`). 

To find your domains, open the [Dynamic Media Classic desktop application](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/getting-started/signing-out.html#getting-started), then sign in to your company account or accounts.  
  
Navigate to **[!UICONTROL Setup]** > **[!UICONTROL Application Setup]** > **[!UICONTROL General Settings]** Look for the field labeled **[!UICONTROL Published Server Name]**. If you are currently using a generic domain, you can request moving over to your own custom domain as part of this transition when you submit a technical support ticket.

Your first custom domain is no additional cost with a Dynamic Media license.

## What is the process for enabling Smart Imaging for my account? {#what-is-the-process-for-enabling-smart-imaging-for-my-account}

You initiate the request to use smart imaging; it is not automatically enabled.

By default, Smart Imaging DPR and network optimization is disabled (turned off) for a Dynamic Media company account. If you want to enable (turn on) one or both of these out-of-the-box enhancements, create a support case as described below.

The release schedule for Smart Imaging DPR and network optimization is as follows:

| Region | Target date |
|---|---|
| North America | Live |
| Europe, Middle East, Africa | 13 Aug 2021 |
| Asia-Pacific | 22 Jul 2021 |

1. [Use the Admin Console to create a support case](https://helpx.adobe.com/enterprise/admin-guide.html/enterprise/using/support-for-experience-cloud.ug.html).
1. Provide the following information in your support case:

    1. Primary contact name, email, phone.
    1. All domains to be enabled for smart imaging (that is, `images.company.com` or `mycompany.scene7.com`).

       To find your domains, open the [Dynamic Media Classic desktop application](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/getting-started/signing-out.html#getting-started), then sign in to your company account or accounts.  

       Navigate to **[!UICONTROL Setup]** > **[!UICONTROL Application Setup]** > **[!UICONTROL General Settings]**.

       Look for the field labeled **[!UICONTROL Published Server Name]**.
    1. Verify that you are using the CDN through Adobe and not managed with a direct relationship.
    1. Verify you are using a dedicated domain such as `images.company.com` or `mycompany.scene7.com`, and not a generic domain, such as `s7d1.scene7.com`, `s7d2.scene7.com`, `s7d13.scene7.com`.  

       To find your domains, open the [Dynamic Media Classic desktop application](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/getting-started/signing-out.html#getting-started), then sign in to your company account or accounts.

       Navigate to **[!UICONTROL Setup]** > **[!UICONTROL Application Setup]** > **[!UICONTROL General Settings]**.  

       Look for the field labeled **[!UICONTROL Published Server Name]**. If you are currently using a generic Dynamic Media Classic domain, you can request moving over to your own custom domain as part of this transition.
    1. Indicate if you also need Smart Imaging to work over HTTP/2.

1. Adobe Customer Care adds you to the Smart Imaging customer Wait List based on the order in which requests were submitted.
1. When Adobe is ready to handle your request, support contacts you to coordinate and set a target date.
1. **Optional** - You can optionally test smart imaging in Staging before Adobe pushes the new feature to production.
1. You are notified after completion by Customer Care.
1. To maximize the performance improvements of Smart Imaging, Adobe recommends setting the Time To Live (TTL) to 24 hours or longer. The TTL defines how long assets are cached by the CDN. To change this setting:

    1. If you use Dynamic Media Classic, navigate to **[!UICONTROL Setup]** > **[!UICONTROL Application Setup]** > **[!UICONTROL Publish Setup]** > **[!UICONTROL Image Server]**. Set the **[!UICONTROL Default Client Cache Time To Live]** value to 24 or longer.
    1. If you use Dynamic Media, follow [these instructions](config-dynamic.md). Set the **[!UICONTROL Expiration]** value 24 hours or longer.

## When can I expect my account to be enabled with Smart Imaging? {#when-can-i-expect-my-account-to-be-enabled-with-smart-imaging}

Requests are processed in the order in which they are received by Customer Care, according to the Wait List.

>[!NOTE]
>
>There can be a long lead time because enabling Smart Imaging involves Adobe clearing the cache. Therefore, only a few customer transitions can be handled at any given time.

## What are the risks with switching over to use Smart Imaging? {#what-are-the-risks-with-switching-over-to-use-smart-imaging}

There is no risk to a customer web page. However, the transition to Smart Imaging clears out your cache at the CDN because it involves moving to a new configuration of Dynamic Media Classic or Dynamic Media on Experience Manager.

During the initial transition, the non-cached images directly hit Adobe's origin servers until the cache is rebuilt again. As a result, Adobe plans to handle a few customer transitions at a time so that acceptable performance is maintained when pulling requests from the origin. For most customers, the cache is fully built up again at the CDN within ~1 - 2 days.

## How can I verify whether smart imaging is working as expected?{#how-can-i-verify-whether-smart-imaging-is-working-as-expected}

1. After your account is configured with smart imaging, load a Dynamic Media Classic or Adobe Experience Manager - Dynamic Media image URL on the browser.
1. Open the Chrome developer pane by navigating to **[!UICONTROL View]** > **[!UICONTROL Developer]** > **[!UICONTROL Developer Tools]** in the browser. Or, choose any browser developer tool of your choice.

1. Ensure that cache is disabled when developer tools are open.

    * On Windows®, navigate to settings in the developer tool pane, then select **[!UICONTROL Disable cache (while devtools is open)]** checkbox.
    * On macOS, in the developer pane, under the **[!UICONTROL Network]** tab, select **[!UICONTROL disable cache]**.

1. Observe the Content Type is transformed to the appropriate format. The following screenshot shows a PNG image being converted dynamically to WebP on Chrome.
1. Repeat this test on different browsers and user conditions.

>[!NOTE]
>
>Not all images are converted. Smart Imaging decides if the conversion can improve performance. Sometimes, where there is no expected performance gain or the format is not JPEG or PNG, the image is not converted.

![image2017-11-14_15398](assets/image2017-11-14_15398.png)

## Can Smart Imaging be turned off for any request? {#turning-off-smart-imaging}

Yes. You can turn off Smart Imaging by adding the modifier `bfc=off` to the URL.

## Can I request DPR and network optimization to be turned off at the company level? {#dpr-companylevel-turnoff}

Yes. To disable DPR and network optimization at your company, create a support case as described earlier in this topic.

## What "tuning" is available? Are there any settings or behaviors that can be defined? (#tuning-settings)

Currently, you can optionally enable or disable Smart Imaging. No other tuning is available.

## If Smart Imaging manages the quality settings, are there minimums and maximums to set? For example, is it possible to set "no lower than 60" and "no greater than 80 quality"? (#minimum-maximum)

There is no such provisioning ability in the current Smart Imaging.

## Sometimes, a JPEG image is returned to Chrome instead of a WebP image. Why does that change happen? (#jpeg-webp)

Smart Imaging determines if the conversion is beneficial or not. It returns the new image only if the conversion results in a smaller file size with comparable quality.

## How does Smart Imaging DPR optimization work with Adobe Experience Manager Sites components and Dynamic Media viewers?

* Experience Manager Sites Core Components are configured by default for DPR optimization. To avoid oversized images owing to server-side Smart Imaging DPR optimization, `dpr=off` is always added to Experience Manager Sites Core Components Dynamic Media images.
* Given Dynamic Media Foundation Component is configured by default for DPR optimization, to avoid oversized images owing to server-side Smart Imaging DPR optimization, `dpr=off` is always added to Dynamic Media Foundation Component images. Even if customer deselects DPR optimization in DM Foundation Component, server-side Smart Imaging DPR does not kick in. In summary, in the DM Foundation Component, DPR optimization comes into effect based on DM Foundation Component level setting only.
* Any viewer side DPR optimization works in tandem with server-side Smart Imaging DPR optimization, and does not result in over-sized images. In other words, wherever DPR is handled by the viewer, such as the main view only in a zoom-enabled viewer, the server-side Smart Imaging DPR values are not triggered. Likewise, wherever viewer elements, such as swatches and thumbnails, do not have DPR handling, the server-side Smart Imaging DPR value is triggered.

See also [When working with images](/help/assets/adding-dynamic-media-assets-to-pages.md#when-working-with-images) and [When working with Smart Crop](/help/assets/adding-dynamic-media-assets-to-pages.md#when-working-with-smart-crop).

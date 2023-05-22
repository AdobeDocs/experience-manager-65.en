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

Smart Imaging technology applies Adobe Sensei AI capabilities and works with existing "image presets". It works to enhance image delivery performance by automatically optimizing image format, size, and quality based on client browser capabilities.

And now, get a better Google Core Web Vital score for LCP (Largest Contentful Paint) with improved Smart Imaging which now comes with both AVIF and WebP support.

>[!IMPORTANT]
>
>Smart Imaging requires that you use the out-of-the-box CDN (Content Delivery Network) that is bundled with Adobe Experience Manager - Dynamic Media. Any other custom CDN is not supported with this feature.

>[!TIP]
>
>Try out and discover the benefits of Dynamic Media image modifiers and Smart Imaging, using Dynamic Media [_Snapshot_](https://snapshot.scene7.com/).
>
> Snapshot is a visual demonstration tool, designed to illustrate the power of Dynamic Media for optimized and dynamic image delivery. Experiment with test images or Dynamic Media URLs, to visually observe the output of various Dynamic Media image modifiers, and Smart Imaging optimizations for the following:
>* File size (with WebP and AVIF delivery)
>* Network bandwidth
>* DPR (Device Pixel Ratio) 
>
>To learn how easy it is to use Snapshot, play the [Snapshot training video](https://experienceleague.adobe.com/docs/experience-manager-learn/assets/dynamic-media/images/dynamic-media-snapshot.html?lang=en) (3 minutes and 17 seconds).

Smart Imaging benefits from the added performance boost of being fully integrated with Adobe's best-in-class premium CDN (Content Delivery Network) service. This service finds the optimal Internet route between servers, networks, and peering points. It finds a route that has the lowest latency and lowest packet loss rate instead of using the default route on the Internet.

The following image asset examples depict the added Smart Imaging optimization:

| Image (URL) | Thumbnail | Size (JPEG) | Size (WebP) with Smart Imaging | Size (AVIF) with Smart Imaging | % reduction with WebP | % reduction with AVIF |
|---|---|---|---|---|---|---|
| [Image 1](https://techsupport.scene7.com/is/image/TechSupport/SmartImaging_6?hei=500&fmt=jpg&qlt=85&resmode=bisharp&op_usm=5,0.125,5,0) | ![picture1](/help/assets/assets-dm/picture1.png) | 145 KB | 106 KB | 90.2 KB | 26.89% | 37.79% |
| [Image 2](https://techsupport.scene7.com/is/image/TechSupport/SmartImaging_3?hei=500&fmt=jpg&qlt=85&resmode=bisharp&op_usm=5,0.125,5,0) | ![picture2](/help/assets/assets-dm/picture2.png) | 412 KB | 346 KB | 113 KB | 16.01% | 72.57% |
| [Image 3](https://techsupport.scene7.com/is/image/TechSupport/SmartImaging_2?hei=500&fmt=jpg&qlt=85&resmode=bisharp&op_usm=5,0.125,5,0) | ![picture3](/help/assets/assets-dm/picture3.png) | 221 KB | 189 KB | 87.1 KB | 14.47% | 60.58% |
| [Image 4](https://techsupport.scene7.com/is/image/TechSupport/SmartImaging_1?hei=500&qlt=85&resmode=bisharp&op_usm=5,0.125,5,0) | ![picture4](/help/assets/assets-dm/picture4.png) | 594 KB | 545 KB | 286 KB | 8.25% | 51.85% |

Similar to above, Adobe also ran a test with a larger sample set. The format AVIF provided 20% extra size reduction over WebP, which provided 27% reduction over JPEG. All at same visual quality. In total, AVIF provides up to 41% average size reduction over JPEG.

Compare WebP and AVIF to PNG, you can see an 84% size reduction with WebP and 87% with AVIF. And, because both WebP and AVIF formats support transparency and multiple image animations, it is a good replacement for transparent PNG and GIF files.

See also [Image Optimization with Next-gen Image Formats (WebP and AVIF)](https://blog.developer.adobe.com/image-optimisation-with-next-gen-image-formats-webp-and-avif-248c75afacc4)

<!-- HIDDEN ON MAY 19, 2022 BASED ON CQDOC-19280 On the mobile web, the challenges are compounded by two factors:

* Large variety of devices with different form factors and high-resolution displays.
* Constrained network bandwidth.

In terms of images, the goal is to serve the best quality images as efficiently as possible. -->

## What are the key benefits of the latest Smart Imaging? {#what-are-the-key-benefits-of-smart-imaging}

Smart Imaging provides better image delivery performance by automatically optimizing image file size based on client browser in use, the device display & network conditions. Because images constitute most of a page's load time, any performance improvement can have a profound impact on business KPIs such as higher conversion rates, time spent on a site, and lower site bounce rates.

The newest key benefits of the latest Smart Imaging include the following:

* Now supports next generation AVIF format.
* PNG to WebP and AVIF now supports lossy conversion. Because PNG is a lossless format, earlier WebP and AVIF being delivered were lossless.
* Browser Format Conversion (`bfc`)
* Device Pixel Ratio (`dpr`)
* Network bandwidth (`network`)

### About Browser Format Conversion (bfc) {#bfc} 

Turning on Browser Format Conversion by appending `bfc=on` to the image URL automatically converts JPEG and PNG to lossy AVIF, lossy WebP, lossy JPEGXR, lossy JPEG2000 for different browsers. For browsers that do not support those formats, Smart Imaging continues to serve the JPEG or PNG. Along with the format, the quality of the new format is recalculated by Smart Imaging.

Smart Imaging can also be turned off by appending `bfc=off` to the image's URL.

See also [bfc](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/http-protocol-reference/command-reference/r-bfc.html?lang=en) in the Dynamic Media Image Serving and Rendering API.

### About Device Pixel Ratio (dpr) optimization {#dpr}

Device Pixel Ratio (DPR) &ndash; also known as CSS pixel ratio &ndash; is the relation between a device's physical pixels and logical pixels. Especially with the advent of retina screens, the pixel resolution of modern mobile devices is growing at a fast rate.

Enabling Device Pixel Ratio optimization renders the image at the native resolution of the screen which makes it sharp.

Currently, the pixel density of the display comes from Akamai CDN header values.

| Permitted values in an image's URL | Description |
|---|---|
| `dpr=off` | Turn off DPR optimization at an individual image URL level.| 
| `dpr=on,dprValue` | Override the DPR value detected by Smart Imaging, with a custom value (as detected by any client-side logic or other means). Permitted value for `dprValue` is any number greater than 0.  |

>[!NOTE]
>
>* You can use `dpr=on,dprValue` even if the company level DPR setting as off.
>* Owing to DPR optimization, when the resultant image is greater than the MaxPix Dynamic Media setting, MaxPix width is always recognized by maintaining the image's aspect ratio.

| Requested image size | Device Pixel Ratio (dpr) value | Delivered image size |
|---|---|---|
| 816 x 500 | 1 | 816 x 500 |
| 816 x 500 | 2 | 1632 x 1000 |

See also [When working with images](/help/assets/adding-dynamic-media-assets-to-pages.md#when-working-with-images) and [When working with Smart Crop](/help/assets/adding-dynamic-media-assets-to-pages.md#when-working-with-smart-crop).

### About Network Bandwidth optimization {#network}

Turning on Network Bandwidth automatically adjusts the image quality that is served based on actual network bandwidth. For poor network bandwidth, DPR (Device Pixel Ratio) optimization is automatically turned off, even if it is already on.

If desired, your company can opt out of network bandwidth optimization at the individual image level by appending `network=off` to the URL of the image.

| Permitted value in the URL of an image | Description |
|---|---|
| `network=off` | Turns off network optimization at an individual image URL level. |

DPR and network bandwidth values are based on the detected client-side values of the bundled CDN. These values are sometimes inaccurate. For example, iPhone5 with DPR=2 and iPhone12 with `dpr=3`, both show `dpr=2`. Still, for high-resolution devices, sending `dpr=2` is better than sending `dpr=1`. The best way to overcome this inaccuracy, however, is to use client-side DPR to give you 100% accurate values. And it works for any device, whether it is Apple or any other device that was launched. See [Use Smart Imaging with client-side Device Pixel Ratio](/help/assets/client-side-dpr.md).

### Additional key benefits of Smart Imaging

* Improved Google SEO ranking for web pages that use the latest Smart Imaging.
* Serves optimized content immediately (at runtime).
* Uses Adobe Sensei technology to convert according to the quality (`qlt`) specified in the image request.
* TTL (Time To Live) independent. Previously, a minimum TTL of 12 hours was mandatory for Smart Imaging to work.
* Previously, both the original and derivative images were cached, and it was a 2-step process to invalidate cache. In latest Smart Imaging, only the derivatives get cached, allowing a single-step cache invalidation process.
* Customers that use custom headers in their ruleset benefit from the latest Smart Imaging, as these headers are not blocked, unlike the previous version of Smart Imaging. For example, "Timing Allow Origin", "X-Robot" as suggested in [Add a custom header value to image responses|Dynamic Media Classic](https://helpx.adobe.com/experience-manager/scene7/kb/base/scene7-rulesets/add-custom-header-val-image.html).

## Are there any licensing costs associated with Smart Imaging? {#are-there-any-licensing-costs-associated-with-smart-imaging}

No. Smart Imaging is included with your existing license. This rule is true for either Dynamic Media Classic or Experience Manager - Dynamic Media (On-prem, AMS, and Experience Manager as a Cloud Service).

>[!NOTE]
>
>Smart Imaging is not available to Dynamic Media - Hybrid customers.

## How does Smart Imaging work? {#how-does-smart-imaging-work}

When an image is requested by a consumer, Smart Imaging checks the user characteristics and converts it to the appropriate image format based on the browser in use. These format conversions are done in a manner that does not degrade visual fidelity. Smart imaging automatically converts images to different formats based on browser capability in the following manner.

* Automatically convert to AVIF if browser supports the format
* Automatically convert to WebP if AVIF conversion was not beneficial or browser does not support AVIF
* Automatically convert to JPEG2000 if Safari does not support WebP
* Automatically convert to JPEGXR for IE 9+ or if Edge does not support WebP  
    | Image format | Supported browsers |
    |---|---|
    | AVIF | [https://caniuse.com/avif](https://caniuse.com/avif) |
    | WebP | [https://caniuse.com/webp](https://caniuse.com/webp) |
    | JPEG 2000 | [https://caniuse.com/jpeg2000](https://caniuse.com/jpeg2000) |
    | JPEGXR | [https://caniuse.com/jpegxr](https://caniuse.com/jpegxr) |
* For browsers that do not support these formats, the originally requested image format is served. 

If the original image size is smaller than what Smart Imaging produces, then the original image is served.

## What image formats are supported? {#what-image-formats-are-supported}

The following image formats are supported for Smart Imaging:

* JPEG
* PNG

For JPEG image file format, the quality of the new format is recalculated by Smart Imaging.

For image file formats that support transparency like PNG, you can configure Smart Imaging to deliver lossy AVIF and WebP. For the lossy format conversion, Smart Imaging uses the quality mentioned in the image's URL, or else the quality configured in the Dynamic Media company account.

## How does Smart Imaging work with my existing image presets that are already in use? {#how-does-smart-imaging-work-with-our-existing-image-presets-that-are-already-in-use}

Smart Imaging works with your existing image presets and observes all your image settings. What changes is the image format, or the quality setting, or both. For format conversion, Smart Imaging maintains full visual fidelity as defined by your image preset settings, but at a smaller file size.

For example, suppose that an image preset is defined with JPEG format, size 500 x 500, quality=85, and unsharp mask=0.1,1,5. When Smart Imaging detects that a user is on a Chrome browser, the image is converted to WebP format, with size 500 x 500. And, unsharp mask=0.1,1,5 is at a WebP quality that matches a JPEG quality of 85 as close as possible. The footprint of that WebP conversion is compared with the JPEG, and the smaller of the two is returned.

## Do I have to change any URLs, image presets, or deploy any new code on my site for Smart Imaging? {#will-i-have-to-change-any-urls-image-presets-or-deploy-any-new-code-on-my-site-for-smart-imaging}

No. Smart Imaging works seamlessly with your existing image URLs and image presets. In addition, Smart Imaging does not require you to add code to your website to detect a user's browser. All of this functionality is handled automatically.

<!-- Smart Imaging works seamlessly with your existing image URLs and image presets if you configure Smart Imaging on your existing custom domain. In addition, Smart Imaging does not require you to add any code on your website to detect a user's browser. It is all handled automatically.

In case you must configure a new custom domain to use Smart Imaging, the URLs must be updated to reflect this custom domain.

To understand pre-requisites for Smart Imaging, see [Am I eligible to use Smart Imaging?](#am-i-eligible-to-use-smart-imaging) -->

<!-- OLD As mentioned earlier, Smart Imaging supports only JPEG and PNG image formats. For other formats, you need to append the `bfc=off` modifier to the URL as described earlier. -->

## Does Smart Imaging working with HTTPS? How about HTTP/2? {#does-smart-imaging-working-with-https-how-about-http}

Smart Imaging works with images delivered over HTTP or HTTPS. In addition, it also works over HTTP/2.

## Am I eligible to use Smart Imaging? {#am-i-eligible-to-use-smart-imaging}

To use Smart Imaging, your company's Dynamic Media Classic or Dynamic Media on Experience Manager account must meet the following requirements:

* Use the Adobe-bundled CDN (Content Delivery Network) as part of your license.
* Use a dedicated domain (for example, `images.company.com` or `mycompany.scene7.com`), not a generic domain (for example, `s7d1.scene7.com`, `s7d2.scene7.com`, or `s7d13.scene7.com`). 

To find your domains, open the [Dynamic Media Classic desktop application](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/getting-started/signing-out.html#getting-started), then sign in to your company account or accounts.  
  
Go to **[!UICONTROL Setup]** > **[!UICONTROL Application Setup]** > **[!UICONTROL General Settings]**. Look for the field labeled **[!UICONTROL Published Server Name]**. If you currently use a generic domain, you can request to move over to your own custom domain. Make this transition request when you submit a support case.

Your first custom domain is no additional cost with a Dynamic Media license.

## What is the process for enabling Smart Imaging for my account? {#what-is-the-process-for-enabling-smart-imaging-for-my-account}

You initiate a request to use Smart Imaging; it is not automatically enabled.

Create a support case as described below. In your support case, be sure you mention which of the following Smart Imaging capabilities (one or more) you want enabled on your account:

* WebP
* AVIF
* DPR and Network Bandwidth optimization
* PNG to lossy AVIF or lossy WebP

If you already have Smart Imaging enabled with WebP, but desire other new capabilities as listed above, you must create a support case.

**To create a support case to enable Smart Imaging on your account:**

1. [Use the Admin Console to start the creation of a new support case](https://helpx.adobe.com/enterprise/using/support-for-experience-cloud.html).
1. Provide the following information in your support case:

    * Primary contact name, email, phone.

    * List which of the following Smart Imaging capabilities (one or more) you want enabled on your account:
      * WebP
      * AVIF
      * DPR and Network Bandwidth optimization
      * PNG to lossy AVIF or lossy WebP
    
    * All domains to be enabled for Smart Imaging (that is, `images.company.com` or `mycompany.scene7.com`).

       To find your domains, open the [Dynamic Media Classic desktop application](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/getting-started/signing-out.html#getting-started), then sign in to your company account or accounts. 

       Go to **[!UICONTROL Setup]** > **[!UICONTROL Application Setup]** > **[!UICONTROL General Settings]**.  

       Look for the field labeled **[!UICONTROL Published Server Name]**.
    
    * Verify that you are using the CDN through Adobe and not managed with a direct relationship.

    * Verify you are using a dedicated domain such as `images.company.com` or `mycompany.scene7.com`, and not a generic domain, such as `s7d1.scene7.com`, `s7d2.scene7.com`, `s7d13.scene7.com`.  

       To find your domains, open the [Dynamic Media Classic desktop application](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/getting-started/signing-out.html#getting-started), then sign in to your company account or accounts.

       Go to **[!UICONTROL Setup]** > **[!UICONTROL Application Setup]** > **[!UICONTROL General Settings]**.  

       Look for the field labeled **[!UICONTROL Published Server Name]**. If you are currently using a generic Dynamic Media Classic domain, you can request moving over to your own custom domain as part of this transition.

    * Indicate if you want it to work over HTTP/2.

1. Adobe Customer Support adds you to the Smart Imaging customer Wait List based on the order in which requests are submitted.
1. When Adobe is ready to handle your request, Customer Support contacts you to coordinate and set a target date.
1. **Optional**: You can optionally test Smart Imaging in Staging before Adobe pushes the new feature to production.
1. You are notified after completion by Customer Support.
1. To maximize the performance improvements of Smart Imaging, Adobe recommends setting the Time To Live (TTL) to 24 hours or longer. The TTL defines how long assets are cached by the CDN. To change this setting:

    1. If you use Dynamic Media Classic, go to **[!UICONTROL Setup]** > **[!UICONTROL Application Setup]** > **[!UICONTROL Publish Setup]** > **[!UICONTROL Image Server]**. Set the **[!UICONTROL Default Client Cache Time To Live]** value to 24 or longer.
    1. If you use Dynamic Media, follow [these instructions](/help/assets/dm-publish-settings.md#common-thumbnail-attributes-tab). Set the **[!UICONTROL Expiration]** value 24 hours or longer.

## When can I expect my account to be enabled with Smart Imaging? {#when-can-i-expect-my-account-to-be-enabled-with-smart-imaging}

Requests are processed in the order in which they are received by Customer Support, according to the Wait List.

>[!NOTE]
>
>There can be a long lead time because enabling Smart Imaging involves Adobe clearing the cache. Therefore, only a few customer transitions can be handled at any given time.

## What are the risks with switching over to use Smart Imaging? {#what-are-the-risks-with-switching-over-to-use-smart-imaging}

There is no risk to a customer web page. However, the transition to Smart Imaging does clear out your CDN cache. This operation involves moving to a new configuration of Dynamic Media Classic or Dynamic Media on Experience Manager.

During the initial transition, the non-cached images directly hit Adobe's origin servers until the cache is rebuilt again. As such, Adobe plans to handle a few customer transitions at a time so that acceptable performance is maintained when pulling requests from the origin. For most customers, the cache is fully built up again at the CDN within ~1 – 2 days.

## How can I verify whether Smart Imaging is working as expected?{#how-can-i-verify-whether-smart-imaging-is-working-as-expected}

1. After your account is configured with Smart Imaging, load a Dynamic Media Classic or Adobe Experience Manager - Dynamic Media image URL on the browser.
1. Open the Chrome developer pane by going to **[!UICONTROL View]** > **[!UICONTROL Developer]** > **[!UICONTROL Developer Tools]** in the browser. Or, choose any browser developer tool of your choice.

1. Ensure that cache is disabled when developer tools are open.

    * On Windows&reg;, navigate to settings in the developer tool pane, then select **[!UICONTROL Disable cache (while devtools is open)]** check box.
    * On macOS, in the developer pane, under the **[!UICONTROL Network]** tab, select **[!UICONTROL disable cache]**.

1. Observe the Content Type is transformed to the appropriate format. The following screenshot shows a PNG image being converted dynamically to WebP on Chrome. If your domain has AVIF enabled, you can also expect to see AVIF in the Content Type.
1. Repeat this test on different browsers and user conditions.

>[!NOTE]
>
>Not all images are converted. Smart Imaging decides if the conversion can improve performance. Sometimes, where there is no expected performance gain or the format is not JPEG or PNG, the image is not converted.

![image2017-11-14_15398](/help/assets/assets/image2017-11-14_15398.png)

## How do I know the performance gain? Is there a way to know the benefits of Smart Imaging? {#benefits}

The Smart Imaging Header determines the benefits of Smart Imaging. When Smart Imaging is enabled, after you request an image, under the **[!UICONTROL Response Headers]** heading, you can see `-X-Adobe-Smart-Imaging` as seen in the following highlighted example:

![Smart imaging header](/help/assets/assets-dm/smart-imaging-header2.png)

This header tells you the following: 

* Smart Imaging is working for the company.
* A positive value means that the conversion is successful. In this case, a new WebP image is returned.
* A negative value means that the conversion is not successful. In such case, the original requested image is returned (JPEG by default, if not specified).
* A positive value shows the difference in bytes between the requested image and the new image. In the example above, the bytes saved is `75048` or approximately 75 KB for one image. 
* A negative value means that the requested image is smaller than the new image. The negative size difference is shown, but the image served is the original requested image only.

>[!NOTE]
>
>**X-Adobe-Smart-Imaging = -1 with WebP being delivered**
>
>If the value of `X-Adobe-Smart-Imaging` is -1 and WebP is still being delivered, it means that Smart Imaging is working but the size benefits were not calculated due to old cache. You can use `cache=update` (one time only) in the image's URL to fix this issue. 
>An example of using the modifier:
>`https://smartimaging.scene7.com/is/image/SmartImaging/sample1?cache=update`
>To invalidate the entire cache, you must create a support case.

## How can I disable AVIF optimization in Smart Imaging?{#disable-avif}

If you want to switch back to serving WebP by default, create a support case for the same. As usual, you can turn off Smart Imaging by adding the parameter `bfc=off` to the image's URL. However, you cannot select WebP or AVIF in the URL modifier for Smart Imaging. This ability is maintained at your company account-level.

## Can Smart Imaging be turned off for any request?{#turning-off-smart-imaging}

Yes. You can turn off Smart Imaging by adding any of the following modifiers:

* `bfc=off` to turn off Browser Format Conversion. See also [Browser Format Conversion](#bfc).
* `dpr=off` to turn off Device Pixel Ratio. See also [Device Pixel Ratio](#dpr).
* `network=off` to turn off network bandwidth. See also [Network Bandwidth](#network).

## What "tuning" is available? Are there any settings or behaviors that can be defined? {#tuning-settings}

Smart Imaging has three options that you can enable or disable. 

* [Browser Format Conversion](#bfc)
* [Device Pixel Ratio](#dpr)
* [Network Bandwidth](#network)

## I have a URL with fmt=tif on Chrome Web Browser. But my request fails with an ImageServer Error. Why? {#fmt-tif}

This error does not occur if Smart Imaging is not enabled on your account. Smart Imaging works with either JPEG or PNG formats only. 

To avoid this error, you can either:

* Specify JPEG or PNG, or
* Not use the `fmt` modifier at all, or
* Use a browser-preferred format defined by Smart Imaging. For example, you can use WebP for Chrome web browser.

## I want to download a TIFF image from an image's URL. How do I do that? {#download-tif}

Add `fmt=tif` and `bfc=off` to image's URL path.

## Does Smart Imaging only manage image format or does it also manage the image quality settings for best results?

Smart Imaging uses both format and quality. The rest of the parameters remain the same, if requested in the image's URL.

## If Smart Imaging does manage the quality settings, are there minimums and maximums I can set? In other words, a quality that is no lower than 60 and no greater than 80? {#quality-setting}

Currently there is no such provisioning.

## Does Smart Imaging automatically adjust the percent quality output setting or is that a setting that is adjusted manually, and it applies to all images? Within what range? {#percent-quality}

Smart Imaging automatically adjusts the quality percent. This quality percent is determined using a machine learning algorithm developed by Adobe. This percent is not range-specific.

## With Smart Imaging, which image serving commands are supported or ignored? {#support-ignore}

The only commands that are ignored are `fmt` and `qlt`. All remaining commands are supported.

## Are only JPEG images replaced by Smart Imaging? What if I request a WebP, PNG, or something else? {#replace-request}

This functionality works for JPEG and PNG only.

## Why is a JPEG image sometimes returned to Chrome instead of WebP? {#jpeg-returned}

Smart Imaging determines if the conversion is beneficial or not. It returns the new image only of the conversion is beneficial.

## Why does Device Pixel Ratio (dpr) functionality not work as expected with composite images? {#composite-images}

If a composite image involves too many layers, dpr functionality may be impacted while using a position modifier. This issue is known and will be fixed in future releases of Smart Imaging. If other Smart Imaging functionality is not working as expected, you can create a support case to report the issue.

## Why does Smart Imaging PNG still convert to lossless WebP/AVIF? {#convert-to-lossless}

Because PNG is a lossless format, earlier WebP and AVIF being delivered were lossless resulting is higher size than expected. Smart Imaging now supports lossy conversion. You can use the modifier `cache=update` (one time only) in an image request to fix this issue. An example of using this modifier:

`https://smartimaging.scene7.com/is/image/SmartImaging/sample1?cache=update`

To invalidate the entire cache, you must create a support case requesting such effort.

## How can I continue using PNG to lossless conversion in Smart Imaging? {#continue-using}

Smart Imaging now supports lossy conversion based on the quality level. To continue using lossless conversion, you can use 100 quality that is set either by way of your company's setting, or through the image's URL using `qlt=100` in the path.
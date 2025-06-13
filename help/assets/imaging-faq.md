---
title: Smart Imaging
description: Smart Imaging applies each user's unique viewing characteristics to serve the right images optimized automatically for their experience, resulting in better performance and engagement.
contentOwner: Rick Brough
topic-tags: dynamic-media
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/ASSETS

feature: Asset Management,Renditions
role: User, Admin
exl-id: e427d4ee-d5c8-421b-9739-f3cf2de36e41
solution: Experience Manager, Experience Manager Assets
---
# Smart Imaging {#smart-imaging}

Smart Imaging applies each user's unique viewing characteristics to serve the right images optimized automatically for their experience, resulting in better performance and engagement.

## About Smart Imaging {#what-is-smart-imaging}

Smart Imaging technology applies Adobe Sensei AI capabilities and works with existing "image presets." It works to enhance image delivery performance by automatically optimizing image format, size, and quality based on client browser capabilities.

And now, get a better Google Core Web Vital score for LCP (Largest Contentful Paint) with improved Smart Imaging, which now comes with both AVIF and WebP support.

>[!IMPORTANT]
>
>Smart Imaging requires that you use the out-of-the-box CDN (Content Delivery Network) that is bundled with Adobe Experience Manager - Dynamic Media. Any other custom CDN is not supported with this feature.

>[!TIP]
>
>Try out and discover the benefits of Dynamic Media image modifiers and Smart Imaging, using Dynamic Media [_Snapshot_](https://snapshot.scene7.com/).
>
>Snapshot is a visual demonstration tool, designed to illustrate the power of Dynamic Media for optimized and dynamic image delivery. Experiment with test images or Dynamic Media URLs, to observe the output of various Dynamic Media image modifiers visually, and Smart Imaging optimizations for the following:
>
>* File size (with WebP and AVIF delivery)
>* Network bandwidth
>* DPR (Device Pixel Ratio) 
>
>To learn how easy it is to use Snapshot, play the [Snapshot training video](https://experienceleague.adobe.com/en/docs/experience-manager-learn/assets/dynamic-media/images/dynamic-media-snapshot) (3 minutes and 17 seconds).

Smart Imaging benefits from the added performance boost of being fully integrated with Adobe's best-in-class premium CDN (Content Delivery Network) service. This service finds the optimal Internet route between servers, networks, and peering points. It finds a route that has the lowest latency and lowest packet loss rate instead of using the default route on the Internet.

The following image asset examples depict the added Smart Imaging optimization:

| Image (URL) | Thumbnail | Size (JPEG) | Size (WebP) with Smart Imaging | Size (AVIF) with Smart Imaging | % reduction with WebP | % reduction with AVIF |
|---|---|---|---|---|---|---|
| [Image 1](https://techsupport.scene7.com/is/image/TechSupport/SmartImaging_6?hei=500&fmt=jpg&qlt=85&resmode=bisharp&op_usm=5,0.125,5,0) | ![picture1](/help/assets/assets-dm/picture1.png) | 145 KB | 106 KB | 90.2 KB | 26.89% | 37.79% |
| [Image 2](https://techsupport.scene7.com/is/image/TechSupport/SmartImaging_3?hei=500&fmt=jpg&qlt=85&resmode=bisharp&op_usm=5,0.125,5,0) | ![picture2](/help/assets/assets-dm/picture2.png) | 412 KB | 346 KB | 113 KB | 16.01% | 72.57% |
| [Image 3](https://techsupport.scene7.com/is/image/TechSupport/SmartImaging_2?hei=500&fmt=jpg&qlt=85&resmode=bisharp&op_usm=5,0.125,5,0) | ![picture3](/help/assets/assets-dm/picture3.png) | 221 KB | 189 KB | 87.1 KB | 14.47% | 60.58% |
| [Image 4](https://techsupport.scene7.com/is/image/TechSupport/SmartImaging_1?hei=500&qlt=85&resmode=bisharp&op_usm=5,0.125,5,0) | ![picture4](/help/assets/assets-dm/picture4.png) | 594 KB | 545 KB | 286 KB | 8.25% | 51.85% |

Similar to the above, Adobe also ran a test with a larger sample set. The format AVIF provided 20% extra size reduction over WebP, which provided 27% reduction over JPEG. All at the same visual quality. In total, AVIF provides up to 41% average size reduction over JPEG.

Compare WebP and AVIF to PNG, you can see an 84% size reduction with WebP and 87% with AVIF. And, because both WebP and AVIF formats support transparency and multiple image animations, it is a good replacement for transparent PNG and GIF files.

See also [Image Optimization with Next-gen Image Formats (WebP and AVIF)](https://medium.com/adobetech/image-optimisation-with-next-gen-image-formats-webp-and-avif-248c75afacc4)

<!-- HIDDEN ON MAY 19, 2022 BASED ON CQDOC-19280 On the mobile web, the challenges are compounded by two factors:

* Large variety of devices with different form factors and high-resolution displays.
* Constrained network bandwidth.

In terms of images, the goal is to serve the best quality images as efficiently as possible. -->

## Benefits of Smart Imaging {#what-are-the-key-benefits-of-smart-imaging}

Smart Imaging enhances image delivery by automatically optimizing file size based on the user's browser, device display, and network conditions. This approach ensures faster loading times and a better viewing experience across different environments. Because images constitute most of a page's load time, any performance improvement can have a profound impact on business KPIs such as the following:

* Higher conversion rates.
* Time spent on a site.
* Lower site bounce rates.

The newest key benefits of the latest Smart Imaging include the following:

* Supports next generation AVIF format.
* PNG to WebP and AVIF now supports lossy conversion. Because PNG is a lossless format, earlier WebP and AVIF being delivered were lossless.
* Browser Format Conversion (`bfc`)
* Device Pixel Ratio (`dpr`)
* Network bandwidth (`network`)

### About Browser Format Conversion (bfc) {#bfc} 

Turning on Browser Format Conversion by appending `bfc=on` to the image URL automatically converts JPEG and PNG to lossy AVIF, lossy WebP, lossy JPEGXR, lossy JPEG2000 for different browsers. For browsers that do not support those formats, Smart Imaging continues to serve the JPEG or PNG. Smart Imaging recalculates the quality of the new format along with the format change.

You can turn off Smart Imaging by appending `bfc=off` to the image's URL.

See also [bfc](https://experienceleague.adobe.com/en/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/http-protocol-reference/command-reference/r-bfc) in the Dynamic Media Image Serving and Rendering API.

### About Device Pixel Ratio (dpr) optimization {#dpr}

Device Pixel Ratio (DPR), also called CSS Pixel Ratio, represents the relationship between a device's physical pixels and logical pixels. With the rise of retina displays, the pixel resolution of modern mobile devices has been rapidly increasing.

Enabling Device Pixel Ratio optimization renders the image at the native resolution of the screen, which makes it sharp.

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

### About network bandwidth optimization {#network}

Turning on network bandwidth automatically adjusts the image quality that is served based on actual network bandwidth. For poor network bandwidth, DPR (Device Pixel Ratio) optimization is automatically turned off, even if it is already on.

Your company can disable network bandwidth optimization for individual images by appending `network=off` to the image URL.

| Permitted value in the URL of an image | Description |
|---|---|
| `network=off` | Turns off network optimization at an individual image URL level. |

DPR and network bandwidth values are based on the detected client-side values of the bundled CDN. These values are sometimes inaccurate. For example, iPhone5 with DPR=2 and iPhone12 with `dpr=3`, both show `dpr=2`. Still, for high-resolution devices, sending `dpr=2` is better than sending `dpr=1`. The best way to overcome this inaccuracy, however, is to use client-side DPR to give you 100% accurate values. And it works for any device, whether it is Apple or any other device that was launched. See [Use Smart Imaging with client-side Device Pixel Ratio](/help/assets/client-side-dpr.md).

### Additional key benefits of Smart Imaging

* Improved Google SEO ranking for web pages that use the latest Smart Imaging.
* Serves optimized content immediately (at runtime).
* Uses Adobe Sensei technology to convert according to the quality (`qlt`) specified in the image request.
* TTL (Time To Live) independent. Previously, a minimum TTL of 12 hours was mandatory for Smart Imaging to work.
* Previously, both the original and derivative images were cached, and it was a 2-step process to invalidate the cache. In the latest Smart Imaging, only the derivatives get cached, allowing a single-step cache invalidation process.
* Customers that use custom headers in their ruleset benefit from the latest Smart Imaging, as these headers are not blocked, unlike the previous version of Smart Imaging.

## Frequently asked questions

+++Are there any licensing costs associated with Smart Imaging?

No. Smart Imaging is included with your existing license. This rule is true for either Dynamic Media Classic or Experience Manager - Dynamic Media (On-prem, AMS, and Experience Manager as a Cloud Service).

>[!NOTE]
>
>Smart Imaging is not available to Dynamic Media - Hybrid customers.

+++

+++How does Smart Imaging work?

When a consumer requests an image, Smart Imaging analyzes the user characteristics and converts it to the appropriate format based on the browser. These format conversions are done in a manner that does not degrade visual fidelity. Smart imaging automatically converts images to different formats based on browser capability in the following manner.

* Automatically convert to AVIF if your browser supports the format
* Automatically convert to WebP if AVIF conversion was not beneficial or the browser does not support AVIF
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

+++

+++What image formats are supported?

The following image formats are supported for Smart Imaging:

* JPEG
* PNG

Smart Imaging recalculates the quality for JPEG image file formats when converting to a new format.

For image file formats that support transparency like PNG, you can configure Smart Imaging to deliver lossy AVIF and WebP. For the lossy format conversion, Smart Imaging uses the quality mentioned in the image's URL, or else the quality configured in the Dynamic Media company account.

+++

+++How does Smart Imaging work with my existing image presets that are already in use?

Smart Imaging seamlessly integrates with your existing image presets, respecting all your image settings.

The only adjustments involve the image format, or quality, or both. During format conversion, Smart Imaging preserves full visual fidelity according to your preset settings but delivers a smaller file size. Just enable it by adding `bfc=on`, or `dpr=on,dprValue`, or `network=on`, or all three parameter settings to your existing URLs or presets.

For example, let's say an image preset specifies a JPEG format at 500 &times; 500 pixels, with `quality=85`, and `unsharp mask=0.1,1,5`. Smart Imaging detects if the user is on a Chrome browser. It then converts the image to WebP with the same dimensions (500 &times; 500) and an unsharp mask matching the JPEG's settings. The system then compares the file sizes of the WebP and JPEG versions and serves the smaller one to the user.

+++

<!--

### Do I have to change any URLs, image presets, or deploy any new code on my site for Smart Imaging? 

No. Smart Imaging works seamlessly with your existing image URLs and image presets. In addition, Smart Imaging does not require you to add code to your website to detect a user's browser. All of this functionality is handled automatically.

<!-- Smart Imaging works seamlessly with your existing image URLs and image presets if you configure Smart Imaging on your existing custom domain. In addition, Smart Imaging does not require you to add any code on your website to detect a user's browser. It is all handled automatically.

In case you must configure a new custom domain to use Smart Imaging, the URLs must be updated to reflect this custom domain.

To understand pre-requisites for Smart Imaging, see [Am I eligible to use Smart Imaging?](#am-i-eligible-to-use-smart-imaging) -->

<!-- OLD As mentioned earlier, Smart Imaging supports only JPEG and PNG image formats. For other formats, you need to append the `bfc=off` modifier to the URL as described earlier. -->

+++Does Smart Imaging working with HTTPS? How about HTTP/2?

Smart Imaging works with images delivered over HTTP or HTTPS. In addition, it also works over HTTP/2.

+++

+++Am I eligible to use Smart Imaging?

Smart Imaging is available immediately for all customers. To start enjoying its benefits, just add `bfc=on`, or `dpr=on,dprValue`, or `network=on`, or all three parameter settings to your existing URLs or presets.

To use Smart Imaging, your company's Dynamic Media Classic or Dynamic Media on Experience Manager account must include the Adobe bundled CDN (Content Delivery Network) as part of your license.

+++

+++What is the process to enable Smart Imaging for an account? 

To start using Smart Imaging, append `bfc=on`, or `dpr=on,dprValue`, or `network=on`, or all three parameter settings to your existing URLs or presets. If you prefer not to make these changes manually, you can enable Smart Imaging by default by creating a support case.

When creating the support case, specify which Smart Imaging features you want activated on your account: 

* Browser Format Conversion (WebP or AVIF)  
* Network Bandwidth Optimization  

>[!NOTE]
>
>DPR requires client-side adjustments to determine the correct `dprValue`. Therefore, Adobe recommends enabling DPR through URLs by appending `dpr=on,dprValue`.

**To create a support case to enable Smart Imaging on your account:**

1. [Use the Admin Console to start the creation of a new support case](https://helpx.adobe.com/enterprise/using/support-for-experience-cloud.html).
1. Provide the following information in your support case:

    * **Primary contact details:**
    
        * Provide your name, email, and phone number.

    * **Smart Imaging features to enable:** 
    
        * List the capabilities that you want for your account:

            * Browser format conversion: WebP or AVIF
            * Network bandwidth optimization
            * DPR: DPR requires client-side adjustments to determine the correct `dprValue`. Therefore, Adobe recommends enabling DPR through URLs by appending `dpr=on,dprValue`.
    
    * **Domain for Smart Imaging:** 
    
        * List all relevant domains, such as *`company.com`* or *`mycompany.scene7.com`*
        * Smart Imaging supports both generic and custom domains.
        * To identify your domains, open the [Dynamic Media Classic desktop application](https://experienceleague.adobe.com/en/docs/dynamic-media-classic/using/getting-started/signing-out#getting-started) and sign in to your company account. 

            1. Navigate to **[!UICONTROL Setup]** > **[!UICONTROL Application Setup]** > **[!UICONTROL General Settings]**.  
            1. Look for the **[!UICONTROL Published Server Name]** field to confirm your domain.
            1. Verify that you are using Adobe's CDN rather than one managed by another provider.

    * **Indicate HTTP/2 support:**
    
        * Specify if you need Smart Imaging to work over HTTP/2.

1. Adobe Customer Support enables the requested Smart Imaging features by default, eliminating the need to append parameters manually to URLs.
1. Adobe recommends setting the Time To Live (TTL) to at least 24 hours to maximize performance through caching. 
To adjust the TTL:

    1. **For Dynamic Media Classic:**
        1. Navigate to **[!UICONTROL Setup]** > **[!UICONTROL Application Setup]** > **[!UICONTROL Publish Setup]** > **[!UICONTROL Image Server]**. 
        1. Set the **[!UICONTROL Default Client Cache Time To Live]** value to 24 hours or more.
    1. **For Dynamic Media on Adobe Experience Manager:**
        1. Follow [these instructions](/help/assets/dm-publish-settings.md#common-thumbnail-attributes-tab).
        1. Set the **[!UICONTROL Expiration]** value for 24 hours or more.

+++

+++When can I expect an account to be enabled with Smart Imaging?

Customer Support processes requests in the order that they receive them, following the Wait List.

>[!NOTE]
>
>There can be a long lead time because enabling Smart Imaging involves Adobe clearing the cache. Therefore, only a few customer transitions can be handled at any given time.

+++

+++What are the risks with switching over to use Smart Imaging?

There is no risk to a customer web page. However, the transition to Smart Imaging does clear out your CDN cache. This operation involves moving to a new configuration of Dynamic Media Classic or Dynamic Media on Experience Manager.

During the initial transition, the non-cached images directly hit Adobe's origin servers until the cache is rebuilt again. As such, Adobe plans to handle a few customer transitions at a time so that acceptable performance is maintained when pulling requests from the origin. For most customers, the cache is fully built up again at the CDN within ~1 – 2 days.

+++

+++How can I verify whether Smart Imaging is working as expected?

1. After your account is configured with Smart Imaging, load a Dynamic Media Classic or Adobe Experience Manager - Dynamic Media image URL in the browser.
1. Open the Chrome developer pane by going to **[!UICONTROL View]** > **[!UICONTROL Developer]** > **[!UICONTROL Developer Tools]** in the browser. Or, choose any browser developer tool of your choice.

1. Ensure that the cache is disabled when developer tools are open.

    * On Windows&reg;, navigate to settings in the developer tool pane, then select **[!UICONTROL Disable cache (while devtools is open)]** check box.
    * On macOS, in the Developer pane, under the **[!UICONTROL Network]** tab, select **[!UICONTROL disable cache]**.

1. Observe the Content Type is transformed to the appropriate format. The following screenshot shows a PNG image being converted dynamically to WebP on Chrome. If your domain has AVIF enabled, you can also expect to see AVIF in the Content Type.
1. Repeat this test on different browsers and user conditions.

>[!NOTE]
>
>Not all images are converted. Smart Imaging decides if the conversion can improve performance. Sometimes, where there is no expected performance gain or the format is not JPEG or PNG, the image is not converted.

![image2017-11-14_15398](/help/assets/assets/image2017-11-14_15398.png)

+++

+++How do I know the performance gain? Is there a way to know the benefits of Smart Imaging?

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
>If the value of `X-Adobe-Smart-Imaging` is -1 and WebP is still being delivered, Smart Imaging is active. However, the size benefits were not calculated because of outdated cache. You can use `cache=update` (one time only) in the image's URL to fix this issue. 
>An example of using the modifier:
>`https://smartimaging.scene7.com/is/image/SmartImaging/sample1?cache=update`
>To invalidate the entire cache, you must create a support case.

+++

+++How can I disable AVIF optimization in Smart Imaging?

If you want to switch back to serving WebP by default, create a support case for the same. As usual, you can turn off Smart Imaging by adding the parameter `bfc=off` to the image's URL. However, you cannot select WebP or AVIF in the URL modifier for Smart Imaging. This ability is maintained at your company account-level.

+++

+++Can Smart Imaging be turned off for any request?

Yes. You can turn off Smart Imaging by adding any of the following modifiers:

* `bfc=off` to turn off Browser Format Conversion. See also [Browser Format Conversion](#bfc).
* `dpr=off` to turn off Device Pixel Ratio. See also [Device Pixel Ratio](#dpr).
* `network=off` to turn off network bandwidth. See also [Network Bandwidth](#network).

+++

+++What "tuning" is available? Are there any settings or behaviors that can be defined?

Smart Imaging has three options that you can enable or disable. 

* [Browser Format Conversion](#bfc)
* [Device Pixel Ratio](#dpr)
* [Network Bandwidth](#network)

+++

+++I have a URL with fmt=tif on the Chrome Web browser. But my request fails with an ImageServer Error. Why?

This error does not occur if Smart Imaging is not enabled on your account. Smart Imaging works with either JPEG or PNG formats only. 

To avoid this error, you can either:

* Specify JPEG or PNG, or
* Not use the `fmt` modifier at all, or
* Use a browser-preferred format defined by Smart Imaging. For example, you can use WebP for the Chrome Web browser.

+++

+++I want to download a TIFF image from an image's URL. How do I do that?

Add `fmt=tif` and `bfc=off` to image's URL path.

+++

+++Does Smart Imaging only manage image format or does it also manage the image quality settings for the best results?

Smart Imaging uses both format and quality. The rest of the parameters remain the same, if requested in the image's URL.

+++

+++If Smart Imaging does manage the quality settings, are there minimums and maximums I can set? In other words, a quality that is no lower than 60 and no greater than 80?

Currently there is no such provisioning.

+++

+++Does Smart Imaging automatically adjust the percent quality output setting or is that a setting that is adjusted manually, and it applies to all images? Within what range?

Smart Imaging automatically adjusts the quality percent. This quality is determined using a machine learning algorithm developed by Adobe. This percent is not range-specific.

+++

+++With Smart Imaging, which Image Serving commands are supported or ignored?

The only commands that are ignored are `fmt` and `qlt`. All remaining commands are supported.

+++

+++Are only JPEG images replaced by Smart Imaging? What if I request a WebP, PNG, or something else?

This functionality works for JPEG and PNG only.

+++

+++Why is a JPEG image sometimes returned to Chrome instead of WebP?

Smart Imaging determines if the conversion is beneficial or not. It returns the new image only of the conversion is beneficial.

+++

+++Why does Device Pixel Ratio (dpr) functionality not work as expected with composite images?

If a composite image involves too many layers, dpr functionality may be impacted while using a position modifier. This issue is known and should be fixed in future releases of Smart Imaging. If other Smart Imaging functionality is not working as expected, you can create a support case to report the issue.

+++

+++Why does Smart Imaging PNG still convert to lossless WebP/AVIF?

Because PNG is a lossless format, earlier WebP and AVIF being delivered were lossless, resulting is higher size than expected. Smart Imaging now supports lossy conversion. You can use the modifier `cache=update` (one time only) in an image request to fix this issue. An example of using this modifier:

`https://smartimaging.scene7.com/is/image/SmartImaging/sample1?cache=update`

To invalidate the entire cache, you must create a support case requesting such effort.

+++

+++How can I continue using PNG to lossless conversion in Smart Imaging?

Smart Imaging now supports lossy conversion based on the quality level. You can continue using lossless conversion by setting the quality to 100, either through your company's settings, or by adding `qlt=100` to the image's URL path.

+++


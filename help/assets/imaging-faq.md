---
title: Smart imaging
description: Smart imaging leverages each user's unique viewing characteristics to automatically serve the right images optimized for their experience, resulting in better performance and engagement.
uuid: c11e52ba-8d64-4dc5-b30a-fc10c2b704e5
contentOwner: Rick Brough
topic-tags: dynamic-media
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
discoiquuid: bf8c6bbd-847d-43d7-9ff4-7231bfd8d107
---

# Smart Imaging {#smart-imaging}

## What is "Smart Imaging"? {#what-is-smart-imaging}

Smart Imaging technology leverages Adobe Sensei AI capabilities and works with existing "image presets" to enhance image delivery performance by automatically optimizing image format, size, and quality based on client browser capabilities.

Smart Imaging also benefits from the added performance boost of being fully integrated with Adobe’s best-in-class premium CDN service. This service finds the optimal internet route between servers, networks, and peering points that has lowest latency, and/or packet loss rate than the default route on the Internet.

The following image asset examples depict the added Smart Imaging optimisation:

| Image<br>(URL) | Thumbnail | Size<br> (JPEG) | Size (WebP)<br> (with ***Smart Imaging***) | % reduction |
|---|:---:|:---:|:---:|:---:|:---:|
| [Image 1](https://techsupport.scene7.com/is/image/TechSupport/SmartImaging_6?hei=500&fmt=jpg&qlt=85&resmode=bisharp&op_usm=5,0.125,5,0) | ![picture1](assets-dm/picture1.png) | 73.75 KB | 45.92 KB | 38% |
| [Image 2](https://techsupport.scene7.com/is/image/TechSupport/SmartImaging_3?hei=500&fmt=jpg&qlt=85&resmode=bisharp&op_usm=5,0.125,5,0) | ![picture2](assets-dm/picture2.png) | 191 KB | 70.66 KB | 63% |
| [Image 3](https://techsupport.scene7.com/is/image/TechSupport/SmartImaging_2?hei=500&fmt=jpg&qlt=85&resmode=bisharp&op_usm=5,0.125,5,0) | ![picture3](assets-dm/picture3.png) | 96.64 KB | 39.44 KB | 59% |
| [Image 4](https://techsupport.scene7.com/is/image/TechSupport/SmartImaging_1?hei=500&qlt=85&resmode=bisharp&op_usm=5,0.125,5,0) | ![picture4](assets-dm/picture4.png) | 315.80 KB | 178.19 KB | 44% |
| | | | |  Average = 51% |

Similar to the above, Adobe also ran a test with 7009 URLs from live customer sites, and were able to achieve an average of 38% further file size optimisation for JPEG and 31% further file size optimisation for PNG with WebP format, owing to the capability of Smart Imaging.

## What are the key benefits of the latest Smart Imaging? {#what-are-the-key-benefits-of-smart-imaging}

Because images constitute a majority of a page's load time, the performance improvement can have a profound impact on business KPIs such as higher conversion, time spent on site, and lower site bounce rate.

Enhancements in latest version of Smart Imaging:

* Serves optimized content immediately (at run-time).
* Uses Adobe Sensei technology to convert according to the quality (qlt) specified in the image request.
* Smart Imaging can be turned off using the “bfc” URL parameter.
* TTL (Time To Live) independent. Previously, a minimum TTL of 12 hours was mandatory for Smart Imaging to work.
* Previously, both the original and derivative images were cached, and it was a 2 step process to invalidate cache. In latest Smart Imaging, only the derivatives get cached, allowing a single step cache invalidation process.
* Customers making use of custom headers in their ruleset (for example, “Timing Allow Origin”, “X-Robot” as suggested in [Adding a custom header value to image responses|Dynamic Media Classic](https://helpx.adobe.com/in/experience-manager/scene7/kb/base/scene7-rulesets/add-custom-header-val-image.html)) will benefit from the latest Smart Imaging, as these headers are not blocked, unlike the previous version of Smart Imaging.

## Are there any licensing costs associated with smart imaging? {#are-there-any-licensing-costs-associated-with-smart-imaging}

No. Smart Imaging is included with your existing license of either Dynamic Media Classic (Scene7) or AEM Dynamic Media (On Prem, AMS, and AEM as a Cloud Service). 

>[!NOTE]
>
>Smart Imaging is not available to Dynamic Media &ndash; Hybrid customers.


## How does smart imaging work? {#how-does-smart-imaging-work}

Smart Imaging uses Adobe Sensei to automatically convert images to the most optimal format, size, and quality, based on browser capability:

* Automatically convert to WebP for browsers such as Chrome, Firefox, Microsoft Edge, Android, and Opera.
* Automatically convert to JPEG2000 for browsers such as Safari.
* Automatically convert to JPEG for browsers such as Internet Explorer 9+.
* For browsers that do not support these formats, the originally requested image format is served.

If the original image size is smaller than what Smart Imaging produces, then the original image is served.

## What image formats are supported? {#what-image-formats-are-supported}

The following image formats are supported for Smart Imaging:
* JPEG
* PNG

For any other format mentioned in a URL, you should explicity turn off Smart Imaging.  Append modifier `bfc=off` to the URL for file formats other than JPEG and PNG. You can accomplish this by using either one of the following methods:

* Use a ruleset if the `fmt` modifier is mentioned in the URL. 
* Append in URL modifiers field of the presets concerned.

Adobe is working on a permanent fix that does not require you to append `bfc=off` for `fmt !=JPEG` or `fmt !=PNG`. This topic will be updated after the fix is delivered.


## How does Smart Imaging work with our existing image presets that are already in use? {#how-does-smart-imaging-work-with-our-existing-image-presets-that-are-already-in-use}

Smart Imaging works with your existing “image presets” and observes all of your image settings with the exception of quality (qlt) and format (fmt) if the requested file format is JPEG or PNG. For format conversion, we maintain full visual fidelity as defined by your image preset settings, but at a smaller file size. If original image size is smaller than what Smart Imaging produces, then the original image is served.

In addition, if your image presets are used to return `fmt !=JPEG` or `fmt !=PNG`, be sure append `bfc=off` in the preset modifier field to return the requested file format.

## Will I have to change any URLs, image presets, or deploy any new code on my site for Smart Imaging? {#will-i-have-to-change-any-urls-image-presets-or-deploy-any-new-code-on-my-site-for-smart-imaging}

Smart Imaging works seamlessly with your existing image URLs and image presets. In addition, Smart Imaging does not require you to add any code on your website to detect a user's browser. All of this is handled automatically.

As mentioned earlier, Smart Imaging supports only JPEG and PNG image formats. For other formats, you need to append the `bfc=off` modifier to the URL as described earlier.

Also, see [Am I eligible to use Smart Imaging?](#am-i-eligible-to-use-smart-imaging) to understand pre-requisites for Smart Imaging.

## Does Smart Mmaging working with HTTPS? How about HTTP/2? {#does-smart-imaging-working-with-https-how-about-http}

Smart Imaging works with images delivered over HTTP or HTTPS. In addition, it also works over HTTP/2.

## Am I eligible to use smart imaging? {#am-i-eligible-to-use-smart-imaging}

To use Smart Imaging, your company's Dynamic Media Classic or Dynamic Media on AEM account must meet the following requirements:

* Use the Adobe-bundled CDN (Content Delivery Network) as part of your license.
* Use a dedicated domain (for example, `images.company.com` or `mycompany.scene7.com`), not a generic domain (for example, `s7d1.scene7.com`, `s7d2.scene7.com`, or `s7d13.scene7.com`). 

To find your domains, log in to your company account or accounts.  
  
Tap **[!UICONTROL Setup > Application Setup > General Settings]**. Look for the field labeled **[!UICONTROL Published Server Name]**. If you are currently using a generic domain, you can request moving over to your own custom domain as part of this transition when you submit a technical support ticket.

Your first custom domain is no additional cost with a Dynamic Media license.

## What is the process for enabling Smart Imaging for my account? {#what-is-the-process-for-enabling-smart-imaging-for-my-account}

You must initiate the request to use smart imaging; it is not automatically enabled.

1. Initiate a Technical Support request (email: s7support@adobe.com).
1. Provide the following information in your support request:

    1. Primary contact name, email, phone.
    1. All domains to be enabled for smart imaging (that is, images.company.com or mycompany.scene7.com).

       To find your domains, log into your company account or accounts. 

       Click **[!UICONTROL Setup > Application Setup > General Settings]**.  

       Look for the field labeled **[!UICONTROL Published Server Name]**.
    1. Verify that you are using the CDN through Adobe and not managed with a direct relationship.
    1. Verify you are using a dedicated domain such as `images.company.com` or `mycompany.scene7.com`, and not a generic domain, such as `s7d1.scene7.com`, `s7d2.scene7.com`, `s7d13.scene7.com`.  

       To find your domains, log into your company account or accounts.

       Click **[!UICONTROL Setup > Application Setup > General Settings]**.  

       Look for the field labeled **[!UICONTROL Published Server Name]**. If you are currently using a generic Dynamic Media Classic domain, you can request moving over to your own custom domain as part of this transition.
    1. Indicate if you also need this to work over HTTP/2.

1. Technical Support will add you to the Smart Imaging customer Wait List based on the order in which requests were submitted.
1. When Adobe is ready to handle your request, support will contact you to coordinate and set a target date.
1. **Optional**: You have the option to test smart imaging in Staging before Adobe pushes the new feature to production.
1. You are notified after completion by support.
1. To maximize the performance improvements of Smart Imaging, Adobe recommends setting the Time To Live (TTL) to 24 hours or longer. The TTL defines how long assets are cached by the CDN. To change this setting:

    1. If you use Dynamic Media Classic, click **[!UICONTROL Setup > Application Setup > Publish Setup > Image Server]**. Set the **[!UICONTROL Default Client Cache Time To Live]** value to 24 or longer.
    1. If you use Dynamic Media, follow [these instructions](config-dynamic.md). Set the **[!UICONTROL Expiration]** value 24 hours or longer.

## When can I expect my account to be enabled with Smart Imaging? {#when-can-i-expect-my-account-to-be-enabled-with-smart-imaging}

Requests are processed in the order in which they are received by Technical Support, according to the Wait List.

>[!NOTE]
>
>There may be a long lead time because enabling Smart Imaging involves Adobe clearing the cache. Therefore, only a few customer transitions can be handled at any given time.

## What are the risks with switching over to use Smart Imaging? {#what-are-the-risks-with-switching-over-to-use-smart-imaging}

There is no risk to a customer web page. However, you should be aware that the transition to Smart Imaging clears out your cache at the CDN because it involves moving to a new configuration of Dynamic Media Classic or Dynamic Media on AEM.

During the initial transition, the non-cached images directly hits Adobe's origin servers until the cache is rebuilt again. Because of this, Adobe plans to handle a few customer transitions at a time so that acceptable performance is maintained when pulling requests from our origin. For most customers, the cache is fully built up again at the CDN within ~1 to 2 days.

## How can I verify whether smart imaging is working as expected?  {#how-can-i-verify-whether-smart-imaging-is-working-as-expected}

1. After your account is configured with smart imaging, load a Dynamic Media Classic (Scene7)/Dynamic Media image URL on the browser.
1. Open the Chrome developer pane by clicking **[!UICONTROL View > Developer > Developer Tools]** in the browser. Or, choose any browser developer tool of your choice.

1. Ensure that cache is disabled when developer tools is open.

    * On Windows &ndash; navigate to settings in the developer tool pane, then select **[!UICONTROL Disable cache (while devtools is open)]** checkbox.
    * On Mac &ndash; in the developer pane, under the **[!UICONTROL Network]** tab, select **[!UICONTROL disable cache]** .

1. Observe the Content Type is transformed to the appropriate format. The following screenshot shows a PNG image being converted dynamically to WebP on Chrome.
1. Repeat this test on different browsers and user conditions.

>[!NOTE]
>
>Not all images are converted. Smart Imaging decides if the conversion is needed to improve performance. In some cases, where there is no expected performance gain or the format is not JPEG or PNG, the image is not converted.

![image2017-11-14_15398](assets/image2017-11-14_15398.png)

## Can Smart Imaging be turned off for any request? {#turning-off-smart-imaging}

Yes. You can turn off Smart Imaging by adding the modifier `bfc=off` to the URL.

## What "tuning" is available? Are there any settings or behaviors that can be defined? (#tuning-settings)

Currently, you can optionally enable or disable Smart Imaging. No other tuning is available.

## If Smart Imaging manages the quality settings, are there minimums and maximums we can set? For example, is it possible to set "no lower than 60" and "no greater than 80 quality"? (#minimum-maximum)

There is no such provisioning ability in the current Smart Imaging.

## In some cases, a JPEG image is returned to Chrome instead of a WebP image. Why does that happen? (#jpeg-webp)

Smart Imaging determines if the conversion is beneficial or not. It returns the new image only if the conversion results in a smaller file size with comparable quality.

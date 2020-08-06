---
title: Invalidating the CDN cache by way of Dynamic Media
description: Invalidating your CDN (Content Delivery Network) cached content lets you quickly update assets that are delivered by Dynamic Media, instead of waiting for the cache to expire.
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5.6/ASSETS
topic-tags: dynamic-media
content-type: reference
---

# Invalidating the CDN cache by way of Dynamic Media {#invalidating-the-cdn-cache-for-dm-assets}

Dynamic Media assets are cached by the CDN (Content Delivery Network) for fast delivery to your customers. However, when you make updates to those assets, you may want those changes to take effect immediately on your website. Purging or invalidating the CDN cache lets you quickly update assets that are delivered by Dynamic Media. Instead of waiting for the cache to expire using a TTL (Time To Live) value (default is 10 hours), you can send a request from within Dynamic Media to have the cache expire immediately.

>[!IMPORTANT]
>
>These steps apply only to Dynamic Media - Scene7 mode in AEM 6.5, Service Pack 6 or later. If you are using Dynamic Media in AEM 6.5, Service Pack 5 or earlier [use the steps found here](/help/assets/invalidate-cdn-cached-content.md).

See also [Caching overview in Dynamic Media](https://helpx.adobe.com/experience-manager/scene7/kb/base/caching-questions/scene7-caching-overview.html).

**To invalidate your CDN cached content for Dynamic Media assets:**

1. In AEM 6.5.6 or later, tap **[!UICONTROL Tools > Assets > CDN Invalidation.]**

    ![CDN Validation feature](/help/assets/assets-dm/cdn-invalidation-path.png)

1. On the CDN Invalidation page, set the options you want:

    | Option | Description |
    | --- | --- |
    | **[!UICONTROL Invalidate asset associated image presets in CDN]** | When you check this option, you can select one or more Dynamic Media assets&ndash;regardless of MIME type&ndash;and their associated image presets for cache invalidation.<br>While you can select one or more folders containing assets, Adobe does not recommend this approach. Instead, you should select individual asset files.<br>Proceeed to the next step.|
    | **[!UICONTROL Invalidation based on template]** | When you check this option, you can select Dynamic Media assets and the Invalidation template you have previously created. Use this option with  |
    | **[!UICONTROL Add Assets]** | Blah |
    | **[!UICONTROL Add URL]** | Manually add full URL paths to Dynamic Media assets whose cache you want to invalidate. |

1. 
1. Tap **[!UICONTROL Next.]**
1. 
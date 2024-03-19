---
title: Invalidate the Content Delivery Network cache by way of Dynamic Media Classic
description: Invalidating your CDN (Content Delivery Network) cached content lets you quickly update assets that are delivered by Dynamic Media Classic, instead of waiting for the cache to expire.
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5.5/ASSETS
topic-tags: dynamic-media
content-type: reference
feature: CDN Cache,Dynamic Media Classic
role: User, Admin
exl-id: 7020343a-b556-4091-9717-93fcc55e623b
solution: Experience Manager, Experience Manager Assets
---
# Invalidate the Content Delivery Network cache by way of Dynamic Media Classic {#invalidating-your-cdn-cached-content}

Dynamic Media assets are cached by the CDN (Content Delivery Network) for fast delivery. However, when you make updates to an asset, you want those changes to take effect immediately. Invalidating your CDN cached content lets you quickly update assets that are delivered by Dynamic Media, instead of waiting for the cache to expire.

>[!NOTE]
>
>This feature requires that you use the out-of-the-box CDN that is bundled with Adobe Experience Manager Dynamic Media. Any other custom CDN is not supported with this feature.

>[!IMPORTANT]
>
>The following steps apply only to Dynamic Media in Adobe Experience Manager 6.5, Service Pack 5 (Experience Manager 6.5.5) or earlier.<br>If you use Dynamic Media in Experience Manager 6.5, Service Pack 6 (Experience Manager 6.5.6) or later, follow the steps found in [Invalidate the CDN cache by way of Dynamic Media](/help/assets/invalidate-cdn-cache-dynamic-media.md).

<!-- REMOVED MARCH 28, 2022 BECAUSE OF 404; NO REDIRECT WAS PUT IN PLACE BY SUPPORT See also [Cache overview in Dynamic Media Classic (Scene7)](https://helpx.adobe.com/experience-manager/scene7/kb/base/caching-questions/scene7-caching-overview.html). -->

**To invalidate the CDN cache by way of Dynamic Media Classic:**

1. Open the [Dynamic Media Classic desktop application](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/intro/dynamic-media-classic-desktop-app.html#system-requirements-dmc-app), then sign in to your account.

      Your credentials and logon were provided by Adobe at the time of provisioning. If you do not have this information, contact Adobe Customer Support.

1. Near the upper-right corner of the page, navigate to **[!UICONTROL Setup]** > **[!UICONTROL Application Setup]** > **[!UICONTROL General Settings]**.
1. On the Application General Settings page, under the Servers group heading, locate the **[!UICONTROL CDN Invalidation Template]** text box.

1. Specify the template that is used for invalidating the CDN (Content Delivery Network) cache.

   For example, suppose you enter an image URL (including image presets or modifiers) referencing `<ID>`, instead of a specific image ID as in the following example:

   `https://server.com/is/image/Company/<ID>?$product$`

   If the Template just contains `<ID>`, then Dynamic Media fills in `https://<server>/is/image` where `<server>` is the Publish Server Name that is defined in General Settings and &lt;ID&gt; is the assets selected to be invalidated.

1. In the lower-right corner of the page, select **[!UICONTROL Close]**.
1. In the Dynamic Media Classic user interface, select one or more assets, then go to **[!UICONTROL File]** > **[!UICONTROL Invalidate CDN]**. You see a list of one or more URLs generated from the template you created and the assets you selected. It uses the server URL listed under "Published Server Name" under the Application General Settings.

   For example, with the CDN Invalidation Template set in the previous step, suppose you selected a single image asset image named `Backpack_B`. When you go to **[!UICONTROL File]** > **[!UICONTROL Invalidate CDN]**, it results in the following generated URL in the CDN Invalidation user interface:

   `https://server.com/is/image/Company/Backpack_B?$product$`

1. In the URL list box, select **[!UICONTROL Continue]** to clear the cache for each specific URL. You can edit a URL or you can add a URL by typing or pasting it into the URL list box; you do not need to set CDN Invalidate Template beforehand.

   After you select **[!UICONTROL Continue]**, an indicator is displayed that gives you an estimate of how long it will take to clear the cache.

   If you selected multiple assets, then went to **[!UICONTROL File]** > **[!UICONTROL Invalidate CDN]**, each asset is referenced in the saved **[!UICONTROL Template URL]**. Therefore, you can define a **[!UICONTROL CDN Invalidate Template]** referencing each URL image preset that is referenced on your website (such as product detail and search results). Then, when you select one or images for invalidation from cache, the URLs automatically populate the interface.

   >[!NOTE]
   >
   >When you select assets, and then go to **[!UICONTROL File]** > **[!UICONTROL Invalidate CDN]**, Dynamic Media uses an invalidate CDN template to automatically create URLs to invalidate from the Content Delivery Network (CDN). If there is nothing in the **[!UICONTROL CDN Invalidate Template]** text box, then you get a blank URL list. Caching at the CDN is not asset-based; it is URL-based. Therefore, it is necessary to be aware of the complete URLs that are on your website. After you determine those URLs, you can add them to the **[!UICONTROL Invalidate CDN Template]** text box earlier in the steps. Then, you can select those assets, and invalidate the URLs in one step.
   >
   >Another option is to add complete URLs to the **[!UICONTROL Invalidate CDN]** list. If you follow this approach, it is unnecessary to select assets in Dynamic Media Classic before going to the **[!UICONTROL File > Invalidate CDN]** option.

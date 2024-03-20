---
title: Configure a Dynamic Media company alias account
description: Learn how to configure a company alias account in Dynamic Media.
contentOwner: Rick Brough
topic-tags: administering
content-type: reference
feature: Image Profiles
role: User,Admin
mini-toc-levels: 4
exl-id: 2ca7b8b2-573c-40e9-b8c3-f38736e819ef
solution: Experience Manager, Experience Manager Assets
---
<!-- hide: yes
hidefromtoc: yes -->

# About configuring a Dynamic Media company alias account {#about-dm-alias-acct}

Dynamic Media URLs and viewer embed code contain your company account name. This account name was created at the time of provisioning Dynamic Media. There may be scenarios where your business has undergone an acquisition, or a rebranding, or you simply want to use a more memorable name. In such scenarios, it is not easy to manually update your company account name in all URLs and viewer embed code that comes out of the box. Furthermore, there is the possibility that you may impact your existing Dynamic Media repository or impact live content. To resolve this issue, you can configure a Dynamic Media company alias account.

A Dynamic Media company alias account ensures that all out-of-the-box Dynamic Media URLs and viewer embed code in the user interface reflect any updates made to your business context, such as rebranding. An alias account also has a positive impact on your SEO (Search Engine Optimization) because the Dynamic Media URLs and viewer embed code reflect the new company account name.

When you configure a Dynamic Media company alias account, be aware of the following:

* Any existing Dynamic Media URLs or viewer embed code on your *live* digital properties must be updated manually to reflect the new alias name. However, any URLs or viewers embed code with your original Dynamic Media company name continue to work for existing or new assets.
* The Dynamic Media company alias account capability is limited to Experience Manager Assets Authoring mode and delivery. The company alias name does not work with Experience Manager Sites. WCM (Web Content Management) components are not updated for this change. Those components continue to work with the original Dynamic Media company name for fetching Dynamic Media assets.
* You can set up only one company alias account on the **[!UICONTROL Edit Dynamic Media Configuration]** page. However, you can create as many company alias accounts by way of a support case, and manually reflect the necessary alias name in the Dynamic Media URLs or viewer embed code.
* The out-of-the-box [Cache Invalidation](/help/assets/invalidate-cdn-cache-dynamic-media.md) capability of Dynamic Media invalidates the URLs with both Company and Company Alias accounts configured in the Dynamic Media Configuration page in Cloud Services.
* When you configure a company alias account on the **[!UICONTROL Edit Dynamic Media Configuration]** page, for cache invalidation to be successful, you must invalidate URLs for *both* the **[!UICONTROL Company]** account and the **[!UICONTROL Company Alias]** account, simultaneously.

See also [Create a Dynamic Media Configuration in Cloud Services](/help/assets/config-dms7.md#configuring-dynamic-media-cloud-services)

## Configure a Dynamic Media company alias Account {#configure-dm-alias-account}

You begin configuring a Dynamic Media company alias account by first submitting a Support case. This step is required.

1. [Use the Admin Console to create a support case](https://helpx.adobe.com/enterprise/using/support-for-experience-cloud.html).
1. Provide the following information in your support case:

    * The Dynamic Media company alias name you want to use. The name must contain *only* letters (mixed casing allowed), numbers, hyphens, and underscores.
    * Your region.
    * Whether any [rulesets](/help/assets/using-rulesets-to-transform-urls.md) are being used previously to achieve serving of Dynamic Media content through an alternate Dynamic Media company account name.

1. After the Dynamic Media alias account is created by Support, in Experience Manager as a Cloud Service Author instance, select the Experience Manager as a Cloud Service logo to access the global navigation console.
1. On the left of the console, select the Tools icon, then go to **[!UICONTROL Cloud Services > Dynamic Media Configuration]**.
1. On the Dynamic Media Configuration Browser page, in the left pane, select **[!UICONTROL global]** (do not select the folder icon to the left of **[!UICONTROL global]**). Then select **[!UICONTROL Edit]**.

   ![Dynamic Media Company Alias text field](/help/assets/assets-dm/dm-company-alias.png)

1. On the **[!UICONTROL Edit Dynamic Media Configuration]** page, in the **[!UICONTROL Company Alias]** text field, type the Dynamic Media alias account name that you specified in your support case earlier.
1. In the upper right of the page, select **[!UICONTROL Save]**.
The Dynamic Media company alias account is now saved and enabled; all URLs and viewer embed code for existing and new assets now reflect the new company alias name.

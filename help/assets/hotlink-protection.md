---
title: Activating hot link protection in Dynamic Media
description: Information on how to activate hot link protection in Dynamic Media.
contentOwner: Rick Brough
topic-tags: dynamic-media
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
content-type: reference
role: User, Admin
exl-id: 698e8bdb-9b31-49ab-8560-26b05109bb23
feature: Configuration
solution: Experience Manager, Experience Manager Assets
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: d09181b5-a36a-43de-ba01-36641440bc43
    internal-label: Experience Manager Assets
feature_v2:
  - id: da0dfbce-df02-4f8b-b32d-a4e3b1d05085
    internal-label: Configuration
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
---
# Activate hot link protection in Dynamic Media {#activating-hotlink-protection-in-dynamic-media}

Hot linking is when a third-party website uses HTML code to display an image from your website. They use your bandwidth every time the picture is requested because the visitor's browser is accessing it directly from your server. Hotlink *protection* is a method to prevent other websites from directly linking to pictures, CSS, or JavaScript on your webpages. This kind of shield helps reduce unnecessary bandwidth usage under your Dynamic Media account.

[Experience Manager Customer Support](https://experienceleague.adobe.com/?support-solution=Experience+Manager#support) can configure a referrer filter at the CDN (Content Delivery Network) level so that Dynamic Media content is only served to websites on your list of permitted websites for the domain.

>[!NOTE]
>
>This feature requires that you use the out-of-the-box CDN that is bundled with Adobe Experience Manager Dynamic Media. Any other custom CDN is not supported with this feature. To activate hot link protection, an Administrator must create an Adobe Customer Support support ticket to request the configuration change to your Dynamic Media account. There is no additional cost for activating hot link protection.

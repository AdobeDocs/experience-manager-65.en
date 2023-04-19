---
title: Authoring a content page for mobile devices
description: When authoring for mobile, you can switch between several emulators to see what the end-user sees.
uuid: a7a1ba68-d608-4819-88d1-0dab5955d3f4
contentOwner: Chris Bohnert
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: site-features
discoiquuid: 9554cdb3-b604-4d50-9760-89b9e7a7755f
exl-id: 9c6c6386-5ffd-4fa6-9aa1-f5b0e31d1046
---
# Authoring a Page for Mobile Devices{#authoring-a-page-for-mobile-devices}

When authoring a mobile page, the page is displayed in a way that emulates the mobile device. When authoring the page, you can switch between several emulators to see what the end-user sees when accessing the page.

Devices are grouped into the categories feature, smart, and touch according to the capabilities of the devices to render a page. When the end-user accesses a mobile page, AEM detects the device and sends the representation that corresponds to its device group.

>[!NOTE]
>
>To create a mobile site based on an existing standard site, create a live copy of the standard site. (See [Creating a Live Copy for Different Channels](/help/sites-administering/msm-livecopy.md).)
>
>AEM developers can create new device groups. (See [Creating Device Group Filters](/help/sites-developing/groupfilters.md).)

Use the following procedure to author a mobile page:

1. From global navigation open the **Sites** console.
1. Open the page **We.Retail** -&gt; **United States** -&gt; **English**.

1. Switch to **Preview** mode.
1. Switch to the desired emulator by clicking the device icon at the top of the page.
1. Drag and drop components from the component browser to the page.

The page looks similar to the following:

![mobileipademu](assets/mobileipademu.png)

>[!NOTE]
>
>The emulators are disabled when a page on the author instance is requested from a mobile device.

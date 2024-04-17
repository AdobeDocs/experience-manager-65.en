---
title: DHTML Viewer End-of-Life
description: Effective January 31, 2014, the DHTML viewer platform is officially end-of-life.
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: integration
content-type: reference
exl-id: 06b74770-1f96-4f6b-98c0-afef7000e42b
solution: Experience Manager, Experience Manager Sites
feature: Integration
role: Admin
---
# DHTML Viewer End-of-Life {#dhtml-viewer-end-of-life}

Effective January 31, 2014, the DHTML viewer platform is officially end-of-life.

See the [Dynamic Media Viewers Reference Guide](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/library/homeviewers.html) for the latest supported viewers.

<!-- OBSOLETE CONTENT **What is the change?**

Effective January 31, 2014, Scene7 will officially end-of-life support for the DHTML viewer platform.

**What does end-of-life mean?**

End-of-life means that Scene7 will (1) no longer add any feature enhancements to the DHTML viewer platform (2) no longer address or release any bug fixes on the DHTML viewer platform and (3) customer care will no longer be troubleshooting or providing support for any DHTML-related viewer issues or questions.

**Why is Scene7 making this change?**

Web standards are constantly evolving and DHTML is an older web development technology that is rapidly being replaced by HTML5. The biggest limitation to DHTML as a platform is that it is not capable of creating the richness of experience that HTML5 now can consistently and more easily support cross-browser. For example, such limitations include lack of cross-browser support for:

* Custom cursors
* Rounded corners
* Animations (such as page flipping, zoom easing)
* Effects (such as shadows, glow)
* Complete font support
* Plugin-less video playback

Specific to the Scene7 DHTML viewer platform, both the JSP-based solution and the JavaScript APIs were not optimized for mobile devices to take advantage of multi-touch and gesture capabilities. And even though DHTML viewers which were released in 2011/early 2012 are optimized for mobile, they were difficult to customize and maintain due to the lack of a flexible SDK component-based development framework.

Driven by these limitations on DHTML and rapid industry traction with HTML5 as an emerging standard across both desktop and mobile, Scene7 has decided to invest in an HTML5-based viewer platform. This investment will offer our customers a robust platform against which they can build richer, more engaging interactive viewers that can reach users on multiple screens including desktop, iOS and Android devices.

**How do I know if my viewer is using the DHTML platform?**

To determine if the viewer your company is using is DHTML and hence affected by this change, check if:

1. Your company is using an out-of-box Scene7 viewer listed in this table where the "Viewer Technology" is designated as "DHTML":

    [https://help.adobe.com/en_US/scene7/using/WS6E593DEA-7D81-4cd6-84B0-85E8BB274176.html#WS1c46793299cf21d77e926d1613177f0a020-8000](https://help.adobe.com/en_US/scene7/using/WS6E593DEA-7D81-4cd6-84B0-85E8BB274176.html#WS1c46793299cf21d77e926d1613177f0a020-8000)

1. Your company is using a viewer that was created as a new preset based off an out-of-box Scene7 viewer in this table where the "Viewer Technology" is designated as "DHTML":

    [https://help.adobe.com/en_US/scene7/using/WS6E593DEA-7D81-4cd6-84B0-85E8BB274176.html#WS1c46793299cf21d77e926d1613177f0a020-8000](https://help.adobe.com/en_US/scene7/using/WS6E593DEA-7D81-4cd6-84B0-85E8BB274176.html#WS1c46793299cf21d77e926d1613177f0a020-8000)

1. Your company is using a custom viewer created from the JSP-based DHTML solution:

    [https://microsite.omniture.com/t2/help/en_US/s7/viewers_ref/index.html#JSP_Reference](https://microsite.omniture.com/t2/help/en_US/s7/viewers_ref/index.html#JSP_Reference)

1. Your company is using a custom viewer created from the JavaScript API:

    [https://microsite.omniture.com/t2/help/en_US/s7/viewers_ref/index.html#API_Reference](https://microsite.omniture.com/t2/help/en_US/s7/viewers_ref/index.html#API_Reference)

1. Your company is using a custom viewer created with the DHTML multi-screen flyout API:

    [https://microsite.omniture.com/t2/help/en_US/s7/viewers_ref/index.html#Multi-screen_Flyout_Viewer](https://microsite.omniture.com/t2/help/en_US/s7/viewers_ref/index.html#Multi-screen_Flyout_Viewer)

1. Your company is using a custom viewer created with the DHTML desktop flyout API:

    [https://microsite.omniture.com/t2/help/en_US/s7/viewers_ref/index.html#Desktop_Flyout_Viewer](https://microsite.omniture.com/t2/help/en_US/s7/viewers_ref/index.html#Desktop_Flyout_Viewer)

1. Your company is using a device detection library that is part of the DHTML viewers package:

   Look for JS include of "sj_deviceDetect.js" in your code.

   This has been replaced by new JS device detection code here: [https://microsite.omniture.com/t2/help/en_US/s7/viewers_ref/index.html#Detecting_devices_and_browsers](https://microsite.omniture.com/t2/help/en_US/s7/viewers_ref/index.html#Detecting_devices_and_browsers) .

**What is the replacement viewer platform?**

The replacement for DHTML is the Scene7 HTML5 viewer platform, consisting of both:

* HTML5 out-of-box viewers featuring mobile optimized interactions across numerous viewer types including basic zoom, flyout zoom, image sets, swatch sets, multi-dimensional spin and mixed media. For full up-to-date examples of these viewers, see: [https://microsite.omniture.com/t2/help/en_US/s7/vlist/vlist.html](https://microsite.omniture.com/t2/help/en_US/s7/vlist/vlist.html)
* HTML5 viewer SDK which enables extensive customization of Adobe Scene7 viewers for HTML5 supported sites and devices (such as iOS and Android), imparting the utmost flexibility and creativity to brand the viewer appearance and interactivity. The benefit of reusable performance-optimized components lower the overall cost of viewer development and accelerate custom development.

**When will the HTML5 viewer platform have the features I need to transition off the DHTML viewer platform?**

Scene7 released the first HTML5 viewer SDK in Fall 2011 with the launch of version 5.5. Since then, we have added numerous features to the platform and extended support for more and more types of viewers. For most common viewer requirements, the HTML5 viewer platform likely already has the features you need to migrate now. And we continue to aggressively invest in this viewer platform with releases every quarter.

To determine if your viewer requirements can be met today with the HTML5 viewer platform, see the following documentation:

[https://microsite.omniture.com/t2/help/en_US/s7/viewers_ref/index.html#About_HTML5_Viewers](https://microsite.omniture.com/t2/help/en_US/s7/viewers_ref/index.html#About_HTML5_Viewers) (for out of box viewers features and customization capabilities)

[https://help.adobe.com/en_US/scene7/using/WSd4272150f67705c11b002eec12fcba4dee6-8000.html](https://help.adobe.com/en_US/scene7/using/WSd4272150f67705c11b002eec12fcba4dee6-8000.html) (to access the SDK API documentation)

If you are still unsure about whether or not the HTML5 viewer SDK can meet your requirements, consult with our professional services team.

**How do I transition my viewers over to the HTML5 platform?**

To transition your viewers to the HTML5 platform, Scene7 offers the following options:

1. Use one of the Scene7 out-of-box HTML5 viewers, examples of which can be found here: [https://microsite.omniture.com/t2/help/en_US/s7/vlist/vlist.html](https://microsite.omniture.com/t2/help/en_US/s7/vlist/vlist.html)
1. Configure one of the Scene7 out-of-box HTML5 viewers under the SPS application setup. This will let you customize certain behavior such as viewer size, transitions, zoom behavior, and so on: [https://help.adobe.com/en_US/scene7/using/WS6E593DEA-7D81-4cd6-84B0-85E8BB274176.html](https://help.adobe.com/en_US/scene7/using/WS6E593DEA-7D81-4cd6-84B0-85E8BB274176.html)
1. Customize look and feel of the Scene7 out-of-box HTML5 viewers by modifying CSS to change visual design such as button artwork, placement, transparency, background colors, and so on: [https://microsite.omniture.com/t2/help/en_US/s7/viewers_ref/index.html#Customizing_HTML5_Viewers](https://microsite.omniture.com/t2/help/en_US/s7/viewers_ref/index.html#Customizing_HTML5_Viewers)
1. Create a custom HTML5 viewer from scratch using the SDK which can be downloaded here: [https://help.adobe.com/en_US/scene7/using/WSd4272150f67705c11b002eec12fcba4dee6-8000.html](https://help.adobe.com/en_US/scene7/using/WSd4272150f67705c11b002eec12fcba4dee6-8000.html). You can engage with professional services to build the custom viewer or have your own web development team build it.

**What about browsers that do not support HTML5?**

HTML5 is supported across many mobile devices and web browsers, and continues to gain traction. Currently, even though HTML5 is not supported on Internet Explorer 8 or below, Scene7 has innovated our HTML5 viewer platform to extend support even to IE 7 and IE 8. With the Scene7 HTML5 viewer platform , you can reach the overwhelming majority of both desktop and mobile users with a single development platform.

Current system requirements as of the HTML5 SDK version 2.2.1 are:

* Microsoft&reg; Windows&reg; XP or later, Macintosh&reg; OS X 10.6 or later
* Firefox 17, Safari 5.1, Chrome 23, Internet Explorer 7 or later
* iOS 3.2.2 or later
* Certified on iPhone3 or later and iPad1 or later (native browsers)
* Android OS 2.2 or later

To check if your browser is compatible with our HTML5 viewer platform, launch the following example viewer:

[https://s7d1.scene7.com/s7viewers/html5/flyout.html?asset=Scene7SharedAssets/Sample%20Image](https://s7d1.scene7.com/s7viewers/html5/flyout.html?asset=Scene7SharedAssets/Sample%20Image)

If you see the zoomed-in image by hovering your mouse or dragging your finger over the main image, then it is a supported browser/device.

**What options do I have if I want to stay live in production with my existing DHTML viewer?**

Although you can still be live in production with DHTML-based viewers, it is important to note that there will be no enhancements, bug fixes nor customer care after January 31, 2014. Hence, we strongly advise all customers to migrate over to our more robust HTML5 viewer platform. However, if your business situation prevents such a migration by the EOL date, you have the option to contract with professional services to extend the supported maintenance time period. For more information, contact your account manager.

**Who do I contact for more information?**

If this FAQ did not answer all of your questions, [use the Admin Console to create a support case](https://helpx.adobe.com/enterprise/admin-guide.html/enterprise/using/support-for-experience-cloud.ug.html) or contact your Adobe account manager.
 -->

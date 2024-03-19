---
title: Use Smart Imaging with client-side Device Pixel Ratio
description: Learn how to use client-side Device Pixel Ratio with Smart Imaging in Adobe Experience Manager as a Cloud Service with Dynamic Media.
role: Admin,User
exl-id: e38f522a-242a-4ea9-a866-d8d129950831
solution: Experience Manager, Experience Manager Assets
feature: Smart Imaging
---
# About Smart Imaging with client-side Device Pixel Ratio (DPR) {#client-side-dpr}

The current Smart Imaging solution uses user agent strings to determine the type of device (desktop, tablet, mobile, and so on) that is being used.

Device detection capabilities &ndash; DPR based on user agent strings &ndash; are inaccurate often, especially for Apple devices. Also, anytime a new device is launched, it must be validated. 

Client-side DPR gives you 100% accurate values and works for any device, whether it is Apple or any other new device that was launched.

## Use the client-side DPR code

**Server-side rendered apps**

1. Load service worker init (`srvinit.js`) by including the following script in the header section of your HTML page:

    ```javascript
    <script type="text/javascript" src="srvinit.js"></script>
    ```

    Adobe recommends that you load this script _before_ any other scripts so that the service worker begins initialization right away.

1. Include the following DPR image tag code at the top of the body section of your HTML page:

    ```html
    <img src="aem_dm_dpr_1x.jpg" style="width:1px;height:1px;display:none"
        srcset="aem_dm_dpr_1x.jpg 1x, aem_dm_dpr_1.1x.jpg 1.1x, aem_dm_dpr_1.2x.jpg 1.2x, aem_dm_dpr_1.3x.jpg 1.3x, aem_dm_dpr_1.4x.jpg 1.4x, aem_dm_dpr_1.5x.jpg 1.5x, aem_dm_dpr_1.6x.jpg 1.6x,          aem_dm_dpr_1.7x.jpg 1.7x, aem_dm_dpr_1.8x.jpg 1.8x, aem_dm_dpr_1.9x.jpg 1.9x,
        aem_dm_dpr_2x.jpg 2x, aem_dm_dpr_2.1x.jpg 2.1x, aem_dm_dpr_2.2x.jpg 2.2x, aem_dm_dpr_2.3x.jpg 2.3x, aem_dm_dpr_2.4x.jpg 2.4x, aem_dm_dpr_2.5x.jpg 2.5x, aem_dm_dpr_2.6x.jpg 2.6x, aem_dm_dpr_2.7x.jpg 2.7x, aem_dm_dpr_2.8x.jpg 2.8x, aem_dm_dpr_2.9x.jpg 2.9x,
        aem_dm_dpr_3x.jpg 3x, aem_dm_dpr_3.1x.jpg 3.1x, aem_dm_dpr_3.2x.jpg 3.2x, aem_dm_dpr_3.3x.jpg 3.3x, aem_dm_dpr_3.4x.jpg 3.4x, aem_dm_dpr_3.5x.jpg 3.5x, aem_dm_dpr_3.6x.jpg 3.6x, aem_dm_dpr_3.7x.jpg 3.7x, aem_dm_dpr_3.8x.jpg 3.8x, aem_dm_dpr_3.9x.jpg 3.9x,
        aem_dm_dpr_4x.jpg 4x, aem_dm_dpr_4.1x.jpg 4.1x, aem_dm_dpr_4.2x.jpg 4.2x, aem_dm_dpr_4.3x.jpg 4.3x, aem_dm_dpr_4.4x.jpg 4.4x, aem_dm_dpr_4.5x.jpg 4.5x, aem_dm_dpr_4.6x.jpg 4.6x, aem_dm_dpr_4.7x.jpg 4.7x, aem_dm_dpr_4.8x.jpg 4.8x, aem_dm_dpr_4.9x.jpg 4.9x,
        aem_dm_dpr_5x.jpg 5x">
    ```

    It is mandatory that you include this DPR image tag code _before_ all static images in your HTML page.

**Client-side rendered apps**

1. Include the following DPR scripts in the header section of your HTML page:

    ```javascript
    <script type="text/javascript" src="srvinit.js"></script>
    <script type="text/javascript" src="dprImageInjection.js"></script>
    ```

    You can combine both DPR scripts into one to avoid multiple network requests.

    Adobe recommends that you load these scripts _before_ any other scripts in the HTML page.
    Adobe also recommends that you Bootstrap your app under diff HTML tag rather than a body element. The reason is because `dprImageInjection.js` dynamically injects the image tag at the top of the body section in the HTML page.

## JavaScript files download {#client-side-dpr-script}

The following JavaScript files in the download are provided to you as an example reference only. If you intend to use these files in HTML pages, be sure you edit each file's code to fit your own requirements.

* `dprImageInjection.js`
* `srvinit.js`
* `srvwrk.js`

[JavaScript files download](/help/assets/assets-dm/aem-dynamicmedia-smartimaging-dpr.zip)

>[!MORELIKETHIS]
>
>* [Smart Imaging](/help/assets/imaging-faq.md)

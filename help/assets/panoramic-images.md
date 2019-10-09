---
title: Panoramic Images
seo-title: Panoramic Images
description: Learn how to work with panoramic images in Dynamic Media.
seo-description: Learn how to work with panoramic images in Dynamic Media.
uuid: dfd7a55c-7bcc-4d62-8c3a-a73726881103
contentOwner: Rick Brough
topic-tags: dynamic-media
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
content-type: reference
discoiquuid: fc285b25-2bce-493c-87bc-5f1a8a26eb42
---

# Panoramic Images {#panoramic-images}

This section describes working with the Panoramic Image viewer to render spherical panoramic images for an immersive 360° viewing experience of a room, property, location, or landscape.

See also [Managing Viewer Presets](managing-viewer-presets.md).

![panoramic-image2](assets/panoramic-image2.png) 

## Uploading assets for use with the Panoramic Image viewer {#uploading-assets-for-use-with-the-panoramic-image-viewer}

For an uploaded asset to qualify as a spherical panorama image that you intend to use with the Panoramic Image viewer, the asset must have either one or both of the following:

* An aspect ratio of 2.

  You can override the default aspect ratio setting of 2 in **[!UICONTROL CRXDE Lite]** at the following:  

  `/conf/global/settings/cloudconfigs/dmscene7/jcr:content`

* Tagged with the keywords `equirectangular`, or `spherical`and `panorama`, or `spherical` and `panoramic`. See [Using Tags](/help/sites-authoring/tags.md).

Both the aspect ratio and keyword criteria apply to panoramic assets for the asset details page and the **[!UICONTROL Panoramic Media]** component.

To upload assets for use with the Panoramic Image viewer, see [Uploading Assets](managing-assets-touch-ui.md#uploading-assets).

## Configuring Dynamic Media Classic {#configuring-dynamic-media-classic-scene}

For the Panoramic Image viewer to work properly within AEM, you must synchronize the Panoramic Image viewer presets with Dynamic Media Classic and Dynamic Media Classic&ndash;specific metadata so the viewer presets get updated in the JCR. To accomplish this, configure Dynamic Media Classic in the following manner:

1. [Log into your instance of Dynamic Media Classic](https://www.adobe.com/marketing-cloud/experience-manager/scene7-login.html) for each company account.  

1. Near the upper-right corner of the page, click **[!UICONTROL Setup > Application Setup > Publish Setup > Image Server]**.
1. On the **[!UICONTROL Image Server Publish]** page, from the **[!UICONTROL Publish Context]** drop-down menu near the top, select **[!UICONTROL Image Serving]**.  

1. On the same **[!UICONTROL Image Server Publish]** page, locate the heading **[!UICONTROL Request Attributes]**.
1. Under the **[!UICONTROL Request Attributes]** heading, locate **[!UICONTROL Reply Image Size Limit]**. Then, in the associated **[!UICONTROL Width]** and **[!UICONTROL Height]** fields, increase the maximum allowable image size for panoramic images.

   Dynamic Media Classic has a limit of 25,000,000 pixels. The maximum allowable size for images with a 2:1 aspect ratio is 7000 x 3500. However, for typical desktop screens, 4096 x 2048 pixels is sufficient.

   >[!NOTE]
   >
   >Only images that fall within the maximum allowable image size are supported. Requests for images that are above the size limit will result in a 403 response.

1. Under the **Request Attributes]** heading, do the following:

    * Set **[!UICONTROL Request Obfuscation Mode]** to **[!UICONTROL Disabled]**.
    * Set **[!UICONTROL Request Locking Mode]** to **[!UICONTROL Disabled]**.

   These settings are necessary for using the **[!UICONTROL Panoramic Media]** component in AEM.

1. At the bottom of the **[!UICONTROL Image Server Publish]** page, on the left side, tap **[!UICONTROL Save]**.  

1. In the lower-right corner, tap **[!UICONTROL Close]**.

### Troubleshooting the Panoramic Media component {#troubleshooting-the-panoramic-media-wcm-component}

If you dropped an image into the **[!UICONTROL Panoramic Media]** component in your WCM and the component placeholder collapsed, you may want to troubleshoot the following:

* If you experience a 403 Forbidden error, it may have been caused by the requested image size being too large. Review the *Reply Image Size Limit* settings in [Configuring Dynamic Media Classic (Scene7)](#configuring-dynamic-media-classic-scene).

* For an *Invalid lock* on the asset or *Parsing error* displayed on the page, check **[!UICONTROL Request Obfuscation Mode]** and **[!UICONTROL Request Locking Mode]** to ensure they are disabled.
* For a tainted canvas error, setup a **[!UICONTROL Rule Set Definition File Path and Invalidate CTN]** for the previous requests for the image asset.
* If image quality becomes very low after an image request with sizing above the supported limit, check that the **[!UICONTROL JPEG Encoding Attributes > Quality]** setting is not empty. A typical setting for the **[!UICONTROL Quality]** field is `95`. You can find the setting on the **[!UICONTROL Image Server Publish]** page. To access the page, see [Configuring Dynamic Media Classic](#configuring-dynamic-media-classic-scene).

## Previewing Panoramic Images {#previewing-panoramic-images}

See [Previewing Assets](previewing-assets.md).

## Publishing Panoramic Images {#publishing-panoramic-images}

See [Publishing Assets](publishing-dynamicmedia-assets.md).

---
title: Panoramic Images
seo-title: Panoramic Images
description: Learn how to work with panoramic images in Dynamic Media.
seo-description: Learn how to work with panoramic images in Dynamic Media.
uuid: 45ac5a03-d9e1-43cd-a34f-1267adf88dce
contentOwner: rbrough
topic-tags: dynamic-media
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
content-type: reference
discoiquuid: 96bc37cf-ab8b-424b-b85e-54eb1a8b9a52
index: y
internal: n
snippet: y
---

# Panoramic Images{#panoramic-images}

This section describes working with the Panoramic Image viewer to render spherical panoramic images for an immersive 360° viewing experience of a room, property, location, or landscape.

See also [Managing Viewer Presets](../../assets/using/managing-viewer-presets.md).

![](assets/panoramic-image2.png) 

## Uploading assets for use with the Panoramic Image viewer {#uploading-assets-for-use-with-the-panoramic-image-viewer}

For an uploaded asset to qualify as a spherical panorama image that you intend to use with the Panoramic Image viewer, the asset must have either one or both of the following:

* An aspect ratio of 2.  
  You can override the default aspect ratio setting of 2 in CRXDE Lite at the following:  
  `/conf/global/settings/cloudconfigs/dmscene7/jcr:content`

* Tagged with the keywords `equirectangular`, or `spherical`and `panorama`, or `spherical` and `panoramic`. See [Using Tags](../../sites/authoring/using/tags.md).

Both the aspect ratio and keyword criteria apply to panoramic assets for the asset details page and the "Panoramic Media" WCM component.

To upload assets for use with the Panoramic Image viewer, see [Uploading Assets](../../assets/using/managing-assets-touch-ui.md#uploading-assets).

## Configuring Dynamic Media Classic (Scene7) {#configuring-dynamic-media-classic-scene}

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2018-03-13T15:58:24.675-0400
These steps came from https://wiki.corp.adobe.com/pages/viewpage.action?spaceKey=s7is&title=Panoramic+Viewer
-->

For the Panoramic Image viewer to work properly within AEM, you must synchronize the Panoramic Image viewer presets with Dynamic Media Classic (Scene7) and Dynamic Media Classic (Scene7)-specific metadata so the viewer presets get updated in the JCR. To accomplish this, configure Dynamic Media Classic (Scene7) in the following manner:

1. [Log into your instance of Dynamic Media Classic (Scene7)](http://www.adobe.com/marketing-cloud/experience-manager/scene7-login.html) for each company account.  

1. Near the upper-right corner of the page, click **Setup** &gt; **Application Setup** &gt; **Publish Setup** &gt; **Image Server**.
1. On the Image Server Publish page, from the **Publish Context** drop-down menu near the top, select **Image Serving**.

   <!--
   Comment Type: annotation
   Last Modified By: rbrough
   Last Modified Date: 2018-03-13T16:04:52.443-0400
   For step 3, do they need to do all these steps for "Test Image Serving" as well I ask because "Test Image Serving" was crossed out in the steps on the wiki page (was step "e")
   -->

1. On the same Image Server Publish page, locate the heading **Request Attributes**.
1. Under the Request Attributes heading, locate **Reply Image Size Limit**. Then, in the associated Width and Height fields, increase the maximum allowable image size for panoramic images.

   Dynamic Media Classic (Scene7) has a limit of 25,000,000 pixels. The maximum allowable size for images with a 2:1 aspect ratio is 7000 x 3500. However, for typical desktop screens, 4096 x 2048 pixels is sufficient.

   >[!NOTE]
   >
   >Only images that fall within the maximum allowable image size are supported. Requests for images that are above the size limit will result in a 403 response.

1. Under the Request Attributes heading, do the following:

    * Set Request Obfuscation Mode to **Disabled**.
    * Set Request Locking Mode to **Disabled**.

   These settings are necessary for using the Panoramic Media WCM component in AEM.

1. At the bottom of the Image Server Publish page, on the left side, click **Save**.  

1. In the lower-right corner, click **Close**.

### Troubleshooting the Panoramic Media WCM component {#troubleshooting-the-panoramic-media-wcm-component}

If you dropped an image into the Panoramic Media component in your WCM and the component placeholder collapsed, you may want to troubleshoot the following:

* If you experience a 403 Forbidden error, it may have been caused by the requested image size being too large. Review the **Reply Image Size Limit** settings in [Configuring Dynamic Media Classic (Scene7)](../../assets/using/panoramic-images.md#configuring%20dynamic%20media%20classic%20(scene7)).

* For an "Invalid lock" on the asset or "Parsing error" displayed on the page, check Request Obfuscation Mode and Request Locking Mode to ensure they are disabled.
* For a tainted canvas error, setup a Rule Set Definition File Path and Invalidate CTN for the previous requests for the image asset.
* If image quality becomes very low after an image request with sizing above the supported limit, check that the **JPEG Encoding Attributes** &gt; **Quality** setting is not empty. A typical setting for the **Quality **field is 95. You can find the setting on the Image Server Publish page. To access the page, see [Configuring Dynamic Media Classic (Scene7)](../../assets/using/panoramic-images.md#configuring%20dynamic%20media%20classic%20(scene7)).

## Previewing Panoramic Images {#previewing-panoramic-images}

See [Previewing Assets](../../assets/using/previewing-assets.md).

## Publishing Panoramic Images {#publishing-panoramic-images}

See [Publishing Assets](/assets/using/publishing-dynamicmedia-assets.md).

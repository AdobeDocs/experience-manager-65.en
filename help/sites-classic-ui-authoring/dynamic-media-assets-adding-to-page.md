---
title: Adding Dynamic Media assets to pages
seo-title: Adding Dynamic Media assets to pages
description: To add the dynamic media functionality to assets you use on your websites, you can add the Dynamic Media or Interactive Media component directly on the page.
seo-description: To add the dynamic media functionality to assets you use on your websites, you can add the Dynamic Media or Interactive Media component directly on the page.
uuid: 650d0867-a079-4936-a466-55b7a30803a2
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: authoring
content-type: reference
discoiquuid: 331f4980-5193-4546-a22e-f27e38bb8250
---

# Adding Dynamic Media assets to pages{#adding-dynamic-media-assets-to-pages}

To add the Dynamic Media functionality to assets you use on your websites, you can add the **[!UICONTROL Dynamic Media]** or **[!UICONTROL Interactive Media]** component directly on the page. You do this by entering [!UICONTROL Design] mode and enabling the dynamic media components. Then you can add these components to the page and add assets to the component. The dynamic media and interactive media components are smart - they know whether you are adding an image or a video and the options available change accordingly.

You add dynamic media assets directly to the page if you are using AEM as your WCM.

>[!NOTE]
>
>Image maps are available out of the box for carousel banners.

## Adding a Dynamic Media component to a page {#adding-a-dynamic-media-component-to-a-page}

Adding the [!UICONTROL Dynamic Media] or [!UICONTROL Interactive Media] component to a page is the same as adding a component to any page. The [!UICONTROL Dynamic Media] and [!UICONTROL Interactive Media] components are described in detail in the following sections.

To add a Dynamic Media component/viewer to a page:

1. In AEM, open the page where you want to add the Dynamic Media component.
1. If no Dynamic Media component is available, click the ruler in the [!UICONTROL Sidekick] to enter **[!UICONTROL Design]** mode, click **[!UICONTROL Edit]** parsys, and select **[!UICONTROL Dynamic Media]** to make the Dynamic Media components available.

   >[!NOTE]
   >
   >See [Configuring Components in Design Mode](/help/sites-authoring/default-components-designmode.md) for more information.

1. Return to **[!UICONTROL Edit]** mode by clicking the pencil icon in the [!UICONTROL Sidekick].
1. Drag the **[!UICONTROL Dynamic Media]** or **[!UICONTROL Interactive Media]** component from the **[!UICONTROL Other]** group in the sidekick onto the page in the desired location.
1. Click **[!UICONTROL Edit]** to open the component.
1. [Edit the component](#dynamic-media-component) as necessary and click **[!UICONTROL OK]** to save changes.

## Dynamic Media Components {#dynamic-media-components}

[!UICONTROL Dynamic Media] and [!UICONTROL Interactive Media] are available in the [!UICONTROL Sidekick] under **[!UICONTROL Dynamic Media]**. You use the **[!UICONTROL Interactive Media]** component for any interactive assets such as interactive video, interactive images, or carousel sets. For all other dynamic media components, use the **[!UICONTROL Dynamic Media]** component.

![chlimage_1-71](assets/chlimage_1-71.png)

>[!NOTE]
>
>These components are not available by default and need to be selected in Design mode before using. [After they are made available in Design mode](/help/sites-authoring/default-components-designmode.md), you can add the components to your page as you would any other AEM component.

### Dynamic Media component {#dynamic-media-component}

The Dynamic Media component is smart&mdash;depending on whether you add an image or a video, you have various options. The component supports image presets, image-based viewers such as image sets, spin sets, mixed media sets, and video. In addition, the viewer is responsive. That is, the size of the screen changes automatically based on screen size. All viewers are HTML5-based viewers.

>[!NOTE]
>
>When you add the [!UICONTROL Dynamic Media] component, and **[!UICONTROL Dynamic Media Settings]** is blank or you cannot add an asset properly, check the following:
>
>* You have [enabled Dynamic Media](/help/assets/config-dynamic.md). Dynamic Media is disabled by default.
>* The image has a pyramid tiff file. Images imported before dynamic media is enabled do not have a pyramid tiff file.
>

#### When working with images {#when-working-with-images}

The [!UICONTROL Dynamic Media] component lets you add dynamic images, including image sets, spin sets, and mixed media sets. You can zoom in, zoom out, and if applicable turn an image within a spin set or select an image from another type of set.

You can also configure the viewer preset, image preset, or image format directly in the component. To make an image responsive you can either set the breakpoints or apply a responsive image preset.

![chlimage_1-72](assets/chlimage_1-72.png)

You can edit the following Dynamic Media settings by clicking **[!UICONTROL Edit]** in the component and then clicking the **[!UICONTROL Dynamic Media Settings]** tab.

![chlimage_1-73](assets/chlimage_1-73.png)

>[!NOTE]
>
>By default, the Dynamic Media image component is adaptive. If you want to make it a fixed size, set it in the component in the **[!UICONTROL Advanced]** tab with the **[!UICONTROL Width]** and **[!UICONTROL Height]** properties.

**[!UICONTROL Viewer preset]** &ndash; Select an existing viewer preset from the drop-down menu. If the viewer preset you are looking for is not visible, you may need to make it visible. See [Managing Viewer Presets](/help/assets/managing-viewer-presets.md). You cannot select a viewer preset if you are using an image preset and vice versa.

This is the only option available if you are viewing image sets, spin sets, or mixed media sets. The viewer presets displayed are also smart &ndash; only relevant viewer presets appear.

**[!UICONTROL Image preset]** &ndash; Select an existing image preset from the drop-down menu. If the image preset you are looking for is not visible, you may need to make it visible. See [Managing Image Presets](/help/assets/managing-image-presets.md). You cannot select a viewer preset if you are using an image preset and vice versa.

This option is not available if you are viewing image sets, spin sets, or mixed media sets.

**[!UICONTROL Image Modifiers]** &ndash; You can change image effects by supplying additional image commands. These are described in [Managing Image Presets](/help/assets/managing-viewer-presets.md) and the [Command reference](https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/http_ref/c_command_reference.html).

This option is not available if you are viewing image sets, spin sets, or mixed media sets.

**[!UICONTROL Breakpoints]** &ndash; If you are using this asset on a responsive site, you need to add the page breakpoints. Image breakpoints need to be separated by commas (,). This option works when there is no height or width defined in an image preset.

This option is not available if you are viewing image sets, spin sets, or mixed media sets.

You can edit the following [!UICONTROL Advanced Settings] by clicking **[!UICONTROL Edit]** in the component.

**[!UICONTROL Title]** &ndash; Change the title of the image.

**[!UICONTROL Alt Text]** &ndash; Add a title to the image for those users who have graphics turned off.

This option is not available if you are viewing image sets, spin sets, or mixed media sets.

**[!UICONTROL URL, Open in]** &ndash; You can set an asset from to open a link. Set the **[!UICONTROL URL]** and **[!UICONTROL Open in]** to indicate whether you want it to open in the same window or a new window.

This option is not available if you are viewing image sets, spin sets, or mixed media sets.

**[!UICONTROL Width and Height]** &ndash; Enter value in pixels if you want the image to be a fixed size. Leaving these values blank makes the asset adaptive.

#### When working with video {#when-working-with-video}

Use the [!UICONTROL Dynamic Media] component to add dynamic video to your web pages. When you edit the component you can choose to use a predefined video viewer preset for playing the video on the page.

![chlimage_1-74](assets/chlimage_1-74.png)

You can edit the following [!UICONTROL Dynamic Media Settings] by clicking **[!UICONTROL Edit]** in the component.

>[!NOTE]
>
>By default, the Dynamic Media video component is adaptive. If you want to make it a fixed size, set it in the component with the **[!UICONTROL Width]** and **[!UICONTROL Height]** in the **[!UICONTROL Advanced]** tab.

**[!UICONTROL Viewer preset]** &ndash; Select an existing video viewer preset from the drop-down menu. If the viewer preset you are looking for is not visible, you may need to make it visible. See [Managing Viewer Presets](/help/assets/managing-viewer-presets.md).

You can edit the following [!UICONTROL Advanced] settings by clicking **[!UICONTROL Edit]** in the component.

**[!UICONTROL Title]** &ndash; Change the title of the video.

**[!UICONTROL Width and Height]** &ndash; Enter value in pixels if you want the video to be a fixed size. Leaving these values blank makes it adaptive.

#### How to delivery secure video {#how-to-delivery-secure-video}

In AEM 6.2, when you install [FP-13480](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq620/featurepack/cq-6.2.0-featurepack-13480), you can control whether a video is delivered over a secure SSL connection (HTTPS) or an insecure connection (HTTP). By default, the video delivery protocol is automatically inherited from the protocol of the embedding web page. If the web page is loaded over HTTPS, the video is also delivered over HTTPS. And vice versa, if the web page is on HTTP, the video is delivered over HTTP. In most cases, this default behavior is fine and there is no need to make any configuration changes. However, you can override this default behavior by appending `VideoPlayer.ssl=on` to the end of a URL path or to the list of other viewer configuration parameters in an embed code snippet, to force secure video delivery.

For more information about secure video delivery and using the `VideoPlayer.ssl` configuration attribute in your URL path, see [Secure Video Delivery](https://marketing.adobe.com/resources/help/en_US/s7/viewers_ref/c_html5_video_viewer_20_securevideodelivery.html) in the Viewers Reference Guide. Besides the Video viewer, secure video delivery is available for Mixed Media viewer and Interactive Video viewer.

### Interactive Media Component {#interactive-media-component}

Interactive Media component is for those assets that have interactivity on them such hotspots or image maps. If you have an interactive image, interactive video, or carousel banner, use the **[!UICONTROL Interactive Media]** component.

The [!UICONTROL Interactive Media] component is smart &ndash; depending on whether you add an image or a video, you have various options. In addition, the viewer is responsive. That is, the size of the screen changes automatically based on screen size. All viewers are HTML5-based viewers.

![chlimage_1-75](assets/chlimage_1-75.png)

You can edit the following **[!UICONTROL General]** settings by clicking **[!UICONTROL Edit]** in the component.

**[!UICONTROL Viewer preset]** &ndash; Select an existing viewer preset from the drop-down menu. If the viewer preset you are looking for is not visible, you may need to make it visible. Viewer Presets must be published before they can be used. See Managing Viewer Presets.

**[!UICONTROL Title]** &ndash; Change the title of the video.

**[!UICONTROL Width and Height]** &ndash; Enter value in pixels if you want the video to be a fixed size. Leaving these values blank makes it adaptive.

You can edit the following **[!UICONTROL Add To Cart** settings by clicking **[!UICONTROL Edit]** in the component.

**[!UICONTROL Show Product Asset]** &ndash; By default, this value is selected. The product asset shows an image of the product as defined in the Commerce module. Clear the check mark to not show the product asset.

**[!UICONTROL Show Product Price]** &ndash; By default, this value is selected. Product price shows the price of the item as defined in the Commerce module. Clear the check mark to not show the product price.

**[!UICONTROL Show Product Form]** &ndash; By default, this value is not selected. The Product Form includes any product variants such as size and color. Clear the check mark to not show the product variants.

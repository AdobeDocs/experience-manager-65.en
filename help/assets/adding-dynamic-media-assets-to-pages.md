---
title: Adding Dynamic Media Assets to Pages
seo-title: Adding Dynamic Media Assets to Pages
description: How to add Dynamic Media components to a page in AEM
seo-description: How to add Dynamic Media components to a page in AEM
uuid: 77abcb87-2df7-449b-be52-540d749890b6
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: dynamic-media
content-type: reference
discoiquuid: d1f45751-1761-4d6b-b17d-110b2f1117ea
---

# Adding Dynamic Media Assets to Pages {#adding-dynamic-media-assets-to-pages}

To add the dynamic media functionality to assets you use on your websites, you can add the **Dynamic Media** or **Interactive Media** component directly on the page. You do this by entering Layout mode and enabling the dynamic media components. Then you can add these components to the page and add assets to the component. The dynamic media and interactive media components are smart - they know whether you are adding an image or a video and the options available change accordingly.

You add dynamic media assets directly to the page if you are using AEM as your WCM. If you are using a third-party for your WCM, either [link](linking-urls-to-yourwebapplication.md) or [embed](embed-code.md) your assets. For a responsive third-party web site, see [delivering optimized images to a responsive site](responsive-site.md).

>[!NOTE]
>
>You must publish assets before adding them to pages in AEM. See [Publishing Dynamic Media Assets](publishing-dynamicmedia-assets.md).

## Adding a Dynamic Media Component to a Page {#adding-a-dynamic-media-component-to-a-page}

Adding the Dynamic Media or Interactive Media component to a page is the same as adding a component to any page. The Dynamic Media and Interactive Media components are described in detail in the following sections.

>[!NOTE]
>
>If there is a Dynamic Media component, an Interactive Media component, or both on a web page that is accessed by a user with read-only permissions, the page breaks and the components are not render correctly. The reason is because the page is reconstructed to ensure that the properties of the components are good and any referenced assets and configurations are accessible. The page is then rendered again causing the components to break; the respective component code on the page cannot be re-rendered due to the user’s read-only access.  
  
>To avoid this issue, ensure that AEM Sites users have the necessary permissions to access the assets.

1. In AEM, open the page where you want to add the Dynamic Media or Interactive Media component.
1. In the left pane, click the **[!UICONTROL Components]** icon and filter for **[!UICONTROL Dynamic Media]**. If no Dynamic Media component is available, you need to enable the Dynamic Media components. See [Editing Page Templates](/help/sites-authoring/templates.md#editing-templates-template-authors) for more information. 

   ![chlimage_1-537](assets/chlimage_1-537.png)

1. Drag the **[!UICONTROL Dynamic Media]** or **[!UICONTROL Interactive Media]** component onto the page in the desired location.
1. Click the blue box around the component, then tap the **[!UICONTROL Configuration]** (wrench) icon.
1. [Edit the components](#dynamic-media-components) as necessary and click the checkmark to save changes.

## Localizing Dynamic Media Components {#localizing-dynamic-media-components}

You can localize Dynamic Media components in one of two ways:

* Within a web page in Sites, open **[!UICONTROL Properties]** and select the **[!UICONTROL Advanced]** tab. Select the desired language for localization.

  ![chlimage_1-538](assets/chlimage_1-538.png)

* From the site selector, select the desired page or page group. Tap **[!UICONTROL Properties]** and select the **[!UICONTROL Advanced]** tab. Select the desired language for localization.

  >[!NOTE]
  >
  >Please note that not all languages available in the **[!UICONTROL Language]** menu currently have tokens assigned.

## Dynamic Media Components {#dynamic-media-components}

Dynamic Media and Interactive Media are available under the [!UICONTROL Dynamic Media] tab in [!UICONTROL Components]. You use the Interactive Media] component for any interactive assets such as interactive video, interactive images, or carousel sets. For all other dynamic media components, use the Dynamic Media component.

>[!NOTE]
>
>These components are not available by default and need to be made available via the template editor before using. [After they are made available i](/help/sites-authoring/templates.md#editing-templates-template-authors)n the template editor, you can add the components to your page as you would any other AEM component.

![chlimage_1-539](assets/chlimage_1-539.png) 

### Dynamic Media component {#dynamic-media-component}

The Dynamic Media component is smart&mdash;depending on whether you add an image or a video, you have various options. The component supports image presets, image-based viewers such as image sets, spin sets, mixed media sets, and video. In addition, the viewer is responsive. That is, the size of the screen changes automatically based on screen size. All viewers are HTML5 viewers.

>[!NOTE]
>
>If there is a Dynamic Media component, an Interactive Media component, or both on a web page that is accessed by a user with read-only permissions, the page breaks and the components are not render correctly. The reason is because the page is reconstructed to ensure that the properties of the components are good and any referenced assets and configurations are accessible. The page is then rendered again causing the components to break; the respective component code on the page cannot be re-rendered due to the user’s read-only access.  
  
>To avoid this issue, ensure that AEM Sites users have the necessary permissions to access the assets.

>[!NOTE]
>
>When you add the Dynamic Media component, and **[!UICONTROL Dynamic Media Settings]** is blank or you cannot add an asset properly, check the following:
>
>* You have [enabled Dynamic Media](config-dynamic.md). Dynamic Media is disabled by default.
>* The image has a pyramid tiff file. Images imported before dynamic media is enabled do not have a pyramid tiff file.
>

#### When working with images {#when-working-with-images}

The Dynamic Media component lets you add dynamic images, including image sets, spin sets, and mixed media sets. You can zoom in, zoom out, and if applicable turn an image within a spin set or select an image from another type of set.

You can also configure the viewer preset, image preset, or image format directly in the component. To make an image responsive you can either set the breakpoints or apply a responsive image preset.

You can edit the following Dynamic Media Settings by clicking the **[!UICONTROL Edit]** icon in the component and then **[!UICONTROL Dynamic Media Settings]**.

![dm-settings-image-preset](assets/dm-settings-image-preset.png)

>[!NOTE]
>
>By default, the Dynamic Media image component is adaptive. If you want to make it a fixed size, set it in the component in the **[!UICONTROL Advanced]** tab with the **[!UICONTROL Width]** and **[!UICONTROL Height]** settings.

**[!UICONTROL Viewer preset]** Select an existing viewer preset from the drop-down menu. If the viewer preset you are looking for is not visible, you may need to make it visible. See Managing Viewer Presets. You cannot select a viewer preset if you are using an image preset and vice versa.

This is the only option available if you are viewing image sets, spin sets, or mixed media sets. The viewer presets displayed are also smart - only relevant viewer presets appear.

**[!UICONTROL Viewer modifiers]** Viewer modifiers take the form of name=value pair with a & delimiter and let you change viewers as outlined in the Viewers Reference Guide. An example of a viewer modifier is posterimage=img.jpg&caption=text.vtt,1 which sets a different image for the video thumbnail and associates a closed caption/subtitle file with the video.

**[!UICONTROL Image preset]** Select an existing image preset from the drop-down menu. If the image preset you are looking for is not visible, you may need to make it visible. See Managing Image Presets. You cannot select a viewer preset if you are using an image preset and vice versa.

This option is not available if you are viewing image sets, spin sets, or mixed media sets.

**[!UICONTROL Image Modifiers]** You can apply image effects by supplying additional image commands. These are described in Image Presets and the Image Serving Command reference.

This option is not available if you are viewing image sets, spin sets, or mixed media sets.

**[!UICONTROL Breakpoints]** If you are using this asset on a responsive site, you need to add the image breakpoints. Image breakpoints need to be separated by commas (,). This option works when there is no height or width defined in an image preset.

This option is not available if you are viewing image sets, spin sets, or mixed media sets.

You can edit the following Advanced Settings by clicking **[!UICONTROL Edit]** in the component.

**[!UICONTROL Title]** Change the title of the image.

**[!UICONTROL Alt Text]** Add a title to the image for those users who have graphics turned off.

This option is not available if you are viewing image sets, spin sets, or mixed media sets.

**[!UICONTROL URL, Open in]** You can set an asset to open a link. Set the URL and in Open in indicate whether you want it to open in the same window or a new window.

This option is not available if you are viewing image sets, spin sets, or mixed media sets.

**[!UICONTROL Width]** and **[!UICONTROL Height]** Enter value in pixels if you want the image to be a fixed size. Leaving these values blank makes the asset adaptive.

#### When working with Video {#when-working-with-video}

Use the Dynamic Media component to add dynamic video to your web pages. When you edit the component you can choose to use a predefined video viewer preset for playing the video on the page.

![chlimage_1-540](assets/chlimage_1-540.png)

You can edit the following Dynamic Media Settings by clicking **[!UICONTROL Edit]** in the component.

>[!NOTE]
>
>By default, the Dynamic Media video component is adaptive. If you want to make it a fixed size, set it in the component with the **[!UICONTROL Width]** and **[!UICONTROL Height]** in the [!UICONTROL Advanced] tab.

**[!UICONTROL Viewer preset]** Select an existing video viewer preset from the drop-down menu. If the viewer preset you are looking for is not visible, you may need to make it visible. See Managing Viewer Presets.

**[!UICONTROL Viewer modifiers]** Viewer modifiers take the form of name=value pair with a & delimiter and let you change viewers as outlined in the Adobe Viewers Reference Guide. An example of a viewer modifier is posterimage=img.jpg&caption=text.vtt,1

With viewer modifiers, you for example, can do the following:

* Associate a caption file with a video: [https://marketing.adobe.com/resources/help/en_US/s7/viewers_ref/r_html5_video_viewer_url_caption.html](https://marketing.adobe.com/resources/help/en_US/s7/viewers_ref/r_html5_video_viewer_url_caption.html)
* Associate a navigation file with a video: [https://marketing.adobe.com/resources/help/en_US/s7/viewers_ref/r_html5_video_viewer_url_navigation.html](https://marketing.adobe.com/resources/help/en_US/s7/viewers_ref/r_html5_video_viewer_url_navigation.html)

You can edit the following [!UICONTROL Advanced Settings] by clicking **[!UICONTROL Edit]** in the component.

**[!UICONTROL Title]** Change the title of the video.

**[!UICONTROL Width]** and **[!UICONTROL Height]** Enter value in pixels if you want the video to be a fixed size. Leaving these values blank makes it adaptive.

#### When working with Smart Crop {#when-working-with-smart-crop}

Use the Dynamic Media component to add Smart Crop image assets to your web pages. When you edit the component you can choose to use a predefined video viewer preset for playing the video on the page.

See also [Image Profiles](image-profiles.md).

![dm-settings-smart-crop](assets/dm-settings-smart-crop.png)

You can edit the following [!UICONTROL Dynamic Media Settings] by clicking **[!UICONTROL Edit]** in the component.

>[!NOTE]
>
>By default, the Dynamic Media image component is adaptive. If you want to make it a fixed size, set it in the component in the [!UICONTROL Advanced] tab with the **[!UICONTROL Width]** and **[!UICONTROL Height]**.

**[!UICONTROL Image Modifiers]** You can apply image effects by supplying additional image commands. These are described in Image Presets and the Image Serving Command reference.

This option is not available if you are viewing image sets, spin sets, or mixed media sets.

You can edit the following **[!UICONTROL Advanced]** settings by clicking **[!UICONTROL Edit]** in the component.

**[!UICONTROL Title]** Change the title of the Smart Crop image.

**[!UICONTROL Alt Text]** Add a title to the smart crop image for those users who have graphics turned off.

This option is not available if you are viewing image sets, spin sets, or mixed media sets.

**[!UICONTROL URL, Open in]** You can set an asset to open a link. Set the URL and in Open in indicate whether you want it to open in the same window or a new window.

This option is not available if you are viewing image sets, spin sets, or mixed media sets.

**[!UICONTROL Height** **[!UICONTROL Width]** Enter value in pixels if you want the smart crop image to be a fixed size. Leaving these values blank makes it adaptive.

### Interactive Media Component {#interactive-media-component}

Interactive Media component is for those assets that have interactivity on them such hotspots or image maps. If you have an interactive image, interactive video, or carousel banner, use the Interactive Media component.

The Interactive Media component is smart&mdash;depending on whether you add an image or a video, you have various options. In addition, the viewer is responsive - the size of the screen changes automatically based on screen size. All viewers are HTML5 viewers.

>[!NOTE]
>
>If there is a Dynamic Media component, an Interactive Media component, or both on a web page that is accessed by a user with read-only permissions, the page breaks and the components are not render correctly. The reason is because the page is reconstructed to ensure that the properties of the components are good and any referenced assets and configurations are accessible. The page is then rendered again causing the components to break; the respective component code on the page cannot be re-rendered due to the user’s read-only access.  
  
>To avoid this issue, ensure that AEM Sites users have the necessary permissions to access the assets.

![chlimage_1-541](assets/chlimage_1-541.png)

You can edit the following **[!UICONTROL General]** settings by clicking **[!UICONTROL Edit]** in the component.

**[!UICONTROL Viewer preset]** Select an existing viewer preset from the drop-down menu. If the viewer preset you are looking for is not visible, you may need to make it visible. Viewer Presets must be published before they can be used. See Managing Viewer Presets.

**[!UICONTROL Title]** Change the title of the video.

**[!UICONTROL Width]** and **[!UICONTROL Height]** Enter value in pixels if you want the video to be a fixed size. Leaving these values blank makes it adaptive.

You can edit the following **[!UICONTROL Add To Cart]** settings by clicking **[!UICONTROL Edit]** in the component.

**[!UICONTROL Show Product Asset]** By default, this value is selected. The product asset shows an image of the product as defined in the Commerce module. Clear the check mark to not show the product asset.

**S[!UICONTROL how Product Price]** By default, this value is selected. Product price shows the price of the item as defined in the Commerce module. Clear the check mark to not show the product price.

**[!UICONTROL Show Product Form]** By default, this value is not selected. The Product Form includes any product variants such as size and color. Clear the check mark to not show the product variants.

### Panoramic Media Component {#panoramic-media-component}

Panoramic Media component is for those assets that are spherical panoramic images. Such images provide a 360° viewing experience of a room, property, location, or landscape. For an image to qualify as a spherical panorama, it must have either one OR both of the following:

* An aspect ratio of 2:1.
* Tagged with the keywords “equirectangular” or (“spherical” + “panorama”) or (“spherical” + “panoramic”). See [Using Tags](/help/sites-authoring/tags.md).

Both the aspect ratio and keyword criteria apply to panoramic assets for the asset details page and the "Panoramic Media" WCM component.

![panoramic-media-viewer-preset](assets/panoramic-media-viewer-preset.png)

You can edit the following setting by tapping **[!UICONTROL Configure]** in the component.

**[!UICONTROL Viewer Preset]** Select an existing viewer from the Viewer preset drop-down menu.

If the viewer preset you are looking for is not visible, check to ensure that it is published. You must publish viewer presets before you can use them. See [Managing Viewer Presets](managing-viewer-presets.md).

### Using HTTP/2 to delivery Dynamic Media assets {#using-http-to-delivery-dynamic-media-assets}

HTTP/2 is the new, updated web protocol that improves the way browsers and servers communicate. It provides faster transfer of information and reduces the amount of processing power that is needed. Delivery of Dynamic Media assets can now be over HTTP/2 which provides better response and load times.

See [HTTP2 Delivery of Content](http2.md) for complete details on getting started using HTTP/2 with your Dynamic Media account.

>[!MORE_LIKE_THIS]
>* [Understanding Color Management with AEM Dynamic Media](https://helpx.adobe.com/experience-manager/kt/assets/using/dynamic-media-color-management-technical-video-setup.html)
>* [Using Custom Video Thumbnail with AEM Dynamic Media](https://helpx.adobe.com/experience-manager/kt/assets/using/dynamic-media-video-thumbnails-feature-video-use.html)
>* [Understanding the Asset Viewer with AEM Dynamic Media](https://helpx.adobe.com/experience-manager/kt/assets/using/dynamic-media-viewer-feature-video-understand.html)
>* [Using Interactive Video with AEM Dynamic Media](https://helpx.adobe.com/experience-manager/kt/assets/using/dynamic-media-interactive-video-feature-video-use.html)
>* [Using the Video Player in AEM Dynamic Media](https://helpx.adobe.com/experience-manager/kt/assets/using/dynamic-media-video-player-feature-video-use.html)
>* [Using Image Sharpening with AEM Dynamic Media](https://helpx.adobe.com/experience-manager/6-4/assets/using/best-practices-for-optimizing-the-quality-of-your-images.html)

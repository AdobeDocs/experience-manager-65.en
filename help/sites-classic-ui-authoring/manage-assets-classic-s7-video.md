---
title: Video in Sites Classic Authoring
description: Assets provide for centralized video asset management where you can upload videos directly to Assets for auto-encoding to Dynamic Media Classic and access Dy videos directly from Assets for page authoring.
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: authoring
content-type: reference
discoiquuid: dfaa4b3f-f65a-4fe3-87a7-f3bc71015e56
exl-id: c540aa49-9981-4e8c-97df-972085b26490
---
# Video{#video}

Assets provide for centralized video asset management where you can upload videos directly to Assets for auto-encoding to Dynamic Media Classic and access Dynamic Media Classic videos directly from Assets for page authoring.

Dynamic Media Classic video integration extends the reach of optimized video to all screens (auto device and bandwidth detection).

* The Dynamic Media Classic video component automatically performs device and bandwidth detection to play the right format and right quality video across desktop, tablets and mobile.
* Assets - You can include adaptive video sets rather than only single video assets. An adaptive video set is a container for all video renditions that are required to play back video seamlessly across multiple screens. An Adaptive Video Set groups versions of the same video that are encoded at different bit rates and formats such as 400 kbps, 800 kbps, and 1000 kbps. You use an Adaptive Video Set, along with S7 video component, for adaptive video streaming across multiple screens including desktop, iOS, Android&trade;, BlackBerry&reg;, and Windows mobile devices. See [Dynamic Media Classic documentation about adaptive video sets for more information](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/video/quick-start-video.html#video).

## About FFMPEG and Dynamic Media Classic {#about-ffmpeg-and-scene}

The default video encoding process is based on using the FFMPEG-based integration with video profiles. Therefore, the out-of-the-box [!UICONTROL DAM Update Asset] workflow contains the following two ffmpeg-based workflow steps:

* FFMPEG thumbnails
* FFMPEG encoding

Enabling and configuring the Dynamic Media Classic integration does not automatically remove or deactivate these two workflow steps from the out-of-the-box [!UICONTROL DAM Update Asset] ingestion workflow. If you already use FFMPEG-based video encoding in Adobe Experience Manager, it is likely that you have FFMPEG installed on your authoring environments. In this case, a new video ingested using Experience Manager Assets is encoded twice: once from the FFMPEG encoder and once from Dynamic Media Classic integration.

If you have the FFMPEG-based video encoding in Experience Manager configured and FFMPEG installed, Adobe recommends that you remove the two FFMPEG workflows from your [!UICONTROL DAM Update Asset] workflows.

### Supported formats {#supported-formats}

The following formats are supported for the Dynamic Media Classic Video component:

* F4V H.264
* MP4 H.264

### Decide where to upload your video {#deciding-where-to-upload-your-video}

Deciding where to upload your video assets depends on the following:

* Do you need a workflow for the video asset?
* Do you need version control for the video asset?

If the answer is "yes" to either or both of these questions, then upload your video directly to Adobe DAM. If the answer is "no" to both questions, then upload your video directly to Dynamic Media Classic. The workflow for each scenario is described in the following section.

#### If you are uploading your video directly to Adobe Assets {#if-you-are-uploading-your-video-directly-to-adobe-assets}

If you need a workflow or versioning for your assets, you should upload to Adobe Assets first. The following is the recommended workflow:

1. Upload the video asset to Adobe Assets and automatically encode and publish to Dynamic Media Classic.
1. In Experience Manager, access video assets in WCM in the **[!UICONTROL Movies]** tab of the Content Finder.
1. Author with Dynamic Media Classic video or foundation video component.

#### If you are uploading your video to Dynamic Media Classic {#if-you-are-uploading-your-video-to-scene}

If you do not need a workflow or versioning for your assets, you should upload your assets to Dynamic Media Classic. The following is the recommended workflow:

1. In the Dynamic Media Classic desktop app, [set up a scheduled FTP uploading and encoding to Dynamic Media Classic (system automated)](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/upload-publish/uploading-files.html#upload-options).
1. In Experience Manager, access video assets in WCM in the **[!UICONTROL Dynamic Media Classic]** tab of the Content Finder.
1. Author with the Dynamic Media Classic video component.

### Configure integration with Dynamic Media Classic Video {#configuring-integration-with-scene-video}

1. In **[!UICONTROL Cloud Services]**, navigate to your **[!UICONTROL Dynamic Media Classic]** configuration and select **[!UICONTROL Edit]**.
1. Select the **[!UICONTROL Video]** tab.

   >[!NOTE]
   >
   >The **[!UICONTROL Video]** tab does not appear if the page does not have a cloud configuration. See [Enable Dynamic Media Classic for WCM](#enablingscene7forwcm).

1. Select the adaptive video encoding profile, an out-of-the-box single video encoding profile, or a custom video encoding profile.

   >[!NOTE]
   >
   >For more information about what the video presets mean, see [Video presets for encoding video files](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/setup/application-setup.html#video-presets-for-encoding-video-files).
   >
   >Adobe recommends that you select either both adaptive video sets when configuring the universal presets or select the **[!UICONTROL Adaptive Video Encoding]** option.

1. The selected encoding profiles are automatically applied to all videos uploaded to the CQ DAM target folder you set up for this Dynamic Media Classic cloud config. You can set up multiple Dynamic Media Classic cloud configurations with different target folders to apply different encoding profiles as needed.

### Updating viewer and encoding presets {#updating-viewer-and-encoding-presets}

Update the viewer and encoding presets for video in Experience Manager if the presets were updated in Dynamic Media Classic. In such case, navigate to the Dynamic Media Classic configuration in the cloud configuration and select **Update the viewer and encoding presets**.

![chlimage_1-131](assets/chlimage_1-131.png)

### Upload your primary source video {#uploading-your-master-video}

To upload your primary source video to Dynamic Media Classic from Adobe DAM:

1. Navigate to the CQ DAM target folder where you have set up your cloud configuration with Dynamic Media Classic encoding profiles.
1. Select **[!UICONTROL Upload]** to upload primary source video. Video uploading and encoding is complete after the [!UICONTROL DAM Update Asset] workflow is complete and **[!UICONTROL Publish to Dynamic Media Classic]** has a checkmark.

   >[!NOTE]
   >
   >It may take some time for the video thumbnails to be generated.

   When you drag the DAM primary source video onto the video component, it accesses *all* Dynamic Media Classic encoded proxy renditions for delivery.

### Foundation Video component versus Dynamic Media Classic Video component {#foundation-video-component-versus-scene-video-component}

When using Experience Manager, you have access to both the Video component available in Sites and the Dynamic Media Classic video component. These components are not interchangeable.

The Dynamic Media Classic video component only works for Dynamic Media Classic videos. The foundation component works with videos stored from Experience Manager (using ffmpeg) and Dynamic Media Classic videos.

The following matrix explains when you should use which component:

![chlimage_1-132](assets/chlimage_1-132.png)

>[!NOTE]
>
>Out of the box, the Dynamic Media Classic video component uses the universal video profile. You can however obtain the HTML5-based video player for use by Experience Manager. In Dynamic Media Classic, copy the embed code of the out-of-box HTML5 video player and put it in your Experience Manager page.
>

## Experience Manager Video component {#aem-video-component}

Even if using the Dynamic Media Classic Video component is recommended for viewing Dynamic Media Classic videos, this section describes using Dynamic Media Classic videos with the [!UICONTROL Foundation Video Component] in Experience Manager for completeness.

### Experience Manager Video and Dynamic Media Classic Video comparison {#aem-video-and-scene-video-comparison}

The following table provides a high-level comparison of supported capabilities between the Experience Manager Foundation Video component and the Dynamic Media Classic Video component:

|   |Experience Manager Foundation Video |Dynamic Media Classic Video |
|---|---|---|
| Approach |HTML5 first approach. Flash is only used for non-HTML5 fallback. |Flash on most desktops. HTML5 is used for mobile and tablets. |
| Delivery |Progressive |Adaptive Streaming |
| Tracking |Yes |Yes |
| Extensibility |Yes |No |
| Mobile Video |Yes |Yes |

### Set Up {#setting-up}

#### Create Video profiles {#creating-video-profiles}

The various video encodings are created according to the Dynamic Media Classic encoding presets selected in the Dynamic Media Classic Cloud Configuration. For the foundation Video component to use them, you must create a video profile for each Dynamic Media Classic encoding preset selected. It allows the video component to select the DAM renditions accordingly.

>[!NOTE]
>
>New video profiles and changes to them must be activated to publish.

1. In Experience Manager, go to **[!UICONTROL Tools]**, then select **[!UICONTROL Configuration Console]**.
1. In the Configuration Console, navigate to **[!UICONTROL Tools]** > **[!UICONTROL Assets]** > **[!UICONTROL Video Profiles]** in the navigation tree.
1. Create a Dynamic Media Classic Video profile. In the **[!UICONTROL New]** menu, select **[!UICONTROL Create Page]**.
1. Select the Dynamic Media Classic Video profile template. Give the new video profile page a name and select **[!UICONTROL Create]**.

   ![chlimage_1-133](assets/chlimage_1-133.png)

1. Edit the new video profile. Select the cloud config first. Then select the same encoding preset as selected in the cloud config.

   ![chlimage_1-134](assets/chlimage_1-134.png)

   | Property |Description |
   |---|---|
   | Dynamic Media Classic Cloud Config |The cloud config to use for the encoding presets. |
   | Dynamic Media Classic Encoding Preset |The encoding preset to map this video profile with. |
   | HTML5 video type |This property lets you set the value of the type property of the HTML5 video source element. This information is not provided by the Dynamic Media Classic encoding presets, but required for properly rendering the videos using HTML5 video element. A list for common formats is provided, but can be overwritten for other formats.  |

   Repeat this step for all encoding presets selected in the cloud config that you want to use in the video component.

#### Configure Design {#configuring-design}

The foundation video component must know about what video profiles to use in order to build the video sources list. Open the video components design dialog and configure the components design for using the new video profiles.

>[!NOTE]
>
>If you use the foundation Video component on a mobile page, repeat these steps on the design of the mobile page.

>[!NOTE]
>
>Changes made to the design require activation of the design in order to take effect on publish.

1. Open the foundation video component's design dialog and change to the **[!UICONTROL Profiles]** tab. Then delete the out-of-the-box profiles and add the new Dynamic Media Classic video profiles. The order of the profile list in the design dialog as well defines the order of the video sources element when rendering.
1. For browsers not supporting HTML5, the Video component lets you configure a flash fallback. Open the video components design dialog and change to the **[!UICONTROL Flash]** tab. Configure the flash player settings and assign a fallback profile for the flash player.

#### Checklist {#checklist}

1. Create a Dynamic Media Classic cloud config. Make sure that the video encoding presets are set and the importer is running.
1. Create a Dynamic Media Classic video profile for each video encoding preset selected in the cloud config.
1. The video profiles must be activated.
1. Configure the design of the foundation video component on your page.
1. Activate the design after you are done with your design changes.

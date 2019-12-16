---
title: Video
seo-title: Video
description: Learn about the centralized video asset management AEM Assets where you can upload videos for auto-encoding to Dynamic Media Classic and access Dynamic Media Classic videos directly from AEM Assets. Dynamic Media Classic video integration extends the reach of optimized video to all screens.
seo-description: Learn about the centralized video asset management AEM Assets where you can upload videos for auto-encoding to Dynamic Media Classic and access Dynamic Media Classic videos directly from AEM Assets. Dynamic Media Classic video integration extends the reach of optimized video to all screens.
uuid: 8b3423f1-d96b-44d9-bdb7-e3b77875b25d
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: managing-assets
content-type: reference
discoiquuid: 2685f9f3-0973-40a9-89b8-e7db0a6a75f2
---

# Video {#video}

Assets provides for centralized video asset management where you can upload videos directly to Assets for auto-encoding to Dynamic Media Classic (Scene7) and access Dynamic Media Classic videos directly from Assets for page authoring.

Dynamic Media Classic video integration extends the reach of optimized video to all screens (auto device and bandwidth detection).

* The **[!UICONTROL Scene7 Video]** component automatically performs device and bandwidth detection to play the right format and right quality video across desktop, tablets and mobile.
* Assets - You can include adaptive video sets rather than only single video assets. An adaptive video set is a container for all video renditions required to playback video seamlessly across multiple screens. An Adaptive Video Set groups versions of the same video that are encoded at different bit rates and formats such as 400 kbps, 800 kbps, and 1000 kbps. You use an Adaptive Video Set, along with S7 video component, for adaptive video streaming across multiple screens including desktop, iOS, Android, Blackberry, and Windows mobile devices. See [Scene7 documentation about adaptive video sets for more information](https://help.adobe.com/en_US/scene7/using/WS53492AE1-6029-45d8-BF80-F4B5CF33EB08.html).

## About FFMPEG and Dynamic Media Classic {#about-ffmpeg-and-scene}

The default video encoding process is based on using the FFMPEG-based integration with video profiles. Therefore, the out-of-the-box DAM ingestion workflow contains the following two ffmpeg-based workflow steps:

* FFMPEG thumbnails
* FFMPEG encoding

Be aware that enabling and configuring the Dynamic Media Classic integration does not automatically remove or deactivate these two workflow steps from the out-of-the-box DAM ingestion workflow. If you already make use of the FFMPEG-based video encoding in AEM, it is likely that you have FFMPEG installed on your authoring environments. In this case, a new video ingested using DAM would be encoded twice: once from the FFMPEG encoder and once from Dynamic Media Classic integration.

If you have the FFMPEG-based video encoding in AEM configured and FFMPEG installed, Adobe recommends that you remove the two FFMPEG workflows from your DAM ingestion workflows.

## Supported Formats {#supported-formats}

The following formats are supported for the Scene7 Video component:

* F4V H.264
* MP4 H.264

## Deciding where to upload your video {#deciding-where-to-upload-your-video}

Deciding where to upload your video assets depends on the following:

* Do you need a workflow for the video asset?
* Do you need version control for the video asset?

If the answer is "yes" to either or both of these questions, then upload your video directly to Adobe DAM. If the answer is "no" to both questions, then upload your video directly to Dynamic Media Classic. The workflow for each scenario is described in the following section.

### If you are uploading your video directly to Adobe DAM {#if-you-are-uploading-your-video-directly-to-adobe-dam}

If you need a workflow or versioning for your assets, you should upload to Adobe DAM first. The following is the recommended workflow:

1. Upload the video asset to Adobe DAM and automatically encode and publish to Dynamic Media Classic.
1. In AEM, access video assets in WCM in the **[!UICONTROL Movies]** tab of the Content Finder.
1. Author with **[!UICONTROL Scene7 Video]** or **[!UICONTROL Foundation Video]** component.

### If you are uploading your video to Scene7 {#if-you-are-uploading-your-video-to-scene}

If you do not need a workflow or versioning for your assets, you should upload your assets to Scene7. The following is the recommended workflow:

1. In Dynamic Media Classic, [set up a scheduled FTP uploading and encoding to Scene7 (system automated)](https://help.adobe.com/en_US/scene7/using/WS70B173EC-4CAD-4b4c-BF9C-43A11F3A5950.html).
1. In AEM, access video assets in WCM in the **[!UICONTROL Scene7]** tab of the Content Finder.
1. Author with the **[!UICONTROL Scene7 Video]** component.

## Configuring Integration with Scene7 Video {#configuring-integration-with-scene-video}

To configure universal presets:

1. In **[!UICONTROL Cloud Services]**, navigate to your **[!UICONTROL Scene7]** configuration and click **[!UICONTROL Edit]**.
1. Select the **[!UICONTROL Video]** tab.

   ![chlimage_1-363](assets/chlimage_1-363.png)

   >[!NOTE]
   >
   >The **[!UICONTROL Video]** tab does not appear if the page does not have a cloud configuration.

1. Select the adaptive video encoding profile, an out-of-the-box single video encoding profile, or a custom video encoding profile.

   >[!NOTE]
   >
   >For more information about what the video presets mean, see the [Dynamic Media Classic documentation](https://help.adobe.com/en_US/scene7/using/WSE86ACF2B-BD50-4c48-A1D7-9CD4405B62D0.html).
   >
   >Adobe recommends that you select either both adaptive video sets when configuring the universal presets or select the **[!UICONTROL Adaptive Video Encoding]** option.

1. The selected encoding profiles are automatically applied to all videos uploaded to the CQ DAM target folder you set up for this Scene7 cloud configuration. You can set up multiple Scene7 cloud configurations with different target folders to apply different encoding profiles as needed.

## Updating viewer and encoding presets {#updating-viewer-and-encoding-presets}

If you need to update the viewer and encoding presets for video in AEM because the presets have been updated in Scene7, navigate to the Scene7 configuration in the cloud configuration and click **[!UICONTROL Update the viewer and encoding presets]**.

![chlimage_1-364](assets/chlimage_1-364.png)

## Uploading your master video to Scene7 from Adobe DAM {#uploading-your-master-video}

1. Navigate to the CQ DAM target folder where you have set up your cloud configuration with Scene7 encoding profiles.
1. Click **[!UICONTROL Upload]** to upload master video. Video uploading and encoding is complete after the DAM Update Asset workflow is complete and **[!UICONTROL Publish to Scene7]** has a checkmark.

   >[!NOTE]
   >
   >It may take some time for the video thumbnails to be generated.

   Dragging the DAM master video on to the video component accesses *all* of the Scene7 encoded proxy renditions for delivery.

## Foundation Video Component versus Scene7 Video Component {#foundation-video-component-versus-scene-video-component}

When using AEM, you have access to both the Video component available in Sites and the Scene7 video component. These components are not interchangeable.

The Scene7 video component only works for Scene7 videos. The foundation component works with videos stored from AEM (using ffmpeg) and Scene7 videos.

The following matrix explains when you should use which component:

![chlimage_1-365](assets/chlimage_1-365.png)

>[!NOTE]
>
>Out of the box, the S7 video component uses the universal video profile. You can however obtain the HTML5-based video player for use by AEM by doing one of the following in Scene7: copy the embed code of the out-of-box HTML5 video player and put it in your AEM page.

## AEM Video Component {#aem-video-component}

Even if using the Scene7 video component is recommended for viewing Scene7 videos, this section describes using Scene7 videos with the Foundation Video Component in AEM, for the sake of completeness.

### AEM Video and Scene7 Video comparison {#aem-video-and-scene-video-comparison}

The following table provides a high level comparison of supported capabilties between the AEM Foundation Video component and the Scene7 Video component:

|   |AEM Foundation Video |Scene7 Video |
|---|---|---|
| Approach |HTML5 first approach. Flash is only used for non-HTML5 fallback. |Flash on most desktops. HTML5 is used for mobile and tablets. |
| Delivery |Progressive |Adaptive Streaming |
| Tracking |Yes |Yes |
| Extensibility |Yes |Yes (with Scene7 viewer SDK) |
| Mobile Video |Yes |Yes |

### Setting Up {#setting-up}

#### Creating Video Profiles {#creating-video-profiles}

The various video encodings are created according to the S7 encoding presets selected in the S7 cloud config. In order for the foundation video component to make use of them, a video profile must be created for each S7 encoding preset selected. This allows the video component to select the DAM renditions accordingly.

>[!NOTE]
>
>New video profiles and changes to them must be activated to publish.

1. In AEM, tap **[!UICONTROL Tools > Configuration Console**.
1. In the **[!UICONTROL Configuration Console]** navigate to **[!UICONTROL Tools > DAM > Video Profiles]** in the navigation tree.
1. Create a new S7 Video Profile. In the **[!UICONTROL New...]** menu, select **[!UICONTROL Create Page]** and then select the Scene7 Video Profile template. Give the new video profile page a name and click **[!UICONTROL Create]**.

   ![chlimage_1-366](assets/chlimage_1-366.png)

1. Edit the new video profile. Select the cloud config first. Then select the same encoding preset as selected in the cloud config.

   ![chlimage_1-367](assets/chlimage_1-367.png)

   | Property |Description |
   |---|---|
   | Scene7 Cloud Config |The cloud config to use for the encoding presets. |
   | Scene7 Encoding Preset |The encoding preset to map this video profile with. |
   | HTML5 video type |This property allows to set the value of the type property of the HTML5 video source element. This information is not provided by the S7 encoding presets, but required for properly rendering the videos using HTML5 video element. A list for common formats is provided, but can be overwritten for other formats.  |

   Repeat this step for all encoding presets selected in the cloud config that you want to use in the video component.

#### Configuring design {#configuring-design}

The **[!UICONTROL Foundation Video]** component must know about what video profiles to use in order to build the video sources list. You must open the video components design dialog box and configure the components design for using the new video profiles.

>[!NOTE]
>
>If you use the **[!UICONTROL Foundation Video]** component on a mobile page, you might need to repeat these steps on the design of the mobile page.

>[!NOTE]
>
>Changes made to the design require activation of the design in order to take effect on publish.

1. Open the **[!UICONTROL Foundation Video]** component's design dialog box and change to the **[!UICONTROL Profiles]** tab. Then delete the out-of-the-box profiles and add the new S7 video profiles. The order of the profile list in the design dialog box defines the order of the video sources element when rendering.
1. For browsers not supporting HTML5, the video component allows to configure a Flash fallback. Open the video components design dialog box and change to the **[!UICONTROL Flash]** tab. Configure the Flash player settings and assign a fallback profile for the flash player.

#### Checklist {#checklist}

1. Create a S7 cloud config. Make sure the video encoding presets are set and the importer is running.
1. Create a S7 video profile for each video encoding preset selected in the cloud config.
1. The video profiles must be activated.
1. Configure the design of the **[!UICONTROL oundation Video]** component on your page.
1. Activate the design after you are done with your design changes.


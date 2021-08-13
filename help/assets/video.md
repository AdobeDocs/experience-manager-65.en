---
title: Video in Dynamic Media
description: Learn how to work with video in Dynamic Media
mini-toc-levels: 3
uuid: 97f311a3-a227-479a-91bf-fb54ecd1a55d
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
discoiquuid: 1103b849-0042-4e11-b170-38ee81dd0157
docset: aem65
feature: Asset Management
role: User, Admin
exl-id: 28cf9e39-cab4-4278-b6c9-e84cc31964db
---
# Video in Dynamic Media {#video}

This section describes working with video in Dynamic Media.

## Quick Start: Videos {#quick-start-videos}

The following step-by-step workflow description is designed to help you get up and running quickly with adaptive video sets in Dynamic Media. After each step, there are cross-references to topic headings where you can find more information.

>[!IMPORTANT]
>
>Before you work with video in Dynamic Media, make sure that your Adobe Experience Manager administrator has already enabled and configured Dynamic Media Cloud Services in either Dynamic Media - Scene7 mode or Dynamic Media - Hybrid mode.
>
>* See [Configure Dynamic Media Cloud Services](/help/assets/config-dms7.md#configuring-dynamic-media-cloud-services) in Configuring Dynamic Media - Scene7 mode and [Troubleshoot Dynamic Media - Scene7 mode](/help/assets/troubleshoot-dms7.md).
>
>* See [Configure Dynamic Media Cloud Services](/help/assets/config-dynamic.md#configuring-dynamic-media-cloud-services) in Configuring Dynamic Media - Hybrid mode.
>
>Currently known video playback issues in Dynamic Media *on Experience Manager 6.5.9.0 only*:
>
>* <!-- CQDOC-18116 -->You cannot play video renditions from the asset's Details page on Experience Manager - Dynamic Media running in hybrid mode.
>* <!-- CQDOC-18116 -->You cannot stream videos on Experience Manager - Dynamic Media running in hybrid mode.
>

1. **Upload your Dynamic Media videos** by doing the following:

    * Create your own video encoding profile. Or, you can simply use the predefined _Adaptive Video Encoding_ profile that comes with Dynamic Media.

        * [Create a video encoding profile](/help/assets/video-profiles.md#creating-a-video-encoding-profile-for-adaptive-streaming).
        * Learn more about [Best practices for video encoding](#best-practices-for-encoding-videos).

    * Associate the video processing profile to one or more folders where you are going to upload your primary source videos.

        * [Apply a video profile to folders](/help/assets/video-profiles.md#applying-a-video-profile-to-folders).
        * Learn more about [Best practices for organizing your digital assets for using processing profiles](/help/assets/organize-assets.md).
        * Learn more about [Organize digital assets](/help/assets/organize-assets.md).

    * Upload your primary source videos to the folders. When you add videos to the folder, they are encoded according to the video processing profile that you assigned to the folder.

        * Dynamic Media supports primarily short-form videos with a maximum length of 30 minutes.
        * You can upload video files that are up to 15 GB each.
        * [Upload your videos](/help/assets/managing-video-assets.md#upload-and-preview-video-assets).
        * Learn more about [Supported input file formats](/help/assets/assets-formats.md#supported-multimedia-formats).

    * Monitor how [video encoding is progressing](#monitoring-video-encoding-and-youtube-publishing-progress) either from the asset or workflow view.

1. **Manage your Dynamic Media videos** by doing any of the following:

    * Organize, browse, and search video assets

        * [Organize digital assets](/help/assets/organize-assets.md)
          Learn more about [Best practices for organizing your digital assets for using processing profiles](organize-assets.md)

        * [Search video assets](search-assets.md#custompredicates) or [Search assets](/help/assets/search-assets.md)

    * Preview and publish video assets

        * View the source video and encoded renditions of the video along with its associated thumbnails:
          [Preview videos](managing-video-assets.md#upload-and-preview-video-assets) or [Preview assets](previewing-assets.md)
          [View video renditions](video-renditions.md)
          [Manage video renditions](manage-assets.md#managing-renditions)

        * [Manage viewer presets](managing-viewer-presets.md)
        * [Publish assets](publishing-dynamicmedia-assets.md)

    * Work with video metadata

        * View the properties of an encoded video rendition such as frame rate, audio and video bitrate, and codec:
          [View video rendition properties](video-renditions.md)

        * Edit the properties of video such as the title, description, and tags, custom metadata fields:
          [Edit video properties](manage-assets.md#editing-properties)

        * [Manage metadata for digital assets](metadata.md)
        * [Metadata schemas](metadata-schemas.md)

    * Review, approve, and annotate videos, and maintain full version control

        * [Annotate videos](managing-video-assets.md#annotate-video-assets) or [Annotate assets](manage-assets.md#annotating)

        * [Create a version](manage-assets.md#asset-versioning)
        * [Apply workflows to assets](assets-workflow.md) or see [Start a workflow on an asset](manage-assets.md#starting-a-workflow-on-an-asset)

        * [Review folder assets](bulk-approval.md)
        * [Projects](../sites-authoring/projects.md)

1. **Publish your Dynamic Media videos** by doing one of the following:

    * If you use Adobe Experience Manager as your web content management system, you can add videos directly to your web pages.

        * [Add videos to your web pages](adding-dynamic-media-assets-to-pages.md).

    * If you are using a third-party web content management system, you can link or embed videos to your web pages.

        * Integrate video using URL:
          [Link URLs to your web application](linking-urls-to-yourwebapplication.md).

        * Integrate video using embed code on web page:
          [Embed the video viewer on a web page](embed-code.md).

    * [Publish videos to YouTube](#publishing-videos-to-youtube).
    * [Generate video reports](#viewing-video-reports).

    * [Add captions to video](#adding-captions-to-video).

## Work with video in Dynamic Media {#working-with-video-in-dynamic-media}

Video in Dynamic Media is an end-to-end solution that makes it easy to publish high-quality Adaptive Video for streaming across multiple screens, including desktop, iOS, Android™, BlackBerry®, and Windows mobile devices. An Adaptive Video Set groups versions of the same video that are encoded at different bit rates and formats such as 400 kbps, 800 kbps, and 1000 kbps. The desktop computer or mobile device detects the available bandwidth.

For example, on an iOS mobile device, it detects a bandwidth such as 3G, 4G, or Wi-Fi. Then, it automatically selects the right encoded video from among the various video bit rates within the Adaptive Video Set. The video is streamed to desktops, mobile devices, or tablets.

In addition, video quality is dynamically switched automatically if network conditions change on the desktop or on the mobile device. Also, if a customer enters full-screen mode on a desktop, the Adaptive Video Set responds by using a better resolution, improving the customer’s viewing experience. Using Adaptive Video Sets provides you with the best possible playback for customers playing Dynamic Media video on multiple screens and devices.

The logic that a video player uses to determine which encoded video to play or to select during playback is based on the following algorithm:

1. Video player loads the initial video fragment based on the bit rate that is closest to the value that is set for "initial bitrate" in the player itself.
1. Video player switches based on changes to the bandwidth speed using the following criteria:

    1. Player picks the highest bandwidth stream below or equal to the estimated bandwidth.
    1. Player considers only 80% of the available bandwidth. However, if it is switching up, it is more conservative at only 70% to avoid overestimating and immediately switching back.

For detailed technical information about the algorithm, see [https://android.googlesource.com/platform/frameworks/av/+/master/media/libstagefright/httplive/LiveSession.cpp](https://android.googlesource.com/platform/frameworks/av/+/master/media/libstagefright/httplive/LiveSession.cpp)

For managing single video and Adaptive Video Sets, the following is supported:

* Uploading video from numerous supported video formats and audio formats and encoding video to MP4 H.264 format for playback across multiple screens. You can use predefined adaptive video presets, single video encoding presets, or customize your own encoding to control the quality and size of the video.

  * When an adaptive video set is generated, it includes MP4 videos.
  * **Note**: Master/source videos are not added to an Adaptive Video Set.

* Video captioning in all HTML5 video viewers.
* Organize, browse, and search video with full metadata support for efficient management of video assets.
* Deliver Adaptive Video Sets to the web and to desktops, and mobile devices, including the iPhone, iPad, Android™, BlackBerry®, and Windows phone.

Adaptive video streaming is supported on various iOS platforms. See [Dynamic Media Viewers Reference Guide](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/library/viewers-aem-assets-dmc/video/c-html5-video-reference.html#video).

Dynamic Media supports mobile video playback for MP4 H.264 video. You can find BlackBerry® devices that support this video format at the following: [Supported video formats on BlackBerry®](https://support.blackberry.com/kb/articleDetail?ArticleNumber=000005482).

You can find Windows devices that support this video format at the following: [Supported media codecs for Windows Phone 8](https://docs.microsoft.com/en-us/windows/uwp/audio-video-camera/supported-codecs)

* Play back the video using Dynamic Media Video Viewer Presets, including the following:

  * Single video viewers.
  * Mixed Media viewers that combine both video and image content.

* Configure video players to meet your branding needs.
* Integrate video to your website, mobile site, or mobile application with a simple URL or embed code.

<!-- See [Dynamic video playback](https://s7d9.scene7.com/s7/uvideo.jsp?asset=GeoRetail/Mop_AVS&config=GeoRetail/Universal_Video1&stageSize=640,480) sample. -->

See also [Viewers for Experience Manager Assets and Dynamic Media Classic](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/library/viewers-aem-assets-dmc/c-html5-s7-aem-asset-viewers.html#viewers-aem-assets-dmc) and [Viewers for Experience Manager assets only](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/library/viewers-for-aem-assets-only/c-html5-aem-asset-viewers.html#viewers-for-aem-assets-only).

## Best practice: Using the HTML5 video viewer {#best-practice-using-the-html-video-viewer}

The Dynamic Media HTML5 Video viewer presets are robust video players. You can use them to avoid many common issues that are associated with HTML5 video playback. And, issues associated with mobile devices such as lack of adaptive streaming delivery and limited desktop browser reach.

On the design side of the player, you can design the video player’s functionality using standard web development tools. For example, you can design the buttons, controls, and custom poster image background using HTML5 and CSS to help you reach your customers with a customized appearance.

On the playback side of the viewer, it automatically detects the browser’s video capability. It then serves the video using HLS (HTTP Live Streaming), also known as adaptive video streaming. Or, if those delivery methods are not present then HTML5 progressive is used instead.

By combining into a single player the following:

* The ability to design the playback components using HTML5 and CSS
* Have embedded playback
* Use adaptive and progressive streaming depending on the browser’s capability

You extend the reach of your rich media content to both desktop and mobile users and ensure a streamlined video experience.

See also [About HTML5 Viewers](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/library/viewers-for-aem-assets-only/c-html5-aem-asset-viewers.html#viewers-for-aem-assets-only).

### Playback of video on desktop computers and mobile devices using the HTML5 video viewer {#playback-of-video-on-desktop-computers-and-mobile-devices-using-the-html-video-viewer}

For desktop and mobile adaptive video streaming, the videos used for bit rate switching are based on all MP4 videos in the Adaptive Video Set.

Video playback occurs using either HLS or progressive video download. In prior versions of Experience Manager, such as 6.0, 6.1, and 6.2, videos were streamed over HTTP.

However, in Experience Manager 6.3 and on, videos are now streamed over HTTPS (that is, HLS) because the DM gateway service URL always uses HTTPS as well. There is no customer impact in this default behavior. That is, video streaming will always occur over HTTPS unless it is not supported by the browser. (see the following table). Therefore,

* If you have an HTTPS website with HTTPS video streaming, streaming is fine.
* If you have an HTTP website with HTTPS video streaming, streaming is fine and there are no mixed content issues from the web browser.

HLS is an Apple standard for adaptive video streaming that automatically adjusts playback based on network bandwidth capacity. It also lets the customer “seek” to any point in the video without the need to wait for the rest of the video to download.

Progressive video is delivered by downloading and storing the video locally on a user’s desktop system or mobile device.

The following table describes the device, browser, and playback method of videos on desktop computers and mobile devices using the Dynamic Media Video Viewer.

<table>
 <tbody>
  <tr>
   <td><strong>Device</strong></td>
   <td><strong>Browser</strong></td>
   <td><strong>Video playback mode</strong></td>
  </tr>
  <tr>
   <td>Desktop</td>
   <td>Internet Explorer 9 and 10</td>
   <td>Progressive download.</td>
  </tr>
  <tr>
   <td>Desktop</td>
   <td>Internet Explorer 11+</td>
   <td>On Windows 8 and Windows 10 - Force use of HTTPS whenever HLS is requested. Known limitation: HTTP on HLS does not work in this browser/operating system combination<br /> <br /> On Windows 7 - Progressive download. Uses standard logic for selecting HTTP versus HTTPS protocol.</td>
  </tr>
  <tr>
   <td>Desktop</td>
   <td>Firefox 23-44</td>
   <td>Progressive download.</td>
  </tr>
  <tr>
   <td>Desktop</td>
   <td>Firefox 45 or later</td>
   <td>HLS</td>
  </tr>
  <tr>
   <td>Desktop</td>
   <td>Chrome</td>
   <td>HLS</td>
  </tr>
  <tr>
   <td>Desktop</td>
   <td>Safari (Mac)</td>
   <td>HLS</td>
  </tr>
  <tr>
   <td>Mobile</td>
   <td>Chrome (Android™ 6 or earlier)</td>
   <td>Progressive download.</td>
  </tr>
  <tr>
   <td>Mobile</td>
   <td>Chrome (Android™ 7 or later)</td>
   <td>HLS</td>
  </tr>
  <tr>
   <td>Mobile</td>
   <td>Android™ (default browser)</td>
   <td>Progressive download.</td>
  </tr>
  <tr>
   <td>Mobile</td>
   <td>Safari (iOS)</td>
   <td>HLS</td>
  </tr>
  <tr>
   <td>Mobile</td>
   <td>Chrome (iOS)</td>
   <td>HLS</td>
  </tr>
  <tr>
   <td>Mobile</td>
   <td>BlackBerry®</td>
   <td>HLS</td>
  </tr>
 </tbody>
</table>

## Architecture of Dynamic Media video solution {#architecture-of-dynamic-media-video-solution}

The following graphic shows the overall authoring workflow of videos that are uploaded and encoded by way of DMGateway (in Dynamic Media Hybrid mode) and made available for public consumption.

![chlimage_1-427](assets/chlimage_1-427.png)

## Hybrid publishing architecture for videos {#hybrid-publishing-architecture-for-videos}

![chlimage_1-428](assets/chlimage_1-428.png)

## Best practices for encoding videos {#best-practices-for-encoding-videos}

The **Dynamic Media Encode Video** workflow encodes video if you have enabled Dynamic Media and set up video cloud services. This workflow captures workflow process history and failure information. See [Monitor video encoding and YouTube publishing progress](#monitoring-video-encoding-and-youtube-publishing-progress). If you have enabled Dynamic Media and set up video cloud services, the **[!UICONTROL Dynamic Media Encode Video]** workflow automatically takes effect when you upload a video. (If you are not using Dynamic Media, the **[!UICONTROL DAM Update Asset]** workflow takes effect.)

<!-- DEAD The following are best-practice tips for encoding source video files.

For advice about video encoding, see [Video Encoding Basics](https://www.adobe.com/go/learn_s7_encoding_en).

* [Streaming 101: The Basics — Codecs, Bandwidth, Data Rate, and Resolution](https://www.adobe.com/go/learn_s7_streaming101_en). -->

### Source video files {#source-video-files}

When you encode a video file, use a source video file of the highest possible quality. Avoid using previously encoded video files because these files are already compressed, and further encoding creates a subpar quality video.

* Dynamic Media supports short-form videos with a maximum length of 30 minutes.
* You can upload primary source video files that are up to 15 GB each.

The following table describes the recommended size, aspect ratio, and minimum bit rate that your source video files must have before you encode them:

|Size|Aspect ratio|Minimum bit rate|
|--- |--- |--- |
|1024 X 768|4:3|4500 kbps for most videos.|
|1280 X 720|16:9|3000 - 6000 kbps, depending on the amount of motion in the video.|
|1920 X 1080|16:9|6000 - 8000 kbps, depending on the amount of motion in the video.|

### Obtain a file's metadata {#obtaining-a-file-s-metadata}

You can obtain a file’s metadata by viewing its metadata using a video editing tool, or using an application designed for obtaining metadata. Following are instructions for using MediaInfo, a third-party application, to obtain a video file’s metadata:

1. Go to [MediaInfo Download](https://mediaarea.net/en/MediaInfo/Download).
1. Select and download the installer for the GUI version, and follow the installation instructions.
1. After installation, either right-click the video file (Windows only) and select MediaInfo, or open MediaInfo and drag your video file into the application. You see all metadata associated with your video file, including its width, height, and fps.

### Aspect ratio {#aspect-ratio}

When you choose or create a video encoding preset for your primary source video file, make sure that the preset has the same aspect ratio as the primary source video file. The aspect ratio is the ratio of the width to the height of the video.

To determine the aspect ratio of a video file, obtain the file’s metadata and note the file’s width and height (see Obtaining a file's metadata above). Then use this formula to determine the aspect ratio:

width/height = aspect ratio

The following table describes how formula results translate to common aspect ratio choices:

|Formula result|Aspect ratio|
|--- |--- |
|1.33|4:3|
|0.75|3:4|
|1.78|16:9|
|0.56|9:16|

For example, a video that is 1440 width x 1080 height has an aspect ratio of 1440/1080, or 1.33. In this case, you choose a video encoding preset with a 4:3 aspect ratio to encode the video file.

### Bitrate {#bitrate}

Bitrate is the amount of data that is encoded to make up a single second of video playback. The bitrate is measured in kilobits per second (Kbps).

>[!NOTE]
>
>Because all codecs use lossy compression, bitrate is the most important factor in video quality. With lossy compression, the more you compress a video file, the more the quality is degraded. For this reason, all other characteristics being equal (the resolution, frame rate, and codec), the lower the bitrate, the lower the quality of the compressed file.

When selecting a bitrate encoding, there are two types you can choose:

* **[!UICONTROL Constant Bitrate Encoding]** (CBR) - During CBR encoding, the bitrate, or the number of bits per second is kept the same throughout the encoding process. CBR encoding persists the set data rate to your setting over the entire video. Also, CBR encoding does not optimize media files for quality but does save on storage space.
  Use CBR if your video contains a similar motion level throughout the entire video. CBR is most commonly used for streaming video content. See also [Use custom-added video encoding parameters](/help/assets/video-profiles.md#using-custom-added-video-encoding-parameters).

* **[!UICONTROL Variable Bitrate Encoding]** (VBR) - VBR encoding adjusts the data rate down and to the upper limit you set, based on the data required by the compressor. This functionality means that during a VBR encoding process the bitrate of the media file dynamically increases or decreases depending on the media files bitrate needs.
  VBR takes longer to encode but produces the most favorable results; the quality of the media file is superior. VBR is most commonly used for http progressive delivery of video content.

When do you use VBR versus CRB?
When selecting VBR versus CBR, it is almost always recommended that you use VBR for your media files. VBR provides higher-quality files at competitive bitrates. When you use VBR, be sure you use with two-pass encoding, and set the maximum bitrate to be 1.5x the target video bitrate.

When you choose a video encoding preset, remember the target end user’s connection speed. Choose a preset with a data rate that is 80 percent of that speed. For example, if the target end user’s connection speed is 1000 Kbps, the best preset is one with a video data rate of 800 Kbps.

This table describes the data rate of typical connection speeds.

|Speed (Kbps)|Connection type|
|--- |--- |
|256|Dial-up connection.|
|800|Typical mobile connection. For this connection, target a data rate in the range of 400 to a maximum of 800 for 3G experiences.|
|2000|Typical broadband desktop connection. For this connection, target a data rate in the 800-2000 Kbps range, with most targets averaging 1200-1500 Kbps.|
|5000|Typical high-broadband connection. Encoding in this upper range is not recommended because video delivery at this speed is not available to most consumers.|

### Resolution {#resolution}

**Resolution** describes a video file’s height and width in pixels. Most source video is stored at a high resolution (for example, 1920 x 1080). For streaming purposes, source video is compressed to a smaller resolution (640 x 480 or smaller).

Resolution and data rate are two integrally linked factors that determine video quality. To maintain the same video quality, the higher the number of pixels in a video file (the higher the resolution), the higher the data rate must be. For example, consider the number of pixels per frame in a 320 x 240 resolution and a 640 x 480 resolution video file:

|Resolution|Pixels per frame|
|--- |--- |
|320 x 240|76,800|
|640 x 480|307,200|

The 640 x 480 file has four times more pixels per frame. To achieve the same data rate for these two example resolutions, you apply four times the compression to the 640 x 480 file, which can reduce the quality of the video. Therefore, a video data rate of 250 Kbps produces high-quality viewing at a 320 x 240 resolution, but not at a 640 x 480 resolution.

In general, the higher data rate you use, the better your video looks, and the higher resolution you use, the higher data rate you must maintain viewing quality (compared to lower resolutions).

Because resolution and data rate are linked, you have two options when encoding video:

* Choose a data rate and then encode at the highest resolution that looks good at the data rate you chose.
* Choose a resolution and then encode at the data rate necessary to achieve high-quality video at the resolution you chose.

When you choose (or create) a video encoding preset for your primary source video file, use this table to target the correct resolution:

|Resolution|Height (pixels)|Screen size|
|--- |--- |--- |
|240p|240|Tiny screen|
|300p|300|Small screen typically for mobile devices|
|360p|360|Small screen|
|480p|480|Medium screen|
|720p|720|Large screen|
|1080p|1080|High-definition large screen|

### Fps (Frames per second) {#fps-frames-per-second}

In the United States and Japan, most video is shot at 29.97 frames per second (fps); in Europe, most video is shot at 25 fps. Film is shot at 24 fps.

Choose a video encoding preset that matches the fps rate of your primary source video file. For example, if your primary source video is 25 fps, choose an encoding preset with 25 fps. By default, all custom encoding uses the primary source video file’s fps. For this reason, you do not need to explicitly specify the fps setting when you create a video encoding preset.

### Video encoding dimensions {#video-encoding-dimensions}

For optimal results, select encoding dimensions such that the source video is a whole multiple of all your encoded videos.

To calculate this ratio, you divide source width by encoded width to get the width ratio. Then, you divide source height by encoded height to get the height ratio.

If the resulting ratio is a whole integer, it means that the video is optimally scaled. If the resulting ratio is not a whole integer, it impacts video quality by leaving leftover pixel artifacts on the display. This effect is most noticeable when the video has text.

As an example, suppose that your source video is 1920 x 1080. In the following table, the three encoded videos provide the optimal encoding settings to use.

|Video Type|Width x Height|Width Ratio|Height Ratio|
|--- |--- |--- |--- |
|Source|1920 x 1080|1|1|
|Encoded|960 x 540|2|2|
|Encoded|640 x 360|3|3|
|Encoded|480 x 270|4|4|

### Encoded video file format {#encoded-video-file-format}

Dynamic Media recommends using MP4 H.264 video encoding presets. Because MP4 files use the H.264 video codec, it provides high-quality video but in a compressed file size.

## Publish videos to YouTube {#publishing-videos-to-youtube}

You can publish on-premise Experience Manager video assets directly to a YouTube channel that you have previously created.

To publish video assets to YouTube, you set up Experience Manager Assets with tags. You associate these tags with a YouTube channel. If a video asset's tag matches the tag of a YouTube channel, then the video is published to YouTube. Publish to YouTube occurs along with a normal publish of the video as long as an associated tag is used.

YouTube does its own encoding. As such, the original video file that was uploaded into Experience Manager is published to YouTube instead of any video rendition that Dynamic Media’s encoding has created. While it is not required to process videos using Dynamic Media, it is expected that they do so in case a viewer preset is needed for playback.

When you bypass the video processing profile and publish directly to YouTube, it simply means that your video asset in Experience Manager Asset does not get a viewable thumbnail. It also means that if you run in `dynamicmedia` or `dynamicmedia_scene7` run modes, videos that are not encoded do not work with any of the Dynamic Media asset types.

Publishing video assets to YouTube servers involves completing the following tasks to ensure safe and secure server-to-server authentication with YouTube:

1. [Configure Google Cloud settings](#configuring-google-cloud-settings)
1. [Create a YouTube channel](#creating-a-youtube-channel)
1. [Add tags for publishing](#adding-tags-for-publishing)
1. [Enable the YouTube Publish Replication agent](#enabling-the-youtube-publish-replication-agent)
1. [Set up YouTube in Experience Manager](#setting-up-youtube-in-aem)
1. [(Optional) Automate the setting of default YouTube properties for your uploaded videos](#optional-automating-the-setting-of-default-youtube-properties-for-your-uploaded-videos)
1. [Publish videos to your YouTube channel](#publishing-videos-to-your-youtube-channel)
1. [(Optional) Verify the published video on YouTube](/help/assets/video.md#optional-verifying-the-published-video-on-youtube)
1. [Link YouTube URLs to your Web Application](#linking-youtube-urls-to-your-web-application)

You can also [unpublish videos to remove them from YouTube](#unpublishing-videos-to-remove-them-from-youtube).

### Configure Google Cloud settings {#configuring-google-cloud-settings}

To publish to YouTube, you need a Google account. If you have a GMAIL account, then you already have a Google account; if you do not have a Google account, you can easily create one. You need the account because you need credentials to publish video assets to YouTube. If you have an account already created, then skip this task and proceed directly to [Create a YouTube channel](#creating-a-youtube-channel).

The account used with Google Cloud and the Google account used for YouTube do not need to be the same.

Google periodically changes their user interface. As such, the steps to publish videos to YouTube can vary slightly from what is documented below. This caveat also applies to YouTube when you try to check if videos are uploaded to it.

>[!NOTE]
>
>The following steps were accurate at the time of this writing. However, Google periodically updates their websites without notice. As such, these steps can be slightly different.

To configure Google Cloud settings:

1. Create a Google account.
   [https://accounts.google.com/SignUp?service=mail](https://accounts.google.com/SignUp?service=mail)

   If you already have a Google account, skip to the next step.

1. Go to [https://cloud.google.com/](https://cloud.google.com/).
1. On the Google Cloud page, near the upper-right corner, click **[!UICONTROL Console]**.

   If necessary, **[!UICONTROL Sign in]** using your Google account credentials to see the **[!UICONTROL Console]** option.

1. On the Dashboard page, to the right of **[!UICONTROL Google Cloud Platform]**, click the Project drop-down list to open the Select a Project dialog box.
1. In the Select a project dialog box, tap **[!UICONTROL New Project]**.

   ![6_5_googleaccount-newproject](assets/6_5_googleaccount-newproject.png)

1. In the New Project dialog box, in the Project Name field, type the name of your new project.

   Your Project ID is based on your project name. As such, choose the project name carefully; it cannot be changed after it is created. Also, you must enter the same Project ID again when you set up YouTube in Experience Manager later on; consider writing it down.

1. Click **[!UICONTROL Create]**.

1. Do either one of the following:

    * On your project’s Dashboard, in the Getting Started card, tap **[!UICONTROL Explore and enable APIs]**.
    * On your project's Dashboard, in the APIs card, tap **[!UICONTROL Go to APIs overview]**.

   ![6_5_googleaccount-apis-enable2](assets/6_5_googleaccount-apis-enable2.png)

1. Near the top of the APIs & Services page, tap **[!UICONTROL Enable APIs and Services]**.
1. On the API Library page, on the left side, under **[!UICONTROL Category]**, tap **[!UICONTROL YouTube]**. On the right side of the page, tap **[!UICONTROL YouTube Data API]**.
1. On the YouTube Data API v3 page, tap **[!UICONTROL Enable]**.

   ![6_5_googleaccount-apis-enable3](assets/6_5_googleaccount-apis-enable3.png)

1. To use the API, you need credentials. If necessary, click **[!UICONTROL Create Credentials]**.

   ![6_5_googleaccount-apis-createcredentials](assets/6_5_googleaccount-apis-createcredentials.png)

1. On the **[!UICONTROL Add credentials to your project]** page, step 1, do the following:

    * From the **[!UICONTROL Which API are you using?]** drop-down list, select **[!UICONTROL YouTube Data API v3]**.

    * From the **[!UICONTROL Where are you calling the API from?]** drop-down list, select **[!UICONTROL Web Server (for example, node.js, Tomcat)]**

    * From the **[!UICONTROL What data are you accessing?]** drop-down list, tap **[!UICONTROL User data]**.

   ![6_5_googleaccount-apis-createcredentials2](assets/6_5_googleaccount-apis-createcredentials2.png)

1. Tap **[!UICONTROL What credentials do I need?]**
1. On the **[!UICONTROL Add credentials to your project]** page, step 2, under the **[!UICONTROL Create an OAuth 2.0 client ID]** heading, in the Name field, enter a unique name if desired. Or, you can use the default name specified by Google.
1. Under the **[!UICONTROL Authorized JavaScript origins]** heading, in the text field, enter the following path, substituting your own domain and port number in the path, then press **[!UICONTROL Enter]** to add the path to the list:

   `https://<servername.domain>:<port_number>`

   For example, `https://1a2b3c.mycompany.com:4321`

   **Note**: The path example above is intended for demonstration purposes only.

   ![6_5_googleaccount-apis-createcredentials-oauth](assets/6_5_googleaccount-apis-createcredentials-oauth.png)

1. Under the **[!UICONTROL Authorized redirect URIs]** heading, in the text field, enter the following path, substituting your own domain and port number in the path, then press **[!UICONTROL Enter]** to add the path to the list:

   `https://<servername.domain>:<port_number>/etc/cloudservices/youtube.youtubecredentialcallback.json`

   For example, `https://1a2b3c.mycompany.com:4321/etc/cloudservices/youtube.youtubecredentialcallback.json`

   **Note**: The path example above is intended for demonstration purposes only.

1. Click **[!UICONTROL Create OAuth client ID]**.
1. On the **[!UICONTROL Add credentials to your project]** page, step 3, under the **[!UICONTROL Set up the OAuth 2.0 consent screen]** heading, select the Gmail email address that you are currently using.

   ![6_5_googleaccount-apis-createcredentials-consentscreen](assets/6_5_googleaccount-apis-createcredentials-consentscreen.png)

1. Under the **[!UICONTROL Product name shown to users]** heading, in the text field, enter what you want to show on the consent screen.

   The consent screen is displayed to the Experience Manager administrator when they authenticate to YouTube; Experience Manager contacts YouTube for permission.

1. Click **[!UICONTROL Continue]**.
1. On the Add credentials to your project page, step 4, under the **[!UICONTROL Download credentials]** heading, tap **[!UICONTROL Download]**.

   ![6_5_googleaccount-apis-createcredentials-downloadcredentials](assets/6_5_googleaccount-apis-createcredentials-downloadcredentials.png)

1. Save the `client_id.json` file.

   You need this downloaded json file when you set up YouTube in Adobe Experience Manager later on.

1. Click **[!UICONTROL Done]**.

   Log out of your Google account. Now create a YouTube channel.

### Create a YouTube channel {#creating-a-youtube-channel}

Publishing videos to YouTube requires that you have one or more channels. If you have already created a YouTube channel, you can skip this task and go to [Add tags for publishing](/help/assets/video.md#adding-tags-for-publishing).

>[!WARNING]
>
>Be sure you have already set up one or more channels in YouTube *before* you add channels under YouTube Settings in Experience Manager (see [Set up YouTube in Experience Manager](#setting-up-youtube-in-aem) below). If you fail to set up one or more channels, you are not warned of non-existent channels. However, Google authentication still occurs when you add a channel, but there is not an option to choose which channel the video is sent.

**To create a YouTube channel:**

1. Go to [https://www.youtube.com](https://www.youtube.com/) and sign in using your Google account credentials.
1. In the upper-right corner of the YouTube page, click your profile picture (can also appear as a letter within a solid colored circle), then click **[!UICONTROL YouTube settings]** (round gear icon).
1. On the Overview page, under the Additional Features heading, click **[!UICONTROL See all my channels or create a channel]**.
1. On the Channels page, click **[!UICONTROL Create a new channel]**.
1. On the Brand Account page, in the Brand Account Name field, enter a business name or any other channel name you choose where you want to publish your video assets, then click **[!UICONTROL Create]**.

   Remember the name that you enter here because you must enter it again when you set up YouTube in Experience Manager.

1. (Optional) If necessary, add more channels.

   Now add tags for publishing.

### Add tags for publishing {#adding-tags-for-publishing}

To publish to your videos to YouTube, Experience Manager associates tags to one or more YouTube channels. To add tags for publishing, see [Administer tags](/help/sites-administering/tags.md).

Or, if you intend to use the default tags in Experience Manager, you can skip this task and go to [Enable the YouTube Publish replication agent](#enabling-the-youtube-publish-replication-agent).

### Enable the YouTube Publish replication agent {#enabling-the-youtube-publish-replication-agent}

After you enable the YouTube Publish replication agent, if you want to test the connection to the Google Cloud account, tap **[!UICONTROL Test Connection]**. A browser tab displays the connection results. If you have added YouTube Channels, a listing of them is displayed as part of the test.

1. In the upper-left corner of Experience Manager, click the Experience Manager logo, then in the left rail, click **[!UICONTROL Tools]** > **[!UICONTROL Deployment]** > **[!UICONTROL Replication]** > **[!UICONTROL Agents on Author]**.
1. On the Agents of Author page, click **[!UICONTROL YouTube Publish]**.
1. On the toolbar, to the right of Settings, click **[!UICONTROL Edit]**.
1. Select the **[!UICONTROL Enabled]** checkbox so you can turn on the replication agent.
1. Click **[!UICONTROL OK]**.

   Now set up YouTube in Experience Manager.

### Set up YouTube in Experience Manager {#setting-up-youtube-in-aem}

Starting with Experience Manager 6.4, a new touch user interface method was introduced to set up YouTube publishing in Experience Manager. Based on the installed instance of Experience Manager that you are using, do one of the following:

* To configure YouTube in Experience Manager before 6.4, see [Set up YouTube in Experience Manager before 6.4](/help/assets/video.md#setting-up-youtube-in-aem-before).
* To configure YouTube in Experience Manager 6.4 or later, see [Set up YouTube in Experience Manager 6.4 and later](#setting-up-youtube-in-aem-and-later).

#### Set up YouTube in Experience Manager 6.4 and later {#setting-up-youtube-in-aem-and-later}

1. Be sure you log in to your instance of Dynamic Media as an Administrator.
1. In the upper-left corner, tap the Experience Manager logo, then in the left rail, tap **[!UICONTROL Tools]**(hammer icon) > **[!UICONTROL Cloud Services]** > **[!UICONTROL YouTube Publishing Configuration]**.
1. Tap **[!UICONTROL global]** (do not select it).

1. Near the upper-right corner of the global page, tap **[!UICONTROL Create]**.
1. On the Create YouTube Configuration page, under Google Cloud Platform Settings, in the **[!UICONTROL Application Name]** field, enter the Google Project ID.

   You specified the project ID when you initially configured Google Cloud settings earlier.
   Leave the Create YouTube Configuration page open; in a moment, you are going to return to it.

   ![6_5_youtubepublish-createyoutubeconfiguration](assets/6_5_youtubepublish-createyoutubeconfiguration.png)

1. Using a plain text editor, open the JSON file that you downloaded and saved earlier in the task [Configure Google Cloud settings](/help/assets/video.md#configuring-google-cloud-settings).
1. Select and copy the entire JSON text.
1. Return to the YouTube Account Settings dialog box. In the **[!UICONTROL JSON Config]** field, paste the JSON text.
1. Near the upper-right corner of the page, tap **[!UICONTROL Save]**.

   Now set up YouTube channels in Experience Manager.

1. Tap **[!UICONTROL Add Channel]**.
1. In the Channel Name field, enter the name of the channel that you created in the task **[!UICONTROL Adding one or more channels to YouTube]** earlier.

   You can optionally add a description, if desired.

1. Tap **[!UICONTROL Add]**.
1. YouTube/Google authentication is displayed. If you are not already logged into the Google Cloud account, then skip this step.

    * Enter the Google username and password associated with the Google Project ID and the JSON text above.
    * Depending on how many channels your account has you see two or more items. Select a channel. Do not select the e-mail address; it is not a channel.
    * On the next page, tap **[!UICONTROL Accept]** to allow access to this channel.

1. Tap **[!UICONTROL Allow]**.

   Now set up tags for publishing.

1. **[!UICONTROL Setting up tags for publishing]** - On the Cloud Services &gt; YouTube page, tap the pencil icon to edit the list of tags that you want to use.
1. Tap the drop-down list icon (upside-down caret) so you can display the list of available tags in Experience Manager.
1. Tap one or more tags so you can add them.

   To delete a tag you have added, select the tag, and tap **[!UICONTROL X]**.

1. When you are finished adding the tags you want, tap **[!UICONTROL Save]**.

   Now you publish videos to your YouTube channel.

#### Set up YouTube in Experience Manager before 6.4 {#setting-up-youtube-in-aem-before}

1. Be sure you log in to your instance of Dynamic Media as an Administrator.

1. In the upper-left corner, tap the Experience Manager logo, then in the left rail, tap **[!UICONTROL Tools]** (hammer icon) > **[!UICONTROL Deployment]** > **[!UICONTROL Cloud Services]**.
1. Under the Third-Party Services heading, under YouTube, tap **[!UICONTROL Configure now]**.
1. In the Create Configuration dialog box, enter a title (mandatory) and name (optional) in the respective fields.
1. Tap **[!UICONTROL Create]**.
1. In the YouTube Account Settings dialog box, in the **[!UICONTROL Application Name]** field, enter the Google Project ID.

   You specified the project ID when you initially [configured Google Cloud settings](/help/assets/video.md#configuring-google-cloud-settings) earlier.
   Leave the YouTube Account Setting dialog box open; you are going to return to it in a moment.

1. Using a plain text editor, open the JSON file that you downloaded and saved earlier in the task Configuring Google Cloud settings.
1. Select and copy the entire JSON text.
1. Return to the YouTube Account Settings dialog box. In the **[!UICONTROL JSON Config]** field, paste the JSON text.
1. Tap **[!UICONTROL OK]**.

   Now set up YouTube channels in Experience Manager.

1. To the right of **[!UICONTROL Available Channels]**, tap **+** (plus sign icon).
1. In the YouTube Channel Settings dialog box, in the Title field, enter the name of the channel that you created in the task **[!UICONTROL Adding one or more channels to YouTube]** earlier.

   You can optionally add a description, if desired.

1. Tap **[!UICONTROL OK]**.
1. YouTube/Google authentication is displayed. If you are not already logged into the Google Cloud account, then skip this step.

    * Enter the Google username and password associated with the Google Project ID and the JSON text above.
    * Depending on how many channels your account has you see two or more items. Select a channel. Do not select the e-mail address; it is not a channel.
    * On the next page, tap **[!UICONTROL Accept]** to allow access to this channel.

1. Tap **[!UICONTROL Allow]**.

   Now set up tags for publishing.

1. **[!UICONTROL Setting up tags for publishing]** - On the Cloud Services &gt; YouTube page, tap the pencil icon to edit the list of tags that you want to use.
1. Tap the drop-down list icon (upside-down caret) so you can display the list of available tags in Experience Manager.
1. Tap one or more tags so you can add them.

   To delete a tag you have added, select the tag, and tap **X**.

1. When you are finished adding the tags you want, tap **[!UICONTROL OK]**.

   Now you publish videos to your YouTube channel.

### (Optional) Automate the setting of default YouTube properties for your uploaded videos {#optional-automating-the-setting-of-default-youtube-properties-for-your-uploaded-videos}

You can optionally automate the setting of YouTube properties on upload of your videos by creating a metadata processing profile in Experience Manager.

To create the metadata processing profile, you are first going to copy values from the **[!UICONTROL Field Label]**, **[!UICONTROL Map to property]**, and **[!UICONTROL Choices]** fields, all found in Metadata Schemas for video. Then, you build your YouTube video metadata processing profile by adding those values to it.

To automate the setting of default YouTube properties for your uploaded videos:

1. In the upper-left corner, tap the Experience Manager logo, then in the left rail, click **[!UICONTROL Tools]** (hammer icon) > **[!UICONTROL Assets]** > **[!UICONTROL Metadata Schemas]**.
1. Click **[!UICONTROL default]**. (Do not add a checkmark to the selection box to the left of "default".)
1. On the **[!UICONTROL default]** page, check the box to the left of **[!UICONTROL video]**, then tap **[!UICONTROL Edit]**.
1. On the Metadata Schema Editor page, tap the **[!UICONTROL Advanced]** tab.
1. Under the YouTube Publishing heading, click **[!UICONTROL YouTube Category]**.
1. On the right side of the page, under the **[!UICONTROL Settings]** tab, do the following:

    * In the **[!UICONTROL Map to property]** text field, select and copy the value.
      Paste the copied value into the open text editor. You are going to need this value later when you create your metadata processing profile. Leave the text editor open.

    * Under **[!UICONTROL Choices]**, select and copy the default value that you want to use (such as People & Blogs or Science & Technology).
      Paste the copied value into the open text editor. You are going to need this value later when you create your metadata processing profile. Leave the text editor open.

1. Under the YouTube Publishing heading, tap **[!UICONTROL YouTube Privacy]**.
1. On the right side of the page, under the **[!UICONTROL Settings]** tab, do the following:

    * In the **[!UICONTROL Map to property]** text field, select and copy the value.
      Paste the copied value into the open text editor. You are going to need this value later when you create your metadata processing profile. Leave the text editor open.

    * Under **[!UICONTROL Choices]**, select and copy the default value that you want to use. Notice that the Choices are grouped in pairs of two. The bottom field in the pair is the default value that you want to copy, such as public, unlisted, or private.
      Paste the copied value into the open text editor. You are going to need this value later when you create your metadata processing profile. Leave the text editor open.

1. Near the upper-right corner of the Metadata Schema Editor page, click **[!UICONTROL Cancel]**.
1. In the upper-left corner of Experience Manager, tap the Experience Manager logo, then in the left rail, click **[!UICONTROL Tools]** (hammer icon) > **[!UICONTROL Assets]** > **[!UICONTROL Metadata Profiles]**.

1. On the Metadata Profiles page, near the upper-right corner of the page, click **[!UICONTROL Create]**.
1. In the Add Metadata Profile dialog box, in the **[!UICONTROL Profile title]** text field, enter the name `YouTube Video` then click **[!UICONTROL Create]**.
1. On the Metadata Profile Editor page, click the **[!UICONTROL Advance]** tab.
1. Add the copied YouTube Publishing values to the profile by doing the following:

    * On the right side of the page, click the **[!UICONTROL Build Form]** tab.
    * (Optional) Drag the component labeled **[!UICONTROL Section Header]** to the left and drop it in the form area.
    * (Optional) Click **[!UICONTROL Field Label]** to select the component.
    * (Optional) On the right side of the page, under the Settings tab, in the Field Label text field, enter `YouTube Publishing`.
    * Click the **[!UICONTROL Build Form]** tab, then drag the component labeled **[!UICONTROL Multi Value Text]** and drop it below the **[!UICONTROL YouTube Publishing]** heading that you created.

    * Click **[!UICONTROL Field Label]** so the component is selected.
    * On the right side of the page, under the Settings tab, paste the YouTube Publishing values (Field Label value and Map to property value) that you copied earlier, into their respective fields on the form. Paste the Choices value into the Default Value field.

1. Add the copied YouTube Privacy values to the profile by doing the following:

    * On the right side of the page, click the **[!UICONTROL Build Form]** tab.
    * (Optional) Drag the component labeled **[!UICONTROL Section Header]** to the left and drop it in the form area.
    * (Optional) Click **[!UICONTROL Field Label]** to select the component.
    * (Optional) On the right side of the page, under the Settings tab, in the Field Label text field, enter `YouTube Privacy`.
    * Click the **[!UICONTROL Build Form]** tab, then drag the component labeled **[!UICONTROL Multi Value Text]** and drop it below the **[!UICONTROL YouTube Privacy]** heading you created.

    * Click **[!UICONTROL Field Label]** so the component is selected.
    * On the right side of the page, under the Settings tab, paste the YouTube Publishing values (Field Label value and Map to property value) that you copied earlier, into their respective fields on the form. Paste the Choices value into the Default Value field.

1. Near the upper-right corner of the page, click **[!UICONTROL Save]**.
1. Apply the YouTube Publishing metadata profile to the folders where you are going to upload videos. You must have both the Metadata Profile and the Video Profile set.

   See [Metadata Profiles](/help/assets/metadata-config.md#metadata-profiles) and [Video Profiles](/help/assets/video-profiles.md).

### Publish videos to your YouTube channel {#publishing-videos-to-your-youtube-channel}

Now you associate the tags that you added earlier to video assets. This process lets Experience Manager know which assets to publish to your YouTube channel.

>[!NOTE]
>
>When running in Dynamic Media - Scene7 mode, publish immediately does not automatically publish to YouTube. When Dynamic Media - Scene7 mode is set up, there are two publish options to choose from: **[!UICONTROL Immediately]** or **[!UICONTROL Upon Activation]**.
>
>**[!UICONTROL Publish Immediately]** means that the uploaded asset--after it is synched with IPS--is published automatically to the delivery system. While that is true for Dynamic Media, it is not true for YouTube. To publish to YouTube, you must publish by way of Experience Manager Author.

>[!NOTE]
>
>To publish content from YouTube, Experience Manager uses the **[!UICONTROL Publish to YouTube]** workflow, which lets you monitor progress and view any failure information.
>
>See [Monitor video encoding and YouTube publishing progress](#monitoring-video-encoding-and-youtube-publishing-progress).
>
>For more detailed progress information, you can monitor the YouTube log under replication. Be aware, however, that such monitoring requires administrator access.

**To publish videos to your YouTube channel:**

1. In Experience Manager, navigate to a video asset that you want to publish to your YouTube channel.
1. Select the video asset (the adaptive video set).
1. On the toolbar, click **[!UICONTROL Properties]**.
1. In the Basic tab, under the Metadata heading, click **[!UICONTROL Open Selection Dialog]** to the right of the Tags field.
1. On the Select Tags page, navigate to the tags you want to use, and then select one or more tags.

   Remember that the tags must be associated with the YouTube channel.

1. In the upper-right corner of the page, click **[!UICONTROL Select]**.
1. In the upper-right corner of the video's properties page, click **[!UICONTROL Save and Close]**.
1. On the toolbar, click **[!UICONTROL Quick Publish]**.

   See also [Using Publication Management with Experience Manager Sites](https://experienceleague.adobe.com/docs/experience-manager-learn/sites/page-authoring/publication-management-feature-video-use.html).

   You can optionally verify the published video on your YouTube channel.

### (Optional) Verify the published video on YouTube {#optional-verifying-the-published-video-on-youtube}

You can optionally monitor progress of your YouTube publishing (or unpublishing).

See [Monitor video encoding and YouTube publishing progress](#monitoring-video-encoding-and-youtube-publishing-progress).

Publishing times can vary greatly depending on numerous factors that include the format of your primary source video, file size, and upload traffic. The publishing process can take anywhere from a few minutes to several hours. Also, higher resolution formats are rendered much more slowly. For example, 720p and 1080p take longer to appear than 480p.

After eight hours if you still see a status message that says **[!UICONTROL Uploaded (processing, please wait)]**, try removing the video from Adobe's site and uploading it again.

### Link YouTube URLs to your web application {#linking-youtube-urls-to-your-web-application}

You can obtain a YouTube URL string that is generated by Dynamic Media after you publish the video. When you copy the YouTube URL, it lands on the Clipboard so you can paste it as necessary to pages in your website or application.

>[!NOTE]
>
>The YouTube URL is not available to copy until you have published the video asset to YouTube.

**To link YouTube URLs to your web application:**

1. Navigate to the *YouTube published* video asset whose URL you want to copy, then select it.

   Remember that YouTube URLs are only available to copy *after* you have first *published* the video assets to YouTube.

1. On the toolbar, click **[!UICONTROL Properties]**.
1. Click the **[!UICONTROL Advanced]** tab.
1. Under the YouTube Publishing heading, in the YouTube URL List, select, and copy the URL text to your web browser to preview the asset or to add to your web content page.

### Unpublish videos so you can remove them from YouTube {#unpublishing-videos-to-remove-them-from-youtube}

When you unpublish a video asset in Experience Manager, the video is removed from YouTube.

>[!CAUTION]
>
>If you remove a video directly from within YouTube, Experience Manager is unaware and continues to behave as if the video is still published to YouTube. Always unpublish a video asset from YouTube by way of Experience Manager.

>[!NOTE]
>
>To remove content from YouTube, Experience Manager uses the **[!UICONTROL Unpublish from YouTube]** workflow, which lets you monitor progress and view any failure information.
>
>See [Monitor video encoding and YouTube publishing progress](#monitoring-video-encoding-and-youtube-publishing-progress).

**To unpublish videos to remove them from YouTube:**

1. Navigate to the video assets that you want to unpublish from your YouTube channel.
1. In an asset selection mode, select one or more published video assets.
1. On the toolbar, click **[!UICONTROL Manage Publication]**. Tap the three dots icon (. . .) on the toolbar so **[!UICONTROL Manage Publication]** opens.
1. On the Manage Publication page, tap **[!UICONTROL Unpublish]**.
1. In the upper-right corner of the page, tap **[!UICONTROL Next]**.
1. In the upper-right corner of the page, tap **[!UICONTROL Unpublish]**.

## Monitor video encoding and YouTube publishing progress {#monitoring-video-encoding-and-youtube-publishing-progress}

When you upload a new video to a folder that has video encoding applied, or you publish your video to YouTube, you can monitor how your video encoding/Youtube publishing is progressing. Actual YouTube publishing progress is only available by way of the logs. However, its failure or success is listed in additional ways described in the following procedure. In addition, you receive email notifications when a YouTube publish workflow or video encoding completes or is interrupted.

### Monitor progress {#monitoring-progress}

1. View video encoding progress in your assets folder:

    * In card view, video encoding progress displays on the asset by percent. If there is an error, this information also displays on the asset.

   ![chlimage_1-429](assets/chlimage_1-429.png)

    * In list view, video encoding progress displays in the **[!UICONTROL Processing Status]** column. If there is an error, this message displays in that same column.

   ![chlimage_1-430](assets/chlimage_1-430.png)

   This column does not display by default. To enable the column, select **[!UICONTROL View Settings]** from the views drop-down menu, and add the **[!UICONTROL Processing Status]** column and tap or click **[!UICONTROL Update]**.

   ![chlimage_1-431](assets/chlimage_1-431.png)

1. View progress in the asset details. When you tap or click an asset, open the drop-down menu and select **[!UICONTROL Timeline]**. To narrow it down to workflow activities like encoding or YouTube publishing, select **[!UICONTROL Workflows]**.

   ![chlimage_1-432](assets/chlimage_1-432.png)

   Any workflow information &ndash; such as encoding &ndash; displays in the timeline. For YouTube publish, the Workflow timeline also includes the name of the YouTube channel and the YouTube video URL. In addition, you see any failure notifications in the Workflow timeline after the publish is complete.

   >[!NOTE]
   >
   >It can take a long time for failure/error messages to finally be recorded due to multiple workflow configurations on **[!UICONTROL retries]**, **[!UICONTROL retry delay]**, and **[!UICONTROL timeout]** from [https://localhost:4502/system/console/configMgr](https://localhost:4502/system/console/configMgr), for example:
   >
   >    * Apache Sling Job Queue Configuration
   >    * Adobe Granite Workflow External Process Job Handler
   >    * Granite Workflow Timeout Queue
   >
   >You can adjust the **[!UICONTROL retries]**, **[!UICONTROL retry delay]**, and **[!UICONTROL timeout]** properties in these configurations.

1. For workflows in progress, see Workflow Instances available from **[!UICONTROL Tools]** > **[!UICONTROL Workflow]** > **[!UICONTROL Instances]**.

   >[!NOTE]
   >
   >You need administrative rights to access the **[!UICONTROL Tools]** menu.

   ![chlimage_1-433](assets/chlimage_1-433.png)

   Select the instance and tap **[!UICONTROL Open History]**.

   ![chlimage_1-434](assets/chlimage_1-434.png)

   From the Workflow Instances area, you can also suspend, terminate, or rename workflows. See [Administering workflows](/help/sites-administering/workflows-administering.md) for more information.

1. For failed jobs, see Workflow Failures available from **[!UICONTROL Tools]** > **[!UICONTROL Workflow]** > **[!UICONTROL Failures]**. The **[!UICONTROL Workflow Failure]** lists all failed workflow activities.

   >[!NOTE]
   >
   >You need administrative rights to access the **[!UICONTROL Tools]** menu.

   ![chlimage_1-435](assets/chlimage_1-435.png)

   >[!NOTE]
   >
   >It can take a long time for the error message to finally be recorded due to multiple workflow configurations on **[!UICONTROL retries]**, **[!UICONTROL retry delay]**, and **[!UICONTROL timeout]** from [https://localhost:4502/system/console/configMgr](https://localhost:4502/system/console/configMgr), for example:
   >
   >
   >
   >    * Apache Sling Job Queue Configuration
   >    * Adobe Granite Workflow External Process Job Handler
   >    * Granite Workflow Timeout Queue
   >
   >
   >You can adjust the **[!UICONTROL retries]**, **[!UICONTROL retry delay]**, and **[!UICONTROL timeout]** properties in these configurations.

1. For completed workflows, see Workflow Archive available from **[!UICONTROL Tools]** > **[!UICONTROL Workflow]** > **[!UICONTROL Archive]**. The **[!UICONTROL Workflow Archive]** lists all completed workflow activities.

   >[!NOTE]
   >
   >You need administrative rights to access the **[!UICONTROL Tools]** menu.

   ![chlimage_1-436](assets/chlimage_1-436.png)

1. You receive email notifications about aborted or failed workflow jobs. These email notifications are configurable by an administrator. See [Configure email notifications](#configuring-e-mail-notifications).

#### Configure e-mail notifications {#configuring-e-mail-notifications}

>[!NOTE]
>
>You need administrative rights to access the **[!UICONTROL Tools]** menu.

How you configure notification depends on whether you want notifications for encoding jobs or YouTube publishing jobs:

* For encoding jobs, you can access the configuration page for all Experience Manager workflow email notifications at **[!UICONTROL Tools]** > **[!UICONTROL Operations]** > **[!UICONTROL Web Console]** and by searching for **[!UICONTROL Day CQ Workflow Email Notification Service]**. See [Configure email notification in Experience Manager](/help/sites-administering/notification.md). You can select or clear the check boxes for **[!UICONTROL Notify on Abort]** or **[!UICONTROL Notify on Complete]** accordingly.

* For YouTube publishing jobs, do the following:

1. In Experience Manager, tap **[!UICONTROL Tools]** > **[!UICONTROL Workflow]** > **[!UICONTROL Models]**.
1. On the Workflow Models page, select **[!UICONTROL Publish to YouTube]**, then tap **[!UICONTROL Edit]** on the toolbar.
1. Near the upper-right corner of the Publish to YouTube workflow page, tap **[!UICONTROL Edit]**.
1. Hover the mouse pointer on the YouTube Upload component, then tap once to display the inline toolbar.

   ![6_5_publishtoyoutubeworkflow](assets/6_5_publishtoyoutubeworkflow.png)

1. On the inline toolbar, tap the Configuration icon (wrench). Click the **[!UICONTROL Arguments]** tab.

   ![6_5_publishtoyoutubeworkflow-configurationicon](assets/6_5_publishtoyoutubeworkflow-configurationicon.png)

1. In the YouTube Upload Process - Step Properties dialog box, tap the **[!UICONTROL Arguments]** tab.

   ![6_5_publishtoyoutubeworkflow-arguments-tab](assets/6_5_publishtoyoutubeworkflow-arguments-tab.png)

1. You can select or clear the following check boxes:

    * Publish Start
    * Publish Failure
    * Publish Completion - includes information on channels and URLs

   Clearing a check box means that you do not receive the specified email notification from the YouTube Publish workflow.

   >[!NOTE]
   >
   >These emails are specific to YouTube and are in addition to the generic workflow email notifications. As a result, you can receive two sets of email notification - the generic notification available in the **[!UICONTROL Day CQ Workflow Email Notification Service]** and one specific to YouTube depending on your configuration settings.

1. When you are finished, near the upper-right corner of the dialog box, tap the **[!UICONTROL Done]** icon (check mark).
1. On the Publish to YouTube workflow page, near the upper-right corner, tap **[!UICONTROL Sync]**.

## View video reports {#viewing-video-reports}

>[!NOTE]
>
>Video reports are only available when you run Dynamic Media - Hybrid mode.

Video Reports display several aggregate metrics across a specified time to help you monitor that *published *individual and aggregate videos are performing as expected. The following top metrics data are aggregated for all published videos across your entire website:

* Video Starts
* Completion Rate
* Average time on video
* Total time on video
* Videos per visit

A table of all *published* videos is also listed so you can track the top viewed videos on your website based on total video starts.

When you tap a video name in the list, it shows you the video’s audience retention (drop-off) report in the form of a line chart. The chart displays the number of views for any given moment of time during video playback. When you play the video, the vertical bar tracks in synchronization with the time indicator in the player. Drops in the line chart data indicate where your audience drops off from disinterest.

If the video was encoded outside of Adobe Experience Manager Dynamic Media, the audience retention (drop-off) chart and the Play Percentage data in the table are not available.

See also [Configure Dynamic Media Cloud Services](/help/assets/config-dynamic.md).

>[!NOTE]
>
>Tracking and reporting data is based exclusively on the use of Dynamic Media’s own video player and associated video player preset. As such, you cannot track and report on videos that are played by way of other video players.

By default, the first time you enter Video Reports, the report displays video data starting at the first of the current month and ends with the current month's date. However, you can override the default date range by specifying your own date range. The next time you enter Video Reports, the date range you specified is used.

For video reports to work correctly, a Report Suite ID is automatically created when Dynamic Media Cloud Services is configured. At the same time, the Report Suite ID is pushed to the Publish server so that it is available for the Copy URL feature when you preview assets. However, this functionality requires that the Publish server is already set up. If the Publish server is not set up, you can still publish to see the video report. However, you must return to the Dynamic Media Cloud Configuration and tap **[!UICONTROL OK]**.

**To view video reports:**

1. In the upper-left corner of Experience Manager, tap the Experience Manager logo, then in the left rail, tap **[!UICONTROL Tools]** (hammer icon) > **[!UICONTROL Assets]** > **[!UICONTROL Video Reports]**.
1. On the Video Reports page, do one of the following:

    * Near the upper-right corner, tap the **Refresh Video Report** icon.
      Use Refresh only if the end date of the report is the current day. Doing so ensures that you see the video tracking that has occurred since the last time you ran the report.

    * Near the upper-right corner, tap the **Date Picker** icon.
      Specify the beginning and end date range for which you want video data, and then tap **[!UICONTROL Run Report]**.

   The Top Metrics group box identifies various aggregate measurements for all *published* videos across your site.

1. In the table that lists the top published videos, tap a video name to play the video and also see the video’s audience retention (drop-off) report.

### View video reports based on a video viewer that you created using the Dynamic Media HTML5 Viewer SDK {#viewing-video-reports-based-on-a-video-viewer-that-you-created-using-the-scene-hmtl-viewer-sdk}

If you use an out-of-box video viewer provided by Dynamic Media, or if you created a custom viewer preset based off an out-of-box video viewer, then no additional steps are required to view video reports. However, if you have created your own video viewer based off the HTML5 Viewer SDK API, then use the following steps to ensure that your video viewer is sending tracking events to Dynamic Media Video Reports.

Use the [Adobe Dynamic Media Viewers Reference Guide](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources.html) and the [HTML5 Viewer SDK API](https://s7d1.scene7.com/s7sdk/3.10/docs/jsdoc/index.html) to create your own video viewers.

**To view video reports based on a video viewer that you created using the Dynamic Media HTML5 Viewer SDK:**

1. Navigate to any published video asset.
1. Near the upper-left corner of the asset's page, from the drop-down list, select **[!UICONTROL Viewers]**.
1. Select any video viewer preset and copy the embed code.
1. In the embed code, find the line with the following:

   `videoViewer.setParam("config2", "<value>");`

   The `config2` parameter enables tracking in HTML5 Viewers. It is also a company-specific preset that contains the configuration information for Video Reporting, and for customer-specific Adobe Analytics configurations.

   The correct value for the config2 parameter is found in both the **[!UICONTROL Embed Code]** and in the copy **[!UICONTROL URL]** function. In the URL from the copy **[!UICONTROL URL]** command, the parameter to look for is `&config2=<value>` . The value is almost always `companypreset`, but in some instances it can also be `companypreset-1`, `companypreset-2`, and so forth.

1. In your custom video viewer code, add AppMeasurementBridge .jsp to the viewer page by doing the following:

    * First, determine if you need the `&preset` parameter. 

      If the `config2` parameter is `companypreset`, you do *not* need `&preset=parameter`.  

      If `config2` is anything else, set the preset parameter the same as the `config2` parameter. For example, if `config2=companypreset-2`, add `&param2=companypreset-2` to the AppMeasurmentBridge.jsp URL.
  
    * Then, add the AppMeasurementBridge.jsp script: 

      `<script language="javascript" type="text/javascript" src="https://s7d1.scene7.com/s7viewers/AppMeasurementBridge.jsp?company=robindallas&preset=companypreset-2"></script>`

1. Create the TrackingManager component by doing the following:

    * After you call `s7sdk.Util.init();`, create a TrackingManager instance to track events by adding the following: 

      `var trackingManager = new s7sdk.TrackingManager();`
  
    * Connect components to TrackingManager by doing the following:

      In the `s7sdk.Event.SDK_READY` event handler, attach the component you want to track to the TrackingManager.

      For example, if the component is `videoPlayer`, add

      `trackingManager.attach(videoPlayer);`

      to attach the component to the trackingManager. To track multiple viewers on a page, use multiple tracking manager components. 

    * Create the AppMeasurementBridge object by adding the following:

      ```
      var appMeasurementBridge = new AppMeasurementBridge(); appMeasurementBridge.setVideoPlayer(videoPlayer);
  
      ```

    * Add the tracking function by adding the following:

      ```
      trackingManager.setCallback(appMeasurementBridge.track, 
       appMeasurementBridge);
      ```

   The appMeasurementBridge object has a built-in track function. However, you can provide your own to support multiple tracking systems or other functionality.

<!--    For more information, see *Using the TrackingManager Component* in the *Scene7 HTML5 Viewer SDK User Guide* available for download from [Adobe Developer Connection](https://help.adobe.com/en_US/scene7/using/WSef8d5860223939e2-43dedf7012b792fc1d5-8000.html). -->

## Add captions or subtitles to video {#adding-captions-to-video}

You can extend the reach of your videos to global markets by adding captioning to single videos or to Adaptive Video Sets. By adding captioning you avoid the need to dub the audio, or the need to use native speakers to rerecord the audio for each different language. The video is played in the language that it was recorded. Foreign language subtitles appear so that people of different languages can still understand the audio portion.

Captioning also allows for greater accessibility by using closed captioning for people who are deaf or hard of hearing.

>[!NOTE]
>
>The video player that you use must support the display of captions.

Dynamic Media converts caption files to JSON (JavaScript Object Notation) format. This conversion means you can embed the JSON text into a web page as a hidden but complete transcript of the video. Search engines can then crawl and index the content to make the videos more easily discoverable and give customers additional details about the video content.

See [Serve static (non-image) contents](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/c-serving-static-nonimage-contents.html#image-serving-api) in the *Dynamic Media Image Serving and Rendering API Help* for more information about using the JSON function in a URL.

**To add captions or subtitles to video:**

1. Use a third-party application or service to create your video caption/subtitle file.

   Ensure that the file you create follows the WebVTT (Web Video Text Tracks) standard. The captioning filename extension is .vtt. You can learn more information about the WebVTT captioning standard.

   See [WebVTT: The Web Video Text Tracks format](https://w3c.github.io/webvtt/).

   There are both free and premium tools and services that you can use to author caption/subtitle files outside Dynamic Media. For example, to create a simple video caption file with no styling, you can use the following free online caption authoring and editing tool:

   [WebVTT Caption Maker](https://testdrive-archive.azurewebsites.net/Graphics/CaptionMaker/Default.html)

   For best results, use the tool in Internet Explorer 9 or above, Google Chrome, or Safari.

   In the tool, in the **[!UICONTROL Enter URL of video file]** field, paste the copied URL of your video file and then click **[!UICONTROL Load]**. See [Obtain a URL for an Asset](/help/assets/linking-urls-to-yourwebapplication.md#obtaining-a-url-for-an-asset) to get the URL to the video file itself which you can then paste into the **[!UICONTROL Enter URL of video file field]**. Internet Explorer, Chrome, or Safari can then natively play back the video.

   Now follow the onscreen instructions from the site to author and save your WebVTT file. When you have finished, copy the caption file contents and paste it into a plain text editor and save it with a `.vtt` filename extension.

   >[!NOTE]
   >
   >For global support of video subtitles in multiple languages, the WebVTT standard requires that you create separate .vtt files and calls for each language you want to support.

   Generally, you want to name the caption VTT file the same name as the video file, and append it with the language locale, such as -EN, -FR, or -DE. By doing so, it can help you with automating the generation of the video URLs using your existing web content management system.

1. In Experience Manager, upload your WebVTT caption file into DAM.
1. Navigate to the *published* video asset that you want to associate with the caption file that you uploaded.

   Remember that URLs are only available to copy *after* you have first *published* the assets.

   See [Publish assets](/help/assets/publishing-dynamicmedia-assets.md).

1. Do one of the following:

    * For a pop-up video viewer experience, tap **[!UICONTROL URL]**. In the URL dialog box, select and copy the URL to the Clipboard and then past the URL into a simple text editor. Append the copied URL of the video with the following syntax:

      `&caption=<server_path>/is/content/<path_to_caption.vtt_file,1>`

      Note the `,1` at the end of the caption path. Immediately following the `.vtt` filename extension in the path, you can optionally enable (turn on) or disable (turn off) the closed caption button on the video player bar by setting to `,1` or `,0`, respectively.

    * For an embedded video viewer experience, tap **[!UICONTROL Embed Code]**. In the Embed Code dialog box, select, and copy the embed code to the Clipboard and then paste the code into a simple text editor. Append the copied embed code with the following syntax:

      `videoViewer.setParam("caption","<path_to_caption.vtt_file,1>");`

      Note the `,1` at the end of the caption path. Immediately following the `.vtt` filename extension in the path, you can optionally enable (turn on) or disable (turn off) the closed caption button on the video player bar by setting to `,1` or `,0`, respectively.

## Add chapter markers to video {#adding-chapter-markers-to-video}

You can make your long form videos easier to watch and navigate by adding chapter markers to single videos or to Adaptive Video Sets. When a user plays the video, they can click the chapter markers on the video timeline (also known as the video scrubber) to easily navigate to their point of interest. Or, they can immediately jump to new content, demonstrations, and tutorials.

>[!NOTE]
>
>The video player that is used must support the use of chapter markers. Dynamic Media video players do support chapter markers but using third-party video players may not.

If desired, you can create and brand your own custom video viewer with chapters instead of using a video viewer preset. For instructions on creating your own HTML5 viewer with chapter navigation, in the Adobe HTML5 Viewer SDK API, reference the heading “Customizing Behavior Using Modifiers” under the classes `s7sdk.video.VideoPlayer` and `s7sdk.video.VideoScrubber`. See the [HTML5 Viewer SDK API](https://s7d1.scene7.com/s7sdk/3.10/docs/jsdoc/index.html) documentation.

<!-- If desired, you can create and brand your own custom video viewer with chapters instead of using a video viewer preset. For instructions on creating your own HTML5 viewer with chapter navigation, in the Adobe Scene7 Viewer SDK for HTML5 guide, reference the heading “Customizing Behavior Using Modifiers” under the classes `s7sdk.video.VideoPlayer` and `s7sdk.video.VideoScrubber`. The Adobe Scene7 Viewer SDK is available as a download from [Adobe Developer Connection](https://help.adobe.com/en_US/scene7/using/WSef8d5860223939e2-43dedf7012b792fc1d5-8000.html). -->

You create a chapter list for your video in much the same way that you create captions. That is, you create a WebVTT file. Note, however, that this file must be separate from any WebVTT caption file that you are also using; you cannot combine captions and chapters into one WebVTT file.

You can use the following sample as an example of the format you use to create a WebVTT file with chapter navigation:

### WebVTT file with video chapter navigation {#webvtt-file-with-video-chapter-navigation}

```xml
WEBVTT
Chapter 1
00:00.000 --> 01:04.364
The bicycle store behind it all.
Chapter 2
01:04.364 --> 02:00.944
Creative Cloud.
Chapter 3
02:00.944 --> 03:02.937
Ease of management for a working solution.
Chapter 4
03:02.937 --> 03:35.000
Cost-efficient access to rapidly evolving technology.
```

In the example above, `Chapter 1` is the cue identifier and is optional. The cue time of `00:00:000 --> 01:04:364` specifies the start time and end time of the chapter, in `00:00:000` format. That last three digits are milliseconds and can be left as `000`, if preferred. The chapter title of `The bicycle store behind it all` is the actual description of the chapter’s contents. The cue identifier, the starting cue time, and the chapter title all appear in a video player pop-up when a user hovers their mouse pointer over a visual cue point in the video’s timeline.

Because you are using an HTML5 video viewer, ensure that the chapter file you create follows the WebVTT (Web Video Text Tracks) standard. The chapter filename extension is `.vtt`. You can learn more information about the WebVTT captioning standard.

See [WebVTT: The Web Video Text Tracks format](https://w3c.github.io/webvtt/)

**To add video chapter navigation:**

1. Save the `.vtt` file in UTF8 encoding so you avoid problems with character rendition in the chapter title text.

   Generally, you want to name the chapter VTT file the same name as the video file, and append it with chapters. By doing so, it can help you with automating the generation of the video URLs using your existing web content management system.
1. In Experience Manager, upload your WebVTT chapter file.

   See [Uploading Assets](/help/assets/manage-assets.md#uploading-assets).

1. Do one of the following:

   <table>
     <tbody>
      <tr>
       <td>For a pop-up video viewer experience</td>
       <td>
       <ol>
       <li>Navigate to the <i>published </i>video asset that you want to associate with the chapter file that you uploaded. Remember that URLs are only available to copy <i>after</i> you have first <i>published</i> the assets. See <a href="/help/assets/publishing-dynamicmedia-assets.md">Publishing Assets.</a></li>
       <li>From the drop-down menu, then click or tap <strong>Viewers</strong>.</li>
       <li>In the left rail, tap or click the video viewer preset name. A preview of the video is opened in a separate page.</li>
       <li>In the left rail, at the bottom, click <strong>URL</strong>.</li>
       <li>In the URL dialog box, select and copy the URL to the Clipboard, then past the URL into a simple text editor.</li>
       <li>Append the copied URL of the video with the following syntax so you can associate it with the copied URL to your chapter file:<br /> <br /> <code>&navigation=<<i>full_copied_URL_path_to_chapter_file</i>.vtt></code><br /> </li>
       </ol> </td>
      </tr>
      <tr>
       <td>For an embedded video viewer experience<br /> </td>
       <td>
       <ol>
       <li>Navigate to the <i>published </i>video asset that you want to associate with the chapter file that you uploaded. Remember that URLs are only available to copy <i>after</i> you have first <i>published</i> the assets. See <a href="/help/assets/publishing-dynamicmedia-assets.md">Publishing Assets.</a></li>
       <li>From the drop-down menu, then click or tap <strong>Viewers</strong>.</li>
       <li>In the left rail, tap or click the video viewer preset name. A preview of the video is opened in a separate page.</li>
       <li>In the left rail, at the bottom, click <strong>Embed</strong>.</li>
       <li>In the Embed Code dialog box, select, and copy the entire code to the Clipboard, then paste it into a simple text editor.</li>
       <li>Append the embed code of the video with the following syntax so you can associate it with the copied URL to your chapter file:<br /> <br /> <code>videoViewer.setParam("navigation","&lt;<i>full_copied_URL_path_to_chapter_file</i>.vtt&gt;"</code></li>
       </ol> </td>
      </tr>
     </tbody>
   </table>

## About video thumbnails in Dynamic Media - Scene7 mode {#about-video-thumbnails-in-dynamic-media-scene-mode}

A video thumbnail is a reduced-size version of a video frame or an image asset representing the video to the customer. The thumbnail serves to encourage a customer to click on the video.

All videos in Experience Manager must have an associated thumbnail; you cannot delete a thumbnail without replacing it. By default, when you upload a video to Experience Manager, the first frame is used as the thumbnail. However, you can customize the thumbnail for branding purposes or visual search, for example. When you customize a video thumbnail, you can play the video and pause on the frame you want to use. Or, you can select an image asset that you have already uploaded and *published* in your digital asset manager.

A custom video thumbnail image that you select from a video is not extracted and saved in the DAM as a separate and distinct asset. However, a custom video thumbnail that you select from an existing image asset is saved to the JCR. The path of the selected asset gets stored under the video asset's node as in the following example path:

`/content/dam/*<folder_name*>/<*video_name*>/jcr:content/manualThumbnail`

The ability to customize a video thumbnail is only available after you have applied a video profile to the folder where the video is located.

See also [About video thumbnails in Dynamic Media - Hybrid mode](#about-video-thumbnails-in-dynamic-media-hybrid-mode).

### Add a custom video thumbnail {#adding-a-custom-video-thumbnail}

These steps apply only to Dynamic Media running in "Dynamicmedia_Scene7" mode.

**To add a custom video thumbnail:**

1. Be sure you have already done the following:

    * Created a folder for your video assets.
    * [Apply a video profile to the folder](/help/assets/video-profiles.md#applying-a-video-profile-to-folders).

    * [Uploaded your videos to the folder](/help/assets/managing-video-assets.md#upload-and-preview-video-assets).

1. Navigate to an uploaded video asset whose thumbnail image you want to change.
1. In asset selection mode either from **[!UICONTROL List View]** or **[!UICONTROL Card View]**, tap the video asset.
1. On the toolbar, tap the **[!UICONTROL Properties]** icon (a circle with an "i" in it).
1. On the video's Properties page, tap **[!UICONTROL Change Thumbnail]**.
1. On the Change Thumbnail page, do one of the following:

    * To use a frame from the video as the new thumbnail:

        * On the toolbar, tap **[!UICONTROL Select Frame from video]**.
        * Tap the Play button, then tap the Pause button on the frame you want to capture as the video's new thumbnail.

    * To use an image asset as the new thumbnail:

        * On the toolbar, tap **[!UICONTROL Select Thumbnail from Assets]**.
        * Tap **[!UICONTROL Select Thumbnail]**.
        * Navigate to a previously uploaded and published image asset you want to use. The asset is automatically resized to serve as a thumbnail image for the video.
        * Select the image asset, then tap **[!UICONTROL Select]**.

1. On the Change Thumbnail page, tap **[!UICONTROL Save Change]**.
1. On the video's Properties page, in the upper-right corner, tap **[!UICONTROL Save & Close]**.

## About video thumbnails in Dynamic Media - Hybrid mode {#about-video-thumbnails-in-dynamic-media-hybrid-mode}

You can choose from one of ten thumbnail images automatically generated by Dynamic Media to add to your video. The video player displays your selected thumbnail when a video asset is used with the Dynamic Media component in the authoring environment of Experience Manager Sites, Experience Manager Mobile, or Experience Manager Screens. The thumbnail serves as a static picture that best represents the contents of your entire video and further encourages users to click the Play button.

Based on the total time of the video, Dynamic Media captures ten (default) thumbnail images. The images are captured at 1%, 11%, 21%, 31%, 41%, 51%, 61%, 71%, 81%, and 91% into the video. The ten thumbnails persist meaning that if you decide to choose a different thumbnail later on, you do not need to regenerate the series. You preview the ten thumbnail images and then select the one you want to use with your video. If you want to change to the default, you can use CRXDE Lite to configure the time interval that thumbnail images are generated. For example, if you only wanted to generate a series of four evenly spaced thumbnail images from your video, you can configure the interval time at 24%, 49%, 74%, and 99%.

Ideally, you can add a video thumbnail anytime after you upload your video but before you publish the video on your website.

If you prefer, you can choose to upload a custom thumbnail to represent your video instead of using a thumbnail generated by Dynamic Media. For example, you could create a custom thumbnail image that has the title of your video, an eye-catching opening image, or a specific image captured from your video. The custom video thumbnail image that you upload must have a maximum resolution of 1280 x 720 pixels (minimum width of 640 pixels) and be no larger than 2 MB.

See also [About video thumbnails in Dynamic Media - Scene7 mode](/help/assets/video.md#about-video-thumbnails-in-dynamic-media-scene-mode).

### Add a video thumbnail {#adding-a-video-thumbnail}

These steps apply only to Dynamic Media running in Hybrid mode.

**To add a video thumbnail:**

1. Navigate to an uploaded video asset that you want to add a video thumbnail.
1. In asset selection mode either from the List View or the Card View, tap the video asset.
1. On the toolbar, tap the **[!UICONTROL View Properties]** icon (a circle with an "i" in it).
1. On the video's Properties page, tap **[!UICONTROL Change Thumbnail]**.
1. On the Change Thumbnail page, on the toolbar, tap **[!UICONTROL Select Frame]**.

   Dynamic Media generates a series of thumbnail images from your video, based on the default time interval or time interval you customized.

1. Preview the generated thumbnail images, then select the one you want to add to your video.
1. Tap **[!UICONTROL Save Change]**.

   The video's thumbnail image is updated to use the thumbnail you selected. If you later decide to change the thumbnail image, you can return to the **[!UICONTROL Change Thumbnail]** page and select a new one.

   If you configured new default time intervals, or you uploaded a new video to replace the existing video, have Dynamic Media regenerate the thumbnails.

   See [Configure the default time interval that video thumbnails are generated](#configuring-the-default-time-interval-that-video-thumbnails-are-generated).

#### Configure the default time interval that video thumbnails are generated {#configuring-the-default-time-interval-that-video-thumbnails-are-generated}

When you configure and save the new default time interval, your change automatically applies only to videos that you upload in the future. It does not automatically apply the new default to videos that you previously uploaded. For existing videos, you must regenerate the thumbnails.

See [Add a video thumbnail](#adding-a-video-thumbnail).

**To configure the default time interval that video thumbnails are generated:**

1. In Experience Manager, tap **[!UICONTROL Tools]** > **[!UICONTROL General]** > **[!UICONTROL CRXDE Lite]**.

1. In the CRXDE Lite page, in the directory panel on the left, navigate t `o etc/dam/imageserver/configuration/jcr:content/settings.`

   if the directory panel is not visible, tap the &gt;&gt; icon to the left of the Home tab.

1. On the lower-right panel, in the Properties tab, double-tap `thumbnailtime`.
1. In the **[!UICONTROL Edit thumbnailtime]** dialog box, use the text fields to enter interval values as percentages.

    * Tap the plus sign (+) icon if you want to add one or more interval value fields. If necessary, scroll to the bottom of the dialog box to see the icon.
    * Tap the minus sign (-) icon to the right of an interval value field if you want to delete it from the list.
    * Tap the up arrow icon and the down arrow icon if you want to reorder the interval values.

1. Tap **[!UICONTROL OK]** and return to the Properties tab.
1. Near the upper-left corner of the CRXDE Lite page, tap **[!UICONTROL Save All]**, then tap the Back Home icon in the upper-left corner to return to Experience Manager.

   See [Add a video thumbnail](#adding-a-video-thumbnail).

### Add a custom video thumbnail {#adding-a-custom-video-thumbnail-1}

These steps apply only to Dynamic Media running in Hybrid mode.

**To add a custom video thumbnail:**

1. Navigate to an uploaded video asset that you want to add a custom video thumbnail.
1. In asset selection mode either from the List View or the Card View, tap the video asset.
1. On the toolbar, tap the **[!UICONTROL View Properties]** icon (a circle with an "i" in it).
1. On the video's Properties page, tap **[!UICONTROL Change Thumbnail]**.
1. On the Change Thumbnail page, on the toolbar, tap **[!UICONTROL Upload New Thumbnail]**.
1. Navigate to a thumbnail image you want to use, select it, then tap **[!UICONTROL Open]** to begin uploading the image into Experience Manager. Following the upload, be sure you publish the image.
1. After you have successfully uploaded and published the image, in the Change Thumbnail page, tap **[!UICONTROL Save Changes]**.

   The custom thumbnail is added to your video.

---
title: Video Profiles
seo-title: Video Profiles
description: Dynamic Media already comes with a predefined Adaptive Video Encoding profile. The settings in this out-of-the-box profile are optimized to give your customers the best viewing experience possible. 
seo-description: Dynamic Media already comes with a predefined Adaptive Video Encoding profile. The settings in this out-of-the-box profile are optimized to give your customers the best viewing experience possible. 
uuid: b3499623-29f3-4921-86d2-628ae16e9e13
contentOwner: Chiradeep Majumdar
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: administering
content-type: reference
discoiquuid: 5b5863cd-352b-4da3-997e-39f41064b2bb
index: y
internal: n
snippet: y
---

# Video Profiles{#video-profiles}

<!--
Comment Type: remark
Last Modified By: unknown unknown (ims-author-77F410094CD97C4F0A746C1B@AdobeID)
Last Modified Date: 2017-11-30T05:30:56.526-0500
<p>Page inheritance canceled. In 6.3, ? = information icon, and Folder Settings = Properties, and there is no Processing Profile column in list view. No processing profile mentioned at all.</p>
-->

Dynamic Media already comes with a predefined Adaptive Video Encoding profile. The settings in this out-of-the-box profile are optimized to give your customers the best viewing experience possible. When you encode your master videos using the Adaptive Video Encoding profile, during playback the video player automatically adjusts the quality of the video stream based on the Internet connection speed of your customers. This is known as adaptive streaming.

The following are other factors that determine the quality of your videos:

* **Resolution of the uploaded master video  
  **If the MP4 video was recorded at a lower resolution, such as 240p or 360p, it cannot be streamed in high definition.
* **Video player size  
  **By default, the "Width" in the Adaptive Video Encoding profile is set to “Auto.” Again, during playback, the best quaility is used based on the size of the player.

See also [Best Practices for Video Encoding](../../../6-5/assets/using/video.md#best-practices-for-encoding-videos).

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2018-10-16T13:54:01.475-0400
Maybe it should be mentioned somewhere that the out of the box video profile has been adjusted in 6.4 to work better with the newer viewers Customers may need to reprocess videos RB: Didn't mentioned. The paragraph already mentions that the profile is always optimized (regardless of version). Tying the profile to a specific AEM version and then having to tell users that they need to reprocess their videos is too messy.
-->

>[!NOTE]
>
>To generate a video's metadata and associated video image thumbnails, the video itself needs to go through the encoding process in Dynamic Media. In AEM, the **Dynamic Media Encode Video** workflow encodes video if you have enabled dynamic media and set up video cloud services. This workflow captures workflow process history and failure information. See [Monitoring video encoding and YouTube publishing progress](../../../6-5/assets/using/video.md#monitoring-video-encoding-and-youtube-publishing-progress). If you have enabled dynamic media and set up video cloud services, the **Dynamic Media Encode Video** workflow automatically takes effect when you upload a video. (If you are not using dynamic media, the **DAM Update Asset** workflow takes effect.)
>
>Metadata is useful when you are searching for assets. The thumbnails are static video images that are generated during encoding. They are required by the AEM system and used in the user interface to help you visually identify videos in the Cards view, Search Results view, and the Asset List view. You can see the generated thumbnails when you tap the Renditions icon (a painter's palette) of an encoded video.

When you are done creating the video profile, you apply it to a folder or mutliple folders. See [Applying a video profile to folders.](#applying-a-video-profile-to-folders)

To define advanced processing parameters for other asset types, see [Configuring Asset Processing](../../../6-5/assets/using/config-dms7.md#configuring-asset-processing).

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2018-10-16T13:56:43.252-0400
RB: Fixed. This link goes to the top of the page. It needs to be adjusted
-->

## Adaptive Video Encoding Presets {#adaptive-video-encoding-presets}

The following table identifies best practice encoding profiles for adaptive video streaming to mobile and tablet devices, and desktop computers. You can use these presets for any aspect ratio video.

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <td><strong>Video Format Codec</strong></td> 
   <td><strong>Video Size- Width (px)</strong></td> 
   <td><strong>Video Size- Height (px)</strong></td> 
   <td><strong>Keep Aspect Ratio?</strong></td> 
   <td><strong>Video Bitrate (Kbps)</strong></td> 
   <td><strong>Video Frame Rate (Fps)</strong></td> 
   <td><strong>Audio Codec</strong></td> 
   <td><strong>Audio Bitrate (Kbps)</strong></td> 
  </tr> 
  <tr> 
   <td><p>MP4 H.264 (mp4)</p> </td> 
   <td>auto</td> 
   <td>360</td> 
   <td>Yes</td> 
   <td>730</td> 
   <td>30</td> 
   <td>Dolby HE-AAC</td> 
   <td>128</td> 
  </tr> 
  <tr> 
   <td><p>MP4 H.264 (mp4)</p> </td> 
   <td>auto</td> 
   <td>540</td> 
   <td>Yes</td> 
   <td>2000<br /> </td> 
   <td>30</td> 
   <td>Dolby HE-AAC</td> 
   <td>128</td> 
  </tr> 
  <tr> 
   <td><p>MP4 H.264 (mp4)</p> </td> 
   <td>auto</td> 
   <td>720<br /> </td> 
   <td>Yes</td> 
   <td>3000<br /> </td> 
   <td>30</td> 
   <td>Dolby HE-AAC</td> 
   <td>128</td> 
  </tr> 
 </tbody> 
</table>

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2018-10-16T15:58:08.087-0400
RB: FIXED. This table is based on the old out of the bot video profile. It should be updated for the newer out of the box video profile.
-->

## Creating a video encoding profile for adaptive streaming {#creating-a-video-encoding-profile-for-adaptive-streaming}

Dynamic Media already comes with a predefined Adaptive Video Encoding profile-a group of video upload settings for MP4 H.264-that is optimized for the best viewing experience. You can use this profile when you upload your videos.

However, if this predefined profile does not meet your needs, you can choose to create your own adaptive video encoding profile. When you use the setting **Encode for adaptive streaming**-a best practice-all encoding presets that you add to the profile are validated to ensure that all videos have the same aspect ratio. In addition, the encoded videos are treated as a multi-bitrate set for streaming.

When you create the video encoding profile, you will notice that most encoding options are pre-populated with recommended default settings to help you. However, if you select a value other than the recommended default, be aware that it may result in poor video quality during playback and other performance issues.

So, for all MP4 H.264 video encoding presets in the profile, the following values are validated to ensure that they are the same across individual encoding presets in the profile, thereby making adaptive streaming possible:

* Video Format Codec - MP4 H.264 (.mp4)
* Audio Codec
* Audio Bitrate
* Keep Aspect Ratio
* Two Pass Encoding
* Constant Bitrate
* H264 Profile
* Audio Sampling Rate

If the values are not the same, you can continue creating the profile as is. However, be aware that adaptive streaming will not be possible. Instead, users will experience single-bitrate streaming. It is recommended that you edit the encoding settings to use the same values across individual encoding presets in the profile. (Note that the video profile/preset editor should enforce parity of the adaptive video encoding settings if "Encode for adaptive streaming" is enabled.)

See also [Creating a video encoding profile for progressive streaming](#creating-a-video-encoding-profile-for-progressive-streaming).

See also [Best Practices for Video Encoding](../../../6-5/assets/using/video.md#best-practices-for-encoding-videos).

To define advanced processing parameters for other asset types, see [Configuring Asset Processing](../../../6-5/assets/using/config-dms7.md#configuring-asset-processing).

When you are done creating the video profile, you apply it to a folder or multiple folders.

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2018-10-16T13:59:06.061-0400
RB: FIXED. should this be a single dash, en dash, or em dash?
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2018-10-16T13:59:20.759-0400
RB: FIXED. should this be a single dash, en dash, or em dash?
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2018-10-16T13:59:34.890-0400
RB: FIXED. should this be a single dash, en dash, or em dash?
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2018-10-16T13:59:46.436-0400
RB: FIXED. should this be a single dash, en dash, or em dash?
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2018-10-16T14:00:16.980-0400
RB: FIXED. remove "is"
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2018-10-16T14:05:54.970-0400
RB: FIXED. The video profile/preset editor should enforce the adaptive video encoding settings parity as long as the Encode for adaptive streaming is enabled.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2018-10-16T15:35:04.875-0400
RB: FIXED. this link goes to the top of the page
-->

**To create a video encoding profile for adaptive streaming**:

1. Tap or click the AEM logo and navigate to **Tools **&gt; **Assets **&gt; **Video Profiles.**
1. Click or tap **Create** to add a new video profile.  

1. Enter a name and description for the profile.
1. Tap **Add Video Encoding Preset**.
1. On the **Basic** tab, set the video and audio options.  
   Tap the information icon next to each option for additional descriptions or recommended settings based on the selected video format codec.
1. Under the Video Size heading, ensure that **Keep aspect ratio** is checked****.
1. Set the video frame size resolution in pixels. Use the **Auto** value to automatically scale to match the source aspect ratio (width to height ratio). For example, Auto x 480 or 640 x Auto.

   Do one of the following:

    * In the **Width** field, enter **auto**. In the **Height** field, enter a value in pixels.
    
    * To help you visualize the size of the video, tap the Information icon (i) to the right of **Height** to open the Size Calculator page. Use **Size Calculator** to set the video dimensions (represented by the blue box) you want. Tap **X** in the upper-right corner when you are done.

   <!--
   Comment Type: annotation
   Last Modified By: rbrough
   Last Modified Date: 2018-10-16T15:08:06.702-0400
   RB: FIXED. The Size Calculator is more about visualizing the size of the video
   -->

1. (Optional) Tap the **Advanced** tab and ensure the **Use Default Values** check box is selected (recommended). Alternatively, modify advanced video and audio settings.
1. In the upper-right corner of the page, tap **Save** to save the preset.
1. Do one of the following:

    * Repeat steps 4-9 to create additional encoding presets. (Adaptive video streaming requires more than one video preset.)  
    * In the upper-right corner of the page, tap **Save** again to save the profile.

   <!--
   Comment Type: annotation
   Last Modified By: rbrough
   Last Modified Date: 2018-10-16T15:19:13.597-0400
   RB: FIXED. Maybe note that adaptive streaming needs more than one video preset
   -->

## Monitoring the Progress of an encoding job {#monitoring-the-progress-of-an-encoding-job}

A processing indicator (or progress bar) is displayed so you can visually monitor the progress of a video encoding job.

You can also view the `error.log` file to monitor the progress of an encoding job, to see if encoding is finished, or to see any job errors. The `error.log` is found in the `logs` folder where your instance of AEM is installed.

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2018-10-16T16:31:22.239-0400
RB: FIXED. Since AEM 6.3, a processing indicator (or progress bar) has been added. You can see a percentage display of how much encoding of a video has done. Of course, examining the error.log still works, but most people do not have access to that file.
-->

## Creating a video encoding profile for progressive streaming {#creating-a-video-encoding-profile-for-progressive-streaming}

If you choose not to use the option **Encode for adaptive streaming**, be aware that all encoding presets that you add to the profile are treated as individual video renditions for single-bitrate streaming or progressive video delivery. Also, there is no validation to ensure that all the video renditions have the same aspect ratio.

Depending on which mode you are running, the supported video format codecs are the following:

* Dynamic Media-Scene7 mode: H.264 (.mp4)
* Dynamic Media-Hybrid mode: H.264 (.mp4), WebM

See also [Creating a video encoding profile for adaptive streaming](#creating-a-video-encoding-profile-for-adaptive-streaming).

See also [Best Practices for Video Encoding](../../../6-5/assets/using/video.md#best-practices-for-encoding-videos).

To define advanced processing parameters for other asset types, see [Configuring Asset Processing](../../../6-5/assets/using/config-dms7.md#configuring-asset-processing).

When you are done creating the video profile, you apply it to a folder or multiple folders.

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2018-10-16T16:46:40.033-0400
RB: FIXED. DMS7 only allows MP4 DM Hybrid allows MP4 or WebM
-->

**To create a video encoding profile for progressive streaming:**

1. Tap the AEM logo and navigate to **Tools **&gt; **Assets **&gt; **Video Profiles.**
1. Tap **Create** to add a new video profile.
1. Enter a name and description for the profile.
1. Tap **Add Video Encoding Preset**.
1. On the **Basic** tab, set the video and audio options.  
   Tap the information icon next to each option for additional descriptions or recommended settings based on the selected video format codec.
1. (Optional) Under the Video Size heading, uncheck **Keep aspect ratio**.
1. In the **Width** field, enter **auto**; to the right of the **Height** field, tap the information icon. Use the **Size Calculator** page to further set the video dimension (blue box) how you want. Tap **X** when you are done.
1. (Optional) Do one of the following:

    * Tap the **Advanced** tab, and make sure the **Use Default Values** check box is selected (recommended).
    
    * Clear the **Use Default Values** check box and specify the video settings and audio settings you want.  
      Tap the information icon next to each option for additional descriptions or recommended settings based on the selected video format codec.

1. In the upper-right corner of the page, tap **Save** to save the preset.
1. Do one of the following:

    * Repeat steps 4-9 to create additional encoding presets.
    * In the upper-right corner of the page, tap **Save** to save the profile.

## Using custom-added video encoding parameters {#using-custom-added-video-encoding-parameters}

You can edit an existing video encoding profile to take advantage of advanced video encoding parameters that are not found in the user interface when you create or edit a Video Profile in AEM. You custom add one or more advanced parameters--such as minBitrate and maxBitrate--to your existing profile.

<!--
Comment Type: annotation
Last Modified By: wyamashi
Last Modified Date: 2018-08-17T14:11:24.626-0400
I am not familiar with adding custom parameters
-->

**To use custom-added video encoding parameters**:

1. Tap the AEM logo, then navigate to **Tools **&gt; **General** &gt; **CRXDE Lite**.
1. From the CRXDE Lite page, in the Explorer panel on the left, navigate to the following:

   `/conf/global/settings/dam/dm/presets/video/*name_of_video_encoding_profile_to_edit*`

   <!--
   Comment Type: annotation
   Last Modified By: rbrough
   Last Modified Date: 2018-10-16T16:52:06.015-0400
   RB: FIXED. This location should be updated for 6.4 zero downtime /conf/global/settings/dam/dm/presets/video/name_of_video_encoding_profile_to_edit
   -->

1. In the panel on the lower-right side of the page, from the Properties tab, specify the **Name**, **Type**, and **Value** of the parameter you want to use.

   The following advanced parameters are available to use:

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <td><strong>Name</strong></td> 
   <td><strong>Description</strong><br /> </td> 
   <td><strong>Type</strong><br /> </td> 
   <td><strong>Value</strong></td> 
  </tr> 
  <tr> 
   <td><span class="code">h264Level</span></td> 
   <td>H.264 level to use for encoding. Normally this is automatically determined based on the encoding settings you are using.</td> 
   <td><span class="code">String</span></td> 
   <td><p>10 * h264 level</p> <p>For example, 3.0 = 30, 1.3 = 13)</p> <p>No default value.</p> </td> 
  </tr> 
  <tr> 
   <td><span class="code">keyframe</span></td> 
   <td>The target number of frames between keyframes. Calculate this value to generate a keyframe every 2-10 seconds. For example, at 30 frames per second, the keyframe interval should be 60-300.<br /> <br /> Lower keyframe intervals improve stream seeking and stream switching behavior for adaptive video encodings and may also improve the quality for videos that have lot of motion. However, because keyframes increase a file's size, a lower keyframe interval usually results in lower overall video quality at a given bitrate.</td> 
   <td><span class="code">String</span></td> 
   <td><p>Positive number.</p> <p>Default is 300.</p> <p>Recommended value for HLS (HTTP Live Streaming) is 60-90.</p> </td> 
  </tr> 
  <tr> 
   <td><span class="code">minBitrate</span></td> 
   <td><p>Minimum bitrate to allow for variable bitrate encodings, in Kbps (kilobits per second).</p> <p>This parameter only applies when<strong> Use Constant Bitrate</strong> is deselected in the Advanced tab when you create or edit a video encoding profile.</p> <p>See also <a href="../../../6-5/assets/using/video.md#bitrate">Bitrate</a>.</p> </td> 
   <td><span class="code">String</span></td> 
   <td><p>Positive number, in Kbps.</p> <p>No default value.</p> </td> 
  </tr> 
  <tr> 
   <td><span class="code">maxBitrate</span></td> 
   <td><p>Maximum bitrate to allow for variable bitrate encodings, in Kbps.</p> <p>This parameter only applies when<strong> Use Constant Bitrate</strong> is deselected in the Advanced tab when you create or edit a video encoding profile.</p> <p>See also <a href="../../../6-5/assets/using/video.md#bitrate">Bitrate</a>.</p> </td> 
   <td><span class="code">String</span></td> 
   <td><p>Positive number, in Kbps.</p> <p>No default value. However, the recommended value is up to two times of the encoding bitrate.</p> </td> 
  </tr> 
  <tr> 
   <td><span class="code">audioBitrateCustom</span></td> 
   <td>Set value to <span class="code">true</span> to force a constant bitrate for the audio stream, if supported by audio codec.</td> 
   <td><span class="code">String</span></td> 
   <td><p><span class="code">true</span>/<span class="code">false</span></p> <p>Default is <span class="code">false</span>.</p> <p>Recommended value for HLS (HTTP Live Streaming) is <span class="code">false</span>.</p> <p> </p> </td> 
  </tr> 
 </tbody> 
</table>

   ![](assets/chlimage_1-104.png)

1. Near the lower-right corner of the page, tap **Add**.
1. Do one of the following:

    * Repeat steps 3 and 4 to add another parameter to your video encoding profile.
    * Near the upper-left corner of the page, tap **Save All**.

1. In the upper-left corner of the CRXDE Lite page, tap the **Back Home** icon to return to AEM.

### Editing a video encoding profile {#editing-a-video-encoding-profile}

You can edit any video encoding profile that you have created to add, edit, or delete video presets within that profile.

By default, you cannot edit the predefined, out-of-the-box **Adaptive Video Encoding** profile that came with Dynamic Media. Instead, you can easily copy the profile and save it with a new name. You can then edit the desired presets in the copied profile.

See also [Best Practices for Video Encoding](../../../6-5/assets/using/video.md#best-practices-for-encoding-videos).

To define advanced processing parameters for other asset types, see [Configuring Asset Processing](../../../6-5/assets/using/config-dms7.md#configuring-asset-processing).

**To edit a video encoding profile**:

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2018-10-16T16:57:30.652-0400
RB: FIXED. While it is possible to edit the default video profile via CRX/DE, it is no longer possible to do so via the UI
-->

1. Tap the AEM logo and navigate to **Tools **&gt; **Assets **&gt; **Video Profiles.**
1. On the Video Profiles page, check one video profile name.
1. On the toolbar, tap **Edit**.
1. On the Video Encoding Profile page, edit the name and description, as desired.
1. As a best practice, ensure that the **Encode for adaptive streaming** check box is selected.   
   Tap the information icon for a description of adaptive streaming. (If you are editing a progressive video profile, do not select this check box.)

   <!--
   Comment Type: annotation
   Last Modified By: rbrough
   Last Modified Date: 2019-01-15T16:27:37.128-0500
   While this is true for an adaptive video set, if the user is editing a progressive video profile, s/he would not want to enable this check box RB: Fixed
   -->

1. Under the Video Encoding Presets heading, add, edit, or delete video encoding presets that make up the profile.

   Tap the information icon next to each option on the **Basic** and **Advanced** tabs for additional descriptions or recommended settings based on the selected video format codec.

1. In the upper-right corner of the the page, tap **Save**.

### Copying a video encoding profile {#copying-a-video-encoding-profile}

1. Tap the AEM logo and navigate to **Tools **&gt; **Assets **&gt; **Video Profiles.**
1. On the Video Profiles page, check one video profile name.

   <!--
   Comment Type: annotation
   Last Modified By: wyamashi
   Last Modified Date: 2018-08-17T14:27:43.138-0400
   A dialog pops up where you rename the copy
   -->

1. On the toolbar, tap **Copy**.
1. On the Video Encoding Profile page, enter a new name for the profile.
1. As a best practice, ensure that the **Encode for adaptive streaming** check box is selected. Tap the information icon for a description of adaptive streaming. (If you are copying a progressive video profile, do not select the check box.)  
  
   In Dynamic Media - Hybrid mode, if a WebM video preset is part of the video profile, then **Encode for adaptive streaming** is not possible because all presets must be MP4.

   <!--
   Comment Type: annotation
   Last Modified By: wyamashi
   Last Modified Date: 2018-08-17T14:29:59.260-0400
   If the user is copying a progressive video profile, s/he may not want to enable this check box. Also, on DM Hybrid, if a WebM video preset is part of the profile, then Encode for adaptive streaming is not possible, since all presets have to be MP4
   -->

1. Under the Video Encoding Presets heading, add, edit, or delete video encoding presets that make up the profile.

   Tap the information icon next to each option on the Basic and Advanced tabs for recommended settings and descriptions.

1. In the upper-right corner of the the page, tap **Save**.

### Deleting a video encoding profile {#deleting-a-video-encoding-profile}

1. Tap the AEM logo and navigate to **Tools **&gt; **Assets **&gt; **Video Profiles.**
1. On the Video Profiles page, check one or more video profile names.
1. On the toolbar, tap **Delete**.
1. Tap **OK**.

## Applying a video profile to folders {#applying-a-video-profile-to-folders}

When you assign a video profile to a folder, any subfolders automatically inherit the profile from its parent folder. This means that you can assign only one video profile to a folder. As such, consider carefully the folder structure of where you upload, store, use, and archive assets.

If you assigned a different video profile to a folder, the new profile overrides the previous profile. The previously existing folder assets remain unchanged. The new profile is applied on the assets that are added to the folder later.

Folders that have a profile assigned to it are indicated in the user interface by the name of the profile appearing in the card name.

![](assets/chlimage_1-105.png)

You can apply video profiles to specific folders or globally to all assets.

<!--
Comment Type: annotation
Last Modified By: wyamashi
Last Modified Date: 2018-08-17T14:33:58.977-0400
For the most part, the screen shot is accurate, but it is a bit dated
-->

### Applying video profiles to specific folders {#applying-video-profiles-to-specific-folders}

You can apply a video profile to a folder from within the **Tools** menu or if you are in the folder, from the **Properties**. This section describes how to apply video profiles to folders both ways.

Folders that have a profile already assigned to it are indicated by the display of the profile's name directly below the folder name.

#### Applying video profiles to folders by way of the Profiles user interface {#applying-video-profiles-to-folders-by-way-of-the-profiles-user-interface}

1. Tap the AEM logo and navigate to **Tools **&gt; **Assets **&gt; **Video Profiles.**
1. Select the video profile that you want to apply to a folder or multiple folders.
1. Tap/click **Apply Profile to Folder(s) **and select the folder or multiple folders you want use to receive the newly uploaded assets and tap** Apply**. Folders that have a profile already assigned to it are indicated by the display of the profile's name directly below the folder name.

   <!--
   Comment Type: annotation
   Last Modified By: wyamashi
   Last Modified Date: 2018-08-17T14:47:38.583-0400
   Change "Done" to "Apply"
   -->

#### Applying video profiles to folders from Properties {#applying-video-profiles-to-folders-from-properties}

1. Tap or click the AEM logo and navigate to **Assets **and then to the folder that you want to apply a video profile to.

   <!--
   Comment Type: annotation
   Last Modified By: wyamashi
   Last Modified Date: 2018-08-17T14:53:17.570-0400
   Change "Folder Settings" to "Properties"
   -->

1. On the folder, tap the check mark to select it and then tap **Properties**.
1. Select the **Video Profiles** tab and select the profile from the drop-down menu and click **Save & Close**. Folders that have a profile already assigned to it are indicated by the display of the profile's name directly below the folder name.

   <!--
   Comment Type: annotation
   Last Modified By: wyamashi
   Last Modified Date: 2018-08-17T14:54:23.311-0400
   Newer UI is "Save & Close"
   -->

   <!--
   Comment Type: annotation
   Last Modified By: wyamashi
   Last Modified Date: 2018-08-17T14:56:15.139-0400
   You won't be able to see this while in Properties
   -->

   ![](assets/chlimage_1-106.png)

### Applying a video profile globally {#applying-a-video-profile-globally}

In addition to applying a profile to a folder, you can also apply one globally so that any content uploaded into AEM assets in any folder has the selected profile applied.

To apply a video profile globally,

* Navigate to CRXDE Lite to the following node: **/content/dam/jcr:content. **Add the property** videoProfile:/libs/settings/dam/video/dynamicmedia/&lt;name of video encoding profile&gt; **and tap or click **Save All**.

  <!--
  Comment Type: annotation
  Last Modified By: wyamashi
  Last Modified Date: 2018-08-17T15:01:06.726-0400
  This bullet point should be broken down into individual steps to be more clear The location of video profiles has moved with zero downtime: /conf/global/settings/dam/dm/presets/video/
  <name encoding="" of="" profile="" video="" />
  -->

  ![](assets/chlimage_1-107.png)

## Removing a video profile from folders {#removing-a-video-profile-from-folders}

When you remove a video profile from a folder, any subfolders automatically inherit the removal of the profile from its parent folder. However, any processing of files that has occurred within the folders remains intact.

You can remove a video profile from a folder from within the **Tools** menu or if you are in the folder, from the **Folder Settings**. This section describes how to remove video profiles from folders both ways.

#### Removing video profiles from folders by way of the Profiles user interface {#removing-video-profiles-from-folders-by-way-of-the-profiles-user-interface}

1. Tap the AEM logo and navigate to **Tools **&gt; **Assets **&gt; **Video Profiles.**
1. Select the video profile that you want to remove from a folder or multiple folders.
1. Tap **Remove Profile from Folder(s) **and select the folder or multiple folders you want use to remove the profile from and tap **Remove**.

   You can confirm that the video profile is no longer applied to a folder because the name no longer appears below the folder name.

   <!--
   Comment Type: annotation
   Last Modified By: wyamashi
   Last Modified Date: 2018-08-17T15:06:04.303-0400
   Change "Done" to "Remove"
   -->

#### Removing video profiles from folders by way of Properties {#removing-video-profiles-from-folders-by-way-of-properties}

1. Tap or click the AEM logo and navigate to **Assets **and then to the folder that you want to remove a video profile from.
1. On the folder, tap or click the check mark to select it and then tap or click **Properties**.
1. Select the **Video Profiles** tab and select **None** from the drop-down menu and click **Save & Close**. Folders that have a profile already assigned to it are indicated by the display of the profile's name directly below the folder name.

   <!--
   Comment Type: annotation
   Last Modified By: wyamashi
   Last Modified Date: 2018-08-17T15:07:39.656-0400
   Now it's "Save & Close"
   -->

   <!--
   Comment Type: annotation
   Last Modified By: wyamashi
   Last Modified Date: 2018-08-17T15:07:59.514-0400
   You won't be able to see this while in Properties
   -->


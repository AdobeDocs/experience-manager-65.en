---
title: Video Renditions
seo-title: Video Renditions
description: Follow this page to learn about generating full HD renditions for your Screens project.
seo-description: Follow this page to learn about generating full HD renditions for your Screens project.
uuid: 0a3b009e-8a97-4396-ad47-97077fe26cde
contentOwner: jsyal
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/SCREENS
topic-tags: authoring
discoiquuid: 40a182fd-7772-4ef7-b4fd-29ef99390b4a
---

# Video Renditions{#video-renditions}

You can generate manual and automatic Full HD renditions. The following section describes the workflow to add renditions to your assets.

## Automatically Generating Full HD Renditions  {#automatically-generating-full-hd-renditions}

>[!NOTE]
>
>In case the AEM Screens video renditions do not play optimally on your device, contact the hardware vendor for the specifications of the video. This will help to get the best performance on the device and hence create your own custom video profile where you provide the appropriate parameters for FFMPEG to generate your rendition. Subsequently, use the steps below to add your custom video profile to the list of profiles.
>
>Additionally, see [Troubleshooting Videos](/help/screens/troubleshoot-videos.md) to debug and troubleshoot video playing in your channel.

Follow the steps below to automatically generate full HD renditions:

1. Select the Adobe Experience Manager link (top left) and click the hammer icon to select tools to selct **Workflow**.

   Click **Models** to enter the workflow models management.

   ![screen_shot_2018-02-01at123407pm](assets/screen_shot_2018-02-01at123407pm.png)

1. Select the **DAM Update Asset **model and click Edit from the action bar to open the **DAM Update Asset **window.

   ![step5_-_edit_thedamupdateassetmodel](assets/step5_-_edit_thedamupdateassetmodel.png)

1. Double-click the **FFmpeg transcoding** step.

   ![screen_shot_2018-02-01at124454pm](assets/screen_shot_2018-02-01at124454pm.png)

1. Select the **Process** tab to edit the process arguments. Enter the full HD profiles to the list in **Arguments** as: ***,profile:fullhd-bp,profile:fullhd-hp*** and click **OK**.

   ![screen_shot_2018-02-02at103340am](assets/screen_shot_2018-02-02at103340am.png)

1. Click **Save **on the top left of the **DAM Update Asset **screen.

   ![screen_shot_2018-02-02at101830am](assets/screen_shot_2018-02-02at101830am.png)

1. Navigate to **Assets** and upload a new video. Click the video and open the Renditions side rail and you will notice the two full HD videos.

   ![step10_-_open_thevideoasset](assets/step10_-_open_thevideoasset.png)

1. Open **Renditions** from the side rail.

   ![step11_-_open_therenditionssiderail](assets/step11_-_open_therenditionssiderail.png)

1. You will notice two new full HD renditions.

   ![step12_-_2_new_renditionsareaddedtothevideo](assets/step12_-_2_new_renditionsareaddedtothevideo.png)

## Manually Generating Full HD Renditions {#manually-generating-full-hd-renditions}

Follow the steps below to manually generate full HD renditions:

1. Select the Adobe Experience Manager link (top left) and click the hammer icon to select tools to selct **Workflow**.

   Click **Models** to enter the workflow models management.

   ![screen_shot_2018-02-01at123407pm-1](assets/screen_shot_2018-02-01at123407pm-1.png)

1. Select the **Screens Update Asset **model, and click the **Start Workflow** to open the **Run Workflow** dialog box.

   ![step5_-_start_a_newscreensupdateassetworkflow](assets/step5_-_start_a_newscreensupdateassetworkflow.png)

1. Select the desired video in the **Payload** and click the **Run**.

   ![step6_-_select_thedesiredvideo](assets/step6_-_select_thedesiredvideo.png)

1. Navigate to **Assets**, drill down to your asset, and click it.

   ![step7_-_open_thevideoasset](assets/step7_-_open_thevideoasset.png)

1. Open the **Renditions** side rail and you will notice the new full HD renditions.

   ![step8_-_open_therenditionssiderail](assets/step8_-_open_therenditionssiderail.png)


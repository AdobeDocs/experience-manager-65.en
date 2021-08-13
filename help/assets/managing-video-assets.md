---
title: Manage video assets
description: Upload, preview, annotate, and publish video assets in [!DNL Adobe Experience Manager].
contentOwner: AG
role: User
feature: Asset Management
exl-id: 21d3e0bd-5955-470a-8ca2-4d995c17eb4c
---
# Manage video assets {#manage-video-assets}

Video format is a critical part of digital assets of an organization. [!DNL Adobe Experience Manager] offers mature offerings and features to manage the entire lifecycle of your video assets after their creation.

Learn how to manage and edit the video assets in [!DNL Adobe Experience Manager Assets]. Video encoding and transcoding, for example, FFmpeg transcoding, is possible using [!DNL Dynamic Media] integration.

## Upload and preview video assets {#upload-and-preview-video-assets}

[!DNL Adobe Experience Manager Assets] generates previews for video assets with the extension MP4. If the format of the asset is not MP4, install the FFmpeg pack to generate a preview. FFmpeg creates video renditions of type OGG and MP4. You can preview the renditions in the [!DNL Assets] user interface.

1. In the digital assets folder or subfolders, navigate to the location where you want to add digital assets.
1. To upload the asset, click **[!UICONTROL Create]** from the toolbar and choose **[!UICONTROL Files]**. Alternatively, drag a file on the user interface. See [upload assets](manage-assets.md#uploading-assets) for details.
1. To preview a video in the Card view, click the **[!UICONTROL Play]** ![play option](assets/do-not-localize/play.png) option on the video asset. You can pause or play video in the card view only. The [!UICONTROL Play] and [!UICONTROL Pause] options are not available in the list view.

1. To preview the video in the asset details page, click **[!UICONTROL Edit]** on the card. The video plays in the native video player of the browser. You can play, pause, control the volume, and zoom the video to full screen.

   ![Video playback controls](assets/video-playback-controls.png)

## Configuration to upload assets that are larger than 2 GB {#configuration-to-upload-assets-that-are-larger-than-gb}

By default, [!DNL Assets] does not let you upload any assets that are larger than 2 GB because of a file size limit. However, you can overwrite this limit by going into CRXDE Lite and creating a node under the `/apps` directory. The node must have the same node name, directory structure, and comparable node properties of order.

 In addition to [!DNL Assets] configuration, change the following configurations to upload large assets:

* Increase the token expiration time. See [!UICONTROL Adobe Granite CSRF Servlet] in Web Console at `https://[aem_server]:[port]/system/console/configMgr`. For more information, see [CSRF protection](/help/sites-developing/csrf-protection.md).
* Increase the `receiveTimeout` in Dispatcher configuration. For more information, see [Experience Manager Dispatcher configuration](https://experienceleague.adobe.com/docs/experience-manager-dispatcher/using/configuring/dispatcher-configuration.html#renders-options).

>[!NOTE]
>
>The [!DNL Experience Manager] Classic user interface does not have a 2-GB file size limit restriction. Also, end-to-end workflow for large video is not fully supported.

To configure a higher file size limit, perform the following steps in the `/apps` directory.

1. In [!DNL Experience Manager], click **[!UICONTROL Tools]** > **[!UICONTROL General]** > **[!UICONTROL CRXDE Lite]**.
1. In CRXDE Lite, navigate to `/libs/dam/gui/content/assets/jcr:content/actions/secondary/create/items/fileupload`. To see the directory window, click the `>>`.
1. From the toolbar, click the **[!UICONTROL Overlay Node]**. Alternatively, select **[!UICONTROL Overlay Node]** from the context menu.
1. In the **[!UICONTROL Overlay Node]** dialog, click **[!UICONTROL OK]**.

   ![Overlay node](assets/overlay-node-path.png)

1. Refresh the browser. The overlay node `/apps/dam/gui/content/assets/jcr:content/actions/secondary/create/items/fileupload` is selected.
1. In the **[!UICONTROL Properties]** tab, enter the appropriate value in bytes to increase the size limit to the desired size. For example, to increase the size limit to 30 GB, enter `32212254720` value.

1. From the toolbar, click **[!UICONTROL Save All]**.
1. In [!DNL Experience Manager], click **[!UICONTROL Tools]** > **[!UICONTROL Operations]** > **[!UICONTROL Web Console]**.
1. On the [!DNL Adobe Experience Manager] [!UICONTROL Web Console Bundles] page, under the Name column of the table, locate, and click **[!UICONTROL Adobe Granite Workflow External Process Job Handler]**.
1. On the [!UICONTROL Adobe Granite Workflow External Process Job Handler] page, set the seconds for both **[!UICONTROL Default Timeout]** and **[!UICONTROL Max Timeout]** fields to `18000` (five hours). Click **[!UICONTROL Save]**.
1. In [!DNL Experience Manager], click **[!UICONTROL Tools]** > **[!UICONTROL Workflow]** > **[!UICONTROL Models]**.
1. On the Workflow Models page, select **[!UICONTROL Dynamic Media Encode Video]**, then click **[!UICONTROL Edit]**.
1. On the workflow page, double-click the **[!UICONTROL Dynamic Media Video Service Process]** component.
1. In the [!UICONTROL Step Properties] dialog box, under the **[!UICONTROL Common]** tab, expand **Advanced Settings**.
1. In the **[!UICONTROL Timeout]** field, specify a value of `18000`, then click **[!UICONTROL OK]** to return to the **[!UICONTROL Dynamic Media Encode Video]** workflow page.
1. Near the top of the page, below the [!UICONTROL Dynamic Media Encode Video] page title, click **[!UICONTROL Save]**.

## Publish video assets {#publish-video-assets}

After publishing, you can include the video assets in a web page as a URL or directly embed the assets. For details, see [publish Dynamic Media assets](/help/assets/publishing-dynamicmedia-assets.md).

## Annotate video assets {#annotate-video-assets}

1. From the [!DNL Assets] console, select **[!UICONTROL Edit]** on the asset card to display the asset details page.
1. To play the video, click **[!UICONTROL Preview]**.
1. To annotate the video, click **[!UICONTROL Annotate]**. An annotation is added at the particular time (frame) in the video. When annotating, you can draw on the canvas and include a comment with the drawing. Comments are auto-saved. To exit the annotation wizard, click **[!UICONTROL Close]**.

   ![Draw and annotate on a video frame](assets/annotate-video.png)

1. Seek to a specific point in the video, specify the time in seconds in the **text** field and click **Jump**. For example, to skip the first 20 seconds of video, enter 20 in the text field.

   ![Seek to a time in a video to skip by specified seconds](assets/seek-in-video.png)

1. To view it in the timeline, click an annotation. To delete the annotation from the timeline, click **[!UICONTROL Delete]**.

   ![View annotations and the details in the timeline](assets/timeline-view-annotation.png)

>[!MORELIKETHIS]
>
>* [Manage digital assets in Experience Manager Assets](/help/assets/manage-assets.md)
>* [Manage collections in Experience Manager Assets](/help/assets/manage-collections.md)
>* [Dynamic Media video documentation](/help/assets/video.md).

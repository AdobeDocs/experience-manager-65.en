---
title: Integrate [!DNL Assets] with activity stream
description: Describes the recording capabilities of [!DNL Experience Manager] and how to configure it to record specific events.
contentOwner: AG
---

# Integrate [!DNL Assets] with activity stream {#integrating-assets-with-activity-stream}

[!DNL Adobe Experience Manager Assets] users perform many actions like creating, uploading and deleting Assets. These actions can be recorded so you are able to provide an history of what has been done by a user. This section describes the recording capabilities of [!DNL Experience Manager] and how to configure [!DNL Experience Manager] in order to record specific events.

## Performance considerations and default behavior {#performance-considerations-and-default-behavior}

This integration could be CPU and disk space consuming for example when doing bulk import. For these reasons the [!DNL Assets] integration with the Activity Stream is disabled by default.

## Supported action events {#supported-action-events}

The following events can be configured to be recorded:

* License accepted (ACCEPTED)
* Asset created (ASSET_CREATED)
* Asset moved (ASSET_MOVED)
* Asset removed (ASSET_REMOVED)
* License rejected (REJECTED)
* Asset downloaded (DOWNLOADED)
* Asset versioned (VERSIONED)
* Asset version restored (RESTORED)
* Asset Metadata updated (METADATA_UPDATED)
* Asset published to external system (PUBLISHED_EXTERNAL)
* Asset's original updated (ORIGINAL_UPDATED)
* Asset Rendition updated (RENDITION_UPDATED)
* Asset Rendition removed (RENDITION_REMOVED)
* Sub-asset updated (SUBASSET_UPDATED)
* Sub-asset removed (SUBASSET_REMOVED)

## Configure [!DNL Assets] events recording {#configuring-aem-assets-events-recording}

The [Web console](/help/sites-deploying/configuring-osgi.md) provides access to the Assets Event Recorder tuning. To configure the Assets Event Recorder, proceed as follows:

1. Navigate to the **[!UICONTROL Web Console]**

1. Click **[!UICONTROL Configuration]**.

1. Double click **[!UICONTROL Day CQ DAM Event Recorder]**.

1. Check **[!UICONTROL Enables this service]**.

1. Check which **[!UICONTROL Event Types]** you want to be recorded in the user activity stream.

1. Click **[!UICONTROL Save]**.

## Read recorded events {#reading-recorded-events}

The recorded events are stored as activities. You can read them programmatically using the [ActivityManager API](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/granite/activitystreams/ActivityManager.html).

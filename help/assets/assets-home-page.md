---
title: AEM Assets Home Page Experience
seo-title: AEM Assets Home Page Experience
description: Personalize the AEM Assets Home page for a rich welcome screen experience, including a snapshot of recent activities around assets.
seo-description: Personalize the AEM Assets Home page for a rich welcome screen experience, including a snapshot of recent activities around assets.
uuid: 787ebcc3-9c20-4e25-8ce5-ecba1b42d123
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
content-type: reference
topic-tags: authoring
discoiquuid: c7d6bac8-0897-4a5e-a286-823968dfb52e
---

# AEM Assets Home Page Experience {#aem-assets-home-page-experience}

Personalize the AEM Assets Home page for a rich welcome screen experience, including a snapshot of recent activities around assets.

The Adobe Experience Manager (AEM) Assets Home page provides a rich and personalized welcome screen experience, which includes a snapshot of recent activites, such as assets that were recently viewed or uploaded.

The Assets Home page is disabled by default. To enable it, perform the following steps:

1. Open AEM Configuration Manager `https://&lt;AEM Server&gt;:&lt;Port&gt;/system/console/configMgr`.
1. Open the **Day CQ DAM Event Recorder** service.
1. Select the **[!UICONTROL Enable this service]** to enable activity recording.

   ![chlimage_1-250](assets/chlimage_1-250.png)

1. From the **Event Types** list, select the events to be recorded and save the changes.

   >[!CAUTION]
   >
   >Enabling the Asset viewed, Projects viewed, and Collections viewed options, significantly increases the number of recorded events.

1. Open the **[!UICONTROL DAM Asset Home Page Feature Flag]** service from Configuration Manager *https://&lt;AEM Server&gt;:&lt;Port&gt;/system/console/configMgr*.
1. Select the **[!UICONTROL isEnabled.name]** option to enable the Assets Home page feature. Save the changes.

   ![chlimage_1-251](assets/chlimage_1-251.png)

1. Open the **[!UICONTROL User Preferences]** dialog, and select **[!UICONTROL Enable Assets Home Page]**. Save the changes.

   ![user_preferences](assets/user_preferences.png)

After enabling the Assets Home page, navigate to the Assets user interface either from the Navigation page or access it directly from the URL *https://&lt;Server Name&gt;:&lt;Port&gt;/aem/assetshome.html/content/dam*.

![home_page](assets/home_page.png)

Tap/click the **[!UICONTROL Click here to configure your experience link]** to add your username, background image, and profile image.

The Assets Home page includes the following sections:

* Welcome Section
* Widget Section

**Welcome Section**

If your profile exists, the Welcome section displays a welcome message addressed to you. In addition, it displays your profile picture and a welcome image (if configured already).

If your profile is incomplete, the Welcome section displays a generic welcome message and a placeholder for your profile picture.

**Widget Section**

This section appears below the Welcome section and displays out-of-the-box widgets under the following sections:

* Activity
* Recent
* Discover

**Activity**: Under this section, the **My Activity** widget displays recent activities performed by the logged-in user with assets (including assets without renditions), for example asset uploads, downloads, asset creation, edits, comments, annotations, and shares.

**Recent**: The **Recently Viewed** widget under this section displays recently accessed entities by the logged-in user, including folders, collections, and projects.

**Discover**: The **New** widget under this section displays the assets and renditions recently uploaded to the AEM Assets instance.

To enable purging of user activity data, enable the **DAM Event Purge Service** from Configuration Manager. After you enable this service, activities of the logged-in user that exceed a specified number are deleted by the system.

The Welcome screen provides easy navigational aids, for example icons on the toolbar to access folders, collections, and catalogs.

>[!NOTE]
>
>Enabling the Day CQ DAM Event Recorder and DAM Event Purge services increases write operations to JCR and search indexing, which significantly increases the load on the AEM server. The additional load on the AEM server can impact its performance.

>[!CAUTION]
>
>Capturing, filtering, and purging user activities required for Asset Home Page impose an overhead on performance. Therefore, administrators should configure Home Page effectively for target users.
>
>Adobe recommends that administrators and users who perform bulk operations avoid using the Asset Home Page feature to prevent increase in user activities. In addition, administrators can exclude recording activities for specific users by configuring **Day CQ DAM Event Recorder** from Configuration Manager.
>
>If you use the feature, Adobe recommends that you schedule purge frequency based on the server load.


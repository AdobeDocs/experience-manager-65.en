---
title: Configure your Adobe Mobile Services Cloud Service

description: Follow this page to configure your Adobe Mobile Services Cloud Service.


contentOwner: User
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/MOBILE
topic-tags: administering-adobe-phonegap-enterprise

legacypath: /content/docs/en/aem/6-1/develop/mobile-apps/apps/managing-aem-mobile-apps/configure-your-adobe-phonegap-build-cloud-service1
exl-id: 209c36f9-1a4b-4eea-8dde-22e0fc9718c1
solution: Experience Manager
feature: Mobile
role: Admin
---
# Configure your Adobe Mobile Services Cloud Service {#configure-your-adobe-mobile-services-cloud-service}

{{ue-over-mobile}}

The **Mobile Metrics Tile** on the command center provides real-time analytics for your mobile application.

The [Adobe Mobile Analytics](https://www.adobe.com/ca/solutions/digital-analytics/mobile-web-apps-analytics.html) SDK is made available through a PhoneGap plug-in. Metrics are collected and cached on the device until the device is connected, at which time the data is pushed to the Adobe Mobile Services Cloud for reporting and analysis.

Adobe Mobile Analytics SDK provides the following:

1. **Data collection for mobile channels** - Collect comprehensive data for your mobile websites and apps on all major operating systems.
1. **Mobile engagement analysis** - Understand user engagement within your mobile app, website, or video, including how frequently consumers launch the channel, whether they make purchases from it, and more.
1. **Mobile app dashboards and reports** - Get usage reports that include lifecycle metrics for your apps and app store metrics — see trends for users, launches, average session length, retention length, and crashes.
1. **Mobile campaign analysis** - Quantify the effectiveness of mobile-specific campaigns such as SMS, mobile search ads, mobile display ads, and QR codes.
1. **Geolocation analysis** - Find where your app users launch and interact with your mobile experiences by GPS location or points of interest.
1. **Pathing analysis** - See how users navigate through your app to determine which screens and UI elements are engaging users and which cause users to drop off.

>[!CAUTION]
>
>The **Analyze Metrics** Tile displays in the dashboard, only if you have configured cloud services.

![chlimage_1-22](assets/chlimage_1-22.png)

AEM Command Center Metrics Tile

## Configuring the Cloud Service {#configuring-the-cloud-service}

To take advantage of Adobe Mobile Services Analytics you need to configure the AEM Mobile Analytics Cloud Service with your Adobe Analytics account information.

1. Click on the top right hand side icon to add or edit the Cloud Services from the **Manage Cloud Services** tile from the app dashboard.

   ![chlimage_1-23](assets/chlimage_1-23.png)

1. The **Add or Edit Cloud Services** screen displays. Select **Adobe Mobile Services** and click **Next**.

   ![chlimage_1-24](assets/chlimage_1-24.png)

1. Choose an existing configuration from the **Mobile Services** or choose **Create Configuration** to create one.

   For new configuration, enter the **Mobile Services Properties **and click** Verify.**

   ![chlimage_1-25](assets/chlimage_1-25.png)

   If the credentials are verified, the **Verify** button changes to **Verified**. You can choose a mobile service app from **Select a Mobile App Service**.

   Click **Submit** for setting up your configuration.

   ![chlimage_1-26](assets/chlimage_1-26.png)

1. Once you set up a cloud configuration, you can view the same in your dashboard.

   ![chlimage_1-27](assets/chlimage_1-27.png)

   >[!NOTE]
   >
   >Once you set up your cloud configuration, you can view the **Analyze Metrics** Tile in your app dashboard.

   ![chlimage_1-28](assets/chlimage_1-28.png)

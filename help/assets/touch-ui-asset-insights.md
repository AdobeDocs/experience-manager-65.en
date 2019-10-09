---
title: Asset Insights
seo-title: Asset Insights
description: Learn how the Asset Insights feature lets you track user ratings and usage statistics of assets that are used in third-party websites, marketing campaigns, and Adobe's creative solutions.
seo-description: Learn how the Asset Insights feature lets you track user ratings and usage statistics of assets that are used in third-party websites, marketing campaigns, and Adobe's creative solutions. Derive insights regarding asset performance and popularity.
uuid: fff948f7-d8c4-40a2-af0e-de73a528e23f
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: managing-assets
content-type: reference
discoiquuid: 330bad1b-72b3-48a3-95c4-9a90a3e6c9f7
---

# Asset Insights {#asset-insights}

Learn how the Asset Insights feature lets you track user ratings and usage statistics of assets that are used in third-party websites, marketing campaigns, and Adobe's creative solutions.

The Asset Insights feature enables you to track user ratings and usage statistics of assets that are used in third-party websites, marketing campaigns, and Adobe's creative solutions to derive insights regarding their performance and popularity.

Assets Insights captures user activity details, such as the number of times an asset is rated, clicked, and impressions (number of times the asset is loaded on the website). It assigns scores to assets based on these statistics. You can use the scores and performance statistics to select popular assets for inclusion in catalogs, marketing campaigns, and so on. You can even formulate archival and license renewal policies for assets based on these statistics.

For Assets Insights to capture usage statistics for assets from a website, you must include the embed code for the asset in the website code.

To let Asset Insights display usage statistics for assets, first configure the feature to fetch reporting data from Adobe Analytics. For details, see [Configure Asset Insights](touch-ui-configuring-asset-insights.md).

>[!NOTE]
>
>Insights are supported and provided only for images.

## Viewing statistics for an asset {#viewing-statistics-for-an-asset}

You can view the Asset Insights scores from the metadata page.

1. From the Assets user interface (UI), select the asset and then tap/click the **[!UICONTROL Properties]** icon from the toolbar.
1. From the Properties page, tap/click the **[!UICONTROL Insights]** tab.
1. Review the usage details for the asset in the **[!UICONTROL Insights]** tab. The **[!UICONTROL Score]** section descibes the total asset usage and performance sores of an asset .

   Usage score describes the numbers of times asset is used in various solutions.

   The **[!UICONTROL Impressions]** score is the number of times the asset is loaded on the web site. The number displayed under **[!UICONTROL Clicks]** is the number of times the asset is clicked.

1. Review the **[!UICONTROL Usage Statistics]** section to know which entities the asset was part of and which creative solutions recently used it. The higher the usage, the greater the chances that the asset is popular among users. Usage data is displayed under the following heads:

    * **[!UICONTROL Asset]**: The number of times the asset was part of a collection or compound asset
    * **[!UICONTROL Web & Mobile]**: The number of times the asset was part of websites and apps
    * **[!UICONTROL Social]**: The number of times the asset was used in solutions, such as Adobe Social and Adobe Campaign
    * **[!UICONTROL Email]**: The number of times the asset was used in email campaigns

   ![usage_statistics](assets/usage_statistics.png)

   >[!NOTE]
   >
   >Because the Asset Insights feature typically fetches the Solutions data from Adobe Analytics in a periodic manner, the Solutions section may not display the the most recent data. The time period for which the data is displayed depends the schedule of the fetch operation that Asset Insights runs to retrieve Analytics data.

1. To view performance statistics for the asset graphically over a period of time, select period in the **[!UICONTROL Performance Statistics]** section. Details, including clicks and impressions are displayed as trend lines of a graph. 

   ![chlimage_1-3](assets/chlimage_1-3.jpeg)

   >[!NOTE]
   >
   >Unlike the data in the Solutions section, the Performance Statistics section displays the most recent data.

1. To obtain the embed code for the asset that you include in websites to gets performance data, tap/click **[!UICONTROL Get Embed Code]** below the asset thumbnail. For more information on how to include your Embed code in third-party web pages, see [Using Page Tracker and Embed code in web pages](touch-ui-using-page-tracker.md).

   ![chlimage_1-303](assets/chlimage_1-303.png)

## Viewing aggregate statistics for assets {#viewing-aggregate-statistics-for-assets}

You can view scores of all assets within a folder simultaneously using **[!UICONTROL Insights View]**.

1. In the Assets UI, navigate to the folder containing the assets for which you want to view insights.
1. Tap/click the Layout icon from the toolbar, and then choose **[!UICONTROL Insights View]**.
1. The page displays usage scores for the assets. Compare the ratings of the various assets and draw insights.

## Scheduling background job {#scheduling-background-job}

Asset Insights fetches usage data for assets from Adobe Analytics report suites in a periodic manner. By default, Asset Insights runs a background job every 24 hours at 2 AM to the fetch data. However, you can modify both the frequency and the time by configuring the **[!UICONTROL Adobe CQ DAM Asset Performance Report Sync Job]** service from the web console.

1. Tap the AEM logo, and go to **[!UICONTROL Tools > Operations > Web Console]**.
1. Open the **[!UICONTROL Adobe CQ DAM Asset Performance Report Sync Job]** service configuration.

   ![chlimage_1-304](assets/chlimage_1-304.png)

1. Specify the desired scheduler frequency and the start time for the job in the property scheduler expression. Save the changes.


---
title: Configuring Asset Insights
seo-title: Configuring Asset Insights
description: Learn how to configure Asset Insights in AEM Assets.
seo-description: Learn how to configure Asset Insights in AEM Assets.
uuid: 588f79ef-8b86-4b6b-950c-bd26bc0130ee
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: managing-assets
content-type: reference
discoiquuid: a1ab5083-12a2-4ea4-bc47-8c6cc5671b26
---

# Configuring Asset Insights {#configuring-asset-insights}

Adobe Experience Manager (AEM) Assets fetches usage data around AEM assets used by third-party websites from Adobe Analytics. To enable Asset Insights to retrieve this data and generate insights, first configure the feature to integrate with Adobe Analytics.

>[!NOTE]
>
>Insights are only supported and provided for images.

1. In AEM, click **[!UICONTROL Tools > Assets]**.

   ![chlimage_1-210](assets/chlimage_1-210.png)

1. Click the **[!UICONTROL Insights Configuration]** card.
1. In the wizard, select a data center and provide your credentials including the name of your organization, user name, and password.

   ![chlimage_1-211](assets/insights_config2.png)

1. Click/tap **[!UICONTROL Authenticate]**.
1. After AEM authenticates your credentials, from the **[!UICONTROL Report Suite]** list, choose an Adobe Analytics report suite from where you want Asset Insights to fetch data. Click **[!UICONTROL Add]**.
1. After AEM sets up your report suite, click/tap **[!UICONTROL Done]**.

## Page Tracker {#page-tracker}

After you configure your Analytics account, the Page Tracker code is generated for you. To enable Assets Insights to track AEM assets used in third-party websites, include the page tracker code in the website code. Use the Page Tracker utility in AEM Assets to generate the page tracker code. For more information on how to include your Page Tracker code in third-party web pages, see [Using Page Tracker and Embed code in web pages](touch-ui-using-page-tracker.md).

1. In AEM, click the **[!UICONTROL Tools > Assets]**.

   ![chlimage_1-214](assets/chlimage_1-214.png)

1. From the **[!UICONTROL Navigation]** page, click the **[!UICONTROL Insights Page Tracker]** card.
1. Click the **[!UICONTROL Download]** icon to download the page tracker code.
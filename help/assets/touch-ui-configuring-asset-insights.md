---
title: Configure Asset Insights
description: Configure Asset Insights in AEM Assets.
uuid: 02ffa1cb-2675-479c-afdf-8b082b96fccc
contentOwner: AG
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
discoiquuid: 199fa254-e5bf-4982-b157-2036a708018c
docset: aem65

---

# Configure Asset Insights {#configure-asset-insights}

Adobe Experience Manager (AEM) Assets fetches usage data around AEM assets used by third-party websites from Adobe Analytics. To enable Asset Insights to retrieve this data and generate insights, first configure the feature to integrate with Adobe Analytics.

>[!NOTE]
>
>Insights are only supported and provided for images.

1. In AEM, click **[!UICONTROL Tools]** &gt; **[!UICONTROL Assets]**.

   ![chlimage_1-72](assets/chlimage_1-210.png)

1. Click the **[!UICONTROL Insights Configuration]** card.
1. In the wizard, select a data center and provide your credentials including the name of your organization, user name, and Shared Secret.

   ![Configure Adobe Analytics for Assets Insights in AEM](assets/insights_config2.png)
   *Figure: Configure Adobe Analytics for Assets Insights in AEM*

1. Click/tap **[!UICONTROL Authenticate]**.
1. After AEM authenticates your credentials, from the **[!UICONTROL Report Suite]** list, choose an Adobe Analytics report suite from where you want Asset Insights to fetch data. Click **[!UICONTROL Add]**.
1. After AEM sets up your report suite, click/tap **[!UICONTROL Done]**.

## Page tracker {#page-tracker}

After you configure your Adobe Analytics account, the Page Tracker code is generated for you. To enable Assets Insights to track AEM assets used in third-party websites, include the page tracker code in the website code. Use the Page Tracker utility in AEM Assets to generate the page tracker code. For more information on how to include your Page Tracker code in third-party web pages, see [Use page tracker and embed code in web pages](/help/assets/touch-ui-using-page-tracker.md).

1. In AEM, click **[!UICONTROL Tools]** &gt; **[!UICONTROL Assets]**.

   ![chlimage_1-73](assets/chlimage_1-214.png)

1. From the **[!UICONTROL Navigation]** page, click the **[!UICONTROL Insights Page Tracker]** card.
1. Click **[!UICONTROL Download]** to download the page tracker code.

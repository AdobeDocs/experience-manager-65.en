---
title: Configure Assets Insights to get analytics.
description: Configure Assets Insights in [!DNL Adobe Experience Manager Assets].
contentOwner: AG
role: Developer, Admin
feature: Asset Insights,Asset Reports
exl-id: 67be0ae6-5939-40fe-bf8a-b8a2c2f68f15
solution: Experience Manager, Experience Manager Assets
---
# Configure Assets Insights {#configure-asset-insights}

[!DNL Adobe Experience Manager Assets] fetches usage data around digital assets used by third-party websites from [!DNL Adobe Analytics]. To enable Assets Insights to retrieve this data and generate insights, first configure the feature to integrate with [!DNL Adobe Analytics]. To use this feature in an on-premise installation, purchase [!DNL Adobe Analytics] license separately. Customers on [!DNL Managed Services] receive [!DNL Analytics] license bundled with [!DNL Experience Manager]. See [Managed Services product description](https://helpx.adobe.com/legal/product-descriptions/adobe-experience-manager-managed-services.html).

>[!NOTE]
>
>Insights are only supported and provided for images.

1. In [!DNL Experience Manager], click **[!UICONTROL Tools]** > **[!UICONTROL Assets]**.

   ![chlimage_1-72](assets/chlimage_1-210.png)

1. Click the **[!UICONTROL Insights Configuration]** card.
1. In the wizard, select a data center and provide your credentials including the name of your organization, user name, and Shared Secret.

   ![Configure Adobe Analytics for Assets Insights in Experience Manager](assets/insights_config2.png)

   *Figure: Configure [!DNL Adobe Analytics] for Assets Insights in [!DNL Experience Manager].*

1. Click **[!UICONTROL Authenticate]**.
1. After [!DNL Experience Manager] authenticates your credentials, from the **[!UICONTROL Report Suite]** list, choose an [!DNL Adobe Analytics] report suite from where you want Assets Insights to fetch data. Click **[!UICONTROL Add]**.
1. After [!DNL Experience Manager] sets up your report suite, click **[!UICONTROL Done]**.

## Page tracker {#page-tracker}

After you configure your [!DNL Adobe Analytics] account, the Page Tracker code is generated for you. To enable Assets Insights to track [!DNL Experience Manager] assets used in third-party websites, include the page tracker code in the website code. Use the [!UICONTROL Page Tracker] utility in [!DNL Experience Manager Assets] to generate the page tracker code. For more information on how to include your Page Tracker code in third-party web pages, see [Use page tracker and embed code in web pages](/help/assets/use-page-tracker.md).

1. In [!DNL Experience Manager], click **[!UICONTROL Tools]** > **[!UICONTROL Assets]**.

   ![chlimage_1-73](assets/chlimage_1-214.png)

1. From the **[!UICONTROL Navigation]** page, click the **[!UICONTROL Insights Page Tracker]** card.
1. Click **[!UICONTROL Download]** to download the page tracker code.

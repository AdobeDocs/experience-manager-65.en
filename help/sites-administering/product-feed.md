---
title: Product Feed
seo-title: Product Feed
description: Learn about the AEM Product Feed.
seo-description: Learn about the AEM Product Feed.
uuid: 99eb9bdc-2717-45d4-9203-6394b7d7ddc6
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: integration
content-type: reference
discoiquuid: 1f920892-c52e-42ca-900c-2c7ab3c503b3
---

# Product Feed{#product-feed}

AEM integrates with [Search&Promote](https://www.adobe.com/solutions/testing-targeting/searchandpromote.html) and allows you to:

* use the eCommerce API, independently of the underlying repository structure and commerce platform.
* leverage the Index Connector feature of Search&Promote to provide a product feed in XML format.
* leverage the Remote Control feature of Search&Promote to perform on-demand or scheduled requests of the product feed
* feed generation for different Search&Promote accounts, configured as cloud services configurations.

You need to have a valid acount and to [configure the connection to Search&Promote](/help/sites-administering/search-and-promote.md#configuring-the-connection-to-search-promote). You also have to verify that you are using the correct [data center](/help/sites-administering/search-and-promote.md#configuring-the-data-center) and make sure that the **Remote server URI **is configured.

## Set up the Product Feed {#set-up-the-product-feed}

You first have to enter a web site root and an identifier attribute. To do this:

1. Navigate to your Search&Promote configuration.
1. Click **[!UICONTROL Edit]**.
1. Click the **[!UICONTROL Index Connector Feed Configuration]** tab.
1. Enter the **[!UICONTROL Web site root]** and **[!UICONTROL Identifier attribute]**.

   >[!NOTE]
   >
   >The **[!UICONTROL Web site root]** is the root of your eCommerce website, for example `/content/geometrixx-outdoors/en`.
   >
   >The **[!UICONTROL Identifier attribute]** is a JCR property that uniquely identifies the product: `identifier`.

1. Click **[!UICONTROL OK]**.

Then you also have to edit two configurations in the Web Console before you can generate product feeds.

### Configuring the Day CQ Search&Promote Products Crawler Implementation for Geometrixx {#configuring-the-day-cq-search-promote-products-crawler-implementation-for-geometrixx}

1. Navigate to [http://localhost:4502/system/console/configMgr](http://localhost:4502/system/console/configMgr).
1. Click **[!UICONTROL Day CQ Search&Promote products crawler implementation for Geometrixx]**.
1. Specify the Search&Promote account number that this crawler is linked to. It will be used to look up the cloud services configuration used by this crawler.
1. Click **[!UICONTROL Save]**.

### Configuring the Day CQ Search&Promote Products Feed Generator for Geometrixx {#configuring-the-day-cq-search-promote-products-feed-generator-for-geometrixx}

1. Navigate to [http://localhost:4502/system/console/configMgr](http://localhost:4502/system/console/configMgr).
1. Click **[!UICONTROL Day CQ Search&Promote products feed generator for Geometrixx]**.
1. Specify the Search&Promote account number that this generator is linked to. It will be used to look up the cloud services configuration used by this generator.
1. Click **[!UICONTROL Save]**.

## Schedule the Product Feed {#schedule-the-product-feed}

To enable scheduled feed generation, you must configure a scheduler for it.  
A scheduler is configured as a child configuration of your specific Search&Promote cloud services configuration.

1. Navigate to your Search&Promote configuration.
1. Click **[!UICONTROL +]** next to **[!UICONTROL Scheduler configuration]**.
1. Enter a **[!UICONTROL Title]** that is recognizable to page authors, and a unique **[!UICONTROL Name]**.
1. Click **[!UICONTROL Create]**. A dialog opens.

   ![chlimage_1-108](assets/chlimage_1-108.png)

1. Enter the **[!UICONTROL Remote Control Password]**. It is the password you configured in your Search&Pronote account.

   >[!NOTE]
   >
   >This is not the password to your Search&Promote account. You can find and change this password by logging into your Search&Promote account and going to **[!UICONTROL Index]** and then to **[!UICONTROL Remote control]**.

1. Check **[!UICONTROL Enable schedule]** box.
1. Select a **[!UICONTROL Schedule]**. It is the actual feed generation schedule.
1. Enable the **[!UICONTROL On-demand indexing]** or not. This feature is used to manually call the Search&Promote index. If **[!UICONTROL Request full products feed]** is checked, Search&Promote will request a full products feed. Otherwise, an incremental products feed is requested.

   >[!NOTE]
   >
   >The on-demand indexing feature makes use of the Remote Control feature of Search&Promote. When a remote indexing is called, the indexing will not start immediately, but an indexing request will be posted to Search&Promote using the remote control feature.

1. Click **[!UICONTROL OK]**.

Now that you configured everything, you can see an XML page containing all the products under the configured web site root: [http://localhost:4502/etc/commerce/searchpromote/feed/full](http://localhost:4502/etc/commerce/searchpromote/feed/full).

---
title: Integrating with Adobe Search&Promote
seo-title: Integrating with Adobe Search&Promote
description: Learn how to integrate with Adobe Search&Promote.
seo-description: Learn how to integrate with Adobe Search&Promote.
uuid: ddc4510a-9bd1-4238-a8a8-5f4f563edd8d
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: integration
content-type: reference
discoiquuid: 87e62346-98d5-40ec-a3ef-904adf667425
---

# Integrating with Adobe Search&Promote{#integrating-with-adobe-search-promote}

To call the Adobe Search&Promote service from your website, perform the following tasks:

1. Specify the URL of the Cloud.
1. Configure the connection to the Search&Promote service.
1. Add Search&Promote components to [!UICONTROL Sidekick].
1. Use the components to author the content. (See [Adding Search&Promote Features to a Web Page](/help/sites-authoring/search-and-promote.md).)
1. Add banners to your pages. Banner images are sensitive to Search&Promote data.
1. Generate a site map for the Search&Promote service to consume.

>[!NOTE]
>
>If you are using Search&Promote with a custom proxy configuration, you need to configure both HTTP Client proxy configurations as some functionalities of AEM are using the 3.x APIs and some others the 4.x APIs:
>
>* 3.x is configured with [http://localhost:4502/system/console/configMgr/com.day.commons.httpclient](http://localhost:4502/system/console/configMgr/com.day.commons.httpclient)
>* 4.x is configured with [http://localhost:4502/system/console/configMgr/org.apache.http.proxyconfigurator](http://localhost:4502/system/console/configMgr/org.apache.http.proxyconfigurator)
>

## Changing the Search&Promote service URL {#changing-the-search-promote-service-url}

The default URL that is configured for the Search&Promote service is `https://searchandpromote.omniture.com/px/`. To use a different service, use the OSGi console to specify a different URL.

**To change the Search&Promote service URL**:

1. Open the [!UICONTROL OSGi] console and tap the **[!UICONTROL Configuration]** tab. ([http://localhost:4502/system/console/configMgr.](http://localhost:4502/system/console/configMgr))  

1. Click the **[!UICONTROL Day CQ Search&Promote Configuration]** item.
1. In the **[!UICONTROL Remote Server URI]** text field, enter the URL, then tap **[!UICONTROL Save]**.

## Configuring the connection to Search&Promote {#configuring-the-connection-to-search-promote}

Configure one or more connections to Search&Promote so that your web pages can interact with the service. To connect, you need the member identification and account number of your Search&Promote account.

**To configure the connection to Search&Promote**:

1. From the **[!UICONTROL Tools]** icon &gt; **[!UICONTROL Deployment]**, select **[!UICONTROL Cloud Services]**.

   This takes you to the Cloud Services Dashboard. If on a local machine, the url of the dashboard will look something like this:

   [http://localhost:4502/libs/cq/core/content/tools/cloudservices.html](http://localhost:4502/libs/cq/core/content/tools/cloudservices.html)

1. In the [!UICONTROL Cloud Services] page, tap the **[!UICONTROL Adobe Search&Promote]** link or the **[!UICONTROL Search&Promote]** icon.  

1. If this is the first time you are configuring Adobe Search&Promote, tap **[!UICONTROL Configure Now]** to open the [!UICONTROL Create Configuration] panel.

   If you would like to learn more about Search&Promote click **[!UICONTROL Learn more]** instead.

   ![chlimage_1-409](assets/chlimage_1-409.png)

1. Enter a **[!UICONTROL Title]** that is recognizable to page authors, and enter a unique **[!UICONTROL Name]**, then tap **[!UICONTROL Create]**.
  
   Also, the newly created Configuration appears below **[!UICONTROL Available Configurations]** on the **[!UICONTROL Cloud Services dashboard]** Adobe Search&Promote list item.

   ![chlimage_1-410](assets/chlimage_1-410.png)

1. In the [!UICONTROL Edit Component] dialog box, add the following to the fields:

    * **[!UICONTROL Member ID]**
    * **[!UICONTROL Account number]**

   >[!NOTE]
   >
   >In order to get this information yourself, log into the following: 
   >
   >[https://searchandpromote.omniture.com/center/](https://searchandpromote.omniture.com/center/)
   >
   >using your valid Seach&Promote credentials (email/password). 
   >
   >Notice the URL in your brouser's address bar. It should look something similar to the following: 
   >
   >[](https://searchandpromote.omniture.com/px/home/?sp_id=XXXXXXXX-spYYYYYYYY)
   >
   >[https://searchandpromote.omniture.com/px/home/?sp_id=XXXXXXXX-spYYYYYYYY](https://searchandpromote.omniture.com/px/home/?sp_id=XXXXXXXX-spYYYYYYYY)
   >
   >Where **XXXXXXXX** corresponds to your **[!UICONTROL Member id]** and **[!UICONTROL spYYYYYYYY]** corresponds to your account number.

1. Tap **[!UICONTROL Connect To Search&Promote]**.

   When the connection success message appears, tap **[!UICONTROL OK]**.

   (After connecting, the button text changes to **[!UICONTROL Re-Connect To Search&Promote]**.)

1. Tap **[!UICONTROL OK]**. The Search&Promote Settings page appears for the configuration that you have just created.

## Configuring the Data Center {#configuring-the-data-center}

If your Search&Promote account is in Asia or Europe, you need to change the default data center so that it points to the right one (the default data center is for North American accounts).

**To configure the data center**:

1. Navigate to the Web console at `http://localhost:4502/system/console/configMgr/com.day.cq.searchpromote.impl.SearchPromoteServiceImpl`

   ![chlimage_1-411](assets/chlimage_1-411.png)

1. Depending on the location of the server, change the URI to one of the following:

    * North America: [https://center.atomz.com/px/](https://center.atomz.com/px/)
    * EMEA: [https://center.lon5.atomz.com/px/](https://center.lon5.atomz.com/px/)
    * APAC: [https://center.sin2.atomz.com/px/](https://center.sin2.atomz.com/px/)

1. Tap **[!UICONTROL Save]**.

## Adding Search&Promote components to Sidekick {#adding-search-promote-components-to-sidekick}

In [!UICONTROL Design] mode, edit a **[!UICONTROL par]** component to allow the Search&Promote components in [!UICONTROL Sidekick]. (See the [Components](/help/sites-developing/components.md) documentation for more information.)

For information about using the components, see [Adding Search&Promote features to a Web Page](/help/sites-authoring/search-and-promote.md).

## Specifying the Search&Promote service that your pages use {#specifying-the-search-promote-service-that-your-pages-use}

Configure web pages so that they use a specific Search&Promote service. Search&Promote components automatically use the service of their host page.

When you configure the Search&Promote properties for a page, all child pages inherit the settings. If required, you can configure child pages to override the inherited settings.

>[!NOTE]
>
>The service connection must already be configured. See [Configure the connection to Search&Promote](#configuring-the-connection-to-search-promote).

1. Open the **[!UICONTROL Page Properties]** dialog box. For example, on the **[!UICONTROL Websites]** page, right-click the page and click **[!UICONTROL Properties]**.  

1. Click the **[!UICONTROL Cloud Services]** tab.  

1. To disable the inheritance of cloud services configurations from a parent page, click the padlock icon next to the inheritance path.

   ![sandpinheritpadlock](assets/sandpinheritpadlock.png)

1. Click **[!UICONTROL Add Service]**, select **[!UICONTROL Adobe Search&Promote]**, then click **[!UICONTROL OK]**.  

1. Select the connection configuration for your Search&Promote account, then click **[!UICONTROL OK]**.

## Product Feed {#product-feed}

The Search&Promote integration lets you do the following:

* Use the [!UICONTROL eCommerce] API, independently of the underlying repository structure and commerce platform.
* Leverage the [!UICONTROL Index Connector] feature of Search&Promote to provide a product feed in XML format.
* Leverage the [!UICONTROL Remote Control] feature of Search&Promote to perform on-demand or scheduled requests of the product feed.
* Feed generation for different Search&Promote accounts, configured as cloud services configurations.

For more information, see [Product Feed](/help/sites-administering/product-feed.md).

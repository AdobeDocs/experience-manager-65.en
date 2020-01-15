---
title: Integrating with Adobe Search&Promote
seo-title: Integrating with Adobe Search&Promote
description: Learn how to integrate with Adobe Search&Promote.
seo-description: Learn how to integrate with Adobe Search&Promote.
uuid: 7e9384d9-9e4f-4e00-a1c9-35547de6ceb8
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: integration
content-type: reference
discoiquuid: aca444f6-418a-4c01-ae19-663b4e04fab9
docset: aem65

---

# Integrating with Adobe Search&Promote{#integrating-with-adobe-search-promote}

To call the Adobe Search&Promote service from your website, perform the following tasks:

1. Specify the URL of the Cloud.
1. Configure the connection to the Search&Promote service.
1. Add Search&Promote components to Sidekick.
1. Use the components to author the content. (See [Adding Search&Promote Features to a Web Page](/help/sites-authoring/search-and-promote.md).)
1. Add banners to your pages. Banner images are sensitive to Search&Promote data.
1. Generate a site map for the Search&Promote service to consume.

>[!NOTE]
>
>If you are using Search&Promote with a custom proxy configuration, you need to configure both HTTP Client proxy configurations as some functionalities of AEM are using the 3.x APIs and some others the 4.x APIs:
>
>* 3.x is configured with [https://localhost:4502/system/console/configMgr/com.day.commons.httpclient](https://localhost:4502/system/console/configMgr/com.day.commons.httpclient)
>* 4.x is configured with [https://localhost:4502/system/console/configMgr/org.apache.http.proxyconfigurator](https://localhost:4502/system/console/configMgr/org.apache.http.proxyconfigurator)
>

## Changing the Search&Promote service URL {#changing-the-search-promote-service-url}

The default URL that is configured for the Search&Promote service is `https://searchandpromote.omniture.com/px/`. To use a different service, use the OSGi console to specify a different URL.

1. Open the OSGi console and click the Configuration tab. ([https://localhost:4502/system/console/configMgr.](https://localhost:4502/system/console/configMgr))
1. Click the Day CQ Search&Promote Configuration item.
1. Enter the URL in the Remote Server URI box, and click Save.

## Configuring the connection to Search&Promote {#configuring-the-connection-to-search-promote}

Configure one or more connections to Search&Promote so that your web pages can interact with the service. To connect, you need the member identification and account number of your Search&Promote account.

1. From the **Tools** icon &gt; **Deployment**, select **Cloud Services**.

   This takes you to the Cloud Services Dashboard. If on a local machine, the url of the dashboard will look something like this:

   [https://localhost:4502/libs/cq/core/content/tools/cloudservices.html](https://localhost:4502/libs/cq/core/content/tools/cloudservices.html)

1. In the Cloud Services page, click on the Adobe Search&Promote link or the Search&Promote icon.

1. If this is the first time you are configuring Adobe Search&Promote, click **Configure Now** to open the Create Configuration panel.

   If you would like to learn more about Search&Promote click **Learn More**instead.

   ![](assets/chlimage_1-59.png)

1. Enter a **Title** that is recognizable to page authors, and enter a unique **Name**, then click **Create**.

   The **Edit Component** window opens.

   Also, the newly created Configuration appears below **Available Configurations** on the **Cloud Services dashboard** Adobe Search&Promote list item.

   ![](assets/chlimage_1-60.png)

1. Add the following to the fields in the **Edit Component** dialog box.

    * **Member ID**
    * **Account number**

   >[!NOTE]
   >
   >In order to get this information **yourself,** first you need to log into
   >
   >[https://searchandpromote.omniture.com/center/](https://searchandpromote.omniture.com/center/)
   >
   >
   >using your valid Seach&Promote credentials (email/password).
   >Then, you need to look at your url in your brouser's address bar which should look something like this:
   >[](https://searchandpromote.omniture.com/px/home/?sp_id=XXXXXXXX-spYYYYYYYY)
   >
   >[https://searchandpromote.omniture.com/px/home/?sp_id=XXXXXXXX-spYYYYYYYY](https://searchandpromote.omniture.com/px/home/?sp_id=XXXXXXXX-spYYYYYYYY)
   >
   >**Where:**
   >
   >    * **XXXXXXXX** corresponds with your** Member id**
   >    * **spYYYYYYYY** corresponds with your **Account Number**

1. Click **Connect To Search&Promote**.

   When the connection success message appears, click **OK**.

   (After connecting, the button text changes to** Re-Connect To Search&Promote**.)

1. Click **OK**. The Search&Promote Settings page appears for the configuration that you have just created.

## Configuring the Data Center {#configuring-the-data-center}

If your Search&Promote account is in Asia or Europe, you need to change the default data center so it points to the right one (the default data center is for North American accounts).

To configure the data center:

1. Navigate to the Web console at `https://localhost:4502/system/console/configMgr/com.day.cq.searchpromote.impl.SearchPromoteServiceImpl`

   ![](assets/chlimage_1-61.png)

1. Depending on the location of the server, change the URI to one of the following:

    * North America: [https://center.atomz.com/px/](https://center.atomz.com/px/)
    * EMEA: [https://center.lon5.atomz.com/px/](https://center.lon5.atomz.com/px/)
    * APAC: [https://center.sin2.atomz.com/px/](https://center.sin2.atomz.com/px/)

1. Click **Save**.

## Adding Search&Promote components to Sidekick {#adding-search-promote-components-to-sidekick}

In Design mode, edit a **par** component to allow the Search&Promote components in Sidekick. (See the [Components](/help/sites-developing/components.md#addinganewcomponenttotheparagraphsystemdesignmode) documentation for more information.)

For information about using the components, see See [Adding Search&Promote Features to a Web Page](/help/sites-authoring/search-and-promote.md).)

## Specifying the Search&Promote service that your pages use {#specifying-the-search-promote-service-that-your-pages-use}

Configure web pages so that they use a specific Search&Promote service. Search&Promote components automatically use the service of their host page.

When you configure the Search&Promote properties for a page, all child pages inherit the settings. If required, you can configure child pages to override the inherited settings.

>[!NOTE]
>
>The service connection must already be configured. (See [Configure the connection to Search&Promote](#connection).)

1. Open the **Page Properties** dialog box. For example, on the** Websites** page, right-click the page and click **Properties**.
1. Click the **Cloud Services** tab.
1. To disable the inheritance of cloud services configurations from a parent page, click the padlock icon next to the inheritance path.

   ![](assets/sandpinheritpadlock.png)

1. Click **Add Service**, select **Adobe Search&Promote**, and click **OK**.
1. Select the connection configuration for your Search&Promote account, and then click **OK**.

## Product Feed {#product-feed}

The Search&Promote integration allows you to:

* use the eCommerce API, independently of the underlying repository structure and commerce platform.
* leverage the Index Connector feature of Search&Promote to provide a product feed in XML format.
* leverage the Remote Control feature of Search&Promote to perform on-demand or scheduled requests of the product feed
* feed generation for different Search&Promote accounts, configured as cloud services configurations.

For more information, read [Product Feed](/help/sites-administering/product-feed.md).

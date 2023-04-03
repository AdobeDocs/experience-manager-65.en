---
title: Connecting to Adobe Analytics and Creating Frameworks
seo-title: Connecting to Adobe Analytics and Creating Frameworks
description: Learn about connecting AEM to SiteCatalyst and creating frameworks.
seo-description: Learn about connecting AEM to SiteCatalyst and creating frameworks.
uuid: 3820dd24-4193-42ea-aef2-4669ebfeaa9d
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: integration
content-type: reference
discoiquuid: 6b545a51-3677-4ea1-ac7e-2d01ba19283e
docset: aem65
exl-id: 8262bbf9-a982-479b-a2b5-f8782dd4182d
---
# Connecting to Adobe Analytics and Creating Frameworks {#connecting-to-adobe-analytics-and-creating-frameworks}

To track web data from your AEM pages in Adobe Analytics, create an Adobe Analytics Cloud Services configuration and an Adobe Analytics framework:

* **Adobe Analytics Configuration:** The information about your Adobe Analytics account. The Adobe Analytics configuration enables AEM to connect to Adobe Analytics. Create an Adobe Analytics configuration for each account that you use.
* **Adobe Analytics Framework:** A set of mappings between Adobe Analytics report suite properties and CQ variables. Use a framework to configure how your website data populates your Adobe Analytics reports. Frameworks are associated with an Adobe Analytics configuration. You can create multiple frameworks for each configuration.

When you associate a web page with a framework, the framework performs tracking for that page and the descendants of that page. Page views can then be retrieved from Adobe Analytics and displayed in the Sites console.

## Prerequisites {#prerequisites}

### Adobe Analytics Account {#adobe-analytics-account}

To track AEM data in Adobe Analytics, you must have a valid Adobe Experience Cloud Adobe Analytics account.

The Adobe Analytics account must:

* Have **Administrator** privileges
* Be assigned to the **Web Service Access** user group.

>[!CAUTION]
>
>Providing **Administrator** privileges (within Adobe Analytics) is not enough to allow a user to connect from AEM to Adobe Analytics. The account must also have **Web Service Access** privileges.

![chlimage_1-67](assets/chlimage_1-67.png)

Before proceeding, ensure that your credentials let you log in to Adobe Analytics. By way of either of the following:

* [Adobe Experience Cloud Sign In](https://experience.adobe.com/#/@login/home)

* [Adobe Analytics Sign In](https://sc.omniture.com/login/)

### Configuring AEM to Use Your Adobe Analytics Data Centers {#configuring-aem-to-use-your-adobe-analytics-data-centers}

Adobe Analytics [data centers](https://experienceleague.adobe.com/docs/analytics/analyze/reports-analytics/reporting-interface/overview-data-collection.html?lang=en) collect, process, and store data associated with your Adobe Analytics report suite. Configure AEM to use the data center that hosts your Adobe Analytics report suite. The data center is mentioned in your contract. Contact an Admin in your organization for this information.

If necessary, use the following to be routed to the correct data center: `https://api.omniture.com/`.

If your organization requires data collection or retrieval from a specific data center, use the following: 

| Data Center |URL |
|---|---|
| London | `https://api3.omniture.com/` |
| Singapore | `https://api4.omniture.com/` |
| Oregon | `https://api5.omniture.com/` |

Use the [Web Console to configure the OSGi bundle](/help/sites-deploying/configuring-osgi.md#osgi-configuration-with-the-web-console) **Adobe AEM Analytics HTTP Client**. Add the **Data Center URL** for the data center that hosts a report suite for which your AEM pages collect data.

![aa-07](assets/aa-07.png)

1. Open the Web console in your web browser. ([https://localhost:4502/system/console/configMgr](https://localhost:4502/system/console/configMgr))
1. To access the console, enter your credentials.

   >[!NOTE]
   >
   >To find out if you have access to this console, contact you site administrator.

1. Select the Configuration item named **Adobe AEM Analytics HTTP Client**.
1. To add the URL for a data center, press the + button next to the **Data Center URLs** list, and type the URL in the box.

1. To remove a URL from the list, click the - button next to the URL.
1. Click Save.

## Configuring the Connection to Adobe Analytics {#configuring-the-connection-to-adobe-analytics}

>[!CAUTION]
>
>Due to security changes within the Adobe Analytics API, it is no longer possible to use the version of Activity Map that is included within AEM.
>
>The [ActivityMap plugin provided by Adobe Analytics](https://experienceleague.adobe.com/docs/analytics/analyze/activity-map/getting-started/get-started-users/activitymap-install.html) should now be used.

## Configuring for the Activity Map {#configuring-for-the-activity-map}

>[!CAUTION]
>
>Due to security changes within the Adobe Analytics API, it is no longer possible to use the version of Activity Map that is included within AEM.
>
>The [ActivityMap plugin provided by Adobe Analytics](https://experienceleague.adobe.com/docs/analytics/analyze/activity-map/getting-started/get-started-users/activitymap-install.html) should now be used.

## Creating an Adobe Analytics Framework {#creating-a-adobe-analytics-framework}

For the Report Suite ID (RSID) that you are using, you can control which server instances (author, publish, or both) contribute data to the Report Suite:

* **All**: Information from both the author and the publish instance populates the Report Suite.
* **Author**: Only information from the author instance populates the Report Suite.
* **Publish**: Only information from the publish instance populates the Report Suite.

>[!NOTE]
>
>Selecting the type of server instance does not restrict calls to Adobe Analytics, it merely controls which calls include the RSID.
>
>For example, a framework is configured to use the *diiweretail* report suite and author is the selected server instance. When pages are published along with the framework, calls are still made to Adobe Analytics, however these calls do not contain the RSID. Only calls from the author instance include the RSID.

1. Using **Navigation**, select **Tools**, **Cloud Services**, then **Legacy Cloud Services**.
1. Scroll to **Adobe Analytics** and select **Show Configurations**.
1. Click the **&#91;+&#93;** link next to your Adobe Analytics configuration.

1. In the **Create Framework** dialog:

    * Specify a **Title**.
    * Optionally you can specify the **Name**, for the node that stores the framework details in the repository.
    * Select **Adobe Analytics Framework**

   And click **Create**.

   The framework opens for editing.

1. In the **Report Suites** section of the side pod (right side of main panel), click **Add Item**. Then use the drop-down to select the Report Suite ID (for example, `geometrixxauth`) with which the framework interacts.

   >[!NOTE]
   >
   >The content finder on the left is populated with Adobe Analytics variables (SiteCatalyst Variables) when you select a Report Suite ID.

1. To select the server instances that you want to send information to the Report Suite, use the **Run Mode** drop down (next to the Report Suite ID).

   ![aa-framework-01](assets/aa-framework-01.png)

1. To make the framework available on the publish instance of your site, on the **Page** tab of sidekick, click **Activate Framework.**

### Configuring Server Settings for Adobe Analytics {#configuring-server-settings-for-adobe-analytics}

The framework system lets you change the server settings within each Adobe Analytics framework.

>[!CAUTION]
>
>These settings determine where your data is sent and how, so it is imperative that you *do not tamper with these settings* and let your Adobe Analytics representative set it up instead.

Start by opening the panel. Press the downward arrow next to **Servers**:

![server_001](assets/server_001.png)

* **Tracking Server**

    * contains the URL used to send Adobe Analytics calls

        * `cname` - defaults to the Adobe Analytics account's *Company name*
        * `d1` - corresponds to the data center that the information is sent to (either `d1`, `d2`, or `d3`)
        * `sc.omtrdc.net` - domain name

* **Secure Tracking Server**

    * Has the same segments as the Tracking server
    * Used for sending data from secure pages (`https://`)

* **Visitor Namespace**

    * The namespace determines the first part of the tracking URL.
    * For example, changing the namespace to **CNAME** causes the calls made to Adobe Analytics to look like **CNAME.d1.omtrdc.net** instead of the default.

## Associating a Page with an Adobe Analytics Framework {#associating-a-page-with-a-adobe-analytics-framework}

When a page is associated with an Adobe Analytics framework, the page sends data to Adobe Analytics when the page loads. Variables that the page populates are mapped and retrieved from Adobe Analytics variables in the framework. For example, page views are retrieved from Adobe Analytics.

Descendents of the page inherit the association with the framework. For example, when you associate the root page of your site with a framework, all pages of the site are associated with the framework.

1. From the **Sites** console, select the page you wish to set up with tracking.
1. Open the **[Page Properties](/help/sites-authoring/editing-page-properties.md)**, either directly from the console, or the page editor.
1. Open the** Cloud Services** tab.

1. Use the **Add Configuration** drop down to select **Adobe Analytics** from the available options. If inheritance is place, disable that before the selector becomes available.

1. The drop-down selector for **Adobe Analytics** is appended to the options available. Select the required framework configuration.

1. Select **Save & Close**.
1. To activate the page and any connected configurations/files, **[Publish](/help/sites-authoring/publishing-pages.md)** the page.
1. The final step is to visit the page on the publish instance and search for a keyword (for example, aubergine) using the **Search** component.
1. You can then check the calls made to Adobe Analytics using an appropriate tool; for example, [Adobe Experience Cloud Debugger](https://experienceleague.adobe.com/docs/experience-platform/debugger/home.html).
1. Using the example provided, the call should contain the value entered (that is, aubergine) in eVar7 and the events list should contain event3.

### Page Views {#page-views}

When a page is associated with an Adobe Analytics framework, the number of page views can be shown in the List view of the Sites console.

See [Seeing Page Analytics Data](/help/sites-authoring/page-analytics-using.md) for further details.

### Configuring the Import Interval {#configuring-the-import-interval}

Configure the appropriate instance of the **Adobe AEM Managed Polling Configuration** service:

* **Poll Interval**:
  The interval, in seconds, at which the service retrieves page view data from Adobe Analytics.
  The default interval is 43200000 ms (12 hours).

* **Enable**:
  Enable or disable the service. By default, the service is enabled.

To configure this OSGi service, you can either use the [Web Console](/help/sites-deploying/configuring-osgi.md#osgi-configuration-with-the-web-console) or an [osgiConfig node in the repository](/help/sites-deploying/configuring-osgi.md#osgi-configuration-in-the-repository) (the service PID is `com.day.cq.polling.importer.impl.ManagedPollConfigImpl`).

## Editing Adobe Analytics Configurations and/or Frameworks {#editing-adobe-analytics-configurations-and-or-frameworks}

As when creating an Adobe Analytics configuration or framework, navigate to the (legacy) **Cloud Services** screen. Select **Show Configurations**, then click the link to the specific configuration you want to update.

When editing an Adobe Analytics configuration, press **Edit** when on the configuration page itself to open the **Edit Component** dialog.

## Deleting Adobe Analytics Frameworks {#deleting-adobe-analytics-frameworks}

To delete an Adobe Analytics framework, first [open it for editing](#editing-adobe-analytics-configurations-and-or-frameworks).

Then select **Delete Framework** from the **Page** tab of the sidekick.

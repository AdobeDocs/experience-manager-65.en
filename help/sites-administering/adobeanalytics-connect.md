---
title: Connecting to Adobe Analytics and Creating Frameworks
seo-title: Connecting to Adobe Analytics and Creating Frameworks
description: Learn about connecting AEM to SiteCatalyst and creating frameworks.
seo-description: Learn about connecting AEM to SiteCatalyst and creating frameworks.
uuid: 04325409-435c-4394-9ab7-c9022e19e085
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: integration
content-type: reference
discoiquuid: 88dbfd34-1f8d-47a2-893d-20faf1a80f95
---

# Connecting to Adobe Analytics and Creating Frameworks{#connecting-to-adobe-analytics-and-creating-frameworks}

To track web data from your AEM pages in Adobe Analytics, create a Adobe Analytics Cloud Services configuration and a Adobe Analytics framework:

* **Adobe Analytics Configuration:** The information about your Adobe Analytics account. The Adobe Analytics configuration enables AEM to connect to Adobe Analytics. Create an Adobe Analytics configuration for each account that you use.
* **Adobe Analytics Framework:** A set of mappings between Adobe Analytics report suite properties and CQ variables. Use a framework to configure how your website data populates your Adobe Analytics reports. Frameworks are associated with a Adobe Analytics configuration. You can create multiple frameworks for each configuration.

When you assocate a web page with a framework, the framework performs tracking for that page and the descendents of that page. Page views can then be retrieved from Adobe Analytics and displayed in the Sites console.

## Prerequisites {#prerequisites}

### Adobe Analytics Account {#adobe-analytics-account}

To track AEM data in Adobe Analytics, you must have a valid Adobe Marketing Cloud Adobe Analytics account.

The Adobe Analytics account needs to:

* Have **Administrator** privileges
* Be assigned to the **Web Service Access** user group.

>[!CAUTION]
>
>Providing **Administrator** privileges (within Adobe Analytics) is not enough to allow a user to connect from AEM to Adobe Analytics. The account must also have **Web Service Access** privileges.

![chlimage_1-316](assets/chlimage_1-316.png)

Before proceeding, ensure your credentials allow you to log in to Adobe Analytics. Via either:

* [https://marketing.adobe.com](https://marketing.adobe.com)  

* [https://sc.omniture.com/login/](https://sc.omniture.com/login/)

### Configuring AEM to Use Your Adobe Analytics Data Centers {#configuring-aem-to-use-your-adobe-analytics-data-centers}

Adobe Analytics [data centers](https://developer.omniture.com/en_US/content_page/concepts-terminology/c-how-is-data-stored) collect, process and store data associated with your Adobe Analytics report suite. You must configure AEM to use the data center that hosts your Adobe Analytics report suite. The following table lists the available data centers and their URL.

| Data Center |URL |
|---|---|
| San Jose |https://api.omniture.com/admin/1.4/rest/ |
| Dallas |https://api2.omniture.com/admin/1.4/rest/ |
| London |https://api3.omniture.com/admin/1.4/rest/ |
| Singapore |https://api4.omniture.com/admin/1.4/rest/ |
| Oregon |https://api5.omniture.com/admin/1.4/rest/ |

AEM uses the San Jose (https://api.omniture.com/admin/1.4/rest/) data center by default.

Use the [Web Console to configure the OSGi bundle](/help/sites-deploying/configuring-osgi.md#osgi-configuration-with-the-web-console) **Adobe AEM Analytics HTTP Client**. Add the **Data Center URL** for the data center that hosts a report suite for which your AEM pages collect data. 

![aa-07](assets/aa-07.png)

1. Open the Web console in your web browser. ([http://localhost:4502/system/console/configMgr](http://localhost:4502/system/console/configMgr))
1. Enter your credentials to access the console.

   >[!NOTE]
   >
   >Contact you site administrator to find out if you have access to this console.

1. Select the Configuration item named **Adobe AEM Analytics HTTP Client**.
1. To add the URL for a data center, press the + button next to the **Data Center URLs** list, and type the URL in the box.  

1. To remove a URL from the list, click the - button next to the URL.
1. Click Save.

## Configuring the Connection to Adobe Analytics {#configuring-the-connection-to-adobe-analytics}

Create a Adobe Analytics configuration so that AEM can authenticate with the Adobe Analytics server. To create the configuration you provide the credentials for your Adobe Analytics account.

1. Using **Navigation**, select **Tools**, **Cloud Services**, then **Legacy Cloud Services**.
1. Scroll to **Adobe Analytics**:

    * If **Configure now** is shown, select this link.
    * If **Show Configurations** is shown, select this link and then click **[+]** next to **Available Configurations**.

1. In the **Create Configurations** dialog:

    * Specify a title. 
    * Optionally, specify a **Name** for the node used to store the configuration in the repostory. 
    * Do not change the Parent Configuration property; for example, **Adobe Analytics Configuration**.

1. Select **Create**.

   >[!NOTE]
   >
   >The Shared Secret can be seen in the **Account Information** in Adobe Analytics.

   When the **Edit Component** dialog opens, specify values for the following properties:

    * **Company**: your company's name as featured on Adobe Analytics
    * **Username**: the name used to log in to Adobe Analytics
    * **Shared Secret**: the Adobe Analytics shared secret for the above account
    * **Data Center**: The location of the Adobe Analytics data center that your account is associated with. 
    * **Do not add tracking tag to page**: Select this option when you are using Adobe Analytics reports in the [Content Insights](/help/sites-authoring/content-insights.md) feature, and you are also using [Dynamic Tag Management](/help/sites-administering/dtm.md) (DTM) with AEM, and the DTM web property has the Adobe Analytics tool installed. In this case, selecting this option prevents two instances of the tracking code being added to pages.
    * **Do not track the page load event**: as appropriate 
    * **Use App Measurement**: as appropriate 
    * **Use ClientContext**: as appropriate 
    * **Additional context data**: as appropriate 
    * **Segment**: as appropriate

   Please contact your Adobe Analytics representative to confirm any details and make sure you fill in these credentials correctly.

1. Click **Connect to Adobe Analytics**. When the message that indicates that the connection was successful appears, click **OK**.
1. On the dialog, click **OK**.

## Configuring for the Activity Map {#configuring-for-the-activity-map}

To be able to see and use the [Activity Map in the page editor](/help/sites-authoring/pa-using.md#analytics-visible-from-the-page-editor-activity-map), you need to configure:

* Users (for both editing and/or configuring) need to be in the group: 

  `analytics-administrators`  

  as there is a restriction on node `/libs/cq/activitymap/content/settings`

    * The settings are loaded via `/mnt/override/libs/cq/activitymap/content/settings` so you can override this group restriction.

* The page in question needs to be published.  
* Analytics Integration

    * Use AppMeasurement set to `true` 
    * Report Suite configured to use the `all` run mode

* DTM Integration

    * Use `AppMeasurement.js` 
    * `Include Production code on Author` set to true

>[!NOTE]
>
>Since `ActivityMap` inspects the tag (report suite) on the page to fetch report data (and publishing data is a key aim) `ActivityMap` is only supported if the report suite on author and publish is the same.  
>  
>`ActivityMap` cannot show data from report suites other than the ones used for tracking on the page.

>[!NOTE]
>
>For details see also:
>
>* [Enable Activity Map](https://marketing.adobe.com/resources/help/en_US/analytics/activitymap/activitymap-enable.html) from the Analytics documentation.  
>
>* The videos at [Set up Adobe Anslytics Activity Map with AEM Sites](https://helpx.adobe.com/experience-manager/kt/sites/using/activity-map-feature-video-setup.html).  
>

## Creating a Adobe Analytics Framework {#creating-a-adobe-analytics-framework}

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
1. Scroll to **Adobe Analytics** and click **[+]** next to **Available Configurations**.
1. Click the **[+]** link next to your Adobe Analytics configuration.  

1. In the **Create Framework** dialog:

    * Specify a **Title**.
    * Optionally you can specify the **Name**, for the node that stores the framework details in the repository.
    * Select **Adobe Analytics Framework**

   And click **Create**.

   The framework opens for editing.

1. In the **Report Suites** section of the side pod (right side of main panel), click **Add Item**. Then use the drop-down to select the Report Suite ID (for example, `geometrixxauth`) with which the framework will interact.

   >[!NOTE]
   >
   >The content finder on the left is populated with Adobe Analytics variables (SiteCatalyst Variables) when you select a Report Suite ID.

1. Then use the **Run Mode** drop down (next to the Report Suite ID) to select the server instances that you want to send information to the Report Suite.

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

        * cname - defaults to the Adobe Analytics account's *Company name *
        * d1 - corresponds to the data center the information will be sent to (can be either d1, d2 or d3)
        * sc.omtrdc.net - domain name

* **Secure Tracking Server**

    * Has the same segments as the Tracking server
    * This is used for sending data from secure pages (https://)

* **Visitor Namespace**

    * The namespace determines the first part of the tracking URL.
    * e.g. changing the namespace to **CNAME** will cause the calls made to Adobe Analytics to look like **CNAME.d1.omtrdc.net** instead of the default.

## Associating a Page with a Adobe Analytics Framework {#associating-a-page-with-a-adobe-analytics-framework}

When a page is associated with an Adobe Analytics framework, the page sends data to Adobe Analytics when the page loads. Variables that the page populates are mapped and retrieved from Adobe Analytics variables in the framework. For example, page views are retrieved from Adobe Analytics.

Descendents of the page inherit the association with the framework. For example, when you associate the root page of your site with a framework, all pages of the site are associated with the framework.

1. From the **Sites** console, select the page you wish to set up with tracking. 
1. Open the **[Page Properties](/help/sites-authoring/editing-page-properties.md)**, either directly from the console, or the page editor.
1. Open the **Cloud Services** tab.  

1. Use the **Add Configuration** drop down to select **Adobe Analytics** from the available options. If inheritance is place you need to disable that before the selector becomes available.

1. The drop down selector for **Adobe Analytics** will be appended to the options available. Use this to select the required framework configuration.  

1. Select **Save & Close**.
1. **[Publish](/help/sites-authoring/publishing-pages.md)** the page to activate the page and any connected configurations/files.
1. The final step is to visit the page on the publish instance and search for a keyword (e.g. aubergine) using the **Search** component.
1. You can then check the calls made to Adobe Analytics using an appropriate tool; for example, [Adobe Marketing Cloud Debugger](https://marketing.adobe.com/resources/help/en_US/sc/implement/debugger_install.html).
1. Using the example provided, the call should contain the value entered (i.e. aubergine) in eVar7 and the events list should contain event3.

### Page Views {#page-views}

When a page is associated with a Adobe Analytics framework, the number of page views can be shown in the List view of the Sites console.

See [Seeing Page Analytics Data](/help/sites-authoring/pa-using.md) for further details.

### Configuring the Import Interval {#configuring-the-import-interval}

Configure the appropriate instance of the **Adobe AEM Managed Polling Configuration** service:

* **Poll Interval**: 

  The interval, in seconds, at which the service retrieves page view data from Adobe Analytics. 

  The default interval is 43200000 ms (12 hours).

* **Enable**: 

  Enable or disable the service. By default, the service is enabled.

To configure this OSGi service, you can either use the [Web Console](/help/sites-deploying/configuring-osgi.md#osgi-configuration-with-the-web-console) or an [osgiConfig node in the repository](/help/sites-deploying/configuring-osgi.md#osgi-configuration-in-the-repository) (the service PID is `com.day.cq.polling.importer.impl.ManagedPollConfigImpl`).  

## Editing Adobe Analytics Configurations and/or Frameworks {#editing-adobe-analytics-configurations-and-or-frameworks}

As when creating an Adobe Analytics configuration or framework, navigate to the (legacy) **Cloud Services** screen. Select **Show Configurations**, then click on the link to the specific configuration you want to update.

When editing an Adobe Analytics configuration, you also need to press the **Edit** button when on the configuration page itself in order to open the **Edit Component** dialog.

## Deleting Adobe Analytics Frameworks {#deleting-adobe-analytics-frameworks}

To delete an Adobe Analytics framework, first [open it for editing](#editing-adobe-analytics-configurations-and-or-frameworks).

Then select **Delete Framework** from the **Page** tab of the sidekick.  


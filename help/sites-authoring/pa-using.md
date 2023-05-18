---
title: Seeing page analytics data to gauge effectiveness of page content

description: Use page analytics data to gauge the effectiveness of their page content

uuid: 8dda89be-13e3-4a13-9a44-0213ca66ed9c
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: site-features
discoiquuid: 42d2195a-1327-45c0-a14c-1cf5ca196cfc
exl-id: 554b10c2-6157-4821-a6a7-f2fb6666cdff
---
# Seeing Page Analytics Data{#seeing-page-analytics-data}

Use page analytics data to gauge the effectiveness of the page content.

## Analytics visible from the Console {#analytics-visible-from-the-console}

![aa-10](assets/aa-10.png)

Page analytics data is displayed in [List View](/help/sites-authoring/basic-handling.md#list-view) of the Sites console. When the pages are displayed in list format, the following columns are available by default:

* Page Views
* Unique Visitors
* Time on Page

Each column shows a value for the current reporting period, and also indicates whether the value has increased or decreased since the previous reporting period. The data that you see is updated every 12 hours.

>[!NOTE]
>
>To change the update period, [configure the import interval](/help/sites-administering/adobeanalytics-connect.md#configuring-the-import-interval).

1. Open the **Sites** console; for example [http://localhost:4502/sites.html/content](http://localhost:4502/sites.html/content)
1. In the far right of the toolbar, (upper right corner), click or tap the icon to select **List View** (the icon shown will depend on the [current view](/help/sites-authoring/basic-handling.md#viewing-and-selecting-resources)).

1. Again, in the far right of the toolbar, (upper right corner), click or tap the icon then select **View Settings**. The **Configure Columns** dialog will open. Make any changes required and confirm with **Update**.

   ![aa-04](assets/aa-04.png)

### Selecting the Reporting Period {#selecting-the-reporting-period}

Select the reporting period for which Analytics data appears on the Sites console:

* Last 30 Days Data
* Last 90 Days Data
* This Year's Data

The current reporting period appears on the toolbar of the Sites console (right of the top toolbar). Use the drop down to select the required reporting period.
![aa-05](assets/aa-05.png)

### Configuring Available Data Columns {#configuring-available-data-columns}

Members of the analytics-administrators user group can configure the Sites console to enable authors to see extra Analytics columns.

>[!NOTE]
>
>When a tree of pages contains children that are associated with different Adobe Analytics cloud configurations, you cannot configure available data columns for the pages.

1. In List View, use the view selectors (right of toolbar), select **View Settings** and then **Add Custom Analytics Data**.

   ![aa-15](assets/aa-15.png)

1. Select the metrics that you want to expose to authors in the Sites console, and then click **Add**.

   The columns that appear are retrieved from Adobe Analytics.

   ![aa-16](assets/aa-16.png)

### Opening Content Insights from Sites {#opening-content-insights-from-sites}

Open [Content Insight](/help/sites-authoring/content-insights.md) from the Sites console to further investigate page effectiveness.

1. In the Sites console, select the page for which you want to see Content Insights.
1. On the tool bar, click the Analytics and Recommendations icon.

   ![](do-not-localize/chlimage_1-16a.png)

## Analytics visible from the Page Editor (Activity Map) {#analytics-visible-from-the-page-editor-activity-map}

>[!NOTE]
>
>This will be shown if the [Activity Map has been configured](/help/sites-administering/adobeanalytics-connect.md#configuring-for-the-activity-map) for your website.

>[!NOTE]
>
>Data for the Activity Map is taken from Adobe Analytics.

When your website has been [configured for Adobe Analytics](/help/sites-administering/adobeanalytics-connect.md), you can use the [mode Activity Map](/help/sites-authoring/author-environment-tools.md#page-modes) to view relevant data. For example:

![aa-07](assets/aa-07.png)

### Accessing the Activity Map {#accessing-the-activity-map}

After selecting the [Activity Map](/help/sites-authoring/author-environment-tools.md#page-modes) mode, you will be requested to enter your Adobe Analytics credentials.

![aa-03](assets/aa-03.png)

The **Analytics** floating toolbar is shown; here you can:

* change the toolbar format using the double arrows (**&gt;&gt;**)
* Toggle Page Details (eye icon)
* Configure the Activity Map Settings ( cog icon)
* Select the analytics to show (various drop-down selectors)
* Quit the Activity Map, and close the toolbar (x)

![aa-09](assets/aa-09.png)

### Selecting the Analytics to Show {#selecting-the-analytics-to-show}

You can select the analytical data to be shown, and how it should be displayed, using the various criteria:

* **Standard**/**Live**

* event type
* user group
* **Bubbles**/**Gradient**/**Gainers & Losers**/**Off**

* period to be shown

![aa-13](assets/aa-13.png)

### Configuring the Activity Map {#configuring-the-activity-map}

Use the **Show Settings** icon to open the **Activity Map Settings** dialog.

![aa-04-1](assets/aa-04-1.png)

The **Activity Map Settings** dialog provides a range of options on three tabs:

![aa-06](assets/aa-06.png)

* General

    * Report Suite
    * Page Name
    * Language
    * Label Overlays with
    * Label Font Size
    * Gradient Color
    * Bubble Color
    * Color Gradient Based On
    * Gradient Transparency

* Standard

    * Display (type and number of links)
    * Hide overlays for links that received no hits

* Live

    * Display Top (Gainers or Losers
    * Exclude bottom %
    * Auto Update (data and period)

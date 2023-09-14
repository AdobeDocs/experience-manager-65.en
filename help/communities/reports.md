---
title: Reports Console
description: Learn how to access various reports that may be accessed in several ways from the Adobe Experience Manager author environment.
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
docset: aem65
role: Admin
exl-id: 2aff2ffe-ba6f-4cc9-a126-40fc2a1161e2
---
# Reports Console {#reports-console}

## Overview {#overview}

For AEM Communities, there are various reports that may be accessed in several ways from the author environment.

In general, the various reports are:

* [Views Report](#views-report) 

  Provides a chart of views of content by community members and site visitors for any community site.

* [Posts Report](#posts-report) 

  Provides a chart of various types of posts by community members to any community site.

Tabular reports can be exported in .csv format for subsequent processing.

## Reporting Consoles {#reporting-consoles}

### Reports for Community Sites {#reports-for-community-sites}

* From global navigation: **[!UICONTROL Navigation]** > **[!UICONTROL Communities]** >  **[!UICONTROL Reports]**

* Choose from:

  * **[!UICONTROL Assignments Report]**

    * Generate a report for selected Community Site, User or Group, and Assignment.

  * **[!UICONTROL Posts Report]**

    * Generate a report for selected Community Site, Content Type, and Time Period.

  * **[!UICONTROL Views Report]**

    * generate a report for selected Community Site, Content Type, and Time Period.

![reports](assets/reports1.png)

## Views Report {#views-report}

The Views console allows reports to be generated on page views by community features for a given time period.

![view-report](assets/view-report.png)

Select the criteria for the report:

* **[!UICONTROL Site]**

  Select a community site.

* **[!UICONTROL Content Type]**

  May choose All content or select one of the features that are present on the site.

* **[!UICONTROL Time frame]**

  Select one of:

  * Last 7 days
  * Last 30 days
  * Last 90 days
  * Last year

Select **[!UICONTROL Generate]** to create the report.

![generate-views](assets/generate-views.png)

## Posts Report {#posts-report}

The Posts console allows reports to be generated on the number of posts to community features for a given time period.

![posts-report](assets/posts-report.png)

Select the criteria for the report:

* **[!UICONTROL Site]**

  Select a community site.

* **[!UICONTROL Content Type]**

  May choose All content or select one of the features that are present on the site.

* **[!UICONTROL Time frame]**

  Select one of:

  * Last 7 days
  * Last 30 days
  * Last 90 days
  * Last year

Select **[!UICONTROL Generate]** to create the report.

![generate-report](assets/generate-posts-report.png)

## Troubleshooting {#troubleshooting}

### No community sites listed {#no-community-sites-listed}

If no community sites are listed, ensure that Adobe Analytics has been enabled for a site. If choosing reports on assignments, ensure that the assignments function is in the community site's structure.

### Reports do not show in AEM Author instance {#reports-do-not-show-in-aem-author-instance}

If reports do not show up in the AEM Author instance check for the customizations, such as URL mapping on the Publish instance. If URL mapping is done only on the AEM Publish instance of the communities site, ensure that the same has been configured in the AEM Author instance in **Site Trend Report Social Component Factory** configuration.

![URL mapping on AEM Author](assets/sitetrend.png)

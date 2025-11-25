---
title: Content Insight

description: Content Insight provides information about page performance using web analytics and SEO recommendation


contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: site-features

exl-id: 187f3cde-a0db-4c02-9e8b-08272987a67d
solution: Experience Manager, Experience Manager Sites
feature: Authoring
role: User,Admin,Developer
---
# Content Insight{#content-insight}

Content Insight provides information about page performance using web analytics and SEO recommendations. Use Content Insight to make decisions about how to modify pages, or to learn how previous changes have changed performance. For every page that you author, you can open Content Insight to analyse the page.

![chlimage_1-311](assets/chlimage_1-311.png)

The layout of the Content Insight page changes to suit the screen dimensions and orientation of the device that you are using.

## Report Data

The Content Insight page includes reports that use Adobe SiteCatalyst, Adobe Target, Adobe Social, and BrightEdge data:

* SiteCatalyst: Reports for the following metrics are available:

    * Page views
    * Average time spent on page
    * Sources

* Target: Reports on campaign activity for which your page includes offers.
* BrightEdge: Reports on the page features that improve the visibility of the page to search engines, and recommends features that should be implemented.

See [Opening Analytics and Recommendations for a Page](/help/sites-authoring/ci-analyze.md#opening-analytics-and-recommendations-for-a-page).

## Reporting Period

Reports show data for a period of time that you control. When you adjust the reporting period, the reports automatically refresh with data for that period. Visual cues indicate the time when page versions changed, so that you can compare the performance of each version.

>[!NOTE]
>
>The timeline for the Content Insight dashboard is in `GMT`.

You can also specify the granularity of the reported data, for example, you can see daily, weekly, monthly, or yearly data.

See [Changing the Reporting Period](/help/sites-authoring/ci-analyze.md#changing-the-reporting-period).

>[!NOTE]
>
>The Content Insights reports require that your administrator has integrated AEM with SiteCatalyst, Target, and BrightEdge. See [Integrating with SightCatalyst](/help/sites-administering/adobeanalytics.md), [Integrating with Adobe Target](/help/sites-administering/target.md), and [Integrating with BrightEdge](/help/sites-administering/brightedge.md).

## The Views Report {#the-views-report}

The Views report includes the following features for evaluating page traffic:

* The total number of views for a page for the reporting period.
* A graph of the number of views across the reporting period:

    * Total views.
    * Unique vistors.

![chlimage_1-312](assets/chlimage_1-312.png)

## The Page Average Engaged Report {#the-page-average-engaged-report}

The Page Average Engaged report includes the following features for evaluating page effectiveness:

* The average time that the page remains open for the entire reporting period.
* A graph of the average length of a page view across the reporting period.

![chlimage_1-313](assets/chlimage_1-313.png)

## The Sources Report {#the-sources-report}

The Sources report indicates how users navigated to the page, for example, from search engine results or using the known URL.

![chlimage_1-314](assets/chlimage_1-314.png)

## The Bounces Report {#the-bounces-report}

The Bounces report includes a graph that shows the number of bounces that have occurred for a page over the selected reporting period.

![chlimage_1-315](assets/chlimage_1-315.png)

## The Campaign Activity Report {#the-campaign-activity-report}

For each campaign for which the page is active, a report appears named *Campaign Name* Activity. The report shows page impressions and conversions for each segment for which an offer is provided.

![chlimage_1-316](assets/chlimage_1-316.png)

## The SEO Recommendations Report {#the-seo-recommendations-report}

The SEO Recommendations report contains the results of the BrightEdge analysis for the page. The report is a checklist of page features that indicates which features the page does and does not include for maximizing the findability using search engines.

The report enables you to create tasks so that improvements are made to improve page findability. Recommendations indicate that tasks have been created for implementing the recommendation. See [Assigning Tasks for SEO Recommendations](/help/sites-authoring/ci-analyze.md#assigning-tasks-for-seo-recommendations).

![chlimage_1-317](assets/chlimage_1-317.png)

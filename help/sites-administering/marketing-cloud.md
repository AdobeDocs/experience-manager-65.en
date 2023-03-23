---
title: Integrating with the Adobe Experience Cloud
description: Learn how to integrate Adobe Experience Manager with Adobe Experience Cloud.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: integration
content-type: reference
exl-id: ba518290-dd82-44dc-ae7c-c8152df89179
---
# Integrating with the Adobe Experience Cloud{#integrating-with-the-adobe-marketing-cloud}

The [Adobe Experience Cloud](https://business.adobe.com/products/marketing-cloud/main.html), includes powerful web analytics and website optimization products that deliver actionable, real-time data and insights to drive successful online initiatives. It offers an integrated and open platform for online business optimization. The Cloud consists of integrated applications to collect and unleash the power of customer insight to optimize customer acquisition, conversion, and retention efforts as well as the creation and distribution of content.

With Adobe Experience Manager (AEM), you can seamlessly integrate with the following products of the Adobe Experience Cloud:

* Adobe Analytics provides marketers with actionable, real-time intelligence about online strategies and marketing initiatives.
* Adobe Target gives marketers the ability to continually make their online content more relevant to their customers — yielding greater conversion.
* Adobe Dynamic Media Classic automates media management, streamlines web publishing, and enhances web experiences, all in a hosted environment.
* Adobe Dynamic Tag Management gives marketers intuitive tools to quickly and easily manage an unlimited number of Adobe and third-party tags.
<!-- Search&Promote is end of life as of September 1, 2022 * Adobe Search&Promote gives marketers the ability to control and optimize the search results on their sites. -->
* Adobe Campaign lets you manage email delivery content directly in Adobe Experience Manager.

In addition, you can [integrate AEM with Creative Cloud](/help/assets/aem-cc-integration-best-practices.md) and with [third-party services](/help/sites-administering/third-party-services.md).

## Integrating with Adobe Analytics {#integrating-with-adobe-analytics}

[Adobe Analytics](https://business.adobe.com/products/analytics/adobe-analytics.html) is the industry-leading solution that provides digital marketers with one place to measure, analyze, and optimize integrated data from all online initiatives across multiple marketing channels. It provides marketers with actionable, real-time web analytics intelligence about digital strategies and marketing initiatives. Adobe Analytics helps marketers quickly identify the most profitable paths through a website, segment traffic to spot high-value web visitors, determine where visitors are navigating away from the site, and identify critical success metrics for online marketing campaigns.

You can use Adobe Analytics to analyze data from your sites.

Integrating with Adobe Analytics allows you to do the following:

* Enable Analytics user tracking.
* Map your run modes (for example author, publish) to different report suites.
* Submit Client Context variables as conversion variables or traffic properties.
* Use predefined variable mappings.
* Configure complete site sections at once.
* Track custom-defined events.

For information about integrating AEM with Analytics, see [Integrating with Adobe Analytics](/help/sites-administering/adobeanalytics.md).

You can also use the [Opt-in wizard](/help/sites-administering/opt-in.md) to easily perform the integration.

## Integrating with Adobe Target {#integrating-with-adobe-target}

[Adobe Target](https://business.adobe.com/products/target/adobe-target.html) is used by marketers to design and execute online tests, create on-the-fly audience segments (based on behavior) and automate the targeting of content and online experiences.

Online consumers today have constantly evolving needs and expect relevant, even personalized content from the wide variety of sites and content sources they can choose from. To engage an online audience, it is critical that online marketers quickly identify which offers and content are relevant and compelling to their audiences. Armed with this knowledge, marketers need the capability to continually evolve their sites and to target the appropriate content to different audiences.

[Integrating with Adobe Target](/help/sites-administering/target.md) explains how to integrate your site with Target.

You can also use the [Opt-in wizard](/help/sites-administering/opt-in.md) to easily perform the integration.

## Opting In to Analytics and Target {#opting-in-to-analytics-and-target}

AEM provides a simple opt-in procedure to integrate with Adobe Analytics and Adobe Target. When you log in as an administrator and visit the Projects console, you are presented with an opt-in wizard.

![chlimage_1-107](assets/chlimage_1-107a.png)

Opt into the integration with Analytics and/or Target to enable the use of their page tracking and analysis capabilities, and personalization capabilities. When you opt in, provide your user account information and specify the pages that are tracked.

For more information, see [Opting Into Adobe Analytics and Adobe Target.](/help/sites-administering/opt-in.md)

## Integrating with Adobe Dynamic Media Classic {#integrating-with-scene}

Adobe Dynamic Media Classic is a hosted solution for publishing, managing, enhancing, and delivering dynamic marketing assets and rich visual merchandising to web, mobile, email, social media, Internet-connected displays, and print.

In Adobe Experience Manager, you can publish digital assets directly from Adobe Experience Manager to Dynamic Media Classic and you can publish digital assets from Dynamic Media Classic to Adobe Experience Manager.

In addition, you can view Adobe Experience Manager assets published in Dynamic Media Classic in various viewers such as Basic Zoom and Video.

For more information on how Adobe Experience Manager integrates with Dynamic Media Classic, see the [Integrating with Dynamic Media Classic](/help/sites-administering/scene7.md) documentation.

## Integrating with Adobe Dynamic Tag Management {#integrating-with-adobe-dynamic-tag-management}

[Adobe Dynamic Tag Management](https://business.adobe.com/products/experience-platform/adobe-experience-platform.html) gives marketers intuitive tools to quickly and easily manage an unlimited number of Adobe and third-party tags. You have more control and flexibility to optimize virtually anything online, all while reducing the dependence on IT resources.

[Integrate Adobe Dynamic Tag Management](/help/sites-administering/dtm.md) with AEM so that you can use your Dynamic Tag Management web properties to track AEM sites.

## Integrating with Adobe Audience Manager {#integrating-with-adobe-audience-manager}

The Audience Manager integration has been removed in AEM 6.3.

<!-- Search&Promote is end of life as of September 1, 2022 ## Integrating with Search&Promote {#integrating-with-search-promote} -->

<!-- Search&Promote is end of life as of September 1, 2022 Adobe Search&Promote enables marketers to optimizehow visitors browse, find, compare, and select relevant products and content on web and mobile sites. Businesses can easily promote priority items based on business objectives and visitor intent, as well as automate merchandising and promotions activity via KPI-based triggers or metrics. -->

<!-- Search&Promote is end of life as of September 1, 2022 Adobe Search&Promote is a reliable and scalable hosted site search application, capable of scaling to millions of pages or products, for heavily visited online businesses ranging from retail to news sites. It offers unprecedented levels of marketer control and metrics-based relevance. -->

<!-- Search&Promote is end of life as of September 1, 2022 For information about integrating AEM and Search&Promote, see [Integrating with Adobe Search&Promote](/help/sites-administering/search-and-promote.md). -->

## Integrating with Adobe Campaign {#integrating-with-adobe-campaign}

[Adobe Campaign](https://business.adobe.com/products/campaign/adobe-campaign.html) lets you manage email delivery content directly in Adobe Experience Manager.

For information on how AEM integrates with Adobe Campaign, see [Integrating with Adobe Campaign](/help/sites-administering/campaignstandard.md).
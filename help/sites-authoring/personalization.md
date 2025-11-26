---
title: Personalization and Content Targeting
description: Learn how Adobe Experience Manager 6.5 can create personalized content.
exl-id: be34760a-875b-419d-9fa4-2359b314a3b7
solution: Experience Manager, Experience Manager Sites
feature: Authoring,Personalization
role: User,Admin,Developer
---
# Personalization and Content Targeting {#personalization}

## Personalization and Content Targeting {#personalization-and-content-targeting}

AEM provides a framework of tools for authoring targeted content and presenting personalized experiences.

## Targeting mode {#targeting-mode}

[Author targeted content](/help/sites-authoring/content-targeting-touch.md) using Targeting mode of AEM. Targeting mode and the Target component provide tools for creating content for the experiences of your marketing activities.

## Activities {#activities}

Activities define and organize your marketing efforts. Activities comprise the audiences that you are targeting, and the period of time when the targeting is applied.

For example, the We.Retail product catalog includes teasers that focus attention on seasonal products. The Summer Sports activity defines the marketing segments that the teasers target during summer months.

Activities also identify the [targeting engine](/help/sites-authoring/personalization.md#targeting-engine) that your pages use.

Use the [Activites console](/help/sites-authoring/activitylib.md) to create and manage the activities for your brands. You can also create activities as you [author targeted content](/help/sites-authoring/content-targeting-touch.md).

## Experiences {#experiences}

For each activity, you define one or more experiences that identify the audiences that you are targeting. AEM enables you to control the content that comprises each experience.

Audiences are based on marketing segments that are created either in AEM or Adobe Target. When a visitor opens a web page, the page logic determines the audience to which they belong and displays the content that you have created for that audience.

For example, an activity defines experiences for two separate audiences: women over the age of 30 and women under the age of 30. The Women's page of the We.Retail web site displays different products for each experience.

You define experiences for an activity. You can use the [Activities console](/help/sites-authoring/activitylib.md#adding-editing-an-activity-using-the-activities-console) or [Targeting mode](/help/sites-authoring/content-targeting-touch.md#adding-and-removing-experiences-using-targeting-mode) to add experiences to an activity.

## Offers {#offers}

An offer is content that appears at a location on a page for an experience. Use different offers for different experiences to maximize the effectiveness of the content for your audiences.

For example, the Women's page of the We.Retail sample web site can use offers as the teaser image that appears at the top of the page. A different offer is used as the teaser for the Female Over 30 experience and for the Female Under 30 experience.

Use the [Offers console](/help/sites-authoring/offerlib.md) to create offers that you can use in multiple experiences. Create single-use offers or add offers from an offer library when [authoring targeted content](/help/sites-authoring/content-targeting-touch.md).

## Targeting Engine {#targeting-engine}

The targeting engine is the mechanism that drives the logic for targeted content. [Activities](/help/sites-authoring/activitylib.md) are configured to use one of two targeting engines that are available: AEM and Adobe Target.

### AEM {#aem}

AEM provides a built-in targeting engine that processes page requests and determines the content to display. When using the AEM targeting engine, you are limited to using segments that are created in AEM for defining the audiences of your experiences.

### Adobe Target {#adobe-target}

The Adobe Target targeting engine causes information gathered from page visits to be tracked in Adobe Target.

* When using this targeting engine, you use the segments that you import from Adobe Target to define the audiences for your experiences.
* Activities that use the Adobe Target engine are [synchronized to Target](/help/sites-authoring/activitylib.md#synchronizing-activities-with-adobe-target).

You can use this engine when you have [integrated with Adobe Target](/help/sites-administering/opt-in.md).

---
title: AEM Headless Developer Journey
description: AEM Headless CMS Documentation. Start here for a guided journey through the powerful and flexible headless features of AEM, their capabilities, and how to leverage them on your first development project.
exl-id: d14a1e30-dd04-49a8-8cda-27c80a4bb0f5
---
# AEM Headless Developer Journey {#aem-headless-developer-journey}

Start here for a guided journey through the powerful and flexible headless features of AEM, their capabilities, and how to leverage them on your first headless development project. This journey provides you with all the AEM Headless Documentation you need to develop your first headless application.

## Introduction {#introduction}

Headless implementation forgoes page and component management as is traditional in full stack solutions and focuses on the creation of channel-neutral, reusable fragments of content and their cross-channel delivery. It is a modern and dynamic development pattern for implementing digital experiences.

This guide leads you through the most headless implementation topics in AEM so that on completion you:

* Have a full understanding of what headless content delivery is and its benefits.
* Understand AEM's headless features and how they work together to deliver a headless experience.
* Have the ability to take the first steps implementing your first AEM headless project.

## AEM Documentation Journeys {#documentation-journeys}

[A Documentation Journey](/help/journey-documentation/home.md) ties together many different and perhaps complicated topics and features by providing a narrative that helps the reader, who can be new to AEM, understand and solve a business problem from beginning to end, while assuming minimal prior topic or AEM knowledge.

Documentation Journeys are designed around best practices principles, informed by Adobe's latest research, proven implementation experience from Adobe consultants, and feedback from customer projects.

If you want to know how Adobe recommends how to solve headless business cases with AEM, [AEM Headless Journeys](/help/journey-headless/home.md) are where to start.

>[!TIP]
>
> If you prefer to **learn by doing** and are technically inclined, visit the AEM Headless tutorials, which are organized by API and framework and are available in the [Additional Resources section](#additional-resources) at the end of this document.

## Audience {#audience}

This journey is designed for the developer persona, laying out the requirements, steps, and approach of an AEM Headless project from a developer's perspective. The journey defines additional personas with which the developer must interact for a successful project, but the point-of-view for the journey is that of the developer.

The following are the personas that interact in this journey.

|Persona|Description|Role in This Journey|
|---|---|---|
|Developer (target audience)|Has experience developing headless applications which consume content from different sources|Target audience of this journey|
|Content Author|Creates and manages content that is delivered headlessly|Content Authors create content that the developer delivers headlessly.|
|Administrator|Manages the base setup and configuration of AEM|The developer works with the administrator to make configuration changes needed for development.|
|Content Architect|Analyzes the requirements for the data that must be delivered headlessly and defines the structure for this data|Developers work with the content architect to understand the structure of the data and requirements for delivering it headlessly.|

Information in this journey can of course be useful to all personas, but some information may be superfluous to certain roles. Stay tuned for [forthcoming journeys covering additional roles.](/help/journey-documentation/home.md#journeys)

## The Headless Developer Journey {#the-journey}

You will explore many topics in this journey. The following articles give you foundational knowledge of headless in AEM and link out to detailed technical documentation.

Although you can go directly to a particular part of the journey, many concepts build on ones in previous articles. Therefore if you are new to headless in AEM, we recommend that you start at the beginning and progress sequentially.

|#|Article|Description|
|---|---|---|
|0|AEM Headless Developer Journey|This document|
|1|[Learn about CMS Headless Development](learn-about.md)|Learn about Headless Technology and when to use it.|
|2|[Getting Started with AEM Headless as a Cloud Service](getting-started.md)|Learn about AEM Headless prerequisites|
|3|[Path to your first experience using AEM Headless](path-to-first-experience.md)|Setup your development environment and learn how to integrate a simple app with AEM Headless|
|4|[How to model your content](model-your-content.md)|Learn how to model your content structure. Then realize that structure for Adobe Experience Manager (AEM) using Content Fragments Models and Content Fragments, for reuse across channels.|
|5|[How to access your content via AEM delivery APIs](access-your-content.md)|Learn how to use GraphQL queries to access your Content Fragments content.|
|6|[How to update your content via AEM Assets APIs](update-your-content.md)|Learn how to use REST API to access and update your Content Fragments content.|
|7|[How to put it all together - your app and your content in AEM Headless](put-it-all-together.md)|Learn how to take your AEM Project and prepare it for going live with the AEM Headless SDK.|
|8|[How to go live with your headless application](go-live.md)|Learn how to deploy application live and take your local code in Git and move it to Cloud Manager Git for CI/CD pipeline.|
|9|[Optional - How to create single page applications (SPAs) with AEM](create-spa.md)|Once you understand AEM's headless features, explore how to combine headful and headless delivery and learn how you can create editable SPAs using AEM's SPA Editor framework.|

## What's Next {#what-is-next}

You are now ready to get started on your Adobe Headless journey. We encourage you to continue on to the next part of the journey and read the article [Learn about CMS Headless Development.](learn-about.md)

### Choose Your Own Adventure {#choose-your-path}

However, Adobe wants you to succeed as you get started with your AEM Headless project, regardless of your learning style. So please consider these two options.

* If you prefer to continue to **learn about headless concepts and AEM's headless technologies**, you should continue your AEM headless journey as recommended by next reviewing the document [How to Model Your Content as AEM Content Models](model-your-content.md) where you learn how to model your content structure in AEM.
* If you prefer to **learn by doing**, you can jump to the [Getting Started with AEM Headless hands-on tutorial](https://experienceleague.adobe.com/docs/experience-manager-learn/getting-started-with-aem-headless/graphql/multi-step/overview.html) where you will jump directly into AEM Headless development by implementing a simple project to expose AEM headless content.

## Additional Resources {#additional-resources}

Documentation journeys show you how AEM solves a business problem by providing a narrative that guides you through complex, interrelated processes and features. A journey illustrates how multiple features work together to serve a single business need.

As such journeys are designed to stand on their own. However a number of them can be related to each other. Check out these additional journeys for more information on how AEM's powerful features work together.

* [AEM Headless tutorials](https://experienceleague.adobe.com/docs/experience-manager-learn/getting-started-with-aem-headless/overview.html) - If you prefer to learn by doing and are technicall inclined, take our hands-on tutorials organized by API and framework, that explore creating and using applications built on AEM Headless.
* [AEM Headless Translation Journey](/help/journey-headless/translation/overview.md) - This documentation journey gives you a broad understanding of headless technology, how AEM serves headless content, and how you can translate it.
* [Headless Authoring Journey](/help/journey-headless/author/overview.md) - Start here for a guided journey through the powerful and flexible headless features of AEM, their capabilities, and how to model your content on your first headless project.
* [Headless Architect Journey](/help/journey-headless/architect/overview.md) - Start here for an introduction to the powerful, and flexible, headless features of Adobe Experience Manager as a Cloud Service, and how to model content for your project.
* [AEM as a Cloud Service technical documentation](https://experienceleague.adobe.com/docs/experience-manager-cloud-service.html) - If you already have a firm understanding of AEM and headless technologies, you may want to directly consult our in-depth technical docs.

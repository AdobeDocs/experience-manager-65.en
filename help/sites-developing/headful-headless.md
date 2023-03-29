---
title: Headful and Headless in AEM
description: AEM projects can be implemented in a headful and headless model, but the choice is not binary. AEM offers the flexibility to exploit the advantages of both models in one project.
exl-id: c9597c78-be05-42ff-84fe-f7451119e83d
---
# Headful and Headless in AEM {#headful-headless}

Adobe Experience Manager projects can be implemented in both headful and headless models, but the choice is not binary. AEM offers the flexibility to exploit the advantages of both models in one project. This document provides an overview of the different models and describes the levels of SPA integration.

## Overview {#overview}

AEM offers powerful tools to manage both the creation of content and its delivery in one platform. This is a traditional "headful" model of content management, where the content authors and developers work on the same platform to deliver the experiences to the content consumers.

AEM can also be used to simply manage content, allowing presentation and delivery of the content to be managed by another platform. This is the "headless" model of content management, where the content authors and developers work on different platforms to deliver experience to the content consumers.

But this need not be a binary choice. AEM offers unprecedented flexibility, allowing you to exploit the advantages of both models for your project.

![AEM Implementation Models](/help/sites-developing/headless/getting-started/assets/aem-implementation-models.png)

In a headful or full-stack model, the content is managed in the AEM repository and AEM components based on Java, HTL, etc. are used to render the content for the user experience. In this model, creating the content, styling it, presenting it, and delivering it all happen in AEM.

In a headless model, the content is managed in the AEM repository, but delivered via APIs such as REST and GraphQL to another system to render the content for the user experience. In this model, content is created in AEM, but styling it, presenting it, and delivering it all happen on another platform.

Single Page Applications (SPAs) are often the destination for content delivered headlessly by AEM. However, these SPAs need not be entirely external to AEM. AEM allows you to decide to what degree your SPAs are integrated into AEM. Let's take an example.

## Web Shop Example {#web-shop-example}

Let's say that you have an existing web shop for your company as an SPA. In it you have all your product details and images. Then you introduce AEM in order to power your marketing efforts such as promotional sites, blogs, and campaign content. How do you integrate the two? AEM enables a spectrum of options:

* **Allow the systems to operate independently.**
* **Supply the web shop with limited content from AEM via GraphQL.** Content can be created by authors in AEM, but only seen via the web shop SPA.
* **Embed the web shop SPA in AEM.** Content can be created by authors in AEM, and viewed in AEM in the context of the web shop, but not manipulated.
* **Embed the web shop SPA in AEM, and enable editable points.** Content can be created by authors in AEM, and viewed in AEM in the context of the web shop, and the authors have limited ability to manipulate the content of the web shop SPA within AEM.
* **Embed the webs shop SPA in AEM, and enable entire zones for editing.** Content can be created by authors in AEM, and viewed in AEM in the context of the web shop, and the authors have limited ability to manipulate the content of the web shop SPA within AEM.

The next section explores these levels of integration in more detail.

>[!NOTE]
>
>Of course you could also re-implement the web shop SPA as a fully-functioning AEM SPA [using the AEM SPA Editor framework.](/help/sites-developing/spa-walkthrough.md) If you already have AEM and wish to create a new web shop or other SPA, this is the recommended method, but it out of the scope of this document.

## SPA Integration Levels {#integration-levels}

SPA integration falls on a spectrum of four levels in AEM.

* **Level 0: No integration**
  * The SPA and AEM exist separately and exchange no information.
  * Content is created, managed, and delivered independently in two separate systems.
* **Level 1: Content fragment integration**
  * [Content Fragments](/help/assets/content-fragments/content-fragments.md) are used in AEM to create and manage limited content for the SPA.
  * The SPA retrieves this content via AEM's [GraphQL API.](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md)
  * Some content is managed in AEM and some in an external system.
  * Content can only be viewed in the SPA.
* **Level 2: Embed the SPA in AEM**
  * [Content Fragments](/help/assets/content-fragments/content-fragments.md) are used in AEM to create and manage content for the SPA.
  * The SPA retrieves this content via AEM's [GraphQL API.](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md)
  * Some content is managed in AEM and some in an external system.
  * Content can be viewed in-context within AEM.
  * Limited content can be edited within AEM.
* **Level 3: Embed and fully enable SPA in AEM**
  * [Content Fragments](/help/assets/content-fragments/content-fragments.md) are used in AEM to create and manage content for the SPA.
  * The SPA retrieves this content via AEM's [GraphQL API.](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md)
  * Content can be viewed in-context within AEM.
  * Most content can be edited within AEM.

Level 1 is an example of a typical headless implementation. However content authors can only view their content in-context within the SPA. AEM is only an authoring tool.

The advantage and flexibility of AEM becomes apparent with levels 2 and 3 while still retaining the advantages of SPAs. Content authors can create their content in AEM, but also see it in-context within AEM. The SPA gains the ability to be authored in AEM, but still be delivered as an SPA.

## Implementing the Integration Levels {#implementing}

There are different tools in AEM available depending on what integration level you choose. Each level builds on the tools used in the previous. The following list links to the relevant resources.

* **Level 1:** Content Fragments and the [AEM headless framework](/help/sites-developing/headless/introduction.md) can be used to deliver AEM content to the SPA.
* **Level 2:** In addition to level one:
  * [The RemotePage component](/help/sites-developing/spa-remote-page.md) can be used to embed the external SPA into AEM where AEM content can be viewed in-context.
  * Certain points on the SPA can also be enabled to [allow limited editing in AEM.](/help/sites-developing/spa-edit-external.md)
* **Level 3:** In addition to level two:
  * Entire zones of the SPA can be enabled to allow comprehensive editing in AEM.

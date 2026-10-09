---
title: Headless Development for AEM 6.5 Sites
description: Learn how AEM 6.5's powerful headless capabilities like Content Models, Content Fragments, and the GraphQL API work together to enable you to manage your experiences centrally and serve them across channels.
exl-id: b6598bcf-b2ce-403a-87cf-6895fec8a91b
solution: Experience Manager, Experience Manager Sites
feature: Headless,Content Fragments,GraphQL,Persisted Queries,Developing
role: Admin,Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: c45915cf-e157-4af7-a80d-97b905bcb3a5
    internal-label: Experience Manager Sites
feature_v2:
  - id: bfd4bc52-c397-5127-8f86-8953ba9fc0a3
    internal-label: Headless
  - id: c5d917df-d8bd-5e97-a117-6dde1e9f7103
    internal-label: Developing
  - id: a642c50e-80eb-4fc1-a5d2-f3762d1f841d
    internal-label: Administration
  - id: d429a63e-ade4-4117-b04e-9b996d1c94ef
    internal-label: Integrations
  - id: c124fa01-25c5-42ec-adf6-21d1c114058b
    internal-label: Developer tools
subfeature_v2:
  - id: e9db7c79-8f65-4281-a439-c9049296d903
    internal-label: Content Fragments
  - id: a02b73a7-bdfc-4225-bdfd-69f7891ab55e
    internal-label: GraphQL
  - id: d781bc8f-52af-43f6-84d0-b73e59a130d5
    internal-label: Persisted queries
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Headless Development for AEM 6.5 Sites {#headless-development}

Learn how AEM 6.5's powerful headless capabilities like Content Models, Content Fragments, and the GraphQL API work together to enable you to manage your experiences centrally and serve them across channels.

## Overview {#overview}

Headless implementation is increasingly becoming important for delivering experiences to your audience is, wherever they are and regardless of channel.

Headless implementation forgoes page and component management as is traditional in full stack and hybrid solutions and focuses on the creation of channel-neutral, reusable fragments of content and their cross-channel delivery. It is a modern and dynamic development pattern for implementing web experiences.

![AEM Implementation Models](/help/sites-developing/headless/getting-started/assets/aem-implementation-models.png)

## Comparing Headful and Headless {#headful-headless}

This document focuses on the full headless implementation model of AEM. However, headful versus headless does not need to be a binary choice in AEM. Headless features can be used to manage and deliver your content to a variety of endpoints while also enabling your content authors to edit single page applications. All in AEM.

>[!TIP]
>
>See the document [Headful and Headless in AEM](/help/sites-developing/headful-headless.md) for more information.

## AEM 6.5 and Headless {#aem-headless}

AEM 6.5 is a flexible tool for the headless implementation model by offering three powerful services:

1. Content Models
   * Content Models are structured representation of content.
   * These are defined by information architects in the AEM Content Fragment Model editor.
   * Content Models serve as a basis for Content Fragments.
1. Content Fragments
   * Content Fragments are instantiations of content models.
   * These are created by content authors using the AEM Content Fragment editor.
   * They are stored in AEM Assets and managed in Assets Admin UI.
1. Content API for delivery
   * The AEM GraphQL API supports Content Fragment delivery.
   * The AEM Assets REST API supports Content Fragment CRUD operations.
   * Direct content delivery is also possible with the [Content Fragment Core Component's JSON export.](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/components/content-fragment-component.html)

## Your First Steps with AEM Headless {#first-steps}

There are several resources available for your to get started with AEM's headless features. They are intended for different use cases, but all give a solid overview of AEM's headless features.

|Resource|Description|Type|Audience|Est. Time|
|---|---|---|---|---|
|[Headless Developer Journey](/help/journey-headless/developer/overview.md)|**For users new to AEM and headless** technologies, start here for a comprehensive introduction to AEM and its headless features from the theory of headless through going live with your first headless project.|Guide|Developers **new to AEM and headless**|1 hour|
|[Headless Getting Started Guide](/help/sites-developing/headless/getting-started/introduction.md)|**For experienced AEM users** who need a short summary of the key AEM headless features, check out this quick start overview.|Quick Start|Developers, Administrators **with AEM experience**|20 minutes|
|[Getting Started with AEM Headless hands-on tutorial](https://experienceleague.adobe.com/docs/experience-manager-learn/getting-started-with-aem-headless/graphql/multi-step/overview.html)|**If you prefer a hands-on approach and are familiar with AEM**, this tutorial dives directly into creating a simple headless project.|Tutorial|Developers|2 hours|
|[AEM Developer Portal](https://experienceleague.adobe.com/landing/experience-manager/headless/developer.html)|This collection of resources are provided for both **new** and **experienced** developers.|Collection of Resources|Developers| |

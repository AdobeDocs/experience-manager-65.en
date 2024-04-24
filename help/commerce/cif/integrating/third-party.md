---
title: AEM and third-party Commerce Integration using Commerce Integration Framework
description: Enterprise businesses may require additional third-party commerce solutions to power their storefront. The Commerce Integration Framework (CIF) can be used in such integration scenarios to connect a third-party commerce solution to Adobe Experience Manager using I/O Runtime.
thumbnail: cif-third-party-architecture.jpg
exl-id: e99899a4-df86-4108-991a-8b30d303a279
solution: Experience Manager,Commerce
feature: Commerce Integration Framework
role: Admin, Developer
---
# AEM and Third-Party Commerce Integration using Commerce Integration Framework {#aem-third-party}

The integration of non-Adobe Commerce solution is a common scenario for CIF. Third-party solutions with different APIs and schemas get connected by way of an integration layer.

## Architecture {#architecture}

The overall architecture is as follows:

![AEM non-Magento/third Party Architecture Overview](../assets//AEM_nonMagento_Architecture.png)

The purpose of this integration layer is to map third-party APIs and schemas against the supported Adobe Commerce GraphQL APIs and schemas outside of the Experience Manager. Thanks to this encapsulation, the integration logic, and systems can get updated without changing code inside the Experience Manager.

## Solution requirements for an integration

As the Experience Manager retrieves data on-demand, real-time APIs for product catalog are required.

>[!TIP]
>
>If no real-time APIs are available, an external product cache with APIs should be used for the integration. Example [Magento open-source](https://business.adobe.com/products/magento/open-source.html).

There is no need to implement the complete GraphQL schema, just the objects of the schema to enable the desired use-cases.

## Backend use-cases

CIF extends the Experience Manager with real-time product catalog access and product experience management tools. This seamless integration enables authors to access commerce data using embedded UIs whenever needed without leaving the content context.

The integration of product catalog APIs is required to unlock these use-cases.

## Frontend Use-Cases

[AEM CIF Core Components](https://github.com/adobe/aem-core-cif-components) retrieve and exchange data via the CIF supported Adobe Commerce APIs. To reuse components, the respective APIs must be implemented.

The recommendation for performance critical client-side components is to communicate directly with the third-party solution to avoid latency.

## Developing an Integration {#develop-integration}

Adobe recommends using [Adobe I/O Runtime](https://developer.adobe.com/apis/experienceplatform/runtime.html) for the integration layer. It is included in the CIF add-on for third parties. As it works with a microservice-like approach, it is suited well to integrate easily multiple solutions.

The [reference implementation](https://github.com/adobe/commerce-cif-graphql-integration-reference) is a great starting point to build the integration to your commerce solution. Although it supports GraphQL, it can also be integrated with any other type of API such as REST.

This integration layer is not required if a third-party layer is available (such as Mulesoft) or the integration gets built on top of the third-party solution.

## Pre-built connectors {#connectors}

Connectors provide a good starting for projects. They come with a commerce solution-specific connection and default API mapping. These connectors are built by third parties and not maintained by Adobe. Contact the respective partner for information.

* [SAP Commerce](https://github.com/diconium/commerce-cif-graphql-integration-hybris), built by Diconium
* [Commercetools](https://github.com/diconium/commerce-cif-graphql-integration-commercetool), built by Diconium

>[!TIP]
>
>While connectors help projects to accelerate the commerce integration, they are not plug-n-play. Enterprise commerce solutions are heavily customized and require a custom integration. Good knowledge of the commerce platform, Adobe Commerce GraphQL schemas, and Adobe I/O Runtime is required.

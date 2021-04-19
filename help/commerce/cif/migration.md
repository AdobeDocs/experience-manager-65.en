---
title: Migration to the AEM Commerce Integration Framework (CIF) add-on
description: How to migrate to the AEM Commerce Integration Framework (CIF) add-on from an old version
exl-id: 0db03a05-f527-4853-b52f-f113bce929cf
---
# Migration guide for the Experience Manager Cloud Service {#cif-migration}

This guide helps identify the areas you need to update for the Experience Manager Cloud Service migration.

## CIF add-on

For Experience Manager as a Cloud Service the CIF add-on is the only supported commerce integration solution for Adobe Commerce and 3rd party commerce solutions. The CIF add-on is deployed automatically for customers on Experience Manager as a Cloud Service, no manual deployment is needed. See [Getting started with AEM Commerce as a Cloud Service](getting-started.md).

To support projects deploying CIF Adobe provide [AEM CIF Core Components](https://github.com/adobe/aem-core-cif-components).

CIF add-on is available for AEM 6.5 as well via the [Software Distribution portal](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html). It is compatible and provides the same features as the CIF add-on for Experience Manager as a Cloud Service - no adjustments are required.

Classic CIF with its dependencies is not available anymore. Code relying on this CIF version using `com.adobe.cq.commerce.api` Java APIs must be adjusted to the CIF add-on and its principles.

The previously available CIF connector cannot be installed anymore. Code relying on this connector need to be adjusted to the CIF add-on and its principles.

## Project structure

Learn the [AEM Project Structure](https://docs.adobe.com/content/help/en/experience-manager-cloud-service/implementing/developing/aem-project-content-package-structure.html) and the characteristics of AEM as a Cloud Service. Adapt your project setup to the AEM as a Cloud Service layout.
Compared to AEM 6.5 deployments there are two main differences here are:

* The GraphQL client OSGI bundle **must not** be included into the AEM project anymore, it is deployed via the CIF add-on
* OSGI configs for GraphQL client and Graphql Data Service **must not** be included into the AEM project anymore

>[!TIP]
>
>Check out the [AEM Venia Reference Store](https://github.com/adobe/aem-cif-guides-venia) project on GitHub. This project provides Maven profiles for AEM as a Cloud Service and on-premise deployments which take into account the different framework conditions.

## Product catalog

Importing product catalog data is not supported anymore. Using the CIF add-on principals product & catalog requests are on-demand via real-time calls to an external commerce solution. Go to chapter Integrating to learn more about integrating a commerce solution.

>[!TIP]
>
>If no real-time APIs are available, an external product cache with APIs should be used for the integration. Example [Magento open-source](https://magento.com/products/magento-open-source).

## Product catalog experiences with AEM rendering

If you use catalog blueprint with Classic CIF, you need to update the product catalog workflow. The CIF add-on now renders product catalog experiences on-the-fly using AEM catalog templates. No replication of product data or product pages is required anymore.

## Non-cacheable data and shopping interaction

Client-side requests for non-cacheable data and interactions (e.g. add-to-cart, search) should go directly to the commerce endpoint (either commerce solution or integration layer) via CDN / Dispatcher. Remove any calls where AEM was just a proxy.

---
title: Migration to the AEM Commerce Integration Framework (CIF) add-on
description: How to migrate to the AEM Commerce Integration Framework (CIF) add-on from an old version
exl-id: 0db03a05-f527-4853-b52f-f113bce929cf
---
# Migration guide for the Experience Manager add-on {#cif-migration}

This guide helps identify the areas you need to update for the Experience Manager add-on migration.

## CIF add-on

CIF add-on is available for AEM 6.5 via the [Software Distribution portal](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html). It is compatible and provides the same features as the CIF add-on for Experience Manager as a Cloud Service.

See [Getting started with AEM Content and Commerce](getting-started.md).

To support projects deploying CIF Adobe provide [AEM CIF Core Components](https://github.com/adobe/aem-core-cif-components).

## Product catalog

Importing product catalog data is not supported by the CIF add-on. Using the CIF add-on principals, product & catalog requests are on-demand via real-time calls to an external commerce solution. Go to chapter Integrating to learn more about integrating a commerce solution.

>[!TIP]
>
>If no real-time APIs are available, an external product cache with APIs should be used for the integration. Example [Magento open-source](https://magento.com/products/magento-open-source).

## Product catalog experiences with AEM rendering

If you use catalog blueprint with Classic CIF, you need to update the product catalog workflow. The CIF add-on now renders product catalog experiences on-the-fly using AEM catalog templates. No replication of product data or product pages is required anymore.

## Non-cacheable data and shopping interaction

Client-side requests for non-cacheable data and interactions (e.g. add-to-cart, search) should go directly to the commerce endpoint (either commerce solution or integration layer) via CDN / Dispatcher. Remove any calls where AEM was just a proxy.

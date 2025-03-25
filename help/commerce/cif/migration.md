---
title: Migration to the AEM Commerce Integration Framework (CIF) add-on
description: How to migrate to the AEM Commerce Integration Framework (CIF) add-on from an old version.
exl-id: c6c0c2fc-6cfa-4c64-b3d8-7e428b2a4b2e
solution: Experience Manager,Commerce
feature: Commerce Integration Framework
role: Admin, Developer
---
# Migration Guide for the Experience Manager Add-On {#cif-migration}

This guide helps identify the areas you need to update for the Experience Manager add-on migration.

## CIF Add-On

CIF add-on is available for AEM 6.5 via the [Software Distribution portal](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?fulltext=commerce*&2_group.propertyvalues.property=.%2Fjcr%3Acontent%2Fmetadata%2Fdc%3Aversion&2_group.propertyvalues.operation=equals&2_group.propertyvalues.0_values=target-version%3Aaem%2F6-5&orderby=%40jcr%3Acontent%2Fjcr%3AlastModified&orderby.sort=desc&layout=list&p.offset=0&p.limit=16). It is compatible and provides the same features as the CIF add-on for Experience Manager as a Cloud Service.

See [Getting started with AEM Content and Commerce](getting-started.md).

To support projects deploying CIF, Adobe provides [AEM CIF Core Components](https://github.com/adobe/aem-core-cif-components).

## Product Catalog

Importing product catalog data is not supported by the CIF add-on. Using the CIF add-on principals, product & catalog requests are on-demand via real-time calls to an external commerce solution. Go to chapter Integrating to learn more about integrating a commerce solution.

>[!TIP]
>
>If no real-time APIs are available, an external product cache with APIs should be used for the integration. Example [Magento open-source](https://business.adobe.com/products/magento/open-source.html).

## Product Catalog Experiences with AEM Rendering

If you use catalog blueprint with Classic CIF, you need to update the product catalog workflow. The CIF add-on now renders product catalog experiences on-the-fly using AEM catalog templates. No replication of product data or product pages is required anymore.

## Non-Cacheable Data and Shopping Interaction

Client-side requests for non-cacheable data and interactions (for example, add-to-cart, search) should go directly to the commerce endpoint (either commerce solution or integration layer) via CDN / Dispatcher. Remove any calls where AEM was just a proxy.

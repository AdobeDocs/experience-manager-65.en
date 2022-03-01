---
title: AEM Content and Commerce Release Notes 2022
description: AEM Content and Commerce Release Notes 2022
---
# Commerce Integration Framework GitHub Release Overview

## Overview of System Requirements

Review the minimum system requirements in the table below for the CIF version you are currently using or plan to use in the future.

|Component| System Requirements|
|:-------|:-----:|
|CIF add-on |Minimum: AEM 6.5.7, Magento 2.3.5 GraphQL schemas|
|CIF Core Components |[System Requirements](https://github.com/adobe/aem-core-cif-components/blob/master/VERSIONS.md)|
|AEM Project Archetype |[System Requirements](https://github.com/adobe/aem-project-archetype/blob/master/VERSIONS.md)|

## Release Date: March, 2022

|Component| Version| Details|
|:-------|:-----:|---------------------:|
|CIF add-on | 2022.02.24.00|[Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faem-commerce-addon-65-2022.02.24.00.zip)|
|CIF Core Components |2.6.0|[GitHub](https://github.com/adobe/aem-core-cif-components/releases/tag/core-cif-components-reactor-2.6.0)|
|CIF Venia Reference Site| 2022.02.24|[GitHub](https://github.com/adobe/aem-cif-guides-venia/releases/tag/venia-2022.02.24)|

### What's New {#what-is-new-march}

* Improved SEO for multi-store scenarios: URL formats for PDP / PLP can now be configured on a store level via the CIF Cloud Config properties
* Product picker supports staged products via new filter option in the UI.  This enables content practitioners to prepare product content management for upcoming product launches
* Simplified CIF configuration management and error handling by using CIF Cloud Config name instead of config proxy url
* Manual category selection for Product list and Carousel components. This allows content practitioners to use these components on content pages, outside of the catalog experience

## Release Date: January, 2022

|Component| Version| Details|
|:-------|:-----:|---------------------:|
|CIF add-on | 2022.01.20.00|[Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faem-commerce-addon-65-2022.01.20.00.zip)|
|CIF Core Components |2.5.0|[GitHub](https://github.com/adobe/aem-core-cif-components/releases/tag/core-cif-components-reactor-2.5.0)|
|CIF Venia Reference Site| 2022.01.27|[GitHub](https://github.com/adobe/aem-cif-guides-venia/releases/tag/venia-2022.01.27)|

### What's New {#what-is-new-january}

* Enhanced myAccount components
* Product Recommendation component suppports additional page types (home page, shopping cart, order confirmation)
* **Wishlist**
  * Logged in visitors can add products to a wishlist
  * Mangaging the wishlist and its products is possible via myAccount
  * The "Add to wishlist" button can be enabled / disabled on a component level via policy (example product teaser, product detail
  * Available as a Core Component and in the AEM Venia Storefront

![Wishlist](/help/assets/CIF/wishlist.png)


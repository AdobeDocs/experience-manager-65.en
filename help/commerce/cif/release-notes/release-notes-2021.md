---
title: AEM Content and Commerce Release Notes 2021
description: AEM Content and Commerce Release Notes 2021
exl-id: ec47c5f8-d4dd-469f-94df-5ee28f25d696
---
# Commerce Integration Framework GitHub Release Overview

## Overview of System Requirements

Review the minimum system requirements in the table below for the CIF version you are currently using or plan to use in the future.

**With the April release we have replaced the CIF Connector from GitHub with the CIF add-on** which is available on the [Adobe Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html). The switch to the add-on comes with great benefits for projects:

* Most of the new features will immediately be available on AEM 6.5 (No more waiting for feature side-port)
* Easy upgradable to new add-on versions
* Ready for Cloud Service

The old AEM CIF Connector is going into maintenance mode and should not be used anymore. Please replace the CIF Connector with the new CIF add-on. Simply package replacement should be possible for most projects.

|Component| System Requirements|
|:-------|:-----:|
|CIF add-on |Minimum: AEM 6.5.7, Magento 2.3.5 GraphQL schemas|
|CIF Core Components |[System Requirements](https://github.com/adobe/aem-core-cif-components/blob/master/VERSIONS.md)|
|AEM Project Archetype |[System Requirements](https://github.com/adobe/aem-project-archetype/blob/master/VERSIONS.md)|

## Release Date: September, 2021

|Component| Version| Details|
|:-------|:-----:|---------------------:|
|CIF add-on | 2021.09.27|[Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faem-commerce-addon-65-2021.09.27.zip)|
|CIF Core Components |2.2.0|[GitHub](https://github.com/adobe/aem-core-cif-components/releases/tag/core-cif-components-reactor-2.2.0)|
|CIF Venia Reference Site| 2021.09.23|[GitHub](https://github.com/adobe/aem-cif-guides-venia/releases/tag/venia-2021.09.23)|

### What's New {#what-is-new-september}

* New "associated commerce content" tab in Sites editor increases author efficiency by quickly getting access to relevant AEM  product content for the current context

  ![Associated commerce content](/help/assets/CIF/associated-commerce-content.png)

* Improved product picker UI for better user experience, increased efficiency and support for complex product catalog

  ![New Product Picker](/help/assets/CIF/product-picker.png)

* Respect "include_in_menu" property in navigation component

### Bug fixes {#bug-fixes-september}

* Menu cache flush is not working as expected

* JS errors during AEM CS deployment step and when not using clientside components

* Cannot create CIF cloud config in folders that have a sling:configs node

## Release Date: August, 2021

|Component| Version| Details|
|:-------|:-----:|---------------------:|
|CIF add-on | 2021.09.02|[Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faem-commerce-addon-65-2021.09.02.zip)|
|CIF Core Components |2.1.0|[GitHub](https://github.com/adobe/aem-core-cif-components/releases/tag/core-cif-components-reactor-2.1.0)|
|CIF Venia Reference Site| 2021.08.27|[GitHub](https://github.com/adobe/aem-cif-guides-venia/releases/tag/venia-2021.08.27)|

### What's New {#what-is-new-august}

* New Category Picker UI for improved user experience, increased efficiency and better support for complex product catalog

  ![New Category Picker](/help/assets/CIF/category-picker.png)

* Better A11Y support for CIF Core Components

### Bug fixes {#bug-fixes-august}

* Cannot close category filter accordion once it is open

* 'Call to action text' property broken in product teaser

* CIF JS errors during AEM CS deployment step

* Fix raw product access for mapped product product list items

## Release Date: July, 2021

|Component| Version| Details|
|:-------|:-----:|---------------------:|
|CIF add-on | 2021.07.21|[Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faem-commerce-addon-65-2021.07.21.zip)|
|CIF Core Components |2.0.0|[GitHub](https://github.com/adobe/aem-core-cif-components/releases/tag/core-cif-components-reactor-2.0.0)|
|CIF Venia Reference Site| 2021.07.22|[GitHub](https://github.com/adobe/aem-cif-guides-venia/releases/tag/venia-2021.07.22)|

### What's New {#what-is-new-july}

* CIF Core Components v2
  * Simplified and improved configurations for PDP/PLP URL and SEO
  * Visual indicator for staged product data in authoring mode for better visibility of upcoming changes
  * New sitemap component for content and commerce pages

* Support for [Adobe Commerce Sensei Product Recommendation, powered by Adobe Sensei](https://business.adobe.com/products/magento/product-recommendations.html) in AEM Storefront using pre-defined or on-the-fly created recommendations

## Release Date: June, 2021

|Component| Version| Details|
|:-------|:-----:|---------------------:|
|CIF add-on | 2021.06.18|[Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faem-commerce-addon-65-2021.06.18.zip)|
|CIF Core Components |1.12.0|[GitHub](https://github.com/adobe/aem-core-cif-components/releases/tag/core-cif-components-reactor-1.12.0)|
|CIF Venia Reference Site| 2021.06.12|[GitHub](https://github.com/adobe/aem-cif-guides-venia/releases/tag/venia-2021.06.17)|

### What's New {#what-is-new-june}

* New CIF product and category reference data types for Content Fragments (Incl. product / category picker UI support)
* New Commerce Content Fragment Core Component
* Full-text commerce search supported in AEM backend
* Commerce Core Components support Adobe Commerce Sensei Recs data collection
* Improved SEO-friendly URLs for category pages
* Support for custom HTTP headers per site/config

## Release Date: May, 2021

|Component| Version| Details|
|:-------|:-----:|---------------------:|
|CIF add-on | 2021.05.26|[Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faem-commerce-addon-65-2021.05.26.zip)|
|CIF Core Components |1.11.0|[GitHub](https://github.com/adobe/aem-core-cif-components/releases/tag/core-cif-components-reactor-1.11.0)|
|CIF Venia Reference Site| 2021.05.24|[GitHub](https://github.com/adobe/aem-cif-guides-venia/releases/tag/venia-2021.05.24)|

### What's New {#what-is-new-may}

* Pagination support for associated content in product console properties

### Bug fixes {#bug-fixes-may}

* Asset thumbnails not displayed in Asset tab of product properties

* Breadcrumb resets preview data in product console

## Release Date: April, 2021

|Component| Version| Details|
|:-------|:-----:|---------------------:|
|CIF add-on | 2021.04.22|[Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faem-commerce-addon-65-2021.04.22.zip)|
|CIF Core Components |1.10.0|[GitHub](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Venia Reference Site| 2021.04.22|[GitHub](https://github.com/adobe/aem-cif-guides-venia/releases)|

### What's New {#what-is-new-april}

* Support for category UID - This unlocks third party commerce integrations for systems that use Strings for category ids

* AEM extension for PWA Studio incl. example integration

* New CIF navigation core component that extends WCM navigation core component

### Bug fixes {#bug-fixes-april}

* The root category field was not displayed under the commerce tab in the page properties of category pages

## Release Date: March, 2021 {#what-is-new-march}

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 1.9.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |1.9.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Venia Reference Site| 2021.03.25|[Release Notes](https://github.com/adobe/aem-cif-guides-venia/releases)|

### What's new

* Support for Magento 2.4.2

### What's Improved

* Improved reusability of product detail component for content driven pages

* Better caching and less backend calls for PDPs

* Multiple bug fixes.

## Release Date: February, 2021

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 1.8.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |1.8.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Venia Reference Site| 2021.02.24|[Release Notes](https://github.com/adobe/aem-cif-guides-venia/releases)|

### What's New {#what-is-new-february}

* Product Experience Management: Enrich product catalog pages individually with Experience Fragments.

* Extended product console properties to show linked Assets and Experience Fragments, including action to quickly navigate to the associated content.

### What's Improved  {#what-is-improved-february}

* Enhanced client-side data layer with product image url and category information.

* Multiple bug fixes.

## Release Date: January, 2021

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 1.7.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |1.7.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Venia Reference Site| 2021.02.02|[Release Notes](https://github.com/adobe/aem-cif-guides-venia/releases)|

### What's New {#what-is-new-january}

* Product Experience Management: New 'Commerce' property tab for Assets and Experience Fragments. This tab enables you to link Assets and Experience Fragments to products & categories. The tab also shows real-time data for linked commerce objects and a link to show details in the product console.

### What's Improved  {#what-is-improved-january}

* Send user data after authentication to Adobe Client Data Layer.

* Multiple bug fixes.

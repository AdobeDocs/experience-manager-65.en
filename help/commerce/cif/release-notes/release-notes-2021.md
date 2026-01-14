---
title: Adobe Experience Manager Content and Commerce Release Notes 2021
description: Adobe Experience Manager Content and Commerce Release Notes 2021.
exl-id: ec47c5f8-d4dd-469f-94df-5ee28f25d696
solution: Experience Manager,Commerce
feature: Commerce Integration Framework
role: Admin, Developer
---
# Commerce Integration Framework GitHub Release Overview

## Overview of System Requirements

Review the minimum system requirements in the table below for the CIF version that you are currently using or plan to use in the future.

|Component| System Requirements|
|:-------|:-----:|
|CIF add-on |Minimum: Adobe Experience Manager (AEM) 6.5.7, Adobe Commerce 2.3.5 GraphQL schemas|
|CIF Core Components |[System Requirements](https://github.com/adobe/aem-core-cif-components/blob/master/VERSIONS.md)|
|AEM Project Archetype |[System Requirements](https://github.com/adobe/aem-project-archetype/blob/master/VERSIONS.md)|

## Release Date: November  2021

|Component| Version| Details|
|:-------|:-----:|---------------------:|
|CIF add-on | 2021.11.18.00|[Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faem-commerce-addon-65-2021.11.18.00.zip)|
|CIF Core Components |2.4.2|[GitHub](https://github.com/adobe/aem-core-cif-components/releases/tag/core-cif-components-reactor-2.4.2)|
|CIF Venia Reference Site| 2021.12.01|[GitHub](https://github.com/adobe/aem-cif-guides-venia/releases/tag/venia-2021.12.01)|

### What's New {#what-is-new-november}

* Extended myAccount components that are based on Commerce's extensible Peregrine components

![Extended myAccount components](/help/assets/CIF/extended-myAccount-components.png)

* Authors can create ad-hoc Commerce Product Recommendations using additional recommendation types

* Support for gift cards in AEM Storefront

## Release Date: October  2021

|Component| Version| Details|
|:-------|:-----:|---------------------:|
|CIF add-on | 2021.10.20.02|[Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faem-commerce-addon-65-2021.10.20.02.zip)|
|CIF Core Components |2.4.0|[GitHub](https://github.com/adobe/aem-core-cif-components/releases/tag/core-cif-components-reactor-2.4.0)|
|CIF Venia Reference Site| 2021.11.01|[GitHub](https://github.com/adobe/aem-cif-guides-venia/releases/tag/venia-2021.11.01)|

### What's New {#what-is-new-october}

* The CIF add-on supports latest Commerce v2.4.3 with new GraphQL APIs and schemas

* Authors can add links to product and catalog pages in text fields using the rich text editor (RTE). A CIF icon has been added to the RTE toolbar that opens the pickers to quickly search and select the product or category without leaving the context.

* Existing pop-up shopping cart and checkout have been replaced with dedicated AEM shopping cart and checkout pages. The components on these pages are built using Adobe Commerce's extensible Peregrine components

* Merchants can hide certain product catalog categories in the navigation using the Commerce backend. The CIF Navigation Core Component respects the commerce backend configuration "include in menu" to show / hide categories in navigation

* AEM Storefront Venia returns HTTP 404 error if category or product page is not found

## Release Date: September  2021

|Component| Version| Details|
|:-------|:-----:|---------------------:|
|CIF add-on | 2021.09.27|[Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faem-commerce-addon-65-2021.09.27.zip)|
|CIF Core Components |2.2.0|[GitHub](https://github.com/adobe/aem-core-cif-components/releases/tag/core-cif-components-reactor-2.2.0)|
|CIF Venia Reference Site| 2021.09.23|[GitHub](https://github.com/adobe/aem-cif-guides-venia/releases/tag/venia-2021.09.23)|

### What's New {#what-is-new-september}

* New "associated commerce content" tab in Sites editor increases author efficiency by quickly getting access to relevant AEM  product content for the current context

  ![Associated commerce content](/help/assets/CIF/associated-commerce-content.png)

* Improved product picker UI for better user experience, increased efficiency, and support for complex product catalog

  ![New Product Picker](/help/assets/CIF/product-picker.png)

* Respect "include_in_menu" property in navigation component

### Bug fixes {#bug-fixes-september}

* Menu cache flush is not working as expected

* JS errors during AEM CS deployment step and when not using client-side components

* Cannot create CIF cloud config in folders that have a sling:configs node

## Release Date: August  2021

|Component| Version| Details|
|:-------|:-----:|---------------------:|
|CIF add-on | 2021.09.02|[Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faem-commerce-addon-65-2021.09.02.zip)|
|CIF Core Components |2.1.0|[GitHub](https://github.com/adobe/aem-core-cif-components/releases/tag/core-cif-components-reactor-2.1.0)|
|CIF Venia Reference Site| 2021.08.27|[GitHub](https://github.com/adobe/aem-cif-guides-venia/releases/tag/venia-2021.08.27)|

### What's New {#what-is-new-august}

* New Category Picker UI for improved user experience, increased efficiency, and better support for complex product catalog

  ![New Category Picker](/help/assets/CIF/category-picker.png)

* Better A11Y support for CIF Core Components

### Bug fixes {#bug-fixes-august}

* Cannot close category filter accordion once it is open

* 'Call to action text' property broken in product teaser

* CIF JS errors during AEM CS deployment step

* Fix raw product access for mapped product list items

## Release Date: July  2021

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

* Support for [Adobe Commerce AI Product Recommendation, powered by Adobe AI](https://business.adobe.com/ai/adobe-genai.html) in AEM Storefront using pre-defined or on-the-fly created recommendations

## Release Date: June  2021

|Component| Version| Details|
|:-------|:-----:|---------------------:|
|CIF add-on | 2021.06.18|[Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faem-commerce-addon-65-2021.06.18.zip)|
|CIF Core Components |1.12.0|[GitHub](https://github.com/adobe/aem-core-cif-components/releases/tag/core-cif-components-reactor-1.12.0)|
|CIF Venia Reference Site| 2021.06.12|[GitHub](https://github.com/adobe/aem-cif-guides-venia/releases/tag/venia-2021.06.17)|

### What's New {#what-is-new-june}

* New CIF product and category reference data types for Content Fragments (Incl. product / category picker UI support)
* New Commerce Content Fragment Core Component
* Full-text commerce search supported in AEM backend
* Commerce Core Components support Adobe Commerce AI Recs data collection
* Improved SEO-friendly URLs for category pages
* Support for custom HTTP headers per site/config

## Release Date: May  2021

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

## Release Date: April  2021

|Component| Version| Details|
|:-------|:-----:|---------------------:|
|CIF add-on | 2021.04.22|[Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Faem-commerce-addon-65-2021.04.22.zip)|
|CIF Core Components |1.10.0|[GitHub](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Venia Reference Site| 2021.04.22|[GitHub](https://github.com/adobe/aem-cif-guides-venia/releases)|

### What's New {#what-is-new-april}

* Support for category UID - This unlocks third-party commerce integrations for systems that use Strings for category ids

* AEM extension for PWA Studio incl. example integration

* New CIF navigation core component that extends WCM navigation core component

### Bug fixes {#bug-fixes-april}

* The root category field was not displayed under the commerce tab in the page properties of category pages

## Release Date: March  2021 {#what-is-new-march}

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 1.9.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |1.9.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Venia Reference Site| 2021.03.25|[Release Notes](https://github.com/adobe/aem-cif-guides-venia/releases)|

### What's new

* Support for Adobe Commerce 2.4.2

### What's Improved

* Improved reusability of product detail component for content driven pages

* Better caching and less backend calls for PDPs

* Multiple bug fixes.

## Release Date: February  2021

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

## Release Date: January  2021

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

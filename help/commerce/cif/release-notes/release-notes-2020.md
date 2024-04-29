---
title: AEM Content and Commerce Release Notes 2020
description: Adobe Experience Manager Content and Commerce Release Notes 2020.
exl-id: 440ecd8e-55dc-4606-8678-c65cda1d2b3a
solution: Experience Manager,Commerce
feature: Commerce Integration Framework
role: Admin, Developer
---
# Commerce Integration Framework GitHub Release Overview

## Release Date: November 2020

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 1.6.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |1.6.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Venia Reference Site| 2020.12.01|[Release Notes](https://github.com/adobe/aem-cif-guides-venia/releases)|

### What's New {#what-is-new-november}

* Template inheritance added to a specific category page. This feature improves business user efficiency because it makes it possible for all subcategories to inherit the template that was created for a specific top category.

* Venia reference storefront updated to use Experience Fragment for the footer. Business users can edit the page footer using AEM authoring tools.

### What's Improved {#what-is-improved-november}

* Checkout component improved to provide shoppers with the ability to enter the destination country to allow billing/shipping addresses outside the United States.

* Navigation component extended to hydrate Adobe Client Data Layer.

* Multiple bug fixes.

## Release Date: October 2020

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 1.5.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |1.5.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Venia Reference Site| 2020.10.27|[Release Notes](https://github.com/adobe/aem-cif-guides-venia/releases)|

### What's New {#what-is-new-october}

* A new Category carousel component was added to enable business users to drag and drop this component on AEM content pages to enrich content pages with commerce data.

* CIF core components extended to hydrate the Adobe Client Data Layer by sending commerce data. The Adobe Client Data Layer is a standardized method to collect data and communicate the data to Digital Analytics and reporting servers. For more details, see [Adobe Client Data Layer](https://github.com/adobe/adobe-client-data-layer/wiki).

* Product Detail and Product List pages extended to automatically populate SEO metadata (such as title, meta description, meta keywords) configured from within the Adobe Commerce admin UI

* Commerce teaser component bug fixed.

## Release Date: September 2020

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 1.4.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |1.4.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Venia Reference Site| 2020.10.2|[Release Notes](https://github.com/adobe/aem-cif-guides-venia/releases)|

### What's New {#what-is-new-september}

* Supports queries for Adobe Commerce 2.4.0 Schema.

* Account information features added to allow shoppers to update personal information.

* A lazy loading pagination style is implemented for Product list and Search results pages to allow developers to configure these components to display the "Load more" button as the pagination style.

* The password reset page is implemented to allow shoppers to be able to update/reset their account password.

* Support for Bundled products types is available.

* Developers can configure the HTML tags for Product Carousel, Related Products, and Featured Category List components to follow SEO best practices.

* My Account bugs fixed.

* Multiple bug fixes.

## Release Date: August 2020

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 1.3.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |1.3.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Venia Reference Site| 2020.9.2|[Release Notes](https://github.com/adobe/aem-cif-guides-venia/releases)|

### What's New {#what-is-new-august}

* Breadcrumb component added to support content and commerce pages.

* Commerce tab added on Page properties to expose CIF properties for Landing Page and Experience Fragments.

* The Searchbar component is improved to support the option to display placeholder text

* Added flexibility to Product and Product Teaser components to support easy customizations.

* Added flexibility to override and configure the default CTA button label for the Product Teaser component.

* The Address Book component is improved to allow registered shoppers to choose shipping and billing addresses saved in the address book during checkout.

* Multiple bug fixes.

## Release Date: July 2020

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 1.2.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |1.2.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Venia Reference Site| 2020.8.14|[Release Notes](https://github.com/adobe/aem-cif-guides-venia/releases)|

### What's New {#what-is-new-july}

* CIF Venia Reference Site was extracted from the CIF Archetype repo and is now a standalone GitHub repository.

* CIF Archetype merged with AEM Project Archetype. For new projects, use [AEM Project Archetype](https://github.com/adobe/aem-project-archetype) as the starting point.

* Address book management was added to allow signed-in users to manage their addresses.

* CIF Cloud Configuration UI supports publish/unpublish actions.

### What's Improved {#what-is-improved-july}

* Sign-in component moved to user drop-down for easy access.

* Simplified the aem-core-cif-react-components package.

* Multiple bug fixes.

## Release Date: June 2020

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 1.1.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |1.1.1|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Archetype |0.11.0|[Release Notes](https://github.com/adobe/aem-cif-project-archetype/releases)|

### What's New {#what-is-new-june}

This is the first version of CIF Core Components that is supported on Adobe Experience Manager.

* Added product sorting on the Product List page and Search Results page to allow shoppers to sort based on relevance, price, and product name.

* Added category filtering as a facet to allow shoppers to filter based on category.

* Added service user mapping as part of security requirement to ensure access to /conf via service users and not by directly manipulating ACLs. CIF Core Components must use a service user to access configurations.

### What's Improved {#what-is-improved-june}

* The Product List page and Search Result page display the total number of items. The number of items is updated when shopper applied filters.

* Faceted search is optimized by combining a category query with a product search query.

* Category/Product pickers for page preview honor cq:catalogPath.

* Multiple bug fixes.

## Release Date: May 2020

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 1.0.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |1.0.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Archetype |0.11.0|[Release Notes](https://github.com/adobe/aem-cif-project-archetype/releases)|

### What's New {#what-is-new-may}

* Supports queries for Adobe Commerce 2.3.5 Schema.

* Faceted Search support added to Search Page and Product List Page to allow shoppers to filter search results based on Product facets.

* New OSGi service added to customize PDP/PLP URLs for SEO purposes. For more details, see the [documentation](https://github.com/adobe/aem-core-cif-components).

* Product Binding is automatically created when a Cloud Configuration is created.

### What's Improved

* Cloud Configuration extended to display the "Create Folder" action.

* Multiple bug fixes applied.

## Release Date: April 2020

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 0.10.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |0.10.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Archetype |0.10.0|[Release Notes](https://github.com/adobe/aem-cif-project-archetype/releases)|

### What's New {#what-is-new-april}

* Configuration settings for CIF Connector are unified and simplified. For more details checkout [Getting Started](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/content-and-commerce/home.html) or [New AEM CIF Project Setup](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/content-and-commerce/home.html)

### What's Improved {#what-is-improved-april}

* Shopping cart and checkout flow extended to support registered shoppers.

* Extended internationalization support across all components.

* Support for Grouped Products and Virtual Products is available.

* Related Products, Product Carousel, and Featured Category components improved to support optional title.

* Multiple bug fixes applied.

## Release Date: February 2020

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 0.9.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |0.9.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Archetype |0.9.0|[Release Notes](https://github.com/adobe/aem-cif-project-archetype/releases)|

### What's New {#what-is-new-february}

* Supports queries for Adobe Commerce 2.3.4 Schema.

* Added search support in Category Picker.

* Pagination in the Category List component to support large catalog sets.

### What's Improved {#what-is-improved-february}

* Shopping cart enhanced to display discounts.

* Product Detail, Product Teaser, and Product List components support display of advanced pricing information.

* Product search in Product Console and Product Picker improved.

* Multiple bug fixes applied.

## Release Date: January 2020

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 0.8.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |0.8.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Archetype |0.7.0|[Release Notes](https://github.com/adobe/aem-cif-project-archetype/releases)|

### What's New {#what-is-new-january}

* Experience Fragment (XF) component added to enable customers to create XF in their commerce project.

* Change the password functionality available in my account.

* i18n support for AEM CIF server-side core components.

* Generic related product component is available.

### What's Improved {#what-is-improved-january}

* Support to display CTA button on product teaser.

* Option to change/select images in the Featured Category List component.

* Option to hide/display title/banner in the Product List component.

* Drag and drop feature applied to the Product Carousel component.

* Multiple bug fixes applied.

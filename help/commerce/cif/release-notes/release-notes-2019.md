---
title: AEM Content and Commerce Release Notes 2019
description: AEM Content and Commerce Release Notes 2019
exl-id: 7e61a75d-6b35-46ee-b88a-444c10b2708f
---
# Commerce Integration Framework GitHub Release Overview

## Release Date: November, 2019

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 0.7.1|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |0.6.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Archetype |0.6.2|[Release Notes](https://github.com/adobe/aem-cif-project-archetype/releases)|

### What's New {#what-is-new-november}

* Authors can preview product detail and product list pages with products/categories with a new "View with product/category" option in the Sites editor.

* Authors can tag assets by product SKU and search for product-specific assets by SKU.

* Add/remove coupon support added in shopping cart.

* Braintree payment support added in AEM Venia store front.

### What's Improved {#what-is-improved-november}

* Category/Product pickers enhanced to respect specified Adobe Commerce store view in a multi-store setup.

* React-based components available as a npm package. This allows developers to use the React Components package as a dependency for a new React project to allow customization of existing components or develop new React-based components.

* GraphQL query customization simplified. This allows developers to customize CIF core components with less code.

## Release Date: October, 2019

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 0.6.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |0.5.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Archetype |0.5.0|[Release Notes](https://github.com/adobe/aem-cif-project-archetype/releases)|

### What's New {#what-is-new-october}

* Fully authorable templates for product detail page and product list page. Authors can now create new templates and drag and drop product list and product detail components on these templates. In addition to adding other components, authors can now change the layout of these templates too, giving them unlimited freedom to create amazing experiences combining marketing and commerce content.

* All author-friendly CIF core-components have been enhanced to support [AEM's Style System](https://helpx.adobe.com/experience-manager/6-5/sites/authoring/using/style-system.html). Example styles have been provided for the product list component.

* React-based client-side components for account management. This release supports the following functionalities: Sign In, Forgot Password, and Create Account.

### What's Improved {#what-is-improved-october}

* Product detail and product list components have been enhanced to show dummy data to provide authors with a preview of the layout when these components are placed on a template/page.

* Minicart and Checkout components now use React hooks for improved extensibility.

## Release Date: September, 2019

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 0.5.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |0.4.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Archetype |0.4.0|[Release Notes](https://github.com/adobe/aem-cif-project-archetype/releases)|

### What's New {#what-is-new-september}

* Multi-template feature to allow authors to enrich specific product detail page or product list page. Authors can easily create a custom product detail page or product list page and use the product or category picker to assign the custom page to a specific product(s) or category(s).

* Multi-catalog binding to allow authors to bind multiple catalogs in the AEM product console. Authors can also edit and view the catalog binding properties after creating the binding.

* React-based client-side Checkout and Mini Cart using GraphQL to support a complete basic shopping journey.

* Checkout component includes address forms, payment selection, and shipping method selection.

### What's Improved {#what-is-improved-september}

* Product Teaser and Product Carousel components support product variants.

## Release Date: August, 2019

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 0.4.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |0.3.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Archetype |0.3.0|[Release Notes](https://github.com/adobe/aem-cif-project-archetype/releases)|

### What's New {#what-is-new-august}

* Embedding CIF Connector in CIF Archetype made optional to provide developers more flexibility.  

* CIF Components decoupled from "Venia" specific CSS styling to allow developers to apply CSS styling of their choice.

* Multi-store/site feature to allow use of CIF Core Components on multiple AEM site structures and enabling the underlying GraphQL client implementation to connect to different Adobe Commerce store/store views.

* GraphQL caching enabled for certain GraphQL queries via HTTP GET to reduce response time.

* Product description view enabled in AEM Products console.

* Commerce Teaser extends WCM Teaser component to allow authors to also add CTA fields to a product detail page or a product list page.

* Button to allow authors to place on an AEM page and link to either an AEM page, product detail page, product list page, or an external link.

### What's Improved {#what-is-improved-august}

* Adobe Commerce store configuration moved from OSGi to AEM Product console to make the integration setup more author-friendly.

## Release Date: July, 2019

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 0.3.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |0.2.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|
|CIF Archetype |0.2.0|[Release Notes](https://github.com/adobe/aem-cif-project-archetype/releases)|

### What's New {#what-is-new-july}

* First CIF Archetype to provide developers with several deployment options: 1.Deploy AEM Venia storefront 2. Deploy scaffolding for a new project 3. Use CIF elements in an existing project

* Multi-level catalog navigation to support navigation through categories and sub-categories.

* Pagination on category pages for better UX.

* Client-side rendering of price attribute in Product Detail and Product List components to support rendering of dynamic attributes.

* Server-side Product Carousel to display list of featured products in a carousel style.

* Server-side Featured Category List to display list of categories on an AEM page.

### What's Improved {#what-is-improved-july}

* Support for Adobe Commerce 2.3.2 and bug fixes related to product properties display in the product console.

## Release Date: June, 2019

|GitHub| Version| Detailed Release Notes|
|:-------|:-----:|---------------------:|
|CIF Connector | 0.2.0|[Release Notes](https://github.com/adobe/commerce-cif-connector/releases)|
|CIF Core Components |0.1.0|[Release Notes](https://github.com/adobe/aem-core-cif-components/releases)|

### What's New {#what-is-new-june}

* AEM B2C storefront with mobile-first Venia CSS styling, landing page, dynamic catalog navigation via product and category pages, product search page, and shopping cart capabilities to kickstart and accelerate commerce projects.

* CIF Connector and authoring tools (Product Console, Product Picker, and Category Picker) to enable authors to create experiences in AEM with commerce content.

* First version of CIF Core Components compatible with Adobe Commerce 2.3.1:
  * Product Detail
  * Product List
  * Product Teaser
  * Navigation
  * Product Search
  * Shopping Cart (REST)

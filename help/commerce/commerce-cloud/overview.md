---
title: Introduction to AEM Commerce as a Cloud Service
description: Experience Manager Commerce as a Cloud Service consists of Commerce Integration Framework (CIF), which is Adobe's recommended pattern to integrate and extend commerce services from Magento and other third-party commerce solutions with the Experience Cloud.
thumbnail: introducing-aem-commerce.jpg
---

# Introducing AEM Commerce as a Cloud Service {#commerce-intro}

Experience Manager Commerce as a Cloud Service consists of Commerce Integration Framework (CIF), which is Adobe's recommended pattern to integrate and extend commerce services from Magento and other third-party commerce solutions with the Experience Cloud. This enables Adobe Customers to deliver extraordinary and personalized omnichannel shopping experience based on state-of-the-art technology.

The Commerce Integration Framework is an add-on module for Experience Manager as a Cloud Service and provides a set of authoring tools, components, and a reference storefront to accelerate the development of integrations between Experience Manager as a Cloud Service and commerce solutions.

## CIF Benefits {#cif-benefits}

The main benefits are:

* The integration is an abstraction layer to standardize and encapsulate integrations with multiple systems. 

* CIF supports headless/omnichannel experiences:

   * Single Page applications and Multi-Page Applications
   * GraphQL endpoints
   
* CIF provides serverless, microservice-based process and business logic layer for customization and extension of commerce services.

* CIF provides out-of-the-box integrations with Adobe solutions such as AEM and Magento

## CIF Elements {#cif-elements}

![CIF Elements](/help/commerce-cloud/assets/cif-overview1.jpg)


### CIF add-On for Authoring tools {#add-on-authoring-tools}

The CIF add-On provides access to commerce authoring tooling such as Product Console, Product & Category Pickers or product search for authors to empower them to create rich experiences with marketing and commerce content. The add-on also manages the backend connection to Magento (or alternative commerce system) via GraphQL. Once the add-on is provisioned it is deployed on AEM as a Cloud Service environments automatically.

### AEM CIF Core Components {#aem-cif-core}

The AEM CIF Core Components are server-side and client-side rendered components with Magento GraphQL support. They're used to create static, cacheable and SEO-friendly commerce storefornt based on AEM technologies.

Basic components are provided, common across commerce implementations such as Product Detail, Product List, Navigation, Search, etc. They can be used as-is or be extended.

The [AEM CIF Core Components](https://github.com/adobe/aem-core-cif-components) work like the [AEM Sites Core Components](https://github.com/adobe/aem-core-wcm-components) but are dedicated to commerce specific use-cases.

These components key benefits are:

* They are easy to use in your projects.
* They can be used as-is or with very minimal modifications.
* They provide best practices for connecting with Magento via GraphQL APIs or REST APIs

Components such as Product Teaser and Product Carousel are provided to enable AEM Authors to create Experience pages in AEM, combining marketing and commerce content. These components can be easily dragged and dropped on to a content page created in AEM and linked to specific products or categories using the CIF Authoring tools such as the Product or Category Picker in Cloud Service.

All the components are open-sourced on [GitHub](https://github.com/adobe/aem-core-cif-components). This shows full transparency on changes made going forward and allows you to get the latest version very easily. You can also provide pull requests for improvements and bug fixes that can be incorporated.

### AEM Venia Storefront {#aem-venia-storefront}

The [AEM Venia Storefront](https://github.com/adobe/aem-cif-guides-venia) is a modern production-ready reference storefront showcasing a basic B2C commerce journey. It can be used to kickstart commerce projects and accelerate projects using AEM, CIF, and Magento. It demonstrates best practices for integrating AEM and Magento and shows how to use the [AEM CIF Core Components](https://github.com/adobe/aem-core-cif-components) and [AEM Sites Core Components](https://github.com/adobe/aem-core-wcm-components) and supports Adobe Commerce GraphQL endpoints. It also provides pre-sales with a reference site to demo the integration between AEM and Magento.

The AEM Venia Storefront is a mixed page application in which AEM owns the glass and Magento powers the commerce backend in a headless way. Both server-side rendering and client-side rendering are used in the storefront. Server-side rendering is used to deliver static content and client-side rendering is used to deliver dynamic content.

Product and catalog pages are relatively static and are rendered server-side using AEM CIF Core Components such as Product Detail and Product List on generic templates created in AEM. These components get data from Magento via GraphQL APIs.
These pages are created dynamically, rendered on the server, cached on the AEM dispatcher and then delivered to the browser.
For more dynamic attributes such as inventory or price, on the other hand, client-side components are used. Client-side components or Web components fetch data directly from Magento via GraphQL APIs and the content is then rendered on the browser.

#### Checkout {#checkout}

This reference storefront uses client-side Cart component that renders the shopping cart and the checkout form to demonstrate a full experience integration pattern where you can deliver commerce experiences with Magento running in a completely headless way and AEM owning the glass. It is recommended to use the provided abstracted payment methods. This puts the browser client in direct communication with the payment gateway provider so that neither Adobe nor Magento clouds hold or pass PCI sensitive data.

#### Account Management {#account-management}

Account management is handled by Magento and the reference storefront utilizes client-side React-based components to enable AEM to render the experience for the following functionalities: Create Acct, Sign In, and Forgot Password.

The AEM Venia Storefront project is open source and for more details, refer to [AEM Venia Storefront](https://github.com/adobe/aem-cif-guides-venia).

### AEM Project Archetype {#aem-project-archtype}

The [AEM Project Archetype](https://docs.adobe.com/content/help/en/experience-manager-core-components/using/developing/archetype/overview.html) can be used to create a minimal, best-practices-based Adobe Experience Manager project as a starting point for your own AEM projects. Optionally [AEM CIF Core Components](https://github.com/adobe/aem-core-cif-components) can be included into a newly generated project.

### CIF Extension Layer {#cif-extension}

The CIF extension layer is a middle layer to host complex business logic. It runs on the Adobe I/O Runtime platform which is Adobe's serverless platform. It allows you to extend end-to-end service calls by injecting business and process logic on a microservice level. Business logic would be for example to use location and channel to determine an inventory strategy. Process logic would be for example to retrieve personalized information. 

### CIF Integration Layer {#cif-integration-layer}

The CIF integration layer is used to standardize integrations with other commerce solutions. It runs on the Adobe I/O Runtime platform which is Adobe's serverless platform and enables integrations at a microservice level by mapping third party APIs against the Adobe Commerce APIs. To help you get started on building third party integrations with AEM, we have created a [reference implementation](https://github.com/adobe/commerce-cif-graphql-integration-reference) to demonstrate how a non-Magento commerce backend can be integrated via Adobe Commerce APIs (Magento GraphQL APIs). 

## AEM Commerce Integration Patterns {#aem-commerce-integration}

Some of the commonly implemented AEM Commerce integration patterns are shown below.

![AEM CIF Integration Patterns](/help/commerce-cloud/assets/aem-cif-integration-patterns-updated.JPG)


### Integration Pattern 1 {#integration-pattern-one}

This is our recommended integration pattern where AEM owns the entire glass and integrates commerce services via Adobe Commerce GraphQL APIs. This pattern unlocks AEM's full flexibility to tailor rich media site designs across devices. This integration pattern is supported by CIF as an out-of-the-box solution.


### Integration Pattern 2 {#integration-pattern-two}

This pattern depicts a fully headless way of delivering content and commerce. The delivery is fully client-side. In this pattern content is delivered via API and HTML and Commerce data is delivered via GraphQL. This pattern is currently not supported by CIF out-of-the-box.
 

### Integration Pattern 3 {#integration-pattern-three}

In this pattern, Magento owns the glass and embeds AEM authored content. The AEM authored content can be delivered via Experience Fragments or Content Fragments. This integration pattern will require project-specific work and cannot be implemented out-of-the-box with CIF.


### Integration Pattern 4 {#integration-pattern-four}

This is a common integration pattern where the glass or presentation layer is split between AEM and a Commerce solution. Usually, the Commerce solution delivers the non-marketing pages such as checkout and my account and AEM delivers the marketing pages and storefront catalog experience. In this pattern, you need to ensure that carts and user sessions are handled properly between the two systems to avoid a disjointed user experience. For e.g. Magento stores the cart & user session in a cookie, which can be shared between AEM & Magento. This pattern will require project-specific work and cannot be implemented out-of-the-box with CIF.

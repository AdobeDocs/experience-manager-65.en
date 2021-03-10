---
title: AEM and 3rd Party Commerce Integration using Commerce Integration Framework
description: Enterprise businesses may require additional 3rd party commerce solutions to power their storefront. The Commerce Integration Framework (CIF) can be used in such integration scenarios to connect a 3rd party commerce solution to Adobe Experience Manager using I/O Runtime.
thumbnail: cif-third-party-architecture.jpg
---

# AEM and 3rd Party Commerce Integration using Commerce Integration Framework {#aem-third-party}

Enterprise businesses may require additional 3rd party commerce solutions to power their storefront. The Commerce Integration Framework (CIF) can be used in such integration scenarios where in addition to Magento, a 3rd party commerce solution also needs to be integrated with AEM. CIF provides elements such as an accelerator reference storefront, AEM CIF Core Components and authoring tools that work with Magento out-of-the-box. To integrate AEM and a 3rd party commerce solution and re-use these CIF elements, some additional development is needed.

## Architecture {#architecture}

The overall architecture is as follows:

![AEM non-Magento/3rd Party Architecture Overview](/help/commerce-cloud/assets/AEM_nonMagento_Architecture.JPG)

The main difference between the integration architecure for AEM - Magento and AEM - 3rd party commerce is the addition of an integration and data transformation layer as shown in the image above. The integration layer needs to be hosted on the Adobe I/O Runtime platform which is Adobe's serverless platform. You can learn more about Adobe I/O Runtime [here](https://www.adobe.io/apis/experienceplatform/runtime.html).

The purpose of this integration layer is to map a non-Magento or a 3rd-party's APIs against Adobe Commerce APIs (Magento GraphQL APIs). This mapping allows the [AEM CIF Core Components](https://github.com/adobe/aem-core-cif-components) and CIF authoring tools to retrieve data from the non-Magento solution. With this approach, the integration layer encapsulates the integration logic and creates a separation of concern between AEM and the 3rd party solution. This allows the usage of the CIF elements in an agnostic way with various 3rd party solutions. The advantages of using CIF elements in your project have been described in the [Introduction](/help/commerce-cloud/overview.md).

## Develop an Integration {#develop-integration}

To help you get started on building the required integration layer to integrate a non-Magento/3rd party solution with AEM, we have created a [reference implementation](https://github.com/adobe/commerce-cif-graphql-integration-reference) to demonstrate this. This reference can be used as a starting point in your project.

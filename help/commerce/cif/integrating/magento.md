---
title: AEM and Adobe Commerce Integration using Commerce Integration Framework
description: AEM and Adobe Commerce are seamlessly integrated using the Commerce Integration Framework (CIF). CIF enables AEM to access an Adobe Commerce instance and communicate with Adobe Commerce via GraphQL. It also allows AEM Authors to use Product and Category Pickers and the Product Console to browse through product and category data fetched on-demand from Adobe Commerce . In addition, CIF provides an out-of-the-box storefront that can accelerate commerce projects.
thumbnail: aem-magento-architecture.jpg
exl-id: f843784c-5ff7-41d1-97c5-13facb8459b2
solution: Experience Manager,Commerce
feature: Commerce Integration Framework
role: Admin, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: eadea719-cf89-469b-a6fd-a236a7138047
    internal-label: Commerce
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# AEM and Adobe Commerce (Magento) integration Using Commerce Integration Framework {#aem-commerce-framework}

The Experience Manager and Adobe Commerce are seamlessly integrated using the Commerce Integration Framework (CIF). CIF enables AEM to directly access and communicate with the commerce instance using Adobe Commerce's [GraphQL APIs](https://devdocs.magento.com/guides/v2.4/graphql/).

>[!NOTE]
>
>Minimum supported GraphQL API version is 2.3.5. Certain features are only supported in newer versions or just in the Adobe Commerce edition.

## Architecture Overview {#overview}

The overall architecture is as follows:

![CIF Architecture Overview](../assets/AEM_Magento_Architecture.png)

Within CIF, there is support for server-side and client-side communication patterns.
Server-side APIs calls are implemented using the build-in, generic [GraphQL client](https://github.com/adobe/commerce-cif-graphql-client) in combination with a [set of generated data models](https://github.com/adobe/commerce-cif-magento-graphql) for the commerce GraphQL schema. Additionally, any GraphQL query or mutation in GQL format can be used.

For the client-side components, which are build using [React](https://reactjs.org/), the [Apollo Client](https://www.apollographql.com/docs/react/) is used.

## AEM CIF Core Component Architecture {#cif-core-components}

![AEM CIF Core Component Architecture](../assets/cif-component-architecture.jpg)

[AEM CIF Core Components](https://github.com/adobe/aem-core-cif-components) follow very similar design patterns and best practices as the [AEM WCM Core Components](https://github.com/adobe/aem-core-wcm-components).

The business logic and backend communication with Adobe Commerce for the AEM CIF Core Components is implemented in Sling Models. In case it is necessary to customize this logic to fulfill project-specific requirements, the delegation Pattern for Sling Models can be used.

>[!TIP]
>
>The [Customizing AEM CIF Core Components](../customizing/customize-cif-components.md) page has a detailed example and best practice on how to customize CIF Core Components.

Within projects, AEM CIF Core Components and custom project components can easily retrieve the configured client for an Adobe Commerce store associated with an AEM page via Sling Context-Aware configuration.

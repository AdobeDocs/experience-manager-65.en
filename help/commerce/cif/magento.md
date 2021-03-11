---
title: AEM and Magento Integration using Commerce Integration Framework
description: AEM and Magento are seamlessly integrated using the Commerce Integration Framework (CIF). CIF enables AEM to access a Magento instance and communicate with Magento via GraphQL. It also allows AEM Authors to use Product and Category Pickers and the Product Console to browse through product and category data fetched on-demand from Magento. In addition, CIF provides an out-of-the-box storefront that can accelerate commerce projects.
thumbnail: aem-magento-architecture.jpg
---

# AEM and Magento Integration using Commerce Integration Framework {#aem-magento-framework}

AEM and Magento are seamlessly integrated using the Commerce Integration Framework (CIF). CIF enables AEM to access a Magento instance and communicate with Magento via GraphQL. It also allows AEM Authors to use Product and Category Pickers and the Product Console to browse through product and category data fetched on-demand from Magento. In addition, CIF provides an out-of-the-box storefront that can accelerate commerce projects.

## Architecture Overview {#overview}

The overall architecture is as follows:

![CIF Architecture Overview](../assets/AEM_Magento_Architecture.JPG)

CIF builds upon GraphQL support. The main communication channel between AEM and Magento is Magento's [GraphQL API](https://devdocs.magento.com/guides/v2.4/graphql/) API. There are different ways to configure the communication between AEM as a Cloud Service and Magento, see [Getting Started](../getting-started.md) page for details.

Within CIF there is support for server-side and client-side communication patterns.
Server-side APIs calls are implemented using the build-in, generic [GraphQL client](https://github.com/adobe/commerce-cif-graphql-client) in combination with a [set of generated data models](https://github.com/adobe/commerce-cif-magento-graphql) for the Magento GraphQL schema. Additionally, any GraphQL query or mutation in GQL format can be used.

For the client-side components, which are build using [React](https://reactjs.org/), the [Apollo Client](https://www.apollographql.com/docs/react/) is used.

## AEM CIF Core Component Architecture {#cif-core-components}

![AEM CIF Core Component Architecture](../assets/cif-component-architecture.jpg)

[AEM CIF Core Components](https://github.com/adobe/aem-core-cif-components) follow very similar design patterns and best practies as the [AEM WCM Core Components](https://github.com/adobe/aem-core-wcm-components).

The business logic and backend communication with Magento for the AEM CIF Core Components is implemented in Sling Models. In case it is necessary to customize this logic to fulfill project-specific requirements the delegation Pattern for Sling Models can be used.

>[!TIP]
>
>The [Customizing AEM CIF Core Components](../customizing/customize-cif-components.md) page has a detailed example and best practice on how to customize CIF Core Components.

Within projects, AEM CIF Core Components and custom project components can easily retrieve the configured client for a Magento store associated with an AEM page via Sling Context-Aware configuration.

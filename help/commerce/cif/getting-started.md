---
title: Getting started with AEM Content and Commerce
description: Learn how to deploy an AEM Content and Commerce project.
topics: Commerce
feature: Commerce Integration Framework
doc-type: tutorial
kt: 4947
thumbnail: 37843.jpg
exl-id: 73ba707e-5e2d-459a-8cc8-846d1a5f2fd7,b6625d14-a505-4fd1-877b-c15c82a1763d
---
# Getting started with AEM Content and Commerce {#start}

To get started with AEM Content and Commerce, you need an active AEM CIF add-on license as part of your AEM contract.

## Onboarding {#onboarding}

The onboarding for AEM Content and Commerce is a two-step process:

1. Download and install the CIF add-on from the [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html) portal.

    >[!NOTE]
    >
    >This will be done by the CSE for AEM Managed Service customers

2. Connect AEM with your commerce solution

    To connect the CIF add-on & the [AEM CIF Core Components](https://github.com/adobe/aem-core-cif-components) with a commerce solution, you need to provide the  GraphQL endpoint URL via the OSGi configuration.

<!---
This environment variable is used in two places:

- GraphQL calls from AEM to commerce backend, via some common shareable GraphQl client, used by the AEM CIF Core Components and customer project components.
- Setup a GraphQL proxy URL on each AEM environment the variable is set available at `/api/graphql`. This is used by the AEM commerce authoring tools (CIF add-on) and CIF client-side components.

A different  GraphQL endpoint URL can be used for each AEM as a Cloud Service environment. That way projects can connect AEM staging environments with commerce staging systems and AEM production environment to a commerce production system. That GraphQL endpoint must be publicly available, private VPN or local connections are not supported. Optionally, an authentication header can be provided in order to use additional CIF features that require authentication.

Optional and only for Adobe Commerce Enterprise / Cloud the CIF add-on supports the use of staged catalog data for AEM authors. This requieres to configure an authorization token. The configured authorization token is only available and used on AEM author instances for security reasons. AEM publish instances cannot show staged data.
--->

## Configuring stores and catalogs {#catalog}

The CIF add-on and the [CIF Core Components](https://github.com/adobe/aem-core-cif-components) can be used on multiple AEM site structures connected to different commerce stores (or store views, etc). By default, the CIF add-on is deployed with a default config connecting to Adobe Commerce's default store and catalog (Magento).

This configuration can be adjusted for the project via the CIF Cloud Service config following these steps:

1. In AEM go to Tools -> Cloud Services -> CIF Configuration

2. Select the commerce configuration you want to change

3. Open the configuration properties via the action bar

![CIF Cloud Services Configuration](/help/commerce/cif/assets/cif-cloud-service-config.png)

The following properties can be configured:

- GraphQL Client - select the configured GraphQL client for commerce backend communication. This should typically stay at default.
- Store View - the (Magento) store view identifier. If empty, the default store view will be used.
- GraphQL Proxy Path - the URL path GraphQL Proxy in AEM use to proxy requests to the commerce backend GraphQL endpoint.
    >[!NOTE]
    >
    > In most setups the default value `/api/graphql` must not be changed. Only advanced setup not using the provided GraphQL proxy should change this setting.
- Enable Catalog UID Support - enable support for UID instead of ID in the commerce backend GraphQL calls.
    >[!NOTE]
    >
    > Support for UIDs got introduced in Adobe Commerce (Magento) 2.4.2. Only enable this if your commerce backend supports a GraphQL schema of version 2.4.2 or later.
- Catalog Root Category Identifier - the identifier (UID or ID) of the store catalog root

The configuration shown above is for reference. Projects should provide thier own configurations.

For more complex setups using multiple AEM site structures combined with different commerce catalogs see the [Commerce Multi-Store Setup](configuring/multi-store-setup.md) tutorial.

## Additional Resources {#additional-resources}

- [AEM Project Archetype](https://github.com/adobe/aem-project-archetype)
- [AEM Venia Reference Store](https://github.com/adobe/aem-cif-guides-venia)
- [Commerce Multi-Store Setup](configuring/multi-store-setup.md)

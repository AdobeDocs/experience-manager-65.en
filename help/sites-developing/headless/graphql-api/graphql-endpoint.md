---
title: Manage GraphQL endpoints in AEM
description: Learn how to manage GraphQL endpoints in Adobe Experience Manager for headless content delivery.
exl-id: a59a5e50-0787-4c1c-a83d-bb3eac1479a8
---
# Manage GraphQL endpoints in AEM {#graphql-aem-endpoint}

The endpoint is the path used to access GraphQL for AEM. Using this path you (or your app) can:

* access the GraphQL schema,
* send your GraphQL queries, 
* receive the responses (to your GraphQL queries).

There are two types of endpoints in AEM:

* Global
  * Available for use by all sites.
  * This endpoint can use all Content Fragment Models from all Sites configurations (defined in the [Configuration Browser](/help/assets/content-fragments/content-fragments-configuration-browser.md#enable-content-fragment-functionality-in-configuration-browser)).
  * If there are any Content Fragment Models that should be shared among Sites configurations, then these should be created under the global Sites configurations.
* Sites configurations:
  * Corresponds to a Sites configuration, as defined in the [Configuration Browser](/help/assets/content-fragments/content-fragments-configuration-browser.md#enable-content-fragment-functionality-in-configuration-browser).
  * Specific to a specified site/project.
  * A Sites configuration specific endpoint will use the Content Fragment Models from that specific Sites configuration together with those from the global Sites configuration.

>[!CAUTION]
>
>The Content Fragment Editor can allow a Content Fragment of one Sites configuration to reference a Content Fragment of another Sites configuration (via polices). 
>
>In such a case not all content will be retrievable using a Sites configuration specific endpoint. 
>
>The content author should control this scenario; for example, it may be useful to consider putting shared Content Fragment Models under the Global Sites configuration.

The repository path of the GraphQL for AEM global endpoint is:

`/content/cq:graphql/global/endpoint`

For which your app can use the following path in the request URL:

`/content/_cq_graphql/global/endpoint.json`

To enable an endpoint for GraphQL for AEM you need to:

* [Enable your GraphQL Endpoint](#enabling-graphql-endpoint)
* [Publish your GraphQL Endpoint](#publishing-graphql-endpoint)

## Enabling your GraphQL Endpoint {#enabling-graphql-endpoint}

To enable a GraphQL Endpoint you first need to have an appropriate configuration. See [Content Fragments - Configuration Browser](/help/assets/content-fragments/content-fragments-configuration-browser.md).

>[!CAUTION]
>
>If the [use of content fragment models have not been enabled](/help/assets/content-fragments/content-fragments-configuration-browser.md), the **Create** option will not be available.

To enable the corresponding endpoint:

1. Navigate to **Tools**, **Assets**, then select **GraphQL**.
1. Select **Create**.
1. The **Create new GraphQL Endpoint** dialog will open. Here you can specify:
   * **Name**: name of the endpoint; you can enter any text.
   * **Use GraphQL schema provided by**: use the dropdown to select the required site/project.

   >[!NOTE]
   >
   >The following warning is shown in the dialog:
   >
   >* *GraphQL endpoints may introduce data security and performance issues if not managed carefully. Please ensure to set appropriate permissions after creating an endpoint.*
   
1. Confirm with **Create**.
1. The **Next steps** dialog will provide a direct link to the Security console so that you can ensure that newly created endpoint has suitable permissions.

   >[!CAUTION]
   >
   >The endpoint is accessible to everyone. This can - especially on publish instances - pose a security concern, as GraphQL queries can impose a heavy load on the server.
   >
   >You can set up ACLs, appropriate to your use case, on the endpoint. 

## Publishing your GraphQL Endpoint {#publishing-graphql-endpoint}

Select the new endpoint and **Publish** to make it fully available in all environments.

>[!CAUTION]
>
>The endpoint is accessible to everyone. 
>
>On publish instances this can pose a security concern, as GraphQL queries can impose a heavy load on the server.
>
>You must set up ACLs appropriate to your use case on the endpoint.

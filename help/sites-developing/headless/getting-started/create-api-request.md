---
title: Accessing and Delivering Content Fragments Headless Quick Start Guide
description: Learn how to use AEM's Assets REST API to manage Content Fragments and the GraphQL API for headless delivery of Content Fragment content.
exl-id: 4664b3a4-4873-4f42-b59d-aadbfaa6072f
solution: Experience Manager, Experience Manager Sites
feature: Headless,Content Fragments,GraphQL,Persisted Queries,Developing
role: Admin,Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: c45915cf-e157-4af7-a80d-97b905bcb3a5
    internal-label: Experience Manager Sites
feature_v2:
  - id: bfd4bc52-c397-5127-8f86-8953ba9fc0a3
    internal-label: Headless
  - id: c5d917df-d8bd-5e97-a117-6dde1e9f7103
    internal-label: Developing
  - id: a642c50e-80eb-4fc1-a5d2-f3762d1f841d
    internal-label: Administration
  - id: d429a63e-ade4-4117-b04e-9b996d1c94ef
    internal-label: Integrations
  - id: c124fa01-25c5-42ec-adf6-21d1c114058b
    internal-label: Developer tools
subfeature_v2:
  - id: e9db7c79-8f65-4281-a439-c9049296d903
    internal-label: Content Fragments
  - id: a02b73a7-bdfc-4225-bdfd-69f7891ab55e
    internal-label: GraphQL
  - id: d781bc8f-52af-43f6-84d0-b73e59a130d5
    internal-label: Persisted queries
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Accessing and Delivering Content Fragments Headless Quick Start Guide {#accessing-delivering-content-fragments}

Learn how to use AEM Assets REST API to manage Content Fragments and the GraphQL API for headless delivery of Content Fragment content.

## What are GraphQL and Assets REST APIs? {#what-are-the-apis}

[Now that you have created some content fragments,](create-content-fragment.md) you can use AEM's APIs to deliver them headlessly.

* [The GraphQL API](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md) lets you create requests to access and deliver Content Fragments. 
   * To use this, [endpoints must be defined and enabled in AEM](/help/sites-developing/headless/graphql-api/graphql-endpoint.md#enabling-graphql-endpoint), and if necessary, the [GraphiQL interface installed](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md#installing-graphiql-interface).
* [The Assets REST API](/help/assets/assets-api-content-fragments.md) lets you create and modify Content Fragments (and other assets).

The remainder of this guide focuses on GraphQL access and Content Fragment delivery.

## How to Deliver a Content Fragment Using GraphQL {#how-to-deliver-a-content-fragment}

Information architects must design queries for their channel endpoints to deliver content. Only consider these queries once per endpoint, per model. For this getting started guide, only create one.

1. Log into AEM and access the [GraphiQL interface](/help/sites-developing/headless/graphql-api/graphiql-ide.md):
   * For example: `http://<host>:<port>/aem/graphiql.html`.

1. The GraphiQL is an in-browser query editor for GraphQL. You can use it to build queries to retrieve Content Fragments to deliver them heedlessly as JSON.
   * The left panel lets you build your query.
   * The right panel displays the results.
   * The query editor features code completion and hotkeys to easily execute the query.
   ![GraphiQL editor](assets/graphiql.png)

1. Assuming that the model you created was called `person` with fields `firstName`, `lastName`, and `position`, you can build a simple query to retrieve the content of the Content Fragment.

   ```text
   query 
   {
     personList {
       items {
         _path
         firstName
         lastName
         position
       }
     }
   }
   ```

1. Enter the query into the left panel.
<!--
   ![GraphiQL query](assets/graphiql-query.png)
-->

1. Click the **Execute Query** (right arrow) icon or use the `Ctrl-Enter` hotkey and the results are displayed as JSON in the right panel.
   ![GraphiQL results](assets/graphiql-results.png)

1. Click:
   * **Docs** at the top-right of the page to show in-context documentation to help you build your queries which adapt to your own models.
   * **History** in the top toolbar to show previous queries.
   * **Save As** and **Save** to save your queries, after which you can list and retrieve them from the **Persisted Queries** panel and **Publish**.
   ![GraphiQL documentation](assets/graphiql-documentation.png)

GraphQL enables structured queries that can target not only specific data sets or individual data objects, but can also deliver specific elements of the objects, nested results, offers support for query variables, and much more.

GraphQL can avoid iterative API requests and over-delivery. Instead, it allows for bulk delivery of exactly what is needed for rendering as a response to a single API query. The resulting JSON can be used to deliver data to other sites or apps.

## Next Steps {#next-steps}

That's it! You now have a basic understanding of headless content management in AEM. There are many more resources where you can dive deeper for a comprehensive understanding of the features available.

* **[Configuration Browser](create-configuration.md)** - For details about the AEM Configuration Browser
* **[Content Fragments](/help/assets/content-fragments/content-fragments.md)** - For details about creating and managing Content Fragments
* **[GraphiQL IDE](/help/sites-developing/headless/graphql-api/graphiql-ide.md)** for further details of using the GraphiQL IDE
* **[Persisted Queries](/help/sites-developing/headless/graphql-api/persisted-queries.md)** for further details of Persisted Queries
* **[Content Fragments Support in AEM Assets HTTP API](/help/assets/assets-api-content-fragments.md)** - For details on accessing AEM content directly over the HTTP API, via CRUD operations (Create, Read, Update, Delete)
* **[GraphQL API](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md)** - For details on how to deliver Content Fragments headlessly

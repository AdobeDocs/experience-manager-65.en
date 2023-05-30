---
title: Accessing and Delivering Content Fragments Headless Quick Start Guide
description: Learn how to use AEM's Assets REST API to manage Content Fragments and the GraphQL API for headless delivery of Content Fragment content.
exl-id: 4664b3a4-4873-4f42-b59d-aadbfaa6072f
---
# Accessing and Delivering Content Fragments Headless Quick Start Guide {#accessing-delivering-content-fragments}

Learn how to use AEM's Assets REST API to manage Content Fragments and the GraphQL API for headless delivery of Content Fragment content.

## What are GraphQL and Assets REST APIs? {#what-are-the-apis}

[Now that you have created some content fragments,](create-content-fragment.md) you can use AEM's APIs to deliver them headlessly.

* [The GraphQL API](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md) allows you to create requests to access and deliver Content Fragments. 
   * To use this, [endpoints need to be defined and enabled in AEM](/help/sites-developing/headless/graphql-api/graphql-endpoint.md#enabling-graphql-endpoint), and if required, the [GraphiQL interface installed](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md#installing-graphiql-interface).
* [The Assets REST API](/help/assets/assets-api-content-fragments.md) allows you to create and modify Content Fragments (and other assets).

The remainder of this guide will focus on GraphQL access and Content Fragment delivery.

## How to Deliver a Content Fragment Using GraphQL {#how-to-deliver-a-content-fragment}

Information architects will need to design queries for their channel endpoints in order to deliver content. These queries will generally only need to be considered once per endpoint per model. For the purposes of this getting started guide we will only need to create one.

1. Log into AEM and access the [GraphiQL interface](/help/sites-developing/headless/graphql-api/graphiql-ide.md):
   * For example: `http://<host>:<port>/aem/graphiql.html`.

1. The GraphiQL is an in-browser query editor for GraphQL. You can use it to build queries to retrieve Content Fragments to deliver them headlesly as JSON.
   * The left panel allows you to build your query.
   * The right panel displays the results.
   * The query editor features code completion and hotkeys to easily execute the query.
   ![GraphiQL editor](assets/graphiql.png)

1. Assuming that the model we created was called `person` with fields `firstName`, `lastName`, and `position`, we can build a simple query to retrieve the content of our Content Fragment.

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
   * **Docs** at the top-right of the page to show in-context documentation to help you build your queries which adapts to your own models.
   * **History** in the top toolbar to show previous queries.
   * **Save As** and **Save** to save your queries, after which you can list and retrieve them from the **Persisted Queries** panel and **Publish**.
   ![GraphiQL documentation](assets/graphiql-documentation.png)

GraphQL enables structured queries that can target not only specific data sets or individual data objects, but also can deliver specific elements of the objects, nested results, offers support for query variables, and much more.

GraphQL can avoid iterative API requests as well as over-delivery, and instead allows for bulk delivery of exactly what is needed for rendering as a response to a single API query. The resulting JSON can be used to deliver data to other sites or apps.

## Next Steps {#next-steps}

That's it! You now have a basic understanding of headless content management in AEM. Of course there are many more resources where you can dive deeper for a comprehensive understanding of the features available.

* **[Configuration Browser](create-configuration.md)** - For details about the AEM Configuration Browser
* **[Content Fragments](/help/assets/content-fragments/content-fragments.md)** - For details about creating and managing Content Fragments
* **[GraphiQL IDE](/help/sites-developing/headless/graphql-api/graphiql-ide.md)** for further details of using the GraphiQL IDE
* **[Persisted Queries](/help/sites-developing/headless/graphql-api/persisted-queries.md)** for further details of Persisted Queries
* **[Content Fragments Support in AEM Assets HTTP API](/help/assets/assets-api-content-fragments.md)** - For details on accessing AEM content directly over the HTTP API, via CRUD operations (Create, Read, Update, Delete)
* **[GraphQL API](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md)** - For details on how to deliver Content Fragments headlessly

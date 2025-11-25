---
title: Optimizing GraphQL queries
description: Learn how to optimize your GraphQL queries when Filtering, Paging, and Sorting your Content Fragments in Adobe Experience Manager as a Cloud Service for headless content delivery.
exl-id: 47d0570b-224e-4109-b94e-ccc369d7ac5f
solution: Experience Manager, Experience Manager Sites
feature: Headless,Content Fragments,GraphQL,Persisted Queries,Developing
role: Admin,Developer
---
# Optimizing GraphQL Queries {#optimizing-graphql-queries}

>[!NOTE]
>
>Before you apply these optimization recommendations, consider [Updating your Content Fragments for Paging and Sorting in GraphQL Filtering](/help/sites-developing/headless/graphql-api/graphql-optimized-filtering-content-update.md) for best performance.

These guidelines are provided to help prevent performance issues with your GraphQL queries. 

## GraphQL Checklist {#graphql-checklist}

The following checklist aims to help you optimize the configuration and use of GraphQL in Adobe Experience Manager (AEM) as a Cloud Service.

### First Principles {#first-principles}

#### Use persisted GraphQL queries {#use-persisted-graphql-queries}

**Recommendation**

Use of persisted GraphQL queries is strongly recommended.

Persisted GraphQL queries help reduce query execution performance by utilizing the Content Delivery Network (CDN). Client applications request persisted queries with GET requests for fast edge-enabled execution. 

**Further Reference**

See:

* [Persisted GraphQL queries](/help/sites-developing/headless/graphql-api/persisted-queries.md).
* [Learning to use GraphQL with AEM - Sample Content and Queries](/help/sites-developing/headless/graphql-api/content-fragments-graphql-samples.md)

#### Install the GraphQL Index Package {#install-graphql-index-package}

**Recommendation**

Customers using GraphQL *must* install the Experience Manager Content Fragment with GraphQL Index Package. Doing so lets you add the required index definition based on the features they actually use. Failure to install this package may result in slow or failed GraphQL queries.

See the Release Notes for the version appropriate to your Service Pack. For example, for the latest Service Pack, see [Install GraphQL Index Package for Experience Manager Content Fragments](/help/release-notes/release-notes.md#install-aem-graphql-index-add-on-package) .

>[!NOTE]
>
>Only install this package once per instance; it does not need to be reinstalled with every Service Pack.

**Further Reference**
See:

* [Install GraphQL Index Package for Experience Manager Content Fragments](/help/release-notes/release-notes.md#install-aem-graphql-index-add-on-package)

### Cache Strategy {#cache-strategy}

Various methods of caching can also be used for optimization.

#### Enable AEM Dispatcher caching {#enable-aem-dispatcher-caching}

**Recommendation**

[AEM Dispatcher](https://experienceleague.adobe.com/docs/experience-manager-dispatcher/using/dispatcher.html) is the first level cache within the AEM service, before CDN cache. 

**Further Reference**

See:

* [GraphQL Persisted Queries - enabling caching in the Dispatcher](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md#graphql-persisted-queries-enabling-caching-dispatcher)

#### Use a Content Delivery Network (CDN) {#use-cdn}

**Recommendation**

GraphQL queries and their JSON responses can be cached if targeted as `GET` requests when using a CDN. In contrast, uncached requests can be very (resource) expensive and slow to process, with the potential for further detrimental effects on the origin's resources. 

**Further Reference**

See:

* [Using CDN in AEM](https://experienceleague.adobe.com/docs/experience-manager-dispatcher/using/dispatcher.html#using-dispatcher-with-a-cdn)

#### Set HTTP cache control headers {#set-http-cache-control-headers}

**Recommendation**

When using persisted GraphQL queries with a CDN, it is recommended to set appropriate HTTP cache control headers. 

Each persisted query can have its own specific set of cache control headers. The headers can be set over the [GraphQL API](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md).

They can also be set using the **cURL** command line tool. For example, using a `PUT` request to create a wrapped plain query with cache control.

```shell
$ curl -X PUT \
    -H 'authorization: Basic YWRtaW46YWRtaW4=' \
    -H "Content-Type: application/json" \
    "http://localhost:4502/graphql/persist.json/wknd/plain-article-query-max-age" \
    -d \
'{ "query": "{articleList { items { _path author main { json } referencearticle { _path } } } }", "cache-control": { "max-age": 300 }}'
```

<!-- or the [AEM GraphiQL IDE](/help/sites-developing/headless/graphql-api/graphiql-ide.md#managing-cache). 
-->

**Further Reference**

See:

* [Caching your persisted queries](/help/sites-developing/headless/graphql-api/persisted-queries.md#caching-persisted-queries)
* [How to persist a GraphQL query](/help/sites-developing/headless/graphql-api/persisted-queries.md#how-to-persist-query)
<!--
* [Managing cache for your persisted queries](/help/sites-developing/headless/graphql-api/graphiql-ide.md#managing-cache)
-->

<!--
#### Use AEM GraphQL pre-caching {#use-aem-graphql-pre-caching}

**Recommendation**

This capability allows AEM to further cache content within the scope of GraphQL queries that can then be assembled as blocks in JSON output rather than line by line. 

**Further Reference**

Contact Adobe to enable this capability for your AEM Cloud Service program and environments. 
-->

### GraphQL Query optimization {#graphql-query-optimization}

On an AEM instance with a high number of Content Fragments that share the same model, GraphQL list queries can become costly (in terms of resources).

This is because *all* fragments that share a model being used within the GraphQL query have to be loaded into memory. This consumes both time and memory. Filtering, which may reduce the number of items in the (final) result set, can only be applied **after** loading the entire result set into memory.

This can lead to the impression that even small result sets (can) lead to bad performance. However, in reality the slowness is caused by the size of the initial result set, as it has to be handled internally before filtering can be applied.

To reduce performance and memory issues, this initial result set has to be kept as small as possible.

AEM provides two approaches for optimizing GraphQL queries:

* [Hybrid filtering](#use-aem-graphql-hybrid-filtering)
* [Paging](#use-aem-graphql-pagination) (or pagination)

  * [Sorting](#use-graphql-sorting) is not directly related to optimization, but is related to paging

Each approach has its own use-cases and limitations. This section provides information on Hybrid Filtering and Paging, together with some of the [best practices](#best-practices) for use in optimizing GraphQL queries.

#### Use AEM GraphQL hybrid filtering {#use-aem-graphql-hybrid-filtering}

**Recommendation**

Hybrid filtering combines JCR filtering with AEM filtering.

It applies a JCR filter (in the form of a query constraint) before loading the result set into memory for AEM filtering. This is to reduce the result set loaded into memory, as the JCR filter removes superfluous results prior to this.

>[!NOTE]
>
>For technical reasons (for example, flexibility, nesting of fragments), AEM cannot delegate the entire filtering to JCR. 

This technique keeps the flexibility that GraphQL filters provide, while delegating as much of the filtering as possible to JCR.

>[!NOTE]
>
>AEM Hybrid Filtering requires updating existing Content Fragments

**Further Reference**

See:

* [Updating your Content Fragments for Paging and Sorting in GraphQL Filtering](/help/sites-developing/headless/graphql-api/graphql-optimized-filtering-content-update.md)
* [Sample Query with filtering by _tags ID and excluding variations](/help/sites-developing/headless/graphql-api/content-fragments-graphql-samples.md#sample-filtering-tag-not-variations)

#### Use GraphQL pagination {#use-aem-graphql-pagination}

**Recommendation**

The response time of complex queries, with large result sets, can be improved by segmenting responses into chunks using pagination, a GraphQL standard. 

GraphQL in AEM supports two types of pagination:

* [limit/offset-based pagination](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md#list-offset-limit)
  This is used for list queries; these end with `List`; for example, `articleList`. 
  To use it, you have to provide the position of the first item to return (the `offset`) and the number of items to return (the `limit`, or page size).

* [cursor-based pagination](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md#paginated-first-after) (represented by `first`and `after`)
  This provides a unique ID for each item; also known as the cursor. 
  In the query, you specify the cursor of the last item of the previous page, plus the page size (the maximum number of items to be returned).

  As cursor-based pagination does not fit within the data structures of list-based queries, AEM has introduced `Paginated` query type; for example, `articlePaginated`. The data structures and parameters used follow the [GraphQL Cursor ConnectionSpecification](https://relay.dev/graphql/connections.htm).

  >[!NOTE]
  >
  >AEM currently supports forward paging (using `after`/`first` parameters). 
  >
  >Backward paging (using `before`/`last` parameters) is not supported.

**Further Reference**

See:

* [Sample Pagination Query using first and after](/help/sites-developing/headless/graphql-api/content-fragments-graphql-samples.md#sample-pagination-first-after)

#### Use GraphQL sorting {#use-graphql-sorting}

**Recommendation**

Also a GraphQL standard, sorting enables clients to receive JSON content in sorted order. This can reduce the need for further processing on the client. 

Sorting can only be efficient if all sort criteria are related to top-level fragments.

  If the sorting order includes one, or more, fields that are located on a nested fragment, then all fragments sharing the top-level model must be loaded into memory. This causes a negative performance impact.

>[!NOTE]
>
>Sorting on top-level fields also has an (albeit small) impact on performance.

**Further Reference**

See:

* [Sample Query with filtering by _tags ID and excluding variations, and sort by name](/help/sites-developing/headless/graphql-api/content-fragments-graphql-samples.md#sample-filtering-tag-not-variations)

## Best Practices {#best-practices}

The main goal of all optimization recommendations is to reduce the initial result set. The best practices listed here provide ways to do so. They can (and should) be combined.

### Filter on top-level properties only {#filter-top-level-properties-only}

Currently, filtering at the JCR level only works for top-level fragments.

If a filter addresses the fields of a nested fragment, AEM has to fall back to loading (into memory) all fragments that share the underlying model. 

You can still optimize such GraphQL queries by combining filter expressions on fields of top-level fragments and those on fields of nested fragments with the [AND operator](#logical-operations-in-filter-expressions).

### Use the content structure {#use-content-structure}

In AEM, it is generally considered good practice to use the repository structure to narrow down the scope of content to be processed.

This approach should also be applied to GraphQL queries.

This can be done by applying a filter on the `_path` field of the top-level fragment:

```graphql
{
  someList(filter: {
    _path: {
      _expressions: [ 
        {
          value: "/content/dam/some/sub/path/",
          _operator: STARTS_WITH
        }
      ]
    }
  }) {
    items {
      # ...
    }
  }
}
```

>[!NOTE]
>
>The trailing `/` on `value` is required to achieve the best performance. 

### Use paging {#use-paging}

You can also use paging to reduce the initial result set; especially if your requests do not use any filtering and sorting.

If you filter or sort on nested fragments, paginated queries can still be slow, as AEM may still need to load larger amounts of fragments into memory. Therefore, if you combine filtering and paging, consider the rules for filtering (as mentioned above).

For paging, sorting is equally important, as paginated results are always sorted - either in an explicit or an implicit way.

If you are primarily interested in only retrieving the first few pages, there is no significant difference between using the `...List` or `...Paginated` queries. However, if your application is interested in reading more than just one or two pages, you should consider the `...Paginated` query, as it performs notably better with the later pages.

### Logical operations in filter expressions {#logical-operations-in-filter-expressions}

If you are filtering on nested fragments, you can still apply JCR filtering by providing an accompanying filter on a top-level field that is combined using the `AND` operator.

A typical use-case would be to restrict the scope of the query using a filter on the `_path` field of the top-level fragment, and then filter on additional fields that might be on the top-level, or on a nested fragment.

In this case, the different filter expressions would be combined with `AND`. Therefore, the filter on `_path` can effectively limit the initial result set. All other filters on top-level fields can help with reducing the initial result set as well - as long as they are combined with `AND`.

Filter expressions combined with `OR` cannot be optimized if nested fragments are involved. `OR` expressions can only be optimized if *no* nested fragments are involved.

### Avoid filtering on multiline textfields {#avoid-filtering-multiline-textfields}

The fields of a multiline textfield (html, markdown, plaintext, json) cannot be filtered through a JCR query, as the content of these fields have to be calculated on the fly.

If you still need to filter on a multiline textfield, consider limiting the size of the initial result set by adding additional filter expressions and combine them with `AND`. Limiting the scope through filtering on the `_path` field is a good approach as well.

### Avoid filtering on virtual fields {#avoid-filtering-virtual-fields}

Virtual fields (most fields starting with `_`) are calculated while a GraphQL query is executed, and are therefore outside the scope of JCR-based filtering.

One important exception is the `_path` field, which can be used effectively to reduce the size of the initial result set - if content is structured accordingly (see [Use the content structure](#use-content-structure)).

### Filtering: Exclusions {#filtering-exclusions}

There are several other situations where a filter expression cannot be evaluated on the JCR level (and therefore should be avoided to achieve the best performance):

* Filter expressions on a `Float` value that use the `_sensitiveness` filter option, and where `_sensitiveness` is set to anything other than `0.0` .

* Filter expressions on a `String` value using the `_ignoreCase` filter option.

* Filtering on `null` values.

* Filters on arrays with `_apply: ALL_OR_EMPTY`.

* Filters on arrays with `_apply: INSTANCES`, `_instances: 0`.

* Filter expressions using the `CONTAINS_NOT` operator.

* Filter expressions on a `Calendar`, `Date` or `Time` value that use the `NOT_AT` operator.

### Minimize Content Fragment Nesting {#minimize-content-fragment-nesting}

Nesting Content Fragments is a great way to model custom content structures. You can even have a fragment with a nested fragment that has a nested fragment, that has..., and so on. 

However, creating a structure with too many levels can increase the processing times for a GraphQL query, as GraphQL has to traverse the entire hierarchy of all nested Content Fragments. 

Deep nesting can also have adverse effects on content governance. In general, it is recommended to limit Content Fragment nesting to below five or six levels.

### Do not output all formats (Multi line text elements) {#do-not-output-all-formats}

AEM GraphQL can return text, authored in the **[Multi line text](/help/assets/content-fragments/content-fragments-models.md#data-types)** data type, in multiple formats: Rich Text, Simple Text, and Markdown. 

Outputting all three formats increases the size of text output in JSON by a factor of three. That, combined with generally large result sets from very broad queries, can produce very large JSON responses that therefore take a long time to compute. It is better to limit the output to only the text formats required for rendering the content.

### Modifying Content Fragments {#modifying-content-fragments}

Only modify Content Fragments, and their resources, using the AEM UI or APIs. Do not make modifications directly in JCR.

### Test your queries {#test-your-queries}

Processing GraphQL queries is similar to processing search queries, and is significantly more complex than simple GET-all-content API requests. 

Carefully planning, testing, and optimizing your queries in a controlled non-production environment is key for later success when used in production. 

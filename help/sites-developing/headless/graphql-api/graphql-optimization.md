---
title: Optimizing GraphQL queries
description: Learn how to optimize your GraphQL queries when Filtering, Paging, and Sorting your Content Fragments in Adobe Experience Manager as a Cloud Service for headless content delivery.
exl-id: 899ca211-7b03-42ab-920f-08fdf5a087a0
---
# Optimizing GraphQL Queries {#optimizing-graphql-queries}

>[!NOTE]
>
>Before you apply these optimization recommendations, consider [Updating your Content Fragments for Paging and Sorting in GraphQL Filtering](/help/sites-developing/headless/graphql-api/graphql-optimized-filtering-content-update.md) for best performance.

On an AEM instance with a high number of Content Fragments that the same model shares, GraphQL list queries can become costly (in terms of resources).

The reason is because *all* fragments that share a model being used within the GraphQL query have to be loaded into memory. Doing so consumes both time and memory. Filtering, which may reduce the number of items in the (final) result set, can only be applied **after** loading the entire result set into memory.

This process can lead to the impression that even small result sets (can) lead to bad performance. However, in reality, the slowness is caused by the size of the initial result set, as it has to be handled internally before filtering can be applied.

To reduce performance and memory issues, this initial result set has to be kept as small as possible.

AEM provides two approaches for optimizing GraphQL queries:

* [Hybrid filtering](#hybrid-filtering)
* [Paging](#paging) (or pagination)

  * [Sorting](#sorting) is not directly related to optimization, but is related to paging

Each approach has its own use-cases and limitations. This document provides information on Hybrid Filtering and Paging, with some [best practices](#best-practices) to optimize GraphQL queries.

## Hybrid filtering {#hybrid-filtering}

Hybrid filtering combines JCR filtering with AEM filtering.

It applies a JCR filter (in the form of a query constraint) before loading the result set into memory for AEM filtering. This process is to reduce the result set loaded into memory, as the JCR filter removes superfluous results beforehand.

>[!NOTE]
>
>For technical reasons (for example, flexibility, nesting of fragments), AEM cannot delegate the entire filtering to JCR. 

This technique keeps the flexibility that GraphQL filters provide, while delegating as much of the filtering as possible to JCR.

## Paging {#paging}

GraphQL in AEM supports two types of pagination:

* [limit/offset-based pagination](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md#list-offset-limit)
  This type of pagination is used for list queries; these queries end with `List`; for example, `articleList`. 
  To use it, you have to provide the position of the first item to return (the `offset`) and the number of items to return (the `limit`, or page size).

* [cursor-based pagination](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md#paginated-first-after) (represented by `first`and `after`)
  This pagination type provides a unique ID for each item; also known as the cursor. 
  In the query, you specify the cursor of the last item of the previous page, plus the page size (the maximum number of items to be returned).

  As cursor-based pagination does not fit within the data structures of list-based queries, AEM has introduced `Paginated` query type; for example, `articlePaginated`. The data structures and parameters used follow the [GraphQL Cursor ConnectionSpecification](https://relay.dev/graphql/connections.htm).

  >[!NOTE]
  >
  >AEM currently supports forward paging (using `after`/`first` parameters). 
  >
  >Backward paging (using `before`/`last` parameters) is not supported.

## Sorting {#sorting}

Sorting can only be efficient if all sort criteria are related to top-level fragments.

  If the sorting order includes one or more fields that are on a nested fragment, then all fragments sharing the top-level model must be loaded into memory. This flow causes a negative performance impact.

>[!NOTE]
>
>Sorting on top-level fields also has an (albeit small) impact on performance.

## Best Practices {#best-practices}

The main goal of all optimizations is to reduce the initial result set. The best practices listed here provide ways to do so. They can (and should) be combined.

### Filter on top-level properties only {#filter-top-level-properties-only}

Currently, filtering at the JCR level only works for top-level fragments.

If a filter addresses the fields of a nested fragment, AEM has to fall back to loading (into memory) all fragments that share the underlying model. 

You can still optimize such GraphQL queries by combining filter expressions on fields of top-level fragments and on fields of nested fragments with the [AND operator](#logical-operations-in-filter-expressions).

### Use the content structure {#use-content-structure}

In AEM, it is considered good practice to use the repository structure to narrow down the scope of content to be processed.

Apply this approach to GraphQL queries by applying a filter on the `_path` field of the top-level fragment:

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

If you filter or sort on nested fragments, paginated queries can still be slow as AEM must still load larger amounts of fragments into memory. Therefore, if you combine filtering and paging, consider the rules for filtering (as mentioned above).

For paging, sorting is equally important, as paginated results are always sorted - either in an explicit or an implicit way.

If you are primarily interested in only retrieving the first few pages, there is no significant difference between using the `...List` or `...Paginated` queries. However, if your application is interested in reading more than just one or two pages, you should consider the `...Paginated` query, as it performs notably better with the later pages.

### Logical operations in filter expressions {#logical-operations-in-filter-expressions}

If you are filtering on nested fragments, you can still apply JCR filtering by providing an accompanying filter on a top-level field that is combined using the `AND` operator.

A typical use-case is to restrict the scope of the query using a filter on the `_path` field of the top-level fragment. Then, filter on additional fields that might be on the top level, or on a nested fragment.

In this case, the different filter expressions would be combined with `AND`. Therefore, the filter on `_path` can effectively limit the initial result set. All other filters on top-level fields can help with reducing the initial result set as well - as long as they are combined with `AND`.

Filter expressions combined with `OR` cannot be optimized if nested fragments are involved. Such `OR` expressions can only be optimized if *no* nested fragments are involved.

### Avoid filtering on multiline textfields {#avoid-filtering-multiline-textfields}

The fields of a multiline textfield (html, markdown, plaintext, json) cannot be filtered through a JCR query, as the content of these fields must be calculated on the fly.

If you must still filter on a multiline textfield, consider limiting the size of the initial result set by adding additional filter expressions and combine them with `AND`. Limiting the scope through filtering on the `_path` field is a good approach as well.

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

* Filter expressions on a `Calendar`, `Date`, or `Time` value that use the `NOT_AT` operator.

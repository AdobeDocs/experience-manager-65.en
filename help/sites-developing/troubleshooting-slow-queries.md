---
title: Troubleshooting Slow Queries
seo-title: Troubleshooting Slow Queries
description: Troubleshooting Slow Queries
seo-description: null
uuid: ad09546a-c049-44b2-99a3-cb74ee68f040
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: best-practices
discoiquuid: c01e42ff-e338-46e6-a961-131ef943ea91
exl-id: 3405cdd3-3d1b-414d-9931-b7d7b63f0a6f
---
# Troubleshooting Slow Queries{#troubleshooting-slow-queries}

## Slow Query Classifications {#slow-query-classifications}

There are three main classifications of slow queries in AEM, listed by severity:

1. **Index-less queries**

    * Queries that do **not** resolve to an index and traverse the JCR's contents to collect results

1. **Poorly restricted (or scoped) queries**

    * Queries that resolve to an index, but must traverse all index entries to collect results

1. **Large result set queries**

    * Queries that return large numbers of results

The first two classifications of queries (index-less and poorly restricted) are slow. They are slow because they force the Oak query engine to inspect each **potential** result (content node or index entry) to identify which belong in the **actual** result set.

The act of inspecting each potential result is what is referred to as Traversing.

Since each potential result must be inspected, the cost to determine the actual result set grows linearly with the number of potentials results.

Adding query restrictions and tuning indexes allows the index data to be stored in an optimized format affording fast result retrieval and, reduces or eliminates the need for the linear inspection of potential result sets.

In AEM 6.3, by default, when a traversal of 100,000 is reached, the query fails and throws an exception. This limit does not exist by default in AEM versions before AEM 6.3, but can be set via the Apache Jackrabbit Query Engine Settings OSGi configuration and QueryEngineSettings JMX bean (property LimitReads).

### Detecting Index-less Queries {#detecting-index-less-queries}

#### During Development {#during-development}

Explain **all** queries and ensure that their query plans do not contain the **/&ast; traverse** explanation in them. Example traversing query plan:

* **PLAN:** `[nt:unstructured] as [a] /* traverse "/content//*" where ([a].[unindexedProperty] = 'some value') and (isdescendantnode([a], [/content])) */`

#### Post-Deployment {#post-deployment}

* Monitor the `error.log` for index-less traversal queries:

  * `*INFO* org.apache.jackrabbit.oak.query.QueryImpl Traversal query (query without index) ... ; consider creating and index`
  * This message is only logged if no index is available, and if the query potentially traverses many nodes. Messages are not logged if an index is available, but amount to traversing is small, and thus fast.

* Visit the AEM [Query Performance](/help/sites-administering/operations-dashboard.md#query-performance) operations console and [Explain](/help/sites-administering/operations-dashboard.md#explain-query) slow queries looking for traversal or no index query explanations.

### Detecting Poorly Restricted Queries {#detecting-poorly-restricted-queries}

#### During Development {#during-development-1}

Explain all queries and ensure they resolve to an index tuned to match the query's property restrictions.

* Ideal query plan coverage has `indexRules` for all property restrictions, and at a minimum for the tightest property restrictions in the query.
* Queries that sort results, should resolve to a Lucene Property Index with index rules for the sorted by properties that set `orderable=true.`

#### For example, the default `cqPageLucene` does not have an index rule for `jcr:content/cq:tags` {#for-example-the-default-cqpagelucene-does-not-have-an-index-rule-for-jcr-content-cq-tags}

Before adding the cq:tags index rule

* **cq:tags Index Rule**

  * Does not exist out of the box

* **Query Builder query**

  ```js
  type=cq:Page
  property=jcr:content/cq:tags
  property.value=my:tag
  ```

* **Query plan**

  `[cq:Page] as [a] /* lucene:cqPageLucene(/oak:index/cqPageLucene) *:* where [a].[jcr:content/cq:tags] = 'my:tag' */`

This query resolves to the `cqPageLucene` index, but because no property index rule exists for `jcr:content` or `cq:tags`, when this restriction is evaluated, every record in the `cqPageLucene` index is checked to determine a match. As such, if the index contains 1 million `cq:Page` nodes, then 1 million records are checked to determine the result set.

After adding the cq:tags index rule

* **cq:tags Index Rule**

  ```js
  /oak:index/cqPageLucene/indexRules/cq:Page/properties/cqTags
  @name=jcr:content/cq:tags
  @propertyIndex=true
  ```

* **Query Builder query**

  ```js
  type=cq:Page
  property=jcr:content/cq:tags
  property.value=myTagNamespace:myTag
  ```

* **Query plan**

  `[cq:Page] as [a] /* lucene:cqPageLucene(/oak:index/cqPageLucene) jcr:content/cq:tags:my:tag where [a].[jcr:content/cq:tags] = 'my:tag' */`

The addition of the indexRule for `jcr:content/cq:tags` in the `cqPageLucene` index allows `cq:tags` data to be stored in an optimized way.

When a query with the `jcr:content/cq:tags` restriction is performed, the index can look up results by value. That means that if 100 `cq:Page` nodes have `myTagNamespace:myTag` as a value, only those 100 results are returned, and the other 999,000 are excluded from the restriction checks, improving performance by a factor of 10,000.

More query restrictions reduce the eligible result sets and further optimize the query optimization.

Similarly, without an extra index rule for the `cq:tags` property, even a fulltext query with a restriction on `cq:tags` would perform poorly as results from the index would return all fulltext matches. The restriction on cq:tags would be filtered after it.

Another cause of post-index-filtering is Access Control Lists which often gets missed during development. Try to make sure that the query does not return paths that might be inaccessible to the user. Doing so can be done by better content structure along with providing relevant path restriction on the query.

A useful way to identify if the Lucene index is returning many results to return a small subset as query result, is to enable DEBUG logs for `org.apache.jackrabbit.oak.plugins.index.lucene.LucenePropertyIndex`. Doing so lets you see how many documents are being loaded from the index. Number of eventual results versus the number of loaded documents shouldn't be disproportionate. For more information, see [Logging](/help/sites-deploying/configure-logging.md).

#### Post-Deployment {#post-deployment-1}

* Monitor the `error.log` for traversal queries:

  * `*WARN* org.apache.jackrabbit.oak.spi.query.Cursors$TraversingCursor Traversed ### nodes ... consider creating an index or changing the query`

* Visit the AEM [Query Performance](/help/sites-administering/operations-dashboard.md#query-performance) operations console and [Explain](/help/sites-administering/operations-dashboard.md#explain-query) slow queries looking for query plans that do not resolve query property restrictions to index property rules.

### Detecting Large Result Set Queries {#detecting-large-result-set-queries}

#### During Development {#during-development-2}

Set low thresholds for oak.queryLimitInMemory (for example, 10000) and oak.queryLimitReads (for example, 5000) and optimize the expensive query when hitting an UnsupportedOperationException saying "The query read more than x nodes..."

Setting low thresholds helps avoid resource-intensive queries (that is, not backed by any index or backed by less covering index). For example, a query that reads one million nodes would lead to lots of IO, and negatively impact the overall application performance. So any query which fails due to above limits should be analyzed and optimized.

#### Post-Deployment {#post-deployment-2}

* Monitor the logs for queries triggering large node traversal or large heap memory consumption : ``

  * `*WARN* ... java.lang.UnsupportedOperationException: The query read or traversed more than 100000 nodes. To avoid affecting other tasks, processing was stopped.`
  * Optimize the query so you reduce the number of traversed nodes.

* Monitor the logs for queries triggering large heap memory consumption:

  * `*WARN* ... java.lang.UnsupportedOperationException: The query read more than 500000 nodes in memory. To avoid running out of memory, processing was stopped`
  * Optimize the query so you reduce the heap memory consumption.

For AEM 6.0 - 6.2 versions, you can tune the threshold for node traversal via JVM parameters in the AEM start script to prevent large queries from overloading the environment. The recommended values are :

* `-Doak.queryLimitInMemory=500000`
* `-Doak.queryLimitReads=100000`

In AEM 6.3, the above two parameters are preconfigured by default, and can be modified via the OSGi QueryEngineSettings.

More information available under : [https://jackrabbit.apache.org/oak/docs/query/query-engine.html#Slow_Queries_and_Read_Limits](https://jackrabbit.apache.org/oak/docs/query/query-engine.html#Slow_Queries_and_Read_Limits)

## Query Performance Tuning {#query-performance-tuning}

The motto of query performance optimization in AEM is:

**"The more restrictions, the better."**

The following outlines recommended adjustments to ensure query performance. First tune the query, a less obtrusive activity, and then if needed, tune the index definitions.

### Adjusting the Query Statement {#adjusting-the-query-statement}

AEM supports the following query languages:

* Query Builder
* JCR-SQL2
* XPath

The following example uses Query Builder as it's the most common query language used by AEM developers, however the same principles are applicable to JCR-SQL2 and XPath.

1. Add a nodetype restriction so the query resolves to an existing Lucene Property Index.

* **Unoptimized query**

  ```js
  property=jcr:content/contentType
  property.value=article-page
  ```

* **Optimized query**

  ```js
  type=cq:Page
  property=jcr:content/contentType
  property.value=article-page
  ```

   Queries lacking a nodetype restriction force AEM to assume the `nt:base` nodetype, which every node in AEM is a subtype of, effectively resulting in no nodetype restriction.

   Setting `type=cq:Page` restricts this query to only `cq:Page` nodes, and resolves the query to AEM's cqPageLucene, limiting the results to a subset of nodes (only `cq:Page` nodes) in AEM.

1. Adjust the query's nodetype restriction so the query resolves to an existing Lucene Property Index.

* **Unoptimized query**

  ```js
  type=nt:hierarchyNode
  property=jcr:content/contentType
  property.value=article-page
  ```

* **Optimized query**

  ```js
  type=cq:Page
  property=jcr:content/contentType
  property.value=article-page
  ```

   `nt:hierarchyNode` is the parent nodetype of `cq:Page`. Assuming `jcr:content/contentType=article-page` is only applied to `cq:Page` nodes by way of Adobe's custom application, this query only returns `cq:Page` nodes where `jcr:content/contentType=article-page`. This flow is a suboptimal restriction though, because:

  * Other node inherit from `nt:hierarchyNode` (for example, `dam:Asset`) adding unnecessarily to the set of potential results.
  * No AEM-provided index exists for `nt:hierarchyNode`, however as there a provided index for `cq:Page`.

   Setting `type=cq:Page` restricts this query to only `cq:Page` nodes, and resolves the query to AEM's cqPageLucene, limiting the results to a subset of nodes (only cq:Page nodes) in AEM.

1. Or, adjust the property restrictions so the query resolves to an existing Property Index.

* **Unoptimized query**

  ```js
  property=jcr:content/contentType
  property.value=article-page
  ```

* **Optimized query**

  ```js
  property=jcr:content/sling:resourceType
  property.value=my-site/components/structure/article-page
  ```

   Changing the property restriction from `jcr:content/contentType` (a custom value) to the well-known property `sling:resourceType` lets the query resolve to the property index `slingResourceType` which indexes all content by `sling:resourceType`.

   Property indexes (opposed to Lucene Property Indexes) are best used when the query does not discern by nodetype, and a single property restriction dominates the result set.

1. Add the tightest path restriction possible to the query. For example, prefer `/content/my-site/us/en` over `/content/my-site`, or `/content/dam` over `/`.

* **Unoptimized query**

  ```js
  type=cq:Page
  path=/content
  property=jcr:content/contentType
  property.value=article-page
  ```

* **Optimized query**

  ```js
  type=cq:Page
  path=/content/my-site/us/en
  property=jcr:content/contentType
  property.value=article-page
  ```

  Scoping the path restriction from `path=/content`to `path=/content/my-site/us/en` allows the indexes to reduce the number of index entries that must be inspected. When the query can restrict the path well, beyond just `/content` or `/content/dam`, ensure that the index has `evaluatePathRestrictions=true`.

  Note using `evaluatePathRestrictions` increases the index size.

1. When possible, avoid query functions and query operations such as: `LIKE` and `fn:XXXX` as their costs scales with the number of restriction-based results.

* **Unoptimized query**

  ```js
  type=cq:Page
  property=jcr:content/contentType
  property.operation=like
  property.value=%article%
  ```

* **Optimized query**

  ```js
  type=cq:Page
  fulltext=article
  fulltext.relPath=jcr:content/contentType
  ```

   The LIKE condition is slow to evaluate because no index can be used if the text starts with a wildcard ("%...'). The jcr:contains condition allows using a fulltext index, and is therefore preferred. It requires the resolved Lucene Property Index to have indexRule for `jcr:content/contentType` with `analayzed=true`.

   Using query functions like `fn:lowercase(..)` may be harder to optimize as there are not faster equivalents (outside more complex and obtrusive index analyzer configurations). It is best to identify other scoping restrictions to improve the overall query performance, requiring the functions to operate on the smallest set of potential results possible.

1. ***This adjustment is Query Builder specific, and does not apply to JCR-SQL2 or XPath.***

   Use [Query Builder' guessTotal](/help/sites-developing/querybuilder-api.md#using-p-guesstotal-to-return-the-results) when the full set of results is **not** immediately needed.

    * **Unoptimized query**

      ```js
      type=cq:Page
      path=/content
      ```

    * **Optimized query**

      ```js
      type=cq:Page
      path=/content
      p.guessTotal=100
      ```

   For cases where query execution is fast but the number of results are large, p. `guessTotal` is a critical optimization for Query Builder queries.

   `p.guessTotal=100` tells Query Builder to only collect the first 100 results. And, to set a boolean flag indicating if at least one more result exists (but not how many more, as counting this number results in slowness). This optimization excels for pagination or infinite loading use cases, where only a result subset is incrementally displayed.

## Existing Index Tuning {#existing-index-tuning}

1. If the optimal query resolves to a Property Index, then there is nothing left to do as Property Indexes are minimally tune-able.
1. Otherwise, the query should resolve to a Lucene Property Index. If no index can be resolved, jump to Creating a new Index.
1. As needed, convert the query to XPath or JCR-SQL2.

    * **Query Builder query**

      ```js
      query type=cq:Page
      path=/content/my-site/us/en
      property=jcr:content/contentType
      property.value=article-page
      orderby=@jcr:content/publishDate
      orderby.sort=desc
      ```

    * **XPath generated from Query Builder query**

      ```js
      /jcr:root/content/my-site/us/en//element(*, cq:Page)[jcr:content/@contentType = 'article-page'] order by jcr:content/@publishDate descending
      ```

1. Provide the XPath (or JCR-SQL2) to Oak Index Definition Generator at `https://oakutils.appspot.com/generate/index` so you can generate the optimized Lucene Property Index definition. <!-- The above URL is 404 as of April 24, 2023 -->

   **Generated Lucene Property Index definition**

   ```xml
   - evaluatePathRestrictions = true
   - compatVersion = 2
   - type = "lucene"
   - async = "async"
   - jcr:primaryType = oak:QueryIndexDefinition
       + indexRules
       + cq:Page
           + properties
           + contentType
               - name = "jcr:content/contentType"
               - propertyIndex = true
           + publishDate
               - ordered = true
               - name = "jcr:content/publishDate"
   ```

1. Manually merge the generated definition into the existing Lucene Property Index in an additive fashion. Be careful not to remove existing configurations as they may be used to satisfy other queries.

    1. Locate the existing Lucene Property Index that covers cq:Page (using Index Manager). In this case, `/oak:index/cqPageLucene`.
    1. Identify the configuration delta between the optimized index definition (Step #4) and the existing index (/oak:index/cqPageLucene), and add the missing configurations from the optimized Index to the existing index definition.
    1. Per AEM's Reindexing Best Practices, either a refresh or reindex is in order, based on if existing content might be affected by this index configuration change.

## Create a New Index {#create-a-new-index}

1. Verify that the query does not resolve to an existing Lucene Property Index. If it does, see the above section on tuning and existing index.
1. As needed, convert the query to XPath or JCR-SQL2.

   * **Query Builder query**

     ```js
     type=myApp:Author
     property=firstName
     property.value=ira
     ```

   * **XPath generated from Query Builder query**

     ```js
     //element(*, myApp:Page)[@firstName = 'ira']
     ```

1. Provide the XPath (or JCR-SQL2) to Oak Index Definition Generator at `https://oakutils.appspot.com/generate/index` so you can generate the optimized Lucene Property Index definition. <!-- The above URL is 404 as of April 24, 2023 -->

    **Generated Lucene Property Index definition**

    ```xml
    - compatVersion = 2
    - type = "lucene"
    - async = "async"
    - jcr:primaryType = oak:QueryIndexDefinition
        + indexRules
        + myApp:AuthorModel
            + properties
            + firstName
                - name = "firstName"
                - propertyIndex = true
    ```

1. Deploy the generated Lucene Property Index definition.

   Add the XML definition provided by Oak Index Definition Generator for the new index to the AEM project that manages Oak index definitions (remember, treat Oak index definitions as code, since code depends on them).

   Deploy and test the new index following the usual AEM software development lifecycle and verify that the query resolves to the index and the query is performant.

   On the initial deployment of this index, AEM populates the index with the requisite data.

## When are index-less and traversal queries OK? {#when-index-less-and-traversal-queries-are-ok}

Due to AEM's flexible content architecture, it is difficult to predict and ensure that traversals of content structures do not evolve over time to be unacceptably large.

Therefore, ensure that indexes satisfy queries, except if the combination of path restriction and nodetype restriction guarantees that **fewer than 20 nodes are ever traversed.**

## Query Development Tools {#query-development-tools}

### Adobe Supported {#adobe-supported}

* **Query Builder Debugger**

  * A WebUI for executing Query Builder queries and generate the supporting XPath (for use in Explain Query or Oak Index Definition Generator).
  * On AEM at [/libs/cq/search/content/querydebug.html](http://localhost:4502/libs/cq/search/content/querydebug.html)

* **CRXDE Lite - Query Tool**

  * A WebUI for executing XPath and JCR-SQL2 queries.
  * On AEM at [/crx/de/index.jsp](http://localhost:4502/crx/de/index.jsp) &gt; Tools &gt; Query...

* **[Explain Query](/help/sites-administering/operations-dashboard.md#explain-query)**

  * An AEM Operations dashboard that provides a detailed explanation (Query plan, query time, and # of results) for any given XPATH or JCR-SQL2 query.

* **[Slow/Popular Queries](/help/sites-administering/operations-dashboard.md#query-performance)**

  * An AEM Operations dashboard listing the recent slow and popular queries executed on AEM.

* **[Index Manager](/help/sites-administering/operations-dashboard.md#the-index-manager)**

  * An AEM Operations WebUI displaying the indexes on the AEM instance; facilitates understanding what indexes exist; can be targeted or augmented.

* **[Logging](/help/sites-administering/operations-dashboard.md#log-messages)**

  * Query Builder logging

    * `DEBUG @ com.day.cq.search.impl.builder.QueryImpl`

  * Oak query execution logging

    * `DEBUG @ org.apache.jackrabbit.oak.query`

* **Apache Jackrabbit Query Engine Settings OSGi Config**

  * OSGi configuration that configures failure behavior for traversing queries.
  * On AEM at [/system/console/configMgr#org.apache.jackrabbit.oak.query.QueryEngineSettingsService](http://localhost:4502/system/console/configMgr#org.apache.jackrabbit.oak.query.QueryEngineSettingsService)

* **NodeCounter JMX Mbean**

  * JMX MBean used to estimate the number of nodes in content trees in AEM.
  * On AEM at [/system/console/jmx/org.apache.jackrabbit.oak%3Aname%3DnodeCounter%2Ctype%3DNodeCounter](http://localhost:4502/system/console/jmx/org.apache.jackrabbit.oak%3Aname%3DnodeCounter%2Ctype%3DNodeCounter)

### Community Supported {#community-supported}

* **Oak Index Definition Generator at `https://oakutils.appspot.com/generate/index`** <!-- The above URL is 404 as of April 24, 2023 -->

  * Generate optimal Lucence Property Index from XPath or JCR-SQL2 query statements.

* **[AEM Chrome Plug-in](https://chrome.google.com/webstore/detail/aem-chrome-plug-in/ejdcnikffjleeffpigekhccpepplaode?hl=en-US)**

  * Google Chrome web browser extension that exposes per-request log data, including executed queries and their query plans, in the browser's dev tools console.
  * Requires [Sling Log Tracer 1.0.2+](https://sling.apache.org/downloads.cgi) to be installed and enabled on AEM.

---
title: Query Builder API
description: The functionality of the Asset Share Query Builder is exposed through a Java&trade; API and a REST API.
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: platform
content-type: reference
pagetitle: Query Builder API
tagskeywords: querybuilder
exl-id: b2288442-d055-4966-8057-8b7b7b6bff28
solution: Experience Manager, Experience Manager Sites
feature: Developing,Search,Query Builder
role: Developer
---
# Query Builder API{#query-builder-api}

The functionality of the [Asset Share Query Builder](/help/assets/assets-finder-editor.md) is exposed through a Java&trade; API and a REST API. This section describes these APIs.

The server-side query builder ( [`QueryBuilder`](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/day/cq/search/QueryBuilder.html)) accepts a query description, create and run an XPath query, optionally filter the result set, and also extract facets, if desired.

The query description is simply a set of predicates ([`Predicate`](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/day/cq/search/Predicate.html)). Examples include a full-text predicate, which corresponds to the `jcr:contains()` function in XPath.

For each predicate type, there is an evaluator component ([`PredicateEvaluator`](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/day/cq/search/eval/PredicateEvaluator.html)) that knows how to handle that specific predicate for XPath, filtering, and facet extraction. It is easy to create custom evaluators, which are plugged-in through the OSGi component runtime.

The REST API provides access to the same features through HTTP with responses being sent in JSON.

>[!NOTE]
>
>The QueryBuilder API is built using the JCR API. You can also query the Adobe Experience Manager JCR by using the JCR API from within an OSGi bundle. For information, see [Adobe Experience Manager using the JCR API](https://experienceleague.adobe.com/docs/experience-manager-65/developing/platform/access-jcr.html).

## Gem Session {#gem-session}

[Adobe Experience Manager (AEM) Gems](https://experienceleague.adobe.com/docs/experience-manager-gems-events/gems/overview.html) is a series of technical deep dives into Adobe Experience Manager delivered by Adobe experts. This session dedicated to the query builder is useful for an overview and use of the tool.

>[!NOTE]
>
>AEM Gem session [Search forms made easy with the AEM querybuilder](https://experienceleague.adobe.com/docs/experience-manager-gems-events/gems/gems2017/aem-search-forms-using-querybuilder.html) for a detailed overview of the query builder.

## Sample Queries {#sample-queries}

These samples are given in Java&trade; properties style notation. To use them with the Java&trade; API, use a Java&trade; `HashMap` as in the API sample that follows.

For the `QueryBuilder` JSON Servlet, each example includes a link to your local CQ installation (at the default location, `http://localhost:4502`). Log in to your CQ instance before using these links.

>[!CAUTION]
>
>By default, the query builder json servlet displays a maximum of ten hits.
>
>Adding the following parameter allows the servlet to display all query results:
>
>**`p.limit=-1`**

>[!NOTE]
>
>To view the returned JSON data in your browser, you may want to use a plugin such as JSONView for Firefox.

### Returning all results {#returning-all-results}

The following query **return ten results** (or, to be precise, a maximum of ten), but inform you of the **Number of hits:** that are available:

`http://localhost:4502/bin/querybuilder.json?path=/content&1_property=sling:resourceType&1_property.value=foundation/components/text&1_property.operation=like&orderby=path`

```xml
path=/content
1_property=sling:resourceType
1_property.value=foundation/components/text
1_property.operation=like
orderby=path
```

The same query (with the parameter `p.limit=-1`) will **return all results** (this might be a high number depending on your instance):

`http://localhost:4502/bin/querybuilder.json?path=/content&1_property=sling:resourceType&1_property.value=foundation/components/text&1_property.operation=like&p.limit=-1&orderby=path`

```xml
path=/content
1_property=sling:resourceType
1_property.value=foundation/components/text
1_property.operation=like
p.limit=-1
orderby=path
```

### Using p.guessTotal to return the results {#using-p-guesstotal-to-return-the-results}

The purpose of the `p.guessTotal` parameter is to return the appropriate number of results that can be shown by combining the minimum viable p.offset and p.limit values. The advantage of using this parameter is improved performance with large result sets. This avoids calculating the full total (for example, calling result.getSize()) and reading the entire result set, optimized all the way down to the Oak engine & index. This can be a significant difference when there are 100 thousands of results, both in execution time and memory usage.

The disadvantage to the parameter is users do not see the exact total. But you can set a minimum number like p.guessTotal=1000 so it will always read up to 1000, so you get exact totals for smaller result sets, but if it is more than that, you can only show "and more".

Add `p.guessTotal=true` to the query below to see how it works:

`http://localhost:4502/bin/querybuilder.json?path=/content&1_property=sling:resourceType&1_property.value=foundation/components/text&1_property.operation=like&p.guessTotal=true&orderby=path`

```xml
path=/content
1_property=sling:resourceType
1_property.value=foundation/components/text
1_property.operation=like
p.guessTotal=true
orderby=path
```

The query returns the `p.limit` default of `10` results with a `0` offset:

```xml
"success": true,
"results": 10,
"total": 10,
"more": true,
"offset": 0,
```

As of AEM 6.0 SP2, you can also use a numeric value to count up to a custom number of maximum results. Use the same query as above, but change the value of `p.guessTotal` to `50`:

`http://localhost:4502/bin/querybuilder.json?path=/content&1_property=sling:resourceType&1_property.value=foundation/components/text&1_property.operation=like&p.guessTotal=50&orderby=path`

It returns a number the same default limit of ten results with a 0 offset, but will only display a maximum of 50 results:

```xml
"success": true,
"results": 10,
"total": 50,
"more": true,
"offset": 0,
```

### Implementing pagination {#implementing-pagination}

By default the Query Builder would also provide the number of hits. Depending on the result size, this might take long time as determining the accurate count involves checking every result for access control. Mostly the total is used to implement pagination for the end user UI. Because determining the exact count can be slow, it is recommended to use the guessTotal feature to implement the pagination.

For example, the UI can adapt following approach:

* Get and display the accurate count of the number of total hits ([SearchResult.getTotalMatches()](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/day/cq/search/result/SearchResult.html#gettotalmatches) or total in the querybuilder.json response) are less than or equal to 100;
* Set `guessTotal` to 100 while making the call to the Query Builder.

* The response can have the following outcome:

    * `total=43`, `more=false` - Indicates that total number of hits is 43. The UI can show up to ten results as part of the first page and provide pagination for the next three pages. You can also use this implementation to display a descriptive text like **"43 results found"**.
    * `total=100`, `more=true` - Indicates that the total number of hits is greater than 100 and the exact count is not known. The UI can show up to ten as part of the first page and provide pagination for the next ten pages. You can also use this to display a text like **"more than 100 results found"**. As the user goes to the next pages calls made to the Query Builder would increase the limit of `guessTotal` and also of the `offset` and `limit` parameters.

`guessTotal` should be used in cases where the UI needs to use infinite scrolling to avoid the Query Builder from determining the exact hit count.

### Find jar files and order them, newest first {#find-jar-files-and-order-them-newest-first}

`http://localhost:4502/bin/querybuilder.json?type=nt:file&nodename=*.jar&orderby=@jcr:content/jcr:lastModified&orderby.sort=desc`

```xml
type=nt:file
nodename=*.jar
orderby=@jcr:content/jcr:lastModified
orderby.sort=desc
```

### Find all pages and order them by last modified {#find-all-pages-and-order-them-by-last-modified}

`http://localhost:4502/bin/querybuilder.json?type=cq:Page&orderby=@jcr:content/cq:lastModified`

```xml
type=cq:Page
orderby=@jcr:content/cq:lastModified
```

### Find all pages and order them by last modified, but descending {#find-all-pages-and-order-them-by-last-modified-but-descending}

`http://localhost:4502/bin/querybuilder.json?type=cq:Page&orderby=@jcr:content/cq:lastModified&orderby.sort=desc]`

```xml
type=cq:Page
orderby=@jcr:content/cq:lastModified
orderby.sort=desc
```

### Fulltext search, ordered by score {#fulltext-search-ordered-by-score}

`http://localhost:4502/bin/querybuilder.json?fulltext=Management&orderby=@jcr:score&orderby.sort=desc`

```xml
fulltext=Management
orderby=@jcr:score
orderby.sort=desc
```

### Search for pages tagged with a certain tag {#search-for-pages-tagged-with-a-certain-tag}

`http://localhost:4502/bin/querybuilder.json?type=cq:Page&tagid=marketing:interest/product&tagid.property=jcr:content/cq:tags`

```xml
type=cq:Page
tagid=marketing:interest/product
tagid.property=jcr:content/cq:tags
```

Use the `tagid` predicate as in the example if you know the explicit tag ID.

Use the `tag` predicate for the tag title path (without spaces).

In the previous example, because you are searching for pages ( `cq:Page` nodes), use the relative path from that node for the `tagid.property` predicate, which is `jcr:content/cq:tags`. By default, the `tagid.property` would simply be `cq:tags`.

### Search under multiple paths (using groups) {#search-under-multiple-paths-using-groups}

`http://localhost:4502/bin/querybuilder.json?fulltext=Management&group.1_path=/content/geometrixx/en/company/management&group.2_path=/content/geometrixx/en/company/bod&group.p.or=true`

```xml
fulltext=Management
group.p.or=true
group.1_path=/content/geometrixx/en/company/management
group.2_path=/content/geometrixx/en/company/bod
```

This query uses a *group* (named " `group`"), which acts to delimit subexpressions within a query, much as parentheses do in more standard notations. For example, the previous query might be expressed in a more familiar style as:

`"Management" and ("/content/geometrixx/en/company/management" or "/content/geometrixx/en/company/bod")`

Inside the group in the example, the `path` predicate is used multiple times. To differentiate and order the two instances of the predicate (ordering is required for some predicates), you must prefix the predicates with *N* `_ where`*N* is the ordering index. In the previous example, the resulting predicates are `1_path` and `2_path`.

The `p` in `p.or` is a special delimiter indicating that what follows (in this case an `or`) is a *parameter* of the group, as opposed to a subpredicate of the group, such as `1_path`.

If no `p.or` is given then all predicates are ANDed together, that is, each result must satisfy all predicates.

>[!NOTE]
>
>You cannot use the same numeric prefix in one single query, even for different predicates.

### Search for properties {#search-for-properties}

Here you are searching for all pages of a given template, using the `cq:template` property:

`http://localhost:4502/bin/querybuilder.json?property=cq%3atemplate&property.value=%2fapps%2fgeometrixx%2ftemplates%2fhomepage&type=cq%3aPageContent`

```xml
type=cq:PageContent
property=cq:template
property.value=/apps/geometrixx/templates/homepage
```

This has the drawback that the `jcr:content` nodes of the pages, not the pages themselves, are returned. To solve this, you can search by relative path:

`http://localhost:4502/bin/querybuilder.json?property=jcr%3acontent%2fcq%3atemplate&property.value=%2fapps%2fgeometrixx%2ftemplates%2fhomepage&type=cq%3aPage`

```xml
type=cq:Page
property=jcr:content/cq:template
property.value=/apps/geometrixx/templates/homepage
```

### Search for multiple properties {#search-for-multiple-properties}

When using the property predicate multiple times, you have to add the number prefixes again:

`http://localhost:4502/bin/querybuilder.json?1_property=jcr%3acontent%2fcq%3atemplate&1_property.value=%2fapps%2fgeometrixx%2ftemplates%2fhomepage&2_property=jcr%3acontent%2fjcr%3atitle&2_property.value=English&type=cq%3aPage`

```xml
type=cq:Page
1_property=jcr:content/cq:template
1_property.value=/apps/geometrixx/templates/homepage
2_property=jcr:content/jcr:title
2_property.value=English
```

### Search for multiple property values {#search-for-multiple-property-values}

To avoid large groups when you want to search for multiple values of a property ( `"A" or "B" or "C"`), you can provide multiple values to the `property` predicate:

`http://localhost:4502/bin/querybuilder.json?property=jcr%3atitle&property.1_value=Products&property.2_value=Square&property.3_value=Events`

```xml
property=jcr:title
property.1_value=Products
property.2_value=Square
property.3_value=Events
```

For multi-value properties, you can also require that multiple values match ( `"A" and "B" and "C"`):

`http://localhost:4502/bin/querybuilder.json?property=jcr%3atitle&property.and=true&property.1_value=test&property.2_value=foo&property.3_value=bar`

```xml
property=jcr:title
property.and=true
property.1_value=test
property.2_value=foo
property.3_value=bar
```

## Refining What Is Returned {#refining-what-is-returned}

By default, the QueryBuilder JSON Servlet returns a default set of properties for each node in the search result (for example, path, name, and title). To gain control over which properties are returned, you can do one of the following:

Specify

```
p.hits=full
```

In which case, all properties are included for each node:

`http://localhost:4502/bin/querybuilder.json?p.hits=full&property=jcr%3atitle&property.value=Triangle`

```xml
property=jcr:title
property.value=Triangle
p.hits=full
```

Use

```
p.hits=selective
```

And specify the properties that you want to get in

```
p.properties
```

Separated by a space:

`http://localhost:4502/bin/querybuilder.json?p.hits=selective&property=jcr%3atitle&property.value=Triangle`

[ `http://localhost:4502/bin/querybuilder.json?`](http://localhost:4502/bin/querybuilder.json?p.hits=selective&p.properties=sling%3aresourceType%20jcr%3aprimaryType&property=jcr%3atitle&property.value=Triangle) [p.hits=selective&](http://localhost:4502/bin/querybuilder.json?p.hits=selective&p.nodedepth=5&p.properties=sling%3aresourceType%20jcr%3apath&property=jcr%3atitle&property.value=Triangle)p.properties=sling%3aresourceType%20jcr%3aprimaryType&property=jcr%3atitle&property.value=Triangle

```xml
property=jcr:title
property.value=Triangle
p.hits=selective
p.properties=sling:resourceType jcr:primaryType
```

Another thing you can do is include child nodes in the QueryBuilder response. To do this, you must specify

```
p.nodedepth=n
```

Where `n` is the number of levels that you want the query to return. For a child node to be returned, it must be specified by the properties selector

```
p.hits=full
```

Example:

`http://localhost:4502/bin/querybuilder.json?p.hits=full&p.nodedepth=5&property=jcr%3atitle&property.value=Triangle`

```xml
property=jcr:title
property.value=Triangle
p.hits=full
p.nodedepth=5
```

## More Predicates {#morepredicates}

For more predicates, see the [Query Builder Predicate Reference page](/help/sites-developing/querybuilder-predicate-reference.md).

You can also check the [Javadoc for the `PredicateEvaluator` classes](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/day/cq/search/eval/PredicateEvaluator.html). The Javadoc for these classes contains the list of properties that you can use.

The prefix of the class name (for example, " `similar`" in [`SimilarityPredicateEvaluator`](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/day/cq/search/eval/SimilarityPredicateEvaluator.html)) is the *principal property* of the class. This property is also the name of the predicate to use in the query (in lower case).

For such principal properties, you can shorten the query and use " `similar=/content/en`" instead of the fully qualified variant " `similar.similar=/content/en`". The fully qualified form must be used for all non-principal properties of a class.

## Example Query Builder API Usage {#example-query-builder-api-usage}

```java
   String fulltextSearchTerm = "Geometrixx";

    // create query description as hash map (simplest way, same as form post)
    Map<String, String> map = new HashMap<String, String>();

// create query description as hash map (simplest way, same as form post)
    map.put("path", "/content");
    map.put("type", "cq:Page");
    map.put("group.p.or", "true"); // combine this group with OR
    map.put("group.1_fulltext", fulltextSearchTerm);
    map.put("group.1_fulltext.relPath", "jcr:content");
    map.put("group.2_fulltext", fulltextSearchTerm);
    map.put("group.2_fulltext.relPath", "jcr:content/@cq:tags");

    // can be done in map or with Query methods
    map.put("p.offset", "0"); // same as query.setStart(0) below
    map.put("p.limit", "20"); // same as query.setHitsPerPage(20) below

    Query query = builder.createQuery(PredicateGroup.create(map), session);
    query.setStart(0);
    query.setHitsPerPage(20);

    SearchResult result = query.getResult();

    // paging metadata
    int hitsPerPage = result.getHits().size(); // 20 (set above) or lower
    long totalMatches = result.getTotalMatches();
    long offset = result.getStartIndex();
    long numberOfPages = totalMatches / 20;

    //Place the results in XML to return to client
    DocumentBuilderFactory factory =     DocumentBuilderFactory.newInstance();
    DocumentBuilder builder = factory.newDocumentBuilder();
    Document doc = builder.newDocument();

    //Start building the XML to pass back to the AEM client
    Element root = doc.createElement( "results" );
    doc.appendChild( root );

    // iterating over the results
    for (Hit hit : result.getHits()) {
       String path = hit.getPath();

      //Create a result element
      Element resultel = doc.createElement( "result" );
      root.appendChild( resultel );

      Element pathel = doc.createElement( "path" );
      pathel.appendChild( doc.createTextNode(path ) );
      resultel.appendChild( pathel );
    }
```

>[!NOTE]
>
>To learn how to build an OSGi bundle that uses the QueryBuilder API and use that OSGi bundle within an Adobe Experience Manager application, see [Creating Adobe CQ OSGi bundles that use the Query Builder AP](https://helpx.adobe.com/experience-manager/using/using-query-builder-api.html)I.

The same query executed over HTTP using the Query Builder (JSON) Servlet:

`http://localhost:4502/bin/querybuilder.json?path=/content&type=cq:Page&group.p.or=true&group.1_fulltext=Geometrixx&group.1_fulltext.relPath=jcr:content&group.2_fulltext=Geometrixx&group.2_fulltext.relPath=jcr:content/@cq:tags&p.offset=0&p.limit=20`

## Storing and loading queries {#storing-and-loading-queries}

Queries can be stored to the repository so that you can use them later. The `QueryBuilder` provides the `` `storeQuery` method with the following signature:

```java
void storeQuery(Query query, String path, boolean createFile, Session session) throws RepositoryException, IOException;
```

When using the [ `QueryBuilder#storeQuery`](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/day/cq/search/QueryBuilder.html#storequerycomdaycqsearchqueryjavalangstringbooleanjavaxjcrsession) method, the given `Query` is stored into the repository as a file or as a property according to the `createFile` argument value. The following example shows how to save a `Query` to the path `/mypath/getfiles` as a file:

```java
builder.storeQuery(query, "/mypath/getfiles", true, session);
```

Any previously stored queries can be loaded from the repository by using the [`QueryBuilder#loadQuery`](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/day/cq/search/QueryBuilder.html#loadqueryjavalangstringjavaxjcrsession) method:

```java
Query loadQuery(String path, Session session) throws RepositoryException, IOException
```

For example, a `Query` stored to the path `/mypath/getfiles` can be loaded by the following snippet:

```java
Query loadedQuery = builder.loadQuery("/mypath/getfiles", session);
```

## Testing and Debugging {#testing-and-debugging}

For playing around and debugging querybuilder queries, you can use the QueryBuilder debugger console at

`http://localhost:4502/libs/cq/search/content/querydebug.html`

Or alternatively the querybuilder json servlet at

`http://localhost:4502/bin/querybuilder.json?path=/tmp`

( `path=/tmp` is only an example).

### General Debugging Recommendations {#general-debugging-recommendations}

### Obtain explain-able XPath via logging {#obtain-explain-able-xpath-via-logging}

Explain **all** queries during the development cycle against the target index set.

* Enable DEBUG logs for QueryBuilder to obtain underlying, explainable XPath query

    * Navigate to https://&lt;serveraddress&gt;:&lt;serverport&gt;/system/console/slinglog. Create a logger for `com.day.cq.search.impl.builder.QueryImpl` at **DEBUG**.

* After DEBUG is enabled for the above class, the logs display the XPath generated by Query Builder.
* Copy the XPath query from the log entry for the associated QueryBuilder query, For example:

    * `com.day.cq.search.impl.builder.QueryImpl XPath query: /jcr:root/content//element(*, cq:Page)[(jcr:contains(jcr:content, "Geometrixx") or jcr:contains(jcr:content/@cq:tags, "Geometrixx"))]`

* Paste the XPath query into [Explain Query](/help/sites-administering/operations-dashboard.md#explain-query) as XPath to obtain the query plan

### Obtain explain-able XPath via the Query Builder debugger {#obtain-explain-able-xpath-via-the-query-builder-debugger}

* Use the AEM QueryBuilder debugger to generate an explainable XPath query:

Explain **all** queries during the development cycle against the target index set.

**Obtain explain-able XPath via logging**

* Enable DEBUG logs for QueryBuilder to obtain underlying, explainable XPath query

    * Navigate to https://&lt;serveraddress&gt;:&lt;serverport&gt;/system/console/slinglog. Create a logger for `com.day.cq.search.impl.builder.QueryImpl` at **DEBUG**.

* After DEBUG is enabled for the above class, the logs display the XPath generated by Query Builder.
* Copy the XPath query from the log entry for the associated QueryBuilder query, For example:

    * `com.day.cq.search.impl.builder.QueryImpl XPath query: /jcr:root/content//element(*, cq:Page)[(jcr:contains(jcr:content, "Geometrixx") or jcr:contains(jcr:content/@cq:tags, "Geometrixx"))]`

* Paste the XPath query into [Explain Query](/help/sites-administering/operations-dashboard.md#explain-query) as XPath to obtain the query plan

**Obtain explain-able XPath via the Query Builder debugger**

* Use the AEM QueryBuilder debugger to generate an explainable XPath query:

![chlimage_1-66](assets/chlimage_1-66a.png)

1. Provide the Query Builder query in the Query Builder debugger
1. Execute the Search
1. Obtain the generated XPath
1. Paste the XPath query into Explain Query as XPath to obtain the query plan

>[!NOTE]
>
>Non-querybuilder queries (XPath, JCR-SQL2) can be provided directly to Explain Query.

For a rundown on how to debug queries with QueryBuilder, see the video below.

>[!NOTE]
>
>[https://www.youtube.com/watch?v=BnyXjhRKYKc](https://www.youtube.com/watch?v=BnyXjhRKYKc)

## Debugging Queries with Logging {#debugging-queries-with-logging}

>[!NOTE]
>
>The configuration of the loggers is described in the section [Creating Your Own Loggers and Writers](/help/sites-deploying/configure-logging.md#creating-your-own-loggers-and-writers).

The log output (INFO level) of the query builder implementation when executing the query described in Testing and Debugging:

```xml
com.day.cq.search.impl.builder.QueryImpl executing query (predicate tree):
null=group: limit=20, offset=0[
    {group=group: or=true[
        {1_fulltext=fulltext: fulltext=Geometrixx, relPath=jcr:content}
        {2_fulltext=fulltext: fulltext=Geometrixx, relPath=jcr:content/@cq:tags}
    ]}
    {path=path: path=/content}
    {type=type: type=cq:Page}
]
com.day.cq.search.impl.builder.QueryImpl XPath query: /jcr:root/content//element(*, cq:Page)[(jcr:contains(jcr:content, "Geometrixx") or jcr:contains(jcr:content/@cq:tags, "Geometrixx"))]
com.day.cq.search.impl.builder.QueryImpl no filtering predicates
com.day.cq.search.impl.builder.QueryImpl query execution took 69 ms

```

If you have a query using predicate evaluators that filter or that use a custom order by comparator, this will also be noted in the query:

```xml
com.day.cq.search.impl.builder.QueryImpl executing query (predicate tree):
null=group: [
    {nodename=nodename: nodename=*.jar}
    {orderby=orderby: orderby=@jcr:content/jcr:lastModified}
    {type=type: type=nt:file}
]
com.day.cq.search.impl.builder.QueryImpl custom order by comparator: jcr:content/jcr:lastModified
com.day.cq.search.impl.builder.QueryImpl XPath query: //element(*, nt:file)
com.day.cq.search.impl.builder.QueryImpl filtering predicates: {nodename=nodename: nodename=*.jar}
com.day.cq.search.impl.builder.QueryImpl query execution took 272 ms
```

## Javadoc Links {#javadoc-links}

| **Javadoc** |**Description** |
|---|---|
| [com.day.cq.search](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/day/cq/search/package-summary.html) |Basic QueryBuilder and Query API |
| [com.day.cq.search.result](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/day/cq/search/result/package-summary.html) |Result API |
| [com.day.cq.search.facets](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/day/cq/search/facets/package-summary.html) |Facets |
| [com.day.cq.search.facets.buckets](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/day/cq/search/facets/buckets/package-summary.html) |Buckets (contained within facets) |
| [com.day.cq.search.eval](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/day/cq/search/eval/package-summary.html) |Predicate Evaluators |
| [com.day.cq.search.facets.extractors](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/day/cq/search/facets/extractors/package-summary.html) |Facet Extractors (for evaluators) |
| [com.day.cq.search.writer](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/day/cq/search/writer/package-summary.html) |JSON Result Hit Writer for Querybuilder servlet (/bin/querybuilder.json) |

---
title: Search Essentials
description: Learn about the search feature which is an essential feature of AEM Communities. Communities also provide the search API for user-generated content.
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: 8af5ee58-19d7-47b6-b45d-e88006703a5d
---
# Search Essentials {#search-essentials}

## Overview {#overview}

The search feature is an essential feature of Adobe Experience Manager (AEM) Communities. In addition to the [AEM platform search](../../help/sites-deploying/queries-and-indexing.md) capabilities, AEM Communities provides the [UGC search API](#ugc-search-api) for searching user-generated content (UGC). UGC has unique properties as it is entered and stored separately from other AEM content and user data.

For Communities, the two things generally searched are:

* Content posted by community members

  * It uses AEM Communities' UGC search API.

* Users and user groups (user data)

  * It uses the AEM platform search capabilities.

This section of the documentation is of interest to developers who are creating custom components that create or manage UGC.

## Security and Shadow Nodes {#security-and-shadow-nodes}

For a custom component, it is necessary to use the [SocialResourceUtilities](socialutils.md#socialresourceutilities-package) methods. The utility methods that create and search for UGC establish the required [shadow nodes](srp.md#about-shadow-nodes-in-jcr) and ensure that the member has the correct permissions for the request.

What is not managed through the SRP utilities are properties related to moderation.

See [SRP and UGC Essentials](srp-and-ugc.md) for information regarding utility methods used to access UGC and ACL shadow nodes.

## UGC Search API {#ugc-search-api}

The [UGC common store](working-with-srp.md) is provided by one of various storage resource providers (SRPs), each possibly having a different native query language. Therefore, regardless of the SRP chosen, custom code should use methods from the [UGC API package](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/ugc/api/package-summary.html) (*com.adobe.cq.social.ugc.api*) which invokes the query language appropriate for the chosen SRP.

### ASRP Searches {#asrp-searches}

For [ASRP](asrp.md), UGC is stored in the Adobe cloud. While UGC is not visible in CRX, [moderation](moderate-ugc.md) is available from both the author and Publish environments. The use of the [UGC search API](#ugc-search-api) works for ASRP the same as for other SRPs.

Tools do not currently exist for managing ASRP searches.

When creating custom properties that are searchable, it is necessary to adhere to the [naming requirements](#naming-of-custom-properties).

### MSRP Searches {#msrp-searches}

For [MSRP](msrp.md), UGC is stored in MongoDB configured to use Solr for searching. UGC is not visible in CRX, but [moderation](moderate-ugc.md) is available from both the author and Publish environments.

Regarding MSRP and Solr:

* The embedded Solr for the AEM platform is not used for MSRP.
* If using a remote Solr for the AEM platform, it may be shared with MSRP, but they should use different collections.
* Solr may be configured for standard search or for multilingual search (MLS).
* For configuration details, see [Solr Configuration](msrp.md#solr-configuration) for MSRP.

Custom search features should use the [UGC search API](#ugc-search-api).

When creating custom properties that are searchable, it is necessary to adhere to the [naming requirements](#naming-of-custom-properties).

### JSRP Searches {#jsrp-searches}

For [JSRP](jsrp.md), UGC is stored in [Oak](../../help/sites-deploying/platform.md) and is visible only in the repository of the AEM Author or Publish instance on which it was entered.

Since UGC is typically entered in the Publish environment, for multi-publisher production systems, it is necessary to configure a [publish cluster](topologies.md), not a publish farm, so that the entered content is visible from all publishers.

For JSRP, UGC entered in the Publish environment is never visible in the author environment. Therefore, all [moderation](moderate-ugc.md) tasks take place in the Publish environment.

Custom search features should use the [UGC search API](#ugc-search-api).

#### Oak Indexing {#oak-indexing}

While Oak indexes are not automatically created for the AEM platform search, as of AEM 6.2, they have been added for AEM Communities to improve performance and give support for pagination when presenting UGC search results.

If custom properties are in use and searches are slow, then additional indexes must be created for the custom properties to make them more performant. To maintain portability, adhere to the [naming requirements](#naming-of-custom-properties) when creating custom properties that are searchable.

To modify existing indexes or create custom indexes, see [Oak Queries and Indexing](../../help/sites-deploying/queries-and-indexing.md).

The [Oak Index Manager](https://adobe-consulting-services.github.io/acs-aem-commons/features/oak-index-manager.html) is available from ACS AEM Commons. It provides:

* A view of existing indexes.
* The ability to initiate reindexing.

To view the existing Oak indexes in [CRXDE Lite](../../help/sites-developing/developing-with-crxde-lite.md), the location is:

* `/oak:index/socialLucene`

![social-lucene](assets/social-lucene.png)

## Indexed Search Properties {#indexed-search-properties}

### Default Search Properties {#default-search-properties}

The following are some of the searchable properties used for various Communities features:

| **Property** |**Data Type** |
|---|---|
| isFlagged |*Boolean* |
| isSpam |*Boolean* |
| read |*Boolean* |
| influence |*Boolean* |
| attachments |*Boolean* |
| sentiment |*Long* |
| flagged |*Boolean* |
| added |*Date* |
| modifiedDate |*Date* |
| state |*String* |
| userIdentifier |*String* |
| replies |*Long* |
| jcr:title |*String* |
| jcr:description |*String* |
| sling:resourceType |*String* |
| allowThreadedReply |*Boolean* |
| isDraft |*Boolean* |
| publishDate |*Date* |
| publishJobId |*String* |
| answered |*Boolean* |
| chosenanswered |*Boolean* |
| tag |*String* |
| cq:Tag |*String* |
| author_display_name |*String* |
| location_t |*String* |
| parentPath |*String* |
| parentTitle |*String* |

### Naming of Custom Properties {#naming-of-custom-properties}

When adding custom properties, for those properties to be visible to sorts and searches created with the [UGC search API](#ugc-search-api), it is *required* to add a suffix to the property name.

The suffix is for query languages which use a schema:

* It identifies the property as searchable.
* It identifies the data type.

Solr is an example of a query language which uses a schema.

| **Suffix** |**Data Type** |
|---|---|
| _b |*Boolean* |
| _dt |*Calendar* |
| _d |*Double* |
| _tl |*Long* |
| _s |*String* |
| _t |*Text* |

**Notes:**

* *Text* is a tokenized string, *String* is not. Use *Text* for fuzzy (more like this) searches.

* For multi-valued types, add 's' to the suffix, for example:

  * `viewDate_dt`: single date property
  * `viewDates_dts`: list of dates property

## Filters {#filters}

Components, which include the [comment system](essentials-comments.md), support the filter parameter in addition to their endpoints.

The filter syntax for AND and OR logic is expressed as follows (shown before being URL encoded):

* To specify OR use one filter param with comma-separated values:

  * `filter=name eq 'Jennifer',name eq 'Jen'`

* To specify AND use multiple filter params:

  * `filter = name eq 'Jackson'&filter=message eq 'testing'`

The default implementation of the [Search component](search.md) uses this syntax as can be seen in the URL that opens the Search Results page in the [Community Components guide](components-guide.md). To experiment, browse to [http://localhost:4503/content/community-components/en/search.html](http://localhost:4503/content/community-components/en/search.html).

Filter operators are:

| EQ |equals |
|---|---|
| NE |not equals |
| LT |less than |
| LTE |less than or equal to |
| GE |greater than |
| GTE |greater than or equal to |
| LIKE |fuzzy match |

It is important that the URL references the Communities component (resource) and not the page on which the component is placed:

* Correct: forum component
  * `/content/community-components/en/forum/jcr:content/content/forum.social.json`
* Incorrect: forum page
  * `/content/community-components/en/forum.social.json`

## SRP Tools {#srp-tools}

There is an Adobe Experience Cloud GitHub project which contains:

[AEM Communities SRP Tools](https://github.com/Adobe-Marketing-Cloud/aem-communities-srp-tools)

This repository contains tools for managing data in SRP.

Currently, there is one servlet that can delete all UGC from any SRP.

For example, to delete all UGC in ASRP:

```shell
curl -X POST http://localhost:4502/services/social/srp/cleanup?path=/content/usergenerated/asi/cloud -uadmin:admin
```

## Troubleshooting {#troubleshooting}

### Solr Query {#solr-query}

To help troubleshoot problems with a Solr query, enable DEBUG logging for

`com.adobe.cq.social.srp.impl.SocialSolrConnector`.

The actual Solr query is displayed URL encoded in the debug log:

Query to solr is: `sort=timestamp+desc&bl=en&pl=en&start=0&rows=10 &q=%2Btitle_t:(hello)+%2Bprovider_id:\/content/usergenerated/asi/mongo/content/+%2Bresource_type_s:&df=provider_id&trf=verbatim&fq={!cost%3D100}report_suite:mongo`

The value of the `q` parameter is the query. Once the URL encoding is decoded, the query can be passed to the Solr Admin Query tool for further debugging.

## Related Resources {#related-resources}

* [Community Content Storage](working-with-srp.md) - Discusses the available SRP choices for a UGC common store.
* [Storage Resource Provider Overview](srp.md) - Introduction and repository usage overview.
* [Accessing UGC with SRP](accessing-ugc-with-srp.md) - Coding guidelines.
* [SocialUtils Refactoring](socialutils.md) - Utility methods for SRP that replace SocialUtils.
* [Search and Search Results components](search.md) - Adding UGC search feature to a template.

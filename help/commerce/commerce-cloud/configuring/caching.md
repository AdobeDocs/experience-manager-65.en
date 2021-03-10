---
title: Caching & Performance
description: Learn about the different configurations available to enable GraphQL and content caching to optimize the performance of your commerce implementation.
---

# Caching & Performance {#caching}

## Component & GraphQL response caching {#graphql}

The AEM CIF Core Components already have built-in support for caching GraphQL responses for individual components. This feature can be used to reduce the number of GraphQL backend calls by a large factor. An effective caching can be achieved especially for repeating queries like retrieving the category tree for a navigation component or fetching all the available aggregations/facets values displayed on the product search and category pages.

For the AEM CIF Core Components, caching is configured on a component basis, so it is possible to control if (and how long) GraphQL requests/responses are being cached for each component. It is also possible to define the caching behavior for OSGi services using the GraphQL client.

### Configuration

Once configured for a given component, the cache starts storing GraphQL queries and responses as defined by each cache configuration entry. The size of the cache and the caching duration of each entry is to be defined on a project basis, depending for example on how often the catalog data might change, how critical it is that a component always displays the latest possible data, etc. Note that there isn't any cache invalidation, so be careful when setting the cache durations.

When configuring caching for components, the cache name must be the name of the **proxy** components that you define in your project.

Before the client sends a GraphQL request, it will check if that **exact** same GraphQL request is already cached and will possibly return the cached response. To match, the GraphQL request MUST exactly match, that is, the query, operation name (if any), variables (if any) MUST all be equal to the cached request, and also all custom HTTP headers that might be set MUST also be the same. For example, the Magento `Store` header MUST match.

### Examples

We recommend that to configure some caching for the search service that fetches all the available aggregations/facets values displayed on the product search and category pages. These values typically only change when a new attribute is for example added to products, so the duration for this cache entry can be "large" if the set of product attributes does not change often. While this is project-specific, we recommend values of a few minutes in project development phases and a few hours on stable production systems.

This is typically configured with the following cache entry:

```
com.adobe.cq.commerce.core.search.services.SearchFilterService:true:10:3600
```

Another example scenario where the GraphQl caching feature is recommended to be used is the navigation component because it sends the same GraphQL query on all pages. In this case, the cache entry would be typically set to:

```
venia/components/structure/navigation:true:10:600
```

when considering the [Venia Reference store](https://github.com/adobe/aem-cif-guides-venia) is used. Note the use of the component proxy name `venia/components/structure/navigation`, and **not** the name of the CIF navigation component (`core/cif/components/structure/navigation/v1/navigation`).

Caching for other components should be defined on a project basis, usually in coordination with caching configured at the Dispatcher level. Remember that there isn't any active invalidation of these caches, so caching duration should be carefully set. There isn't any "one size fits all" values that would match all possible projects and use cases. Make sure that you define a caching strategy at the project level that best matches the requirements of your project.

## Dispatcher caching {#dispatcher}

Caching AEM pages or fragments in the [AEM Dispatcher](https://docs.adobe.com/content/help/en/experience-manager-dispatcher/using/dispatcher.html) is a best practice for any AEM project. Usually, it relies on invalidation techniques that ensure that any content changed in AEM is properly updated in the Dispatcher. This is a core feature of the AEM Dispatcher caching strategy.

In addition to pure AEM managed content CIF a page can typically display commerce data that is dynamically fetched from Magento via GraphQL. While the page structure itself might never change, the commerce content might change, for example, if some product data (name, price, etc) changes in Magento.

To make sure that CIF pages can be cached for a limited amount of time in the AEM dispatcher, we hence recommend the use of [Time Based Cache Invalidation](https://docs.adobe.com/content/help/en/experience-manager-dispatcher/using/configuring/dispatcher-configuration.html#configuring-time-based-cache-invalidation-enablettl) (also known as TTL-based caching) when caching CIF pages in the AEM Dispatcher. This feature can be configured in AEM with using the extra [ACS AEM Commons](https://adobe-consulting-services.github.io/acs-aem-commons/) package.

With TTL-based caching, a developer typically defines one or multiple caching durations for selected AEM pages. This ensures that CIF pages are only cached in the AEM dispatcher up to the configured duration and that the content will be frequently updated.

>[!NOTE]
>
>While server-side data may be cached by the AEM dispatcher, some CIF components like the `product`, `productlist`, and `searchresults` components typically always re-fetch product prices in a client-side browser request when the page is loaded. This ensures that crucial dynamic content is always fetched on page load.

## Additional Resources

- [Venia Reference store](https://github.com/adobe/aem-cif-guides-venia)
- [GraphQL caching configuration](https://github.com/adobe/commerce-cif-graphql-client#caching)
- [AEM Dispatcher](https://docs.adobe.com/content/help/en/experience-manager-dispatcher/using/dispatcher.html)
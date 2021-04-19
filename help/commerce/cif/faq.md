---
title: AEM - Commerce Integration using Commerce Integration Framework FAQ
description: AEM - Commerce Integration using Commerce Integration Framework FAQ
exl-id: 0a946d98-22c7-445d-984a-9e09c306ce45,aece1190-9530-4060-9b08-022da7068987
---
# AEM - Commerce Integration using Commerce Integration Framework FAQ

## 1. Is CIF GraphQL only used for commerce or will this be available for querying content authored on AEMs JCR?

Adobe has adopted Magento’s GraphQL APIs as its official commerce API for all commerce related data. Hence, AEM uses GraphQL to exchange commerce data with Magento and with any commerce engine via I/O Runtime. This GraphQL API is independent from AEM's GraphQL API to access Content Fragments.

## 2. Can Product assets (images) be stored and referenced from AEM via Adobe Commerce (Magento) admin? How can assets from Dynamic Media be consumed?

There is no official AEM Assets – Magento integration available. There is a partner connector available on the [marketplace](https://marketplace.magento.com/bounteous-dam.html).

Or as a workaround, you can store product assets (images) in AEM Assets but you will have to manually store the asset URLs in Magento. Dynamic Media is now part of AEM Assets and will work the same way.

## 3. Does it matter where the commerce solution is deployed? (On-prem or in the cloud)

No, it does not matter where your commerce solution is deployed. CIF and the AEM storefront will work regardless of the deployment model. However, if the solution is deployed with the recommended E2E reference architecture, E2E tests can run against performance KPIs that represent a typical enterprise customer profile. This will provide additional information that can be used as a benchmark.

## 4. How are catalog pages or product pages created in AEM? How do they persist in AEM?

Catalog pages and product pages are created and cached dynamically in AEM based on generic catalog and product page templates. No product or catalog data is imported and stored in AEM.

## 5. When you update product data in your commerce solution, is that a real-time push to AEM? Or is it a batch process?

The CIF add-on used with AEM Cloud Service enables data to flow from the commerce solution to AEM on-demand. Hence, this is not a real-time push or a batch process when there is an update in your commerce solution.

## 6. What catalog size does AEM with CIF support?

This depends on a few additional aspects you have to consider. What is the cache ratio of your catalog data & pages? How many concurrent requests do you expect during peak hours? How scaleable are the APIs of your commerce solutions?

## 7. How does PIM play into this framework?

PIM data gets exposed to AEM and clients via GraphQL requests. Our recommendation is to integrate PIM with the commerce engine (Magento or others) so that PIM data can then be retrieved from the commerce engine.

## 8. Do you also cache pricing and other data via Dispatcher. Does that raise a frequent cache invalidation challenge?

Dynamic data such as price or inventory is not cached on the Dispatcher. Dynamic data is fetched client-side with web components directly via GraphQL APIs. Only static data (such as product or category data) is cached on the Dispatcher. If product data changes, there will be a need for cache invalidation.

## 9. How does cache invalidation for AEM Dispatcher work with AEM and commerce?

We recommend setting up TTL-based cache invalidation for pages cached on the Dispatcher. For dynamic information such as price or stock, we recommend rendering the date client-side. For more information about TTL-based cache invalidation, please refer to [AEM Dispatcher](https://helpx.adobe.com/experience-manager/kb/optimizing-the-dispatcher-cache.html)

## 10. Is there any recommendation on unified search across AEM content with Commerce?

A product search reference implementation is provided but no unified search with content. This feature is usually very customer specific and better solved on a project-specific level.

## 11. How does Search work with AEM and commerce using CIF?

CIF provides Search bar and Search Result components. The Search bar component sends a GraphQL request with the search term to the commerce solution which then returns a product list that includes product name, price, SLUG, etc. The Search Result component then displays the search results in a gallery view on a search result page created in AEM. The Search supports basic full-text search. We use the SLUG/url key to build a reference to the PDP.

## 12. How can product data be used in MSM or translations?

Product data is usually already translated in PIM or in Magento. The AEM – Magento Integration supports the connection to multiple Magento stores & store views. In an MSM setup typically one AEM site is linked to one Magento store view.

## 13. Is there a way to enhance the product data with commercial text? Where do you do this? In AEM or in the commerce solution?

We recommend to manage marketing related data and content in AEM. Decorate product data from your commerce solution with additional attributes using Content Fragments or create and link Experience Fragments for un-strutured content with your products.

## 14. How can we ensure PCI compliance when using AEM for the entire presentation layer?

We recommend to use abstracted payment methods. This puts the browser client in direct communication with the payment gateway provider so that neither Adobe or the commerce solutions hold or pass cardholder data. This approach requires only a level 3 PCI compliance. However, there are additional things to consider to be fully PCI compliant such as how employees interact with the system and data. For more information about Magento PCI compliance, please refer to <https://magento.com/pci-compliance>

## 15. If I use AEM and Magento cloud versions, is this joint solution PCI compliant?

Yes, Self-Assessment Questionnaire D and Attestation of Compliance are available on-request.

## 16. How can I request for an I/O Runtime trial license?

You can request for a trial license to use I/O Runtime [here](https://adobeio.typeform.com/to/obqgRm).

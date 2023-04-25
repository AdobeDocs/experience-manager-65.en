---
title: AEM - Commerce Integration using Commerce Integration Framework FAQ
description: AEM - Commerce Integration using Commerce Integration Framework FAQ
exl-id: d541607f-c4c9-4dd5-aadf-64d4cb5f9f2a
---
# AEM - Commerce Integration using Commerce Integration Framework FAQ

## 1. Is CIF GraphQL only used for commerce or is it available for querying content authored on AEMs JCR?

Adobe has adopted Adobe Commerce's GraphQL APIs as its official commerce API for all commerce-related data. Hence, AEM uses GraphQL to exchange commerce data with Adobe Commerce and with any commerce engine via I/O Runtime. This GraphQL API is independent from AEM's GraphQL API to access Content Fragments.

## 2. Can Product assets (images) be stored and referenced from AEM via Adobe Commerce admin? How can assets from Dynamic Media be consumed?

No official AEM Assets &ndash; Adobe Commerce integration is available. There is a partner connector available on the [marketplace](https://marketplace.magento.com/partner/bounteous_ecomm).

Or, as a workaround, you can store product assets (images) in AEM Assets, but you have to manually store the asset URLs in Adobe Commerce. Dynamic Media is part of AEM Assets and works the same way.

## 3. Does it matter where the commerce solution is deployed? (On-prem or in the cloud)

No, it does not matter where your commerce solution is deployed. CIF and the AEM storefront work regardless of the deployment model. However, if the solution is deployed with the recommended E2E reference architecture, E2E tests can run against performance KPIs that represent a typical enterprise customer profile. This process provides additional information that can be used as a benchmark.

## 4. How are catalog pages or product pages created in AEM? How do they persist in AEM?

Catalog pages and product pages are created and cached dynamically in AEM based on generic catalog and product page templates. No product or catalog data is imported and stored in AEM.

## 5. When you update product data in your commerce solution, is that a real-time push to AEM? Or is it a batch process?

The CIF add-on used with AEM enables data to flow from the commerce solution to AEM on-demand. Hence, this workflow is not a real-time push or a batch process when there is an update in your commerce solution.

## 6. What catalog size does AEM with CIF support?

The catalog size support depends on a few additional aspects that you have to consider. What is the cache ratio of your catalog data & pages? How many concurrent requests do you expect during peak hours? How scalable are the APIs of your commerce solutions?

## 7. How does PIM play into this framework?

PIM data gets exposed to AEM and clients by way of GraphQL requests. Adobe's recommendation is to integrate PIM with the commerce engine (Adobe Commerce or others) so that PIM data can then be retrieved from the commerce engine.

## 8. Do you also cache pricing and other data via Dispatcher. Does that raise a frequent cache invalidation challenge?

Dynamic data such as price or inventory is not cached on the Dispatcher. Dynamic data is fetched client-side with web components directly via GraphQL APIs. Only static data (such as product or category data) is cached on the Dispatcher. If product data changes, cache invalidation is needed.

## 9. How does cache invalidation for AEM Dispatcher work with AEM and commerce?

Adobe recommends setting up TTL-based cache invalidation for pages cached on the Dispatcher. For dynamic information such as price or stock, Adobe recommends rendering the date client-side. For more information about TTL-based cache invalidation, see [AEM Dispatcher](https://experienceleague.adobe.com/docs/experience-cloud-kcs/kbarticles/KA-17458.html?lang=en)

## 10. Is there any recommendation on unified search across AEM content with Commerce?

A product search reference implementation is provided but no unified search with content. This feature is customer-specific and better solved on a project-specific level.

## 11. How does Search work with AEM and commerce using CIF?

CIF provides Search bar and Search Result components. The Search bar component sends a GraphQL request with the search term to the commerce solution which then returns a product list that includes product name, price, SLUG, and so on. The Search Result component then displays the search results in a gallery view on a search result page created in AEM. The Search supports basic full-text search. Use the SLUG/url key to build a reference to the PDP.

## 12. How can product data be used in MSM or translations?

Product data is already translated in PIM or in Adobe Commerce. The AEM – Adobe Commerce Integration supports the connection to multiple Adobe Commerce stores & store views. In an MSM setup, typically one AEM site is linked to one Adobe Commerce store view.

## 13. Is there a way to enhance the product data with commercial text? If so, where is it done? In AEM or in the commerce solution?

Adobe recommends managing marketing-related data and content in AEM. Decorate product data from your commerce solution with additional attributes using Content Fragments or create and link Experience Fragments for unstructured content with your products.

## 14. How does a company ensure PCI compliance when using AEM for the entire presentation layer?

Adobe recommends using abstracted payment methods. Doing so puts the browser client in direct communication with the payment gateway provider so that Adobe does not hold or pass cardholder date, nor the commerce solutions. This approach requires only a level 3 PCI compliance. However, there are additional things to consider to be fully PCI-compliant such as how employees interact with the system and data. For more information about Adobe Commerce PCI compliance, see [PCI compliance](https://business.adobe.com/products/magento/pci-compliance.html)

## 15. If I use AEM and Adobe Commerce cloud versions, is this joint solution PCI compliant?

Yes, Self-Assessment Questionnaire D and Attestation of Compliance are available on-request.

## 16. How can I request for an I/O Runtime trial license?

You can request for a trial license to use I/O Runtime [here](https://adobeio.typeform.com/to/obqgRm).

---
title: Advanced URL Configurations
description: Learn how to customize the URLs for product and category pages. This allows implementations to optimize URLs for search engines and promote discovery.
sub-product: Commerce
version: cloud-service
doc-type: technical-video
activity: setup
audience: administrator
feature: Commerce Integration Framework
kt: 4933
thumbnail: 34350.jpg
---

# Advanced URL Configurations {#url}

[AEM CIF Core Components](https://github.com/adobe/aem-core-cif-components) provides advanced configurations to customize the URLs for product and category pages. Many implementations will customize these URLs for search engine optimization (SEO) purposes.  The following video details how to configure the `UrlProvider` Service and features of [Sling Mapping](https://sling.apache.org/documentation/the-sling-engine/mappings-for-resource-resolution.html) to customize the URLs for product and category pages.

>[!VIDEO](https://video.tv.adobe.com/v/34350/?quality=12)

## Configuration {#configuration}

To configure the `UrlProvider` service according to the SEO requierments and needs a project must provide a OSGI config for the "CIF URL Provider configuration" configuration, and configure the service as described below.

>[!NOTE]
>
> The [Venia Reference store](https://github.com/adobe/aem-cif-guides-venia) project, see below, includes sample configurations to demonstrate the usage of custom URLs for product and category pages.

### Product page URL template {#product}

This configures the URLs of the product pages with the following properties:

* **Product URL template**: defines the format of URLs with a set of placeholders. The default value is `{{page}}.{{url_key}}.html#{{variant_sku}}`, which ends up generating URLs like for example `/content/venia/us/en/products/product-page.chaz-kangeroo-hoodie.html#MH01-M-Orange` where
  * `{{page}}` was replaced by `/content/venia/us/en/products/product-page`
  * `{{url_key}}` was replaced by Magento's `url_key` property of the product, here `chaz-kangeroo-hoodie`
  * `{{variant_sku}}` was replaced by the currently selected variant, here `MH01-M-Orange`
* **Product identifier location**: defines the location of the identifier that will be used to fetch the product data. The default value is `SELECTOR`, the other possible value is `SUFFIX`. With the previous example URL, this means the identifier `chaz-kangeroo-hoodie` will be used to fetch the product data.
* **Product identifier type**: defines the type of the identifier to be used when fetching the product data. The default value is `URL_KEY`, the other possible value is `SKU`. With the previous example URL, this means that the product data will be fetched with a Magento GraphQL filter like `filter:{url_key:{eq:"chaz-kangeroo-hoodie"}}`.

### Product list page URL template {#product-list}

This configures the URLs of the category or product list pages with the following properties:

* **Category URL template**: defines the format of URLs with a set of placeholders. The default value is `{{page}}.{{id}}.html`, which ends up generating URLs like for example `/content/venia/us/en/products/category-page.3.html` where
  * `{{page}}` was replaced by `/content/venia/us/en/products/category-page`
  * `{{id}}` was replaced by Magento's `id` property of the category, here `3`
* **Category identifier location**: defines the location of the identifier that will be used to fetch the product data. The default value is `SELECTOR`, the other possible value is `SUFFIX`. With the previous example URL, this means the identifier `3` will be used to fetch the product data.
* **Category identifier type**: defines the type of the identifier to be used when fetching the product data. The default value and currently only supported value is `ID`. With the previous example URL, this means that the category data will be fetched with a Magento GraphQL filter like `category(id:3)`.

It is possible to add custom properties for each template, as long as the corresponding data is being set by the components using the `UrlProvider`. Check for example the code of the `ProductListItemImpl` class to find out how this is implemented.

It is also possible to replace the `UrlProvider` service with a completely custom OSGi service. In this case, one must implement the `UrlProvider` interface and register it with a higher service ranking in order to replace the default implementation.

## Combine with Sling Mappings {#sling-mapping}

In addition to the `UrlProvider`, it is also possible to configure [Sling Mappings](https://sling.apache.org/documentation/the-sling-engine/mappings-for-resource-resolution.html) in order to rewrite and process URLs. The AEM Archetype project also provides [an example configuration](https://github.com/adobe/aem-cif-project-archetype/tree/master/src/main/archetype/samplecontent/src/main/content/jcr_root/etc/map.publish) to configure some Sling Mappings for port 4503 (publish) and 80 (dispatcher).

## Combine with AEM Dispatcher {#dispatcher}

URL rewrites can also be achived by using AEM Dispatcher HTTP server with `mod_rewrite` module. The [AEM Project Archetype](https://github.com/adobe/aem-project-archetype) provides a reference AEM Dispatcher config which already includes basic [rewrite rules](https://github.com/adobe/aem-project-archetype/tree/master/src/main/archetype/dispatcher.cloud) for the generated size.

## Example

The [Venia Reference store](https://github.com/adobe/aem-cif-guides-venia) project includes sample configurations to demonstrate the usage of custom URLs for product and category pages. This allows each project to setup individual URL patterns for product and category pages according to their SEO needs. A combination of CIF `UrlProvider` and Sling Mappings as described above is used.

>[!NOTE]
>
>This configuration must be adjusted with the external domain used by the project. The Sling Mappings are working based on the hostname and domain. Therefore this configuration is disabled by default and must be enabled before deployment. To do so rename the Sling Mapping `hostname.adobeaemcloud.com` folder in `ui.content/src/main/content/jcr_root/etc/map.publish/https` according to the used domain name and enable this config by adding `resource.resolver.map.location="/etc/map.publish"` to the `JcrResourceResolver` config of the project.

## Additional Resources

* [Venia Reference store](https://github.com/adobe/aem-cif-guides-venia)
* [AEM Resource Mapping](https://docs.adobe.com/content/help/en/experience-manager-65/deploying/configuring/resource-mapping.html)
* [Sling Mappings](https://sling.apache.org/documentation/the-sling-engine/mappings-for-resource-resolution.html)

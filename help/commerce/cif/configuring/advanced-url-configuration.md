---
title: Advanced URL Configurations
description: Learn how to customize the URLs for product and category pages. This allows implementations to optimize URLs for search engines and promote discovery.
sub-product: Commerce
doc-type: technical-video
activity: setup
audience: administrator
feature: Commerce Integration Framework
kt: 4933
thumbnail: 34350.jpg
exl-id: 0125021a-1c00-4ea3-b7fb-1533b7b9f4f2
---
# Advanced URL Configurations {#url}

[AEM CIF Core Components](https://github.com/adobe/aem-core-cif-components) provides advanced configurations to customize the URLs for product and category pages. Many implementations will customize these URLs for search engine optimization (SEO) purposes. The following video details how to configure the `UrlProvider` Service and features of [Sling Mapping](https://sling.apache.org/documentation/the-sling-engine/mappings-for-resource-resolution.html) to customize the URLs for product and category pages.

>[!VIDEO](https://video.tv.adobe.com/v/34350/?quality=12)

## Configuration {#configuration}

To configure the `UrlProvider` service according to the SEO requierments and needs a project must provide an OSGI configuration for the "CIF URL Provider configuration". 

>[!NOTE]
>
> Since release 2.0.0 of the AEM CIF Core Components, the URL Provider configuration only provides pre-defined url formats, instead of the free-text configureable formats kown from 1.x releases. Furthermore the use of selectors to pass data in URLs has been replaced with suffixes. 

### Product Page URL Format {#product}

This configures the URLs of the product pages and supports the following options:

* `{{page}}.html/{{sku}}.html#{{variant_sku}}` (default)
* `{{page}}.html/{{url_key}}.html#{{variant_sku}}`
* `{{page}}.html/{{sku}}/{{url_key}}.html#{{variant_sku}}`
* `{{page}}.html/{{url_path}}.html#{{variant_sku}}`
* `{{page}}.html/{{sku}}/{{url_path}}.html#{{variant_sku}}` 

In the case of the [Venia Reference store](https://github.com/adobe/aem-cif-guides-venia):

* `{{page}}` will be replaced by `/content/venia/us/en/products/product-page`
* `{{sku}}` will be replaced by the product's sku, e.g. `VP09`
* `{{url_key}}` will be replaced by the product's `url_key` property, e.g. `lenora-crochet-shorts`
* `{{url_path}}` will be replaced by the product's `url_path`, e.g. `venia-bottoms/venia-pants/lenora-crochet-shorts`
* `{{variant_sku}}` will be replaced by the currently selected variant, e.g. `VP09-KH-S`

With the above example data, a product variant URL formatted using the default URL format will look like `/content/venia/us/en/products/product-page.html/VP09.html#VP09-KH-S`.

### Category Page URL Format {#product-list}

This configures the URLs of the category or product list pages and supports the following options:

* `{{page}}.html/{{url_path}}.html` (default)
* `{{page}}.html/{{url_key}}.html`

In the case of the [Venia Reference store](https://github.com/adobe/aem-cif-guides-venia):

* `{{page}}` will be replaced by `/content/venia/us/en/products/category-page`
* `{{url_key}}` will be replaced by the category's `url_key` property
* `{{url_path}}` will be replaced by the category's `url_path`

With the above example data, a category page URL formatted using the default URL format will look like `/content/venia/us/en/products/category-page.html/venia-bottoms/venia-pants.html`.

>[!NOTE]
> 
> The `url_path` is a concatenation of the `url_keys` of a product or category's ancestors and the product or category's `url_key` separated by `/` slash.

## Custom URL Formats {#custom-url-format}

To provide a custom URL format a project can implement the [`UrlFormat` interface](https://javadoc.io/doc/com.adobe.commerce.cif/core-cif-components-core/latest/com/adobe/cq/commerce/core/components/services/urls/UrlFormat.html) and regsiter the implementation as OSGI service, using it either as category page or product page url format. The `UrlFormat#PROP_USE_AS` service property indicates, which of the configured pre-defined formats to replace:

* `useAs=productPageUrlFormat`, will replace the configured product page url format
* `useAs=categoryPageUrlFormat`, will replace the configured category page url format

If there are multiple implementations of the `UrlFormat` registered as OSGI services, the one with the higher service ranking replaces the one(s) with the lower service ranking.

The `UrlFormat` must implement a pair of methods to build a URL from a given Map of parameters and to parse an URL to return the same Map of parameters. The parameters are the same as described above, only for categories an additional `{{uid}}` parameter is provided to the `UrlFormat`.

## Combine with Sling Mappings {#sling-mapping}

In addition to the `UrlProvider`, it is also possible to configure [Sling Mappings](https://sling.apache.org/documentation/the-sling-engine/mappings-for-resource-resolution.html) in order to rewrite and process URLs. The AEM Archetype project also provides [an example configuration](https://github.com/adobe/aem-cif-project-archetype/tree/master/src/main/archetype/samplecontent/src/main/content/jcr_root/etc/map.publish) to configure some Sling Mappings for port 4503 (publish) and 80 (dispatcher).

## Combine with AEM Dispatcher {#dispatcher}

URL rewrites can also be achived by using AEM Dispatcher HTTP server with `mod_rewrite` module. The [AEM Project Archetype](https://github.com/adobe/aem-project-archetype) provides a reference AEM Dispatcher config which already includes basic [rewrite rules](https://github.com/adobe/aem-project-archetype/tree/master/src/main/archetype/dispatcher.cloud) for the generated size.

## Example

The [Venia Reference store](https://github.com/adobe/aem-cif-guides-venia) project includes sample configurations to demonstrate the usage of custom URLs for product and category pages. This allows each project to set up individual URL patterns for product and category pages according to their SEO needs. A combination of CIF `UrlProvider` and Sling Mappings as described above is used.

>[!NOTE]
>
>This configuration must be adjusted with the external domain used by the project. The Sling Mappings are working based on the hostname and domain. Therefore this configuration is disabled by default and must be enabled before deployment. To do so rename the Sling Mapping `hostname.adobeaemcloud.com` folder in `ui.content/src/main/content/jcr_root/etc/map.publish/https` according to the used domain name and enable this config by adding `resource.resolver.map.location="/etc/map.publish"` to the `JcrResourceResolver` config of the project.

## Additional Resources

* [Venia Reference store](https://github.com/adobe/aem-cif-guides-venia)
* [AEM Resource Mapping](https://experienceleague.adobe.com/docs/experience-manager-65/deploying/configuring/resource-mapping.html)
* [Sling Mappings](https://sling.apache.org/documentation/the-sling-engine/mappings-for-resource-resolution.html)

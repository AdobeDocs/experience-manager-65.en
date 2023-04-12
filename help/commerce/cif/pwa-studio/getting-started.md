---
title: Getting started with AEM Extension for PWA Studio
description: Learn how to deploy an AEM headless Content and Commerce project with PWA Studio.
topics: Commerce
feature: Commerce Integration Framework
thumbnail: 37843.jpg
exl-id: de7b8f05-b6b7-4105-84a5-940c16ebf2b4
---
# Getting started with AEM Extension for PWA Studio {#getting-started-pwa}

Out of the box, PWA Studio integrates seamlessly with Adobe Commerce via GraphQL providing unlimited options for creating innovative and engaging storefronts and other digital experiences.

Content Fragments are pieces of content with a predefined structure that allows them to be consumed in a headless way using GraphQL as API in different formats (for example, JSON, Markdown) and independently rendered. Content fragments include all the data types and fields required for GraphQL to ensure your application only requests what is available and receives what is expected. The flexibility they provide in terms of how they are structured makes them perfect for use in multiple locations and over multiple channels.

Designing the structure you need is easy with the Content Fragment Model Editor within Adobe Experience Manager. The main challenge to integrating Adobe Experience Manager Content Fragments (or any other data) with your PWA Studio application is fetching data from multiple GraphQL endpoints. The reason is because out of the box, PWA Studio works with a single Adobe Commerce GraphQL endpoint.

## Architecture {#architecture}

![PWA headless architecture](/help/commerce/cif/assets/pwa-studio/PWA-Studio_Architecture.png)

## Setup PWA Studio {#setup-pwa}

To set up your PWA Studio app, follow the Adobe Commerce [PWA Studio documentation](https://developer.adobe.com/commerce/pwa-studio/tutorials/).

To connect PWA Studio with the GraphQL endpoint of AEM, you can use the [AEM Extension for PWA Studio](https://github.com/adobe/aem-pwa-studio-extensions).

1. Check out the repository

1. In your PWA Studio application, add the extension as a development dependency.

   ```javascript
   yarn add --dev file:{path-to-extension}/extension
   ```

1. Add the Apollo Link wrapper to your PWA Studio application. In pwa-root/src/index.js, make the following changes:

   ```javascript
     import { linkWrapper } from '@adobe/pwa-studio-aem-cfm-blog-extension';
   
   // ...
   
   <Adapter apiBase={apiBase} apollo={{ link: linkWrapper(apolloLink) }} store={store}>
   ```

   You can find more details on the Apollo Client customization in [linkWrapper.js](https://github.com/adobe/aem-pwa-studio-extensions/blob/master/aem-cfm-blog-extension/extension/src/linkWrapper.js).

1. To extend the navigation component with a Blog entry, add the following adaptions to pwa-root/local-intercept.js:

   ```javascript
   const addBlogToNavigation = require('@adobe/pwa-studio-aem-cfm-blog-extension/src/addBlogToNavigation');

   function localIntercept(targets) {
       addBlogToNavigation(targets);
   }    
   ```

   You can find more details on the customization of the Navigation component in [addBlogToNavigation.js](https://github.com/adobe/aem-pwa-studio-extensions/blob/master/aem-cfm-blog-extension/extension/src/addBlogToNavigation.js) and in the [Extensibility Framework](https://developer.adobe.com/commerce/pwa-studio/guides/general-concepts/extensibility/) documentation of PWA Studio.

1. The Apollo client expects the AEM GraphQL endpoint at `<https://pwa-studio/endpoint.js>`. To map the endpoint to this location, customize the UPWARD configuration of your PWA Studio application:
   a. To `pwa-root/.env`, add the AEM_CFM_GRAPHQL variable, and adapt it to point to your AEM Content Fragments GraphQL endpoint.

   Example: AEM_CFM_GRAPHQL=<http://localhost:4503/content/graphql/global>

   b. Add a proxy resolver to your UPWARD configuration. A sample UPWARD configuration could look like this:

```json
   response:
     resolver: conditional
     when:
       - matches: request.url.pathname
         pattern: ^/endpoint.json(/|$)
         use: aemProxy
     default: veniaResponse

   aemProxy:
     resolver: proxy
     target: env.AEM_CFM_GRAPHQL
     ignoreSSLErrors: true

   status: response.status
   headers: response.headers
   body: response.body
```

## Setup AEM {#setup-aem}

Follow the AEM Content Fragments documentation to set up a GraphQL endpoint for your AEM project. Also, in your AEM project, add the following configurations to allow your PWA Studio application to access the GraphQL endpoint:

* Adobe Granite Cross-Origin Resource Sharing Policy (com.adobe.granite.cors.impl.CORSPolicyImpl)

   Set the `allowedorigin` property to the full hostname of your PWA application.

   Example:  `<https://pwa-studio-test-vflyn.local.pwadev:9366>`

* Apache Sling Referrer Filter (org.apache.sling.security.impl.ReferrerFilter.cfg.json)

   Set the allow.hosts property to the hostname of your PWA application.

   Example: pwa-studio-test-vflyn.local.pwadev

You can find full examples of both configurations here: <https://github.com/adobe/aem-pwa-studio-extensions/tree/master/aem-cfm-blog-extension/aem/config/src/main/content/jcr_root/apps/blog-demo/config>.

To showcase the GraphQL endpoint, Adobe prepared some sample Content Fragment models and data by way of a content package. These pieces work together with the React Components provided with the PWA Studio extension.

## How to Use {#how-to-use}

This extension is considered an example implementation of how to connect a PWA Studio application with AEM to retrieve and render content via GraphQL.

Depending on your use case, you want to create your own custom Content Fragment models which result in a custom GraphQL schema which can then be consumed by your own React components.

Production setups can vary in multiple aspects.

* You can have a single federated GraphQL endpoint which combines AEM and Adobe Commerce GraphQL data instead of customizing Apollo client.
* Your PWA Studio application could use the AEM GraphQL endpoint URL directly, without a proxy with UPWARD. The proxy could also be moved to a different layer (for example, CDN).
* The approach fits best for you also heavily depends on how you deliver the PWA Studio application to the end user.

This extension comes with two examples.

### Blog {#blog}

Display blog posts based on some Content Fragment models. In addition, it contains examples of how to configure the Apollo client to work with the AEM GraphQL endpoint and how to extend the navigation component in PWA Studio. See [GitHub](https://github.com/adobe/aem-pwa-studio-extensions/tree/master/aem-cfm-blog-extension) for more details.

### PDP Enrichment {#pdp-enrichment}

Enables marketers to easily enrich PDPs with additional content that is managed as Content Fragments. See [GitHub](https://github.com/adobe/aem-pwa-studio-extensions/tree/master/aem-cif-product-page-extension) for more details.

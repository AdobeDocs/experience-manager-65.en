---
title: Resource Mapping
seo-title: Resource Mapping
description: Learn how to define redirects, vanity URLs and virtual hosts for AEM by using resource mapping.
seo-description: Learn how to define redirects, vanity URLs and virtual hosts for AEM by using resource mapping.
uuid: 2ca2d0e4-6f90-4ecc-82db-26991f08c66f
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: configuring
content-type: reference
discoiquuid: 3582a4d8-a47b-467a-9e25-cb45f969ec93
docset: aem65

feature: Configuring
exl-id: 3eebdd38-da5b-4c38-868a-22c3c7a97b66
---
# Resource Mapping{#resource-mapping}

Resource mapping is used to define redirects, vanity URLs and virtual hosts for AEM.

For example, you can use these mappings to:

* Prefix all requests with `/content` so that the internal structure is hidden from the visitors to your website.
* Define a redirect so that all requests to the `/content/en/gateway` page of your website are redirected to `https://gbiv.com/`.

One possible HTTP mapping prefixes all requests to `localhost:4503` with `/content`. A mapping like this could be used to hide the internal structure from the visitors to the website as it allows:

`localhost:4503/content/we-retail/en/products.html`

to be accessed using:

`localhost:4503/we-retail/en/products.html`

as the mapping will automatically add the prefix `/content` to `/we-retail/en/products.html`.

>[!CAUTION]
>
>Vanity URLs do not support regex patterns.

>[!NOTE]
>
>See the Sling documentation, and [Mappings for Resource Resolution](https://sling.apache.org/site/resources.html) and [Resources](https://sling.apache.org/site/mappings-for-resource-resolution.html) for further information.

## Viewing Mapping Definitions {#viewing-mapping-definitions}

The mappings form two lists that the JCR Resource Resolver evaluates (top-down) to find a match.

These lists can be viewed (together with configuration information) under the **JCR ResourceResolver** option of the Felix console; for example, `https://<*host*>:<*port*>/system/console/jcrresolver`:

* Configuration
  Shows the current configuration (as defined for the [Apache Sling Resource Resolver](/help/sites-deploying/osgi-configuration-settings.md#apacheslingresourceresolver)).

* Configuration Test
  This allows you to enter a URL or resource path. Click **Resolve** or **Map** to confirm how the system will transform the entry.

* **Resolver Map Entries**
  The list of entries used by the ResourceResolver.resolve methods to map URLs to Resources.

* **Mapping Map Entries**
  The list of entries used by the ResourceResolver.map methods to map Resource Paths to URLs.

The two lists show various entries, including those defined as defaults by the application(s). These often aim to simplify URLs for the user.

The lists pair a **Pattern**, a regular expression matched to the request, with a **Replacement** that defines the redirection to impose.

For example, the:

**Pattern** `^[^/]+/[^/]+/welcome$`

will trigger the:

**Replacement** `/libs/cq/core/content/welcome.html`.

to redirect a request:

`https://localhost:4503/welcome` ``

to:

`https://localhost:4503/libs/cq/core/content/welcome.html`

New mapping definitions are created within the repository.

>[!NOTE]
>
>There are many resources available that help explain how to define regular expressions; for example [https://www.regular-expressions.info/](https://www.regular-expressions.info/).

### Creating Mapping Definitions in AEM {#creating-mapping-definitions-in-aem}

In a standard installation of AEM you can find the folder:

`/etc/map/http`

This is the structure used when defining mappings for the HTTP protocol. Other folders ( `sling:Folder`) can be created under `/etc/map` for any other protocols that you want to map.

#### Configuring an Internal Redirect to /content {#configuring-an-internal-redirect-to-content}

To create the mapping that prefixes any request to https://localhost:4503/ with `/content`:

1. Using CRXDE navigate to `/etc/map/http`.

1. Create a new node:

    * **Type** `sling:Mapping`
      This node type is intended for such mappings, though its use is not mandatory.

    * **Name** `localhost_any`

1. Click **Save All**.
1. **Add** the following properties to this node:

    * **Name** `sling:match`

        * **Type** `String`

        * **Value** `localhost.4503/`

    * **Name** `sling:internalRedirect`

        * **Type** `String[]`

        * **Value** `/content/`

1. Click **Save All**.

This will handle a request such as:
`localhost:4503/geometrixx/en/products.html`
as if:
`localhost:4503/content/geometrixx/en/products.html`
had been requested.

>[!NOTE]
>
>See [Resources](https://sling.apache.org/site/mappings-for-resource-resolution.html) in the Sling Documentation for further information about the sling properties available and how they can be configured.

>[!NOTE]
>
>You can use `/etc/map.publish` to hold the configurations for the publish environment. These must then be replicated, and the new location ( `/etc/map.publish`) configured for the **Mapping Location** of the [Apache Sling Resource Resolver](/help/sites-deploying/osgi-configuration-settings.md#apacheslingresourceresolver) of the publish environment.

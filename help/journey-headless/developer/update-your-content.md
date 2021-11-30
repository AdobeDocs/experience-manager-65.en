---
title: How to Update Your Content via AEM Assets APIs
description: In this part of the AEM Headless Developer Journey, learn how to use the REST API to access and update the content of your Content Fragments.
exl-id: 84120856-fd1d-40f7-8df4-73d4cdfcc43b
---
# How to Update Your Content via AEM Assets APIs {#update-your-content}

In this part of the [AEM Headless Developer Journey,](overview.md) learn how to use the REST API to access and update the content of your Content Fragments.

## The Story So Far {#story-so-far}

In the previous document of the AEM headless journey, [How to Access Your Content via AEM Delivery APIs](access-your-content.md) you learned how to access your headless content in AEM via the AEM GraphQL API and you should now:

* Have a high-level understanding of GraphQL.
* Understand how the AEM GraphQL API works.
* Understand some practical sample queries.

This article builds on those fundamentals so you understand how to update your existing headless content in AEM via the REST API.

## Objective {#objective}

* **Audience**: Advanced
* **Objective**: Learn how to use the REST API to access and update the content of your Content Fragments:
  * Introduce the AEM Assets HTTP API.
  * Introduce and discuss Content Fragment support in the API.
  * Illustrate details of the API.

<!--
  * Look at sample code to see how things work in practice.
-->

## Why do You Need the Assets HTTP API for Content Fragment {#why-http-api}

In the previous stage of the Headless Journey, you learned about using the AEM GraphQL API to retrieve your content using queries.

So why is another API needed?

The Assets HTTP API does allow you to **Read** your content, but it also allows you to **Create**, **Update** and **Delete** content - actions that are not possible with the GraphQL API.

The Assets REST API is available on each out-of-the-box install of a recent Adobe Experience Manager as a Cloud Service version.

## Assets HTTP API {#assets-http-api}

The Assets HTTP API encompasses the:

* Assets REST API
* including support for Content Fragments

The current implementation of the Assets HTTP API is based on the **REST** architectural style and enables you to access content (stored in AEM) via **CRUD** operations (Create, Read, Update, Delete).

With these operation the API allows you to operate Adobe Experience Manager as a Cloud Service as a headless CMS (Content Management System) by providing Content Services to a JavaScript front end application. Or any other application that can execute HTTP requests and handle JSON responses. For example, Single Page Applications (SPA), framework-based or custom, require content provided over an API, often in JSON format.

<!--
>[!NOTE]
>
>It is not possible to customize JSON output from the Assets REST API. 

The Assets REST API:

* follows the HATEOAS principle
* implements the SIREN format

## Key Concepts {#key-concepts}

The Assets REST API offers REST-style access to assets stored within an AEM instance. 

It uses the `/api/assets` endpoint and requires the path of the asset to access it (without the leading `/content/dam`). 

* This means that to access the asset at:
  * `/content/dam/path/to/asset`
* You need to request:
  * `/api/assets/path/to/asset` 

For example, to access `/content/dam/wknd/en/adventures/cycling-tuscany`, request `/api/assets/wknd/en/adventures/cycling-tuscany.json` 

>[!NOTE]
>Access over:
>
>* `/api/assets` **does not** need the use of the `.model` selector.
>* `/content/path/to/page` **does** require the use of the `.model` selector.

The HTTP method determines the operation to be executed:

* **GET** - to retrieve a JSON representation of an asset or a folder
* **POST** - to create new assets or folders
* **PUT** - to update the properties of an asset or folder
* **DELETE** - to delete an asset or folder

>[!NOTE]
>
>The request body and/or URL parameters can be used to configure some of these operations; for example, define that a folder or an asset should be created by a **POST** request.

The exact format of supported requests is defined in the API Reference documentation. 

### Transactional Behavior {#transactional-behavior}

All requests are atomic.

This means that subsequent (`write`) requests cannot be combined into a single transaction that could succeed or fail as a single entity.

### Security {#security}

If the Assets REST API is used within an environment without specific authentication requirements, AEM's CORS filter needs to be configured correctly.

>[!NOTE]
>
>For further information see:
>
>* CORS/AEM explained
>* Video - Developing for CORS with AEM

In environments with specific authentication requirements, OAuth is recommended.

## Available Features {#available-features}

Content Fragments are a specific type of Asset, see Working with Content Fragments.

For further information about features available through the API see:

* The Assets REST API (Additional Resources) 
* Entity Types, where the features specific to each supported type (as relevant to Content Fragments) are explained 

### Paging {#paging}

The Assets REST API supports paging (for GET requests) via the URL parameters:

* `offset` - the number of the first (child) entity to retrieve
* `limit` - the maximum number of entities returned

The response will contain paging information as part of the `properties` section of the SIREN output. This `srn:paging` property contains the total number of (child) entities ( `total`), the offset and the limit ( `offset`, `limit`) as specified in the request.

>[!NOTE]
>
>Paging is typically applied on container entities (i.e. folders or assets with renditions), as it relates to the children of the requested entity.

#### Example: Paging {#example-paging}

`GET /api/assets.json?offset=2&limit=3`

```json
...
"properties": {
    ...
    "srn:paging": {
        "total": 7,
        "offset": 2,
        "limit": 3
    }
    ...
}
...
```

## Entity Types {#entity-types}

### Folders {#folders}

Folders act as containers for assets and other folders. They reflect the structure of the AEM content repository.

The Assets REST API exposes access to the properties of a folder; for example its name, title, etc. Assets are exposed as child entities of folders, and sub-folders.

>[!NOTE]
>
>Depending on the asset type of the child assets and folders the list of child entities may already contain the full set of properties that defines the respective child entity. Alternatively, only a reduced set of properties may be exposed for an entity in this list of child entities.

### Assets {#assets}

If an asset is requested, the response will return its metadata; such as title, name and other information as defined by the respective asset schema.

The binary data of an asset is exposed as a SIREN link of type `content`.

Assets can have multiple renditions. These are typically exposed as child entities, one exception being a thumbnail rendition, which is exposed as a link of type `thumbnail` ( `rel="thumbnail"`).
-->

## Assets HTTP API and Content Fragments {#assets-http-api-content-fragments}

Content Fragments are used for headless delivery, and a Content Fragment is a special type of asset. They are used to access structured data, such as texts, numbers, dates, amongst others.

<!--
As there are several differences to *standard* assets (such as images or audio), some additional rules apply to handling them.

### Representation {#representation}

Content fragments:

* Do not expose any binary data.
* Are completely contained in the JSON output (within the `properties` property).

* Are also considered atomic, i.e. the elements and variations are exposed as part of the fragment's properties vs. as links or child entities. This allows for efficient access to the payload of a fragment.

### Content Models and Content Fragments {#content-models-and-content-fragments}

Currently the models that define the structure of a content fragment are not exposed through an HTTP API. Therefore the *consumer* needs to know about the model of a fragment (at least a minimum) - although most information can be inferred from the payload; as data types, etc. are part of the definition.

To create a new content fragment, the (internal repository) path of the model has to be provided.

### Associated Content {#associated-content}

Associated content is currently not exposed.
-->

## Using the Assets REST API {#using-aem-assets-rest-api}

### Access {#access}

The Assets REST API uses the `/api/assets` endpoint and requires the path of the asset to access it (without the leading `/content/dam`).

* This means that to access the asset at:
  * `/content/dam/path/to/asset`
* You need to request:
  * `/api/assets/path/to/asset`

For example, to access `/content/dam/wknd/en/adventures/cycling-tuscany`, request `/api/assets/wknd/en/adventures/cycling-tuscany.json`

>[!NOTE]
>Access over:
>
>* `/api/assets` **does not** need the use of the `.model` selector.
>* `/content/path/to/page` **does** require the use of the `.model` selector.

### Operation {#operation}

The HTTP method determines the operation to be executed:

* **GET** - to retrieve a JSON representation of an asset or a folder
* **POST** - to create new assets or folders
* **PUT** - to update the properties of an asset or folder
* **DELETE** - to delete an asset or folder

>[!NOTE]
>
>The request body and/or URL parameters can be used to configure some of these operations; for example, define that a folder or an asset should be created by a **POST** request.

The exact format of supported requests is defined in the API Reference documentation.

Usage can differ depending on whether you are using an AEM author or publish environment, together with your specific use case.

* It is strongly recommended that creation is bound to an author instance (and currently there is no means to replicate a fragment to publish using this API).
* Delivery is possible from both, as AEM serves requested content in JSON format only.

  * Storage and delivery from an AEM author instance should suffice for behind-the-firewall, media library applications.

  * For live web delivery, an AEM publish instance is recommended.

>[!CAUTION]
>
>The dispatcher configuration on AEM cloud instances might block access to `/api`.

>[!NOTE]
>
>For further details, see the API Reference. In particular, [Adobe Experience Manager Assets API - Content Fragments](https://www.adobe.io/experience-manager/reference-materials/cloud-service/javadoc/assets-api-content-fragments/index.html).

### Read/Delivery {#read-delivery}

Usage is via:

`GET /{cfParentPath}/{cfName}.json`

For example:

`http://<host>/api/assets/wknd/en/adventures/cycling-tuscany.json`

The response is serialized JSON with the content structured as in the content fragment. References are delivered as reference URLs.

Two types of read operations are possible:

* Reading a specific content fragment by path, this returns the JSON representation of the content fragment.
* Reading a folder of content fragments by path: this returns the JSON representations of all content fragments within the folder.

### Create {#create}

Usage is via:

`POST /{cfParentPath}/{cfName}`

The body has to contain a JSON representation of the content fragment to be created, including any initial content that should be set on the content fragment elements. It is mandatory to set the `cq:model` property and it must point to a valid content fragment model. Failing to do so will result in an error. It is also necessary to add a header `Content-Type` which is set to `application/json`.

### Update {#update}

Usage is via

`PUT /{cfParentPath}/{cfName}`

The body has to contain a JSON representation of what is to be updated for the given content fragment.

This can simply be the title or description of a content fragment, or a single element, or all element values and/or metadata.

### Delete {#delete}

Usage is via:

`DELETE /{cfParentPath}/{cfName}`

For further details of using the AEM Assets REST API, you can reference:

* Adobe Experience Manager Assets HTTP API (Additional Resources)
* Content Fragments Support in AEM Assets HTTP API (Additional Resources)
  
## What's Next {#whats-next}

Now that you have completed this part of the AEM Headless Developer Journey, you should:

* Understand the basics of the AEM Assets HTTP API.
* Understand how Content Fragments are supported in this API.

<!--
* Have experience with sample code and know how the API works in practice.
-->

<!-- The "How to put it all together" page isn't going to be published until the first public release of the Headless SDK. Temporarily commenting out the reference below. -->

<!--You should continue your AEM headless journey by next reviewing the document [How to Put It All Together - Your App and Your Content in AEM Headless](put-it-all-together.md) where you learn how to take your AEM Headless project and prepare it for going live.-->

You should continue your AEM headless journey by next reviewing the document [How to Go Live with Your Headless Application](go-live.md) where you actually take your AEM Headless project live!

## Additional Resources {#additional-resources}

* [Assets HTTP API](/help/assets/mac-api-assets.md)
* [Content Fragments REST API](/help/assets/content-fragments/assets-api-content-fragments.md)
  * [API Reference](/help/assets/content-fragments/assets-api-content-fragments.md#api-reference)
* [Adobe Experience Manager Assets API - Content Fragments](https://www.adobe.io/experience-manager/reference-materials/cloud-service/javadoc/assets-api-content-fragments/index.html)
* [Working with Content Fragments](/help/assets/content-fragments/content-fragments.md)
* [AEM Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/introduction.html)
* [CORS/AEM explained](https://helpx.adobe.com/experience-manager/kt/platform-repository/using/cors-security-article-understand.html)
* [Video - Developing for CORS with AEM](https://helpx.adobe.com/experience-manager/kt/platform-repository/using/cors-security-technical-video-develop.html)

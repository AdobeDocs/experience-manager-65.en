---
title: Adobe Experience Manager Content Fragments Support in Assets HTTP API
description: Learn about support for Content Fragments in the Assets HTTP API, an important piece of AEM's headless delivery feature.
feature: Content Fragments,Assets HTTP API
role: Developer
exl-id: 0f9efb47-a8d1-46d9-b3ff-a6c0741ca138
hide: yes
---
# Content Fragments Support in AEM Assets HTTP API {#content-fragments-support-in-aem-assets-http-api}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service  |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/assets/admin/assets-api-content-fragments.html?lang=en)                  |
| AEM 6.5     | This article         |


## Overview {#overview}

Learn about support for Content Fragments in the Assets HTTP API, an important piece of AEM's headless delivery feature.

>[!NOTE]
>
>The [Assets HTTP API](/help/assets/mac-api-assets.md) encompasses the:
>
>* Assets REST API
>* including support for Content Fragments
>
>The current implementation of the Assets HTTP API is based on the [REST](https://en.wikipedia.org/wiki/Representational_state_transfer) architectural style.

The [Assets REST API](/help/assets/mac-api-assets.md) allows developers for Adobe Experience Manager to access content (stored in AEM) directly over the HTTP API, via CRUD operations (Create, Read, Update, Delete).

The API allows you to operate Adobe Experience Manager as a headless CMS (Content Management System) by providing Content Services to a JavaScript front end application. Or any other application that can execute HTTP requests and handle JSON responses.

For example, Single Page Applications (SPA), framework-based or custom, require content provided over the HTTP API, often in JSON format.

While [AEM Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/introduction.html) provide a very comprehensive, flexible and customizable API that can serve required Read operations for this purpose, and whose JSON output can be customized, they do require AEM WCM (Web Content Management) know-how for implementation as they must be hosted in pages that are based on dedicated AEM templates. Not every SPA development organization has direct access to such knowledge.

This is when the Assets REST API can be used. It allows developers to access assets (for example, images and content fragments) directly, without the need to first embed them in a page, and deliver their content in serialized JSON format. 

>[!NOTE]
>
>It is not possible to customize JSON output from the Assets REST API. 

The Assets REST API also allows developers to modify content - by creating new, updating, or deleting existing assets, content fragments and folders.

The Assets REST API:

* follows the [HATEOAS principle](https://en.wikipedia.org/wiki/HATEOAS)

* implements the [SIREN format](https://github.com/kevinswiber/siren)

## Prerequisites {#prerequisites}

The Assets REST API is available on each out-of-the-box install of a recent AEM version.

## Key Concepts {#key-concepts}

The Assets REST API offers [REST](https://en.wikipedia.org/wiki/Representational_state_transfer)-style access to assets stored within an AEM instance. 

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

The exact format of supported requests is defined in the [API Reference](/help/assets/assets-api-content-fragments.md#api-reference) documentation. 

### Transactional Behavior {#transactional-behavior}

All requests are atomic.

This means that subsequent (`write`) requests cannot be combined into a single transaction that could succeed or fail as a single entity.

### AEM (Assets) REST API versus AEM Components {#aem-assets-rest-api-versus-aem-components}

<table>
 <thead>
  <tr>
   <td>Aspect</td>
   <td>Assets REST API<br/> </td>
   <td>AEM Component<br/> (components using Sling Models)</td>
  </tr>
 </thead>
 <tbody>
  <tr>
   <td>Supported use-case(s)</td>
   <td>General purpose.</td>
   <td><p>Optimized for consumption in a Single Page Application (SPA), or any other (content consuming) context.</p> <p>Can also contain layout information.</p> </td>
  </tr>
  <tr>
   <td>Supported operations</td>
   <td><p>Create, Read, Update, Delete.</p> <p>With additional operations depending on the entity type.</p> </td>
   <td>Read-only.</td>
  </tr>
  <tr>
   <td>Access</td>
   <td><p>Can be accessed directly.</p> <p>Uses the <code>/api/assets </code>endpoint, mapped to <code>/content/dam</code> (in the repository).</p> 
   <p>An example path would look like: <code>/api/assets/wknd/en/adventures/cycling-tuscany.json</code></p>
   </td>
    <td><p>Needs to be referenced through an AEM component on an AEM page.</p> <p>Uses the <code>.model</code> selector to create the JSON representation.</p> <p>An example path would look like:<br/> <code>/content/wknd/language-masters/en/adventures/cycling-tuscany.model.json</code></p> 
   </td>
  </tr>
  <tr>
   <td>Security</td>
   <td><p>Multiple options are possible.</p> <p>OAuth is proposed; can be configured separately from standard setup.</p> </td>
   <td>Uses AEM's standard setup.</td>
  </tr>
  <tr>
   <td>Architectural remarks</td>
   <td><p>Write access will typically address an author instance.</p> <p>Read may also be directed to a publish instance.</p> </td>
   <td>As this approach is read-only, it will typically be used for publish instances.</td>
  </tr>
  <tr>
   <td>Output</td>
   <td>JSON-based SIREN output: verbose, but powerful. Allows for navigating within the content.</td>
   <td>JSON-based proprietary output; configurable through Sling Models. Navigating the content structure is hard to implement (but not necessarily impossible).</td>
  </tr>
 </tbody>
</table>

### Security {#security}

If the Assets REST API is used within an environment without specific authentication requirements, AEM's CORS filter needs to be configured correctly.

>[!NOTE]
>
>For further information see:
>
>* [CORS/AEM explained](https://experienceleague.adobe.com/docs/experience-manager-learn/foundation/security/understand-cross-origin-resource-sharing.html)
>* [Video - Developing for CORS with AEM](https://experienceleague.adobe.com/docs/experience-manager-learn/foundation/security/develop-for-cross-origin-resource-sharing.html)
>

In environments with specific authentication requirements, OAuth is recommended.

## Available Features {#available-features}

Content Fragments are a specific type of Asset, see [Working with Content Fragments](/help/assets/content-fragments/content-fragments.md).

For further information about features available through the API see:

* The [Assets REST API](/help/assets/mac-api-assets.md)  
* [Entity Types](/help/assets/assets-api-content-fragments.md#entity-types), where the features specific to each supported type (as relevant to Content Fragments) are explained 

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

### Content Fragments {#content-fragments}

A [content fragment](/help/assets/content-fragments/content-fragments.md) is a special type of asset. They can be used to access structured data, such as texts, numbers, dates, amongst others.

As there are several differences to *standard* assets (such as images or audio), some additional rules apply to handling them.

#### Representation {#representation}

Content fragments:

* Do not expose any binary data.
* Are completely contained in the JSON output (within the `properties` property).

* Are also considered atomic, i.e. the elements and variations are exposed as part of the fragment's properties vs. as links or child entities. This allows for efficient access to the payload of a fragment.

#### Content Models and Content Fragments {#content-models-and-content-fragments}

Currently the models that define the structure of a content fragment are not exposed through an HTTP API. Therefore the *consumer* needs to know about the model of a fragment (at least a minimum) - although most information can be inferred from the payload; as data types, etc. are part of the definition.

To create a new content fragment, the (internal repository) path of the model has to be provided.

#### Associated Content {#associated-content}

Associated content is currently not exposed.

## Using {#using}

Usage can differ depending on whether you are using an AEM author or publish environment, together with your specific use case.

* It is strongly recommended that creation is bound to an author instance ([and currently there is no means to replicate a fragment to publish using this API](/help/assets/assets-api-content-fragments.md#limitations)).
* Delivery is possible from both, as AEM serves requested content in JSON format only.

  * Storage and delivery from an AEM author instance should suffice for behind-the-firewall, media library applications.

  * For live web delivery, an AEM publish instance is recommended.

>[!CAUTION]
>
>The dispatcher configuration on AEM instances might block access to `/api`.

>[!NOTE]
>
>For further details, see the [API Reference](/help/assets/assets-api-content-fragments.md#api-reference). In particular, [Adobe Experience Manager Assets API - Content Fragments](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/assets-api-content-fragments/index.html). 

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

## Limitations {#limitations}

There are a few limitations:

* **Content fragment models are currently not supported**: they cannot be read or created. To be able to create a new, or update an existing, content fragment, developers have to know the correct path to the content fragment model. Currently the only method to get an overview of these is through the administration UI.
* **References are ignored**. Currently there are no checks on whether an existing content fragment is referenced. Therefore, for example, deleting a content fragment might result in issues on a page that contains a reference to the deleted Content Fragment.
* **JSON data type** The REST API output of the *JSON data type* is currently *string based output*.

## Status Codes and Error Messages {#status-codes-and-error-messages}

The following status codes can be seen in the relevant circumstances:

* **200** (OK)
  Returned when:

  * requesting a content fragment via `GET`
  * successfully updating a content fragment via `PUT`

* **201** (Created)
  Returned when:

  * successfully creating a content fragment via `POST`

* **404** (Not found)
  Returned when:

  * the requested content fragment does not exist

* **500** (Internal server error)

  >[!NOTE]
  >
  >This error is returned:
  >
  >* when an error that cannot be identified with a specific code has happened
  >* when the given payload was not valid

  The following lists common scenarios when this error status is returned, together with the error message (monospace) generated:

  * Parent folder does not exist (when creating a content fragment via `POST`)
  * No content fragment model is supplied (cq:model is missing), cannot be read (due to an invalid path or a permission problem) or there is no valid fragment model:

    * `No content fragment model specified`
    * `Cannot create a resource of given model '/foo/bar/qux'`

  * The content fragment could not be created (potentially a permission problem):

    * `Could not create content fragment`

  * Title and or description could not be updated:

    * `Could not set value on content fragment`

  * Metadata could not be set:

    * `Could not set metadata on content fragment`

  * Content element could not be found or could not be updated

    * `Could not update content element`
    * `Could not update fragment data of element`

  The detailed error messages are usually returned in the following manner:

  ```xml
  {
    "class": "core/response",
    "properties": {
      "path": "/api/assets/foo/bar/qux",
      "location": "/api/assets/foo/bar/qux.json",
      "parentLocation": "/api/assets/foo/bar.json",
      "status.code": 500,
      "status.message": "...{error message}.."
    }
  }
  ```

## API Reference {#api-reference}

See here for detailed API references:

* [Adobe Experience Manager Assets API - Content Fragments](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/assets-api-content-fragments/index.html)
* [Assets HTTP API](/help/assets/mac-api-assets.md)

    * [Available Features](/help/assets/mac-api-assets.md#assets)

## Additional Resources {#additional-resources}

For further information see:

* [Assets HTTP API documentation](/help/assets/mac-api-assets.md)
* [AEM Gem session: OAuth](https://helpx.adobe.com/experience-manager/kt/eseminars/gems/aem-oauth-server-functionality-in-aem.html)

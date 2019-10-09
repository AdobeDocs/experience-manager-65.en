---
title: Assets HTTP API
seo-title: Assets HTTP API
description: Learn about the implementation, data model, and features of Assets HTTP API. Use Assets HTTP API to perform various tasks around assets.
seo-description: Learn about the implementation, data model, and features of Assets HTTP API. Use Assets HTTP API to perform various tasks around assets.
uuid: ab709c58-c9a6-48da-84da-866655c84658
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
discoiquuid: 68d49096-959b-4751-abf1-23bedbaed9a0
---

# Assets HTTP API {#assets-http-api}

## Overview {#overview}

The Assets HTTP API is a specific part of the general Marketing Cloud API. For general documentation, see Marketing Cloud API user documentation. The Assets HTTP API is available at `/api/assets`, and allows for create-read-update-delete (CRUD) operations on Assets, including binary, metadata, renditions, and comments.

To access the API:

1. Open the API service document at `http://[hostname]:[port]/api.json`.

1. Follow the Assets service link  leading to `http://[hostname]:[server]/api/assets.json`.

The API's response is a JSON for some mime types and a response code for all mime types. The JSON response is optional and may not be available, for example for PDF files. Rely on the response code for further analysis or actions.

## Data model {#data-model}

The Assets HTTP API exposes two major elements, folders and assets.

### Folders {#folders}

Folders are like directories in tradtional filesystems. They are containers for other folders or asserts. Folders have the following components:

**Entities**: The entities of a folder are its child elements, which can be folders and assets.

**Properties**:

```
name  -- Name of the folder. This is the same as the last segment in the URL path without the extension
title -- Optional title of the folder which can be displayed instead of its name
```

>[!NOTE]
>
>Some properties of folder or asset are mapped to a different prefix. The JCR prefix of `jcr:title`, `jcr:description`, and `jcr:language` are replaced with `dc` prefix. Hence in the returned JSON, `dc:title` and `dc:description` contain the values of `jcr:title` and `jcr:description`, respectively.

**Links**

Folders expose three links:

```xml
self      -- Link to itself
parent    -- Link to the parent folder
thumbnail -- (Optional) link to a folder thumbnail image
```

### Assets {#assets}

Assets are multi-part elements, that include:

* The properties and metadata of the asset.
* Multiple renditions such as the original rendition (which is the originally uploaded asset), a thumbnail and various other renditions. Additional renditions may be images of different sizes, different video encodings, or extracted pages from PDF or Adobe InDesign.
* Optional comments.

Folders have the following components:

**Entities**

The children of assets are its renditions.

**Properties**

**Links**

## Available features {#available-features}

The Assets HTTP API includes the following features:

* Retrieve a folder listing
* Create a folder
* Create an asset
* Update asset binary
* Update asset metadata
* Create an asset rendition
* Update an asset rendition
* Create an asset comment
* Copy a folder or asset
* Move a folder or asset
* Delete a folder, asset, or rendition

>[!NOTE]
>
>For the ease of readability the following examples omit the full cURL notation. In fact the notation does correlate with [Resty](https://github.com/micha/resty) which is a script wrapper for cURL.

**Prerequisites**

* Go to *https://&lt;Server&gt;:&lt;Port&gt;/system/console/configMgr*.
* Navigate to **[!UICONTROL Adobe Granite CSRF Filter]**.
* Make sure the property **[!UICONTROL Filter Methods]** incudes: POST, PUT, DELETE.

### Retrieve a Folder Listing {#retrieve-a-folder-listing}

Retrieves a Siren representation of an existing folder and of its child entities (subfolders or assets).

**Request**

```
GET /api/assets/myFolder.json
```

**Response codes**

```
200 - OK - success
404 - NOT FOUND - folder does not exist or is not accessible
500 - INTERNAL SERVER ERROR - if something else goes wrong
```

**Response**

The class of the entity returned is assets/folder.

Properties of contained entities are a subset of the full set of properties of each entity. In order to obtain a full representation of the entity, clients should retrieve the contents of the URL pointed to by the link with a `rel` of `self`.

### Create a Folder {#create-a-folder}

Creates a new `sling`: `OrderedFolder` at the given path. If a &ast; is given instead of a node name the servlet will use the parameter name as node name. Accepted as request data is either a Siren representation of the new folder or a set of name-value pairs, encoded as `application/www-form-urlencoded` or `multipart`/ `form`- `data`, useful for creating a folder directly from an HTML form. Additionally, properties of the folder can be specified as URL query parameters.

The operation will fail with a `500` response code if the parent node of the given path does not exist. If the folder already exists a `409` response code is returned.

**Parameters**

```
name - Folder name
```

**Request**

```
POST /api/assets/myFolder -H"Content-Type: application/json" -d '{"class":"assetFolder","properties":{"title":"My Folder"}}'
```

Or

```
POST /api/assets/* -F"name=myfolder" -F"title=My Folder"
```

**Response codes**

```
201 - CREATED - on successful creation
409 - CONFLICT - if folder already exist
412 - PRECONDITION FAILED - if root collection cannot be found or accessed
500 - INTERNAL SERVER ERROR - if something else goes wrong
```

### Create an Asset {#create-an-asset}

Creates a DAM asset at the given path with the given file. If a &ast; is given instead of a node name the servlet will use the parameter name or the file name as node name.

**Parameters**

```
name - Asset name
file - File reference
```

**Request**

```
POST /api/assets/myFolder/myAsset.png -H"Content-Type: image/png" --data-binary "@myPicture.png"
```

or

```
POST /api/assets/myFolder/* -F"name=myAsset.png" -F"file=@myPicture.png"
```

**Response codes**

```
201 - CREATED - if Asset has been created successfully
409 - CONFLICT - if Asset already exist
412 - PRECONDITION FAILED - if root collection cannot be found or accessed
500 - INTERNAL SERVER ERROR - if something else goes wrong
```

### Update Asset binary {#update-asset-binary}

Updates an Assets binary (rendition with name original). This will trigger the default Asset workflow if configured.

**Request**

```
PUT /api/assets/myfolder/myAsset.png -H"Content-Type: image/png" --data-binary @myPicture.png
```

**Response codes**

```
200 - OK - if Asset has been updated successfully
404 - NOT FOUND - if Asset could not be found or accessed at the provided URI
412 - PRECONDITION FAILED - if root collection cannot be found or accessed
500 - INTERNAL SERVER ERROR - if something else goes wrong
```

### Update Asset metadata {#update-asset-metadata}

Updates the asset metadata properties.

**Request**

```
PUT /api/assets/myfolder/myAsset.png -H"Content-Type: application/json" -d '{"class":"asset", "properties":{"dc:title":"My Asset"}}'
```

**Response codes**

```
200 - OK - if Asset has been updated successfully
404 - NOT FOUND - if Asset could not be found or accessed at the provided URI
412 - PRECONDITION FAILED - if root collection cannot be found or accessed
500 - INTERNAL SERVER ERROR - if something else goes wrong
```

### Create an Asset Rendition {#create-an-asset-rendition}

Creates a new asset rendition for an asset. If request parameter name is not provided the file name is used as rendition name.

**Parameters**

```
name - Rendition name
file - File reference
```

**Request**

```
POST /api/assets/myfolder/myasset.png/renditions/web-rendition -H"Content-Type: image/png" --data-binary "@myRendition.png"
```

or

```
POST /api/assets/myfolder/myasset.png/renditions/* -F"name=web-rendition" -F"file=@myRendition.png"
```

**Response codes**

```
201 - CREATED - if Rendition has been created successfully
404 - NOT FOUND - if Asset could not be found or accessed at the provided URI
412 - PRECONDITION FAILED - if root collection cannot be found or accessed
500 - INTERNAL SERVER ERROR - if something else goes wrong
```

### Update an Asset Rendition {#update-an-asset-rendition}

Updates respectively replaces an asset rendition with the new binary data.

**Request**

```
PUT /api/assets/myfolder/myasset.png/renditions/myRendition.png -H"Content-Type: image/png" --data-binary @myRendition.png
```

**Response codes**

```
200 - OK - if Rendition has been updated successfully
404 - NOT FOUND - if Asset could not be found or accessed at the provided URI
412 - PRECONDITION FAILED - if root collection cannot be found or accessed
500 - INTERNAL SERVER ERROR - if something else goes wrong
```

### Create an Asset Comment {#create-an-asset-comment}

Creates a new asset comment.

**Parameters**

```
message - Message
annotationData - Annotation data (JSON)
```

**Request**

```
POST /api/assets/myfolder/myasset.png/comments/* -F"message=Hello World." -F"annotationData={}"
```

**Response codes**

```
201 - CREATED - if Comment has been created successfully
404 - NOT FOUND - if Asset could not be found or accessed at the provided URI
412 - PRECONDITION FAILED - if root collection cannot be found or accessed
500 - INTERNAL SERVER ERROR - if something else goes wrong
```

### Copy a Folder or Asset {#copy-a-folder-or-asset}

Copies a folder or asset at the given path to a new destination.

**Request Headers**

```
X-Destination - a new destination URI within the API solution scope to copy the resource to
X-Depth - either 'infinity' or '0'. The value '0' only copies the resource and its properties, no children.
X-Overwrite - 'F' to prevent overwriting an existing destination
```

**Request**

```
COPY /api/assets/myFolder -H"X-Destination: /api/assets/myFolder-copy"
```

**Response codes**

```
201 - CREATED - if folder/asset has been copied to a non-existing destination
204 - NO CONTENT - if the folder/asset has been copied to an existing destination
412 - PRECONDITION FAILED - if a request header is missing or
500 - INTERNAL SERVER ERROR - if something else goes wrong
```

### Move a Folder or Asset {#move-a-folder-or-asset}

Moves a folder or asset at the given path to a new destination.

**Request Headers**

```
X-Destination - a new destination URI within the API solution scope to copy the resource to
X-Depth - either 'infinity' or '0'. The value '0' only copies the resource and its properties, no children.
X-Overwrite - either 'T' to force deletion of existing resources or 'F' to prevent overwriting an existing resource.
```

**Request**

```
MOVE /api/assets/myFolder -H"X-Destination: /api/assets/myFolder-moved"
```

**Response codes**

```
201 - CREATED - if folder/asset has been copied to a non-existing destination
204 - NO CONTENT - if the folder/asset has been copied to an existing destination
412 - PRECONDITION FAILED - if a request header is missing or
500 - INTERNAL SERVER ERROR - if something else goes wrong
```

### Delete a Folder, Asset, or Rendition {#delete-a-folder-asset-or-rendition}

Deletes a resource (-tree) at the given path.

**Request**

```
DELETE /api/assets/myFolder
```

or

```
DELETE /api/assets/myFolder/myAsset.png
```

or

```xml
DELETE /api/assets/myFolder/myAsset.png/renditions/original
```

**Response codes**

```
200 - OK - if folder has been deleted successfully
412 - PRECONDITION FAILED - if root collection cannot be found or accessed
500 - INTERNAL SERVER ERROR - if something else goes wrong
```


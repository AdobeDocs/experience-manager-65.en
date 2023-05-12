---
title: "[!DNL Assets] HTTP API."
description: Create, read, update, delete, manage digital assets using HTTP API in [!DNL Adobe Experience Manager Assets].
contentOwner: AG
role: Developer
feature: APIs,Assets HTTP API,Developer Tools
exl-id: 6bc10f4e-a951-49ba-9c71-f568a7f2e40d
hide: yes
---
# [!DNL Assets] HTTP API {#assets-http-api}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service  |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/assets/admin/mac-api-assets.html?lang=en)                  |
| AEM 6.5     | This article         |

## Overview {#overview}

The [!DNL Assets] HTTP API allows for create-read-update-delete (CRUD) operations on digital assets, including on metadata, on renditions, and on comments, together with structured content using [!DNL Experience Manager] Content Fragments. It is exposed at `/api/assets` and is implemented as REST API. It includes [support for Content Fragments](/help/assets/assets-api-content-fragments.md).

To access the API:

1. Open the API service document at `https://[hostname]:[port]/api.json`.
1. Follow the [!DNL Assets] service link leading to `https://[hostname]:[server]/api/assets.json`.

The API response is a JSON file for some MIME types and a response code for all MIME types. The JSON response is optional and may not be available, for example for PDF files. Rely on the response code for further analysis or actions.

After the [!UICONTROL Off Time], an asset and its renditions are not available via the [!DNL Assets] web interface and through the HTTP API. The API returns 404 error message if the [!UICONTROL On Time] is in the future or [!UICONTROL Off Time] is in the past.

>[!CAUTION]
>
>[HTTP API updates the metadata properties](#update-asset-metadata) in the `jcr` namespace. However, the Experience Manager user interface updates the metadata properties in the `dc` namespace.

## Content Fragments {#content-fragments}

A [content fragment](/help/assets/content-fragments/content-fragments.md) is a special type of asset. It can be used to access structured data, such as texts, numbers, dates, amongst others. As there are several differences to `standard` assets (such as images or documents), some additional rules apply to handling content fragments.

For further information see [Content Fragments Support in the Experience Manager Assets HTTP API](/help/assets/assets-api-content-fragments.md).

## Data model {#data-model}

The [!DNL Assets] HTTP API exposes two major elements, folders and assets (for standard assets).

Additionally, it exposes more detailed elements for the custom data models that describe structured content in Content Fragments. See [Content Fragment Data Models](/help/assets/assets-api-content-fragments.md#content-fragments) for further information.

### Folders {#folders}

Folders are like directories in traditional file systems. They are containers for other folders or asserts. Folders have the following components:

**Entities**: The entities of a folder are its child elements, which can be folders and assets.

**Properties**:

* `name` is the name of the folder. This is the same as the last segment in the URL path without the extension.
* `title` is an optional title of the folder which can be displayed instead of its name.

>[!NOTE]
>
>Some properties of folder or asset are mapped to a different prefix. The `jcr` prefix of `jcr:title`, `jcr:description`, and `jcr:language` are replaced with `dc` prefix. Hence in the returned JSON, `dc:title` and `dc:description` contain the values of `jcr:title` and `jcr:description`, respectively.

**Links** Folders expose three links:

* `self`: Link to itself.
* `parent`: Link to the parent folder.
* `thumbnail`: (Optional) link to a folder thumbnail image.

### Assets {#assets}

In Experience Manager an asset contains the following elements:

* The properties and metadata of the asset.
* Multiple renditions such as the original rendition (which is the originally uploaded asset), a thumbnail and various other renditions. Additional renditions may be images of different sizes, different video encodings, or extracted pages from PDF or [!DNL Adobe InDesign] files.
* Optional comments.

For information about elements in Content Fragments see [Content Fragments Support in Experience Manager Assets HTTP API](/help/assets/assets-api-content-fragments.md#content-fragments).

In [!DNL Experience Manager] a folder has the following components:

* Entities: The children of assets are its renditions.
* Properties.
* Links.

The [!DNL Assets] HTTP API includes the following features:

* [Retrieve a folder listing](#retrieve-a-folder-listing).
* [Create a folder](#create-a-folder).
* [Create an asset](#create-an-asset).
* [Update asset binary](#update-asset-binary).
* [Update asset metadata](#update-asset-metadata).
* [Create an asset rendition](#create-an-asset-rendition).
* [Update an asset rendition](#update-an-asset-rendition).
* [Create an asset comment](#create-an-asset-comment).
* [Copy a folder or asset](#copy-a-folder-or-asset).
* [Move a folder or asset](#move-a-folder-or-asset).
* [Delete a folder, asset, or rendition](#delete-a-folder-asset-or-rendition).

>[!NOTE]
>
>For the ease of readability the following examples omit the full cURL notation. In fact the notation does correlate with [Resty](https://github.com/micha/resty) which is a script wrapper for `cURL`.

**Prerequisites**

* Access `https://[aem_server]:[port]/system/console/configMgr`.
* Navigate to **[!UICONTROL Adobe Granite CSRF Filter]**.
* Make sure the property **[!UICONTROL Filter Methods]** includes: `POST`, `PUT`, `DELETE`.

## Retrieve a folder listing {#retrieve-a-folder-listing}

Retrieves a Siren representation of an existing folder and of its child entities (subfolders or assets).

**Request**: `GET /api/assets/myFolder.json`

**Response codes**: The response codes are:

* 200 - OK - success.
* 404 - NOT FOUND - folder does not exist or is not accessible.
* 500 - INTERNAL SERVER ERROR - if something else goes wrong.

**Response**: The class of the entity returned is an asset or a folder. The properties of contained entities are a subset of the full set of properties of each entity. In order to obtain a full representation of the entity, clients should retrieve the contents of the URL pointed to by the link with a `rel` of `self`.

## Create a folder {#create-a-folder}

Creates a new `sling`: `OrderedFolder` at the given path. If a `*` is provided instead of a node name, the servlet uses the parameter name as node name. Accepted as request data is either a Siren representation of the new folder or a set of name-value pairs, encoded as `application/www-form-urlencoded` or `multipart`/ `form`- `data`, useful for creating a folder directly from an HTML form. Additionally, properties of the folder can be specified as URL query parameters.

An API call fails with a `500` response code if the parent node of the provided path does not exist. A call returns a response code `409` if the folder already exists.

**Parameters**: `name` is the folder name.

**Request**

* `POST /api/assets/myFolder -H"Content-Type: application/json" -d '{"class":"assetFolder","properties":{"jcr:title":"My Folder"}}'`
* `POST /api/assets/* -F"name=myfolder" -F"jcr:title=My Folder"`

**Response codes**: The response codes are:

* 201 - CREATED - on successful creation.
* 409 - CONFLICT - if folder already exist.
* 412 - PRECONDITION FAILED - if root collection cannot be found or accessed.
* 500 - INTERNAL SERVER ERROR - if something else goes wrong.

## Create an asset {#create-an-asset}

Place the provided file at the provided path to create an asset in the DAM repository. If a `*` is provided instead of a node name, the servlet uses the parameter name or the file name as node name.

**Parameters**: The parameters are `name` for the asset name and `file` for the file reference.

**Request**

* `POST /api/assets/myFolder/myAsset.png -H"Content-Type: image/png" --data-binary "@myPicture.png"`
* `POST /api/assets/myFolder/* -F"name=myAsset.png" -F"file=@myPicture.png"`

**Response codes**: The response codes are:

* 201 - CREATED - if Asset has been created successfully.
* 409 - CONFLICT - if Asset already exist.
* 412 - PRECONDITION FAILED - if root collection cannot be found or accessed.
* 500 - INTERNAL SERVER ERROR - if something else goes wrong.

## Update an asset binary {#update-asset-binary}

Updates an asset's binary (rendition with name original). An update triggers the default asset processing workflow to execute, if it is configured.

**Request**: `PUT /api/assets/myfolder/myAsset.png -H"Content-Type: image/png" --data-binary @myPicture.png`

**Response codes**: The response codes are:

* 200 - OK - if Asset has been updated successfully.
* 404 - NOT FOUND - if Asset could not be found or accessed at the provided URI.
* 412 - PRECONDITION FAILED - if root collection cannot be found or accessed.
* 500 - INTERNAL SERVER ERROR - if something else goes wrong.

## Update asset metadata {#update-asset-metadata}

Updates the asset metadata properties. If you update any property in the `dc:` namespace, the API updates the same property in the `jcr` namespace. The API does not sync the properties under the two namespaces.

**Request**: `PUT /api/assets/myfolder/myAsset.png -H"Content-Type: application/json" -d '{"class":"asset", "properties":{"jcr:title":"My Asset"}}'`

**Response codes**: The response codes are:

* 200 - OK - if Asset has been updated successfully.
* 404 - NOT FOUND - if Asset could not be found or accessed at the provided URI.
* 412 - PRECONDITION FAILED - if root collection cannot be found or accessed.
* 500 - INTERNAL SERVER ERROR - if something else goes wrong.

### Sync metadata update between `dc` and `jcr` namespace {#sync-metadata-between-namespaces}

The API method updates the metadata properties in the `jcr` namespace. The updates made using the user interface change the metadata properties in the `dc` namespace. To sync the metadata values between `dc` and `jcr` namespace, you can create a workflow and configure Experience Manager to execute the workflow upon asset edit. Use an ECMA script to sync the required metadata properties. The following sample script synchronizes the title string between `dc:title` and `jcr:title`.

```javascript
var workflowData = workItem.getWorkflowData();
if (workflowData.getPayloadType() == "JCR_PATH")
{
 var path = workflowData.getPayload().toString();
 var node = workflowSession.getSession().getItem(path);
 var metadataNode = node.getNode("jcr:content/metadata");
 var jcrcontentNode = node.getNode("jcr:content");
if (jcrcontentNode.hasProperty("jcr:title"))
{
 var jcrTitle = jcrcontentNode.getProperty("jcr:title");
 metadataNode.setProperty("dc:title", jcrTitle.toString());
 metadataNode.save();
}
}
```

## Create an asset rendition {#create-an-asset-rendition}

Create a new asset rendition for an asset. If request parameter name is not provided, the file name is used as rendition name.

**Parameters**: The parameters are `name` for name of the rendition and `file` as a file reference.

**Request**

* `POST /api/assets/myfolder/myasset.png/renditions/web-rendition -H"Content-Type: image/png" --data-binary "@myRendition.png"`
* `POST /api/assets/myfolder/myasset.png/renditions/* -F"name=web-rendition" -F"file=@myRendition.png"`

**Response codes**: The response codes are:

* 201 - CREATED - if Rendition has been created successfully.
* 404 - NOT FOUND - if Asset could not be found or accessed at the provided URI.
* 412 - PRECONDITION FAILED - if root collection cannot be found or accessed.
* 500 - INTERNAL SERVER ERROR - if something else goes wrong.

## Update an asset rendition {#update-an-asset-rendition}

Updates respectively replaces an asset rendition with the new binary data.

**Request**: `PUT /api/assets/myfolder/myasset.png/renditions/myRendition.png -H"Content-Type: image/png" --data-binary @myRendition.png`

**Response codes**: The response codes are:

* 200 - OK - if Rendition has been updated successfully.
* 404 - NOT FOUND - if Asset could not be found or accessed at the provided URI.
* 412 - PRECONDITION FAILED - if root collection cannot be found or accessed.
* 500 - INTERNAL SERVER ERROR - if something else goes wrong.

## Add a comment on an asset {#create-an-asset-comment}

Creates a new asset comment.

**Parameters**: The parameters are `message` for the message body of the comment and `annotationData` for the Annotation data in JSON format.

**Request**: `POST /api/assets/myfolder/myasset.png/comments/* -F"message=Hello World." -F"annotationData={}"`

**Response codes**: The response codes are:

* 201 - CREATED - if Comment has been created successfully.
* 404 - NOT FOUND - if Asset could not be found or accessed at the provided URI.
* 412 - PRECONDITION FAILED - if root collection cannot be found or accessed.
* 500 - INTERNAL SERVER ERROR - if something else goes wrong.

## Copy a folder or an asset {#copy-a-folder-or-asset}

Copies a folder or asset available at the provided path to a new destination.

**Request Headers**: The parameters are:

* `X-Destination` - a new destination URI within the API solution scope to copy the resource to.
* `X-Depth` - either `infinity` or `0`. Using `0` only copies the resource and its properties and not its children.
* `X-Overwrite` - Use `F` to prevent overwriting an asset at the existing destination.

**Request**: `COPY /api/assets/myFolder -H"X-Destination: /api/assets/myFolder-copy"`

**Response codes**: The response codes are:

* 201 - CREATED - if folder/asset has been copied to a non-existing destination.
* 204 - NO CONTENT - if the folder/asset has been copied to an existing destination.
* 412 - PRECONDITION FAILED - if a request header is missing.
* 500 - INTERNAL SERVER ERROR - if something else goes wrong.

## Move a folder or an asset {#move-a-folder-or-asset}

Moves a folder or asset at the given path to a new destination.

**Request Headers**: The parameters are:

* `X-Destination` - a new destination URI within the API solution scope to copy the resource to.
* `X-Depth` - either `infinity` or `0`. Using `0` only copies the resource and its properties and not its children.
* `X-Overwrite` - Use either `T` to force delete an existing resources or `F` to prevent overwriting an existing resource.

**Request**: `MOVE /api/assets/myFolder -H"X-Destination: /api/assets/myFolder-moved"`

Do not use `/content/dam` in the URL. A sample command to move assets and overwriting existing ones is:

```shell
curl -u admin:admin -X MOVE https://[aem_server]:[port]/api/assets/source/file.png -H "X-Destination: https://[aem_server]:[port]/api/assets/destination/file.png" -H "X-Overwrite: T"
```

**Response codes**: The response codes are:

* 201 - CREATED - if folder/asset has been copied to a non-existing destination.
* 204 - NO CONTENT - if the folder/asset has been copied to an existing destination.
* 412 - PRECONDITION FAILED - if a request header is missing.
* 500 - INTERNAL SERVER ERROR - if something else goes wrong.

## Delete a folder, an asset, or a rendition {#delete-a-folder-asset-or-rendition}

Deletes a resource (-tree) at the provided path.

**Request**

* `DELETE /api/assets/myFolder`
* `DELETE /api/assets/myFolder/myAsset.png`
* `DELETE /api/assets/myFolder/myAsset.png/renditions/original`

**Response codes**: The response codes are:

* 200 - OK - if folder has been deleted successfully.
* 412 - PRECONDITION FAILED - if root collection cannot be found or accessed.
* 500 - INTERNAL SERVER ERROR - if something else goes wrong.

## Tips and limitations {#tips-best-practices-limitations}

* [HTTP API updates the metadata properties](#update-asset-metadata) in the `jcr` namespace. However, the Experience Manager user interface updates the metadata properties in the `dc` namespace.

* Assets HTTP API does not return the complete metadata. The namespaces are hardcoded and only those namespaces are returned. For complete metadata, see the asset path `/jcr_content/metadata.json`.

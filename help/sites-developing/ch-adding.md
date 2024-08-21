---
title: Adding ContextHub to Pages and Accessing Stores
description: Add ContextHub to your pages to enable the ContextHub features and to link to the ContextHub JavaScript libraries
exl-id: ae745af9-b49f-46b9-ab48-2fd256e9a681
solution: Experience Manager, Experience Manager Sites
feature: Developing,Personalization
role: Developer
---
# Adding ContextHub to Pages and Accessing Stores {#adding-contexthub-to-pages-and-accessing-stores}

Add ContextHub to your pages to enable the ContextHub features and to link to the ContextHub JavaScript libraries.

The ContextHub JavaScript API provides access to the context data that ContextHub manages. This page briefly describes the main features of the API for accessing and manipulating context data. Follow links to the API reference documentation to see detailed information and code examples.

## Adding ContextHub to a Page Component {#adding-contexthub-to-a-page-component}

To enable the ContextHub features and to link to the ContextHub JavaScript libraries, include the `contexthub` component in the `head` section of your page. The HTL code for your page component should resemble the following example:

```xml
<sly data-sly-resource="${'contexthub' @ resourceType='granite/contexthub/components/contexthub'}"/>
```

Note that you also need to configure whether the ContextHub toolbar appears in Preview mode. See [Showing and Hiding the ContextHub UI](ch-configuring.md#showing-and-hiding-the-contexthub-ui).

## About ContextHub Stores {#about-contexthub-stores}

Use ContextHub stores to persist context data. ContextHub provides the following types of stores that form the basis of all store types:

* [PersistedStore](contexthub-api.md#contexthub-store-persistedstore)
* [SessionStore](contexthub-api.md#contexthub-store-sessionstore)
* [JSONPStore](contexthub-api.md#contexthub-store-persistedjsonpstore)
* [PersistedJSONPStore](contexthub-api.md#contexthub-store-persistedstore)

All store types are extensions of the [`ContextHub.Store.Core`](contexthub-api.md#contexthub-store-core) class. For information about creating a store type, see [Creating Custom Stores](ch-extend.md#creating-custom-store-candidates). For information about sample store types, see [Sample ContextHub Store Candidates](ch-samplestores.md).

### Persistence Modes {#persistence-modes}

Context Hub stores use one of the following persistence modes:

* **Local:** Uses HTML5 localStorage to persist data. Local storage is persisted on the browser across sessions.
* **Session:** Uses HTML5 sessionStorage to persist data. Session storage is persisted for the duration of the browser session and is available to all browser windows.
* **Cookie:** Uses the browser's native support of cookies for data storage. Cookie data is sent to and from the server in HTTP requests.
* **Window.name:** Uses the window.name property to persist data.
* **Memory:** Uses a JavaScript object to persist data.

By default, Context Hub uses the Local persistence mode. If the browser does not support or allow HTML5 localStorage, Session persistence is used. If the browser does not support or allow HTML5 sessionStorage, Window.name persistence is used.

### Store Data {#store-data}

Internally, store data forms a tree structure, enabling values to be added as primary types or complex objects. When you add complex objects to stores, the object properties form branches in the data tree. For example, the following complex object is added to an empty store named location:

```javascript
Object {
   number: 321,
   data: {
      city: "Basel",
      country: "Switzerland",
      details: {
         population: 173330,
         elevation: 260
      }
   }
}
```

The tree structure of the store data can be conceptualized as follows:

```text
/
|- number
|- data
      |- city
      |- country
      |- details
            |- population
            |- elevation
```

The tree structure defines data items in the store as key/value pairs. In the above example, the key `/number` corresponds with the value `321`, and the key `/data/country` corresponds with the value `Switzerland`.

### Manipulating Objects {#manipulating-objects}

ContextHub provides the [`ContextHub.Utils.JSON.tree`](contexthub-api.md#contexthub-utils-json-tree) class for manipulating JavaScript objects. Use the functions of this class for manipulating JavaScript objects before you add them to a store, or after you obtain them from a store.

Additionally, the [`ContextHub.Utils.JSON`](contexthub-api.md#contexthub-utils-json) class provides functions for serializing objects to stings, and deserializing strings to objects. Use this class for handling JSON data to support browsers that do not natively include the `JSON.parse` and `JSON.stringify` functions.

## Interacting with ContextHub Stores {#interacting-with-contexthub-stores}

Use the [`ContextHub`](contexthub-api.md#ui-event-constants) JavaScript object to obtain a store as a JavaScript object. Once you obtain the store object you can manipulate the data that it contains. Use the [`getAllStores`](contexthub-api.md#getallstores) or the [`getStore`](contexthub-api.md#getstore-name) function to obtain the store.

### Accessing Store Data {#accessing-store-data}

The [`ContexHub.Store.Core`](contexthub-api.md#contexthub-store-core) JavaScript class defines several functions for interacting with store data. The following functions store and retrieve multiple data items that are contained in objects:

* [addAllItems](contexthub-api.md#addallitems-tree-options)
* [getTree](contexthub-api.md#gettree-includeinternals)

Individual data items are stored as a set of key/value pairs. To store and retrieve values you specify the corresponding key:

* [getItem](contexthub-api.md#getitem-key)
* [setItem](contexthub-api.md#setitem-key-value-options)

Note that custom store candidates can define additional functions that provide access to store data.

>[!NOTE]
>
>ContextHub is not by default aware of the currently logged in used on publish servers and such users are regarded by ContextHub as "Anonymous."
>
>You can make ContextHub aware of logged in users by loading the profile store. Refer to [sample code on GitHub](https://github.com/Adobe-Marketing-Cloud/aem-sample-we-retail/blob/master/ui.apps/src/main/content/jcr_root/apps/weretail/components/structure/header/clientlib/js/utilities.js).

### ContextHub Eventing {#contexthub-eventing}

ContextHub includes an event framework that enables you to automatically react to store events. Each store object contains a [`ContextHub.Utils.Eventing`](contexthub-api.md#contexthub-utils-eventing) object that is available as the store's [`eventing`](contexthub-api.md#eventing) property. Use the [`on`](contexthub-api.md#on-name-handler-selector-triggerforpastevents) or [`once`](contexthub-api.md#once-name-handler-selector-triggerforpastevents) function to bind a JavaScript function to a store event.

## Using Context Hub to Manipulate Cookies {#using-context-hub-to-manipulate-cookies}

The Context Hub JavaScript API provides cross-browser support for handling browser cookies. The [`ContextHub.Utils.Cookie`](contexthub-api.md#contexthub-utils-cookie) namespace defines several functions for creating, manipulating, and deleting cookies.

## Determining Resolved ContextHub Segments {#determining-resolved-contexthub-segments}

The ContextHub segment engine enables you to determine which of the registered segments are resolved in the current context. Use the getResolvedSegments function of the [`ContextHub.SegmentEngine.SegmentManager`](contexthub-api.md#contexthub-segmentengine-segmentmanager) class to retrieve resolved segments. Then, use the `getName` or `getPath` function of the [`ContextHub.SegmentEngine.Segment`](contexthub-api.md#contexthub-segmentengine-segment) class to test for a segment.

### ContextHub Segments {#contexthub-segments}

ContextHub segments are installed below the `/conf/<site>/settings/wcm/segments` node.

The following segments are installed with the [WKND tutorial site.](getting-started.md)

* summer  
* winter  

The rules that are used to resolve these segments are summarized as follows:

* First the [geolocation](ch-samplestores.md#contexthub-geolocation-sample-store-candidate) store is used to determine latitude of the user.
* Then the month data item of the [surferinfo store](ch-samplestores.md#contexthub-surferinfo-sample-store-candidate) determines what season it is in that latitude.

>[!WARNING]
>
>The installed segments are provided as reference configurations to help you build your own dedicated configuration for your project. Do not use them directly.

## Debugging ContextHub {#debugging-contexthub}

There are several options for debugging ContextHub including generating logs. See [Configuring ContextHub for more information.](ch-configuring.md#logging-debug-messages-for-contexthub)

## See an Overview of the ContextHub Framework {#see-an-overview-of-the-contexthub-framework}

ContextHub provides a [diagnostics page](ch-diagnostics.md) where you can see an overview of the ContextHub framework.

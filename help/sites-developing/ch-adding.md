---
title: Adding ContextHub to Pages and Accessing Stores
seo-title: Adding ContextHub to Pages and Accessing Stores
description: Add ContextHub to your pages to enable the ContextHub features and to link to the ContextHub Javascript libraries
seo-description: Add ContextHub to your pages to enable the ContextHub features and to link to the ContextHub Javascript libraries
uuid: ade37960-21c4-4d64-a525-68f0d199f955
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: personalization
content-type: reference
discoiquuid: ac8f44df-39fb-44ea-ae17-ead0dbd1f6c0
---

# Adding ContextHub to Pages and Accessing Stores{#adding-contexthub-to-pages-and-accessing-stores}

Add ContextHub to your pages to enable the ContextHub features and to link to the ContextHub Javascript libraries

The ContextHub Javascript API provides access to the context data that ContextHub manages. This page briefly describes the main features of the API for acessing and manipulating context data. Follow links to the API reference documentation to see detailed information and code examples.

## Adding ContextHub to a Page Component {#adding-contexthub-to-a-page-component}

To enable the ContextHub features and to link to the ContextHub Javascript libraries, include the contexthub component in the `head` section of your page. The JSP code for your page component resembles the following example:

```xml
<head>
   <sling:include path="contexthub" resourceType="granite/contexthub/components/contexthub" />
</head>
```

Note that you also need to configure whether the ContextHub toolbar appears in Preview mode. See [Showing and Hiding the ContextHub UI](/help/sites-administering/contexthub-config.md#showing-and-hiding-the-contexthub-ui).

## About ContextHub Stores {#about-contexthub-stores}

Use ContextHub stores to persist context data. ContextHub provides the following types of stores that form the basis of all store types:

* [PersistedStore](/help/sites-developing/contexthub-api.md#contexthub-store-persistedstore)
* [SessionStore](/help/sites-developing/contexthub-api.md#contexthub-store-sessionstore)
* [JSONPStore](/help/sites-developing/contexthub-api.md#contexthub-store-persistedjsonpstore)
* [PersistedJSONPStore](/help/sites-developing/contexthub-api.md#contexthub-store-persistedstore)

All store types are extensions of the [ `ContextHub.Store.Core`](/help/sites-developing/contexthub-api.md#contexthub-store-core) class. For information about creating a new store type, see [Creating Custom Stores](/help/sites-developing/ch-extend.md#creating-custom-store-candidates). For information about sample store types, see [Sample ContextHub Store Candidates](/help/sites-developing/ch-samplestores.md).

### Persistence Modes {#persistence-modes}

Context Hub stores use one of the following persistence modes:

* **Local:** Uses HTML5 localStorage to persist data. Local storage is persisted on the browser across sessions.
* **Session:** Uses HTML5 sessionStorage to persist data. Session storage is persisted for the duration of the browser session and is available to all browser windows.
* **Cookie:** Uses the browser's native support of cookies for data storage. Cookie data is sent to and from the server in HTTP requests.
* **Window.name:** Uses the window.name property to persist data. 
* **Memory:** Uses a Javascript object to persist data.

By default, Context Hub uses the Local persistence mode. If the browser does not support or allow HTML5 localStorage, Session persistence is used. If the browser does not support or allow HTML5 sessionStorage, Window.name persistence is used.

### Store Data {#store-data}

Internally, store data forms a tree structure, enabling values to be added as primary types or complex objects. When you add complex objects to stores, the object properties form branches in the data tree. For example, the following complex object is added to an empty store named location:

```xml
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

```xml
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

ContextHub provides the [ `ContextHub.Utils.JSON.tree`](/help/sites-developing/contexthub-api.md#contexthub-utils-json-tree) class for manipulating Javascript objects. Use the functions of this class for manipulating Javascript objects before you add them to a store, or after you obtain them from a store.

Additionally, the [ `ContextHub.Utils.JSON`](/help/sites-developing/contexthub-api.md#contexthub-utils-json) class provides functions for serializing objects to stings, and deserializing strings to objects. Use this class for handling JSON data to support browsers that do not natively include the `JSON.parse` and `JSON.stringify` functions.

## Interacting with ContextHub Stores {#interacting-with-contexthub-stores}

Use the [ `ContextHub`](/help/sites-developing/contexthub-api.md#ui-event-constants) Javascript object to obtain a store as a Javascript object. Once you obtain the store object you can manipulate the data that it contains. Use the [ `getAllStores`](/help/sites-developing/contexthub-api.md#getallstores) or the [ `getStore`](/help/sites-developing/contexthub-api.md#getstore-name) function to obtain the store.

### Accessing Store Data {#accessing-store-data}

The [ `ContexHub.Store.Core`](/help/sites-developing/contexthub-api.md#contexthub-store-core) Javascript class defines several functions for interacting with store data. The following functions store and retrieve multiple data items that are contained in objects:

* [addAllItems](/help/sites-developing/contexthub-api.md#addallitems-tree-options)
* [getTree](/help/sites-developing/contexthub-api.md#gettree-includeinternals)

Individual data items are stored as a set of key/value pairs. To store and retrieve values you specify the corresponding key:

* [getItem](/help/sites-developing/contexthub-api.md#getitem-key)
* [setItem](/help/sites-developing/contexthub-api.md#setitem-key-value-options)

Note that custom store candidates can define additional functions that provide access to store data.

>[!NOTE]
>
>ContextHub is not by default aware of the currently logged in used on publish servers and such users are regarded by ContextHub as “Anonymous.”
>
>You can make ContextHub aware of logged in users by loading the profile store as implemented in the [We.Retail reference site](/help/sites-developing/we-retail.md). Refer to the [relevant code on GitHub here](https://github.com/Adobe-Marketing-Cloud/aem-sample-we-retail/blob/master/ui.apps/src/main/content/jcr_root/apps/weretail/components/structure/header/clientlib/js/utilities.js).

### ContextHub Eventing {#contexthub-eventing}

ContextHub includes an event framework that enables you to automatically react to store events. Each store object contains a [ `ContextHub.Utils.Eventing`](/help/sites-developing/contexthub-api.md#contexthub-utils-eventing) object that is available as the store's [ `eventing`](/help/sites-developing/contexthub-api.md#eventing) property. Use the [ `on`](/help/sites-developing/contexthub-api.md#on-name-handler-selector-triggerforpastevents) or [ `once`](/help/sites-developing/contexthub-api.md#once-name-handler-selector-triggerforpastevents) function to bind a Javascript function to a store event.

## Using Context Hub to Manipulate Cookies {#using-context-hub-to-manipulate-cookies}

The Context Hub Javascript API provides cross-browser support for handling browser cookies. The [ `ContextHub.Utils.Cookie`](/help/sites-developing/contexthub-api.md#contexthub-utils-cookie) namespace defines several functions for creating, manipulating, and deleting cookies.

## Determining Resolved ContextHub Segments {#determining-resolved-contexthub-segments}

The ContextHub segment engine enables you to determine which of the registered segments are resolved in the current context. Use the getResolvedSegments function of the [ `ContextHub.SegmentEngine.SegmentManager`](/help/sites-developing/contexthub-api.md#contexthub-segmentengine-segmentmanager) class to retrieve resolved segments. Then, use the `getName` or `getPath` function of the [ `ContextHub.SegmentEngine.Segment`](/help/sites-developing/contexthub-api.md#contexthub-segmentengine-segment) class to test for a segment.

### Installed Segments {#installed-segments}

ContextHub segments are installed below the `/etc/segmentation/contexthub` node.

* female
* female-over-30  
* female-under-30  
* male
* male-over-30  
* male-under-30  
* order-value-75-to-100  
* order-value-over-100  
* over-30
* summer  
* summer-female  
* summer-female-over-30  
* summer-female-under-30  
* summer-male  
* summer-male-over-30  
* summer-male-under-30  
* under-30  
* winter  
* winter-female  
* winter-female-over-30  
* winter-female-under-30  
* winter-male  
* winter-male-over-30  
* winter-male-under-20

The rules that are used to resolve these segments are summarized as follows:

* Female or male is determined from the `gender` data item of the [profile](/help/sites-developing/ch-samplestores.md#granite-profile-sample-store-candidate) store.

* Age is determined from the age data item of the profile store.
* Season is determined from the the latitude data item of the [geolocation](/help/sites-developing/ch-samplestores.md#contexthub-geolocation-sample-store-candidate) store, and the month data item of the surferinfo store.

## Logging Debug Messages for ContextHub {#logging-debug-messages-for-contexthub}

Configure the Adobe Granite ContextHub OSGi service (PID = `com.adobe.granite.contexthub.impl.ContextHubImpl`) to log detailed Debug messages that are useful when developing.

To configure the service you can either use the [Web Console](/help/sites-deploying/configuring-osgi.md#osgi-configuration-with-the-web-console) or use a [JCR node in the repository](/help/sites-deploying/configuring-osgi.md#osgi-configuration-in-the-repository):

* Web Console: To log Debug messages, select the Debug property.
* JCR node: To log Debug messages, set the boolean `com.adobe.granite.contexthub.debug` property to `true`.

## See an Overview of the ContextHub Framework {#see-an-overview-of-the-contexthub-framework}

ContextHub provides a [diagnostics page](/help/sites-developing/ch-diagnostics.md) where you can see an overview of the ContextHub framework.

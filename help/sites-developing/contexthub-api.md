---
title: ContextHub JavaScript API Reference
description: The ContextHub JavaScript API is available to your scripts when the ContextHub component has been added to the page
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: personalization
content-type: reference
feature: Context Hub,Developing,Personalization
exl-id: b472d96f-b1a5-40b7-be2a-52f3396f6884
solution: Experience Manager, Experience Manager Sites
role: Developer
---
# ContextHub JavaScript API Reference{#contexthub-javascript-api-reference}

The ContextHub JavaScript API is available to your scripts when the [ContextHub component has been added to the page](/help/sites-developing/ch-adding.md#adding-contexthub-to-a-page-component).

## ContextHub Constants {#contexthub-constants}

Constant values that the ContextHub JavaScript API defines.

### Event Constants {#event-constants}

The following table lists the names events that occur for ContextHub Stores. See also [ContextHub.Utils.Eventing](/help/sites-developing/contexthub-api.md#contexthub-utils-eventing).

| Constant |Description |Value |
|---|---|---|
| ContextHub.Constants.EVENT_NAMESPACE |ContextHub's event namespace |ch |
| ContextHub.Constants.EVENT_ALL_STORES_READY |Indicates that all required stores are registered, initialized and ready to be consumed |all-stores-ready |
| ContextHub.Constants.EVENT_STORES_PARTIALLY_READY |Indicates that not all stores were initialized within a given timeout |stores-partially-ready |
| ContextHub.Constants.EVENT_STORE_REGISTERED |Fired when a store is registered |store-registered |
| ContextHub.Constants.EVENT_STORE_READY |Indicates that stores is ready to work. It is triggered immediately after registration, except JSONP stores, where it is fired when data is fetched). |store-ready |
| ContextHub.Constants.EVENT_STORE_UPDATED |Fired when a store updates its persistence |store-updated |
| ContextHub.Constants.PERSISTENCE_CONTAINER_NAME |Persistence container name |ContextHubPersistence |
| ContextHub.Constants.SERVICE_RAW_RESPONSE_KEY |Stores specific persistence key name where raw JSON result is stored |/_/raw-response |
| ContextHub.Constants.SERVICE_RESPONSE_TIME_KEY |Stores specific timestamp indicating when JSON data was fetched |/_/response-time |
| ContextHub.Constants.SERVICE_LAST_URL_KEY |Stores specific url of JSON service used during last call |/_/url |
| ContextHub.Constants.IS_CONTAINER_EXPANDED |Indicates whether ContextHub's UI is expanded |/_/container-expanded |

### UI Event Constants {#ui-event-constants}

The following table lists the names of events that occur for the ContextHub UI.

| **Constant** |**Description** |**Value** |
|---|---|---|
| ContextHub.Constants.EVENT_UI_MODE_REGISTERED |Fired when a mode is registered |ui-mode-registered |
| ContextHub.Constants.EVENT_UI_MODE_UNREGISTERED |Fired when a mode is unregistered |ui-mode-unregistered |
| ContextHub.Constants.EVENT_UI_MODE_RENDERER_REGISTERED |Fired when a mode renderer is registered |ui-mode-renderer-registered |
| ContextHub.Constants.EVENT_UI_MODE_RENDERER_UNREGISTERED |Fired when a mode renderer is unregistered |ui-mode-renderer-unregistered |
| ContextHub.Constants.EVENT_UI_MODE_ADDED |Fired when a new mode is added |ui-mode-added |
| ContextHub.Constants.EVENT_UI_MODE_REMOVED |Fired when a mode is removed |ui-mode-removed |
| ContextHub.Constants.EVENT_UI_MODE_SELECTED |Fired when a mode is selected by the user |ui-mode-selected |
| ContextHub.Constants.EVENT_UI_MODULE_REGISTERED |Fired when a new module is registered |ui-module-registered |
| ContextHub.Constants.EVENT_UI_MODULE_UNREGISTERED |Fired when a module is unregistered |ui-module-unregistered |
| ContextHub.Constants.EVENT_UI_MODULE_RENDERER_REGISTERED |Fired when a module renderer is registered |ui-module-renderer-registered |
| ContextHub.Constants.EVENT_UI_MODULE_RENDERER_UNREGISTERED |Fired when a module renderer is unregistered |ui-module-renderer-unregistered |
| ContextHub.Constants.EVENT_UI_MODULE_ADDED |Fired when a new module is added |ui-module-added |
| ContextHub.Constants.EVENT_UI_MODULE_REMOVED |Fired when a module is removed |ui-module-removed |
| ContextHub.Constants.EVENT_UI_CONTAINER_ADDED |Fired when the UI container is added to the page |ui-container-added |
| ContextHub.Constants.EVENT_UI_CONTAINER_OPENED |Fired when the ContextHub UI is opened |ui-container-opened |
| ContextHub.Constants.EVENT_UI_CONTAINER_CLOSED |Fired when the ContextHub UI is collapsed |ui-container-closed |
| ContextHub.Constants.EVENT_UI_PROPERTY_MODIFIED |Fired when a property is modified |ui-property-modified |
| ContextHub.Constants.EVENT_UI_RENDERED |Fired every time the ContextHub UI is rendered (for example, after a property change) |ui-rendered |
| ContextHub.Constants.EVENT_UI_INITIALIZED |Fired when UI container gets initialized |ui-initialized |
| ContextHub.Constants.ACTIVE_UI_MODE |Indicates active UI mode |/_/active-ui-mode |

## ContextHub JavaScript API Reference {#contexthub-javascript-api-reference-2}

The ContextHub object provides access to all stores.

### Functions (ContextHub) {#functions-contexthub}

#### getAllStores() {#getallstores}

Returns all registered ContextHub stores.

This function has no parameters.

**Returns**

An object that contains all ContextHub stores. Each store is an object that uses the same name s the store.

**Example**

The following example retrieves all stores and then retrieves the geolocation store:

```
var allStores = ContextHub.getAllStores();
var geoloc = allStores.geolocation
```

#### getStore(name) {#getstore-name}

Retrieves a store as a JavaScript object.

**Parameters**

* **name:** The name with which the store was registered.

**Returns**

An object that represents the store.

**Example**

The following example retrieves the geolocation store:

```
var geoloc = ContextHub.getStore("geolocation");
```

## ContextHub.SegmentEngine.Segment {#contexthub-segmentengine-segment}

Represents a ContextHub segment. Use the ContextHub.SegmentEngine.SegmentManager to obtain segments.

### Functions (ContextHub.ContextEngine.Segment) {#functions-contexthub-contextengine-segment}

#### getName() {#getname}

Returns the name of the segment as a String value.

#### getPath() {#getpath}

Returns the repositoy path of the segment definition as a String value.

## ContextHub.SegmentEngine.SegmentManager {#contexthub-segmentengine-segmentmanager}

Provides access to ContextHub segments.

### Functions (ContextHub.SegmentEngine.SegmentManager) {#functions-contexthub-segmentengine-segmentmanager}

#### getResolvedSegments() {#getresolvedsegments}

Returns the segments that are resolved in the current context. This function has no parameters.

**Returns**

An array of ContextHub.SegmentEngine.Segment objects.

## ContextHub.Store.Core {#contexthub-store-core}

The base class for ContextHub stores.

### Properties (ContextHub.Store.Core) {#properties-contexthub-store-core}

#### eventing {#eventing}

A [ContextHub.Utils.Eventing](/help/sites-developing/contexthub-api.md#contexthub-utils-eventing) object. Use this object for binding functions to store events. For information about the default value and initialization, see [init(name,config)](/help/sites-developing/contexthub-api.md#init-name-config).

#### name {#name}

The name of the store.

#### persistence {#persistence}

A ContextHub.Utils.Persistence object. For information about the default value and initialization, see `[init(name,config)](/help/sites-developing/contexthub-api.md#init-name-config).`

### Functions (ContextHub.Store.Core) {#functions-contexthub-store-core}

#### addAllItems(tree, options) {#addallitems-tree-options}

Merges a data object or an array with the store data. Each key/value pair in the object or array is added to the store (via the `setItem` function):

* **Object:** Keys are the property names.
* **Array:** Keys are the array indexes.

Note that values can be objects.

**Parameters**

* **tree:** (Object or array) The data to add to the store.
* **options:** (Object) An optional object of options that is passed to the setItem function. For information, see the `options` parameter of [setItem(key,value,options)](/help/sites-developing/contexthub-api.md#setitem-key-value-options).

**Returns**

A `boolean` value:

* A value of `true` indicates the data object was stored.
* A value of `false` indicates that the data store is unchanged.

#### addReference(key, anotherKey) {#addreference-key-anotherkey}

Creates a reference from one key to another key. A key cannot reference itself.

**Parameters**

* **key:** The key that references `anotherKey`.

* **anotherkey:** They key that is referenced by `key`.

**Returns**

A `boolean` value:

* A value of `true` indicates that the reference was added.
* A value of `false` indicates that no reference was added.

#### announceReadiness() {#announcereadiness}

Triggers the `ready` event for this store. This function has no parameters and returns no value.

#### clean() {#clean}

Removes all data from the store. The function has no parameters and no return value.

#### getItem(key) {#getitem-key}

Returns the value that is associated with a key.

**Parameters**

* **key:** (String) The key for which to return the value.

**Returns**

An Object that represents the value for the key.

#### getKeys(includeInternals) {#getkeys-includeinternals}

Retrieves the keys from the store. Optionally you can retrieve the keys that are used internally by the ContextHub framework.

**Parameters**

* **includeInternals:** A value of `true` includes internally used keys in the results. These keys begin with the underscore ("_") character. The default value is `false`.

**Returns**

An array of key names ( `string` values).

#### getReferences() {#getreferences}

Retrieves the references from the store.

**Returns**

An array that uses referencing keys as indexes for the referenced keys:

* Referencing keys correspond with the `key` parameter of the `addReference` function.

* Referenced keys correspond with the `anotherKey` parameter of the `addReference` function.

#### getTree(includeInternals) {#gettree-includeinternals}

Retrieves the data tree from the store. Optionally you can include the key/value pairs that are use internally by the ContextHub framework.

**Parameters**

* `includeInternals:` A value of `true` includes internally used key/value pairs in the results. The keys of this data begin with the underscore ("_") character. The default value is `false`.

**Returns**

An object that represents the data tree. The keys are the property names of the object.

#### init(name, config) {#init-name-config}

Initializes the store.

* Sets the store data to an empty object.
* Sets the store references to an empty object.
* The eventChannel is data:*name*, where *name* is the store name.

* The storeDataKey is /store/*name*, where *name* is the store name.

**Parameters**

* **name:** The name of the store.
* **config:** An object that contains configuration properties:

    * eventDeferring: Default value is 32.
    * eventing: The [ContextHub.Utils.Eventing](/help/sites-developing/contexthub-api.md#contexthub-utils-eventing) object for this store. The default value is the ContextHub.eventing object uses.
    * persistence: The ContextHub.Utils.Persistence object for this store. The default value is the ContextHub.persistence object.

#### isEventingPaused() {#iseventingpaused}

Determines whether eventing is paused for this store.

**Returns**

A boolean value:

* `true`: Eventing is paused so that no events are triggered for this store.
* `false`: Eventing is not paused so that events are triggered for this store.

#### pauseEventing() {#pauseeventing}

Pauses eventing for the store so that no events are triggered. This function requires no parameters and returns no value.

#### removeItem(key, options) {#removeitem-key-options}

Removes a key/value pair from the store.

When a key is removed, the function triggers the `data` event. The event data includes the store name, the name of the key that was removed, the value that was removed, new value for the key (null), and the action type of "remove".

Optionally, you can prevent the triggering of the `data` event.

**Parameters**

* **key:** (String) The name of the key to remove.
* **options:** (Object) An object of options. The following object properties are valid:

    * silent: A value of `true` prevents the triggering of the `data` event. The default value is `false`.

**Returns**

A `boolean` value:

* A value of `true` indicates the key/value pair was removed.
* A value of `false` indicates that the data store is unchanged because the key was not found in the store.

#### removeReference(key) {#removereference-key}

Removes a reference from the store.

**Parameters**

* **key:** The key reference to remove. This parameter corresponds with the `key` parameter of the `addReference` function.

**Returns**

A `boolean` value:

* A value of `true` indicates the reference was removed.
* A value of `false` indicates that the key was not valid and the store is unchanged.

#### reset(keepRemainingData) {#reset-keepremainingdata}

Resets the initial values of the store's persisted data. Optionally, you can remove all other data from the store. Eventing is paused for this store while the store is reset. This function returns no value.

Initial values are provided in the initialValues property of the config object that is used to instantiate the store object.

**Parameters**

* **keepRemainingData:** (Boolean) A value of true causes non-initial data to be persisted. A value of false causes all data to be removed except for the initial values.

Resets the initial values of the store's persisted data. Optionally, you can remove all other data from the store. Eventing is paused for this store while the store is reset. This function returns no value.

Initial values are provided in the initialValues property of the config object that is used to instantiate the store object.

**Parameters**

* keepRemainingData: (Boolean) A value of true causes non-initial data to be persisted. A value of false causes all data to be removed except for the initial values.

#### resolveReference(key, retry) {#resolvereference-key-retry}

Retrieves a referenced key. Optionally, you can specify the number of iterations to use for resolving the best match.

**Parameters**

* **key:** (String) The key for which to resolve the reference. This `key` parameter corresponds with the `key` parameter of the `addReference` function.

* **retry:** (Number) The number of iterations to use.

**Returns**

A `string` value that represents the referenced key. If no reference is resolved, the value of the `key` parameter is returned.

#### resumeEventing() {#resumeeventing}

Resumes eventing for this store so that events are triggered. This function defines no parameters and returns no value.

#### setItem(key, value, options) {#setitem-key-value-options}

Adds a key/value pair to the store.

Triggers the `data` event only if the value for the key is different from the value that is currently stored for the key. You can optionally prevent the triggering of the `data` event.

The event data includes the store name, the key, the previous value, the new value, and the action type of `set`.

**Parameters**

* **key:** (String) The name of the key.
* **options:** (Object) An object of options. The following object properties are valid:

    * silent: A value of `true` prevents the triggering of the `data` event. The default value is `false`.

* **value:** (Object) The value to associate with the key.

**Returns**

A `boolean` value:

* A value of `true` indicates the data object was stored.
* A value of `false` indicates that the data store is unchanged.

## ContextHub.Store.JSONPStore {#contexthub-store-jsonpstore}

A store that contains JSON data. The data is retrieved from an external JSONP service, or optionally from a service that returns JSON data. Specify the service details using the [ `init`](/help/sites-developing/contexthub-api.md#init-name-config) function when you create an instance of this class.

The store uses in-memory persistance (JavaScript variable). Store data is available only during the lifetime of the page.

ContextHub.Store.JSONPStore extends [ContextHub.Store.Core](/help/sites-developing/contexthub-api.md#contexthub-store-core) and inherits the functions of that class.

### Functions (ContextHub.Store.JSONPStore) {#functions-contexthub-store-jsonpstore}

#### configureService(serviceConfig, override) {#configureservice-serviceconfig-override}

Configures the details for connecting to the JSONP service that this object uses. You can either update or replace the existing configuration. The function returns no value.

**Parameters**

* **serviceConfig:** An object that contains the following properties:

    * host: (String) The server name or IP address.
    * jsonp: (Boolean) A value of true indicates that the service is a JSONP service, false otherwise. When true, the {callback: "ContextHub.Callbacks.*Object.name*} object is added to the service.params object.
    * params: (Object) URL parameters represented as object properties. Parameter names are property names and parameter values are property values.
    * path: (String) The path to the service.
    * port: (Number) The port number of the service.
    * secure: (String or Boolean) Determines the protocol to use for the service URL:

        * auto: //
        * true: https://
        * false: https://

* **override:** (Boolean). A value of `true` causes the existing service configuration to be replaced by the properties of `serviceConfig`. A value of `false` causes the existing service configuration properties to be merged with the properties of `serviceConfig`.

#### getRawResponse() {#getrawresponse}

Returns the raw response that is cached since the last call to the JSONP service. The function requires no parameters.

**Returns**

An object that represents the raw response.

#### getServiceDetails() {#getservicedetails}

Retrieves the service object for this ContextHub.Store.JSONPStore object. The service object contains all the information required to create the service URL.

**Returns**

An object with the following properties:

* **host:** (String) The server name or IP address.
* **jsonp:** (Boolean) A value of true indicates that the service is a JSONP service, false otherwise. When true, the {callback: "ContextHub.Callbacks.*Object.name*} object is added to the service.params object.

* **params:** (Object) URL parameters represented as object properties. Parameter names are property names and parameter values are property values.
* **path:** (String) The path to the service.
* **port:** (Number) The port number of the service.
* **secure:** (String or Boolean) Determines the protocol to use for the service URL:

    * auto: //
    * true: https://
    * false: https://

#### getServiceURL(resolve) {#getserviceurl-resolve}

Retrieves the URL of the JSONP service.

**Parameters**

* **resolve:** (Boolean) Determines whether to include resolved parameters in the URL. A value of `true` resolves parameters, and `false` does not.

**Returns**

A `string` value that represents the service URL.

#### init(name, config) {#init-name-config-1}

initializes the ContextHub.Store.JSONPStore object.

**Parameters**

* **name:** (String) The name of the store.
* **config:** (Object) An object that contains the service property. The JSONPStore object uses the properties of the `service` object to construct the URL of the JSONP service:

    * eventDeferring: 32.
    * eventing: The ContextHub.Utils.Eventing object for this store. The default value is the `ContextHub.eventing` object.
    * persistence: The ContextHub.Utils.Persistence object for this store. By default, memory persistence is used (JavaScript object).
    * service: (Object)

        * host: (String) The server name or IP address.
        * jsonp: (Boolean) A value of true indicates that the service is a JSONP service, false otherwise. When true, the `{callback: "ContextHub.Callbacks.*Object.name*}`object is added to `service.params`.
        * params: (Object) URL parameters represented as object properties. Parameter names and values are the object property names and values, respectively.
        * path: (String) The path to the service.
        * port: (Number) The port number of the service.
        * secure: (String or Boolean) Determines the protocol to use for the service URL:

            * auto: //
            * true: https://
            * false: https://

        * timeout: (Number) The amount of time to wait for the JSONP service to respond before timing out, in milliseconds.
        * ttl: The minimum amount of time in milliseconds that passes between calls to the JSONP service. (See the [queryService](/help/sites-developing/contexthub-api.md#queryservice-reload) function).

#### queryService(reload) {#queryservice-reload}

Queries the remote JSONP service and caches the response. If the amount of time since the previous call to this function is less than the value of `config.service.ttl`, the service is not called and the cached response is not changed. Optionally, you can force the service to be called. The `config.service.ttl`property is set when calling the [init](/help/sites-developing/contexthub-api.md#init-name-config) function to initialize the store.

Triggers the ready event when the query is finished. If the JSONP service URL is not set, the function does nothing.

**Parameters**

* **reload:** (Boolean) A value of true removes the cached response and forces the JSONP service to be called.

#### reset {#reset}

Resets the initial values of the store's persisted data and then calls the JSONP service. Optionally, you can remove all other data from the store. Eventing is paused for this store while the initial values are reset. This function returns no value.

Initial values are provided in the initialValues property of the config object that is used to instantiate the store object.

**Parameters**

* **keepRemainingData:** (Boolean) A value of true causes non-initial data to be persisted. A value of false causes all data to be removed except for the initial values.

#### resolveParameter(f) {#resolveparameter-f}

Resolves the given parameter.

## ContextHub.Store.PersistedJSONPStore {#contexthub-store-persistedjsonpstore}

ContextHub.Store.PersistedJSONPStore extends [ContextHub.Store.JSONPStore](/help/sites-developing/contexthub-api.md#contexthub-store-jsonpstore) so it inherits all the functions of that class. However, the data that is retrieved from the JSONP service is persisted according to the configuration of ContextHub persistence. (See [Persistence Modes](/help/sites-developing/ch-adding.md#persistence-modes).)

## ContextHub.Store.PersistedStore {#contexthub-store-persistedstore}

ContextHub.Store.PersistedStore extends [ContextHub.Store.Core](/help/sites-developing/contexthub-api.md#contexthub-store-core) so it inherits all the functions of that class. The data in this store is persisted according to the configuration of ContextHub persistence.

## ContextHub.Store.SessionStore {#contexthub-store-sessionstore}

ContextHub.Store.SessionStore extends [ContextHub.Store.Core](/help/sites-developing/contexthub-api.md#contexthub-store-core) so it inherits all the functions of that class. The data in this store is persisted using in-memory persistance (JavaScript object).

## ContextHub.UI {#contexthub-ui}

Manages UI modules and UI module renderers.

### Functions (ContextHub.UI) {#functions-contexthub-ui}

#### registerRenderer(moduleType, renderer, dontRender) {#registerrenderer-moduletype-renderer-dontrender}

Registers a UI module renderer with ContextHub. After the renderer is registered, it can be used to [create UI modules](ch-configuring.md#adding-a-ui-module). Use this function when you are [extending ContextHub.UI.BaseModuleRenderer](/help/sites-developing/ch-extend.md#creating-contexthub-ui-module-types) to create a custom UI Module renderer.

**Parameters**

* **moduleType:** (String) The identifier for the UI module renderer. If a renderer is already registered using the specified value, the existing renderer is unregistered before this renderer is registered.
* **renderer:** (String) The name of the class that renders the UI module.
* **dontRender:** (Boolean) Set to `true` to prevent the ContextHub UI from being rendered after the renderer is registered. The default value is `false`.

**Example**

The following example registers a renderer as the contexthub.browserinfo module type.

```
ContextHub.UI.registerRenderer('contexthub.browserinfo', new SurferinfoRenderer());
```

## ContextHub.Utils.Cookie {#contexthub-utils-cookie}

A utility class for interacting with cookies.

### Functions (ContextHub.Utils.Cookie) {#functions-contexthub-utils-cookie}

#### exists(key) {#exists-key}

Determines whether a cookie exists.

**Parameters**

* **key:** A `String` that contains the key of the cookie for which you are testing.

**Returns**

A `boolean` value of true indicates that the cookie exists.

**Example**

```
if (ContextHub.Utils.Cookie.exists("name")) {
   // conditionally-executed code
}
```

#### getAllItems(filter) {#getallitems-filter}

Returns all cookies that have keys that match a filter.

**Parameters**

* (Optional) **filter:** Criteria for matching cookie keys. To return all cookies, specify no value. The following types are supported:

    * String: The string is compared to the cookie key.
    * Array: Each item in the array is a filter.
    * A RegExp object: The test function of the object is used to match cookie keys.
    * A function: A function that tests a cookie key for a match. The function must take the cookie key as a paramter and return true if the test confirms a match.

**Returns**

An object of cookies. Object properties are cookie keys and key values are cookie values.

**Example**

```
ContextHub.Utils.Cookie.getAllItems([/^cq-authoring/, /^cq-editor/])
```

#### getItem(key) {#getitem-key-1}

Returns a cookie value.

**Parameters**

* **key:** The key of the cookie for which you want the value.

**Returns**

The cookie value, or `null` if no cookie was found for the key.

**Example**

```
ContextHub.Utils.Cookie.getItem("name");
```

#### getKeys(filter) {#getkeys-filter}

Returns an array of the keys of existing cookies that match a filter.

**Parameters**

* **filter:** Criteria for matching cookie keys. The following types are supported:

    * String: The string is compared to the cookie key.
    * Array: Each item in the array is a filter.
    * A RegExp object: The test function of the object is used to match cookie keys.
    * A function: A function that tests a cookie key for a match. The function must take the cookie key as a paramter and return `true` if the test confirms a match.

**Returns**

An array of strings where each string is the key of a cookie that matches the filter.

**Example**

```
ContextHub.Utils.Cookie.getKeys([/^cq-authoring/, /^cq-editor/])
```

#### removeItem(key, options) {#removeitem-key-options-1}

Removes a cookie. To remove the cookie, the value is set to an emtpy string and the expiry date is set to the day before the current date.

**Parameters**

* **key:** A `String` value that represents the key of the cookie to remove.

* **options:** An object that contains property values for configuring the cookie attributes. See the ` [setItem](/help/sites-developing/contexthub-api.md#setitem-key-value-options)` function for information. The `expires` property has no effect.

**Returns**

This function does not return a value.

**Example**

```
ContextHub.Utils.Cookie.vanish([/^cq-authoring/, 'cq-scrollpos']);
```

#### setItem(key, value, options) {#setitem-key-value-options-1}

Creates a cookie of the given key and value, and adds the cookie to the current document. Optionally, you can specify options that configure the attributes of the cookie.

**Parameters**

* **key:** A String that contains the key of the cookie.
* **value:** A String that contains the cookie value.
* **options:** (Optional) An object that contains any of the following properties that configure the cookie attributes:

    * expires: A `date` or `number` value that specifies when the cookie expires. A date value specifies the absolute time of expiry. A number (in days) sets the time of expiry to the current time plus the number. The default value is `undefined`.
    * secure: A `boolean` value that specifies the `Secure` attribute of the cookie. The default value is `false`.
    * path: A `String` value to use as the `Path` attribute of the cookie. The default value is `undefined`.

**Returns**

The cookie with the set value.

**Example**

```
ContextHub.Utils.Cookie.setItem("name", "mycookie", {
    expires: 3,
    domain: 'localhost',
    path: '/some/directory',
    secure: true
});
```

#### vanish(filter, options) {#vanish-filter-options}

Removes all cookies that match a given filter. Cookies are matched using the getKeys function and removed using the removeItem function.

**Parameters**

* **filter:** The `filter` argument to use in the call to the `[getKeys](/help/sites-developing/contexthub-api.md#getkeys-filter)` function.

* **options:** The `options` argument to use in the call to the `[removeItem](/help/sites-developing/contexthub-api.md#removeitem-key-options)` function.

**Returns**

This function does not return a value.

## ContextHub.Utils.Eventing {#contexthub-utils-eventing}

Enables you to bind and unbind functions to ContextHub store events. Access ContextHub.Utils.Eventing objects for a store using the [eventing](/help/sites-developing/contexthub-api.md#eventing) property of the store.

### Functions (ContextHub.Utils.Eventing) {#functions-contexthub-utils-eventing}

#### off(name, selector) {#off-name-selector}

Unbinds a function from an event.

**Parameters**

* **name:** The [name of the event](/help/sites-developing/contexthub-api.md#contexthub-utils-eventing) for which you are unbinding the function.

* **selector:** The selector that identifies the bind. (See the `selector` parameter for the [on](/help/sites-developing/contexthub-api.md#on-name-handler-selector-triggerforpastevents) and [once](/help/sites-developing/contexthub-api.md#once-name-handler-selector-triggerforpastevents) functions).

**Returns**

This function returns no value.

#### on(name, handler, selector, triggerForPastEvents) {#on-name-handler-selector-triggerforpastevents}

Binds a function to an event. The function is called every time the event occurs. Optionally, the function can be called for events that have occurred in the past, before the binding is established.

**Parameters**

* **name:** (String) The [name of the event](/help/sites-developing/contexthub-api.md#contexthub-utils-eventing) to which you are binding the function.

* **handler:** (Function) The function to bind to the event.
* **selector:** (String) A unique identifier for the bind. You need the selector to identify the bind if you want to use the `off` function to remove the bind.

* **triggerForPastEvents:** (Boolean) Indicates whether the handler should be executed for events that occurred in the past. A value of `true` calls the handler for past events. A value of `false` calls the hander for future events. The default value is `true`.

**Returns**

When the `triggerForPastEvents` argument is `true`, this function returns a `boolean` value that indicates whether the event occurred in the past:

* `true`: The event occurred in the past and the handler will be called.
* `false`: The event has not occurred in the past.

If `triggerForPastEvents` is `false`, this function returns no value.

**Example**

The following example binds a function to the data event of the geolocation store. The function populates an element on the page with the value for the latitude data item from the store.

```
<div class="location">
    <p>latitude: <span id="lat"></span></p>
</div>

<script>
    var geostore = ContextHub.getStore("geolocation");
    geostore.eventing.on(ContextHub.Constants.EVENT_DATA_UPDATE,getlat,"getlat");

    function getlat(){
       latitude = geostore.getItem("latitude");
       $("#lat").html(latitude);
    }
</script>
```

#### once(name, handler, selector, triggerForPastEvents) {#once-name-handler-selector-triggerforpastevents}

Binds a function to an event. The function is called only once, for the first occurrence of the event. Optionally, the function can be called for the event that has occurred in the past, before the binding is established.

**Parameters**

* **name:** (String) The [name of the event](/help/sites-developing/contexthub-api.md#contexthub-utils-eventing) to which you are binding the function.

* **handler:** (Function) The function to bind to the event.
* **selector:** (String) A unique identifier for the bind. You need the selector to identify the bind if you want to use the `off` function to remove the bind.

* **triggerForPastEvents:** (Boolean) Indicates whether the handler should be executed for events that occurred in the past. A value of `true` calls the handler for past events. A value of `false` calls the hander for future events. The default value is `true`.

**Returns**

When the `triggerForPastEvents` argument is `true`, this function returns a `boolean` value that indicates whether the event occurred in the past:

* `true`: The event occurred in the past and the handler will be called.
* `false`: The event has not occurred in the past.

If `triggerForPastEvents` is `false`, this function returns no value.

## ContextHub.Utils.inheritance {#contexthub-utils-inheritance}

A utility class that enables an object to inherit the properties and methods of another object.

### Functions (ContextHub.Utils.inheritance) {#functions-contexthub-utils-inheritance}

#### inherit(child, parent) {#inherit-child-parent}

Causes an object to inherit the properties and methods of another object.

**Parameters**

* **child:** (Object) The object that inherits.
* **parent:** (Object) The object that defines the properties and methods that are inherited.

## ContextHub.Utils.JSON {#contexthub-utils-json}

Provides functions for serializing objects into JSON format and deserializing JSON strings into objects.

### Functions (ContextHub.Utils.JSON) {#functions-contexthub-utils-json}

#### parse(data) {#parse-data}

Parses a string value as JSON and converts it into a javascript object.

**Parameters**

* **data:** A string value in JSON format.

**Returns**

A JavaScript object.

**Example**

The code `ContextHub.Utils.JSON.parse("{'city':'Basel','country':'Switzerland','population':'173330'}");` returns the following object:

```
Object {
   city: "Basel",
   country: "Switzerland",
   population: 173330
}
```

#### stringify(data) {#stringify-data}

Serializes JavaScript values and objects into string values of JSON format.

**Parameters**

* **data:** The value or object to serialize. This function supports boolean, array, number, string, and date values.

**Returns**

The serialized string value. When `data` is a R `egExp` value, this function returns an empty object. When `data` is a function, returns `undefined`.

**Example**

The following code returns `"{'city':'Basel','country':'Switzerland','population':'173330'}":`

```
ContextHub.Utils.JSON.stringify({
   city: "Basel",
   country: "Switzerland",
   population: 173330
});
```

## ContextHub.Utils.JSON.tree {#contexthub-utils-json-tree}

This class facilitates the manipulation of data objects that to be stored or are retrieved from ContextHub stores.

### Functions (ContextHub.Utils.JSON.tree) {#functions-contexthub-utils-json-tree}

#### addAllItems() {#addallitems}

Creates a copy of a data object and adds to it the data tree from a second object. The function returns the copy and does not modify either of the original objects. When the data trees of the two objects contain identical keys, the value of the second object overwrites the value of the first object.

**Parameters**

* **tree:** The object that is copied.
* **secondTree:** The object that is merged with the copy of the `tree` object.

**Returns**

An object that contains the merged data.

#### cleanup() {#cleanup}

Creates a copy of an object, finds and removes items in the data tree that contain no values, null values, or undefined values, and returns the copy.

**Parameters**

* **tree:** The object to clean.

**Returns**

A copy of tree that is cleaned.

#### getItem() {#getitem}

Retrieves the value from an object for the key.

**Parameters**

* **tree:** The data object.
* **key:** The key for the value that you want to retrieve.

**Returns**

The value that corresonds with the key. When the key has child keys, this function returns a complex object. When the type of the value for the key is `undefined`, `null` is returned.

**Example**

Consider the following JavaScript object:

```
myObject {
  user: {
    location: {
      city: "Basel",
        details: {
          population: 173330,
          elevation: 260
        }
      }
    }
  }
```

The following example code returns the value `260`:

```
ContextHub.Utils.JSON.tree.getItem(myObject, "/user/location/details/elevation");
```

The following example code retrieves the value for a key that has child keys:

```
ContextHub.Utils.JSON.tree.getItem(myObject, "/user");
```

The function returns the following object:

```
Object {
  location: {
    city: "Basel",
    details: {
      population: 173330,
      elevation: 260
    }
  }
}
```

#### getKeys() {#getkeys}

Retrieves all keys from the data tree of an object. Optionally, you can retrieve only the keys of the children of a specific key. You can also optionally specify a sort order of the retrieved keys.

**Parameters**

* **tree:** The object from which to retrieve the keys of the data tree.
* **parent:** (Optional) The key of an item in the data tree for which you want to retrieve the keys of the child items.
* **order:** (Optional) A function that determines the sort order of the returned keys. (See [Array.prototype.sort](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort) on the Mozilla Developer Network.)

**Returns**

An array of keys.

**Example**

Consider the following object:

```
myObject {
  location: {
    weather: {
      temperature: "28C",
      humidity: "77%",
      precipitation: "10%",
      wind: "8km/h"
    },
    city: "Basel",
    country: "Switzerland",
    longitude: 7.5925727,
    latitude: 47.557421
  }
}
```

The `ContextHub.Utils.JSON.tree.getKeys(myObject);` script returns the following array:

```
["/location", "/location/city", "/location/country", "/location/latitude", "/location/longitude", "/location/weather", "/location/weather/humidity", "/location/weather/precipitation", "/location/weather/temperature", "/location/weather/wind"]
```

#### removeItem() {#removeitem}

Creates a copy of a given object, removes the specified branch from the data tree, and returns the modified copy.

**Parameters**

* tree: A data object.
* key: The key to remove.

**Returns**

A copy of the original data object with the key removed.

**Example**

Consider the following object:

```
myObject {
  one: {
    foo: "bar",
    two: {
      three: {
        four: {
          five: 5,
          six: 6
        }
      }
    }
  }
}
```

The following example script removes the /one/two/three/four branch from the data tree:

```
myObject = ContextHub.Utils.JSON.tree.removeItem(myObject, "/one/two/three/four");
```

The function returns the following object:

```
myObject {
  one: {
    foo: "bar"
  }
}
```

#### sanitizeKey(key) {#sanitizekey-key}

Sanitizes string values to make them usable as keys. To sanitize a string, this function performs the following actions:

* Reduces multiple consecutive forward slashes to a single slash.
* Removes whitespace from the beginning and ending of the string.
* Splits the result into an array of strings that are demarcated by slashes.

Use the resultant array to create a usable key.  **Parameters**

* **key:** The `string` to sanitize.

**Returns**

An array of `string` values where each string is the portion of the `key` that was demarcated by slashes. represents the sanitized key. If the sanitized array has a length of zero, this function returns `null`.

**Example**

The following code sanitizes a string to produce the array `["this", "is", "a", "path"]`, and then generates the key `"/this/is/a/path"` from the array:

```
var key = " / this////is/a/path ";
ContextHub.Utils.JSON.tree.sanitizeKey(key)
"/" + ContextHub.Utils.JSON.tree.sanitizeKey(key).join("/");
```

#### setItem(tree, key, value) {#setitem-tree-key-value}

Adds a key/value pair to the data tree of a copy of an object. For information about data trees, see [Persistence](/help/sites-developing/contexthub.md#persistence).

**Parameters**

* tree: A data object.
* key: The key to associate with the value that you are adding. The key is the path to the item in the data tree. This function calls `ContextHub.Utils.JSON.tree.sanitize` to sanitize the key before adding it.
* value: The value to add to the data tree.

**Returns**

A copy of the `tree` object that includes the `key`/ `value` pair.

**Example**

Consider the following JavaScript code:

```
var myObject = {
     user: {
        location: {
           city: "Basel"
           }
        }
     };

var myKey = "/user/location/details";

var myValue = {
      population: 173330,
      elevation: 260
     };

myObject = ContextHub.Utils.JSON.tree.setItem(myObject, myKey, myValue);
```

The myObject object has the following value:

## ContextHub.Utils.storeCandidates {#contexthub-utils-storecandidates}

Enables you to register store candidates and obtain registered store candidates.

### Functions (ContextHub.Utils.storeCandidates) {#functions-contexthub-utils-storecandidates}

#### getRegisteredCandidates(storeType) {#getregisteredcandidates-storetype}

Returns the store types that are registered as store candidates. Either retrieve the registered candicates of a specific store type or of all store types.

**Parameters**

* **storeType:** (String) The name of the store type. See the `storeType` parameter of the [ `ContextHub.Utils.storeCandidates.registerStoreCandidate`](/help/sites-developing/contexthub-api.md#contexthub-utils-storecandidates) function.

**Returns**

An object of store types. The object properties are the store type names, and the property values are an array of registered store candidates.

#### getStoreFromCandidates(storeType) {#getstorefromcandidates-storetype}

Returns a store type from the registered candidates. If more than one store type of the same name is regestered, the function returns the store type with the highest priority.

**Parameters**

* storeType: (String) The name of the store candidate. See the `storeType` parameter of the [ `ContextHub.Utils.storeCandidates.registerStoreCandidate`](/help/sites-developing/contexthub-api.md#registerstorecandidate-store-storetype-priority-applies) function.

**Returns**

An object that represents the registered store candidate. If the requested store Type is not registered, an error is thrown.

#### getSupportedStoreTypes() {#getsupportedstoretypes}

Returns the names of the store types that are registered as store candidates. This function requires no parameters.

**Returns**

An array of string values, where each string is the storetype with which a store candidate was registered. See the `storeType` parameter of the [ `ContextHub.Utils.storeCandidates.registerStoreCandidate`](/help/sites-developing/contexthub-api.md#contexthub-utils-storecandidates) function.

#### registerStoreCandidate(store, storeType, priority, applies) {#registerstorecandidate-store-storetype-priority-applies}

Registers a store object as a store candidate using a name and priority.

The priority is a number that indicates the importance of same-named stores. When a store candidate is registered using the same name as an already-registered store candidate, the candidate with the higher priority is used. When registering a store candidate, the store is registered only if the priority is higher than same-named registered store candidates.

**Parameters**

* **store:** (Object) The store object to register as a store candidate.
* **storeType:** (String) The name of the store candidate. This value is required when creating an instance of the store candidate.
* **priority:** (Number) The priority of the store candidate.
* **applies:** (Function) The function to invoke that evaluates the applcability of the store in the current environment. The function must return `true` if the store is applicable, and `false` otherwise. The default value is a function that returns true: `function() {return true;}`

**Example**

```
ContextHub.Utils.storeCandidates.registerStoreCandidate(myStoreCandidate,
                                'contexthub.mystorecandiate', 0);
```

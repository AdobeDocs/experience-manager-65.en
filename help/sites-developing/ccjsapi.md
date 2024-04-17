---
title: Client Context JavaScript API

description: Learn about the JavaScript API for Client Context in Adobe Experience Manager.


contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: personalization
content-type: reference

feature: Context Hub,Developing,Personalization
exl-id: 24bdf9fc-71e6-4b99-9dad-0f41a5e36b98
solution: Experience Manager, Experience Manager Sites
role: Developer
---
# Client Context JavaScript API{#client-context-javascript-api}

## CQ_Analytics.ClientContextMgr {#cq-analytics-clientcontextmgr}

The CQ_Analytics.ClientContextMgr object is a singleton that contains a set of self-registered session stores, and provides methods for registering, persisting, and managing the session stores.

Extends CQ_Analytics.PersistedSessionStore.

### Methods {#methods}

#### getRegisteredStore(name) {#getregisteredstore-name}

Returns a session store of a specified name. See also [Accessing a Session Store](/help/sites-developing/client-context.md#accessing-session-stores).

**Parameters**

* name: String. The name of the session store.

**Returns**

A CQ_Analytics.SessionStore object that represents the session store of the given name. Returns `null` when no store exists of the given name.

#### register(sessionstore) {#register-sessionstore}

Registers a session store with Client Context. Fires the storeregister and storeupdate events upon completion.

**Parameters**

* sessionstore: CQ_Analytics.SessionStore. The session store object to register.

**Returns**

No returned value.

## CQ_Analytics.ClientContextUtils {#cq-analytics-clientcontextutils}

Provides methods for listening for session store activation and registration. See also [Checking That a Session Store is Defined and Initialized](/help/sites-developing/client-context.md#checking-that-a-session-store-is-defined-and-initialized).

### Methods {#methods-1}

#### onStoreInitialized(storeName, callback, delay) {#onstoreinitialized-storename-callback-delay}

Registers a callback function that is called when a session store is initialized. For stores that are initialized several times, specify a callback delay so that the callback function is called only once:

* When the store is initialized during the delay period of a previous initialization, the previous function call is cancelled, and the function is called again for the current initialization.
* If the delay period lapses before a subsequent initialization occurs, the callback function is executed twice.

For example, a session store is based on a JSON object and retrieved via a JSON request. The following intialization scenarios are possible:

* The request is completed, data retrieved and loaded into the store. In this case, initialization occurs once.
* The request fails (timeout). In this case initialization does not happen and there is no data in the store.
* The store is pre-populated with default values (init properties), but the request fails (timeout). There is only one initialization with default values.
* The store is pre-populated.

When the delay is set to `true` or several milliseconds, the method waits before calling the callback method. If another initialization event is triggered before the delay is passed, it will wait until the delay time is exceeded with no initialization event. This enables waiting for a second initialization event to be triggered and calls the callback function in the most optimal case.

**Parameters**

* storeName: String. The name of the session store to add the listener.
* callback: Function. The function to call upon store initialization.
* delay: Boolean or Number. The amount of time to delay the call to the callback function, in milliseconds. A boolean value of `true` uses the default delay of `200 ms`. A boolean value of `false` or a negative number causes no delay to be used.

**Returns**

No returned value.

#### onStoreRegistered(storeName, callback) {#onstoreregistered-storename-callback}

Registers a callback function that is called when a session store is registered. The register event occurs when a store is registered to [CQ_Analytics.ClientContextMgr](#cq-analytics-clientcontextmgr).

**Parameters**

* storeName: String. The name of the session store to add the listener.
* callback: Function. The function to call upon store initialization.

**Returns**

No returned value.

## CQ_Analytics.JSONPStore {#cq-analytics-jsonpstore}

A non-persisted session store that contains JSON data. The data is retrieved from an external JSONP service. Use the `getInstance` or `getRegisteredInstance` method to create an instance of this class.

Extends CQ_Analytics.JSONStore.

### Properties {#properties}

See CQ_Analytics.JSONStore and CQ_Analytics.SessonStore for inherited properties.

### Methods {#methods-2}

Also see CQ_Analytics.JSONStore and CQ_Analytics.SessonStore for inherited methods.

#### getInstance(storeName, serviceURL, dynamicData, deferLoading, loadingCallback) {#getinstance-storename-serviceurl-dynamicdata-deferloading-loadingcallback}

Creates a CQ_Analytics.JSONPStore object.

**Parameters**

* storeName: String. The name to use as the STORENAME property. The value of the STOREKEY property is set to storeName with all upper-case characters. If no storeName is provided, the method returns null.
* serviceURL: String. The URL of the JSONP service
* dynamicData: (Optional) Object. JSON data to append to the store's initialization data before the callback function is called.
* deferLoading: (Optional) Boolean. A value of true prevents the JSONP service from being called upon object creation. A value of false causes the JSONP service to be called.
* loadingCallback: (Optional) String. The name of the function to call for processing the JSONP object that the JSONP service returns. The callback function must define a single parameter that is a CQ_Analytics.JSONPStore object.

**Returns**

The new CQ_Analytics.JSONPStore object, or null if storeName is null.

#### getServiceURL() {#getserviceurl}

Retrieves the URL of the JSONP service that this object uses to retrieve JSON data.

**Parameters**

None.

**Returns**

A String that represents the service URL, or null if no service URL has been configured.

#### load(serviceURL, dynamicData, callback) {#load-serviceurl-dynamicdata-callback}

Calls the JSONP service. The JSONP URL is the service URL suffixed with a give callback function name.

**Parameters**

* serviceURL: (Optional) String. The JSONP service to call. A value of null causes the already-configured service URL to be used. A non-null value sets the JSONP service to use for this object. (See setServiceURL.)
* dynamicData: (Optional) Object. JSON data to append to the store's initialization data before the callback function is called.
* callback: (Optional) String. The name of the function to call for processing the JSONP object that the JSONP service returns. The callback function must define a single parameter that is a CQ_Analytics.JSONPStore object.

**Returns**

No returned value.

#### registerNewInstance(storeName, serviceURL, dynamicData, callback) {#registernewinstance-storename-serviceurl-dynamicdata-callback}

Creates a CQ_Analytics.JSONPStore object and registers the store with Client Context.

**Parameters**

* storeName: String. The name to use as the STORENAME property. The value of the STOREKEY property is set to storeName with all upper-case characters. If no storeName is provided, the method returns null.
* serviceURL: (Optional) String. The URL of the JSONP service.
* dynamicData: (Optional) Object. JSON data to append to the store's initialization data before the callback function is called.
* callback: (Optional) String. The name of the function to call for processing the JSONP object that the JSONP service returns. The callback function must define a single parameter that is a CQ_Analytics.JSONPStore object.

**Returns**

The registered CQ_Analytics.JSONPStore object.

#### setServiceURL(serviceURL) {#setserviceurl-serviceurl}

Sets the URL of the JSONP service to use for retrieving JSON data.

**Parameters**

* serviceURL: String. The URL of the JSONP service that provides JSON data

**Returns**

No returned value.

## CQ_Analytics.JSONStore {#cq-analytics-jsonstore}

A container for a JSON object. Create an instance of this class to create a non-persisted session store that contains JSON data:

`myjsonstore = new CQ_Analytics.JSONStore`

You can define a set of data that populates the store upon initialization.

Extends CQ_Analytics.SessionStore.

### Properties {#properties-1}

#### STOREKEY {#storekey}

The key that identifies the store. Use the `getInstance` method to retrieve this value.

#### STORENAME {#storename}

The name of the store. Use the `getInstance` method to retrieve this value.

### Methods {#methods-3}

Also see CQ_Analytics.SessionStore for inherited methods.

#### clear() {#clear}

Removes the session store data and removes all initialization properties.

**Parameters**

None.

**Returns**

No returned value.

#### getInstance(storeName, jsonData) {#getinstance-storename-jsondata}

Creates a CQ_Analytics.JSONStore object with a given name and initialized with the given JSON data (calls the initJSON method).

**Parameters**

* storeName: String. The name to use as the STORENAME property. The value of the STOREKEY property is set to storeName with all upper-case characters.
* jsonData: Object. An object that contains JSON data.

**Returns**

The CQ_Analytics.JSONStore object.

#### getJSON() {#getjson}

Retrieves the data of the session store in JSON format.

**Parameters**

None.

**Returns**

An object that represents the store data in JSON format.

#### init() {#init}

Clears the session store and initializes it with the initialization property. Sets the initialization flag to `true` and then fires the `initialize` and `update` events.

**Parameters**

None.

**Returns**

No returned data.

#### initJSON(jsonData, doNotClear) {#initjson-jsondata-donotclear}

Creates initialization properties from the data in a JSON object. You can optionally remove all existing initialization properties.

The names of the properties are derived from the hierarchy of the data in the JSON object. The following example code represents a JSON object:

```xml
{
A: "valueA",
B: {
     B1: "valueBB1"
    }
}
```

For this example, the following properties are created in the store:

```xml
A: "valueA"
B/B1: "valueBB1"
```

**Parameters**

* jsonData: A JSON object that contains the data to store.
* doNotClear: A value of true preserves the existing initialization properties and adds those derived from the JSON object. A value of false removes existing initialization properties before adding those derived from the JSON object.

**Returns**

No returned value.

#### registerNewInstance(storeName, jsonData) {#registernewinstance-storename-jsondata}

Creates a CQ_Analytics.JSONStore object with a given name and initialized with the given JSON data (calls the initJSON method). The new object is automatically registered with the Clickstream Cloud Manager.

**Parameters**

* storeName: String. The name to use as the STORENAME property. The value of the STOREKEY property is set to storeName with all upper-case characters.
* jsonData: Object. An object that contains JSON data.

**Returns**

The CQ_Analytics.JSONStore object.

## CQ_Analytics.Observable {#cq-analytics-observable}

Fires events and allows other objects to listen to these events and react. Classes that extend this class can fire events that cause listeners to be called.

### Methods {#methods-4}

#### addListener(event, fct, scope) {#addlistener-event-fct-scope}

Registers a listener for an event. See also [Creating a Listener to React to a Session Store Update](/help/sites-developing/client-context.md#creating-a-listener-to-react-to-a-session-store-update).

**Parameters**

* event: String. The name of the event to listen for.
* fct: Function. The function that is called when the event occurs.
* scope: (Optional) Object. The scope in which to execute the handler function. The handler function's "this" context.

**Returns**

No returned value.

#### removeListener(event, fct) {#removelistener-event-fct}

Removes the given event handler for an event.

**Parameters**

* event: String. The name of the event.
* fct: Function. The event handler.

**Returns**

No returned value.

## CQ_Analyics.PersistedJSONPStore {#cq-analyics-persistedjsonpstore}

A persisted container of a JSON object retrieved from a remote JSONP service.

Extends CQ_Analytics.PersistedJSONStore.

### Methods {#methods-5}

Also see CQ_Analytics.PersistedJSONStore for inherited methods.

#### getInstance(storeName, serviceURL, dynamicData, deferLoading, loadingCallback) {#getinstance-storename-serviceurl-dynamicdata-deferloading-loadingcallback-1}

Creates a CQ_Analytics.PersistedJSONPStore object.

**Parameters**

* storeName: String. The name to use as the STORENAME property. The value of the STOREKEY property is set to storeName with all upper-case characters. If no storeName is provided, the method returns null.
* serviceURL: String. The URL of the JSONP service
* dynamicData: (Optional) Object. JSON data to append to the store's initialization data before the callback function is called.
* deferLoading: (Optional) Boolean. A value of true prevents the JSONP service from being called upon object creation. A value of false causes the JSONP service to be called.
* loadingCallback: (Optional) String. The name of the function to call for processing the JSONP object that the JSONP service returns. The callback function must define a single parameter that is a CQ_Analytics.JSONPStore object.

**Returns**

The new CQ_Analytics.PersistedJSONPStore object, or null if storeName is null.

#### getServiceURL() {#getserviceurl-1}

Retrieves the URL of the JSONP service that this object uses to retrieve JSON data.

**Parameters**

None.

**Returns**

A String that represents the service URL, or null if no service URL has been configured.

#### load(serviceURL, dynamicData, callback) {#load-serviceurl-dynamicdata-callback-1}

Calls the JSONP service. The JSONP URL is the service URL suffixed with a give callback function name.

**Parameters**

* serviceURL: (Optional) String. The JSONP service to call. A value of null causes the already-configured service URL to be used. A non-null value sets the JSONP service to use for this object. (See setServiceURL.)
* dynamicData: (Optional) Object. JSON data to append to the store's initialization data before the callback function is called.
* callback: (Optional) String. The name of the function to call for processing the JSONP object that the JSONP service returns. The callback function must define a single parameter that is a CQ_Analytics.JSONPStore object.

**Returns**

No returned value.

#### registerNewInstance(storeName, serviceURL, dynamicData, callback) {#registernewinstance-storename-serviceurl-dynamicdata-callback-1}

Creates a CQ_Analytics.PersistedJSONPStore object and registers the store with Client Context.

**Parameters**

* storeName: String. The name to use as the STORENAME property. The value of the STOREKEY property is set to storeName with all upper-case characters. If no storeName is provided, the method returns null.
* serviceURL: (Optional) String. The URL of the JSONP service.
* dynamicData: (Optional) Object. JSON data to append to the store's initialization data before the callback function is called.
* callback: (Optional) String. The name of the function to call for processing the JSONP object that the JSONP service returns. The callback function must define a single parameter that is a CQ_Analytics.JSONPStore object.

**Returns**

The registered CQ_Analytics.PersistedJSONPStore object.

#### setServiceURL(serviceURL) {#setserviceurl-serviceurl-1}

Sets the URL of the JSONP service to use for retrieving JSON data.

**Parameters**

* serviceURL: String. The URL of the JSONP service that provides JSON data

**Returns**

No returned value.

## CQ_Analytics.PersistedJSONStore {#cq-analytics-persistedjsonstore}

A persisted container of a JSON object.

Extends `CQ_Analytics.PersistedSessionStore`.

### Properties {#properties-2}

#### STOREKEY {#storekey-1}

The key that identifies the store. Use the `getInstance` method to retrieve this value.

#### STORENAME {#storename-1}

The name of the store. Use the `getInstance` method to retrieve this value.

### Methods {#methods-6}

Also see CQ_Analytics.PersistedSessionStore for inherited methods.

#### getInstance(storeName, jsonData) {#getinstance-storename-jsondata-1}

Creates a CQ_Analytics.PersistedJSONStore object with a given name and initialized with the given JSON data (calls the initJSON method).

**Parameters**

* storeName: String. The name to use as the STORENAME property. The value of the STOREKEY property is set to storeName with all upper-case characters.
* jsonData: Object. An object that contains JSON data.

**Returns**

The CQ_Analytics.PersistedJSONStore object.

#### getJSON() {#getjson-1}

Retrieves the data of the session store in JSON format.

**Parameters**

None.

**Returns**

An object that represents the store data in JSON format.

#### initJSON(jsonData, doNotClear) {#initjson-jsondata-donotclear-1}

Creates initialization properties from the data in a JSON object. You can optionally remove all existing initialization properties.

The names of the properties are derived from the hierarchy of the data in the JSON object. The following example code represents a JSON object:

```xml
{
A: "valueA",
B: {
     B1: "valueBB1"
    }
}
```

For this example, the following properties are created in the store:

```xml
A: "valueA"
B/B1: "valueBB1"
```

**Parameters**

* jsonData: A JSON object that contains the data to store.
* doNotClear: A value of true preserves the existing initialization properties and adds those derived from the JSON object. A value of false removes existing initialization properties before adding those derived from the JSON object.

**Returns**

No returned value.

#### registerNewInstance(storeName, jsonData) {#registernewinstance-storename-jsondata-1}

Creates a CQ_Analytics.PersistedJSONStore object with a given name and initialized with the given JSON data (calls the initJSON method). The new object is automatically registered with the Client Context Manager.

**Parameters**

* storeName: String. The name to use as the STORENAME property. The value of the STOREKEY property is set to storeName with all upper-case characters.
* jsonData: Object. An object that contains JSON data.

**Returns**

The CQ_Analytics.PersistedJSONStore object.

## CQ_Analytics.PersistedSessionStore {#cq-analytics-persistedsessionstore}

A container of properties and values. The data is persisted using CQ_Analytics.SessionPersistence. Create an instance of this class to create a persisted session store:

`mypersistedstore = new CQ_Analytics.PersistedSessionStore`

Extends CQ_Analytics.SessionStore.

### Properties {#properties-3}

#### STOREKEY {#storekey-2}

Default value is `key`.

### Methods {#methods-7}

See CQ_Analytics.SessionStore for inherited methods.

When the inherited methods `clear`, `setProperty`, `setProperties`, `removeProperty` are used to change the store data, the changes are automatically persisted, unless the changed properties are flagged as notPersisted.

#### getStoreKey() {#getstorekey}

Retrieves the `STOREKEY` property.

**Parameters**

None

**Returns**

The value of the `STOREKEY` property.

#### isPersisted(name) {#ispersisted-name}

Determines whether a data property is persisted.

**Parameters**

* name: String. The name of the property.

**Returns**

A Boolean value of `true` if the property is persisted, and a value of `false` if the value is not a persisted property.

#### persist() {#persist}

Persists the session store. The default persistence mode uses browser `localStorage` using `ClientSidePersistence` as the name ( `window.localStorage.set("ClientSidePersistance", store);`)

If localStorage is not available or writeable, then the store is persisted as a property of the window.

Fires the `persist` event upon completion.

**Parameters**

None

**Returns**

No returned value.

#### reset(deferEvent) {#reset-deferevent}

Removes all data properties from the store and persists the store. Optionally does not fire the `udpate` event upon completion.

**Parameters**

* deferEvent: A value of true prevents the `update` event from being fired. A value of `false` causes the update event to fire.

**Returns**

No returned value.

#### setNonPersisted(name) {#setnonpersisted-name}

Flags a data property as not persisted.

**Parameters**

* name: String. The name of the property that is not to be persisted.

**Returns**

No return value.

## CQ_Analytics.SessionStore {#cq-analytics-sessionstore}

CQ_Analytics.SessionStore represents a session store. Create an instance of this class to create a session store:

`mystore = new CQ_Analytics.SessionStore`

Extends CQ_Analytics.Observable.

### Properties {#properties-4}

#### STORENAME {#storename-2}

The name of the session store. Use getName to retrieve the value of this property.

### Methods {#methods-8}

#### addInitProperty(name, value) {#addinitproperty-name-value}

Adds a property and value to the session store initialization data.

Use loadInitProperties to populate the session store data with the initialization values.

**Parameters**

* name: String. The name of the property to add.
* value: String. The value of the property to add.

**Returns**

No returned value.

#### clear() {#clear-1}

Removes all data properties from the store.

**Parameters**

None.

**Returns**

No return value.

#### getData(excluded) {#getdata-excluded}

Returns the store data. Optionally, excludes name properties from the data. Calls the `init` method if the data property of the store does not exist.

**Parameters**

excluded: (Optional) An array of property names to exclude from the returned data.

**Returns**

An object of properties and their values.

#### getInitProperty(name) {#getinitproperty-name}

Retrieves the value of a data property.

**Parameters**

* name: String. The name of the data property to retrieve.

**Returns**

The value of the data property. Returnes `null` if the session store contains no property of the given name.

#### getName() {#getname}

Returns the name of the session store.

**Parameters**

None.

**Returns**

A String value that represents the store name.

#### getProperty(name, raw) {#getproperty-name-raw}

Returns the value of a property. The value is returned as the raw property or the XSS-filtered value. Calls the `init` method if the data property of the store does not exist.

**Parameters**

* name: String. The name of the data property to retrieve.
* raw: Boolean. A value of true causes the raw property value to be returned. A value of false causes the returned value to be XSS-filtered.

**Returns**

The value of the data property.

#### getPropertyNames(excluded) {#getpropertynames-excluded}

Returns the names of the properties that the session store contains. Calls the `init` method if the data property of the store does not exist.

**Parameters**

excluded: (Optional) An array of property names to omit from the results.

**Returns**

An array of String values that represent the session property names.

#### getSessionStore() {#getsessionstore}

Returns the session store attached to the current object.

**Parameters**

None.

**Returns**

this

#### init() {#init-1}

Marks the store as initialized and fires the `initialize` event.

**Parameters**

None.

**Returns**

No returned value.

#### isInitialized() {#isinitialized}

Indicates whether the sessions store is initialized.

**Parameters**

None.

**Returns**

A value of `true` if the store is initialized, and a value of `false` if the store is not initialized.

#### loadInitProperties(obj, setValues) {#loadinitproperties-obj-setvalues}

Adds the properties of a given object to the intialization data of the session store. Optionally, the object data is also added to the store data.

**Parameters**

* obj: An object that contains enumerable propertes.
* setValues: When true, the obj properties are added to the session store data if the store data does not already include a property of the same name. When false, no data is added to the session store data.

**Returns**

No returned value.

#### removeProperty(name) {#removeproperty-name}

Removes a property from the session store. Fires the `update` event upon completion. Calls the `init` method if the data property of the store does not exist.

**Parameters**

* name: String. The name of the property to remove.

**Returns**

No returned value.

#### reset() {#reset}

Restores the initial values of the data store. The default implementation simply removes all data. Fires the `update` event upon completion.

**Parameters**

None.

**Returns**

No returned value.

#### setProperties(properties) {#setproperties-properties}

Sets the values of multiple properties. Fires the `update` event upon completion. Calls the `init` method if the data property of the store does not exist.

**Parameters**

* Properties: Object. An object that contains enumerable properties. Each property name and value is added to the store.

**Returns**

No returned value.

#### setProperty(name, value) {#setproperty-name-value}

Sets the value of a property. Fires the `update` event upon completion. Calls the `init` method if the data property of the store does not exist.

**Parameters**

* name: String. The name of the property.
* value: String. Property value.

**Returns**

No returned value.

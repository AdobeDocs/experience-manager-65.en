---
title: Extending Event Tracking

description: AEM Analytics lets you track user interaction on your website


contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: extending-aem
content-type: reference

exl-id: a71d20e6-0321-4afb-95fe-6de8b7b37245
solution: Experience Manager, Experience Manager Sites
feature: Integration
role: Developer
---
# Extending Event Tracking{#extending-event-tracking}

AEM Analytics lets you track user interaction on your website. As a developer you may need to:

* Track how visitors are interacting with your components. This can be done with [Custom events.](#custom-events)
* [Access values in the ContextHub](/help/sites-developing/extending-analytics.md#accessing-values-in-the-contexthub).
* [Add record callbacks](#adding-record-callbacks).

>[!NOTE]
>
>This information is basically generic, but it uses [Adobe Analytics](/help/sites-administering/adobeanalytics.md) for specific examples.
>
>For general information on developing components and dialog boxes, see [Developing Components](/help/sites-developing/components.md).

## Custom Events {#custom-events}

Custom events track anything that is dependent on the availability of a specific component on the page. This also includes events that are template-specific, as the page-component is treated as another component.

### Tracking Custom Events On Page Load {#tracking-custom-events-on-page-load}

This can be done using the pseudo-attribute `data-tracking` (the older record attribute is still supported for backwards compatibility). You can add this to any HTML tag.

The syntax for `data-tracking` is

* `data-tracking="{'event': ['eventName'], 'values': {'key': 'value', 'nextKey': 'nextValue'}, componentPath: 'myapp/component/mycomponent'}"`

You can pass any number of key-value pairs as the second parameter, which is called payload.

An example might look like:

```xml
<span data-tracking="{event:'blogEntryView',
                                values:{
                                   'blogEntryContentType': 'blog',
                                   'blogEntryUniqueID': '<%= xssAPI.encodeForJSString(entry.getId()) %>',
                                   'blogEntryTitle': '<%= xssAPI.encodeForJSString(entry.getTitle()) %>',
                                   'blogEntryAuthor':'<%= xssAPI.encodeForJSString(entry.getAuthor()) %>',
                                   'blogEntryPageLanguage':'<%= currentPage.getLanguage(true) %>'
                                },
                                componentPath:'myapp/component/mycomponent'}">
</span>
```

At page load, all `data-tracking` attributes will be collected and added to the event store of the ContextHub, where they can be mapped to Adobe Analytics events. Events that are not mapped will not be tracked by Adobe Analytics. See [Connecting to Adobe Analytics](/help/sites-administering/adobeanalytics.md) for more details about mapping events.

### Tracking Custom Events After Page Load {#tracking-custom-events-after-page-load}

To track events that occur after a page is loaded (such as user interactions), use the `CQ_Analytics.record` JavaScript function:

* `CQ_Analytics.record({event: 'eventName', values: { valueName: 'VALUE' }, collect: false, options: { obj: this, defaultLinkType: 'X' }, componentPath: '<%=resource.getResourceType()%>'})`

Where

* `events` is either a string or a string array (for multiple events).

* `values` contains all the values to be tracked
* `collect` is optional and will return an array containg the event and data object.
* `options` is optional and contains link tracking options like HTML element `obj` and ` [defaultLinkType](https://microsite.omniture.com/t2/help/en_US/sc/implement/index.html#linkType)`.

* `componentPath` is a necessary attribute and it is recommended to set it to `<%=resource.getResourceType()%>`

For example, with the following definition, a user clicking the **Jump to top** link will cause the two events, `jumptop` and `headlineclick`, to be fired:

```xml
<h1 data-tracking="{event: 'headline', values: {level:'1'}, componentPath: '<%=resource.getResourceType()%>'}">
  My Headline <a href="#" onclick="CQ_Analytics.record({event: ['jumptop','headlineclick'],  values: {level:'1'}, componentPath: '<%=resource.getResourceType()%>'})">Jump to top</a>
</h1>
```

## Accessing Values in the ContextHub {#accessing-values-in-the-contexthub}

The ContextHub JavaScript API has a `getStore(name)` function that returns the specified store, if available. The store has a `getItem(key)` function that returns the value of the specified key, if available. Using the `getKeys()` function it is possible to retrieve an array of defined keys for the specific store.

You can be notified of value changes on a store by binding a function using the `ContextHub.getStore(name).eventing.on(ContextHub.Constants.EVENT_STORE_UPDATED, handler, selector, triggerForPastEvents)` function.

The best way to be notified of initial availability of the ContextHub is to use the `ContextHub.eventing.on(ContextHub.Constants.EVENT_ALL_STORES_READY, handler, selector, triggerForPastEvents);` function.

**Additional events for ContextHub:**

All stores ready:

`ContextHub.eventing.on(ContextHub.Constants.EVENT_ALL_STORES_READY, handler, selector, triggerForPastEvents);`

Store specific:

`ContextHub.getStore(store).eventing.on(ContextHub.Constants.EVENT_STORE_READY, handler, selector, triggerForPastEvents)`

>[!NOTE]
>
>Also see the complete [ContextHub API Reference](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/contexthub-api.html#ContextHubJavascriptAPIReference)

## Adding Record Callbacks {#adding-record-callbacks}

Before and after callbacks are registered using the functions `CQ_Analytics.registerBeforeCallback(callback,rank)` and `CQ_Analytics.registerAfterCallback(callback,rank)`.

Both functions take a function as the first argument and a rank as the second argument, which dictates the order that callbacks are executed.

If your callback returns false, the callbacks following in the execution chain will not be executed.

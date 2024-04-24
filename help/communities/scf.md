---
title: Social Component Framework
description: The social component framework (SCF) simplifies the process of configuring, customizing, and extending Communities components
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: 5ca58bc3-8505-4d91-9cd1-6b2e2671f1be
solution: Experience Manager
feature: Communities
role: Admin
---
# Social Component Framework {#social-component-framework}

The social component framework (SCF) simplifies the process of configuring, customizing, and extending Communities components on both server-side and client-side.

The benefits of the framework:

* **Functional**: Out-of-the-box ease of integration with little or no customization for 80% of use cases.
* **Skinnable**: Consistent use of HTML attributes for CSS styling.
* **Extensible**: Component implementation is object-oriented and light on business logic - easy to add incremental business login on server.
* **Flexible**: Simple logic-less JavaScript templates that are easily overlaid and customized.
* **Accessible**: The HTTP API supports posting from any client, including mobile apps.
* **Portable**: Integrate/embed into any webpage built on any technology.

Explore on an author or publish instance using the interactive [Community Components guide](components-guide.md).

## Overview {#overview}

In SCF, a component is composed of a SocialComponent POJO, a Handlebars JS Template (to render the component), and CSS (to style the component).

A Handlebars JS Template may extend the model/view JS components to handle user interaction with the component on the client.

If a component must support modification of data, the implementation of the SocialComponent API can be written to support edit/save of data similar to model/data objects in traditional web applications. In addition, operations (controllers) and an operation service may be added to handle operation requests, perform business logic, and invoke the APIs on the model/data objects.

The SocialComponent API may be extended to provide data required by a client for a view layer or an HTTP client.

### How Pages are Rendered for Client {#how-pages-are-rendered-for-client}

![scf-page-rendering](assets/scf-overview.png)

### Component Customization and Extension {#component-customization-and-extension}

To customize or extend the components, you write only the overlays and extensions to your /apps directory which simplifies the process of upgrading to future releases.

* For Skinning:
  * Only the [CSS needs editing](client-customize.md#skinning-css).
* For Look and Feel:
  * Change the JS Template and CSS.
* For Look, Feel and UX:
  * Change the JS Template, CSS, and [extend/override JavaScript](client-customize.md#extending-javascript).
* To modify the information available to the JS Template or to the GET endpoint:
  * Extend the [SocialComponent](server-customize.md#socialcomponent-interface).
* To add custom processing during operations:
  * Write an [OperationExtension](server-customize.md#operationextension-class).
* To add a custom operation:
  * Create a [Sling Post Operation](server-customize.md#postoperation-class).
  * Use existing [OperationServices](server-customize.md#operationservice-class) as needed.
  * Add JavaScript code to invoke your operation from the client side as needed.

## Server-Side Framework {#server-side-framework}

The framework provides APIs to access functionality on the server and support interaction between the client and server.

### Java&trade; APIs {#java-apis}

The Java&trade; APIs provide abstract classes and interfaces which are easily inherited or subclassed.

The main classes are described on the [Server-side Customization](server-customize.md) page.

Visit [Storage Resource Provider Overview](srp.md) to learn about working with UGC.

### HTTP API {#http-api}

The HTTP API supports ease of customization and choice of client platforms for PhoneGap apps, native apps, and other integrations and mashups. Further, the HTTP API allows a community site to run as a service without a client, such that framework components can be integrated into any webpage built on any technology.

### HTTP API - GET Requests {#http-api-get-requests}

For every SocialComponent, the framework provides an HTTP-based API endpoint. The endpoint is accessed by sending a GET request to the resource with a '.social.json' selector + extension. Using Sling, the request is handed to the `DefaultSocialGetServlet`.

**`DefaultSocialGetServlet`** 

1. Passes the resource (resourceType) to the `SocialComponentFactoryManager` and receives a SocialComponentFactory capable of selecting a `SocialComponent` representing the resource.

1. Invokes the factory and receives a `SocialComponent` capable of handling the resource and request.
1. Invokes the `SocialComponent`, which process the request and returns a JSON representation of the results.
1. Returns the JSON response to the client.

**`GET Request`**

A default GET servlet listens to .social.json requests to which the SocialComponent responds with customizable JSON.

![scf-framework](assets/scf-framework.png)

### HTTP API - POST Requests {#http-api-post-requests}

In addition to the GET (Read) operations, the framework defines an endpoint pattern to enable other operations on a component, including Create, Update, and Delete. These endpoints are HTTP APIs that accept input and respond with either an HTTP status code or with a JSON response object.

This framework endpoint pattern makes CUD operations extensible, reusable, and testable.

**`POST Request`**

There is a Sling POST:operation for every SocialComponent operation. The business logic and maintenance code for each operation are wrapped in an OperationService which is accessible through the HTTP API or from elsewhere as an OSGi service. Hooks are provided supporting pluggable operation extensions for before/after actions.

![scf-post-request](assets/scf-post-request.png)

### Storage Resource Provider (SRP) {#storage-resource-provider-srp}

To learn about handling UGC stored in the [community content store](working-with-srp.md), see:

* [Storage Resource Provider Overview](srp.md) - Introduction and repository usage overview.
* [SRP and UGC Essentials](srp-and-ugc.md) - SRP API utility methods and examples.
* [Accessing UGC with SRP](accessing-ugc-with-srp.md) - Coding guidelines.

### Server-side Customizations {#server-side-customizations}

Visit [Server-Side Customizations](server-customize.md) for information on customizing the business logic and behavior of a Communities component on the server-side.

## Handlebars JS Templating Language {#handlebars-js-templating-language}

One of the more noticeable changes in the new framework is the use of the `Handlebars JS` (HBS)templating language, a popular open-source technology for server-client rendering.

HBS scripts are simple, logic-less, compile on both server and client, are easy to overlay and customize, and naturally bind with the client UX because HBS supports client-side rendering.

The framework provides several [Handlebars helpers](handlebars-helpers.md) that are useful when developing SocialComponents.

On the server, when Sling resolves a GET request, it identifies the script that is used to respond to the request. If the script is an HBS template (.hbs), Sling will delegate the request to the Handlebars Engine. The Handlebars Engine will then get the SocialComponent from the appropriate SocialComponentFactory, build a context, and render the HTML.

### No Access Restriction {#no-access-restriction}

Handlebars (HBS) template files (.hbs) are analogous to .jsp and .html template files, except they may be used for rendering both in the client browser and on the server. Therefore, a client browser requesting a client-side template receives an .hbs file from the server.

This requires that all HBS templates in the sling search path (any .hbs files under /libs/ or /apps) can be fetched by any user from author or publish.

HTTP access to .hbs files may not be prohibited.

### Add or Include a Communities Component {#add-or-include-a-communities-component}

Most Communities components must be *added* as a Sling addressable resource. A select few of the Communities components may be *included* in a template as a non-existing resource to allow for dynamic inclusion and customization of the location at which to write user-generated content (UGC).

In either case, the component's [required client libraries](clientlibs.md) must also be present.

**Add a Component**

Adding a component refers to the process of adding an instance of a resource (component), such as when dragged from the component browser (sidekick) onto a page in author edit mode.

The result is a JCR child node under a par node, which is Sling addressable.

**Include a Component**

Including a component refers to the process of adding a reference to a ["non-existing" resource](srp.md#for-non-existing-resources-ners) (no JCR node) within the template, such as using a scripting language.

As of Adobe Experience Manager (AEM) 6.1, when a component is dynamically included instead of added, it is possible to edit the component's properties in author *design* mode.

Only a select few of the AEM Communities components may be dynamically included. They are:

* [Comments](essentials-comments.md)
* [Rating](rating-basics.md)
* [Reviews](reviews-basics.md)
* [Voting](essentials-voting.md)

The [Community Components Guide](components-guide.md) allows includible components to be toggled from being added to being included.

**When using Handlebars** templating language, the non-existing resource is included using the [include helper](handlebars-helpers.md#include) by specifying its resourceType:

`{{include this.id path="comments" resourceType="social/commons/components/hbs/comments"}}`

**When using JSP**, a resource is included using the tag [cq:include](../../help/sites-developing/taglib.md#lt-cq-include):

```
<cq:include path="votes"
 resourceType="social/tally/components/voting" />

```

>[!NOTE]
>
>To add a component to a page dynamically, instead of adding or including it in a template, see [Component Sideloading](sideloading.md).

### Handlebars Helpers {#handlebars-helpers}

See [SCF Handlebars Helpers](handlebars-helpers.md) for a list and description of custom helpers available in SCF.

## Client-Side Framework {#client-side-framework}

### Model-View JavaScript Framework {#model-view-javascript-framework}

The framework includes an extension of [Backbone.js](https://backbonejs.org/), a model-view JavaScript framework, to facilitate development of rich, interactive components. The object-oriented nature supports an extensible/reusable framework. Communication between client and server is simplified with the HTTP API.

The framework uses server-side Handlebars templates to render the components for the client. The models are based on the JSON responses generated by the HTTP API. The views bind themselves to HTML generated by the Handlebars templates and provide interactivity.

### CSS Conventions {#css-conventions}

The following are recommended conventions for defining and using CSS classes:

* Use clearly namespaced CSS class selector names and avoid generic names such as 'heading', and 'image'.
* Define specific class selector styles so the CSS style sheets work well with other elements and styles on the page. For example: `.social-forum .topic-list .li { color: blue; }`
* Keep CSS classes for styling separate from CSS classes for UX driven by JavaScript.

### Client-Side Customizations {#client-side-customizations}

For customizing the appearance and behavior of a Communities component on the client-side, reference [Client-Side Customizations](client-customize.md), which includes information on:

* [Overlays](client-customize.md#overlays)
* [Extensions](client-customize.md#extensions)
* [HTML Markup](client-customize.md#htmlmarkup)
* [Skinning CSS](client-customize.md#skinning-css)
* [Extending JavaScript](client-customize.md#extending-javascript)
* [Clientlibs for SCF](client-customize.md#clientlibs-for-scf)

## Feature and Component Essentials {#feature-and-component-essentials}

Essential information for developers is described in the [Feature and Component Essentials](essentials.md) section.

Additional developer information may be found in the [Coding Guidelines](code-guide.md) section.

## Troubleshooting {#troubleshooting}

Common concerns and known issues are described in the [Troubleshooting](troubleshooting.md) section.

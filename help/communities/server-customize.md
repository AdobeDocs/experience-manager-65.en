---
title: Server-side Customization
description: Learn how server-side customization in Adobe Experience Manager Communities.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: 190735bc-1909-4b92-ba4f-a221c0cd5be7
solution: Experience Manager
feature: Communities
role: Admin
---
# Server-side Customization {#server-side-customization}

| **[⇐ Feature Essentials](essentials.md)** |**[Client-side Customization ⇒](client-customize.md)** |
|---|---|
|   |**[SCF Handlebars Helpers ⇒](handlebars-helpers.md)** |

## Java&trade; APIs {#java-apis}

>[!NOTE]
>
>The package location of Communities APIs is subject to change when upgrading from one major release to the next.

### SocialComponent Interface {#socialcomponent-interface}

SocialComponents are POJOs that represent a resource for an AEM Communities feature. Ideally, each SocialComponent represents a specific resourceType with exposed GETters that provide data to the client so the resource is accurately represented. All business and view logic is encapsulated in the SocialComponent, including the site visitor's session information, if necessary.

The interface defines a basic set of GETters that are necessary to represent a resource. Importantly, the interface stipulates Map&lt;String, Object&gt; getAsMap() and String toJSONString() methods that are necessary to render Handlebars templates and expose GET JSON endpoints for resources.

All SocialComponent classes must implement the interface `com.adobe.cq.social.scf.SocialComponent`

### SocialCollectionComponent Interface {#socialcollectioncomponent-interface}

The SocialCollectionComponent interface extends the SocialComponent interface to better represent resources that are collections of other resources.

All SocialCollectionComponent classes must implement the interface com.adobe.cq.social.scf.SocialCollectionComponent

### SocialComponentFactory Interface {#socialcomponentfactory-interface}

A SocialComponentFactory (factory) registers a SocialComponent with the framework. The factory provides a means of letting the framework know what SocialComponents are available for a given resourceType and their priority ranking when multiple SocialComponents are identified.

A SocialComponentFactory is responsible for creating an instance of the selected SocialComponent making it possible to inject all dependencies needed by the SocialComponent from the factory using DI practices.

A SocialComponentFactory is an OSGi service and has access to other OSGi services which can be passed to the SocialComponent through a constructor.

All SocialComponentFactory classes must implement the interface `com.adobe.cq.social.scf.SocialComponentFactory`

An implementation of SocialComponentFactory.getPriority() method should return the highest value for the factory to be used for the given resourceType as returned by getResourceType().

### SocialComponentFactoryManager Interface {#socialcomponentfactorymanager-interface}

The SocialComponentFactoryManager (manager) manages all SocialComponents registered with the framework and is responsible for selecting the SocialComponentFactory to use for a given resource (resourceType). If no factories are registered for a specific resourceType, the manager returns a factory with the nearest super type for the given resource.

A SocialComponentFactoryManager is an OSGi service and has access to other OSGi services which can be passed to the SocialComponent through a constructor.

A handle to the OSGi service is obtained by invoking `com.adobe.cq.social.scf.SocialComponentFactoryManager`

### HTTP API - POST Requests {#http-api-post-requests}

#### PostOperation Class {#postoperation-class}

The HTTP API POST endpoints are PostOperation classes defined by implementing the `SlingPostOperation` interface (package `org.apache.sling.servlets.post`).

The `PostOperation` endpoint implementation sets `sling.post.operation` to a value to which the operation responds. All POST requests with an:operation parameter set to that value is delegated to this implementation class.

The `PostOperation` invokes the `SocialOperation` which performs the actions necessary for the operation.

The `PostOperation` receives the result from the `SocialOperation` and returns the appropriate response to the client.

#### SocialOperation Class {#socialoperation-class}

Each `SocialOperation` endpoint extends the AbstractSocialOperation class and overrides the method `performOperation()`. This method performs all actions needed to complete the operation and return a `SocialOperationResult` or else throw an `OperationException`. In such case, an HTTP error status with a message, if available, is returned in place of the normal JSON response or success HTTP status code.

Extending `AbstractSocialOperation` makes possible the reuse of `SocialComponents` to send JSON responses.

#### SocialOperationResult Class {#socialoperationresult-class}

The `SocialOperationResult` class is returned as the result of the `SocialOperation` and is composed of a `SocialComponent`, HTTP status code, and HTTP status message.

The `SocialComponent` represents the resource that was affected by the operation.

For a Create operation, the `SocialComponent` included in the `SocialOperationResult` represents the resource created and for an Update operation, it represents the resource that was altered by the operation. No `SocialComponent` is returned for a Delete operation.

The success HTTP status codes used are:

* 201 for Create operations
* 200 for Update operations
* 204 for Delete operations

#### OperationException Class {#operationexception-class}

An `OperationExcepton` is thrown when performing an operation if the request is not valid or some other error occurs. For example, internal errors, bad parameter values, or improper permissions. An `OperationException` is composed of an HTTP status code and an error message, which are returned to the client as the response to the `PostOperatoin`.

#### OperationService Class {#operationservice-class}

The social component framework recommends that the business logic responsible for performing the operation not be implemented within the `SocialOperation` class, but instead delegated to an OSGi service. Using an OSGi service for business logic allows a `SocialComponent`, acted upon by a `SocialOperation` endpoint, to be integrated with other code and have different business logic applied.

All `OperationService` classes extend `AbstractOperationService`, allowing additional extensions which can hook into the operation being performed. Each operation in the service is represented by a `SocialOperation` class. The `OperationExtensions` class can be invoked during operation execution by calling the methods

* `performBeforeActions()`
  
  Allows for pre-checks/pre-processing and validations
* `performAfterActions()`
  
  Allows for further editing of resources or invoking custom events, workflows, and so on.

#### OperationExtension Class {#operationextension-class}

The `OperationExtension` classes are custom pieces of code that can be injected into an operation allowing for customization of operations to meet business needs. The consumers of the component can dynamically and incrementally add functionality to the component. The extension/hook pattern allows developers to focus exclusively on the extensions themselves and removes the need for copying and overriding entire operations and components.

## Sample Code {#sample-code}

Sample code is available in the [Adobe Experience Cloud GitHub](https://github.com/Adobe-Marketing-Cloud) repository. Search for projects prefixed with either `aem-communities` or `aem-scf`.

## Best Practices {#best-practices}

View the [Coding Guidelines](code-guide.md) section for various coding guidelines and best practices for AEM Communities developers.

See also [Storage Resource Provider (SRP) for UGC](srp.md) to learn about accessing user generated content.

| **[⇐ Feature Essentials](essentials.md)** |**[Client-side Customization ⇒](client-customize.md)** |
|---|---|
|   |**[SCF Handlebars Helpers ⇒](handlebars-helpers.md)** |

---
title: SPA Blueprint
description: This document describes the general, framework-independent contract that any SPA framework should fulfill to implement editable SPA components within AEM.
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: spa
content-type: reference
docset: aem65
exl-id: 383f84fd-455c-49a4-9e2b-1c4757cc188b
solution: Experience Manager, Experience Manager Sites
feature: Developing,SPA Editor
role: Developer
---

# SPA Blueprint{#spa-blueprint}

To enable the author to use the AEM SPA Editor to edit the content of an SPA, there are requirements that the SPA must fulfill, which are described in this document.

{{#ue-over-spa}}

## Introduction {#introduction}

This document describes the general contract that any SPA framework should fulfill (that is, the kind of AEM support layer) to implement editable SPA components within AEM.

>[!NOTE]
>
>The following requirements are framework-independent. If these requirements are fulfilled, a framework-specific layer composed of modules, components, and services can be provided.
>
>**These requirements are already met for the React and Angular frameworks in AEM.** The requirements in this blueprint are only relevant if you wish to implement another framework for use with AEM.

>[!CAUTION]
>
>Although the SPA capabilities of AEM are framework-independent, currently only the React and Angular frameworks are is supported.

To enable the author to use the AEM Page Editor to edit the data exposed by an Single Page Application framework, a project must be able to interpret the structure of the model representing the semantic of the data stored for an application within the AEM repository. To achieve this goal, two framework-agnostic libraries are provided: the `PageModelManager` and the `ComponentMapping`.

### PageModelManager {#pagemodelmanager}

The `PageModelManager` library is provided as an NPM package to be used by an SPA project. It accompanies the SPA and serves as a data model manager.

On behalf of the SPA, it abstracts the retrieval and management of the JSON structure that represents the actual content structure. It is also responsible for syncing with the SPA to let it know when it has to re-render its components.

See the NPM package [@adobe/aem-spa-page-model-manager](https://www.npmjs.com/package/@adobe/aem-spa-page-model-manager)

When initializing the `PageModelManager`, the library first loads the provided root model of the App (via parameter, meta property, or current URL). If the library identifies that the model of the current page is not part of the root model it fetches and include it as the model of a child page.

![page_model_consolidation](assets/page_model_consolidation.png)

### ComponentMapping {#componentmapping}

The `ComponentMapping` module is provided as an NPM package to the front-end project. It stores front-end components and provides a way for the SPA to map front-end components to AEM resource types. This enables a dynamic resolution of components when parsing the JSON model of the application.

Each items present in the model contains a `:type` field that exposes an AEM resource type. When mounted, the front-end component can render itself using the fragment of model it has received from the underlying libraries.

#### Dynamic Model to Component Mapping {#dynamic-model-to-component-mapping}

For details about how the dynamic model to component mapping occurs in the JavaScript SPA SDK for AEM see the article [Dynamic Model to Component Mapping for SPAs](/help/sites-developing/spa-dynamic-model-to-component-mapping.md).

### Framework-Specific Layer {#framework-specific-layer}

A third layer must be implemented for each front end framework. This third library is responsible for interacting with the underlying libraries and provide a series of well-integrated and easy-to-use entry points for interacting with the data model.

The remainder of this document describes the requirements of this intermediary framework specific layer and aspires to be framework-independent. By respecting the following requirements, a framework-specific layer can be provided for the project components to interact with the underlying libraries in charge of managing the data model.

## General Concepts {#general-concepts}

### Page Model {#page-model}

The content structure of the page is stored in AEM. The model of the page is used to map and instantiate SPA components. The SPA developers create SPA components which they map to AEM components. To do this, they use the resource type (or path to the AEM component) as a unique key.

The SPA components must be in sync with the page model and be updated with any changes to its content accordingly. A pattern using dynamic components must be used to instantiate components on the fly following the provided page model structure.

### Meta Fields {#meta-fields}

The page model uses the JSON Model Exporter, which is itself based on the [Sling Model](https://sling.apache.org/documentation/bundles/models.html) API. The exportable sling models expose the following list of fields to enable the underlying libraries interpret the data model:

* `:type`: Type of the AEM resource (default = resource type)
* `:children`: Hierarchical children of the current resource. Children are not part of the inner content of the current resource (can be found on items representing a page)
* `:hierarchyType`: Hierarchical type of a resource. The `PageModelManager` currently supports the page type

* `:items`: Child content resources of the current resource (nested structure, only present on containers)
* `:itemsOrder`: Ordered list of the children. The JSON map object does not guaranty the order of its fields. By having both the map and the current array the consumer of the API has the benefits of both structures
* `:path`: Content path of an item (present on items representing a page)

See also [Getting Started with AEM Content Services.](https://helpx.adobe.com/experience-manager/kt/sites/using/content-services-tutorial-use.html)

### Framework-Specific Module {#framework-specific-module}

Separating concerns helps to facilitate project implementation. Therefore an npm-specific package should be provided. This package is responsible for aggregating and exposing the base modules, services, and components. These components must encapsulate the data model management logic and provide access to the data the project's component is expecting. The module is also responsible for transitively exposing useful entry points of the underlying libraries.

To facilitate the interoperability of the libraries, Adobe advise the framework-specific module to bundle the following libraries. If necessary, the layer can encapsulate and adapt the underlying APIs before exposing them to the project.

* [@adobe/aem-spa-page-model-manager](https://www.npmjs.com/package/@adobe/aem-spa-page-model-manager)
* [@adobe/aem-spa-component-mapping](https://www.npmjs.com/package/@adobe/aem-spa-component-mapping)

#### Implementations {#implementations}

#### React {#react}

npm module: [@adobe/aem-react-editable-components](https://www.npmjs.com/package/@adobe/aem-react-editable-components)

#### Angular {#angular}

npm module: [@adobe/aem-angular-editable-components](https://www.npmjs.com/package/@adobe/aem-angular-editable-components)

## Main Services and Components {#main-services-and-components}

The following entities should be implemented in accordance with the guidelines specific to each framework. Based on the framework architecture, the implementation can vary widely, but the described functionalities must be provided.

### The Model Provider {#the-model-provider}

Project components must delegate access to the fragments of a model to a Model Provider. The Model Provider is then in charge of listening for changes made to the specified fragment of the model and return the updated model to the delegating component.

To do this, the Model Provider must register to the ` [PageModelManager](/help/sites-developing/spa-blueprint.md#pagemodelmanager)`. Then when a change occurs it receives and pass the updated data to the delegating component. By convention, the property made available to the delegating component that will carry the fragment of model is named `cqModel`. The implementation is free to provide this property to the component but should consider aspects such as the integration with framework architecture, discoverability, and ease of use.

### The Component HTML Decorator {#the-component-html-decorator}

The Component Decorator is responsible for decorating the outer HTML of the element of each component instances with a series of data attributes and class names expected by the Page Editor.

#### Component Declaration {#component-declaration}

The following meta data must be added to the outer HTML element produced by the project's component. They enable the Page Editor to retrieve the corresponding editing configuration.

* `data-cq-data-path`: Path to the resource relative to the `jcr:content`

#### Editing Capability Declaration and Placeholder {#editing-capability-declaration-and-placeholder}

The following meta data and class names must be added to the outer HTML element produced by the project's component. They enable the Page Editor to offer related functionalities.

* `cq-placeholder`: Class name that identifies the placeholder for an empty component
* `data-emptytext`: Label to be displayed by the overlay when a component instance is empty

**Placeholder for Empty Components**

Each component must be extended with a functionality that will decorate the outer HTML element with data attributes and class names specific to placeholders and related overlays when the component is identified as empty.

**About the Emptiness of a Component**

* Is the component logically empty?
* What should be the label displayed by the overlay when the component is empty?

### Container {#container}

A container is a component meant to contain and render child components. To do so, the container iterates over the `:itemsOrder`, `:items` and `:children` properties of its model.

The container dynamically gets the child components from the store of the [`ComponentMapping`](/help/sites-developing/spa-blueprint.md#componentmapping) library. The container then extends the child component with the Model Provider capabilities and finally instantiate it.

### Page {#page}

The `Page` component extends the `Container` component. A container is a component meant to contain and render child components including child pages. To do so, the container iterates over the `:itemsOrder`, `:items`, and `:children` properties of its model. The `Page` component dynamically gets the child components from the store of the [ComponentMapping](/help/sites-developing/spa-blueprint.md#componentmapping) library. The `Page` is responsible for instantiating child components.

### Responsive Grid {#responsive-grid}

The Responsive Grid component is a container. It contains a specific variant of the Model Provider representing its columns. The Responsive Grid and its columns are responsible for decorating the outer HTML element of the project's component with the specific class names contained in the model.

The Responsive Grid component should come pre-mapped to its AEM counterpart as this component is complex and rarely customized.

#### Specific Model Fields {#specific-model-fields}

* `gridClassNames:` Provided class names for the responsive grid
* `columnClassNames:` Provided class names for the responsive column

#### Placeholder of the Reponsive Grid {#placeholder-of-the-reponsive-grid}

The SPA component is mapped to a graphical container such as the Responsive Grid and must add a virtual child placeholder when the content is being authored. When the content of the SPA is being authored by the Page Editor, that content is embedded into the editor using an iframe and the `data-cq-editor` attribute is added to the document node of that content. When the `data-cq-editor` attribute is present, the container must include an HTMLElement to represent the area with which the author interacts when inserting a new component into the page.

For example:

```
<div data-cq-data-path={"path/to/the/responsivegrid/*"} className="new section aem-Grid-newComponent"/>
```

>[!NOTE]
>
>The class names used in the example are currently required by the page editor.
>
>* `"new section"`: Indicates that the current element is the container's placeholder
>* `"aem-Grid-newComponent"`: Normalizes the component for the layout authoring
>

#### Component Mapping {#component-mapping}

The underlying [`Component Mapping`](/help/sites-developing/spa-blueprint.md#componentmapping) library and its `MapTo` function can be encapsulated and extended to provide the functionalities relative to the edit configuration provided alongside the current component class.

```
const EditConfig = {

    emptyLabel: 'My Component',

    isEmpty: function() {
        return !this.props || !this.props.cqModel || this.props.cqModel.isEmpty;
    }
};

class MyComponent extends Component {

    render() {
        return <div className={'my-component'}></div>;
    }
}

MapTo('component/resource/path')(MyComponent, EditConfig);
```

In the above implementation, the project component is extended with the emptiness functionality before the being actually registered in the [Component Mapping](/help/sites-developing/spa-blueprint.md#componentmapping) store. This is done by encapsulating and extending the [`ComponentMapping`](/help/sites-developing/spa-blueprint.md#componentmapping) library to introduce the support of the `EditConfig` configuration object:

```
/**
 * Configuration object in charge of providing the necessary data expected by the page editor to initiate the authoring. The provided data will be decorating the associated component
 *
 * @typedef {{}} EditConfig
 * @property {String} [dragDropName]       If defined, adds a specific class name enabling the drag and drop functionality
 * @property {String} emptyLabel           Label to be displayed by the placeholder when the component is empty. Optionally returns an empty text value
 * @property {function} isEmpty            Should the component be considered empty. The function is called using the context of the wrapper component giving you access to the component model
 */

/**
 * Map a React component with the given resource types. If an {@link EditConfig} is provided the <i>clazz</i> is wrapped to provide edition capabilities on the AEM Page Editor
 *
 * @param {string[]} resourceTypes                      - List of resource types for which to use the given <i>clazz</i>
 * @param {class} clazz                                 - Class to be instantiated for the given resource types
 * @param {EditConfig} [editConfig]                     - Configuration object for enabling the edition capabilities
 * @returns {class}                                     - The resulting decorated Class
 */
ComponentMapping.map = function map (resourceTypes, clazz, editConfig) {};
```

## Contract with the Page Editor {#contract-with-the-page-editor}

The project components must generate at a minimum the following data attributes to allow the editor to interact with them.

* `data-cq-data-path`: Relative path of the component as provided by the `PageModel` (for example, `"root/responsivegrid/image"`). This attribute should not be added to pages.

In summary, to be interpreted by the page editor as editable, a project component must respect the following contract:

* Provide the expected attributes to associate a front end component instance to an AEM resource.
* Provide the expected series of attributes and class names that enables the creation of empty placeholders.
* Provide the expected class names enabling the drag-and-drop of assets.

### Typical HTML Element Structure {#typical-html-element-structure}

The following fragment illustrates the typical HTML representation of a page content structure. Here are a few important points:

* The responsive grid element carries class names prefixed with `aem-Grid--`
* The responsive column element carries class names prefixed with `aem-GridColumn--`
* A responsive grid which is also the column of a parent grid is wrapped such as the two previous prefixes are not appearing on the same element
* Elements corresponding to editable resources carry a `data-cq-data-path` property. See the [Contract wtih the Page Editor](#contract-wtih-the-page-editor) section of this document.

```
<div data-cq-data-path="/content/page">
    <div class="aem-Grid aem-Grid--12 aem-Grid--default--12">
        <div class="aem-container aem-GridColumn aem-GridColumn--default--12" data-cq-data-path="/content/page/jcr:content/root/responsivegrid">
            <div class="aem-Grid aem-Grid--12 aem-Grid--default--12">
                <div class="cmp-image cq-dd-image aem-GridColumn aem-GridColumn--default--12" data-cq-data-path="/root/responsivegrid/image">
                    <img src="/content/we-retail-spa-sample/react/jcr%3acontent/root/responsivegrid/image.img.jpeg/1512113734019.jpeg">
                </div>
            </div>
        </div>
    </div>
</div>
```

## Navigation and Routing {#navigation-and-routing}

The App owns the routing. The front end developer first needs to implement a Navigation component (mapped to an AEM navigation component). This component would render URL links to be used in conjunction with a series of routes that will display or hide fragments of content.

The underlying [ `PageModelManager`](/help/sites-developing/spa-blueprint.md#pagemodelmanager) library and its ` [ModelRouter](/help/sites-developing/spa-routing.md)` module (enabled by default) are responsible for pre-fetching and providing access to the model associated with a given resource path.

The two entities relate to the notion of routing but the ` [ModelRouter](/help/sites-developing/spa-routing.md)` is only responsible for having the ` [PageModelManager](/help/sites-developing/spa-blueprint.md#pagemodelmanager)` loaded with a data model structured in sync with the current application state.

See the article [SPA Model Routing](/help/sites-developing/spa-routing.md) for more information.

## SPA in Action {#spa-in-action}

See how a simple SPA works and experiment with an SPA yourself by continuing on to the document [Getting Started with SPAs in AEM](/help/sites-developing/spa-getting-started-react.md).

## Further Reading {#further-reading}

For more information about SPAs in AEM, see the following documents:

* [SPA Authoring Overview](/help/sites-developing/spa-overview.md) for an overview of SPAs in AEM and the communication model
* [Getting Started with SPAs in AEM](/help/sites-developing/spa-getting-started-react.md) for a guide to a simple SPA and how it works

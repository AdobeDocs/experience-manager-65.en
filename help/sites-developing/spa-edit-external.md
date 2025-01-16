---
title: Editing an External SPA within Adobe Experience Manager
description: This document describes the recommended steps to upload a standalone SPA to an Adobe Experience Manager instance, add editable sections of content, and enable authoring.
exl-id: 25236af4-405a-4152-8308-34d983977e9a
solution: Experience Manager, Experience Manager Sites
feature: Developing,SPA Editor
role: Developer
---

# Editing an External SPA within Adobe Experience Manager {#editing-external-spa-within-aem}

When deciding what level of integration you would like to have between your external SPA and Adobe Experience Manager (AEM), you often need to be able to edit and view the SPA within AEM.

{{#ue-over-spa}}

## Overview {#overview}

This document describes the recommended steps to upload a standalone SPA to an AEM instance, add editable sections of content, and enable authoring.

## Prerequisites {#prerequisites}

The prerequisites are simple.

* Ensure that an instance of AEM is running locally.
* Create a base AEM SPA project using [the AEM Project Archetype](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/developing/archetype/overview.html?#available-properties).
  * This forms the basis of the AEM project which will be updated to include the external SPA.
  * The samples in this document use the starting point of [the WKND SPA project](https://experienceleague.adobe.com/docs/experience-manager-learn/sites/spa-editor/spa-editor-framework-feature-video-use.html#spa-editor).
* Have the working, external React SPA that you wish to integrate at hand.

## Upload SPA to AEM Project {#upload-spa-to-aem-project}

First, you need to upload the external SPA to your AEM project.

1. Replace `src` in the `/ui.frontend` project folder with your React application's `src` folder.
1. Include any additional dependencies in the app's `package.json` in the `/ui.frontend/package.json` file.
   * Ensure that the SPA SDK dependencies are of [recommended versions](spa-getting-started-react.md#dependencies).
1. Include any customizations in the `/public` folder.
1. Include any inline scripts or styles added in the `/public/index.html` file.

## Configure the Remote SPA {#configure-remote-spa}

Now that the external SPA is part of your AEM project, it must be configured within AEM.

### Include Adobe SPA SDK Packages {#include-spa-sdk-packages}

To take advantage of AEM SPA features, there are dependencies on the following three packages.

* [`@adobe/aem-react-editable-components`](https://github.com/adobe/aem-react-editable-components)
* [`@adobe/aem-spa-component-mapping`](https://www.npmjs.com/package/@adobe/aem-spa-component-mapping)
* [`@adobe/aem-spa-page-model-manager`](https://www.npmjs.com/package/@adobe/aem-spa-model-manager)

The `@adobe/aem-spa-page-model-manager` provides the API for initializing a Model Manager and retrieving the model from the AEM instance. This model can then be used to render AEM components using APIs from `@adobe/aem-react-editable-components` and `@adobe/aem-spa-component-mapping`.

#### Installation {#installation}

Run the following npm command to install the required packages.

```shell
npm install --save @adobe/aem-spa-component-mapping @adobe/aem-spa-page-model-manager @adobe/aem-react-editable-components
```

### ModelManager Initialization {#model-manager-initialization}

Before the app renders, the [`ModelManager`](spa-blueprint.md#pagemodelmanager) must be initialized to handle the creation of the AEM `ModelStore`.

This needs to be done within the `src/index.js` file of your application or wherever the root of the application is rendered.

For this, use `initializationAsync` API provided by the `ModelManager`.

The following screenshot shows how to enable initialization of the `ModelManager` in a simple React application. The only constraint is that `initializationAsync` must be called before `ReactDOM.render()`.

![Initialize ModelManager](assets/external-spa-initialize-modelmanager.png)

In this example, the `ModelManager` is initialized and an empty `ModelStore` is created.

The `initializationAsync` can optionally accept an `options` object as a parameter:

* `path` - On initialization, the model at the defined path is fetched and stored in the `ModelStore`. This can be used to fetch the `rootModel` at initialization if needed.
* `modelClient` - Allows providing a custom client responsible for fetching the model.
* `model` - A `model` object passed as a parameter typically populated when using SSR.

### AEM Authorable Leaf Components {#authorable-leaf-components}

1. Create/identify an AEM component for which an authorable React component will be created. In this example, the WKND project is using the text component.

   ![WKND text component](assets/external-spa-text-component.png)

1. Create a simple React text component in the SPA. In this example, a new file `Text.js` has been created with the following content.

   ![Text.js](assets/external-spa-textjs.png)

1. Create a configuration object to specify the attributes required for enabling AEM editing.

   ![Create config object](assets/external-spa-config-object.png)

   * `resourceType` is mandatory to map the React component to the AEM component and enable editing when opening in the AEM Editor.

1. Use the wrapper function `withMappable`.

   ![Use withMappable](assets/external-spa-withmappable.png)

   This wrapper function maps the React component to the AEM `resourceType` specified in the config and enables editing capabilities when opened in the AEM Editor. For standalone components, it also fetches the model content for the specific node.

   >[!NOTE]
   >
   >In this example, there are separate versions of the component: AEM wrapped and unwrapped React components. The wrapped version needs to be used when explicitly using the component. When the component is part of a page, you can continue using the default component as currently done in the SPA editor.

1. Render content in the component.

   The JCR properties of the text component appear as follows in AEM.

   ![Text component properties](assets/external-spa-text-properties.png)

   These values are passed as properties to the newly created `AEMText` React component and can be used to render the content.

   ```javascript
   import React from 'react';
   import { withMappable } from '@adobe/aem-react-editable-components';

   export const TextEditConfig = {
       // Empty component placeholder label
       emptyLabel:'Text', 
       isEmpty:function(props) {
          return !props || !props.text || props.text.trim().length < 1;
       },
       // resourcetype of the AEM counterpart component
       resourceType:'wknd-spa-react/components/text'
   };

   const Text = ({ text }) => (<div>{text}</div>);

   export default Text;

   export const AEMText = withMappable(Text, TextEditConfig);
   ```

   This is how the component appears when the AEM configurations are complete.

   ```javascript
   const Text = ({ cqPath, richText, text }) => {
      const richTextContent = () => (
         <div className="aem_text" id={cqPath.substr(cqPath.lastIndexOf('/') + 1)} data-rte-editelement dangerouslySetInnerHTML={{__html: text}}/>
      );
      return richText ? richTextContent() : (<div className="aem_text">{text}</div>);
   };
   ```

   >[!NOTE]
   >
   >In this example, further customizations have been made to the rendered component to match the existing text component. This however is not related to authoring in AEM.

#### Add Authorable Components to the Page {#add-authorable-component-to-page}

Once the authorable React components are created, they can be used throughout the application.

Let's take an example page where text from the WKND SPA project needs to be added. For this example, you want to display the text "Hello World!" on `/content/wknd-spa-react/us/en/home.html`.

1. Determine the path of the node to be displayed.

   * `pagePath`: The page which contains the node, in the example `/content/wknd-spa-react/us/en/home`
   * `itemPath`: Path to the node within the page, in the example `root/responsivegrid/text`
     * This consists of the names of the containing items on the page.

   ![Path of the node](assets/external-spa-path.png)

1. Add component at required position in the page.

   ![Add component to the page](assets/external-spa-add-component.png)

   The `AEMText` component can be added at the required position within the page with `pagePath` and `itemPath` values set as properties. `pagePath` is a mandatory property.

#### Verify Editing of Text Content on AEM {#verify-text-edit}

Now test the component on the running AEM instance.

1. Run the following Maven command from the `aem-guides-wknd-spa` directory to build and deploy the project to AEM.

```shell
mvn clean install -PautoInstallSinglePackage
```

1. On your AEM instance, navigate to `http://<host>:<port>/editor.html/content/wknd-spa-react/us/en/home.html`.

![Editing the SPA in AEM](assets/external-spa-edit-aem.png)

The `AEMText` component is now authorable on AEM.

### AEM Authorable Pages {#aem-authorable-pages}

1. Identify a page to be added for authoring in the SPA. This example uses `/content/wknd-spa-react/us/en/home.html`.
1. Create a file (for example, `Page.js`) for the authorable Page Component. Here, the Page Component can be reused that is provided in `@adobe/cq-react-editable-components`.
1. Repeat step four in the section [AEM authorable leaf components](#authorable-leaf-components). Use the wrapper function `withMappable` on the component.
1. As was done previously, apply `MapTo` to the AEM resource types for all the child components within the page.

   ```javascript
   import { Page, MapTo, withMappable } from '@adobe/aem-react-editable-components';
   import Text, { TextEditConfig } from './Text';

   export default withMappable(Page);

   MapTo('wknd-spa-react/components/text')(Text, TextEditConfig);
   ```

   >[!NOTE]
   >
   >In this example, the unwrapped React text component is being used instead of the wrapped `AEMText` created previously. This is because when the component is part of a page/container and not stand alone, the container will take care of recursively mapping the component and enabling authoring capabilities and the additional wrapper is not needed for each child.

1. To add an authorable page in the SPA, follow the same steps in the section [Add Authorable Components to the Page](#add-authorable-component-to-page). Here we can can skip the `itemPath` property however.

#### Verify Page Content on AEM {#verify-page-content}

To verify that the page can be edited, follow the same steps in the section [Verify Editing of Text Content on AEM](#verify-text-edit).

![Editing a page in AEM](assets/external-spa-edit-page.png)

The page is now editable on AEM with a layout container and child Text Component.

### Virtual Leaf Components {#virtual-leaf-components}

In the previous examples, we added components to the SPA with existing AEM content. However, there are cases where content has not yet been created in AEM, but needs to be added later by the content author. To accommodate this, the front-end developer can add components in the appropriate locations within the SPA. These components will display placeholders when opened in the editor in AEM. Once the content is added within these placeholders by the content author, nodes are created in the JCR structure and content is persisted. The created component will allow the same set of operations as the stand-alone leaf components.

In this example, we are reusing the `AEMText` component created previously. We want new text to be added below the existing text component on the WKND home page. The addition of components is the same as for normal leaf components. However, the `itemPath` can be updated to the path where the new component needs to be added.

Since the new component needs to be added below the existing text at `root/responsivegrid/text`, the new path would be `root/responsivegrid/{itemName}`.

```html
<AEMText
 pagePath='/content/wknd-spa-react/us/en/home'
 itemPath='root/responsivegrid/text_20' />
```

The `TestPage` component looks like the following after adding the virtual component.

![Testing the virtual component](assets/external-spa-virtual-component.png)

>[!NOTE]
>
>Ensure the `AEMText` component has its `resourceType` set in the configuration to enable this feature.

You can now deploy the changes to AEM following the steps in the section [Verify Editing of Text Content on AEM](#verify-text-edit). A placeholder is displayed for the currently non-existing `text_20` node.

![The text_20 node in aem](assets/external-spa-text20-aem.png)

When the content author updates this component, a new `text_20` node is created at `root/responsivegrid/text_20` in `/content/wknd-spa-react/us/en/home`.

![The text20 node](assets/external-spa-text20-node.png)

#### Requirements and Limitations {#limitations}

There are several requirements to add virtual leaf components and some limitations.

* The `pagePath` property is mandatory for creating a virtual component.
* The page node provided at the path in `pagePath` must exist in the AEM project.
* The name of the node to be created must be provided in the `itemPath`.
* The component can be created at any level.
  * If we provide an `itemPath='text_20'` in the previous example, the new node will be created directly under the page that is, `/content/wknd-spa-react/us/en/home/jcr:content/text_20`
* The path to the node where a new node is created must be valid when provided via `itemPath`.
  * In this example, `root/responsivegrid` must exist so that the new node `text_20` can be created there.
* Only leaf component creation is supported. Virtual container and page will be supported in future versions.

### Virtual Containers {#virtual-containers}

The ability to add containers, even if the corresponding container is not yet created in AEM, is supported. The concept and approach is similar to [virtual leaf components.](#virtual-leaf-components)

The front-end developer can add the container components in appropriate locations within the SPA and these components will display placeholders when opened in the editor in AEM. The author can then add components and their content to the container which will create the required nodes in the JCR structure.

For example, if a container already exists at `/root/responsivegrid` and the developer wants to add a new child container:

![Container location](assets/container-location.png)

`newContainer` does not yet exist in the AEM.

When editing the page containing this component in AEM, an empty placeholder for a container is displayed into which the author can add content.

![Container placeholder](assets/container-placeholder.png)

![Container location in JCR](assets/container-jcr-structure.png)

Once the author adds a child component to the container, the new container node is created with the corresponding name in the JCR structure.

![Container with content](assets/container-with-content.png)

![Container with content in JCR](assets/container-with-content-jcr.png)

More components and content can be added to the container now as the author requires and the changes will be persisted.

#### Requirements and Limitations {#container-limitations}

There are several requirements to add virtual containers and some limitations.

* The policy for determining which components can be added will be inherited from the parent container.
* The immediate parent of the container to be created must already exist in AEM.
  * If the container `root/responsivegrid` already exists in the AEM container, then a new container can be created by providing the path `root/responsivegrid/newContainer`.
  * However `root/responsivegrid/newContainer/secondNewContainer` is not possible.
* Only one new level of component can be virtually created at a time.

## Additional Customizations {#additional-customizations}

If you followed the previous examples, your external SPA is now editable within AEM. However there are additional aspects of your external SPA that you can further customize.

### Root Node ID {#root-node-id}

By default, we assume that the React application is rendered inside a `div` of element ID `spa-root`. If necessary, this can be customized.

For example, assume we have a SPA in which the application is rendered inside a `div` of element ID `root`. This needs to be reflected across three files.

1. In the `index.js` of the React application (or where `ReactDOM.render()` is called)

   ![ReactDOM.render() in the index.js file](assets/external-spa-root-index.png)

1. In the `index.html` of the React application

   ![The index.html of the application](assets/external-spa-index.png)

1. In the AEM app's page component body via two steps:

   1. Create a `body.html` for the page component.

     ![Create a body.html file](assets/external-spa-update-body.gif)

   1. Add the new root element in the new `body.html` file.

     ![Add the root element to body.html](assets/external-spa-add-root.png)

### Editing a React SPA with Routing {#editing-react-spa-with-routing}

If the external React SPA application has multiple pages, [it can use routing to determine the page/component to render](spa-routing.md). The basic use case is to match the currently active URL against the path provided for a route. To enable editing on such routing enabled applications, the path to be matched against needs to be transformed to accommodate AEM-specific info.

In the following example we have a simple React application with two pages. The page to be rendered is determined by matching the path provided to the router against the active URL. For example, if we are on `mydomain.com/test`, `TestPage` will be rendered.

![Routing in an external SPA](assets/external-spa-routing.png)

To enable editing within AEM for this example SPA, the following steps are required.

1. Identify the level which would act as the root on AEM.

   * For our sample, we consider `wknd-spa-react/us/en` as the root of the SPA. This means that everything prior to that path is AEM only pages/content.

1. Create a page at the required level.

   * In this example, the page to be edited is `mydomain.com/test`. `test` is in the root path of the app. This needs to be preserved when creating the page in AEM as well. Therefore, you can create a page at the root level defined in the previous step.
   * The new page created must have the same name as the page to be edited. In this example for `mydomain.com/test`, the new page created must be `/path/to/aem/root/test`.

1. Add helpers within SPA routing.

   * The newlycreated page will not yet render the expected content in AEM. This is because the router expects a path of `/test` whereas the AEM active path is `/wknd-spa-react/us/en/test`. To accommodate the AEM-specific portion of the URL, we need to add some helpers on the SPA side.

   ![Routing helper](assets/external-spa-router-helper.png)

   * The `toAEMPath` helper provided by `@adobe/cq-spa-page-model-manager` can be used for this. It transforms the path provided for routing to include AEM-specific portions when the application is open on an AEM instance. It accepts three parameters:
     * The path required for routing
     * The origin URL of the AEM instance where the SPA is edited
     * The project root on AEM as determined in the first step

   * These values can be set as environment variables for more flexibility.

1. Verify editing the page in AEM.

   * Deploy the project to AEM and navigate to the newly created `test` page. The page content is now rendered and AEM components are editable.

## Framework Limitations {#framework-limitations}

The RemotePage component expects that the implementation provides an asset-manifest like the [webpack-manifest-plugin on GitHub](https://github.com/shellscape/webpack-manifest-plugin). The RemotePage component, however, has only been tested to work with the React framework (and Next.js via the remote-page-next component), and therefore does not support remotely loading applications from other frameworks, such as Angular.

## Additional Resources {#additional-resources}

The following reference material may be helpful to understand SPAs in the context of AEM.

* [The AEM Project Archetype](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/developing/archetype/overview.html)
* [The WKND SPA project](https://experienceleague.adobe.com/docs/experience-manager-learn/sites/spa-editor/spa-editor-framework-feature-video-use.html)
* [Getting Started with SPAs in AEM Using React](spa-getting-started-react.md)
* [SPA Reference Materials (API references)](spa-reference-materials.md)
* [SPA Blueprint and PageModelManager](spa-blueprint.md#pagemodelmanager)
* [SPA Model Routing](spa-routing.md)

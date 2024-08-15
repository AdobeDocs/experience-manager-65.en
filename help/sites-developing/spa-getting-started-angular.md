---
title: Getting Started with SPAs in AEM - Angular

description: This article presents a sample SPA application, explains how it is put together, and lets you get up-and-running with your own SPA quickly using the Angular framework.


products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: spa
content-type: reference

docset: aem65
exl-id: 9528d92b-0989-4e2d-83be-ba6c07c845e2
solution: Experience Manager, Experience Manager Sites
feature: Developing,SPA Editor
role: Developer
---
# Getting Started with SPAs in AEM - Angular{#getting-started-with-spas-in-aem-angular}

Single page applications (SPAs) can offer compelling experiences for website users. Developers want to be able to build sites using SPA frameworks and authors want to seamlessly edit content within AEM for a site built using SPA frameworks.

The SPA authoring feature offers a comprehensive solution for supporting SPAs within AEM. This article presents a simplified SPA application on the Angular framework, explains how it is put together, allowing you to get up-and-running with your own SPA quickly.

>[!NOTE]
>
>This article is based on the Angular framework. For the corresponding document for the React framework see [Getting Started with SPAs in AEM - React](/help/sites-developing/spa-getting-started-react.md).

>[!NOTE]
>
>The SPA Editor is the recommended solution for projects that require SPA framework-based client-side rendering (for example, React or Angular).

## Introduction {#introduction}

This article summarizes the basic functioning of a simple SPA and the minimum that you need to know to get yours running.

For more detail on how SPAs work in AEM, see the following documents:

* [SPA Introduction and Walkthrough](/help/sites-developing/spa-walkthrough.md)
* [SPA Authoring Introduction](/help/sites-developing/spa-overview.md)
* [SPA Blueprint](/help/sites-developing/spa-blueprint.md)

>[!NOTE]
>
>To be able to author content within an SPA, the content must be stored in AEM and be exposed by the content model.
>
>An SPA developed outside of AEM will not be authorable if it does not respect the content model contract.

This document will walk through the structure of a simplified SPA and illustrate how it works so you can apply this understanding to your own SPA.

## Dependencies, Configuration, and Building {#dependencies-configuration-and-building}

In addition to the expected Angular dependency, the sample SPA can use additional libraries to make the creation of the SPA more efficient.

### Dependencies {#dependencies}

The `package.json` file defines the requirements of the overall SPA package. The minimum required AEM dependencies are listed here.

```
"dependencies": {
  "@adobe/aem-angular-editable-components": "~1.0.3",
  "@adobe/aem-spa-component-mapping": "~1.0.5",
  "@adobe/aem-spa-page-model-manager": "~1.0.3"
}
```

The `aem-clientlib-generator` is used to make the creation of client libraries automatic as part of the build process.

`"aem-clientlib-generator": "^1.4.1",`

Further details about [the aem-clientlib-generator are available on GitHub](https://github.com/wcm-io-frontend/aem-clientlib-generator).

>[!CAUTION]
>
>The minimum version of the `aem-clientlib-generator` required is 1.4.1.

The `aem-clientlib-generator` is configured in the `clientlib.config.js` file as follows.

```
module.exports = {
    // default working directory (can be changed per 'cwd' in every asset option)
    context: __dirname,

    // path to the clientlib root folder (output)
    clientLibRoot: "./../content/jcr_root/apps/my-angular-app/clientlibs",

    libs: {
        name: "my-angular-app",
        allowProxy: true,
        categories: ["my-angular-app"],
        embed: ["my-angular-app.responsivegrid"],
        jsProcessor: ["min:gcc"],
        serializationFormat: "xml",
        assets: {
            js: [
                "dist/**/*.js"
            ],
            css: [
                "dist/**/*.css"
            ]
        }
    }
};
```

### Building {#building}

Actually building the app uses [Webpack](https://webpack.js.org/) for transpilation in addition to the aem-clientlib-generator for automatic client library creation. Therefore the build command will resemble:

`"build": "ng build --build-optimizer=false && clientlib",`

Once built, the package can be uploaded to an AEM instance.

### AEM Project Archetype {#aem-project-archetype}

Any AEM project should use the [AEM Project Archetype](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/developing/archetype/overview.html), which supports SPA projects using React or Angular and uses the SPA SDK.

## Application Structure {#application-structure}

Including the dependencies and building your app as described previously will leave you with a working SPA package which you can upload to your AEM instance.

The next section of this document will take you through how an SPA in AEM is structured, the important files which drive the application, and how they work together.

A simplified image component is used as an example, but all components of the application are based on the same concept.

### app.module.ts {#app-module-ts}

The entry point into the SPA is the `app.module.ts` file shown here simplified to focus on the important content.

```
// app.module.ts
import { BrowserModule, BrowserTransferStateModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { AppComponent } from './app.component';
import { SpaAngularEditableComponentsModule } from '@adobe/aem-angular-editable-components';
import { AppRoutingModule } from './app-routing.module';

@NgModule({
  imports: [ BrowserModule.withServerTransition({ appId: 'my-angular-app' }),
    SpaAngularEditableComponentsModule,
    AppRoutingModule,
    BrowserTransferStateModule ],
  providers: ...,
  declarations: [ ... ],
  entryComponents: [ ... ],
  bootstrap: [ AppComponent ]
})
export class AppModule {}

```

The `app.module.ts` file is the starting point of the app and contains the initial project configuration and uses `AppComponent` to bootstrap the App.

#### Static Instantiation {#static-instantiation}

When the component is instantiated statically using the component template, the value must be passed from the model to the properties of the component. The values from the model are passed as attributes to be later available as component properties.

### app.component.ts {#app-component-ts}

Once `app.module.ts` bootstraps `AppComponent`, it can then initialize the App, which is shown here in a simplified version to focus on the important content.

```
// app.component.ts
import { Component } from '@angular/core';
import { ModelManager } from '@adobe/aem-spa-page-model-manager';
import { Constants } from "@adobe/aem-angular-editable-components";

@Component({
  selector: 'app-root',
  template: `
    <router-outlet></router-outlet>
  `
})

export class AppComponent {
  items;
  itemsOrder;
  path;

  constructor() {
    ModelManager.initialize().then(this.updateData.bind(this));
  }

  private updateData(model) {
    this.path = model[Constants.PATH_PROP];
    this.items = model[Constants.ITEMS_PROP];
    this.itemsOrder = model[Constants.ITEMS_ORDER_PROP];
  }
}
```

### main-content.component.ts {#main-content-component-ts}

By processing the page, `app.component.ts` calls `main-content.component.ts` listed here in a simplfied version.

```
import { Component } from '@angular/core';
import { ModelManagerService }     from '../model-manager.service';
import { ActivatedRoute } from '@angular/router';
import { Constants } from "@adobe/aem-angular-editable-components";

@Component({
  selector: 'app-main',
  template: `
    <aem-page class="structure-page" [attr.data-cq-page-path]="path" [cqPath]="path" [cqItems]="items" [cqItemsOrder]="itemsOrder" ></aem-page>
  `
})

export class MainContentComponent {
  items;
  itemsOrder;
  path;

  constructor( private route: ActivatedRoute,
    private modelManagerService: ModelManagerService) {
    this.modelManagerService.getData({ path: this.route.snapshot.data.path }).then((data) => {
      this.path = data[Constants.PATH_PROP];
      this.items = data[Constants.ITEMS_PROP];
      this.itemsOrder = data[Constants.ITEMS_ORDER_PROP];
    });
  }
}
```

The `MainComponent` ingests the JSON representation of the page model and processes the content to wrap/decorate each element of the page. Further details on the `Page` can be found in the document [SPA Blueprint](/help/sites-developing/spa-blueprint.md#main-pars-header-1694932501).

### image.component.ts {#image-component-ts}

The `Page` is composed of components. With the JSON ingested, the `Page` can process those components such as `image.component.ts` as shown here.

```
/// image.component.ts
import { Component, Input } from '@angular/core';

const ImageEditConfig = {

    emptyLabel: 'Image',

    isEmpty: function(cqModel) {
        return !cqModel || !cqModel.src || cqModel.src.trim().length < 1;
    }
};

@Component({
  selector: 'app-image',
  templateUrl: './image.component.html',
})

export class ImageComponent {
  @Input() src: string;
  @Input() alt: string;
  @Input() title: string;
}

MapTo('my-angular-app/components/image')(ImageComponent, ImageEditConfig);
```

The central idea of SPAs in AEM is the idea of mapping SPA components to AEM components and updating the component when the content is modified (and conversely). See the document [SPA Editor Overview](/help/sites-developing/spa-overview.md) for an summary of this communication model.

`MapTo('my-angular-app/components/image')(Image, ImageEditConfig);`

The `MapTo` method maps the SPA component to the AEM component. It supports the use of a single string or an array of strings.

`ImageEditConfig` is a configuration object that contributes to enabling the authoring capabilities of a component by providing the necessary metadata for the editor to generate placeholders

If there is no content, labels are provided as placeholders to represent the empty content.

#### Dynamically Passed Properties {#dynamically-passed-properties}

The data coming from the model are dynamically passed as properties of the component.

### image.component.html {#image-component-html}

Finally the image can be rendered in `image.component.html`.

```
// image.component.html
<img [src]="src" [alt]="alt" [title]="title"/>
```

## Sharing Information Between SPA Components {#sharing-information-between-spa-components}

It is regularly necessary for components within a single-page application to share information. There are several recommended ways of doing this, listed as follows in increasing order of complexity.

* **Option 1:** Centralize the logic and broadcast to the necessary components for example, by using a util class as a pure object-oriented solution.
* **Option 2:** Share component states by using a state library such as NgRx.
* **Option 3:** Leverage the object hierarchy by customizing and extending the container component.

## Next Steps {#next-steps}

For a step-by-step guide to creating your own SPA, see the [Getting Started with the AEM SPA Editor - WKND Events Tutorial](https://helpx.adobe.com/experience-manager/kt/sites/using/getting-started-spa-wknd-tutorial-develop.html).

For further information about how to oraganize yourself to develop SPAs for AEM see the article [Developing SPAs for AEM](/help/sites-developing/spa-architecture.md).

For further details about the dynamic model to component mapping and how it works within SPAs in AEM, see the article [Dynamic Model to Component Mapping for SPAs](/help/sites-developing/spa-dynamic-model-to-component-mapping.md).

If you wish to implement SPAs in AEM for a framework other than React or Angular or simply wish to take a deep dive into how the SPA SDK for AEM works, see the [SPA Blueprint](/help/sites-developing/spa-blueprint.md) article.

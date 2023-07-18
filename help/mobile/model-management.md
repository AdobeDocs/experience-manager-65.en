---
title: Models Overview
seo-title: Models Overview
description: Models Overview
seo-description: null
uuid: e09dac52-9515-43f7-9d3b-6637e2283d59
contentOwner: Jyotika Syal
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/MOBILE
discoiquuid: c8281f98-9811-42f7-9a31-f82dd0f09319
exl-id: 50785534-5784-4354-b123-5e640b7c0242
---
# Models Overview{#models-overview}

>[!NOTE]
>
>Adobe recommends using the SPA Editor for projects that require single page application framework-based client-side rendering (for example, React). [Learn more](/help/sites-developing/spa-overview.md).

Model management involves the creation and management of models for the purpose of associating with eventual data objects. Each model will include all the properties and field definitions required to facilitate the creation and rendering of objects.

Model Management involves creation of **models**, **entities**, and **spaces**. The following diagram illustrates the relationship between the AEM Content and the models.

![chlimage_1-81](assets/chlimage_1-81.png)

## The Content Model {#the-content-model}

A model describes the type of content and denotes what information will be available to the native application. It is a description of what makes up a piece of content. A content model is the rules for how to build a piece of content. The content model includes what data is available, what assets can be used, the relationship between assets and data, relationship with other content models, and the available metadata.

Models also serve as a way to transform existing AEM content into objects that can be easily used by native mobile apps.

Content Services will provide a few out-of-the-box models for common objects such as assets, asset collections, HTML pages, app configurations, and channel independent pages. These will be configurable so they will meet specific customer needs without requiring an AEM development effort.

The user can create his or her own models. This enables the creation of new content types that are not already managed by AEM. Model creation is done through a UI using existing primitive types.

The following diagram illustrates the content model for AEM Mobile Apps and how entities, folders, and spaces are assigned to an app.

![chlimage_1-82](assets/chlimage_1-82.png)

### The Models {#the-models}

Models are used to determine how entities are created. They define what is available in an entity and how that data is generated from AEM content. Before you start working with Spaces, Folders, and Entities, you should be familiar with creating and managing models.

>[!NOTE]
>
>A model exists outside of an app as more than one app can use it.
>

See **[Models](/help/mobile/administer-mobile-apps.md)** to create and manage models in the dashboard and repository.

### Entities in Content Model {#entities-in-content-model}

An entity is an instance of a content model. An entity is exposed through the Content Services API to the client side library and provides a way for a native app to access content in a channel independent way.

In the case of existing AEM content, an entity is generated using a model and the AEM content source. For example, a page entity is a channel and layout independent object that is generated from an AEM page and the page model.

Changes to the referenced content of an entity, will result in a change to the entity. For example, if a *cq:page* is updated, then any entities that are based on that page will be updated as well.

See **[Working with Entities](/help/mobile/spaces-and-entities.md)** to create custom entities from models.

>[!NOTE]
>
>If the model does not correspond to an existing AEM content, such as the customer created a new model, then there will be a UI so a customer can create a new entity.
>

### Spaces in Content Model {#spaces-in-content-model}

A space is used to organize entities for easy access. A space can contain one or more entity types and may contain subfolders.

On the AEM side, a space is a convenient way to manage entities that are related. It can also be used to assign authorization permissions. Authorization can be made to a space, which will then protect the entities that are in that space.

*For example*,

A user has three general classifications of entities. One is for internal use only, another is approved for public use and still a third is for common entities that are used by many apps. To make it easy to manage, the user creates three spaces namely *internal*, *public* (with both english and french content), and *common* for managing the appropriate entities as mentioned below:

* /content/entities/internal
* /content/entities/public/en
* /content/entities/public/fr
* /content/entities/common

A service end point will be provided to the space so the native client library can request a list of the contents of a space. This "listing" will be returned as a JSON object.

See **[Spaces and Entities](/help/mobile/spaces-and-entities.md)** for creating and publishing spaces.

>[!NOTE]
>
>A space can be used by many apps and an app can use many spaces.

### Folders in Content Model {#folders-in-content-model}

Folders allow users to organize entities as required and facilitates finer ACL control. Spaces can include folders to help further organize space's content and assets. A user can create their own hierarchy under a space.

See **[Working with Folders in a Space](/help/mobile/spaces-and-entities.md)** to create and manage folders within a space.

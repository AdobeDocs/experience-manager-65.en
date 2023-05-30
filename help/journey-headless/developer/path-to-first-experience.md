---
title: Path to Your First Experience Using AEM Headless
description: In this part of the AEM Headless Developer Journey, you will understand the steps to implementing your first headless experience in AEM including planning considerations and also learn best practices to make your path as smooth as possible.
exl-id: 64a87b6b-67ff-4d88-9dfb-c3e5de65bbe6
---
# Path to Your First Experience Using AEM Headless {#path-to-first-experience}

In this part of the [AEM Headless Developer Journey,](overview.md) you will understand the steps to implementing your first headless experience in AEM including planning considerations and also learn best practices to make your path as smooth as possible.

## The Story So Far {#story-so-far}

In the previous document of the AEM headless journey, [Getting Started with AEM Headless](getting-started.md) you learned the basic theory of what a headless CMS is and you should now:

* Understand the basics of AEM's headless features.
* Know the prerequisites for using AEM's headless features.
* Be aware of AEM's headless integration levels.
* Be able to define your project in terms of scope.

This article builds on those fundamentals so you understand how to prepare your own AEM headless project.

## Objective {#objective}

This document helps you understand the steps needed to implement your first project. After reading it you should:

* Understand important planning considerations for designing your content.
* Understand the steps to implement headless in AEM.
* Know what necessary tools and AEM configurations are required.
* Know best practices to make your headless journey smooth, keep content generation efficient, and ensure content is delivered quickly.

## Requirements {#requirements}

Before you continue with this document, ensure that you have reviewed the previous document in the AEM Headless Developer Journey, [Getting Started with AEM Headless](getting-started.md) making sure you:

* Fulfill the listed requirements.
* Have considered your own project definition including scope, roles, and performance.

## Planning for Success {#planning-for-success}

To start your first AEM headless project you need to ensure you have a content model that will support the personalization and updates you want to make across all your channels.

Separate from AEM, you also want to make sure you have a proper development environment set up if you are building a client-side application so you can test your client against API calls to AEM.

### Defining Content Models and APIs {#defining-models}

You want to drive a consistent experience and manage personalized campaigns across channels, so you can look at each individual channel and surface as its own distinct content structure to deliver to. However having each channel have its own content model will be challenging to maintain.

Instead, you should consider how content on different surfaces is related based on organizing principle such as brand and product hierarchies, categories of goods or surfaces, or steps in the customer journey. For example, if you have a set of surfaces that support a specific brand of cars you manufacture, you may want to start with a content model for general information that would be true for the entire car and then have more - specific elements such as content needed when the car is starting up to when there are service issues. Such a model will enforce inheritance of general car brand content while allow for shifts based on specific context needed. It also helps with future management of updates to this content as you can enforce control based on roles such as the overall marketer or product manager for the entire car brand vs an author who is responsible for the "starting car" experience.

Once you have the content model and clear view on the various clients the content needs to be surfaced to, you need to ensure the GraphQL/APIs associated with accessing various of the content model are published to all the clients who need this content. There are different options of how to access certain content. You can request for a specific piece of content that is static which enables caching of the content and higher performance. You can also request content that is dynamically generated which will require more processing. Ensure that clients are leveraging the APIs that are most efficient for their business need.

## Understanding Your Environments {#understanding-environments}

Within AEM there are three types of environments: development, staging, and production.

The development environments (you can have multiple) are a safe place to experiment and try out ideas. During the initial phase of the project, Adobe recommends using the development environments to try variations of content models and see which provide the intended output for the surfaces.

The staging environment for headless projects is used for validating new AEM product releases before they roll out to production. Keep an up-to-date list of the production content models there and a subset of the content, so you can have JSON files rendered to compare of they still provide the same output, as you make changes or the AEM release introduces changes

Production is where content authors create and manage their actual content. Model changes in production must be carries out with care and with backwards compatibility in mind.

During the development stage, it is recommended you work with a development and staging environment. As you move to performance testing, you will want to move to the production environment.

### Cooperation of Developers and Content Authors {#cooperation}

Developers need an AEM development environment set up with the populated content models. The developer develops the client that will consume content from AEM headless as the content authors are still creating the content. That is why the API definitions are really important. By leveraging the AEM SDK, the developer can create a test hook so client and unit tests can be created to make sure the client is able to properly render the content.

Content authors create content based on the content models that have been defined on the staging environment. Using the content fragment authoring tool, the author would create a new content fragment or edit an existing content fragment. Before publishing it, the author can preview how it will look in the client by working with the developer to push the content model onto development or set up a developer environment just for authors to preview how it would look in the client.

## Setup {#setup}

Before you get started with headless in AEM, you need to make sure all required features are enabled. This section outlines what is required. The actual steps to fulfill these steps are detailed later in the [AEM Headless Developer Journey.](#overview.md)

You can also optionally refer to the [additional resources](#additional-resources) for more information on the individual topics.

### Configuration {#configuration}

1. Enable Content Fragments
1. Enable GraphQL
1. Set up the Headless SDK

## Implementing Your First AEM Headless App

This is an overview of what is needed to implement your first headless app using AEM to deliver your content. How to carry out these steps will be described in detail in later parts of the Headless Developer Journey.

1. Create Content Fragment Models
1. Create Content Fragments
1. Query content with GraphQL

## Best Practices {#best-practices}

A headless project is not only successful because of the technology implemented, but also due to good planning and project governance. The following are a number of best practices for both content authors and developers to keep in mind as you plan your project.

### Organizing Your Content {#organizing-content}

* Make your structure as complex as necessary but keep it as simple as possible. Simpler content structures help streamline content governance and improve system performance.
* Prioritize content reuse in your strategy. Create sub-models and content references that can be re-used across multiple higher-level models and channels.
* Make content structures as self-explanatory as possible so content authors can learn and adapt quickly to authoring tasks.
* If you have access restrictions try to align your content model with the access requirements.
* When you have access requirements, they should drive your content hierarchy. Group content together which is edited by the same group of people.
* Group similar content into a folder.
  * It's more likely a content author will copy and paste exiting content to create new content. Therefore having this done in the same folder makes it more efficient.
  * AEM permits allowed models to be set per folder so the **Create new** button will only show the models that are supported in that location.
* In-line Content Fragment editor creation of new Content Fragments can be simplified if the root folder is set in the model. Then the practitioner doesn't have to choose a location, but just needs to provide a name and can start edit the new reference.

### Authoring Content {#authoring}

* For channel-specific versions of your content, consider using content fragment variations. Variations are synchronized against the content master to streamline content change management.
* Invite other content producers to review content and give feedback with annotations and comments, which are available within the content fragment editor and globally across fragments in content fragments Admin Console.
* Keep things moving with as few mandatory elements as possible. Mandatory elements can block the workflow.

### Authoring Global Content {#localization}

* Establish rules and governance for content translation. To reduce system load, establish translation as an asynchronous process that can be run in longer intervals. Allow for time for localization quality control and bug-fixing.
* Leverage all capabilities provided by your translation technology system that you can integrate with AEM such as translation memory.
* Understand if rich media content, like images and videos, needs localization.

## What's Next {#what-is-next}

Now that you have completed this part of the AEM Headless Developer Journey, you should:

* Understand important planning considerations for designing your content.
* Understand the steps to implement headless in AEM.
* Know what necessary tools and AEM configurations are required.
* Know best practices to make your headless journey smooth, keep content generation efficient, and ensure content is delivered quickly.

We want you to build on this foundational knowledge to fully understand the power and flexibility of AEM Headless so you can take advantage of it for your own projects. To do this, you have options.

### Choose Your Own Adventure {#choose-your-path}

No matter what your learning style, Adobe wants you to succeed as you get started with your AEM Headless project.

* If you prefer to continue to **learn about headless concepts and AEM's headless technologies**, you should continue your AEM headless journey by next reviewing the document [How to Model Your Content as AEM Content Models](model-your-content.md) where you learn how to model your content structure in AEM.
* If you prefer to **learn by doing**, you can jump to the [Getting Started with AEM Headless hands-on tutorial](https://experienceleague.adobe.com/docs/experience-manager-learn/getting-started-with-aem-headless/graphql/multi-step/overview.html) where you will jump directly into AEM Headless development by implementing a simple project to expose AEM headless content.

## Additional Resources {#additional-resources}

While it is recommended that you move on to the next part of the headless development journey by reviewing the document [How to Model Your Content as AEM Content Models,](model-your-content.md) the following are some additional, optional resources that do a deeper dive on some concepts mentioned in this document, but they are not required to continue on the headless journey.

* [AEM Headless Translation Journey](/help/journey-headless/translation/overview.md) - This documentation journey gives you a broad understanding of headless technology, how AEM serves headless content, and how you can translate it.
* [Headless Development for AEM Sites](/help/sites-developing/headless/introduction.md) - A quick introduction to orient the AEM Headless developer with the necessary features
* [AEM Headless Tutorials](https://experienceleague.adobe.com/docs/experience-manager-learn/getting-started-with-aem-headless/overview.html) - Use these hands-on tutorials to explore how to use the various options for delivering content to headless endpoints with AEM and chose what's right for you.
* [Headless Content Management Using GraphQL APIs](https://experienceleague.adobe.com/?Solution=Experience+Manager&Solution=Experience+Manager+Sites&Solution=Experience+Manager+Forms&Solution=Experience+Manager+Screens&launch=ExperienceManager-D-1-2020.1.headless#courses) - Follow this course for an overview of the GraphQL API implemented in AEM. Authentication via AdobeID is required.
* [AEM Guides WKND - GraphQL](https://github.com/adobe/aem-guides-wknd-graphql) -  This GitHub project includes example applications that highlight AEM's GraphQL APIs.
* [Headless Getting Started Guide](/help/sites-developing/headless/introduction.md#getting-started) - A quick introduction to AEM's headless features for users already knowledgeable of AEM.
* [Create Content Fragment Models](/help/assets/content-fragments/content-fragments-models.md) - Technical documentation on Content Fragment Models
* [Create Content Fragments](/help/assets/content-fragments/content-fragments.md) - Technical documentation on Content Fragments
* [Query content with GraphQL](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md) - Technical documentation on the GraphQL API

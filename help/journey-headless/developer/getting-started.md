---
title: Getting Started with AEM Headless
description: In this part of the AEM Headless Developer Journey, learn about AEM Headless prerequisites.
exl-id: a94794a4-bf8b-4f3b-a761-3f02feedd5c0
---
# Getting Started with AEM Headless {#getting-started}

In this part of the [AEM Headless Developer Journey,](overview.md) learn about what is required to get your own project started with AEM Headless.

## The Story So Far {#story-so-far}

In the previous document of the AEM headless journey, [Learn About CMS Headless Development](learn-about.md) you learned the basic theory of what a headless CMS is and you should now:

* Understand the basic concepts and terminology of headless content delivery
* Understand why and when headless is required
* Know at a high-level how headless concepts are used and how they interrelate

This article builds on those fundamentals so you understand how you can use AEM to implement a headless solution.

## Objective {#objective}

This document helps you understand AEM Headless in the context of your own project. After reading you should:

* Understand the basics of AEM's headless features.
* Know the prerequisites for using AEM's headless features.
* Be aware of AEM's headless integration levels.
* Be able to define your project in terms of scope.

## AEM Basics {#aem-basics}

Before you can define your headless project within AEM, it is important to understand some basic AEM concepts.

### Author Instance {#author}

At its simplest, AEM consists of an author instance and a [publish instance](#publish) which work together to create, manage, and publish your content.

Content begins on the author instance. This is where content authors create their content. The author environment offers various tools for authors to create, organize, and reuse their content.

### Publish Instance {#publish}

Once content is created in the author instance, it must be published to be available to other services to consume. A publish instance contains all content that has been published.

### Replication {#replication}

Replication is the act of transferring content from the author instance to the publish instance. This is done automatically by AEM when an author or other user with appropriate rights publishes content.

### AEM Basics Summary {#aem-basics-summary}

At its simplest level, creating digital experiences in AEM requires the following steps:

1. Your content authors create your headless content in the author instance.
1. When this content is ready, it is replicated to the publish instance.
1. APIs can then be called to retrieve this content.

AEM Headless builds off this technical foundation by offering powerful tools to manage headless content which is [described in the next section.](#aem-headless-basics)

## AEM Headless Basics {#aem-headless-basics}

The headless capabilities of AEM are based on a few key features. These are explained in detail in later parts of the journey. It is important now only to know the basics of what they do and what they are called.

### Content Fragment Models {#content-fragment-models}

Content Fragment Models define the structure of the data and content that you create and manage in AEM. They serve as a kind of scaffolding for your content. When choosing to create content, your authors select from the Content Fragment Models you define, which guides them in creating content.

### Content Fragments {#content-fragments}

Content Fragments allow you to design, create, curate, and publish page-independent content. They allow you to prepare content ready for use in multiple locations and over multiple channels.

Content fragments contain structured content and can be delivered in JSON format.

### GraphQL and REST APIs {#apis}

To modify your content headlessly, AEM offers two robust APIs.

* The GraphQL API allows you to create requests to access and deliver Content Fragments.
* The Assets REST API allows you to create and modify Content Fragments (and other assets).

You will learn about these APIs and how to use them in a later part of the AEM headless journey. Or refer to the [additional resources](#additional-resources) section below for additional documentation.

## Headless Integration Levels {#integration-levels}

AEM supports both the full headless and the traditional full stack or headful models of a CMS. However AEM offers not only these two exclusive choices, but the ability to support hybrid models that combine the advantages of both, offering unique flexibility for your headless project.

In order to ensure your understanding of headless concepts, this AEM Headless Developer Journey focuses on the pure headless model to get you up-and-running as soon as possible with no coding in AEM.

However you should be aware of the additional hybrid possibilities open to you once you understand AEM's headless features. These cases are laid out below for your awareness. At the end of the journey, you will be introduced to these concepts in more detail in case such flexibility is required for your project.

### You already have an external consume of headless content such as a singe page application (SPA). {#already-have-a-spa}

Let us assume that your basic requirement is at a minimum to deliver content from AEM to an existing, external service.

#### Level 1: Content Fragment Integration - Traditional Headless Model {#level-1}

This level of integration is the traditional headless model and allows your content authors to create content in AEM and deliver it heedlessly to any number of external services using GraphQL or to edit them from external services using the Assets API. No coding is required in AEM.

In this model, AEM is only used for creating and serving the content by using AEM Content Fragments. Rendering and interaction with the content is delegated to the consuming external application, often a single-page application (SPA).

#### Level 2: Embed the SPA in AEM - Hybrid Model {#level-2}

This level of integration builds on the first level, but also allows the external application (SPA) to be embedded in AEM so that the content authors can view the content in the context of the external application within AEM. The application can also support limited editing of the external application within AEM.

This level has the advantage of allowing content authors to flexibly author content in AEM in a headful way, with their content presented in-context with an embedded external SPA, while still delivering the content headlessly.

#### Level 3: Embed and Fully Enable SPA in AEM - Hybrid Model {#level-3}

This level of integration builds on level two by enabling most content in the external SPA to be editable within AEM.

### You do not yet have an external consumer of the headless content such as a single page application (SPA). {#do-not-have-a-spa}

If your goal is to create a new SPA that headlessly consumes content from AEM, you can use features such as Content Fragments to manage your headless content, and also build a SPA with AEM's SPA Editor framework.

Using the SPA Editor, the SPA not only consumes content from AEM, but is also fully editable within AEM by your content authors giving you both the flexibility of headless delivery and in-context editing within AEM.

## Requirements and Prerequisites {#requirements-prerequisites}

There are a number of requirements before you begin your headless AEM project.

### Knowledge {#knowledge}

* GraphQL
* Development experience creating SPAs with React or Angular frameworks
* Basic AEM skills creating Content Fragments and using the editor

### Tools {#tools}

* Sandbox access for testing deploying your project
* Local development instance for data modeling and testing
* Existing external SPA or other consumer of your headless AEM content

## Defining Your Project {#defining-your-project}

For any successful project, it is important to clearly define not only the requirements of the project, but also the roles and responsibilities.

### Scope {#scope}

It is important to have a clearly defined scope for the project. Scope informs acceptance criteria and allows you to establish a definition of done.

The first question you must ask is "What am I trying to achieve with AEM Headless?" The answer should in general be that you have or will have in the future an experience application that you’ve built with your own development tools not with AEM. This experience application could be a mobile app, a web site, or any other end-user customer facing experience application. The goal for using AEM Headless is to feed your experience application with content that is created, stored, and managed in AEM with state-of-the-art APIs that would call AEM Headless to fetch content or even fully CRUD content directly from your experience application. If this is not what you are looking to do, you probably want to [go back to the AEM documentation](https://experienceleague.adobe.com/docs/experience-manager-65.html) and find the section that better suits what you want to accomplish.

### Roles and Responsibilities {#roles-responsibilities}

The roles for any individual project vary, but important ones to consider in the content of AEM headless development are:

* [Administrator](#administrator)
* [Content Author](#content-author)
* [Content Architect](#content-architect)
* [Developer](#developer)

#### Administrator {#administrator}

The administrator is responsible for the base setup and configuration of your system. For example, the administrator sets up your organization within the Adobe user management system, referred to Identity Management System (IMS). The administrator is the first user from the organization to receive an email invitation from Adobe once your organization has been created by Adobe within IMS. The administrator has the ability to login to IMS and add users of other personas.

Once the users are configured by the administrator, they are be granted the permissions to access all the AEM resources to accomplish their work as contributors to delivering the experience application using AEM Headless.

The administrator should be the user who sets up AEM and prepares the runtime environment to enable [content authors](#content-author) to create and update content and [developers](#developer) to use APIs that fetch or modify content for their experience applications.

#### Content Author {#content-author}

Content authors create and manage the content that is delivered headlessly by AEM. Content authors use AEM features such as Content Fragments and the Assets Console to manage their content.

Content authors should keep in mind the following best practices.

#### Plan for Translation {#translation}

Plan for translation at the very beginning of the project. Consider "Translation Specialist" as a separate persona whose responsibility it is to define what content should be translated and what should not be, and what translated content may be modified by regional or local content producers.

Create a plan on what content translation you need.

* Do you need different languages or also language to adopt to regional specifics?
* Do you need rich media content like images or videos to be different for different locales?

Be clear about your content update workflow. What is the approval process that the system must support? Might AEM workflows be leveraged to automate this process?

Note that your [content hierarchy](#content-hierarchy) can be leveraged to make translation easier.

See the [additional resources](#additional-resources) section for additional documentation on AEM workflows and translation tools including links to the AEM Headless Translation Journey.

##### Leverage the Content Hierarchy {#content-hierarchy}

Folder hierarchy can address two major concerns with regards to content management:

* [Translation](#translation) - AEM manages translation of content by maintaining copies of content in locale-specific folders.
* Organization - Folders are used to define a content hierarchy required to support translation needs as well as logically manage Content Fragments.

AEM allows for a flexible content structure and a hierarchy can be arbitrarily large. However it is important to realize that any changes in folder structure may have unintended consequences for existing queries that [rely on the content path.](#developer) Therefore a well-defined hierarchy that is clearly set out in advance, can be helpful to your content authors.

Folders can also be restricted to only allow certain types of content (based on Content Fragment Models). It is recommended to always explicitly specify which models are allowed for all folders in the hierarchy. Specifying allowed content for a given folder:

* Prevents content authors from authoring content that do not belong in the folder.
* Optimizes the content creation process by filtering the types of content allowed in the folder during creation to only show valid types of content.

By creating an appropriate content structure, it becomes easier to coordinate headless content authoring across channels in order to maximize content reuse. Leveraging content across multiple channels greatly improves content production efficiency and change management.

##### Establish Good Naming Conventions {#naming-conventions}

Content Fragment names must be descriptive for content authors. AEM transparently handles escaping and/or truncating the names used IDs at the repository level. Therefore the logical names provided by the content authors should always be readable and represent the contents.

* Bad Name: `cta_btn_1`
* Good Name: `Call To Action Button`

See the [additional resources](#additional-resources) section for additional documentation on AEM page naming conventions.

##### Don't Overextend Content Nesting {#content-nesting}

[Content Fragments](#content-fragments) are used in AEM to create headless content. AEM supports up to ten levels of content nesting for Content Fragments. However it is important to keep in mind that AEM  must iteratively resolve each reference defined in the parent Content Fragment, then check if there are any child references in all siblings. These operations can add up quickly and become a performance concern.

As a general rule-of-thumb, Content Fragment references should not be nested beyond five levels.

#### Content Architect {#content-architect}

Content architects analyze the requirements for the data that must be delivered headlessly and defines the structure for this data. These structures are called [Content Fragment Models](#content-fragment-models) in AEM. Content Fragment Models are used as the basis for the Content Fragments that the content authors create.

A useful approach when defining Content Fragment Models, is to create models that map to the UX components of the applications that consume the content.

Because the content authors interact with the models on a continual basis as they create new content, aligning the models to the UX helps them to visualize the resulting digital experience. Taking this alignment a step further, you can assign icons to the Content Fragment Models that represent the UX element so the authors can intuitively select the right model based on visual cues.

#### Developer {#developer}

Developers are responsible for joining together the content being created headlessly in AEM to the consumer of that content, which can often be a single-page application (SPA), progressive web app (PWA), web shop, or other service external to AEM.

GraphQL serves as the "glue" between AEM and the consumers of headless content. GraphQL is the language that queries AEM for the necessary content.

Developers should keep in mind a few basic recommendations as they plan their queries:

* Queries should not rely on a fixed path (`ByPath`) to retrieve Content Fragments.
  * [Content authors have complete control on content fragment hierarchy](#content-hierarchy) and could make changes that would break such a query.
  * Queries should instead opt for content fragment model references with dynamic query parameters to filter the results to generate the desired payload.
* For best query performance, always use persisted queries in AEM. These are discussed later in the journey.
* GraphQL is declarative following the motto "Ask for exactly what you need, and get exactly that." This means that when creating GraphQL queries, always avoid `select *`-type queries that you might create in a relational database.

For a [typical headless implementation using AEM,](#level-1) the developer requires no coding knowledge of AEM.

### Performance Requirements {#performance-requirements}

For any project to be a success, performance must be considered before any content is created.

You must understand your users/visitors expectations and design for those. Set service level objectives (SLOs) and measure them to understand if you meet your user's expectations.

#### Traffic Patterns {#traffic-patterns}

To understand traffic and traffic patterns start with gathering what you know from the past and then project to the expected growth over the next few years. Some of the most important variables to consider:

* How many API calls per hour/day/month do you expect and is there potential for spikes and seasonality?
* How many different content authors are there?
* How many content authors do you anticipate working concurrently?
* What is the frequency of content updates?
* How many content models are needed?
* How many instances of models are needed?

#### Update Frequency {#update-frequency}

Often different sections of experiences have different frequencies of content updates. Understanding this is important to be able to fine tune CDN and cache configurations. This is also important input for the [Content Architects](#content-architects) as they design models to represent your content. Consider:

* Must some types of content expire after a certain period?
* Are there elements that are user-specific and thus can't be cached?

## What's Next {#what-is-next}

Now that you have completed this part of the AEM Headless Developer Journey, you should:

* Understand the basics of AEM's headless features.
* Know the prerequisites for using AEM's headless features.
* Be aware of AEM's headless integration levels.
* Be able to define your project in terms of scope.

You should continue your AEM headless journey by next reviewing the document [Path to Your First Experience Using AEM Headless](path-to-first-experience.md) where you will learn how to set up the necessary tools and how to begin thinking about modeling your data in AEM.

## Additional Resources {#additional-resources}

While it is recommended that you move on to the next part of the headless development journey by reviewing the document [Path to Your First Experience Using AEM Headless,](path-to-first-experience.md) the following are some additional, optional resources that do a deeper dive on some concepts mentioned in this document, but they are not required to continue on the headless journey.

* [AEM Headless Translation Journey](/help/journey-headless/translation/overview.md) - This documentation journey gives you a broad understanding of headless technology, how AEM serves headless content, and how you can translate it.
* [AEM Headless Tutorials](https://experienceleague.adobe.com/docs/experience-manager-learn/getting-started-with-aem-headless/overview.html) - Use these hands-on tutorials to explore how to use the various options for delivering content to headless endpoints with AEM and chose what's right for you.
* [Headless Content Management Using GraphQL APIs](https://experienceleague.adobe.com/?Solution=Experience+Manager&Solution=Experience+Manager+Sites&Solution=Experience+Manager+Forms&Solution=Experience+Manager+Screens&launch=ExperienceManager-D-1-2020.1.headless#courses) - Follow this course for an overview of the GraphQL API implemented in AEM. Authentication via AdobeID is required.
* [AEM Guides WKND - GraphQL](https://github.com/adobe/aem-guides-wknd-graphql) -  This GitHub project includes example applications that highlight AEM's GraphQL APIs.
* [Authoring Concepts](/help/sites-authoring/author.md) - Technical documentation for the authoring environment of AEM including details on the author-publish setup
* [Publishing Pages](/help/sites-authoring/publishing-pages.md) - Technical documentation for publishing content on AEM
* [Naming Conventions](/help/sites-developing/naming-conventions.md) - Technical documentation of page naming restrictions in AEM
* [Multi Site Manager and Translation](/help/sites-administering/msm-and-translation.md) - Technical documentation on AEM's powerful translation features
* [AEM workflows](/help/sites-authoring/workflows.md) - Technical documentation on how to automate workflows in AEM
* [Content Fragments](/help/assets/content-fragments/content-fragments.md) - Technical documentation for Content Fragments.
* [Content Fragment Models](/help/assets/content-fragments/content-fragments-models.md) - Technical documentation for Content Fragment Models.
* [GraphQL Technical Documentation](https://graphql.org) - The GraphQL definition (external link)
* [GraphQL API](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md) - Technical documentation that explains how to create requests to access and deliver Content Fragments
* [Assets REST API](/help/assets/assets-api-content-fragments.md) - Technical documentation that explains how to create and modify Content Fragments (and other assets)
* [Persisted Queries](/help/sites-developing/headless/graphql-api/persisted-queries.md) - Technical documentation on persisted queries in AEM
* [Headful and Headless in AEM](/help/sites-developing/headful-headless.md) - A complete discussion of the headless integration levels available in AEM

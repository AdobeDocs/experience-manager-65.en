---
title: Adobe Experience Manager Headless Content Architect Journey
description: An introduction to the powerful, and flexible, headless features of Adobe Experience Manager, and how to model content for your project.
exl-id: 49ba0d6d-dde4-42e2-92fd-c7655c0eebc0
---
# Content Modeling for Headless with AEM - An Introduction {#architect-headless-introduction}

In this part of the [AEM Headless Content Architect Journey](overview.md), you can learn the (basic) concepts and terminology necessary to understand content modeling for headless content delivery with Adobe Experience Manager (AEM).

This document helps you understand headless content delivery, how AEM supports headless, and how content is modeled for headless. After reading you should:

* Understand the basic concepts of headless content delivery.
* Be familiar with how AEM supports headless and content modeling.

## Objective {#objective}

* **Audience**: Beginner
* **Objective**: Introduce the concepts and terminology relevant to Headless Content Modeling.

## Full-Stack Content Delivery {#full-stack}

Ever since the rise of easy-to-use, large-scale content management systems (CMSes), organizations have leveraged them as a central location to manage messaging, branding, and communications. Using the CMS as a central point for administering experiences improved efficiency by eliminating the need to duplicate tasks in disparate systems.

![The classic full-stack CMS](/help/journey-headless/developer/assets/full-stack.png)

In a full-stack CMS, all of the functionality for manipulating content is in the CMS. Features of the system make up different components of the CMS stack. The full-stack solution has many advantages.

* There is one system to maintain.
* Content is managed centrally.
* All services of the system are integrated.
* Content authoring is seamless.

So if new channel needs to be added or support for new types of experiences is required, one (or more) new components can be inserted into the stack and there is only one place to make changes.

![Adding a new channel to the stack](/help/journey-headless/developer/assets/adding-channel.png)

However the complexity of the dependencies within the stack quickly become apparent as other items in the stack need to be adjusted to accommodate the changes.

## The Head in Headless {#the-head}

The head of any system is generally the output renderer of that system, typically in the form of a GUI or other graphical output.

When we talk about a headless CMS, the CMS manages the content and continues to deliver it to consumers. However, by only delivering the **content** in a standardized fashion, a headless CMS omits the final output rendering, leaving the **presentation** of the content to the consuming service.

![Headless CMS](/help/journey-headless/developer/assets/headless-cms.png)

The consuming services, be they AR experiences, a webshop, mobile experiences, progressive web apps (PWAs), etc., take in content from the headless CMS and provide their own rendering. They take care of providing their own heads for your content.

Omitting the head simplifies the CMS by removing complexity. Doing this also shifts the responsibility of rendering the content to the services that actually need the content and are often better suited to such rendering.

## Content Modeling {#content-modeling}

Content Modeling (also known as data modeling) is your specialty, so what needs to be considered when modeling for headless?

For the headless applications to be able to access your content, and do something with it, the content really needs to have a predefined structure. It would be possible to have your content as free-form, but it would make life *very* complicated for the applications.

For AEM you, as a Content Architect, will perform the content modeling to design a range of **Content Fragment Models**. These define the structure used when your content authors create the **Content Fragments** that hold the content.

### Accessing the Content {#access-content}

This is more of a development detail - but it might interest you, just to complete the story.

Once you've created the Content Fragment Models, and your authors have used them to generate the content, the headless applications will need to access this content. 

Adobe Experience Manager (AEM), can selectively access your Content Fragments using the AEM GraphQL API, to return only the content that is needed. Using the API a developer can formulate queries that select specific content.This selection process is based on *your* Content Fragment Models. 

This means your project can realize headless delivery of structured content for use in your applications.

## What's Next {#whats-next}

Now that you have learned the concepts and terminology, the next step is to [Learn the basics of modeling with Content Fragment Models](basics.md). 

## Additional Resources {#additional-resources}

* AEM Headless Developer Journey
  * [Learn About CMS Headless Development](/help/journey-headless/developer/learn-about.md)
  * [Learn how to Model Your Content](/help/journey-headless/developer/model-your-content.md)

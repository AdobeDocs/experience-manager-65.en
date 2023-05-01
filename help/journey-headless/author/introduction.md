---
title: Authoring for Headless with Adobe Experience Manager
description: An introduction to the powerful, and flexible, headless features of Adobe Experience Manager, and how to author content for your project.
exl-id: 39d2218a-4f11-459d-8514-cfd312246be5
---
# Authoring for Headless with AEM - An Introduction {#author-headless-introduction}

In this part of the [AEM Headless Content Author Journey](overview.md), you can learn the (basic) concepts and terminology necessary to understand authoring content for headless content delivery with Adobe Experience Manager (AEM).

## Objective {#objective}

* **Audience**: Beginner
* **Objective**: Introduce the concepts and terminology relevant to Headless Authoring.

## Content Management System (CMS) {#content-management-system}

What is a Content Management System?

A Content Management System (CMS) is just what it says it is - a computer system used to manage content. That's a bit general, so to be more precise, it is (typically) used for managing content that you want to make available on your website(s).

## Headless CMS {#headless-cms}

Headless is a term used to describe systems that effectively detaches the content from the manner of displaying that content on the web. 

Traditionally you would manage your content in a CMS, and the same CMS would be responsible for rendering that content on your webpages.

Now, headless means that your content-set can be managed in the CMS and then accessed by one, or more, (independent) applications. 

This means that your content can be delivered to any device, in a wide range of formats. This makes the whole process much more flexible, and also means that you do not need to worry about layout and formatting.

>[!NOTE]
>
>If you want to learn more about the technical details of Headless CMS you can read more at Learn About CMS Headless Development.

## Adobe Experience Manager {#aem-cms}

So what is AEM?

First and foremost, AEM is a Content Management System with a wide range of features that can also be customized to meet your requirements. 

This all means that it can be used as a:

* Headless CMS
  * For headless, your content can be authored as **Content Fragments**. 
  These are self-contained items of content that can be directly accessed by a range of applications, as they have a predefined structure, based on **Content Fragment Models**.
  This means your content can reach a wide range of devices, in a wide range of formats and with a wide selection of functionality.
  (And as a double-whammy, these fragments can also be used when constructing AEM web pages - if you want.)

* "Traditional" CMS
  * Content is authored for web pages, using a range of components that define how the content will be rendered on your website. Even here AEM is extremely flexible as your project team can develop customized components.

## Content Modeling {#content-modeling}

So content modeling (also known as data modeling) is another technical term - why should it interest you as an author?

For the headless applications to be able to access your content, and do something with it, your content really needs to have a predefined structure. It would be possible to have your content as free-form, but it would make life *very* complicated for the applications.

Basically the process of defining the structure for your content to adhere to involves designing a model - and this is called data modeling. 

For AEM the Content Architect role (often a different person) will perform the data modeling to design a range of **Content Fragment Models** - that you then use as a basis for your content by using **Content Fragments**.

>[!NOTE]
>
>If you want to learn more about data modeling you can read more under the AEM Headless Content Architect Journey.

## What's Next {#whats-next}

Now that you have learned the concepts and terminology, the next step is to [Learn the basics of authoring Content Fragments](basics.md). This will introduce the basic handling of AEM together with how to author Content Fragments.

## Additional Resources {#additional-resources}

* AEM Headless Developer Journey
  * [Learn About CMS Headless Development](/help/journey-headless/developer/learn-about.md)

* [AEM Headless Content Architect Journey](/help/journey-headless/architect/overview.md)

* [AEM Headless Content Translation Journey](/help/journey-headless/translation/overview.md)

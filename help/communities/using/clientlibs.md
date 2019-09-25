---
title: Clientlibs for Communities Components
seo-title: Clientlibs for Communities Components
description: Client-side libraries for Communities
seo-description: Client-side libraries for Communities
uuid: d2a9f986-96cf-4ee8-81e6-36a96f45ddcb
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: 68ce47c8-a03f-40d6-a7f3-2cc64aee0594
index: y
internal: n
snippet: y
---

# Clientlibs for Communities Components{#clientlibs-for-communities-components}

## Introduction {#introduction}

This section of the documentation describes how to add client-side libraries (clientlibs) to a page for Communities components.

For basic information, visit :

* [Using Client-Side Libraries](../../sites/developing/using/clientlibs.md) which provides usage details as well as debugging tools
* [Clientlibs for SCF](/communities/using/client-customize.md#clientlibs) which provides useful information when customizing SCF components
* [Blog : AEM Client Libraries explained by example](http://blogs.adobe.com/experiencedelivers/experience-management/clientlibs-explained-example/)

## Why Clientlibs are Required {#why-clientlibs-are-required}

Clientlibs are required for the proper functioning (JavaScript) and styling (CSS) of a component.

When there exists a [community function](../../communities/using/functions.md) for a feature, all necessary components and configurations, including the required clientlibs, will be present in the community site. Only if additional components are to be available to authors would additonal clientlibs need to be added.

When the required clientlibs are missing, [adding a Communities component to a page](../../communities/using/author-communities.md) could result in javascript errors as well as an unexpected appearance.

### Example : Placed Reviews without Clientlibs {#example-placed-reviews-without-clientlibs}

![](assets/chlimage_1-132.png) 

### Example : Placed Reviews with Clientlibs {#example-placed-reviews-with-clientlibs}

![](assets/chlimage_1-133.png) 

## Identifying Required Clientlibs {#identifying-required-clientlibs}

The essential feature information for developers identifies the required clientlibs.

In addition, from an AEM instance, browsing to the [Community Components Guide](/communities/using/components-guide.md) provides access to a listing of clientlib categories required for a component.

For example, at the very top of the [Reviews page](http://localhost:4502/content/community-components/en/reviews.html) the required clientlibs listed are

* cq.ckeditor
* cq.social.hbs.reviews

![](assets/chlimage_1-134.png) 

## Adding Required Clientlibs {#adding-required-clientlibs}

When it is desired to add a Communities component to a page, it will be necessary to add the required clientlibs for the component if not already present.

Use [CRXDE|Lite](#using-crxde-lite) to modify an existing clientlibslist for a community site page.

To add a clientlib for a community site using [CRXDE Lite](../../sites/developing/using/developing-with-crxde-lite.md) :

* browse to [http://&lt;server&gt;:&lt;port&gt;/crx/de](http://localhost:4502/crx/de)
* locate the `clientlibslist` node for the page on which you wish to add the component

    * `/content/sites/sample/en/page/jcr:content/clientlibslist`

* with `clientlibslist` node selected

    * locate the String[] property `scg:requiredClientLibs`
    * select its `Value` to access the String array dialog

        * scroll down if necessary
        * select + to enter a new client library

            * repeat to add more client libraries

        * select** OK**

    * select **Save All**

>[!NOTE]
>
>If the site is not a community site, the existance or location of the client libraries in use for the site would need to be discovered.

Using the [Getting Started with AEM Communities](../../communities/using/getting-started.md) example, where `site-name` is *engage*, this is how the clientliblist would appear if adding the reviews component :

![](assets/chlimage_1-135.png)


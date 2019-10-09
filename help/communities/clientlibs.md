---
title: Clientlibs for Communities Components
seo-title: Clientlibs for Communities Components
description: Client-side libraries for Communities
seo-description: Client-side libraries for Communities
uuid: 0a62f629-e6af-4269-862e-0595824c329f
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: 7d423dff-8710-4f43-ad55-8863169946e2
---

# Clientlibs for Communities Components {#clientlibs-for-communities-components}

## Introduction {#introduction}

This section of the documentation describes how to add client-side libraries (clientlibs) to a page for Communities components.

For basic information, visit:

* [Using Client-Side Libraries](../../help/sites-developing/clientlibs.md) which provides usage details as well as debugging tools
* [Clientlibs for SCF](client-customize.md#clientlibs) which provides useful information when customizing SCF components
* [Blog: AEM Client Libraries explained by example](https://blogs.adobe.com/experiencedelivers/experience-management/clientlibs-explained-example/)

## Why Clientlibs are Required {#why-clientlibs-are-required}

Clientlibs are required for the proper functioning (JavaScript) and styling (CSS) of a component.

When there exists a [community function](functions.md) for a feature, all necessary components and configurations, including the required clientlibs, will be present in the community site. Only if additional components are to be available to authors would additonal clientlibs need to be added.

When the required clientlibs are missing, [adding a Communities component to a page](author-communities.md) could result in javascript errors as well as an unexpected appearance.

### Example: Placed Reviews without Clientlibs {#example-placed-reviews-without-clientlibs}

![chlimage_1-244](assets/chlimage_1-244.png) 

### Example: Placed Reviews with Clientlibs {#example-placed-reviews-with-clientlibs}

![chlimage_1-245](assets/chlimage_1-245.png) 

## Identifying Required Clientlibs {#identifying-required-clientlibs}

The essential feature information for developers identifies the required clientlibs.

In addition, from an AEM instance, browsing to the [Community Components Guide](components-guide.md) provides access to a listing of clientlib categories required for a component.

For example, at the very top of the [Reviews page](http://localhost:4502/content/community-components/en/reviews.html) the required clientlibs listed are

* cq.ckeditor
* cq.social.hbs.reviews

![chlimage_1-246](assets/chlimage_1-246.png) 

## Adding Required Clientlibs {#adding-required-clientlibs}

When it is desired to add a Communities component to a page, it will be necessary to add the required clientlibs for the component if not already present.

Use [CRXDE|Lite](#using-crxde-lite) to modify an existing clientlibslist for a community site page.

To add a clientlib for a community site using [CRXDE Lite](../../help/sites-developing/developing-with-crxde-lite.md):

* Browse to [https://&lt;server&gt;:&lt;port&gt;/crx/de](http://localhost:4502/crx/de)
* Locate the `clientlibslist` node for the page on which you wish to add the component

    * `/content/sites/sample/en/page/jcr:content/clientlibslist`

* With `clientlibslist` node selected

    * Locate the String[] property `scg:requiredClientLibs`
    * Select its `Value` to access the String array dialog

        * Scroll down if necessary
        * Select `+` to enter a new client library

            * Repeat to add more client libraries

        * Select **[!UICONTROL OK]**

    * Select **[!UICONTROL Save All]**

>[!NOTE]
>
>If the site is not a community site, the existance or location of the client libraries in use for the site would need to be discovered.

Using the [Getting Started with AEM Communities](getting-started.md) example, where `site-name` is *engage*, this is how the clientliblist would appear if adding the reviews component:

![chlimage_1-247](assets/chlimage_1-247.png)


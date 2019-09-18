---
title: Clientlibs for Communities Components
seo-title: Clientlibs for Communities Components
description: Client-side libraries for Communities
seo-description: Client-side libraries for Communities
uuid: 6e810dfa-083a-47e1-bf08-58dfba1b49d1
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: 43d29377-8995-4439-a4b1-69676708d285
index: y
internal: n
snippet: y
---

# Clientlibs for Communities Components{#clientlibs-for-communities-components}

## Introduction {#introduction}

This section of the documentation describes how to add client-side libraries (clientlibs) to a page for Communities components.

For basic information, visit :

* [Using Client-Side Libraries](../../../6-5/sites/developing/using/clientlibs.md) which provides usage details as well as debugging tools
* [Clientlibs for SCF](/6-5/communities/using/client-customize.md#clientlibs) which provides useful information when customizing SCF components
* [Blog : AEM Client Libraries explained by example](http://blogs.adobe.com/experiencedelivers/experience-management/clientlibs-explained-example/)

## Why Clientlibs are Required {#why-clientlibs-are-required}

Clientlibs are required for the proper functioning (JavaScript) and styling (CSS) of a component.

When there exists a [community function](../../../6-5/communities/using/functions.md) for a feature, all necessary components and configurations, including the required clientlibs, will be present in the community site. Only if additional components are to be available to authors would additonal clientlibs need to be added.

When the required clientlibs are missing, [adding a Communities component to a page](../../../6-5/communities/using/author-communities.md) could result in javascript errors as well as an unexpected appearance.

### Example : Placed Reviews without Clientlibs {#example-placed-reviews-without-clientlibs}

![](assets/chlimage_1-188.png) 

### Example : Placed Reviews with Clientlibs {#example-placed-reviews-with-clientlibs}

![](assets/chlimage_1-189.png) 

## Identifying Required Clientlibs {#identifying-required-clientlibs}

The essential feature information for developers identifies the required clientlibs.

In addition, from an AEM instance, browsing to the [Community Components Guide](/6-5/communities/using/components-guide.md) provides access to a listing of clientlib categories required for a component.

For example, at the very top of the [Reviews page](http://localhost:4502/content/community-components/en/reviews.html) the required clientlibs listed are

* cq.ckeditor
* cq.social.hbs.reviews

![](assets/chlimage_1-190.png) 

## Adding Required Clientlibs {#adding-required-clientlibs}

When it is desired to add a Communities component to a page, it will be necessary to add the required clientlibs for the component if not already present.

Use [CRXDE|Lite](#using-crxde-lite) to modify an existing clientlibslist for a community site page.

<!--
Comment Type: draft

<h3>Using Client Libs List Component</h3>
-->

<!--
Comment Type: draft

<p>There is a component in the <span class="code">Community Tools</span> group named <span class="code">Client Lib List</span> (if there are two entries, chose the (Social) version).</p>
<p>When dragged onto a page, it is not visible unless hovered over, and then the component will be outlined. Selecting the invisible component will open a dialog to which client librariess can be entered, similar to adding them directly into the respository using CRXDE|Lite.</p>
-->

<!--
Comment Type: draft

<img imagerotate="0" src="assets/chlimage_1-191.png" />
-->

<!--
Comment Type: draft

<h3>Using CRXDE Lite</h3>
-->

To add a clientlib for a community site using [CRXDE Lite](../../../6-5/sites/developing/using/developing-with-crxde-lite.md) :

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

Using the [Getting Started with AEM Communities](../../../6-5/communities/using/getting-started.md) example, where `site-name` is *engage*, this is how the clientliblist would appear if adding the reviews component :

![](assets/chlimage_1-192.png)


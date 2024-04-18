---
title: Developing and Page Diff
description: Learn how to developing and utilize the page diff feature in Adobe Experience Manager.
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: introduction
content-type: reference
docset: aem65
exl-id: b07134b2-074a-4d52-8d0c-7e7abe51fc3a
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Developing and Page Diff{#developing-and-page-diff}

## Feature Overview {#feature-overview}

Content creation is an iterative process. Authoring with efficiency requires being able to see what has changed from one iteration to another. Viewing one page version and then the other is inefficient and prone to error. An author wants to be able to compare the current page to a previous version side by side with the differences highlighted.

The page diff allows a user to compare the current page to launches, previous versions, and so on. For details of this user feature, see [Page Diff](/help/sites-authoring/page-diff.md).

## Operation Details {#operation-details}

When comparing versions of a page, the previous version that the user wishes to compare is recreated by AEM in the background to facilitate the diff. This is needed to be able to render the content [for side-by-side comparison](/help/sites-developing/pagediff.md#operation-details).

This recreation operation is done by AEM internally and is transparent to the user and requires no intervention. However an administrator viewing the repository, for example,  in CRXDE Lite would see these recreated versions within the content structure.

When content is compared, the whole tree up to the page to compare is recreated in the following location:

`/tmp/versionhistory/`

A cleanup task runs automatically to clean up this temporary content.

## Permissions {#permissions}

Previously, in Classic UI, special development consideration had to be made to facilitate AEM diffing (such as using `cq:text` tag lib, or custom integrating the `DiffService` OSGi service into components). This is no longer needed for the new diff feature, since the diff occurs client-side via DOM comparison.

However, there are some limitations that must be considered by the developer.

* This feature uses CSS classes that are not namespaced to the AEM Product. If other custom CSS classes or third-party CSS classes with the same names are included on the page, the display of the diff may be affected.

    * `html-added`
    * `html-removed`
    * `cq-component-added`
    * `cq-component-removed`
    * `cq-component-moved`
    * `cq-component-changed`

* Because the diff is client-side and executes on page load, any adjustments to the DOM after the client-side diff service has run will not be accounted for. This may affect

    * Components that use AJAX to include content
    * Single Page Applications
    * JavaScript based components that manipulate the DOM upon user interaction.

>[!NOTE]
>
>Page diff comparison works only for the components which have valid cq:editConfig nodes.

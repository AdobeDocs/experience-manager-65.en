---
title: App Templates and Components
seo-title: App Templates and Components
description: Follow this page to learn about App Templates and Components. It provides detailed information on the structure of templates.
seo-description: Follow this page to learn about App Templates and Components. It provides detailed information on the structure of templates.
uuid: ba2fd91b-de5a-4f39-a976-5455f9983669
contentOwner: User
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/MOBILE
topic-tags: developing-on-demand-services-app
discoiquuid: 7f31c6a7-92d5-4a87-a9f0-68a82b834d5a
exl-id: 58d95325-7cb1-4204-842d-17add70e1fbf
---
# App Templates and Components{#app-templates-and-components}

>[!NOTE]
>
>Adobe recommends using the SPA Editor for projects that require single page application framework-based client-side rendering (e.g. React). [Learn more](/help/sites-developing/spa-overview.md).

A Template is used to create a Page and defines which components can be used within the selected scope. A template is a hierarchy of nodes that has the same structure as the page to be created, but without any actual content.

Each Template will present you with a selection of components available for use.

* Templates are built up of [Components](/help/sites-developing/components.md);
* Components use, and allow access to, Widgets and these are used to render the Content.

>[!NOTE]
>
>To learn how to develop your AEM application using CRXDE Lite, see [Developing with CRXDE Lite](/help/sites-developing/developing-with-crxde-lite.md).

A template is the basis of a page.

To create a page, the template must be copied (node-tree **/apps/&lt;myapp&gt;/templates/&lt;mytemplate&gt;**) to the corresponding position in the site-tree: this is what happens if a page is created using the **Websites** tab.

This copy action also gives the page its initial content (usually Top-Level Content only) and the property sling:resourceType, the path to the page component that is used to render the page (everything in the child node jcr:content).

## Structure of a Template {#structure-of-a-template}

There are two aspects to be considered:

* the structure of the template itself
* the structure of the content produced when a template is used

A Template is created under a node of type **cq:Template**.

Various properties can be set, in particular:

* **jcr:title** - title for the template; appears in the dialog when creating a page.
* **jcr:description** - description for the template; appears in the dialog when creating a page.

This node contains *a jcr:content (cq:PageContent)* node which be used as the basis for the content node of resulting pages; this references, using *sling:resourceType*, the component to be used for rendering the actual content of a new page.

>[!NOTE]
>
>To learn the basics for templates and components in AEM, see the resources below:
>
>* [Templates](/help/sites-developing/templates.md)
>* [Components](/help/sites-developing/components.md)
>

After you have the basic understanding of Templates and Components, see the following resources:

* [Creating and Adding Templates and Components](/help/mobile/mobile-ondemand-app-templates.md)
* [Using Content Properties to Export Content](/help/mobile/on-demand-content-properties-exporting.md)
* [Best Practices](/help/mobile/best-practices-aem-mobile.md)
* [Developing AEM Mobile Content Services](/help/mobile/developing-content-services.md)

### Additional Resources {#additional-resources}

To learn about additional topics on mobile apps, see the links below:

* [Mobile with Content Sync](/help/mobile/mobile-ondemand-contentsync.md)
* [Testing Mobile Apps](/help/mobile/develop-mobile-apps-testing.md)

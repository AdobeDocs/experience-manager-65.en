---
title: SPA Introduction and Walkthrough
seo-title: SPA Introduction and Walkthrough
description: This article introduces the concepts of a SPA and walks through using a basic SPA application for authoring, showing how it relates to the underlying AEM SPA Editor.
seo-description: This article introduces the concepts of a SPA and walks through using a basic SPA application for authoring, showing how it relates to the underlying AEM SPA Editor.
uuid: 4b0a9e53-3892-4d60-8bd3-7ff740d2f137
contentOwner: bohnert
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: spa
content-type: reference
discoiquuid: 0478afcb-b029-4ce6-b3e6-cee4bb5408ce
docset: aem65
exl-id: 95990112-2afc-420a-a7c7-9613f40d4c4a
---
# SPA Introduction and Walkthrough{#spa-introduction-and-walkthrough}

Single page applications (SPAs) can offer compelling experiences for website users. Developers want to be able to build sites using SPA frameworks and authors want to seamlessly edit content within AEM for a site built using such frameworks.

The SPA Editor offers a comprehensive solution for supporting SPAs within AEM. This article walks through using a basic SPA application for authoring and shows how it relates to the underlying AEM SPA Editor.

>[!NOTE]
>
>The SPA Editor is the recommended solution for projects that require SPA framework based client-side rendering (e.g. React or Angular).

## Introduction {#introduction}

### Article Objective {#article-objective}

This article introduces the basic concepts of SPAs before leading the reader through a walkthrough of the SPA editor by using a simple SPA application to demonstrate basic content editing. It then dives down into the construction of the page and how the SPA application relates to and interacts with the AEM SPA Editor.

The goal of this introduction and walkthrough is to demonstrate to an AEM developer why SPAs are relevant, how they generally work, how a SPA is handled by the AEM SPA Editor, and how it is different from a standard AEM application.

The walkthrough is based on standard AEM functionality and the sample We.Retail Journal app. The following requirements must be met:

* [AEM version 6.4 with service pack 2 or newer](/help/release-notes/release-notes.md)
* [Install the sample We.Retail Journal app available on GitHub here.](https://github.com/Adobe-Marketing-Cloud/aem-sample-we-retail-journal)

>[!CAUTION]
>
>This document uses the [We.Retail Journal app](https://github.com/Adobe-Marketing-Cloud/aem-sample-we-retail-journal) for demonstration purposes only. It should not be used for any project work.
>
>Any AEM project should leverage the [AEM Project Archetype](https://docs.adobe.com/content/help/en/experience-manager-core-components/using/developing/archetype/overview.html), which supports SPA projects using React or Angular and leverages the SPA SDK.

### What is a SPA? {#what-is-a-spa}

A single-page application (SPA) differs from a conventional page in that it is rendered client-side and is primarily Javascript-driven, relying on Ajax calls to load data and dynamically update the page. Most or all content is retrieved once in a single page load with additional resources loaded asynchronously as needed based on user interaction with the page.

This reduces the need for page refreshes and presents an experience to the user that is seamless, fast, and feels more like a native app experience.

The AEM SPA Editor allows front-end developers to create SPAs that can be integrated into an AEM site, allowing the content authors to edit the SPA content as easily as any other AEM content.

### Why a SPA? {#why-a-spa}

By being faster, fluid, and more like a native application, a SPA becomes a very attractive experience not only for the visitor of the webpage, but also for marketers and developers due to the nature of how SPAs work.

![screen_shot_2018-08-20at135550](assets/screen_shot_2018-08-20at135550.png)

**Visitors**

* Visitors want native-like experiences when they interact with content.
* There is clear data that the faster a page, the more likely a conversion will occur.

**Marketers**

* Marketers want to offer rich, native-like experiences to entice visitors to fully engage with content.
* Personalization can make these experiences even more compelling.

**Developers**

* Developers want a clean separation of concerns between content and presentation.
* Clean separation makes the system more extensible as well as allow for independent front-end development.

### How Does a SPA Work? {#how-does-a-spa-work}

The primary idea behind a SPA is that calls and dependency on a server are reduced in order to minimize delays caused by server calls so that the SPA approaches the responsiveness of a native application.

In a traditional, sequential webpage, only the data needed for the immediate page is loaded. This means that when the visitor moves to another page, the server is called for the additional resources. Additinoal calls might be necessary as the visitor interacts with elements on the page. These multiple calls can give a sense of lag or delay as the page has to catch up with the visitor's requests.

![screen_shot_2018-08-20at140449](assets/screen_shot_2018-08-20at140449.png)

For a more fluid experience, that approaches what a visitor expects from mobile, native apps, a SPA loads all necessary data for the visitor on the first load. Although this might take a bit longer at first, it then eliminates the need for additional server calls.

By rendering on the client side, page element react faster, and interactions with the page by the visitor are immediate. Any additional data that might be needed is called asynchronously to maximize the speed of the page.

>[!NOTE]
>
>For technical details on how SPAs work in AEM, see the article [Getting Started with SPAs in AEM](/help/sites-developing/spa-getting-started-react.md).
>
>For a closer look at the design, architecture, and technical workflow of the SPA Editor, see the article [SPA Editor Overview](/help/sites-developing/spa-overview.md).

## Content Editing Experience with SPA {#content-editing-experience-with-spa}

When an SPA is built to leverage the AEM SPA Editor, the content author notices no difference when editing and creating content. Common AEM functionality is available and no changes to the author's workflow is required.

>[!NOTE]
>
>The walkthrough is based on standard AEM functionality and the sample We.Retail Journal app. The following requirements must be met:
>
>* [AEM version 6.4 with service pack 2](/help/release-notes/release-notes.md)
>* [Install the sample We.Retail Journal app available on GitHub here.](https://github.com/Adobe-Marketing-Cloud/aem-sample-we-retail-journal)
>

1. Edit the We.Retail Journal app in AEM.

   `https://localhost:4502/editor.html/content/we-retail-journal/react.html`

   ![screen_shot_2018-06-07at142533](assets/screen_shot_2018-06-07at142533.png)

1. Select a heading component and notice that a toolbar appears like for any other component. Select **Edit**.

   ![screen_shot_2018-06-07at142937](assets/screen_shot_2018-06-07at142937.png)

1. Edit the content as normal within AEM and note that the changes are persisted.

   ![screen_shot_2018-06-07at143419](assets/screen_shot_2018-06-07at143419.png)

   >[!NOTE]
   >See the [SPA Editor Overview](spa-overview.md#requirements-limitations) for further information about the in place text editor and SPAs.

1. Use the Assets Browser to drag-and-drop a new image into an image component.

   ![screen_shot_2018-06-07at143530](assets/screen_shot_2018-06-07at143530.png)

1. The change is persisted.

   ![screen_shot_2018-06-07at143732](assets/screen_shot_2018-06-07at143732.png)

Additional authoring tools such as dragging-and-dropping additional components on the page, rearranging components, and modifying the layout are supported as in any non-SPA application.

>[!NOTE]
>
>The SPA Editor does not modify the DOM of the application. The SPA itself is responsible for the DOM.
>
>To see how this works, continue on to the next section of this article [SPA Apps and the AEM SPA Editor](/help/sites-developing/spa-walkthrough.md#spa-apps-and-the-aem-spa-editor).

## SPA Apps and the AEM SPA Editor {#spa-apps-and-the-aem-spa-editor}

Experiencing how an SPA behaves for the end user and then inspecting the SPA page helps to better understand how an SAP app works with the SPA Editor in AEM.

### Using an SPA Application {#using-an-spa-application}

1. Load the We.Retail Journal application either on the publish server or using the option **View as Published** from the **Page Information** menu in the page editor.

   `/content/we-retail-journal/react.html`

   ![screen_shot_2018-06-08at102650](assets/screen_shot_2018-06-08at102650.png)

   Note the pages structure including navigation to child pages, weather widget, and articles.

1. Navigate to a child page using the menu and see that the page loads immediately without the need for a refresh.

   ![screen_shot_2018-06-08at102815](assets/screen_shot_2018-06-08at102815.png)

1. Open your browser's built-in developer tools and monitor network activity as you navigate the child pages.

   ![screen_shot_2018-06-08at103922](assets/screen_shot_2018-06-08at103922.png)

   There is very little traffic as you move from page to page in the app. The page is not reloaded and only the new images are requested.

   The SPA manages the content and routing entirely on the client side.

So if the page is not reloaded when navigating through the child pages, how is it loaded?

The next section, [Loading an SPA Application](/help/sites-developing/spa-walkthrough.md#loading-an-spa-application), digs deeper into the mechanics of loading the SPA and how content can be loaded synchronously and asynchronously.

### Loading an SPA Application {#loading-an-spa-application}

1. If not already loaded, load the We.Retail Journal application either on the publish server or using the option **View as Published** from the **Page Information** menu in the page editor.

   `/content/we-retail-journal/react.html`

   ![screen_shot_2018-06-07at144736](assets/screen_shot_2018-06-07at144736.png)

1. Use the built-in tool of your browser to view the source of the page.
1. Note that the content of the source is extremely limited.

   ```
   <!DOCTYPE HTML>
   <html lang="en-CH">
       <head>
       <meta charset="UTF-8">
       <title>We.Retail Journal</title>

       <meta name="template" content="we-retail-react-template"/>

   <link rel="stylesheet" href="/etc.clientlibs/we-retail-journal/react/clientlibs/we-retail-journal-react.css" type="text/css">

   <link rel="stylesheet" href="/libs/wcm/foundation/components/page/responsive.css" type="text/css">

   </head>
       <body class="page basicpage">

   <div id="page"></div>

   <script type="text/javascript" src="/etc.clientlibs/we-retail-journal/react/clientlibs/we-retail-journal-react.js"></script>

       </body>
   </html>
   ```

   The page does not have any content within its body. It is primarily made up of stylesheets and a call to a React script, `we-retail-journal-react.js`.

   This React script is the primary driver of this application and is responsible for rendering all content.

1. Use your browser's built-in tools to inspect the page. See the content of the DOM fully loaded.

   ![screen_shot_2018-06-07at151848](assets/screen_shot_2018-06-07at151848.png)

1. Switch to the Network tab in the Inspector and reload the page.

   Ignoring image requests, note that the primary resources loaded for the page are the page itself, CSS, the React Javascript, its dependencies, as well as JSON data for the page.

   ![screen_shot_2018-06-07at152155](assets/screen_shot_2018-06-07at152155.png)

1. Load the `react.model.json` in a new tab.

   `/content/we-retail-journal/react.model.json`

   ![screen_shot_2018-06-07at152636](assets/screen_shot_2018-06-07at152636.png)

   The AEM SPA Editor leverages [AEM Content Services](/help/assets/content-fragments/content-fragments.md) to deliver the entire content of the page as a JSON model.

   By implementing specific interfaces, Sling Models provide the information necessary to the SPA. The delivery of the JSON data is delegated downward to each component (from page, to paragraph, to component, etc.).

   Each component chooses what it exposes and how it is rendered (server-side with HTL or client-side with React). Of course this article focuses on client-side rendering with React.

1. The model can also group pages together so that they are loaded synchronously, reducing the number of page reloads needed.

   In the example of We.Retail Journal, the `home`, `blog`, and `aboutus` pages are loaded synchronously, since visitors commonly visit all of those pages. However the `weather` page is loaded asynchronously, since visitors are less likely to visit it.

   This behavior is not mandatory and is fully definable.

   ![screen_shot_2018-06-07at153945](assets/screen_shot_2018-06-07at153945.png)

1. To view this difference in behavior, reload the page and clear the network activity of the inspector. Navigate to the blog and about us pages in the page menu and see that there is no network activity reported.

   Navigate to the weather page and see that the `weather.model.json` is called asynchronously.

   ![screen_shot_2018-06-07at155738](assets/screen_shot_2018-06-07at155738.png)

### Interaction with the SPA Editor {#interaction-with-the-spa-editor}

Using the sample We.Retail Journal application, it is clear how the app behaves and is loaded when published, leveraging content services for JSON content delivery as well as asynchronous loading of resources.

Additionally, for the content author, content creation using a SPA editor is seamless within AEM.

In the following section we will explore the contract that allows the SPA Editor to relate components within the SPA to AEM components and achieve this seamless editing experience.

1. Load the We.Retail Journal application in the editor and switch to **Preview** mode.

   `https://localhost:4502/editor.html/content/we-retail-journal/react.html`

1. Using your browser's built-in developer tools, inspect the content of the page. Using the selection tool, select an editable component on the page and view the element detail.

   Note that the component has a new data attribute `data-cq-data-path`.

   ![screen_shot_2018-06-08at095124](assets/screen_shot_2018-06-08at095124.png)

   For example

   `data-cq-data-path="root/responsivegrid/paragraph_1`

   This paths allows the retrieval and association of the edit context configuration object of each component.

   This is the only markup attribute required for the editor to recognize this as an editable component within the SPA. Based on this attribute, the SPA Editor will determine which editable configuration is associated with the component, so that the correct frame, toolbar, etc. is loaded.

   Some specific class names are also added for marking placeholders and for asset drag-and-drop functionality.

   >[!NOTE]
   >
   >This is a change in behavior from server-side rendered pages in AEM, where there is a `cq` element inserted for each editable component.
   >
   >
   >This approach in SPA removes the need to inject custom elements, relying only an additional data attribute, making the markup simpler for the frontend developer.

## Next Steps {#next-steps}

Now that you understand the SPA editing experience in AEM and how a SPA relates to the SPA Editor, take a deeper dive into understanding how a SPA is built.

* [Getting Started with SPAs in AEM](/help/sites-developing/spa-getting-started-react.md) shows how a basic SPA is built to work with the SPA Editor in AEM
* [SPA Editor Overview](/help/sites-developing/spa-overview.md) goes into more depth into the communication model between AEM and the SPA.
* [Developing SPAs for AEM](/help/sites-developing/spa-architecture.md) describes how to engage front-end developers to develop a SPA for AEM as well as how SPAs interact with AEM's architecture.

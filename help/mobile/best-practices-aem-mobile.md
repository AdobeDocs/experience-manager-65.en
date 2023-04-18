---
title: Best Practices for AEM Mobile On-Demand Services

description: Learn about best practices and guidelines that help experienced AEM developers for sites, who want to build mobile app templates and components.

uuid: 7733c8b1-a88c-455c-8080-f7add4205b92
contentOwner: User
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/MOBILE
topic-tags: developing-on-demand-services-app
discoiquuid: a0647696-72c3-409b-85ba-9275d8f99cff
exl-id: 63ceaba6-b796-4c13-a86d-f0609ec679c9
---
# Best Practices {#best-practices}

>[!NOTE]
>
>Adobe recommends using the SPA Editor for projects that require single page application framework-based client-side rendering (e.g. React). [Learn more](/help/sites-developing/spa-overview.md).

Building an AEM Mobile On-Demand Services App is different than building an app that runs in the Cordova (or PhoneGap) shell directly. The developers should be familiar with the:

* Plugins that are supported out of the box as well as the AEM Mobile specific plugins.

>[!NOTE]
>
>To learn in-depth about plugins, see the following resources:
>
>* [Using Cordova plug-ins in AEM Mobile](https://helpx.adobe.com/digital-publishing-solution/help/cordova-api.html)
>* [Using AEM Mobile specific Cordova-enabled plug-ins](https://helpx.adobe.com/digital-publishing-solution/help/app-runtime-api.html)
>

* Templates which use plugin functionality should be written in such a way that they are still authorable in the browser, without the plugin bridge being present.

  * For example, make sure to wait for the *deviceready* function before attempting to access a plugin's API.

## Guidelines for AEM Developers {#guidelines-for-aem-developers}

The following guidelines will help experienced AEM developers for sites, who want to build mobile app templates and components:

**Structure AEM sites templates to encourage reuse and extensibility**

* Prefer multiple component script files over a single monolithic one

  * A number of empty extension points are provided, such as *customheaderlibs.html* and *customfooterlibs.html*, which allow the developer to change the page template while duplicating as little core code as possible
  * Templates can then be extended and customized via Sling's *sling:resourceSuperType* mechanism

* Prefer Sightly/HTL over JSP as the templating language

  * Using this encourages a separation of code from markup, offers built in XSS protection, and has a more familiar syntax

**Optimize for on-device performance**

* Article specific script and stylesheets should be included in the article payload, using the dps-article contentsync template
* Script and stylesheets shared by more than one article should be included in shared resources, via the dps-HTMLResources contentsync template
* Do not reference any external scripts that are render-blocking

>[!NOTE]
>
>You can learn more in detail about render-blocking external scripts [here](https://developers.google.com/speed/docs/insights/BlockingJS).

**Prefer app-specific clientside JS and CSS libraries over web-specific**

* To avoid overhead in libraries like jQuery Mobile to handle a huge breadth of devices and browsers
* When a template is running in an app's webview, you have control over the platforms and versions that app is going to support, as well as the knowledge that JavaScript support will be present. For example, prefer Ionic (perhaps just the CSS) over jQuery Mobile and Onsen UI over Bootstrap.

>[!NOTE]
>
>To learn more in-depth about jQuery mobile, click [here](https://jquerymobile.com/browser-support/1.4/).

**Prefer micro libraries over full-stack**

* The time it takes to get your content onto the glass of the device will be slowed down by every library your article(s) depend upon. This slowdown is compounded when a new webview is used to render every article, so each library must be initialized again from scratch
* If your articles are not built as SPAs (single page apps), you probably do not need to include a full stack library like Angular
* Prefer smaller, single purpose libraries to help add the interactivity your page requires, such as [Fastclick](https://github.com/ftlabs/fastclick) or [Velocity.js](https://velocityjs.org)

**Minimize size of article payload**

* Use the smallest assets possible that can effectively cover the largest viewport you will be supporting, at a reasonable resolution
* Use a tool like *ImageOptim* on your images to remove any excess metadata

## Getting Ahead {#getting-ahead}

To understand more on the other two roles and responsibilities, see the resources below:

* [Administrator](/help/mobile/aem-mobile.md)
* [Author](/help/mobile/aem-mobile-on-demand.md)

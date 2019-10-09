---
title: Is your hybrid app ready for AEM Mobile?
seo-title: Is your hybrid app ready for AEM Mobile?
description: Follow this page to learn about hrybrid apps. An app in AEM is commonly divided into two parts. The 'shell' and 'content' and this page provides more insight on these topics.
seo-description: Follow this page to learn about hrybrid apps. An app in AEM is commonly divided into two parts. The 'shell' and 'content' and this page provides more insight on these topics.
uuid: cbcce3fa-9100-46ea-9f24-931b42666709
contentOwner: User
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/MOBILE
topic-tags: developing-adobe-phonegap-enterprise
discoiquuid: b7fd7954-f2a5-402d-b259-e18b5a618be9
pagetitle: Is your hybrid app ready for AEM Mobile?
---

# Is your hybrid app ready for AEM Mobile?{#is-your-hybrid-app-ready-for-aem-mobile}

>[!NOTE]
>
>Adobe recommends using the SPA Editor for projects that require single page application framework-based client-side rendering (e.g. React). [Learn more](/help/sites-developing/spa-overview.md).

So you've imported your Hybrid PhoneGap or Cordova app into AEM, now what? Likely you will want to add authorable content to your app. To accomplish this task you will need a general understanding of the structure of an AEM app. An app in AEM is commonly divided into two parts. The 'shell' and 'content'. The 'shell' comprises of the static parts of your app; such as the PhoneGap configuration files, the app framework, and the navigation controls. The contents of the archive that you imported are stored as part of the shell. In the context of this document, the shell is all the non-AEM authored content of your Hybrid PhoneGap app built by the app developer.

Content refers to the components, templates and authored pages that are authored in AEM built by the AEM Developer. Content is categorized as either developer content or as authored content. Components, designs and page templates are considered to be dev-content since they are built by a developer. author-content are pages that have been built using the components and templates. These are typically done by a designer or a marketer.

Adding authored AEM pages to your Hybrid app requires coordination between the app developer and the AEM developer. Anywhere in the app where you want to add authored content, the app developer needs to organise these pages in a structure that can be overlayed in AEM. The app developer must be able to provide the AEM developer with the paths to where the AEM authored content to be added and then provide a placeholder page in the Hybrid app that will be replaced after the AEM developer has authored the page content.

To make the explanation easier to follow we will be using the AEM Marketing Cloud: AEM Mobile Hybrid Reference to explain the concepts. The Hybrid Reference app consists of a weclome page with a side menu.

![chlimage_1-76](assets/chlimage_1-76.png)

In this example we are going to author the welcome page of the application. Taking a look at the source [https://github.com/Adobe-Marketing-Cloud-Apps/aem-mobile-hybrid-reference/blob/master/hybrid-app/www/js/app.js#L75](https://github.com/Adobe-Marketing-Cloud-Apps/aem-mobile-hybrid-reference/blob/master/hybrid-app/www/js/app.js#L75). We see that the app developer has defined a welcome page and provided a template for the page which is rendered by the app. This is where the app developer and AEM developer need to coordinate. The path to the welcome page template in the Hybrid Reference App is defined as ''content/mobileapps/hybrid-reference-app/en/welcome.template.html''. This path is extremely important because the AEM developer will author their welcome page in the AEM repository using the same path.

![chlimage_1-77](assets/chlimage_1-77.png)

It is important the hybrid app and the AEM authored content use the same path because we rely on the ability to overlay content using Content Sync to add new pages to the Hybrid app. When the Hybrid App is imported into AEM as part of the import process Content Sync configurations are setup.

![chlimage_1-78](assets/chlimage_1-78.png)

When you 'Download Source' from the app dashboard these ContentSync scripts are run to assemble an archive of your Hybrid App.

![chlimage_1-79](assets/chlimage_1-79.png)

ContentSync first pulls in 'shell' of the app which is where all the app developed content of the Hybrid app is stored and then it pulls in the 'content' of the app. Now if there are pages in the 'shell' that have the same path as in 'content' the pages under 'shell' will be (replaced) by the pages under 'content'. In other words in the Hybrid Reference App sample if we create a page in AEM that has the same path as ''content/mobileapps/hybrid-reference-app/en/welcome.template.html'' when ContentSync runs it will overlay the page that was part of the Hybrid Reference app with whatever is in AEM at that location. The overlay is taken care by ContentSync so for someone who's using the app the updates to app with AEM authored content will look seamless and will not require a rebuild of the app. As a result when you run the app the welcome page will appear as follows:

![chlimage_1-80](assets/chlimage_1-80.png)

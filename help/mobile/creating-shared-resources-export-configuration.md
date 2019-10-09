---
title: Creating Shared Resources Export Configuration
seo-title: Creating Shared Resources Export Configuration
description: Follow this page to learn about exporting shared resources from Adobe Experience Manager (AEM) for upload to AEM Mobile.
seo-description: Follow this page to learn about exporting shared resources from Adobe Experience Manager (AEM) for upload to AEM Mobile.
uuid: 99b8ff94-8135-4643-a15b-aa6fb91f5401
contentOwner: User
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/MOBILE
topic-tags: developing-on-demand-services-app
discoiquuid: 1edf6c76-ccb1-40b6-bdf6-924f1461cd28
---

# Creating Shared Resources Export Configuration{#creating-shared-resources-export-configuration}

>[!NOTE]
>
>Adobe recommends using the SPA Editor for projects that require single page application framework-based client-side rendering (e.g. React). [Learn more](/help/sites-developing/spa-overview.md).

>[!CAUTION]
>
>**Prerequisite**:
>
>Prior to learn about creating and modifying shared resources, see [Content Sync](/help/mobile/mobile-ondemand-contentsync.md) to understand the basic concepts.

AEM Mobile users use Content Sync to export live content to static content for use in Mobile Apps and this export occurs when content is uploaded to Mobile On-Demand Services from AEM Mobile.

The property ***dps-exportTemplate*** mentioned in table above, defines the path to the app's export configs. Set this property to create and modify shared resources.

The following resources describes exporting shared resources from Adobe Experience Manager (AEM) for upload to AEM Mobile.

Shared HTML Resources allows articles to share HTML resources that would otherwise need to be duplicated for all articles and can include icons, fonts, javascript, and css.

The Content Sync configuration found at **&lt;dps-exportTemplate&gt;/dps-HTMLResources&gt;** should be configured to export all the content an article required for property static rendering on device.

>[!CAUTION]
>
>You can perform the steps below to view sample shared resources, only if you have:
>
>* installed the sample content
>* running AEM instance
>* no configured custom context or a different port
>

To view sample shared resource, see the steps below:

1. Open CRXDE Lite on your AEM server.
1. Browse to this path *[/etc/contentsync/templates/dps-we-unlimited-app/dps-HTMLResources](http://localhost:4502/crx/de/index.jsp#/etc/contentsync/templates/dps-we-unlimited-app/dps-HTMLResources)*, to view the sample shared resources.

   You can view all the properties required for creating your shared resources as shown in the figure below:

   ![chlimage_1-145](assets/chlimage_1-145.png)

>[!NOTE]
>
>Shared resources should be uploaded or exported to AEM Mobile On-Demand Services when any of the shared resources change.


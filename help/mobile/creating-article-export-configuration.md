---
title: Creating Article Export Configuration

description: Follow this page to learn about exporting content from Adobe Experience Manager (AEM) for upload to AEM Mobile.


contentOwner: User
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/MOBILE
topic-tags: developing-on-demand-services-app

exl-id: 5295f383-3b46-4456-9177-65de68e39a85
solution: Experience Manager
feature: Mobile
role: User
---
# Creating Article Export Configuration{#creating-article-export-configuration}

{{ue-over-mobile}}

>[!CAUTION]
>
>**Prerequisite**:
>
>Prior to learn about creating and modifying shared resources, see [Content Sync](/help/mobile/mobile-ondemand-contentsync.md) to understand the basic concepts.

AEM Mobile users use Content Sync to export live content to static content for use in Mobile Apps and this export occurs when content is uploaded to Mobile On-Demand Services from AEM Mobile.

The property ***dps-exportTemplate*** mentioned in table above, defines the path to the app's export configs. Set this property to create and modify shared resources.

The following resources describes exporting content from Adobe Experience Manager (AEM) for upload to AEM Mobile.

Articles have content that needs to be exported and uploaded. Some of this content can be shared between Articles.

Use [ContentSync](/help/mobile/mobile-ondemand-contentsync.md) to gather the content together and create a ***Shared Resources*** package.

The ContentSync configuration found at **&lt;dps-exportTemplate&gt;/dps-article&gt;** should be configured to export all the content an article required for property static rendering on device.

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
1. Browse to this path [/etc/contentsync/templates/dps-we-unlimited-app/dps-article](http://localhost:4502/crx/de/index.jsp#/etc/contentsync/templates/dps-we-unlimited-app/dps-article), to view the sample shared resources.

   You can view all the properties required for creating your shared resources as shown in the figure below:

   ![chlimage_1-134](assets/chlimage_1-134.png)

>[!NOTE]
>
>Articles should be uploaded or exported to AEM Mobile On-Demand Services when an articles content changes.

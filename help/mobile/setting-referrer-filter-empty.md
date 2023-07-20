---
title: Setting Your Referrer Filter to Allow Empty
seo-title: Setting Your Referrer Filter to Allow Empty
description: Follow this page to learn about Referrer Filter. In order to allow the AEM Mobile Application Viewer to view apps on your Author instance, you'll need to set your HTML referrer filter to 'allow empty'.
seo-description: Follow this page to learn about Referrer Filter. In order to allow the AEM Mobile Application Viewer to view apps on your Author instance, you'll need to set your HTML referrer filter to 'allow empty'.
uuid: 4fb0f95c-ac8f-4a14-8c46-6616d9d4f380
contentOwner: User
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/MOBILE
topic-tags: administering-adobe-phonegap-enterprise
discoiquuid: 8fb7d088-94bf-4799-98b3-8fa58eef83df
exl-id: 2f02f541-92db-469b-bf23-ec64d2e282ff
---
# Setting Your Referrer Filter to Allow Empty{#setting-your-referrer-filter-to-allow-empty}

>[!NOTE]
>
>Adobe recommends using the SPA Editor for projects that require single page application framework-based client-side rendering (for example, React). [Learn more](/help/sites-developing/spa-overview.md).

In order to allow the AEM Mobile Application Viewer to view apps on your Author instance, you'll need to set your HTML referrer filter to 'allow empty'.

If you do not intend to use the Applicaiton Viewer to review applications within development and staging states, you do not need to change the default setting of the referrer filter.

Within your running Author instance of AEM, navigate to: [http://localhost:4502/system/console/configMgr](http://localhost:4502/system/console/configMgr) and search for 'Apache Sling Referrer Filter'. Click to edit the referrer filter and check the 'allow empty' checkbox (see image below). Next hit the save button and close the browser page.

![Referrer Filter settings](assets/chlimage_1-106.png)

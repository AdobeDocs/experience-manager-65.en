---
title: Integrating with Adobe Analytics

description: Learn how to integrate Adobe Experience Manager (AEM) with Adobe Analytics.


contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: integration
content-type: reference

docset: aem65
exl-id: 0a87ece4-57ed-4022-a78a-264c1edf4b4e
solution: Experience Manager, Experience Manager Sites
feature: Integration
role: Admin
---
# Integrating with Adobe Analytics{#integrating-with-adobe-analytics}

Integrating Adobe Analytics and AEM lets you track your web page activity:

* An Adobe Analytics configuration enables AEM to authenticate with Adobe Analytics.
* A framework identifies the data that is sent to your Adobe Analytics report suite.

The data includes page and user data; for example:

* data that AEM components collect
* link clicks
* video usage information
* the number of page visits from Adobe Analytics

The following pages help you configure the integration:

* [Connecting to Adobe Analytics and Creating Frameworks](/help/sites-administering/adobeanalytics-connect.md)
* [Configuring Link Tracking for Adobe Analytics](/help/sites-administering/adobeanalytics-link.md)
* [Mapping Component Data with Adobe Analytics Properties](/help/sites-administering/adobeanalytics-mapping.md)
* [Configuring Video Tracking for Adobe Analytics](/help/sites-administering/adobeanalytics-video.md)
* [Adobe Classifications](/help/sites-administering/adobeanalytics-classifications.md)

You can also use the [Opt-in wizard](/help/sites-administering/opt-in.md) to easily perform the integration.

>[!NOTE]
>
>See also the how-to article: [Integrating AEM with Adobe Target and Adobe Analytics using DTM](https://helpx.adobe.com/experience-manager/using/integrate-digital-marketing-solutions.html).

## Further Information {#further-information}

See:

* [Extending the Adobe Analytics Integration](/help/sites-developing/extending-analytics.md) for information about developing components that collect user data and customizing the Adobe Analytics framework.
* The knowledge base article, [Adobe Analytics integration - troubleshooting issues](https://helpx.adobe.com/experience-manager/kb/sitecatalystintegrationtroubleshooting.html), for information about troubleshooting your Adobe Analytics integration.

>[!NOTE]
>
>If you are using Adobe Analytics with a custom proxy configuration, you need to [configure two OSGi bundles](/help/sites-deploying/configuring-osgi.md) (for example, with the Web console) required for the **Apache HTTP Client** proxy configurations. Both are required as some functionalities of AEM use the 3.x APIs, while others use the 4.x APIs. Configure:
>
>* **Day Commons HTTP Client 3.1** to configure the 3.x API;
>  for example, [https://localhost:4502/system/console/configMgr/com.day.commons.httpclient](https://localhost:4502/system/console/configMgr/com.day.commons.httpclient)
>
>* **Apache HTTP Components Proxy Configuration** to configure the 4.x API;
>  for example, [https://localhost:4502/system/console/configMgr/org.apache.http.proxyconfigurator](https://localhost:4502/system/console/configMgr/org.apache.http.proxyconfigurator)
>

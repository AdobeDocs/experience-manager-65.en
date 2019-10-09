---
title: Configuring for AEM Apps
seo-title: Configuring for AEM Apps
description: Learn how to configure AEM Apps.
seo-description: Learn how to configure AEM Apps.
uuid: ab9acd93-da7f-4bb7-8d26-224044899068
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: operations
content-type: reference
discoiquuid: 34f24837-f5e2-41f0-a359-fdb695e1b8f2
---

# Configuring for AEM Apps{#configuring-for-aem-apps}

Adobe Experience Manager Apps provides the ability to update the content of your application over the air (OTA). The updated content is stored on the publish instance. To allow the App on your device to connect to the publish instance and check for updates the publish instance needs to be configured to allow an empty referrer header.

## Configuring Empty Referrer Header {#configuring-empty-referrer-header}

To configure the referrer filter service:

* Open the Apache Felix console (**Configurations**) at:  
* https://&lt;server&gt;:&lt;port_number&gt;/system/console/configMgr
* Login as admin.
* In the **Configurations** menu, select: *Apache Sling Referrer Filter*
* Check the Allow Empty field, to allow empty/missing referrer headers.
* Click **Save** to save your changes.

![chlimage_1-58](assets/chlimage_1-58.png)

See the [OSGI Configuration Settings](/help/sites-deploying/osgi-configuration-settings.md) and [Security Checklist - Issues with Cross-Site Request Forgery](/help/sites-administering/security-checklist.md#protect-against-cross-site-request-forgery) for further details. 

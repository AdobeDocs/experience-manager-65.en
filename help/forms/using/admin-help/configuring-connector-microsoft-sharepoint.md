---
title: Configuring Connector for Microsoft SharePoint

description: Configure Connector for Microsoft SharePoint to enable communication between AEM forms and Microsoft SharePoint.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/connecting_to_a_content_management_system
products: SG_EXPERIENCEMANAGER/6.5/FORMS

exl-id: a8be58f1-1961-4bf5-aaad-feb4489fb389
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms, Data Connectors
role: User, Developer
---
# Configuring Connector for Microsoft SharePoint {#configuring-connector-for-microsoft-sharepoint}

Connector for Microsoft SharePoint enables communication between AEM forms and Microsoft SharePoint. For additional background information, see "Connectors for ECM" in [Services Reference](https://www.adobe.com/go/learn_aemforms_services_63).

1. In administration console, click Services &gt; Connector for Microsoft SharePoint.
1. Specify the following settings for your SharePoint Server:

   **SharePoint Server Host Name:** The host name port number of the web application on the SharePoint server, in the format `[hostname]:'port'`.

   **User Name:** The user account used to connect to the SharePoint server.

   **Password:** Password for the user account used to connect to the SharePoint server

   **Domain Name:** Domain where the SharePoint server is located.

1. Click Save.

## Microsoft SharePoint configuration service {#microsoft-sharepoint-configuration-service}

The Microsoft SharePoint configuration service `(MSSharePointConfigService)` lets you specify credentials for the AEM forms user that has impersonation permissions. For information about impersonation permissions, see [Configuring Connector for Microsoft SharePoint](https://help.adobe.com/en_US/AEMForms/6.1/SharePointConfig/index.html). Follow these steps to specify settings for `MSSharePointConfigService`:

1. In administration console, click Services &gt; Applications and Services &gt; Service Management.
1. Navigate the list of services and click `MSSharePointConfigService`.
1. Specify the following settings on the Configuration page:

    * User Name For A User With Impersonation Permissions
    * Password For The Above User

1. Click Save.

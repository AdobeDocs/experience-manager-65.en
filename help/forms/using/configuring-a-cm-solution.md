---
title: Configuring a Correspondence Management solution
description: Learn how to configure a Correspondence Management solution in an AEM Forms environment.
topic-tags: correspondence-management
content-type: reference
products: SG_EXPERIENCEMANAGER/6.3/FORMS
feature: Correspondence Management
exl-id: f7f5eb0d-a283-45ea-84d3-d6375d2bb95b
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: 3f00fc92-85ee-583e-abd1-3bc3d96de3a0
    internal-label: Correspondence Management
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Configuring a Correspondence Management solution {#configuring-a-correspondence-management-solution}

## Defining author instance URL for VersionRestoreManagerImpl {#defining-author-instance-url-for-versionrestoremanagerimpl}

Use the following steps to define an author instance URL for the author instance version restore:

1. Go to *https://:&lt;PublishHost&gt;:&lt;PublishPort&gt;/lc/system/console/configMgr*. Login with OSGi Management Console user credentials. The default credentials are admin/admin. 
1. Find and click the **[!UICONTROL Edit]** icon next to the **[!UICONTROL com.adobe.livecycle.content.activate.impl.VersionRestoreManagerImpl.name]** setting.
1. In the **[!UICONTROL VersionRestoreManager Author URL]** field, specify the URL of Author instance of VersionRestoreManager.

   **URL string**:

   `https://<hostname>:<port>:/libs/fd/fdm/content/crud/lc.content.remote.activate.VersionRestoreManager`

   >[!NOTE]
   >
   >If there are multiple author instances (Clustered) fronted by a Load Balancer, specify the URL to the load balancer in the **[!UICONTROL VersionRestoreManager Author URL]** field.

1. Click **[!UICONTROL Save]**.

## Defining the Publish instance URL for ActivationManagerImpl (public instance activation manager) {#defining-the-publish-instance-url-for-activationmanagerimpl-public-instance-activation-manager}

Follow these steps so you can define the Publish instance URL for public instance activation manager:

1. Go to *https://:&lt;authorHost&gt;:&lt;authorPort&gt;/lc/system/console/configMgr*. Login with OSGi Management Console user credentials. The default credentials are admin/admin. 
1. Find and click the **[!UICONTROL Edit]** icon next to the **[!UICONTROL com.adobe.livecycle.content.activate.impl.ActivationManagerImpl.name]** setting.
1. In the **[!UICONTROL ActivationManager Publish URL]** field, specify the URL for accessing the Publish instance ActivationManager. You can provide the following URLs.

    * **Load Balancer URL (Recommended)**: Provide load balancer URL, If you have a webserver acting as load balancer in front of publish farm (multiple non-clustered publish instances).
    * **Publish instance URL**: Provide any publish instance URL, If you have a single publish instance or the webserver fronting the publish farm is not accessible from the author environment due to any restrictions. In case the specified publish instance is down, there is a fallback mechanism to deal with on the author side.
    * **URL string**: 
    
      `https://<hostname>:<port>:/libs/fd/fdm/content/crud/lc.content.remote.activate.activationManager`

1. Click **[!UICONTROL Save]**.

For more information about configuring Correspondence Management, see [Correspondence Management Configuration Properties](https://helpx.adobe.com/aem-forms/6-2/cm-configuration-properties.html).

---
title: Configuring a Correspondence Management solution
seo-title: Configuring a Correspondence Management solution
description: null
seo-description: null
uuid: 76b25004-fe47-44d7-9bed-7c0fd963306b
topic-tags: correspondence-management
content-type: reference
products: SG_EXPERIENCEMANAGER/6.3/FORMS
discoiquuid: 186ca75c-638b-4057-826e-cd5d56aa0397
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

Follow these steps the define the Publish instance URL for public instance activation manager:

1. Go to *https://:&lt;authorHost&gt;:&lt;authorPort&gt;/lc/system/console/configMgr*. Login with OSGi Management Console user credentials. The default credentials are admin/admin. 
1. Find and click the **[!UICONTROL Edit]** icon next to the **[!UICONTROL com.adobe.livecycle.content.activate.impl.ActivationManagerImpl.name]** setting.
1. In the **[!UICONTROL ActivationManager Publish URL]** field, specify the URL for accessing the Publish instance ActivationManager. You can provide the following URLs.

    * **Load Balancer URL (Recommended)**: Provide load balancer URL, If you have a webserver acting as load balancer in front of publish farm (multiple non-clustered publish instances).
    * **Publish instance URL**: Provide any publish instance URL, If you have a single publish instance or the webserver fronting the publish farm is not accessible from the author environment due to any restrictions. In case, the specified publish instance is down, there is a fallback mechanism to deal with on the author side.
    * **URL string**: 
    
      `https://<hostname>:<port>:/libs/fd/fdm/content/crud/lc.content.remote.activate.activationManager`

1. Click **[!UICONTROL Save]**.

For more information about configuring Correspondence Management, see [Correspondence Management Configuration Properties](https://helpx.adobe.com/aem-forms/6-2/cm-configuration-properties.html).

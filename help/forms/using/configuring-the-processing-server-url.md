---
title: Configuring AEM DS settings
description: Learn how to specify the processing server URL before you submit a form.
contentOwner: amgoyal
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: Configuration
docset: aem65
role: Admin,User
exl-id: c43cab7b-3421-4e1b-a834-b2dd6eb23c1d
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
---
# Configuring AEM DS settings{#configuring-aem-ds-settings}

This article describes how to configure the **AEM DS Settings Service**. This setting can be used in multiple scenarios, for example:

* In Correspondence Management

    * For configuring AEM Forms Workflow
    * While using the Forms Portal for remote save of draft/submission

* In Adaptive forms, for cases when an Adaptive form is submitted from publish instance

Following are the steps to configure the **[!UICONTROL AEM DS Settings]**:

1. Open the Configuration Manager on the publish instance using the URL:   
   *https://localhost:port/system/console/configMgr*.

   ![AEM Web Console Configuration](assets/web_configuration_console_new.png)

1. In the **[!UICONTROL Adobe Experience Manager Web Console Configuration]** window, locate and click the **[!UICONTROL AEM DS Settings]** option.

   ![DS Settings](assets/ds_settings_new.png)

1. The **[!UICONTROL AEM DS Settings Service]** window displays the common configuration settings for AEM DS Components.

   ![DS Settings Service](assets/ds_settings_service_new.png)

1. Add the following information in the respective fields:

   **[!UICONTROL Processing Server URL]**: The Processing Server is the server where the Forms or AEM workflow must be triggered. This can be the same as the URL of the AEM author instance or the other Server URL (that is, https://localhost:port/).

   **[!UICONTROL Processing Server User Name]**: Workflow user's User Name [based on the server URL being used]

   **[!UICONTROL Processing Server Password]**: Workflow user's Password

   >[!NOTE]
   >
   >
   >    
   >    
   >    * While using either Forms or AEM workflows, before you make any submission from the publish server, it is necessary to configure the DS settings service. Otherwise, the Form submission shall fail.
   >    
   >

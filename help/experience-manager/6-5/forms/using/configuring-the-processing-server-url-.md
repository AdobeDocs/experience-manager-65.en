---
title: Configuring AEM DS settings
seo-title: Configuring AEM DS settings
description: You need to specify the processing server URL before you submit a form.
seo-description: You need to specify the processing server URL before you submit a form.
uuid: e5d6f777-313c-4667-a6c0-e8ce0ce16f47
contentOwner: amgoyal
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: Configuration
discoiquuid: 4c93a7a8-5c40-4b98-ac7a-123db94ec0bb
index: y
internal: n
snippet: y
---

# Configuring AEM DS settings{#configuring-aem-ds-settings}

This article describes how to configure **AEM DS Settings Service**. This setting can be used in multiple scenarios, for example:

* In Correspondence Management

    * For configuring AEM Forms Workflow
    * While using forms portal for remote save of draft/submission

* In Adaptive forms for cases when Adaptive form is submitted from publish instance

Following are the steps to configure the **[!UICONTROL AEM DS Settings]**:

1. Open the Configuration Manager on the publish instance using the URL:   
   *http://localhost:port/system/console/configMgr*.

   ![AEM Web Console Configuration](assets/web_configuration_console_new.png)

1. In the **[!UICONTROL Adobe Experience Manager Web Console Configuration]** window, locate and click the **[!UICONTROL AEM DS Settings]** option.

   ![DS Settings](assets/ds_settings_new.png)

1. The **[!UICONTROL AEM DS Settings Service]** window displays the common configuration settings for AEM DS Components.

   ![DS Settings Service](assets/ds_settings_service_new.png)

1. Add the following information in the respective fields:

   **[!UICONTROL **Processing Server UR**L]**: The Processing Server is the server where the Forms or AEM workflow needs to be triggered. This can be same as the URL of the AEM author instance or the other Server URL (that is, http://localhost:port/).

   ****[!UICONTROL Processing Server User Name]****: Workflow user's User Name [based on the server URL being used]

   ****[!UICONTROL Processing Server Password]****: Workflow user's Password

   <!--
   Comment Type: draft

   <table border="1" cellpadding="1" cellspacing="0" width="100%">
   <tbody>
   <tr>
   <th> Option</th>
   <th><strong>AEM Workflow</strong></th>
   <th><strong>Remote Save<br /> </strong></th>
   </tr>
   <tr>
   <td width="33%">Processing Server URL</td>
   <td> </td>
   <td> </td>
   </tr>
   <tr>
   <td>Processing Server User Name<br /> </td>
   <td> </td>
   <td> </td>
   </tr>
   <tr>
   <td>Processing Server password</td>
   <td> </td>
   <td> </td>
   </tr>
   </tbody>
   </table>
   -->

   >[!NOTE]
   >
   >
   >    
   >    
   >    * While using either Forms or AEM workflows, before you make any submission from the publish server, it is necessary to configure the DS settings service. Otherwise, the Form submission shall fail.
   >    
   >


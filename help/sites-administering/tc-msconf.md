---
title: Connecting to Microsoft Translator
description: Learn how to connect AEM to Microsoft Translator out-of-the-box to automate your translation workflow.
feature: Language Copy
role: Admin
exl-id: ca575a30-fc3e-4f38-9aa7-dbecbc089f87
solution: Experience Manager, Experience Manager Sites
---
# Connecting to Microsoft Translator {#connecting-to-microsoft-translator}

AEM provides a built-in connector for [Microsoft Translator](https://www.microsoft.com/en-us/translator/business/) to translate page content or assets. After obtaining a license from Microsoft to use Microsoft Translator, please configure the connector following the instructions on this page. 

|Property|Description|
|---|---|
|Translation Label|The display name for the translation service|
|Translation Attribution|(Optional) For user-generated content, the attribution that appears next to translated text, for example, `Translations by Microsoft`|
|Workspace ID|(Optional) The ID of your customized Microsoft Translator engine to use|
|Subscription Key|Your Microsoft Subscription Key for Microsoft Translator|

The following procedure creates a Microsoft Translator configuration.

1. In the [navigation panel,](/help/sites-authoring/basic-handling.md#first-steps) click **Tools** > **Cloud Services** > **Translation Cloud Services**.
1. Navigate to where you wish to create the configuration. Normally this is in your site root or it can be a global, default configuration.
1. Click the **Create** button.
1. Define your configuration.
   1. Select **Microsoft Translator** in the drop-down.
   1. Type a title for your configuration. The title identifies the configuration in the Cloud Services console and in page property drop-down lists.
   1. Optionally, type a name to use for the repository node that stores the configuration.

   ![Create translation configuration](assets/create-translation-config.png)

1. Click **Create**.
1. In the **Edit Configuration** window, provide the values for the translation service described in the previous table.

   ![Edit translation configuration](assets/msft-config-ui.png)

1. Click **Connect** to verify the connection.
1. Click **Save &amp; Close**.

## Publishing the Translator Service Configurations {#publishing-the-translator-service-configurations}

As a final step, please publish your Microsoft Translator configurations to support published translated content, using the [publishing a tree](/help/sites-authoring/publishing-pages.md#publishing-and-unpublishing-a-tree) action.  

---
title: Enable detection of duplicate assets
description: Learn how to enable the detection of duplicate assets in Experience Manager.
contentOwner: AG
role: User, Admin
feature: Asset Management,Asset Reports
exl-id: a403d60e-2193-4835-8f37-4a40f2d01819
hide: yes
solution: Experience Manager, Experience Manager Assets
---
# Enable detection of duplicate assets {#enable-detection-of-duplicate-assets}

If you attempt to upload an asset that exists in [!DNL Adobe Experience Manager Assets], the duplicate detection feature identifies it as duplicate. Duplicate detection is disabled by default. To enable the feature, do the following steps:

1. Open the [!DNL Experience Manager] Web Console configuration page by accessing `https://[aem_server]:[port]/system/console/configMgr`.
1. Edit the configuration for the servlet **[!UICONTROL Day CQ DAM Create Asset]**.
1. Select the **[!UICONTROL detect duplicate]** option, and click **[!UICONTROL Save]**.

   ![Select detect duplicate option in the servlet](assets/chlimage_1-377.png)

   *Figure: Select detect duplicate option in the servlet.*

The detect duplicate feature is now enabled in [!DNL Assets]. When a user attempts to upload an asset that exists in [!DNL Experience Manager], the system checks for conflict and indicates it. The assets are identified using SHA-1 hash stored at `jcr:content/metadata/dam:sha1`, which means duplicate assets are detected irrespective of the filenames.

>[!MORELIKETHIS]
>
>* [Duplicate assets in existing repository (a tutorial from a community member)](https://experience-aem.blogspot.com/2019/06/aem-65-find-duplicate-assets-binaries-in-existing-repository.html)
>* [Detect duplicate assets in AEM as a Cloud Service](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/assets/admin/detect-duplicate-assets.html)

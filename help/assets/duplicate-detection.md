---
title: Enable detection of duplicate assets
description: Learn how to enable the detection of duplicate assets in AEM.
uuid: 9b37a746-c966-4c0b-8d96-27783a7cf2d8
contentOwner: AG
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
discoiquuid: 41ff1835-4144-4381-9c5d-afb9449fcbd7
docset: aem65
---

# Enable detection of duplicate assets {#enable-detection-of-duplicate-assets}

If you attempt to upload an asset that exists in Adobe Experience Manager (AEM) Assets, the duplicate detection feature identifies it as duplicate. Duplicate detection is disabled by default. To enable the feature, do the following steps:

1. Open the AEM Web Console Configuration page by accessing `https://[aem_server]:[port]/system/console/configMgr`.
1. Edit the configuration for the servlet **[!UICONTROL Day CQ DAM Create Asset]**.
1. Select the **[!UICONTROL detect duplicate]** option, and click/tap **[!UICONTROL Save]**.

   ![Select detect duplicate option in the servlet](assets/chlimage_1-153.png)

   Select detect duplicate option in the servlet

The detect duplicate feature is now enabled in AEM Assets. When a user attempts to upload an asset that exists in AEM, the system checks for conflict and indicates it. The assets are identified using SHA-1 hash stored at `jcr:content/metadata/dam:sha1`, which means duplicate assets are detected irrespective of the filenames.

>[!MORELIKETHIS]
>
>[Duplicate assets in existing repository (a tutorial from community member)](https://experience-aem.blogspot.com/2019/06/aem-65-find-duplicate-assets-binaries-in-existing-repository.html)

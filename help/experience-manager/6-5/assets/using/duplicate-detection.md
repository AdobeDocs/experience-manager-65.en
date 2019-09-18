---
title: Enable detection of duplicate assets
seo-title: Enable duplicate detection
description: Learn how to enable the detection of duplicate assets in AEM.
seo-description: Learn how to enable the detection of duplicate assets in AEM.
uuid: c65e6e6d-6cf1-40aa-8b34-5e33e04330b4
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: managing-assets
content-type: reference
discoiquuid: 5c505cd5-47b4-4247-9241-b6fa1b596bf6
index: y
internal: n
snippet: y
---

# Enable detection of duplicate assets{#enable-detection-of-duplicate-assets}

If you attempt to upload an asset that exists in Adobe Experience Manager (AEM) Assets, the duplicate detection feature identifies it as duplicate. Duplicate detection is disabled by default. To enable the feature, do the following steps:

1. Go to the AEM Web Console Configuration page at `http://[server]:[port]/system/console/configMgr`.
1. Edit the configuration for the servlet **[!UICONTROL Day CQ DAM Create Asset]**.
1. Select the **[!UICONTROL detect duplicate]** option, and click/tap **[!UICONTROL Save]**.

   ![Select detect duplicate option in the servlet](assets/chlimage_1-92.png)

   Select detect duplicate option in the servlet

The detect duplicate feature is now enabled in AEM Assets. When a user attempts to upload an asset that exists in AEM, the system checks for conflict and indicates it. The assets are identified using SHA-1 hash stored at `jcr:content/metadata/dam:sha1`, which means duplicate assets are detected irrespective of the filenames.

<!--
<related-links>
<a href="https://experience-aem.blogspot.com/2019/06/aem-65-find-duplicate-assets-binaries-in-existing-repository.html" target="_blank">Duplicate assets in existing repository (tutorial from community member)</a>
</related-links>
-->


---
title: Installing Feature Pack 18912 for bulk asset migration
seo-title: Installing Feature Pack 18912 for bulk asset migration
description: Feature pack 18912 lets you either bulk ingest assets by way of FTP, or migrate assets from Dynamic Media Classic to Dynamic Media in AEM. This optional feature pack is available from Adobe support.
seo-description: Feature pack 18912 lets you either bulk ingest assets by way of FTP, or migrate assets from Dynamic Media Classic to Dynamic Media in AEM. This optional feature pack is available from Adobe support.
uuid: 316d77e3-3d61-4cf0-8955-726ee54e268c
contentOwner: rbrough
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: dynamic-media
content-type: reference
discoiquuid: 6198e613-a867-49a8-b9a5-a05e7889821c
---

# Installing feature pack 18912 for bulk asset migration {#installing-feature-pack}

The installation of feature pack 18912 is _optional_.

Feature pack 18912 lets you either bulk ingest assets directly into Dynamic Media - Scene 7 mode on AEM by way of FTP, or migrate assets from Dynamic Media Classic into Dynamic Media - Scene7 mode on AEM. The feature pack is available from [Adobe Professional Services](https://www.adobe.com/experience-cloud/consulting-services.html).

>[!NOTE]
>
>While it is possible for you to use the feature pack to bulk migrate assets on your own from Dynamic Media Classic to Dynamic Media - Scene 7 mode in AEM or bulk migrate assets using the FTP feature in Dynamic Media Classic, Adobe does *not* recommend this method due to the complexity involved.
>
>As such, migration feature packs, such as this one, are *only* supported as part of a migration project through [Adobe Professional Services](https://www.adobe.com/experience-cloud/consulting-services.html).

Before you can install this feature pack, you must first create a service user and provide that information to Adobe.

See also [Configuring Dynamic Media - Scene7 mode](https://helpx.adobe.com/experience-manager/6-4/assets/using/config-dms7.html).

**To install feature pack 18912 for bulk asset migration**,

1. In your AEM instance, navigate to **[!UICONTROL Tools > Security > Users > Create User]**. This service user must have read/write permissions to `/content/dam`.
1. In the **[!UICONTROL ID]** and **[!UICONTROL Password]** fields, enter a user name and password; for example, `FTP User`. This name appears in the timeline as the user who created the asset. When an asset is uploaded from FTP, an asset is considered created when it is uploaded to the FTP server and is pushed to AEM.
1. Contact [Adobe Enterprise Support for Experience Manager](https://helpx.adobe.com/contact/enterprise-support.ec.html) to request access to feature pack 18912 for downloading. You may need the following information when you contact support:

    * Server IP address for your Author instance, including the port number (by default, the port number is 4502). 
    * AEM service user username and password from the previous step.

1. Adobe Enterprise Support for AEM provides you the FTP credentials and access to feature pack 18912.

1. When you receive feature pack 18912, install it.

   See [How to work with packages](/help/sites-administering/package-manager.md) for more information on using Package Share and packages in AEM.


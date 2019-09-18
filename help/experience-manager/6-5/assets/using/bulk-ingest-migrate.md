---
title: Installing feature pack 18912 for bulk asset migration
seo-title: Installing feature pack 18912 for bulk asset migration
description: Feature pack 18912 lets you either bulk ingest assets by way of FTP, or migrate assets from Dynamic Media Classic into Dynamic Media on AEM. This optional feature pack is available from Adobe support.
seo-description: Feature pack 18912 lets you either bulk ingest assets by way of FTP, or migrate assets from Dynamic Media Classic into Dynamic Media on AEM. This optional feature pack is available from Adobe support.
uuid: ffe106ca-e333-465b-8a86-8aac5abd7eb2
contentOwner: rbrough
topic-tags: dynamic-media
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
content-type: reference
discoiquuid: 3d0ad121-c59c-4ec2-8011-164a89860f5c
index: y
internal: n
snippet: y
---

# Installing feature pack 18912 for bulk asset migration{#installing-feature-pack-for-bulk-asset-migration}

The installation of feature pack 18912 is *optional*.

Feature pack 18912 lets you either bulk ingest assets directly into Dynamic Media - Scene7 mode on AEM by way of FTP, or migrate assets from Dynamic Media Classic into Dynamic Media - Scene7 mode on AEM. The feature pack is available from [Adobe Professional Services](https://www.adobe.com/experience-cloud/consulting-services.html).

>[!NOTE]
>
>While it is possible for you to use the feature pack to bulk migrate assets on your own from Dynamic Media Classic to Dynamic Media - Scene 7 mode in AEM or bulk migrate assets using the FTP feature in Dynamic Media Classic, Adobe does *not* recommend this method due to the complexity involved. 
>
>As such, migration feature packs, such as this one, are* only* supported as part of a migration project when done through [Adobe Professional Services](https://www.adobe.com/experience-cloud/consulting-services.html).

Before you can install the feature pack, you must first create a service user and provide that information to Adobe support.

See also [Configuring Dynamic Media - Scene7 mode](../../../6-5/assets/using/config-dms7.md).

**To install feature pack 18912 for bulk asset migration**:

1. In your AEM instance, navigate to **Tools** > **Security** > **Users** and select **Create User**. This service user must have **read/write** permissions to `/content/dam.`
1. In the **ID** and **Password** fields, enter a user name and password; for example, **FTP User**. This name appears in the timeline as the user who created the asset. When an asset is uploaded from FTP, an asset is considered created when it is uploaded to the FTP server and is pushed to AEM.
1. Contact [Adobe Enterprise Support for Experience Manager](https://helpx.adobe.com/contact/enterprise-support.ec.html) to request access to feature pack 18912 for downloading. You may need the following information when you contact support:

    * Server IP address for your Author instance, including the port number (by default, the port number is 4502.) 
    * AEM service user username and password from the previous step.

1. Adobe Enterprise Support for AEM provides you the FTP credentials and access to feature pack 18912.
1. When you receive the feature pack 18912, install it.

   See [How to Work with Packages](../../../6-5/sites/administering/using/package-manager.md) for more information on using Package Share and packages in AEM.


---
title: Installing feature pack 18912 for bulk asset migration
description: Feature pack 18912 lets you either bulk ingest assets by way of FTP, or migrate assets from Dynamic Media Classic into Dynamic Media on AEM. This optional feature pack is available from Adobe support.
uuid: 45c2f5f8-4368-4d7b-a43e-fe96cfb272fd
contentOwner: Rick Brough
topic-tags: dynamic-media
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
content-type: reference
discoiquuid: 5d5eebe4-46c9-4028-9354-c5f27944fcdc
docset: aem65

---

# Installing feature pack 18912 for bulk asset migration{#installing-feature-pack-for-bulk-asset-migration}

The installation of feature pack 18912 is *optional*.

Feature pack 18912 lets you either bulk ingest assets directly into Dynamic Media - Scene7 mode on AEM by way of FTP, or migrate assets from Dynamic Media Classic into Dynamic Media - Scene7 mode on AEM. The feature pack is available from [Adobe Professional Services](https://www.adobe.com/experience-cloud/consulting-services.html).

>[!NOTE]
>
>While it is possible for you to use the feature pack to bulk migrate assets on your own from Dynamic Media Classic to Dynamic Media - Scene 7 mode in AEM or bulk migrate assets using the FTP feature in Dynamic Media Classic, Adobe does *not* recommend this method due to the complexity involved.
>
>As such, migration feature packs, such as this one, are *only* supported as part of a migration project when done through [Adobe Professional Services](https://www.adobe.com/experience-cloud/consulting-services.html).

Before you can install the feature pack, you must first create a service user and provide that information to Adobe support.

See also [Configuring Dynamic Media - Scene7 mode](/help/assets/config-dms7.md).

**To install feature pack 18912 for bulk asset migration**

1. In your AEM instance, navigate to **[!UICONTROL Tools > Security > Users]** and select **[!UICONTROL Create User]**. This service user must have *read/write* permissions to `/content/dam.`
1. In the **[!UICONTROL ID]** and **[!UICONTROL Password]** fields, enter a user name and password; for example, **FTP User**. This name appears in the timeline as the user who created the asset. When an asset is uploaded from FTP, an asset is considered created when it is uploaded to the FTP server and is pushed to AEM.
1. Contact [Adobe Enterprise Customer Care for Experience Manager](https://experienceleague.adobe.com/?support-solution=General#support) to request access to feature pack 18912 for downloading. You may need the following information when you contact support:

    * Server IP address for your Author instance, including the port number (by default, the port number is 4502.)
    * AEM service user username and password from the previous step.

1. Adobe Enterprise Customer Care for AEM provides you the FTP credentials and access to feature pack 18912.
1. When you receive the feature pack 18912, install it.

   See [How to Work with Packages](/help/sites-administering/package-manager.md) for more information on using Software Distribution and packages in AEM.

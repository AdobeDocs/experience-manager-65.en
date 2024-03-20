---
title: Install feature pack 18912 for bulk asset migration
description: Feature pack 18912 lets you either bulk ingest assets by way of FTP, or migrate assets from Dynamic Media Classic into Dynamic Media on Adobe Experience Manager. This optional feature pack is available from Adobe support.
contentOwner: Rick Brough
topic-tags: dynamic-media
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
content-type: reference
docset: aem65
feature: Asset Management
role: User, Admin
exl-id: 53ea2cf7-d633-4ab9-a869-ce76eb1c01e5
solution: Experience Manager, Experience Manager Assets
---
# Install feature pack 18912 for bulk asset migration{#installing-feature-pack-for-bulk-asset-migration}

The installation of feature pack 18912 is *optional*.

Feature pack 18912 lets you bulk ingest assets directly into Dynamic Media - Scene7 mode on Adobe Experience Manager by way of FTP. It also lets you migrate assets from Dynamic Media Classic into Dynamic Media - Scene7 mode on Experience Manager. The feature pack is available from [Adobe Professional Services](https://business.adobe.com/customers/consulting-services/main.html).

>[!IMPORTANT]
>
>It is possible for you to use the feature pack to bulk migrate assets on your own from Dynamic Media Classic to Dynamic Media - Scene7 mode in Experience Manager. It is also possible for you to bulk migrate assets using the FTP feature in Dynamic Media Classic. However, Adobe does *not* recommend that you use either of these methods due to the complexity involved.
>
>As such, this migration feature pack is *only* supported as part of a migration project when done through [Adobe Professional Services](https://business.adobe.com/customers/consulting-services/main.html).

Before you install the feature pack, create a service user and provide that information to Adobe support.

See also [Configure Dynamic Media - Scene7 mode](/help/assets/config-dms7.md).

**To install feature pack 18912 for bulk asset migration:**

1. In your Experience Manager instance, navigate to **[!UICONTROL Tool]** > **[!UICONTROL Security]** > **[!UICONTROL Users]** and select **[!UICONTROL Create User]**. This service user must have *read/write* permissions to `/content/dam.`
1. In the **[!UICONTROL ID]** and **[!UICONTROL Password]** fields, enter a user name and password; for example, **FTP User**. This name appears in the timeline as the user who created the asset. When an asset is uploaded from FTP, an asset is considered created when it is uploaded to the FTP server and is pushed to Experience Manager.
1. Contact [Adobe Customer Support for Experience Manager](https://experienceleague.adobe.com/?support-solution=General#support) to request access to feature pack 18912 for downloading. You may need the following information when you contact support:

    * Server IP address for your Author instance, including the port number (by default, the port number is 4502.)
    * Experience Manager service user username and password from the previous step.

1. Adobe Customer Support for Experience Manager provides you the FTP credentials and access to feature pack 18912.
1. When you receive the feature pack 18912, install it.

   See [How to Work with Packages](/help/sites-administering/package-manager.md) for more information on using Software Distribution and packages in Experience Manager.

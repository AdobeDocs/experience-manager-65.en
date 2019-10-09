---
title: AEM Desktop App for AEM Forms
seo-title: AEM Desktop App for AEM Forms
description: null
seo-description: null
uuid: 99e0f2fb-8623-45bb-8e2e-5c5d6f482366
contentOwner: khsingh
products: SG_EXPERIENCEMANAGER/6.4/FORMS
topic-tags: manage
discoiquuid: c30332b6-e012-442d-8e84-28832c116c7b
noindex: true
---

# DO NOT Publish AEM Desktop App for AEM Forms {#aem-desktop-app-for-aem-forms}

AEM Desktop App lets you map the Adobe Experience Manager (AEM) Assets repository and AEM Forms binary files to a network directory on your system. You can view the synced assets and binary files in a file explorer and use various apps to edit the files as desired. Apart from viewing the files, you can also create, upload, and delete the binary files. You can also open, edit, and save files directly from software. For example, you can directly open and edit an XDP file from Designer. The changes that you make to the assets locally are reflected in AEM Assets repository and AEM Forms UI.

You can download the app from an AEM instance. For detailed information about downloading the app, see [AEM Desktop App Release Notes](https://helpx.adobe.com/experience-manager/desktop-app/release-notes.html).

## AEM Forms assets supported in AEM Desktop App {#aem-forms-assets-supported-in-aem-desktop-app}

You can use the app to sync AEM Forms binary files of following type Form Templates (.xdp), PDF Form (.pdf), Document (.pdf), Images, XML Schema (.xsd), style sheets (.xfs). The app lists all other files (non-supported files) as 0-byte files. Listing non-supported files as 0-byte files ensures that the user is aware of the existence of other assets available on AEM Forms server.

>[!NOTE]
>
>A filename can only contain alphanumeric characters, hyphen, or underscore.

## Enable AEM Forms for AEM Desktop App {#enable-aem-forms-for-aem-desktop-app}

AEM Desktop App uses WebDAV protocol on Microsoft Windows and SMB1 on Mac OS X to connect to an AEM Forms server. Out of the box, AEM Forms server is not enabled to sync binary files and other assets with a WebDAV or SMB client. Perform the following steps to enable AEM Forms for AEM Desktop App:

1. Log in to AEM Forms as an administrator.
1. In the author instance, click ![adobeexperiencemanager](assets/adobeexperiencemanager.png) **[!UICONTROL Adobe Experience Manager > Tools** ![hammer](assets/hammer.png) **> Deployment > Operations > Web Console]**. The Web Console opens in a new window.
1. In Web Console Window, locate and open the **[!UICONTROL FormsManager AddOn Configuration]** option.
1. In the FormsManager AddOn Configuration dialog, deselect the **[!UICONTROL Asynchronously Sync Resources]** check box, and click **[!UICONTROL Save]**.
1. Restart the AEM Forms server. After the restart, AEM Forms server is enabled to accept and share content with AEM Desktop App.
1. Open the app and connect to AEM Forms server.

   On successful connection, the app populates the `content/dam` and `content/dam/formsanddocuments` folders. Along with moving files from above folders to local folders and vice versa, you can use the app to move content between auto-populated folders.


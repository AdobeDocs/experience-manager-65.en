---
title: Adobe Experience Manager (AEM) desktop app for AEM Forms
description: Adobe Experience Manager (AEM) desktop app for AEM Forms
contentOwner: khsingh
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: manage
noindex: true
role: Admin,User
exl-id: b87e07b1-4a19-4888-bad0-c0f5327b9ad3
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
---
# Adobe Experience Manager (AEM) desktop app for AEM Forms {#aem-desktop-app-for-aem-forms}

AEM desktop app lets you map the Adobe Experience Manager (AEM) Assets repository and AEM Forms binary files to a network directory on your system. You can view the synced assets and binary files in a file explorer and use various apps to edit the files as desired. Apart from viewing the files, you can also create, upload, and delete the binary files. You can also open, edit, and save files directly from the software. For example, you can directly open and edit an XDP file from Designer. The changes that you make to the assets locally are reflected in the AEM Assets repository and AEM Forms user interface.

You can download the app from an AEM instance. For detailed information about downloading the app, see [AEM desktop app Release Notes](https://experienceleague.adobe.com/docs/experience-manager-desktop-app/using/release-notes.html?lang=en).

## AEM Forms assets supported in AEM desktop app {#aem-forms-assets-supported-in-aem-desktop-app}

You can use the app to sync AEM Forms binary files of the following type Form Templates (.xdp), PDF Form (.pdf), Document (.pdf), Images, XML Schema (.xsd), style sheets (.xfs). The app lists all other files (non-supported files) as 0-byte files. Listing non-supported files as 0-byte files ensures that the user is aware of the existence of other assets available on the AEM Forms Server.

>[!NOTE]
>
>A filename can only contain alphanumeric characters, hyphen, or underscore.

## Enable AEM Forms for AEM desktop app {#enable-aem-forms-for-aem-desktop-app}

AEM desktop app uses WebDAV protocol on Microsoft&reg; Windows and SMB1 on macOS X to connect to an AEM Forms Server. Out of the box, the AEM Forms Server is not enabled to sync binary files and other assets with a WebDAV or SMB client. Perform the following steps so you can enable AEM Forms for AEM desktop app:

1. Log in to AEM Forms as an administrator.
1. In the author instance, click ![adobeexperiencemanager](assets/adobeexperiencemanager.png) **[!UICONTROL Adobe Experience Manager > Tools]** ![hammer](assets/hammer.png) **[!UICONTROL > Deployment > Operations > Web Console]**. The Web Console opens in a new window.
1. In the Web Console Window, locate and open the **[!UICONTROL FormsManager AddOn Configuration]** option.
1. In the FormsManager AddOn Configuration dialog, deselect the **[!UICONTROL Asynchronously Sync Resources]** check box, and click **[!UICONTROL Save]**.
1. Restart the AEM Forms Server. After the restart, the AEM Forms Server is enabled to accept and share content with the AEM desktop app.
1. Open the app and connect to the AEM Forms Server.

    >[!NOTE]
    >
    > It is recommended to use the 'Ctrl + C' command to restart the SDK. Restarting the AEM SDK using alternative methods, for example, stopping Java processes, may lead to inconsistencies in the AEM development environment.

   On successful connection, the app populates the `content/dam` and `content/dam/formsanddocuments` folders. Along with moving files from above folders to local folders and conversely, you can use the app to move content between auto-populated folders.

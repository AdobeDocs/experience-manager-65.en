---
title: Private folder sharing
seo-title: Private folder sharing
description: Learn how to create a private folder in the Adobe Experience Manager (AEM) Assets and share it with other users and the assign various privileges to them.
seo-description: Learn how to create a private folder in the Adobe Experience Manager (AEM) Assets and share it with other users and the assign various privileges to them.
uuid: 9bda6c43-2203-46aa-a7b6-4d472a37d065
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: managing-assets
content-type: reference
discoiquuid: c450de32-8ca5-483c-a336-837a54ab4930
---

# Private folder sharing {#private-folder-sharing}

You can create a private folder in the Adobe Experience Manager (AEM) Assets user interface that is available exclusively to you. You can share this private folder to other users and the assign various privileges to them. Based on the privilege level you assign, users can perform various tasks on the folder, for example view assets within the folder or edit the assets.

1. In the Assets console, tap/click **[!UICONTROL Create]** from the toolbar and then choose **[!UICONTROL Folder]** from the menu.

   ![chlimage_1-411](assets/chlimage_1-411.png)

1. In the **[!UICONTROL Add Folder]** dialog, enter a title and name (optional) for the folder, and select **[!UICONTROL Private]**.

   ![chlimage_1-412](assets/chlimage_1-412.png)

1. Tap/click **[!UICONTROL Create]**. A private folder is created in the UI.

   ![chlimage_1-413](assets/chlimage_1-413.png)

1. To share the folder with other users and the assign privileges to them, select the folder, and click/tap the **[!UICONTROL Properties]** icon from the toolbar.

   ![chlimage_1-414](assets/chlimage_1-414.png)

   >[!NOTE]
   >
   >The folder is not visible to any other user until you share it.

1. In the Folder Prperties page, select a user from the **[!UICONTROL Add User]** list, assign a role to the user on your private folder, and click **[!UICONTROL Add]**.

   ![chlimage_1-415](assets/chlimage_1-415.png)

   >[!NOTE]
   >
   >You can assign various roles, such as Editor, Owner, or Viewer to the user with whom you share the folder. If you assign an Owner role to the user, the user has Editors privileges on the folder. In addition, the user can share the folder with others. If you assign an Editor role, the user can edit the assets in your private folder. If you assign a Viewer role, the user can only view the assets in your private folder.

1. Click **[!UICONTROL Save]**. Depending on the role you assign, the user is assigned a set of privileges on your private folder when the user logs in to AEM Assets.
1. Click **[!UICONTROL Ok]** to close the confirmation message.
1. The user with whom you share the folder receives a sharing notification. Log in to AEM Assets with the credentials of the user to view the notification.

   ![chlimage_1-416](assets/chlimage_1-416.png)

1. Tap/click the Notification icon to open the list of notifications.

   ![chlimage_1-417](assets/chlimage_1-417.png)

1. Click/tap the entry for the private folder shared by the administrator to open the folder.

>[!NOTE]
>
>To be able to create a private folder, you require Read and Edit ACL permissions on the parent folder under which you want to create a private folder. If you are not an administrator, these permissions are not enabled for you by default on */content/dam*. In this case, first obtain these permissions for your user ID/group before attempting to create private folders or view folder settings.


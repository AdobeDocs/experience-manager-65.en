---
title: Create and share a private folder in Adobe Experience Manager.
description: Learn how to create a private folder in the Adobe Experience Manager Assets and share it with other users and the assign various privileges to them.
contentOwner: AG
---

# Private folder sharing {#private-folder-sharing}

You can create a private folder in the Adobe Experience Manager Assets user interface that is available exclusively to you. You can share this private folder to other users and assign various privileges to them. Based on the privilege level you assign, users can perform various tasks on the folder, for example view assets within the folder or edit the assets.

>[!NOTE]
>
>Private folder has at least one member with Owner role.

1. In the Assets console, click **[!UICONTROL Create]** from the toolbar and then choose **[!UICONTROL Folder]** from the menu.

   ![Create assets folder](assets/Create-folder.png)

1. In the **[!UICONTROL Create Folder]** dialog, enter a title and name (optional) for the folder, and select **[!UICONTROL Private]**.

   ![Select Private check box to make the folder private](assets/private-folder.png)

1. Click **[!UICONTROL Create]**. A private folder is created in the UI.

   ![chlimage_1-413](assets/chlimage_1-413.png)

1. To share the folder with other users and the assign privileges to them, select the folder, and click **[!UICONTROL Properties]** from the toolbar.

   ![info option](assets/do-not-localize/info-circle-icon.png)

   >[!NOTE]
   >
   >The folder is not visible to any other user until you share it.

1. In the **[!UICONTROL Folder Properties]** page, select a user from the **[!UICONTROL Add User]** list, assign a role to the user on your private folder, and click **[!UICONTROL Add]**.

   ![chlimage_1-415](assets/chlimage_1-415.png)

   >[!NOTE]
   >
   >You can assign various roles, such as Editor, Owner, or Viewer to the user with whom you share the folder. If you assign an Owner role to the user, the user has Editors privileges on the folder. In addition, the user can share the folder with others. If you assign an Editor role, the user can edit the assets in your private folder. If you assign a viewer role, the user can only view the assets in your private folder.

   >[!NOTE]
   >
   >Private folder has at least one member with Owner role. Therefore, administrator cannot remove all the owner members from a private folder. However, to remove existing owners (and administrator itself) from the private folder the administrator must add another user as owner.

1. Click **[!UICONTROL Save]**. Depending on the role you assign, the user is assigned a set of privileges on your private folder when the user logs in to Assets.
1. Click **[!UICONTROL Ok]** to close the confirmation message.
1. The user with whom you share the folder receives a sharing notification. Log in to Assets with the credentials of the user to view the notification.

   ![chlimage_1-416](assets/chlimage_1-416.png)

1. Click Notifications to open the list of notifications.

   ![List of notifications](assets/Assets-Notification.png)

1. Click the entry for the private folder shared by the administrator to open the folder.

>[!NOTE]
>
>To be able to create a private folder, you require Read and Edit ACL permissions on the parent folder under which you want to create a private folder. If you are not an administrator, these permissions are not enabled for you by default on `/content/dam`. In this case, first obtain these permissions for your user ID/group before attempting to create private folders or view folder settings.

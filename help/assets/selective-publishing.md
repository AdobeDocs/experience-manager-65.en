---
title: Working with selective publishing at the folder level in Dynamic Media
description: Information on how to work with Selective Publish at the folder level to publish assets in Dynamic Media or in AEM.
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
docset: aem65
---

# Configuring selective publishing at the folder level in Dynamic Media
You can choose to publish or unpublish assets to or from AEM or Dynamic Media using either **[!UICONTROL Quick Publish]** or **[!UICONTROL Manage Publication]** features outside of the settings in your **[!UICONTROL Dynamic Media Configuration]**.

For example, you can work on assets for products that are not yet live. In such a case, a marketing team can access smart crop images and dynamic renditions that are synched to Dynamic Media so they can create promotional materials, all without having to publish those assets to Dynamic Media for global delivery.

>[!IMPORTANT]
>
>Selective Publish is only available in Dynamic Media - Scene7 mode.

>[!NOTE]
>
>Copying assets to and from folders clears the publish state of those assets.

If you decide later to change the **[!UICONTROL Selective Publish]** settings in a folder, those changes affect only new assets that you upload to that folder from that point forward. The publish state of existing assets in the folder remain as-is until you manually change them from either **[!UICONTROL Quick Publish]** or the **[!UICONTROL Manage Publication]** dialog box.

The folder level **[!UICONTROL Dynamic Media Publish mode]** option always defaults to the value that is found in your **[!UICONTROL Dynamic Media Configuration]**. You can, however, manually change this default value at the folder level (as described in the following steps) to override **[!UICONTROL Dynamic Media Configuration]** value.

Regardless of whether you rely on the **[!UICONTROL Publish Assets]** value set in **[!UICONTROL Dynamic Media Configuration]**, or the **[!UICONTROL Dynamic Media Publish mode]** value set in folder level properties, you are still able to choose **[!UICONTROL Immediately]**, **[!UICONTROL Upon Activation]**, or **[!UICONTROL Selective Publish]**. For example, you can set the **[!UICONTROL Publish Assets]** value in your **[!UICONTROL Dynamic Media Configuration]** to **[!UICONTROL Upon Activation]**, and set the **[!UICONTROL Dynamic Media Publish]** mode value at the folder level to **[!UICONTROL Selective Publish]**, vice versa, and so on.

**To configure Selective Publish at the folder level**

1. In AEM, tap the AEM logo to access the global navigation console. On the left side, tap the Navigation icon (just above the Tools icon), then tap **[!UICONTROL Assets > Files.]**
1. Do one of the following:
    * Edit the properties of an existing folder &ndash; In **[!UICONTROL Card View]**, **[!UICONTROL Column View]**, or **[!UICONTROL List View]**, navigate to a folder whose properties you want to edit. Select the folder, then on the toolbar, tap **[!UICONTROL Properties.]**
    * Edit the properties of a new folder &ndash; In **[!UICONTROL Card View]**, **[!UICONTROL Column View]**, or **[!UICONTROL List View]**, near the upper-right corner of the page, tap **[!UICONTROL Create > Folder.]** In the **[!UICONTROL Create Folder]** dialog box, enter a title (required) for the folder, then tap **[!UICONTROL Create.]** Select the folder, then on the toolbar, tap **[!UICONTROL Properties.]**

1.  In the **[!UICONTROL Sync mode]** drop-down list, select one of the following:
    | Sync mode | Description |
    | --- | --- |
    | **[!UICONTROL Inherited]** | No explicit sync value on the folder; instead, the folder inherits the sync value from one of its ancestor folders or the default mode in the **[!UICONTROL Dynamic Media Configuration]**. The detailed status for inherited shows by way of a tool tip. |
    | **[!UICONTROL Sync everything in this folder sub-tree to dynamicmedia]** | Include all assets in this sub-tree for synchronizing to Dynamic Media. The folder-specific settings override the default mode in the **[!UICONTROL Dynamic Media Configuration]**. |
    | **[!UICONTROL Exclude everything in this folder sub-tree from dynamicmedia sync]** | Exclude all assets in this sub-tree from synchronizing to Dynamic Media. |

    ![Folder level selective publish](/help/assets/assets-dm/createfolder-properties-selectivepublish.png)

1. In the **[!UICONTROL Dynamic Media Publish mode]** drop-down list, select an option. Be aware that the **[!UICONTROL Dynamic Media Publish mode]** option always defaults to the value that is set in your **[!UICONTROL Dynamic Media Configuration]**. You can, however, manually override this default **[!UICONTROL Dynamic Media Configuration]** value by using a setting below.
    | Dynamic Media Publish mode option | Description |
    | --- | --- |
    | **[!UICONTROL Immediately]** | When assets are uploaded to this folder, the system ingests the assets into AEM and provides the URL/Embed instantly. This option is tied to AEM publishing only and there is no user intervention necessary to publish assets.<br>This option is *not* available if you selected **[!UICONTROL Exclude everything in this folder sub-tree from dynamicmedia sync]** in **[!UICONTROL Sync mode]** in the previous step. |
    | **[!UICONTROL Upon Activation]** | When assets are uploaded to this folder, you need to explicitly publish the asset first before a URL/Embed link is provided. This option is tied to AEM publishing only.<br>This option is *not* available if you selected **[!UICONTROL Exclude everything in this folder sub-tree from dynamicmedia sync]** in **[!UICONTROL Sync mode]** in the previous step. |
    | **[!UICONTROL Selective Publish]** | Assets are published to your choice of either AEM or to Dynamic Media for delivery in the public domain. Both publishing methods are mutually exclusive of each other.  That is, you can publish assets to DMS7 so you can use features such as Smart Crop or dynamic renditions. Or, you can publish assets exclusively to AEM for secure previewing; those same assets are *not* published to DMS7 for delivery in the public domain. This option is not available if you selected **[!UICONTROL Exclude everything in this folder sub-tree from dynamicmedia sync]** in **[!UICONTROL Sync mode]** in the previous step. |
1. In the upper-right corner of the page, tap **[!UICONTROL Save & Close]**, then tap **[!UICONTROL OK]** to return to AEM Assets.

## Using Manage Publication to publish assets to AEM or Dynamic Media

1. In AEM, tap the AEM logo to access the global navigation console. On the left side, tap the Navigation icon (just above the Tools icon), then tap **[!UICONTROL Assets > Files.]**
1. In **[!UICONTROL Card View]**, **[!UICONTROL Column View]**, or **[!UICONTROL List View]**, do one of the following:
    * Navigate to a folder whose assets you want to publish. Select the folder, then on the toolbar, tap **[!UICONTROL Manage Publication.]**  You may find it helpful to use **[!UICONTROL List View]** so you can more easily check the publish status of a particular folder.
    * Navigate to a folder whose assets you want to publish. Open the folder, then select one or more assets. On the toolbar, tap **[!UICONTROL Manage Publication]**. You may find it helpful to use **[!UICONTROL List View]** so you can more easily check the publish status of a particular asset.

        >[!NOTE]
        >
        >If **[!UICONTROL Manage Publication]** is not seen on the toolbar, tap the ellipsis button instead, then select **[!UICONTROL Manage Publication]** from the list menu.

1. In the **[!UICONTROL Manage Publication &ndash; Options]** page, under **[!UICONTROL Action]**, select the type of activation you want.
    | Action | Description |
    | --- | --- |
    | **[!UICONTROL Publish]** (to AEM) | Select this option to publish assets to AEM for secure preview. |
    | **[!UICONTROL Publish to Dynamic Media]** | Select this option to publish assets to Dynamic Media for delivery in the public domain or so you can use features such as Smart Crop or dynamic renditions.<br>This option is available only if **[!UICONTROL Dynamic Media Publish mode]** is set to **[!UICONTROL Selective Publish]** in the folder's properties. |
1. Under **[!UICONTROL Schedule]**, set the timing of the publishing.
    | Schedule | Description |
    | --- | --- |
    | **[!UICONTROL Now]** | Select to publish the assets immediately. | 
    | **[!UICONTROL Later]** | Select to publish the assets on a particular date and time. | 
1. In the upper-right corner of the **[!UICONTROL Manage Publication]** page, tap **[!UICONTROL Next]**.
1. In the **[!UICONTROL Manage Publication &ndash; Scope]** page, do one of the following:
    * Select one or more assets that you want to remove from publishing.
    * In the upper-right corner of the **[!UICONTROL Manage Publication]** page, tap **[!UICONTROL Publish]** or **[!UICONTROL Publish to Dynamic Media.]**
1. Tap **[!UICONTROL OK]**. 

## Using Manage Publication to unpublish assets from AEM or Dynamic Media

1. In AEM, tap the AEM logo to access the global navigation console. On the left side, tap the Navigation icon (just above the Tools icon), then tap **[!UICONTROL Assets > Files.]**
1. In **[!UICONTROL Card View]**, **[!UICONTROL Column View]**, or **[!UICONTROL List View]**, do one of the following:
    * Navigate to a folder whose assets you want to unpublish. Select the folder, then on the toolbar, tap **[!UICONTROL Manage Publication.]**  You may find it helpful to use **[!UICONTROL List View]** so you can more easily check the publish status of a particular folder.
    * Navigate to a folder whose assets you want to unpublish. Open the folder, then select one or more assets. On the toolbar, tap **[!UICONTROL Manage Publication]**. You may find it helpful to use **[!UICONTROL List View]** so you can more easily check the publish status of a particular asset.

        >[!NOTE]
        >
        >If **[!UICONTROL Manage Publication]** is not seen on the toolbar, tap the ellipsis button instead, then select **[!UICONTROL Manage Publication]** from the list menu.


1. In the **[!UICONTROL Manage Publication &ndash; Options]** page, under **[!UICONTROL Action]**, select the type of de-activation you want.
    | Action | Description |
    | --- | --- |
    | **[!UICONTROL Unpublish]** (from AEM) | Select this option to unpublish assets from AEM. |
    | **[!UICONTROL Unpublish from Dynamic Media]** | Select this option to unpublish assets from Dynamic Media.<br>This option is available only if **[!UICONTROL Dynamic Media Publish mode]** is set to **[!UICONTROL Selective Publish]** in the folder's properties.  |
1. Under **[!UICONTROL Schedule]**, set the timing of the de-activation.
    | Schedule | Description |
    | --- | --- |
    | **[!UICONTROL Now]** | Select to unpublish the assets immediately. | 
    | **[!UICONTROL Later]** | Select to unpublish the assets on a particular date and time. | 
1. In the upper-right corner of the **[!UICONTROL Manage Publication]** page, tap **[!UICONTROL Next]**.
1. In the **[!UICONTROL Manage Publication &ndash; Scope]** page, do one of the following:
    * Select one or more assets that you want to remove from unpublishing.
    * In the upper-right corner of the **[!UICONTROL Manage Publication]** page, tap **[!UICONTROL Unpublish]**/**[!UICONTROL Unpublish from Dynamic Media]**.
1. Tap **[!UICONTROL OK]**. 


## Using Quick Publish to publish assets to AEM or Dynamic Media
You can use Quick Publish for simple asset activation cases. Quick Publish publishes the selected assets immediately without any further user interaction. Because of this, any non-published references are also published automatically.

>[!NOTE]
>
>To use Quick Publish to AEM or to Dynamic Media, be sure **[!UICONTROL Selective Publish]** is enabled either in your **[!UICONTROL Dynamic Media Configuration]** or in the folder properties of a selected folder.

1. In AEM, tap the AEM logo to access the global navigation console. On the left side of the page, tap the Navigation icon (just above the Tools icon), then on the right side of the page tap **[!UICONTROL Assets > Files.]**
1. In **[!UICONTROL Card View]**, **[!UICONTROL Column View]**, or **[!UICONTROL List View]**, do one of the following:
    * Navigate to a folder whose assets you want to publish. Select the folder, then on the toolbar, tap **[!UICONTROL Quick Publish.]**  You may find it helpful to use **[!UICONTROL List View]** so you can more easily check the publish status of a particular folder.
    * Navigate to a folder whose assets you want to publish. Open the folder, then select one or more assets. On the toolbar, tap **[!UICONTROL Quick Publish]**. You may find it helpful to use **[!UICONTROL List View]** so you can more easily check the publish status of a particular asset.

        >[!NOTE]
        >
        >If **[!UICONTROL Quick Publish]** is not seen on the toolbar, tap the ellipsis button instead, then select **[!UICONTROL Quick Publish]** from the list menu.

        ![Folder-level Quick Publish to Dynamic Media](/help/assets/assets-dm/selective-publish-folder-quick-publish-to-dm.png)
1. Select one of the following from the Quick Publish menu list.
    * **[!UICONTROL Publish to AEM]** &ndash; Publishes the selected assets immediately to AEM.
    * **[!UICONTROL Publish to Brand Portal]** &ndash; Publishes the selected assets immediately to **[!UICONTROL Brand Portal]**.<br>This option is only available if your AEM Assets instance has **[!UICONTROL Brand Portal]** already configured.
    * **[!UICONTROL Publish to Dynamic Media]** &ndash; Publishes the selected assets immediately to Dynamic Media.<br>An asset must already be synched up to Dynamic Media. If necessary, ensure that **[!UICONTROL Sync mode]** in a folder's properties is already set to **[!UICONTROL Sync everything in this folder sub-tree to dynamicmedia]**.
1. Tap **[!UICONTROL OK]**, then tap **[!UICONTROL Close]**.

## Using Search Results to publish or unpublish




## Troubleshooting Selective Publish.






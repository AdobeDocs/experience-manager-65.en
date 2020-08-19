---
title: Working with Selective Publish at the folder level in Dynamic Media
description: Information on how to work with Selective Publish at the folder level to publish assets in Dynamic Media or in AEM.
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
docset: aem65
---

# Configuring Selective Publish at the folder level
You can choose to publish or unpublish assets to or from AEM or Dynamic Media using either **[!UICONTROL Quick Publish]** or **[!UICONTROL Manage Publication]** features outside of the settings in your **[!UICONTROL Dynamic Media Configuration]**.

For example, you can work on assets for products that are not yet live. In such a case, a marketing team can access smart crop images and dynamic renditions that are synched to Dynamic Media so they can create promotional materials, all without having to publish those assets to Dynamic Media for global delivery.

>[!IMPORTANT]
>
>Selective Publish is only available in Dynamic Media - Scene7 mode.

>[!NOTE]
>
>Copying assets to and from Selective Publish folders clears the publish state of assets.

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
    | Inherited | |
    | Sync everything in this folder sub-tree to dynamicmedia |  |
    | Exclude everything in this folder sub-tree from dynamicmedia sync |  |

1. In the **[!UICONTROL Dynamic Media Publish mode]** drop-down list, select an option. Be aware that the **[!UICONTROL Dynamic Media Publish mode]** option always defaults to the value that is found in your **[!UICONTROL Dynamic Media Configuration]**. You can, however, manually change this default value at this folder level to override **[!UICONTROL Dynamic Media Configuration]** value.:
    | Dynamic Media Publish mode | Description |
    | --- | --- |
    | Immediately | This option is *not* available if you selected **[!UICONTROL Exclude everything in this folder sub-tree from dynamicmedia sync]** in **[!UICONTROL Sync mode]** in the previous step. |
    | Upon Activation | This option is *not* available if you selected **[!UICONTROL Exclude everything in this folder sub-tree from dynamicmedia sync]** in **[!UICONTROL Sync mode]** in the previous step. |
    | Selective Publish | This option is *not* available if you selected **[!UICONTROL Exclude everything in this folder sub-tree from dynamicmedia sync]** in **[!UICONTROL Sync mode]** in the previous step. |



## Using Selective Publish to publish assets in Dynamic Media

| Sync mode | Action |
| --- | --- |
| Immed   
## Using Publish to Dynamic Media from Quick Publish

## Using Manage Publication to publish to Dynamic Media


## Using Manage Publication to unpublish from Dynamic Media

## Using Search Results to publish



## Troubleshooting Selective Publish.






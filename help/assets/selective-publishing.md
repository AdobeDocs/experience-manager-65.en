---
title: Work with Selective Publish in Dynamic Media
description: You can choose to publish or unpublish assets to or from Adobe Experience Manager or Dynamic Media at the folder level. You can use either Manage Publication or Quick Publish instead of relying solely on the Dynamic Media Configuration whose settings are global to all folders across your Dynamic Media instance.
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
docset: aem65
role: User, Admin
exl-id: cd025e9d-6fb1-436c-9e78-795f2daaf345
feature: Publishing
solution: Experience Manager, Experience Manager Assets
---
# Configure selective publishing at the folder level in Dynamic Media {#selective-publish-configure-folder}

You can choose to publish or unpublish assets to or from Adobe Experience Manager or Dynamic Media at the folder level. You can use either **[!UICONTROL Manage Publication]** or **[!UICONTROL Quick Publish]** instead of relying solely on the **[!UICONTROL Dynamic Media Configuration]** whose settings are global to all folders across your Dynamic Media instance.

For example, with selective publishing you can work on assets for products that are not yet live. In such a case, a marketing team can access smart crop images and dynamic renditions that are synched to Dynamic Media. They can create promotional materials, all without the need to publish those assets to Dynamic Media for global delivery.

>[!IMPORTANT]
>
>Selective Publish is only available in Dynamic Media - Scene7 mode.

>[!NOTE]
>
>*Copying* assets to and from folders clears the publish state of those assets. However, when you *move* assets to and from folders whose folder property is set to **[!UICONTROL Selective Publish]**, the publish state of those assets is maintained.

If you decide later to change the **[!UICONTROL Selective Publish]** settings in a folder, those changes affect only new assets that you upload to that folder from that point forward. The publish state of existing assets in the folder remain as-is until you manually change them from either **[!UICONTROL Quick Publish]** or the **[!UICONTROL Manage Publication]** dialog box.

The folder level **[!UICONTROL Dynamic Media Publish mode]** option always defaults to the value that is found in the **[!UICONTROL Publish Assets]** setting in your **[!UICONTROL Dynamic Media Configuration]**. The following steps in this topic, however, show you how to manually change this default value at the folder level (as described in the following steps) to override the **[!UICONTROL Dynamic Media Configuration]** value.

Regardless of whether you rely on either of the following:

* **[!UICONTROL Publish Assets]** value set in **[!UICONTROL Dynamic Media Configuration]**.
* **[!UICONTROL Dynamic Media Publish mode]** value set in folder level properties.

You can choose **[!UICONTROL Immediately]**, **[!UICONTROL On Activation]**, or **[!UICONTROL Selective Publish]**. For example, you can set the **[!UICONTROL Publish Assets]** value in your **[!UICONTROL Dynamic Media Configuration]** to **[!UICONTROL On Activation]**, but set the **[!UICONTROL Dynamic Media Publish]** mode value at the folder level to **[!UICONTROL Selective Publish]**, and conversely.

After you configure selective publishing in a folder, you can do any of the following:

* [Selectively publish assets to Dynamic Media or Experience Manager using Manage Publication](#selective-publish-manage-publication).
* [Selectively unpublish assets from Dynamic Media or Experience Manager using Manage Publication](#selective-unpublish-manage-publication).
* [Publish assets to Dynamic Media or Experience Manager using Quick Publish](#quick-publish-aem-dm).
* [Selectively publish or unpublish assets by way of search results](#selective-publish-unpublish-search-results).

**To configure selective publishing at the folder level in Dynamic Media:**

1. In Experience Manager, select the Experience Manager logo to access the global navigation console. On the left side, select the Navigation icon (just above the Tools icon), then select **[!UICONTROL Assets]** > **[!UICONTROL Files]**.
1. Do one of the following:
    * Edit the properties of an existing folder - In **[!UICONTROL Card View]**, **[!UICONTROL Column View]**, or **[!UICONTROL List View]**, navigate to a folder whose properties you want to edit. Select the folder, then on the toolbar, select **[!UICONTROL Properties]**.
    * Edit the properties of a new folder - In **[!UICONTROL Card View]**, **[!UICONTROL Column View]**, or **[!UICONTROL List View]**, near the upper-right corner of the page, select **[!UICONTROL Create]** > **[!UICONTROL Folder]**. In the **[!UICONTROL Create Folder]** dialog box, enter a title (required) for the folder, then select **[!UICONTROL Create]**. Select the folder, then on the toolbar, select **[!UICONTROL Properties]**.

1. In the **[!UICONTROL Sync mode]** drop-down list, select one of the following:

    | Sync mode | Description |
    | --- | --- |
    | **[!UICONTROL Inherited]** | No explicit sync value on the folder; instead, the folder inherits the sync value from one of its ancestor folders or the default mode set in your **[!UICONTROL Dynamic Media Configuration]**. The detailed status for **[!UICONTROL Inherited]** shows by way of a tool tip. |
    | **[!UICONTROL Sync everything in this folder subtree to Dynamic Media]** | For publishing to Dynamic Media to succeed, assets must be synced to Dynamic Media. Selecting this option includes all assets in this subtree for synchronizing to Dynamic Media. The folder-specific settings override the default setting in the **[!UICONTROL Dynamic Media Configuration]**. |
    | **[!UICONTROL Exclude everything in this folder subtree from Dynamic Media sync]** | Exclude all assets in this subtree from synchronizing to Dynamic Media. |

    ![Folder level selective publish](/help/assets/assets-dm/createfolder-properties-selectivepublish.png)

1. In the **[!UICONTROL Dynamic Media Publish mode]** drop-down list, select an option. The **[!UICONTROL Dynamic Media Publish mode]** option always defaults to the value that is set in the **[!UICONTROL Dynamic Media Configuration]**. You can, however, manually override this default **[!UICONTROL Dynamic Media Configuration]** value by using one of the following options.

    >[!IMPORTANT]
    >
    >Regardless of the Dynamic Media Publish mode option you select, any updates you later make to an asset that is *already* published, those updates are immediately published without any further user action.
    >
    >If a published video is updated, it must be published again to reflect changes on delivery.

    | Dynamic Media Publish mode option | Description |
    | --- | --- |
    | **[!UICONTROL Immediately]** | When assets are uploaded to this folder, the system ingests the assets into Experience Manager and provides the URL/Embed instantly. This option is tied to Experience Manager publishing only and there is no user intervention necessary to publish assets.<br>This option is *not* available if you selected **[!UICONTROL Exclude everything in this folder subtree from Dynamic Media sync]** in **[!UICONTROL Sync mode]** in the previous step. |
    | **[!UICONTROL Upon Activation]** | When assets are uploaded to this folder, you must explicitly publish the asset first before a URL/Embed link is provided. This option is tied to Experience Manager publishing only.<br>This option is *not* available if you selected **[!UICONTROL Exclude everything in this folder subtree from Dynamic Media sync]** in **[!UICONTROL Sync mode]** in the previous step. |
    | **[!UICONTROL Selective Publish]** | Assets are published to your choice of either Experience Manager or to Dynamic Media for delivery in the public domain. Both publishing methods are mutually exclusive of each other. That is, you can publish assets to DMS7 so you can use features such as Smart Crop or dynamic renditions. Or, you can publish assets exclusively to Experience Manager for secure previewing; those same assets are *not* published to DMS7 for delivery in the public domain. This option is not available if you selected **[!UICONTROL Exclude everything in this folder subtree from Dynamic Media sync]** in **[!UICONTROL Sync mode]** in the previous step. |

1. In the upper-right corner of the page, select **[!UICONTROL Save & Close]**, then select **[!UICONTROL OK]** to return to Experience Manager Assets.

## Selectively publish assets to Dynamic Media or Experience Manager using Manage Publication{#selective-publish-manage-publication}

Before you can use **[!UICONTROL Manage Publication]** to selectively publish assets to Dynamic Media or Experience Manager, be sure you have set one of the following:

* The **[!UICONTROL Publish Assets]** option in **[!UICONTROL Dynamic Media Configuration]** to **[!UICONTROL Selective Publish]**
* Configured selective publishing at the folder level.

See [Create a Dynamic Media configuration](#configuring-dynamic-media-cloud-services) or [Configure selective publishing at the folder level in Dynamic Media](#selective-publish-configure-folder)

>[!IMPORTANT]
>
>Selective Publish is only available in Dynamic Media - Scene7 mode.

>[!NOTE]
>
>*Copying* assets to and from folders clears the publish state of those assets. However, when you *move* assets to and from folders whose folder property is set to **[!UICONTROL Selective Publish]**, the publish state of those assets is maintained.

**To selectively publish assets to Dynamic Media or Experience Manager using Manage Publication:**

1. In Experience Manager, select the Experience Manager logo to access the global navigation console. On the left side, select the Navigation icon (just above the Tools icon), then select **[!UICONTROL Assets]** > **[!UICONTROL Files]**.
1. In **[!UICONTROL Card View]**, **[!UICONTROL Column View]**, or **[!UICONTROL List View]**, do one of the following:
    * Navigate to a folder whose assets you want to publish. Select the folder, then on the toolbar, select **[!UICONTROL Manage Publication]**. Use **[!UICONTROL List View]** so you can more easily check the publishing status of a particular folder.
    * Navigate to a folder whose assets you want to publish. Open the folder, then select one or more assets. On the toolbar, select **[!UICONTROL Manage Publication]**. Use **[!UICONTROL List View]** so you can more easily check the publishing status of a particular asset.

        >[!NOTE]
        >
        >If **[!UICONTROL Manage Publication]** is not seen on the toolbar, select the ellipsis button instead, then select **[!UICONTROL Manage Publication]** from the list menu.

1. In the **[!UICONTROL Manage Publication - Options]** page, under **[!UICONTROL Action]**, select the type of activation you want.

    | Action | Description |
    | --- | --- |
    | **[!UICONTROL Publish]** (to Experience Manager) | Select this option so you can publish assets to Experience Manager for secure preview. |
    | **[!UICONTROL Publish to Dynamic Media]** | Select this option so you can publish assets to Dynamic Media for delivery in the public domain or so you can use features such as Smart Crop or dynamic renditions.<br>This option is available only if **[!UICONTROL Dynamic Media Publish mode]** is set to **[!UICONTROL Selective Publish]** in the folder's properties. |

1. Under **[!UICONTROL Schedule]**, set the timing of the publishing.

    | Schedule | Description |
    | --- | --- |
    | **[!UICONTROL Now]** | Select to publish the assets immediately. |
    | **[!UICONTROL Later]** | Select to publish the assets on a particular date and time. |

1. In the upper-right corner of the **[!UICONTROL Manage Publication]** page, select **[!UICONTROL Next]**.
1. In the **[!UICONTROL Manage Publication - Scope]** page, do one of the following:

    * If necessary, select one or more assets that you want to remove from publishing.
    * In the upper-right corner of the **[!UICONTROL Manage Publication - Scope]** page, select **[!UICONTROL Publish]** or **[!UICONTROL Publish to Dynamic Media]**.
1. Select **[!UICONTROL OK]**. 

### Selectively unpublish assets from Dynamic Media or Experience Manager using Manage Publication {#selective-unpublish-manage-publication}

1. In Experience Manager, select the Experience Manager logo to access the global navigation console. On the left side, select the Navigation icon (just above the Tools icon), then select **[!UICONTROL Assets]** > **[!UICONTROL Files]**.
1. In **[!UICONTROL Card View]**, **[!UICONTROL Column View]**, or **[!UICONTROL List View]**, do one of the following:
    * Navigate to a folder whose assets you want to unpublish. Select the folder, then on the toolbar, select **[!UICONTROL Manage Publication]**. Use **[!UICONTROL List View]** so you can more easily check the publishing status of a particular folder.
    * Navigate to a folder whose assets you want to unpublish. Open the folder, then select one or more assets. On the toolbar, select **[!UICONTROL Manage Publication]**. Use **[!UICONTROL List View]** so you can more easily check the publishing status of a particular asset.

        >[!NOTE]
        >
        >If **[!UICONTROL Manage Publication]** is not seen on the toolbar, select the ellipsis button instead, then select **[!UICONTROL Manage Publication]** from the list menu.

1. In the **[!UICONTROL Manage Publication - Options]** page, under **[!UICONTROL Action]**, select the type of de-activation you want.

    | Action | Description |
    | --- | --- |
    | **[!UICONTROL Unpublish]** (from Experience Manager) | Select this option if you want to unpublish assets from Experience Manager. |
    | **[!UICONTROL Unpublish from Dynamic Media]** | Select this option if you want to unpublish assets from Dynamic Media.<br>This option is available only if **[!UICONTROL Dynamic Media Publish mode]** is set to **[!UICONTROL Selective Publish]** in the folder's properties. |

1. Under **[!UICONTROL Schedule]**, set the timing of the de-activation.

    | Schedule | Description |
    | --- | --- |
    | **[!UICONTROL Now]** | Select to unpublish the assets immediately. |
    | **[!UICONTROL Later]** | Select to unpublish the assets on a particular date and time. |
 
1. In the upper-right corner of the **[!UICONTROL Manage Publication]** page, select **[!UICONTROL Next]**.
1. In the **[!UICONTROL Manage Publication - Scope]** page, do one of the following:
    * Select one or more assets that you want to remove from unpublishing.
    * In the upper-right corner of the **[!UICONTROL Manage Publication - Scope]** page, select **[!UICONTROL Unpublish]** or **[!UICONTROL Unpublish from Dynamic Media]**.
1. Select **[!UICONTROL OK]**. 

## Publish assets to Dynamic Media or Experience Manager using Quick Publish {#quick-publish-aem-dm}

You can use **[!UICONTROL Quick Publish]** for simple asset activation cases. **[!UICONTROL Quick Publish]** publishes the selected assets immediately without any further user interaction. Because of this action, any non-published references are also published automatically.

>[!NOTE]
>
>To use **[!UICONTROL Quick Publish]** to publish assets to Dynamic Media or Experience Manager, be sure **[!UICONTROL Selective Publish]** is enabled either in your **[!UICONTROL Dynamic Media Configuration]** or in the folder properties of the selected folder.

**To publish assets to Dynamic Media or Experience Manager using Quick Publish:**

1. In Experience Manager, select the Experience Manager logo to access the global navigation console. On the left side of the page, select the Navigation icon (just above the Tools icon), then on the right side of the page select **[!UICONTROL Assets]** > **[!UICONTROL Files]**.
1. In **[!UICONTROL Card View]**, **[!UICONTROL Column View]**, or **[!UICONTROL List View]**, do one of the following:
    * Navigate to a folder whose assets you want to publish. Select the folder, then on the toolbar, select **[!UICONTROL Quick Publish]**. Use **[!UICONTROL List View]** so you can more easily check the publishing status of a particular folder.
    * Navigate to a folder whose assets you want to publish. Open the folder, then select one or more assets. On the toolbar, select **[!UICONTROL Quick Publish]**. Use **[!UICONTROL List View]** so you can more easily check the publishing status of a particular asset.

        >[!NOTE]
        >
        >If **[!UICONTROL Quick Publish]** is not seen on the toolbar, select the ellipsis button instead, then select **[!UICONTROL Quick Publish]** from the list menu.

        ![Folder-level Quick Publish to Dynamic Media](/help/assets/assets-dm/selective-publish-folder-quick-publish-to-dm.png)

1. Select one of the following options from the **[!UICONTROL Quick Publish]** menu list.

    | Quick Publish option | What it does |
    | --- | --- |
    | Publish to Experience Manager | Publishes the selected assets immediately to Experience Manager. |
    | Publish to Brand Portal | Publishes the selected assets immediately to **[!UICONTROL Brand Portal]**.<br>This option is only available if your Experience Manager Assets instance has **[!UICONTROL Brand Portal]** already configured. |
    | Publish to Dynamic Media | Publishes the selected assets immediately to Dynamic Media.<br>An asset must be synched to Dynamic Media. If necessary, ensure that **[!UICONTROL Sync mode]** in a folder's properties is already set to **[!UICONTROL Sync everything in this folder subtree to Dynamic Media]**. |

1. Select **[!UICONTROL OK]**, then select **[!UICONTROL Close]**.

## Selectively publish or unpublish assets by way of search results {#selective-publish-unpublish-search-results}

Search results can show assets from across asset folders that have different Dynamic Media publish settings. Where you select multiple assets from search results, and each asset has different Dynamic Media publish mode settings, you can trigger **[!UICONTROL Manage Publication]** from the toolbar, to publish, or unpublish.

See also [Search assets in Experience Manager](/help/assets/search-assets.md).

**To selectively publish or unpublish assets by way of search results:**

1. In Experience Manager, in the upper-left corner of the page, select the Experience Manager logo to access the global navigation console. On the left side of the page, select the Navigation icon (just above the Tools icon), then select **[!UICONTROL Assets]** > **[!UICONTROL Files]**.
1. On the toolbar, near the upper-right corner of the page, select the Search icon (magnifying glass).
1. In the **[!UICONTROL Type to search]** text field, enter a keyword, then press **[!UICONTROL Enter]**.
1. Near the upper-right corner of the page, select the **[!UICONTROL List View]** icon.
1. Near the upper-left corner of the page, select the **[!UICONTROL Filters]** icon.

    ![List View and Filters in search results](/help/assets/assets-dm/select-publish-search-result.png)

1. In the left panel, expand **[!UICONTROL Status]**, then expand the **[!UICONTROL Dynamic Media]** search predicate.
1. Use the **[!UICONTROL Published]** and **[!UICONTROL Unpublished]** check boxes to further refine the search results based on the published state of Dynamic Media assets.
Optionally, you can use these check boxes with the **[!UICONTROL Publish]** search predicate to refine the search results of **[!UICONTROL Published]** and **[!UICONTROL Unpublished]** Experience Manager assets.
1. Do one of the following:
    * Select one or more assets that you want to publish or unpublish.
    * Near the upper-right corner of the **[!UICONTROL Search Results]** page, select **[!UICONTROL Select All]**.
1. On the toolbar, select **[!UICONTROL Manage Publication]**. Select the ellipsis icon on the toolbar so you can open **[!UICONTROL Manage Publication]**.
1. On the **[!UICONTROL Manage Publication - Options]** page, select the desired action.

    | Selected action | Publish Assets setting in Dynamic Media Configuration | Assets are |
    | --- | --- | --- |
    | Publish | Immediately or Upon Activation | Published to Experience Manager and Dynamic Media. |
    | Publish | Selective Publish | Published to Experience Manager only. |
    | Unpublish | Immediately or Upon Activation | Unpublished from Experience Manager and Dynamic Media. |
    | Unpublish | Selective Publish | Unpublished from Experience Manager only. |
    | Publish to Dynamic Media | Immediately or Upon Activation | Not published to Experience Manager, or Dynamic Media, or both. |
    | Publish to Dynamic Media | Selective Publish | Published to Dynamic Media only. |
    | Unpublish from Dynamic Media | Immediately or Upon Activation | Not unpublished from Experience Manager, or Dynamic Media, or both. |
    | Unpublish from Dynamic Media | Selective Publish | Unpublished from Dynamic Media only. |

1. Under **[!UICONTROL Schedule]**, set the timing of the de-activation.

    | Selected schedule | What happens |
    | --- | --- |
    | Now | The selected action is performed immediately. |
    | Later | The selected action is run on the selected particular date and time. |

1. In the upper-right corner of the **[!UICONTROL Manage Publication - Options]** page, select **[!UICONTROL Next]**.
1. (Optional) In the **[!UICONTROL Manage Publication - Scope]** page, review the **[!UICONTROL Publish Target]** column in the table for the selected assets. 

    | Publish Assets setting in Dynamic Media Configuration | Selected action | Publish Target |
    | --- | --- | --- |
    | Immediately or <br>Upon Activation | Publish | Experience Manager and Dynamic Media |
    | Immediately or <br>Upon Activation | Publish to Dynamic Media | None |
    | Selective Publish | Publish | Experience Manager |
    | Selective Publish | Publish to Dynamic Media | Dynamic Media |
    | Immediately or <br>Upon Activation | Unpublish | Experience Manager and Dynamic Media |
    | Immediately or <br>Upon Activation | Unpublish from Dynamic Media | None |
    | Selective Publish | Unpublish | Experience Manager |
    | Selective Publish | Unpublish from Dynamic Media | Dynamic Media |

1. In the **[!UICONTROL Manage Publication - Scope]** page, do one of the following:
    * Select one or more assets that you want to remove from publishing or unpublishing.
    * In the upper-right corner of the **[!UICONTROL Manage Publication - Scope]** page, select **[!UICONTROL Publish]** or **[!UICONTROL Unpublish]** to begin the action.
1. Select **[!UICONTROL OK]**.

## Check the publishing status of an asset {#check-publish-status-of-asset}

You can use **[!UICONTROL Timeline]** with **[!UICONTROL Card view]**, **[!UICONTROL Column View]**, or **[!UICONTROL List View]** in Experience Manager to quickly check the publish state of an asset. 

**To check the publishing status of an asset:**

1. In Experience Manager, in the upper-left corner of the page, select the Experience Manager logo to access the global navigation console. On the left side of the page, select the Navigation icon (just above the Tools icon), then select **[!UICONTROL Assets]** > **[!UICONTROL Files]**.
1. In **[!UICONTROL Card View]**, **[!UICONTROL Column View]**, or **[!UICONTROL List View]** (screenshot below shows the **[!UICONTROL List View]**), open a folder that contains assets you have published or unpublished.
1. Select an asset so it appears with a checkmark. See screenshot below for example.
1. Near the upper-left corner of the page, from the drop-down menu, select **[!UICONTROL Timeline]**. The **[!UICONTROL Status]** region in the left-panel shows the publish state of the selected asset.
When you use **[!UICONTROL List View]**, an extra column for **[!UICONTROL Dynamic Media]** publish state appears.
    * A folder that is configured to sync to Dynamic Media displays the **[!UICONTROL Dynamic Media]** column by default.
    * A folder that is *not* configured to sync to Dynamic Media does not display the Dynamic Media column.
    ![List View and Timeline](/help/assets/assets-dm/selective-publish-status-timeline.png)

## Troubleshoot Selective Publish {#selective-publish-troubleshoot}

An asset that is not synced to Dynamic Media but has a Dynamic Media publish action triggered on it results in the following error message and solution:

![Selective Publish error](/help/assets/assets-dm/selective-publish-error.png)

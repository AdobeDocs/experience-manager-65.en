---
title: Profiles for Processing Metadata, Images, and Videos
seo-title: Profiles for Processing Metadata, Images, and Videos
description: A profile a set of rules around the options to be applied to assets uploaded to a folder. Specify what metadata profile and video encoding profile to apply to video assets that you upload. For image assets, you can also specify what imaging profile to apply to image assets to have them properly cropped.
seo-description: A profile a set of rules around the options to be applied to assets uploaded to a folder. Specify what metadata profile and video encoding profile to apply to video assets that you upload. For image assets, you can also specify what imaging profile to apply to image assets to have them properly cropped.
uuid: d95978b9-ffa4-4895-854f-3f7bd396e019
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: administering
content-type: reference
discoiquuid: 347a90ae-a0c5-44f5-8e80-edc3edc1386f
---

# About profiles for processing metadata, images, and videos {#profiles-for-processing-metadata-images-and-videos}

A profile is a recipe for what options to apply to assets that get uploaded to a folder. For example, you can specify what metadata profile and video encoding profile to apply to video assets that you upload. Or, what imaging profile to apply to image assets to have them properly cropped.

Those rules can include adding metadata, smart cropping of images, or establishing video encoding profiles. In AEM, you can create three types of profiles, which are covered in detail at the following links:

* [Metadata profiles](metadata-profiles.md)
* [Image profiles](image-profiles.md)
* [Video profiles](video-profiles.md)

You must have Administrator rights to create, edit, and delete metadata, image, or video profiles.

After you create your metadata, image, or video profile, you assign it to one or more folders that you use as the destination for newly uploaded assets.

See also [Best practices for organizing your digital assets for using processing profiles](best-practices-for-file-management.md).

>[!NOTE]
>
>Assets that you move from one folder to another do not get reprocessed. For example, suppose you have Folder 1 that has profile A assigned to it and Folder 2 that has profile B assigned to it. If you move assets from Folder 1 to Folder 2, the moved assets retain their original processing from Folder 1.
>
>The same is true even when you move assets between two folders that have the same profile assigned to it.

## Reprocessing assets in a folder {#reprocessing-assets}

>[!NOTE]
>
>Applies to *Dynamic Media - Scene7 mode* only in AEM 6.4.6.0 or later.

You can reprocess assets in a folder that already has an existing processing profile that you later changed. 

For example, suppose you created an Image profile and assigned it to a folder. Any image assets you uploaded to the folder automatically had the Image profile applied to the assets. However, later you decide to add a new smart crop ratio the profile. Now, instead of having select and reupload the assets to the folder all over again, you simply run the *Scene7: Reprocess Assets* workflow. A single workflow job applies your updated profile up to a default of 50 assets in the folder.

You can run the reprocess workflow on an asset for which processing failed the first time. As such, even if you have not edited a processing profile or applied a processing profile, you can still run the reprocess workflow on a folder of assets any time.

You can optionally adjust the batch size of the reprocess workflow from a default of 50 assets up to 1000 assets, for a single job. 


**To reprocess assets in a folder**:
1. In AEM, from the Assets page, navigate to a folder of assets that has a processing profile assigned to it and for which you want to apply the **Scene7: Reprocess Asset** workflow,

    Folders that have a processing profile already assigned to it are indicated by the display of the profile's name directly below the folder name in Card View. 

1. Select a folder.

    * The workflow considers all files in the selected folder, recursively.
    * If there are one or more sub-folders with assets in the main selected folder, the workflow will reprocess every asset in the folder hierarchy.
    * As a best practice, you should avoid running this workflow on a folder hierarchy that has more than 1000 assets.

1. Near the upper-left corner of the page, from the drop-down list, click **[!UICONTROL Timeline]**.
1. Near the lower-left corner of the page, to the right of the Comment field, click the carat icon  ( **^** ) .

    ![Reprocess assets workflow 1](/help/assets/assets/reprocess-assets1.png)

1. Click **[!UICONTROL Start Workflow]**.
1. From the **[!UICONTROL Start Workflow]** drop-down list, choose **[!UICONTROL Scene7: Reprocess Assets]**.
1. (Optional) In the **Enter title of workflow** text field, enter a name for the workflow. You can use the name to reference the workflow instance, if necessary.

    ![Reprocess assets 2](/help/assets/assets/reprocess-assets2.png)

1. Click **[!UICONTROL Start]**, then click **[!UICONTROL Confirm]**.

    To monitor the workflow or check its progress, from the AEM main console page, click **[!UICONTROL Tools > Workflow]**. On the Workflow Instances page, select a workflow. On the menu bar, click **[!UICONTROL Open History]**. You can also terminate, suspend, or rename a selected workflow from the same Workflow Instances page.

### Adjusting the batch size of the reprocess workflow {#adjusting-load}

(Optional) The default batch size in the reprocessing workflow is 50 assets per job. However, you can adjust that default for several hundred assets. A maximum size setting of up to 1000 assets is permitted per reprocessing workflow job.

**To optionally adjust the batch size of the reprocess workflow**:

1. In Experience Manager, tap **[!UICONTROL Adobe Experience Manager]** to access the global navigation console, then tap the **[!UICONTROL Tools]** (hammer) icon > **[!UICONTROL Workflow > Models]**.
1. On the Workflow Models page, in Card View or List View, select **[!UICONTROL Scene7: Reprocess Assets]**.

    ![Workflow Models page with Scene7: Reprocess Assets workflow selected in Card View](/help/assets/assets/workflow-models0.png)

1. On the tool bar, click **[!UICONTROL Edit]**. A new browser tab opens the Scene7: Reprocess Assets workflow model page.
1. On the Scene7: Reprocess Assets workflow page, double-click any step between Flow Start and Flow End of the model. 
    
    For example, double-click the **[!UICONTROL Scene7: Reprocess Assets]** step to open the **Reprocess Assets - Step Properties** dialog box.

    >[!NOTE]
    >
    >The Scene7: Reprocess Assets model is an out-of-the-box workflow. As such, if you are unable to select a step in the model, in the upper-right corner of the page, tap **[!UICONTROL Edit]** to "unlock" the workflow, then try double-clicking a step again.

    ![Unlocking the Scene7: Reprocess Assets workflow model](/help/assets/assets/workflow-models7.png)

1. In the upper-right corner of the dialog box, tap **[!UICONTROL Done]** (check mark icon).

    ![Properties dialog box](/help/assets/assets/workflow-models12.png)

1. In the upper-right corner of the Scene7: Reprocess Assets workflow model page, tap **[!UICONTROL Sync]**. When you see **[!UICONTROL Synced]**, the workflow runtime model is successfully synchronized.

    ![Synchronizing the workflow model](/help/assets/assets/workflow-models11.png)

    Close the browser tab that shows the Scene7: Reprocess Assets workflow model.
 
1. Return to the browser tab that has the open Workflow Models page, then press **Esc** to exit the selection.
1. In the upper-left corner of the page, tap **[!UICONTROL Adobe Experience Manager]** to access the global navigation console, then tap the **[!UICONTROL Tools]** (hammer) icon > **[!UICONTROL General > CRXDE Lite]**.
1. In the folder tree on the left side of the CRXDE Lite page, navigate to the following location:

   `/conf/global/settings/workflow/models/scene7_reprocess_assets/jcr:content/flow/reprocess/metaData`

   ![CRXDE Lite](/help/assets/assets/workflow-models9.png)

1. On the right side of the CRXDE Lite page, in the lower portion, enter the following name, type, and value in its respective field:
    * **[!UICONTROL Name]**: `reprocess-batch-size`
    * **[!UICONTROL Type]**: `Long`
    * **[!UICONTROL Value]**: enter a default value (50-1000) for the batch size
1. In the lower-right corner, tap **[!UICONTROL Add]**. The new property appears as the following:

    ![Saving the new property](/help/assets/assets/workflow-models10.png)

1. On the menu bar of the CRXDE Lite page, tap **[!UICONTROL Save All]**.
1. In the upper-left corner of the page, tap **[!UICONTROL CRXDE Lite]** to return to the main AEM console
1. Repeat steps 1-7 to re-synchronize the new batch size to the Scene7: Reprocess Assets workflow model.
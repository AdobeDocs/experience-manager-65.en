---
title: Profiles for Processing Metadata, Images, and Videos
seo-title: Profiles for Processing Metadata, Images, and Videos
description: A profile a set of rules around the options to be applied to assets uploaded to a folder. Specify what metadata profile and video encoding profile to apply to video assets that you upload. For image assets, you can also specify what imaging profile to apply to image assets to have them properly cropped.
seo-description: A profile a set of rules around the options to be applied to assets uploaded to a folder. Specify what metadata profile and video encoding profile to apply to video assets that you upload. For image assets, you can also specify what imaging profile to apply to image assets to have them properly cropped.
uuid: 6ded2a2f-a0d3-4f43-af97-02fbc0902c25
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: administering
content-type: reference
discoiquuid: b555bf0c-44cb-4fbf-abc4-15971663904d
docset: aem65

---

# Profiles for processing metadata, images, and videos{#profiles-for-processing-metadata-images-and-videos}

A profile is a recipe for what options to apply to assets that get uploaded to a folder. For example, you can specify what metadata profile and video encoding profile to apply to video assets that you upload. Or, what imaging profile to apply to image assets to have them properly cropped.

Those rules can include adding metadata, smart cropping of images, or establishing video encoding profiles. In AEM, you can create three types of profiles, which are covered in detail at the following links:

* [Metadata profiles](/help/assets/metadata-profiles.md)
* [Image profiles](/help/assets/image-profiles.md)
* [Video profiles](/help/assets/video-profiles.md)

You must have Administrator rights to create, edit, and delete metadata, image, or video profiles.

After you create your metadata, image, or video profile, you assign it to one or more folders that you use as the destination for newly uploaded assets.

See also [Best Practices for Organizing your Digital Assets for using Processing Profiles](/help/assets/best-practices-for-file-management.md).

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

For example, suppose you created an Image profile and assigned it to a folder. Any image assets you uploaded to the folder automatically had the Image profile applied to the assets. However, later you decide to add a new smart crop ratio to the profile. Now, instead of having select and reupload the assets to the folder all over again, you simply run the *Scene7: Reprocess Assets* workflow. 

You can run the reprocess workflow on an asset for which processing failed the first time. As such, even if you have not edited a processing profile or applied a processing profile, you can still run the reprocess workflow on a folder of assets any time.

You can optionally adjust the batch size of the reprocess workflow from a default of 50 assets up to 1000 assets. When you run the _Scene7: Reprocess Assets_ workflow on a folder, assets are grouped together in batches, then sent to the Dynamic Media server for processing. Following processing, the metadata of each asset in the entire batch set is updated on AEM. If the batch size is very large, you may experience a delay in processing. Or, if the batch size is too small, it can cause too many round trips to the Dynamic Media server.

See [Adjusting the batch size of the reprocess workflow](#adjusting-load).

>[!NOTE]
>
>If you are performing a bulk migration of assets from Dynamic Media Classic to AEM, you must enable the Migration replication agent on the Dynamic Media server. When the migration is complete, make sure you disable the agent.
 The Migration publish agent must be disabled on the Dynamic Media server so the Reprocess workflow works as expected.

<!-- Batch size is the number of assets that are amalgamated into a single IPS (Dynamic Media’s Image Production System) job. When you run the Scene7: Reprocess Assets workflow, the job is triggered on IPS. The number of IPS jobs that are triggered is based on the total number of assets in the folder, divided by the batch size. For example, suppose you had a folder with 150 assets and a batch size of 50. In this case, three IPS jobs are triggered. The assets are updated when the entire batch size (50 in our example) is processed in IPS. The job then moves onto the next IPS job and so on until complete. If you increase the batch size, you may notice a longer delay with assets getting updated. -->

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

(Optional) The default batch size in the reprocessing workflow is 50 assets per job. This optimal batch size is governed by the average asset size and the mime types of assets on which the reprocess is run. A higher value means you will have many files in a single reprocessing job. Accordingly, the processing banner stays on AEM assets for a longer time. However, if the average file size is small&ndash;1 MB or less&ndash;Adobe recommends that you increase the value to several hundred, but never more than a 1000. If the average file size is large&ndash;hundreds of megabytes&ndash;Adobe recommends that you lower the batch size up to 10.

**To optionally adjust the batch size of the reprocess workflow**

1. In Experience Manager, tap **[!UICONTROL Adobe Experience Manager]** to access the global navigation console, then tap the **[!UICONTROL Tools]** (hammer) icon > **[!UICONTROL Workflow > Models]**.
1. On the Workflow Models page, in Card View or List View, select **[!UICONTROL Scene7: Reprocess Assets]**.

    ![Workflow Models page with Scene7: Reprocess Assets workflow selected in Card View](/help/assets/assets-dm/reprocess-assets7.png)

1. On the tool bar, click **[!UICONTROL Edit]**. A new browser tab opens the Scene7: Reprocess Assets workflow model page.
1. On the Scene7: Reprocess Assets workflow page, near the upper-right corner, tap **[!UICONTROL Edit]** to "unlock" the workflow.
1. In the workflow, select the Scene7 Batch Upload component to open the toolbar, then tap **[!UICONTROL Configure]** on the toolbar.

    ![Scene7 Batch Upload component](/help/assets/assets-dm/reprocess-assets8.png)

1. On the **[!UICONTROL Batch Upload to Scene7&mdash;Step Properties]** dialog box, set the following:
    * In the **[!UICONTROL Title]** and **[!UICONTROL Description]** text fields, enter a new title and description for the job, if desired.
    * Select **[!UICONTROL Handler Advance]** if your handler will advance to the next step.
    * In the **[!UICONTROL Timeout]** field, enter the external process timeout (seconds).
    * In the **[!UICONTROL Period]** field, enter a polling interval (seconds) to test for the completion of the external process. 
    * In the **[!UICONTROL Batch field]**, enter the maximum number of assets (50-1000) to process in a Dynamic Media server batch processing upload job.
    * Select **[!UICONTROL Advance on timeout]** if you want to advance when the timeout is reached. Deselect if you want to proceed to the inbox when the timeout is reached. 

    ![Properties dialog box](/help/assets/assets-dm/reprocess-assets3.png)

1. In the upper-right corner of the **[!UICONTROL Batch Upload to Scene7 &ndash; Step Properties]** dialog box, tap **[!UICONTROL Done]**. 

1. In the upper-right corner of the Scene7: Reprocess Assets workflow model page, tap **[!UICONTROL Sync]**. When you see **[!UICONTROL Synced]**, the workflow runtime model is successfully synchronized and ready to reprocess assets in a folder.

    ![Synchronizing the workflow model](/help/assets/assets-dm/reprocess-assets1.png)

1. Close the browser tab that shows the Scene7: Reprocess Assets workflow model.
 
<!--1. Return to the browser tab that has the open Workflow Models page, then press **Esc** to exit the selection.
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
1. Repeat steps 1-7 to re-synchronize the new batch size to the Scene7: Reprocess Assets workflow model.-->

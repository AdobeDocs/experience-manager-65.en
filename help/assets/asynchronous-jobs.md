---
title: Configure asynchronous operations in [!DNL Adobe Experience Manager].
description: Asynchronously complete some resource-intensive tasks to optimize performance in [!DNL Experience Manager Assets].
contentOwner: AG
---

# Asynchronous operations {#asynchronous-operations}

To reduce adverse impact on performance, [!DNL Adobe Experience Manger Assets] processes certain long-running and resource-intensive asset operations asynchronously. Asynchronous processing involves enqueuing multiple tasks and eventually executing them in a serial manner subject to the availability of system resources. These operations include:

* Deleting many assets.
* Moving many assets or assets with many references.
* Exporting and importing asset metadata in bulk.
* Fetching assets from a remote [!DNL Experience Manager] deployment, that are more than a set threshold limit. The limit is on the number of assets.

You can view the status of asynchronous tasks from the **[!UICONTROL Async Job Status]** page.

>[!NOTE]
>
>By default, the [!DNL Assets] tasks execute in parallel. If `N` is the number of CPU cores, `N/2` tasks can execute in parallel, by default. To use custom settings for the task queue, modify the **[!UICONTROL Async Operation Default Queue]** configuration from the [!UICONTROL Web Console]. For more information, see [queue configurations](https://sling.apache.org/documentation/bundles/apache-sling-eventing-and-job-handling.html#queue-configurations).

## Monitor the status of asynchronous operations {#monitoring-the-status-of-asynchronous-operations}

Whenever [!DNL Assets] processes an operation asynchronously, you receive a notification in your [!DNL Experience Manager] [Inbox](/help/sites-authoring/inbox.md) and via an email. To view the status of the asynchronous operations in detail, navigate to the **[!UICONTROL Async Job Status]** page.

1. In the [!DNL Experience Manager] interface click **[!UICONTROL Operations]** &gt; **[!UICONTROL Jobs]**.

1. In the **[!UICONTROL Async Job Status]** page, review the details of the operations.

    ![Status and details of Asynchronous operations](assets/AsyncOperation-status.png)

   To ascertain the progress of an operation, see the **[!UICONTROL Status]** column. Depending upon the progress, one of the following statuses is displayed:

   * **[!UICONTROL Active]**: The operation is being processed.
   * **[!UICONTROL Success]**: The operation is complete.
   * **[!UICONTROL Fail]** or **[!UICONTROL Error]**: The operation could not be processed.
   * **[!UICONTROL Scheduled]**: The operation is scheduled for processing a later time.

1. To stop an active operation, select it from the list and click **[!UICONTROL Stop]** ![stop icon](assets/do-not-localize/stop_icon.svg) from the toolbar.

1. To view extra details, for example description and logs, select the operation and click **[!UICONTROL Open]** ![open_icon](assets/do-not-localize/edit_icon.svg) from the toolbar. The task details page is displayed.

   ![Details of a metadata import task](assets/job_details.png)

1. To delete the operation from the list, select **[!UICONTROL Delete]** from the toolbar. To download the details in a CSV file, click **[!UICONTROL Download]**.

   >[!NOTE]
   >
   >You cannot delete a task if its status is either active or queued.

## Purge completed tasks {#purge-completed-tasks}

[!DNL Experience Manager Assets] executes a purge task every day at 0100 hours to delete completed asynchronous tasks that are more than a day old.

<!-- TBD: Find out from the engineering team and mention the time zone of this 1:00 am task.
-->

You can modify the schedule for the purge task and the duration for which details of completed tasks are retained before they are deleted. You can also configure the maximum number of completed tasks for which details are retained at any point of time.

1. In the [!DNL Experience Manager] interface click **[!UICONTROL Tools]** &gt; **[!UICONTROL Operations]** &gt; **[!UICONTROL Web Console]**.
1. Open the **[!UICONTROL Adobe CQ DAM Async Jobs Purge Scheduled]** task.
1. Specify the threshold number of days after which completed tasks are deleted and the maximum number of tasks for which details are retained in history. Save the changes.

   ![Configuration to schedule the purging of asynchronous tasks](assets/configmgr_purge_asyncjobs.png)

## Configure threshold for asynchronous delete operations {#configure-thresholds-for-asynchronous-delete-operations}

If the number of assets or folders to be deleted exceeds the set threshold number, the delete operation is performed asynchronously.

1. In the [!DNL Experience Manager] interface click **[!UICONTROL Tools]** &gt; **[!UICONTROL Operations]** &gt; **[!UICONTROL Web Console]**.
1. From the [!UICONTROL Web Console], open the **[!UICONTROL Async Delete Operation Job Processing]** configuration.
1. In the **[!UICONTROL Threshold number of assets]** box, specify the threshold numbers to asynchronously delete assets, folders, or references. Save the changes.

   ![Set the threshold limit for the task to delete assets](assets/delete_threshold.png)

## Configure threshold for asynchronous move operations {#configure-thresholds-for-asynchronous-move-operations}

If the number of assets, folders, or references to be moved exceeds the set threshold number, the move operation is performed asynchronously.

1. In the [!DNL Experience Manager] interface, click **[!UICONTROL Tools]** &gt; **[!UICONTROL Operations]** &gt; **[!UICONTROL Web Console]**.
1. From the [!UICONTROL Web Console], open the **[!UICONTROL Async Move Operation Job Processing]** configuration.
1. In the **[!UICONTROL Threshold number of assets/references]** box, specify the threshold numbers to asynchronously move assets, folders, or references. Save the changes.

   ![Set the threshold limit for the task to move assets](assets/move_threshold.png)

>[!MORELIKETHIS]
>
>* [Configure email in Experience Manager](/help/sites-administering/notification.md).
>* [Import and export asset metadata in bulk](/help/assets/metadata-import-export.md).
>* [Use Connected Assets to share DAM assets from remote deployments](/help/assets/use-assets-across-connected-assets-instances.md).

---
title: Asynchronous operations
description: Experience Manager Assets optimizes performance by asynchronously completing some resource-intensive tasks.
contentOwner: AG
---

# Asynchronous operations {#asynchronous-operations}

To reduce adverse impact on performance, Adobe Experience Manger Assets processes certain long-running and resource-intensive asset operations asynchronously.

These operations include:

* Deleting many assets
* Moving many assets or assets with many references
* Exporting/importing asset metadata in bulk.
* Fetching assets, that are above the threshold limit set, from a remote Experience Manager deployment.

Asynchronous processing involves enqueuing multiple jobs and eventually running them in a serial manner subject to the availability of system resources.

You can view the status of asynchronous jobs from the **[!UICONTROL Async Job Status]** page.

>[!NOTE]
>
>By default, jobs in Assets run in parallel. If N is the number of CPU cores, N/2 jobs can run in parallel, by default. To use custom settings for the job queue, modify the **[!UICONTROL Async Operation Default Queue]** configuration from the web console. For more information, see [queue configurations](https://sling.apache.org/documentation/bundles/apache-sling-eventing-and-job-handling.html#queue-configurations).

## Monitor the status of asynchronous operations {#monitoring-the-status-of-asynchronous-operations}

Whenever Assets processes an operation asynchronously, you receive a notification at your inbox and through email.

To view the status of the asynchronous operations in detail, navigate to the **[!UICONTROL Async Job Status]** page.

1. In the Experience Manager interface click **[!UICONTROL Operations]** &gt; **[!UICONTROL Jobs]**.

1. In the **[!UICONTROL Async Job Status]** page, review the details of the operations.

    ![Status and details of Asynchronous operations](assets/AsyncOperation-status.png)

   To ascertain the progress of a particular operation, see the value in the **[!UICONTROL Status]** column. Depending upon the progress, one of the following statuses is displayed:

   * **[!UICONTROL Active]**: The operation is being processed

   * **[!UICONTROL Success]**: The operation is complete

   * **[!UICONTROL Fail]** or **[!UICONTROL Error]**: The operation could not be processed

   * **[!UICONTROL Scheduled]**: The operation is scheduled for processing a later time

1. To stop an active operation, select it from the list and click **[!UICONTROL Stop]** from the toolbar.

   ![stop_icon](assets/stop_icon.png)

1. To view extra details, for example description and logs, select the operation and click **[!UICONTROL Open]** from the toolbar.

   ![open_icon](assets/open_icon.png)

   The job details page is displayed.

   ![job_details](assets/job_details.png)

1. To delete the operation from the list, select **[!UICONTROL Delete]** from the toolbar. To download the details in a CSV file, click **[!UICONTROL Download]**.

   >[!NOTE]
   >
   >You cannot delete a job if its status is either active or queued.

## Purge completed jobs {#purging-completed-jobs}

Experience Manager Assets runs a purge job everyday at 1:00 AM to delete completed asynchronous jobs that are more than a day old.

You can modify the schedule for the purge job and the duration for which details of completed jobs are retained before they are deleted. You can also configure the maximum number of completed jobs for which details are retained at any point of time.

1. In the Experience Manager interface click **[!UICONTROL Tools]** &gt; **[!UICONTROL Operations]** &gt; **[!UICONTROL Web Console]**.
1. Open the **[!UICONTROL Adobe CQ DAM Async Jobs Purge Scheduled]** job.
1. Specify the threshold number of days after which completed jobs are deleted and the maximum number of jobs for which details are retained in history.

   ![Configuration to schedule the purging of asynchronous jobs](assets/configmgr_purge_asyncjobs.png)

1. Save the changes.

## Configure thresholds for asynchronous processing {#configuring-thresholds-for-asynchronous-processing}

You can configure the threshold number of assets or references for Assets to process a particular operation asynchronously.

### Configure thresholds for asynchronous delete operations {#configuring-thresholds-for-asynchronous-delete-operations}

If the number of assets or folders to be deleted exceed the threshold number, the delete operation is performed asynchronously.

1. In the Experience Manager interface click **[!UICONTROL Tools]** &gt; **[!UICONTROL Operations]** &gt; **[!UICONTROL Web Console]**.
1. From the web console, open the **[!UICONTROL Async Delete Operation Job Processing]** configuration.
1. In the **[!UICONTROL Threshold number of assets]** box, specify the threshold number of assets/folders for asynchronous processing of delete operations.

   ![delete_threshold](assets/delete_threshold.png)

1. Save the changes.

### Configure thresholds for asynchronous move operations {#configuring-thresholds-for-asynchronous-move-operations}

If the number of assets/folders or references to be moved exceed the threshold number, the move operation is performed asynchronously.

1. In the Experience Manager interface click **[!UICONTROL Tools]** &gt; **[!UICONTROL Operations]** &gt; **[!UICONTROL Web Console]**.
1. From the web console, open the **[!UICONTROL Async Move Operation Job Processing]** configuration.
1. In the **[!UICONTROL Threshold number of assets/references]** box, specify the threshold number of assets/folders or references for asynchronous processing of move operations.

   ![move_threshold](assets/move_threshold.png)

1. Save the changes.

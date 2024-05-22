---
title: View statistics related to Work Manager

description: The Work Manager tab displays statistics that relate to Work Manager items. Learn how you can view and filter the work items.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/health_monitor
products: SG_EXPERIENCEMANAGER/6.5/FORMS

exl-id: ce8f7257-bb9a-428d-b816-27b1d1632ee1
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# View statistics related to Work Manager {#view-statistics-related-to-work-manager}

The Work Manager tab displays statistics that relate to Work Manager items. These work items are in different states depending on where they are in their process. (See [Status (for Default, Workflow, or Events categories only)](view-statistics-related-manager.md#status-for-default-workflow-or-events-categories-only).) You can filter the information to view only a subset of the items by using the various options that are available (for example, Status or Category). You can sort resulting work or job items (in ascending or descending order) by clicking one of the column headers. Also, you can manage the work items by using the operation tools that are displayed above the work items list.

## Filter the work items {#filter-the-work-items}

1. Click the Work Manager tab.
1. Select the criteria for one or more of the filters described below and then click Go.

### Category {#category}

**Default:** All work items that the client did not assign a category to when they were submitted. Work Manager manages these items, therefore the statuses belong to Work Manager.

**Job Manager:** All jobs that belong to Job Manager. Job Manager manages its own jobs and has its own job statuses. See the specific job statuses described below.

**Workflow:** All work items that belong to the Workflow execution. Workflow does not manage its own work items but relies on Work Manager; therefore, the statuses belong to Work Manager.

**Events:** All work items that belong to Event Management. Event Management does not manage its own work items but relies on Work Manager; therefore, the statuses belong to Work Manager.

### Status (for Default, Workflow, or Events categories only) {#status-for-default-workflow-or-events-categories-only}

**Show All:** Displays all current work items.

**Scheduled:** Displays all work items ready for execution by the application server but not yet started.

**Paused:** Displays all scheduled work items that the client application has paused. These items can be executed or deleted. (See Manage the work items or jobs.)

**In Progress:** Displays all work items that the application server’s Work Manager picked up and will either complete or fail. You cannot use operations on these work items.

**Complete:** Displays all work items that executed successfully. Persistent work items stay in this state and non-persistent items are deleted upon completion of callbacks to the callback handlers. You can delete these items by using the Delete Items operation. (See Manage the work items or jobs.)

**Failed:** Displays all work items that did not complete successfully due to an error condition. These work items can be retried a few times by using the Retry Items operation. (See Manage the work items or jobs.) A Failure link in the Status column lets you access details about the failure.

**Unknown:** Displays all work items whose status is unknown.

### Status (for Job Manager category only) {#status-for-job-manager-category-only}

**Completed:** Displays all jobs that have executed successfully. Persistent work items stay in this state and non-persistent items are deleted upon completion of callbacks to the callback handlers.

**Complete Requested:** Displays jobs for which a complete request was made.

**Fail Requested:** Displays jobs for which a fail request was made.

**Failed:** Displays jobs that did not complete successfully due to an error condition. A Failure link in the Status column lets you access details about the failure.

**Terminate Requested:** Displays jobs for which a terminate request was made.

**Terminated:** Displays jobs that terminated without completing.

**Suspend Requested:** Displays jobs for which a suspend request was made.

**Suspended:** Displays jobs that are suspended.

**Resume Requested:** Displays jobs for which a resume request was made.

**Queued:** Displays jobs that are in the queue.

**Running:** Displays jobs that are running.

### Server Name {#server-name}

For clustered servers only, select the name of the node to display the work items or job items that were created on that server only. If Show All is selected, all work items for all nodes in a cluster are displayed.

### Create Time {#create-time}

Select an option in this filter to show only those work items that were created within the timeframe you select. For example, selecting 1 Day displays all work items that were created within 24 hours before the time that was set in the Prior To filter.

### Prior to {#prior-to}

Sets the date and time that the Create Time filter uses as an end date. Keep the Use Current Date & Time option selected to filter back from the current date and time, or deselect the option and enter the appropriate values. Click either the calendar icons or the clock icons to select values by using those tools.

For example, selecting Create Time = 1 day and Prior to = Use Current Date & Time returns all work items that were created within the last 24 hours.

>[!NOTE]
>
>On Oracle database deployments, date range filters (that is, Create Time and Prior to settings) do not work accurately. Use another filter to retrieve work items.

## About the Work Manager tab interface {#about-the-work-manager-tab-interface}

When you run a Work Manager query or perform an operation on a work item or job, a message appears above the list. This message provides feedback about the action you have initiated and in some cases, a More Info link to provide details. For example, if the operation you initiated failed, the message states as much and provides a link to get details about the error.

When you click More Info, the Operation Details dialog box displays a list of the work items or jobs that were selected during the operation. You can click each list item to view the Error Details at the bottom of the dialog box.

### Manage the work items or jobs {#manage-the-work-items-or-jobs}

1. Use the operation tools described below to manage the work items or jobs in the list.

   >[!NOTE]
   >
   >Operations are available depending on the item’s status.

   **Delete Items:** Deletes the selected work item or job.

   **Pause Items:** Pauses the selected work item or job.

   **Resume Items:** Resumes the selected work item or job from its paused state.

   **Retry Items:** Attempts to rerun the selected work item or job from its current state.

   You can verify whether an operation was successful by clicking More Info above the list. A dialog box that contains the selected work items or jobs and their statuses is displayed.

## Additional information about work item statuses {#additional-information-about-work-item-statuses}

A typical state transition for a work item is New &gt; Scheduled &gt;In Progress &gt; Complete or Failure.

The Paused state interrupts this normal flow. Either the client application or the system administrator can initiate this interruption (for example, for maintenance or upgrade). You can reverse this action by using the Resume operation to move the work item back into a Scheduled state.

A work item in a Scheduled state is queued for execution that has not yet begun. These items can be paused or deleted, or will move to the In Progress state when Work Manager takes them from the queue. Work items that are in progress cannot be modified. They will either complete or fail.

The Failed state occurs as a result of an error condition that occurs during execution of the work item. If you suspect errors to be circumstantial (due to the context at the time of execution), you can retry the execution, putting the work item back into the queue. Only a limited number of retries are permitted.

---
title: Managing Processes
description: The Process List page shows the processes that a user has initiated or that were started automatically. Learn more about managing the processes.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_forms_workflow
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 21a2317d-3542-4ccb-98db-3cedf20c89ea
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Managing Processes {#managing-processes}

The Process List page shows the processes that a user has initiated or that were started automatically.

1. In administration console, click Services &gt; Forms workflow &gt; Forms workflow. The Process List shows the following information:

   **Process Name - Version:** The name of the process, as defined in Workbench.

   **Application:** The application that the process belongs to, as defined in Workbench.

   **Status:** Active means that the process is the one activated for the process version. Inactive means that the process is an old version that still has process instances.

   **Creation Date:** The date and time the process was deployed.

1. Click a process name to view its process instances on the Process Instance page.

## Working with process instances {#working-with-process-instances}

If you access the Process Instance page from the Process List page, all the process instances of the process you selected are listed. If you access the Process Instance page after performing a search, only the found process instances are listed.

For each process instance, the list shows the following information:

**Process ID:** The identifier that forms workflow assigns when the process is instantiated (that is, when a user or an automated step initiates a process). You can use this identifier to track the process instance through its life cycle.

**Process Name - Version:** The name of the process, as defined in Workbench.

**Status:** Indicates whether the process instance is running normally, changing state, or has stopped. (See About process instance statuses.)

**Creation Date:** The date and time the process instance was created.

**Update Date:** The date and time the status of the process instance was last changed.

You can do the following tasks on the Process Instance page:

* Select a process instance to view details about it, such as its operations and subprocesses. When you select a process instance, the Process Instance Details page appears.
* Suspend, unsuspend, or terminate process instances.
* Search for a process instance. To begin a search, click Search.

### About process instance statuses {#about-process-instance-statuses}

A process instance, including subprocesses, can have the following statuses:

**COMPLETE:** All the branches and operations in the process instance have completed. COMPLETE is the final status of a process instance.

**COMPLETING:** The status of the process instance is about to change to COMPLETE.

**INITIATED:** The process instance has been created but is not yet running. INITIATED is the first status of a process instance.

**RUNNING:** The process instance is running normally. An automated step may be underway, or the process instance may be receiving user input or waiting for user interaction.

**SUSPENDED:** The process instance has been suspended by an administrator or by a step in the process. No further operations will occur until the status is changed.

**SUSPENDING:** The status is about to change to SUSPENDED. If an operation has been designed to ignore suspend requests and has not yet completed, that operation must complete before the process instance is suspended.

**TERMINATED:** The process instance has been terminated by an administrator.

**TERMINATING:** The status is about to change to TERMINATED. If an operation has been designed to ignore terminate requests and has not yet completed, that operation must complete before the process instance is terminated.

**UNSUSPENDING:** The status is about to change to RUNNING after having been SUSPENDED.

>[!NOTE]
>
>When a request is made to change the status of a process instance (such as to suspend or terminate), the request enters the command queue for forms workflow. Depending on the size of the queue and overall processing speed, the displayed status may not change until the page is reloaded one or more times.

### Suspend or unsuspend process instances {#suspend-or-unsuspend-process-instances}

If you need to troubleshoot a problem or if you know that a process instance will encounter a problem at a later step due to some external condition, you can suspend the process instance temporarily.

You can suspend process instances that have a status of RUNNING.

After you suspend a process instance, its status changes to SUSPENDING, then SUSPENDED, and the process pauses at its current operation. The process instance remains in this status until the status is changed to UNSUSPENDED.

Only process instances that have a status of SUSPENDED can be changed to UNSUSPENDED.

When you unsuspend a process instance, its status changes to RUNNING, and it continues with the operation where it had been suspended.

When you suspend a process instance that has invoked other processes (child processes) using their invoke operation, the child processes are also suspended.

1. In administration console, click Services &gt; Forms workflow &gt; Forms workflow.
1. On the Process Instance page, select the process and click Suspend or Unsuspend.

### Terminate a process instances {#terminate-a-process-instances}

If an operation of a process instance has stalled or encountered some other error condition, or if you need to force a process instance to stop running, you can terminate the process instance.

You can terminate process instances that have any status.

When you terminate a process instance, its status changes to TERMINATING, then TERMINATED, and the process stops at its current operation. No further operations are run, and all associated operations and tasks are terminated.

1. In administration console, click Services &gt; Forms workflow &gt; Forms workflow.
1. On the Process Instance page, select the process and click Terminate.

## Working with process instance details {#working-with-process-instance-details}

The Process Instance Detail page shows the history of a process instance.

The Summary area shows basic information about the process instance.

On the Operations tab, each operation for the process instance is shown in order of completion from first to last with the following information:

**Operation Name:** The name of the operation, as defined in Workbench.

**Status:** Indicates whether the operation is running normally or has stopped. (See About process instance statuses.)

**Branch Name:** The name of the branch, as defined in Workbench.

**Start Date:** The date and time the operation started.

**Completed Date:** The date and time the operation completed.

A subprocess is a process instance that is started by another process and runs independently of that other process. Subprocesses are displayed only if they were designed as part of the process in Workbench. On the Subprocesses tab, each subprocess is shown with the following information:

**Process ID:** This positive integer that forms workflow assigns when the process is instantiated (that is, when a user or an automated step initiates the process). You can use this identifier to track the process instance through its lifecycle.

**Process Name - Version:** The name of the process, as defined in Designer.

**Status:** Indicates whether the process instance is running normally, changing state, or stopped. (See About process instance statuses.)

**Creation Date:** The date and time the subprocess was created.

**Update Date:** The date and time the status of the subprocess was last changed.

You can do the following tasks on the Process Instance Detail page:

* Select an operation to view details about it. When you select an operation, the Operation Detail page appears.
* Select a subprocess to view details about it. When you select a subprocess, the Process Instance Detail page appears.
* Terminate or retry operations or subprocesses, depending on their status.

### About operation statuses {#about-operation-statuses}

An operation (a step in a process) can have the following statuses:

**COMPLETE:** The operation completed.

**RUNNING:** The operation is running normally. It may be receiving user input or waiting for user interaction, or an automated step may be underway.

**STALLED:** A problem occurred while the operation was being processed. Check for the error or exception in the Stalled Operations page.

**TERMINATED:** The operation was terminated by an administrator.

### Terminate operations or subprocesses {#terminate-operations-or-subprocesses}

If an operation or subprocess has stalled or encountered some other error condition, or if you need to force an operation or subprocess to stop running, you can terminate it.

You can terminate an operation that is RUNNING.

When you terminate an operation, its status changes to TERMINATED. The operation does not complete and the process instance stops running.

You can terminate a subprocess that has any status.

When you terminate a subprocess, its status changes to TERMINATING, then TERMINATED, and the process instance stops at its current operations. No further operations are run in the subprocess, although the parent process instance continues to run.

You cannot terminate processes that have gateway elements in the process diagram. If you attempt to terminate these types of processes, the operations within the gateway elements are not affected. To terminate operations that are within a gateway element, you must terminate the operations directly.

1. On the Process Instance Details page, click the Operations tab or the Subprocesses tab.
1. Select the operation or subprocess and click Terminate.

### Retry an operation {#retry-an-operation}

You can retry operation that has a status of STALLED.

When you retry an operation, Forms workflow is sent a request to restart the operation. If the request is successful, the status changes to RUNNING. If the operation cannot be restarted, it remains STALLED, and you may need to terminate it.

1. On the Process Instance Details page, click the Operations tab.
1. Select the operation and click Retry.

## Working with operations {#working-with-operations}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

The Operation Details page shows a summary of one operation in a process and its current user assignments.

1. In administration console, click Services &gt; Forms workflow &gt; Forms workflow.
1. Click a process name to display its process instances. Click a process instance to display the Process Instance Details page, then select an operation to display the Operation Detail page.

   For each task, the list shows the following information:

   **Process Name - Version:** The name of the process, as defined in Workbench.

   **Application:** The application that the process belongs to, as defined in Workbench.

   **Status:** Active means that the process is the one activated for the process version. Inactive means that the process is an old version that still has process instances.

   **Creation Date:** The date and time the process was deployed.

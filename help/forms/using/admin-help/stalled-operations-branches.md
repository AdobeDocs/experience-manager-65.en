---
title: Working with stalled operations and branches
description: The Stalled Operations page and the Stalled Branches page show the processes that have stalled.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_forms_workflow
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: c96faae0-2b0f-4334-b61c-f13b2d1ec179
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Working with stalled operations and branches {#working-with-stalled-operations-and-branches}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

The Stalled Operations page and the Stalled Branches page show the processes that have stalled. A process can stall when an error occurs during or after the execution of an operation or because of a deliberate stall operation in the process:

* Operations can stall due to an unforeseen error. However, a Stall Branch operation in a process deliberately stops a process from running further and requires the administrator to intervene.
* Branches can stall between operations during a rule evaluation.

When a process stalls, no further operations are run until the problem is fixed and the operation or branch restarted.

For each stalled item, the list shows the following information:

**Operation Name or Branch Name:** The name of the operation or branch.

**Status:** Always STALLED for stalled items.

**Error:** A short description of the problem.

**Process ID:** The positive integer that forms workflow assigns when the process is instantiated (that is, when a user or an automated step initiates a process). You can use this identifier to track the process instance through its life cycle.

**Process Name - Version:** The name of the process assigned in Workbench.

**Stalled Date:** The date and time the operation or branch stalled.

You can do the following tasks on the Stalled Operations or Stalled Branches page:

* Select an error to view details about it. When you select an error, the Error Details page appears.
* Terminate or retry stalled operations or retry stalled branches.

## Terminating or retrying stalled operations or branches {#terminating-or-retrying-stalled-operations-or-branches}

On the Stalled Operations page, you can terminate the displayed process instances.

When you terminate a process instance, it stops running and no further operations take place. You typically terminate a process only if it becomes blocked or unusable due to an error and cannot be fixed and restarted.

On the Stalled Operations page or the Stalled Branches page, you can retry the operation or branch.

When you retry an operation, Forms workflow is sent a request to restart the operation. If the error that caused the process to stall has been fixed and the retry request is successful, the process begins running again from the point it had stalled, and its status changes to RUNNING. If the operation cannot be restarted, it remains STALLED and you may need to terminate it.

### Terminate a stalled operation {#terminate-a-stalled-operation}

1. In administration console, click Services &gt; forms workflow &gt; Stalled Operations Errors.
1. On the Stalled Operations page, select the item you want to terminate and click Terminate.

### Retry a stalled operation or branch {#retry-a-stalled-operation-or-branch}

1. In administration console, click Services &gt; forms workflow and then click Stalled Operations Errors or Stalled Branch Errors.
1. On the Stalled Operations or Stalled Branches page, select the item you want to retry and click Retry.

## Viewing error details about stalled operations or branches {#viewing-error-details-about-stalled-operations-or-branches}

If you select an error from the list of stalled items on the Stalled Operations or Stalled Branches page, the Error Details page appears, which shows details about the error that can help you troubleshoot the problem.

The box at the bottom of the page contains the error information.

You can also terminate or retry stalled operations, and retry stalled branches, from the Error Details page.

## Process does not stall when escalation user does not exist {#process-does-not-stall-when-escalation-user-does-not-exist}

Errors occur when the Assign Task operation in the AEM forms User service is configured to escalate the task to another user after a specific period of time, and the escalation user is deleted after the Assign Task operation executes but before the escalation occurs.

When this situation occurs, the state of the process and task does not change at the configured escalation time, and the escalation does not occur but the process does not stall. The following message appears in the server log:

"The principal specified for escalation is not valid, for taskID: *number*, queue specified: *number*."

If the escalation user is deleted before the task is generated (before the Assign Task operation executes), the process stalls or the InvalidPrincipal exception event is thrown.

To prevent this problem, when you delete a user, search for tasks belonging to that user and deal with them accordingly. (See [Working with tasks](/help/forms/using/admin-help/tasks.md#working-with-tasks).)

---
title: Working with tasks
description: Use the Task Search page to search for tasks by user name or task ID. Learn more about working with tasks.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_forms_workflow
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 375376d1-60b3-49a4-8893-ba9336e6bf7b
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Working with tasks {#working-with-tasks}

Use the Task Search page to search for tasks by user name or task ID. The search results are displayed on the Task List page, where you can access a task's history. You can also reassign a task is one user has too many tasks or if a user has received a task assignment in error.

>[!NOTE]
>
>Performing task searches returns no results for user names that begin with a number sign (#). If possible, avoid creating user names that begin with a number sign.

## Search for tasks associated with a user {#search-for-tasks-associated-with-a-user}

1. In administration console, click Services &gt; forms workflow &gt; Task Search.
1. In Search By, select User Name. If you know part of the user name that you are searching for, type it in the box. Click Find User.
1. The Find User page appears. You can refine your search further, by searching by user name or email. When you locate the user that you are looking for, select the radio button beside the name and click OK.
1. By default, the task search looks for tasks that are currently assigned to the user. To also search for tasks that were previously assigned to the user, select Show Unassigned Task. To also search for tasks that the user has completed, select Show Completed Task.
1. Click Search. The Task List page appears, listing the search result.

## Search for a task when you know its task ID {#search-for-a-task-when-you-know-its-task-id}

1. In administration console, click Services &gt; forms workflow &gt; Task Search.
1. In Search By, select Task ID and type the task ID in the box.
1. Click Search. The Task List page appears, listing the search result.

## Working with the task list {#working-with-the-task-list}

The results of a task search are displayed on the Task List page. You can select a task to open the Task History page. From there, you can assign the task to another user.

The tasks are displayed with the following information:

**Task ID:** The positive integer that forms workflow assigns when the task is instantiated (initiated by a user). You can use this identifier to track the task through its life cycle. Click a Task ID to view details about the task history or to reassign the task to another user.

**Status:** Assigned means that the task is currently assigned to the user. Unassigned means that the task was previously assigned to the user. The status can also be Completed.

**Activity:** Shows the form and name for an initial operation or the process operation that generated the task.

**Process ID:** This positive integer that is assigned by forms workflow when the process is instantiated (that is, when a user or an automated step initiates a process). You can use this identifier to track the process instance through its life cycle.

**Process Name - Version:** The name of the process, as defined in Workbench.

**Application:** The name of the application that the process belongs to, as defined in Workbench.

**Creation Date:** The date and time the task was created.

## Viewing task history and reassigning tasks {#viewing-task-history-and-reassigning-tasks}

The Task History page shows a list of the users and groups that have been assigned to a particular task.

For each task assignment, the list shows the following information:

**Name:** The name of the user.

**Status:** Assigned means the task is currently assigned to the user. Unassigned means the task was previously assigned to the user.

**Worklist ID:** The numeric identifier of the user queue to which the task belongs. A process can be shared among multiple users.

**Type:** Indicates how the task was assigned:

**Initial:** The user was originally assigned the task.

**Forward:** The original task owner assigned the task to another user.

**Reject:** A forwarded task was rejected or a task was returned to a worklist without having been completed.

**Claim:** The user claimed the task in a shared worklist.

**Escalation:** A predetermined time elapsed (as set in the User action in Workbench) without user interaction and another user was assigned the task.

**Consult:** The task owner has forwarded this task to another user for consultation who can open the form, save data, modify the attachments and notes, but cannot complete the step. The user must return the task to the task owner who consulted with the user.

**Admin Reassignment:** The task was reassigned by an administrator.

**Assignment Date:** The date and time the task was assigned to the user.

### Assigning a new user to a task {#assigning-a-new-user-to-a-task}

The Assign User page lists the users who can be assigned to a task. You access the Assign User page by clicking Assign New User on the Task History page.

1. In the Search For box on the Assign User page, type part of or all the required user name or email address.
1. Under Using, select Name or Email Address and then click Find. The users who match the search are displayed.
1. Select the user from the list and click OK. The Task History page appears with the new user assignment.

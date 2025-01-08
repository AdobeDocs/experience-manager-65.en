---
title: Configuring Out of Office Settings
description: The Out of Office feature enables you to specify when a user will be out of the office and unable to complete tasks assigned by AEM forms.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_forms_workflow
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 1c8ad09b-d44a-4d90-86d5-d4c66cf5c57c
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Configuring Out of Office Settings {#configuring-out-of-office-settings}

The Out of Office feature enables users or administrators to specify when a user will be out of the office and unable to complete tasks assigned by AEM forms. While a user is set to Out of Office, their tasks are assigned to one or more designated users. Users can change their Out of Office settings in Workspace or administrators can change the settings on a user's behalf in forms workflow.

When creating a process, the Workbench user can specify whether a task can be redirected due to Out of Office settings.

## View a user's Out of Office information {#view-a-user-s-out-of-office-information}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

1. In administration console, click Services &gt; forms workflow &gt; Out of Office.
1. In the box near the top of the Out of Office page, you can do one of the following:

   **Search By Name**

   Select the Search By Name option. Type all or part of the user name and click Find. If you leave the field blank, Forms workflow returns a list of all the users.

   **Search By Date Range**

   Select the Search By Date Range option. Specify the from and to dates along with desired time stamps to narrow the search result. Click Find.

1. Click a user name to display the user's Out of Office information below the list of users.

## Change a user's out of office status {#change-a-user-s-out-of-office-status}

1. Find the user, as described in [View a user's Out of Office information](configuring-out-office-settings.md#view-a-user-s-out-of-office-information).
1. Click the name of the user who you want to change.
1. From the *User Name* is currently list, select either In the Office or Out of the Office.
1. Click Save.

## Add an Out of Office date range for a user {#add-an-out-of-office-date-range-for-a-user}

1. Find the user, as described in [View a user's Out of Office information](configuring-out-office-settings.md#view-a-user-s-out-of-office-information).
1. Click the name of the user who you want to change.
1. Click Add Date Range.
1. Enter a Start Time and End Time. You can click the Calendar icon to select a date. If you do not specify an end time, the user will be set as out of office indefinitely.
1. Click Save.

## Assign a user for Out of Office tasks {#assign-a-user-for-out-of-office-tasks}

While a user is out of the office, you can assign one or more users to perform any new tasks for the user. You can set up the following configurations:

* Assign all the new tasks to a designated default user.
* Do not reassign any tasks. New tasks remain assigned to the user who is out of the office.
* Assign a default user who will receive most of the user's tasks, but specify that tasks from certain processes are reassigned to other users or remain assigned to the user who is out of the office.
* Do not assign a default user, but assign certain tasks from certain processes to specific users.

    1. Find the user, as described in [View a user's Out of Office information](configuring-out-office-settings.md#view-a-user-s-out-of-office-information).
    1. Click the name of the user who you want to change.
    1. In the Default User For Out of Office Tasks list, select a user from the list. If you do not want to designate a default user to receive reassigned items, select Do Not Assign.

       If the appropriate user name does not appear in the list, click Find User and use the Find User dialog box to search for the user. Select the appropriate user from the list and click Select User. You can also click View User's Schedule in the Find User dialog box to see the selected user's out of office schedule.

    1. If there are any processes that should not be sent to the default user, click Add An Exception, then select the process and select another user from the list. You can also select Do Not Assign to have the task remain assigned to the user who is out of the office.
    1. Click Save.

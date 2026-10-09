---
title: Configuring Shared Queues
description: Shared Queues let you configure and manage user queues effectively. Learn how to configure shared queues.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_forms_workflow
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 5f4467c1-0f3f-4dc6-9bd5-98259f327295
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Configuring Shared Queues{#configuring-shared-queues}

Shared Queues let you configure and manage user queues effectively. A user queue is simply all tasks assigned to a user, see [To Do Lists](https://help.adobe.com/en_US/livecycle/11.0/WorkspaceHelp/WS92d06802c76abadb-2b6ab502126beb6ba2f-7ffc.2.html) for more information. You can assign, unassign, and reassign user queues depending on your organizational needs. You can manage Shared Queues in two ways:

**Manage Access To A User**

You can manage access to a selected user queue using this option.

**Manage Access By A User**

You can manage shared queues assigned to a selected user using this option.

## Managing access to a selected user queue {#managing-access-to-a-selected-user-queue}

Manage Access To A User functionality lets you manage access to a selected user queue. You can grant or revoke access to a selected user queue to other users in your organization. For example, Kara Bowman is out of office. Using the Manage Access To A User functionality, Kara's queue can be shared with Akira Tanaka and John Jacobs for completion. At a later point, when Kara returns to the office, you can revoke access to her queue from Akira Tanaka and John Jacobs.

Once shared, these tasks can be completed by the user, with access to the queue, using Workspace.

>[!NOTE]
>
>The Flex Workspace is deprecated for AEM forms release.

### Configuring access to a selected user queue {#configuring-access-to-a-selected-user-queue}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

1. Log in to administration console using an Administrator account.
1. Select **Services** > **Forms Workflow** > **Shared Queue**.

1. On the Manage Access To A User tab, find, and select the user whose queue you wish to share. At any point, the bottom-right pane displays the list of users with access to the selected user queue.
1. In the bottom-left pane, find and select the user. Click Share.
1. Click Save to complete.

### Revoking access to a selected user queue {#revoking-access-to-a-selected-user-queue}

1. Log in to administration console using an Administrator account.
1. Select **Services** &gt; **Forms Workflow** &gt; **Shared Queue**.

1. On the Manage Access To A User tab, find, and select the user whose queue you wish to manage.
1. The bottom-right pane displays the list of users with access to the selected user queue. Select the user and click Revoke.
1. Click Save to complete.

## Managing queues assigned to a user {#managing-queues-assigned-to-a-user}

Manage Access By A User functionality lets you manage queues assigned to a selected user. You can grant or revoke access to user queues to a selected user individually. For example, you wish to assign Akira Tanaka and John Jacobs user queues to Kara Bowman. Using the Manage Access By A User functionality, you can search for Kara Bowman and grant access to tasks assigned to Akira Tanaka and John Jacobs. At a later point, you can revoke Kara Bowman's access to these user queues.

Once assigned, these tasks can be completed by the user using Workspace.

>[!NOTE]
>
>The Flex Workspace is deprecated for AEM forms release.

### Granting access to a selected user queue {#granting-access-to-a-selected-user-queue}

1. Log in to administration console using an Administrator account.
1. Select **Services** &gt; **Forms Workflow** &gt; **Shared Queue**.

1. On the Manage Access to a User tab, find, and select the user whose queue you wish to share. At any point, the bottom-right pane displays the list of users with access to the selected user queue.
1. In the bottom-left pane, find and select user queues you wish to share with the selected user. Click Share.
1. Click Save to complete.

### Revoking access to a selected user queue {#revoking_access_to_a_selected_user_queue-1}

1. Log in to administration console using an Administrator account.
1. Select **Services** &gt; **Forms Workflow** &gt; **Shared Queue**.

1. On the Manage Access By A User tab, find, and select the user whose queue you wish to manage.
1. The bottom-right pane displays the list of user queues assigned to the selected user. Select the user queue and click Revoke.
1. Click Save to complete.

---
title: Configure shared queues

description: Learn how to use shared queues for Forms-centric workflows on AEM Forms on OSGi.

topic-tags: process
products: SG_EXPERIENCEMANAGER/6.5/FORMS
docset: aem65
exl-id: 72cd0594-8b5e-4d14-bc6f-bca26bae50f2
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms, OSGI
role: Admin, User, Developer
---
# Share and request access to Inbox items of a user {#share-and-request-access}

A queue is a list of items in AEM Inbox of a user. These can be items assigned to a user or items shared to the group a user is a member of. You can access your Inbox to view and take action on the Inbox item. For example, share an item with another user.

You can also share your Inbox items with another user. Once another user has access to your Inbox items, the user can claim and take appropriate action on shared items. Similarly, you can request access to Inbox items from other users.

## Pre-requisites {#pre-requisites}

The logged-in user must be a member of the `workflow-users` group. The user can share items or request access to items only from the users the logged-in user have read permissions on or only from the users who have enabled pubic profile.

## Share a single or all the items of your inbox with another user

AEM Inbox lets you share a single or all the items in your inbox with another user.

### Share all the inbox items

Perform the following steps to share all the items in an inbox with another user:

1. Log in to your AEM instance. Select the ![Inbox](assets/bell.svg) icon and select **[!UICONTROL View All]**. A list of your inbox items appear.
1. Select the ![View Selector](assets/viewlist.svg) or ![View Selector](assets/calendar.svg) icon next to the **[!UICONTROL Create]** button and select **[!UICONTROL Settings]**. The settings dialog appears.
1. Open the **[!UICONTROL Share]** tab on the settings dialog.
1. Enter the name of a user in the **[!UICONTROL Grant access of your Inbox items]** text box and select **[!UICONTROL Grant]**. Repeat the step to add more users. All the users with access to your items appear under the **Username** section.
1. Select **[!UICONTROL Save]**.

>[!NOTE]
>
>(For Forms-centric workflow items only) Enable the **[Allow assignee to share via Inbox sharing](aem-forms-workflow-step-reference.md)** option of the **Assign task** step in the workflow. Only items which have the aforementioned option enabled are displayed to other users.

### Share individual items

Perform the following steps to share an Inbox item with another user:

1. Log in to your AEM instance. Select the ![Inbox](assets/bell.svg) icon and select **[!UICONTROL View All]**. A list of your inbox items appear.
1. Select an item and select **[!UICONTROL Share]**. A dialog box appears.
1. Enter the name of a user in the Add users to share this item text box and select **[!UICONTROL Add]**. Repeat the step to add more users. All the users with access to your items appear under the **[!UICONTROL Username]** section.
1. Select **[!UICONTROL Save]**.


>[!NOTE]
>
>(For Forms-centric workflow items only) Enable the **[Allow assignee to share explicitly in Inbox](aem-forms-workflow-step-reference.md)** option of the **Assign task** step in the workflow. Only items which have the aforementioned option enabled are displayed to other users.

## Request access to Inbox items {#request-access}

You can request access to the Inbox items of another user. Once the access is granted, you can view, claim, and take appropriate actions on shared items. Perform the following steps to request access to Inbox items of another user:

1. Log in to your AEM instance. Select the ![View Selector](assets/bell.svg) icon and select **[!UICONTROL View All]**.
1. Select the ![View Selector](assets/viewlist.svg) or ![View Selector](assets/calendar.svg) icon next to the **[!UICONTROL Create]** button and select **[!UICONTROL Settings]**. The settings dialog appears.
1. Enter the name of a user in the **[!UICONTROL Request access to Inbox items of the user]** text box and select **[!UICONTROL Request]**. A request is sent to the user and the status of the request is displayed against the name of the user. Repeat the step to add more users.
1. Select **[!UICONTROL Save]**. The request is sent as an Inbox item to the users. The user can select the item and select Approve or Reject to grant or reject the access.  


## Claim items shared by other users {#claim-items}

You can start working on a shared item only after you claim it. It prevents multiple users from working on a single item. Perform the following steps to claim an item:

1. Log in to your AEM instance. Select the Inbox ![Inbox](assets/bell.svg) icon and select **[!UICONTROL View All]**.
1. Select the ![Content only](assets/railleft.svg) icon to open the filter selector.
1. Select the **[!UICONTROL Select Assignee]** drop-down to view and select users who have shared their Inbox items with you.
1. Select an item and select **[!UICONTROL Claim]**. The item is added to your Inbox.

## Release claimed items {#release-items}

You can work on a shared item only after you claim it. Other users cannot see or work on a items that you have claimed. If you cannot continue working on an item, you can release it back to the pool.   After you release the item, others can claim and work on the item:

Perform the following steps to release an item:

1. Log in to your AEM instance. Select the Inbox ![Inbox](assets/bell.svg) icon and select **[!UICONTROL View All]**. A list of your inbox items appear.
1. Select the item to release and select **[!UICONTROL UnClaim]**. The item is added back to the pool. Others can now Claim the item.

## Limitations {#limitations}

* Sharing items with a group is not supported.
* Sharing project tasks is not supported.

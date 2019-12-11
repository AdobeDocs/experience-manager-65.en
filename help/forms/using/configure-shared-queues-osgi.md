---
title: Configure shared queues
seo-title: Configure shared queues
description: Learn how to use shared queues for Forms-centric workflows on AEM Forms on OSGi.
seo-description: Learn how to use shared queues for Forms-centric workflows on AEM Forms on OSGi.
uuid: 
topic-tags: process
products: SG_EXPERIENCEMANAGER/6.5/FORMS
discoiquuid: 
docset: aem65
---

# Share and request access to Inbox items of a user {#share-and-request-access}

A queue is a list of items in AEM Inbox of a user. These can be items assigned to a user or items shared to the group a user is a member of. You can access your Inbox to view and take action on the Inbox item. For example, share an item with another user. 

You can also share your Inbox items with another user. Once another user has access to your Inbox items, the user can claim and take appropriate action on shared items. Similarly, you can request access to Inbox items from other users.

## Share a single or all the items of your inbox with another user

AEM Inbox allows you to share a single or all the items in your inbox with another user.

### Share all the inbox items

Perform the following steps to share all the items in an inbox with another user:

1. Log in to your AEM instance. Tap the Inbox icon and tap View All. A list of your inbox items appear.
1. Tap the View Selector icon and tap Settings. The settings dialog appears.
1. Open the Share tab on the settings dialog.
1. Enter the name of a user in the **Grant access of your Inbox items** text box and tap **Grant**. Repeat the step to add more users. All the users with access to your items appear under the **Username** section.
1. Tap Save.

>[!NOTE]
>
> (For Forms-centric workflow items only) Enable the **Allow assignee to share via Inbox sharing** option of the **Assign task** step in the workflow. Only items which have the aforementioned option enabled are displayed to other users.

### Share individual items

Perform the following steps to share an Inbox item with another user:

1. Log in to your AEM instance. Tap the Inbox icon and tap View All. A list of your inbox items appear.
1. Select an item and tap Share. A dialog box appears.
1. Enter the name of a user in the Add users to share this item text box and tap Add. Repeat the step to add more users. All the users with access to your items appear under the **Username** section.
1. Tap Save.


>[!NOTE]
>
> (For Forms-centric workflow items only) Enable the **Allow assignee to share explicitly in Inbox** option of the **Assign task** step in the workflow. Only items which have the aforementioned option enabled are displayed to other users.

## Request access to Inbox items {#request-access}

You can request access to the Inbox items of another user. Once the access is granted, you can view, claim, and take appropriate actions on shared items. Perform the following steps to request access to Inbox items of another user:

1. Log in to your AEM instance. Tap the Inbox icon and tap View All.
1. Tap the View Selector icon and tap Settings. The settings dialog appears.
1. Enter the name of a user in the Request access to Inbox items of the user text box and tap Request. A request is sent to the user and the status of the request is displayed against the name of the user. Repeat the step to add more users.
1. Tap Save.

## Claim items shared by other users {#claim-items}

You can start working on a shared item only after you claim it. It prevents multiple users from working on a single item. Perform the following steps to claim an item:

1. Log in to your AEM instance. Tap the Inbox icon and tap View All.
1. Tap the `![]()` icon to open the filter selector.
1. Tap the **Select Assignee** drop-down to view and select users who have shared their Inbox items with you.
1. Select an item and tap Claim. The item is added to your Inbox.

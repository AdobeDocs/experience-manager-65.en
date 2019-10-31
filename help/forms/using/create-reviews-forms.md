---
title: Creating and managing reviews for assets in forms
seo-title: Creating and managing reviews for assets in forms
description: A Review is a mechanism that allows one or more reviewers to comment on an asset that is available in a form. 
seo-description: A Review is a mechanism that allows one or more reviewers to comment on an asset that is available in a form. 
uuid: 45c7ff56-3fa8-4a0f-8597-05404e547282
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-manager
discoiquuid: d8c1c507-a6c4-44f5-be01-ee902bc28410
docset: aem65

---

# Creating and managing reviews for assets in forms{#creating-and-managing-reviews-for-assets-in-forms}

## Review {#review}

A Review is a mechanism that allows one or more reviewers to comment on an asset that is available in a form.

## Setting up a review {#setting-up-a-review}

1. Navigate to the Forms tab and select a form.
1. If the asset does not have a review in progress, a Start Review ![aem6forms_review_chat_comment](assets/aem6forms_review_chat_comment.png) icon appears in the Action bar. Click the Start Review ![aem6forms_review_chat_comment](assets/aem6forms_review_chat_comment.png) icon.
1. Enter the following information:

    * Review name: Mandatory, can contain alphanumeric characters, hyphen, or underscore.
    * Review description: Optional, description of the purpose / content for review.
    * Review deadline: Optional, the date on which the review ends. When past the deadline the task appears as 'Overdue'.
    * Reviewers: A minimum of one is mandatory. Use the combo-box to add reviewers. Typing a name lists all matching names; select a name and click Add.

1. Fill in all the remaining details, and then click Start.

### Actions that occur when a review is set up {#actions-that-occur-when-a-review-is-set-up}

This section describes what happens when a review is created or set up.

1. A new review task is created and assigned to the initiator of the review. 
1. All reviewers are assigned a review task. The task appears in their Notifications section. A reviewer can click a notification, or go to the Inbox to view the task. A reviewer can click to open the review task, to view the form, and start adding comments.

   ![Reviewer Notification Alert](assets/noti.png)

   Reviewer Notification Alert

1. The comment box is available to the initiator and reviewers of the asset. Others can view the comments, but cannot write comments.

## Managing a review {#managing-a-review}

>[!NOTE]
>
>Only reviews that are in progress can be modified. Reviews that are complete cannot be modified.

1. Navigate to the Forms tab and select a form.  

1. If an asset has a review in progress and you are the initiator of the review, a Manage Review ![aem6forms_review_chat_comment](assets/aem6forms_review_chat_comment.png) icons appears in the Action bar. Only review initiator can manage (update/end) the review.

   Click the Manage Review ![aem6forms_review_chat_comment](assets/aem6forms_review_chat_comment.png)icon.

   For user other than initiator the Manage Review icon is disabled. 

1. You get a screen that displays information:

    * **Review name**: Cannot be edited.  
    
    * **Review description**: Available for editing.  
    
    * **Review deadline**: Available for editing. One can modify the deadline to any date and time beyond the current date and time.  
    
    * **Reviewers**: Available for editing. You can add or remove reviewers. If a task is overdue, you can add reviewers only after extending the deadline beyond the current date.

1. Edit the necessary fields, and then click Update.

   ![Review updated state in Task Manager](assets/tskmgr.png)

   Review updated state in Task Manager

1. To end the review, click End.

### Actions that occur when a review is modified {#actions-that-occur-when-a-review-is-modified}

This section describes, what happens on Review end / modification:

1. If the Review description is modified, the corresponding task of reviewers and the initiator is updated.
1. If the Review deadline is modified, the corresponding task for the reviewers is updated with the new date.   

1. If a reviewer is removed:

   ![Removing a reviewer](assets/removeduser.png)

   Removing a reviewer

    1. If incomplete, the assigned task is terminated.
    1. The reviewer can no longer comment on the asset.

1. If a reviewer is added:

   ![Adding a reviewer](assets/addedreviewer.png)

   Adding a reviewer

    1. A review task is created and assigned to the newly added reviewer.
    1. The newly added reviewer can add comments for the asset.

1. When a review ends:

    1. **Reviewers**: For each reviewer, the incomplete task related to the review is terminated. The task no longer appears as 'Pending' in the reviewer's Notifications section.
    1. **Initiator**: The task assigned to the Review initiator is marked complete. The task is removed from the Notification section of the review initiator.
    1. **All**: The review appears in the Previous Reviews section. No further comments can be added.


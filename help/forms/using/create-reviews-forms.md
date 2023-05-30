---
title: Creating and managing reviews in forms
seo-title: Creating and managing reviews in forms
description: A Review is a mechanism that allows one or more reviewers to comment on a form.
seo-description: A Review is a mechanism that allows one or more reviewers to comment on a form.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-manager
docset: aem65
feature: Adaptive Forms
exl-id: 9ca4fcd6-3eb0-4fc1-a09c-e4ad532bbed0
---
# Creating and managing reviews to forms{#creating-and-managing-reviews-to-forms}

## Review {#review}

A review is a mechanism that allows one or more reviewers to comment on forms.

## Setting up a review {#setting-up-a-review}

1.  Navigate to the forms browser and select a form to review.
1.  If the Form does not have a review in progress, a **Start Review** ![aem6forms_review_chat_comment](assets/aem6forms_review_chat_comment.png) icon appears in the Action bar. Click the **Start Review** ![aem6forms_review_chat_comment](assets/aem6forms_review_chat_comment.png) icon.
1.  Enter the following information:

    * **Title**: Mandatory, can contain alphanumeric characters, hyphen, and underscore.
    * **Description**: Optional, description of the purpose / content for review.
    * **Deadline**: Optional, the date on which the review ends. When past the deadline the task appears as 'Overdue'.
    * **Reviewer Name**: A minimum of one is mandatory. use the combo-box to add reviewers, typing a name list of all matching names; select a name and click **Add**. On the next section of the **Reviewers** tab shows the name of all the reviewers.

1.  Click the **Start** to start a review.

    >[!NOTE]
    >
    >* Admin can access any groups associated with the form users.
    >* Service Users group is not available to selection for review.

### Actions that occur when a review is set up {#actions-that-occur-when-a-review-is-set-up}

This section describes what happens when a review is created or set up.

1. A new review task is created and assigned to the selected reviewer. 
1. All reviewers are assigned a review task. The task appears in their Notifications section. A reviewer can click a notification, or go to the Inbox to view the task. A reviewer can click to open the review task, to view the form, and start adding comments.

   ![Reviewer Notification Alert](assets/review-notification-img.png)

   Reviewer Notification Alert

1. The comment box is available to the reviewers of the form. Others can read the comments but not add their own.

## Managing a review {#managing-a-review}

>[!NOTE]
>
>* Only reviews that are in progress can be modified. 
>* Reviews that are complete cannot be modified.

1. Navigate to the forms tab and select a form. 

1. If a form has a review in progress and you are the initiator of the review, a **Manage Review** ![aem6forms_review_chat_comment](assets/aem6forms_review_chat_comment.png) icons appears in the Action bar. Only review initiator can manage (Update/End) the review.

   Click the **Manage Review** ![aem6forms_review_chat_comment](assets/aem6forms_review_chat_comment.png)icon.

   For user other than initiator the Manage Review icon is disabled. 

1. Now you get a screen that displays information:

    * **Review name**: Cannot be edited.  
    
    * **Review description**: Available for editing.  
    
    * **Review deadline**: Available for editing. One can modify the deadline to any date and time beyond the current date and time.  
    
    * **Reviewers**: Available for editing. You can add or remove reviewers. If a task is overdue, you can add reviewers only after extending the deadline beyond the current date.

1. To end the review, click **End**.

### Actions that occur when a review is modified {#actions-that-occur-when-a-review-is-modified}

This section describes what happens on **Review Update/End**:

1. If the review description is modified, the corresponding task of reviewers and the initiator is updated.
1. If the review deadline is modified, the corresponding task for the reviewers is updated with the new date.   

1. If a reviewer is removed:

   ![Removing a reviewer](assets/removeduser.png)

   Removing a reviewer

    1. If incomplete, the assigned task is terminated.
    1. The reviewer can no longer comment on the form.

1. If a reviewer is added:

   ![Adding a reviewer](assets/addedreviewer.png)

   Adding a reviewer

    1. A review task is created and assigned to the newly added reviewer.
    1. The newly added reviewer can add comments about the form.

1. When a review ends:

    1. **Reviewers**: For each reviewer, the incomplete task related to the review is terminated. The task no longer appears as 'Pending' in the reviewer's Notifications section.
    1. **Initiator**: The task assigned to the Review initiator is marked complete. The task is removed from the Notification section of the review initiator.
    1. **All**: The review appears in the Previous Reviews section. No further comments can be added.

    ![review complete](assets/review-complete-imgg.png)

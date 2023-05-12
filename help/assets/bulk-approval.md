---
title: Review folder assets and collections
description: Set up review workflows for assets within a folder or a collection and share it with reviewers or creative partners to seek feedback.
contentOwner: AG
feature: Collaboration, Collections
role: User
exl-id: 23c90e10-aa03-450e-9fb0-2f5be0c5066b
hide: yes
---
# Review folder assets and collections {#review-folder-assets-and-collections}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service  |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/assets/manage/bulk-approval.html?lang=en)                  |
| AEM 6.5     | This article         |

Set up review workflows for assets within a folder or a collection and share it with reviewers or creative partners to seek feedback.

[!DNL Adobe Experience Manager Assets] lets you set up an ad-hoc review workflow for assets within a folder or collection, and share it with reviewers or creative partners to seek feedback.

You can either associate the review workflow with a project or create an independent review task.

After you share the assets, reviewers can approve or reject them. Notifications are sent at various stages of the workflow to notify intended recipients regarding the completion of various tasks. For example, when you share a folder or collection, the reviewer receives a notification that a folder/collection has been shared for review.

After the reviewer completes the review (approves or rejects assets), you receive a review completion notification.

## Create a review task for folders {#creating-a-review-task-for-folders}

1. From the [!DNL Assets] user interface, select the folder for which you want to create a review task.
1. From the toolbar, click **[!UICONTROL Create Review Task]** ![create review task](assets/do-not-localize/create-review-task.png) to open the **[!UICONTROL Review Task]** page. If you cannot see the option in the toolbar, click **[!UICONTROL More]** and then select the option.

1. (Optional) From the **[!UICONTROL Project]** list, select the project to which you want to associate the review task. By default, the **[!UICONTROL None]** option is selected. If you do not want to associate any project with the review task, retain this selection.

   >[!NOTE]
   >
   >Only the projects for which you have Editor-level permissions (or higher) are visible in the **[!UICONTROL Projects]** list.

1. Enter a name for the review task, and select an approver from the **[!UICONTROL Assign To]** list.

   >[!NOTE]
   >
   >The members/groups of the selected project are available as approvers in the **[!UICONTROL Assign To]** list.

1. Enter a description, the task priority, and the due date for the review task.

   ![task_details](assets/task_details.png)

1. In the Advanced tab, enter a label to be used to create the URI.

   ![review_name](assets/review_name.png)

1. Click **[!UICONTROL Submit]**, and then click **[!UICONTROL Done]** to close the confirmation message. A notification for the new task is sent to the approver.
1. Log in to [!DNL Assets] as an Approver and navigate to the [!DNL Assets] UI. To approve assets, click **[!UICONTROL Notifications]** and then select the review task from the list.

   ![Assets notification](assets/aemAssetsNotification.png)

1. In the **[!UICONTROL Review Task]** page, examine the details of the review task, and then click **[!UICONTROL Review]**.
1. In the **[!UICONTROL Review Task]** page, select assets, and click **[!UICONTROL Approve/Reject]** to approve or reject, as appropriate.

   ![review_task](assets/review_task.png)

1. Click **[!UICONTROL Complete]** from the toolbar. In the dialog, enter a comment and click  **[!UICONTROL Complete]** to confirm.
1. Navigate to the [!DNL Assets] user interface and open the folder. The approval status icons for the assets appear in card view and list view.

   **Card view**

   ![Review status as seen in card view](assets/chlimage_1-404.png)

   **List view**

   ![Review status as seen in list view](assets/review_status_listview.png)

## Create a review task for collections {#creating-a-review-task-for-collections}

1. From the Collections page, select the collection for which you want to create a review task.
1. From the toolbar, click **[!UICONTROL Create Review Task]** ![create review task](assets/do-not-localize/create-review-task.png) to open the **[!UICONTROL Review Task]** page. If you cannot see the option on the toolbar, click **[!UICONTROL More]** and then select the option.

1. (Optional) From the **[!UICONTROL Project]** list, select the project to which you want to associate the review task. By default, the **[!UICONTROL None]** option is selected. If you do not want to associate any project with the review task, retain this selection.

   >[!NOTE]
   >
   >Only the projects for which you have Editor-level permissions (or higher) are visible in the **[!UICONTROL Projects]** list.

1. Enter a name for the review task, and select an approver from the **[!UICONTROL Assign To]** list.

   >[!NOTE]
   >
   >The members/groups of the selected project are available as approvers in the **[!UICONTROL Assign To]** list.

1. Enter a description, the task priority, and the due date for the review task.

   ![task_details-collection](assets/task_details-collection.png)

1. Click **[!UICONTROL Submit]**, and then click **[!UICONTROL Done]** to close the confirmation message. A notification for the new task is sent to the approver.
1. Log in to [!DNL Assets] as an Approver and navigate to the [!DNL Assets] console. To approve assets, click **[!UICONTROL Notifications]** and then select the review task from the list.
1. In the **[!UICONTROL Review Task]** page, examine the details of the review task, and then click **[!UICONTROL Review]**.
1. All the assets in the collection are visible on the review page. Select the assets and click **[!UICONTROL Approve/Reject]** to approve or reject assets, as appropriate.

   ![review_task_collection](assets/review_task_collection.png)

1. Click **[!UICONTROL Complete]** from the toolbar. In the dialog, enter a comment and click **[!UICONTROL Complete]** to confirm.
1. Navigate to the Collections console and open the collection. The approval status icons for the assets appear in both the Card and List views.

   ![collection_reviewstatuscardview](assets/collection_reviewstatuscardview.png)

   *Figure: Card view.*
  
   ![collection_reviewstatuslistview](assets/collection_reviewstatuslistview.png)

   *Figure: List view.*

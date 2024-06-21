---
title: Starting processes
description: How to use LiveCycle AEM Forms workspace--select processes, add notes and attachments, save draft copies, and add to favorites.
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
exl-id: b2a6ba3a-0f4c-44b1-8f9a-c15c6fb8c305
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: Admin, User, Developer
---
# Starting processes {#starting-processes}

AEM Forms workspace organizes processes by the categories that the administrator or process designer sets up. You can also place processes that you use frequently into your Favorites category so that you can find them quickly.

When you start a process, you may need to fill a form to start a business process that AEM Forms workflow controls. If a form uses Prepare Data Process, some information can be pre-populated in a blank form, when a new process is initiated.

For example, you want to purchase a new computer monitor and therefore start a process called *Purchase Order*. When you start the process, a form opens and prompts you for details about the item to order. Your name, employee number, and manager’s name may already be prepopulated on the form. When you submit the request, a business process is initiated. Based on the process definition, the server automatically routes the request to your manager. The task starts appearing in your manager’s To-do list. When your manager approves the request, forms workflow routes the request to the purchasing department and sends you an email notification.

## Selecting processes to start {#selecting-processes-to-start}

You can select a process to start it or to view more information about it.

When you select a process to start, you may need to fill a form that is associated with that process. Submitting the form starts the process.

Forms in various types of file formats are supported, including Adobe PDF, HTML, and SWF file. A form may look like a traditional printable or web-based form or may guide you through a series of wizard-style panels to gather information.

If the form and process allow it, you can also save the form offline, fill it, and then submit it to complete the task. When the form is submitted, your email client is started with the appropriate server email address, if email end point is configured. You can then send the completed form to the server by email.

When you select a process, the Form tab and Details tab appear. If the process permits you to add notes or attachments, the Attachments tab and Notes tab also appears. If you have also configured the summary url with the process, then Summary tab also appears. The Forms tab displays the associated form, and the Details tab displays information about the current task and the process that it is part of.

### Start a business process {#start-a-business-process}

1. On the Start Process page, in the list on the left, select a category. All the processes that you have access to in the category appear on the right.

   >[!NOTE]
   >
   >If the Categories pane is collapsed, click 'Open Categories', in the top-left area of the AEM Forms workspace, to open the pane.

1. Select a process by clicking a task. The form that is associated with the process opens on the Form tab.

   Every form in a process has a unique URL. You can use the unique URL to directly launch the HTML Workspace with the specific process and form. The format of the URL is https://&lt;server&gt;:&lt;port&gt;/lc/libs/ws/index.html#/startprocess/&lt;ApplicationName&gt;%2F&lt;ProcessName&gt;. The &lt;ApplicationName&gt;%2F&lt;ProcessName&gt; string is always URL encoded. An example URL is http://localhost:8080/lc/libs/ws/index.html#/startprocess/MyApplication%2FNewProcess. The ApplicationName%2FProcessName string in the example is URL encoded.

1. Fill the form according to the instructions provided with it. If necessary, click **Maximize** to increase the visible area of the form.
1. If the Attachments tab is available, add attachments as required.
1. If the Notes tab is available, provide any notes as required.
1. Perform one of these steps:

    * Click the Submit button on the form, if the form has a Submit button.
    * Click Complete below the form, if the form does not have a Submit button.

   Process Management starts the process and routes the form to the To-do lists of the appropriate people who need to complete the next task in the process.

   If you must close a form before submitting it and without losing data that you entered, save a draft and complete it later if the process allows it. If the form and process allow it, you can also click **Offline** and later submit it from Adobe® Reader® or Adobe® Acrobat® Professional or Acrobat Standard.

   >[!NOTE]
   >
   >The offline option is available for PDF forms only.

## Adding notes and attachments {#adding-notes-and-attachments}

You can add notes and file attachments to a process if the process allows it. You can provide permissions for other users, who participate in the process to view, update, and delete the notes or attachments.

### Add a note {#add-a-note}

You can add multiple notes, edit the written notes, and delete them. Each note has a title, a description, and an access permission associated with it. You can set one of the following access permissions on a note:

* Read Only (the default permission)
* Read/Edit/Delete
* Read/Edit
* Read/Delete
* No Access

1. Open a task and click the **Notes** tab, if the process allows it.
1. Type a title for the note in the **Title** box, and type the text of the note in the **Note** box.
1. Select the **Permissions** level for the note for other users who participate in the process.
1. Click **OK**. A text file that contains your note is attached to the form. You can update a note by clicking it and directly modifying the text. You can delete a note by clicking the **Delete** button ![Image of a trash can](assets/icondelete.png) beside the note.

### Add an attachment {#add-an-attachment}

You can also add your comments about the attachment. You can set one of the following access permissions on an attachment:

* Read Only (the default permission)
* Read/Edit/Delete
* Read/Edit
* Read/Delete
* No Access

1. Click the **Attachments** tab and select **Attachment**.
1. Click **Browse** to select the file to attach.
1. Select the **Permissions** level for the attachment for other users who participate in the process. If you select **Read**, other users can save the file locally. If you select one of the edit permissions, other users can also upload a new file to replace your attachment.
1. Click **OK**. The file is attached to the form. You can delete a file by clicking the **Delete** button ![Image of a trash can](assets/icondelete.png) beside the attachment.

## Saving draft copies of forms {#saving-draft-copies-of-forms}

If you must complete and submit a form later, you can save a draft copy of a form so that you do not lose your existing work. Draft copies are added to the Drafts category on the To-do page.

After you reopen and submit a draft form, the draft is removed from the Drafts category.

Also, you can configure workspace to auto-save the information entered by a user as a draft. For more information, see [Managing Preferences](/help/forms/using/getting-started-livecycle-html-workspace.md).

>[!NOTE]
>
>The Save button is unavailable for some forms, depending on the process it is associated with.

### Save a draft copy {#save-a-draft-copy}

1. Click **Save** in the lower-left corner of any tab. The form is added to the Drafts category on your To-do page. All changes that you made to the form are saved.

### Reopen a draft copy {#reopen-a-draft-copy}

1. On the To-do page, select the **Drafts** queue and click the draft copy of the form.

   If the form contains a series of panels, you may need to go to the panel where you ended your last session.

## Adding processes to the Favorites category {#adding-processes-to-the-favorites-category}

You can add any process to your Favorites category. By setting favorites, you can group all the processes that you frequently start into a single category so that you can find them quickly.

>[!NOTE]
>
>If you usually start processes when you use AEM Forms workspace, you can set the Start Location preference to automatically display the Favorites category when you start AEM Forms workspace. For more details, see Managing Preferences in [Getting started with AEM Forms workspace](/help/forms/using/getting-started-livecycle-html-workspace.md).

To mark a process as favorite, select the task in its category, and click the hollow star. The star turns golden. To unmark a process as a favorite, click the golden star again.

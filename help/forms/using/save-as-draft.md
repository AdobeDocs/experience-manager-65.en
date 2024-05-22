---
title: Saving a task or form as a draft

description: Steps to save a draft copy of a task or a form in the AEM Forms app


content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app

exl-id: b4a23b2e-ab18-402c-8dfa-2533ee692912
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Saving a task or form as a draft {#saving-a-task-or-form-as-a-draft}

The save as draft option saves a snapshot of a task or form along with the data filled in the associated form. You can also create a draft from a template. The drafts are saved in the mobile device, and synced with Adobe Experience Manager Forms server for a later retrieval.

You can [update the form](/help/forms/using/working-with-form.md), [annotate it](/help/forms/using/add-attachments.md) with photographs, and scribble notes. As you continue to update a form, it is recommended to save it as a draft. For situations, where you decide to submit a filled form at a later point in time, saving it as a draft is helpful.

To enable save as draft feature for forms saved on forms portal, see [Saving an HTML5 form as a draft](/help/forms/using/saving-html5-form-draft.md).
To configure submission of adaptive forms, see [Drafts and submissions component](/help/forms/using/draft-submission-component.md). (Not valid for forms synced with AEM Forms JEE server.)

To create a draft, open the form and select the **Save as Draft** ![save-as-draft](assets/save-as-draft.png). Provide the name of the draft and select **Save**. The draft is saved in the Drafts folder and synced with the server. It is saved in the Outbox folder if the app is offline.

If you update the corresponding form afterwards, the changes are reflected immediately. On synchronizing the AEM Forms app with AEM Forms server, the draft is uploaded to AEM Forms server. In addition, the draft is moved from the Outbox to the Tasks or Drafts folder. An edit icon appears next to it.

As you continue to work on multiple tasks and start points and save them, the drafts are saved. Each time your app is synchronized with the AEM Forms server, the draft is saved to the server. It ensures that at any time you can recover the drafts based on the last saved date and time. For example, if you reinstall the app or change your mobile device, you can download the draft from the server.

## Delete a draft {#delete-a-draft}

The drafts folder lists all the drafts. You can use the Delete Draft option to permanently delete the drafts from the mobile device and server.

The option to delete drafts created from a task is not available. On deleting a draft created from a task, the task is abandoned.

You can discard drafts in both offline and online mode. On discarding the drafts in offline mode, the drafts are deleted from the server only when the connection with the server is restored.

Perform the following steps to delete a draft:

1. In the AEM Forms app, navigate to **Forms.**
1. Select **Drafts** from the drop-down next to Search.
1. A form with the edit icon ![edit-draft-app](assets/edit-draft-app.png) denotes a draft. Select the horizontal ellipsis next to the draft.
1. In the options that appear when you select the horizontal ellipsis, select **Delete Draft**.

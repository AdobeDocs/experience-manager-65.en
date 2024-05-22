---
title: Save forms as templates

description: Learn how to create templates from forms with data required repeatedly.


contentOwner: khsingh
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app

exl-id: b97175fd-cc3d-457a-af11-1f8c83192eb7
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Save forms as templates {#save-forms-as-templates}

At times, when users fill a form, inputs to a few fields remain the same. For such instances, you can fill the fields that require identical values in every instance, and save the form or draft as a template. Now, every time you create an instance of the template, the specified fields are already filled with values specified in the template. It helps you save time and effort required to fill the form.

Perform the following steps to create a template:

1. Open a form and select or fill the fields that have almost identical values every time you use it. You can include an attachment with the template that you typically add when you fill the form.
1. Select the **Save as Template** ![save_as_template](assets/save_as_template.png)icon. A dialog box to specify the name of the template appears.
1. Specify the name of the template and select **Save**. The template appears in the template folder.

   If a template with the identical name exists, a dialog box to confirm overwriting the existing template appears. To replace the existing template with new template, select **Continue** or to save the template with a different name, select **Cancel**.

Now, you can open the saved template. Every time a template is opened, a new form or task is created, and the form displays the saved data and options. With templates, you can edit the pre-filled data, add an attachment, save as draft, submit the task, or create another template using it. Templates are specific to mobile devices and are not synced with Adobe Experience Manager Forms server.

You can also delete a template if it is no longer required. To delete a template, navigate to templates folder, select the ellipsis, and then select **Delete Template**.

>[!NOTE]
>
>A template is available locally, and it is not synced with the server. Clearing the app's local data deletes the template.

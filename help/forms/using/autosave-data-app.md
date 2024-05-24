---
title: Using autosave in AEM Forms app
description: Learn how to use autosave feature in AEM Forms app that lets you avoid data loss.
contentOwner: sashanka
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app
docset: aem65
exl-id: 1603eef1-d7c8-47d3-8cfa-55ec3eaadd64
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Using autosave in AEM Forms app{#using-autosave-in-aem-forms-app}

When a user enters data in the Adobe Experience Manager Forms app, the autosave feature saves it at regular intervals. The autosave feature in the AEM Forms app helps you avoid data loss if the app is accidentally closed.

Your app can accidentally close:

* If your device shuts down due to low battery
* If the user kills the app
* If an unexpected crash occurs

You can specify the intervals after which the app saves the entered data.

>[!NOTE]
>
>Select autosave frequency judiciously. Frequent autosave operations can have a noticeable impact on the performance of your device.

Perform the following steps to use the autosave feature in AEM Forms app:

1. Log in to the app, and navigate to **Settings &gt; General**.
1. In the General screen, use the **Autosave Frequency** option to select the intervals at which you want the app to save the entered data.
   [ ![Setting autosave frequency](assets/using-autosave-freq-07.png)](assets/using-autosave-freq-07-1.png)

1. When you restart the app and log in with the same user, you are prompted to restore your task with Recover Unsaved Task dialog. Click **OK** in the Recover Unsaved Task dialog to resume working with the saved task. You can click **Cancel** to delete the saved data corresponding to the last triggered autosave and start working with a new task.

   When you click **OK**, the task is restored with the data corresponding to the latest autosave triggered before the app crashed. It includes the form data and all the attachments associated with the task.
   [ ![Getting a task recovered](assets/autosave-flow.png)](assets/using-autosave-freq-06.png)**A.** A work-in-progress form **B.** App closed forcefully **C.** App restarted with Recover Unsaved Task dialog **D.** Form restored with original data

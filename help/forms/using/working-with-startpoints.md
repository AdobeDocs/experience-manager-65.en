---
title: Working with Startpoints
description: Steps to work with an Adobe Experience Manager Forms process from your Mobile device defined in Workbench.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app
docset: aem65
exl-id: d5970f90-2899-43a5-a3a0-61a2c844d919
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Working with Startpoints{#working-with-startpoints}

A startpoint invokes a process created in Workbench. It is associated with a form which invokes the process when the form is submitted.

>[!NOTE]
>
>The terms startpoints, start process, and form are used interchangeably when referring to this concept.

To initiate a process from the Adobe Experience Manager (AEM) Forms app, you must have a startpoint of type **Workspace** in your process. Also, you must select the **[!UICONTROL Visible in Mobile Workspace]** option for the startpoint.

![mws_startpoint_select_option](assets/mws_startpoint_select_option.png)

**To start a process defined in Workbench**

1. To view the Startpoints available in the AEM Forms app, go to [Home screen](../../forms/using/home-screen.md).
1. On the **[!UICONTROL Home]** screen, by default, the **[!UICONTROL All Forms]** list is displayed.

   The startpoint is associated with a form. Select the startpoint associated form in the list to open it.

   The form associated with the startpoint opens.

1. Enter the details in the **[!UICONTROL Startpoint]** form.

   You can add annotations to this task using the [attachment](../../forms/using/add-attachments.md) button.

1. After you fill the form, select the **[!UICONTROL Submit]** button.

If the app is offline, the form and its data are saved in the Outbox folder.

If the app is online, the task is synchronized with the AEM Forms Server and assigned to the user specified in the process.

To work with the task in your task list, see [Opening a task](/help/forms/using/open-task.md).

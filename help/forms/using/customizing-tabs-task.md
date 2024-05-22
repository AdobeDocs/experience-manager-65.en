---
title: Customizing tabs for a task

description: How-to customize the names of the tabs for your tasks, in LiveCycle AEM Forms workspace.


content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace

exl-id: 8412cfec-bcab-40b7-9e5b-fcc211d43c0b
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Customizing tabs for a task {#customizing-tabs-for-a-task}

You can customize tab names for the `Start Process` component in the `Start Process` Uber view and the `Task Details` component in the `ToDo` Uber view.

1. Follow the [Generic steps for AEM Forms workspace customization](/help/forms/using/generic-steps-html-workspace-customization.md).
1. Change the value of `tabname`in the `translation.json` file.

   For example, change `/apps/ws/locales/en-US/translation.json` for English to the following.

    * For tasks initiated in the start process, use the following snippet from the `"startprocess" : {}` block.

   ```json
   "tabname" : {
               "form" : "Application",
               "details" : "Overview",
               "attachments" : "Attachments",
               "notes" : "Helper Notes"
           }
   ```

    * For tasks in To-do, use the following snippet from the `"todo" : {}` block.

   ```json
   "tabname" : {
               "summary" : "Bird's-eye view",
               "history" : "Past",
               "form" : "Form",
               "details" : "Overview",
               "attachments" : "Attachments",
               "notes" : "Notes"
   }
   ```

   >[!NOTE]
   >
   >Add corresponding key-value pair for all supported languages.

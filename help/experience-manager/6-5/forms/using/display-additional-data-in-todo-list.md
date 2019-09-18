---
title: Displaying additional data in ToDo list
seo-title: Displaying additional data in ToDo list
description: How-to customize the display of the To-do list of LiveCycle AEM Forms workspace to show more information besides the default.
seo-description: How-to customize the display of the To-do list of LiveCycle AEM Forms workspace to show more information besides the default.
uuid: 8e76c664-a995-4e81-b328-e8ff6096cf05
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
discoiquuid: 1b5cfbf1-b40a-4b55-80e4-23548527ff15
index: y
internal: n
snippet: y
---

# Displaying additional data in ToDo list{#displaying-additional-data-in-todo-list}

By default, the AEM Forms workspace To-do list displays the task display name and description. However, you can add other information such as creation date, deadline date. You can also add icons and change the style of the display.

![A look at the HTML Workspace To-do tab showing default configuration](assets/html-todo-list.png)

This article details the steps to add information to display for each task in the ToDo list.

## What can be added {#what-can-be-added}

You can add the information available in `task.json` sent by the server. The information can be added as plain text or you can use styles to format the information.

For more information about the JSON Object description, see [this](/6-5/forms/using/html-workspace-json-object-description.md) article.

## Displaying information on a task {#displaying-information-on-a-task}

1. Follow the [Generic steps for AEM Forms workspace customization](../../../6-5/forms/using/generic-steps-html-workspace-customization.md).
1. To display additional information for a task, the corresponding key-value pairs must be added within the task block of `translation.json`.

   For example change `/apps/ws/locales/en-US/translation.json` for English:

   ```
   
   "task" : {
           "reminder" : {
               "value" : "Reminder",
               "tooltip" : "This is reminder __reminderCount__, for this task."
           },
           "deadlined" : {
               "value" : "Deadlined",
               "tooltip" : "This task has deadlined"
           },
           "save" : {
               "message" : "Task has been saved successfully"
           },
           "status" : {
               "deadlined" : "Deadlined",
               "created" : "Created",
               "assignedsaved" : "Draft from assigned task",
               "terminated" : "Terminated",
               "assigned" : "Assigned",
               "unknown" : "Unknown",
               "createdsaved" : "Draft from created task",
               "completed" : "Completed"
           },
           "draft" : {
               "value" : "Saved",
               "tooltip" : "This task is marked as a draft"
           },
           "escalated" : {
               "value" : "Escalated",
               "tooltip" : "This task has been escalated"
           },
           "forward" : {
               "value" : "Forwarded",
               "tooltip" : "This task was forwarded"
           },
           "priority" : {
               "highest" : "Highest priority",
               "normal" : "Normal priority",
               "high" : "High priority",
               "low" : "Low priority",
               "lowest" : "Lowest priority"
           },
           "claimed" : {
               "value" : "Claimed",
               "tooltip" : "This task has been claimed"
           },
           "locked" : {
               "value" : "Locked",
               "tooltip" : "This task is locked"
           },
           "consulted" : {
               "value" : "Consulted",
               "tooltip" : "This task has been consulted"
           },
           "returned" : {
               "value" : "Returned",
               "tooltip" : "This task was returned back"
           },
           "multiplesubmitbuttons" : {
               "message" : "The form associated with this task has multiple submit buttons so the Workspace Complete button will be disabled. Click the appropriate button on the form to submit it."
           },
           "nosubmitbutton" : {
               "message" : "The form associated with this task does not appear to have submit buttons. You may need to upgrade your Adobe Reader version to 9.1 or greater and enable the Reader Submit option in your process."
           },
           "icon" : {
               "tooltip" : "open the task __taskName__"
           }
       }
   ```

   >[!NOTE]
   >
   >Add corresponding key-value pairs for all supported languages.

1. For example, add information inside the task block:

   ```
   
   "stepname" : {
               "value" : "Step Name",
               "tooltip" : "This task belongs to __stepName__ step"
   }
   ```

## Defining CSS for the new property {#defining-css-for-the-new-property}

1. You can apply style to the information (property) added to a task. To do this, you need to add style information for the new property added to `/apps/ws/css/newStyle.css`.

   For example add:

   ```css
   
   .task .taskProperties .stepname{
       width: 25px;
       background: url(../images/stepname.png) no-repeat; /*-------- Or just reuse background image / image-sprite defined .task .taskProperties span of style.css---------------------*/
       background-position: 0px 0px; /*-------- Dummy values, need to be configured as per user background image / image-sprite ---------------------*/
   }
   ```

## Adding entry in the HTML Template {#adding-entry-in-the-html-template}

Finally, you need to include an entry in the dev package for each property that you want to add to the task. To create one refer to Building AEM Forms workspace code.

1. Copy `task.html`:

    * from: `/libs/ws/js/runtime/templates/`
    * to: `/apps/ws/js/runtime/templates/`

1. Add the new information to `/apps/ws/js/runtime/templates/task.html`.

   For example, add under `div class="taskProperties"`:

   ```
   
   <span class="stepname" alt="<%= $.t('task.stepname.value')%>" title = '<%= $.t("task.stepname.tooltip",{stepName:stepName})%>'/>
   
   ```

[**Contact Support**](https://www.adobe.com/account/sign-in.supportportal.html)

<!--
<related-links>
<a href="../../../6-5/forms/using/introduction-customizing-html-workspace.md">Introduction to Customizing AEM Forms workspace</a>
<a href="../../../6-5/forms/using/generic-steps-html-workspace-customization.md">Generic steps for AEM Forms workspace customization</a>
<a href="../../../6-5/forms/using/tasks-organizational-hierarchy-using-manager.md">Managing tasks in an organizational hierarchy using Manager View</a>
<a href="../../../6-5/forms/using/integrating-correspondence-management-html-workspace.md">Integrating Correspondence Management in AEM Forms workspace</a>
<a href="/6-5/forms/using/single-sign-timeout-handlers.md">Single Sign On and timeout handlers</a>
<a href="/6-5/forms/using/displaying-user-avatar.md">Displaying the user avatar</a>
<a href="/6-5/forms/using/displaying-information-task-summary-pane.md">Displaying information in the Task Summary pane</a>
<a href="/6-5/forms/using/changing-organization-logo-branding.md">Changing the organization logo</a>
<a href="/6-5/forms/using/changing-color-scheme-interface.md">Changing the color scheme of the interface</a>
<a href="../../../6-5/forms/using/changing-font-interface.md">Changing the font on the interface</a>
<a href="../../../6-5/forms/using/changing-locale-user-interface.md">Changing the locale of the user interface</a>
<a href="/6-5/forms/using/customizing-error-dialogs.md">Customizing error dialogs</a>
<a href="/6-5/forms/using/customizing-tabs-task.md">Customizing tabs for a task</a>
<a href="/6-5/forms/using/customizing-task-actions.md">Customizing Task Actions</a>
<a href="/6-5/forms/using/customizing-listing-process-instances.md">Customizing the listing of process instances</a>
<a href="/6-5/forms/using/customizing-task-details-page.md">Customizing the task Details page</a>
<a href="../../../6-5/forms/using/display-additional-data-in-todo-list.md">Displaying additional data in ToDo list</a>
<a href="/6-5/forms/using/getting-task-variables-summary-url.md">Getting Task Variables in Summary URL</a>
<a href="/6-5/forms/using/images-route-actions.md">Images for Route Actions</a>
<a href="../../../6-5/forms/using/creating-new-login-screen.md">Creating a new login screen</a>
<a href="/6-5/forms/using/minification-javascript-files.md">Minification of the JavaScript files</a>
<a href="/6-5/forms/using/sorting-tracking-tables-add-columns.md">Sorting of Tracking tables and adding more columns</a>
<a href="/6-5/forms/using/updating-link-help-documentation.md">Updating the link to the documentation</a>
<a href="/6-5/forms/using/two-html-workspace-instances-one.md">Hosting two AEM Forms workspace instances on one server</a>
</related-links>
-->


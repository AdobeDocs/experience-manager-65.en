---
title: Customizing the task details page
description: How-to customize the task details page in AEM Forms workspace to modify the default information displayed about a task.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
exl-id: 48c24442-22d2-4d1a-9462-0aba78340281
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Customizing the task details page {#customizing-the-task-details-page}

The task details page contains information about a task and its processes. However, you can customize the task details page to add or delete information.

You can add the following information to the task details page:

* Information available in the JSON object of a task (Task section in [AEM Forms workspace JSON Object Description](/help/forms/using/html-workspace-json-object-description.md))
* Information available in the JSON object of a process instance (Process instance section in [AEM Forms workspace JSON Object Description](/help/forms/using/html-workspace-json-object-description.md))

To customize the task details page:

1. Follow [Generic steps for AEM Forms workspace customization.](/help/forms/using/generic-steps-html-workspace-customization.md)
1. To show any additional information, add corresponding key-value pairs to the `translation.json` file at `todo`block > `details`block > `app`block > [ `required`block].

   The [ `required`block] refers to available blocks, such as the task block for task information, process block for process information, and currentpendingtask block for pending tasks information.

   For example, to add information about Route Selection Required in the task details page, you can add the following key-value pair in the task block:

   ```json
   "todo" : {
       .
       .
       .
       "details" : {
           .
           .
           "task" : {
               .
               .
               "RouteSelectionRequired" : "Route Selection Required"
           }
       }
   }
   ```

   >[!NOTE]
   >
   >Add corresponding key-value pairs for all the supported languages.

1. Copy `/libs/ws/js/runtime/templates/taskdetails.html` to `/apps/ws/js/runtime/templates/taskdetails.html`.

   Add the new information to `/apps/ws/js/runtime/templates/taskdetails.html`. For example:

   ```css
   <div class="detailsContainer">
       .
       .
       <ul>
           .
           .
           <li>
               <label for="routeSelectionRequired" title="<%= $.t('todo.details.task.RouteSelectionRequired')%>"><%= $.t('todo.details.task.RouteSelectionRequired')%></label>
               <div>
                   <span id="routeSelectionRequired"><%= isRouteSelectionRequired != null ? isRouteSelectionRequired : ''%></span>
               </div>
           </li>
           .
           .
       </ul>
   </div>
   ```

1. Open /apps/ws/js/registry.js for editing.

   Search and replace `text!/lc/libs/ws/js/runtime/templates/taskdetails.html` with `text!/lc/apps/ws/js/runtime/templates/taskdetails.html`.

>[!NOTE]
>
>To customize the task details page with tasks created in the **Start Process** tab of AEM Forms workspace, add the new information to `/apps/ws/js/runtime/templates/startprocess.html`.
>
>To add new styles for the information added in the details page, modify the CSS file by using the *User interface changes* section in [Workspace Customization](changing-locale-user-interface.md).

---
title: Displaying information in the Task Summary pane
description: In AEM Forms workspace, a Task Summary pane can be configured to summarize the task or display any other web page.
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
exl-id: 0b3087fe-a3fb-4eac-ad4b-c123526e8195
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Displaying information in the Task Summary pane {#displaying-information-in-the-task-summary-pane}

When you open a task in AEM Forms workspace, a Task Summary pane can display a summary of the task. This additional and relevant information for a task adds more value for the end-user of AEM Forms workspace.

AEM Forms workspace lets you display a web page of your choice in the Task Summary pane. A process can be created to display a Task Summary pane using Workbench.

1. Create an Assign Task process in Workbench. For more details about Assign Task operation, see Service Reference topic in [Workbench Help](https://help.adobe.com/en_US/AEMForms/6.1/WorkbenchHelp/).

   >[!NOTE]
   >
   >If a TaskSummary URL exists, the Task Summary view opens by default instead of the Form view. In this case, even when a user enables ‘Open the form in maximized mode' option in Assign Task, the form does not open in maximized mode.

1. Configure the Task Summary URL field. You can specify a literal value, a template, a variable, or an XPath expression.
1. An example of displaying the information on Task Summary page is below.

    * Log in to CRXDE Lite environment at `https://'[server]:[port]'/lc/crx/de`.
    * `Create a node`**SampleSummary** ` under `/content` with type `nt:unstructured`. In the properties of this node, add `sling:resourceType` of type String and value `SampleSummary`. In the Access Control List of this node, add an entry for `PERM_WORKSPACE_USER` allowing `jcr:read` privileges.`
    * `Create a folder`**SampleSummary** under `/apps`. In the Access Control List of `/apps/SampleSummary`, add an entry for `PERM_WORKSPACE_USER` allowing `jcr:readprivileges`.
    * `Create a file `html.esp` at `/apps/SampleSummary`. For example, add the following lines in `html.esp`.`

   ```html
   <html>
       <body>
           <h1>Sample Summary</h1>
           <br/>
           <p>Hello Sir!
               <br/>
               This is sample summary page for this task.
           </p>
       </body>
   </html>
   ```

    * Set the value of task summary url as `/lc/content/SampleSummary.html` in Assign Task step.
    * When the task associated with this Assign Task step is opened in AEM Forms workspace, the `html.esp` at `/apps/SampleSummary` is rendered in task summary pane.

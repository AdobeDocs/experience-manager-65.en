---
title: Customizing the listing of process instances

description: How-to customize the properties displayed in process instance in AEM Forms workspace.


content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace

exl-id: b27ffe92-8491-43a0-bf42-613eb39a606e
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Customizing the listing of process instances {#customizing-the-listing-of-process-instances}

The process instance list is displayed in the Tracking tab of AEM Forms workspace.

In the process instance list, for each process instance, AEM Forms workspace shows some properties of that instance. The following properties are available for each process instance. These properties are stored as attributes in the process instance component model and are available for use in its view and template.

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Comments</strong></td>
  </tr>
  <tr>
   <td>description</td>
   <td>Description of the process instance.</td>
  </tr>
  <tr>
   <td>initiator</td>
   <td>Name of initiator of the process instance.</td>
  </tr>
  <tr>
   <td>initiatorId</td>
   <td>ID of the initiator of the process instance.</td>
  </tr>
  <tr>
   <td>processCompleteTime</td>
   <td>Time stamp when the process completed.</td>
  </tr>
  <tr>
   <td>processInstanceId</td>
   <td>ID of the process instance.</td>
  </tr>
  <tr>
   <td>processInstanceStatus</td>
   <td>0 = Initiated<br /> 1 = Running<br /> 2 = Complete<br /> 3 = Completing<br /> 4 = Terminated<br /> 5 = Terminating<br /> 6 = Suspended<br /> 7 = Suspending<br /> 8 = Unsuspending</td>
  </tr>
  <tr>
   <td>processName</td>
   <td>Name of the process.</td>
  </tr>
  <tr>
   <td>processStartTime</td>
   <td>Time stamp when the process started.</td>
  </tr>
  <tr>
   <td>processVariables</td>
   <td>Array of objects of process variables. Each process variable object contains <strong>name</strong> (the name of process variable), <strong>value</strong> (value of the process variable), and<strong> type</strong> (the type of process variable).</td>
  </tr>
 </tbody>
</table>

**Example:**

To display the `description` property of the process instance in the process instance card, perform the following steps.

1. Follow the [Generic steps for AEM Forms workspace customization](/help/forms/using/generic-steps-html-workspace-customization.md).
1. Do the following:

    1. Copy /libs/ws/js/runtime/templates/processinstance.html to/apps/ws/js/runtime/templates/, if it does not exist. Click **Save All**.
    1. Add process description div with class = 'processDescription' inprocessinstance.html.

   ```jsp
   <div class="processDescription" title="<%= description%>"><%= description%></div>
   ```

1. Do the following:

    1. Open /apps/ws/js/registry.js for editing.
    1. Search and replace `text!/lc/libs/ws/js/runtime/templates/processinstance.html`with `text!/lc/`**apps**/ws/js/runtime/templates/processinstance.html.

1. The above changes may require an update to the CSS file by adding an entry in the style sheet /apps/ws/css/newStyle.css in the following way:

   ```css
   .processinstance .processDescription {
    <!--Dummy values, need to be configured by user as per requirement and user can add or delete any property depending upon requirement-->
       width : 250px;
       font-size : 11pt;
       padding : 2px;
   }
   ```

---
title: APIs used in AEM Forms workspace
description: Public Java&trade; and JavaScript APIs and methods of LiveCycle AEM Forms workspace, exposed for customization and automation.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
exl-id: 9034f73a-83f3-498e-b6a6-ad6577aa1a3a
solution: Experience Manager, Experience Manager Forms
feature: HTML5 Forms, Adaptive Forms
role: Admin, User, Developer
---
# APIs used in AEM Forms workspace {#apis-used-in-aem-forms-workspace}

The following APIs are used in the AEM Forms workspace.

<table>
 <tbody>
  <tr>
   <td><strong>JavaScript Method</strong></td>
   <td><strong>Service Name</strong></td>
   <td><strong>API Name</strong></td>
   <td><strong>Comments</strong></td>
  </tr>
  <tr>
   <td>getGroups</td>
   <td>ProcessManagementUserProxyService</td>
   <td>getGroups</td>
   <td>Searches groups. it returns a list of all the groups if nothing specified, else returns groups with the specified name.</td>
  </tr>
  <tr>
   <td>getUsersAndGroups</td>
   <td>ProcessManagementUserProxyService</td>
   <td>getUsersAndGroups</td>
   <td>Searches users and groups. It returns a list of all the users and groups if nothing specified, else returns users and groups with specified name.</td>
  </tr>
  <tr>
   <td>prepareForSubmit</td>
   <td>ProcessManagementDocumentHandlingService</td>
   <td>prepareForSubmit</td>
   <td>It is called before submitting a form by way of DocumentSubmitServlet. It sets the task ID in a session variable (along with expiry time) which is retrieved during the actual submission.</td>
  </tr>
  <tr>
   <td>submitTask</td>
   <td>ProcessManagementDocumentHandlingService</td>
   <td>submit</td>
   <td>It submits the document object associated with a task (and submit process in turn).</td>
  </tr>
  <tr>
   <td>getRootEndpointCategories</td>
   <td>ProcessManagementStartpointService</td>
   <td>getRootEndpointCategories</td>
   <td>It fetches all root categories present on the server.</td>
  </tr>
  <tr>
   <td>getDirectChildCategories</td>
   <td>ProcessManagementStartpointService</td>
   <td>getDirectChildCategories2</td>
   <td>It fetches all direct children for a category.</td>
  </tr>
  <tr>
   <td>getAllStartpoints</td>
   <td>ProcessManagementStartpointService</td>
   <td>getAllStartpoints</td>
   <td>It fetches all startpoints present on the server under all categories.</td>
  </tr>
  <tr>
   <td>invokeStartpoint</td>
   <td>ProcessManagementStartpointService</td>
   <td>invokeStartpoint</td>
   <td>This invokes a Startpoint and creates a task corresponding to a starpoint</td>
  </tr>
  <tr>
   <td>getAllTasks</td>
   <td>ProcessManagementTaskService</td>
   <td>getAllActionableTasks</td>
   <td>It fetches all tasks that are created and forwarded or consulted, saved, assigned, assigned, and saved for the logged in user.</td>
  </tr>
  <tr>
   <td>getTask</td>
   <td>ProcessManagementTaskService</td>
   <td>getTask</td>
   <td>It fetches a specific task.</td>
  </tr>
  <tr>
   <td>renderTask</td>
   <td>ProcessManagementTaskService</td>
   <td>render</td>
   <td>It renders a task and returns information needed to render the form like form url, form type, data url, if needed.</td>
  </tr>
  <tr>
   <td>submitWithPriorData</td>
   <td>ProcessManagementTaskService</td>
   <td>submitWithPriorData</td>
   <td>It returns the result of TaskManager's submit API using the result key.</td>
  </tr>
  <tr>
   <td>submitWithData</td>
   <td>ProcessManagementTaskService</td>
   <td>submitWithData</td>
   <td>It submits the form data (passed as string) associated with the task usingTaskManager's submit API. It is used for Flex forms which do not callTaskManager's submit API.</td>
  </tr>
  <tr>
   <td>save</td>
   <td>ProcessManagementTaskService</td>
   <td>save</td>
   <td>It saves a task on the server.</td>
  </tr>
  <tr>
   <td>complete</td>
   <td>ProcessManagementTaskService</td>
   <td>complete</td>
   <td>It completes a task and the task is passed to the next step as per process design.</td>
  </tr>
  <tr>
   <td>getAttachment</td>
   <td>ProcessManagementTaskService</td>
   <td>getAttachment</td>
   <td>It returns a URL of an attachment where the attachment is available.</td>
  </tr>
  <tr>
   <td>getAllAttachments</td>
   <td>ProcessManagementTaskService</td>
   <td>getAllActionableAttachments</td>
   <td>It fetches all attachments and notes for a task.</td>
  </tr>
  <tr>
   <td>share</td>
   <td>ProcessManagementTaskService</td>
   <td>share</td>
   <td>It shares a task with another user. Another user can claim the task and becomes owner of the task.</td>
  </tr>
  <tr>
   <td>forward</td>
   <td>ProcessManagementTaskService</td>
   <td>forward</td>
   <td>It forwards a task to another user.</td>
  </tr>
  <tr>
   <td>consult</td>
   <td>ProcessManagementTaskService</td>
   <td>consult</td>
   <td>It consults a task with another user.</td>
  </tr>
  <tr>
   <td>claim</td>
   <td>ProcessManagementTaskService</td>
   <td>claim</td>
   <td>It claims a task that is available in a shared queue.</td>
  </tr>
  <tr>
   <td>unlock</td>
   <td>ProcessManagementTaskService</td>
   <td>unlock</td>
   <td>It unlocks a task.</td>
  </tr>
  <tr>
   <td>lock</td>
   <td>ProcessManagementTaskService</td>
   <td>lock</td>
   <td>It locks a task and the task cannot be claimed by another user if shared.</td>
  </tr>
  <tr>
   <td>reject</td>
   <td>ProcessManagementTaskService</td>
   <td>reject</td>
   <td>It returns a task to the previous owner of the task.</td>
  </tr>
  <tr>
   <td>abandon</td>
   <td>ProcessManagementTaskService</td>
   <td>abandon</td>
   <td>It deletes a task.</td>
  </tr>
  <tr>
   <td>setVisibility</td>
   <td>ProcessManagementTaskService</td>
   <td>setVisibility</td>
   <td>It sets visibility of a task. If visibility is set to false, the task is not visible to the user afterwards.</td>
  </tr>
  <tr>
   <td>getUsers</td>
   <td>ProcessManagementUserProxyService</td>
   <td>getUsers</td>
   <td>It is used for searching users. It returns all users if no name is specified, or else it returns users with a specified name.</td>
  </tr>
  <tr>
   <td>getUsersInGroup</td>
   <td>ProcessManagementUserProxyService</td>
   <td>getUsersInGroupByName</td>
   <td>It returns all users in a group.</td>
  </tr>
  <tr>
   <td>grantQueueAccess</td>
   <td>ProcessManagementQueueService</td>
   <td>grantQueueAccess</td>
   <td>It grants access of the logged in user's queue to a specified user. It is basically sharing your own queue with another user.</td>
  </tr>
  <tr>
   <td>requestQueueAccess</td>
   <td>ProcessManagementQueueService</td>
   <td>requestQueueAccess</td>
   <td>It makes the access request of a queue of a specified user for the logged in user. If the user approves the request, the user's queue is shared with the logged in user.</td>
  </tr>
  <tr>
   <td>getGrantedUsers</td>
   <td>ProcessManagementQueueService</td>
   <td>getGrantedUsers</td>
   <td>It returns all users who have access to the queue of the logged in user.</td>
  </tr>
  <tr>
   <td>getUsersForAccessibleQueues</td>
   <td>ProcessManagementQueueService</td>
   <td>getUsersForAccessibleQueues</td>
   <td>It returns all users whose queue is accessible to a user.</td>
  </tr>
  <tr>
   <td>revokeQueueAccess</td>
   <td>ProcessManagementQueueService</td>
   <td>revokeQueueAccess</td>
   <td>It removes a user from the list of users who have access to the queue of the logged in user.</td>
  </tr>
  <tr>
   <td>removeQueueAccess</td>
   <td>ProcessManagementQueueService</td>
   <td>removeQueueAccess</td>
   <td>It removes a user from the list of users whose queue is accessible to the logged in user.</td>
  </tr>
  <tr>
   <td>getAllQueues<br /> </td>
   <td>ProcessManagementQueueService<br /> </td>
   <td>getAllQueues<br /> </td>
   <td>It gets all queues (own, shared, and group queues) accessible to the logged in user.<br /> </td>
  </tr>
  <tr>
   <td>getOutOfOfficeSettings</td>
   <td>ProcessManagementOutOfOfficeService</td>
   <td>getOutOfOfficeSettings</td>
   <td>It gets the out-of-office settings of a user.</td>
  </tr>
  <tr>
   <td>saveOutOfOfficeSettingsJson</td>
   <td>ProcessManagementOutOfOfficeService</td>
   <td>saveOutOfOfficeSettingsJson</td>
   <td>It saves the out-of-office settings of a user.</td>
  </tr>
  <tr>
   <td>getAllProcesses</td>
   <td>ProcessManagementProcessService</td>
   <td>getAllProcesses</td>
   <td>It returns a list of all the processes.</td>
  </tr>
  <tr>
   <td>getParticipatedProcesses</td>
   <td>ProcessManagementProcessService</td>
   <td>getParticipatedProcesses</td>
   <td>It returns a list of all the process names participated by the logged in user.</td>
  </tr>
  <tr>
   <td>getProcessInstance<br /> </td>
   <td>ProcessManagementProcessService<br /> </td>
   <td>getProcessInstance<br /> </td>
   <td>It fetches details of a process instance.<br /> </td>
  </tr>
  <tr>
   <td>getProcessInstances</td>
   <td>ProcessManagementQueryService</td>
   <td>getProcessInstances</td>
   <td>It fetches all process instances for a process.</td>
  </tr>
  <tr>
   <td>getPendingTasksForProcessInstance</td>
   <td>ProcessManagementQueryService</td>
   <td>getPendingTasksForProcessInstance</td>
   <td>It gets pending tasks for a process instance.</td>
  </tr>
  <tr>
   <td>getTasksForProcessInstance</td>
   <td>ProcessManagementQueryService</td>
   <td>getTasksForProcessInstance</td>
   <td>It gets all tasks for a process instance.</td>
  </tr>
  <tr>
   <td>getAllSearchTemplates</td>
   <td>ProcessManagementQueryService</td>
   <td>getAllSearchTemplates</td>
   <td>It returns a list of all the search templates.</td>
  </tr>
  <tr>
   <td>getTemplate</td>
   <td>ProcessManagementQueryService</td>
   <td>getTemplate</td>
   <td>It returns content for a search template.</td>
  </tr>
  <tr>
   <td>findTasksJson<br /> </td>
   <td>ProcessManagementQueryService</td>
   <td>findTasksJson</td>
   <td>It searches and returns all the tasks that satisfy all the conditions of a search template.</td>
  </tr>
  <tr>
   <td>getAssignmentsForTask</td>
   <td>ProcessManagementTaskService</td>
   <td>getAssignmentsForTask</td>
   <td>It gets all assignments for a task. For example, if a user forwards or consults a task with another user, then it is an assignment for a task.</td>
  </tr>
  <tr>
   <td>deleteAttachment </td>
   <td>TaskManagerService</td>
   <td>deleteAttachment</td>
   <td>It deletes an attachment.</td>
  </tr>
  <tr>
   <td>initialize</td>
   <td>ProcessManagementClientSessionService</td>
   <td>initialize</td>
   <td>It renews the assertion if necessary. Authenticates user. Sets session parameters for server / client information. Returns user information and polling interval.</td>
  </tr>
  <tr>
   <td>getTasksForDirectReports</td>
   <td>ProcessManagementTeamTasksService</td>
   <td>getTasksForDirectReports</td>
   <td>It returns all the tasks of direct reports of the logged in manager.</td>
  </tr>
  <tr>
   <td>getTaskOfDirectReport<br /> </td>
   <td>ProcessManagementTeamTasksService</td>
   <td>getDirectReportTask</td>
   <td>It returns a task of a specified direct report of the logged in manager.</td>
  </tr>
  <tr>
   <td>forwardTaskOfDirectReport</td>
   <td>ProcessManagementTeamTasksService</td>
   <td>forwardTaskOfDirectReport</td>
   <td>It forwards a task of a direct report to another user.</td>
  </tr>
  <tr>
   <td>rejectTaskOfDirectReport</td>
   <td>ProcessManagementTeamTasksService</td>
   <td>rejectTaskOfDirectReport</td>
   <td>It returns a task of a direct report to the previous user.</td>
  </tr>
  <tr>
   <td>getProperty</td>
   <td>WorkspacePropertyService</td>
   <td>getProperty</td>
   <td>It gets a Workspace property for a user.</td>
  </tr>
  <tr>
   <td>removeProperty</td>
   <td>WorkspacePropertyService</td>
   <td>delete</td>
   <td>It removes a Workspace property for a user.</td>
  </tr>
  <tr>
   <td>getProperties</td>
   <td>WorkspacePropertyService</td>
   <td>getPropertiesAsMap</td>
   <td>It returns all Workspace properties for a user.</td>
  </tr>
  <tr>
   <td>setProperty</td>
   <td>WorkspacePropertyService</td>
   <td>setProperty</td>
   <td>It sets a Workspace property for a user.</td>
  </tr>
  <tr>
   <td>getCurrentUserImageUrl</td>
   <td>ProcessManagementClientSessionService</td>
   <td>getCurrentUserImageUrl</td>
   <td>It gets the user's image URL for the logged in user.</td>
  </tr>
  <tr>
   <td>getUserImageUrl</td>
   <td>ProcessManagementClientSessionService</td>
   <td>getUserImageUrl</td>
   <td>It gets the user's image URL for the specified user.</td>
  </tr>
  <tr>
   <td>uploadNote</td>
   <td>ProcessManagementDocumentHandlingService</td>
   <td>uploadNote</td>
   <td>It uploads a note on the server for a task.</td>
  </tr>
  <tr>
   <td>uploadRMAToServer (It is also called directly from html template)<br /> </td>
   <td>ProcessManagementDocumentHandlingService</td>
   <td>uploadAttachment</td>
   <td>It uploads an attachment on the server for a task.</td>
  </tr>
  <tr>
   <td>getImageURL (Also called directly from the HTML template)</td>
   <td>ProcessManagementDocumentHandlingService</td>
   <td>getImage</td>
   <td>It gets the image for a process.</td>
  </tr>
 </tbody>
</table>

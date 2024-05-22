---
title: AEM Forms workspace JSON object description
description: Conceptual information about the JSON JavaScript objects used in LiveCycle AEM Forms workspace for customization, extension, modification, and reuse.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
exl-id: f837a2b3-4650-4261-84c6-291bb2a46dc7
solution: Experience Manager, Experience Manager Forms
feature: "HTML5 Forms, Adaptive Forms"
role: "Admin, User, Developer"
---
# AEM Forms workspace JSON object description {#aem-forms-workspace-json-object-description}

JSON objects used in AEM Forms workspace are described below.

1. Category

   Categories are present in the start process tab of the workspace. These categories are used to classify the startpoints.

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Client Only</strong></td>
   <td><strong>Comments</strong></td>
  </tr>
  <tr>
   <td>name</td>
   <td>F</td>
   <td>Category name</td>
  </tr>
  <tr>
   <td>id</td>
   <td>F</td>
   <td>Category ID<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>description<br type="_moz" /> </td>
   <td>F</td>
   <td>Category description<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>parentOid<br type="_moz" /> </td>
   <td>F</td>
   <td>Contains oid of parent category<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>startPointsList<br type="_moz" /> </td>
   <td>T</td>
   <td>Contains list of all startpoints present in a category</td>
  </tr>
  <tr>
   <td>categoryList</td>
   <td>T</td>
   <td>Contains list of direct child categories of a category<br type="_moz" /> </td>
  </tr>
 </tbody>
</table>

   >[!NOTE]
   >
   >All Startpoints and Favorites are categories which are defined on client side. Favorite category contains all startpoints which are marked by the user as favorite. All Startpoints category contains all startpoints.

1. Startpoint

   Startpoint is used to start a process from the workspace when invoked.

   | **Property** |**Client Only** |**Comments** |
   |---|---|---|
   | categoryId |F |It contains id of the category to which startpoint belongs. |
   | description  |F |It contains description for a startpoint.  |
   | name  |F |It contains name of the startpoint.  |
   | serializedImageTicket  |F |It contains image ticket corresponding to the startpoint. This image ticket is used in imageUrl field of startpoint, to get image for startpoint from the server.  |
   | serviceName  |F |It contains name of the service for startpoint.  |
   | startpointId  |F |It contains id of startpoint.  |
   | isFavorite  |T |Denotes whether startpoint is favorite or not. True if startpoint is favorite else false.  |
   | isDefaultImage  |T |Denotes whether there is an image specified for process or not. True if there is no image associated with process else false.  |
   | task  |T |It contains task created when startpoint is invoked.  |
   | imageUrl  |T |It contains url of the image corresponding to the startpoint.  |

1. Task

   Tasks are assigned to users/group and include a user interface--a form or a Guide (deprecated)--that can be populated with data. When users are assigned a task, they are provided with the form or Guide to complete and submit.

<table>
 <tbody>
  <tr>
   <td>Property<br /> </td>
   <td>Client Only<br /> </td>
   <td>Comments<br /> </td>
  </tr>
  <tr>
   <td>classOfTask</td>
   <td>F</td>
   <td>Class of task is 'LC8' when task is lc8 task else 'Standard'.<br /> </td>
  </tr>
  <tr>
   <td>completeTime<br /> </td>
   <td>F</td>
   <td>It contains the time stamp when task is completed.<br /> </td>
  </tr>
  <tr>
   <td>consultGroupId<br /> </td>
   <td>F</td>
   <td>It contains ID of a group to which task can be consulted. It is set during the process designing.<br /> </td>
  </tr>
  <tr>
   <td>createTime<br /> </td>
   <td>F</td>
   <td>It contains the time stamp when task is created.<br /> </td>
  </tr>
  <tr>
   <td>creationId<br /> </td>
   <td>F</td>
   <td>It contains the id of the user who created the task.<br /> </td>
  </tr>
  <tr>
   <td>currentAssignment<br /> </td>
   <td>F</td>
   <td>It contains details about current assignment of task.<br /> </td>
  </tr>
  <tr>
   <td>deadline<br /> </td>
   <td>F</td>
   <td>It contains the time stamp that when a task will reach its deadline.<br /> </td>
  </tr>
  <tr>
   <td>description<br /> </td>
   <td>F</td>
   <td>It contains description of the task.<br /> </td>
  </tr>
  <tr>
   <td>displayName<br /> </td>
   <td>F</td>
   <td>It contains display name of the task.<br /> </td>
  </tr>
  <tr>
   <td>forwardGroupId<br /> </td>
   <td>F</td>
   <td>It contains ID of a group to which task can be forwarded. It is set during the process designing.<br /> </td>
  </tr>
  <tr>
   <td>instructions<br /> </td>
   <td>F</td>
   <td>It contains instructions for a task.<br /> </td>
  </tr>
  <tr>
   <td>isLocked<br /> </td>
   <td>F</td>
   <td>True if task is locked.<br /> </td>
  </tr>
  <tr>
   <td>isMustOpenToComplete<br /> </td>
   <td>F</td>
   <td>True if task form must be opened to complete the task.<br /> </td>
  </tr>
  <tr>
   <td>isOpenFullScreen<br /> </td>
   <td>F</td>
   <td>If true, on opening the task, form takes complete screen first time.<br /> </td>
  </tr>
  <tr>
   <td>isRouteSelectionRequired<br /> </td>
   <td>F</td>
   <td>If true, route must be selected to complete the task.<br /> </td>
  </tr>
  <tr>
   <td>isShowAttachments<br /> </td>
   <td>F</td>
   <td>Attachments are shown if it is true.<br /> </td>
  </tr>
  <tr>
   <td>isStartTask<br /> </td>
   <td>F</td>
   <td>If true, task is created from start point.<br /> </td>
  </tr>
  <tr>
   <td>isVisible<br /> </td>
   <td>F</td>
   <td>True if task is visible in workspace.<br /> </td>
  </tr>
  <tr>
   <td>nextReminder<br /> </td>
   <td>F</td>
   <td>Time stamp for the next reminder.<br /> </td>
  </tr>
  <tr>
   <td>priority<br /> </td>
   <td>F</td>
   <td>It contains priority of task.<br /> 1 = Highest priority<br /> 2 = High Priority<br /> 3 = Normal Priority<br /> 4 = Low Priority<br /> 5 = Lowest Priority<br /> </td>
  </tr>
  <tr>
   <td>processInstanceId</td>
   <td>F</td>
   <td>Id of the process instance of which task is part.<br /> </td>
  </tr>
  <tr>
   <td>processInstanceStatus<br /> </td>
   <td>F</td>
   <td>Status of task's process instance.<br /> </td>
  </tr>
  <tr>
   <td>reminderCount<br /> </td>
   <td>F</td>
   <td>It contains count of reminders for the task.<br /> </td>
  </tr>
  <tr>
   <td>routeList<br /> </td>
   <td>F</td>
   <td>It contains list of routes associated with task. User can complete the task by selecting any one of the route from route list.<br /> </td>
  </tr>
  <tr>
   <td>selectedRoute<br /> </td>
   <td>F</td>
   <td>It contains name of the route selected when task was completed.<br /> </td>
  </tr>
  <tr>
   <td>serializedImageTicket<br /> </td>
   <td>F</td>
   <td>It contains image ticket corresponding to task. This image ticket is used in imageUrl field of task, to get image for task from the server.<br /> <br /> </td>
  </tr>
  <tr>
   <td>serviceName<br /> </td>
   <td>F</td>
   <td>It contains name of the service for task.<br /> </td>
  </tr>
  <tr>
   <td>serviceTitle<br /> </td>
   <td>F</td>
   <td>It contains title of the service for task.<br /> </td>
  </tr>
  <tr>
   <td>status<br /> </td>
   <td>F</td>
   <td>1 = Created (Task is created from start point.)<br /> 2 = Created and Saved (Task is created from start point and saved.)<br /> 3 = Assigned (Task is assigned to the user after process has been started.)<br /> 4 = Assigned and Saved (Task is assigned and saved.)<br /> 100 = Completed (Task is completed.)<br /> 101 = Deadlined (Task has reached the deadline.)<br /> 102 = Terminated<br /> </td>
  </tr>
  <tr>
   <td>stepName<br /> </td>
   <td>F</td>
   <td>It contains name of the task set during process designing.<br /> </td>
  </tr>
  <tr>
   <td>summaryUrl<br /> </td>
   <td>F</td>
   <td>It contains task summary url.<br /> </td>
  </tr>
  <tr>
   <td>taskACL<br /> </td>
   <td>F</td>
   <td>It is access control list for a task.<br /> </td>
  </tr>
  <tr>
   <td>taskId<br /> </td>
   <td>F</td>
   <td>Id of a task.<br /> </td>
  </tr>
  <tr>
   <td>updateTime<br /> </td>
   <td>F</td>
   <td>Time stamp when task was last updated.<br /> </td>
  </tr>
  <tr>
   <td>formUrl<br /> </td>
   <td>T</td>
   <td>It contains url of form for a task.<br /> </td>
  </tr>
  <tr>
   <td>taskFormType<br /> </td>
   <td>T</td>
   <td>It contains task form type. Using this field, task is rendered on client as pdf for, swf form, and so on.<br /> </td>
  </tr>
  <tr>
   <td>showDirectActions<br /> </td>
   <td>T</td>
   <td>If true, route actions are visible in workspace.<br /> </td>
  </tr>
  <tr>
   <td>showACLActions<br /> </td>
   <td>T</td>
   <td>If true, actions like forward, consult, share are visible in workspace.<br /> </td>
  </tr>
  <tr>
   <td>supportsOffline<br /> </td>
   <td>T</td>
   <td>If true, form can be taken offline. This is for pdf forms only.<br /> </td>
  </tr>
  <tr>
   <td>supportsSave<br /> </td>
   <td>T</td>
   <td>If true, user can save task.<br /> </td>
  </tr>
  <tr>
   <td>readerSubmitOptions<br /> </td>
   <td>T</td>
   <td>This object contains options which are used to submit pdf forms via reader in case when pdf form contains no submit button.<br /> </td>
  </tr>
  <tr>
   <td>isDefaultImage<br /> </td>
   <td>T</td>
   <td>Denotes whether there is an image specified for process or not. True if there is no image associated with process else false.<br /> </td>
  </tr>
  <tr>
   <td>historyTaskList<br /> </td>
   <td>T</td>
   <td>It contains list of tasks which are used in history tab of task details.<br /> </td>
  </tr>
  <tr>
   <td>isOwner<br /> </td>
   <td>T</td>
   <td>True if logged in user is owner of task.<br /> </td>
  </tr>
  <tr>
   <td>availableCommands<br /> </td>
   <td>T</td>
   <td>It contains all actions that can be taken on task.<br /> </td>
  </tr>
  <tr>
   <td>availableCommands.directCommands<br /> </td>
   <td>T</td>
   <td>It contains all route actions that are available for a task.<br /> </td>
  </tr>
  <tr>
   <td>availableCommands.taskACLCommands<br /> </td>
   <td>T</td>
   <td>It contains commands like forward, share and consult if available for a task.<br /> </td>
  </tr>
  <tr>
   <td>availableCommands.otherCommands<br /> </td>
   <td>T</td>
   <td>It contains commands like lock, unlock, abandon, return, claim, and so on, as available.<br /> </td>
  </tr>
  <tr>
   <td>processInstanceInfo<br /> </td>
   <td>T</td>
   <td>It contains information about task's process instance.<br /> </td>
  </tr>
  <tr>
   <td>processVariables<br /> </td>
   <td>T<br /> </td>
   <td>It contains array of objects of process variables if present.<br /> </td>
  </tr>
  <tr>
   <td>pendingTasks<br /> </td>
   <td>T</td>
   <td>It contains list of pending tasks for the task's process instance.<br /> </td>
  </tr>
  <tr>
   <td>userActions<br /> </td>
   <td>T</td>
   <td>It is array of objects. Each object contains details about route and its corresponding confirmation message if present.<br /> </td>
  </tr>
  <tr>
   <td>dataUrl<br /> </td>
   <td>T</td>
   <td>It is url for the data of the form of a task.<br /> </td>
  </tr>
  <tr>
   <td>externalAppConfig<br /> </td>
   <td>T</td>
   <td>This is configuration for third-party application forms.<br /> </td>
  </tr>
  <tr>
   <td>submitted<br /> </td>
   <td>T</td>
   <td>True if task is submitted.<br /> </td>
  </tr>
  <tr>
   <td>attachments<br /> </td>
   <td>T</td>
   <td>List of attachment for a task.<br /> </td>
  </tr>
  <tr>
   <td>assignments<br /> </td>
   <td>T</td>
   <td>List of assignments of a task.<br /> </td>
  </tr>
 </tbody>
</table>

1. Filter

   Filter is basically queue of user or group. When a task is assigned to user/group, the task is added in corresponding queue.

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Client Only</strong></td>
   <td><strong>Comments</strong></td>
  </tr>
  <tr>
   <td>isDefault <br type="_moz" /> </td>
   <td>F</td>
   <td>True if queue is default queue of the logged in user, else false.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>name<br type="_moz" /> </td>
   <td>F</td>
   <td>Name of the owner of the queue.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>qid</td>
   <td>F</td>
   <td>Id of the queue.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>type</td>
   <td>F</td>
   <td>It contains type of the queue.<br /> 0 - User queue.<br /> 1. Shared Queue.<br /> 2. Group Queue.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>query</td>
   <td>T</td>
   <td>This contains query associated with a filter. This query is used to search tasks from complete tasklist.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>tasks</td>
   <td>T</td>
   <td>It contains list of all tasks that belongs to a filter.<br type="_moz" /> </td>
  </tr>
 </tbody>
</table>

1. Out-of-Office

   You can manage your out-of-office schedule and control the flow of tasks assigned to you in your absence.

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong><br type="_moz" /> </td>
   <td><strong>Client Only</strong><br type="_moz" /> </td>
   <td><strong>Comments</strong><br type="_moz" /> </td>
  </tr>
  <tr>
   <td>dateRanges<br type="_moz" /> </td>
   <td>F</td>
   <td>It contains array objects of out-of-office schedules of a user. In each schedule object, startDate field contains schedule's start date andendDate field contains schedule's end date. If endDate is null in schedule, it implies that user has not scheduled the end date of out-of-office schedule.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>isNoPrimaryDesignate<br type="_moz" /> </td>
   <td>F</td>
   <td>True if there is no primary designate in case if user is out-of-office.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>isOutOfOffice<br type="_moz" /> </td>
   <td>F</td>
   <td>True if user is out-of-office.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>outOfOfficeDesignate<br type="_moz" /> </td>
   <td>F</td>
   <td>It contains details of user who is assigned as primary designate by user.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>processSpecificDesignates<br type="_moz" /> </td>
   <td>F</td>
   <td>It contains array of objects for process-specific out-of-office designate. In each process-specific designate object, processName contains the name of the process, isNotDesignated is true if no user is assigned for corresponding process, and userDesignated is null if no user assigned else details of the user assigned for corresponding process.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>processes<br type="_moz" /> </td>
   <td>T</td>
   <td>It contains a list of all processes that are available to the user.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>initialOutOfOfficeSettings<br type="_moz" /> </td>
   <td>T</td>
   <td>It contains initial out-of-office settings of user which are fetched initially.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>outOfOfficeSettings<br type="_moz" /> </td>
   <td>T</td>
   <td>It contains modified out-of-office settings.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>userSearchHistory<br type="_moz" /> </td>
   <td>T</td>
   <td>It contains a list of users that are searched by a logged in user until date.<br type="_moz" /> </td>
  </tr>
 </tbody>
</table>

1. Process Instance

   A process instance is created when a process is invoked via workspace or workbench.

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Client Only</strong></td>
   <td><strong>Comments</strong></td>
  </tr>
  <tr>
   <td>description<br type="_moz" /> </td>
   <td>F</td>
   <td>Description of process instance<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>initiator</td>
   <td>F</td>
   <td>Name of initiator of a process instance.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>initiatorId</td>
   <td>F</td>
   <td>ID of initiator of process instance.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>processCompleteTime<br type="_moz" /> </td>
   <td>F</td>
   <td>Time stamp when process completed.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>processInstanceId<br type="_moz" /> </td>
   <td>F</td>
   <td>ID of process instance.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>processInstanceStatus<br type="_moz" /> </td>
   <td>F</td>
   <td>0 = Initiated<br /> 1 = Running<br /> 2 = Complete<br /> 3 = Completing<br /> 4 = Terminated<br /> 5 = Terminating<br /> 6 = Suspended<br /> 7 = Suspending<br /> 8 = Unsuspending<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>processName<br type="_moz" /> </td>
   <td>F</td>
   <td>Name of the process.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>processStartTime<br type="_moz" /> </td>
   <td>F</td>
   <td>Time stamp when process started.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>processVariables<br type="_moz" /> </td>
   <td>F</td>
   <td>Array of objects of process variables. Each process variable object contains name which is name of process variable, value which is value of process variable and type which is type of process variable.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>tasklist<br type="_moz" /> </td>
   <td>T</td>
   <td>Tasks generated by this process instance.<br type="_moz" /> </td>
  </tr>
 </tbody>
</table>

1. Process Name

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Client Only</strong></td>
   <td><strong>Comments</strong></td>
  </tr>
  <tr>
   <td>processMajorVersion<br type="_moz" /> </td>
   <td>F</td>
   <td>Major version of a process.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>processMinorVersion<br type="_moz" /> </td>
   <td>F</td>
   <td>Minor version of a process.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>processName<br type="_moz" /> </td>
   <td>F</td>
   <td>Name of the process.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>processTitle<br type="_moz" /> </td>
   <td>F</td>
   <td>Title of the process.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>processInstanceList<br type="_moz" /> </td>
   <td>T</td>
   <td>List of process instances for this process.<br type="_moz" /> </td>
  </tr>
 </tbody>
</table>

1. Task Assignment Object

   Task assignment object contains information about the assignment of task. Following are the properties of task's assignment.

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Client Only</strong></td>
   <td><strong>Comments</strong></td>
  </tr>
  <tr>
   <td>assignmentCreateTime<br type="_moz" /> </td>
   <td>F</td>
   <td>Time stamp when this assignment of a task is created.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>assignmentType<br type="_moz" /> </td>
   <td>F</td>
   <td>0 = Initial Assignment<br /> 1 = Forward (Task has been forwarded to current owner of task.)<br /> 2 = Returned (Task has been returned to current owner of task by previous owner of task.)<br /> 3 = Claimed (Task has been claimed by current owner of task.)<br /> 4 = Escalation (Task has been assigned to current owner of task after escalation.)<br /> 5 = Administrator Assigned (Task has been assigned by administrator to current owner of task.)<br /> 6 = Consulted ( Task has been consulted to current owner of task.)<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>assignmentUpdateTime<br type="_moz" /> </td>
   <td>F</td>
   <td>Time stamp when this assignment of a task is updated.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>queueId<br type="_moz" /> </td>
   <td>F</td>
   <td>ID of Queue of current owner of task.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>queueOwner<br type="_moz" /> </td>
   <td>F</td>
   <td>Name of current owner of task.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>queueOwnerId<br type="_moz" /> </td>
   <td>F</td>
   <td>ID of current owner of task.<br type="_moz" /> </td>
  </tr>
 </tbody>
</table>

1. Task ACL Object

   Task ACL object contains information about permissions like forward, share, consult, and so on, of a task. Following are the properties of task's ACL.

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Client Only</strong></td>
   <td><strong>Comments</strong></td>
  </tr>
  <tr>
   <td>canAddAttachments<br type="_moz" /> </td>
   <td>F</td>
   <td>If true, attachments can be added to task.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>canAddNotes<br type="_moz" /> </td>
   <td>F</td>
   <td>If true, notes can be added to task.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>canClaim<br type="_moz" /> </td>
   <td>F</td>
   <td>If true, task can be claimed.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>canConsult<br type="_moz" /> </td>
   <td>F</td>
   <td>If true, task can be consulted.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>canForward<br type="_moz" /> </td>
   <td>F</td>
   <td>If true, task can be forwarded.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>canShare<br type="_moz" /> </td>
   <td>F</td>
   <td>If true, task can be shared.<br type="_moz" /> </td>
  </tr>
 </tbody>
</table>

1. Task Attachment

   Attachments can be added to a task. Attachment can be of type attachment and note. Following are the properties of attachment object.

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Client Only</strong></td>
   <td><strong>Comments</strong></td>
  </tr>
  <tr>
   <td>creationDate<br type="_moz" /> </td>
   <td>F</td>
   <td>Time stamp when attachment created.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>creatorId<br type="_moz" /> </td>
   <td>F</td>
   <td>ID of user who added the attachment.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>creatorName<br type="_moz" /> </td>
   <td>F</td>
   <td>Name of the user who added the attachment.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>description<br type="_moz" /> </td>
   <td>F</td>
   <td>Description of the attachment.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>fileName<br type="_moz" /> </td>
   <td>F</td>
   <td>Name of attachment.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>id<br type="_moz" /> </td>
   <td>F</td>
   <td>ID of attachment.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>lastModifiedDate<br type="_moz" /> </td>
   <td>F</td>
   <td>Time stamp when attachment last modified.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>noteExtended<br type="_moz" /> </td>
   <td>F</td>
   <td>If true, note is an extended (long) note.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>permissions<br type="_moz" /> </td>
   <td>F</td>
   <td>Permissions associated with an attachment. allowRead field is for read permission, allowWrite is for write permission, allowDelete is for delete permission.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>size<br type="_moz" /> </td>
   <td>F</td>
   <td>Size of the attachment in bytes.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>taskId<br type="_moz" /> </td>
   <td>F</td>
   <td>ID of task to which attachment is added.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>type<br type="_moz" /> </td>
   <td>F</td>
   <td>Type is attachment for files and Type is note for notes.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>formattedCreationDate<br type="_moz" /> </td>
   <td>T</td>
   <td>It contains attachment creation date according to user's UI settings.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>formattedDescription<br type="_moz" /> </td>
   <td>T</td>
   <td>Formatted Attachment description. Used to display special characters present in attachment description in AEM Forms workspace.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>formattedFileName<br type="_moz" /> </td>
   <td>T</td>
   <td>Formatted Attachment Name. Used to display special characters present in attachment name in AEM Forms workspace. This is for notes only.<br type="_moz" /> </td>
  </tr>
 </tbody>
</table>

1. User

   Following are the properties of user object.

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Client Only</strong></td>
   <td><strong>Comments</strong></td>
  </tr>
  <tr>
   <td>address<br type="_moz" /> </td>
   <td>F</td>
   <td>Address of the user.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>commonName<br type="_moz" /> </td>
   <td>F</td>
   <td>Common name of the user.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>description<br type="_moz" /> </td>
   <td>F</td>
   <td>Description of the user.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>directGroupMemberships<br type="_moz" /> </td>
   <td>F</td>
   <td>List of user's group.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>displayName<br type="_moz" /> </td>
   <td>F</td>
   <td>Display name of the user.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>email<br type="_moz" /> </td>
   <td>F</td>
   <td>Email ID of the user.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>isOutOfOffice<br type="_moz" /> </td>
   <td>F</td>
   <td>True if user is out-of-office.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>lastName<br type="_moz" /> </td>
   <td>F</td>
   <td>Last name of the user.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>firstName<br type="_moz" /> </td>
   <td>F</td>
   <td>First name of the user.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>oid<br type="_moz" /> </td>
   <td>F</td>
   <td>ID of the user.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>org<br type="_moz" /> </td>
   <td>F</td>
   <td>Name of organization of the user.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>postalAddress<br type="_moz" /> </td>
   <td>F</td>
   <td>Postal address of the user.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>telephone<br type="_moz" /> </td>
   <td>F</td>
   <td>Contact number of the user.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>telephoneNumber<br type="_moz" /> </td>
   <td>F</td>
   <td>Contact number of the user.<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>userid<br type="_moz" /> </td>
   <td>F</td>
   <td>Log in id of the user.<br type="_moz" /> </td>
  </tr>
 </tbody>
</table>

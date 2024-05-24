---
title: Description of reusable components
description: A complete list of reusable components with filenames and dependencies, to help you integrate AEM Forms workspace component in your web applications.
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
exl-id: b8cb7233-3d9e-41d4-85c5-8e8c2481f89c
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: Admin, User, Developer
---
# Description of reusable components {#description-of-reusable-components}

AEM Forms workspace is composed of [reusable](/help/forms/using/integrating-html-ws-components-web.md) components which are organized in a specific [folder structure](/help/forms/using/folder-structure.md) in CRX™. Each component has model, view, and template file at location specified in the folder structure, JavaScript™ dependencies on other component files, events listened by the component and JavaScript objects which trigger these events in AEM Forms workspace. The complete list of reusable components with constituent filenames and dependencies is given here.

## TaskList {#tasklist}

<table>
 <tbody>
  <tr>
   <td><p>Model</p></td>
   <td><p>tasklist.js</p></td>
  </tr>
  <tr>
   <td><p>View</p></td>
   <td><p>tasklist.js</p></td>
  </tr>
  <tr>
   <td><p>Template</p></td>
   <td><p>tasklist.html</p></td>
  </tr>
  <tr>
   <td><p>Requires components</p></td>
   <td>
    <ul>
     <li><p>UserSearch</p></li>
     <li><p>Task</p></li>
     <li><p>Teamtask</p></li>
    </ul></td>
  </tr>
  <tr>
   <td><p>JS dependencies</p></td>
   <td>
    <ul>
     <li><p>task model</p></li>
     <li><p>teamtask model</p></li>
    </ul></td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p></td>
   <td>
    <ul>
     <li><p>filterSelected - tasklist model</p></li>
     <li><p>remove - tasklist model</p></li>
     <li><p>updateQueue - tasklist model</p></li>
    </ul></td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>This component can be used independently of AEM Forms workspace, provided you trigger filterSelected event for this component from your custom application.

## Task {#task}

<table>
 <tbody>
  <tr>
   <td><p>Model</p></td>
   <td><p>task.js</p></td>
  </tr>
  <tr>
   <td><p>View</p></td>
   <td><p>task.js</p></td>
  </tr>
  <tr>
   <td><p>Template</p></td>
   <td><p>task.html</p></td>
  </tr>
  <tr>
   <td><p>Requires components</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>JS dependencies</p></td>
   <td>
    <ul>
     <li><p>tasklist model</p></li>
     <li><p>taskactions utility</p></li>
    </ul></td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p></td>
   <td>
    <ul>
     <li><p>submitComplete - task model</p></li>
     <li><p>Reject - task model</p></li>
    </ul></td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>Workspace calls fetchTasks function of TaskList model to create Task models for this component.

## FilterList {#filterlist}

<table>
 <tbody>
  <tr>
   <td><p>Model</p></td>
   <td><p>tasklist.js</p></td>
  </tr>
  <tr>
   <td><p>View</p></td>
   <td><p>filterlist.js</p></td>
  </tr>
  <tr>
   <td><p>Template</p></td>
   <td><p>filterlist.html</p></td>
  </tr>
  <tr>
   <td><p>Requires components</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>JS dependencies</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p></td>
   <td>
    <ul>
     <li><p>fetched - tasklist model </p></li>
     <li><p>remove - tasklist model </p></li>
     <li><p>updateQueue - tasklist model </p></li>
     <li><p>refreshedQueue - tasklist model </p></li>
     <li><p>filterSelected - tasklist model</p></li>
    </ul></td>
  </tr>
 </tbody>
</table>

## Filter {#filter}

<table>
 <tbody>
  <tr>
   <td><p>View</p> </td>
   <td><p>filter.js</p> </td>
  </tr>
  <tr>
   <td><p>Template</p> </td>
   <td><p>filter.html</p> </td>
  </tr>
  <tr>
   <td><p>Requires components</p> </td>
   <td><p>NA</p> </td>
  </tr>
  <tr>
   <td><p>JS dependencies</p> </td>
   <td>
    <ul>
     <li><p>Field: queue: { name, qid, isDefault, type}</p> </li>
     <li><p>Field: query: string</p> </li>
     <li><p>Field: parentView: filterlist view</p> </li>
     <li><p>Field: parentModel: tasklist model</p> </li>
     <li><p>Field: utility</p> </li>
    </ul> </td>
  </tr>
  <tr>
   <td><p>Events listened</p> </td>
   <td><p>NA</p> </td>
  </tr>
 </tbody>
</table>

## TeamQueues {#teamqueues}

<table>
 <tbody>
  <tr>
   <td><p>Model</p></td>
   <td><p>tasklist.js</p></td>
  </tr>
  <tr>
   <td><p>View</p></td>
   <td><p>teamqueues.js</p></td>
  </tr>
  <tr>
   <td><p>Template</p></td>
   <td><p>teamqueues.html</p></td>
  </tr>
  <tr>
   <td><p>Requires components</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>JS dependencies</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p></td>
   <td>
    <ul>
     <li><p>fetched - tasklist model </p></li>
     <li><p>remove - tasklist model </p></li>
     <li><p>updateQueue - tasklist model </p></li>
     <li><p>teamQueuesFetched - tasklist model </p></li>
    </ul></td>
  </tr>
 </tbody>
</table>

## TeamFilter {#teamfilter}

<table>
 <tbody>
  <tr>
   <td><p>Model</p> </td>
   <td><p>NA</p> </td>
  </tr>
  <tr>
   <td><p>View</p> </td>
   <td><p>teamfilter.js</p> </td>
  </tr>
  <tr>
   <td><p>Template</p> </td>
   <td><p>teamfilter.html</p> </td>
  </tr>
  <tr>
   <td><p>Requires components</p> </td>
   <td><p>NA</p> </td>
  </tr>
  <tr>
   <td><p>JS dependencies</p> </td>
   <td>
    <ul>
     <li><p>Extends : filter view</p> </li>
     <li><p>Field : queue :{ name, qid, isDefault, type }</p> </li>
     <li><p>Field : query : string</p> </li>
     <li><p>Field : parentView : filterlist view</p> </li>
     <li><p>Field : parentModel : tasklist model</p> </li>
     <li><p>Field : utility</p> </li>
    </ul> </td>
  </tr>
  <tr>
   <td><p>Events listened</p> </td>
   <td><p>NA</p> </td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>TeamFilter gets the event indicating which task has been selected from TaskList component. Although these components share the model class, there is no other dependency.

## TaskDetails {#taskdetails}

<table>
 <tbody>
  <tr>
   <td><p>Model</p> </td>
   <td><p>tasklist.js</p> </td>
  </tr>
  <tr>
   <td><p>View</p> </td>
   <td><p>taskdetails.js</p> </td>
  </tr>
  <tr>
   <td><p>Template</p> </td>
   <td><p>taskdetails.html</p> </td>
  </tr>
  <tr>
   <td><p>Requires components</p> </td>
   <td><p>Most of the Utility classes</p> </td>
  </tr>
  <tr>
   <td><p>JS dependencies</p> </td>
   <td>
    <ul>
     <li><p>processinstancehistory.html</p> </li>
     <li><p>formrendering utility</p> </li>
     <li><p>notes utility</p> </li>
     <li><p>attachments utility</p> </li>
     <li><p>taskactions utility</p> </li>
     <li><p>history utility</p> </li>
    </ul> </td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p> </td>
   <td>
    <ul>
     <li><p>forwarded - task model</p> </li>
     <li><p>shared - task model</p> </li>
     <li><p>consulted - task model</p> </li>
     <li><p>rejected - task model</p> </li>
     <li><p>abandoned - task model</p> </li>
     <li><p>unlocked - task model</p> </li>
     <li><p>locked - task model</p> </li>
     <li><p>claimed - task model</p> </li>
     <li><p>change:taskselected - tasklist model</p> </li>
     <li><p>change:formUrl - task model</p> </li>
     <li>attachmentURLFetched - task model</li>
    </ul>
    <ul>
     <li>newAttachment - task model</li>
     <li><p>taskHistoryFetched - task model</p> </li>
     <li>prepareForSubmitComplete - task model</li>
     <li><p>submitComplete - task model</p> </li>
    </ul> </td>
  </tr>
 </tbody>
</table>

## CategoryList {#categorylist}

<table>
 <tbody>
  <tr>
   <td><p>Model</p></td>
   <td><p>categorylist.js</p></td>
  </tr>
  <tr>
   <td><p>View</p></td>
   <td><p>categorylist.js</p></td>
  </tr>
  <tr>
   <td><p>Template</p></td>
   <td><p>startprocess.html (in the route folder)</p></td>
  </tr>
  <tr>
   <td><p>Requires components</p></td>
   <td><p>Category</p></td>
  </tr>
  <tr>
   <td><p>JS dependencies</p></td>
   <td>
    <ul>
     <li><p>favoritecategoryfactory model</p></li>
     <li><p>allcategoryfactory model</p></li>
    </ul></td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p></td>
   <td>
    <ul>
     <li><p>allStartpointsFetched - categorylist model </p></li>
     <li><p>add - categorylist model </p></li>
    </ul></td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>This component uses model classes of some other components like StartPointList, StartPoint, and Task. Besides this dependency, CategoryList can be used independently.

## Category {#category}

<table>
 <tbody>
  <tr>
   <td><p>Model</p></td>
   <td><p>category.js</p></td>
  </tr>
  <tr>
   <td><p>View</p></td>
   <td><p>category.js</p></td>
  </tr>
  <tr>
   <td><p>Template</p></td>
   <td><p>category.html</p></td>
  </tr>
  <tr>
   <td><p>Requires components</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>JS dependencies</p></td>
   <td>
    <ul>
     <li><p>categorylist model</p></li>
     <li><p>startpointlist model</p></li>
    </ul></td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p></td>
   <td>
    <ul>
     <li><p>changed - category model </p></li>
     <li><p>childrenFetched - category model </p></li>
     <li><p>category:selected - categorylist model </p></li>
    </ul></td>
  </tr>
 </tbody>
</table>

## StartPointList {#startpointlist}

<table>
 <tbody>
  <tr>
   <td><p>Model</p></td>
   <td><p>categorylist.js</p></td>
  </tr>
  <tr>
   <td><p>View</p></td>
   <td><p>startpointlist.js</p></td>
  </tr>
  <tr>
   <td><p>Template</p></td>
   <td><p>startprocess.html (in the route folder)</p></td>
  </tr>
  <tr>
   <td><p>Requires components</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>JS dependencies</p></td>
   <td>
    <ul>
     <li><p>category model</p></li>
     <li><p>favoritecategoryfactory model</p></li>
     <li><p>allcategoryfactory model</p></li>
     <li><p>startpoint view</p></li>
     <li><p>startpointlist model</p></li>
     <li><p>startpoint model</p></li>
     <li><p>task model</p></li>
     <li><p>task model</p></li>
     <li><p>tasklist model</p></li>
     <li><p>teamtask model</p></li>
    </ul></td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p></td>
   <td>
    <ul>
     <li><p>category:selected - categorylist model </p></li>
     <li><p>allStartpointsFetched - categorylist model </p></li>
    </ul></td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>StartPointList and CategoryList components share the model class, hence the former depends on the latter. CategoryList accesses the information about which category's start points are shown. To use StartPointList independently, simulate the event trigger from CategoryList.

## StartPoint {#startpoint}

<table>
 <tbody>
  <tr>
   <td><p>Model</p></td>
   <td><p>startpoint.js</p></td>
  </tr>
  <tr>
   <td><p>View</p></td>
   <td><p>startpoint.js</p></td>
  </tr>
  <tr>
   <td><p>Template</p></td>
   <td><p>startpoint.html</p></td>
  </tr>
  <tr>
   <td><p>Requires components</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>JS dependencies</p></td>
   <td><p>task model</p></td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p></td>
   <td><p>change - startpoint model </p></td>
  </tr>
 </tbody>
</table>

## StartProcess {#startprocess}

<table>
 <tbody>
  <tr>
   <td><p>Model</p> </td>
   <td><p>categorylist.js</p> </td>
  </tr>
  <tr>
   <td><p>View</p> </td>
   <td><p>startprocess.js</p> </td>
  </tr>
  <tr>
   <td><p>Template</p> </td>
   <td><p>startprocess.html</p> </td>
  </tr>
  <tr>
   <td><p>Requires components</p> </td>
   <td>
    <ul>
     <li><p>Most of the Utility classes</p> </li>
     <li><p>UserSearch</p> </li>
    </ul> </td>
  </tr>
  <tr>
   <td><p>JS dependencies</p> </td>
   <td>
    <ul>
     <li><p>category model</p> </li>
     <li><p>favoritecategoryfactory model</p> </li>
     <li><p>allcategoryfactory model</p> </li>
     <li><p>formrendering utility</p> </li>
     <li><p>notes utility</p> </li>
     <li><p>attachments utility</p> </li>
     <li><p>taskactions utility</p> </li>
    </ul> </td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p> </td>
   <td>
    <ul>
     <li><p>category:selected - categorylist model</p> </li>
     <li><p>change:invokedTask - startpointlist model</p> </li>
     <li><p>change:formUrl - task model</p> </li>
     <li><p>startpoint:selected - startpointlist model</p> </li>
     <li><p>forwarded - task model</p> </li>
     <li><p>abandoned - task model</p> </li>
     <li><p>unlocked - task model</p> </li>
     <li><p>locked - task model</p> </li>
     <li>attachmentURLFetched - task model</li>
     <li>newAttachment - task model</li>
     <li>prepareForSubmitComplete - task model </li>
     <li><p>submitComplete - task model</p> </li>
     <li><p>allStartpointsFetched - categorylist model</p> </li>
    </ul> </td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>StartProcess and StartPointList components share the model class. This component becomes relevant you select a startpoint from StartPointList.

## ProcessNameList {#processnamelist}

<table>
 <tbody>
  <tr>
   <td><p>Model</p></td>
   <td><p>processnamelist.js</p></td>
  </tr>
  <tr>
   <td><p>View</p></td>
   <td><p>processnamelist.js</p></td>
  </tr>
  <tr>
   <td><p>Template</p></td>
   <td><p>tracking.html (in the route folder)</p></td>
  </tr>
  <tr>
   <td><p>Requires components</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>JS dependencies</p></td>
   <td><p>processname model</p></td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p></td>
   <td>
    <ul>
     <li><p>add - processnamelist model </p></li>
     <li><p>fetched:processnames - processnamelist model </p></li>
     <li><p>change - processnamelist model </p></li>
    </ul></td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>ProcessNameList does not depend on other components. However, internally it depends on ProcessInstanceList model class that in turn depends on other components. Hence, ProcessNameList uses many model classes like ProcessInstanceList, ProcessInstance, TaskList, Teamtask, and Task. Besides these dependencies, ProcessNameList can be used independently.

## ProcessName {#processname}

<table>
 <tbody>
  <tr>
   <td><p>Model</p></td>
   <td><p>processname.js</p></td>
  </tr>
  <tr>
   <td><p>View</p></td>
   <td><p>processname (in processnamelist.js)</p></td>
  </tr>
  <tr>
   <td><p>Template</p></td>
   <td><p>processname.html</p></td>
  </tr>
  <tr>
   <td><p>Requires components</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>JS dependencies</p></td>
   <td><p>processinstancelist model</p></td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p></td>
   <td><p>change - processname model </p></td>
  </tr>
 </tbody>
</table>

## ProcessInstanceList {#processinstancelist}

<table>
 <tbody>
  <tr>
   <td><p>Model</p></td>
   <td><p>processnamelist.js</p></td>
  </tr>
  <tr>
   <td><p>View</p></td>
   <td><p>processinstancelist.js</p></td>
  </tr>
  <tr>
   <td><p>Template</p></td>
   <td><p>tracking.html (in the route folder)</p></td>
  </tr>
  <tr>
   <td><p>Requires components</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>JS dependencies</p></td>
   <td><p>processname model</p></td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p></td>
   <td>
    <ul>
     <li><p>processname:selected - processnamelist model </p></li>
     <li><p>processname:instancesfetched - processnamelist model </p></li>
    </ul></td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>ProcessInstanceList expects an event from ProcessNameList indicating the process name for fetching and displaying instances. To use ProcessInstanceList independently, simulate the event trigger separately.

## ProcessInstance {#processinstance}

<table>
 <tbody>
  <tr>
   <td><p>Model</p></td>
   <td><p>processinstance.js</p></td>
  </tr>
  <tr>
   <td><p>View</p></td>
   <td><p>processname inside processnamelist.js</p></td>
  </tr>
  <tr>
   <td><p>Template</p></td>
   <td><p>processinstance.html</p></td>
  </tr>
  <tr>
   <td><p>Requires components</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>JS dependencies</p></td>
   <td><p>tasklist model</p></td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p></td>
   <td><p>change - processinstance model </p></td>
  </tr>
 </tbody>
</table>

## ProcessInstanceHistory {#processinstancehistory}

<table>
 <tbody>
  <tr>
   <td><p>Model</p></td>
   <td><p>processnamelist.js</p></td>
  </tr>
  <tr>
   <td><p>View</p></td>
   <td><p>processinstancehistory.js</p></td>
  </tr>
  <tr>
   <td><p>Template</p></td>
   <td><p>processinstancehistory.html</p></td>
  </tr>
  <tr>
   <td><p>Requires components</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>JS dependencies</p></td>
   <td>
    <ul>
     <li><p>processname model</p></li>
     <li><p>history utility</p></li>
    </ul></td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p></td>
   <td>
    <ul>
     <li><p>processname:selected - processnamelist model </p></li>
     <li><p>processinstance:selected - processinstancelist model </p></li>
     <li><p>tasksFetched - processinstance model </p></li>
    </ul></td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>ProcessInstanceHistory expects an event from ProcessInstanceList indicating which process instance's history is to be shown. Besides this dependency the component can be used independently.

## OutofOffice {#outofoffice}

<table>
 <tbody>
  <tr>
   <td><p>Model</p> </td>
   <td><p>outofoffice.js</p> </td>
  </tr>
  <tr>
   <td><p>View</p> </td>
   <td><p>outofoffice.js</p> </td>
  </tr>
  <tr>
   <td><p>Template</p> </td>
   <td><p>outofoffice.html</p> </td>
  </tr>
  <tr>
   <td><p>Requires components</p> </td>
   <td><p>UserSearch</p> </td>
  </tr>
  <tr>
   <td><p>JS dependencies</p> </td>
   <td><p>usersearch view</p> </td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p> </td>
   <td>
    <ul>
     <li><p>outOfOfficeSettingsFetched - outofoffice model</p> </li>
     <li><p>outOfOfficeSettingsSaved - outofoffice model</p> </li>
     <li><p>processesFetched - outofoffice model</p> </li>
     <li><p>principalSelected - principalsearch view</p> </li>
    </ul> </td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>OutofOffice can be used independently.

## ShareQueue {#sharequeue}

<table>
 <tbody>
  <tr>
   <td><p>Model</p> </td>
   <td><p>sharequeue.js</p> </td>
  </tr>
  <tr>
   <td><p>View</p> </td>
   <td><p>sharequeue.js</p> </td>
  </tr>
  <tr>
   <td><p>Template</p> </td>
   <td><p>sharequeue.html</p> </td>
  </tr>
  <tr>
   <td><p>Requires components</p> </td>
   <td><p>UserSearch</p> </td>
  </tr>
  <tr>
   <td><p>JS dependencies</p> </td>
   <td><p>usersearch view</p> </td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p> </td>
   <td>
    <ul>
     <li><p>queueAccessGranted - sharequeue model</p> </li>
     <li><p>queueAccessRequested - sharequeue model</p> </li>
     <li><p>grantedUsersFetched - sharequeue model</p> </li>
     <li>accessibleUsersFetched - sharequeue model</li>
     <li><p>queueAccessRevoked - sharequeue model</p> </li>
     <li><p>queueAccessRemoved - sharequeue model</p> </li>
     <li><p>principalSelected - principalsearch view</p> </li>
    </ul> </td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>ShareQueue can be used independently.

## UISettings {#uisettings}

<table>
 <tbody>
  <tr>
   <td><p>Model</p></td>
   <td><p>uisettings.js</p></td>
  </tr>
  <tr>
   <td><p>View</p></td>
   <td><p>uisettings.js</p></td>
  </tr>
  <tr>
   <td><p>Template</p></td>
   <td><p>uisettings.html</p></td>
  </tr>
  <tr>
   <td><p>Requires components</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>JS dependencies</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p></td>
   <td>
    <ul>
     <li><p>preferencesFetched - uisettings model </p></li>
     <li><p>settingUpdated - uisettings model </p></li>
    </ul></td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>UISettings can be used independently.

## AppNavigation {#appnavigation}

<table>
 <tbody>
  <tr>
   <td><p>Model</p></td>
   <td><p>appnavigation.js</p></td>
  </tr>
  <tr>
   <td><p>View</p></td>
   <td><p>appnavigation.js</p></td>
  </tr>
  <tr>
   <td><p>Template</p></td>
   <td><p>appnavigation.html</p></td>
  </tr>
  <tr>
   <td><p>Requires components</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>JS dependencies</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>Events listened</p></td>
   <td><p>NA</p></td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>AppNavigation can be used independently.

## UserInfo {#userinfo}

<table>
 <tbody>
  <tr>
   <td><p>Model</p> </td>
   <td><p>userinfo.js</p> </td>
  </tr>
  <tr>
   <td><p>View</p> </td>
   <td><p>userinfo.js</p> </td>
  </tr>
  <tr>
   <td><p>Template</p> </td>
   <td><p>userinfo.html</p> </td>
  </tr>
  <tr>
   <td><p>Requires components</p> </td>
   <td><p>NA</p> </td>
  </tr>
  <tr>
   <td><p>JS dependencies</p> </td>
   <td><p>NA</p> </td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p> </td>
   <td>
    <ul>
     <li>userImageUrlFetched - userinfo model</li>
     <li>sessionRenewed - userinfo model <br /> </li>
     <li>sessionExpired - userinfo model </li>
    </ul> </td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>UserInfo can be used independently.

## WSError {#wserror}

<table>
 <tbody>
  <tr>
   <td><p>Model</p></td>
   <td><p>wserror.js</p></td>
  </tr>
  <tr>
   <td><p>View</p></td>
   <td><p>wserror.js</p></td>
  </tr>
  <tr>
   <td><p>Template</p></td>
   <td><p>wserror.html</p></td>
  </tr>
  <tr>
   <td><p>Requires components</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>JS dependencies</p></td>
   <td><p>NA</p></td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p></td>
   <td><p>newWsError - wserror model </p></td>
  </tr>
 </tbody>
</table>

## UserSearch {#usersearch}

<table>
 <tbody>
  <tr>
   <td><p>Model</p> </td>
   <td><p>usersearch.js</p> </td>
  </tr>
  <tr>
   <td><p>View</p> </td>
   <td><p>usersearch.js</p> </td>
  </tr>
  <tr>
   <td><p>Template</p> </td>
   <td><p>usersearch.html</p> </td>
  </tr>
  <tr>
   <td><p>Requires components</p> </td>
   <td><p>NA</p> </td>
  </tr>
  <tr>
   <td><p>JS dependencies</p> </td>
   <td><p>NA</p> </td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p> </td>
   <td>
    <ul>
     <li>principalSearched - principalsearch model</li>
     <li>outOfOfficeInfoFetched - usersearch model</li>
    </ul> </td>
  </tr>
 </tbody>
</table>

## SearchTemplate {#searchtemplate}

<table>
 <tbody>
  <tr>
   <td><p>Model</p> </td>
   <td><p>searchtemplate.js</p> </td>
  </tr>
  <tr>
   <td><p>View</p> </td>
   <td><p>searchtemplate (in searchtemplatelist.js) </p> </td>
  </tr>
  <tr>
   <td><p>Template</p> </td>
   <td><p>searchtemplate.html</p> </td>
  </tr>
  <tr>
   <td><p>Requires components</p> </td>
   <td><p>NA</p> </td>
  </tr>
  <tr>
   <td><p>JS dependencies</p> </td>
   <td><p>NA</p> </td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p> </td>
   <td><p>templateFetched- searchtemplate model</p> </td>
  </tr>
 </tbody>
</table>

## SearchTemplateList {#searchtemplatelist}

<table>
 <tbody>
  <tr>
   <td><p>Model</p> </td>
   <td><p>searchtemplatelist.js</p> </td>
  </tr>
  <tr>
   <td><p>View</p> </td>
   <td><p>searchtemplatelist.js</p> </td>
  </tr>
  <tr>
   <td><p>Template</p> </td>
   <td><p>tracking.html (in the route folder)</p> </td>
  </tr>
  <tr>
   <td><p>Requires components</p> </td>
   <td><p>NA</p> </td>
  </tr>
  <tr>
   <td><p>JS dependencies</p> </td>
   <td><p>searchtemplate model</p> </td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p> </td>
   <td><p>change - searchtemplatelist model</p> </td>
  </tr>
 </tbody>
</table>

## SearchTemplateDetails {#searchtemplatedetails}

<table>
 <tbody>
  <tr>
   <td><p>Model</p> </td>
   <td><p>searchtemplatelist.js</p> </td>
  </tr>
  <tr>
   <td><p>View</p> </td>
   <td><p>searchtemplatedetails.js</p> </td>
  </tr>
  <tr>
   <td><p>Template</p> </td>
   <td><p>searchtemplatedetails.html</p> </td>
  </tr>
  <tr>
   <td><p>Requires components</p> </td>
   <td><p>NA</p> </td>
  </tr>
  <tr>
   <td><p>JS dependencies</p> </td>
   <td>NA<br /> </td>
  </tr>
  <tr>
   <td><p>Events listened (Event name - Trigger)</p> </td>
   <td><p>searchTemplate:selected - searchtemplate model</p> </td>
  </tr>
 </tbody>
</table>

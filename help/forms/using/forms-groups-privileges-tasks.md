---
title: AEM Forms on OSGi Groups and Privileges
description: Assign users to groups to manage Adobe Experience Manager (AEM) Forms on OSGi
contentOwner: anujkapo
products: SG_EXPERIENCEMANAGER/6.5/FORMS
content-type: reference
topic-tags: Configuration
docset: aem65
role: Admin,User
exl-id: d802ac53-e3db-45ca-afcb-7e99d0bb7877
solution: Experience Manager, Experience Manager Forms
---
# AEM Forms on OSGi Groups and Privileges{#aem-forms-on-osgi-groups-and-privileges}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/setup-configure-migrate/forms-groups-privileges-tasks.html)                  |
| AEM 6.5     | This article         |

You can [create groups](/help/sites-administering/user-group-ac-admin.md#group-administration) and assign policies and [users](/help/sites-administering/user-group-ac-admin.md#user-administration) to the groups in Adobe Experience Manager (AEM). These policies control the privileges of the users that are part of the group.

After you install the [AEM Forms add-on package](../../forms/using/installing-configuring-aem-forms-osgi.md), the groups mentioned in this article, such as forms-users and forms-power-user, are automatically available for assignment. The following table lists the tasks that a user can perform for AEM Forms on OSGi based on the group assignments:

<table>
 <tbody>
  <tr>
   <td>Group</td> 
   <td>Tasks</td> 
  </tr>
  <tr>
   <td>forms-users <sup>[1]</sup></td> 
   <td>
    <ul> 
     <li>Create, preview, publish, and submit adaptive forms</li> 
     <li>Create, preview, and publish interactive communications and document fragments</li> 
     <li>Upload assets to an AEM instance</li> 
     <li>Create themes</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td>forms-power-users</td> 
   <td>
    <ul> 
     <li>Create, preview, publish, and submit adaptive forms</li> 
     <li>Create, preview, and publish interactive communications and document fragments</li> 
     <li>Create scripts for adaptive forms using a code editor</li> 
     <li>Upload assets including scripts</li> 
     <li>Create themes</li> 
     <li>Import packages containing XDP</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td>forms-submission-reviewers</td> 
   <td>
    <ul> 
     <li>Review submissions</li> 
     <li>Approve or reject submissions</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td>template-authors <sup>[2]</sup></td> 
   <td>
    <ul> 
     <li>Create and preview adaptive forms or interactive communications templates</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><p>fdm-authors</p> </td> 
   <td>
    <ul> 
     <li>Create and modify a form data model</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td>cm-agent-users</td> 
   <td>
    <ul> 
     <li>Access Correspondence Management letters or interactive communications using Agent UI</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><p>workflow-editors</p> </td> 
   <td>
    <ul> 
     <li>Create an inbox application</li> 
     <li>Create a workflow model</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td>workflow-users</td> 
   <td>
    <ul> 
     <li>Use AEM Inbox applications<br /> <strong>Note: </strong>You must have cm-agent-users and workflow-users group assignments to access the Interactive Communications Agent UI in AEM Inbox.</li> 
     <li>Manage workflow instances</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td>fd-administrators</td> 
   <td>
    <ul> 
     <li>Configure PDF Generator</li> 
     <li>Configure the Watched folder</li> 
     <li>Manage workflow applications</li> 
    </ul> </td> 
  </tr>
 </tbody>
</table>

1. The user with forms-users group privileges cannot write scripts for adaptive forms.
1. The user with template-authors group privileges cannot write scripts for templates.

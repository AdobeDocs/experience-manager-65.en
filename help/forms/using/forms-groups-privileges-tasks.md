---
title: AEM Forms on OSGi Groups and Privileges
seo-title: AEM Forms on OSGi Groups and Privileges
description: Assign users to the groups to manage AEM Forms on OSGi
seo-description: Assign users to the groups to manage AEM Forms on OSGi
uuid: f269a206-356d-4cee-b449-05c5da87121a
contentOwner: anujkapo
products: SG_EXPERIENCEMANAGER/6.5/FORMS
content-type: reference
topic-tags: Configuration
discoiquuid: 1717b1b4-1c2a-450e-8e79-4156a974d5fa
docset: aem65

---

# AEM Forms on OSGi Groups and Privileges{#aem-forms-on-osgi-groups-and-privileges}

You can [create groups](/help/sites-administering/user-group-ac-admin.md#group-administration) and assign policies and [users](/help/sites-administering/user-group-ac-admin.md#user-administration) to the groups in AEM. These policies control privileges of the users that are part of the group.

Once you install [AEM Forms add-on package](../../forms/using/installing-configuring-aem-forms-osgi.md), the groups mentioned in this article, such as forms-users and forms-power-user, are automatically available for assignment. The following table lists the tasks a user can perform for AEM Forms on OSGi based on the group assignments:

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
   <td>forms-power-user</td> 
   <td>
    <ul> 
     <li>Create, preview, publish, and submit adaptive forms</li> 
     <li>Create, preview, and publish interactive communications and document fragments</li> 
     <li>Create scripts for adaptive forms using code editor</li> 
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
     <li>Use AEM inbox applications<br /> <strong>Note: </strong>You must have cm-agent-users and workflow-users group assignments to access Interactive Communications Agent UI in AEM inbox.</li> 
     <li>Manage workflow instances</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td>fd-administrators</td> 
   <td>
    <ul> 
     <li>Configure PDF Generator</li> 
     <li>Configure Watched folder</li> 
     <li>Manage workflow applications</li> 
    </ul> </td> 
  </tr>
 </tbody>
</table>

1. The user with forms-users group privileges cannot write scripts for adaptive forms.
1. The user with template-authors group privileges cannot write scripts for templates.


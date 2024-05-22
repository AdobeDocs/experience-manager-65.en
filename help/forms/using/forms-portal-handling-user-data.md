---
title: Forms Portal | Handling user data
description: Learn about managing user data such as access, delete, and data store on AEM Forms Portal.
contentOwner: vishgupt
topic-tags: grdp
products: SG_EXPERIENCEMANAGER/6.5/FORMS
role: "Admin,User"
exl-id: 791524a4-a8bb-4632-a68d-e96864e139a9
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
---
# Forms Portal | Handling user data {#forms-portal-handling-user-data}

[!DNL AEM Forms] Portal provides components that you can use to list adaptive forms, HTML5 forms, and other Forms assets on the [!DNL AEM Sites] page. In addition, you can configure it to display drafts and submitted adaptive forms and HTML5 forms for a logged-in user. For more information about Forms Portal, see [Introduction to publishing forms on a portal](/help/forms/using/introduction-publishing-forms.md).

When a logged-in user saves an adaptive form as a draft or submits it, they are displayed in the Drafts and Submissions tabs on the Forms Portal. The data for drafted or submitted forms is stored in the data store configured for AEM deployment. The drafts and submissions of anonymous users are not displayed on the Forms Portal page; however, the data is stored in the configured data store. See [Configuring storage services for drafts and submissions](/help/forms/using/configuring-draft-submission-storage.md).

## User data and data stores {#user-data-and-data-stores}

Forms Portal stores data for draft and submitted forms in the following scenarios:

* The submit action configured in the adaptive form is **Forms Portal Submit Action**.
* For submit actions other than **Forms Portal Submit Action**, the **[!UICONTROL Store data in Forms Portal]** option is enabled in the **[!UICONTROL Submission]** properties of the adaptive form container.

For every draft and submitted form for logged-in and anonymous users, the Forms Portal stores the following data:

* Form metadata such as the form name, form path, draft or submission ID, attachments path, and user data ID
* Form attachment as data bytes
* Form data as data bytes

Depending on the configured data store persistence, drafts and submitted forms data is stored at the following locations.

<table>
 <tbody>
  <tr>
   <td><p><strong>Persistence type</strong></p> </td>
   <td><p><strong>Data store</strong></p> </td>
   <td><p><strong>Location</strong></p> </td>
  </tr>
  <tr>
   <td><p>Default</p> </td>
   <td><p>AEM repository of Author and Publish instances</p> </td>
   <td><p><code>/content/forms/fp/</code></p> </td>
  </tr>
  <tr>
   <td><p>Remote</p> </td>
   <td><p>AEM repository of Author and remote AEM instances</p> </td>
   <td><p><code>/content/forms/fp/</code></p> </td>
  </tr>
  <tr>
   <td><p>Database</p> </td>
   <td><p>AEM repository of Author instance and database tables</p> </td>
   <td>Database tables <code>data</code>, <code>metadata</code>, and <code>additionalmetadata</code></td>
  </tr>
 </tbody>
</table>

## Access and delete user data {#access-and-delete-user-data}

You can access draft and submitted forms data for logged-in and anonymous users in the configured data stores, and if necessary, delete it.

### AEM instances {#aem-instances}

All drafts and submitted forms data in AEM instances (author, publish, or remote) for logged-in and anonymous users are stored in the `/content/forms/fp/` node of the applicable AEM repository. Every time a logged-in or anonymous user saves a draft or submits a form, a `draft ID` or `submission ID`, a `user data ID`, and a random `ID` for each attachment (if applicable) is generated. It is associated with the respective draft or submission.

#### Access user data {#access-user-data}

When a logged-in user saves a draft or submits a form, a child node is created with its user ID. For example, drafts and submissions data for Sarah Rose whose user ID is `srose` are stored in `/content/forms/fp/srose/` node in AEM repository. Within the user ID node, the data is organized in a hierarchical structure.

The following table explains how the data for all drafts by `srose` is stored in AEM repository.

>[!NOTE]
>
>An exact structure like `drafts` is replicated for submitted forms for `srose` under the `/content/forms/fp/srose/submit/` node.
>
>All drafts and submissions by `anonymous` users are stored under the `/content/forms/fp/anonymous/` node, which organizes drafts and submissions for all anonymous users under the `draft` and `submit` nodes.

| Node |Description |
|---|---|
| `/content/forms/fp/srose/drafts` |Container node data for all drafts by the user |
| `/content/forms/fp/srose/drafts/attachments/` |Organizes all attachments for the user based on draft ID |
| `/content/forms/fp/srose/drafts/attachments/<ID>` |Contains an attachment for the selected ID in binary format |
| `/content/forms/fp/srose/drafts/metadata/` |Organizes form metadata for the user based on draft ID |
| `/content/forms/fp/srose/drafts/metadata/<draft ID>` |Contains form metadata for the selected draft ID |
| `/content/forms/fp/srose/drafts/data/` |Organizes forms data for the user based on user data ID |
| `/content/forms/fp/srose/drafts/data/<user data ID>` |Contains form data for the selected user data ID in binary format |

#### Delete user data {#delete-user-data}

To delete user data from drafts and submissions for a logged-in user from AEM systems completely, you must delete the `user ID` node for a specific user from the author node. Manually delete data from all applicable AEM instances.

Drafts and submission data for all anonymous users is stored within the common `drafts` and `submit` nodes under `/content/forms/fp/anonymous`. There is no method to find data for a particular anonymous user unless some identifiable information is known. In this case, you can search for information that identifies the anonymous user in the AEM repository and manually delete the node containing it from all applicable AEM instances to remove data from the AEM system. However, to delete data for all anonymous users, you can delete the `anonymous` node to remove drafts and submissions data for all anonymous users.

### Database {#database}

When AEM is configured to store data in a database, Forms Portal draft and submission data is stored in the following database tables for both logged-in and anonymous users:

* data
* metadata
* additionalmetadata

#### Access user data {#access-user-data-1}

To access drafts and submissions data for a logged-in and anonymous user in the database tables, run the following database command. In the query, replace `logged-in user` with the user ID whose data you want to access or with `anonymous` for anonymous users.

```sql
select * from metadata, data, additionalmetadatatable where metadata.owner = 'logged-in user' and metadata.id = additionalmetadatatable.id and metadata.userdataID = data.id
```

#### Delete user data {#delete-user-data-1}

To delete drafts and submissions data for a logged-in user from the database tables, run the following database command. In the query, replace `logged-in user` with the user ID whose data you want to delete or with `anonymous` for anonymous users. To delete data for a particular anonymous user from the database, you must find it using some identifiable information and delete it from database tables containing the information.

```sql
DELETE FROM metadata, data, additionalmetadatatable USING metadata INNER JOIN data ON metadata.userdataID = data.id INNER JOIN additionalmetadatatable ON metadata.id = additionalmetadatatable.id WHERE metadata.owner = 'logged-in user'
```

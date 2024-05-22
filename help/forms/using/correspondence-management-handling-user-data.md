---
title: Correspondence Management | Handling user data
description: Learn about Correspondence Management and handling user data in an Adobe Experience Manager Forms environment.
topic-tags: grdp
products: SG_EXPERIENCEMANAGER/6.5/FORMS
role: "Admin,User"
exl-id: a0c6a02c-47a3-4e70-a14c-953ee016b8e4
solution: Experience Manager, Experience Manager Forms
feature: "Adaptive Forms, Data Sources"
---
# Correspondence Management | Handling user data {#correspondence-management-handling-user-data}

AEM Forms Correspondence Management enables you to create, manage, and streamline secure and personalized customer correspondences. It provides an intuitive user interface for business users to create correspondences using pre-approved content blocks and media elements. For more information about creating correspondences, see [Create Correspondence](/help/forms/using/create-correspondence.md).

When a business user or an agent saves a correspondence as draft or submits it, a letter instance is saved in the AEM repository. The letter instance includes correspondence data and metadata.

>[!NOTE]
>
>In AEM 6.5 Forms, correspondence management is not available out of the box. If you are upgrading from a previous AEM Forms version, install the compatibility package and migrate your correspondence management assets to continue to use them in AEM 6.5 Forms. For more information, see [Compatibility package](/help/forms/using/compatibility-package.md).

## User data and data stores {#data}

Correspondence management stores data for draft and submitted letters in AEM repository only if the publish instance is configured to manage letter instances. For more information about the configuration, see [Correspondence Management configuration properties](/help/forms/using/cm-configuration-properties.md).

Depending on the data store persistence configured for your AEM deployment, drafts and submitted correspondence data is stored at the following locations.

<table>
 <tbody>
  <tr>
   <td><p><strong>Persistence type</strong></p> </td>
   <td><p><strong>Data store</strong></p> </td>
   <td><p><strong>Location</strong></p> </td>
  </tr>
  <tr>
   <td><p>Default</p> </td>
   <td><p>AEM repository of publish instance and author instances specified in reverse replication configuration</p> </td>
   <td><p><code>/content/apps/cm/letterInstances/[yyyy]/[mm]/[dd]/[node-id]/[letter-instance-name]/</code><br /> </p> </td>
  </tr>
  <tr>
   <td><p>Remote</p> </td>
   <td><p>AEM repository of the remote processing author instance</p> </td>
   <td><p><code>/content/apps/cm/letterInstances/[yyyy]/[mm]/[dd]/[node-id]/[letter-instance-name]/</code></p> </td>
  </tr>
 </tbody>
</table>

In the above specified AEM repository location:

* `[yyyy]/[mm]/[dd]` is the node structure based on the date when the letter instance was created
* `[node-id]` is the ID assigned to the folder containing the letter
* `[letter-instance-name]` is the name specified when saving or submitting a letter

Under the [letter-instance-name] node, the following node structure is created and the data for each letter instance is stored in the AEM repository:

| Node |Description |
|---|---|
| `extendedProperties` |Stores metadata properties of the letter instance. |
| `dataXML` |Stores a downloadable dataXML file containing the correspondence data in binary format. |
| `processedXDP` |Includes the details of the XDP template used to create the submitted letter. This node is created only for submitted correspondences. |
| `submittedLetter` |Stores the submitted letter data in downloadable binary format. This node is created only for submitted correspondences. |

## Access and delete user data {#access-and-delete-user-data}

You can access draft and submitted correspondence data in the configured data stores, and if necessary, delete it.

### Access user data {#access-user-data}

Correspondence management provides APIs that you can use to find and access draft and submitted letter instances. Using the APIs, you can find and open letter instances using the letter instance ID or the user who saved or submitted the correspondence. For more information, see [APIs to access letter instances](/help/forms/using/cm-apis-to-access-letter-instances.md).

Alternatively, you can navigate to the letter instance in AEM repository using CRXDE Lite. See [User data and data stores](/help/forms/using/correspondence-management-handling-user-data.md#data) for information about stored data and repository location.

### Delete user data {#delete-user-data}

To find a letter instance containing the data of a specific user, you can:

* Use correspondence management APIs if letter instance name or the user who saved the draft or submitted the correspondence is known
* Use AEM repository search using personally identifiable information like the email ID or name to find the node where the information is stored

To delete user data from draft and submitted correspondences completely from AEM systems, you must manually delete the letter instance node from all applicable AEM instances.

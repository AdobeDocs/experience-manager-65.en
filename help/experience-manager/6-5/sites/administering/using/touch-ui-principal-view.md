---
title: Principal View for Permissions Management
seo-title: Principal View for Permissions Management
description: Learn about the new Touch UI interface that facilitates permissions management.
seo-description: Learn about the new Touch UI interface that facilitates permissions management.
uuid: 9850f46f-f0ae-46db-8285-33a8e0bc3f16
contentOwner: sarchiz
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: Security
discoiquuid: ab607732-2f0d-494f-987d-0b3c239570e3
index: y
internal: n
snippet: y
---

# Principal View for Permissions Management{#principal-view-for-permissions-management}

## Overview {#overview}

AEM 6.5 introduces Permissions Management for Users and Groups. The main functionality remains the same as the classic UI, but is more user friendly and efficient.

## How to Use {#how-to-use}

### Accessing the UI {#accessing-the-ui}

The new UI based permissions management is accessed through the Permissions card under Security as shown below:

![](assets/screen_shot_2019-03-17at63333pm.png)

The new view makes it easier to look at the whole set of privileges and restrictions for a given principal at all paths where Permissions have been granted explicitly. This removes the need to go to

CRXDE to manage advanced privileges and restrictions. It has been consolidated in the same view. The view defaults to the Group "everyone".

![](assets/unu-1.png)

There is a filter that allows the user to select the type of principals to look at **Users**, **Groups**, or **All **and search for any principal**.**

![](assets/image2019-3-20_23-52-51.png)

### Viewing Permissions for a Principal {#viewing-permissions-for-a-principal}

The frame on the left allows users to scroll down to find any principal or search for a Group or a User based on the selected filter, as shown below:

![](assets/doi-1.png)

Clicking on the name shows the assigned permissions on the right. The permissions pane shows the the list of Access Control Entries on specific paths along with configured restrictions.

![](assets/trei-1.png)

### Adding new Access Control Entry for a Principal {#adding-new-access-control-entry-for-a-principal}

New permissions can be added by adding a new Access Controlling Entry by clicking the Add ACE button.

![](assets/patru.png)

This brings up the window shown below, the next step is to choose a path where the permission needs to be configured.

![](assets/cinci-1.png)

Here we select a path where we want to configure a permission for **dam-users**:

![](assets/sase-1.png)

After the path is selected, the workflow goes back to this screen, where the user can then select one or more of the privileges from the available namespaces (like `jcr`, `rep` or `crx`) as shown i below.

Privileges can be added by searching using the text field and then selecting from the list.

>[!NOTE]
>
>For a complete list of privileges and descriptions, please see [this page](../../../../6-5/sites/administering/using/user-group-ac-admin.md#access-right-management).

![](assets/image2019-3-21_0-5-47.png) ![](assets/image2019-3-21_0-6-53.png)

After the list of privileges has been selected, the user can choose the Permission Type : Deny or Allow, as shown below.

![](assets/screen_shot_2019-03-17at63938pm.png) ![](assets/screen_shot_2019-03-17at63947pm.png)

### Using Restrictions {#using-restrictions}

In addition to list of privileges and the Permission Type on a given path, this screen also allows to add restrictions for fine grained access control as shown below:

![](assets/image2019-3-21_1-4-14.png)

>[!NOTE]
>
>For more information on what each restriction means, please consult [this page](../../../../6-5/sites/administering/using/user-group-ac-admin.md#restrictions).

Restrictions can be added as shown below by choosing the restriction type, entering the value and hitting the **+** icon. ![](assets/sapte-1.png) ![](assets/opt-1.png)

The new ACE is reflected in the Access Control List as shown below. Note that `jcr:write` is an aggregate privilege that includes `jcr:removeNode` that was added above, but is not shown below as its covered under `jcr:write`.

### Editing ACEs {#editing-aces}

Access Control Entries can be edited by selecting a principal and choosing the ACE that you want to edit.

For example here we can edit the below entry for **dam-users** by clicking the pencil icon on the right:

![](assets/image2019-3-21_0-35-39.png)

The edit screen is shown with configured ACEs preselected, these can be deleted by clicking the cross icon next to them or new privileges can be added for the given path, as shown below.

![](assets/noua-1.png)

Here we are adding the `addChildNodes` privilege for **dam-users** on the given path.

![](assets/image2019-3-21_0-45-35.png)

Changes can be saved by clicking the **Save** button on top right, and the changes will reflect in the new permissions for **dam-users **as shown below:

![](assets/zece-1.png)

### Deleting ACEs {#deleting-aces}

Access Control Entries can be deleted to remove all permissions given to a principal on a specific path. The X icon on next to ACE can be used to delete it as shown below:

![](assets/image2019-3-21_0-53-19.png) ![](assets/unspe.png)

### Classic UI Privilege Combinations {#classic-ui-privilege-combinations}

Note that the new permissions UI explicitly uses the basic set of privileges instead of predefined combinations that did not truly reflect exact underlying privileges that were granted.

It caused confusion as to what exactly is being configured. The following table lists the mapping between the privilege combinations from the Classic UI to the actual privileges that constitute them:

| 
|

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody>
  <tr>
   <th>Classic UI Privilege Combinations</th> 
   <th>Permissions UI Privilege</th> 
  </tr>
  <tr>
   <td>Read</td> 
   <td><span class="code">jcr:read</span></td> 
  </tr>
  <tr>
   <td>Modify</td> 
   <td><p><span class="code">jcr:modifyProperties</span></p> <p><span class="code">jcr:lockManagement</span></p> <p><span class="code">jcr:versionManagement</span></p> </td> 
  </tr>
  <tr>
   <td>Create</td> 
   <td><p><span class="code">jcr:addChildNodes</span></p> <p><span class="code">jcr:nodeTypeManagement</span></p> </td> 
  </tr>
  <tr>
   <td>Delete</td> 
   <td><p><span class="code">jcr:removeNode</span></p> <p><span class="code">jcr:removeChildNodes</span></p> </td> 
  </tr>
  <tr>
   <td>Read ACL</td> 
   <td><span class="code">jcr:readAccessControl</span></td> 
  </tr>
  <tr>
   <td>Edit ACL</td> 
   <td><span class="code">jcr:modifyAccessControl</span></td> 
  </tr>
  <tr>
   <td>Replicate</td> 
   <td><span class="code">crx:replicate</span></td> 
  </tr>
 </tbody>
</table>


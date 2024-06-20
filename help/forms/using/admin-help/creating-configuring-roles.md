---
title: Creating and configuring roles
description: Learn how to associate users and groups with roles that are already part of the User Management database. You can also create, edit, and delete roles.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/setting_up_and_organizing_users
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: b447e545-f73e-4fde-a001-86e0e1cf4a12
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Creating and configuring roles{#creating-and-configuring-roles}

Using the User Management web pages, you can associate users and groups with roles that are already part of the User Management database. You can also create, edit, and delete roles.

User Management has two types of roles:

**Mutable roles:** This type of role can be edited and deleted, and role permissions can be added and deleted from these role types. Any role that you create is considered a mutable role. You can add or remove users and groups assigned to mutable roles.

**Immutable roles:** The default roles that are included with User Management are immutable roles. These roles cannot be edited or deleted. You can, however, add or remove users and groups assigned to immutable roles.

Both mutable and immutable roles can also be created through the AEM forms APIs.

## Default roles {#default-roles}

The following default roles are included in the User Management database.

**administration console User:** Can access administration console.

**Application Administrator:** Can use all Workbench features. Can use the Applications and Services pages in administration console to configure service run-time properties, endpoints, and security.

**AEM forms Administrator:** Can perform all tasks for all installed services.

**Security Administrator:** Controls User Management settings, and manages users and groups that are associated with any User Manager domain

**Services User:** Can view and invoke any service

**Super Administrator:** Has access to all administrative functionality in the system, including services

**Trust Administrator:** Can manage the PKI trust settings and PKI credentials that are managed from the Trust Store Management page in administration console

### Additional default roles {#additional-default-roles}

The following additional default roles may be included, depending on the AEM forms components you installed

**Document Upload Application User:** Can upload documents using Flex Remoting.

**Forms Administrator:** Can view and modify settings from the Forms page in Administration Console

**AEM forms Contentspace Administrator:** Can view and modify settings from the Content Services (Deprecated) page in administration console

**AEM forms Contentspace User:** Can log in to the Contentspace (Deprecated) web pages

**Documentum Connector Administrator:** Can view and modify settings from the Connector for EMC Documentum page in administration console

**AEM forms FileNet Connector Administrator:** Can view and modify settings from the Connector for IBM FileNet page in administration console

**AEM forms IBM CM Connector Administrator:** Can view and modify settings from the Connector for IBM Content Manager page in administration console

**Rights Management Administrator:** Performs all tasks that are required for all server configurations on the relevant Rights Management pages

**Rights Management End User:** Can access Rights Management end-user web pages

**Rights Management Invite User:** Can invite users

**Rights Management Manage Invited and Local Users:** Can perform tasks that are required to manage all invited and local users on the relevant Rights Management pages

**Rights Management Policy Set Administrator:** Performs all tasks that are required for all policy sets on the relevant Rights Management pages

**Rights Management Super Administrator:** Performs all tasks that are required from the Rights Management page

**AEM forms Workspace Administrator:** Can view and modify settings from the Workspace page in Administration Console

***note**: The Flex Worksapce is deprecated for AEM forms release.*

**Workspace User:** Can log in to the Workspace end-user application

**Output Administrator:** Can view and modify settings from the Output page in Administration Console

**PDFG Administrator:** Can view and modify settings from the PDF Generator page in administration console

**PDFG User:** Can access all non-administrative functionality for PDF Generator

**Acrobat Reader DC extensions Web Application:** Can use the Acrobat Reader DC extensions web application

>[!NOTE]
>
>Users with certain types of administrator privileges cannot access the Workspace end-user web pages for security reasons. Because these pages can exist outside a firewall, permitting administration-level tasks could pose a security risk. Only users who have the AEM forms Workspace Administrator or AEM forms Workspace User privileges can access the Workspace end-user web pages.

>[!NOTE]
>
>The Flex Worksapce is deprecated for AEM forms release.

## Create a role {#create-a-role}

1. In administration console, click Settings &gt; User Management &gt; Role Management, and then click New Role.
1. In the Role Name box, type a name for the role and, optionally, type a description of the role, and then click Next.

   >[!NOTE]
   >
   >When using MySQL, you cannot create two roles that have the same name but differ in the use of extended characters. For example, attempting to create a role named abcde when one named âbcdè already exists results in an error.

1. Click Find Permissions, select the permissions to add to the role.
1. Click OK and then click Next.
1. Assign this role to users and groups:

    * Click Find Users/Groups.
    * In the Find box, type your search criteria.
    * Select Name, Email, or User ID, and then select Users, Groups, or Users and Groups.
    * Select the domain, select the number of results to display, and click Find.
    * Select the check boxes for the users and groups to assign this role to and click OK.

1. To view user and group details, select the entity.
1. Click OK and then click Finish.

## Edit a role {#edit-a-role}

1. In administration console, click Settings &gt; User Management &gt; Role Management, and then click Role Name.

   By default, the Role Management page displays all the roles in the User Management database. If the list of roles is large, use the Find area at the top of the page to search for a specific role name.

1. Click the role to edit, edit the general settings, and click Save.
1. To edit role permissions, click the Permissions tab and do these tasks:

    * To add new permissions, click Find Permissions, select the check boxes for the permissions to add, click OK, and then click Save.
    * To delete a permission from the role, select the check box for the permission, click Delete, and then click Save.

1. To manage who the role is assigned to, click the Role Users tab and do these tasks:

    * To assign the role to new users and groups, click Find Users/Groups, and complete the search information. Select the check box for each user and group to assign this role to, click OK, and then click Save.
    * To remove the role, select the check box for the users or group, click Unassign, and then click Save.

## Delete a role {#delete-a-role}

You can delete any of the roles that you created, but not the default AEM forms roles that are included in the product.

1. In administration console, click Settings &gt; User Management &gt; Role Management, and then click Role Name.

   By default, the Role Management page displays all the roles in the User Management database. If the list of roles is large, use the Find area at the top of the page to search for a specific role name.

1. Select the check box for the role to delete, click Delete, and then click OK.

## Assign a role to users and groups {#assign-a-role-to-users-and-groups}

1. In administration console, click Settings &gt; User Management &gt; Users and Groups.
1. Specify information to narrow the search and click Find. The results of the search are listed at the bottom of the page. You can sort the list by clicking any of the column headings.
1. Select the check boxes beside the users and groups to associate with a role and click Assign Role.
1. Select the role to assign to the user or group and click OK.

You can also assign roles by using the Role Management page.

## Determine who is assigned to a role {#determine-who-is-assigned-to-a-role}

1. In administration console, click Settings &gt; User Management &gt; Role Management, and then click Role Name.

   By default, the Role Management page displays all the roles in the User Management database. If the list of roles is large, use the Find area at the top of the page to search for a specific role name.

1. On the Role Detail page, click the Role Users tab. A list of users and groups that are directly associated with the role are displayed.

## Change role permissions {#change-role-permissions}

You can change the permissions for any of the roles that you created. You cannot change the permissions for the default AEM forms roles that are included in the product.

1. In administration console, click Settings &gt; User Management &gt; Role Management, and then click Role Name.

   By default, the Role Management page displays all the roles in the User Management database. If the list of roles is large, use the Find area at the top of the page to search for a specific role name.

1. Select the role to view permissions for and click the Permissions tab.
1. To change these permissions, click Find Permissions, select the check boxes for the permissions to add to the role, click OK, and then click Save.
1. To delete a permission, select the permission, click Delete, and then click Save.

### AEM forms permissions {#aem-forms-permissions}

**ADD_REMOVE_ENDPOINT_PERM:** Add, remove, and modify endpoints for a service

**Admin Console Login:** View the administration console

**Certificate Modify:** Modify the trust settings of any certificate in the Trust Store

**Certificate Read:** Read any certificate in the Trust Store

**Certificate Write:** Add a certificate to the Trust Store

**Component Add:** Install a new component in the system

**Component Delete:** Delete any component in the system

**Component Read:** Read any component in the system

**Contentspace Administrator:** Permission for Contentspace (Deprecated) Administrator

**Contentspace Console Login:** Permission for Contentspace (Deprecated) Console Login

**Core Settings Control:** Manage the settings on the Core System Settings page in Administration Console

**CREATE_VERSION_PERM:** Create a version of a service

**Credential Modify:** Modify any signing credential in the Trust Store

**Credential Read:** Read any signing credential in the Trust Store

**Credential Write:** Add a signing credential to the Trust Store

**CRL Modify:** Modify any CRL (Certificate Revocation List) in the Trust Store

**CRL Read:** Read any CRL in the Trust Store

**CRL Write:** Add a CRL to the Trust Store

**Delegate:** Set an ACL on a resource

**DELETE_VERSION_PERM:** Delete a version of a service

**Document Upload:** Upload documents in AEM forms

**Domain Control:** Create, delete, or modify settings for any User Management domain, including its authentication and directory providers

**Event Type Edit:** Edit to event types

**Identity Impersonation Control:** Impersonate identity in User Manager

**INVOKE_PERM:** Invoke all operations on a service

**LCDS Data Model Control:** Read and deploy data models in Data Services

**License Manager Update:** Update license information

**MODIFY_CONFIG_PERM:** Modify the configuration of a service

**TERM** Modify the version of a service

**PDFGAdminPermission:** PDFG administrator

**PDFGUserPermission:** PDFG user

**PERM_DCTM_ADMIN:** Documentum Connector administrator

**PERM_FILENET_ADMIN:** FileNet Connector administrator

**PERM_FORMS_ADMIN:** Forms administrator

**PERM_IBMCM_ADMIN:** IBM CM Connector administrator

**PERM_OUTPUT_ADMIN:** Output administrator

**PERM_READER_EXTENSIONS_WEB_APPLICATION:** Use the Acrobat Reader DC extensions web application

**PERM_SP_ADMIN:** Manage SharePoint Connector settings

**PERM_WORKSPACE_ADMIN:** Manage Workspace settings

**PERM_WORKSPACE_USER:** Log in to the Workspace end-user application

**Principal Control:** Manage users and groups for any domain, and manage role assignments for all users and groups in any domain

**Process Recording Read/Delete:** List and retrieve workflow audit instances

**PROCESS_OWNER_PERM:** View trend data and perform administrative actions on a service created from a process

**Read:** Read the content of a resource

**READ_PERM:** Read or view a service

**Renew assertion:** Renew assertions in User Management

**Repository Delegate:** Set an ACL on a resource

**Repository Read:** Read the content of a resource

**Repository Traverse:** Include a resource in a list resources request or read the metadata of a resource

**Repository Write:** Write repository metadata and content

**Rights Management Change Policy Owner:** Change policy owner

**Rights Management End User Console Login:** Log in to the Rights Management End User UI

**Rights Management Manage Configuration:** Manage server configuration

**Rights Management Manage Invited and Local Users:** Manage invited and local users

**Rights Management Manage Policy Sets:** Manage all policies and documents within any policy set

**Rights Management Policy Set Add Coordinator:** Add, remove, and change permissions for policy set coordinators

**Rights Management Policy Set Create Policy:** Create a policy for a policy set

**Rights Management Policy Set Delete Policy:** Remove a policy from a policy set

**Rights Management Policy Set Edit Policy:** Edit a policy in a policy set

**Rights Management Policy Set Manage Document Publisher:** When you create policy sets, you assign users the role of document publisher. The document publisher is the user who protects the document with a policy.

**Rights Management Policy Set Remove Coordinator:** Remove a policy set coordinator from a policy set

**Rights Management Policy Set Revoke Document:** Revoke access to documents in a policy set

**Rights Management Policy Set Switch Policy:** Switch policies for a document

**Rights Management Policy Set Unrevoke Document:** Unrevoke a document

**Rights Management Policy Set View Event:** View policy and document events for any policy or document within a policy set

**Rights Management View Server Events:** Search and view all audit events

**Role Control:** Create, delete, and modify roles in User Management

**Service Activate:** Start any service, making it available for invocation

**Service Add:** Deploy a new service to the service registry. This includes adding new processes and process variants

**Service Deactivate:** Stop any service in the system

**Service Delete:** Delete any service in the system, including processes and process variants

**Service Invoke:** Invoke any service in the service registry available at runtime

**Service Modify:** Modify the configuration properties of any service in the system. This includes locking and unlocking a service in the IDE, and adding or removing endpoints from a service

**Service Read:** Read any services in the system. This includes all processes and process variants

**SERVICE_AGENT_PERM:** View data and interact with process instances for a service created from a process

**SERVICE_MANAGER_PERM:** Perform load balancing and other administrative actions on a service created from a process

**START_STOP_PERM:** Start or stop a service

**SUPERVISOR_PERM:** View process instance data for a service created from a process

**Traverse:** Include a resource in a list resources request or read the metadata of a resource

**Write:** Write repository metadata and content

**Opening files in Workbench**

To view the contents of the Resources view in Workbench and open files for viewing, a user requires the following permissions:

* Repository Read
* Repository Traverse
* Service Invoke
* Service Read

## Remove a user or group from a role {#remove-a-user-or-group-from-a-role}

Use the Role Management page to remove users and groups from a particular role. If the user or group inherited the role assignment, you cannot remove the role at the user or group level. Either remove the user or group from the inheritance tree or remove the role from the parent.

1. In administration console, click Settings &gt; User Management &gt; Role Management, and then click Role Name.

   By default, the Role Management page displays all the roles in the User Management database. If the list of roles is large, use the Find area at the top of the page to search for a specific role name.

1. In the list of roles, click the name of the role to update and then click the Role Users tab. A list of users and groups associated with the role are displayed.
1. Select the check boxes for the users and groups to remove from the role and click Unassign.
1. Click Save and then click OK.

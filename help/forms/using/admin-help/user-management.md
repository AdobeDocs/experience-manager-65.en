---
title: User Management
description: User Management lets you enable SSO between AEM forms modules and Netegrity SiteMinder-protected applications by using SAML. This document provides more information about User Management.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/maintaining_aem_forms
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 1da1f6de-ac0d-4e0d-b8bb-956420e42699
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# User Management {#user-management}

User Management lets you enable single sign-on (SSO) between AEM forms modules and Netegrity SiteMinder-protected applications by using Security Assertion Markup Language (SAML). When SSO is implemented, the AEM forms user login pages are not required and are not displayed if the user is already authenticated through the company portal.

For information about improving the database and directory sync performance for DB2, see [IBM DB2 database: Running commands for regular maintenance](/help/forms/using/admin-help/ibm-db2-database-running-commands.md#ibm-db2-database-running-commands-for-regular-maintenance).

## Configuring User Management for an SSL-enabled LDAP server {#configuring-user-management-for-an-ssl-enabled-ldap-server}

If you have an SSL-enabled LDAP server, configure User Management to work with it. (See [Configure User Management for an SSL-enabled LDAP server](/help/forms/using/admin-help/configure-user-management-ssl-enabled.md#configure-user-management-for-an-ssl-enabled-ldap-server).)

## Setting user privileges for use with Document Security {#setting-user-privileges-for-use-with-document-security}

Create an administrator user who has the appropriate privileges for creating users and groups. If your AEM forms environment includes Document Security, grant the privilege to manage invited and local users to a user who will be the administrator for these users. Also assign the administration console User role to provide the user with access to administration console. (See [Creating and configuring roles](/help/forms/using/admin-help/creating-configuring-roles.md#creating-and-configuring-roles).)

To view users and groups in selected domains during policy user searches, a super administrator or policy set administrator must select and add domains (created in User Management) to the visible user and group list for each policy set created.

The visible user and group list is visible to the policy set coordinator and is used to restrict which domains the end user can browse when choosing users or groups to add to policies. If this task is not performed, the policy set coordinator will not find any users or groups to add to the policy. There can be more than one policy set coordinator for any given policy set.

>[!NOTE]
>
>Creating domains must be done before any policies can be created.

### Set visible users and groups {#set-visible-users-and-groups}

After you install and configure your AEM forms environment with Document Security, set up all appropriate domains in User Management.

1. In administration console, click Services &gt; Document Security&gt; Policies and then click Policy Sets tab.
1. Select Global Policy Set and then click Visible Users And Groups tab.
1. Click Add Domain(s) and add existing domains as required.
1. Navigate to Services &gt; document security &gt; Configuration &gt; My Policies and click Visible Users And Groups tab.
1. Click Add Domain(s) and add existing domains as required.

## Administrator user restrictions {#administrator-user-restrictions}

Users with certain types of administrator privileges cannot access the Workspace end-user web pages for security reasons. Because these web pages can exist outside a firewall, permitting administration-level tasks could pose a security risk. Only users who have the Workspace Administrator or Workspace User privileges can access the end-user web pages.

>[!NOTE]
>
>The Flex Worksapce is deprecated for AEM forms release.

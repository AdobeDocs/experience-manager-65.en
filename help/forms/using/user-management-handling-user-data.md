---
title: Forms user management | Handling user data
description: Learn how AEM Forms JEE User Management component lets you create, authorize, and manage users who need access to AEM Forms.
topic-tags: grdp
products: SG_EXPERIENCEMANAGER/6.5/FORMS
role: "Admin,User"
exl-id: eeeab5d1-073a-4e13-a781-391dfe70bb37
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
---
# Forms user management | Handling user data {#forms-user-management-handling-user-data}

User management is an AEM Forms JEE component that allows creating, managing, and authorizing AEM Forms users to access AEM Forms. User management uses domains as directories for obtaining user information. The following domain types are supported:

**Local domains**: This type of domain is not connected to a third-party storage system. Instead, users and groups are created locally and reside in the User Management database. Passwords are stored locally, and authentication is done using a local database.

**Hybrid domains**: This type of domain is not connected to a third-party storage system. Instead, users and groups are created locally and reside in the User Management database. Unlike local domains, hybrid domains use an external authentication provider, which can be LDAP, Kerberos, SAML, or a custom authentication provider.

**Enterprise domains**: Consist of users and groups that reside in a third-party storage system, such as an LDAP directory. User Management does not write to the third-party storage system. Instead, User Management synchronizes the user and group information with the User Management database. Enterprise domains also use an external authentication provider, which can be LDAP, Kerberos, SAML, or a custom authentication provider.

<!-- Fix broken links For more information about how user management works and configured, see AEM Forms JEE administration help. -->

## User data and data stores {#user-data-and-data-stores}

User management stores user data in a database, such as My Sql, Oracle, MS&reg; SQL Server, and IBM&reg; DB2&reg;. In addition, any user who has logged in at least once in Forms applications on AEM author at `https://'[server]:[port]'lc`, the user gets created in AEM repository. Therefore, user management is stored in the following data stores:

* Database
* AEM repository
* Third-party storage like LDAP directory

>[!NOTE]
>
>Data stored in third-party storages is out of scope for this document. Contact the third-party vendor directly to manage user data in such storages.

### Database {#database}

User management stores user data in the following database tables:

<table>
 <tbody>
  <tr>
   <td>Database table</td>
   <td>Description</td>
  </tr>
  <tr>
   <td><code>EdcPrincipalEntity</code></td>
   <td><p>Stores information about principal entities. A principal can be a user, a group, or a role.</p> <p> </p> </td>
  </tr>
  <tr>
   <td><code>EdcPrincipalUserEntity</code></td>
   <td>Stores personally identifiable information (PII) of users. It contains an entry for every user from local, enterprise, and hybrid domains.</td>
  </tr>
  <tr>
   <td><p><code>EdcPrincipalLocalAccountEntity</code></p> <p><code class="code">EdcPrincipalLocalAccount
       </code>(Oracle and MS&reg; SQL databases)</p> </td>
   <td>Stores data only for local users.</td>
  </tr>
  <tr>
   <td><p><code>EdcPrincipalEmailAliasEntity</code></p> <p><code class="code">EdcPrincipalEmailAliasEn
       </code>(Oracle and MS&reg; SQL databases)</p> </td>
   <td>Contains entries of all users from local, enterprise, and hybrid domains. It contains user email IDs.</td>
  </tr>
  <tr>
   <td><p><code>EdcPrincipalGrpCtmntEntity</code></p> <p><code>EdcPrincipalGrpCtmntEnti</code><br /> (Oracle and MS&reg; SQL databases)</p> </td>
   <td>Stores the mapping between users and groups.</td>
  </tr>
  <tr>
   <td><code>EdcPrincipalRoleEntity</code></td>
   <td>Stores the mapping between roles and principals for both users and groups.</td>
  </tr>
  <tr>
   <td><code>EdcPriResPrmEntity</code></td>
   <td>Stores the mapping between principal and permissions for both users and groups.</td>
  </tr>
  <tr>
   <td><p><code>EdcPrincipalMappingEntity</code></p> <p><code>EdcPrincipalMappingEntit</code><br /> (Oracle and MS&reg; SQL databases)</p> </td>
   <td>Stores old and new attribute values corresponding to a principal.<br /> </td>
  </tr>
 </tbody>
</table>

### AEM repository {#aem-repository}

User management data for users who have at least once accessed the Forms applications under `https://'[server]:[port]'lc` is stored in AEM repository as well.

## Access and delete user data {#access-and-delete-user-data}

You can access and export user management data for users in the user management databases and AEM repository, and if necessary, delete it permanently.

### Database {#database-1}

To export or delete user data from user management database, you must connect to the database using a database client and find out the principal ID based on some PII of the user. For example, to retrieve the principal ID of a user using a login ID, run the following `select` command on the database.

In the `select` command, replace the `<user_login_id>` with the login ID of the user whose principal ID you want to retrieve.

```sql
select refprincipalid from EdcPrincipalUserEntity where uidstring = <user_login_id>
```

Once you know the principal ID, you can export or delete the user data.

#### Export user data {#export-user-data}

Run the following database commands so you can export user management data for a principal ID from database tables. In the `select` command, replace `<principal_id>` with the principal ID of the user whose data you want to export.

>[!NOTE]
>
>The following commands use database table names in My SQL and IBM&reg; DB2&reg; databases. When running these commands on Oracle and MS&reg; SQL databases, replace the following table names in the commands:
>
>* Replace `EdcPrincipalLocalAccountEntity` with `EdcPrincipalLocalAccount`
>
>* Replace `EdcPrincipalEmailAliasEntity` with `EdcPrincipalEmailAliasEn`
>
>* Replace `EdcPrincipalMappingEntity` with `EdcPrincipalMappingEntit`
>
>* Replace `EdcPrincipalGrpCtmntEntity` with `EdcPrincipalGrpCtmntEnti`
>

```sql
Select * from EdcPrincipalLocalAccountEntity where refuserprincipalid in (Select id from EdcPrincipalUserEntity where refprincipalid in (Select id from EDCPRINCIPALENTITY where id='<principal_id>'));

Select * from EdcPrincipalEmailAliasEntity where refprincipalid in (Select id from EdcPrincipalEntity where id='<principal_id>');

Select * from EdcPrincipalRoleEntity where refprincipalid in (Select id from EdcPrincipalEntity where id='<principal_id>');

Select * from EdcPriResPrmEntity where refprinid in (Select id from EdcPrincipalEntity where id='<principal_id>');

Select * from EdcPrincipalUserEntity where refprincipalid in (Select id from EdcPrincipalEntity where id='<principal_id>');

Select * from EdcPrincipalMappingEntity where refprincipalid in (Select id from EdcPrincipalEntity where id='<principal_id>');

Select * from EdcPrincipalGrpCtmntEntity where refchildprincipalid in (Select id from EdcPrincipalEntity where id='<principal_id>');

Select * from EdcPrincipalEntity where id='<principal_id>';
```

#### Delete user data {#delete-user-data}

Do the following to delete user management data for a principal ID from database tables.

1. Delete user data from AEM repository, if applicable, as described in [Delete user data](/help/forms/using/user-management-handling-user-data.md#delete-aem).
1. Shut down the AEM Forms Server.
1. Run the following database commands so you can delete user management data for a principal ID from database tables. In the `Delete` command, replace `<principal_id>` with the principal ID of the user whose data you want to delete.

   ```sql
   Delete from EdcPrincipalLocalAccountEntity where refuserprincipalid in (Select id from EdcPrincipalUserEntity where refprincipalid in (select id from EdcPrincipalEntity where id='<principal_id>'));

   Delete from EdcPrincipalEmailAliasEntity where refprincipalid in (Select id from EdcPrincipalEntity where id='<principal_id>');

   Delete from EdcPrincipalRoleEntity where refprincipalid in (Select id from EdcPrincipalEntity where id='<principal_id>');

   Delete from EdcPriResPrmEntity where refprinid in (Select id from EdcPrincipalEntity where id='<principal_id>');

   Delete from EdcPrincipalUserEntity where refprincipalid in (Select id from EdcPrincipalEntity where id='<principal_id>');

   Delete from EdcPrincipalMappingEntity where refprincipalid in (Select id from EdcPrincipalEntity where id='<principal_id>');

   Delete from EdcPrincipalGrpCtmntEntity where refchildprincipalid in (Select id from EdcPrincipalEntity where id='<principal_id>');

   Delete from EdcPrincipalEntity where id='<principal_id>';
   ```

1. Start the AEM Forms Server.

### AEM repository {#aem-repository-1}

Forms JEE users have their data in AEM repository if they have accessed the AEM Forms author instance at least one. You can access and delete their user data from AEM repository.

#### Access user data {#access-user-data}

To view user created in AEM repository, log into `https://'[server]:[port]'/lc/useradmin` with AEM administrator credentials. Note that `server` and `port` in the URL are that of the AEM author instance. Here, you can search for users with their username. Double-click a user so you can view information like properties, permissions, and groups for the user. The `Path` property for a user specifies the path to the user node created in AEM repository.

#### Delete user data {#delete-aem}

To delete a user:

1. Go to `https://'[server]:[port]'/lc/useradmin` with AEM administrator credentials.
1. Search for a user and double-click the username to open user properties. Copy the `Path` property.
1. Go to AEM CRXDE Lite at `https://'[server]:[port]'/lc/crx/de/index.jsp` and navigate or search the user path.
1. Delete the path and click **[!UICONTROL Save All]** to permanently delete the user from AEM repository.

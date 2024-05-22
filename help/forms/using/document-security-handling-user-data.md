---
title: Document Security | Handling user data
description: Learn about how AEM Forms Document Security lets you manage user data and data stores, and access, delete, and export user data.
topic-tags: grdp
products: SG_EXPERIENCEMANAGER/6.5/FORMS
role: "Admin,User"
exl-id: 00c01a12-1180-4f35-9179-461bf177c787
solution: Experience Manager, Experience Manager Forms
feature: "Security, Adaptive Forms"
---
# Document Security | Handling user data {#document-security-handling-user-data}

AEM Forms document security lets you create, store, and apply predefined security settings to your documents. It ensures that only authorized users can use the documents. You can protect documents by using policies. A policy is a collection of information that includes security settings and a list of authorized users. You can apply a policy to one or more documents and authorizes users who are added in AEM Forms JEE user management.

<!-- Fix broken link For more information about how document security works, see AEM Forms JEE administration help. -->

## User data and data stores {#user-data-and-data-stores}

Document security stores policies and data related to protected documents including user data in a database, such as My Sql, Oracle, MS&reg; SQL Server, and IBM&reg; DB2&reg;. In addition, the data for authorized users in a policy in store in user management. For information about data stored in user management, see [Forms User Management: Handling user data](/help/forms/using/user-management-handling-user-data.md).

The following table maps how document security organizes data in database tables.

<table>
 <tbody>
  <tr>
   <td>Database table</td>
   <td>Description</td>
  </tr>
  <tr>
   <td><code>EdcPrincipalKeyEntity</code></td>
   <td>Stores information about principal keys for the users. The keys are used in offline document security workflows.</td>
  </tr>
  <tr>
   <td><code>EdcAuditEntity</code></td>
   <td>Stores information about auditing events like user events, document events, and policy events.</td>
  </tr>
  <tr>
   <td><p><code>EdcLicenseEntity</code></p> </td>
   <td>Stores record of a protected document. It stores license details for every protected document.</td>
  </tr>
  <tr>
   <td><p><code>EdcDocumentEntity</code></p> </td>
   <td>Stores document name for every license created in the system.</td>
  </tr>
  <tr>
   <td><p><code>EdcRevokationEntity</code></p> </td>
   <td>Stores information about revocation and reinstatement of protected documents.</td>
  </tr>
  <tr>
   <td><code>EdcMyPolicyListEntity</code></td>
   <td>Stores information about users who can create personal policies that appear under the My Policies tab on the Policies page. </td>
  </tr>
  <tr>
   <td><code>EdcPolicyEntity</code></td>
   <td>Stores information about policies. Each policy corresponds to a row in this table.</td>
  </tr>
  <tr>
   <td><code>EdcPolicyXmlEntity</code></td>
   <td>Stores XML files for active policies. A policy XML<sup> </sup>contains references to principal IDs of users associated with the policy. Policy XML is stored as a Blob object.</td>
  </tr>
  <tr>
   <td><code>EdcPolicyArchiveEntity</code></td>
   <td>Stores information about archived policies. An archived policy contains its policy XML stored as a Blob object.</td>
  </tr>
  <tr>
   <td><p><code>EdcPolicySetPrincipalEntity</code></p> <p><code>EdcPolicySetPrincipalEnt</code><br /> (Oracle and MS&reg; SQL databases)</p> </td>
   <td>Stores the mapping between policy set and users.</td>
  </tr>
  <tr>
   <td><code>EdcInvitedUserEntity</code></td>
   <td>Stores information about invited User.</td>
  </tr>
 </tbody>
</table>

## Access and delete user data {#access-and-delete-user-data}

You can access and export document security data for users in the databases, and if necessary, delete it permanently.

To export or delete user data from a database, you must connect to the database using a database client and find out the principal ID based on some personally identifiable information of the user. For example, to retrieve the principal ID of a user using a login ID, run the following `select` command on the database.

In the `select` command, replace the `<user_login_id>` with the login ID of the user whose principal ID you want to retrieve from the `EdcPrincipalUserEntity` database table.

```sql
select refprincipalid from EdcPrincipalUserEntity where uidstring = <user_login_id>
```

Once you know the principal ID, you can export or delete the user data.

### Export user data {#export-user-data}

Run the following database commands so you can export user data for a principal ID from database tables. In the `select` command, replace `<principal_id>` with the principal ID of the user whose data you want to export.

>[!NOTE]
>
>The following commands use database table names in My SQL and IBM&reg; DB2&reg; databases. When running these commands on Oracle and MS&reg; SQL databases, replace `EdcPolicySetPrincipalEntity` with `EdcPolicySetPrincipalEnt` in the commands.

```sql
Select * from EdcPrincipalKeyEntity where principalid = '<principal_id>';

Select * from EdcLicenseEntity where publisherId = '<principal_id>';

Select * from EdcDocumentEntity where id in (Select documentid from EdcLicenseEntity where publisherId = '<principal_id>');

Select * from EdcRevokationEntity where licenseid in (Select id from EdcLicenseEntity where publisherId = '<principal_id>');

Select * from EdcMyPolicyListEntity where principalId = '<principal_id>';

Select * from edcpolicyentity where policyownerId = '<principal_id>';

Select * from edcpolicyxmlentity where policyidref in (Select id from edcpolicyentity where policyownerId = '<principal_id>');

Select * from edcpolicyarchiveentity where policyownerId = '<principal_id>';

Select * from edcpolicysetprincipalentity where principalId = '<principal_id>';

Select * from edcinviteduserentity where principalId = '<principal_id>';
```

>[!NOTE]
>
>To export data from the `EdcAuditEntity` table, use the [EventManager.exportEvents](https://developer.adobe.com/experience-manager/reference-materials/6-5/forms/programlc/javadoc/index.html?com/adobe/livecycle/rightsmanagement/client/EventManager.html) API that takes [EventSearchFilter](https://developer.adobe.com/experience-manager/reference-materials/6-5/forms/programlc/javadoc/com/adobe/livecycle/rightsmanagement/client/infomodel/EventSearchFilter.html) as a parameter to export audit data based on `principalId`, `policyId`, or `licenseId`.

To get complete data about a user in the system, you must access and export data from user management database. For more information, see [Forms user management: Handling user data](/help/forms/using/user-management-handling-user-data.md).

### Delete user data {#delete-user-data}

Do the following to delete document security data for a principal ID from database tables.

1. Shut down the AEM Forms Server.
1. Run the following database commands so you can delete data for the principal ID from database tables for document security. In the `Delete` command, replace `<principal_id>` with the principal ID of the user whose data you want to delete.

   ```sql
   Delete from EdcPrincipalKeyEntity where principalid = '<principal_id>';

   Delete from EdcMyPolicyListEntity where principalId = '<principal_id>';

   Delete from edcpolicyarchiveentity where policyownerId = '<principal_id>';

   Delete from edcpolicysetprincipalentity where principalId = '<principal_id>';

   Delete from edcinviteduserentity where principalId = '<principal_id>';
   ```

   >[!NOTE]
   >
   >To delete data from the `EdcAuditEntity` table, use the [EventManager.deleteEvents](https://developer.adobe.com/experience-manager/reference-materials/6-5/forms/programlc/javadoc/index.html?com/adobe/livecycle/rightsmanagement/client/EventManager.html) API that takes [EventSearchFilter](https://developer.adobe.com/experience-manager/reference-materials/6-5/forms/programlc/javadoc/com/adobe/livecycle/rightsmanagement/client/infomodel/EventSearchFilter.html) as a parameter to delete audit data based on `principalId`, `policyId`, or `licenseId`.

1. Active and archived policy XML files are stored in the `EdcPolicyXmlEntity` and `EdcPolicyArchiveEntity` database tables, respectively. To delete data for a user from these tables, do the following:

    1. Open the XML blob of each row in the `EdcPolicyXMLEntity` or `EdcPolicyArchiveEntity` table and extract the XML file. The XML file is similar to the one shown below.
    1. Edit the XML file so you can remove the blob for the principal ID.
    1. Repeat steps 1 and 2 for the other file.

   >[!NOTE]
   >
   >Remove the complete blob within the `Principal` tag for a principal ID or the policy XML may get corrupt or unusable.

   ```xml
   <ns2:Principal PrincipalNameType="USER">
       <ns2:PrincipalDomain>OID</ns2:PrincipalDomain>
       <ns2:PrincipalName>56F33FEB-098A-1036-A651-00000A2A2656</ns2:PrincipalName>
   </ns2:Principal>
   </ns2:PolicyEntry>
       <ns2:Property PropertyName="isCertified">
           <ns2:PropertyValue xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance" xmlns:xs="https://www.w3.org/2001/XMLSchema" xsi:type="xs:string">false</ns2:PropertyValue>
       </ns2:Property>
       <ns2:Property PropertyName="encryptionAlgorithm">
           <ns2:PropertyValue xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance" xmlns:xs="https://www.w3.org/2001/XMLSchema" xsi:type="xs:string">AES128</ns2:PropertyValue>
       </ns2:Property>
       <ns2:Property PropertyName="AccessDeniedErrorMessage">
           <ns2:PropertyValue xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance" xmlns:xs="https://www.w3.org/2001/XMLSchema" xsi:type="xs:string"></ns2:PropertyValue>
       </ns2:Property>
   <ns2:PolicyEntry>
   <ns2:Permission PermissionName="ns3:com.adobe.aps.onlineOpen" Access="ALLOW"/>
   <ns2:Permission PermissionName="ns3:com.adobe.aps.pdf.copy" Access="ALLOW"/>
   <ns2:Permission PermissionName="ns3:com.adobe.aps.offlineOpen" Access="ALLOW"/>
   <ns2:Permission PermissionName="ns3:com.adobe.aps.pdf.accessible" Access="ALLOW"/>
   <ns2:Permission PermissionName="ns3:com.adobe.aps.pdf.editNotes" Access="ALLOW"/>
   <ns2:Permission PermissionName="ns3:com.adobe.aps.pdf.edit" Access="ALLOW"/>
   <ns2:Permission PermissionName="ns3:com.adobe.aps.pdf.fillAndSign" Access="ALLOW"/>
   <ns2:Permission PermissionName="ns3:com.adobe.aps.pdf.printHigh" Access="ALLOW"/>
   <ns2:Permission PermissionName="ns3:com.adobe.aps.pdf.printLow" Access="ALLOW"/>
   ```

   In addition to deleting data directly from the `EdcPolicyXmlEntity` table, there are two more ways you can achieve this:

   **Using administration console**

    1. As an administrator, log in to the Forms JEE administration console at https://[*server*]:[*port*]/adminui.
    1. Navigate to **[!UICONTROL Services > Document Security > Policy Sets]**.
    1. Open a policy set and delete the user from the policy.

   **Using document security web page**

   Document security users who have permissions to create personal policies can delete user data from their policies. To do so:

    1. Users who have personal policies log in to their document security web page at https://[*server*]:[*port*]/edc.
    1. Navigate to **[!UICONTROL Services > Document Security > My Policies]**.
    1. Open a policy and delete the user from the policy.

    >[!NOTE]
    >
    >Administrators can search, access, and delete user data from personal policies of other users in **[!UICONTROL Services > Document Security > My Policies]** using administration console.  

1. Delete the data for the principal ID from user management database. For detailed steps, see [Forms User Management | Handling user data](/help/forms/using/user-management-handling-user-data.md).
1. Start the AEM Forms Server.

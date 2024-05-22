---
title: Configuring directories

description: Learn how to add, edit and delete directories and configure user management to use virtual list view.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/setting_up_and_managing_domains
products: SG_EXPERIENCEMANAGER/6.5/FORMS

exl-id: 30edcef2-e8fa-403a-9850-b8dfeeb9ac65
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Configuring directories {#configuring-directories}

For each enterprise domain you configure, specify the directories that the authentication provider queries for user information. You can configure multiple directories for a domain.

## Adding directories or custom SPIs {#adding-directories-or-custom-spis}

For each enterprise domain you configure, specify the directories that the authentication provider queries for user information. You can add a directory to an existing enterprise domain or to a new enterprise domain that you are adding. You can configure multiple directories for a domain. You can also configure a domain to use a custom Service Provider Interface (SPI) for synchronization.

### Add a directory {#add-a-directory}

1. In administration console, click Settings &gt; User Management &gt; Domain Management.
1. Click New Enterprise Domain or select an existing enterprise domain.
1. Click Add Directory.
1. In the Profile Name box, type a name to distinguish this directory and then click Next.
1. Configure the directory server settings. (See [Directory settings](configuring-directories.md#directory-settings).)
1. To verify that a connection can be made to the LDAP server, click Test. If the test fails, review the exception in the Application Server log file to determine the root cause of the failure. Click Close and then click Next.
1. Select User Settings and configure the settings as required. (See [Directory settings](configuring-directories.md#directory-settings).)
1. To verify that the base DN and other configured attributes collect the correct batch of users, click Test. LDAP attempts to retrieve the first 200 records by using the provided settings (such as the base DN, search filter, and all attributes).

   If users are returned, the results show the values that are assigned to each field as per the attribute set. If the test fails because of a non-existent server name, incorrect authorization information, or incorrect attributes, the following error message appears: "The search criteria specified did not return any result". To determine the root cause of the failure, review the exception in the Application Server log file. Click Close and then click Next.

1. Select Group Settings and configure the settings as required. (See [Directory settings](configuring-directories.md#directory-settings).)
1. To verify that the base DN and other configured attributes collect the correct batch of groups, click Test. If groups are returned, the results show the values that are assigned to each field as per the attribute set. Click Close.

### Add a custom SPI {#add-a-custom-spi}

For information about creating a custom SPI, see "Developing SPIs for AEM forms" in [Programming with AEM forms](https://www.adobe.com/go/learn_aemforms_programming_63). To make a newly deployed custom SPI available for association with the domain, restart the server.

1. In administration console, click Settings &gt; User Management &gt; Domain Management.
1. Click New Enterprise Domain or select an existing enterprise domain.
1. Click Add Directory.
1. Type a name in the Profile Name box, select Custom SPI Provider, and then click Next.
1. Select a custom user provider from the list and click Next.
1. Select a custom group provider from the list and click Finish.

## Edit a directory {#edit-a-directory}

You can edit the details of a directory that you previously configured.

1. In administration console, click Settings &gt; User Management &gt; Domain Management.
1. Click the appropriate domain in the list and, on the page that appears, select the appropriate directory from the list.
1. Configure the directory, user, and group settings as required. (See [Directory settings](configuring-directories.md#directory-settings).)
1. Click OK.

## Delete a directory {#delete-a-directory}

When you synchronize your domains after deleting a directory, all users and groups in that directory are marked obsolete in the database. They will not be returned in any search from Administration Console.

>[!NOTE]
>
>Enterprise domains require at least one authentication provider and directory provider.

1. In administration console, click Settings &gt; User Management &gt; Domain Management.
1. Click the appropriate domain in the list.
1. Select the check box for the appropriate directory and click Delete.
1. Click OK on the confirmation page that appears and click OK again.

## Directory settings {#directory-settings}

When you add a directory to a domain, specify the following directory settings.

**Server:** (Mandatory) Fully qualified domain name (FQDN) of the directory server. For example, for a computer called x on the adobe.com network, the FQDN is x.adobe.com. An IP address can be used in place of the FQDN server name.

**Port:** (Mandatory) The port that the directory server uses. Typically 389, or 636 if the Secure Sockets Layer (SSL) protocol is used for sending authentication information over the network.

**SSL:** (Mandatory) Specifies whether the directory server uses SSL when sending data over the network. The default is No. When set to Yes, the corresponding LDAP server certificate must be trusted by the Java&trade; runtime environment (JRE) of the application server.

**Binding** (Mandatory) Specifies how to access the directory.

**Anonymous:** No user name or password is required. An anonymous user may be able to fetch only a limited amount of data. This option may be useful for initial testing.

**User:** Authentication is required. In the Name box, specify the name of the user record that can access the directory. It is best to enter the full distinguished name (DN) of the user account, such as cn=Jane Doe, ou=user, dc=can, dc=com. In the Password box, specify the associated password. These settings are required when you select User as the Binding option.

**Name:** Name that can be used to connect to the LDAP database when anonymous access is not enabled. For Active Directory 2003, specify `[domain name]\[userid]`. For Sun&trade; One, eDirectory or IBM Tivoli Directory Server, specify the fully qualified name of the user, such as uid=lcuser,ou=it,o=company.com.

**Password:** Password that corresponds with the name you specified to connect to the LDAP database when anonymous access is not enabled.

**Populate Page With:** When selected, populates attributes on the User and Group settings pages with corresponding default LDAP values.

**Retrieve Base DNs:** Retrieves the base DNs and displays them in the drop-down list. This setting is useful when you have multiple base DNs and need to select a value.

**Enable referral:** This setting is applicable when your organization uses multiple Active Directory domains organized in a hierarchical structure and you have specified directory settings for only the parent domain. In this situation, when you select this option, User Management can access user and group details from the child domains.

>[!NOTE]
>
>Click Test to verify that a connection can be made to the LDAP server. To determine the root cause of any failures, review the exception in the Application Server log file.

### User settings {#user-settings}

**Unique Identifier:** (Mandatory) A unique and constant attribute used to identify users. Use a non-DN attribute as the unique identifier because a user's DN may change if they move to another part of the organization. This setting depends on the directory server. The value is objectGUID for Active Directory 2003, nsuniqueID for Sun&trade; One, and guid for eDirectory.

>[!NOTE]
>
>Ensure that you enter an attribute that is guaranteed to be unique in your organization. Entering an incorrect value can cause serious system problems.

**Base DN:** Set as the starting point for synchronizing users and groups from the LDAP hierarchy. It is best to specify a base DN at the lowest level of the hierarchy that encompasses all users and groups that need to be synchronized for services.

If you selected the Enable referral option in the Directory settings, set the Base DN option to the *dc* part of the DN. For the referral to work, the search span must include both parent and child domains.

>[!NOTE]
>
>Do not include the user's DN in this setting. To synchronize a particular user, use the Search Filter setting.

Although Base DN is a mandatory setting in administration console, some directory servers such as IBM Domino Enterprise Server may require an empty BaseDN. To specify an empty Base DN, export the config.xml file, edit the setting in the config.xml file, and then reimport it. (See [Importing and exporting the configuration file](/help/forms/using/admin-help/importing-exporting-configuration-file.md#importing-and-exporting-the-configuration-file).)

**Search Filter:** (Mandatory) The search filter to use to find the record that is associated with the user. You can perform a one-level search or a sub-level search. (See Search Filter Syntax or RFC 2254.) Additional information for the Microsoft AD schema, see Active Directory Schema.

**Description:** Schema attribute for the description of the user

**Full Name:** (Mandatory) Schema attribute for the full name of the user

**Login ID:** (Mandatory) Schema attribute for the user's login ID

**Last Name:** (Mandatory) Schema attribute for the user's last name

**Given Name:** (Mandatory) Schema attribute for the user's first name

**Initials:** Schema attribute for the user's initials

**Business Calendar:** Enables you to map a business calendar to a user, based on the value for this setting (the business calendar key). Business calendars define business and non-business days. AEM forms can use business calendars when calculating future dates and times for events such as reminders, deadlines, and escalations. The way you assign business calendar keys to users depends on whether you are using an enterprise, local, or hybrid domain. (See Configuring Business Calendars.)

If you are using an enterprise domain, you can map the Business Calendar setting to a field in the LDAP directory. For example, if each user record in your directory contains a *country* field, and you want to assign business calendars based on the country where the user is located, specify the *country* field name as the value for the Business Calendar setting. You can then map the business calendar keys (the values defined for the *country* field in the LDAP directory) to business calendars in forms workflow.

The amount of space used to display the name of the business calendar key in the forms workflow pages is limited. Limit the name of the business calendar key to fewer than 53 characters to avoid having it truncated on those pages.

**Modify Timestamp:** To enable delta directory synchronization, set this value to modify TimeStamp. (See Enable delta directory synchronization.)

**Organization:** Schema attribute for the name of the organization to which the user belongs.

**Primary Email:** Schema attribute for the primary email address of the user.

**Secondary Email:** Schema attribute for the secondary email address of the user.

**Telephone:** Schema attribute for the user's telephone number.

**Postal Address:** Schema attribute for the user's mailing address.

**Locale:** Schema attribute that contains the ISO locale information. The value is a two-letter language code or a language and country code.

**Time Zone:** Schema attribute that contains the time zone where the user is located. The value is a string such as City/Country.

**Enable Virtual List View (VLV) Control:** An LDAP control that enables AEM forms to retrieve data in batches from the directory server. If you are using Sun One as your LDAP directory and the directory contains many users, enabling VLV creates an index that User Management can use when searching users. This feature is useful when using a normal user account that can synchronize only a limited amount of data. You can also enable VLV for groups. If you select Enable Virtual List View (VLV) Control, specify a name in the Sort Field box.

>[!NOTE]
>
>To enable VLV, configure Sun One. See [Configure User Management to use Virtual List View (VLV)](configuring-directories.md#configure-user-management-to-use-virtual-list-view-vlv).

**Sort Field:** If you selected Enable Virtual List View (VLV) Control, specify the attribute name used to sort the index. This attribute name (such as uid) is the one you specified when you created an index for VLV on the directory server.

### Group settings {#group-settings}

**Unique Identifier:** (Mandatory) A unique and constant attribute used to identify groups. Use a non-DN attribute as the unique identifier. This setting depends on the directory server. The value is objectGUID for Active Directory 2003, nsuniqueID for Sun One, and guid for eDirectory.

>[!NOTE]
>
>Ensure that you enter an attribute that is guaranteed to be unique in your organization. Entering an incorrect value can cause serious system problems.

**Base DN:** (Mandatory) Base distinguished name of the directory.

Although Base DN is a mandatory setting in administration console, some directory servers such as IBM Domino Enterprise Server require an empty BaseDN. To specify an empty Base DN, export the config.xml file, edit the setting in the config.xml file, and then reimport it. (See [Importing and exporting the configuration file](/help/forms/using/admin-help/importing-exporting-configuration-file.md#importing-and-exporting-the-configuration-file).)

**Search Filter:** (Mandatory) The search filter to use to find the record that is associated with the group. You can perform a one-level search or a sub-level search.

**Description:** Schema attribute for the description of the group

**Full Name:** (Mandatory) Schema attribute for the full name of the group

**Member DN:** (Mandatory) Schema attribute for the distinguished name of members within a group

**Member Unique Identifier:** Unique identifier for a user or group that is a member of the selected group. This value depends on the directory server. The value is objectSID for AD2003, nsuniqueID for Sun One, and guid for eDirectory.

If Member DN is specified with a non-DN attribute, User Management uses Member Unique Identifier to query LDAP to collect the user's DN as it corresponds to a unique identifier value.

If DN is specified as a unique identifier, you do not need to configure Member Unique Identifier.

**Organization:** Schema attribute for the name of the organization to which the group belongs

**Primary Email:** Schema attribute for the primary email address of the group

**Secondary Email:** Schema attribute for the secondary email address of the group

**Modify Timestamp:** To enable delta directory synchronization, set this value to modify TimeStamp. (See Enable delta directory synchronization.)

**Enable Virtual List View (VLV) Control:** An LDAP control that enables AEM forms to retrieve data in batches from the directory server. If you are using Sun One as your LDAP directory and the directory contains many groups, enabling VLV creates an index that User Management can use when searching groups. This feature is useful when using a normal user account that can synchronize only a limited amount of data. You can also enable VLV for users. If you select Enable Virtual List View (VLV) Control, specify a Sort Field Name.

>[!NOTE]
>
>To enable VLV, configure Sun One. See [Configure User Management to use Virtual List View (VLV)](configuring-directories.md#configure-user-management-to-use-virtual-list-view-vlv).

**Sort Field Name:** If you selected Enable Virtual List View (VLV) Control, specify the attribute name used to sort the index. This attribute name is the one you specified when you created an index for VLV on the directory server.

>[!NOTE]
>
>Click Test to verify that the user and group settings are collected based on the base DN and search criteria.

If users and groups are returned, the results show the values that are assigned to each field as per the attribute set.

>[!NOTE]
>
>User Management does not support duplicate user IDs within a domain; only one user with the user ID is synchronized.

## Configure User Management to use Virtual List View (VLV) {#configure-user-management-to-use-virtual-list-view-vlv}

Directory synchronization is an important requirement for User Management. The users and groups are synchronized from an enterprise directory to the AEM forms database for assigning roles and permissions. The number of users varies from 100 to 100000+ depending on the requirements, and it poses an engineering challenge to synchronize data efficiently.

The LDAP protocol provides a mechanism to query large data sets in a paginated way by using request controls. When using Microsoft Active Directory, LDAP to AEM forms database synchronization uses PagedResultsControl for retrieving data in batches of a particular size. The Sun ONE Directory Server does not support this control. To complete a paginated query against the Sun ONE Directory Server, use the Virtual List View (VLV) control. This control involves both directory server-side configuration and client-side implementation.

>[!NOTE]
>
>This section describes using the VLV control for the Sun ONE Directory Server. However, you can use this control for any directory server that supports VLV control.

1. When configuring the directory, select Enable Virtual List View (VLV) Control on both the User Settings page and the Group Settings page. When you select the check box, you must also specify a sort name in the Sort Field box. The default value is uid. (See [Adding directories or custom SPIs](configuring-directories.md#adding-directories-or-custom-spis) or [Edit a directory](configuring-directories.md#edit-a-directory).)
1. Use Sun ONE administration console or a command-line script to create the LDAP VLV entries for users and groups. If you use a command-line script, you can use the sample users and groups LDIF files. (See [Configuring the Sun ONE Directory Server for VLV](configuring-directories.md#configuring-the-sun-one-directory-server-for-vlv).)
1. Stop the server and create the required index. (See [Create the Directory Server Index for VLV](configuring-directories.md#create-the-directory-server-index-for-vlv).)

### Configuring the Sun ONE Directory Server for VLV {#configuring-the-sun-one-directory-server-for-vlv}

Creating a VLV requires a pair of entries that include the `vlvSearch` and `vlvIndex` object classes. The vlvSearch entry includes a search base and the `vlvFilter` attribute, which specifies the object class that contains the attributes you intend to sort. The `vlvIndex` object class includes the `vlvSort` attribute, which specifies one or more attributes to sort and the order to sort them in. (A minus sign (-) denotes reverse alphabetical order). Using VLV with AEM forms requires separate entries for users and groups.

>[!NOTE]
>
>The Object entries can be created by using the Sun ONE graphical user interface (GUI) or through a command-line script. For instructions about creating the Object entries using the GUI, see the Sun ONE documentation.

Here is a sample script LDIF for VLV entry for users:

```text
 dn: cn=lcuser,cn=userRoot,cn=ldbm database,cn=plugins,cn=config
 objectclass: top
 objectclass: vlvSearch
 cn: lcuser
 vlvBase: dc=corp,dc=adobe,dc=com
 vlvScope: 2
 vlvFilter: (&(objectclass=inetOrgPerson))
 aci: (target="ldap:///cn=lcuser,cn=userRoot,cn=ldbm database,cn=plugins,cn=config")(targetattr="*")(version 3.0; acl "Config"
 ;allow(read,search,compare) userdn="ldap:///all"; )
 dn: cn=lcuser,cn=lcuser,cn=userRoot,cn=ldbm database,cn=plugins,cn=config
 cn: lcuser
 vlvSort: cn
 objectclass: top
 objectclass: vlvIndex
```

**Create the object entries using a script**

1. The sample script has an LDAP entry named `lcuser`. This entry is for VLV-related configuration for user synchronization in AEM forms. Modify the following properties accordingly:

   **Entry name:** The entry name in this sample is `lcuser`. If `lcuser` is changed, it must be changed in all areas of the sample script.

   **vlvBase:** The Base DN specified on the User Settings page.

   **vlvFilter:** The Search Filter specified on the User Settings page.

   **vlvSort:** The Sort Field specified in the VLV settings section of the User Settings page. A VLV control requires you to specify a sort control. This field is used as the sort parameter for the vlv index created.

   **aci:** The access control specified in the sample script grants any authenticated user the right to access the VLV indexes for read, search, and compare operations. The administrator can restrict access to a binding user, which is configured in the Directory Server Settings page specified in the User Management user interface. If permissions are not given, user search cannot use the VLV, and the LDAP server throws a permission exception.

   >[!NOTE]
   >
   >As a convention, the vlvIndex entry name is also set to `lcuser`, but you can give it a different name. Use the same name in the vlvindex tool. (See [Create the Directory Server Index for VLV](configuring-directories.md#create-the-directory-server-index-for-vlv)*.)*

1. Using the `ldapmodify` tool provided with Sun ONE Server, create a similar entry for groups by using the group's Base DN, Search Filter and Sort Field respectively:

   `server directory\shared\bin>ldapmodify -v -a -h host -p port -D "admin user" -w "password" -f "LDIF file location"`

   For example, type the following text:

   `D:\tools\ldap\sun\shared\bin> -v -a -h localhost -p 55850 -D "uid=admin,ou=administrators,ou=topologymanagement,o=netscaperoot" -w "admin" -f "D:\tools\ldap\data\vlv feature\users.ldif"`

### Create the Directory Server Index for VLV {#create-the-directory-server-index-for-vlv}

After configuring the directory settings and creating the LDAP VLV entries for users and groups, stop the server and create the required index.

1. After creating object entries, stop the Sun ONE Server.
1. Using the vlvindex tool, generate the index by typing the following text:

   *directory server instance* `\vlvindex.bat -n userRoot -T lcuser`

   The following output is generated:

   ```shell
    D:\tools\ldap\sun\shared\bin>..\..\slapd-chetanmeh-xp3\vlvindex.bat -n userRoot -T livecycle
    [21/Nov/2007:16:47:26 +051800] - userRoot: Indexing VLV: livecycle
    [21/Nov/2007:16:47:27 +051800] - userRoot: Indexed 1000 entries (5%).
    [21/Nov/2007:16:47:27 +051800] - userRoot: Indexed 2000 entries (9%).
    ...
    [21/Nov/2007:16:47:29 +051800] - userRoot: Indexed 20000 entries (94%).
    [21/Nov/2007:16:47:29 +051800] - userRoot: Indexed 21000 entries (99%).
    [21/Nov/2007:16:47:29 +051800] - userRoot: Finished indexing.
   ```

   The vlvindex tool is present in the directory server instance directory. If the Sun ONE Server has two instances running server1 and server2, the vlvindex tool is in *Sun ONE server directory*\server1 directory. The value for parameter `-T` is the value of the `cn` attribute of the vlvindex entry created previously in the sample LDIF. In this case, it is `lcuser`.

1. If VLV is also enabled for groups, create the corresponding index for the groups. Verify whether the indexes are created by running the following command:

   *sun one server directory* `\shared\bin>ldapsearch -h`*hostname* `-p`*port no* `-s base -b "" objectclass=*`

   Output such as the following sample data is generated:

   ```shell
    D:\tools\ldap\sun\shared\bin>ldapsearch.exe -h localhost -p 55850 -s base -b "" objectclass=*
    ldapsearch.exe: started Tue Nov 27 16:34:20 2007
    version: 1
    dn:
    objectClass: top
    namingContexts: dc=corp,dc=adobe,dc=com
    supportedExtension: 2.16.840.1.113730.3.5.7
    ...
    vlvsearch: cn=MCC ou=testdata dc=corp dc=adobe dc=com, cn=userRoot,cn=ldbm dat
        abase,cn=plugins,cn=config
    vlvsearch: cn=lcuser,cn=userRoot,cn=ldbm database,cn=plugins,cn=config
    vlvsearch: cn=Browsing ou=testdata,cn=userRoot,cn=ldbm database,cn=plugins,cn=
        config
    1 matches
   ```

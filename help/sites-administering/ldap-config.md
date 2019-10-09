---
title: Configuring LDAP with AEM 6
seo-title: Configuring LDAP with AEM 6
description: Learn how to configure LDAP with AEM.
seo-description: Learn how to configure LDAP with AEM.
uuid: 0007def4-86f0-401d-aa37-c8d49d5acea1
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: Security
content-type: reference
discoiquuid: 5faf6ee5-9242-48f4-87a8-ada887a3be1e
---

# Configuring LDAP with AEM 6 {#configuring-ldap-with-aem}

LDAP (the **L**ightweight **D**irectory **A**ccess **P**rotocol) is used for accessing centralized directory services. This helps reduce the effort required to manage user accounts as they can be accessed by multiple applications. One such LDAP server is Active Directory. LDAP is often used to achieve Single Sign On which allows a user to access multiple applications after logging in once.

User accounts can be synchronized between the LDAP server and the repository, with LDAP account details being saved in the repository. This allows the accounts to be assigned to repository groups for allocating the required permissions and privileges.

The repository uses LDAP authentication to authenticate such users, with credentials being passed to the LDAP server for validation, which is required before allowing access to the repository. To improve performance, successfully validated credentials can be cached by the repository, with an expiry timeout to ensure that revalidation does occur after an appropriate period.

When an account is removed from the LDAP server validation is no longer granted and so access to the repository is denied. Details of LDAP accounts that are saved in the repository can also be purged.

Use of such accounts is transparent to your users, they see no difference between user and group accounts created from LDAP and those created solely in the repository.

In AEM 6, LDAP support comes with a new implementation that requires a different type of configuration than with previous versions.

All LDAP configurations are now available as OSGi configurations. They can be configured via the Web Management console at:  
`https://serveraddress:4502/system/console/configMgr`

In order to have LDAP working with AEM, you need to create three OSGi configurations:

1. An LDAP Identity Provider (IDP).  
1. A Sync Handler.
1. An External Login Module.

>[!NOTE]
>
>Watch [Oak's External Login Module - Authenticating with LDAP and Beyond](https://docs.adobe.com/content/ddc/en/gems/oak-s-external-login-module---authenticating-with-ldap-and-beyon.html#) to deep dive External Login Modules.
>
>To read an example of configuring Experience Manager with Apache DS, see [Configuring Adobe Experience Manager 6.4 to use Apache Directory Service.](https://helpx.adobe.com/experience-manager/using/configuring-aem64-apache-directory-service.html)

## Configuring The LDAP Identity Provider {#configuring-the-ldap-identity-provider}

The LDAP Identity Provider is used to define how users are retrieved from the LDAP server.

It can be found in the management console under the **Apache Jackrabbit Oak LDAP Identity Provider** name.

The following configuration options are available for the LDAP Identity Provider:

<table> 
 <tbody> 
  <tr> 
   <td><strong>LDAP Provider Name</strong></td> 
   <td>Name of this LDAP provider configuration.</td> 
  </tr> 
  <tr> 
   <td><strong>LDAP Server Hostname</strong><br /> </td> 
   <td>Hostname of the LDAP server</td> 
  </tr> 
  <tr> 
   <td><strong>LDAP Server Port</strong></td> 
   <td>Port of the LDAP server</td> 
  </tr> 
  <tr> 
   <td><strong>Use SSL</strong></td> 
   <td>Indicates if an SSL (LDAPs) connection should be used.</td> 
  </tr> 
  <tr> 
   <td><strong>Use TLS</strong></td> 
   <td>Indicates if TLS should be started on connections.</td> 
  </tr> 
  <tr> 
   <td><strong>Disable certificate checking</strong></td> 
   <td>Indicates if server certificate validation should be disabled.</td> 
  </tr> 
  <tr> 
   <td><strong>Bind DN</strong></td> 
   <td>DN of the user for authentication. If this is left empty, an anonymous bind will be performed.</td> 
  </tr> 
  <tr> 
   <td><strong>Bind Password</strong></td> 
   <td>Password of the user for authentication</td> 
  </tr> 
  <tr> 
   <td><strong>Search timeout</strong></td> 
   <td>Time until a search times out</td> 
  </tr> 
  <tr> 
   <td><strong>Admin pool max active</strong></td> 
   <td>The maximum active size of the admin connection pool.</td> 
  </tr> 
  <tr> 
   <td><strong>User pool max active</strong></td> 
   <td>The maximum active size of the user connection pool.</td> 
  </tr> 
  <tr> 
   <td><strong>User base DN</strong></td> 
   <td>The DN for user searches</td> 
  </tr> 
  <tr> 
   <td><strong>User object classes</strong></td> 
   <td>The list of object classes an user entry must contain.</td> 
  </tr> 
  <tr> 
   <td><strong>User id attribute</strong></td> 
   <td>Name of the attribute that contains the user id.</td> 
  </tr> 
  <tr> 
   <td><strong>User extra filter</strong></td> 
   <td>Extra LDAP filter to use when searching for users. The final filter is formatted like: '(&amp;(&lt;idAttr&gt;=&lt;userId&gt;)(objectclass=&lt;objectclass&gt;)&lt;extraFilter&gt;)' (user.extraFilter)</td> 
  </tr> 
  <tr> 
   <td><strong>User DN paths</strong></td> 
   <td>Controls if the DN should be used for calculating a portion of the intermediate path.</td> 
  </tr> 
  <tr> 
   <td><strong>Group base DN</strong></td> 
   <td>The base DN for group searches.</td> 
  </tr> 
  <tr> 
   <td><strong>Group object classes</strong></td> 
   <td>The list of object classes a group entry must contain.</td> 
  </tr> 
  <tr> 
   <td><strong>Group name attribute</strong></td> 
   <td>Name of the attribute that contains the group name.</td> 
  </tr> 
  <tr> 
   <td><strong>Group extra filter</strong></td> 
   <td>Extra LDAP filter to use when searching for groups. The final filter isformatted like: '(&amp;(&lt;nameAttr&gt;=&lt;groupName&gt;)(objectclass=&lt;objectclass&gt;)&lt;extraFilter&gt;)'</td> 
  </tr> 
  <tr> 
   <td><strong>Group DN paths</strong></td> 
   <td>Controls if the DN should be used for calculating a portion of the intermediate path.</td> 
  </tr> 
  <tr> 
   <td><strong>Group member attribute</strong></td> 
   <td>Group attribute that contains the member(s) of a group.</td> 
  </tr> 
 </tbody> 
</table>

## Configuring The Synchronization Handler {#configuring-the-synchronization-handler}

The synchronization handler will define how the Indentity Provider users and groups will be synchronized with the repository.

It is located under the **Apache Jackrabbit Oak Default Sync Handler** name in the management console.

The following configurations options are available for the Synchronization Handler:

<table> 
 <tbody> 
  <tr> 
   <td><strong>Sync Handler Name</strong></td> 
   <td>Name of the sync configuration.</td> 
  </tr> 
  <tr> 
   <td><strong>User Expiration Time</strong></td> 
   <td>Duration until a synced user gets expired.</td> 
  </tr> 
  <tr> 
   <td><strong>User auto membership</strong></td> 
   <td>List of groups that a synced user is added to automatically.</td> 
  </tr> 
  <tr> 
   <td><strong>User property mapping</strong></td> 
   <td>List mapping definition of local properties from external ones.</td> 
  </tr> 
  <tr> 
   <td><strong>User Path Prefix</strong></td> 
   <td>The path prefix used when creating new users.</td> 
  </tr> 
  <tr> 
   <td><strong>User Membership Expiration</strong></td> 
   <td>Time after which membership expires.<br /> </td> 
  </tr> 
  <tr> 
   <td><strong>User membership nesting depth</strong></td> 
   <td>Returns the maximum depth of group nesting when membership relations are synced. A value of 0 effectively disables group membership lookup. A value of 1 only adds the direct groups of a user. This value has no effect when syncing individual groups only when syncing a users membership ancestry.</td> 
  </tr> 
  <tr> 
   <td><strong>Group Expiration Time</strong></td> 
   <td>Duration until a synced group expires.</td> 
  </tr> 
  <tr> 
   <td><strong>Group auto membership</strong></td> 
   <td>List of groups that a synced group is added to automatically.</td> 
  </tr> 
  <tr> 
   <td><strong>Group property mapping</strong></td> 
   <td>List mapping definition of local properties from external ones.</td> 
  </tr> 
  <tr> 
   <td><strong>Group path prefix</strong></td> 
   <td>The path prefix used when creating new groups.</td> 
  </tr> 
 </tbody> 
</table>

## The external login module {#the-external-login-module}

The external login module is located under the **Apache Jackrabbit Oak External Login Module** under the management console.

>[!NOTE]
>
>The Apache Jackrabbit Oak External Login Module implements the Java Authentication and Authorization Servi (JAAS) specifications. See the [official Oracle Java Security Reference Guide](https://docs.oracle.com/javase/8/docs/technotes/guides/security/jaas/JAASRefGuide.html) for more information.

Its job is to define which Identity Provider and Sync Handler to use, effectively binding the two modules.

The following configuration options are available:

| **JAAS Ranking** |Specifying the ranking (i.e. sort order) of this login module entry. The entries are sorted in a descending order (i.e. higher value ranked configurations come first). |
|---|---|
| **JAAS Control Flag** |Property specifying whether or not a LoginModule is REQUIRED, REQUISITE, SUFFICIENT or OPTIONAL.Refer to the JAAS configuration documentation for more details around the meaning of these flags. |
| **JAAS Realm** |The realm name (or application name) against which the LoginModule is be registered. If no realm name is provided then LoginModule is registered with a default realm as configured in the Felix JAAS configuration. |
| **Identity Provider Name** |Name of the identity provider. |
| **Sync Handler Name** |Name of the sync handler. |

>[!NOTE]
>
>If you plan on having more than one LDAP configuration with your AEM instance, separate Identity Providers and Synchronization Handlers need to be created for each configuration.

## Configure LDAP over SSL {#configure-ldap-over-ssl}

AEM 6 can be configured to authenticate with LDAP over SSL by following the below procedure:

1. Check the **Use SSL** or **Use TLS** checkboxes when configuring the [LDAP Identity Provider](#configuring-the-ldap-identity-provider).
1. Configure the Sync Handler and the External Login module according to your setup.
1. Install the SSL certificates in your Java VM if needed. This can be done by using keytool:

   `keytool -import -alias localCA -file <certificate location> -keystore <keystore location>`

1. Test the connection to the LDAP server.

### Creating SSL certificates {#creating-ssl-certificates}

Self signed certificates can be used when configuring AEM to authenticate with LDAP via SSL. Below is an example of a working procedure for generating certificates for use with AEM.

1. Make sure you have a SSL library installed and working. This procedure will use OpenSSL as an example.  

1. Create a customized OpenSSL configuration (cnf) file. This can be done by copying the default **openssl.cnf **configuration file and customizing it. On UNIX systems, it is usually located at `/usr/lib/ssl/openssl.cnf`  

1. Proceed to creating the CA root key by running the below command in a terminal:

   ```
   openssl genpkey -algorithm [public key algorithm] -out certificatefile.key -pkeyopt [public key algorithm option] 
   
   ```

1. Next, create a new self signed certificate:

   `openssl req -new -x509 -days [number of days for certification] -key certificatefile.key -out root-ca.crt -config CA/openssl.cnf`

1. Inspect the newly generated certificate to make sure everything is in order:

   `openssl x509 -noout -text -in root-ca.crt`

1. Make sure that all folders specified in the certificate configuration (.cnf) file exist. If not, create them.
1. Create a random seed, by running, for example:

   `openssl rand -out private/.rand 8192`

1. Move the created .pem files to the locations configured in the .cnf file.  

1. Finally, add the certificate to the Java keystore.

## Enabling debug logging {#enabling-debug-logging}

Debug logging can be enabled for both the LDAP Identity Provider and the External Login Module in order to troubleshoot connection issues.

In order to enable debug logging, you need to:

1. Go to the Web Management Console.
1. Find "Apache Sling Logging Logger Configuration" and create two loggers with the follwoing options:

* Log level: Debug
* Log File logs/ldap.log
* Message Pattern: {0,date,dd.MM.yyyy HH:mm:ss.SSS} &ast;{4}&ast; {2} {3} {5}
* Logger: org.apache.jackrabbit.oak.security.authentication.ldap

* Log level: Debug
* Log File: logs/external.log
* Message Pattern: {0,date,dd.MM.yyyy HH:mm:ss.SSS} &ast;{4}&ast; {2} {3} {5}
* Logger: org.apache.jackrabbit.oak.spi.security.authentication.external

## A Word on Group Affiliation {#a-word-on-group-affiliation}

Users synchronized through LDAP can be part of different groups in AEM. These groups can be external LDAP groups that will be added to AEM as part of the synchronization process, but they can also be groups that are added separately and are not part of the original LDAP group affiliation scheme.

In most cases, these can be groups that are added by a local AEM administrator or by any other identity provider.

If a user is removed from a group on the LDAP server, the change will also be reflected on the AEM side upon synchronization. However, all the other group affiliations of the user that were not added by LDAP will remain in place.

AEM detects and handles the purging of users from external groups by making use of the `rep:externalId` property. This property is added automatically to any user or group that is synchronized by the Synchronization Handler and it contains information on the originating identity provider.

For more information, see Apache Oak documentation on [User and Group Synchronization](https://jackrabbit.apache.org/oak/docs/security/authentication/usersync.html).

## Known issues {#known-issues}

If you plan on using LDAP over SSL, make sure the certificates you are using are created without the Netscape comment option. If this option is enabled, authentication will fail with a SSL Handshake error.  


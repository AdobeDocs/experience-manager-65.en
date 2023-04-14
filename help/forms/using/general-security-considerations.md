---
title: General Security Considerations for AEM Forms on JEE
seo-title: General Security Considerations for AEM Forms on JEE
description: Learn how to prepare for hardening your AEM Forms on JEE environment.
seo-description: Learn how to prepare for hardening your AEM Forms on JEE environment.
uuid: 4d098731-fc8f-41d7-98b5-5c2e31211614
content-type: reference
topic-tags: Security
products: SG_EXPERIENCEMANAGER/6.4
discoiquuid: 64bc6018-2828-4634-9275-48f1d411452b
docset: aem65

role: Admin
exl-id: 3f150dd5-f486-4f16-9de9-035cde53b034
---
# General Security Considerations for AEM Forms on JEE{#general-security-considerations-for-aem-forms-on-jee}

This article provides introductory information that helps you prepare for hardening your AEM Forms environment. It includes prerequisite information about AEM Forms on JEE, operating system, application server, and database security. Review this information before you continue to lock down your environment.

## Vendor-specific security information {#vendor-specific-security-information}

This section contains security-related information about operating systems, application servers, and databases that are incorporated into your AEM Forms on JEE solution.

Use the links in this section to find vendor-specific security information for your operating system, database, and application server.

### Operating system security information {#operating-system-security-information}

When securing your operating system, carefully consider implementing the measures described by your operating system vendor, including the following:

* Defining and controlling users, roles, and privileges
* Monitoring logs and audit trails
* Removing unnecessary services and applications
* Backing up files

For security information about operating systems that AEM Forms on JEE supports, see the resources in the table:

<table>
 <thead>
  <tr>
   <th><p>Operating System</p> </th>
   <th><p>Security Resource</p> </th>
  </tr>
 </thead>
 <tbody>
  <tr>
   <td><p>IBM&reg; AIX&reg; 7.2</p> </td>
   <td><p><a href="https://www.ibm.com/support/knowledgecenter/ssw_aix_72/com.ibm.aix.security/security-kickoff.htm" target="_blank">IBM&reg; AIX&reg; Security Benefits</a></p> </td>
  </tr>
  <tr>
   <td><p>Microsoft&reg; Windows Server&reg; 2016 </p> </td>
   <td><p><a href="https://cloudblogs.microsoft.com/windowsserver/2017/08/22/now-available-windows-server-2016-security-guide/">Windows Server 2016 Security Guide</a></p> </td>
  </tr>
  <tr>
   <td><p>Red Hat&reg; Linux&reg; AP or ES</p> </td>
   <td><p><a href="https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/pdf/security_guide/Red_Hat_Enterprise_Linux-7-Security_Guide-en-US.pdf" target="_blank">Red Hat&reg; Enterprise Linux&reg; Security Guide</a></p> </td>
  </tr>
  <tr>
   <td><p>Sun Solaris&trade; 11</p> </td>
   <td><p><a href="https://docs.oracle.com/cd/E53394_01/html/E54807/index.html" target="_blank">Security and Hardening Guidelines</a></p> </td>
  </tr>
  <tr>
   <td>Oracle Linux&reg; 7 Update 3</td>
   <td><a href="https://docs.oracle.com/en/operating-systems/oracle-linux/7/security/" target="_blank">Security Guide for Release 7</a><br /> </td>
  </tr>
  <tr>
   <td>CentOS 7<sup> </sup></td>
   <td><a href="https://wiki.centos.org/HowTos/OS_Protection" target="_blank">Protection documentation</a></td>
  </tr>
 </tbody>
</table>

### Application server security information {#application-server-security-information}

When securing your application server, carefully consider implementing the measures described by your server vendor, including the following:

* Using non-obvious administrator user name
* Disabling unnecessary services
* Securing the console manager
* Enabling secure cookies
* Closing unneeded ports
* Limiting clients by IP addresses or domains
* Using the Java&trade; Security Manager to programmatically restrict privileges

For security information about application servers that AEM Forms on JEE supports, see the resources in this table.

<table>
 <thead>
  <tr>
   <th><p>Application Server</p> </th>
   <th><p>Security Resource</p> </th>
  </tr>
 </thead>
 <tbody>
  <tr>
   <td><p>Oracle WebLogic&reg;</p> </td>
   <td><p>Search for Understanding WebLogic Security at <a href="https://docs.oracle.com/">https://docs.oracle.com/</a>.</p> </td>
  </tr>
  <tr>
   <td><p>IBM&reg; WebSphere&reg;</p> </td>
   <td><p><a href="https://www.ibm.com/developerworks/websphere/zones/was/security/" target="_blank">Securing applications and their environment</a></p> </td>
  </tr>
  <tr>
   <td><p>Red Hat&reg; JBoss&reg;</p> </td>
   <td><p><a href="https://docs.jboss.org/author/display/AS7/Security%20subsystem%20configuration.html">Security subsystem configuration</a></p> </td>
  </tr>
 </tbody>
</table>

### Database security information {#database-security-information}

When securing your database, consider implementing the measures described by your database vendor, including the following:

* Restricting operations with access control lists (ACLs)
* Using non-standard ports
* Hiding the database behind a firewall
* Encrypting sensitive data before writing it to the database (see the database manufacturer's documentation)

For security information about databases that AEM Forms on JEE supports, see the resources in this table.

<table>
 <thead>
  <tr>
   <th><p>Database</p> </th>
   <th><p>Security Resource</p> </th>
  </tr>
 </thead>
 <tbody>
  <tr>
   <td><p>IBM&reg; DB2&reg; 11.1</p> </td>
   <td><p><a href="https://www-01.ibm.com/software/data/db2/library/">DB2&reg; Product Family Library</a></p> </td>
  </tr>
  <tr>
   <td><p>Microsoft&reg; SQL Server 2016</p> </td>
   <td>Search the Web for "SQL Server 2016: Security"</td>
  </tr>
  <tr>
   <td><p>MySQL 5</p> </td>
   <td><p><a href="https://dev.mysql.com/doc/refman/5.0/en/security.html">MySQL 5.0 General Security Issues</a></p> <p><a href="https://dev.mysql.com/doc/refman/5.1/en/security.html">MySQL 5.1 General Security Issues</a></p> </td>
  </tr>
  <tr>
   <td><p>Oracle&reg; 12c</p> </td>
   <td><p>See the Security chapter in the <a href="https://docs.oracle.com/database/121/TDPSG/GUID-6E2F4E53-5D87-4FCD-9C9C-6792217D7014.htm#TDPSG94426" target="_blank">Oracle 12g documentation</a></p> </td>
  </tr>
 </tbody>
</table>

This table describes the default ports that are required to be open during your AEM Forms on JEE configuration process. If you are connecting over https, adjust your port information and IP addresses accordingly. For more information about configuring ports, see the *Installing and Deploying AEM Forms on JEE* document for your application server.

<table>
 <thead>
  <tr>
   <th><p>Product or service</p> </th>
   <th><p>Port number</p> </th>
  </tr>
 </thead>
 <tbody>
  <tr>
   <td><p>JBoss&reg;</p> </td>
   <td><p>8080</p> </td>
  </tr>
  <tr>
   <td><p>WebLogic</p> </td>
   <td><p>7001</p> </td>
  </tr>
  <tr>
   <td>><p>WebLogic Managed Server</p> </td>
   <td><p>Set by administrator during configuration</p> </td>
  </tr>
  <tr>
   <td>><p>WebSphere&reg;</p> </td>
   <td><p>9060, if Global Security is enabled the default SSL port value is 9043.</p> <p>9080</p> </td>
  </tr>
  <tr>
   <td>><p>BAM Server</p> </td>
   <td><p>7001</p> </td>
  </tr>
  <tr>
   <td>><p>SOAP</p> </td>
   <td><p>8880</p> </td>
  </tr>
  <tr>
   <td>><p>MySQL</p> </td>
   <td><p>3306</p> </td>
  </tr>
  <tr>
   <td>><p>Oracle</p> </td>
   <td><p>1521</p> </td>
  </tr>
  <tr>
   <td>><p>DB2&reg;</p> </td>
   <td><p>50000</p> </td>
  </tr>
  <tr>
   <td>><p>SQL Server</p> </td>
   <td><p>1433</p> </td>
  </tr>
  <tr>
   <td>><p>LDAP</p> </td>
   <td><p>The port on which the LDAP server is running. The default port is typically 389. However, if you select the SSL option, the default port is typically 636. Confirm with your LDAP administrator which port to specify.</p> </td>
  </tr>
 </tbody>
</table>

### Configuring JBoss&reg; to use a non-default HTTP port {#configuring-jboss-to-use-a-non-default-http-port}

JBoss&reg; Application Server uses 8080 as the default HTTP port. JBoss&reg; also has pre-configured ports 8180, 8280, and 8380, which are commented out in the jboss-service.xml file. If you have an application on your computer that already uses this port, change the port that AEM Forms on JEE uses by following these steps:

1. Open the following file for editing:

   Single-Server installation: [JBoss&reg; root]/standalone/configuration/standalone.xml

   Cluster installtions: [JBoss&reg; root]/domain/configuration/domain.xml

1. Change the value of **port** attribute in the **&lt;socket-binding&gt;** tag to a custom port number. For example, the following uses port 8090:

   &lt;socket-binding name="http" port="8090"/&gt;

1. Save and close the file.
1. Restart the JBoss&reg; application server.

## AEM Forms on JEE security considerations {#aem-forms-on-jee-security-considerations}

This section describes some AEM Forms on JEE-specific security issues that you should know about.

### Email credentials not encrypted in database {#email-credentials-not-encrypted-in-database}

The email credentials stored by applications are not encrypted before they are stored in the AEM Forms on JEE database. When you configure a service endpoint to use email, any password information used as part of that endpoint configuration is not encrypted when it is stored in the database.

### Sensitive content for Rights Management in the database {#sensitive-content-for-rights-management-in-the-database}

AEM Forms on JEE uses the AEM Forms on JEE database to store sensitive document key information and other cryptographic material that is used for policy documents. Securing the database against intrusion helps to protect this sensitive information.

### Password in clear text form {#password-in-clear-text-format-in-adobe-ds-xml}

The application server that is used to run AEM Forms on JEE requires its own configuration for access to your database through a data source that is configured on the application server. Ensure that your application server does not expose your database password in clear text in its data source configuration file.

The lc_[database].xml file should not contain password in clear text format. Consult your application server vendor about how to encrypt these passwords for your application server.

>[!NOTE]
>
>The AEM Forms on JEE JBoss&reg; turnkey installer encrypts the database password.

IBM&reg; WebSphere&reg; Application Server and Oracle WebLogic Server may encrypt data source passwords by default. However, you should confirm with your application server documentation to ensure that it is happening.

### Protecting the private key stored in Trust Store {#protecting-the-private-key-stored-in-trust-store}

The private keys or credentials imported in Trust Store are stored in AEM Forms on JEE database. To secure the database and restrict access to designated administrators only, take appropriate precautions.

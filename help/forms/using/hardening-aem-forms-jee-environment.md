---
title: Hardening Your AEM Forms on JEE Environment
seo-title: Hardening Your AEM Forms on JEE Environment
description: Learn a variety of security-hardening settings to enhance the security of AEM Forms on JEE running in a corporate intranet.
seo-description: Learn a variety of security-hardening settings to enhance the security of AEM Forms on JEE running in a corporate intranet.
uuid: f6c63690-6376-4fe1-9df2-a14fbfd62aff
content-type: reference
topic-tags: Security
products: SG_EXPERIENCEMANAGER/6.4
discoiquuid: 6b380e92-f90d-4875-b7a2-f3958daf2364
role: Admin
exl-id: 6fb260f9-d0f8-431e-8d4e-535b451e4124
---
# Hardening Your AEM Forms on JEE Environment {#hardening-your-aem-forms-on-jee-environment}

Learn a variety of security-hardening settings to enhance the security of AEM Forms on JEE running in a corporate intranet.

The article describes recommendations and best practices for securing servers that run AEM Forms on JEE. This is not a comprehensive host-hardening document for your operating system and application servers. Instead, this article describes a variety of security-hardening settings that you should implement to enhance the security of AEM Forms on JEE that is running within a corporate intranet. To ensure that the AEM Forms on JEE application servers stay secure, however, you should also implement security monitoring, detection, and response procedures.

The article describes hardening techniques that should be applied during the following stages during the installation and configuration life cycle:

* **Pre-installation:** Use these techniques before you install AEM Forms on JEE.
* **Installation:** Use these techniques during the AEM Forms on JEE installation process.
* **Post-installation:** Use these techniques after installation and periodically thereafter.

AEM Forms on JEE is highly customizable and can work in many different environments. Some of the recommendations may not fit your organization's needs.

## Preinstallation {#preinstallation}

Before installing AEM Forms on JEE , you can apply security solutions to the network layer and operating system. This section describes some issues and makes recommendations for reducing security vulnerabilities in these areas.

**Installation and configuration on UNIX and Linux**

You should not install or configure AEM Forms on JEE using a root shell. By default, files are installed under the /opt directory, and the user who performs the installation needs all file permissions under /opt. Alternatively, an installation can be performed under an individual user's /user directory where they already have all file permissions.

**Installation and configuration on Windows**

You should perform the installation on Windows as an administrator if you are installing AEM Forms on JEE on JBoss by using the turnkey method or if you are installing PDF Generator. Also, when installing PDF Generator on Windows with native application support, you must run the installation as the same Windows user who installed Microsoft Office. For more information about installation privileges, see the* Installing and Deploying AEM Forms on JEE* document for your application server.

### Network layer security {#network-layer-security}

Network security vulnerabilities are among the first threats to any Internet-facing or intranet-facing application server. This section describes the process of hardening hosts on the network against these vulnerabilities. It addresses network segmentation, Transmission Control Protocol/Internet Protocol (TCP/IP) stack hardening, and the use of firewalls for host protection.

The following table describes common processes that reduce network security vulnerabilities.

<table> 
 <thead> 
  <tr> 
   <th><p>Issue</p> </th> 
   <th><p>Description</p> </th> 
  </tr> 
 </thead> 
 <tbody>
  <tr> 
   <td><p>Demilitarized zones (DMZs)</p> </td> 
   <td><p>Deploy forms servers within a demilitarized zone (DMZ). Segmentation should exist in at least two levels with the application server used to run AEM Forms on JEE placed behind the inner firewall. Separate the external network from the DMZ that contains the web servers, which in turn must be separated from the internal network. Use firewalls to implement the layers of separation. Categorize and control the traffic that passes through each network layer to ensure that only the absolute minimum of required data is allowed.</p> </td> 
  </tr> 
  <tr> 
   <td><p>Private IP addresses</p> </td> 
   <td><p>Use Network Address Translation (NAT) with RFC 1918 private IP addresses on AEM Forms application server. Assign private IP addresses (10.0.0.0/8, 172.16.0.0/12, and 192.168.0.0/16) to make it more difficult for an attacker to route traffic to and from a NAT'd internal host through the Internet.</p> </td> 
  </tr> 
  <tr> 
   <td><p>Firewalls</p> </td> 
   <td><p>Use the following criteria to select a firewall solution:</p> 
    <ul> 
     <li><p>Implement firewalls that support proxy servers and/or <em>stateful inspection</em> instead of simple packet-filtering solutions.</p> </li> 
     <li><p>Use a firewall that supports a <em>deny all services except those explicitly permitted</em> security paradigms.</p> </li> 
     <li><p>Implement a firewall solution that is dual-homed or multihomed. This architecture provides the greatest level of security and helps to prevent unauthorized users from bypassing the firewall security.</p> </li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td><p>Database ports</p> </td> 
   <td><p>Do not use default listening ports for databases (MySQL - 3306, Oracle - 1521, MS SQL - 1433). For information about changing database ports, see your database documentation.</p> <p>Using a different database port affects the overall AEM Forms on JEE configuration. If you change default ports, you must make corresponding modifications in other areas of configuration, such as the data sources for AEM Forms on JEE.</p> <p>For information about configuring data sources in AEM Forms on JEE, see Install and Upgrade AEM Forms on JEE or Upgrading to AEM Forms on JEE for your application server at <a href="/help/forms/using/introduction-aem-forms.md" target="_blank">AEM Forms user guide</a>.</p> </td> 
  </tr> 
 </tbody> 
</table>

### Operating system security {#operating-system-security}

The following table describes some potential approaches to minimizing security vulnerabilities found in the operating system.

<table> 
 <thead> 
  <tr> 
   <th><p>Issue</p></th> 
   <th><p>Description</p></th> 
  </tr> 
 </thead> 
 <tbody>
  <tr> 
   <td><p>Security patches</p></td> 
   <td><p>There is an increased risk that an unauthorized user may gain access to the application server if vendor security patches and upgrades are not applied in a timely fashion. Test security patches before you apply them to production servers.</p><p>Also, create policies and procedures to check for and install patches on a regular basis.</p></td> 
  </tr> 
  <tr> 
   <td><p>Virus protection software</p></td> 
   <td><p>Virus scanners can identify infected files by scanning for a signature or watching for unusual behavior. Scanners keep their virus signatures in a file, which is usually stored on the local hard drive. Because new viruses are discovered often, you should frequently update this file for the virus scanner to identify all current viruses.</p></td> 
  </tr> 
  <tr> 
   <td><p>Network Time Protocol (NTP)</p></td> 
   <td><p>For forensic analysis, keep accurate time on the forms servers. Use NTP to synchronize the time on all systems that are connected directly to the Internet.</p></td> 
  </tr> 
 </tbody> 
</table>

For additional security information for your operating system, see ["Operating system security information"](https://helpx.adobe.com/aem-forms/6-1/hardening-security/general-security-considerations.html#operating_system_security_information).

## Installation {#installation}

This section describes techniques you can use during the AEM Forms installation process to reduce security vulnerabilities. In some cases, these techniques use options that are part of the installation process. The following table describes these techniques.

<table> 
 <thead> 
  <tr> 
   <th><p>Issue</p> </th> 
   <th><p>Description</p> </th> 
  </tr> 
 </thead> 
 <tbody>
  <tr> 
   <td><p>Privileges</p> </td> 
   <td><p>Use the least number of privileges necessary to install the software. Log in to your computer by using an account that is not in the Administrators group. On Windows, you can use the Run As command to run the AEM Forms on JEE installer as an administrative user. On UNIX and Linux systems, use a command such as <code>sudo</code> to install the software.</p> </td> 
  </tr> 
  <tr> 
   <td><p>Software source</p> </td> 
   <td><p>Do not download or run AEM Forms on JEE from untrusted sources.</p> <p>Malicious programs can contain code to violate security in several ways, including data theft, modification and deletion, and denial of service. Install AEM Forms on JEE from the Adobe DVD or only from a trusted source.</p> </td> 
  </tr> 
  <tr> 
   <td><p>Disk partitions</p> </td> 
   <td><p>Place AEM Forms on JEE on a dedicated disk partition. Disk segmentation is a process that keeps specific data on your server on separate physical disks for added security. Arranging data in this way reduces the risk of directory traversal attacks. Plan to create a partition that is separate from the system partition on which you can install the AEM Forms on JEE content directory. (On Windows, the system partition contains the system32 directory, or boot partition.)</p> </td> 
  </tr> 
  <tr> 
   <td><p>Components</p> </td> 
   <td><p>Evaluate existing services and disable or uninstall any that are not required. Do not install unnecessary components and services.</p> <p>The default installation of an application server might include services that are not necessary for your use. You should disable all unnecessary services prior to deployment to minimize points of entry for an attack. For example, on JBoss, you can comment out unnecessary services in the META-INF/jboss-service.xml descriptor file.</p> </td> 
  </tr> 
  <tr> 
   <td><p>Cross-domain policy file</p> </td> 
   <td><p>The presence of a <code>crossdomain.xml</code> file on the server may immediately weaken that server. It is recommended that you make the list of domains as restrictive as possible. Do not place the <code>crossdomain.xml</code> file that was used during development into production when using Guides <em>(deprecated)</em>. For a guide that uses web services, if the service is on the same server that served up the guide, a <code>crossdomain.xml</code> file is not needed at all. But if the service is on another server, or if clusters are involved, the presence of a <code>crossdomain.xml</code> file would be needed. Refer to <a href="https://kb2.adobe.com/cps/142/tn_14213.html">https://kb2.adobe.com/cps/142/tn_14213.html</a>, for more information on the crossdomain.xml file.</p> </td> 
  </tr> 
  <tr> 
   <td><p>Operating System security settings</p> </td> 
   <td><p>If you need to use 192-bit or 256-bit XML encryption on Solaris platforms, ensure that you install <code>pkcs11_softtoken_extra.so</code> instead of <code>pkcs11_softtoken.so</code>.</p> </td> 
  </tr> 
 </tbody> 
</table>

## Post-installation steps {#post-installation-steps}

After you successfully install AEM Forms on JEE, it is important to periodically maintain the environment from a security perspective.

The following section describes in detail the different tasks that are recommended to secure the deployed forms server.

### AEM Forms security {#aem-forms-security}

The following recommended settings apply to the AEM Forms on JEE server outside of the administrative web application. To reduce the security risks to the server, apply these settings immediately after installing AEM Forms on JEE.

**Security patches**

There is an increased risk that an unauthorized user might gain access to the application server if vendor security patches and upgrades are not applied in a timely fashion. Test security patches before you apply them to production servers to ensure compatibility and availability of applications. Also, create policies and procedures to check for and install patches on a regular basis. AEM Forms on JEE updates are on the Enterprise products download site.

**Service accounts (JBoss turnkey on Windows only)**

AEM Forms on JEE installs a service, by default, by using the LocalSystem account. The built-in LocalSystem user account has a high level of accessibility; it is part of the Administrators group. If a worker-process identity runs as the LocalSystem user account, that worker process has full access to the entire system.

To run the application server on which AEM Forms on JEE is deployed, using a specific non-administrative account, follow these instructions:

1. In the Microsoft Management Console (MMC), create a local user for the forms server service to log in as:

    * Select **User cannot change password**.
    * On the **Member Of** tab, ensure that the **Users** group is listed.

   >[!NOTE]
   >
   >You cannot change this setting for PDF Generator.

1. Select **Start** &gt; **Settings** &gt; **Administrative Tools** &gt; **Services**. 
1. Double-click the JBoss for AEM Forms on JEE and stop the service.
1. On the **Log On** tab, select **This Account**, browse for the user account you created, and enter the password for the account.
1. In the MMC, open **Local Security Settings** and select **Local Policies** &gt; **User Rights Assignment**.
1. Assign the following rights to the user account that the forms server is running under:

    * Deny log on through Terminal Services
    * Deny log on locally
    * Log on as Service (should be already set)

1. Give the new user account modify permissions on the following directories: 
    * **Global Document Storage (GDS) directory**: The location of the GDS directory is configured manually during the AEM Forms installation process. If the location setting remains empty during installation, the location defaults to a directory under the application server installation at `[JBoss root]/server/[type]/svcnative/DocumentStorage`
    * **CRX-Repository directory**: The default location is `[AEM-Forms-installation-location]\crx-repository`  
    * **AEM Forms temporary directories**:  
        * (Windows) TMP or TEMP path as set in the environment variables
        * (AIX, Linux, or Solaris) Logged-in user's home directory
        On UNIX-based systems, a non-root user can use the following directory as the temporary directory:
        * (Linux) /var/tmp or /usr/tmp
        * (AIX) /tmp or /usr/tmp
        * (Solaris) /var/tmp or /usr/tmp
1. Give the new user account write permissions on the following directories:
    * [JBoss-directory]\standalone\deployment
    * [JBoss-directory]\standalone\
    * [JBoss-directory]\bin\
    
    >[!NOTE]
    >
    >The default installation location of JBoss Application Server:
    >
    >* Windows: C:\Adobe\Adobe_Experience_Manager_Forms\jboss
    >* Linux: /opt/jboss/

1. Start the application server.

**Disabling the Configuration Manager bootstrap servlet**

Configuration Manager made use of a servlet deployed on your application server to perform bootstrapping of the AEM Forms on JEE database. Because Configuration Manager accesses this servlet before configuration is complete, access to it has not been secured for authorized users, and it should be disabled after you have successfully used Configuration Manager to configure AEM Forms on JEE.

1. Unzip the adobe-livecycle-[appserver].ear file.
1. Open the META-INF/application.xml file.
1. Search for the adobe-bootstrapper.war section:

   ```java
   <!-- bootstrapper start --> 
   <module id="WebApp_adobe_bootstrapper"> 
       <web> 
           <web-uri>adobe-bootstrapper.war</web-uri> 
           <context-root>/adobe-bootstrapper</context-root> 
       </web> 
   </module> 
   <module id="WebApp_adobe_lcm_bootstrapper_redirector"> 
       <web> 
           <web-uri>adobe-lcm-bootstrapper-redirector.war</web-uri> 
           <context-root>/adobe-lcm-bootstrapper</context-root> 
       </web> 
   </module> 
   <!-- bootstrapper end-->
   ```

1. Stop the AEM Forms server.
1. Comment out the adobe-bootstrapper.war and the adobe-lcm-bootstrapper-redirectory. war modules as follows:

   ```java
   <!-- bootstrapper start --> 
   <!-- 
   <module id="WebApp_adobe_bootstrapper"> 
       <web> 
           <web-uri>adobe-bootstrapper.war</web-uri> 
           <context-root>/adobe-bootstrapper</context-root> 
       </web> 
   </module> 
   <module id="WebApp_adobe_lcm_bootstrapper_redirector"> 
       <web> 
           <web-uri>adobe-lcm-bootstrapper-redirector.war</web-uri> 
           <context-root>/adobe-lcm-bootstrapper</context-root> 
       </web> 
   </module> 
   --> 
   <!-- bootstrapper end-->
   ```

1. Save and close the META-INF/application.xml file.
1. Zip the EAR file and redeploy it to the application server.
1. Start the AEM Forms server.
1. Type the below URL into a browser to test the change and ensure that it no longer works.

   https://&lt;localhost&gt;:&lt;port&gt;/adobe-bootstrapper/bootstrap

**Lockdown remote access to the Trust Store**

Configuration Manager lets you upload a Acrobat Reader DC extensions credential to the AEM Forms on JEE trust store. This means that access to the Trust Store Credential Service over remote protocols (SOAP and EJB) has been enabled by default. This access is no longer necessary after you have uploaded the Rights credential using Configuration Manager or if you decide to use the Administration Console later to manage credentials.

You can disable remote access to all of the Trust Store services by following the steps in the section [Disabling non-essential remote access to services](https://helpx.adobe.com/aem-forms/6-1/hardening-security/configuring-secure-administration-settings-aem.html#disabling_non_essential_remote_access_to_services).

**Disable all non-essential anonymous access**

Some forms server services have operations that may be invoked by an anonymous caller. If anonymous access to these services is not required, disable it by following the steps in [Disabling non-essential anonymous access to services](https://helpx.adobe.com/aem-forms/6-1/hardening-security/configuring-secure-administration-settings-aem.html#disabling_non_essential_anonymous_access_to_services).

#### Change the default administrator password {#change-the-default-administrator-password}

When AEM Forms on JEE is installed, a single default user account is configured for user Super Administrator/ login-id Administrator with a default password of *password*. You should immediately change this password using the Configuration Manager.

1. Type the following URL in a web browser:

   ```java
   https://[host name]:[port]/adminui
   ```

   The default port number is one of these:

   **JBoss:** 8080

   **WebLogic Server:** 7001

   **WebSphere:** 9080. 

1. In the **User Name** field, type `administrator` and, in the **Password** field, type `password`.
1. Click **Settings** &gt; **User Management** &gt; **Users and Groups**.
1. Type `administrator` in the **Find** field, and click **Find**.
1. Click **Super Administrator** from the list of users.
1. Click **Change Password** on the Edit User page.
1. Specify the new password and click **Save**.

In addition, it is recommended to change the default password for CRX Administrator by performing the following steps:

1. Log into `https://[server]:[port]/lc/libs/granite/security/content/useradmin.html` using the default username/password.
1. Type Administrator in the search field and click **Go**.
1. Select **Administrator** from the search result and click the **Edit** icon at the lower right of the user interface.
1. Specify the new password in the **New Password** field and the old password in the **Your Password** field.
1. Click the Save icon at the lower right of the user interface.

#### Disable WSDL generation {#disable-wsdl-generation}

Web Service Definition Language (WSDL) generation should be enabled only for development environments, where WSDL generation is used by developers to build their client applications. You may choose to disable WSDL generation in a production environment to avoid exposing a service's internal details.

1. Type the following URL in a web browser:

   ```java
   https://[host name]:[port]/adminui
   ```

1. Click **Settings &gt; Core System Settings &gt; Configurations**.
1. Deselect **Enable WSDL** and click **OK**.

### Application server security {#application-server-security}

The following table describes some techniques for securing your application server after the AEM Forms on JEE application is installed.

<table> 
 <thead> 
  <tr> 
   <th><p>Issue</p> </th> 
   <th><p>Description</p> </th> 
  </tr> 
 </thead> 
 <tbody>
  <tr> 
   <td><p>Application server administrative console</p> </td> 
   <td><p>After you install, configure, and deploy AEM Forms on JEE on your application server, you should disable access to the application server administrative consoles. See your application server documentation for details.</p> </td> 
  </tr> 
  <tr> 
   <td><p>Application server cookie settings</p> </td> 
   <td><p>Application cookies are controlled by the application server. When deploying the application, the application server administrator can specify cookie preferences on a server-wide or application-specific basis. By default, the server settings take preference.</p> <p>All session cookies generated by your application server should include the <code>HttpOnly</code> attribute. For example, when using the JBoss Application Server, you can modify the SessionCookie element to <code>httpOnly="true"</code> in the <code>WEB-INF/web.xml</code> file.</p> <p>You can restrict cookies to be sent using HTTPS-only. As a result, they are not sent unencrypted over HTTP. Application server administrators should enable secure cookies for the server on a global basis. For example, when using the JBoss Application Server, you can modify the connector element to <code>secure=true</code> in the <code>server.xml</code> file.</p> <p>See your application server documentation for more details on cookie settings.</p> </td> 
  </tr> 
  <tr> 
   <td><p>Directory browsing</p> </td> 
   <td><p>When someone requests a page that does not exist or requests the name of a director (the request string ends with a forward slash (/)), the application server should not return the contents of that directory. To prevent this, you can disable directory browsing on your application server. You should do this for the administration console application and for other applications running on your server.</p> <p>For JBoss, set the value of the listings initialization parameter of the <code>DefaultServlet</code> property to <code>false</code> in the web.xml file, as shown by this example:</p> <p>&lt;servlet&gt;</p> <p>&lt;servlet-name&gt;default&lt;/servlet-name&gt;</p> <p>&lt;servlet-class&gt;</p> <p>org.apache.catalina.servlets.DefaultServlet</p> <p>&lt;/servlet-class&gt;</p> <p>&lt;init-param&gt;</p> <p>&lt;param-name&gt;listings&lt;/param-name&gt;</p> <p>&lt;param-value&gt;false&lt;/param-value&gt;</p> <p>&lt;/init-param&gt;</p> <p>&lt;load-on-startup&gt;1&lt;/load-on-startup&gt;</p> <p>&lt;/servlet&gt;</p> <p>For WebSphere, set the <code>directoryBrowsingEnabled</code> property in the ibm-web-ext.xmi file to <code>false</code>.</p> <p>For WebLogic, set the index-directories properties in the weblogic.xml file to <code>false</code>, as shown by this example:</p> <p>&lt;container-descriptor&gt;</p> <p>&lt;index-directory-enabled&gt;false</p> <p>&lt;/index-directory-enabled&gt;</p> <p>&lt;/container-descriptor&gt;</p> </td> 
  </tr> 
 </tbody> 
</table>

### Database security {#database-security}

When securing your database, you should implement the measures described by your database vendor. You should allocate a database user with the minimum required database permissions granted for use by AEM Forms on JEE. For example, do not use an account with database administrator privileges.

On Oracle, the database account that you use needs only the CONNECT, RESOURCE, and CREATE VIEW privileges. For similar requirements on other databases, see [Preparing to Install AEM Forms on JEE (Single Server)](https://www.adobe.com/go/learn_aemforms_prepareInstallsingle_64).

#### Configuring integrated security for SQL Server on Windows for JBoss {#configuring-integrated-security-for-sql-server-on-windows-for-jboss}

1. Modify [JBOSS_HOME]\\standalone\configuration\lc_{datasource.xml} to add `integratedSecurity=true` to the connection URL, as shown in this example:

   ```java
    jdbc:sqlserver://<serverhost>:<port>;databaseName=<dbname>;integratedSecurity=true
   ```

1. Add the sqljdbc_auth.dll file to the Windows systems path on the computer that is running the application server. The sqljdbc_auth.dll file is located with the Microsoft SQL JDBC 6.2.1.0 driver installation.
1. Modify JBoss Windows service (JBoss for AEM Forms on JEE) property for Log On As from Local System to a login account that has AEM Forms database and a minimum set of privileges. If you are running JBoss from the command line instead of as a Windows service, you do not need to perform this step.
1. Set Security for SQL Server from **Mixed** mode to **Windows Authentication only**.

#### Configuring integrated security for SQL Server on Windows for WebLogic {#configuring-integrated-security-for-sql-server-on-windows-for-weblogic}

1. Start the WebLogic Server Administration Console by typing the following URL in the URL line of a web browser:

   ```java
   https://[host name]:7001/console
   ```

1. Under Change Center, click **Lock & Edit**.
1. Under Domain Structure, click *[base_domain]* &gt; **Services** &gt; **JDBC** &gt; **Data Sources** and, in the right pane, click **IDP_DS**.
1. On the next screen, on the **Configuration** tab, click the **Connection Pool** tab and, in the **Properties** box, type `integratedSecurity=true`.
1. Under Domain Structure, click **[base_domain]** &gt; **Services** &gt; **JDBC** &gt; **Data Sources** and, in the right pane, click **RM_DS**.
1. On the next screen, on the **Configuration** tab, click the **Connection Pool** tab and, in the **Properties** box, type `integratedSecurity=true`.
1. Add the sqljdbc_auth.dll file to the Windows systems path on the computer that is running the application server. The sqljdbc_auth.dll file is located with the Microsoft SQL JDBC 6.2.1.0 driver installation.
1. Set Security for SQL Server from **Mixed** mode to **Windows Authentication only**.

#### Configuring integrated security for SQL Server on Windows for WebSphere {#configuring-integrated-security-for-sql-server-on-windows-for-websphere}

On WebSphere, you can configure integrated security only when you use an external SQL Server JDBC driver, not the SQL Server JDBC driver that is embedded with WebSphere.

1. Log in to the WebSphere Administrative Console.
1. In the navigation tree, click **Resources** &gt; **JDBC** &gt; **Data Sources** and, in the right pane, click **IDP_DS**. 
1. In the right pane, under Additional Properties, click **Custom Properties**, and then click **New**.
1. In the **Name** box, type `integratedSecurity` and, in the **Value** box, type `true`.
1. In the navigation tree, click **Resources** &gt; **JDBC** &gt; **Data Sources** and, in the right pane, click **RM_DS**.
1. In the right pane, under Additional Properties, click **Custom Properties**, and then click **New**.
1. In the **Name** box, type `integratedSecurity` and, in the **Value** box, type `true`. 
1. On the computer where WebSphere is installed, add the sqljdbc_auth.dll file to the Windows systems path (C:\Windows). The sqljdbc_auth.dll file is in the same location as the Microsoft SQL JDBC 1.2 driver installation (default is *[InstallDir]*/sqljdbc_1.2/enu/auth/x86).
1. Select **Start** &gt; **Control Panel** &gt; **Services**, right-click the Windows service for WebSphere (IBM WebSphere Application Server &lt;version&gt; - &lt;node&gt;) and select **Properties**.
1. In the Properties dialog box, click the **Log On** tab.
1. Select **This Account** and provide the information required to set the login account you want to use. 
1. Set Security on SQL Server from **Mixed** mode to **Windows Authentication only**.

### Protecting access to sensitive content in the database {#protecting-access-to-sensitive-content-in-the-database}

The AEM Forms database schema contains sensitive information about system configuration and business processes and should be hidden behind the firewall. The database should be considered within the same trust boundary as the forms server. To guard against information disclosure and theft of business data, the database must be configured by the database administrator (DBA) to allow access only by authorized administrators.

As an added precaution, you should consider using database vendor-specific tools to encrypt columns in tables that contain the following data:

* Rights Management Document Keys
* Trust Store HSM PIN encryption key
* Local User Password Hashes

For information about vendor-specific tools, see ["Database security information"](https://helpx.adobe.com/aem-forms/6-1/hardening-security/general-security-considerations.html#database_security_information).

### LDAP security {#ldap-security}

A Lightweight Directory Access Protocol (LDAP) directory is typically used by AEM Forms on JEE as a source for enterprise user and group information, and a means to perform password authentication. You should ensure that your LDAP directory is configured to use Secure Socket Layer (SSL) and that AEM Forms on JEE is configured to access your LDAP directory using its SSL port.

#### LDAP denial of service {#ldap-denial-of-service}

A common attack using LDAP involves an attacker deliberately failing to authenticate multiple times. This forces the LDAP Directory Server to lock out a user from all LDAP-reliant services.

You can set the number of failure attempts and subsequent lock-out time that AEM Forms implements when a user repeatedly fails to authenticate to AEM Forms. In Administration Console, choose low values. When selecting the number of failure attempts, it is important to understand that after all attempts are made, AEM Forms locks out the user before the LDAP Directory Server does.

#### Set automatic account locking {#set-automatic-account-locking}

1. Log in to Administration Console.
1. Click **Settings** &gt; **User Management** &gt; **Domain Management**.
1. Under Automatic Account Locking Settings, set **Maximum Consecutive Authentication Failures** to a low number, such as 3.
1. Click **Save**.

### Auditing and logging {#auditing-and-logging}

The proper and secure use of application auditing and logging can help ensure that security and other anomalous events are tracked and detected as quickly as possible. Effective use of auditing and logging within an application includes such items as tracking successful and failed logins, as well as key application events such as the creation or deletion of key records.

You can use auditing to detect many types of attacks, including these:

* Brute force password attacks
* Denial of service attacks
* Injection of hostile input and related classes of scripting attacks

This table describes auditing and logging techniques you can use to reduce your server's vulnerabilities.

<table> 
 <thead> 
  <tr> 
   <th><p>Issue</p> </th> 
   <th><p>Description</p> </th> 
  </tr> 
 </thead> 
 <tbody>
  <tr> 
   <td><p>Log file ACLs</p> </td> 
   <td><p>Set appropriate AEM Forms on JEE log file access control lists (ACLs).</p> <p>Setting the appropriate credentials helps prevent attackers from deleting the files.</p> <p>The security permissions on the log file directory should be Full Control for Administrators and SYSTEM groups. The AEM Forms user account should have Read and Write permissions only.</p> </td> 
  </tr> 
  <tr> 
   <td><p>Log file redundancy</p> </td> 
   <td><p>If resources permit, send logs to another server in real time that is not accessible by the attacker (write only) by using Syslog, Tivoli, Microsoft Operations Manager (MOM) Server, or another mechanism.</p> <p>Protecting logs this way helps prevent tampering. Also, storing logs in a central repository aids in correlation and monitoring (for example, if multiple forms servers are in use and a password-guessing attack is taking place across multiple computers where each computer is queried for a password).</p> </td> 
  </tr> 
 </tbody> 
</table>

### Enable a non-administrator user to run PDF Generator

You can enable a non-administrator user to use PDF Generator. Normally, only users with administrative privileges can use PDF Generator. Perform the following steps to enable a non-administrator user to run PDF Generator:

1. Create an environment variable name PDFG_NON_ADMIN_ENABLED.

1. Set value of the variable to TRUE.

1. Restart the AEM Forms instance.

## Configuring AEM Forms on JEE for access beyond the enterprise {#configuring-aem-forms-on-jee-for-access-beyond-the-enterprise}

After you successfully install AEM Forms on JEE, it is important to periodically maintain the security of your environment. This section describes the tasks that are recommended to maintain the security of your AEM Forms on JEE production server.

### Setting up a reverse proxy for web access {#setting-up-a-reverse-proxy-for-web-access}

A *reverse proxy* can be used to ensure that one set of URLs for AEM Forms on JEE web applications are available to both external and internal users. This configuration is more secure than allowing users to connect directly to the application server that AEM Forms on JEE is running on. The reverse proxy performs all HTTP requests for the application server that is running AEM Forms on JEE. Users have only network access to the reverse proxy and can only attempt URL connections that are supported by the reverse proxy.

**AEM Forms on JEE root URLs for use with reverse proxy server**

The following application root URLs for each AEM Forms on JEE web application. You should configure your reverse proxy only to expose URLs for web application functionality that you want to provide to end users.

Certain URLs are highlighted as end-user-facing web applications. You should avoid exposing other URLs for Configuration Manager for access to external users through the reverse proxy.

<table> 
 <thead> 
  <tr> 
   <th><p>Root URL</p> </th> 
   <th><p>Purpose and/or associated web application</p> </th> 
   <th><p>Web-based interface</p> </th> 
   <th><p>End-user access</p> </th> 
  </tr> 
 </thead> 
 <tbody>
  <tr> 
   <td><p>/ReaderExtensions/*</p> </td> 
   <td><p>Acrobat Reader DC extensions end-user web application for applying usage rights to PDF documents</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>Yes</p> </td> 
  </tr> 
  <tr> 
   <td><p>/edc/*</p> </td> 
   <td><p>Rights Management end-user web application</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>Yes</p> </td> 
  </tr> 
  <tr> 
   <td><p>/edcws/*</p> </td> 
   <td><p>Web service URL for Rights Management</p> </td> 
   <td><p>No</p> </td> 
   <td><p>Yes</p> </td> 
  </tr> 
  <tr> 
   <td><p>/pdfgui/*</p> </td> 
   <td><p>PDF Generator administration web application</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>Yes</p> </td> 
  </tr> 
  <tr> 
   <td><p>/workspace/*</p> </td> 
   <td><p>Workspace end-user web application</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>Yes</p> </td> 
  </tr> 
  <tr> 
   <td><p>/workspace-server/*</p> </td> 
   <td><p>Workspace servlets and data services that the Workspace client application requires</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>Yes</p> </td> 
  </tr> 
  <tr> 
   <td><p>/adobe-bootstrapper/*</p> </td> 
   <td><p>Servlet for bootstrapping the AEM Forms on JEE repository</p> </td> 
   <td><p>No</p> </td> 
   <td><p>No</p> </td> 
  </tr> 
  <tr> 
   <td><p>/soap/*</p> </td> 
   <td><p>Information page for forms server web services</p> </td> 
   <td><p>No</p> </td> 
   <td><p>No</p> </td> 
  </tr> 
  <tr> 
   <td><p>/soap/services/*</p> </td> 
   <td><p>Web service URL for all forms server services</p> </td> 
   <td><p>No</p> </td> 
   <td><p>No</p> </td> 
  </tr> 
  <tr> 
   <td><p>/edc/admin/*</p> </td> 
   <td><p>Rights Management administration web application</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>No</p> </td> 
  </tr> 
  <tr> 
   <td><p>/adminui/*</p> </td> 
   <td><p>Administration Console home page</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>No</p> </td> 
  </tr> 
  <tr> 
   <td><p>/TruststoreComponent/</p> <p>secured/*</p> </td> 
   <td><p>Trust Store Management administration pages</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>No</p> </td> 
  </tr> 
  <tr> 
   <td><p>/FormsIVS/*</p> </td> 
   <td><p>Forms IVS application for testing and debugging form rendering</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>No</p> </td> 
  </tr> 
  <tr> 
   <td><p>/OutputIVS/*</p> </td> 
   <td><p>Output IVS application for testing and debugging output service</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>No</p> </td> 
  </tr> 
  <tr> 
   <td><p>/rmws/*</p> </td> 
   <td><p>REST URL for Rights Management</p> </td> 
   <td><p>No</p> </td> 
   <td><p>Yes</p> </td> 
  </tr> 
  <tr> 
   <td><p>/OutputAdmin/*</p> </td> 
   <td><p>Output administration pages</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>No</p> </td> 
  </tr> 
  <tr> 
   <td><p>/FormServer/*</p> </td> 
   <td><p>Forms web application files</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>No</p> </td> 
  </tr> 
  <tr> 
   <td><p>/FormServer/GetImage</p> <p>Servlet</p> </td> 
   <td><p>Used for fetching JavaScript during HTML transformation</p> </td> 
   <td><p>No</p> </td> 
   <td><p>No</p> </td> 
  </tr> 
  <tr> 
   <td><p>/FormServerAdmin/*</p> </td> 
   <td><p>Forms administration pages</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>No</p> </td> 
  </tr> 
  <tr> 
   <td><p>/repository/*</p> </td> 
   <td><p>URL for WebDAV (debugging) access</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>No</p> </td> 
  </tr> 
  <tr> 
   <td><p>/AACComponent/*</p> </td> 
   <td><p>Applications and Services user interface</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>No</p> </td> 
  </tr> 
  <tr> 
   <td><p>/WorkspaceAdmin/*</p> </td> 
   <td><p>Workspace administration pages</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>No</p> </td> 
  </tr> 
  <tr> 
   <td><p>/rest/*</p> </td> 
   <td><p>Rest support pages</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>No</p> </td> 
  </tr> 
  <tr> 
   <td><p>/CoreSystemConfig/*</p> </td> 
   <td><p>AEM Forms on JEE Core Configuration settings page</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>No</p> </td> 
  </tr> 
  <tr> 
   <td><p>/um/</p> </td> 
   <td><p>User Management authentication</p> </td> 
   <td><p>No</p> </td> 
   <td><p>Yes</p> </td> 
  </tr> 
  <tr> 
   <td><p>/um/*</p> </td> 
   <td><p>User Management administration interface</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>No</p> </td> 
  </tr> 
  <tr> 
   <td><p>/DoumentManager/*</p> </td> 
   <td><p>Uploading and downloading of documents that are to be processed when accessing remoting endpoints, SOAP WSDL endpoints, and the Java SDK over SOAP transport or EJB transport with HTTP documents enabled.</p> </td> 
   <td><p>Yes</p> </td> 
   <td><p>Yes</p> </td> 
  </tr> 
 </tbody> 
</table>

## Protecting from Cross-Site Request Forgery attacks {#protecting-from-cross-site-request-forgery-attacks}

A Cross-Site Request Forgery (CSRF) attack exploits the trust that a website has for the user, to transmit commands that are unauthorized and unintended by the user. The attack is set up by including a link or a script in a web page, or a URL in an email message, to access another site to which the user has already been authenticated.

For example, you may be logged in to Administration Console while simultaneously browsing another website. One of the web pages may include an HTML image tag with a `src` attribute that targets a server-side script on the victim website. By leveraging the cookie-based session-authentication mechanism provided by web browsers, the attacking website can send malicious requests to this victim server-side script, masquerading as the legitimate user. For more examples, see [https://owasp.org/www-community/attacks/csrf#Examples](https://owasp.org/www-community/attacks/csrf#Examples).

The following characteristics are common to CSRF:

* Involve sites that rely on a user's identity.
* Exploit the site's trust in that identity.
* Trick the user's browser into sending HTTP requests to a target site.
* Involve HTTP requests that have side effects.

AEM Forms on JEE uses the Referrer Filter feature to block CSRF attacks. The following terms are used in this section to describe the Referrer Filtering mechanism:

* **Allowed Referrer:** A Referrer is the address of the source page that sends a request to the server. For JSP pages or forms, the Referrers is usually the previous page in the browsing history. Referrer for images are usually the pages on which the images are displayed. You can identify the Referrer that are allowed access to your server resources by adding them to the Allowed Referrer list.
* **Allowed Referrer Exceptions:** You may want to restrict the scope of access for a particular Referrer in your Allowed Referrer list. To enforce this restriction you can add individual paths of that Referrer to the Allowed Referrer Exceptions list. Requests originating from paths in the Allowed Referrer Exceptions list are prevented from invoking any resource on the forms server. You can define Allowed Referrer Exceptions for a specific application and also use a global list of exceptions that apply to all applications.
* **Allowed URIs:** This is a list of resources that are to be served without checking the Referrer Header. Resources, for example, help pages, that do not result in state changes on the server, can be added to this list. The resources in the Allowed URIs list are never blocked by the Referrer Filter irrespective of who the Referrer is.
* **Null Referrer:** A server request that is not associated with or does not originate from a parent web page is considered to be a request from a Null Referrer. For example, when you open a new browser window, type an address, and press enter, the Referrer sent to the server is null. A desktop application (.NET or SWING) making an HTTP request to a web server, also sends a Null Referrer to the server.

### Referrer Filtering {#referer-filtering}

The Referrer Filtering process can be described as follows:

1. The forms server checks the HTTP method used for invocation:

    1. If it is POST, the forms server performs the Referrer header check.
    1. If it is GET, the forms server bypasses the Referrer check, unless *CSRF_CHECK_GETS* is set to true, in which case it performs the Referrer header check. *CSRF_CHECK_GETS* is specified in the *web.xml* file for your application.

1. The forms server checks whether the requested URI exists in allowlist:

    1. If the URI is allowlisted, the server accepts the request.
    1. If the requested URI is not allowlisted, the server retrieves the Referrer of the request.

1. If there is a Referrer in the request, the server checks whether it is an Allowed Referrer. If it is allowed, the server checks for a Referrer Exception:

    1. If it is an exception, the request is blocked.
    1. If it is not an exception, the request is passed.

1. If there is no Referrer in the request, the server checks whether a Null Referrer is allowed:

    1. If a Null Referrer is allowed, the request is passed.
    1. If a Null Referrer is not allowed, the server checks whether the requested URI is an exception for the Null Referrer and handles the request accordingly.

### Managing Referrer Filtering {#managing-referer-filtering}

AEM Forms on JEE provides a Referrer Filter to specify Referrer that are allowed access to your server resources. By default, the Referrer filter does not filter requests that use a safe HTTP method, e.g. GET, unless *CSRF_CHECK_GETS* is set to true. If the port number for an Allowed Referrer entry is set to 0, AEM Forms on JEE will allow all requests with Referrer from that host regardless of the port number. If no port number is specified, only requests from the default port 80 (HTTP) or port 443 (HTTPS) are allowed. Referrer Filtering is disabled if all the entries in the Allowed Referrer list are deleted.

When you first install Document Services, the Allowed Referrer list is updated with the address of the server on which Document Services is installed. The entries for the server include the server name, the IPv4 address, the IPv6 address if IPv6 is enabled, the loopback address, and a localhost entry. The names added to the Allowed Referrer list are returned by Host operating system. For example a server with an IP address of 10.40.54.187 will include the following entries: `https://server-name:0, https://10.40.54.187:0, https://127.0.0.1:0, http://localhost:0`. For any unqualified name retuned by Host operating system (names that do not have IPv4 address, IPv6 address or qualified domain name) allowlist is not updated. Modify the Allowed Referrer list to suit your business environment. Do not deploy the forms server in the production environment with the default Allowed Referrer list. After modifying any of the Allowed Referrer, Referrer Exceptions, or URIs, ensure that you restart the server for the changes to take effect.

**Managing Allowed Referrer list**

You can manage the Allowed Referrer list from the User Management Interface of Administration Console. The User Management Interface provides you with the functionality to create, edit, or delete the list. Refer to the * [Preventing CSRF attacks](/help/forms/using/admin-help/preventing-csrf-attacks.md)* section of the *administration help* for more information on working with the Allowed Referrer list.

**Managing Allowed Referrer Exception and Allowed URI lists**

AEM Forms on JEE provides APIs to manage the Allowed Referrer Exception list and the Allowed URI list. You can use these APIs to retrieve, create, edit, or delete the list. Following is a list of available APIs:

* createAllowedURIsList
* getAllowedURIsList
* updateAllowedURIsList
* deleteAllowedURIsList
* addAllowedRefererExceptions
* getAllowedRefererExceptions
* updateAllowedRefererExceptions
* deleteAllowedRefererExceptions

Refer to the* AEM Forms on JEE API Reference* for more information on the APIs.

Use the ***LC_GLOBAL_ALLOWED_REFERER_EXCEPTION*** list for Allowed Referrer Exceptions at the global level i.e. to define exceptions that are applicable to all applications. This list contains only URIs with either an absolute path (e.g. `/index.html`) or a relative path (e.g. `/sample/`). You can also append a regular expression to the end of a relative URI, e.g. `/sample/(.)*`.

The ***LC_GLOBAL_ALLOWED_REFERER_EXCEPTION*** list ID is defined as a constant in the `UMConstants` class of the `com.adobe.idp.um.api` namespace, found in `adobe-usermanager-client.jar`. You can use the AEM Forms APIs to create, modify, or edit this list. For example, to create the Global Allowed Referrer Exceptions list use:

```java
addAllowedRefererExceptions(UMConstants.LC_GLOBAL_ALLOWED_REFERER_EXCEPTION, Arrays.asList("/index.html", "/sample/(.)*"))
```

Use the ***CSRF_ALLOWED_REFERER_EXCEPTIONS*** list for application-specific exceptions.

**Disabling the Referrer Filter**

In the event that the Referrer Filter completely blocks access to the forms server and you cannot edit the Allowed Referrer list, you can update the server startup script and disable Referrer Filtering.

Include the `-Dlc.um.csrffilter.disabled=true` JAVA argument in the startup script and restart the server. Ensure that you delete the JAVA argument after you have appropriately reconfigured the Allowed Referrer list.

**Referrer Filtering for Custom WAR files**

You may have created custom WAR files to work with AEM Forms on JEE in order to meet your business requirements. To enable Referrer Filtering for your custom WAR files, include ***adobe-usermanager-client.jar*** in the class path for the WAR and include a filter entry in the* web.xml* file with the following parameters:

**CSRF_CHECK_GETS** controls the Referrer check on GET requests. If this parameter is not defined, the default value is set to false. Include this parameter only if you want to filter your GET requests.

**CSRF_ALLOWED_REFERER_EXCEPTIONS** is the ID of the Allowed Referrer Exceptions list. The Referrer Filter prevents requests originating from Referrers in the list identified by the list ID, from invoking any resource on the forms server.

**CSRF_ALLOWED_URIS_LIST_NAME** is the ID of the Allowed URIs list. The Referrer Filter does not block requests for any of the resources in the list identified by the list ID, regardless of the value of the Referrer header in the request.

**CSRF_ALLOW_NULL_REFERER** controls the Referrer Filter behavior when the Referrer is null or not present. If this parameter is not defined, the default value is set to false. Include this parameter only if you want to allow Null Referrers. Allowing null referrers may allow some types of Cross Site Request Forgery attacks.

**CSRF_NULL_REFERER_EXCEPTIONS** is a list of the URIs for which a Referrer check is not performed when the Referrer is null. This parameter is enabled only when *CSRF_ALLOW_NULL_REFERER* is set to false. Separate multiple URIs in the list with a comma.

Following is an example of the filter entry in the *web.xml* file for a ***SAMPLE*** WAR file:

```java
<filter> 
       <filter-name> filter-name </filter-name> 
       <filter-class> com.adobe.idp.um.auth.filter.RemoteCSRFFilter </filter-class> 
     <!-- default is false --> 
     <init-param> 
      <param-name> CSRF_ALLOW_NULL_REFERER </param-name> 
      <param-value> false </param-value> 
     </init-param> 
     <!-- default is false --> 
     <init-param> 
      <param-name> CSRF_CHECK_GETS </param-name> 
      <param-value> true </param-value> 
     </init-param> 
     <!-- Optional --> 
     <init-param> 
       <param-name> CSRF_NULL_REFERER_EXCEPTIONS </param-name> 
       <param-value> /SAMPLE/login, /SAMPLE/logout  </param-value> 
     </init-param> 
     <!-- Optional --> 
     <init-param> 
      <param-name> CSRF_ALLOWED_REFERER_EXCEPTIONS </param-name> 
      <param-value> SAMPLE_ALLOWED_REF_EXP_ID </param-value> 
     </init-param> 
     <!-- Optional --> 
     <init-param> 
      <param-name> CSRF_ALLOWED_URIS_LIST_NAME </param-name> 
      <param-value> SAMPLE_ALLOWED_URI_LIST_ID     </param-value> 
     </init-param> 
</filter> 
    ........ 
    <filter-mapping> 
      <filter-name> filter-name </filter-name> 
      <url-pattern>/*</url-pattern> 
    </filter-mapping>
```

**Troubleshooting**

If legitimate server requests are being blocked by the CSRF filter, try one of the following:

* If the rejected request has a Referrer header, carefully consider adding it to the Allowed Referrer list. Add only Referrer that you trust.
* If the rejected request does not have a Referrer header, modify your client application to include a Referrer header.
* If the client can work in a browser, try that deployment model.
* As a last resort you can add the resource to the Allowed URIs list. This is not a recommended setting.

## Secure network configuration {#secure-network-configuration}

This section describes the protocols and ports that are required by AEM Forms on JEE and provides recommendations for deploying AEM Forms on JEE in a secure network configuration.

### Network protocols used by AEM Forms on JEE {#network-protocols-used-by-aem-forms-on-jee}

When you configure a secure network architecture as described in the previous section, the following network protocols are required for interaction between AEM Forms on JEE and other systems in your enterprise network.

<table> 
 <thead> 
  <tr> 
   <th><p>Protocol</p> </th> 
   <th><p>Use</p> </th> 
  </tr> 
 </thead> 
 <tbody>
  <tr> 
   <td><p>HTTP</p> </td> 
   <td> 
    <ul> 
     <li><p>Browser displays Configuration Manager and end-user web applications</p> </li> 
     <li><p>All SOAP connections</p> </li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td><p>SOAP</p> </td> 
   <td> 
    <ul> 
     <li><p>Web service client applications, such as .NET applications</p> </li> 
     <li><p>Adobe Reader&reg; uses SOAP for AEM Forms on JEE server web services</p> </li> 
     <li><p>Adobe Flash&reg; applications uses SOAP for forms server web services</p> </li> 
     <li><p>AEM Forms on JEE SDK calls when used in SOAP mode</p> </li> 
     <li><p>Workbench design environment</p> </li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td><p>RMI</p> </td> 
   <td><p>AEM Forms on JEE SDK calls when used in Enterprise JavaBeans (EJB) mode</p> </td> 
  </tr> 
  <tr> 
   <td><p>IMAP / POP3</p> </td> 
   <td> 
    <ul> 
     <li><p>Email-based input to a service (Email endpoint)</p> </li> 
     <li><p>User task notifications over email</p> </li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td><p>UNC File IO</p> </td> 
   <td><p>AEM Forms on JEE monitoring of watched folders for input to a service (watched folder endpoint)</p> </td> 
  </tr> 
  <tr> 
   <td><p>LDAP</p> </td> 
   <td> 
    <ul> 
     <li><p>Synchronizations of organizational user and group information in a directory</p> </li> 
     <li><p>LDAP authentication for interactive users</p> </li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td><p>JDBC</p> </td> 
   <td> 
    <ul> 
     <li><p>Query and procedure calls made to an external database during execution of a process using the JDBC service</p> </li> 
     <li><p>Internal access AEM Forms on JEE repository</p> </li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td><p>WebDAV</p> </td> 
   <td><p>Enables remote browsing of the AEM Forms on JEE design-time repository (forms, fragments, and so on) by any WebDAV client</p> </td> 
  </tr> 
  <tr> 
   <td><p>AMF</p> </td> 
   <td><p>Adobe Flash applications, where AEM Forms on JEE server services are configured with a Remoting endpoint</p> </td> 
  </tr> 
  <tr> 
   <td><p>JMX</p> </td> 
   <td><p>AEM Forms on JEE exposes MBeans for monitoring using JMX</p> </td> 
  </tr> 
 </tbody> 
</table>

### Ports for application servers {#ports-for-application-servers}

This section describes the default ports (and alternate configuration ranges) for each type of application server supported. These ports must be enabled or disabled on the inner firewall, depending on the network functionality you want to allow for clients that connect to the application server running AEM Forms on JEE.

>[!NOTE]
>
>By default, the server exposes several JMX MBeans under the adobe.com namespace. Only information that is useful for server health monitoring is exposed. However, to prevent information disclosure, you should prevent callers in an untrusted network from looking up JMX MBeans and accessing health metrics.

**JBoss ports**

<table> 
 <thead> 
  <tr> 
   <th><p>Purpose</p> </th> 
   <th><p>Port</p> </th> 
  </tr> 
 </thead> 
 <tbody>
  <tr> 
   <td><p>Access to web applications</p> </td> 
   <td><p>[JBOSS_Root]/standalone/configuration/lc_[database].xml</p> <p>HTTP/1.1 Connector port 8080</p> <p>AJP 1.3 Connector port 8009</p> <p>SSL/TLS Connector port 8443</p> </td> 
  </tr> 
  <tr> 
   <td><p>CORBA support</p> </td> 
   <td><p>[JBoss root]/server/all/conf/jacorb.properties</p> <p>OAPort 3528</p> <p>OASSLPort 3529</p> </td> 
  </tr> 
 </tbody> 
</table>

**WebLogic ports**

<table> 
 <thead> 
  <tr> 
   <th><p>Purpose</p> </th> 
   <th><p>Port</p> </th> 
  </tr> 
 </thead> 
 <tbody>
  <tr> 
   <td><p>Access to web applications</p> </td> 
   <td> 
    <ul> 
     <li><p>Admin Server listen port: default is 7001</p> </li> 
     <li><p>Admin Server SSL listen port: default is 7002</p> </li> 
     <li><p>Port configured for Managed Server, for example 8001</p> </li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td><p>WebLogic administration ports not required for access to AEM Forms on JEE</p> </td> 
   <td> 
    <ul> 
     <li><p>Managed Server listen port: Configurable from 1 to 65534</p> </li> 
     <li><p>Managed Server SSL listen port: Configurable from 1 to 65534</p> </li> 
     <li><p>Node Manager listen port: default is 5556</p> </li> 
    </ul> </td> 
  </tr> 
 </tbody> 
</table>

**WebSphere ports**

For information about WebSphere ports that AEM Forms on JEE requires, go to Port number setting in WebSphere Application Server UI.

### Configuring SSL {#configuring-ssl}

Referring to the physical architecture that is described in the section [AEM Forms on JEE physical architecture](hardening-aem-forms-jee-environment.md#aem-forms-on-jee-physical-architecture), you should configure SSL for all of the connections that you plan to use. Specifically, all SOAP connections must be conducted over SSL to prevent exposure of user credentials on a network.

For instructions on how to configure SSL on JBoss, WebLogic, and WebSphere, see "Configuring SSL" in the [administration help](https://www.adobe.com/go/learn_aemforms_admin_64).

For instructions on how to import certificates to JVM (Java Virtual Machine) configured for an AEM Forms server, see Mutual Authentication section in [AEM Forms Workbench Help](https://www.adobe.com/go/learn_aemforms_workbench_65).

### Configuring SSL redirect {#configuring-ssl-redirect}

After you configure your application server to support SSL, you must ensure that all HTTP traffic to applications and services are enforced to use the SSL port.

To configure SSL redirect for WebSphere or WebLogic, see your application server documentation.

1. Open command prompt, navigate to the /JBOSS_HOME/standalone/configuration directory, and execute the following command:

   `keytool -genkey -alias jboss7 -keyalg RSA -keystore server.keystore -validity 10950`

1. Open the JBOSS_HOME/standalone/configuration/standalone.xml file for editing.

   After the &lt;subsystem xmlns="urn:jboss:domain:web:1.1" native="false" default-virtual-server="default-host"&gt; element, add the following details:

   &lt;connector name="https" protocol="HTTP/1.1" scheme="https" socket-binding="https" enabled="true" secure="true"/&gt;

1. Add the following code in the https connector element:

   ```xml
   <connector name="https" protocol="HTTP/1.1" scheme="https" socket-binding="https" secure="true" enabled="true"> 
    <ssl name="jboss7_ssl" key-alias="jboss71" password="Tibco321" certificate-key-file="../standalone/configuration/server.keystore" protocol="TLSv1"/> 
    </connector>
   ```

   Save and close the standalone.xml file.

## Windows-specific security recommendations {#windows-specific-security-recommendations}

This section contains security recommendations that are specific to Windows when used to run AEM Forms on JEE.

### JBoss Service accounts {#jboss-service-accounts}

The AEM Forms on JEE turnkey installation sets up a service account, by default, using the Local System account. The built-in Local System user account has a high level of accessibility; it is part of the Administrators group. If a worker process identity runs as the Local System user account, that worker process has full access to the entire system.

#### Run the application server using a non-administrative account {#run-the-application-server-using-a-non-administrative-account}

1. In the Microsoft Management Console (MMC), create a local user for the forms server service to log in as:

    * Select **User cannot change password**.
    * On the **Member Of** tab, ensure that the Users group is listed.

1. Select **Settings** &gt; **Administrative Tools** &gt; **Services**.
1. Double-click the application server service and stop the service.
1. On the **Log On** tab, select **This Account**, browse for the user account you created, and enter the password for the account. 
1. In the Local Security Settings window, under User Rights Assignment, give the following rights to the user account that the forms server is running under:

    * Deny log on through Terminal Services
    * Deny log on locallyxx
    * Log on as Service (should be already set)

1. Give the new user account modify permissions on the following directories: 
    * **Global Document Storage (GDS) directory**: The location of the GDS directory is configured manually during the AEM Forms installation process. If the location setting remains empty during installation, the location defaults to a directory under the application server installation at `[JBoss root]/server/[type]/svcnative/DocumentStorage`
    * **CRX-Repository directory**: The default location is `[AEM-Forms-installation-location]\crx-repository`  
    * **AEM Forms temporary directories**:  
        * (Windows) TMP or TEMP path as set in the environment variables
        * (AIX, Linux, or Solaris) Logged-in user's home directory
        On UNIX-based systems, a non-root user can use the following directory as the temporary directory:
        * (Linux) /var/tmp or /usr/tmp
        * (AIX) /tmp or /usr/tmp
        * (Solaris) /var/tmp or /usr/tmp
1. Give the new user account write permissions on the following directories:
    * [JBoss-directory]\standalone\deployment
    * [JBoss-directory]\standalone\
    * [JBoss-directory]\bin\
    
    >[!NOTE]
    >
    >The default installation location of JBoss Application Server:
    >
    >* Windows: C:\Adobe\Adobe_Experience_Manager_Forms\jboss
    >* Linux: /opt/jboss/.
 
1. Start the application server service.

### File system security {#file-system-security}

AEM Forms on JEE uses the file system in the following ways:

* Stores temporary files that are used while processing document input and output
* Stores files in the global archive store that are used to support the solution components that are installed
* Watched folders store dropped files that are used as input to a service from a file system folder location

When using watched folders as a way to send and receive documents with a forms server service, take extra precautions with file system security. When a user drops content in the watched folder, that content is exposed through the watched folder. In this case, the service does not authenticate the actual end user. Instead, it relies on ACL and Share level security to be set at the folder level to determine who can effectively invoke the service.

## JBoss-specific security recommendations {#jboss-specific-security-recommendations}

This section contains application server configuration recommendations that are specific to JBoss 7.0.6 when used to run AEM Forms on JEE.

### Disable JBoss Management Console and JMX Console {#disable-jboss-management-console-and-jmx-console}

Access to the JBoss Management Console and JMX Console is already configured (JMX monitoring is disabled) when you install AEM Forms on JEE on JBoss by using the turnkey installation method. If you are using your own JBoss Application Server, ensure that access to the JBoss Management Console and JMX monitoring console are secured. Access to the JMX monitoring console is set in the JBoss configuration file called jmx-invoker-service.xml.

### Disable directory browsing {#disable-directory-browsing}

After logging into Administration Console, it is possible to browse the console's directory listing by modifying the URL. For example, if you change the URL to one of the following URLs, a directory listing may appear:

```java
https://<servername>:8080/adminui/secured/ 
https://<servername>:8080/um/
```

## WebLogic-specific security recommendations {#weblogic-specific-security-recommendations}

This section contains application server configuration recommendations for securing WebLogic 9.1 when running AEM Forms on JEE.

### Disable directory browsing {#disable_directory_browsing-1}

Set the index-directories properties in the weblogic.xml file to `false`, as shown by this example:

```xml
<container-descriptor> 
    <index-directory-enabled>false 
    </index-directory-enabled> 
</container-descriptor>
```

### Enable WebLogic SSL Port {#enable-weblogic-ssl-port}

By default, WebLogic does not enable the default SSL Listen Port, 7002. Enable this port in the WebLogic Server Administration Console before you configure SSL.

## WebSphere-specific security recommendations {#websphere-specific-security-recommendations}

This section contains application server configuration recommendations for securing WebSphere running AEM Forms on JEE.

### Disable directory browsing {#disable_directory_browsing-2}

Set the `directoryBrowsingEnabled` property in the ibm-web-ext.xml file to `false`.

### Enable WebSphere administrative security {#enable-websphere-administrative-security}

1. Log in to the WebSphere Administrative Console.
1. In the navigation tree, go to **Security** &gt; **Global Security**
1. Select **Enable administrative security**.
1. Deselect both **Enable application security** and **Use Java 2 security**.
1. Click **OK** or **Apply**.
1. In the **Messages** box, click **Save directly to the master configuration**.

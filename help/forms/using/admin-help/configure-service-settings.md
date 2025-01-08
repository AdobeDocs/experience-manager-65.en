---
title: Configure service settings
description: Learn how to configure service settings. You can use Service Management page for configuring the settings for each of the services that are part of AEM forms. 
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/managing_services
products: SG_EXPERIENCEMANAGER/6.4/FORMS
exl-id: a6a10ff0-6f4d-42df-9b4e-f98a53cf1806
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,Workbench
role: User, Developer
---
# Configure service settings {#configure-service-settings}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

You can use the Service Management page to configure settings for each of the services that are part of AEM forms. The available settings vary depending on the service being configured.

1. In administration console, click Services &gt; Applications and Services &gt; Service Management.
1. Stop the service before changing it. (See [Starting and stopping services](/help/forms/using/admin-help/starting-stopping-services.md#starting-and-stopping-services).)
1. Click the name of the service that you want to configure.
1. If the service has a Configuration tab, use it to change the settings for the service. See the list of links below for details.

   >[!NOTE]
   >
   >Not all the services listed on the Service Management page have a Configuration tab. For processes that you have created, the Configuration tab appears only if you have added a configuration parameter to the process in Workbench. (See "Configuration parameters" in the [Workbench Help](https://www.adobe.com/go/learn_aemforms_workbench_63) .) 


1. Click the Security tab and set the security settings for the service. See [Modifying security settings for a service](configure-service-settings.md#modifying-security-settings-for-a-service).
1. If the service has an Endpoints tab, use it to change the endpoint settings. See [Managing Endpoints](/help/forms/using/admin-help/adding-enabling-modifying-or-removing.md).
1. Click the Pooling tab and set the pooling settings. See [Configuring pooling for a service](configure-service-settings.md#configuring-pooling-for-a-service).
1. Click Save to save your changes or click Cancel to discard them.
1. Select the checkbox next to the service name and click Start to restart the service.

## Audit Workflow service settings {#audit-workflow-service-settings}

Workbench provides the ability to record process instances as they execute at runtime and then play them back to observe the behavior of the process. (See [Workbench Help](https://www.adobe.com/go/learn_aemforms_workbench_63).) To conserve space on the Forms Server's file system, you can limit the amount of process recording data that is stored. You can configure the following properties of the Audit Workflow Service service ( `AuditWorkflowService`):

**maxNumberOfRecordingInstances:** The maximum number of recordings that are stored. When the maximum number is stored, the oldest recording is removed from the file system when a new recording is created. This property is useful if you tend to create many recordings and you want to remove old recordings automatically. The default value is 50.

**MaxNumberOfRecordingEntries:** The maximum number of data entries that can be stored for each recording. Data entries are information about operations in the process. Several entries are stored for each execution of an operation, such as whether the operation started, whether the operation completed, and whether the route that leads to the operation is complete. This property is useful when processes can include many operation executions, for example, when an endless loop is encountered. The default value is 50.

## barcoded forms service settings {#barcoded-forms-service-settings}

The barcoded forms service `(BarcodedFormsService)` extracts barcode data from scanned images. The service accepts a barcoded form (TIFF or PDF) as input and extracts the machine representation of the data encoded by the barcode.

The following settings are available for the barcoded forms service.

**Read Left:** When selected, barcode images are scanned horizontally from right to left.

**Read Right:** When selected, barcode images are scanned horizontally from left to right.

**Read Up:** When selected, barcode images are scanned vertically from bottom to top.

**Read Down:** When selected, barcode images are scanned vertically from top to bottom.

>[!NOTE]
>
>By default, all the options are selected. Deselect an option only if you are certain that no barcodes appear that way on your forms.

**Base File Path:** The file path relative to which the batch input and output file parameters for the Run XML File Job and Run Flat File Job operations are resolved. In clustered configurations, the base file path must be a shared file system location to which all cluster nodes have read/write access.

**Data Source Name:** The name of data source used to maintain state and history information about batch processing jobs. The specified data source must support global (XA) transactions.

## Central Migration Bridge service (Deprecated) settings {#central-migration-bridge-service-settings}

The Central Migration Bridge service ( `CentralMigrationBridge`) invokes a subset of Adobe Central Pro Output Server (Central) functionality, which includes the JFMERGE, JFTRANS, and XMLIMPORT commands. Central Migration Bridge service operations let you reuse the following Central assets in AEM forms:

* template design (&ast;.ifd) 
* output templates (&ast;.mdf) 
* data files (&ast;.dat files) 
* preamble files (&ast;.pre files) 
* data definition files (&ast;.tdf)

The following setting is available for the Central Migration Bridge service.

**Central Install Directory:** The directory where Adobe Central 5.7 is installed.

## Content Repository Connector for EMC Documentum service settings {#content-repository-connector-for-emc-documentum-service-settings}

The Content Repository Connector for EMC Documentum service ( `EMCDocumentumContentRepositoryConnector`) lets you create processes that interact with content that is stored in a Documentum repository.

The following setting is available for the Content Repository Connector for EMC Documentum service.

**Asset Link Object Default Path:** The default portion of the path in the Documentum repository for storing the Asset Link object. The actual path consists of the default path and the location of the form template in the AEM forms repository.

For example, if the default path is set to `/LiveCycleES/ConnectorforEMCDocumentum/AssetLinkObjects`, and the form template is stored in a folder `/Docbase/forms/`, the Asset Link object is stored at the following location:

`/LiveCycleES/ConnectorforEMCDocumentum/AssetLinkObjects/Docbase/forms/`

The default value of this setting is `/LiveCycleES/ConnectorforEMCDocumentum/AssetLinkObjects`.

## Content Repository Connector for IBM FileNet service settings {#content-repository-connector-for-ibm-filenet-service-settings}

The Content Repository Connector for IBM FileNet lets you create processes that interact with content that is stored in an IBM FileNet repository.

The following setting is available for the Content Repository Connector for IBM FileNet service.

**Asset Link Object Default Path:** The default portion of the path in the IBM FileNet repository for storing the Asset Link object. The actual path consists of the default path and the location of the form template in the AEM forms repository.

For example, if the default path is set to `/LiveCycleES/ConnectorforIBMFileNet/AssetLinkObjects`, and the form template is stored in a folder `/Docbase/forms/`, the Asset Link object is stored at the following location:

`/LiveCycleES/ConnectorforIBMFileNet/AssetLinkObjects/Docbase/forms/`

The default value of this setting is `/LiveCycleES/ConnectorforIBMFileNet/AssetLinkObjects`.

## Convert PDF service settings {#convert-pdf-service-settings}

The Convert PDF service ( `ConvertPdfService`) converts PDF documents to PostScript and to several image formats (JPEG, JPEG 2000, PNG, and TIFF). Converting a PDF document to PostScript is useful for unattended server-based printing on any PostScript printer. Converting a PDF document to a multipage TIFF file is practical when archiving documents in content management systems that do no support PDF documents.

The following settings are available for the Convert PDF service.

**Transaction Type:** Specifies how a transaction context should be propagated to an operation.

**Required:** Supports a transaction context if one exists; otherwise, a new transaction context is created. This is the default value.

**Requires New:** Always creates a new transaction context. If an active transaction context exists, it is suspended.

**Transaction Time Out (in sec):** The number of seconds that the underlying transaction provider should wait before rolling back a transaction that is wrapping this operation. This value will be ignored if an existing transaction context is propagated. The default value is 180.

**Threshold Resolution For Smoothing (in dpi):** The image resolution below which smoothing (or anti-aliasing) is applied to text, line art and images, if you have selected the "Apply smoothing to" options for those elements.

**Apply smoothing to text:** Controls anti-aliasing of text. To disable smoothing of text and make text sharper and easier to read with a screen magnifier, clear this checkbox.

**Apply smoothing to LineArt:** Applies smoothing to remove abrupt angles in lines.

**Apply smoothing to images:** Applies smoothing to minimize abrupt changes in images.

## Distiller service settings {#distiller-service-settings}

The Distiller service ( `DistillerService`) converts PostScript, Encapsulated PostScript (EPS), and PRN files to PDF files over a network.

The following settings are available for the Distiller service.

**Adobe PDF Settings:** The following preconfigured settings are applied to the generated PDF:

* High quality print
* Oversized pages
* PDFA1b 2005 CMYK
* PDFA1b 2005 RGB
* PDFX1a 2001
* PDFX3 2002
* Press quality
* Smallest file size
* Standard

New settings can be created through the PDF Generator user interface.

**Security Settings:** Preconfigured security settings that are applied to generated PDF documents. The default value is No Security. Create security settings using PDF Generator and then enter the setting here.

**Pool Size:** The initial size of the pool. When the Distiller service is deployed, this number is used to determine the number of service implementation instances that are created and allocated to the free pool awaiting invocation requests. The service container can then respond immediately to invocation requests without having to first initialize a service instance.

## Document Management service settings {#document-management-service-settings}

>[!NOTE]
>
>Adobe&reg; LiveCycle&reg; Content Services ES (Deprecated) is a content management system installed with LiveCycle. It enables users to design, manage, monitor, and optimize human-centric processes. Content Services (Deprecated) support ends on 12/31/2014. See [Adobe product lifecycle document](https://www.adobe.com/support/products/enterprise/eol/eol_matrix.html). 

The Document Management service ( `DocumentManagementService`) enables processes to use the content management functionality provided by Content Services (Deprecated). Document Management operations provide basic tasks that are required to maintain spaces and content in the content management system. Examples of such tasks are copy, delete, move, retrieve, and store content, create spaces and associations, and get and set content attributes.

The following settings are available for the Document Management service.

**Store Scheme:** The scheme of the store in which content is located. The default value is workspace.

**HTTP Port:** The port used to access Content Services (Deprecated). The default value is 8080.

## Email service settings {#email-service-settings}

Email is commonly used to distribute content or provide status information as part of an automated process. The Email service ( `EmailService`) enables processes to receive email messages from a POP3 or IMAP server, and send email messages to an SMTP server.

For example, a process uses the Email service to send an email message with a PDF form attachment. The Email service connects to an SMTP server to send the email message with the attachment. The PDF form is designed to let the recipient click Submit after completing the form. The action causes the form to be returned as an attachment to the designated email server. The Email service retrieves the returned email message and stores the completed form in a process data form variable.

The following settings are available for the Email service.

**SMTP Host:** The IP address or URL of the SMTP server to use for sending email.

**SMTP Port Number:** The port used to connect to the SMTP server.

**SMTP Authenticate:** Select if user authentication is required to connect to the SMTP server.

**SMTP User:** The user name of the user account to use to log in to the SMTP server.

**SMTP Password:** The password that is associated with the SMTP user account.

**SMTP Transport Security:** The security protocol to use for connecting to the SMTP server:

* Select None if no protocol is used (data is sent in clear text)
* Select SSL if Secure Sockets Layer protocol is used.
* Select TLS if Transport Layer Security is used.

**POP3/IMAP Host:** The IP address or URL of the POP3 or IMAP server to use for sending email.

**POP3/IMAP Username:** The user name of the user account to use to log into the POP3 or IMAP server.

**POP3/IMAP Password:** The password that is associated with the POP3 or IMAP user account.

**POP3/IMAP Port Number:** The port used to connect to the POP3 or IMAP server.

**POP3/IMAP:** The protocol to use for sending and receiving email.

**Receive Transport Security:** The security protocol to use for connecting to the SMTP server:

* Select None if no protocol is used (data is sent in clear text).
* Select SSL if Secure Sockets Layer protocol is used.
* Select TLS if Transport Layer Security is used.

## Encryption service settings {#encryption-service-settings}

The Encryption service ( `EncryptionService`) lets you encrypt and decrypt documents. When a document is encrypted, its contents become unreadable. An authorized user can decrypt the document to obtain access to the contents. If a PDF document is encrypted with a password, the user must specify the open password before the document can be viewed in Adobe Reader or Adobe Acrobat. Likewise, if a PDF document is encrypted with a certificate, the user must decrypt the PDF document with the public key that corresponds to the certificate (private key) that was used to encrypt the PDF document.

The following settings are available for the Encryption service.

**Default LDAP Server to connect to:** Host name of the LDAP server used to retrieve certificates for document encryption.

**Default LDAP Port to connect to:** Port number of the LDAP server.

**Default LDAP User Name:** If the LDAP server requires authentication, specify the user name to be used to connect to the LDAP server.

**Default LDAP Password:** If the LDAP server requires authentication, specify the password that corresponds with the user name to be used to connect to the LDAP server.

>[!NOTE]
>
>Use simple authentication (user name and password) only when the connection is protected via SSL (using LDAPS).

<!-- **Compatibility Mode:**-->

## FTP service settings {#ftp-service-settings}

The FTP service ( `FTP`) enables processes to interact with an FTP server. FTP service operations can retrieve files from the FTP server, put files on the FTP server, and delete files from the FTP server. For example, documents such as reports generated from a process may be stored on an FTP server for distribution. Or an external system may generate some files based on previous steps in a process. In a subsequent step in the process, the files may be transferred to a remote location.

The following settings are available for the FTP service.

**Default host:** The IP address or URL of the FTP server.

**Default port:** The port used to connect to the FTP server. The default value is 21.

**Default username:** The name of the user account that you can use to access the FTP server. The user account must have sufficient privileges to perform the FTP operations that this service requires.

**Default password:** The password to use with the specified user name for authenticating with the FTP server.

## Generate PDF service settings {#generate-pdf-service-settings}

The Generate PDF service ( `GeneratePDFService`) converts files in various native formats to PDF documents, and converts PDF documents to several file formats.

The following settings are available for the Generate PDF service.

**Adobe PDF Settings:** The name of the pre-configured Adobe PDF settings to apply to a conversion job, if these settings are not specified as a part of the API invocation parameters. The Adobe PDF settings are configured in administration console, by clicking Services > PDF Generator> Adobe PDF Settings. These settings are applicable only to the PDFMaker based conversions.

**Security Settings:** The name of the pre-configured security settings to apply to a conversion job, if these settings are not specified as a part of the API invocation parameters. The security settings are configured in administration console, by clicking Services > PDF Generator> Security Settings.

**File type Settings:** The name of the pre-configured File Type Setting to apply to a conversion job, if these settings are not specified as a part of the API invocation parameters. The file type settings are configured in administration console, by clicking Services > PDF Generator> File Type Settings.

**Use WebCapture (Windows Only):** When this setting is true, the Generate PDF service uses Acrobat for all HTML to PDF conversions. This can improve the quality of the PDF files produced from HTML, though performance may be slightly lower. The default value is false.

**Primary converter for HTML to PDF conversions:** The Generate PDF service provides multiple routes to convert HTML files to PDF documents: Webkit, WebCapture (Windows only), and WebToPDF. This setting allows user to select the primary converter to convert HTML to PDF. By default, the WebToPDF is selected.

**Fallback converter for HTML to PDF conversions:** Specify the converter for HTML to PDF conversions if the primary converter fails. By default, the WebCapture (Windows only) is selected.

**Use Acrobat Image Conversion (Windows Only):** When this setting is true, the Generate PDF service uses Acrobat for all Image to PDF conversions. This setting is useful only if the default pure Java conversion mechanism is unable to convert a significant proportion of the input images successfully. The default value is false.

**Enable Acrobat-based AutoCAD Conversions (Windows Only):** When this setting is true, the Generate PDF service uses Acrobat for all DWG to PDF conversions. This setting is useful only if AutoCAD is not installed on the server or the AutoCAD conversion mechanism is unable to convert files successfully.

**Regular Expressions For Finding Out Prohibited Special&#xA;Characters In User Name (Windows Only):** Specifies characters that interfere with the Export PDF and Optimize PDF operations when the characters appear in a user's name.

**ImageToPDF Pool Size:** The pool size of the default (pure Java) Image-to-PDF converter in the Generate PDF service. This setting controls the maximum simultaneous Image-to-PDF conversions that the Generate PDF service can perform. The default value of this setting (recommended for single-processor systems) is 3, which you can increase on multi-processor systems.

**HTML to PDF Pool Size:** The pool size of the HTML-to-PDF converter in the Generate PDF service. This setting controls the maximum simultaneous HTML-to-PDF conversions that the Generate PDF service can perform. The default value of this setting (recommended for single-processor systems) is 3, which you can increase on multi-processor systems.

**OCR Pool Size:** The pool size of the PaperCaptureService that PDF Generator uses for OCR. The default value of this setting (recommended for single-processor systems) is 3, which you can increase on multi-processor systems. This setting is valid only on Windows systems.

**ImageToPDF max pages in memory for TIFF conversions:** This setting determines the maximum number of pages from a TIFF image that can remain in memory before being flushed to disk during conversion to PDF. The default value for this setting is 500, which can be increased if additional memory is allocated to the ImageToPDF converter process.

**Fallback Font Family For HTML To PDF Conversions:** The name of the font family to use in PDF documents when the font used in the original HTML is not available to the AEM Forms Server. Specify a font family if you expect to convert HTML pages that use unavailable fonts. For example, pages authored in regional languages could use unavailable fonts.

**Retry Logic for Native Conversions** Governs PDF generation retries if the first attempt at conversion has failed:

* **No retry**

   Do not retry the PDF conversion if the first conversion attempt has failed

* **Retry**

   Retry PDF conversion regardless of whether the timeout threshold has been reached. The default timeout duration for the first attempt is 270s.

* **Retry if time permits**

   Retry PDF conversion if the time consumed for the first conversion attempt was less than the specified timeout duration. For example, if the timeout duration is 270s and the first attempt consumed 200s, PDF Generator will reattempt the conversion. If the first attempt itself consumed 270s, conversion will not be retried. 

## Guides ES4 Utilities service settings {#guides-es4-utilities-service-settings}

When you create a Guide, some resources, such as the Guide definition, are embedded in the Guide. Resources can also exist as references to application assets stored locally or on the AEM Forms Server. The Guide does not contain data, and the values for the submit location and inputs are not suitable for all external environments.

In most cases, the default Guides render services is sufficient to prepare a Guide for use in Workspace or other external environments. (In the Services view, in Workbench, the default service is Guides (system)/Processes/Render Guide - 1.0.) The Guide Utilities service ( `GuidesUtility`) lets you create a customized process for rendering a Guide, if necessary.

The Guide Utilities operations let you add the following Guide rendering tasks to a process:

* Determine whether data is available to populate the Guide with 
* Embed the Guide data or convert it to a link 
* Convert referenced content to URLs that are externally accessible 
* Substitute values in an HTML document or other wrapper, or convert them to URLs that are externally accessible 
* Set the submit location 
* Specify input values 
* Create a parameter to represent referenced content 
* If variations are available, set a variation

The default values for the Guide Utilities service support most use cases. However, if necessary, you can change the following values.

**publicPaths:** This option has been deprecated. Do not use this option with AEM forms.

**pathInfoExpiryInSeconds:** The interval after which a request for path information from a client expires. Default is 1.

**collateralExpiryInSeconds:** The interval after which a request for collateral from a client expires. Default is 315576000.

**mismatchExpiryInSeconds:** The interval after which a request for collateral from a client expires, when the eTag (entity tag) does not match. (An eTag is an HTTP response header.) Default is 1.

**guideContext:** The context root of the Guides web application. Matches the value set using the Guides web application. Default is /Guides/.

**secureRandomAlgorithm:** The algorithm to use when generating keys and identifiers. This value is passed to the getInstance method of the SecureRandom Java class. Default is SHA1PRNG.

**idBytes:** The number of random bytes to use for a key identifier. Default is 6.

**macAlgorithm:** The MAC (message authentication code) algorithm to use for collateral URL verification. This method is passed to the getInstance method of the Mac class. Default is HmacSHA1.

**macRefreshIntervalInMinutes:** The amount of time a key is active. When a key has been active for this interval, a new key is generated. The new key becomes the active key. The previously active key is kept for 10% of the refresh interval. This behavior allows URLs that are generated by using the old key to continue to work across the key switch. Default is 144000.

**macOverlapIntervalInMinutes:** Length of time that the previous key will remain valid after a new one is generated. The default is 1440 minutes (1 day).

**macKeySeed:** A seed value for generating the secure URL. When this is option, the key is never refreshed. Setting the same seed on different servers will result in those servers generating secure URLs that are compatible. This may be useful if multiple forms servers are in use behind a load balancer. Enter a random sequence of characters and numbers as the seed.

### Using Guides in a server cluster {#using-guides-in-a-server-cluster}

Rendering a Guide in a server cluster that does not use sticky sessions fails with a NullPointerException. A Guides request uses secure URLs that, by default, are unique to the server they are generated on. In a cluster that uses sticky sessions, after a request hits a node in the cluster, all subsequent requests for that session or user are routed exclusively to that server, and everything is ok. In a cluster that does not use sticky sessions, subsequent requests can hit any server in the cluster. If the server that the requests hit is not the original server, they fail to resolve the secure URL.

If you are using Guides in a server cluster that does not use sticky sessions, set the macKeySeed value for the GuidesUtility service, and then stop and start the cluster.

The macKeySeed value is the seed for the random number generator that is used to generate the secure URLs. Setting this value causes each cluster node to initialize the random number generator in the same manner, and to have access to the same secure URLs. You can use any random string for this seed value.

Change the macKeySeed value when you need to refresh the secure URLs. Refreshing the secure URLs depends on your security policy, and is similar to the refresh policy for changing the master root password of the server. The macSeedValue is analogous to the master password for the secure URLs, because it is used to generate a new unique random number for use in secure URL generation and retrieval.

Restart the cluster because the macSeedValue is read only at system startup. All nodes need to restart to read the value, because they use it independently to initialize their internal random numbers with the seed value.

## JDBC service settings {#jdbc-service-settings}

The JDBC service ( `JdbcService`) enables processes to interact with databases.

The following setting is available for the JDBC service.

**datasourceName:** A string value that represents the JNDI name of the data source to use to connect to the database server. The data source must be defined on the application server that hosts the Forms Server. The default value is the JNDI name of the data source for the AEM forms database.

## JMS service settings {#jms-service-settings}

The JMS service ( `JMS`) enables interaction with Java Messaging System (JMS) providers that implement both point-to-point messaging and publish/subscribe messaging.

Configure the JMS service with default properties so that the service operations can connect and interact with a JMS provider and an associated JNDI service. The values of the service properties are set to default values based on the JBoss Application Server. Change these values if you are using a different application server to host AEM forms.

The following settings are available for the JMS service.

**Provider URL:** The URL of the JNDI service provider. The default value is based on the JBoss Application Server. The following URL are default values for the application servers that AEM forms supports:

**JBoss:** `<server name>:1099`

**WebLogic:** `<server name>:7001`

**WebSphere:** `<server name>:2809`

**JNDI Username:** The user name of the account to use for authenticating with the JNDI service provider that is used for looking up queue and topic names. The default value is guest.

**JNDI Password:** The password that is associated with the user name specified for JNDI Username. The default value is guest.

**Initial Context Factory:** The Java class to use as the initial context factory. The JMS service uses this class to create an initial context, which is the starting point for resolving names of topics and queues. The default value is the initial context factory for the JMS service on JBoss. The following classes are the initial context factories for the application servers that AEM forms supports:

**JBoss:** org.jnp.interfaces.NamingContextFactory

**WebLogic:** weblogic.jndi.WLInitialContextFactory

**WebSphere:** com.ibm.websphere.naming.WsnInitialContextFactory

**Connection Username:** The password that is associated with the user name specified for Connection Username. The default value is guest.

**Connection Password:** The password that is associated with the user name specified for Connection Username. The default value is guest.

**Other Properties:** Property name and value pairs that you can pass to the JNDI service provider. These properties depend on the implementation and configuration of the provider that you are using.

The property name and value pairs are separated by semi-colons **;**. For example, the following text shows the value that would be specified for two properties named name1 and name2, with values value1 and value2, respectively:

`name1=value1;name2=value2`

## LDAP service settings {#ldap-service-settings}

The LDAP service ( `LDAPService`) provides operations for querying LDAP directories. LDAP directories are generally used to store information about the people, groups, and services in an organization.

The following settings are available for the LDAP service.

**Initial Context Factory:** The Java class to use as the context factory. This class is used to create a connection to the LDAP server. The default value is com.sun.jndi.ldap.LdapCtxFactory, which is appropriate for most LDAP servers.

**Provider URL:** The URL to use to connect to the LDAP service. The format of the value is `ldap://server name:port`

*server name* is the name of the computer that hosts the LDAP server

*port* is the communications port that the LDAP service uses. The default value is 389, which is the standard port used for LDAP connections.

**User Name:** The user name of the user account to use to log in to the LDAP server. The user account needs to have permission to connect to the server and read the information in the LDAP directory.

Depending on the LDAP server, the user name could be a simple user name such as `myname` or a DN, such as `cn=myname,cn=users,dc=myorg`.

**Password:** The password that corresponds with the user name provided for the Username setting.

**Other Properties:** A string value that represents other properties and their corresponding values that you can provide to the LDAP server. The value is in the following format:

`property=value;property=value;...`

## Microsoft SharePoint configuration service settings {#microsoft-sharepoint-configuration-service-settings}

The Microsoft SharePoint configuration service `(MSSharePointConfigService)`lets you specify credentials for the AEM forms user that has impersonation permissions. For information about impersonation permissions, see [Configuring the Connector for Microsoft SharePoint](https://help.adobe.com/en_US/AEMForms/6.1/SharePointConfig/index.html).

The following settings are available for the Microsoft SharePoint configuration service:

* Username for a user with impersonation permissions
* Password for the above user

**Enable SSL (HTTPS):**

**Time to Live:** Length of time, in seconds, that this provisioning profile is valid and cached on the client. The default is 86400 (24 hours). When a client application syncs with the server and the specified amount of time has passed, the client application requests a new provisioning profile from the server.

**Encryption:** Specifies whether to encrypt data stored on the mobile device.

**Forms Application:** Enables the Forms feature in the mobile client applications. When this option is selected, users can open forms and initiate processes from their mobile devices.

**Tasks Application:** Enables the Tasks feature in the mobile client applications. When this option is selected, users can access their task lists and complete tasks from their mobile devices.

**Content Services Application:** Enables the Content Services feature in the mobile client application. This feature is available only for iOS. When this option is selected, iPhone and iPad users can access files that are stored in your organizations's WebDAV server.

**Offline Support:** Enables users to continue using the mobile client applications even when they do not have a connection to the server (for example, when they are out of cell range or in airplane mode). Users must also enable the Offline Support setting on their mobile devices. This feature is available for Android and iOS devices. By default, this feature is off.

>[!NOTE]
>
>If Offline support has been enabled and then you disable it, the users' provisioning profiles are updated immediately, or as soon as they are online. If a user has been working offline, all pending tasks are returned to their Tasks list and all items in their Queue, including pending forms, tasks, and forms containing validation errors, are deleted from the Queue.

**Android:** Allows Android devices to connect to the server.

**Apple iOS:** Allows iPhones and iPads to connect to the server.

**AIR:** Allows devices running apps based on Adobe AIR&reg; to connect to the server.

**BlackBerry:** Allows BlackBerry devices to connect to the server.

**Android Microsoft Exchange ActiveSync Required:** Specifies whether Microsoft Exchange ActiveSync policy manager (EAS) must be installed and active on Android devices. When this option is selected, EAS must be enforced on the Android device. When this option is not selected, no check is performed, although other requirements are sill enforced.

**Android Minimum PIN Length:** Android devices must have a global setting that enforces that the PIN or password is at least this length. Simply having a PIN of the specified length is not sufficient. The PIN length must be enforced by the system so that users cannot remove or shorten the PIN later. The default value is 4.

**Android Maximum Password Retries Before Wipe:** Android devices have a global setting that wipes the system after a specified number of invalid password attempts. This global setting enabled and equal to or lower than the value specified here. The default value is 5.

**Android Wipe On Removal:** Specifies what happens when a policy violation occurs on an Android device. When this option is selected, the account is deleted. When this option is not selected, the stored account password and cached data are deleted. No more sync attempts are made until the user fixes the policy violation.

## Output service settings {#output-service-settings}

The Output service `(OutputService)`enables you to merge XML form data with a form design created in AEM forms Designer to create a document output stream in one of the following formats:

* A PDF or PDF/A document output stream. 
* An Adobe PostScript output stream. 
* A Printer Control Language (PCL) output stream. 
* A Zebra Programming Language (ZPL) output stream.

The output stream can be sent to a network printer, a local printer, or a disk file. When you use the Output service as part of a process, you can also send the output stream to an email recipient as a file attachment.

The following settings are available for the Output service.

**Transaction Type:** Specifies how a transaction context should be propagated to an operation:

**Required:** supports a transaction context if one already exists; otherwise, a new transaction context is created. This is the default value.

**Requires New:** Always creates a new transaction context. If an active transaction context exists, it is suspended.

**Transaction Time Out (in sec):** The number of seconds that the underlying transaction provider waits before rolling back a transaction that is wrapping this operation. This value is ignored if an existing transaction context is propagated.

When processing large data files or operating on a busy server, it may be necessary to increase the Output service time out. To change the time-out value, ensure that hardware servers have adequate memory and that the memory is available to the Java Application Server heap. The default value is `180`.

## PDFG Config service settings {#pdfg-config-service-settings}

The following settings are available for the PDFG Config service ( `PDFGConfigService`).

**User Job Options Directory:** The path of the file-system folder where the c service writes the job options files that are accessible to Acrobat Pro Extended. The default value is [user.home]/Application Data/Adobe/Adobe PDF/Settings.

**PS Startup Directory:** The path of the file-system folder where the startup files required by Adobe Acrobat Distiller are saved. The default value is [user.home]/Application Data/Adobe/Adobe PDF/Distiller/Startup.

**PS Startup File:** The name of the startup file required by Adobe Acrobat Distiller. The default value is example.ps.

**Server Conversion Timeout:** The maximum job conversion timeout (in seconds) for the Generate PDF service and the Distiller service. This setting limits the maximum conversion timeout that can be specified in the config.xml file and in the administration console pages for PDF Generator. The default value is 270.

**Server Global Timeout:** While performing PDF conversions, a Forms Server takes into account the timeout limit. Configure the timeout value to resolve the issue.

**Job Options Prefix:** A prefix used by the Generate PDF service to prepend a short string to the job options files that it creates temporarily for use by Acrobat Distiller. The default value is pdfg.

**Non Unicode Apps:** A comma-separated list of application names that are known to be Unicode-incapable. This list is pre-populated with the names of several applications, support for which is pre-configured in PDF Generator. If you choose to add support for PDF conversions through other third-party applications that are Unicode-incapable, you must add to them to this list. The default value is Autocad,Excel,PowerPoint,Project,Publisher,Visio,Word,WordPerfect.

**Server Threadpool Count:** Controls the size of the thread pool that the Generate PDF service uses internally to service HTML-to-PDF conversion requests that involve spidering (converting linked pages accessible from the main page). The default value is 20.

**PDFG Cleanup Scan Seconds:** See the Job Expirations Seconds section for details.

**Job Expiration Seconds:** The Generate PDF service deletes input files as soon as they are converted. It stores output files temporarily, for a length of time determined by the PDFG Cleanup Scan Seconds and Job Expiration Seconds settings.

The Job Expiration Seconds setting specifies how old a file or empty folder must be before it is eligible for deletion. The PDFG Cleanup Scan Seconds setting specifies how often a cleanup thread scans the temporary folders for files that can be deleted.

For example, if Job Expiration Seconds is set to 100 and PDFG Cleanup Scan Seconds is set to 200, the cleanup thread runs every 200 seconds and deletes files that are 100 seconds or older.

The default value of PDFG Cleanup Scan Seconds is `43200` (12 hours). The default value of Job Expiration Seconds is `86400` (24 hours).

**Default Locale:** Used to override the default locale (country + language) of the server where the Generate PDF service is deployed. If this parameter is unspecified, then the default locale is determined from the operating system on which the service is deployed. This parameter controls the language in which the error messages are returned to the APIs.

## forms workflow Data Services service settings {#forms-workflow-data-services-service-settings}

The following services extend Data Services and expose assemblers that Workspace uses to talk to the server. Do not change the configuration options for these services unless you are instructed to do so by Adobe Support. These services are not intended for direct access:

* `ProcessManagementLcdsAttachmentService`
* `ProcessManagementLcdsPropertyService`
* `ProcessManagementLcdsTaskService`

## Remoting service settings {#remoting-service-settings}

Most services are configured so that you can access them through (Deprecated for AEM forms) AEM forms Remoting. For information on (Deprecated for AEM forms) AEM forms Remoting, see [Programming with AEM forms](https://adobe.com/go/learn_aemforms_programming_63).

The following settings are available for the Remoting service.

**Flex Client Authentication Method:** Determines the type of response that the server sends back to the client when the invoked service is security enabled, the operation invoked does not support anonymous invocations, and the client passes in either no or invalid credentials. Choose from Custom or Basic. The default value is Basic.

**Allow Serialization Of Non-Serializable Classes:** Most AEM forms endpoints allow only Serializable classes to be used for invocation. In older versions, the Remoting endpoint allowed non-Serializable classes to be used for invocation from Flex-based clients. To prevent a security vulnerability described in APS11-15, this was changed. If you want to continue to use non-Serializable classes with the Flex Remoting endpoint, select this checkbox.

## Repository service settings {#repository-service-settings}

The Repository service ( `RepositoryService`) provides resource storage and management services to AEM forms. When developers create an application, they can deploy the assets in the repository instead of on a file system. The assets can include any type of collateral, including XML forms, PDF forms (including Acrobat forms), form fragments, images, profiles, policies, SWF files, DDX files, XML schemas, WSDL files, and test data.

You can use the default repository included with AEM forms, or use a third-party repository (EMC Documentum Content Server, IBM FileNet Content Manager, or IBM Content Manager).

Repository Provider service is a service delegate that acts as the interface to a provider service. This lets you connect to a common API and not have to be aware of which provider service is implementing the storage capabilities. Repository Provider service provides database storage for the Repository service resources.

The following setting is available for the Repository service.

**Provider Service:** The name of the service that is used as the storage provider. The default value is RepositoryProviderService.

## Signature service settings {#signature-service-settings}

The Signature service ( `SignatureService`) enables your organization to protect the security and privacy of Adobe PDF documents that it distributes and receives. This service uses digital signatures and certification to ensure that documents are not altered. Altering a document breaks its signature. Because security features are applied to the document itself, the document remains secure and controlled for its entire life cycle; beyond the firewall, when it is downloaded offline, and when it is submitted back to your organization.

The following settings are available for the Signature service.

**Name Of The Remote HSM SPI Service:** This option is for use when the HSM is installed on a remote computer. Specify this option when AEM forms is installed on a 64-bit Windows and you are using HSM devices for signing.

**URL Of The Remote HSM Web Service:** Specify this option when AEM forms is installed on 64-bit Windows and you are using HSM devices for signing.

**Certification To Include Form Load Changes:** When this option is selected, the XFA Form State is certified in addition to the XFA template. Note that enabling this option may have a negative impact on performance. The default value is true.

**Execute Document JavaScript scripts:** Specifies whether to execute Document JavaScript scripts during signature operations. The default value is false.

**Process documents with Acrobat 9 compatibility:** Specifies whether to enable Acrobat 9 compatibility. For example, when this option is selected, Visible Certification in Dynamic PDFs is enabled. The default value is false.

**Embed Revocation Info While Signing:** Specifies whether revocation information is embedded while signing the PDF document. The default value is false.

**Embed Revocation Info While Certifying:** Specifies whether the revocation information is embedded while certifying the PDF document. The default value is false.

**Enforce Embedding of Revocation Info For All Certificates&#xA;During Signing/Certification:** Specifies whether a signing or certification operation fails if valid revocation information for all certificates is not embedded. Note that if a certificate does not contain any CRL or OCSP information, it is considered valid, even if no revocation information is retrieved. The default value is false.

**Revocation Check Order:** Specifies the order of revocation checking when checking is possible through both Certificate Revocation List (CRL) and Online Certificate Status Protocol (OCSP) mechanisms. The default value is OCSPFirst.

**Maximum Size Of Revocation Archival Info:** The maximum size of the revocation archival info in kilobytes. AEM forms attempts to store as much revocation information as possible without exceeding the limit. The default value is 10 KB.

**Support Signatures Created From PreRelease Builds Of&#xA;Adobe Products:** When this option is selected, signature created using pre-release version of Adobe products will validate correctly. The default value is false.

**Verification Time Option:** Specifies the time of verification of a signer's certificate. The default value is Secure Time Else Current Time.

**Use Revocation Information Archived in Signature during&#xA;Validation:** Specifies whether the revocation information that is archived with the signature is used for revocation checking. The default value is true.

**Use Validation Information Stored In The Document For&#xA;Validation Of Signatures:** When this option is selected, validation information (including revocation and timestamp information) embedded in the doument is used to validate signatures. The default value is true.

**Maximum Nested Verification Sessions Allowed:** The maximum number of nested verification sessions that are allowed. AEM forms uses this value to prevent an infinite loop when verifying the OCSP or CRL signer certificates when the OCSP or CRL certificate is not set up correctly. The default value is 10.

**Maximum Clock Skew for Verification:** The maximum time, in minutes, that the signing time can be after the validation time. If the clock skew is greater than this value, the signature will not be valid. The default value is 65 minutes.

**Certificate Lifetime Cache:** The lifetime of a certificate, retrieved online or through other means, in the cache. The default value is 1 day.

### Transport Options {#transport-options}

**Proxy Host:** The URL of the proxy host. Used only if some valid value is provided. No default value.

**Proxy Port:** The proxy port. Type any valid port number from 0 to 65535. The default value is 80.

**Proxy Login Username:** The proxy login user name. Used only if some valid value is provided for proxy host and proxy port. No default value.

**Proxy Login Password:** The proxy login password. Used only if some valid value is provided for proxy host, proxy port, and proxy login user name. No default value.

**Maximum Download Limit:** The maximum amount of data, in MBs, that can be received per connection. The minimum value is 1 MB and the maximum value is 1024 MB. The default value is 16 MB.

**Connection Time Out:** The maximum time to wait, in seconds, for establishing a new connection. The minimum value is 1 and the maximum value is 300. The default value is 5.

**Socket Time Out:** The maximum time to wait, in seconds, before a socket time-out (while waiting for data transfer) occurs. The minimum value is 1 and the maximum value is 3600. The default value is 30.

### Path Validation Options {#path-validation-options}

**Require Explicit Policy:** Specifies whether the path must be valid for at least one of the certificate policies that is associated with the trust anchor of the signer certificate. The default value is false.

**Inhibit ANY Policy:** Specifies whether the policy object identifier (OID) should be processed if it is included in a certificate. The default value is false.

**Inhibit Policy Mapping:** Specifies whether policy mapping is allowed in the certification path. The default value is false.

**Check All Paths:** Specifies whether all paths should be validated or whether validation should stop after finding the first valid path. Select true or false. The default value is false.

**LDAP Server:** The LDAP Server used to look up certificates for path validation. No default value.

**Follow URIs in Certificate AIA:** Specifies whether Uniform Resource Identifiers (URIs) in Certificate AIA are processed during path discovery. The default value is false.

**Basic Constraints Extension required in CA Certificates:** Specifies whether the certificate authority (CA) Basic Constraints certificate extension must be present for CA certificates. Some early German certified root certificates (7 and earlier) are not compliant to RFC 3280 and do not contain the basic constraint extension. If it is known that a user's EE certificate chains up to such a German root, deselect this check box. The default value is true.

**Require Valid Certificate Signature During Chain Building:** Specifies whether the chain builder requires valid signatures on certificates used to build chains. When this check box is selected, the chain builder will not build chains with invalid RSA signatures on certificates. Consider chain CA > ICA > EE where the CA's signature on an ICA is not valid. If this setting is true, the chain building will stop at the ICA, and the CA will not be included in the chain. If this setting is false, the full 3-certificate chain is produced. This setting does not affect DSA signatures. The default value is false.

### Timestamp Provider Options {#timestamp-provider-options}

**TSP Server URL:** The URL of the default timestamp provider. Used only if some valid value is provided. No default value.

**TSP Server Username:** The user name if necessary by the timestamp provider. Used only if some valid value is provided for the URL. No default value.

**TSP Server Password:** The password for the above user name if necessary by the timestamp provider. Used only if some valid value is provided for the URL and the user name. No default value.

**Request Hash Algorithm:** Specifies the hashing algorithm to be used while creating the request for the timestamp provider. The default value is SHA1.

**Revocation Check Style:** Specifies the revocation checking style used for determining the trust status of the timestamp provider's certificate from its observed revocation status. The default value is BestEffort.

**Send Nonce:** Specifies whether a nonce is sent with the timestamp provider request. A nonce can be a timestamp, a visit counter on a web page, or a special marker that is intended to limit or prevent the unauthorized replay or reproduction of a file. The default value is true.

**Use Expired Timestamps During Validation:** When this option is selected, expired timestamps can be used to retrieve validation times of signatures. The default value is true.

**TSP Response Size:** Estimated size, in bytes, of the TSP response. This value should represent the maximum size of the timestamp response that the configured timestamp provider could return. Do not change this unless you are absolutely sure. The minimum value is 60B and the maximum value is 10240B. The default value is 4096B.

**Ignore TimeStamp Server Extension**: Select the **Ignore TimeStamp Server Extension** option to stop AEM Forms server from contacting the specified time stamp server. Selecting the option helps avoid process failures which happen due to connection timeout between AEM Forms and time stamp servers.

### Certificate Revocation List Options {#certificate-revocation-list-options}

**Consult Local URI First:** Specifies whether the CRL location that is provided in Local URI or CRL Lookup should be given preference over any location specified within a certificate for the purpose of revocation checking. The default value is false.

**Local URI for CRL Lookup:** URL of the local CRL provider. This value is consulted only if the Consult Local URI First setting is set to true. No default value.

**Revocation Check Style:** Specifies the revocation checking style used for determining the trust status of the CRL provider's certificate from its observed revocation status. The default value is BestEffort.

**LDAP Server for CRL Lookup:** The LDAP Server used to get the CRLs (as www.ldap.com). All DN-based queries for CRLs will be directed to this server. No default value.

**Go Online:** Specifies whether to go online to fetch a CRL. If false, only cached CRLs (on local disk or those embedded with signature) are consulted. The default value is true.

**Ignore Validity Dates:** Specifies whether to ignore the response's thisUpdate and nextUpdate times, which prevents these times from having a negative effect on response validity. The default value is false.

**Require AKI extension in CRL:** Specifies whether the Authority Key Identifier extension must be included in a CRL. The default value is false.

### Online Certificate Status Protocol Options {#online-certificate-status-protocol-options}

**OCSP Server URL:** URL for the default OCSP server. Whether the OCSP server that is specified through this URL is used depends on the URL To Consult Option setting. No default value.

**URL To Consult Option:** Controls the list and order of the OCSP servers that are used for performing the status check. The default value is UseAIAInCert.

**Revocation Check Style:** Specifies the revocation checking style that is used while verifying the OCSP server's certificate. The default value is CheckIfAvailable.

**Send Nonce:** Specifies whether a nonce is sent with the OCSP request. A nonce can be a timestamp, a visit counter on a web page, or a special marker that is intended to limit or prevent the unauthorized replay or reproduction of a file. The default value is true.

**Max Clock Skew Time:** Maximum allowed skew, in minutes, between response time and local time. The minimum value is 0 and the maximum value is 2147483647m. The default value is 5m.

**Response Freshness Time:** Maximum time, in minutes, for which a preconstructed OCSP response is considered valid. The minimum value is 1m and the maximum value allowed is 2147483647. The default value is 525600 (one year).

**Sign OCSP Request:** Specifies whether the OCSP request should be signed. The default value is false.

**Request Signer Credential Alias:** Specifies the credential alias to use for signing the OCSP request if signing is enabled. Used only if signing of OCSP request is enabled. No default value.

**Go Online:** Specifies whether to go online to do revocation checking. The default value is true.

**Ignore the response's thisUpdate and nextUpdate times:** Specifies whether to ignore the response's thisUpdate and nextUpdate times, which prevents these times from having a negative effect on response validity. The default value is false.

**Allow OCSPNoCheck extension:** Specifies whether the OCSPNoCheck extension is allowed in the response signing certificate. The default value is true.

**Require OCSP ISIS-MTT CertHash Extension:** Specifies whether a certificate public key hash extension must be included in OCSP responses. The default value is false.

### Error Handling Options for Debugging {#error-handling-options-for-debugging}

**Purge Certificate Cache on next API call:** Specifies whether to purge the Certificate Cache when the next Signature Service Operation is called. After the operation is called, this option is set back to false. The default value is false.

**Purge CRL Cache on next API call:** Specifies whether to purge the CRL Cache when the next Signature Service Operation is called. After the operation is called, this option is set back to false. The default value is false.

**Purge OCSP Cache on next API call:** Specifies whether to purge the OCSP Cache when the next Signature Service Operation is called. After the operation is called, this option is set back to false. The default value is false.

## Watched Folder service settings {#watched-folder-service-settings}

The Watched Folder service ( `WatchedFolder`) configures attributes that are common for all watched folder endpoints. It also provides default values for watched folder endpoints. (See [Configuring watched folder endpoints](/help/forms/using/admin-help/configuring-watched-folder-endpoints.md#configuring-watched-folder-endpoints).) It is not invoked by external client applications or used in processes created in Workbench.

The following settings are available for the Watched Folder service.

**Cron Expression:** The cron expression as used by quartz to schedule the polling of the input directory.

**Repeat Count:** The number of times the input directory is polled. The default repeat count to use if this value is not specified in the endpoint configuration. A value of -1 indicates indefinite scanning of the directory. The default value is -1.

**Repeat Interval:** The default number if seconds between each poll. This value is used as the repeat interval unless a different value is specified in the watched folder endpoint configuration. The default value is 5. See the description of the Batch Size setting for additional information.

**Asynchronous:** Identifies the invocation type as asynchronous or synchronous. Transient and synchronous processes can only be invoked synchronously. The default value is asynchronous.

**Wait Time:** The default value for time, in seconds, after which the files are retrieved from the input folders. If the file or folder is older than the time specified in the wait time, it is picked up for processing. The default value is 0.

**Batch Size:** The default value for the number of files or folder that are processed per scan. The default value is 2.

The Repeat Interval and Batch Size settings determine how many files Watched Folder picks up in every scan. Watched Folder uses a Quartz thread pool to scan the input folder. The thread pool is shared with other services. If the scan interval is small, the threads scan the input folder often. If files are dropped frequently into the watched folder, keep the scan interval small. If files are dropped infrequently, use a larger scan interval so that the other services can use the threads.

If there is a large volume of files being dropped, make the batch size large. For example, if the service invoked by the watched folder endpoint can process 700 files per minute, and users drop files into the input folder at the same rate, then setting the Batch Size to 350 and the Repeat Interval to 30 seconds will help Watched Folder performance without incurring the cost of scanning the watched folder too often.

When files are dropped into the watched folder, it lists the files in the input, which can reduce performance if scanning is happening every second. Increasing the scan interval can improve performance. If the volume of files being dropped is small, adjust the Batch Size and Repeat Interval accordingly. For example, if 10 files are dropped every second, try setting the Repeat Interval to 1 second and the Batch Size to 10.

In a cluster configuration, the batch size for a watched folder endpoint does not scale to multiple cluster nodes. For example, if the batch size is set to `2` for a two-node cluster and the Throttle option is selected, the nodes process files collectively in batches of two instead of each node processing two files at a time.

**Overwrite Duplicate Filenames:** A Boolean string that specifies whether the watched folder overwrites duplicate result filenames and whether preserved documents of the same name should be overwritten.

**Preserve Folder:** The default value for the preserve folder. This folder is used to copy the source files into if there is successful processing of the input. This value can be an empty, relative, or absolute path with a file pattern as described for the Result Folder setting.

**Failure Folder:** The name of the folder where the failure files are copied. This value can be an empty, relative, or absolute path with a file pattern as described for the Result Folder setting.

**Result Folder:** The default name for the result folder. This folder is used to copy the results files into. This value can be an empty, relative, or absolute path with the following file pattern.

* %F = filename prefix 
* %E = filename extension
* %Y = year (full) 
* %y = year (last two digits) 
* %M = month
* %D = day of month 
* %d = day of year 
* %H = hour (24-hour clock) 
* %h = hour (12-hour clock) 
* %m = minute 
* %s = second 
* %l = millisecond 
* %R = random number (from 0 through 9) 
* %P = process or job id

For example, if it is 8 PM on July 17, 2009 and you specify `C:/Test/WF0/failure/%Y/%M/%D/%H/`, the result folder is `C:/Test/WF0/failure/2009/07/17/20`.

If the path is not absolute but relative, the folder is created inside the watched folder. For more information about file patterns, see [About file patterns](/help/forms/using/admin-help/configuring-watched-folder-endpoints.md#about-file-patterns).

>[!NOTE]
>
>The smaller the size of the result folders, the better Watched Folder performance will be. For example, if the estimated load for the watched folder is 1000 files every hour, try a pattern like `result/%Y%M%D%H` so that a new subfolder is created every hour. If the load is smaller (for example, 1000 files per day), you could use a pattern like `result/%Y%M%D`.

**Stage Folder:** The default name for the stage folder inside the watched folder.

**Input Folder:** The default name for the input folder inside the watched folder.

**Preserve On Failure:** If true, original files are preserved in the failure folder on failure.

**Throttle:** When this option is selected, it limits the number of watched folder jobs that AEM forms processes at any given time. The Batch Size value determines the maximum number of jobs (See About throttling).

## Web Service service settings {#web-service-service-settings}

The Web Service service ( `WebService`) enables processes to invoke web service operations.

The Web Service service enables processes to invoke web service operations. For example, an organization may want to integrate a process to store and retrieve information such as contact and account details by invoking a service provider's exposed web services. The Web Service service invokes a specified web service and passes through values for each of its parameters. It then saves the return values from the operation into a designated variable within a process.

The Web Service service interacts with web services by sending and receiving SOAP messages. The service also supports sending MIME, MTOM, and SwaRef attachments with SOAP messages by using the WS-Attachment protocol. The Web Service service interactions are compatible with SAP systems and .NET web services.

The following settings are available for the Web Service service.

**Key Store:** The full path of the keystore file that contains the private key to use for authentication. The Forms Server must be able to access the file.

**Key Store Password:** The password for the keystore file.

**Key Store Type:** The type of the keystore. Provide no value to use the default keystore type that is configured for the JVM that runs the Forms Server. Otherwise, provide one of the following values:

* jks
* pkcs12
* cms
* jceks

**Trust Store:** The full path of the trust store file that contains the public key of the web service server.

**Trust Store Password:** The password for the truststore file.

**Trust Store Type:** The type of the truststore. Provide no value to use the default keystore type that is configured for the JVM that runs the Forms Server. Otherwise, provide one of the following values:

* jks
* pkcs12
* cms
* jceks

## XSLT Transformation service settings {#xslt-transformation-service-settings}

The XSLT Transformation service ( `XSLTService`) enables processes to apply Extensible Stylesheet Language Transformations (XSLT) on XML documents.

The following setting is available for the XSLT Transformation service.

**Factory Name:** The fully qualified name of the Java class to use for performing XSLT transformations. If no value is specified, the default factory configured in the Java Virtual Machine that runs the Forms Server is used.

## Modifying security settings for a service {#modifying-security-settings-for-a-service}

Forms Server enables you to configure security settings for each service, which lets you configure fine-grained access control on a service-by-service level.

Default security profiles are installed, which can then be configured to meet your system needs. Each security profile has an associated domain and is created at either the user level or the group level.

### Modify security settings for a service {#modify-security-settings-for-a-service}

1. In administration console, click Services &gt; Applications and Services &gt; Service Management.
1. On the Service Management page, click the service to configure.
1. Click the Security tab.
1. In the Require Callers To Authenticate list, select either Yes or No to specify whether the service can be invoked with or without credentials.

   If you select Yes, the caller of the service must be authenticated and the user principal for that caller must be authorized to invoke the service; otherwise, the invocation attempt will be refused.

   If you select No, the caller of the service may or may not be authenticated. The invocation of the service will always succeed because there is no authorization check. 

1. For services that contain one or more operations flagged for anonymous access, select or deselect Anonymous Access Allowed. When anonymous access is enabled, any user within the system can invoke operations on the service. If anonymous access is disabled, users must be granted permission to call the service and invoke operations. Users are granted these permissions either directly or as being part of a group that has such permissions. 
1. For some services, the user account that executes the operation affects the results. For example, in Content Services (Deprecated), the user that stores content is made the owner of the content, which affects who can later access the content. If you are using a process to store content, think about what user is used to execute the Document Management service, because that user will own the stored content.

   To specify the run-time identity used by a service to execute operations, select Specify Run As, select an option from the associated list, and then click Save. Choose from the following options:

   **Invoker:** Uses the same identity as the user who invoked the service.

   **System:** Uses the System user to run the service with full privileges.

   **Named User:** Enables you to run the service as a specific user. When you select this option, click Select User to display the Select Principal page, where you can search for and select the user.

   If you do not select Specify Run As, the default behavior is used.

   >[!NOTE]
   >
   >Render and submit services that are used with xfaForm, Document Form, and Form variables are always executed using the System user account.

1. Click Add Principal to specify the permissions that users and groups have for this service. 
1. The Select Principal screen displays the users and groups that are configured in User Management. If the user or group you want is not displayed, use the search function to find it. Click a user or group name.
1. On the Add Permissions screen, select the permissions to assign to the user or group for this service:

    * **INVOKE_PERM:** To invoke all operations on the service
    * **MODIFY_CONFIG_PERM:** To modify the configuration of a service
    * **SUPERVISOR_PERM:** To view process instance data for a service that is created from a process
    * **START_STOP_PERM:** To start and stop a service
    * **ADD_REMOVE_ENDPOINTS_PERM:** To add, remove, and modify endpoints for a service
    * **CREATE_VERSION_PERM:** To create a version of the service
    * **DELETE_VERSION_PERM:** To delete a version of the service
    * **MODIFY_VERSION_PERM:** To modify a version of the service
    * **READ_PERM:** To view the service
    * **PROCESS_OWNER_PERM:** For use in a future version of AEM forms. Do not use this permission.
    * **SERVICE_MANAGER_PERM:** For use in a future version of AEM forms. Do not use this permission.
    * **SERVICE_AGENT_PERM:** For use in a future version of AEM forms. Do not use this permission.

1. Click Add.

### Remove the principal from a security profile {#remove-the-principal-from-a-security-profile}

1. On the Service Management page, select the service to configure.
1. Click the **Security** tab, select the security profile to remove, and click **Remove**.

## Configuring pooling for a service {#configuring-pooling-for-a-service}

Each service can take advantage of the pooling capabilities to handle incoming invocation requests. Using a service pool ensures that service instances are invoked by a single thread at a time and are reused across invocation requests, which may result in improved performance. You can also use pooling to specify the Maximum Asynchronous Service Instances option, which allows services to limit the number of requests handled in parallel.

### Enable pooling {#enable-pooling}

1. In administration console, click Services &gt; Applications and Services &gt; Service Management.
1. On the Service Management page, click the service to configure.
1. Click the Pooling tab.
1. In the Request Processing Strategy list, select Pooled Instances for All Requests.
1. In the Initial Service Instance Pool Size box, enter the initial size of the pool. When the service is deployed, this number is used to determine the number of service implementation instances that are created and allocated to the free pool, awaiting invocation requests. This enables the service container to respond immediately to invocation requests without having to first initialize a service instance. 
1. In the Maximum Service Instance Pool Size box, enter the maximum number of instances in the pool for a given service. This setting controls the number of threads that can execute a given service at a given time. The default value is 0, which results in unlimited pool size. 
1. In the Maximum Asynchronous Service Instances box, enter the maximum number of instances from the pool that can be used to service asynchronous requests at any given time. This setting allows the service to limit the number of requests that it can handle in parallel. 
1. In the Invocation Wait Timeout box, enter the number of milliseconds to wait for a service to become available for an invocation request. If you do not specify a value for this setting, the default is 0, which results in no wait time.
1. Click Save.

### Remove pooling {#remove-pooling}

1. In administration console, click Services &gt; Applications and Services &gt; Service Management.
1. On the Service Management page, click the service to configure.
1. Click the Pooling tab.
1. In the Request Processing Strategy list, select either New Instance For Each Request or Single Instance For All Requests.

   **Single Instance for All Requests:** A service instance is created and cached when the first request comes into the container. Every request after that request uses the same service instance to handle the request.

   **New Instance for Each Request:** A new service instance is created for each invocation received.

1. Click Save.

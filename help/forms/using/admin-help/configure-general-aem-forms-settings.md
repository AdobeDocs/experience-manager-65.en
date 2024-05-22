---
title: General AEM Forms settings
description: Learn to configure the Core Configurations page settings in administration console that can help improve system performance.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/get_started_with_administering_aem_forms_on_jee
products: SG_EXPERIENCEMANAGER/6.4/FORMS
exl-id: e1519477-b5a8-4947-8597-26b945a3b819
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# General AEM Forms settings {#general-aem-forms-settings}

The Core Configurations page in administration console provides settings that can help improve system performance. After configuring or updating these settings, restart your application server.

>[!NOTE]
>
> It is recommended to use the 'Ctrl + C' command to restart the SDK. Restarting the AEM SDK using alternative methods, for example, stopping Java processes, may lead to inconsistencies in the AEM development environment.

For information about enabling safe backup mode, see [Enabling and disabling safe backup mode](/help/forms/using/admin-help/enabling-disabling-safe-backup-mode.md#enabling-and-disabling-safe-backup-mode).


>[!NOTE]
>
>The files in the temp directory and the long-lived documents in the global document storage (GDS) root directory may contain sensitive user information, such as information that requires special credentials when accessed by using the APIs or user interfaces. Therefore, it is important that this directory is properly secured by using whatever methods are available to the operating system. It is recommended that only the operating system account that is used to run the application server has read and write access to this directory.


1. In administration console, select **[!UICONTROL Settings > Core System Settings > Configurations]**.
1. On the Core Configurations page, change the options as required and select **[!UICONTROL OK]**. For details about the options, see [Core Configurations options](configure-general-aem-forms-settings.md#core-configurations-options).


## Core Configurations options {#core-configurations-options}

**Location of temp directory** The directory path where AEM forms will create product temporary files. If the value of this setting is empty, the location defaults to the system temp directory. Ensure that the temp directory is a writable folder.

>[!NOTE]
>
>Ensure that the temporary directory is on the local file system. AEM forms does not support a temporary directory at a remote location.

**Global document storage root directory** *ndash; The global document storage (GDS) root directory is used for the following purposes:

* Storing long-lived documents. Long-lived documents do not have an expiration time and persist until they are removed (for example, the PDF files used within a workflow process). The long-lived documents are a critical part of the overall system state. If some or all these documents are lost or corrupted, the Forms Server may become unstable. Therefore, it is important that this directory is stored on a RAID device.
* Storing temporary documents needed during processing.

>[!NOTE]
>
>You can also enable document storage in the AEM forms database. However, system performance is better when you use the GDS.  

* Transferring documents between nodes in a cluster. If you are running AEM forms in a clustered environment, this directory must be accessible from all nodes within the cluster.
* Receiving incoming parameters from remote API calls.

If you do not specify a GDS root directory, the directory defaults to an application server directory:

* `[JBOSS_HOME]/server/<server>/svcnative/DocumentStorage`
* `[WEBSPHERE_HOME]/installedApps/adobe/'server'/DocumentStorage`
* `[WEBLOGIC_HOME]/user_projects/<domain>/'server'/adobe/AEMformsserver/DocumentStorage`

>[!NOTE]
>
>Changing the value of the GDS root directory setting should be done with special care. The GDS directory is used to store both long-lived files used within a process and critical AEM forms product components. Changing the location of the GDS directory is a major system change. Incorrectly configuring the location of the GDS directory will render AEM forms inoperative and may require a complete reinstallation of AEM forms. If you specify a new location for the GDS directory, the application server needs to be shut down and the data migrated before the server can be restarted. The system administrator must move all files from the old location to the new location but keep the internal directory structure.

>[!NOTE]
>
>Do not specify the same directory for the temp directory and the GDS directory..

For additional information about the GDS directory, see [Preparing to Install AEM forms (Single Server)](https://www.adobe.com/go/learn_aemforms_prepareInstallsingle_63).

**Location of the Adobe Server Fonts directory** *ndash; Type the path to the directory that contains the Adobe server fonts. These fonts are installed with AEM forms. The default location for these fonts is the [aem-forms root]/fonts directory. If this directory is not accessible, you can copy the fonts elsewhere and use this setting to specify the new location.

**Location of the Customer Fonts directory** *ndash; Type the path to a directory that contains additional fonts that you want to use.

***note**: Fonts are picked from the Windows system font cache and a system restart is required to update the cache. After specifying the Customer font directory, ensure that you restart the system on which AEM forms is installed.*

**Location of the System Fonts directory** *ndash; Type the path to the fonts directory that your operating system provided. Multiple directories can be added, separated by a semicolon **;**.

**Location of Data Services Configuration file** *ndash; Specifies the location of the services-config.xml file. By default, this file is embedded in the adobe-core-appserver.ear file and is not user-accessible. A copy of the default services-config.xml file is in [aem-forms root]\sdk\misc\DataServices\Server-Configuration. If you changed this file and moved it, type the new location in this field.

The Data Services configuration file allows customization of Data Services settings, such as authentication type and debug output.

This setting is empty by default.

**Default document max inline size (bytes)** *ndash; The maximum number of bytes kept in memory when passing documents between various AEM forms components. Use this setting for performance tuning. Documents that are smaller than this number are stored in memory and persisted in the database. Documents that exceed this maximum are stored on the hard drive.

This setting is mandatory. The default value is 65536 bytes.

**Default document disposal timeout (seconds)** *ndash; The maximum amount of time, in seconds, during which a document being passed between various AEM forms components is considered active. After this time has passed, files that are used to store this document are subject to removal. Use this setting to control the usage of disk space.

This setting is mandatory. The default value is 600 seconds.

**Document sweep interval (seconds)** *ndash; The amount of time, in seconds, between attempts to delete files that are no longer needed and were used to pass document data between services.

This setting is mandatory. The default value is 30 seconds.

**Enable FIPS** *ndash; Select this option to enable FIPS mode. Federal Information Processing Standard (FIPS) 140-2 is a U.S. government-defined cryptology standard. When running in FIPS mode, AEM forms restricts data protection to FIPS 140-2 approved algorithms by using the RSA BSAFE Crypto-C 2.1 encryption module.

FIPS mode does not support encryption algorithms that are used in Adobe Acrobat&reg; versions earlier than 7.0. If FIPS mode is enabled and you use the Encryption service to encrypt the PDF by using a password with a compatibility level set to Acrobat 5, the encryption attempt will fail with an error.

In general, when FIPS is enabled, the Assembler service will not apply password encryption to any document. If this is attempted, a FIPSModeException is thrown indicating that "Password encryption is not permitted in FIPS mode." Additionally, the Document Description XML (DDX) PDFsFromBookmarks element is not supported in FIPS mode when the base document is password-encrypted.

>[!NOTE]
>
>AEM forms software does not validate code to ensure FIPS compatibility. It provides a FIPS operation mode so that FIPS-approved algorithms are used for cryptographic services from the FIPS-approved libraries (RSA).

**Enable WSDL** *ndash; Select this option to enable Web Service Definition Language (WSDL) generation for all services that are part of AEM forms.

Enable this option in development environments, where developers use WSDL generation to build their client applications. You may choose to disable WSDL generation in a production environment to avoid exposing a service's internal details.

**Enable document storage in the database** *ndash; Select this option to store long-lived documents in the AEM forms database. Enabling this option does not remove the need for a GDS directory. However, choosing this option simplifies AEM forms backups. If you use just the GDS, a backup involves putting the AEM formsAEM forms system into backup mode and then completing the backups of the database and the GDS. If you select the database option, the backup involves completing the database backup for a new install or completing the database backup and the one time backup of the GDS for an upgrade. Additional management of your database may be required to purge jobs and data compared to a GDS only configuration. (See Backup options when database is used for document storage.)

**Enable DSC invocation statistic** *ndash; When this option is selected, AEM forms tracks invocation statistics such as the number of invocations, amount of time taken to invoke, and number of errors in invocations. This information is stored in a JMX bean so that you can use Java&trade; JConsole or third-party software to look at the statistics. If you do not want to see these statistics, deselect this option to improve AEM forms performance.

**Enable RDS** *ndash; Selecting this option enables the Remote Development Services (RDS) servlet within AEM forms. When this option is enabled, client-side tools can interact with Data Services to do things like deploy or undeploy models to create destinations and endpoints, or to find out which models have been deployed into endpoints. By default, this option is not selected.

**Allow non-secured RDS request** *ndash; When this option is selected, RDS requests do not need to use https. By default, this option is not selected and all communications to Data Services need to be https requests.

**Allow non-secured document upload from Flex applications** *ndash; The file upload servlet used to upload documents from Adobe Flex&reg; applications to AEM forms requires that users are authenticated and authorized before they can upload documents. The user must be assigned the Document Upload Application User role or another role that includes the Document Upload permission. This helps prevent unauthorized users from uploading documents to the AEM Forms Server. Select this option if you want to disable this security feature in a development environment or for backwards compatibility with previous versions of AEM forms. By default, this option is not selected. For details, see "Invoking AEM forms Using AEM forms Remoting" in Programming with AEM forms.

**Allow non-secured document upload from Java SDK applications** *ndash; HTTP DocumentManager uploads must be secured. By default, HTTP uploads require that users are authenticated and authorized before they can upload documents. The user must be assigned the Services User role or another role that contains the Service Invoke permission. This helps prevent unauthorized users from uploading documents to the Forms Server. Select this option if you want to disable this security feature in a development environment, for backwards compatibility with previous versions of AEM forms, or based on your firewall setup. By default, this option is not selected. For details, see "Invoking AEM forms Using the Java API" in Programming with AEM forms.

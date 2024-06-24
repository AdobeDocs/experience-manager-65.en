---
title: Preparing AEM Forms for Backup

description: Learn how to use the Backup and Restore service to enter and leave the Backup mode for AEM Forms server using the Java API and the Web Service API.


contentOwner: admin
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations

role: Developer
exl-id: aeab003d-ba64-4760-9c56-44638501e9ff
solution: Experience Manager, Experience Manager Forms

feature: "Adaptive Forms,APIs & Integrations"
---
# Preparing AEM Forms for Backup {#preparing-aem-forms-for-backup} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

## About the Backup and Restore Service {#about-the-backup-and-restore-service}

The Backup and Restore service lets you put AEM Forms into *backup mode*, which enables hot backups to be performed. The Backup and Restore service does not actually perform a backup of AEM Forms or restore your system. Instead, it puts your server in a state for consistent and reliable backups while allowing your server to continue to run. You are responsible for the actions to back up the Global Document Storage (GDS) and the database connected to the Forms Server. The GDS is a directory used to store files used within a long-lived process.

Backup mode is a state that the server enters so that files in the GDS are not being purged while a backup procedure is taking place. Instead, subdirectories are created under the GDS directory to maintain a record of files to be purged after save backup mode ends. A file is intended to survive system restarts and can span days, or even years. These files are a critical part of the overall state of the Forms Server and may include PDF files, policies, or form templates. If any of these files are lost or become corrupted, the processes on the Forms Server may become unstable and data could be lost.

You can choose to perform snapshot backups, where you would usually enter backup mode for a period and then leave backup mode after you complete your backup activities. Leaving backup mode is required so that files can be purged from the GDS to ensure that it does not grow unnecessarily large. You can either leave backup mode explicitly or wait for the time to expire on a backup mode session.

You can also leave your server in perpetual backup mode, which is typical for backup strategies for rolling backups or continuous system coverage. Rolling backup mode indicates that the system is always in backup mode, with a new backup mode session initiated as soon as the previous session is released. When in continuous backup mode, a file is purged after two backup mode session and is no longer referenced.

You can use the Backup and Restore service to add to existing applications or new applications that you create to perform backups of the GDS or database connected to the Forms Server.

>[!NOTE]
>
>As with any other aspect of your AEM Forms implementation, your backup and recovery strategy should be developed and tested in a development or staging environment before being used in production to ensure that the entire solution is working as expected with no data loss.

You can perform these tasks using the Backup and Restore service:

* Enter backup mode.
* Leave backup mode.

>[!NOTE]
>
>For more information about what to consider when performing backups for AEM Forms, see [administration help](https://www.adobe.com/go/learn_aemforms_admin_63).

>[!NOTE]
>
>For more information about the Backup and Restore service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

## Entering Backup Mode on the Forms Server {#entering-backup-mode-on-the-forms-server}

You enter backup mode to allow for hot backups of a Forms Server. When you enter backup mode, you specify the following information based on your organization's backup procedures:

* A unique label to identify the backup mode session that may be useful for your backup processes.
* The time for the backup procedure to complete.
* A flag to indicate whether to be in continuous backup mode, which is useful only if you are performing rolling backups.

Before you write applications to enter into backup mode, it is recommended that you understand the backup procedures that are used after you put the Forms Server in backup mode. For more information about what to consider when performing backups for AEM Forms, see [administration help](https://www.adobe.com/go/learn_aemforms_admin_63).

>[!NOTE]
>
>For more information about the Backup and Restore service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary-of-steps}

To create an application that enters backup mode, perform the following steps:

1. Include project files.
1. Create an BackupService client object.
1. Determine a unique label, the amount of time to perform the backup, and whether to be in continuous backup mode.
1. Enter backup mode.
1. (Optional) Retrieve information about the backup mode session on the server.
1. Perform the backup of the GDS (Global Data Store) and database.

**Include project files**

Include necessary files in your development project. These files are important to include in your project for compiling your code properly and using the Backup and Restore Service API.

For information about the location of these files, see [Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files).

**Create a BackupService Client API object**

To programmatically leave backup mode, you create a BackupService client object to use the Backup and Restore Service API.

**Decide upon a unique label, determine the amount of time to perform the backup, and decide whether to be in continuous backup mode**

Before you enter backup mode, you should decide upon a unique label, determine the amount of time that you want to allocate to perform the backup, and decide whether you want the Forms Server to stay in backup mode. These considerations are important to integrate with the backup procedures established by your organization. (See [administration help](https://www.adobe.com/go/learn_aemforms_admin_63).)

**Enter backup mode**

Enter backup mode with the parameters that are consistent with the backup procedures at your organization.

**Retrieve information about the backup mode session on the server**

After you enter backup mode, you can retrieve information about the session. This information can be used to integrate with your backup procedures

**Perform the backup of the GDS and database**

After you successfully enter backup mode, you can perform a backup of the Global Document Storage (GDS) and the database that the Forms Server is connected to. This step is specific to your organization, since you can perform this step manually or you can run other tools to perform the backup procedure.

### Enter backup mode using the Java API {#enter-backup-mode-using-the-java-api}

Enter backup mode by using the Backup and Restore Service API:

1. Include project files

   Include necessary client JAR files, such as adobe-backup-restore-client-sdk.jar, in your Java project's class path. To create the Java client application, the following JAR files must be added to your project's class path:

    * adobe-backup-restore-client-sdk.jar
    * adobe-livecycle-client.jar
    * adobe-usermanager-client.jar
    * adobe-utilities.jar (required if AEM Forms is deployed on JBoss Application Server)
    * jbossall-client.jar (required if AEM Forms is deployed on JBoss Application Server)

1. Create a BackupService Client API object

   You use a `ServiceClientFactory` object and the BackupService client API object together.

    * Create a `ServiceClientFactory` object that contains connection properties. (See [Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties).)
    * Create an `BackupService` object by using its constructor and passing the `ServiceClientFactory` object.

1. Decide upon a unique label, determine the amount of time to perform the backup, and decide whether to be in continuous backup mode

   Decide upon a unique label, determine the amount of time that you want to allocate to perform the backup, and decide whether you want the Forms Server to stay in continuous backup mode.

1. Enter backup mode

   Enter backup mode by invoking the `enterBackupMode` method with the following parameters:

    * A `String` value that specifies a unique human-readable label that identifies the backup mode session. It is recommended that you do not use spaces or characters that cannot be encoded into XML format.
    * An `int` value that specifies the number of minutes to stay in backup mode. You can specify a value from `1` to `10080` (the number of minutes in one week). This value is ignored when using continuous backup mode.
    * A `Boolean` value that specifies whether to be in continuous backup mode. A value of `True` specifies to be in continuous backup mode. When in continuous backup mode, the value you specify for the number of minutes to stay in backup mode is ignored.

      Continuous backup mode means that a new backup mode session is started after the current one is completed. A value of `False` means that continuous backup mode is not used and, after leaving backup mode, the purging of files from the GDS resumes.

1. Retrieve information about the backup mode session on the server

   Retrieve information using the `BackupModeEntryResult` object that is returned after invoking the `enterBackupMode` method. The information that you can retrieve after you enter backup mode may be useful for integrating with your backup procedures. For example, the label, backup ID, and start time may be useful as input for filenames for your backup procedure.

1. Perform the backup of the GDS and database

   Backup the Global Document Storage (GDS) and the database which your Forms Server is connected to. The actions to perform the backup are not part of the AEM Forms SDK and may even include manual steps specific to the backup procedures in your organization.

### Enter backup mode using the web service API {#enter-backup-mode-using-the-web-service-api}

Enter backup mode by using the web service provided by Backup and Restore Service API:

1. Include project files

    * Create a Microsoft .NET client assembly that consumes the Backup and Restore Service API WSDL.
    * Reference the Microsoft .NET client assembly.

1. Create a BackupService Client API object

   Using the Microsoft .NET client assembly, create a `BackupServiceService` object by invoking its default constructor and specify the credentials using the `Credentials` method.

1. Decide upon a unique label, determine the amount of time to perform the backup, and decide whether to be in continuous backup mode

   Decide upon a unique label, determine the amount of time that you want to allocate to perform the backup, and decide whether you want the Forms Server to stay in continuous backup mode.

1. Enter backup mode

   To enter backup mode, invoke the enterBackupMode method and pass the following values:

    * A `String` value that specifies a unique human-readable label that identifies the backup mode session. It is recommended that you do not use spaces or characters that cannot be encoded into XML format.
    * A `Uint32` value that specifies the number of minutes to stay in backup mode. You can specify a value from `1` to `10080` (number of minutes in one week). This value is ignored when using continuous backup mode.
    * A `Boolean` value that specifies whether to be in continuous backup mode. A value of `True` specifies to be in continuous backup mode. When in continuous backup mode, the value you specify for the number of minutes to stay in backup mode is ignored. Continuous backup mode means that a new backup mode session is started after the current one is completed.

      A value of `False` means that continuous backup mode is not used and, after leaving backup mode, the purging of files from the GDS resumes.

1. Retrieve information about the backup mode session on the server

   Retrieve information about the backup mode session after invoking the enterBackupMode method from the BackupModeEntryResult that is returned to verify that it was successful. The information that you can retrieve after you enter backup mode may be useful for integrating with your backup procedures. For example, the label, backup ID, and start time may be useful as input for filenames for your backup procedure.

1. Perform the backup of the GDS and database

   Backup the Global Document Storage (GDS) and the database which your Forms Server is connected to. The actions to perform the backup are not part of the AEM Forms SDK and may even include manual steps specific to the backup procedures in your organization.

## Leaving Backup Mode on the Forms Server {#leaving-backup-mode-on-the-forms-server}

You leave backup mode so that the Forms Server resumes purging of files from the GDS (Global Document Storage) on the Forms Server.

Before you write applications to enter into leave mode, it is recommended that you understand the backup procedures that are used with AEM Forms. For more information about what to consider when performing backups for AEM Forms, see [administration help](https://www.adobe.com/go/learn_aemforms_admin_63).

>[!NOTE]
>
>For more information about the Backup and Restore service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-1}

To leave backup mode, perform the following steps:

1. Include project files.
1. Create a BackupService client object.
1. Leave backup mode.
1. (Optional) Retrieve information about the backup mode session that was running on the Forms Server.

**Include project files**

Include all necessary files in your development project. These files are important for compiling your code properly and using the Backup and Restore Service API.

For information about the location of these files, see [Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files).

**Create a BackupService Client API object**

To programmatically leave backup mode, you create a BackupService client object to use the Backup and Restore Service API.

**Leave backup mode**

Leave backup mode to resume normal purging of files from the Global Document Storage (GDS). Before you leave backup mode, you should verify that your backup procedures have been completed.

**Retrieve information about the backup mode session that ended**

After you leave backup mode, you can retrieve information about the session. This information can be used to integrate with your backup procedures.

### Leave backup mode using the Java API {#leave-backup-mode-using-the-java-api}

Leave backup mode by using the Backup and Restore Service API (Java):

1. Include project files

   Include necessary client JAR files, such as adobe-backup-restore-client-sdk.jar, in your Java project's class path. To create Java client application, the following JAR files must be added to your project's class path:

    * adobe-backup-restore-client-sdk.jar
    * adobe-livecycle-client.jar
    * adobe-usermanager-client.jar
    * adobe-utilities.jar (required if AEM Forms is deployed on JBoss Application Server)
    * jbossall-client.jar (required if AEM Forms is deployed on JBoss Application Server)

1. Create a BackupService Client API object

   You use a `ServiceClientFactory` object and the BackupService client API object together.

    * Create a `ServiceClientFactory` object that contains connection properties. (See [Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties).)
    * Create a `BackupService` object by using its constructor and passing the `ServiceClientFactory` object as parameter.

1. Enter backup mode

   Leave backup mode by invoking the `leaveBackupMode` method.

1. Retrieve information about the backup mode session on the server

   Retrieve information about the operation using the `BackupModeResult` object that is returned. The information that you can retrieve after you enter backup mode may be useful for integrating with your backup procedures. For example, the label, backup ID, and start time may be useful as input for filenames for your backup procedure.

### Leave backup mode using the web service API {#leave-backup-mode-using-the-web-service-api}

Leave backup mode by using the Backup and Restore Service API (web service):

1. Include project files

   To use web services, you must make sure that you include the proxy files. Follow these steps to configure your project to use the Backup and Restore Service API as a web service.

    * Create a Microsoft .NET client assembly that consumes the Backup and Restore Service API WSDL.
    * Reference the Microsoft .NET client assembly.

1. Create a BackupService Client API object

   Using the Microsoft .NET client assembly, create a `BackupServiceService` object by invoking its default constructor.

1. Enter backup mode

   Leave backup mode by invoking the `leaveBackupMode` web service operation.

1. Retrieve information about the backup mode session on the server

   Retrieve the backup mode identifier after the operation to verify that it was successful. The information that you can retrieve after you leave backup mode may be useful for integrating with your backup procedures.

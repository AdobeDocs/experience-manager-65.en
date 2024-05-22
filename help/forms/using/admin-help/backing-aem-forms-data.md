---
title: Backing up the Adobe Experience Manager Forms data
description: This document describes the steps that are required to complete a hot, or online, back up of the Adobe Experience Manager (AEM) forms database, the GDS, and Content Storage Root directories.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/aem_forms_backup_and_recovery
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 536615a4-ab42-4b72-83b1-fad110b011ee
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Backing up the Adobe Experience Manager (AEM) Forms data {#backing-up-the-aem-forms-data}

<!-- back up is two words when used as a verb; backup is one word when used as an adjective or noun. -->

This section describes the steps that are required to complete a hot, or online, back up of the AEM Forms database, the GDS, and Content Storage Root directories.

After AEM Forms is installed and deployed to production areas, the database administrator should perform an initial full, or cold, back up of the database. The database must be shut down for this back up. Then, differential or incremental (or hot) backups of the database should be done regularly.

To ensure a successful backup and recovery, a system image backup must be available always. Then, if a loss occurs, you can recover your entire environment to a consistent state.

Backing up the database at the same time as the GDS, AEM repository, and Content Storage Root directory backups helps keep these systems synchronized if recovery is ever required.

The backup procedure described in this section requires you to enter safe backup mode before you back up the AEM Forms database, AEM repository, GDS, and Content Storage Root directories. When backup is complete, you must exit safe backup mode. Safe backup mode is used to mark long-lived and persistent documents that reside in the GDS. This mode ensures that the automated file cleanup mechanism (the File collector) does not delete expired files until the safe backup mode is released. It is necessary to keep a GDS backup in synchronization with a database backup.

How often the GDS location must be backed up depends on how AEM Forms is used and the backup windows available. The backup window can be affected by long-lived processes because they can run for several days. If you are continually changing, adding, and removing files in this directory, you should back up the GDS location more often.

If the database is running in a logging mode, as described in the previous section, the database logs must also be backed up frequently so that they can be used to restore the database if there is media failure.

>[!NOTE]
>
>Files that are not referenced may persist in the GDS directory after the recovery process. This is a known limitation currently.

## Back up the database, GDS, AEM repository, and Content Storage Root directories {#back-up-the-database-gds-aem-repository-and-content-storage-root-directories}

Put AEM Forms in either the safe backup (snapshot) mode or the rolling backup (continuous coverage) mode. Before you set AEM Forms to enter either of the backup modes, ensure the following:

* Verify the system version and record the patches or updates that were applied since the last complete system image backup was performed.
* If you are using either rolling or snapshot mode backups, ensure that your database is configured with the correct log settings to allow for hot backups of the database. (See [AEM Forms database](/help/forms/using/admin-help/files-back-recover.md#aem-forms-database).)

In addition to these, observe the following guidelines for the backup/restore process.

* Back up the GDS directory by using an available operating system or a third-party backup utility. (See [GDS location](/help/forms/using/admin-help/files-back-recover.md#gds-location).)
* (Optional) Back up the Content Storage Root directory by using an available operating system or a third-party backup and utility. (See [Content Storage Root location (stand-alone environment)](/help/forms/using/admin-help/files-back-recover.md#content-storage-root-location-stand-alone-environment) or [Content Storage Root location (clustered environment)](/help/forms/using/admin-help/files-back-recover.md#content-storage-root-location-clustered-environment).)
* Back up   author  and publish instances (  crx -repository backup).

  To back up the Correspondence Management Solution environment, perform the steps on the author and publish instances as described in [Backup and Restore](/help/sites-administering/backup-and-restore.md).

  Consider the following points when backing up the author and publish instances:

    * Ensure that backup for author and publish instances are synchronized to start at the same time. Although you can continue to use author and publish instances while the backup is being performed, it is recommended not to publish any asset during the back up to avoid any uncaptured changes. Wait for the backup of both author and publish instances to end before publishing new assets.
    * The complete backup of Author node includes backup of Forms Manager and AEM Forms Workspace data.
    * Workbench developers can continue to work on their processes locally. They should not deploy any new processes during the backup phase.
    * The decision about the length of each backup session (for rolling backup mode) should be based on the total time taken to back up all the data in AEM Forms (DB, GDS, AEM repository, and any other additional custom data).

Back up the AEM Forms database, including any transaction logs. See [AEM Forms database](/help/forms/using/admin-help/files-back-recover.md#aem-forms-database). 

For more information, see the appropriate knowledge base article for your database:
<!-- The four URLs below are all 404s; checked July 19, 2023 -->
* [Oracle Backup and Recovery for AEM Forms](https://www.adobe.com/go/kb403624)
* [MySQL Backup and Recovery for AEM Forms](https://www.adobe.com/go/kb403625)
* [Microsoft&reg; SQL Server Backup and Recovery for AEM Forms](https://www.adobe.com/go/kb403623)
* [DB2&reg; Backup and Recovery for AEM Forms](https://www.adobe.com/go/kb403626)

These articles provide guidance to basic database features for the backup and recovery of data. They are not intended as all-inclusive technical Guides of a specific vendor's database backup and recovery feature. They outline commands that are required to create a reliable database backup strategy for your AEM Forms application data.

>[!NOTE]
>
>The database backup must be complete before you begin backing up the GDS. If the database backup is not complete, your data is out of sync.

### Entering the backup modes {#entering-the-backup-modes}

You can use either administration console, the LCBackupMode command, or the API available with the AEM Forms installation to enter and leave back up modes. For rolling backup (continuous coverage), the administration console option is not available; you should use either the command-line option or the API. <!-- Fix broken link For information about using the API to enter and leave backup modes, see AEM Forms API Reference on Help and Tutorials page. -->

>[!NOTE]
>
>If you configured SSL on the Forms Server, then you cannot place the Forms Server in backup mode using LCBackupMode.CMD script.

**Using the administration console to enter safe backup mode**

1. Log in to administration console.
1. Click Settings &gt; Core System Settings &gt; Backup Utilities.
1. Select Operate In Safe Backup Mode and click OK.

   This method puts AEM Forms into backup mode indefinitely (no time out), and it enters snapshot mode rather than rolling backup mode.

**Using the command-line option to enter safe backup mode**

You can use the command-line interface `LCBackupMode` scripts to put AEM Forms in safe backup mode.

1. Set ADOBE_LIVECYCLE and start the application server.
1. Go to the `*[aem-forms root]*/sdk/misc/Foundation/BackupRestoreCommandline` folder.
1. Depending on your operating system, edit the `LCBackupMode.cmd` or `LCBackupMode.sh` script to provide default values that are appropriate for your system.
1. At the command prompt, run the following command on a single line:

    * (Windows) `LCBackupMode.cmd enter [-Host=`*hostname* `] [-port=`*portnumber* `] [-user=`*username* `] [-password=`*password* `] [-label=`*labelname* `] [-timeout=`*seconds* `]`
    * (Linux&reg;, UNIX&reg;) `LCBackupMode.sh enter [-host=`*hostname* `] [-port=`*portnumber* `] [-user=`*username* `] [-password=`*password* `] [-label=`*labelname* `]`

   In the previous commands, the placeholders are defined as follows:

   `Host` is the name of the host where AEM Forms is running.

   `port` is the WebServices port of the application server on which AEM Forms is running.

   `user` is the user name of the AEM Forms administrator.

   `password` is the password of the AEM Forms administrator.

   `label` is the text label, which can be any string, for this backup.

   `timeout` is the number of seconds after which the backup mode is automatically left. It can be 0&ndash;10,080. If it is 0, which is the default, the backup mode never times out.

   For more information about the command-line interface to the backup mode, see the Readme file in the BackupRestoreCommandline directory.

### Leaving backup modes {#leaving-backup-modes}

You can use either the administration console or the command-line option to leave backup modes.

**Leave safe backup mode (snapshot mode)**

To use Administration Console to take AEM Forms out of safe backup mode (snapshot mode), perform the following tasks.

1. Log in to Administration Console.
1. Click Settings &gt; Core System Settings &gt; Backup Utilities.
1. Deselect Operate In Safe Backup Mode and click OK.

**Leave all backup modes**

You can use the command-line interface to take AEM Forms out of safe backup mode (snapshot mode) or to end the current backup mode session (rolling mode). You cannot use the administration console to leave rolling backup mode. While in rolling backup mode, the Backup Utilities controls on the Administration Console are disabled. Use either the API call or use the LCBackupMode command.

1. Go to the `*[aem-forms root]*/sdk/misc/Foundation/BackupRestoreCommandline` folder.
1. Depending on your operating system, edit the `LCBackupMode.cmd` or `LCBackupMode.sh` script to provide default values that are appropriate for your system.

   >[!NOTE]
   >
   >Set the JAVA_HOME directory as described in the appropriate chapter for your application server in [Preparing to Install AEM Forms](https://www.adobe.com/go/learn_aemforms_prepareInstallsingle_63)*.*

1. Run the following command on a single line:

    * (Windows) `LCBackupMode.cmd leaveContinuousCoverage [-Host=`*hostname* `] [-port=`*portnumber* `] [-user=`*username* `] [-password=`*password* `]`
    * (Linux&reg;, UNIX&reg;) `LCBackupMode.sh leaveContinuousCoverage [-Host=`*hostname* `] [-port=`*portnumber* `] [-user=`*username* `] [-password=`*password* `]`

      In the previous commands, the placeholders are defined as follows:

      `Host` is the name of the host where AEM Forms is running.

      `port` is the port on which AEM Forms is running on the application server.

      `user` is the user name of the AEM Forms administrator.

      `password` is the password of the AEM Forms administrator.

      `leaveContinuousCoverage` Use this option to disable rolling backup mode completely.

   >[!NOTE]
   >
   >For the time that backup mode is off, continuous coverage cannot be reestablished. Any changes during that time are not protected.

   >[!NOTE]
   >
   >If you enabled document storage in database, the snapshot backup mode and rolling backup modes are not applicable.

   For more information about the command-line interface to the backup mode, see the readme file in the BackupRestoreCommandline directory.

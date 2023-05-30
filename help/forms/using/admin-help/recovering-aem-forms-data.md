---
title: Recovering the AEM forms data
seo-title: Recovering the AEM forms data
description: This document describes the steps required to recover the AEM forms data.
seo-description: This document describes the steps required to recover the AEM forms data.
uuid: b5735196-5a8d-4358-884f-e9b8d8f4f682
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/aem_forms_backup_and_recovery
products: SG_EXPERIENCEMANAGER/6.5/FORMS
discoiquuid: 4e093114-219b-4018-9530-9002eb665448
exl-id: 9e648bab-9284-4fda-abb4-8bd7cd085981
---
# Recovering the AEM forms data {#recovering-the-aem-forms-data}

This section describes the steps required to recover the AEM forms data. Also see [Special considerations for backup and recovery](/help/forms/using/admin-help/backup-recovery-strategy-aem-forms.md#special-considerations-for-backup-and-recovery).

>[!NOTE]
>
>The database, GDS, AEM repository, and Content Storage Root directories must be restored to a computer with the same DNS name as the original.

AEM forms should recover reliably from the following failures:

**Disk Failure:** The latest backup media is required to recover the database content.

**Data Corruption:** File systems do not record past transactions, and systems may accidentally overwrite required process data.

**User Error:** Recovery is limited to the data that is made available by the database. If the data was stored and is available, recovery is simplified.

**Power Outage, System Crash:** File system APIs are often not designed or used in a robust manner that guards against unexpected system failures. If a power outage or system crash occurs, document content that is stored in the database is more likely to be up to date than content that is stored on a file system.

If you are using rolling backup mode, you are still in backup mode after recovery. If you are using snapshot backup mode, you are not in backup mode after recovery.

When restoring from backup to a new system, the following configurations may be different. This difference should not affect a successful recovery of the AEM forms application:

* IP address
* Physical system configuration (CPUs, disk, memory)
* GDS location

>[!NOTE]
>
>The backup of the Content Storage Root directory must be restored to the location of that directory as it was set during Content Services configuration.

If a single node of a multinode cluster failed and the remaining nodes of the cluster are operating properly, perform the cluster single-node recovery procedure.

## Recover the AEM forms data {#recover-the-aem-forms-data}

1. Stop the AEM forms services and application server if running.
1. If necessary, re-create the physical system from a system image. For example, this step may not be necessary if the reason for recovery is a faulty database server.
1. Apply patches or updates to AEM forms that were applied since the image was made. This information was recorded in the backup procedure. AEM forms must be patched to the same patch level as it was when the system was backed up.
1. (WebSphere&reg; Application Server) If you are recovering to a new instance of WebSphere&reg; Application Server, run the restoreConfig.bat/sh command.
1. Recover the AEM forms database by first running a database restore operation using the database backup files and then applying the transaction redo logs to the recovered database. (See [AEM forms database](/help/forms/using/admin-help/files-back-recover.md#aem-forms-database).) For more information, see one of these knowledge base articles:

    * [DB2&reg; Backup and Recovery for AEM forms](/help/forms/using/admin-help/files-back-recover.md#db2)
    * [Oracle Backup and Recovery for AEM forms](/help/forms/using/admin-help/files-back-recover.md#oracle)
    * [Microsoft&reg; SQL Server Backup and Recovery for AEM forms](/help/forms/using/admin-help/files-back-recover.md#sql-server)
    * [MySQL Backup and Recovery for AEM forms](/help/forms/using/admin-help/files-back-recover.md#mysql)

1. Recover the GDS directory by first deleting the contents of the GDS directory on the existing installation of AEM forms and then copying the contents of the GDS directory from the backed-up GDS. If you changed the GDS directory location, see [Changing the GDS location during recovery](recovering-aem-forms-data.md#changing-the-gds-location-during-recovery).
1. Rename the GDS backup directory to be restored as shown in these examples:

   >[!NOTE]
   >
   >If the /restore directory already exists, back it up and then delete it before you rename the /backup directory that contains the latest data.

    * (JBoss&reg;) Rename `[appserver root]/server/'server'/svcnative/DocumentStorage/backup` to:

      `[appserver root]/server/'server'/svcnative/DocumentStorage/restore`.

    * (WebLogic) Rename `[appserverdomain]/'server'/adobe/AEMformsserver/DocumentStorage/backup` to:

      `[appserverdomain]/'server'/adobe/AEMformsserver/DocumentStorage/restore`.

    * (WebSphere&reg;) Rename `[appserver root]/installedApps/adobe/'server'/DocumentStorage/backup` to:

      `[appserver root]/installedApps/adobe/'server'/DocumentStorage/restore`.

1. Recover the Content Storage Root directory by first deleting the contents of the Content Storage Root directory on the existing installation of AEM forms and then recovering the contents by following the tasks for either stand-alone or clustered environments:

   >[!NOTE]
   >
   >The backup of the Content Storage Root directory must be restored to the location of the Content Storage Root directory as it was set during Content Services (Deprecated) configuration.

   **Standalone:** During the recovery process, restore all the directories that were backed up. When these directories are restored, if the /backup-lucene-indexes directory is present, rename it to /lucene-indexes. Otherwise, the lucene-indexes directory should already exist and no action is required.

   **Clustered:** During the recovery process, restore all the directories that were backed up. To restore the Index Root directory, perform the following steps on each node of the cluster:

    * Delete all content in the Index Root directory.
    * If the /backup-lucene-indexes directory is present, copy the contents of the *Content Storage Root directory*/backup-lucene-indexes directory to the Index Root directory and delete the *Content Storage Root directory*/backup-lucene-indexes directory.
    * If the /lucene-indexes directory is present, copy the contents of the *Content Storage Root directory*/lucene-indexes directory to the Index Root directory.

1. Restore/recover the CRX-repository.

    * **Standalone**

      *Restore author and publish instances*: If a disaster occurs, you can restore the repository to the last backed up state by performing the steps described in [Backup and Restore.](https://helpx.adobe.com/experience-manager/kb/CRXBackupAndRestoreProcedure.html)

      The complete restoration of Author node ascertains the restoration of Forms Manager and AEM Forms Workspace data as well.

    * **Clustered**

      For restoration in a clustered environment, see [Strategy for backup and restore in a clustered environment](/help/forms/using/admin-help/strategy-backup-restore-clustered-environment.md#strategy-for-backup-and-restore-in-a-clustered-environment).

1. Delete any AEM forms temporary files that were created in the java.io.temp directory or in the Adobe temp directory.
1. Start AEM forms (see [Starting and stopping services](/help/forms/using/admin-help/starting-stopping-services.md#starting-and-stopping-services))<!-- BROKEN LINK and the application server(s) (see [Maintaining the Application Server](/help/forms/using/admin-help/topics/maintaining-the-application-server.md))-->.

## Changing the GDS location during recovery {#changing-the-gds-location-during-recovery}

If your GDS is restored to a location other than where it was originally, run the LCSetGDS script to set the GDS to the new location. The script is in the `[aem-forms root]\sdk\misc\Foundation\SetGDSCommandline` folder. The script takes two parameters, `defaultGDS` and `newGDS`. See the `ReadMe.txt` file in the same folder for instructions on how to run the script.

>[!NOTE]
>
>If you had enabled document storage in database, you don't need to change the GDS location.

>[!NOTE]
>
>This circumstance is the only one under which you should use this script to change the GDS location. To change the GDS location while AEM forms is running, use Administration Console. (See [Configure general AEM forms settings](/help/forms/using/admin-help/configure-general-aem-forms-settings.md#configure-general-aem-forms-settings).)

>[!NOTE]
>
>Component deployment will fail on Windows if the GDS directory is at the drive root (for example, D:\). For GDS, you must make sure that the directory is not located at the root of the drive but is located in a subdirectory. For example, the directory should be D:\GDS and not simply D:\.

## Recovering the GDS to a clustered environment {#recovering-the-gds-to-a-clustered-environment}

To change the GDS location in a clustered environment, shut down the entire cluster and run the LCSetGDS script on a single node of the cluster. (See [Changing the GDS location during recovery](recovering-aem-forms-data.md#changing-the-gds-location-during-recovery).) Start only that node. When that node is fully started, other nodes in the cluster may be started safely and will correctly point at the new GDS.

>[!NOTE]
>
>If you cannot ensure starting one node completely before starting other nodes, you must run the LCSetGDS script on every node in the cluster before you start the cluster.

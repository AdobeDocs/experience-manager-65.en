---
title: Backup and recovery strategy for AEM forms
description: Learn how to implement a strategy to back up data and ensuring that it remains in sync with the AEM forms data.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/aem_forms_backup_and_recovery
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 01ec6ebc-6d80-4417-9604-c8571aebb57e
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Backup and recovery strategy for AEM forms{#backup-and-recovery-strategy-for-aem-forms}

If your AEM forms implementation stores additional custom data in a different database, you are responsible for implementing a strategy to back up this data and ensuring that it remains in sync with the AEM forms data. Also, the application must be designed so that it is robust enough to handle a scenario where the additional databases get out of sync. It is highly recommended that any database operation that is performed is done in the context of a transaction to help maintain a consistent state.

After you identify how AEM forms is used, determine which files must be backed up, how often, and the backup window to be made available.

>[!NOTE]
>
>As with any other aspect of your AEM forms implementation, your backup and recovery strategy must be developed and tested in a development or staging environment before being used in production to ensure that the entire solution is working as expected with no data loss.

Adobe Experience Manager (AEM) is an integral part of AEM forms. Therefore, you need to back up AEM as well in sync with AEM forms backup as Correspondence Management Solution and services, such as forms manager are based on data stored in AEM part of AEM forms.To prevent any data loss, the AEM forms specific data must be backed up in a way to ensure that GDS and AEM (repository) correlate with database references.The database, GDS, AEM, and Content Storage Root directories must be restored to a computer with the same DNS name as the original.

## Types of backups {#types-of-backups}

The AEM forms backup strategy involves two types of backups:

**System image:** A complete system backup that you can use to restore the contents of your computer if your hard drive or entire computer stops working. A system image backup is necessary only prior to production deployment of AEM forms. Internal corporate policies then dictate how often system image backups are required.

**AEM forms specific data:** Application data exists in database, Global Document Storage (GDS), and AEM repository, and must be backed up in real time. GDS is a directory that is used to store long-lived files that are used within a process. These files may include PDFs, policies, or form templates.

>[!NOTE]
>
>If Content Services (Deprecated) is installed, also back up the Content Storage Root directory. See [Content Storage Root directory (Content Services only)](/help/forms/using/admin-help/files-back-recover.md#content-storage-root-directory-content-services-only).

The database is used to store form artifacts, service configurations, process state, and database references to GDS files. If you enabled document storage in the database, persistent data and documents in the GDS are also stored in the database. The database can be backed up and recovered by using the following methods:

* **Snapshot backup** mode indicates that the AEM forms system is in backup mode either indefinitely or for a specified number of minutes, after which backup mode is no longer enabled. To enter or leave snapshot backup mode, you can use one of the following options. After a recovery scenario, snapshot backup mode should not be enabled.

    * Use the Backup Settings page in Administration Console. To enter snapshot mode, select the Operate In Safe Backup Mode checkbox. Deselect the checkbox to exit snapshot mode.
    * Use the LCBackupMode script (see [Back up the database, GDS, and Content Storage Root directories](/help/forms/using/admin-help/backing-aem-forms-data.md#back-up-the-database-gds-aem-repository-and-content-storage-root-directories)). To exit snapshot backup mode, in the script argument, set the `continuousCoverage` parameter to `false` or use the `leaveContinuousCoverage` option.
    * Use the supplied Backup/Recovery API. <!-- Fix broken link(see AEM forms API Reference section on AEM Forms Help and Tutorials page).-->

* **Rolling backup** mode indicates that the system is always in backup mode, with a new backup mode session being initiated as soon as the previous session is released. No time out is associated with rolling backup mode. When the LCBackupMode script or APIs are called to leave rolling backup mode, a new rolling backup mode session begins. This mode is useful for supporting continuous backups but still allowing old and unneeded documents to be cleaned out of the GDS directory. Rolling backup mode is not supported through the Backup and Recovery page. After a recovery scenario, rolling backup mode is still enabled. You can leave the continuous backup mode (rolling backup mode) by using the LCBackupMode script with the `leaveContinuousCoverage` option.

>[!NOTE]
>
>Leaving rolling backup mode immediately causes a new backup mode session to begin. To disable rolling backup mode completely, use the `leaveContinuousCoverage` option in the script, which overwrites the existing rolling backup session. When in snapshot backup mode, you may leave backup mode as you usually do.

To prevent data loss, the AEM forms specific data must be backed up in a way that ensures that GDS and Content Storage Root directory documents correlate with database references.

>[!NOTE]
>
>When the GDS is stored on the file system and not in the database, perform the database backup before the GDS backup.

## Special considerations for backup and recovery {#special-considerations-for-backup-and-recovery}

Use the following guidelines if you must recover AEM forms into a different environment because of the following changes:

* Change in the IP address, hostname, or port of the AEM Forms Server
* Change in the drive letters or directory path
* Change to a different database host, port, or name

Typically, such recovery scenarios are caused by hardware failure of the server that hosts the application server, database server, or Forms Server. In addition to the AEM forms-specific configurations that are described in this section, you should also make the necessary changes for other parts of the AEM forms deployment such as load balancers and firewalls, if the hostname or IP address of an AEM Forms Server changes.

### What cannot be changed {#what-cannot-be-changed}

Even though you can change the database server and many other parameters, you cannot change the application server type or database type when you recover AEM forms from a backup. For example, if you are recovering an AEM forms backup, you cannot change the application server from JBoss to WebLogic or database from Oracle to DB2. In addition, recovered AEM forms must use the same file system paths such as the fonts directory.

### Restarting after a recovery {#restarting-after-a-recovery}

Before you restart the Forms Server after a recovery, do the following:

1. Start the system in maintenance mode.
1. Do the following to ensure that Form Manager is synced with AEM forms in the maintenance mode:

    1. Go to https://&lt;*server*&gt;:&lt;*port*&gt;/lc/fm and log in using adminstrator/password credentials.
    1. Click the name of the user (Super Administrator in this case) at top-right corner.
    1. Click **Admin Options**.
    1. Click **Start** to synchronize assets from the repository.

1. In a clustered environment, the primary node (with respect to AEM) should be up before the secondary nodes.
1. Ensure that no processes are initiated from either internal or external sources such as the Web, SOAP, or EJB process initiators until the normal operation of the system is validated.

If the main AEM forms database is moved or changed, review the install Guides relevant to your application server for information on updating the database connection information for the AEM forms data sources IDP_DS and EDC_DS.

>[!NOTE]
> 
> It is recommended to use the 'Ctrl + C' command to restart the SDK. Restarting the AEM SDK using alternative methods, for example, stopping Java processes, may lead to inconsistencies in the AEM development environment.

### Changing the AEM forms hostname or IP address {#changing-the-aem-forms-hostname-or-ip-address}

In a cluster, if you use TCP caching instead of UDP, you must update the cache locator configuration. See "Configuring the caching locators (caching using TCP only)" in the configuration guide relevant to your application server.

### Changing the AEM forms node file system paths {#changing-the-aem-forms-node-file-system-paths}

If you change the file system paths for a standalone node, you must update the appropriate references in preferences, other system configurations, custom applications, and deployed AEM forms applications. On the other hand, for a cluster, all nodes must use the same file system path configuration. Set the Global Document Storage (GDS) root directory and ensure that it points to a copy of the recovered GDS which is in sync with the recovered database. Setting the GDS path is important because the GDS can contain data intended to persist across application server restarts.

In a clustered environment, the file system path configuration of the repository should be same for all the cluster nodes before the backup and after the recovery.

Use the `LCSetGDS`script in the `[*aem-forms root]*\sdk\misc\Foundation\SetGDSCommandline` folder to set the GDS path after you change the file system paths. See the `ReadMe.txt` file in the same folder for details. If the old GDS directory path cannot be used, `LCSetGDS` script must be used to set the new path to the GDS before you start AEM forms.

>[!NOTE]
>
>This circumstance is the only one under which you should use this script to change the GDS location. To change the GDS location while AEM forms is running, use Administration Console. (See [Configure general AEM forms settings](/help/forms/using/admin-help/configure-general-aem-forms-settings.md#configure-general-aem-forms-settings)*.) *

After you set the GDS path, start the Forms Server in maintenance mode, and use the administration console to update the remaining file system paths for the new node. After you verify that all the necessary configurations are updated, restart and test AEM forms.

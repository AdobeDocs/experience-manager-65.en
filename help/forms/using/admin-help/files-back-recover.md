---
title: Files to back up and recover
description: This document describes the application and data files that must be backed up.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/aem_forms_backup_and_recovery
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: d2dd381d-a7d2-4fec-a8ba-7ca037fd9dc1
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Files to back up and recover {#files-to-back-up-and-recover}

The application and data files that must be backed up are described in more detail in the following sections.

Consider the following points regarding backup and recovery:

* The database should be backed up before GDS and AEM repository.
* If you need to bring down the nodes in a clustered clustered environment for backup, ensure that the secondary nodes are shut down before the primary node. Otherwise, it can lead to inconsistency in the cluster or server. Also, the primary node should be made live before any secondary node.
* For the restore operation of a cluster, application server should be stopped for each node in the cluster.

## Global Document Storage directory {#global-document-storage-directory}

The GDS is a directory used to store long-lived files that are used within a process. The lifetime of long-lived files is intended to span one or more launches of an AEM forms system, and can span days and even years. These long-lived files can include PDFs, policies, and form templates. Long-lived files are a critical part of the overall state of many AEM forms deployments. If some or all long-lived documents are lost or corrupted, the Forms Server may become unstable.

Input documents for asynchronous job invocation are also stored in the GDS and must be available to process requests. Therefore, it is important that you consider the reliability of the file system that hosts the GDS and employ a redundant array of independent disks (RAID) or other technology as appropriate for your quality and level of service requirements.

The location of the GDS is determined during the AEM forms installation process or later by using administration console. In addition to keeping a high-availability location for GDS, you can also enable database storage for documents. See [Backup options when database is used for document storage](files-back-recover.md#backup-options-when-database-is-used-for-document-storage).

### GDS location {#gds-location}

If you leave the location setting empty during installation, the location defaults to a directory under the application server installation. Back up the following directory for your application server:

* (JBoss) `[appserver root]/server/'server'/svcnative/DocumentStorage`
* (WebLogic) `[appserverdomain]/'server'/adobe/AEMformsserver/DocumentStorage`
* (WebSphere) `[appserver root]/installedApps/adobe/'server'/DocumentStorage`

If you changed the GDS location to a non-default location, you can determine it as follows:

* Log in to administration console and click Settings &gt; Core System Settings &gt; Configurations.
* Record the location that is specified in the Global Document Storage Directory box.

In a clustered environment, the GDS typically points to a directory that is shared on the network and is read/write accessible for every cluster node.

The location of the GDS may be changed during a recovery if the original location is no longer available. (See [Changing the GDS location during recovery](/help/forms/using/admin-help/recovering-aem-forms-data.md#changing-the-gds-location-during-recovery).)

### Backup options when database is used for document storage {#backup-options-when-database-is-used-for-document-storage}

You can enable AEM forms document storage in the AEM forms database using the administration console. Even though this option keeps all persistent documents in the database, AEM forms still requires the file system-based GDS directory because it is used to store permanent and temporary files and resources related to sessions and invocations of AEM forms.

When you select the "Enable document storage in the database" option in the Core System Settings in the administration console or by using Configuration Manager, AEM forms does not allow snapshot backup mode and rolling backup mode. Therefore, you do not need to manage backup modes using AEM forms. If you use this option, you should back up the GDS only once after enabling the option. When you recover AEM forms from a backup, you do not need to rename the backup directory for the GDS or restore GDS.

## AEM repository {#aem-repository}

AEM repository (crx-repository) is created if crx-repository is configured while installing AEM forms. The location of the crx-repository directory is determined during the AEM forms installation process. AEM repository backup and restore is required along with database and GDS for consistent AEM forms data in AEM forms. AEM repository contains data for Correspondence Management Solution, Forms manager, and AEM Forms Workspace.

### Correspondence Management Solution {#correspondence-management-solution}

Correspondence Management Solution centralizes and manages the creation, assembly and delivery of secure, personalized, and interactive correspondences. It enables you to quickly assemble correspondence from both pre-approved and custom-authored content in a streamlined process from creation to archival. As a result, your customers get timely, accurate, convenient, secure, and relevant communication. Your business maximizes the value of customer interactions and minimizes cost and risk with a process that is streamlined for ease, speed, and productivity.

A simple Correspondence Management Solution setup includes an author instance and a publish instance on the same machine or on different machines

### forms manager {#forms-manager}

forms manager streamlines the process of updating, managing, and retiring forms.

### AEM Forms Workspace {#html-workspace}

AEM Forms Workspace matches the capabilities of the (Deprecated for AEM forms on JEE) Flex Workspace and adds new capabilities to extend and integrate Workspace and make it more user-friendly.

>[!NOTE]
>
>The Flex Worksapce is deprecated for AEM forms release.

It allows for task management on clients without Flash Player and Adobe Reader. It facilitates rendition of HTML Forms, besides PDF forms and Flex forms.

## AEM forms database {#aem-forms-database}

The AEM forms database stores content such as form artifacts, service configurations, process state, and database references to files in the GDS and the Content Storage Root directory (for Content Services). Database backups can be performed in real time without an interruption in service, and recovery can be to a specific point in time or to a particular change. This section describes how to configure your database so that it can be backed up in real time.

On a properly configured AEM forms system, the system administrator and the database administrator can easily collaborate to recover the system to a consistent, known state.

To back up the database in real time, you must either use snapshot mode or configure your database to run in the specified log mode. This allows your database files to be backed up while the database is open and available for use. Furthermore, the database preserves its rollback and transaction logs when it is running in these modes.

>[!NOTE]
>
>Adobe&reg; LiveCycle&reg; Content Services ES (Deprecated) is a content management system installed with LiveCycle. It enables users to design, manage, monitor, and optimize human-centric processes. Content Services (Deprecated) support ends on 12/31/2014. See [Adobe product lifecycle document](https://www.adobe.com/support/products/enterprise/eol/eol_matrix.html).

### DB2 {#db2}

Configure your DB2 database to run in archive log mode.

>[!NOTE]
>
>If your AEM forms environment was upgraded from a previous version of AEM forms and uses DB2, online backup is not supported. In this case, you must shut down AEM forms and perform an offline backup. Future versions of AEM forms will support online backup for upgrade customers.

IBM has a suite of tools and help systems to help database administrators manage their backup and recovery tasks:

* IBM DB2 Archive Log Accelerator 
* IBM DB2 Data Archive expert 

DB2 has built-in capabilities to back up a database to Tivoli Storage Manager. By using Tivoli Storage Manager, DB2 backups can be stored on other media or the local hard drive.

### Oracle {#oracle}

Use snapshot backups or configure your Oracle database to run in archive log mode. (See [Oracle Backup: An Introduction](https://www.databasedesign-resource.com/oracle-backup.md).) For more information about backing up and recovering your Oracle database, go to these sites:

[Oracle Backup and Recovery:](https://www.oracle.com/technetwork/database/features/availability/br-overview-097160.html) Explains the concepts of backup and recovery and the most common techniques for using Recovery Manager (RMAN) for backup, recovery, and reporting in more detail, and providing more information about how to plan a backup and recovery strategy.

[Oracle Database Backup and Recovery User's Guide:](https://download.oracle.com/docs/cd/E11882_01/backup.112/e10642.pdf) Provides in-depth information about RMAN architecture, backup and recovery concepts and mechanisms, advanced recovery techniques such as point-in-time recovery and database flashback features, and backup and recovery performance tuning. It also covers user-managed backup and recovery, using host operating system facilities instead of RMAN. This volume is essential for backup and recovery of more sophisticated database deployments and for advanced recovery scenarios.

[Oracle Database Backup and Recovery Reference:](https://download.oracle.com/docs/cd/E11882_01/backup.112/e10643.pdf) Provides complete information about syntax and semantics for all RMAN commands, and describes the database views that are available for reporting on backup and recovery activities.

### SQL Server {#sql-server}

Use snapshot backups or configure your SQL Server database to run in transaction log mode.

SQL Server also provides two backup and recovery tools:

* SQL Server Management Studio (GUI)
* T-SQL (command line)

For more information, see [Backup and Restore](https://msdn.microsoft.com/en-us/library/ms187048(v=SQL.90).aspx).

### MySQL {#mysql}

Use MySQLAdmin or modify the INI files in Windows to configure your MySQL database to run in binary log mode. (See [MySQL binary logging](https://dev.mysql.com/doc/refman/5.1/en/binary-log.html).) A hot backup tool for MySQL is also available from InnoBase software. (See [Innobase Hot Backup](https://www.innodb.com/hot-backup/features.md).)

>[!NOTE]
>
>The default binary logging mode for MySQL is "Statement", which is incompatible with tables used by Content Services (Deprecated). Using binary logging in this default mode causes Content Services (Deprecated) to fail. If your system includes Content Services (Deprecated), use "Mixed" logging mode. To enable "Mixed" logging, add the following argument to the my.ini file: `binlog_format=mixed log-bin=logname`

You can use the mysqldump utility to obtain the full database backup. Full backups are required, but they are not always convenient. They produce large backup files and take time to generate. To do an incremental backup, ensure that you start the server with the - `log-bin` option as described in the previous section. Each time the MySQL server restarts, it stops writing to the current binary log, creates a new one and, from then on, the new one becomes the current one. You can force a switch manually with the `FLUSH LOGS SQL` command. After the first full backup, subsequent incremental backups are done by using the mysqladmin utility with the `flush-logs` command, which creates the next log file.

See [Backup Strategy Summary](https://dev.mysql.com/doc/refman/5.5/en/backup-strategy-summary.html).

```text
binlog_format=mixed
log-bin=logname
```

## Content Storage Root directory (Content Services only) {#content-storage-root-directory-content-services-only}

The Content Storage Root directory contains the Content Services (Deprecated) repository where all documents, artifacts and indexes are stored. The Content Storage Root directory tree must be backed up. This section describes how to determine the location of the Content Storage Root directory for both stand-alone and clustered environments.

### Content Storage Root location (stand-alone environment) {#content-storage-root-location-stand-alone-environment}

The Content Storage Root directory is created when Content Services (Deprecated) is installed. The location of the Content Storage Root directory is determined during the AEM forms installation process.

The default location for the Content Storage Root directory is `[aem-forms root]/lccs_data`.

Back up the following directories in the Content Storage Root directory:

/audit.contentstore

/contentstore

/contentstore.deleted

/backup-lucene-indexes

If the /backup-lucene-indexes directory is not present, back up the /lucene-indexes directory, also in the Content Storage Root directory. If the /backup-lucene-indexes directory is present, do not back up the /lucene-indexes directory because it may cause errors.

### Content Storage Root location (clustered environment) {#content-storage-root-location-clustered-environment}

When you install Content Services (Deprecated) in a clustered environment, the Content Storage Root directory is split into two separate directories:

**Content Storage Root directory:** Typically, a shared network directory that is read/write accessible for all nodes in the cluster

**Index Root directory:** A directory that is created on each node in the cluster, always having the same path and directory name

The default location for the Content Storage Root directory is `[GDS root]/lccs_data`, where `[GDS root]` is the location described in [GDS location](files-back-recover.md#gds-location). Back up the following directories in the Content Storage Root directory:

/audit.contentstore

/contentstore

/contentstore.deleted

/backup-lucene-indexes

If the /backup-lucene-indexes directory is not present, back up the /lucene-indexes directory, also in the Content Storage Root directory. If the /backup-lucene-indexes directory is present, do not back up the /lucene-indexes directory because it may cause errors.

The default location for the Index Root directory is `[aem-forms root]/lucene-indexes` on each node.

## Customer-installed fonts {#customer-installed-fonts}

If you installed additional fonts on your AEM forms environment, you must back them up separately. Back up all Adobe and customer font directories that are specified in administration console under Settings &gt; Core System &gt; Configurations. Ensure that you back up the entire font directory.

>[!NOTE]
>
>By default, the Adobe fonts installed with AEM forms are in the `[aem-forms root]/fonts` directory.

If you are reinitializing the operating system on the host computer and want to use fonts from the previous operating system, the contents of the system fonts directory should also be backed up. (For specific instructions, see the documentation for your operating system).

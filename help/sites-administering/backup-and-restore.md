---
title: Backup and Restore
description: Learn how to backup and restore your AEM content and configurations.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: operations
content-type: reference
exl-id: dd26dade-b769-483e-bc11-dcfa5ed1f87e
solution: Experience Manager, Experience Manager Sites
feature: Operations
role: Admin
---
# Backup and Restore{#backup-and-restore}

There are two ways to back up and restore repository content in AEM:

* You can create an external backup of the repository and store it in a safe location. If the repository breaks down, you can restore it to the previous state.
* You can create internal versions of the repository content. These versions are stored in the repository along with the content, so you can quickly restore nodes and trees you have changed or deleted.

## General {#general}

The approach described here applies for system backup and recovery.

If you need to backup and/or recover a small amount of content, which is lost, a recovery of the system is not necessarily required:

* Either you can fetch the data from another system via a package
* or you restore the backup on a temporary system, create a content package and deploy it on the system, where this content is missing.

For details, see [Package Backup](/help/sites-administering/backup-and-restore.md#package-backup) below.

## Timing {#timing}

Do not run backup in parallel with the datastore garbage collection, as it might harm the results of both processes.

## Offline Backup {#offline-backup}

You can always do an offline backup. This requires a downtime of AEM, but can be quite efficient in terms of required time compared to an online backup.

In most cases you will use a filesystem snapshot to create a read-only copy of the storage at that time. To create a offline backup perform these steps:

* stop the application
* make a snapshot backup
* start the application

As the snapshot backup usually takes only a few seconds, the entire downtime is less than a few minutes.

## Online Backup {#online-backup}

This backup method creates a backup of the entire repository, including any applications deployed under it, such as AEM. The backup includes content, version history, configuration, software, hotfixes, custom applications, log files, search indexes, and so on. If you are using clustering and if the shared folder is a subdirectory of `crx-quickstart` (either physically, or using a softlink), the shared directory is also backed up.

You can restore the entire repository (and any applications) at a later point.

This method operates as a "hot" or "online" backup so it can be performed while the repository is running. Therefore the repository is usable while the backup is running. This method works for the default, Tar storage based, repository instances.

When creating a backup, you have the following options:

* Backing up to a directory using AEM's integrated backup tool.
* Backing up to a directory using a filesystem snapshot

In any case, the backup creates an image (or snapshot) of the repository. Then the systems backup agent should take care to actually transfer this image to a dedicated backup system (tape drive).

>[!NOTE]
>
>If AEM Online Backup feature is used on an AEM instance which has a custom blobstore configuration, it is recommended to configure the path of datastore to be outside the " `crx-quickstart`" directory and backup the datastore separately.

>[!CAUTION]
>
>The online backup only backs up the file system. If you store the repository content and/or the repository files in a database, that database needs to backed up separately. If you are using AEM with MongoDB, see documentation on how to use the [MongoDB native backup tools](https://docs.mongodb.org/manual/tutorial/backup-with-mongodump/).

### AEM Online Backup {#aem-online-backup}

An online backup of your repository lets you create, download, and delete backup files. It is a "hot" or "online" backup feature, so can be executed while the repository is being used normally in the read-write mode.

>[!CAUTION]
>
>Do not run AEM Online Backup concurrently with [Datastore Garbage Collection](/help/sites-administering/data-store-garbage-collection.md) or [Revision Cleanup](/help/sites-deploying/revision-cleanup.md#how-to-run-offline-revision-cleanup). It will negatively affect the system performance.

When starting a backup you can specify a **Target Path** and/or a **Delay**.

**Target Path** The backup files are usually saved in the parent folder of the folder holidng the quickstart jar file (.jar). For example, if you have the AEM jar file located under /InstallationKits/AEM, then the backup will be generated under /InstallationKits. You can also specify a target to a location of your choice.

If the **TargetPath** is a directory, the image of the repository is created in this directory. If the same directory is used multiple times (or always) to storing backup,

* modified files in the repository are modified accordingly in the TargetPath
* deleted files in the repository are deleted in the TargetPath
* created files in the repository are created in the TargetPath

>[!NOTE]
>
>If **TargetPath** is set to filename with the extension **.zip**, the repository is backed up to a temporary directory and then the content of this temporary directory is compressed and stored in the ZIP file.
>
>This approach is discouraged, because
>
>* it requires additional disk storage during the backup process (temporary directory plus the zip file)
>* the compression process is done by the repository and might influence its performance.
>* It delays the backup process.
>* Up to Java 1.6 Java is only able to create ZIP files up to a size of 4 gigabytes.
>
>If you need to create a ZIP as backup format, you should backup to a directory and then use a compression program to create the zip file.

**Delay** Indicates a time delay (in milliseconds), so that repository performance is not affected. By default, the repository backup runs at full speed. You can slow down creating an online backup, so that it does not slow down other tasks.

When using a very large delay, ensure that online backup does not take more than 24 hours. If it did, discard this backup, as it may not contain all binaries.
A delay of 1 millisecond typically results in 10% CPU usage, and a delay of 10 milliseconds usually results in less than 3% CPU usage. The total delay in seconds can be estimated as follows: Repository size in MB, multiplied by delay in milliseconds, divided by 2 (if the zip option is used), or divided by 4 (when backing up to a directory). That means a backup to a directory of a 200 MB repository with 1 ms delay increases the backup time by about 50 seconds.

>[!NOTE]
>
>See [How AEM Online Backup Works](#how-aem-online-backup-works) for internal details of the process.

To create a backup:

1. Log in to AEM as the administrator.

1. Go to **Tools - Operations - Backup.**
1. Click **Create**. The backup console opens.

   ![chlimage_1-1](assets/chlimage_1-1a.png)

1. On the backup console, specify the **[Target Path](#aem-online-backup)** and **[Delay](#aem-online-backup)**.

   ![chlimage_1-2](assets/chlimage_1-2a.png)

   >[!NOTE]
   >
   >The backup console is also available using:
   >
   >
   >` https://<*hostname*>:<*port-number*>/libs/granite/backup/content/admin.html`

1. Click **Save**, a progress bar will indicate the progress of the backup.

   >[!NOTE]
   >
   >You can **Cancel** a running backup at any time.

1. When the backup is complete, the zip files are listed in the backup window.

   ![chlimage_1-3](assets/chlimage_1-3a.png)

   >[!NOTE]
   >
   >Backup files that are no longer needed can be removed using the console. Select the backup file in the left pane then click **Delete**.

   >[!NOTE]
   >
   >If you have backed up to a directory: after the backup process is finished AEM will not write to the target directory.

### Automating AEM Online Backup {#automating-aem-online-backup}

If possible, the online backup should be run when there is little load on the system, for example, in the morning.

Backups can be automated using the `wget` or `curl` HTTP clients. The following show examples of how to automate backup by using curl.

#### Backing up to the default Target Directory {#backing-up-to-the-default-target-directory}

>[!CAUTION]
>
>In the following example various parameters in the `curl` command might need to be configured for your instance; for example, the hostname ( `localhost`), port ( `4502`), admin password ( `xyz`) and file name ( `backup.zip`).

```shell
curl -u admin:admin -X POST http://localhost:4502/system/console/jmx/com.adobe.granite:type=Repository/op/startBackup/java.lang.String?target=backup.zip
```

The backup file/directory is created on the server in the parent folder of the folder containing the `crx-quickstart` folder (the same as if you were creating the backup using the browser). For example, if you have installed AEM in the directory `/InstallationKits/crx-quickstart/`, then the backup is created in the `/InstallationKits` directory.

The curl command returns immediately, so you must monitor this directory to see when the zip file is ready. While the backup is being created a temp directory (with the name based on that of the final zip file) can be seen, at the end this will be zipped. For example:

* name of resulting zip file: `backup.zip`
* name of temporary directory: `backup.f4d5.temp`

#### Backing up to a non-default Target Directory {#backing-up-to-a-non-default-target-directory}

Usually the backup file/directory is created on the server in the parent folder of the folder containing the `crx-quickstart` folder.

If you want to save your backup (of either sort) to a different location you can set an absolute path ``to the `target` parameter in the `curl` command.

For example, to generate `backupJune.zip` in the directory `/Backups/2012`:

```shell
curl -u admin:admin -X POST http://localhost:4502/system/console/jmx/com.adobe.granite:type=Repository/op/startBackup/java.lang.String?target=/Backups/2012/backupJune.zip"

```

>[!CAUTION]
>
>When using a different application server (such as JBoss), the online backup may not work as expected, because the target directory is not writable. In this case, contact Support.

>[!NOTE]
>
>A backup can also be triggered [using the MBeans provided by AEM](/help/sites-administering/jmx-console.md).

### Filesystem Snapshot Backup {#filesystem-snapshot-backup}

The process described here is specially suited for large repositories.

>[!NOTE]
>
>If you want to use this backup approach, your system must support filesystem snapshots. For example, for Linux this means your filesystems should be placed on a logical volume.

1. Do a snapshot of the filesystem AEM is deployed on.

1. Mount the filesystem snapshot.
1. Perform a backup and unmount the snapshot.

### How AEM Online Backup Works {#how-aem-online-backup-works}

AEM Online Backup is comprised of a series of internal actions to ensure the integrity of the data being backed up and the backup file(s) being created. These are listed below for those interested.

The online backup uses the following algorithm:

1. When creating a zip file, the first step is to create or locate the target directory.

    * If backing up to a zip file, a temporary directory is created. The directory name starts with `backup.` and ends with `.temp`; for example, `backup.f4d3.temp`.
    * If backing up to a directory, the name specified in the target path is used. An existing directory can be used, otherwise a new directory will be created.

      An empty file named `backupInProgress.txt` is created in the target directory when the backup starts. This file is deleted when the backup is finished.

1. The files are copied from the source directory to the target directory (or temporary directory when creating a zip file). The segmentstore is copied before the datastore to avoid repository corruption. The index and cache data are omitted when creating the backup. As a result, data from `crx-quickstart/repository/cache` and `crx-quickstart/repository/index` is not included in the backup. The progress bar indicator of the process is between 0%&ndash;70% when creating a zip file, or 0%&ndash;100% if no zip file is created.

1. If the backup is being made to a pre-existing directory, then "old" files in the target directory are deleted. Old files are files that do not exist in the source directory.

The files are copied to the target directory in four stages:

1. In the first copy stage (progress indicator 0% - 63% when creating a zip file or 0% - 90% if no zip file is created), all files are copied while the repository is running normally. The process has two phases:

    * Phase A - everything is copied except for the datastore (with delay).
    * Phase B - only the datastore is copied (with delay).

1. In the second copy stage (progress indicator 63% - 65.8% when creating a zip file or 90% - 94% if no zip file is created) only files that were created or modified in the source directory since the first copy stage was started are copied. Depending on the activity of the repository, this might range from no files at all, up to a significant number of files (because the first file copy stage usually takes the most time). The copy process is similar to the first stage (Phase A and Phase B with delay).
1. In the third copy stage (progress indicator 65.8% - 68.6% when creating a zip file or 94% - 98% if no zip file is created) only files that were created or modified in the source directory since the second copy stage was started are copied. Depending on the activity of the repository, there might be no files to copy, or a very small number of files (because the second file copy stage is usually fast). The copy process is similar to the second stage - Phase A and Phase B but without delay.
1. File copy stages one to three are all done concurrently while the repository is running. Only files that were created or modified in the source directory since the third copy stage was started are copied. Depending on the activity of the repository, there might be no files to copy, or a very, very small number of files (because the second file copy stage usually is very fast). Progress indicator 68.6% - 70% when creating a zip file or 98% - 100% if no zip file is created. The copy process is similar to the third stage.
1. Depending on the target:

    * If a zip file was specified, this is now created from the temporary directory. Progress indicator 70% - 100%. The temporary directory is then deleted.
    * If the target was a directory, the empty file named `backupInProgress.txt` is deleted to indicate that the backup is finished.

## Restoring the Backup {#restoring-the-backup}

You can restore a backup as follows:

* In case you performed a Filesystem Snapshot Backup, you can simply restore an image of the system.
* In case you created the backup as a zip file, just unzip the contents in a new folder and start AEM from that location.

## Package Backup {#package-backup}

To back up and restore content, you can use one of the Package Manager, which uses the Content Package format to back up and restore content. The Package Manager provides more flexibility in defining and managing packages.

For details on the features and tradeoffs of each of these individual content package formats, see [How to Work With Packages](/help/sites-administering/package-manager.md).

### Scope of Backup {#scope-of-backup}

When you back up nodes using either the Package Manager or the Content Zipper, CRX saves the following information:

* The repository content below the tree you have selected.
* The Node type definitions that are used for the content you back up.
* The Namespace definitions that are used for the content you back up.

When backing up, AEM loses the following information:

* The version history.

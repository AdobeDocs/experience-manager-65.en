---
title: Strategy for backup and restore in a clustered environment
seo-title: Strategy for backup and restore in a clustered environment
description: If your AEM forms implementation stores additional custom data in a different database, you must implement a strategy to back up this data ensuring that it remains in sync with the AEM forms data.
seo-description: If your AEM forms implementation stores additional custom data in a different database, you must implement a strategy to back up this data ensuring that it remains in sync with the AEM forms data.
uuid: c29b989c-30ed-4a8e-bab8-9b7746291a33
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/aem_forms_backup_and_recovery
products: SG_EXPERIENCEMANAGER/6.5/FORMS
discoiquuid: c332985b-4556-4056-961a-fce2356da88d
exl-id: 98c96349-f253-475f-b646-352269814a38
---
# Strategy for backup and restore in a clustered environment {#strategy-for-backup-and-restore-in-a-clustered-environment}

>[!NOTE]
>
>If your AEM forms implementation stores additional custom data in a different database, you must implement a strategy to back up this data ensuring that it remains in sync with the AEM forms data. Also, the application must be designed so that it is robust enough to handle a scenario where the additional databases get out of sync. It is highly recommended that any database operation that is performed is done in the context of a transaction to help maintain a consistent state.

You need to back up the following parts of the AEM forms system to recover from any error:

* Database used by AEM forms
* GDS that has long lived data and other persistent documents
* AEM database (crx-repository)

>[!NOTE]
>
>You need to backup any other data that is being used by your AEM forms setup, such as customer fonts, connecters data, and so on.

## Back up a clustered environment {#back-up-a-clustered-environment}

This topic discusses the following strategies to back up any AEM forms clustered environment:

* Offline backup with downtime
* Offline backup with no downtime (backup of a secondary node which is shutdown)
* Online Backup with no downtime but delay in response
* Back up the Bootstrap properties file

### Offline backup with downtime {#offline-backup-with-downtime}

1. Shut down the entire cluster and related services. (see [Starting and stopping services](/help/forms/using/admin-help/starting-stopping-services.md#starting-and-stopping-services))
1. On any node, back up the database, GDS, and Connectors. (see [Files to back up and recover](/help/forms/using/admin-help/files-back-recover.md#files-to-back-up-and-recover))
1. To back up AEM repository offline, perform the following steps:

    1. For each cluster node, back up the file that contains the cluster node id.
    1. Back up all files of any secondary cluster node, including subdirectories.
    1. Back up repository/system id of each cluster node separately.

   For detailed steps, see [Backup and Restore](https://helpx.adobe.com/experience-manager/kb/CRXBackupAndRestoreProcedure.html).

1. Back up any other data, such as customer fonts.
1. Start the cluster again.

### Offline backup with no downtime {#offline-backup-with-no-downtime}

1. Enter the rolling backup mode. (see [Entering the backup modes](/help/forms/using/admin-help/backing-aem-forms-data.md#entering-the-backup-modes))

   Leave the rolling backup mode after a recovery.

1. Shut down any of the secondary nodes of the cluster regarding AEM. (see [Starting and stopping services](/help/forms/using/admin-help/starting-stopping-services.md#starting-and-stopping-services))
1. On any node, back up the database, GDS, and Connectors. (see [Files to back up and recover](/help/forms/using/admin-help/files-back-recover.md#files-to-back-up-and-recover))
1. To back up AEM repository offline, perform the following steps:

    1. For each cluster node, back up the file that contains the cluster node id.
    1. Back up all files of any secondary cluster node, including subdirectories.
    1. Back up repository/system.id of each cluster node separately.

   For detailed steps, see [Backup and Restore](https://helpx.adobe.com/experience-manager/kb/CRXBackupAndRestoreProcedure.html).

1. Back up any other data, such as customer fonts.
1. Start the cluster again.

### Online Backup with no downtime but delay in response {#online-backup-with-no-downtime-but-delay-in-response}

1. Enter the rolling backup mode. (see [Entering the backup modes](/help/forms/using/admin-help/backing-aem-forms-data.md#entering-the-backup-modes))

   Leave the rolling backup mode after a recovery.

1. Shut down any of the secondary nodes of the cluster regarding AEM. (see [Starting and stopping services](/help/forms/using/admin-help/starting-stopping-services.md#starting-and-stopping-services))
1. On any node, back up the database, GDS, and Connectors. (see [Files to back up and recover](/help/forms/using/admin-help/files-back-recover.md#files-to-back-up-and-recover))
1. To back up AEM repository online, perform the following steps:

    1. For each cluster node, back up the file that contains the cluster_node.id.
    1. Back up repository/system.id of each cluster node separately.
    1. On any secondary node, take an online backup of the repository for detailed steps see Online backup.

1. Back up any other data, such as customer fonts.
1. Start the cluster again.

### Back up the Bootstrap properties file {#back-up-the-bootstrap-properties-file}

When we create an AEM cluster, a properties file is created in the application server for all secondary nodes. It is recommended to back up the Bootstrap properties file. You can find the file at the following location on your application server:

* JBoss&reg;: in the BIN directory
* WebLogic: in the domain directory
* WebSphere&reg;: in the profile directory

Back up the file for disaster recovery scenario of AEM secondary node and replace it at the specified location on the application server, if restored.

## Recovery in a clustered environment {#recovery-in-a-clustered-environment}

If there is any failure of the entire cluster or a single node, restore it using the backup.

For a single node recovery, shut down the single node and run the single node recovery procedure.

In case the entire cluster fails due to failures like database crash, perform the following steps. Restoration depends on the method of backup used.

### Restoring a single node {#restoring-a-single-node}

1. Stop the corrupted node.

   >[!NOTE]
   >
   >If the corrupted node is an AEM primary node, shut down the entire cluster node.

1. Re-create the physical system from a system image.
1. Apply patches or updates to AEM forms that were applied since the image was made. This information was recorded during the backup procedure. AEM forms must be recovered to the same patch level as it was when the system was backed up.
1. (*Optional*) If all other nodes are working fine, it is possible that the AEM repository is also corrupted. In this case, you will see a repository unsync message in the error.log file of the AEM repository.

   To restore the repository, perform the following steps.

   >[!NOTE]
   >
   >If a zipped crx-repository backup was taken online, unzip it at any location and follow the offline restoration process.

    1. Delete the repository, shared, version, and workspaces directories in the clusterNode directory of the node.
    1. Restore the backup of the cluster node (including subdirectories) to the node.
    1. Delete the file clusterNode/revision.log on the node.
    1. Delete the .lock on the node, if exists.
    1. Delete the repository/system.id on the node, if exists.
    1. Delete the files &ast;&ast;/listener.properties on the node, if exist.
    1. Restore repository/cluster_node.id for individual cluster nodes.

>[!NOTE]
>
>Consider the following points:

* If the failed node was an AEM primary node, copy all the content from the secondary repository folder (crx-repository\crx.0000 where 0000 can be any digits) to the crx-repository\ repository folder and delete the secondary repository folder.
* Before restarting any cluster node, ensure that you delete the repository /clustered.txt from the primary node.
* Ensure that the primary node is started first and after it is up, start other nodes.

### Restoring the entire cluster {#restoring-the-entire-cluster}

1. Stop all the cluster nodes.
1. Recreate the physical system from a system image.
1. Apply patches or updates to AEM formsAEM formsthat were applied since the image was made. This information was recorded in step 1 of the backup procedure. AEM forms must be recovered to the same patch level as it was when the system was backed up.
1. Restore the database, GDS, and Connectors.
1. Do the following to recover the AEM repository offline:

   >[!NOTE]
   >
   >If a zipped crx-repository backup was taken online, unzip it at any location and follow the offline restoration process.

    1. On all cluster nodes, delete the repository, shared, version, and workspaces directories in the clusterNode directory.
    1. Delete all files and directories in the shared directory.
    1. Restore the backup of the cluster node (including subdirectories) to one cluster nodes.
    1. Copy all files of the restored cluster node to all other cluster nodes. Once done, each cluster node contains the same data.
    1. Delete the file clusterNode/revision.log on all cluster nodes.
    1. Delete the .lock on all cluster nodes, if exists.
    1. Delete the repository/system.id all cluster nodes, if exists.
    1. Delete the files &ast;&ast;/listener.properties on all cluster nodes, if exist.
    1. Restore repository/cluster_node.id for individual cluster nodes.

>[!NOTE]
>
>Consider the following points:

* If the failed node was an AEM primary node, copy all the content from the secondary repository folder (it looks like crx-repository\crx.0000 where 0000 can be any digits) to the crx-repository\ repository folder.
* Before restarting any cluster node, ensure that you delete the repository /clustered.txt from the primary node.
* Ensure that the primary node is started first and after it is up, start other nodes.

## Back up and restore Correspondence Management Solution publish node {#back-up-and-restore-correspondence-management-solution-publish-node}

The publisher node does not have any primary-secondary relationship in a clustered environment. You can take backup of any Publisher node by following [Backup and Restore](https://helpx.adobe.com/experience-manager/kb/CRXBackupAndRestoreProcedure.html).

### Recover a single publisher node {#recover-a-single-publisher-node}

1. Shutdown the node that must be recovered and do not do any publish activity until the node is up again.
1. Restore the Publish node using [Restoring the Backup](https://helpx.adobe.com/experience-manager/kb/CRXBackupAndRestoreProcedure.html).

### Recover a cluster {#recover-a-cluster}

1. Shutdown the cluster.
1. Restore the Publish node using [Restoring the Backup](https://helpx.adobe.com/experience-manager/kb/CRXBackupAndRestoreProcedure.html).
1. Start the primary node followed by the secondary node of the author cluster.

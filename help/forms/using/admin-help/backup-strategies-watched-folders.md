---
title: Backup strategies for watched folders

description: This document describes how watched folders are affected by different backup and recovery scenarios, the limitations and outcomes of these scenarios, and how to minimize data loss.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/aem_forms_backup_and_recovery
products: SG_EXPERIENCEMANAGER/6.5/FORMS

exl-id: 0d36160a-29fa-4cc4-a0ff-fc681d3e040e
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Backup strategies for watched folders {#backup-strategies-for-watched-folders}

This content describes how watched folders are affected by different backup and recovery scenarios, the limitations and outcomes of these scenarios, and how to minimize data loss.

*Watched Folder* is a file system-based application that invokes configured service operations that manipulate the file within one of the following folders in the watched folder hierarchy:

* Input
* Stage
* Output
* Failure
* Preserve

A user or client application first drops the file or folder in the input folder. The service operation then moves the file into the stage folder for processing. After the service performs the specified operation, it saves the modified file in the output folder. Successfully processed source files are moved to the preserve folder, and failed processing files are moved to the failure folder. When the `Preserve On Failure` attribute for the watched folder is enabled, failed processed source files are moved to the preserve folder. (See [Configuring watched folder endpoints](/help/forms/using/admin-help/configuring-watched-folder-endpoints.md#configuring-watched-folder-endpoints).)

You can back up watched folders by backing up the file system.

>[!NOTE]
>
>This backup is independent of the database or document storage backup and recovery process.

## How watched folders work {#how-watched-folders-work}

This content describes the watched folder file manipulation process. It is important to understand this process before developing a recovery plan. In this example, the `Preserve On Failure` attribute for the watched folder is enabled. The files are processed in the order in which they arrive.

The following table describes the file manipulation of five sample files (file1, file2, file3, file4, file5) throughout the process. In the table, the x axis represents time, such as Time 1 or T1, and the y axis represents folders within the watched folder hierarchy, such as Input.

<table>
 <thead>
  <tr>
   <th><p>Folder</p></th>
   <th><p>T1</p></th>
   <th><p>T2</p></th>
   <th><p>T3</p></th>
   <th><p>T4</p></th>
   <th><p>T5</p></th>
   <th><p>T6</p></th>
   <th><p>T7</p></th>
  </tr>
 </thead>
 <tbody>
  <tr>
   <td><p>Input</p></td>
   <td><p>file1, file2, file3, file4</p></td>
   <td><p>file2, file3, file4</p></td>
   <td><p>file3, file4</p></td>
   <td><p>file4</p></td>
   <td><p>empty</p></td>
   <td><p>file5</p></td>
   <td><p>empty</p></td>
  </tr>
  <tr>
   <td><p>Stage</p></td>
   <td><p>empty</p></td>
   <td><p>file1</p></td>
   <td><p>file2</p></td>
   <td><p>file3</p></td>
   <td><p>file4</p></td>
   <td><p>empty</p></td>
   <td><p>file5</p></td>
  </tr>
  <tr>
   <td><p>Output</p></td>
   <td><p>empty</p></td>
   <td><p>empty</p></td>
   <td><p>file1_out</p></td>
   <td><p>file1_out, file2_out</p></td>
   <td><p>file1_out, file2_out</p></td>
   <td><p>file1_out, file2_out, file4_out</p></td>
   <td><p>file1_out, file2_out, file4_out</p></td>
  </tr>
  <tr>
   <td><p>Failure</p></td>
   <td><p>empty</p></td>
   <td><p>empty</p></td>
   <td><p>empty</p></td>
   <td><p>empty</p></td>
   <td><p>file3_fail, file3 </p></td>
   <td><p>file3_fail, file3 </p></td>
   <td><p>file3_fail, file3 </p></td>
  </tr>
  <tr>
   <td><p>Preserve</p></td>
   <td><p>empty</p></td>
   <td><p>empty</p></td>
   <td><p>file1 </p></td>
   <td><p>file1, file2 </p></td>
   <td><p>file1, file2 </p></td>
   <td><p>file1, file2, file4 </p></td>
   <td><p>file1, file2, file4 </p></td>
  </tr>
 </tbody>
</table>

The following text describes file manipulation for each time:

**T1:** The four sample files are placed in the input folder.

**T2:** The service operation moves file1 into the stage folder for manipulation.

**T3:** The service operation moves file2 into the stage folder for manipulation. It places the results of file1 in the output folder, and it moves file1 to the preserve folder.

**T4:** The service operation places file3 in the stage folder for manipulation. It places the results of file2 in the output folder, and it places file2 in the preserve folder.

**T5:** The service operation places file4 in the stage folder for manipulation. The manipulation of file3 fails, and the service operation places it in the failure folder.

**T6:** The service operation places file5 in the input folder. It places the results of file4 in the output folder, places file4 in the preserve folder.

**T7:** The service operation places file5 in the stage folder for manipulation.

## Backing up watched folders {#backing-up-watched-folders}

It is recommended that you back up the entire watched folder file system to another file system.

## Restoring watched folders {#restoring-watched-folders}

This section describes how to restore watched folders. Watched folders often invoke short-lived processes that complete within a minute. In such cases, restoring the watched folder with a backup that is done hourly will not prevent data loss.

For example, if a backup is taken at time T1 and the server fails at T7, then file1, file2, file3, and file4 are already manipulated. Restoring the watched folder with a backup taken at T1 does not prevent data loss.

If a more recent backup was taken, you can restore the files. When restoring the files, consider which watched folder hierarchy folder the current file resides in:

**Stage:** Files in this folder are processed again after the watched folder is restored.

**Input:** Files in this folder are processed again after the watched folder is restored.

**Result:** Files in this folder are not processed.

**Output:** Files in this folder are not processed.

**Preserve:** Files in this folder are not processed.

## Strategies to minimize data loss {#strategies-to-minimize-data-loss}

The following strategies can minimize output and input folder data loss when restoring a watched folder:

* Back up output and failure folders frequently, such as hourly, to avoid loss of result and failure files.
* Back up the input files in a folder other than the watched folder. This ensures file availability after recovery in case you cannot find the files in either the output or failure folder. Ensure that your file naming scheme is consistent.

  For example, if you are saving the output with `%F.`*extension*, the output file will have the same name as the input file. This helps you to determine which input files are manipulated and which ones must be resubmitted. If you see only file1_out file in the result folder and not file2_out, file3_out and file4_out, you must resubmit file2, file3, and file4.

* If the watched folder backup that is available is older than the time it takes to process the job, you should allow the system to create a watched folder and automatically place the files in the input folder.
* If the latest available backup is not recent enough, the backup time is less than the time it takes to process the files, and the watched folder is restored, the file was manipulated in one of the following different stages:

    * **Stage 1:** In the input folder
    * **Stage 2:** Copied to the stage folder but the process is not yet invoked
    * **Stage 3:** Copied to the stage folder and the process is invoked
    * **Stage 4:** Manipulation in progress
    * **Stage 5:** Results returned

  If files are in Stage 1, they will be manipulated. If files are in Stage 2 or 3, place them in the input folder for manipulation to take place again.

  >[!NOTE]
  >
  >If manipulation of a file occurs more than once, data loss will be prevented but results may be duplicated.  

## Conclusion {#conclusion}

Due to the dynamic and constantly changing nature of a watched folder, restoration of watched folders should be done with files that are backed up within a day. A best practice would be backing up the results, storing the input folder on a server, and tracking input files so that you can resubmit the job if there is failure.

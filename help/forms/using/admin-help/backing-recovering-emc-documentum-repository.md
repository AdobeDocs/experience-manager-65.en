---
title: Backing up and recovering the EMC Documentum repository
description: This document describes the tasks required to back up and recover the EMC Documentum repository configured for your AEM forms environment.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/aem_forms_backup_and_recovery
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: bc21659f-88d6-4dff-8baf-12746e1b3ed9
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Backing up and recovering the EMC Documentum repository {#backing-up-and-recovering-the-emc-documentum-repository}

This section describes the tasks required to back up and recover the EMC Documentum repository configured for your AEM forms environment.

>[!NOTE]
>
>These instructions assume that AEM forms with Connectors for ECM and EMC Documentum Content Server are installed and configured as required.

For both the backup and restore processes, there are two main tasks:

* Backing up (or restoring) the AEM forms environment.
* Backing up (or restoring) the EMC Documentum Content Server.

>[!NOTE]
>
>Back up your AEM forms data before you back up the EMC Documentum system, and subsequently restore the EMC Documentum system before you restore the AEM forms environment.

## Software requirements {#software-requirements}

To perform the necessary backup tasks on your EMC Documentum Content Server, purchase an appropriate third-party utility such as EMC NetWorker from EMC or CYA SmartRecovery for EMC Documentum from CYA. The following instructions describe the steps for using EMC NetWorker Module version 7.2.2.

You need the following EMC NetWorker modules:

* NetWorker Module
* NetWorker Configuration Wizard
* NetWorker Device Configuration Wizard
* NetWorker Module for the database type used by your Content Server
* NetWorker Module for Documentum

## Preparing the EMC Document Content Server for backup and recovery {#preparing-the-emc-document-content-server-for-backup-and-recovery}

This section describes installing and configuring the EMC NetWorker software on the Content Server.

**Prepare the EMC Documentum server for backup**

1. On the EMC Documentum Content Server, install the EMC NetWorker modules, accepting all defaults.

   During the installation processes, you are prompted to enter the server name of the Content Server computer as the *NetWorker Server Name*. When installing the EMC NetWorker Module for your database, choose a "Complete" installation.

1. Using the sample content below, create a configuration file named *nsrnmd_win.cfg* and save it to an accessible location on the Content Server. This file will be called by the backup and restore commands.

   The following text contains formatting characters for line breaks. If you copy this text to a location outside this document, copy a portion at a time and remove the formatting characters when you paste it to the new location.

   ```shell
    ################################################
    # NetWorker Module for Documentum v1.2 nsrnmd_win.cfg D5.3+ example with
    # typical set of working parameters.  THIS FILE MUST BE SITE-CUSTOMISED.
    #
    # Parameters not shown can be set in this file (as per site customisation) #or from the command-line.
    #
    # See the user Guides for details on all parameters, including
    # those not listed below.
    # Note: DCTM environment for D6 is slightly different from D5, refer to D6
    # Installation Guide to update the values.
    ################################################
    #Can get values for most of below from doing as the dctm inst owner: cmd> set DOCUMENTUM=C:\Documentum
    DM_HOME=C:\Documentum\product\6.0
    JAVA_HOME=C:\Progra~1\Documentum\java\1.5.0_12
    JAVA_PATH=C:\Progra~1\Documentum\java\1.5.0_12\bin
    PATH=C:\WINNT\system32;C:\WINNT;C:\WINNT\system32\WBEM;C:\Documentum\product\6.0\bin;C:\Documentum\fulltext\fast;C:\Documentum\product\6.0\fusion;C:\Program Files\Documentum\Shared;C:\Program Files\Legato\nsr\bin;C:\Program Files\Microsoft SQL Server\80\Tools\Binn;C:\Program Files\Microsoft SQL Server\90\DTS\Binn\;C:\Program Files\Microsoft SQL Server\90\Tools\binn;C:\Program Files\Microsoft SQL Server\90\Tools\Binn\VSShell\Common7\IDE;C:\Program Files\Documentum\java\1.5.0_12\bin;C:\Documentum\config;C:\Documentum
    #See also manifest dctm.jar file for class path locations
    CLASSPATH=.;C:\Program Files\Legato\nsr\bin;C:\Program Files\Legato\nsr\bin\nsrnmdde.jar;C:\Program Files\Documentum\java\1.5.0_12\lib\tools.jar;C:\Program Files\Documentum\Shared\dfc.jar;C:\Program Files\Documentum\Shared\aspectjrt.jar;C:\Program Files\Documentum\dctm.jar;C:\Program Files\Documentum\Shared\workflow.jar;C:\Program Files\Documentum\Shared\log4j.jar;C:\Program Files\Documentum\java\1.5.0_12\lib\dt.jar;C:\Documentum\config

    ################################################
    #If not using nsrnmdsv -m ALL|DB|DB_LOG|FTI|FTI_ALL|ICF|SA|SA_ALL, set #for backup
    NMD_SCOPE=ALL
    #Mandatory when scope (backup or restore) is FTI/SA without -a option
    #NMD_OBJECT_NAME=filestore_01
    ################################################
    NMDDE_DM_DOCBASE=Docbase
    NMDDE_DM_USER=Administrator
    #NMDDE_DM_PASSWD must be set via running: nsrnmdsv -f <nmdcfg> -P <pwd>.
    ################################################
    #DB related hooks to invoke arbitrary scripts:
    #Set if DB is on a remote host
    #NMD_DB_HOST=dbhost
    #Pure basename implies remote host execution; absolute path ... local
    #execution as in NMD v1.0.
    #
    #Remote execution requires script be put in remote nsrexecd bin directory
    #and D5.3+ host be added to remote nsr\res\servers file w/ nsrexecd recycled
    #
    #Refer to user Guides for sample script code.
    NMD_DB_FULL_BACKUP_CMD=C:\DocumentumBackup\Scripts\nsrnmddbf.bat
    NMD_DB_LOG_BACKUP_CMD=C:\DocumentumBackup\Scripts\nsrnmddbl.bat
    NMD_DB_INCR_BACKUP_CMD=C:\DocumentumBackup\Scripts\nsrnmddbi.bat
    ################################################
    #For D5.3+ only: NMD_FTI_INCLUDED, NMD_FTI_HOST, NMD_FTI_USER,
    #NMD_FTI_PASSWD & NMD_FTI_SUBDIRS.
    #Optional for remote D5.3+ FTI server
    NMD_FTI_INCLUDED=no
    #NMD_FTI_HOST=ftihost
    #Recommended for D5.3+ FTI server quiesce/unquiesce
    #NMD_FTI_USER=ftiadmin
    #The index name: optional for D5.3+ FTI server, used with -M FTI_ALL or
    #-M ALL
    #NMD_FTI_NAME=rep_name_ftindex_01
    #Recommended for D5.3+ FTI server quiesce/unquiesce
    #NMDDE_FTI_PASSWD must be set via running: nsrnmdsv -f <nmdcfg> -P <pwd>
    #-M FTI.
    #Pure basename implies remote host execution; absolute path ... local execution
    #as in NMD v1.0.
    #
    #Remote execution requires script be put in remote nsrexecd bin directory
    #and D5.3+ host be added to remote nsr\res\servers file w/ nsrexecd
    #recycled.
    #
    #See example nsrnmdfti*.bat examples.
    #
    #Mandatory for D5.3+
    #NMD_BACKUP_FTI_QUIESCE=nsrnmdftiq.bat
    #NMD_BACKUP_FTI_UNQUIESCE=nsrnmdftiu.bat
    #Used for D5.3+ to get InstallProfile.xml FTI file in multinode
    #discovery.
    #Optional, if not specified, will treat as single-node FTI.
    #NMD_FTI_GET_INSTPROF=nsrnmdfti_instprof.bat
    #Mandatory for D5.3+. No spaces in paths or around comma separators.
    #For remote FTI, paths must be valid at the FTI host.
    #NMD_FTI_SUBDIRS=F:\Documentum_idx\data\fulltext\fixml,F:\Documentum_idx
    #\data\fulltext\index
    ################################################
    #Mandatory. No spaces in paths or before comma
    #separators in NMD_ICF_SUBDIRS_xxx:
    #NMD_ICF_INCLUDED=yes
    #NMD_ICF_SUBDIRS=C:\Documentum\dba,C:\Documentum\product\5.3
    ################################################
    NMD_FILEREPORT_INCLUDED=yes
    NMDDE_METADATA_OUTPUT_DEST=C:\docbase_freports\
    ################################################
    #Other misc recommended NMD_xxx parameters
    #Recommended to get more meaningful saveset names
    NMD_USE_DEFAULT_SAVESET_NAMES=yes
    #Use following to skip unwanted ICF, FTI and non-SnapImage SA dirs/files.
    #For example, "<</>> +skip: dm_ftwork_dir" line will skip non-data
    #files.
    #
    #The path will be the same and must exist on D5.3+, remote FTI host, and
    #RCS hosts correspondingly if used.
    #NMD_DIRECTIVES_FILE=E:\Program Files\Legato\nsr\res\nsrnmddirectives.txt
    #For non-SnapImage SA backup
    #NMD_SA_FULL_NUM_SAVESET=16
    #NMD_SA_INCR_NUM_SAVESET=4
    #NMD_USE_SNAPIMAGE=yes
    ################################################
    # DSA setup
    ################################################
    # Name of the config file at the remote sites;
    # Mandatory, listed in the config file at the primary host.
    # (if skipped, backup is treated as local)
    # NMD_RCS_CFG_FILE=rep_name_rcs.cfg

    # SA-host mapping add, optional, will override far-store list info.
    # No space around comma.
    # NMD_HOST_SAS_MAP=host01,sa_01,sa_02
    # NMD_HOST_SAS_MAP=host02,sa_03
    ################################################
    NSR_SERVER=con-dctm
    #NSR_CLIENT=d5svrhost
    NSR_GROUP=Default
    NSR_DATA_VOLUME_POOL=Default
    #NSR_SNAPIMAGE_DATA_VOLUME_POOL=Default
    #Relocation dir will be the same on D5+ and remote FTI/SA hosts.
    NSR_RELOCATION=C:\reloc
    #NSR_PARALLELISM=16
    NSR_DEBUG_FILE=C:\Program Files\Legato\nsr\applogs\nmd.log
    NSR_DEBUG_LEVEL=9
    ################################################
    NMDDE_DM_PASSWD=XAtup9pl
   ```

   Keep the configuration file password field `NMDDE_DM_PASSWD` blank. You will set the password in the next step.

1. Set the configuration file password as follows:

    * Open a command prompt, and change to `[NetWorker_root]\Legato\nsr\bin`.
    * Run the following command: `-nsrnmdsv.exe -f`*&lt;path_to_cfg_file&gt; -P &lt;password&gt;*

1. Create the executable batch (.bat) files that are used to back up the database. (See the NetWorker documentation.) Set the details in the batch files according to your installation.

    * Full database backup (nsrnmddbf.bat):

      `NetWorker_database_module_root` `-s`*<NetWorker_Server_Name>* `-U``[username]` `-P`*[password]* `-l full`*&lt;database_name&gt;*

    * Incremental database backup (nsrnmddbi.bat):

      `[NetWorker_database_module_root]` `-s`*<NetWorker_Server_Name>* `-U``[username]` `-P``[password]` `-l 1 -R`*&lt;database_name&gt;*

    * Database log backup (nsrnmddbl.bat):

      `[NetWorker_database_module_root]` `-s``<NetWorker_Server_Name>` `-U``[username]` `-P``[password]` `-l incr -R`*&lt;database_name&gt;*

      Where:

      `[NetWorker_database_module_root]` is the installation directory of the NetWorker module. For example, the default installation directory for NetWorker Module for SQL Server is C:\Program Files\Legato\nsr\bin\nsrsqlsv.

      `NetWorker_Server_Name` is the server that NetWorker is installed on.

      `username` & `password` are the user name and password of the database administrator user.

      `database_name` is the name of the database to back up.

**Create a backup device**

1. Create a directory on the EMC Documentum server and share the folder by giving full rights to all users.
1. Start EMC NetWorker Administrator and click Media Management &gt; Devices.
1. Right-click Devices and select Create.
1. Enter the following values and click OK:

   **Name:** The full path of the shared directory

   **Media Type:** `File`

1. Right-click the new device and select Operations.
1. Click Label, enter a name, click OK, and then click Mount.

A device is added to which the backed up files will be saved. You can add multiple devices of different formats.

## Back up the EMC Documentum Content Server {#back-up-the-emc-documentum-content-server}

Perform the following tasks after you complete a full backup of your AEM forms data. (See [Backing up the AEM forms data](/help/forms/using/admin-help/backing-aem-forms-data.md#backing-up-the-aem-forms-data).)

>[!NOTE]
>
>The command scripts require the full path to the nsrnmd_win.cfg file that you created in [Preparing the EMC Document Content Server for backup and recovery](backing-recovering-emc-documentum-repository.md#preparing-the-emc-document-content-server-for-backup-and-recovery).

1. Open a command prompt, and change to `[NetWorker_root]\Legato\nsr\bin`.
1. Run the following command:

   ```shell
    - nsrnmdsv.exe -f <path_to_cfg_file>
   ```

## Restore the EMC Documentum Content Server {#restore-the-emc-documentum-content-server}

Perform the following tasks before you restore your AEM forms data. (See [Recovering the AEM forms data](/help/forms/using/admin-help/recovering-aem-forms-data.md#recovering-the-aem-forms-data).)

>[!NOTE]
>
>The command scripts require the full path to the nsrnmd_win.cfg file that you created in [Preparing the EMC Document Content Server for backup and recovery](backing-recovering-emc-documentum-repository.md#preparing-the-emc-document-content-server-for-backup-and-recovery).

1. Stop the Docbase service that you are restoring.
1. Start the NetWorker User utility for your database module (for example, *NetWorker User for SQL Server*).
1. Click the Restore tool and then select Normal.
1. On the left side of the screen, select the database for your Docbase and click the Start button on the toolbar.
1. When the database is restored, restart the Docbase service.
1. Open a command prompt and change to *[NetWorker_root]*\Legato\nsr\bin
1. Run the following command:

   ```shell
    - nsrnmdrs.exe -B <docbase_name> -f <path_to_cfg_file> -C SA
   ```

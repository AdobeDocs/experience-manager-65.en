---
title: Custom Standalone Install
seo-title: Custom Standalone Install
description: Learn about the options available when installing a standalone AEM instance. 
seo-description: Learn about the options available when installing a standalone AEM instance. 
uuid: e1cb45c4-3b2b-4951-8f67-213072e825b3
contentOwner: Tyler Rushton
products: SG_EXPERIENCEMANAGER/6.4/SITES
content-type: reference
topic-tags: deploying
discoiquuid: c9e51008-6009-49a2-9c74-1c610cef2e7f
---

# Custom Standalone Install{#custom-standalone-install}

This section describes the options available when installing a standalone AEM instance. You can also read [Storage Elements](/help/sites-deploying/storage-elements-in-aem-6.md) for more information on choosing the backend storage type after freshly installing AEM 6.

## Changing the Port Number by Renaming the File {#changing-the-port-number-by-renaming-the-file}

The default port for AEM is 4502. If that port is not available or already in use, Quickstart automatically configures itself to use the first available port number as follows: 4502, 8080, 8081, 8082, 8083, 8084, 8085, 8888, 9362, `<random>`.

You can also set the port number by renaming the quickstart jar file, so that the file name includes the port number; for example, `cq5-publish-p4503.jar` or `cq5-author-p6754.jar`.

There are various rules to be followed when renaming the quickstart jar file:

* When you rename the file, it must start with `cq;` as in `cq5-publish-p4503.jar`.  

* It is recommended that you *always* prefix the port number with -p; as in cq5-publish-p4503.jar or cq5-author-p6754.jar.

>[!NOTE]
>
>This is to ensure that you do not need to worry about fulfiling the rules used for extracting the port number:
>
>* the port number must be 4 or 5 digits
>* these digits must come after a dash
>* if there are any other digits in the filename, then the port number must be prefixed with `-p`
>* the "cq5" prefix at the beginning of the filename is ignored
>

>[!NOTE]
>
>You can also change the port number by using the `-port` option in the start command.

## Run Modes {#run-modes}

**Run modes** allow you to tune your AEM instance for a specific purpose; for example, author or publish, test, development, intranet etc. These modes also allow you to control the use of sample content. This sample content is defined before the quickstart is built and can include packages, configurations, etc. This can be particularly useful for production-ready installations when you want to keep your installation lean and without sample content. For more information see:

* [Run Modes](/help/sites-deploying/configure-runmodes.md)

## Adding a File Install Provider {#adding-a-file-install-provider}

By default the folder `crx-quickstart/install` is watched for files.  
This folder does not exist, but simply can be created at runtime.

If a bundle, configuration or content package is put into this directory, it is automatically picked up and installed. If it's removed, it gets uninstalled.   
It is another way to put bundles, content packages or configurations to the repository.

This is especially interesting for several use cases:

* During development, it might be easier to put something into the file system.
* If something goes wrong, the web console and the repository are not reachable. With this you can put additional bundles into this directory and they should get installed.
* The `crx-quickstart/install` folder can be created before quickstart is started, and additional packages can be put there.

>[!NOTE]
>
>See also [How to install CRX packages automatically on server startup](https://helpx.adobe.com/experience-manager/kb/HowToInstallPackagesUsingRepositoryInstall.html) for examples.

## Installing and Starting Adobe Experience Manager as a Windows Service {#installing-and-starting-adobe-experience-manager-as-a-windows-service}

>[!NOTE]
>
>Be sure to perform the following procedure while logged on as Administrator or start/run these steps using the **Run As Administrator** context-menu selection.
>
>Being logged on as a user with administrator privileges is **insufficient**. If you are not logged on as Administrator when completing these steps you receive **Access Denied** errors.

To install and start AEM as a Windows service:

1. Open the crx-quickstart\opt\helpers\instsrv.bat file in a text editor.
1. If you are configuring a 64-bit Windows server, replace all instances of prunsrv with one of the following commands, according to your operating system:

    * prunsrv_amd64
    * prunsrv_ia64

   This command invokes the appropriate script that starts the Windows service daemon in 64-bit Java instead of 32-bit Java.

1. To prevent the process from forking into more than one process, increase the maximum heap size and the PermGen JVM parameters. Locate the `set jvm_options` command and set the value as follows:

   `set jvm_options=-XX:MaxPermSize=256M;-Xmx1792m`

1. Open Command Prompt, change the current directory to the crx-quickstart/opt/helpers folder of the AEM installation, and enter the following command to create the service:

   `instsrv.bat cq5`

   To verify that the service is created, open Services in the Administrative Tools control panel or type `start services.msc` in Command Prompt. The cq5 service appears in the list.

1. Start the service by doing one of the following:

    * In the Services control panel, click cq5 and click Start.

   ![chlimage_1-71](assets/chlimage_1-71.png)

    * In the command line, type net start cq5.

   ![chlimage_1-72](assets/chlimage_1-72.png)

1. Windows indicates that the service is running. AEM starts and the prunsrv executable appears in Task Manager. In your web browser, navigate to AEM, for example, `http://localhost:4502` to start using AEM.

   ![chlimage_1-73](assets/chlimage_1-73.png)

>[!NOTE]
>
>The property values in the instsrv.bat file are used when creating the Windows service. If you edit the property values in instsrv.bat, you must uninstall and then reinstall the service.

>[!NOTE]
>
>When installing AEM as service, you must provide the absolute path for the logs directory in `com.adobe.xmp.worker.files.ncomm.XMPFilesNComm` from Configuration Manager.

To uninstall the service, either click **Stop** in the **Services** control panel or in the command line, navigate to the folder and type `instsrv.bat -uninstall cq5`. The service gets removed from the list in the **Services** control panel or from the list in the command line when you type `net start`.

## Redefining the location of the temporary work directory {#redefining-the-location-of-the-temporary-work-directory}

The default location of the temporary folder of the java machine is `/tmp`. AEM uses this folder too, for example when building packages.

If you want to change the location of the temporary folder (for example, if you need a directory with more free space) then define a `<new-tmp-path>` by adding the JVM parameter:

`-Djava.io.tmpdir="/<new-tmp-path>"`

to either:

* the server startup command line  
* the CQ_JVM_OPTS environment parameter in the serverctl or start script

## Further options available from the Quickstart file {#further-options-available-from-the-quickstart-file}

Further options and renaming conventions are described in the Quickstart help file, which is available through the -help option. To access the help, type:

* `java -jar cq5-<version>.jar -help`

```shell
Loading quickstart properties: default
Loading quickstart properties: instance
Setting properties from filename '/Users/Desktop/AEM/cq-quickstart-5.6.0.jar'
--------------------------------------------------------------------------------
Adobe Experience Manager Quickstart (build 20130129)                            
--------------------------------------------------------------------------------
Usage:                                                                          
 Use these options on the Quickstart command line.                              
--------------------------------------------------------------------------------

-help (--help,-h)
         Show this help message                                                 
-quickstart.server.port (-p,-port) <port>
         Set server port number                                                 
-contextpath (-c,-org.apache.felix.http.context_path) <contextpath>
         Set context path                                                       
-debug <port>
         Enable Java Debugging on port number; forces forking                   
-gui 
         Show GUI if running on a terminal                                      
-nobrowser (-quickstart.nobrowser)
         Do not open browser at startup                                         
-unpack
         Unpack installation files only, do not start the server (implies       
         -verbose)                                                              
-v (-verbose)
         Do not redirect stdout/stderr to files and do not close stdin          
-nofork
         Do not fork the JVM, even if not running on a console                  
-fork
         Force forking the JVM if running on a console, using recommended       
         default memory settings for the forked JVM.                            
-forkargs <args> [<args> ...]
         Additional arguments for the forked JVM, defaults to '-Xmx1024m        
         -XX:MaxPermSize=256m '.  Use -- to specify values starting with -,     
         example: '-forkargs -- -server'                                        
-a (--interface) <interface>
         Optional IP address (interface) to bind to                             
-pt <string>
         Process type (main/fork) - do not use directly, used when forking a    
         process                                                                
-r <string> [<string> [<string> [<string> [<string> [<string> [<string> [<string> [<string> [<string>]]]]]]]]]
         Runmode(s) - Use this to define the run mode(s)                        
-b <string>
         Base folder - defines the path under which the quickstart work folder  
         is created                                                             
-low-mem-action <string>
         Low memory action - what to do if memory is insufficient at startup    
-use-control-port
         Start a control port                                                   
-ll <level>
         Define launchpad log level (1 = error...4 = debug)                     
--------------------------------------------------------------------------------
Quickstart filename options                                                     
--------------------------------------------------------------------------------
Usage:                                                                          
 Rename the jar file, including one of the patterns shown below, to set the     
corresponding option. Command-line options have priority on these filename      
patterns.                                                                       
--------------------------------------------------------------------------------

-NNNN
         Include -NNNN.jar or -pNNNN in the renamed jar filename to run on port 
         NNNN, for example: quickstart-8085.jar                                 
-nobrowser
         Include -nobrowser in the renamed jar filename to avoid opening the    
         browser at startup, example: quickstart-nobrowser-8085.jar             
-publish
         Include -publish in the renamed jar filename to run cq5 in "publish"   
         mode, example: cq5-publish-7502.jar                                    
--------------------------------------------------------------------------------
The license.properties file
--------------------------------------------------------------------------------
  The license.properties file stores licensing information, created from the    
  licensing form displayed on first startup and stored in the folder from where 
  Quickstart is run.                                                            
--------------------------------------------------------------------------------
Log files
--------------------------------------------------------------------------------
  Once Quickstart has been unpacked and started, log files can be found under   
  ./crx-quickstart/logs.                                                        
--------------------------------------------------------------------------------

```

## Installing AEM in the Amazon EC2 environment {#installing-aem-in-the-amazon-ec-environment}

When installing AEM on an Amazon Elastic Compute Cloud (EC2) instance, if you install both author and publish on the EC2 instance, the Author instance is installed correctly by following the procedure on how to [install an instance of AEM](/help/sites-deploying/custom-standalone-install.md); however, the Publish instance becomes Author.

Before installing the Publish instance on your EC2 environment, do the following:

1. Unpack the jar file for the Publish instance before starting the instance for the first time. To unpack the file use the following command:

   ```xml
   java -jar quickstart.jar -unpack
   ```

   >[!NOTE]
   >
   >If you change the mode **after** starting the instance the first time, you cannot change the runmode.

1. Start the instance by running:

   ```xml
   java -jar quickstart.jar -r publish
   ```

   >[!CAUTION]
   >
   >Make sure you first run the instance after unpacking it by running the command above. Otherwise, the quickstart.properties fill will not be generated. Without this file, any future AEM upgrades will fail.

1. In the **bin** folder, open the **start** script and check the following section:

   ```xml
   # runmode(s)
   if [ -z "$CQ_RUNMODE" ]; then
    CQ_RUNMODE='author'
   fi
   
   ```

1. Change the runmode to **publish** and save the file.

   ```xml
   # runmode(s)
   if [ -z "$CQ_RUNMODE" ]; then
    CQ_RUNMODE='publish'
   fi
   
   ```

1. Stop the instance and restart it by running the **start** script.

## Verifying the Installation {#verifying-the-installation}

The following links can be used to verify that your installation is operational (all examples are on the basis that the instance is running on port 8080 of the localhost, that CRX is installed under /crx and Launchpad under /):

* `http://localhost:8080/crx/de`

  The CRXDE Lite console.

* `http://localhost:8080/system/console`

  The Web Console.

## Actions after Installation {#actions-after-installation}

Although there are many possibilities to configure AEM WCM, certain actions should be taken, or at least reviewed immediately after installation:

* Consult the [Security Checklist](/help/sites-administering/security-checklist.md) for tasks required to ensure that your system remains secure.
* Review the list of default users and groups which are installed with AEM WCM. Check whether you want to take action on any other accounts - see [Security and User Administration](/help/sites-administering/security.md) for further details.

## Accessing CRXDE Lite and the Web Console {#accessing-crxde-lite-and-the-web-console}

Once AEM WCM has been started, you can also access:

* [CRXDE Lite](#accessing-crxde-lite) - used to access and manage the repository
* [Web Console](#accessing-the-web-console) - used to manage or configure the OSGi bundles (also known as the OSGi Console)

### Accessing CRXDE Lite {#accessing-crxde-lite}

To open CRXDE Lite you can select **CRXDE Lite** from the welcome screen or use your browser to navigate to

```
 https://<<i>host</i>>:<<i>port</i>>/crx/de/index.jsp
```

For example:  
`http://localhost:4502/crx/de/index.jsp` ``

![installcq_crxdelite](assets/installcq_crxdelite.png) 

### Accessing the Web Console {#accessing-the-web-console}

To access the Adobe CQ Web console you can select **OSGi Console** from the welcome screen or use your browser to navigate to

```
 https://<<i>host</i>>:<<i>port</i>>/system/console
```

For example:  
`http://localhost:4502/system/console`  
or for the Bundles page  
`http://localhost:4502/system/console/bundles`

![chlimage_1-74](assets/chlimage_1-74.png)

See [OSGi Configuration with the Web Console](/help/sites-deploying/configuring-osgi.md#osgi-configuration-with-the-web-console) for further details.

## Troubleshooting {#troubleshooting}

For information on dealing with issues that may come up during installation, see:

* [Troubleshooting](/help/sites-deploying/troubleshooting.md)

## Uninstalling Adobe Experience Manager {#uninstalling-adobe-experience-manager}

Because AEM installs into a single directory, there is no need for an uninstall utility. Uninstalling can be as simple as deleting the entire installation directory, although how you uninstall AEM depends on what you want to achieve and what persistent storage you use.

If persistent storage is embedded in the installation directory, for example, in the default TarPM installation, deleting folders removes data as well.

>[!NOTE]
>
>Adobe highly recommends that you back up your repository before deleting AEM. If you delete the entire &lt;cq-installation-directory&gt;, you will delete the repository. To keep the repository data before deleting, move or copy the &lt;cq-installation-directory&gt;/crx-quickstart/repository folder somewhere else before deleting the other folders.

If your installation of AEM uses external storage, for example, a database server, removing folder does not remove the data automatically, but it does remove the storage configuration, which makes restoring the JCR content difficult.

---
title: Custom Standalone Install
seo-title: Custom Standalone Install
description: Learn about the options available when installing a standalone AEM instance. 
seo-description: Learn about the options available when installing a standalone AEM instance. 
uuid: 411e3c6b-63fd-4649-b029-be646842bd2c
contentOwner: Tyler Rushton
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: deploying
discoiquuid: eb46bf3c-05ca-46c4-ad28-316fd423c500
index: y
internal: n
snippet: y
---

# Custom Standalone Install{#custom-standalone-install}

This section describes the options available when installing a standalone AEM instance. You can also read [Storage Elements](/6-5/sites/deploying/using/storage-elements-in-aem-6.md) for more information on choosing the backend storage type after freshly installing AEM 6.

## Changing the Port Number by Renaming the File {#changing-the-port-number-by-renaming-the-file}

The default port for AEM is 4502. If that port is not available or already in use, Quickstart automatically configures itself to use the first available port number as follows: 4502, 8080, 8081, 8082, 8083, 8084, 8085, 8888, 9362, `<*random*>`.

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

### Java 11 Considerations {#java-considerations}

If you are running Oracle Java 11 (or generally versions of Java newer than 8), additional switches will need to be added to your command line when starting AEM.

* The following - `-add-opens` switches need to be added in order to prevent related reflection access WARNING messages in the `stdout.log`

```shell
--add-opens=java.desktop/com.sun.imageio.plugins.jpeg=ALL-UNNAMED --add-opens=java.base/sun.net.www.protocol.jrt=ALL-UNNAMED --add-opens=java.naming/javax.naming.spi=ALL-UNNAMED --add-opens=java.xml/com.sun.org.apache.xerces.internal.dom=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/jdk.internal.loader=ALL-UNNAMED --add-opens=java.base/java.net=ALL-UNNAMED -Dnashorn.args=--no-deprecation-warning
```

* Additionally, you need to make use of the `-XX:+UseParallelGC` switch in order to mitigate any potential performance issues.

Below is a sample of how the additional JVM parameters should look like when starting AEM on Java 11:

```shell
-XX:+UseParallelGC --add-opens=java.desktop/com.sun.imageio.plugins.jpeg=ALL-UNNAMED --add-opens=java.base/sun.net.www.protocol.jrt=ALL-UNNAMED --add-opens=java.naming/javax.naming.spi=ALL-UNNAMED --add-opens=java.xml/com.sun.org.apache.xerces.internal.dom=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/jdk.internal.loader=ALL-UNNAMED --add-opens=java.base/java.net=ALL-UNNAMED -Dnashorn.args=--no-deprecation-warning
```

Finally, if you are running an instance upgraded from AEM 6.3, make sure the following property is set to **true** under `sling.properties`:

* `felix.bootdelegation.implicit`

## Run Modes {#run-modes}

**Run modes** allow you to tune your AEM instance for a specific purpose; for example, author or publish, test, development, intranet etc. These modes also allow you to control the use of sample content. This sample content is defined before the quickstart is built and can include packages, configurations, etc. This can be particularly useful for production-ready installations when you want to keep your installation lean and without sample content. For more information see:

* [Run Modes](/6-5/sites/deploying/using/configure-runmodes.md)

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
>See also [How to install CRX packages automatically on server startup](/kb/HowToInstallPackagesUsingRepositoryInstall.md) for examples.

<!--
Comment Type: draft

<h3>Relocating or Preconfiguring the Repository</h3>
-->

<!--
Comment Type: draft

<p>The default location of the folder holding the files of the CRX repository within AEM is:</p>
<p style="margin-left: 40px;"><span class="code">crx-quickstart/repository/</span> </p>
<p>With the default configuration file being:</p>
<p style="margin-left: 40px;"><span class="code">crx-quickstart/repository/repository.xml</span><br /> </p>
<p>Sometimes you may want to relocate, or preconfigure, the repository; for example, when installing without a cluster or when using a different Persistence Manager.</p>
<p>Relocation <i>must</i> be configured <i>before</i> installation:<br /> </p>
-->

<!--
Comment Type: draft

<ol>
<li><p>Create the new directory (<span class="code">&lt;<i>new-location</i>&gt;</span>) for the repository files.</p> <p>For example:</p> <p> <span class="code">&lt;<i>cq-installation-dir</i>&gt;/repositoryRelocated/</span><br /> </p> </li>
<li><p>Navigate to the <span class="code">&lt;aem<i>-installation-dir</i>&gt;</span> directory (holding the installation jar file <span class="code">cq-quickstart&lt;<i>version</i>&gt;.jar</span> and <span class="code">license.properties</span>).</p> </li>
<li><p>Create a new file (in <span class="code">&lt;<em>cq-installation-dir</em>&gt;</span>):</p>
<ul>
<li><span class="code"><a href="/content/docs/en/aem/6-3/deploy/deploying-crx/repository_setup.md#bootstrap.properties">bootstrap.properties</a></span></li>
</ul> <p>With the following entries:</p> <p><strong><span class="monospaced">repository.home=&lt;<i>new-location</i>&gt;</span></strong> This is used to relocate the repository. Files required for the repository will be created here upon installation. For example, repository.home=repositoryRelocated</p><p><strong><span class="monospaced">repository.config=&lt;<i>new-location</i>&gt;/repository.xml</span></strong> This specifies the location of repository.xml. This version can be edited with your customizations. The location does not have to be the same as above, but is often. For example, repository.config=repositoryRelocated/repository.xml</p><p>For example:<br /> </p>
<codeblock gutter="true" class="syntax xml">
repository.home=repositoryRelocated!!discoiqbr!!repository.config=repositoryRelocated/repository.xml
</codeblock>
<note type="note">
<p>If you want to use the default repository.xml as a starting point for your custom configuration, either take it from a default installation or extract it from the unpacked distribution:</p>
<p><code class="code"># mkdir tmp
<discoiqbr /> </code># cd tmp<br /> # jar xf ../app/cq-quickstart-6.3.0-standalone.jar resources/install/15/com.day.crx.sling.server-2.4.23.jar<br /> # jar xf resources/install/15/com.day.crx.sling.server-2.4.23.jar crx-core-2.4.23.jar<br /> # jar xf crx-core-2.4.23.jar com/day/crx/core/repository.xml</p>
<p>You can now copy com/day/crx/core/repository.xml to the place you wish and remove the tmp directory afterwards.</p>
</note></li>
<li><p>Start the installation procedure; files needed for the repository will be saved in the new location; for this example they will be under:</p> <p style="margin-left: 40px;"><span class="code">&lt;aem<i>-installation-dir</i>&gt;/repositoryRelocated/</span><br /> </p> </li>
</ol>
-->

<!--
Comment Type: draft

<p>If you just want to preconfigure the repository (without relocating it) you only have to:</p>
<ul>
<li>extract <span class="code">repository.xml</span> to the required location<br /> </li>
<li>update <span class="code">repository.xml</span> as required<br /> </li>
<li>create <span class="code">bootstrap.properties</span> and define <span class="code">repository.config</span></li>
</ul>
<p>Again, before starting the actual installation.<br /> </p>
-->

<!--
Comment Type: draft

<h3>Removing the Geometrixx Sites</h3>
-->

<!--
Comment Type: remark
Last Modified By: unknown unknown (ppiegaze@adobe.com)
Last Modified Date: 2017-11-30T05:41:51.129-0500
<p>This section needs to link to docu about using the Package Manager. But this docu has not yet been moved over to 6-0...setting to draft until it has been moved.</p>
-->

<!--
Comment Type: draft

<p>AEM comes with a set of sample Geometrixx websites. You can remove this sample content through the <strong>Package Manager</strong>.</p>
<p>The individual geometrixx-related packages are:</p>
<ul>
<li><span class="code">cq-geometrixx-outdoors-ugc-pkg-<i>&lt;version&gt;</i>.zip</span></li>
<li><span class="code">cq-geometrixx-pkg-<i>&lt;version&gt;</i>.zip</span></li>
<li><span class="code">cq-content-mac-<i>&lt;version&gt;</i>.zip</span></li>
<li><span class="code">cq-geometrixx-login-pkg-<i>&lt;version&gt;</i>.zip</span></li>
<li><span class="code">cq-geometrixx-users-pkg-<i>&lt;version&gt;</i>.zip</span></li>
<li><span class="code">cq-geometrixx-workflow-pkg-<i>&lt;version&gt;</i>.zip</span></li>
<li><span class="code">cq-geometrixx-outdoors-pkg-<i>&lt;version&gt;</i>.zip</span></li>
<li><span class="code">cq-geometrixx-commons-pkg-<i>&lt;version&gt;</i>.zip</span></li>
<li><span class="code">cq-geometrixx-media-pkg-<i>&lt;version&gt;</i>.zip</span></li>
</ul>
<p>To remove an individual package, simple click <strong>Uninstall</strong> on that package.</p>
<p>There is also a super-package:</p>
<ul>
<li><span class="code">cq-geometrixx-all-pkg-5.6.12.zip</span></li>
</ul>
<p>This package includes all the above individual packages. To remove all the geometrixx-related content at once, click <strong>Uninstall</strong> on this package. The super-package will go into the uninstalled state, and all the individual packages will disappear from the package manager view.</p>
<p>You have now an "empty" AEM instance without any demonstration sites.<br /> </p>
-->

<!--
Comment Type: draft

<note type="note">
<p>When upgrading, geometrixx sites are automatically re-installed. You may need to remove geometrixx web sites after upgrading if you do not want these samples.</p>
</note>
-->

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

   ![](assets/chlimage_1-26.png)

    * In the command line, type net start cq5.

   ![](assets/chlimage_1-27.png)

1. Windows indicates that the service is running. AEM starts and the prunsrv executable appears in Task Manager. In your web browser, navigate to AEM, for example, `http://localhost:4502` to start using AEM.

   ![](assets/chlimage_1-28.png)

>[!NOTE]
>
>The property values in the instsrv.bat file are used when creating the Windows service. If you edit the property values in instsrv.bat, you must uninstall and then reinstall the service.

>[!NOTE]
>
>When installing AEM as service, you must provide the absolute path for the logs directory in `com.adobe.xmp.worker.files.ncomm.XMPFilesNComm` from Configuration Manager.

To uninstall the service, either click **Stop** in the **Services** control panel or in the command line, navigate to the folder and type `instsrv.bat -uninstall cq5`. The service gets removed from the list in the **Services** control panel or from the list in the command line when you type `net start`.

## Redefining the location of the temporary work directory {#redefining-the-location-of-the-temporary-work-directory}

The default location of the temporary folder of the java machine is `/tmp`. AEM uses this folder too, for example when building packages.

If you want to change the location of the temporary folder (for example, if you need a directory with more free space) then define a * `<new-tmp-path>`* by adding the JVM parameter:

`-Djava.io.tmpdir="/<*new-tmp-path*>"`

to either:

* the server startup command line  
* the CQ_JVM_OPTS environment parameter in the serverctl or start script

## Further options available from the Quickstart file {#further-options-available-from-the-quickstart-file}

Further options and renaming conventions are described in the Quickstart help file, which is available through the -help option. To access the help, type:

* `java -jar cq5-<*version*>.jar -help`

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

<!--
Comment Type: remark
Last Modified By: unknown unknown (ppiegaze@adobe.com)
Last Modified Date: 2017-11-30T05:41:51.559-0500
<p>This section needs to link to docu about using the Package Manager. But this docu has not yet been moved over to 6-0...setting to draft until it has been moved.</p>
-->

<!--
Comment Type: draft

<h3>Uploading Packages</h3>
-->

<!--
Comment Type: draft

<p>If you need to install further (often customized) packages for your installation see <a></a>Uploading Packages in the CRX documentation for detailed instructions.</p>
-->

## Installing AEM in the Amazon EC2 environment {#installing-aem-in-the-amazon-ec-environment}

When installing AEM on an Amazon Elastic Compute Cloud (EC2) instance, if you install both author and publish on the EC2 instance, the Author instance is installed correctly by following the procedure on [Installing Instances of AEM Manager](#installinginstancesofaemmanager); however, the Publish instance becomes Author.

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

* Consult the [Security Checklist](../../../../6-5/sites/administering/using/security-checklist.md) for tasks required to ensure that your system remains secure.
* Review the list of default users and groups which are installed with AEM WCM. Check whether you want to take action on any other accounts - see [Security and User Administration](../../../../6-5/sites/administering/using/security.md) for further details.

## Accessing CRXDE Lite and the Web Console {#accessing-crxde-lite-and-the-web-console}

Once AEM WCM has been started, you can also access:

* [CRXDE Lite](#accessing-crxde-lite) - used to access and manage the repository
* [Web Console](#accessing-the-web-console) - used to manage or configure the OSGi bundles (also known as the OSGi Console)

#### Accessing CRXDE Lite {#accessing-crxde-lite}

To open CRXDE Lite you can select **CRXDE Lite** from the welcome screen or use your browser to navigate to

```
 http://<<i>host</i>>:<<i>port</i>>/crx/de/index.jsp
```

For example:  
`http://localhost:4502/crx/de/index.jsp` ``

![](assets/installcq_crxdelite.png) 

#### Accessing the Web Console {#accessing-the-web-console}

To access the Adobe CQ Web console you can select **OSGi Console** from the welcome screen or use your browser to navigate to

```
 http://<<i>host</i>>:<<i>port</i>>/system/console
```

For example:  
`http://localhost:4502/system/console`  
or for the Bundles page  
`http://localhost:4502/system/console/bundles`

![](assets/chlimage_1-29.png)

See [OSGi Configuration with the Web Console](/6-5/sites/deploying/using/configuring-osgi.md#osgi-configuration-with-the-web-console) for further details.

## Troubleshooting {#troubleshooting}

For information on dealing with issues that may come up during installation, see:

* [Troubleshooting](/6-5/sites/deploying/using/troubleshooting.md)

## Uninstalling Adobe Experience Manager {#uninstalling-adobe-experience-manager}

Because AEM installs into a single directory, there is no need for an uninstall utility. Uninstalling can be as simple as deleting the entire installation directory, although how you uninstall AEM depends on what you want to achieve and what persistent storage you use.

If persistent storage is embedded in the installation directory, for example, in the default TarPM installation, deleting folders removes data as well.

>[!NOTE]
>
>Adobe highly recommends that you back up your repository before deleting AEM. If you delete the entire &lt;cq-installation-directory&gt;, you will delete the repository. To keep the repository data before deleting, move or copy the &lt;cq-installation-directory&gt;/crx-quickstart/repository folder somewhere else before deleting the other folders.

If your installation of AEM uses external storage, for example, a database server, removing folder does not remove the data automatically, but it does remove the storage configuration, which makes restoring the JCR content difficult.

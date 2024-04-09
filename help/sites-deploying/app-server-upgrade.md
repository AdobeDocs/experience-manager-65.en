---
title: Upgrade Steps for Application Server Installations
description: Learn how to upgrade instances of AEM that are deployed via Application Servers.
feature: Upgrading
exl-id: 86dd10ae-7f16-40c8-84b6-91ff2973a523
solution: Experience Manager, Experience Manager Sites
role: Admin
---
# Upgrade Steps for Application Server Installations{#upgrade-steps-for-application-server-installations}

This section describes the procedure that needs to be followed to update AEM for Application Server installations.

All the examples in this procedure use Tomcat as the Application Server and imply that you have a working version of AEM already deployed. The procedure is meant to document upgrades performed from **AEM version 6.4 to 6.5**.

1. First, start TomCat. In most situations, you can do this by running the `./catalina.sh` start startup script, by running this command from the terminal:

   ```shell
   $CATALINA_HOME/bin/catalina.sh start
   ```

1. If AEM 6.4 is already deployed, check that the bundles are functioning correctly by accessing:

   ```shell
   https://<serveraddress:port>/cq/system/console/bundles
   ```

1. Next, undeploy AEM 6.4. This can be done from the TomCat App Manager (`http://serveraddress:serverport/manager/html`)

1. Now, migrate the repository using the crx2oak migration tool. To do that, download the latest version of crx2oak from [this location](https://repo1.maven.org/maven2/com/adobe/granite/crx2oak/).

   ```shell
   SLING_HOME= $AEM-HOME/crx-quickstart java -Xmx4096m -jar crx2oak.jar --load-profile segment-fds
   ```

1. Delete the necessary properties in the sling.properties file by doing the following:

    1. Open the file located at `crx-quickstart/launchpad/sling.properties`
    1. Step text Remove the following properties and save the file:

        1. `sling.installer.dir`  
        
        1. `felix.cm.dir`  
        
        1. `granite.product.version`  
        
        1. `org.osgi.framework.system.packages`  
        
        1. `osgi-core-packages`  
        
        1. `osgi-compendium-services`  
        
        1. `jre-*`  
        
        1. `sling.run.mode.install.options`

1. Remove the files and folders that are no longer necessary. The items you need to specifically remove are:

    * The **launchpad/startup folder**. You can delete it by running the following command in the terminal: `rm -rf crx-quickstart/launchpad/startup`  
    
    * The **base.jar file**: `find crx-quickstart/launchpad -type f -name "org.apache.sling.launchpad.base.jar*" -exec rm -f {} \`  
    
    * The **BootstrapCommandFile_timestamp.txt file**: `rm -f crx-quickstart/launchpad/felix/bundle0/BootstrapCommandFile_timestamp.txt`

    * Remove **sling.options.file** by running: `find crx-quickstart/launchpad -type f -name "sling.options.file" -exec rm -rf` 

1. Now, create the node store and data store that is used with AEM 6.5. You can do this by creating two files with the following names under `crx-quickstart\install`:

    * `org.apache.jackrabbit.oak.segment.SegmentNodeStoreService.cfg`
    * `org.apache.jackrabbit.oak.plugins.blob.datastore.FileDataStore.cfg`

    These two files will configure AEM to use a TarMK node store and a File data store.

1. Edit the configuration files to make them ready for use. More specifically:

   * Add the following line to `org.apache.jackrabbit.oak.segment.SegmentNodeStoreService.config`:

     `customBlobStore=true`
   
   * Then add the following lines to `org.apache.jackrabbit.oak.plugins.blob.datastore.FileDataStore.config`:

     ```
     path=./crx-quickstart/repository/datastore
     minRecordLength=4096
     ```

1. You now need to change the run modes in the AEM 6.5 war file. To do that, first create a temporary folder that will be housing the AEM 6.5 war. The name of the folder in this example will be `temp`. Once the war file has been copied over, extract its contents by running from inside the temp folder: 

   ```
   jar xvf aem-quickstart-6.5.0.war
   ```

1. Once the contents have been extracted, go to the **WEB-INF** folder and edit the web.xml file to change the run modes. To find the location where they are set in the XML, look for the `sling.run.modes` string. Once you find it, change the run modes in the next line of code, which by default is set to author:

   ```bash
   <param-value >author</param-value>
   ```

1. Change the above author value and set the run modes to: `author,crx3,crx3tar`. The final block of code should look like this:

   ```
   <init-param>
   <param-name>sling.run.modes</param-name>
   <param-value>author,crx3,crx3tar</param-value>
   </init-param>
   <load-on-startup>100</load-on-startup>
   </servlet>
   ```

1. Recreate the jar with the modified contents:

   ```bash
   jar cvf aem65.war
   ```

1. Finally, deploy the new war file in TomCat.

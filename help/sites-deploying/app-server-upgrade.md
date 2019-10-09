---
title: Upgrade Steps for Application Server Installations
seo-title: Upgrade Steps for Application Server Installations
description: Learn how to upgrade instances of AEM that are deployed via Application Servers.
seo-description: Learn how to upgrade instances of AEM that are deployed via Application Servers.
uuid: df3fa715-af4b-4c81-b2c5-130fbc82f395
contentOwner: sarchiz
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: upgrading
content-type: reference
discoiquuid: c427c8b6-eb94-45fa-908f-c3d5a337427d
---

# Upgrade Steps for Application Server Installations{#upgrade-steps-for-application-server-installations}

This section describes the procedure that needs to be followed in order to update AEM for Application Server installations.

All the examples in this procedure use JBoss as the Application Server and imply that you have a working version of AEM already deployed. The procedure is meant to document upgrades performed from **AEM version 5.6 to 6.3**.

1. First, start JBoss. In most situations, you can do this by running the `standalone.sh` startup script, by running this command from the terminal:

   ```shell
   jboss-install-folder/bin/standalone.sh
   ```

1. If AEM 5.6 is already deployed, check that the bundles are functioning correctly by running:

   ```shell
   wget https://<serveraddress:port>/cq/system/console/bundles
   ```

1. Next, undeploy AEM 5.6:

   ```shell
   rm jboss-install-folder/standalone/deployments/cq.war
   ```

1. Stop JBoss.  

1. Now, migrate the repository using the crx2oak migration tool:

   ```shell
   java -jar crx2oak.jar crx-quickstart/repository/ crx-quickstart/oak-repository
   ```

   >[!NOTE]
   >
   >In this example, oak-repository is the temporary directory where the newly converted repository will reside. Before performing this step, make sure you have the latest crx2oak.jar version.

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

1. Copy the newly migrated segmentstore to its proper location:

   ```shell
   mv crx-quickstart/oak-repository/segmentstore crx-quickstart/repository/segmentstore
   ```

1. Copy the datastore as well:

   ```shell
   mv crx-quickstart/repository/repository/datastore crx-quickstart/repository/datastore
   ```

1. Next, you need to create the folder that will contain the OSGi configurations that will be used with the new upgraded instance. More specifically, a folder named install needs to be created under **crx-quickstart**.  

1. Now, create the node store and data store that will be used with AEM 6.3. You can do this by creating two files with the following names under **crx-quickstart\install**:

    * `org.apache.jackrabbit.oak.segment.SegmentNodeStoreService.cfg`  
    
    * `org.apache.jackrabbit.oak.plugins.blob.datastore.FileDataStore.cfg`

   These two files will configure AEM to use a TarMK node store and a File data store.

1. Edit the configuration files to make them ready for use. More specifically:

    * Add the following line to **org.apache.jackrabbit.oak.segment.SegmentNodeStoreService.config**: 
    
      `customBlobStore=true`  
    
    * Then add the following lines to **org.apache.jackrabbit.oak.plugins.blob.datastore.FileDataStore.config**:

      ```    
      path=./crx-quickstart/repository/datastore
       minRecordLength=4096
      ```

1. Remove the crx2 runmode by running:

   ```shell
   find crx-quickstart/launchpad -type f -name "sling.options.file" -exec rm -rf {} \
   ```

1. You now need to change the run modes in the AEM 6.3 war file. In order to do that, first create a temporary folder that will be housing the AEM 6.3 war. The name of the folder in this example will be **temp**. Once the war file has been copied over, extract its contents by running from inside the temp folder:

   ```shell
   jar xvf aem-quickstart-6.3.0.war
   ```

1. Once the contents have been extracted, go to the **WEB-INF** folder and edit the `web.xml` file to change the run modes. To find the location where they are set in the XML, look for the `sling.run.modes` string. Once you find it, change the run modes in the next line of code, which by default is set to author:

   ```shell
   <param-value >author</param-value>
   ```

1. Change the above author value and set the run modes to: author,crx3,crx3tar The final block of code should look like this:

   ```
   <init-param>
   <param-name>sling.run.modes</param-name>
   <param-value>author,crx3,crx3tar</param-value>
   </init-param>
   <load-on-startup>100</load-on-startup>
   </servlet>
   ```

1. Recreate the jar with the modified contents:

   ```shell
   jar cvf aem62.war
   ```

1. Finally, deploy the new war file:

   ```shell
   cp temp/aem62.war jboss-install-folder/standalone/deployments/aem61.war
   ```


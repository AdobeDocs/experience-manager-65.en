---
title: Command Line Start and Stop
seo-title: Command Line Start and Stop
description: Learn how to start and stop AEM from the command line.
seo-description: Learn how to start and stop AEM from the command line.
uuid: 585f071c-2286-4a2c-af07-404bf298cba8
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
content-type: reference
topic-tags: deploying
discoiquuid: 9333ff84-f624-4cfa-a9e4-c5e3882171ff
---

# Command Line Start and Stop{#command-line-start-and-stop}

## Starting Adobe Experience Manager from the Command Line {#starting-adobe-experience-manager-from-the-command-line}

The `start` script is available under *the &lt;cq-installation&gt;/bin* directory. Both Unix and Windows versions are provided. The script starts the instance installed in *&lt;cq-installation&gt;* directory.

Those two versions support a list of environement variables that could be used to start and tune the AEM instance.

<table> 
 <tbody> 
  <tr> 
   <td><strong>Environment variable </strong></td> 
   <td><strong>Description </strong></td> 
  </tr> 
  <tr> 
   <td>CQ_PORT</td> 
   <td>TCP port used for stop and status scripts<br /> </td> 
  </tr> 
  <tr> 
   <td>CQ_HOST</td> 
   <td>Host name<br /> </td> 
  </tr> 
  <tr> 
   <td>CQ_INTERFACE</td> 
   <td>Interface that this server should listen to<br /> </td> 
  </tr> 
  <tr> 
   <td>CQ_RUNMODE</td> 
   <td>Runmode(s) separated by comma<br /> </td> 
  </tr> 
  <tr> 
   <td>CQ_JARFILE</td> 
   <td>Name of the jarfile<br /> </td> 
  </tr> 
  <tr> 
   <td>CQ_USE_JAAS</td> 
   <td>Use of JAAS (if true)<br /> </td> 
  </tr> 
  <tr> 
   <td>CQ_JAAS_CONFIG</td> 
   <td>Path of the JAAS configuration<br /> </td> 
  </tr> 
  <tr> 
   <td>CQ_JVM_OPTS</td> 
   <td>Default JVM options<br /> </td> 
  </tr> 
 </tbody> 
</table>

>[!CAUTION]
>
>Note that some run modes, among them author and publish, need to be set before first starting AEM and can not be changed afterwards. Before setting up an AEM instance that is supposed to be used in production, please see the [run modes documentation](/help/sites-deploying/configure-runmodes.md) for details.

### Windows platform start.bat script example {#windows-platform-start-bat-script-example}

```shell
SET CQ_PORT=1234 & ./start.bat
```

### Unix platform start script example {#unix-platform-start-script-example}

```shell
CQ_PORT=1234 ./start
```

>[!NOTE]
>
>The start script launches the AEM Quickstart installed under *the &lt;cq-installation&gt;/app* folder.

## Stopping Adobe Experience Manager {#stopping-adobe-experience-manager}

To stop AEM, do one of the following:

* Depending on the platform you are using:

    * If you started AEM from either a script or the command line, press **Ctrl+C** to shut down the server.
    * If you have used the start script on UNIX, you must use the stop script to stop AEM.

* If you started AEM by double-clicking the jar file, click the **On** button on the startup window (the button then changes to **Off**) to shut down the server.

  ![chlimage_1-63](assets/chlimage_1-63.png)

## Stopping Adobe Experience Manager from the Command Line {#stopping-adobe-experience-manager-from-the-command-line}

The `stop` script is available under *the &lt;cq-installation&gt;/bin* directory. Both Unix and Windows versions are provided. The script stops the running instance installed in *&lt;cq-installation&gt;* directory.

### Unix platform stop script example {#unix-platform-stop-script-example}

```shell
./stop
```

### Windows platform stop.bat script example {#windows-platform-stop-bat-script-example}

```shell
./stop.bat
```

If you just want to preconfigure the repository (without relocating it) you only have to:

* extract `repository.xml` to the required location   

* update `repository.xml` as required  

* create `bootstrap.properties` and define `repository.config`

Again, before starting the actual installation.  


---
title: Starting and stopping WebLogic Server
seo-title: Starting and stopping WebLogic Server
description: Several procedures require you to start or stop the instance of WebLogic Server where you want to deploy AEM forms modules. This document describes how to start and stop the WebLogic Server.
seo-description: Several procedures require you to start or stop the instance of WebLogic Server where you want to deploy AEM forms modules. This document describes how to start and stop the WebLogic Server.
uuid: 957787fe-4cea-4ecd-b49a-c33023c5c309
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/maintaining_the_application_server
products: SG_EXPERIENCEMANAGER/6.5/FORMS
discoiquuid: c908d064-6596-473a-b218-22a2496c83f7
---

# Starting and stopping WebLogic Server {#starting-and-stopping-weblogic-server}

Several procedures require you to start or stop the instance of WebLogic Server where you want to deploy AEM forms modules. Ensure that WebLogic Server is stopped or running, depending on the task you are performing.

<table>
 <thead>
  <tr>
   <th><p>Activity</p></th>
   <th><p>Required WebLogic state</p></th>
  </tr>
 </thead>
 <tbody>
  <tr>
   <td><p>Creating a WebLogic domain</p></td>
   <td><p>Stopped</p></td>
  </tr>
  <tr>
   <td><p>Creating a WebLogic managed server</p></td>
   <td><p>Running</p></td>
  </tr>
  <tr>
   <td><p>Increasing the server thread count</p></td>
   <td><p>Running</p></td>
  </tr>
  <tr>
   <td><p>Deploying AEM forms products</p></td>
   <td><p>Running</p></td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>If you are running WebLogic Server on Red Hat® Enterprise Linux Advanced Server 4.0, set the `LD_ASSUME_KERNEL` environment variable to 2.4.19 by using the `export LD_ASSUME_KERNEL=2.4.19` command. Then, run WebLogic Server from the same shell in which you set this environment variable.

## Start WebLogic Server {#start-weblogic-server}

1. From a command prompt, go to *[appserver root]*/user_projects/domains/*[appserverdomain]*.
1. Enter the following command:

    * (Windows) `startWebLogic.cmd`
    * (Linux, UNIX) ./ `startWebLogic.sh`

## Stop WebLogic Server {#stop-weblogic-server}

1. Start WebLogic Server administration console by typing `https://[host name]:7001/console` in the URL line of a web browser.
1. Log in by typing the user name and password that was used when creating this WebLogic configuration, and then click Log In.
1. Under Change Center, click Lock & Edit.
1. Under Domain Structure, click Environment &gt; Servers.
1. Click AdminServer and, on the Settings for AdminServer pane, click the Control tab.
1. Ensure that AdminServer is selected in the Server Status table and click Shutdown.
1. Select When Work Completes to gracefully shut down the server or select Force Shutdown Now to stop the server immediately without completing ongoing tasks.
1. On the Server Life Cycle Assistant pane, click Yes to complete the shutdown.

The WebLogic Server administration console is no longer available, and the command prompt that you ran the start command from is available.

## Start WebLogic administration console {#start-weblogic-administration-console}

1. If WebLogic Admin Server is not already running, from a command prompt, go to the *[appserver root]\user_projects\domains\[domainname]* directory, and enter the following command:

    * (Windows) `startWebLogic.cmd`
    * (Linux, UNIX) ./ `startWebLogic.sh`

1. Access WebLogic Server administration console by typing `https://[host name]:[port]/console` in the URL line of a web browser, where *[port]* is the non-secure listening port. By default, this port value is 7001.
1. On the login screen, type your administrator user name and password, and click Log In.

## Start Node Manager {#start-node-manager}

1. Ensure that WebLogic Server is running.
1. From a new command prompt, go to *[appserver root]*/server/bin.
1. Enter the following command:

    * (Windows) `startNodeManager.cmd`
    * (Linux, UNIX) `./startNodeManager.sh`

## Stop Node Manager {#stop-node-manager}

After you shut down WebLogic Server, you can close the command prompt from which you called Node Manager.

## Start a WebLogic managed server {#start-a-weblogic-managed-server}

>[!NOTE]
>
>This task can be performed only after you create a WebLogic domain and a managed server.

1. Ensure that the WebLogic Server and Node Manager are running.
1. Start WebLogic Server administration console by typing `https://host name]:[port]/console` in the URL line of a web browser.
1. Under Domain Structure, click Environment &gt; Servers.
1. In the right pane, click the Control tab.
1. Select the managed server that you want to start.
1. Click the Start button below the managed server you want to start.

## Stop a WebLogic managed server {#stop-a-weblogic-managed-server}

1. Start WebLogic Server administration console by typing `https://`*[host name]:[port]* `/console` in the URL line of a web browser.
1. Under Domain Structure, click Environment &gt; Servers.
1. In the right pane, click the Control tab.
1. Select the managed server that you want to stop.
1. Click the Shutdown button below the managed server you want to stop.
1. Select When Work Completes to gracefully shut down the server or select Force Shutdown Now to stop the server immediately without completing ongoing tasks.
1. On the Server Life Cycle Assistant pane, click Yes to complete the shutdown.


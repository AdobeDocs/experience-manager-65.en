---
title: Starting and stopping WebSphere Application Server
seo-title: Starting and stopping WebSphere Application Server
description: Several procedures require you to stop or start the instance of WebSphere where you want to deploy AEM forms products. This document describes how to start and stop the WebSphere Application Server.
seo-description: Several procedures require you to stop or start the instance of WebSphere where you want to deploy AEM forms products. This document describes how to start and stop the WebSphere Application Server.
uuid: e0373197-aa57-4087-933d-92a86840a11a
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/maintaining_the_application_server
products: SG_EXPERIENCEMANAGER/6.4/FORMS
discoiquuid: bcd16691-67ab-4694-9e6b-c9d3e0c7bf0b
---

# Starting and stopping WebSphere Application Server {#starting-and-stopping-websphere-application-server}

Several procedures require you to stop or start the instance of WebSphere where you want to deploy AEM forms products. If you are unsure whether the application server has started, you can first view the status of WebSphere Application Server.

## View the status of WebSphere Application Server {#view-the-status-of-websphere-application-server}

1. From a command prompt, go to the *[appserver root]*/bin directory.
1. Enter the following command, replacing *server_name* with the name of your WebSphere Application Server:

    * (Windows) `serverStatus.bat`*server_name*
    * (Linux, UNIX) ./ `serverStatus.sh`*server_name*

## Start WebSphere Application Server {#start-websphere-application-server}

1. From a command prompt, go to the *[appserver root]*/bin directory.
1. Enter the following command, replacing *server_name* with the name of your WebSphere Application Server:

    * (Windows) `startServer.bat`*server_name*
    * (Linux, UNIX) ./ `startServer.sh`*server_name*

## Stop WebSphere Application Server {#stop-websphere-application-server}

1. From a command prompt, go to the *[appserver root]*/bin directory.
1. Enter the following command, replacing *server_name* with the name of your WebSphere Application Server:

    * (Windows) `stopServer.bat`*server_name*
    * (Linux, UNIX) ./ `stopServer.sh`*server_name*


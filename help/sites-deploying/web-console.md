---
title: Web console in Adobe Experience Manager
seo-title: Web Console
description: Learn how to use the AEM web console.
seo-description: Learn how to use the AEM web console.
uuid: 7856b2b3-4216-421d-a315-cd9a55936362
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: configuring
discoiquuid: 4a33fddd-0399-40e4-8687-564fb6765b76
feature: Configuring
exl-id: 9acbf61f-73a8-4998-9421-dd933f30ac8a
---
# Web Console{#web-console}

The Web console in AEM is based on the [Apache Felix Web Management Console](https://felix.apache.org/documentation/subprojects/apache-felix-web-console.html). Apache Felix is a community effort to implement the OSGi R4 Service Platform, which includes the OSGi framework and standard services.

>[!NOTE]
>
>On the Web console any descriptions that mention default settings relate to Sling defaults.
>
>AEM has its own defaults and so the defaults set might differ from those documented on the console.

The Web console offers a selection of tabs for maintaining the OSGi bundles, including:

* [Configuration](#configuration): used for configuring the OSGi bundles, and is therefore the underlying mechanism for configuring AEM system parameters
* [Bundles](#bundles): used for installing bundles
* [Components](#components): used for controlling the status of components required for AEM

Any changes made are immediately applied to the running system. No restart is required.

The console can be accessed from `../system/console`; for example:

`http://localhost:4502/system/console/components`

## Configuration {#configuration}

The **Configuration** tab is used for configuring the OSGi bundles, and is therefore the underlying mechanism for configuring AEM system parameters.

>[!NOTE]
>
>See [OSGi Configuration with the Web Console](/help/sites-deploying/configuring-osgi.md) for further details.

The **Configuration** tab can be accessed by either:

* The drop-down menu:

  **OSGi &gt;**

* The URL; for example:

  `http://localhost:4502/system/console/configMgr`

A list of configurations will be shown:

![screen_shot_2012-02-15at52308pm](assets/screen_shot_2012-02-15at52308pm.png)

There are two types of configurations available from the drop down lists on this screen:

* **Configurations**
  Allows you to update the existing configurations. These have a Persistent Identity (PID) and can be either:

    * standard and integral to AEM; these are required, if deleted the values return to the default settings.
    * instances created from Factory Configurations; these instances are created by the user, deletion removes the instance.

* **Factory Configurations**
  Allows you to create an instance of the required functionality object.

  This will be allocated a Persistent Identity and then listed in the Configurations drop down list.

Selecting any entry from the lists will display the parameters related to that configuration:

![chlimage_1-21](assets/chlimage_1-21a.png)

You can then update the parameters as required and:

* **Save**

  Save the changes made.

  For a Factory Configuration this will create a new instance with a Persistent Identity. The new instance will then be listed under Configurations.

* **Reset**

  Reset the parameters shown on screen to those saved last.

* **Delete**

  Delete the current configuration. If standard, the parameters are returned to the default settings. If created from a Factory Configuration, then the specific instance is deleted.

* **Unbind**

  Unbind the current configuration from the bundle.

* **Cancel**

  Cancel any current changes.

## Bundles {#bundles}

The **Bundles** tab is the mechanism for installing the OSGi bundles required for AEM. The tab can be accessed by either of the following methods:

* The drop-down menu:

  **OSGi &gt;**

* The URL; for example:

  `http://localhost:4502/system/console/bundles`

A list of bundles will be shown:

![screen_shot_2012-02-15at44740pm](assets/screen_shot_2012-02-15at44740pm.png)

Using this tab you can:

* **Install or Update**

  You can **Browse** to find the file containing your bundle and specify whether it should **Start** immediately and at which **Start Level**.

* **Reload**

  Refreshes the list displayed.

* **Refresh Packages**

  This will check the references of all packages and refresh as necessary.

  For example, after an update both the old and new version may still be running due to prior references. This option will check and move all references to the new version, allowing the old version to stop.

* **Start**

  Starts a bundle according to the start level specified.

* **Stop**

  Stops the bundle.

* **Uninstall**

  Uninstalls the bundle from the system.

* **see the status**

  The list specifies the current status of the bundle; clicking on the name of a specific bundle with show further information.

>[!NOTE]
>
>After **Update** it is recommended to perform a **Refresh Packages**.

## Components {#components}

The **Components** tab allows you to Enable and/or Disable the various components. It can be accessed by either:

* The drop-down menu:

  **Main &gt;**

* The URL; for example:

  `http://localhost:4502/system/console/components`

A list of components will be shown. Various icons are available to enable you to enable, disable or (where appropriate) open configuration details for a specific component.

![screen_shot_2012-02-15at52144pm](assets/screen_shot_2012-02-15at52144pm.png)

Clicking on the name of a particular component will display further information on its status. Here you can also enable, disable or reload the component.

![chlimage_1-22](assets/chlimage_1-22a.png)

>[!NOTE]
>
>Enabling, or disabling, a component will only apply until AEM/CRX is restarted.
>
>The start state is defined within the component descriptor, which is generated during development and stored in the bundle at bundle creation time.

---
title: Run Modes
seo-title: Run Modes
description: Learn how to tune your AEM instance for specific purposes by using run modes.
seo-description: Learn how to tune your AEM instance for specific purposes by using run modes.
uuid: 8a0c6e5c-4fae-43e2-b745-eee58f346ceb
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: configuring
content-type: reference
discoiquuid: 12329e26-40bc-4c94-bc60-6d9cbd01345f
feature: Configuring
exl-id: 6d03cb1d-500e-4a23-80e5-347a43dff30e
---
# Run Modes{#run-modes}

Run modes allow you to tune your AEM instance for a specific purpose; for example author or publish, test, development, intranet or others.

You can:

* [Define collections of configuration parameters for each run mode](#defining-configuration-properties-for-a-run-mode).

  A basic set of configuration parameters is applied for all run modes, you can then tune additional sets to the purpose of your specific environment. These are applied as required.

* [Define additional bundles to be installed for a particular mode](#defining-additional-bundles-to-be-installed-for-a-run-mode).

All settings and definitions are stored in the one repository and activated by setting the **Run Mode**.

## Installation Run Modes {#installation-run-modes}

Installation (or fixed) run modes are used at installation time and then fixed for the entire lifetime of the instance, they cannot be changed.

Installation run modes are provided out-of-the-box:

* `author`
* `publish`
* `samplecontent`
* `nosamplecontent`

These are two pairs of mutually exclusive run modes; for example, you can:

* define either `author` or `publish`, not both at the same time

* combine `author` with either `samplecontent` or `nosamplecontent` (but not both)

>[!CAUTION]
>
>When using one of the above run modes (author, publish, samplecontent, nosamplecontent), the value used at installation time defines the run mode for the *entire lifetime* of that installation.
>
>For these run modes you *cannot* change them after installation.

## Customized Run Modes {#customized-run-modes}

You can also create your own, customized, run modes. These can be combined to cover scenarios such as:

* `author` + `development`

* `publish` + `test`

*  `publish` + `test` + `golive`

* `publish` + `intranet`

* as required . . .

Customized run modes can also be selected at each startup.

## Using samplecontent and nosamplecontent {#using-samplecontent-and-nosamplecontent}

These modes allow you to control the use of sample content. The sample content is defined before the quickstart is built and can include packages, configurations, etc:

* The `samplecontent` run mode will install this content (the default mode).

* The `nosamplecontent` mode will not install the sample content.

The nosamplecontent run mode is designed for production installations.

## Defining configuration properties for a run mode {#defining-configuration-properties-for-a-run-mode}

A collection of values for configuration properties, used for a particular run mode, can be saved in the repository.

The run mode is indicated by a suffix on the folder name. This allows you to store all configurations in one repository as. For example:

* `config`

  Applicable for all run modes

* `config.author`

  Used for author run mode

* `config.publish`

  Used for publish run mode

* `config.<run-mode>`

  Used for the applicable run mode; for example, config

See [OSGi Configuration in the Repository](/help/sites-deploying/configuring-osgi.md#osgi-configuration-in-the-repository) for further details on defining the individual configuration nodes within these folders and for creating configurations for combinations of multiple run modes.

>[!NOTE]
>
>For [Installation Run Modes](#installation-run-modes) (e.g. author) the run mode cannot be changed after installation. However, changes to the individual configuration properties will take effect upon restart.

## Defining additional bundles to be installed for a run mode {#defining-additional-bundles-to-be-installed-for-a-run-mode}

Additional bundles that should be installed for a particular run mode can also be specified. For these definitions, install folders are used to hold the bundles. Again the run mode is indicated by a prefix:

* `install.author`
* `install.publish`

These folders are of type `nt:folder` and should contain the appropriate bundle.

## Starting CQ with a specific run mode {#starting-cq-with-a-specific-run-mode}

If you have defined configurations for multiple run modes then you need to define which is to be used upon startup. There are several methods for specifying which run mode to use; the order of resolution is:

1. [system properties (`-D`)](#using-a-system-property-in-the-start-script)
1. [ `sling.properties` file](#using-the-sling-properties-file)
1. [ `-r` option](#using-the-r-option)
1. [Filename detection](#filename-detection-renaming-the-jar-file)

When you are using an application server you can also [define the run mode in web.xml](#defining-the-run-mode-in-web-xml-with-application-server).

### Using the sling.properties file {#using-the-sling-properties-file}

The `sling.properties` file can be used to define the required run mode:

1. Edit the configuration file:

   `<cq-installation-dir>/crx-quickstart/conf/sling.properties`

1. Add the following properties; the following example is for author:

   `sling.run.modes=author`

### Using the -r option {#using-the-r-option}

A custom run mode can be activated by using the `-r` option when launching the quickstart. For example, use the following command to launch a AEM instance with run mode set to dev. ``

```shell
java -jar cq-56-p4545.jar -r dev
```

### Using a system property in the start script {#using-a-system-property-in-the-start-script}

A system property in the start script can be used to specify the run mode.

* For example use the following to launch an instance as a production publish instance located in the US:

  `-Dsling.run.modes=publish,prod,us`

### Filename detection - renaming the jar file {#filename-detection-renaming-the-jar-file}

The following two installation run modes can be activated by renaming the installation jar file before installation:

* publish
* author

The jar file must use the naming convention:

`cq5-<run-mode>-p<port-number>`

For example, set the `publish` run mode by naming the jar file:

`cq5-publish-p4503`

### Defining the run mode in web.xml (with Application Server) {#defining-the-run-mode-in-web-xml-with-application-server}

When you are using an application server you can also configure the property:

`sling.run.modes`

in the file:

`WEB-INF/web.xml`

This is in the AEM `war` file and should be updated before deployment.

See [Installing AEM with an Application Server](/help/sites-deploying/application-server-install.md) for further details.

---
title: AEM Developer Tools for Eclipse
description: AEM Developer Tools for Eclipse
uuid: 566e49f2-6f28-4aa7-bfe0-b5f9675310bf
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: development-tools
content-type: reference
discoiquuid: a2ae76a8-50b0-4e43-b791-ad3be25b8582
exl-id: 00473769-c447-4966-a71e-117c669e0151
---
# AEM Developer Tools for Eclipse{#aem-developer-tools-for-eclipse}

 ![Circular image motif for AEM Developer Tools for Eclipse.](do-not-localize/chlimage_1-9.png)

## Overview {#overview}

"AEM Developer Tools" is an Eclipse plug-in based on the [Eclipse plugin for Apache Sling](https://sling.apache.org/documentation/development/ide-tooling.html) released under the Apache License 2.

It offers several features that make AEM development easier:

* Seamless integration with AEM instances through Eclipse Server Connector.
* Synchronization for both content and OSGI bundles.
* Debugging support with code hot-swapping capability.
* Simple Bootstrap of AEM Projects by way of a specific Project Creation Wizard.
* Easy editing of JCR properties.

## Requirements {#requirements}

Before using the AEM Developer Tools, do the following:

* Download and install [Eclipse IDE for Java&trade; EE Developers](https://www.eclipse.org/downloads/packages/release/luna/r/eclipse-ide-java-ee-developers). AEM Developer Tools currently support Eclipse Kepler or newer

* Can be used with AEM version 5.6.1 or newer
* Configure your eclipse installation to ensure that you have at least 1 GB of heap memory by editing your `eclipse.ini` configuration file as described in the [Eclipse FAQ](https://wiki.eclipse.org/FAQ_How_do_I_increase_the_heap_size_available_to_Eclipse%3F).

>[!NOTE]
>
>On macOS, right-click **Eclipse.app**, and then select **Show Package Contents** to find your `eclipse.ini`.

## How to install the AEM Developer Tools for Eclipse {#how-to-install-the-aem-developer-tools-for-eclipse}

Once you have fulfilled the [requirements](#requirements) above, you can install the plugin as follows:

1. Browse the **AEM Developer Tools** website at `https://eclipse.adobe.com/aem/dev-tools/`.

1. Copy the **Installation Link**.

   Alternatively, you can download an archive instead of using the installation link. Doing so allows offline installation but you miss automatic update notifications.

1. In Eclipse, open the **Help** menu.
1. Click **Install New Software**.
1. Click **Add...**.
1. In **Name** type AEM Developer Tools.
1. In **Location** copy the installation URL.
1. Click **Ok**.
1. Check both **AEM** and **Sling** plugins.
1. Click **Next**.
1. Click **Next**.
1. Accept the lincese agreements and click **Finish**.
1. Click **Yes** to restart Eclipse.

## How To Import Existing Projects {#how-to-import-existing-projects}

>[!NOTE]
>
>See [How to work with a bundle in Eclipse when it was downloaded from AEM](https://stackoverflow.com/questions/29699726/how-to-work-with-a-bundle-in-eclipse-when-it-was-downloaded-from-aem/29705407#29705407).

## The AEM Perspective {#the-aem-perspective}

The AEM Development Tools for Eclipse ships with a Perspective that offers you full control over your AEM Projects and instances.

![chlimage_1-2](assets/chlimage_1-2a.jpeg)

## Sample Multi-Module Project {#sample-multi-module-project}

"AEM Developer Tools" include a sample, multi-module project that helps you quickly get up to speed with a project setup in Eclipse. It also serves as a best-practice guide to several AEM features. [Learn more about the Project Archetype](https://github.com/adobe/aem-project-archetype).

To create the sample project, complete the following steps:

1. In the **File** &gt; **New** &gt; **Project** menu, browse to the **AEM** section and select **AEM Sample Multi-Module Project**.

   ![chlimage_1-69](assets/chlimage_1-69a.png)

1. Click **Next**.

   >[!NOTE]
   >
   >This step might take a while because m2eclipse must scan the archetype catalogs.

   ![chlimage_1-70](assets/chlimage_1-70a.png)

1. Choose **com.adobe.granite.archetypes : sample-project-archetype : (highest number)** from the menu, then click **Next**.

   ![chlimage_1-71](assets/chlimage_1-71a.png)

1. Fill in a **Name**, **Group id**, and an **Artifact id** for the sample project. You can also opt to set some advanced properties.

   ![chlimage_1-72](assets/chlimage_1-72a.png)

1. Now configure an AEM server to which Eclipse can connect.

   To use the debugger feature, be sure you started AEM in debug mode, which can be achieved by adding the following to the command line:

   ```
       -nofork -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=10123
   ```

   ![chlimage_1-73](assets/chlimage_1-73a.png)

1. Click **Finish**. The project structure is created.

   >[!NOTE]
   >
   >On a fresh installation (more specifically: when maven dependencies have never been downloaded) you might get the project created with errors. In this case, follow the procedure describe in [Resolving Invalid Project Definition](#resolving-invalid-project-definition).

## Troubleshooting {#troubleshooting}

### Resolving Invalid Project Definition {#resolving-invalid-project-definition}

To resolve invalid dependencies and project definition proceed as follows:

1. Select all created projects.
1. Right-click. In menu **Maven**, select **Update Projects**.
1. Check **Force Updates of Snapshot/Releases**.
1. Click **OK**. Eclipse tries to download the required dependencies.

### Enabling tag library autocompletion in JSP files {#enabling-tag-library-autocompletion-in-jsp-files}

Tag library autocompletion works out of the box, given that the proper dependencies are added to the project. There is one known issue when using the AEM Uber Jar, which does not include the needed tld and TagExtraInfo files.

To work around it, ensure that the org.apache.sling.scripting.jsp.taglib artifact is in the classpath before the AEM Uber Jar. For Maven projects, place the following dependency in the pom.xml before the Uber Jar.

```xml
<dependency>
  <groupId>org.apache.sling</groupId>
  <artifactId>org.apache.sling.scripting.jsp.taglib</artifactId>
  <scope>provided</scope>
</dependency>

```

Make sure to add the proper version for your deployment of AEM.

## More information {#more-information}

The official Apache Sling IDE tooling for Eclipse website provides you with useful information:

* The [**Apache Sling IDE tooling for Eclipse** User Guide](https://sling.apache.org/documentation/development/ide-tooling.html), this documentation guides you through the overall concepts, server integration, and deployment capabilities supported by the AEM Development Tools.
* The [Troubleshooting section](https://sling.apache.org/documentation/development/ide-tooling.html#troubleshooting).
* The [Known issues list](https://sling.apache.org/documentation/development/ide-tooling.html#known-issues).

The following official [Eclipse](https://www.eclipse.org/) documentation can help to set up your environment:

* [Getting Started with Eclipse](https://eclipseide.org/getting-started/)
* [Eclipse Luna Help System](https://help.eclipse.org/latest/index.jsp)
* [Maven Integration (m2eclipse)](https://www.eclipse.org/m2e/)

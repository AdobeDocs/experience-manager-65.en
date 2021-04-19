---
title: Develop AEM Commerce
description: Learn how to generate a commerce-enabled AEM project using the AEM project archetype. Learn how to build and deploy the project to a local development environment.
topics: Commerce, Development
feature: Commerce Integration Framework
version: cloud-service
doc-type: tutorial
kt: 5826
thumbnail: 39476.jpg
---

# Develop AEM Commerce {#develop}

Developing AEM Commerce projects based on Commerce Integration Framework (CIF) for AEM follows the same rules and best practices like other AEM projects. Please review these first:

- [AEM 6.5 Developing User Guide](/help/sites-developing/home.md)
- [AEM Core Concepts](/help/sites-developing/the-basics.md)
- [AEM Development - Guidelines and Best Practices](/help/sites-developing/dev-guidelines-bestpractices.md)
- [How to Build AEM Projects using Apache Maven](/help/sites-developing/ht-projects-maven.md)

## Local Development for AEM Commerce {#local}

A local development environment is recommended to work with CIF projects.

>[!NOTE]
>
>The following instructions help you setting up a local AEM development environment for AEM Commerce using CIF with focus for Adobe Managed Services (AMS). If you are using AEM as a Cloud Service, please see the [AEM Commerce as a Cloud Service](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/commerce/home.html) documentation.

The CIF Authoring Add-On is available for local development as well and provided as an AEM package. It can be downloaded from the [Software Distribution portal](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html) as a feature pack. The zip file available on the Software Distribution portal includes two package files, one for AEM author and one for AEM publish instances.

### Required software

The following should be installed locally:

- Local AEM 6.5
- AEM 6.5 Service Pack 7 or later
- [Java 11](https://downloads.experiencecloud.adobe.com/content/software-distribution/en/general.html)
- [Apache Maven](https://maven.apache.org/) (3.3.9 or newer)
- [Node.js v10+](https://nodejs.org/en/)
- [npm 6+](https://www.npmjs.com/)
- [Git](https://git-scm.com/)

### Accessing the CIF add-on

The CIF add-on can be downloaded from the [Software Distribution portal](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html), search for ´AEM Commerce AMS add-on`.

>[!TIP]
>
>Make sure you always use the latest CIF Add-On version.

### Local setup

For local CIF project development using the AEM and the CIF add-on following steps:

1. Get the AEM 6.5 release, we recommend also to install the last available service pack

Unpack the AEM .jar to create the `crx-quickstart` folder, run:

    ```bash
    java -jar <jar name> -unpack
    ```

1. Create a `crx-quickstart/install` folder

1. Copy the CIF add-on all package, downloaded from Software Distribution portal, into the `crx-quickstart/install` folder. The AEM 6.5 Service Pack package can also be placed in this folder.

>[!TIP]
>
>Alternatively the CIF add-on package can also be installed via Package Manager.

1. Start the AEM quickstart

Verify the setup via OSGI console: `http://localhost:4502/system/console/osgi-installer`. The list should include the CIF add-on related bundles, content-package, and OSGI configurations. Make sure that all bundles are started.

## Project Setup {#project}

There are two ways to start your AEM Commerce project using CIF.

### Use AEM Project Archetype

The [AEM Project Archetype](https://github.com/adobe/aem-project-archetype) is the main tool to bootstrap a preconfigured project to get started with CIF. CIF Core Components and all the required configurations can be included in a generated project with one extra option.

>[!TIP]
>
>Use [AEM Project Archetype 25 or later](https://github.com/adobe/aem-project-archetype/releases) to generate the project.

See AEM Project Archetype [usage instructions](https://github.com/adobe/aem-project-archetype#usage) on how to generate an AEM project. To include CIF into the project use the `includeCommerce` option.

For example:

```bash
mvn -B archetype:generate \
 -D archetypeGroupId=com.adobe.granite.archetypes \
 -D archetypeArtifactId=aem-project-archetype \
 -D archetypeVersion=25 \
 -D aemVersion=6.5.5 \
 -D appTitle="My Site" \
 -D appId="mysite" \
 -D groupId="com.mysite" \
 -D frontendModule=general \
 -D includeExamples=n \
 -D includeCommerce=y
```

CIF Core Components can be used in any project by either including the provided `all` package or individual using the CIF content package and related OSGI bundles. To manually add CIF Core Components to a project use the following dependencies:

```java
<dependency>
    <groupId>com.adobe.commerce.cif</groupId>
    <artifactId>core-cif-components-apps</artifactId>
    <type>zip</type>
    <version>x.y.z</version>
</dependency>
<dependency>
    <groupId>com.adobe.commerce.cif</groupId>
    <artifactId>core-cif-components-config</artifactId>
    <type>zip</type>
    <version>x.y.z</version>
</dependency>
<dependency>
    <groupId>com.adobe.commerce.cif</groupId>
    <artifactId>core-cif-components-core</artifactId>
    <version>x.y.z</version>
</dependency>
<dependency>
    <groupId>com.adobe.commerce.cif</groupId>
    <artifactId>graphql-client</artifactId>
    <version>x.y.z</version>
</dependency>
<dependency>
    <groupId>com.adobe.commerce.cif</groupId>
    <artifactId>magento-graphql</artifactId>
    <version>x.y.z</version>
</dependency>
```

### Use AEM Venia Reference Store

A second option to start a CIF project is to clone and use the [AEM Venia Reference Store](https://github.com/adobe/aem-cif-guides-venia). The AEM Venia Reference Store is a sample reference storefront application that demonstrates the usage of CIF Core Components for AEM. It is intended as a best-practice set of examples and a potential starting point to develop your own functionality.

To get started with the Venia Reference Store simply clone the [Git repository](https://github.com/adobe/aem-cif-guides-venia) and start customizing the project according to your needs.

>[!NOTE]
>
>The Venia Reference Store project contains two build profiles for AEM as a Cloud Service and AEM 6.5. Check the [project readme.md](https://github.com/adobe/aem-cif-guides-venia/blob/main/README.md) to see how they are used. For AEM 6.5 use the `classic` profile.

### Connect AEM to the commerce system

To connect your project to the commerce system AEM must be configured with the GraphQL endpoint of your commerce system. 

Both, a project generated by the AEM archetype or the Venia Reference Store, already include a [default config](https://github.com/adobe/aem-cif-guides-venia/blob/main/ui.config/src/main/content/jcr_root/apps/venia/osgiconfig/config/com.adobe.cq.commerce.graphql.client.impl.GraphqlClientImpl~default.cfg.json) which must be adjusted.

Replace the value of the `url` in `com.adobe.cq.commerce.graphql.client.impl.GraphqlClientImpl~default.cfg.json` with the GraphQL endpoint of your commerce system used by the project.

CIF add-on user interfaces and CIF Core Components connect to the commerce GraphQL service directly via the browser. The CIF add-on provides a GraphQL proxy servlet. If you don't plan to use a local AEM Dispatcher, it is recommended to configure the GraphQL proxy servlet as well. 

Navigate to http://localhost:4502/system/console/configMgr and create an OSGI config for the `Adobe CIF GraphQL Proxy Configuration` service. Use the same GraphQL endpoint of your commerce system as used for the GraphQL client above.

## Additional Resources

- [AEM Project Archetype](https://github.com/adobe/aem-project-archetype)
- [AEM Venia Reference Store](https://github.com/adobe/aem-cif-guides-venia)

---
title: Develop AEM Commerce for AEM as a Cloud Service
description: Learn how to generate a commerce-enabled AEM project using the AEM project archetype. Learn how to build and deploy the project to a local development environment using the AEM as a Cloud Service SDK.
topics: Commerce, Development
feature: Commerce Integration Framework
version: cloud-service
doc-type: tutorial
kt: 5826
thumbnail: 39476.jpg
---

# Develop AEM Commerce for AEM as a Cloud Service {#develop}

Developing AEM Commerce projects based on Commerce Integration Framework (CIF) for AEM as a Cloud Service follows the same rules and best practices like other AEM projects on AEM as a Cloud Service as well. Please review these first:

- [AEM Project Structure](https://docs.adobe.com/content/help/en/experience-manager-cloud-service/implementing/developing/aem-project-content-package-structure.html)
- [AEM as a Cloud Service SDK](https://docs.adobe.com/content/help/en/experience-manager-cloud-service/implementing/developing/aem-as-a-cloud-service-sdk.html)
- [AEM as a Cloud Service Development Guidelines](https://docs.adobe.com/content/help/en/experience-manager-cloud-service/implementing/developing/development-guidelines.html)

## Local Development with AEM as a Cloud Service SDK {#local}

>[!VIDEO](https://video.tv.adobe.com/v/39476/?quality=12&learn=on)

A local development environment is recommended to work with CIF projects. The CIF Add-On provided for AEM as a Cloud Service environments is available for local development as well. It can be downloaded from the [Software Distribution portal](https://experience.adobe.com/#/downloads/content/software-distribution/en/aemcloud.html).

The CIF Add-On is provided as a Sling Feature archive. The zip file available on the Software Distribution portal includes two Sling Feature archive files, one for AEM author and one for AEM publish instances.

**New to AEM as a Cloud Service?** Check out [a more detailed guide to setting up a local development environment using the AEM as a Cloud Service SDK](https://docs.adobe.com/content/help/en/experience-manager-learn/cloud-service/local-development-environment-set-up/overview.html).

### Required software

The following should be installed locally:

- [AEM as a Cloud Service SDK](https://docs.adobe.com/content/help/en/*experience-manager-learn/cloud-service/local-development-environment-set-up/aem-runtime.html#download-the-aem-as-a-cloud-service-sdk)
- [Java 11](https://downloads.experiencecloud.adobe.com/content/software-distribution/en/general.html)
- [Apache Maven](https://maven.apache.org/) (3.3.9 or newer)
- [Node.js v10+](https://nodejs.org/en/)
- [npm 6+](https://www.npmjs.com/)
- [Git](https://git-scm.com/)

### Accessing the CIF add-on

The CIF add-on can be downloaded as a zip file from the [Software Distribution portal](https://experience.adobe.com/#/downloads/content/software-distribution/en/aemcloud.html). The zip file contains the CIF add-on as **Sling Feature archive**, it is not an AEM package. Note that access to the SDK listings is limited to those with AEM as a Cloud Service license.

>[!TIP]
>
>Make sure you always use the latest CIF Add-On version.

### Local setup

For local CIF Add-on development using the AEM as a Cloud Service SDK following steps:

1. Get the latest AEM as a Cloud Service SDK
1. Unpack the AEM .jar to create the `crx-quickstart` folder, run:

    ```bash
    java -jar <jar name> -unpack
    ```

1. Create a `crx-quickstart/install` folder
1. Copy the correct Sling Feature archive file of the CIF add-on into the `crx-quickstart/install` folder.

    The CIF add-on zip file contains two Sling Feature archive `.far` files. Make sure to use the correct one for AEM Author or AEM Publish, depending on how you plan to run the local AEM as a Cloud Service SDK.

1. Create a local OS environment variable named `COMMERCE_ENDPOINT` holding the Magento GraphQL endpoint.

    Example Mac OSX:

    ```bash
    export COMMERCE_ENDPOINT=https://demo.magentosite.cloud/graphql
    ```

    Example Windows:

    ```bash
    set COMMERCE_ENDPOINT=https://demo.magentosite.cloud/graphql
    ```

    This variable must be set up for the AEM as a Cloud Service environment as well.

    For more information on variables, see [Configuring OSGi for AEM as a Cloud Service](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/implementing/deploying/configuring-osgi.html#local-development).

1. (Optional) To enable staged catalog features, you need to create an integration token for your Magento instance. Please follow the steps at [Getting Started](./getting-started.md#staging) to create the token.

    Set an OSGi secret  with the name `COMMERCE_AUTH_HEADER` to the following value:

    ```xml
    Authorization: Bearer <Access Token>
    ```

    For more information on secrets, see [Configuring OSGi for AEM as a Cloud Service](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/implementing/deploying/configuring-osgi.html#local-development).

1. Start the AEM as a Cloud Service SDK

1. Start the local GraphQL proxy server

    To make the Magento GraphQL endpoint available locally for the CIF add-on and the CIF components use the following command. The GraphQL endpoint will then be available at `http://localhost:3002/graphql`.
    Example Mac OSX:

    ```bash
    npx local-cors-proxy --proxyUrl https://demo.magentosite.cloud --port 3002 --proxyPartial ''
    ```

    Example Windows:

    ```bash
    npx local-cors-proxy --proxyUrl https://demo.magentosite.cloud --port 3002 --proxyPartial '""'
    ```

    The argument `--proxyPartial` needs to receive an empty string.
    
    You can test the local GraphQL proxy by pointing a GraphQL query tool to `http://localhost:3002/graphql` and test a few queries.
 
1. Login to AEM SDK and configure CIF to use the local GraphQL proxy server.
 
    Navigate to the CIF Cloud Service configuration (Tools > Cloud Services > CIF Configuration). Open the properties view of the config used by your project.
    
    For the `GraphQL Proxy Path` property use the local proxy server endpoint `http://localhost:3002/graphql`. Save the configuration.

>[!NOTE]
>
>Do not push the configuration of step 8 into the project repo. This config is only required for a local development setup. AEM as a Cloud Service environments are already set up with the GraphQL proxy during the onboarding.

Verify the setup via OSGI console: `http://localhost:4502/system/console/osgi-installer`. The list should include the CIF add-on related bundles, content-package, and OSGI configurations as defined in the feature model file.

## Project Setup {#project}

There are two ways to bootstrap your CIF project for AEM as a Cloud Service.

### Use AEM Project Archetype

The [AEM Project Archetype](https://github.com/adobe/aem-project-archetype) is the main tool to bootstrap a preconfigured project to get started with CIF. CIF Core Components and all the required configurations can be included in a generated project with one additional option.

>[!TIP]
>
>Use [AEM Project Archetype 24 or later](https://github.com/adobe/aem-project-archetype/releases) to generate the project.

See AEM Project Archetype [usage instructions](https://github.com/adobe/aem-project-archetype#usage) on how to generate an AEM project. To include CIF into the project use the `includeCommerce` option.

For example:

```bash
mvn -B archetype:generate \
 -D archetypeGroupId=com.adobe.granite.archetypes \
 -D archetypeArtifactId=aem-project-archetype \
 -D archetypeVersion=24 \
 -D aemVersion=cloud \
 -D appTitle="My Site" \
 -D appId="mysite" \
 -D groupId="com.mysite" \
 -D frontendModule=general \
 -D includeExamples=n \
 -D includeCommerce=y
```

CIF Core Components can be used in any project by either including the provided `all` package or individualy using the CIF content package and related OSGI bunldes. To manually add CIF Core Components to a project use the following dependencies:

```java
<dependency>
    <groupId>com.adobe.commerce.cif</groupId>
    <artifactId>core-cif-components-apps</artifactId>
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

A second option to start a CIF project is to clone and use the [AEM Venia Reference Store](https://github.com/adobe/aem-cif-guides-venia). The AEM Venia Reference Store is a sample reference storefront application that demonstrates the usage of CIF Core Components for AEM. It is intended as a best-practice set of examples as well as a potential starting point to develop your own functionality.

To get started with the Venia Reference Store simply clone the Git repository and start customizing the project according to your needs.

>[!NOTE]
>
>The Venia Reference Store project contains two build profiles for AEM as a Cloud Service and AEM 6.5. Check the [project readme.md](https://github.com/adobe/aem-cif-guides-venia/blob/main/README.md) to see how they are used.

## Additional Resources

- [AEM Project Archetype](https://github.com/adobe/aem-project-archetype)
- [AEM Venia Reference Store](https://github.com/adobe/aem-cif-guides-venia)
- [Software Distribution portal](https://experience.adobe.com/#/downloads/content/software-distribution/en/aemcloud.html)

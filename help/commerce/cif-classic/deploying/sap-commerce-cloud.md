---
title: Deploy eCommerce with SAP Commerce Cloud

description: Learn how to deploy eCommerce with SAP Commerce Cloud.

contentOwner: Guillaume Carlino
topic-tags: e-commerce
content-type: reference
exl-id: ecbd0097-c407-4581-bab2-4729a71df4a3
---
# SAP Commerce Cloud{#sap-commerce-cloud}

>[!NOTE]
>
>This page contains links to the hybris website. For certain pages you will need an account to login.

## Deploying eCommerce with SAP Commerce Cloud {#deploying-ecommerce-with-sap-commerce-cloud}

>[!NOTE]
>
>The following procedures use the following demonstration catalog to illustrate the deployment:
>
>`Geometrixx Outdoors Site English (US)`

Deploying the [necessary eCommerce packages](#packages-needed-for-ecommerce-with-hybris) will provide the full functionality of the eCommerce framework, together with a reference implementation of eCommerce functionality as provided with a hybris implementation (including a demonstration catalog)

This is available under the English (US) branch ( `/content/geometrixx-outdoors/en_US`) of the Geometrixx Outdoors site:

* [Product Information](#productinformationwithcolorvariants) (with color variants when appropriate)

* [Shopping Cart content overviews](#shoppingcartcontentoverview)
* [Customer Sign-Up](#customersignup) and [Customer Sign-In](#customersignin)

* [Access to the hybris management console](#accesstothehybrismanagementconsole)

### Technical Requirements - hybris Server {#technical-requirements-hybris-server}

The hybris extension of the eCommerce Integration Framework has been updated to support Hybris 5 (as default), while maintaining backward compatibility with [Hybris 4](/help/commerce/cif-classic/developing/sap-commerce-cloud.md#developing-for-hybris).

>[!NOTE]
>
>* Supports versions 18.11 and above.
>* You will need Java 7 to run the [hybris 5 server.](https://www.hybris.com/en/architecture-technology)
>* The hybris add-on, the [Telco Accelerator](https://www.hybris.com/en/products/telecommunication), is not supported by the AEM extension.
>

### Packages Needed for eCommerce with hybris {#packages-needed-for-ecommerce-with-hybris}

To install eCommerce functionality you need:

* Your hybris server
* AEM eCommerce framework:

    * this is part of a standard AEM installation

* AEM Geometrixx-all package:

    * `cq-geometrixx-all-pkg`

* AEM hybris content packages:

    * `cq-hybris-content-6.3.2`
    * hybris-specific API implementation
    * `cq-geometrixx-hybris-content-6.3.2`
    * a reference implementation to illustrate use of hybris ( `geometrixx-outdoors/en_US`)

### Installation of eCommerce with hybris {#installation-of-ecommerce-with-hybris}

To install a fully-fledged configuration (using the demonstration catalog, Geometrixx Outdoors) the basic steps are:

1. [Install AEM](/help/sites-deploying/deploy.md).
1. Install the Geometrixx-all package

    1. ` [cq-geometrixx-all-pkg](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq60/product/cq-geometrixx-all-pkg)`

1. Install the demonstration content packages using the [package manager](/help/sites-administering/package-manager.md):

    1. ` [cq-hybris-content-6.3.2](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq630/product/cq-hybris-content)`
    1. ` [cq-geometrixx-hybris-content-6.3.2](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq630/product/cq-geometrixx-hybris-content)`

1. [Download and build your hybris Server](#download-and-build-your-hybris-server).
1. Construct your catalog in your eCommerce engine:

    1. [Setup the Geometrixx Outdoor Store](#setup-the-geometrixx-outdoors-store).

1. [Author](/help/sites-authoring/qg-page-authoring.md) any supplementary pages that you need in AEM.

>[!CAUTION]
>
>Use of the hybris server requires a separate hybris license.

>[!NOTE]
>
>For developers [API documentation](/help/commerce/cif-classic/developing/ecommerce.md#api-documentation) is also available for download.

### Download and Build your hybris Server {#download-and-build-your-hybris-server}

The steps in this procedure will download and build the hybris server. It will also make the initial configurations required for the connections between hybris and cq. The extension will then be usable with the default settings.

>[!CAUTION]
>
>Hybris versions earlier than 5.5.1 are not supported.

>[!NOTE]
>
>To complete this, you will need [Groovy](https://groovy-lang.org/) installed on your system.

1. Download the **hybris Commerce Suite** distribution from the hybris download site.

   >[!CAUTION]
   >
   >You will need an account (from hybris) to access this.

1. Unzip the distribution file to the required location (referred as &lt;hybris-root-directory&gt;).
1. From the command line, execute the following:

   ```shell
   cd <hybris-root-directory>/bin/platform
   . ./setantenv.sh
   ant clean all
   cd ../..
   ```

   >[!NOTE]
   >
   >When executing:
   >
   >`ant clean all`
   >
   >Press `Return` when required.

1. Download the following files to the root folder of your extracted hybris distribution,

   ```
       <hybris-root-directory>
   ```


   [Get File](/help/sites-deploying/assets/setup.groovy)

   >[!NOTE]
   >
   >For hybris 5.6.0 and later, please use the following setup.groovy.

   5.6.0 and later

   [Get File](/help/sites-deploying/assets/setup-1.groovy)

1. From the command line, execute the following to:

    * update the configuration of the hybris server (as required by the extension)
    * rebuild the hybris server with the modified configuration
    * start the server

   ```shell
   groovy setup.groovy
   cd bin/platform
   ant clean all
   sh hybrisserver.sh
   ```

   >[!NOTE]
   >
   >Dependent on your system, several of these steps might take several minutes to complete.

1. In your browser, navigate to the **hybris administration console** at:

   [http://localhost:9002](http://localhost:9002)

1. Click **Initialize** and then confirm the initialization action (as it will delete existing data).

   The progress will be shown on the console, with `FINISHED` indicating completion.

   >[!NOTE]
   >
   >Dependent on your system, this might take several minutes to complete.

### Setup the Geometrixx Outdoors Store {#setup-the-geometrixx-outdoors-store}

This procedure will upload and configure the demonstration store - Geometrixx Online.

1. Start your hybris instance. From the command line, execute the following:

   ```shell
   cd <hybris-root-directory>/bin/platform
   sh hybrisserver.sh
   ```

1. In your browser, navigate to the **hybris management console** at:

   [https://localhost:9002/backoffice](https://localhost:9002/backoffice) 
   
   Use these credentials:
   * username: admin
   * password: nimda

1. From the sidebar navigation, expand **System** and **Tools**. Then select **Import** to open the **Wizard: CSV Import** window.
1. In the **Configuration** tab, **Upload** the following **Import file**:

   [Get File](/help/sites-deploying/assets/geometrixx-outdoors-export.csv)

1. Set the **Locale Setting** to:

   `en_US - English (United States)`

1. Open the **Resources** tab.
1. **Upload** the following **Media-Zip**:

   [Get File](/help/sites-deploying/assets/geometrixx-outdoors-images.zip)

1. Click **Start** to import the specified files. The **Result** tab will show any log entries.

1. Click **Done** to close the import window.

1. From the sidebar, select **System**, then **Tools**, then **Import**.

1. **Upload** the following **Import file**:

   [Get File](/help/sites-deploying/assets/base-store.csv)

   For hybris 5.7, please use the following:

   [Get File](/help/sites-deploying/assets/base-store-5_7.csv)

1. Set the **Locale Setting** to:

   `en_US - English (United States)`

1. Click **Start** to import the specified files. The **Result** tab will show any log entries.

1. Click **Done** to close the import window.

1. You can now use the product cockpit to view the imported catalogs and products:

   [http://localhost:9002/productcockpit](http://localhost:9002/productcockpit)

---
title: "DO NOT PUBLISH: AEM Forms Apache Felix and Apache Sling configurations "
seo-title: "DO NOT PUBLISH: AEM Forms Apache Felix and Apache Sling configurations "
description: This article explores all the Apache Felix/Apache Sling configurations of AEM Forms. These configurations help you change the behavior of an AEM Forms author and publish instance.
seo-description: This article explores all the Apache Felix/Apache Sling configurations of AEM Forms. These configurations help you change the behavior of an AEM Forms author and publish instance.
page-status-flag: never-activated
uuid: 23e66061-1846-46c2-b856-d98753703fda
contentOwner: khsingh
products: SG_EXPERIENCEMANAGER/6.4/FORMS
discoiquuid: 35e106f1-eba2-4f1c-9bf0-69c2e7217980
---

# DO NOT PUBLISH: AEM Forms Apache Felix and Apache Sling configurations {#do-not-publish-aem-forms-apache-felix-and-apache-sling-configurations}

This article explores all the Apache Felix/Apache Sling configurations of AEM Forms. These configurations help you change the behavior of an AEM Forms author and publish instance.

## Overview  {#overview}

Along with other, an AEM Forms installation contains Apache Felix and Apache Sling applications. These applications provide configurations to change the behavior of AEM modules and components. Many AEM Forms modules provide such configurations.

This article explores all such AEM Forms configurations available out of the box, provides methods to browse and edit the configurations, and provides detailed information about the options available in a configuration. The configurations are classified into the following categories:

* AEM Forms on OSGi - Native configurations
* AEM Forms on OSGI - Document Services configurations
* AEM Forms on JEE - Document Services configurations

## AEM Forms on OSGi Configurations {#aem-forms-on-osgi-native-configurations}

The correspondence management module has the following configurations:

### Asset Composer Configurations {#asset-composer-configurations}

The Asset Composer configuration provides options to configure core correspondence management capabilities such as asset (text, image, list, condition, and letter template) creation and document rendering. To configure available capabilities, navigate to AEM Web Console Configuration and open the **Asset Composer Configurations** option. The [Correspondence Management Configuration Properties](/help/forms/using/cm-configuration-properties.md) article also lists all the properties of the configuration.

For detailed steps to edit a configuration, see configuration section in [Web Console](/help/sites-deploying/web-console.md) documentation.

### AEM Forms Analytics Configuration {#aem-forms-analytics-configuration}

AEM Forms integrates with Adobe Analytics that allows you to capture and track performance metrics for your published forms and documents. The objective  behind  analyzing these metrics is to make informed decisions based on data about the changes required to make forms or document more usable. AEM Forms Analytics Configuration provides options to select framework, configure  cron  expression, and report time-out. To configure available options, navigate to AEM Web Console Configuration and open the AEM Forms Analytics Configuration option.

The configuration service has only a subset of options required to configure Adobe Analytics and AEM Forms reports. For detailed information about configuring Adobe Analytics and AEM Forms reports, see the [Configuring analytics and reports](/help/forms/using/configure-analytics-forms-documents.md) article.

### AEM Forms Analytics Configuration {#aem-forms-analytics-configuration-1}

## AEM Forms on OSGI - Document Services configurations  {#aem-forms-on-osgi-document-service-configurations}

Assembler service lets you combine, rearrange, and augment PDF and XDP documents and obtain information about PDF documents. Each job submitted to the Assembler service includes a Document Description XML (DDX) document, source documents, and external resources (strings and graphics). For more information about assembler service, see [Overview of Assembler Service](https://helpx.adobe.com/content/help/en/aem-forms/6/overview-aem-document-services.html#main-pars_header_0).

Assembler service depends on the Reader Extensions service, Signature service, Forms service, and Output service. Perform the following steps to ensure that above mentioned services are configured:

1. Open AEM Bundles Web Console as an administrator. The default URL is `https://[server]:[port]/system/console/bundles`. 
1. Search the services/bundles listed below and ensure that these services are up and running:

<table> 
 <tbody> 
  <tr> 
   <th>Service<br /> </th> 
   <th>Bundle </th> 
  </tr> 
  <tr> 
   <td>Signatures Service</td> 
   <td>adobe-aemfd-signatures</td> 
  </tr> 
  <tr> 
   <td>Reader Extensions Service</td> 
   <td>com.adobe.aemfd.adobe-aemfd-readerextensions<br /> </td> 
  </tr> 
  <tr> 
   <td>Forms Service</td> 
   <td>com.adobe.livecycle.adobe-lc-forms-bedrock-connector<br /> </td> 
  </tr> 
  <tr> 
   <td>Output Service</td> 
   <td>com.adobe.livecycle.adobe-lc-forms-bedrock-connector</td> 
  </tr> 
 </tbody> 
</table>

Barcoded Forms service extracts data from electronic images of barcodes. By default, the service starts scanning a barcode from all the sides (Top to bottom, left to right, bottom to top, and right to left). You can use the **AEMFD Barcoded Forms Service** configuration to limit the service to scan the barcode only from specified side. To configure the sides, navigate to AEM Web Console Configuration, open the AEMFD Barcoded Forms Service configuration, and change select the required sides.

AEM Forms PDF Generator enables IT managers to centrally manage and control the creation of Adobe PDF documents throughout the enterprise. With it, employees can easily convert documents created within the organization to Adobe PDF files that can be viewed using the ubiquitous Adobe Reader® software. PDF Generator offers flexible deployment options, granular control over document properties, and feature sets that can meet the document conversion needs of every organization.

* To install, configure, and run PDF Generator on an **AEM Forms on OSGi** environment, see the Install and Configure PDF Generator article.

* To install, configure, and run PDF generator on an **AEM Forms on JEE **environment, see AEM Forms on JEE specific Installing, Upgrading, and Clustering documentation at AEM Forms help and tutorials.

The Reader Extensions service enables your organization to easily share interactive PDF documents by extending the functionality of Adobe Reader with additional usage rights. The Reader Extension service is part of the [DocAssurance Service](/help/forms/using/overview-aem-document-services.md). To configure the DocAssurance service, perform the steps listed in the [Configuring the DocAssurance service](/help/forms/using/install-configure-document-services.md) article.

The Signature service accesses certificates and credentials that are stored in the trust store. It lets you work with digital signatures and documents on the AEM server. The signature service is part of the [DocAssurance Service](/help/forms/using/overview-aem-document-services.md). To configure the DocAssurance service, perform the steps listed in the [Configuring the DocAssurance service](/help/forms/using/install-configure-document-services.md) article.

AEM Forms can also use credentials stored on an HSM or etoken to eSign or apply server-sided digital signatures to a document. Hardware security modules (HSM) and etokens are dedicated, hardened, and tamper-resistance computing devices designed to securely manage, process, and store digital keys. These devices are directly attached to a computer or a network server. For detailed steps to use an HSM or etoken device with AEM Forms, see [Use HSM to digitally sign or certify documents](/help/forms/using/hsm-certify-esign-docs.md).

## AEM Forms on JEE - Document Services configurations  {#aem-forms-on-jee-document-services-configurations}


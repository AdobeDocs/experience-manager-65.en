---
title: Notable changes to AEM Commerce as a Cloud Service
description: Notable changes to AEM Commerce as a Cloud Service as compared to Adobe Experience Manager 6.5.
---

# Notable changes to AEM Commerce as a Cloud Service {#notable-changes}

Adobe Experience Manager as a Cloud Service brings many new features and possibilities to manage your AEM projects. This document highlights the important differences for Commerce capabilities between Commerce Integration Framework (CIF) for On-premise, Adobe Managed Service and Experience Manager as a Cloud Service. For other changes, see the generic [changes to Experience Manager as a Cloud Service](/help/release-notes/aem-cloud-changes.md).

The main differences as compared to Experience Manager 6.5 are in the following areas:
* [Support for CIF Classic](#cif-classic)
* [Deployment of CIF Authoring Tools](#cif-tools)
* [Moving from on-premise and Adobe Managed Service](#moving-cif-cs)

## Support for CIF Classic/Quickstart on Experience Manager as a Cloud Service {#cif-classic}

The Classic Commerce Integration Framework which included a Product Importer to import and store product catalogs in Experience Manager is no longer available in Experience Manager as a Cloud Service. The use of Classic CIF is not supported in Experience Manager as a Cloud Service and projects using Classic CIF will have to replace the Classic CIF implementation with the supported version as described in [CIF on Experience Manager as a Cloud Service](https://docs.adobe.com/content/help/en/experience-manager-cloud-service/commerce/architecture/magento.html#overview)

## Deployment of CIF {#deployment}

Shown below are the different deployment models for Commerce Integration Framework for the different AEM offerings:

|                  | AEM On-premise  |  AEM Managed Services         |  AEM Cloud Service         |
|-------------     |-----------|-----------|-----------|
|How to deploy CIF Authoring tools for Magento backend| [Refer to CIF Connector](https://github.com/adobe/commerce-cif-connector/blob/master/README.md) supported on AEM 6.5| [Refer to CIF Connector](https://github.com/adobe/commerce-cif-connector/blob/master/README.md) supported on AEM 6.5| AEM as a Cloud Service needs to be provisioned with CIF add-on. Contact your sales representative for more details|
|How to deploy [CIF Venia Project](https://github.com/adobe/aem-cif-guides-venia)|AEM package install|Deployment done via [Cloud Manager](https://docs.adobe.com/content/help/en/experience-manager-cloud-manager/using/introduction-to-cloud-manager.html) | Project moved into [Cloud Manager Git Repository](https://docs.adobe.com/content/help/en/experience-manager-cloud-service/implementing/managing-code/integrating-with-git.html) and deployment done via [Cloud Manager](https://docs.adobe.com/content/help/en/experience-manager-cloud-service/implementing/deploying/overview.html)|

>[!NOTE]
>
>For additional documentation on how to use CIF with AEM Managed Service or AEM On-premise, refer to [Commerce Integration Framework](https://www.adobe.io/apis/experiencecloud/commerce-integration-framework/getting-started.html)

>[!NOTE]
>
>CIF Classic/Quickstart version of Commerce Integration Framework may be used on AEM On-premise offering for very limited use-cases. However, this is not the recommended solution.

## Moving to AEM Commerce as a Cloud Service from On-premise and Managed Services {#moving-cif-cs}

Customers moving from an AEM on-premise or Managed Services installation to AEM as a Cloud Service need to do a few minor adjustments on the AEM project.

The first adjustment, as described above, is needed for the CIF Connector. The CIF Connector is replaced by the CIF add-on which is deployed by Adobe. Therefore do not install the CIF Connector on AEM as a Cloud Service. Also, the use with the local AEM Cloud SDK is not supported, Adobe provides the CIF add-on also for [local development](develop.md).

Second, understand the [AEM Project Structure](https://docs.adobe.com/content/help/en/experience-manager-cloud-service/implementing/developing/aem-project-content-package-structure.html) and the characteristics of AEM as a Cloud Service. Adapt your project setup to the AEM as a Cloud Service layout.
The main differences here are:

* The GraphQL client OSGI bundle **must not** be included into the AEM project anymore, it is deployed via the CIF add-on
* OSGI configs for GraphQL client and Graphql Data Service **must not** be included into the AEM project anymore

>[!TIP]
>
>Check out the [AEM Venia Reference Store](https://github.com/adobe/aem-cif-guides-venia) project on GitHub. This project provides Maven profiles for AEM as a Cloud Service and on-premise deployments which take into account the different framework conditions.  

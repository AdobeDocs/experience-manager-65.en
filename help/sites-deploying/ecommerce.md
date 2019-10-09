---
title: eCommerce Overview
seo-title: eCommerce Overview
description: AEM generic eCommerce is available as part of the standard installation and provides you with the full functionality of the eCommerce framework.  
seo-description: AEM generic eCommerce is available as part of the standard installation and provides you with the full functionality of the eCommerce framework.  
uuid: 7be42b1e-f1d6-4891-96f8-0133b3a299a1
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: e-commerce
content-type: reference
discoiquuid: cb043066-aefc-4b68-b302-2b5dd710a786
---

# eCommerce Overview{#ecommerce-overview}

AEM generic eCommerce is available as part of a standard installation and provides you with the full functionality of the eCommerce framework.

Adobe provides two versions of the Commerce Integration Framework:

|                         | CIF on-prem                                                                                                                                                                                            | CIF Cloud                                                                                                              |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------|
| Supported AEM versions  | AEM on-prem or AMS 6.x                                                                                                                                                                                 | AEM AMS 6.4 and 6.5                                                                                                    |
| Back-end                | - AEM, Java <br> - Monolithic integration, pre-build mapping (template)<br> - JCR repository                                                                                                                    | - Magento <br>- Java and Javascript <br>- No Commerce data stored in JCR repository                                            |
| Front-end               | AEM server-side rendered pages                                                                                                                                                                         | Mixed page application (hybrid rendering)                                                                              |
| Product catalog         | - Product importer, editor, caching in AEM <br>- Regular catalogs with AEM or proxy pages                                                                                                                  | - No product import <br>- Generic templates <br>- On-demand data via connector                                                 |
| Scalability             | - Can support up to a few million products (depends on the use-case) <br> - Caching on Dispatcher                                                                                                           | - No volume limitation <br>- Caching on Dispatcher or CDN                                                                  |
| Standardized data model | No                                                                                                                                                                                                     | Yes, Magento GraphQL schema                                                                                            |
| Availability            | Yes:<br> - SAP Commerce Cloud (Extension updated to support AEM 6.4 and Hybris 5 (default) and maintains compatibility with Hybris 4 <br>- Salesforce Commerce Cloud (Connector open-sourced to support AEM 6.4) | Yes via open source via GitHub. <br> Magento Commerce (Supports Magento 2.3.2 (default) and compatible with Magento 2.3.1). |
| When to use             | Limited use-cases: For scenarios where small, static catalogs may need to be imported                                                                                                                  | Preferred solution in most use-cases                                                                                   |


## Deploying Other Implementations {#deploying-other-implementations}

* [SAP Commerce Cloud](/help/sites-deploying/sap-commerce-cloud.md)
* [Salesforce Commerce Cloud](https://github.com/adobe/commerce-salesforce)
* [Magento](https://www.adobe.io/apis/experiencecloud/commerce-integration-framework/integrations.html#!AdobeDocs/commerce-cif-documentation/master/integrations/02-AEM-Magento.md)

>[!NOTE]
>
>For information about concepts and administering eCommerce implementations, see [Administering eCommerce](/help/sites-administering/ecommerce.md).
>
>For information about extending eCommerce capabilities, see [Developing eCommerce](/help/sites-developing/ecommerce.md).


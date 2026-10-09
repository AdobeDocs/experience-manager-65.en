---
title: eCommerce Overview
description: AEM generic eCommerce is available as part of the standard installation and provides you with the full functionality of the eCommerce framework.
feature: Commerce Integration Framework
exl-id: 3567bd28-73aa-401a-8aa9-a62a99d2a613
solution: Experience Manager,Commerce
role: Admin, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: eadea719-cf89-469b-a6fd-a236a7138047
    internal-label: Commerce
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# eCommerce Overview{#ecommerce-overview}

AEM generic eCommerce is available as part of a standard installation and provides you with the full functionality of the eCommerce framework.

Adobe provides two versions of the Commerce Integration Framework:

|                         | CIF on-prem                                                                                                                                                                                            | CIF Cloud                                                                                                              |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------|
| Supported AEM versions  | AEM on-prem or AMS 6.x                                                                                                                                                                                 | AEM AMS 6.4 and 6.5                                                                                                    |
| Back-end                | - AEM, Java&trade; <br> - Monolithic integration, pre-build mapping (template)<br> - JCR repository                                                                                                                    | - Adobe Commerce <br>- Java and JavaScript <br>- No Commerce data stored in JCR repository                                            |
| Front-end               | AEM server-side rendered pages                                                                                                                                                                         | Mixed page application (hybrid rendering)                                                                              |
| Product catalog         | - Product importer, editor, caching in AEM <br>- Regular catalogs with AEM or proxy pages                                                                                                                  | - No product import <br>- Generic templates <br>- On-demand data via connector                                                 |
| Scalability             | - Can support up to a few million products (depends on the use-case) <br> - Caching on Dispatcher                                                                                                           | - No volume limitation <br>- Caching on Dispatcher or CDN                                                                  |
| Standardized data model | No                                                                                                                                                                                                     | Yes, Adobe Commerce GraphQL schema                                                                                            |
| Availability            | Yes:<br> - SAP Commerce Cloud (Extension updated to support AEM 6.4 and Hybris 5 (default) and maintains compatibility with Hybris 4 <br>- Salesforce Commerce Cloud (Connector open-sourced to support AEM 6.4) | Yes via open source via GitHub. <br> Adobe Commerce (Supports 2.3.2 (default) and compatible with 2.3.1). |
| When to use             | Limited use-cases: For scenarios where small, import static catalogs as needed                                                                                                                  | Preferred solution in most use-cases                                                                                   |


## Deploying Other Implementations {#deploying-other-implementations}

For AEM and Adobe Commerce, see [AEM and Adobe Commerce integration](/help/commerce/cif/integrating/magento.md) using the [Commerce Integration Framework](/help/commerce/cif/introduction.md).

>[!NOTE]
>
>For information about concepts and administering eCommerce implementations, see [Administering eCommerce](/help/commerce/cif-classic/administering/ecommerce.md).
>
>For information about extending eCommerce capabilities, see [Developing eCommerce](/help/commerce/cif-classic/developing/ecommerce.md).

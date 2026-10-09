---
title: Multi-tenancy for Collections, snippets, and snippet templates
description: Learn how the multi-tenancy feature lets you segregate content in the CRX repository based on the customer organization to prevent unauthorized access.
contentOwner: AG
role: Developer, Admin, Leader
feature: Collections
exl-id: f95560c9-f1b9-4e86-94a7-70347d268d8f
solution: Experience Manager, Experience Manager Assets
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: d09181b5-a36a-43de-ba01-36641440bc43
    internal-label: Experience Manager Assets
feature_v2:
  - id: ac365bec-0634-4744-9473-c42f47320593
    internal-label: Asset management and governance
subfeature_v2:
  - id: c73531c3-4c05-471e-beff-cefb35857910
    internal-label: Collections
role_v2:
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: f8a45b24-4be7-4f1b-909b-60d06b483a20
    internal-label: Leader
---
# Multi-tenancy for Collections, snippets, and snippet templates {#multi-tenancy-for-collections-snippets-and-snippet-templates}

The multi-tenancy feature lets you segregate content in CRX based on the organization prefix and organization ID to safeguard the content from unauthorized access by users of other organizations.

[!DNL Adobe Experience Manager Assets] stores data for each organization in a different path. Each organization-specific path is identified by the organization prefix and organization ID
that is included in the traditional location where different types of assets are stored in CRX.

For example, if you create a folder named `Demo`, [!DNL Experience Manager] assets traditionally stores the folder at `../content/dam/Demo`. With multi-tenancy enabled, you can now store the data at `../content/dam/<organization prefix>/<organization id>Demo`

For example, if for [!DNL Adobe Marketing Cloud] users of [!DNL Assets] (on demand) that are assigned to the `aodpremium` organization, you can use the multi-tenancy feature to configure `../content/dam/<mac>/<aodpremium>Demo` path to segregate their content. In this example, `mac` is the organization prefix and `aodpremium` is the organization ID.

Based on the user's organization and ID, this qualified path is displayed in the [!DNL Assets] interface and various wizards, including the Move and Snippet creation wizards to enforce segregation.

The Multi-tenancy feature lets you segregate the following types of assets and components:

* Collections
* Public Collections
* Catalogs (including the Add/Select Page wizard)
* Templates
* Snippet templates
* Lightbox

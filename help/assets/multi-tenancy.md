---
title: Multi-tenancy for Collections, snippets, and snippet templates
description: Learn how the multi-tenancy feature lets you segregate content in the CRX repository based on the customer organization to prevent unauthorized access.
uuid: 271bbbd1-b123-4185-bdca-4c5e410389ad
contentOwner: AG
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
discoiquuid: 8a1f192b-ad78-4330-8869-584bad65832b
---

# Multi-tenancy for Collections, snippets, and snippet templates {#multi-tenancy-for-collections-snippets-and-snippet-templates}

The multi-tenancy feature lets you segregate content in CRX based on the organization prefix and organization ID to safeguard the content from unauthorized access by users of other organizations.

Adobe Experience Manager (AEM) Assets stores data for each organization in a different path. Each organization-specific path is identified by the organization prefix and organization ID
that is included in the traditional location where different types of assets are stored in CRX.

For example, if you create a folder named `Demo`, AEM assets traditionally stores the folder at `../content/dam/Demo`. With multi-tenancy enabled, you can now store the data at `../content/dam/<organization prefix>/<organization id>Demo`

For example, if for [!DNL Adobe Marketing Cloud] users of AEM Assets (on demand) that are assigned to the `aodpremium` organization, you can use the multi-tenancy feature to configure `../content/dam/<mac>/<aodpremium>Demo` path to segregate their content. In this example, `mac` is the organization prefix and `aodpremium` is the organization ID.

Based on the user's organization and ID, this qualified path is displayed in the AEM Assets interface and various wizards, including the Move and Snippet creation wizards to enforce segregation.

The Multi-tenancy feature lets you segregate the following types of assets and components:

* Collections
* Public Collections
* Catalogs (including the Add/Select Page wizard)
* Templates
* Snippet templates
* Lightbox

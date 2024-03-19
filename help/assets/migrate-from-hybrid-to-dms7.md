---
title: Migrating from Dynamic Media - Hybrid mode to Dynamic Media - S7 mode
description: Learn how to migrate your instance of Dynamic Media - Hybrid mode to Dynamic Media - S7 mode
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
docset: aem65
role: User, Admin
feature: Scene7 Mode,Hybrid Mode
exl-id: 07f0803c-4ec4-4745-8214-63370e9d0282
solution: Experience Manager, Experience Manager Assets
---
# About moving from Dynamic Media&ndash;Hybrid to Dynamic Media&ndash;Scene7 {#about-migrating}

Dynamic Media&ndash;Hybrid is an older version of Dynamic Media integration with Adobe Experience Manager. The Hybrid version was first introduced in Adobe Experience Manager 6.1. While Adobe continues to support Hybrid mode, it is not the preferred mode; Dynamic Media&ndash;Scene7 is the preferred mode to use. Hybrid mode also does not support new features such as Smart Crop and panoramic images, whereas Dynamic Media&ndash;Scene7 does support them.

Additional key differences between Dynamic Media&ndash;Hybrid and Dynamic Media&ndash;Scene7 include the following:

* Structure of URLs.
* Ingestion of videos.
* Creation and storage of image renditions.
* Cloud configuration and credentials (provisioning).

Two options are available when you move from Dynamic Media&ndash;Hybrid to Dynamic Media&ndash;Scene7. The first option is to simply provision a new instance of Dynamic Media&ndash;Scene7 on Experience Manager. The second option is to migrate your existing instance of Dynamic Media&ndash;Hybrid to Dynamic Media&ndash;Scene7. This option outlines-in table form below-the steps and considerations for you to make during the move.

>[!IMPORTANT]
>
>Adobe recommends that you do not migrate a Dynamic Media&ndash;Hybrid implementation to Dynamic Media&ndash;Scene7 on live production instances.

## Option 1 - Provision a new instance of Dynamic Media&ndash;Scene7 on Experience Manager {#provision-new-dms7}

Consider simply starting fresh with a new, provisioned instance of Dynamic Media&ndash;Scene7 on Adobe Experience Manager. In addition to the ingestion and processing of assets by way of Dynamic Media Cloud Service, an Adobe audit of asset usage, workflows, and components is highly recommended. Often, you can replace custom components and workflows by using newer, out-of-the-box features.

## Option 2 - Migrate your existing instance of Dynamic Media&ndash;Hybrid to Dynamic Media&ndash;Scene7 {#process-for-migrating}

| Step | Task | Considerations |
|---|---|---|
| 1 | Clone Dynamic Media&ndash;Hybrid Author instance. | Maintain your existing instance of Dynamic Media&ndash;Hybrid Author for fallback purposes until the remaining steps in this migration process are successfully completed. |
| 2 | Start cloned Author instance in Dynamic Media&ndash;Scene7 mode. |  |
| 3 | In Adobe Experience Manager Cloud Services, configure Dynamic Media with Dynamic Media&ndash;Scene7 credentials. | Adobe must approve the Dynamic Media&ndash;Scene7 provisioning. As such, you have concurrent Dynamic MediaM&ndash;Hybrid and Dynamic Media&ndash;Scene7 environments which are supported by Adobe, but for a limited time only. |
| 4 | Create Migration bundle so you can ingest assets as needed.<br>Delete the local PTIFFs that were created during initial ingestion into Dynamic Media&ndash;Hybrid. | If all assets are currently available in your Dynamic Media&ndash;Hybrid instance, a clone of that already includes them all. Therefore, no bundle is needed. |
| 5 | Run asset update workflow so you can synchronize assets to Dynamic Media Cloud Service. | Adobe recommends that you perform the update workflow in batches to allow for compaction. |
| 6 | Migrate viewer, image, and video presets. |  |
| 7 | Go through each Web Content Management-referenced assets and update their associated URLs. |  |
| 8| Migrate any custom workflows that you want to support the new Dynamic Media&ndash;Scene7 mode (manual updates). |  |
| 9 | Verify your Web Content Management upload and configuration. |  |
| 10 | Following verification, get an approval to disable Dynamic Media&ndash;Hybrid Author (maintain as a fallback). |  |
| 11 | Delete the Dynamic Media&ndash;Hybrid Author instance after approximately one month of successful Dynamic Media&ndash;Scene7 use. |  |

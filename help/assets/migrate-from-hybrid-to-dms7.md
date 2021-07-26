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
---
# About moving from Dynamic Media&ndash;Hybrid to Dynamic Media&ndash;Scene7 {#about-migrating}

Dynamic Media&ndash;Hybrid is an older version of Dynamic Media integration with Adobe Experience Manager. The Hybrid version was first introduced in AEM (Adobe Experience Manager) 6.1. While Adobe continues to support Hybrid mode, it is not the preferred mode (Dynamic Media&ndash;Scene7 is the preferred mode). It also does not support new features such as Smart Crop and panoramic images. Whereas Dynamic Media&ndash;Scene7 does.

Additional key differences between Dynamic Media&ndash;Hybrid and Dynamic Media&ndash;Scene7 include the following:

* Structure of URLs.
* Ingestion of videos.
* Creation and storage of image renditions.
* Cloud configuration and credentials (provisioning). 

Two options are available when you move from Dynamic Media&ndash;Hybrid to Dynamic Media&ndash;Scene7. The first option is to simply provision a new instance of Dynamic Media&ndash;Scene7 on AEM. The second option is to migrate your existing instance of Dynamic Media&ndash;Hybrid to Dynamic Media&ndash;Scene7. This option outlines-in table form below-the steps and considerations for you to make during the move.

>[!IMPORTANT]
>
>Adobe recommends that you do not migrate a Dynamic Media&ndash;Hybrid implemention to Dynamic Media&ndash;Scene7 on live production instances.

## Option 1 - Provisioning a new instance of Dynamic Media&ndash;Scene7 on AEM {#provision-new-dms7}

Consider simply starting fresh with a new, provisioned instance of Dynamic Media&ndash;Scene7 on Adobe Experience Manager. In addition to the ingestion and processing of assets by way of Dynamic Media Cloud Service, an Adobe audit of asset usage, workflows, and components is highly recommended. In many cases, custom components and workflows can be replaced by newer, out-of-the-box features.

## Option 2 - Migrating your existing instance of Dynamic Media&ndash;Hybrid to Dynamic Media&ndash;Scene7 {#process-for-migrating}

| Step | Task | Considerations |
|---|---|---|
| 1 | Clone Dynamic Media&ndash;Hybrid Author instance. | You should maintain your existing instance of Dynamic Media&ndash;Hybrid Author for fallback purposes until the remaining steps in this migration process are successfully completed. |
| 2 | Start cloned Author instance in Dynamic Media&ndash;Scene7 mode. |  |
| 3 | In Adobe Experience Manager Cloud Services, configure Dynamic Media with Dynamic Media&ndash;Scene7 credentials. | Adobe needs to approve the Dynamic Media&ndash;Scene7 provisioning. You will have concurrent Dynamic MediaM&ndash;Hybrid and Dynamic Media&ndash;Scene7 environments which will be supported for a limited time. |
| 4 | Create Migration bundle to ingest assets as needed.<br>Delete the local PTIFFs that were created during initial ingestion into Dynamic Media&ndash;Hybrid. | If all assets are currently available in your Dynamic Media&ndash;Hybrid instance, a clone of that already includes them all. Therefore, no bundle is needed. |
| 5 | Run asset update workflow to synchronize assets to Dynamic Media Cloud Service. | Adobe recommends that the update workflow be done in batches to allow for compaction. |
| 6 | Migrate viewer, image, and video presets. |  |
| 7 | Go through each Web Content Management-referenced assets and update their associated URLs. |  |
| 8| Migrate any custom workflows to support the new Dynamic Media&ndash;Scene7 mode (manual updates). |  |
| 9 | Verify your Web Content Management upload and configuration. |  |
| 10 | Following verification, get an approval to disable Dynamic Media&ndash;Hybrid Author (maintain as a fall back). |  |
| 11 | Delete the Dynamic Media&ndash;Hybrid Author instance after approximately one month of successful Dynamic Media&ndash;Scene7 use. |  |

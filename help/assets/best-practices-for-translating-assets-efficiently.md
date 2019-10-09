---
title: Best Practices for Translating Assets Efficiently
seo-title: Best Practices for Translating Assets Efficiently
description: Best practices for efficient management of assets to synchronize various translated versions and to streamline translation workflows.
seo-description: Best practices for efficient management of assets to synchronize various translated versions and to streamline translation workflows.
uuid: ca0ff03a-62dc-4406-85d9-0c2f74af306d
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: administering
content-type: reference
discoiquuid: 2480421b-87b1-42d0-ab5f-e81947ffcd65
---

# Best practices to translate assets efficiently {#best-practices-for-translating-assets-efficiently}

Adobe Experience Manager (AEM) Assets supports multilingual workflows to translate binaries, metadata, and tags for digital assets into multiple locales and to manage the translated assets. For details, see [Multilingual Assets](multilingual-assets.md).

For efficient management of assets to ensure that different translated versions stay synchronized, create [language copies](preparing-assets-for-translation.md) of assets before running translation workflows.

A language copy of an asset or a group of assets is a language sibling (or a version of the asset(s) in a cognate language) with a similar content hierarchy.

Each language copy is an independent asset. Therefore, translating assets into multiple locales can drastically increase the size of the CRX repository. For example, translating assets with a combined size of 10 GB into two languages can increase the repository size by approximately 20 GB (10 GB for each language).

Asset binaries occupy much larger storage space compared to metadata and tags. Therefore, if translating metadata and tags only serves your purpose, omit to translate the binaries. You can retain the original copy of the binaries in the repository for association with metadata and tags translated to different locales. Maintaining a single copy of binaries, instead of multiple translated versions, minimizes the impact on repository size.

File Data Store and Amazon S3 Data Store provide a storage infrastructure that is best suited for these scenarios. These storage repositories store a single copy of asset binaries (including renditions) that can be shared by metadata and tags in multiple locales. Therefore, creating asset language copies and translating metadata and tags does not affect repository size.

You can also make a few configuration changes to a couple of workflows and the translation integration framework to further streamline the process.

1. Do one of the following:

    * [Set up File Data Store](/help/sites-deploying/data-store-config.md)
    * [Set up Amazon S3 Data Store](/help/sites-deploying/data-store-config.md)

1. Disable the [DAM MetaData Writeback](/help/sites-administering/workflow-offloader.md#disable-offloading) workflow

   As the name suggests, the *DAM Metadata Writeback* workflow rewrites the metadata to the binary file. Because the metadata changes after translation, writing it back to the binary file generates a different binary for a language copy.

   >[!NOTE]
   >
   >Disabling the *DAM MetaData Writeback* workflow turns off XMP metadata write-back on asset binaries. Consequently, future metadata changes are no longer be saved within the assets. Evaluate the consequences before disabling this workflow.

1. Enable the *Set last modified date* workflow.

   The *DAM MetaData Writeback* workflow configures the last modified date for an asset. Because you disable this workflow in step 2, AEM Assets is no longer able to keep the last modified date of assets up-to-date. Therefore, enable the *Set last modified date* workflow to ensure that last modified dates of assets are up-to-date. Assets with outdated last modified dates can cause errors.

1. [Configure the translation integration framework](/help/sites-administering/tc-tic.md) to stop translating asset binaries. Unselect the “Translate Assets" option under the Assets tab to stop the translation of Asset binaries.
1. Translate asset metadata/tags using [Multilingual Asset workflows](multilingual-assets.md).


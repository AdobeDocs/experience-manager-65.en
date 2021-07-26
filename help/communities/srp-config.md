---
title: Storage Configuration
seo-title: Storage Configuration
description: How to access the Storage Configuration Console
seo-description: How to access the Storage Configuration Console
uuid: 6a5a71d5-6aaa-4635-8852-4dae33c497a9
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
discoiquuid: 71fac7e9-814a-48b5-b816-9bdcb2a05190
role: Admin
exl-id: 67de7e26-3f93-4034-9e3a-5c127f7447bc
---
# Storage Configuration {#storage-configuration}

Storage configuration is the means of identifying the storage chosen for community content, also known as user generated content (UGC).

This setting informs the AEM Communities code as to which implementation of the storage resource provider (SRP) is to be used when accessing UGC and must reflect the topology established when AEM was deployed.

For a discussion of storage options and deployment topologies, visit:

* [Community Content Store](working-with-srp.md)
* [Recommended Topologies](topologies.md)

## Storage Configuration Console {#storage-configuration-console}

![jsrp-configuration](assets/jsrp-configuration.png)

In the author environment, to reach the storage configuration console.

* From global navigation, select **[!UICONTROL Tools]** > **[!UICONTROL Communities]** > **[!UICONTROL Storage Configuration]**

To select a storage option other than the default JCR:

* Select an option
* Configure appropriately

  * See details for [selecting MSRP](msrp.md#select-msrp)
  * See details for [selecting DSRP](dsrp.md#select-dsrp)
  * See details for [selecting ASRP](asrp.md#select-asrp)

* Select **[!UICONTROL Submit]**.

### About JCR Storage {#about-jcr-storage}

Be aware that if no selection is made, the default is the AEM repository, JCR.

JCR is *not* a common store shared by the author and publish environments. Community content will be visible only from the author or publish environment in which it was created.

Visit [JCR Store](jsrp.md) for additional information.

>[!NOTE]
>
>The absence of the node `srpc` under `/etc/socialconfig` indicates the default [JCR store](jsrp.md).

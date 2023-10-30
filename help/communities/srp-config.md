---
title: Storage Configuration
description: Learn about the Storage Configuration console as a means of identifying the storage chosen for community content, also known as user-generated content.
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
role: Admin
exl-id: 67de7e26-3f93-4034-9e3a-5c127f7447bc
---
# Storage Configuration {#storage-configuration}

Storage configuration is the means of identifying the storage chosen for community content, also known as user-generated content (UGC).

This setting informs the AEM Communities code as to which implementation of the storage resource provider (SRP) is used when accessing UGC. It must reflect the topology established when Adobe Experience Manager (AEM) was deployed.

For a discussion of storage options and deployment topologies, visit:

* [Community Content Store](working-with-srp.md)
* [Recommended Topologies](topologies.md)

## Storage Configuration Console {#storage-configuration-console}

![jsrp-configuration](assets/jsrp-configuration.png)

In the Author environment, to reach the storage configuration console.

* From global navigation, select **[!UICONTROL Tools]** > **[!UICONTROL Communities]** > **[!UICONTROL Storage Configuration]**

To select a storage option other than the default JCR:

* Select an option
* Configure appropriately

  * See details for [selecting MSRP](msrp.md#select-msrp)
  * See details for [selecting DSRP](dsrp.md#select-dsrp)
  * See details for [selecting ASRP](asrp.md#select-asrp)

* Select **[!UICONTROL Submit]**.

### About JCR Storage {#about-jcr-storage}

If no selection is made, the default is the AEM repository, JCR.

JCR is *not* a common store shared by the Author and Publish environments. Community content is visible only from the Author or Publish environment in which it was created.

Visit [JCR Store](jsrp.md) for additional information.

>[!NOTE]
>
>The absence of the node `srpc` under `/etc/socialconfig` indicates the default [JCR store](jsrp.md).

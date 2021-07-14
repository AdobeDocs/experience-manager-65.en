---
title: JSRP - JCR Storage Resource Provider
seo-title: JSRP - JCR Storage Resource Provider
description: JSRP is generally best suited for demonstration or development environments of one publish instance and one author instance
seo-description: JSRP is generally best suited for demonstration or development environments of one publish instance and one author instance
uuid: 358a43c1-4137-4300-8443-c0d7166968ad
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
discoiquuid: f5316a73-84e2-4a18-98c1-a384eeaa77cf
role: Admin
exl-id: 873e013c-a2da-4b37-b0e3-56bdf240004a
---
# JSRP - JCR Storage Resource Provider {#jsrp-jcr-storage-resource-provider}

## About JSRP {#about-jsrp}

When AEM Communities uses JSRP as its storage option (the default), community content is stored in JCR and user generated content (UGC) is accessible only from the author or publish instance to which it was posted.

Because of the simplicity of deployment, JSRP is generally best suited for demonstration or development environments of one publish instance and one author instance.

See also [Characteristics of SRP Options](working-with-srp.md#characteristics-of-srp-options) and [Recommended Topologies](topologies.md).

## Configuration {#configuration}

### Select JSRP {#select-jsrp}

By default, JSRP is the storage option for UGC.

The [Storage Configuration console](srp-config.md) allows for the selection of the default storage configuration, which identifies which implementation of SRP to use.

In the author environment, to reach the Storage Configuration console

* From global navigation: **[!UICONTROL Tools]** > **[!UICONTROL Communities]** > **[!UICONTROL Storage Configuration]**

* Select **[!UICONTROL JCR Storage Resource Provider (JSRP)]**

* Select **[!UICONTROL Submit]**

![jsrp-configuration](assets/jsrp-configuration.png)

### Publishing the Configuration {#publishing-the-configuration}

While JSRP is the default configuration, to ensure the identical configuration is set in the publish environment:

* From global navigation: **[!UICONTROL Tools]** > **[!UICONTROL Deployment]** > **[!UICONTROL Replication]**
* Select **[!UICONTROL Activate Tree]** > **[!UICONTROL Start Path]**:

  * Browse to `/conf/global/settings/community/srpc/`

* Select **[!UICONTROL Activate]**

## Managing User Data {#managing-user-data}

For information regarding *users*, *user profiles* and *user groups*, often entered in the publish environment, visit:

* [User Synchronization](sync.md)
* [Managing Users and User Groups](users.md)

## Troubleshooting {#troubleshooting}

### UGC Not Visible in JCR {#ugc-not-visible-in-jcr}

Make sure JSRP has been configured to be the default provider by checking the configuration of the storage option. By default, the storage resource provider is JSRP.

On all author and publish AEM instances, revisit the Storage Configuration console or check the AEM repository:

* In JCR, if [/conf/global/settings/community](http://localhost:4502/crx/de/index.jsp#/conf/global/settings/community)

  * Does not contain an [srpc](http://localhost:4502/crx/de/index.jsp#/conf/global/settings/community/srpc) node, it means the storage provider is JSRP.
  * If the srpc node exists and contains node [defaultconfiguration](http://localhost:4502/crx/de/index.jsp#/conf/global/settings/community/srpc/defaultconfiguration), the defaultconfiguration's properties should define JSRP to be the default provider.

### UGC Not Visible on Author Instance {#ugc-not-visible-on-author-instance}

This is not a bug. A characteristic of JSRP is that community content entered in the publish environment will only be visible in the publish environment.

### UGC Not Visible on Publish Instance {#ugc-not-visible-on-publish-instance}

If a single publish instance or if a publish cluster is deployed, then follow instructions for [UGC Not Visible in JCR](#ugc-not-visible-in-jcr).

If a publish farm is deployed, a characteristic of JSRP is that community content will only be visible on the publish instance to which it was posted.

For UGC to be visible from any publish instance, a publish cluster is required.

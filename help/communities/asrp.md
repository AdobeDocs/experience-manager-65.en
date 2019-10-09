---
title: ASRP - Adobe Storage Resource Provider
seo-title: ASRP - Adobe Storage Resource Provider
description: Set up AEM Communities to use a relational database as its common store
seo-description: Set up AEM Communities to use a relational database as its common store
uuid: 29826b44-633d-4586-8553-cd87ebe269a2
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: administering
content-type: reference
discoiquuid: 86349e4d-29ff-4baa-9fcd-c0ab1f0753e9
---

# ASRP - Adobe Storage Resource Provider {#asrp-adobe-storage-resource-provider}

## About ASRP {#about-asrp}

When AEM Communities is configured to use ASRP as its common store, user generated content (UGC) is accessible from all author and publish instances without the need for synchronization nor replication.

See also [Characteristics of SRP Options](working-with-srp.md#characteristics-of-srp-options) and [Recommended Topologies](topologies.md).

## Requirements {#requirements}

An additional license is required for the use of ASRP.

To configure your AEM Communities site to use ASRP for UGC, contact your account representative for:

* Data Center URL (address of the ASRP endpoint)
* Consumer Key
* Secret Key
* Report Suite ID(s)

The consumer and secret keys are shared across all report suites for a company. There is one report suite per tenant.

## Configuration {#configuration}

### Select ASRP {#select-asrp}

The [Storage Configuration console](srp-config.md) allows for the selection of the default storage configuration, which identifies which implementation of SRP to use.

**On author**:

* From global navigation: **[!UICONTROL Tools > Communities > Storage Configuration]**

![chlimage_1-310](assets/chlimage_1-310.png)

* Select **[!UICONTROL Adobe Storage Resource Provider (ASRP)]**
* The following information comes from the provisioning process

    * **[!UICONTROL Data Center URL]** 

      Pull-down to select the production data center identified by your account representative

    * **[!UICONTROL Default Report Suite]** 

      Enter the name of the default report suite

    * **[!UICONTROL Consumer Key]** 

      Enter the consumer key

    * **[!UICONTROL Secret]** 
    
      Enter the secret key

* Select **[!UICONTROL Submit]**

Prepare the publish instances:

* [Replicate the crypto key](#replicate-the-crypto-key)
* [Replicate the configuration](#publishing-the-configuration)

After submitting the configuration, test the connection:

* Select **[!UICONTROL Test Config]** 
  for each author and publish instance, test the connection to the data center from the Storage Configuration console

* Finally, ensure that the site URLs for profile data are routable from the Data Center by [externalizing links](#externalize-links).

### Replicate the Crypto Key {#replicate-the-crypto-key}

The Consumer Key and Secret Key are encrypted. In order for the keys to be encrypted/decrypted properly, the master Granite Crypto key must be the same on all AEM instances.

Follow the instructions at [Replicate the Crypto Key](deploy-communities.md#replicate-the-crypto-key).

### Externalize Links {#externalize-links}

For correct profile and profile image links, be sure to properly [Configure the Link Externalizer](../../help/sites-developing/externalizer.md).

Be sure to set the domains to be URLs that are routable from the Data Center URL (ASRP endpoint).

### Time Synchronization {#time-synchronization}

In order for authentication with the ASRP endpoint to succeed, the machines running your hosted AEM Communities must be time synchronized, such as with the [Network Time Protocol (NTP)](https://www.ntp.org/).

### Publishing the Configuration {#publishing-the-configuration}

ASRP must be identified as the common store on all author and publish instances.

To make the identical configuration available in the publish environment:

* **On author**:

    * Navigate from main menu to **[!UICONTROL Tools > Operations > Replication]**
    * Select **[!UICONTROL Activate Tree]**
    * **[!UICONTROL Start Path]**:

        * Browse to `/etc/socialconfig/srpc/`

    * Uncheck **[!UICONTROL Only Modified]**
    * Select **[!UICONTROL Activate]**

## Upgrading from AEM 6.0 {#upgrading-from-aem}

>[!CAUTION]
>
>If you enable ASRP on a published community site, any UGC already stored in [JCR](jsrp.md) will no longer be visible as there is no synchronization of data between on-premise storage and cloud storage.

**`AEM Communities Extension`** was previously introduced in AEM 6.0 social communities as a cloud service. As of AEM 6.1 Communities, no cloud configuration is necessary, simply select ASRP from the [storage configuration console](srp-config.md).

Due to the new storage structure, it is necessary to follow the [upgrade](upgrade.md#adobe-cloud-storage) instructions when upgrading from social communities to Communities.

## Managing User Data {#managing-user-data}

For information regarding *users*, *user profiles* and *user groups*, often entered in the publish environment, visit

* [User Synchronization](sync.md)
* [Managing Users and User Groups](users.md)

## Troubleshooting {#troubleshooting}

### UGC Disappears after Upgrade {#ugc-disappears-after-upgrade}

If upgrading from an exisitng AEM 6.0 social community site, be sure to follow the [upgrade instructions](upgrade.md#adobe-cloud-storage), else UGC will *appear* to be lost.

### Authentication Errors {#authentication-errors}

If receiving authentication errors against the Data Center URL, and the AEM error.log contains messages about stale timestamps, then verify that time synchronization is happening.

It is recommended to use a tool such as the [Network Time Protocol (NTP)](https://www.ntp.org/) to time synchronize all AEM author and publish servers.

### New Content Does Not Appear in Searches {#new-content-does-not-appear-in-searches}

The Adobe cloud storage infrastructure uses *eventual consistency* to help achieve its scaling and performance goals. For this reason, new content is not instantly available and it may take several seconds for it to appear in search results.

While the interval affecting eventual consistency is monitored, please contact your account representative if it takes longer than a few seconds for new content to appear in searches.

### UGC Not Visible in ASRP {#ugc-not-visible-in-asrp}

Make sure ASRP has been configured to be the default provider by checking the configuration of the storage option. By default, the storage resource provider is JSRP, not ASRP.

On all author and publish AEM instances, revisit the Storage Configuration console or check the AEM repository:

* In JCR, if [/etc/socialconfig](http://localhost:4502/crx/de/index.jsp#/etc/socialconfig/)

    * Does not contain an [srpc](http://localhost:4502/crx/de/index.jsp#/etc/socialconfig/srpc) node, it means the storage provider is JSRP
    * If the srpc node exists and contains node [defaultconfiguration](http://localhost:4502/crx/de/index.jsp#/etc/socialconfig/srpc/defaultconfiguration), the defaultconfiguration's properties should define ASRP to be the default provider


---
title: Recommended Topologies for Communities
description: How to approach the handling of user-generated content (UGC)
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
content-type: reference
topic-tags: deploying
exl-id: b6658330-d862-44e3-aac0-824fb91cd087
---
# Recommended Topologies for Communities {#recommended-topologies-for-communities}

As of AEM Communities 6.1, a unique approach has been adopted for handling user generated content (UGC) submitted by site visitors (members) from the publish environment.

This approach is fundamentally different from the way the AEM platform handles site content that is generally managed from the author environment.

The AEM platform uses a node store that replicates site content from author to publish, while AEM Communities uses a single, common store for UGC that is never replicated.

For the common UGC store, it is necessary to choose a [storage resource provider (SRP)](working-with-srp.md). The recommended choices are:

* [DSRP - Relational Database Storage Resource Provider](dsrp.md)
* [MSRP - MongoDB Storage Resource Provider](msrp.md)
* [ASRP - Adobe Storage Resource Provider](asrp.md)

One other SRP option, [JSRP - JCR Storage Resource Provider](jsrp.md), does not support a common UGC store for the author and publish environments to both access.

Requiring a common store results in the following recommended topologies.

>[!NOTE]
>
>For AEM Communities, [UGC is never replicated](working-with-srp.md#ugc-never-replicated).
>
>When the deployment does not include a [common store](working-with-srp.md), UGC will be visible only on the AEM publish or author instance on which it was entered.
>

>[!NOTE]
>
>For more information on the AEM platform, see [Recommended Deployments](../../help/sites-deploying/recommended-deploys.md) and [Introduction to the AEM Platform](../../help/sites-deploying/data-store-config.md).

## For Production {#for-production}

Establishing a common store for UGC is essential, and thus the underlying deployment is contingent on its ability to support a common store.

Two examples:

1. If the expected volume of UGC is high and a local MongoDB instance is possible, then the choice would be [MSRP](msrp.md).

1. For optimal performance for page content, the choice of a [publish farm](../../help/sites-deploying/recommended-deploys.md#tarmk-farm) and [ASRP](asrp.md) would provide optimal scaling of UGC with relatively straightforward operations.

For both, the deployment may be based on any OAK microkernel.

To choose the appropriate common store, carefully consider the unique [characteristics](working-with-srp.md#characteristics-of-srp-options) of each.

For more details on Oak microkernals, visit [Recommended Deployments](../../help/sites-deploying/recommended-deploys.md).

### TarMK Publish Farm {#tarmk-publish-farm}

When the topology is a publish farm, relevant topics of importance are:

* [User Synchronization](sync.md)
* [Managing Users and User Groups](users.md)

### Recommended: DSRP, MSRP or ASRP {#recommended-dsrp-msrp-or-asrp}

| MicroKernel | SITE CONTENTREPOSITORY | USER GENERATED CONTENTREPOSITORY | STORAGE RESOURCE PROVIDER | COMMON STORE  |
|-------------|------------------------|----------------------------------|---------------------------|---------------|
| any         | JCR                    | MySQL                            | DSRP                      | Yes           |
| any         | JCR                    | MongoDB                          | MSRP                      | Yes           |
| any         | JCR                    | Adobe on-demandstorage           | ASRP                      | Yes           |

### JSRP {#jsrp}


| Deployment           | SITE CONTENTREPOSITORY | USER GENERATED CONTENTREPOSITORY | STORAGE RESOURCE PROVIDER | COMMON STORE                    |
|----------------------|------------------------|----------------------------------|---------------------------|---------------------------------|
| TarMK Farm (default) | JCR                    | JCR                              | JSRP                      | No                              |
| Oak Cluster          | JCR                    | JCR                              | JSRP                      | Yesfor publish environment only |

## For Development {#for-development}

For non-production environments, [JSRP](jsrp.md) provides simplicity in setting up a development environment with one author instance and one publish instance.

If choosing [ASRP](asrp.md), [DSRP](dsrp.md) or [MSRP](msrp.md) for production, it is also possible to setup a similar development environment using Adobe on-demand storage or MongoDB. For an example, see [HowTo Setup MongoDB for Demo](demo-mongo.md).

## References {#references}

* [User Synchronization](sync.md)

  Discusses scynchronization of user data among publish farm instances.

* [Managing Users and User Groups](users.md)

  Discusses the roles of users and user groups in the author and publish environments.

* UGC [common store](working-with-srp.md)

  Describes the storage of community content separate from site content.

* [Node Stores and Data Stores](../../help/sites-deploying/data-store-config.md)

  Basically, site content is stored in a node store. For Assets, a data store can be configured to store binary data. For Communities, a common store must be configured to select the SRP.

* [Storage Elements](../../help/sites-deploying/storage-elements-in-aem-6.md)

  Describes the two node storage implementations: Tar and MongoDB.

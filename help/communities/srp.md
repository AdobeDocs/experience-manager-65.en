---
title: Storage Resource Provider Overview
description: Learn how community content, known as user-generated content (UGC), is stored in a simple, common store provided by a storage resource provider (SRP).
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: 5f313274-1a2a-4e83-9289-60a4729b99b4
solution: Experience Manager
feature: Communities
role: Admin
---
# Storage Resource Provider Overview {#storage-resource-provider-overview}

## Introduction {#introduction}

As of Adobe Experience Manager (AEM) Communities 6.1, community content, commonly referred to as user-generated content (UGC), is stored in a single, common store provided by a [storage resource provider](working-with-srp.md) (SRP).

There are several SRP options, all of which access UGC through a new AEM Communities interface, the [SocialResourceProvider API](srp-and-ugc.md) (SRP API), which includes all create, read, update, and delete (CRUD) operations.

All SCF components are implemented using the SRP API, allowing code to be developed without knowledge of either the [underlying topology](topologies.md) or location of UGC.

***The SocialResourceProvider API is available only to licensed customers of AEM Communities.***

>[!NOTE]
>
>**Custom Components**: For licensed customers of AEM Communities, the SRP API is available to developers of custom components for accessing UGC without regard to the underlying topology. See [SRP and UGC Essentials](srp-and-ugc.md).

See also:

* [SRP and UGC Essentials](srp-and-ugc.md) - SRP utility methods and examples.
* [Accessing UGC with SRP](accessing-ugc-with-srp.md) - Coding guidelines.
* [SocialUtils Refactoring](socialutils.md) - Mapping deprecated utility methods to current SRP utility methods.

## About the Repository {#about-the-repository}

To understand SRP, it is helpful to understand the role of the AEM repository (Oak) in an AEM community site.

**Java&trade; Content Repository (JCR)**
This standard defines a data model and application programming interface ([JCR API](https://jackrabbit.apache.org/jcr/jcr-api.html)) for content repositories. It combines characteristics of conventional file systems with those of relational databases, and adds several additional features that content applications often need.

One implementation of JCR is the AEM repository, Oak.

**Apache Jackrabbit Oak**
[Oak](../../help/sites-deploying/platform.md) is an implementation of JCR 2.0 that is a data storage system designed for content-centric applications. It is a type of hierarchical database designed for unstructured and semi-structured data. The repository stores not only the user-facing content but also all code, templates, and internal data used by the application. The UI for accessing content is [CRXDE Lite](../../help/sites-developing/developing-with-crxde-lite.md).

Both JCR and Oak are typically used to refer to the AEM repository.

After developing site content in the private Author environment, it must be copied to the public publish environment. This is often done through an operation called *[replication](deploy-communities.md#replication-agents-on-author)*. This happens under control of the author/developer/administrator.

For UGC, the content is entered by registered site visitors (community members) in the public publish environment. This happens randomly.

For purposes of management and reporting, it is useful to have access to UGC from the private Author environment. With SRP, access to UGC from Author is more consistent and performant as reverse replication from Publish to Author is not necessary.

## About SRP {#about-srp}

When UGC is saved to shared storage, there is a single instance of member content that may, in most deployments, be accessed from both the author and publish environments. Regardless of SRP choice (MSRP, ASRP, JSRP), all must be accessed programmatically with the SRP API.

>[!NOTE]
>
>See [SRP and UGC Essentials](srp-and-ugc.md) for sample code and additional details.
>
>See [Accessing UGC with SRP](accessing-ugc-with-srp.md) for best practices when coding.

### ASRP {#asrp}

If there is ASRP, UGC is not stored in JCR, it is stored in a cloud service hosted and managed by Adobe. UGC stored in ASRP may not be viewed with CRXDE Lite or accessed using the JCR API.

See [ASRP - Adobe Storage Resource Provider](asrp.md).

It is not possible for developers to access the UGC directly.

ASRP uses Adobe cloud for queries.

### MSRP {#msrp}

If there is, MSRP, UGC is not stored in JCR, it is stored in MongoDB. UGC stored in MSRP may not be viewed with CRXDE Lite or accessed using the JCR API.

See [MSRP - MongoDB Storage Resource Provider](msrp.md).

While MSRP is comparable to ASRP, as all AEM server instances are accessing the same UGC, it is possible to use common tools to directly access the UGC stored in MongoDB.

MSRP uses Solr for queries.

### JSRP {#jsrp}

JSRP is the default provider for accessing all UGC on a single AEM instance. It lets you quickly experience AEM Communities 6.1 without the need for setting up MSRP or ASRP.

See [JSRP - JCR Storage Resource Provider](jsrp.md).

If there is JSRP while UGC is stored in JCR, and it is accessible in CRXDE Lite and JCR API, Adobe recommends that you never use JCR API to do so. If you do, future changes may affect custom code.

Further, the repository for the Author and Publish environments is not shared. While a cluster of publish instances results in a shared publish repository, UGC entered on Publish is not visible on Author, hence no ability to manage UGC from author. UGC is only persisted in the AEM repository (JCR) of the instance on which it was entered.

JSRP uses the Oak indexes for queries.

## About Shadow Nodes in JCR {#about-shadow-nodes-in-jcr}

Shadow nodes, which mimic the path to UGC, exist in the local repository to serve two purposes:

1. [Access Control (ACLs](#for-access-control-acls)
1. [Non-Existing Resources (NERs)](#for-non-existing-resources-ners)

Regardless of SRP implementation, the actual UGC is *not* visible at the same location as the shadow node.

### For Access Control (ACLs) {#for-access-control-acls}

Some SRP implementations, such as ASRP and MSRP, store community content in databases which provide no ACL verification. Shadow nodes provide a location in the local repository to which ACLs can be applied.

Using the SRP API, all SRP options perform the same check of the shadow location before all CRUD operations.

The ACL check uses a utility method that returns a path suitable for checking the permissions applied to the resource's UGC.

See [SRP and UGC Essentials](srp-and-ugc.md) for sample code.

### For Non-Existing Resources (NERs) {#for-non-existing-resources-ners}

Some Communities components are includible within a script and thus require a Sling addressable node to support Communities features. [Included components](scf.md#add-or-include-a-communities-component) are referred to as non-existing resources (NERs).

Shadow nodes provide a Sling addressable location in the repository.

>[!CAUTION]
>
>As the shadow node has multiple uses, the presence of a shadow node does *not* imply that the component is a NER.

### Storage Location {#storage-location}

Following is an example of a shadow node, using the [Comments component](http://localhost:4502/content/community-components/en/comments.html) in the [Community Components Guide](components-guide.md):

* The component exists in the local repository at:

  `/content/community-components/en/comments/jcr:content/content/includable/comments`

* The corresponding shadow node exists in the local repository at:

  `/content/usergenerated/content/community-components/en/comments/jcr:content/content/includable/comments`

No UGC is found under the shadow node.

The default behavior is to set up shadow nodes on a publish instance whenever the relevant subtree is referenced for a read or write.

As an example, suppose that the deployment is [MSRP](msrp.md) with a TarMK publish farm.

When a [member](users.md) posts UGC on pub1 (stored in MongoDB), shadow nodes are created in JCR on pub1.

The first time the UGC is read on pub2, if nothing is set up, the default behavior is to create the shadow nodes.

If other than the default behavior is desired, it must be set up on the author instance and rolled forward to all publish instances, which is typically a manual process.

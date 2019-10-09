---
title: AEM to Creative Cloud Folder Sharing Best Practices
seo-title: AEM to Creative Cloud Folder Sharing Best Practices
description: Configure Adobe Experience Manager (AEM) to allow users in AEM Assets to exchange folders with Adobe Creative Cloud (CC) users.
seo-description: Configure Adobe Experience Manager (AEM) to allow users in AEM Assets to exchange folders with Adobe Creative Cloud (CC) users.
uuid: e4c1ab24-9100-4f24-a4fe-bba9001e130c
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: administering
content-type: reference
discoiquuid: 679b173b-0b80-4070-895f-b2cbc3c39183
---

# AEM to Creative Cloud Folder Sharing Best Practices {#aem-to-creative-cloud-folder-sharing-best-practices}

Adobe Experience Manager (AEM) can be configured to allow users in AEM Assets to share folders with Creative Cloud users, so they are available as shared folders in the Creative Cloud Assets service. The feature can be used to exchange files between creative teams and AEM Assets users, especially when the creative users do not have access to the AEM Assets instance (they are not on the enterprise network).

This type of integration can be used in both the use cases, especially when working with users who do not have direct access to AEM Assets:

* Sharing a set of specific Assets from AEM Assets with Creative Cloud Files users (for example, a creative brief and set of approved assets for design work for a new marketing activity)
* Receiving new files from Creative Cloud users.

>[!NOTE]
>
>Before reading this document, you can review the overall [AEM and Creative Cloud integration best practices](aem-cc-integration-best-practices.md) for a higher-level overview of the topic.

## Overview {#overview}

AEM to Creative Cloud folder sharing relies on the server-side sharing of folders and files between AEM Assets and Creative Cloud accounts. Creative professionals, who use the Creative Cloud Desktop app on their desktops, can additionally make the shared folders available directly on their disks using Adobe CreativeSync technology.

The following diagram provides an overview of the integration.

![chlimage_1-406](assets/chlimage_1-406.png)

The integration includes the following elements:

* **AEM Assets server** deployed in the enterprise network (managed services or on-premise): Folder sharing is initiated here.
* **Adobe Marketing Cloud Assets core service**: Acts as an intermediary between AEM and Creative Cloud storage services. Admin of the company using the integration needs to established trust relationship between the Marketing Cloud organization and the AEM Assets instance. They also [define a list of approved Creative Cloud collaborators](https://marketing.adobe.com/resources/help/en_US/mcloud/t_admin_add_cc_user.html), that AEM Assets users can share folders too for additional security.
* **Creative Cloud Assets web services** (storage and Creative Cloud Files web UI): This is where specific Creative Cloud users, with whom an AEM Assets folder was shared, would be able to accept the invitation and see the folder in their Creative Cloud account storage.
* **Creative Cloud Desktop App**: (Optional) Allows for direct access to shared folder/files from creative user’s desktop via sync with Creative Cloud Assets storage.

## Characteristics and limitations {#characteristics-and-limitations}

* **One-way propagation of changes:** File changes are propagated in one direction only - from the system (AEM or Creative Cloud Assets), where the asset was originally created (uploaded). The integration does not provide a fully automated, two-way synchronization between the two systems.

* **Versioning:**

  * AEM only creates versions of an asset on updates if the file originated in AEM and is updated there.
  * Creative Cloud Assets provides its own [versioning feature](https://helpx.adobe.com/creative-cloud/help/versioning-faq.html) that is targeted at Work in Progress updates (basically, stores updates for up to 10 days)

* **Space limitations:** Sizes and volumes of files exchanged is limited by the specific [Creative Cloud Assets quota](https://helpx.adobe.com/creative-cloud/kb/file-storage-quota.html) for creative users (depends on subscription level) and a limitation of 5GB maximum file size. Space is additionally limited by the asset quota that the organization has in Adobe Marketing Cloud Assets core service.

* **Space requirements:** The files in shared folders also need to be physically stored in AEM and then in Creative Cloud account, with a cached copy in Marketing Cloud Assets core service.
* **Networking and bandwidth:** The files in shared folders and all the updates need to be transported over the network between the systems. You should ensure that only relevant files and updates are shared.
* **Folder type**: Sharing an Assets folder of the type `sling:OrderedFolder`, is not supported. If you want to share a folder, when creating it in AEM Assets, do not select the Ordered option.

## Best practices {#best-practices}

Best practices for leveraging the AEM to Creative Cloud folder sharing include:

* **Volume considerations:** AEM/Creative Cloud Folder Sharing should be used to share smaller number of files, for example, relevant to a specific campaign or activity. To share larger sets of assets, like all approved assets in the organization, use other distribution methods (for example, AEM Assets Brand Portal) or AEM desktop app.
* **Avoid sharing deep hierarchies:** The sharing works recursively and does not allow for selective unsharing. Typically, only folders without subfolders, or with a very shallow hierarchy, like 1 subfolder level, should be considered for sharing.
* **Separate folders for one-way sharing:** Separate folders should be used for sharing final assets from AEM Assets to Creative Cloud files, and for sharing creative-ready assets back from Creative Cloud files to AEM Assets. Together with a good naming convention for these folders, it creates an easier-to-understand working environment for AEM Assets and Creative Cloud users alike.
* **Avoid WIP in the shared folder:** Shared folder should not be used for Work in Progress - use a separate folder in Creative Cloud Files to carry out work that requires frequent changes to the file.
* **Start new work outside of shared folder:** New designs (creative files) should be started in the separate WIP folder in Creative Cloud Files, and when they are ready to be shared with AEM Assets users, they should be moved or saved to the shared folder.
* **Simplify sharing structure:** For a more manageable operating set up, think about simplifying the sharing structure. Instead of sharing with all creative users, AEM Assets folders should be shared with team representative(s) only, like a creative director or team manager. The manager on the creative side would receive final assets, decide on work assignments, and then let designers work in their own Creative Cloud accounts on WIP assets. They can use Creative Cloud collaboration features to coordinate the work, and finally select and put assets that are ready to share back to AEM Assets into their creative-ready shared folder.

The following diagram illustrates an example configuration for creating new designs based on existing final assets from AEM Assets.

![chlimage_1-407](assets/chlimage_1-407.png)


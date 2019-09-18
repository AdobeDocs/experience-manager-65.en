---
title: AEM Communities Release Notes
seo-title: AEM Communities
description: Release notes specific to Adobe Experience Manager 6.5 Communities.
seo-description: Release notes specific to Adobe Experience Manager 6.5 Communities.
uuid: c55f95c0-1c01-4320-838f-49eb245b82c0
contentOwner: msm-service
topic-tags: release-notes
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5
discoiquuid: acb3b650-57ca-44cf-916b-cdcddf485607
index: y
internal: n
snippet: y
---

# AEM Communities Release Notes{#aem-communities-release-notes}

Read on for the improvements to AEM Communities since the 6.4 release. To learn about the new features in greater detail, see [AEM 6.5 Communities User Guide](https://helpx.adobe.com/experience-manager/6-4/communities/user-guide.html).

To obtain the latest release, see the [Deploying Communities](https://helpx.adobe.com/in/experience-manager/6-4/communities/using/deploy-communities.html#LatestReleases) section of the documentation.

## Major enhancements {#major-enhancements}

### Enhancements to community engagement {#enhancements-to-community-engagement}

**@Mentions support** 
AEM Communities now allows registered users to tag (mention) other registered members to elicit their attention, in User Generated Content. The tagged (mentioned) members are then notified, with deep link to the corresponding User Generated Content. Users can, however, opt to disable/enable the web and email notifications.

![At mentions support](assets/at-mentions.png)

Community users need not search for their first name, last name, or user name to see if anyone has reached out to them or needs their attention. Moreover, it allows the UGC authors to seek response from specific registered users who can best address the issue and add inputs.

The community administrators need to **Enable Mention **on community components to allow registered users use the functionality on those components.

**Group messaging**

Registered community members can now send direct messages in bulk to groups through a single email composition, instead of sending the same message individually to group members. To allow [group messaging](../../6-5/communities/using/configure-messaging.md), enable both the instances of [Messaging Operations Service](../../6-5/communities/using/messaging.md#group-messaging). 

![Group message](assets/group-messaging.png)

### Enhancements to Bulk Moderation {#enhancements-to-bulk-moderation}

**Custom filters in Bulk Moderation  
** [Custom filters](../../6-5/communities/using/moderation.md#custom-filters) can now be developed and added to Bulk Moderation UI.

A [sample project](https://github.com/Adobe-Marketing-Cloud/aem-communities-extensions/tree/master/aem-communities-moderation-filter) demonstrating filtering through tags is available in [Github](https://github.com/Adobe-Marketing-Cloud/aem-communities-extensions/tree/master/aem-communities-moderation-filter). This project can be used as a base to develop analogous custom filters.

![Custom filters](assets/custom-tag-filter.png)

**List View in Bulk Moderation**

New List View with improved UI has been provided in bulk moderation to display User Generated Content entries.

![Bulk moderation in list view](assets/list-view-moderation.png)

### Enhancements to Site and Group Management {#enhancements-to-site-and-group-management}

**Author side site and group administrators**

Communities, AEM 6.5 onwards, allows decentralized administration (and management) of different community sites and groups/ nested groups. Organizations hosting multiple community sites and nested groups can now select members for administrator roles on Author side at the time of site (and group) creation.

![Site administrator](assets/site-admin.png)

Site Administrators can create a group at any level of hierarchy and become the default administrators. These administrators can later be removed by other group administrators. Group administrators can manage their group G1 and create a subgroup nested under G1.

### Enhancements to enablement {#enhancements-to-enablement}

**SCORM 2017.1 support**

The enablement functionality of AEM 6.5 Communities support Shareable Content Object Reference Model [(SCORM) 2017.1](https://rusticisoftware.com/blog/scorm-engine-2017-released/) engine.

**Keyboard navigation support on enablement components  
**Enablement components (for example Catalog and Course Playing, Assignments, File Library) in AEM Communities support keyboard navigation for improved accessibility.

### Other enhancements {#other-enhancements}

* **Solr 7 support  
  **AEM 6.5 Communities supports Apache Solr 7.0 version of the search platform while setting up MSRP and DSRP.


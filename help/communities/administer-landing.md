---
title: Communities Sites
description: Learn about the fundamentals of Adobe Experience Manager (AEM) Communities for administer's who are already familiar with its basic features.
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
role: Admin
exl-id: e3ffc73e-2bc5-492d-b64b-750cc7d8ab9b
solution: Experience Manager
feature: Communities
---
# Communities Sites {#communities-sites}

This section is for those who administer AEM Communities and assumes familiarity with AEM Communities features.

## Overview {#overview}

For an overview and getting started tutorials, visit:

* [AEM Communities Overview](overview.md)
* [Getting Started with AEM Communities](getting-started.md)

## Administration and Configuration Topics {#administration-and-configuration-topics}

### Communities Site Creation and Management {#communities-site-creation-and-management}

* Communities [consoles](consoles.md)

    * [Sites](sites-console.md)

        * [Groups (subcommunities)](groups.md)

    * [Moderation](moderation.md)
    * [Members and Groups Management](members.md)
    * [Reports](reports.md)

* Communities [*tools*](tools.md):

    * [Site Templates](sites.md)
    * [Group Templates](tools-groups.md)
    * [Community Functions](functions.md)
    * [Storage Configuration](srp-config.md)
    * [Component Guide](components-guide.md)
    * [Badges](badges.md)


### User Generated Content {#user-generated-content}

A major feature of AEM Communities is the generation of user generated content (UGC) by signed in site visitors (members). To learn more about working with UGC visit:

* [Common UGC Store](working-with-srp.md): choice of SRP for shared storage of UGC
* [Moderating UGC](moderate-ugc.md): trusted members may moderate UGC in bulk or in-context
* [Tagging UGC](tag-ugc.md): features may be configured to allow members to tag content
* [Translating UGC](translate-ugc.md): features may be configured to translate all UGC or allow members to translate selected posts
* [Analytics Configuration](analytics.md): enabling Adobe Analytics to report on various metrics regarding member activity

### Community Members {#community-members}

* [Managing Users and User Groups](users.md): details of community members and member groups, including privileged members.
* [Contribution Limits](limits.md): ability to constrain posting by new members.
* [Tunnel Service](deploy-communities.md#tunnel-service-on-author): allows publish-side members and member groups to be accessed from the author environment.
* [Members and Groups consoles](members.md): allows publish-side members and member groups to be created and managed from the author environment.
* [User Synchronization](sync.md): for synchronizing members and member groups across multiple publish instances.
* [Social Log in with Facebook and Twitter](social-login.md): ability for site visitors to become a community member using their Facebook or Twitter credentials.
* [Scoring and Badges](implementing-scoring.md): ability for badges to be assigned to identify roles of a member and for members to earn badges through their participation in the community.
* [Notifications](notifications.md): ability for members to be notified of activity they follow.
* [Subscriptions](subscriptions.md): ability for members to interact with the community using external email.
* [Messaging](messaging.md): ability for members to interact with the community using internal messages.

### Deployment {#deployment}

The deployment section contains information specific to AEM Communities.

The nature of working with community content influences the structure of the deployment:

* [Recommended Topologies for Communities](topologies.md)

It is important to install the most recent Communities release on the AEM platform:

* [Latest Communities Feature Pack](deploy-communities.md#latestfeaturepack)

See the deployment page for other Communities-specific information, such as for [Upgrading](upgrade.md), [Dispatcher](dispatcher.md), and [Replication](deploy-communities.md#replication-agents-on-author).

## Related Communities Documentation {#related-communities-documentation}

* Visit [Deploying Communities](deploy-communities.md) where you can learn about recommended deployments.

* Visit [Developing Communities](communities.md) where you can learn about the social component framework (SCF) and customizing Communities components and features.

* Visit [Authoring Communities Components](author-communities.md) where you can learn how to author with and configure Communities components.

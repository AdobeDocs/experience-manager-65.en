---
title: AEM Communities Overview
seo-title: AEM Communities Overview
description: An overview of AEM Communities features and setup
seo-description: An overview of AEM Communities features and setup
uuid: 14405847-36ae-4958-bdc6-d799ecd05f06
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
discoiquuid: 44374006-f711-4af8-a1fe-f89164f79581
docset: aem65
exl-id: d6243dff-a067-455c-a326-5f451f225efd
---
# AEM Communities Overview {#aem-communities-overview}

Adobe Experience Manager (AEM) Communities provides the ability to quickly create an on-premise community site that has improved performance, improved site management, and encourages the conversion of site visitors to valuable community members.

## Communities Features {#communities-features}

AEM Communities enables the development of a relationship with site visitors, which:

* **Informs** through blogs, Q&A, and event calendars,
* While **gaining insights** through forums, comments, and other community content, often referred to as user generated content (UGC).
* It allows **moderation** by trusted members in the publish environment,
* **Social login** with Twitter and Facebook,
* **Inline translation** of community content,
* **Community groups creation** from the published community site,
* **Scoring** to award badges,
* **File sharing**,
* **Notifications** and **activity streams**,
* Allows **tagging** (@mention) other registered members in User Generated Content, to elicit their attention.

Communities features can be demonstrated using the [AEM Demo Machine](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki) available publicly on GitHub.com or with the new We.Retail reference implementation.

## Community Sites {#community-sites}

A community site is an AEM Site created using a simple wizard that results in a website with many common features pre-wired into the site.

The [site creation wizard](/help/communities/sites-console.md):

* Assembles features of the site, based on the selected [community site template](/help/communities/sites.md) which is:

  * built from [community functions](#community-functions)
  * optional [community groups](#communitygroups) feature

* Uses settings to configure:

  * moderation
  * login
  * translation

* Provides essential features:

  * Responsive design: uses [Twitter Bootstrap themes](https://getbootstrap.com)

  * Login : self-registration, [social login](/help/communities/social-login.md), user profiles

    * Notifications:
      members see events of relevance to them, and user generated content where they are [@mentioned](/help/communities/overview.md#mentionssupport).

    * Messaging: members may send or receive messages within the community site.
    * Search: ability to search within the community site.
    * Language switching: ability to select a language for a [multilingual site](/help/sites-administering/translation.md).

    * Administration: access for authorized members to moderate and manage users within the community site.

* Eliminates many page-level authoring steps:

  * Branding: optional upload of a banner image for display on all pages of the community site
  * Navigation menu: navigation links are provided for the features included in the community site template.

To experience the ease of quickly creating a new community site, visit [Getting Started with AEM Communities](/help/communities/getting-started.md).

## Community Content Persistence {#community-content-persistence}

To improve the performance and synchronization of community content, AEM Communities requires a common store specifically for user generated content (UGC) shared between all AEM (author and publish) instances.

Community content is easily accessed through the storage resource provider (SRP), which provides a layer to separate access from the underlying topology and supports a common store for UGC.

To learn more about community content persistence and recommended deployments see:

* [Community Content Storage](/help/communities/working-with-srp.md), which discusses the available SRP storage options for UGC.
* [Recommended Topologies](/help/communities/topologies.md), which discusses topologies based on use case and SRP choice.
* [Upgrading to AEM 6.5 Communities](/help/communities/upgrade.md), which provides useful information regarding UGC when moving to AEM 6.5.

## Communities Consoles {#communities-consoles}

In the author environment, the global navigation console provides access to the [Communities console](/help/communities/consoles.md), which contains:

* [Sites](/help/communities/sites-console.md) console

  * Site creation
  * Site editing
  * Site management
  * [Community Groups](/help/communities/groups.md) console

* [Moderation](/help/communities/moderation.md) console

  * Common bulk moderation UI for author and publish environments.
  * New filtering criteria.

* [Members and Groups](/help/communities/members.md) management consoles

  * Provides the ability to create and manage publish-side users (members) from the author environment.
  * Provides ability to ban members.
  * Provides the ability to create and manage publish-side user groups (member groups) from the author environment.

* [Reports](/help/communities/reports.md) console

  * Provides the ability to generate reports on assignments, posts and views.

The global tools console provides access to the following Communities tools:

* [Site Templates](/help/communities/tools.md#sitetemplatesconsole) console

  * Create and manage community site templates.

* [Group Templates](/help/communities/tools.md#grouptemplatesconsole) console

  * Create and manage community group templates.

* [Community Functions](/help/communities/tools.md#communityfunctionsconsole) console

  * Create and manage community functions.

* [Storage Configuration](/help/communities/tools.md#storageconfiguratonconsole) console

  * Select and configure the [common store](/help/communities/working-with-srp.md) for the site.

* [Component Guide](/help/communities/components-guide.md)

  * A sample site, [Community Components](https://localhost:4502/editor.html/content/community-components/en.html), that provides a sample of all Communities components with their default configuration and the ability to experiment with them.

## Community Site Templates {#community-site-templates}

Community site creation is based on selection of a community site template to quickly setup a community site that is independent of any sample site.

A community site template, composed of community functions and community group templates, provides the structure for a community site including login, user profiles, messaging, site menu, search, theming, and branding features.

See the [Site Templates console](/help/communities/sites.md).

## Community Functions {#community-functions}

The features expected of a community experience are well known. With AEM Communities, these features are available as building blocks, known as community functions.

Community functions are normal AEM pages includes components wired together into a feature that is easily incorporated into a community site template.

See the [Community Functions console](/help/communities/functions.md).

## Community Groups and Group Templates {#community-groups-and-group-templates}

The community groups feature is the ability for a sub-community to be dynamically created within a community site by authorized users and community members from both the author and publish environments.

From the author environment, community groups (sub-communities) may be created within an existing community site or nested within an existing group, when the structure of the template contains the [Groups function](/help/communities/functions.md#groups-function).

Creating a community group requires the selection of a community group template that provides the design of the community group page(s). When a Groups function is added to a template structure, it is configured to either specify one group template or to provide a choice of templates at the time a new community group is created.

See also:

* [Site Groups console](/help/communities/groups.md) for creating sub-communities in the author environment.
* [Group Templates console](/help/communities/tools-groups.md) for creating site structure for groups.
* [Getting Started with AEM Communities](/help/communities/getting-started.md) for tutorial for quickly creating a community site including nested groups.

## Community Components {#community-components}

The [community components](/help/communities/author-communities.md) from which a community site is built may be used to add Communities features to any AEM Site.

The [community components guide](/help/communities/components-guide.md) is available for interactive exploration of the components.

## Engagement Community {#engagement-community}

An engagement community is a community site focused on engaging customers to inform, solicit feedback, and allow customers to interact as community members.

Features of an engagement community may include:

* Login
* Messaging
* Forums
* Comments
* Reviews
* Ratings
* Voting
* Blogs
* Groups
* Calendars
* Translation
* Moderation
* Notifications
* Scoring and badges
* Analytics reporting

To experience the ease of quickly creating a new engagement community, visit [Getting Started with AEM Communities](/help/communities/getting-started.md).

## AEM Demo Machine {#aem-demo-machine}

The [AEM Demo Machine](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine) manages and runs demos for AEM [Sites](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Scenario%20Sites), [Assets](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Scenario%20Assets), [Communities](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Scenario%20Communities), [Apps](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Scenario%20Apps) and [Forms](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Scenario%20Forms), which often require more setup than simply launching a QuickStart instance. The AEM Demo Machine will setup additional [infrastructure](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Infrastructure) such as MongoDB, Solr, MySQL, FFmpeg and email servers.

The AEM Demo Machine includes:

* A [graphical user interface](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/User%20Interface).
* Apache ANT scripts with configurable [properties](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Properties) and [targets](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Command%20Line).

* Packages to install.

The AEM Demo Machine was tested successfully with CQ 5.5, CQ 5.6.1, AEM 6.0, AEM 6.1, AEM 6.2, AEM 6.3, and AEM 6.4 on Windows, MacOS and Linux.

The AEM Demo Machine requires a valid AEM license.

>[!NOTE]
>
>View a [video introduction](https://www.youtube.com/watch?v=zEE_zkR9fVQ&feature=youtu.be) to the AEM Demo Machine (13:26).

## AEM Communities Documentation {#aem-communities-documentation}

* Visit [Deploying Communities](deploy-communities.md) to learn about recommended deployments.
* Visit [Administering Communities Sites](administer-landing.md) to learn about creating a community site, adding community groups, configuring community site templates, moderating community content, managing members, tagging, notifications, scoring, and badges.
* Visit [Developing Communities](communities.md) to learn about the social component framework (SCF) and customizing Communities components and features.
* Visit [Authoring Communities Components](author-communities.md) to learn how to author with and configure Communities components.

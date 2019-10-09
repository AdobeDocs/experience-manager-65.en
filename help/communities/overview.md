---
title: AEM Communities Overview
seo-title: AEM Communities Overview
description: An overview of AEM Communities features and setup
seo-description: An overview of AEM Communities features and setup
uuid: 6e3ac9d2-ca31-40ea-8cab-b8451074c498
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: administering
content-type: reference
discoiquuid: 418cc919-0ae3-4c6c-8566-7e9a206f02a8
---

# AEM Communities Overview {#aem-communities-overview}

Adobe Experience Manager (AEM) Communities provides the ability to quickly create an on-premise community site that has improved performance, improved site management, and encourages the conversion of site visitors to valuable community members.

Contact your account representative for information regarding licensing of AEM Communities as well as additional licensing for enablement features and Adobe Analytics.

## Communities Features {#communities-features}

AEM Communities enables the development of a relationship with site visitors that informs through blogs, Q&A, and event calendars, while gaining insights through forums, comments, and other community content, often referred to as user generated content (UGC).

Further, AEM Communities allows moderation by trusted members in the publish environment, social login with Twitter and Facebook, inline translation of community content, creation of community groups from the published community site, scoring to award badges, file sharing, notifications and activity streams.

Communities features can be demonstrated using the [AEM Demo Machine](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki) available publicly on GitHub.com or with the new We.Retail reference implementation.

## Community Sites {#community-sites}

A community site is an AEM Site created using a simple wizard that results in a website with many common features pre-wired into the site.

The [site creation wizard](sites-console.md):

* Assembles features of the site, based on the selected [community site template](sites.md) which is
    * Built from [community functions](#community-functions)
    * Optional [community groups](#communitygroups) feature
* Uses settings to configure:
    * Moderation
    * Login
    * Translation
* Provides essential features:
    * Responsive design: Uses [Twitter Bootstrap themes](https://getbootstrap.com)
    * Login: Self-registration, [social login](social-login.md), user profiles
    * Notifications: Members see events of relevance to them
    * Messaging: Members may send or receive messages within the community site
    * Search: Ability to search within the community site
    * Language switching: Ability to select a language for a [multillingual site](../../help/sites-administering/translation.md)
    * Administration: Access for authorized members to moderate and manage users within the community site
* Eliminates many page-level authoring steps:
    * Branding: Optional upload of a banner image for display on all pages of the community site
    * Navigation menu: Navigation links are provided for the features included in the community site template

To experience the ease of quickly creating a new community site, visit [Getting Started with AEM Communities](getting-started.md).

## Community Content Persistence {#community-content-persistence}

To improve the performance and synchronization of community content, AEM Communities requires a common store specifically for user generated content (UGC) shared between all AEM (author and publish) instances.

Community content is easily accessed through the storage resource provider (SRP), which provides a layer to separate access from the underlying topology and supports a common store for UGC.

To learn more about community content persistence and recommended deployments visit:

* [Community Content Storage](working-with-srp.md): discusses the available SRP storage options for UGC
* [Recommended Topologies](topologies.md): discusses topologies based on use case and SRP choice
* [Upgrading to AEM 6.3 Communities](upgrade.md): provides useful information regarding UGC when moving to AEM 6.3.

## Communities Consoles {#communities-consoles}

In the author environment, the global navigation console provides access to the [Communities console](consoles.md), which contains:

* [Sites](sites-console.md) console

    * Site creation
    * Site editing
    * Site management
    * [Community Groups](groups.md) console

* [Moderation](moderation.md) console

    * Common bulk moderation UI for author and publish environments
    * New filtering criteria

* [Members and Groups](members.md) management consoles

    * Provides the ability to create and manage publish-side users (members) from the author environment
    * Provides ability to ban members
    * Provides the ability to create and manage publish-side user groups (member groups) from the author environment

* [Reports](reports.md) console

    * Provides the ability to generate reports on assignments, posts and views

* [Resources](resources.md) console

    * Provides the ability to create enablement resources and learning paths
    * Provides access to reports on enablement resources and learning paths

The global tools console provides access to the following Communities tools:

* [Site Templates](tools.md#sitetemplatesconsole) console

    * Create and manage community site templates

* [Group Templates](tools.md#grouptemplatesconsole) console

    * Create and manage community group templates

* [Community Functions](tools.md#communityfunctionsconsole) console

    * Create and manage community functions

* [Storage Configuration](tools.md#storageconfiguratonconsole) console

    * Select and configure the [common store](working-with-srp.md) for the site

* [Component Guide](components-guide.md)

    * A sample site, [Community Components](http://localhost:4502/editor.html/content/community-components/en.html), that provides a sample of all Communities components with their default configuration and the ability to experiment with them

## Community Site Templates {#community-site-templates}

Community site creation is based on selection of a community site template to quickly setup a community site that is independent of any sample site.

A community site template, composed of community functions and community group templates, provides the structure for a community site including login, user profiles, messaging, site menu, search, theming, and branding features.

See the [Site Templates console](sites.md).

## Community Functions {#community-functions}

The features expected of a community experience are well known. With AEM Communities, these features are available as building blocks, known as community functions.

Community functions are normal AEM pages comprised of components wired together into a feature that is easily incorporated into a sommunity site template.

See the [Community Functions console](functions.md).

## Community Groups and Group Templates {#community-groups-and-group-templates}

The community groups feature is the ability for a sub-community to be dynamically created within a community site by authorized users and community members from both the author and publish environments .

From the author environment, community groups (sub-communities) may be created within an existing community site or nested within an existing group, when the structure of the template contains the [Groups function](functions.md#groups-function).

Creating a community group requires the selection of a community group template that provides the design of the community group page(s). When a Groups function is added to a template structure, it is configured to either specify one group template or to provide a choice of templates at the time a new community group is created.

See also:

* [Site Groups console](groups.md) - creating sub-communities in the author environment
* [Group Templates console](tools-groups.md) - creating site structure for groups
* [Getting Started with AEM Communities](getting-started.md) - tutorial for quickly creating a community site including nested groups

## Community Components {#community-components}

The [community components](author-communities.md) from which a community site is built may be used to add Communities features to any AEM Site.

The [community components guide](components-guide.md) is available for interactive exploration of the components.

## Types of Communities {#types-of-communities}

### Engagement Community {#engagement-community}

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

To experience the ease of quickly creating a new engagement community, visit [Getting Started with AEM Communities](getting-started.md).

### Enablement Community {#enablement-community}

An enablement community is a community site that includes features for online learning.

Features of an enablement community may include:

* All the features of an [engagement community](#engagement-community)
* Ability to assign content and learning resources to members and member groups
* Supports SCORM content, like quizzes and tests
* Tracking of assignments completion
* Access to reporting and analytics
* The ability to have a conversation about a learning resource through forums, messaging, comments and ratings

An enablement community may be created when the [Enablement add-on is configured](enablement.md), which requires additional licensing for use in a production environment. An enablement community site will include the [assignments function](#community-functions).

To experience the ease of creating a new enablement community, visit [Getting Started with AEM Communities for Enablement](getting-started-enablement.md).

## AEM Demo Machine {#aem-demo-machine}

The [AEM Demo Machine](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine) manages and runs demos for AEM [Sites](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Scenario%20Sites), [Assets](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Scenario%20Assets), [Communities](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Scenario%20Communities), [Apps](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Scenario%20Apps) and [Forms](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Scenario%20Forms), which often require more setup than simply launching a QuickStart instance. The AEM Demo Machine will setup additional [infrastructure](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Infrastructure) such as MongoDB, Solr, MySQL, FFmpeg and email servers.

The AEM Demo Machine consists of

* A [graphical user interface](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/User%20Interface)
* Apache ANT scripts with configurable [properties](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Properties) and [targets](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Command%20Line)
* Packages to install
The AEM Demo Machine was tested successfully with CQ 5.5, CQ 5.6.1, AEM 6.0, AEM 6.1, AEM 6.2 and AEM 6.3 on Windows, MacOS and Linux.

The AEM Demo Machine requires a valid AEM license.

>[!NOTE]
>
>View a [video introduction](https://www.youtube.com/watch?v=zEE_zkR9fVQ&feature=youtu.be) to the AEM Demo Machine (13:26).

## AEM Communities Documentation {#aem-communities-documentation}

* Visit [Deploying Communities](deploy-communities.md) to learn about recommended deployments.

* Visit [Administering Communities Sites](administer-landing.md) to learn about creating a community site, adding community groups, configuring community site templates, moderating community content, managing members, tagging, notifications, scoring, and badges.

* Visit [Developing Communities](communities.md) to learn about the social component framework (SCF) and customizing Communities components and features.

* Visit [Authoring Communities Components](author-communities.md) to learn how to author with and configure Communities components.


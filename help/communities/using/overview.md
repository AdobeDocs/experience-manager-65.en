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

---

# AEM Communities Overview{#aem-communities-overview}

Adobe Experience Manager (AEM) Communities provides the ability to quickly create an on-premise community site that has improved performance, improved site management, and encourages the conversion of site visitors to valuable community members.

Contact your account representative for information regarding licensing of AEM Communities as well as additional licensing for enablement features and Adobe Analytics.

## Communities Features {#communities-features}

AEM Communities enables the development of a relationship with site visitors, which:

* **informs** through blogs, Q&A, and event calendars, 
* while **gaining insights **through forums, comments, and other community content, often referred to as user generated content (UGC).
* It allows** moderation **by trusted members in the publish environment, 
* **social login **with Twitter and Facebook, 
* **inline translation** of community content, 
* **community groups creation **from the published community site, 
* **scoring **to award badges, 
* **file sharing**, 
* **notifications **and **activity streams**,

* allows **tagging** (@mention) other registered members in User Generated Content, to elicit their attention.
* Supports **keyboard navigation** on enablement components (for example Catalog and Course Playing, Assignments, File Library) .

Communities features can be demonstrated using the [AEM Demo Machine](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki) available publicly on GitHub.com or with the new We.Retail reference implementation.

## Community Sites {#community-sites}

A community site is an AEM Site created using a simple wizard that results in a website with many common features pre-wired into the site.

The [site creation wizard](../../communities/using/sites-console.md):

* assembles features of the site, based on the selected [community site template](/communities/using/sites.md) which is:

    * built from [community functions](#community-functions)
    * optional [community groups](#communitygroups) feature

* uses settings to configure:

    * moderation
    * login
    * translation

* provides essential features:

    * responsive design:  
      uses [Twitter Bootstrap themes](http://getbootstrap.com)
    
    * login :  
      self-registration, [social login](/communities/using/social-login.md), user profiles
    
    * notifications:  
      members see events of relevance to them, and user generated content where they are [@mentioned](../../communities/using/overview.md#mentionssupport). 
    
    * messaging:  
      members may send or receive messages within the community site
    * search:  
      ability to search within the community site
    * language switching:  
      ability to select a language for a [multilingual site](../../sites/administering/using/translation.md)
    
    * administration:  
      access for authorized members to moderate and manage users within the community site

* eliminates many page-level authoring steps:

    * branding:  
      optional upload of a banner image for display on all pages of the community site
    * navigation menu:  
      navigation links are provided for the features included in the community site template

To experience the ease of quickly creating a new community site, visit [Getting Started with AEM Communities](../../communities/using/getting-started.md).

## Community Content Persistence {#community-content-persistence}

To improve the performance and synchronization of community content, AEM Communities requires a common store specifically for user generated content (UGC) shared between all AEM (author and publish) instances.

Community content is easily accessed through the storage resource provider (SRP), which provides a layer to separate access from the underlying topology and supports a common store for UGC.

To learn more about community content persistence and recommended deployments see:

* [Community Content Storage](../../communities/using/working-with-srp.md), which discusses the available SRP storage options for UGC.
* [Recommended Topologies](/communities/using/topologies.md), which discusses topologies based on use case and SRP choice.
* [Upgrading to AEM 6.5 Communities](../../communities/using/upgrade.md), which provides useful information regarding UGC when moving to AEM 6.5.

## Communities Consoles {#communities-consoles}

In the author environment, the global navigation console provides access to the [Communities console](/communities/using/consoles.md), which contains:

* [Sites](../../communities/using/sites-console.md) console

    * site creation
    * site editing
    * site management
    * [Community Groups](../../communities/using/groups.md) console

* [Moderation](../../communities/using/moderation.md) console

    * common bulk moderation UI for author and publish environments
    * new filtering criteria

* [Members and Groups](/communities/using/members.md) management consoles

    * provides the ability to create and manage publish-side users (members) from the author environment
    * provides ability to ban members
    * provides the ability to create and manage publish-side user groups (member groups) from the author environment

* [Reports](../../communities/using/reports.md) console

    * provides the ability to generate reports on assignments, posts and views

* [Resources](/communities/using/resources.md) console

    * provides the ability to create enablement resources and learning paths
    * provides access to reports on enablement resources and learning paths

The global tools console provides access to the following Communities tools :

* [Site Templates](/communities/using/tools.md#sitetemplatesconsole) console

    * create and manage community site templates

* [Group Templates](/communities/using/tools.md#grouptemplatesconsole) console

    * create and manage community group templates

* [Community Functions](/communities/using/tools.md#communityfunctionsconsole) console

    * create and manage community functions

* [Storage Configuration](/communities/using/tools.md#storageconfiguratonconsole) console

    * select and configure the [common store](../../communities/using/working-with-srp.md) for the site

* [Component Guide](/communities/using/components-guide.md)

    * a sample site, [Community Components](http://localhost:4502/editor.html/content/community-components/en.html), that provides a sample of all Communities components with their default configuration and the ability to experiment with them

## Community Site Templates {#community-site-templates}

Community site creation is based on selection of a community site template to quickly setup a community site that is independent of any sample site.

A community site template, composed of community functions and community group templates, provides the structure for a community site including login, user profiles, messaging, site menu, search, theming, and branding features.

See the [Site Templates console](/communities/using/sites.md).

## Community Functions {#community-functions}

The features expected of a community experience are well known. With AEM Communities, these features are available as building blocks, known as community functions.

Community functions are normal AEM pages includes components wired together into a feature that is easily incorporated into a community site template.

See the [Community Functions console](../../communities/using/functions.md).

## Community Groups and Group Templates {#community-groups-and-group-templates}

The community groups feature is the ability for a sub-community to be dynamically created within a community site by authorized users and community members from both the author and publish environments.

From the author environment, community groups (sub-communities) may be created within an existing community site or nested within an existing group, when the structure of the template contains the [Groups function](../../communities/using/functions.md#groups-function).

Creating a community group requires the selection of a community group template that provides the design of the community group page(s). When a Groups function is added to a template structure, it is configured to either specify one group template or to provide a choice of templates at the time a new community group is created.

See also:

* [Site Groups console](../../communities/using/groups.md) for creating sub-communities in the author environment
* [Group Templates console](../../communities/using/tools-groups.md) for creating site structure for groups
* [Getting Started with AEM Communities](../../communities/using/getting-started.md) for tutorial for quickly creating a community site including nested groups

## Community Components {#community-components}

The [community components](../../communities/using/author-communities.md) from which a community site is built may be used to add Communities features to any AEM Site.

The [community components guide](/communities/using/components-guide.md) is available for interactive exploration of the components.

## Types of Communities {#types-of-communities}

### Engagement Community {#engagement-community}

An engagement community is a community site focused on engaging customers to inform, solicit feedback, and allow customers to interact as community members.

Features of an engagement community may include:

* login
* messaging
* forums
* comments
* reviews
* ratings
* voting
* blogs
* groups
* calendars
* translation
* moderation
* notifications
* scoring and badges
* analytics reporting

To experience the ease of quickly creating a new engagement community, visit [Getting Started with AEM Communities](../../communities/using/getting-started.md).

### Enablement Community {#enablement-community}

An enablement community is a community site that includes features for online learning.

Features of an enablement community may include:

* all the features of an [engagement community](#engagement-community)
* ability to assign content and learning resources to members and member groups
* supports SCORM content, like quizzes and tests
* tracking of assignments completion
* access to reporting and analytics
* the ability to have a conversation about a learning resource through forums, messaging, comments and ratings

An enablement community may be created when the [Enablement add-on is configured](/communities/using/enablement.md), which requires additional licensing for use in a production environment. An enablement community site will include the [assignments function](#community-functions).

To experience the ease of creating a new enablement community, visit [Getting Started with AEM Communities for Enablement](/communities/using/getting-started-enablement.md).

## AEM Demo Machine {#aem-demo-machine}

The [AEM Demo Machine](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine) manages and runs demos for AEM [Sites](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Scenario%20Sites), [Assets](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Scenario%20Assets), [Communities](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Scenario%20Communities), [Apps](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Scenario%20Apps) and [Forms](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Scenario%20Forms), which often require more setup than simply launching a QuickStart instance. The AEM Demo Machine will setup additional [infrastructure](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Infrastructure) such as MongoDB, Solr, MySQL, FFmpeg and email servers.

The AEM Demo Machine includes:

* a [graphical user interface](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/User%20Interface)
* Apache ANT scripts with configurable [properties](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Properties) and [targets](https://github.com/Adobe-Marketing-Cloud/aem-demo-machine/wiki/Command%20Line)

* packages to install

The AEM Demo Machine was tested successfully with CQ 5.5, CQ 5.6.1, AEM 6.0, AEM 6.1, AEM 6.2, AEM 6.3, and AEM 6.4 on Windows, MacOS and Linux.

The AEM Demo Machine requires a valid AEM license.

>[!NOTE]
>
>View a [video introduction](https://www.youtube.com/watch?v=zEE_zkR9fVQ&feature=youtu.be) to the AEM Demo Machine (13:26).

## AEM Communities Documentation {#aem-communities-documentation}

* Visit [Deploying Communities](../../communities/using/deploy-communities.md) to learn about recommended deployments.
* Visit [Administering Communities Sites](/communities/using/administer-landing.md) to learn about creating a community site, adding community groups, configuring community site templates, moderating community content, managing members, tagging, notifications, scoring, and badges.
* Visit [Developing Communities](/communities/using/communities.md) to learn about the social component framework (SCF) and customizing Communities components and features.
* Visit [Authoring Communities Components](../../communities/using/author-communities.md) to learn how to author with and configure Communities components.


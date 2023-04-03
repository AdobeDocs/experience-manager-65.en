---
title: Developing Communities
seo-title: Developing Communities
description: Create and customize community features such as forums, user groups, and more
seo-description: Create and customize community features such as forums, user groups, and more
uuid: 51dc54da-9090-4d36-adf9-72d5479062a5
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: fbfe8097-3c3f-4a05-97ad-1ce526362a26
exl-id: 3ed3768a-1b3c-45a1-a34c-61694cd407d9
---
# Developing Communities  {#developing-communities}

## Overview {#overview}

AEM Communities simplifies the creation and customizaton of community features such as forums, user groups, blogs, Q&A, calendars, comments, reviews, voting, ratings, and assignments. These features result in user generated content (UGC) being entered in the publish environment.

The foundation of a [community site](overview.md#communitiessites) is the [social component framework](scf.md) (SCF). Creation of a community site begins with the selection of a [community site template](sites-console.md) that is composed of [community functions](functions.md).

For an overview and getting started tutorials, visit:

* [AEM Communities Overview](overview.md)
* [Getting Started with AEM Communities](getting-started.md)

>[!NOTE]
> 
>It is highly recommended to keep up-to-date with the [latest releases](deploy-communities.md#latest-releases).

## Recommended Deployments {#recommended-deployments}

* [Community Content Storage](working-with-srp.md): discusses the available SRP choices for a UGC common store
* [Recommended Topologies for Communities](topologies.md): discusses topologies based on use case and SRP choice

## Social Component Framework {#social-component-framework}

* [Social Component Framework](scf.md): overview of framework and APIs.
* [SCF Handlebars Helpers](handlebars-helpers.md): default helpers and how to write custom helpers.
* [Client-side Customization](client-customize.md): customizing code that runs in browser.
* [Server-side Customization](server-customize.md): customizing code that runs on server.
* [Storage Resource Provider (SRP)](srp.md): overview of community content storage.
* [Coding Guidelines](code-guide.md): guidelines, tips & tricks.
* [Community Components guide](components-guide.md): interactive development tool.

## Component, Function and Feature Essentials {#component-function-and-feature-essentials}

AEM Communities components, functions and features provide the building blocks for [community sites](sites-console.md).

* [Component, Function and Feature Essentials](essentials.md)
* [Clientlibs for Communities Components](clientlibs.md)
* [Community Functions](functions.md)
* [Community Group Templates](tools-groups.md)
* [Community Site Templates](sites.md)

## Community Members {#community-members}

* [Managing Users and User Groups](users.md)
* [Social Login with Facebook and Twitter](social-login.md)

## Community Groups {#community-groups}

[Community groups](overview.md#communitygroups) is the concept of allowing community members to form sub-communities within the community site. Creation of a community group may occur in the publish or author environment.

* [Community Group Essentials](essentials-groups.md)
* [Groups Function](functions.md#groups-function)
* [Community Group Templates](tools-groups.md)
* [Managing Users and User Groups](users.md)
* [Community Groups for Authors](creating-groups.md)

## Managing Data {#managing-data}

* [SRP and UGC Essentials](srp-and-ugc.md) - SRP API utility methods and examples
* [Tag Essentials](tag.md) - ability for community members to tag UGC and/or cataloged enablement resources

## Tutorials {#tutorials}

* [Client-side tutorials](tutorials.md#client-side-customization)
* [Server-side tutorials](tutorials.md#server-side-customization)
* [How-To Instructions](tutorials.md#how-to-instructions)

## Troubleshooting {#troubleshooting}

* [Troubleshooting](troubleshooting.md)
* [Known Issues](/help/release-notes/release-notes.md)

## Related Communities Documentation {#related-communities-documentation}

* Visit [Deploying Communities](deploy-communities.md) to learn about recommended deployments and dispatcher configuration.

* Visit [Administering Communities Sites](administer-landing.md) to learn about creating a Community Site, configuring Community Site Templates, moderating community content, managing members, and configuring messaging.

* Visit [Authoring Communities Components](author-communities.md) to learn how to author with and configure Communities components.

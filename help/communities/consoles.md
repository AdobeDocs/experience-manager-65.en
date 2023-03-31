---
title: Communities Consoles
seo-title: Communities Consoles
description: Community Consoles explained
seo-description: Community Consoles explained
uuid: 1c5b2600-9059-4b44-9741-f1b627423d3c
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
discoiquuid: 5fa9ee8b-5893-4ae9-a986-bfdbb00f355f
role: Admin
exl-id: 36f2e3d2-46c7-48a8-a1e9-213f581bd9f3
---
# Communities Consoles {#communities-consoles}

The AEM Communities consoles, available in the author environment from the global navigation panel, provides access to administrative tasks such as:

* [Creating a community site](sites-console.md)
* Adding [groups](groups.md) nested within the site
* Managing [community site templates](sites.md)
* Managing [community members](members.md)
* [Moderating](moderate-ugc.md) user generated content (UGC)
* Create [custom badges](badges.md)
* Configuring the [default storage for UGC](srp-config.md)

When [UGC storage](working-with-srp.md) is configured to be a common store shared by author and publish environments, the [moderation console](moderation.md), available from both author and publish environments, operates on a solitary instance of UGC.

In the author environment, after signing in with administrator privileges, the `Communities` consoles are available from the navigation and tools consoles.

>[!NOTE]
>
>In the publish environment, a [community site](sites-console.md) will display an `Administration` menu item when the signed in member has appropriate privileges.

## Global navigation panel {#global-navigation-panel}

Select the `Adobe Experience Manager` icon in the upper left corner to open the global navigation panel and access to two icons:

* [Navigation console](#navigation-console)
* [Tools console](tools.md)

## Navigation console {#navigation-console}

To access the various Communities consoles, from global navigation select **navigation, Communities**.

![communities](assets/communities.png)

* [Sites](sites-console.md)

  The Sites console is accessible in the author environment for the purpose of creating and managing community sites and its [groups](groups.md).

* [Moderation](moderation.md)

  The Moderation console is for bulk moderation of UGC and in the author environment. A similar bulk moderation console is accessible in the publish environment to community members assigned the role of [community moderator](users.md#publishenvironmentusersandgroups) for one or more community sites.

* [Members, Groups](members.md)

  The Members and Groups consoles are for managing community members and member groups that exist in the publish environment from the author environment.

* [Reports](reports.md)

  The Reports console is where reports on assignments, page views, and posted content (UGC) may be generated when a community site has [enabled Adobe Analytics](sites-console.md#analytics). The console is only available in the author environment.

## Tools Console {#tools-console}

To access [Communities Tools](tools.md) (formerly the administration console), from global navigation: **[!UICONTROL Tools]** > **[!UICONTROL Communities]**

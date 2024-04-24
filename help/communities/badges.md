---
title: Badges Console
description: The Communities Badges console lets you add custom badges that can be displayed for members when earned (awarded) or when they take on a specific role in the community (assigned)
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
docset: aem65
role: Admin
exl-id: 50ed9ec4-ff04-4f9d-aefb-0837542a9455
solution: Experience Manager
feature: Communities
---
# Badges Console {#badges-console}

## About Badges {#about-badges}

The Communities Badges console lets you add custom badges which can be displayed for a member when earned (awarded) or when they take on a specific role in the community (assigned).

### Badge Visibility {#badge-visibility}

Currently, badges that a community member earns, or is assigned, appear along with their name and avatar in the following locations:

* Profiles
* [Forums](/help/communities/forum.md)
* [QnA](/help/communities/working-with-qna.md)
* [Leaderboards](/help/communities/enabling-leaderboard.md)
* [Ideation](/help/communities/ideation-feature.md)

In the author environment, navigate to the Badges console:

* From global navigation: **[!UICONTROL Tools]** > **[!UICONTROL Communities]** > **[!UICONTROL Badges]**

This console displays the badges currently available and from which new badges can be added.

![badges-homepage](assets/badges-homepage.png)

## Create Badge {#create-badge}

A badge is created by uploading a suitably small image (72 dpi with a height ranging from 26-32 pixels) and providing a name. The badge image is stored in the repository at `/libs/settings/community/badging/images` and is automatically replicated to the publish environment.

If the publish environment is a farm of publishers, it is necessary to configure [user sync](/help/communities/sync.md).

![create-badge](assets/create-badge.png)

* **Upload Image**
  
  (*Required*) A badge image with a recommended size of 32 x 32 pixels at 72 dpi in either the JPEG or PNG format.

* **Name**
  
  (*Required*) The badge name. It is the default `Display Name` and the repository node name. If the `Name` is not a valid repository node name, it is modified.

* **Display Name**
  
  (*Optional*) The name to display for the badge in the user interface. Default is the unaltered text entered for the `Name`.

* **Description**
  
  (*Optional*) A description for the badge.

## Additional Information {#additional-information}

For details on setting up scoring and badging rules, see [Scoring and Badges](/help/communities/implementing-scoring.md).

For managing badges for members, see [Members Console](/help/communities/members.md).

---
title: Badges Console
seo-title: Badges Console
description: The Communities Badges console lets you add custom badges that can be displayed for members when earned (awarded) or when they take on a specific role in the community (assigned)
seo-description: The Communities Badges console lets you add custom badges that can be displayed for members when earned (awarded) or when they take on a specific role in the community (assigned)
uuid: 9eeba240-f0d4-4937-baba-8bac0e0b2a36
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: administering
content-type: reference
discoiquuid: 4194278f-5127-4105-b181-60961c7a1def
---

# Badges Console {#badges-console}

## About Badges {#about-badges}

The Communities Badges console provides the ability to add custom badges which can be displayed for a member when earned (awarded) or when they take on a specific role in the community (assigned).

### Badge Visibility {#badge-visibility}

Currently, badges a community member earns or is assigned will appear along with their name and avatar in the following locations:

* Profiles
* [Forums](forum.md)
* [QnA](working-with-qna.md)
* [Leaderboards](enabling-leaderboard.md)
* [Ideation](ideation-feature.md)

In the author environment, to reach the Badges console

* From global navigation: **[!UICONTROL Tools > Communities > Badges]**

This console displays the badges currently available and from which new badges can be added.

![chlimage_1-242](assets/chlimage_1-242.png)

## Create Badge {#create-badge}

A badge is created by uploading a suitably small image (72dpi with a height ranging from 26-32 pixels) and providing a name. The badge image is stored in the repository at `/etc/community/badging/images` and is automatically replicated to the publish environment.

If the publish environment is a farm of publishers, it is necessary to configure [user sync](sync.md).

![chlimage_1-243](assets/chlimage_1-243.png)

* **[!UICONTROL Upload Image]** 

  (*Required*) A badge image with a recommended size of 32 x 32 pixels at 72dpi in either the JPEG or PNG format.

* **[!UICONTROL Name]** 

  (*Required*) The badge name. It is the default `Display Name` as well as the repository node name. If the `Name` is not a valid repository node name, it will be modified.

* **[!UICONTROL Display Name]** 

  (*Optional*) The name to display for the badge in the UI. Default is the unaltered text entered for the `Name`.

* **[!UICONTROL Description]** 

  (*Optional*) A description for the badge.

## Additional Information {#additional-information}

For details on setting up scoring and badging rules, see [Scoring and Badges](implementing-scoring.md).

For managing badges for members, see [Members Console](members.md).

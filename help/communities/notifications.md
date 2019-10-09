---
title: Communities Notifications
seo-title: Communities Notifications
description: AEM Communities has notifications that display events of interest to the signed-in community member
seo-description: AEM Communities has notifications that display events of interest to the signed-in community member
uuid: d6ef12f1-7367-49a5-b891-56800a38b2ab
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: administering
content-type: reference
discoiquuid: 47201e2d-338d-40e0-af82-c681a552807b
---

# Communities Notifications {#communities-notifications}

## Overview {#overview}

AEM Communities provides a notifications section which displays events of interest to the signed in community member.

Notifications are similar to [activities](essentials-activities.md) and [subscriptions](subscriptions.md) as they may result from

* The member posting content
* The member choosing to follow another member
* The member choosing to follow specific topics, articles and other threads of content

What distinguishes notifications from activities and subscriptions is

* A link to the notifications section is always present in a community site's header
    * Activities require the [activity stream function](functions.md#activity-stream-function) to be included in the community site's structure
    * Subscriptions require [configuration of email](email.md)
* The implementation of notifications is through scalable and pluggable channels
    * Activities are only available on the web
    * Subscriptions are only available using email

As of Communities [FP1](deploy-communities.md#latestfeaturepack), the notification channels available are

* The web channel, accessed using the `Notifications` link
* The email channel, available when email is properly configured

Future channels are mobile and desktop.

### Requirements {#requirements}

**Configure Email**

Email must be configured in order for the email channel for notifications to be functional.

For instructions on setting up email, see [Configuring Email](analytics.md).

**Enable Follow**

Components must be configured to enable following. Features that allow following are [blog](blog-feature.md), [forum](forum.md), [QnA](working-with-qna.md), [calendar](calendar.md), [filelibrary](file-library.md), and [comments](comments.md).

Note that

* Components used within community [site templates](sites.md) and [group templates](tools-groups.md) may already be configured to allow following

* Member profiles are already configured to allow other memebers to follow

## Notifications from Following {#notifications-from-following}

![chlimage_1-254](assets/chlimage_1-254.png)

The **Follow **button provides a means to follow entries as activities, subscriptions and/or notifications. Each time the **Follow **button is selected, it is possible to toggle on or off a selection. The `Email Subscriptions` selection is only present when configured.

If any method of following is selected, the text of the button changes to **Following**. For convenience, it is possible to select `Unfollow All` to toggle off all methods.

The **Follow** button will appear

* When viewing another member's profile
* On a main feature page, such as forums, QnA, and blogs
    * Follows all activity for that general feature
* For a specific entry, such as a forum topic, QnA question, or blog article
    * Follows all activity for that specific entry

## Managing Notification Settings {#managing-notification-settings}

By selecting the Notification Settings link from the Notifications page, it is possible for each member to manage how notifications are received.

The web channel is always enabled.

![chlimage_1-255](assets/chlimage_1-255.png)

The email channel, which relies on proper [configuration of email](email.md), provides the same settings as for the web channel.

The email channel is off by default.

![chlimage_1-256](assets/chlimage_1-256.png)

It may be turned on by a member, but still depends on email being configured.

![chlimage_1-257](assets/chlimage_1-257.png)

## Viewing Notifications {#viewing-notifications}

### Web Notifications {#web-notifications}

A [wizard created community site](sites-console.md) now includes a link to the `Notifications` feature in the site's header bar above the banner. Unlike messages, notifications are created for every community site, while messages must be enabled during the site creation process.

When visiting the published site, selecting the `Notifications` link will display all notifications for the member.

![chlimage_1-258](assets/chlimage_1-258.png)

### Email Notifications {#email-notifications}

When the email channel is enabled, the member receives an email which contains a link to the content on the web.

![chlimage_1-259](assets/chlimage_1-259.png)


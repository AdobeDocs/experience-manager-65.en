---
title: Communities Notifications
seo-title: Communities Notifications
description: AEM Communities has notifications that display events of interest to the signed-in community member
seo-description: AEM Communities has notifications that display events of interest to the signed-in community member
uuid: 2f5ea4b5-7308-414e-a3f8-2e8aa76b1ef4
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
discoiquuid: ab9088b7-a691-4153-ac82-1e8c0a19ed5d
docset: aem65

role: Admin
exl-id: cadb62c9-210d-4204-8abc-d0cf70960392
---
# Communities Notifications {#communities-notifications}

## Overview {#overview}

AEM Communities provides a notifications section which displays events of interest to the signed in community member.

Notifications are similar to [activities](/help/communities/essentials-activities.md) and [subscriptions](/help/communities/subscriptions.md) as they may result from:

* The member posting content.
* The member choosing to follow another member.
* The member choosing to follow specific topics, articles and other threads of content.
* The member tagging (@mention) another community member in a user generated content.

What distinguishes notifications from activities and subscriptions is:

* A link to the notifications section is always present in a community site's header:

  * Activities require the [activity stream function](/help/communities/functions.md#activity-stream-function) to be included in the community site's structure.
  * Subscriptions require [configuration of email](/help/communities/email.md).

* The implementation of notifications is through scalable and pluggable channels:

  * Activities are only available on the web.
  * Subscriptions are only available using email.

As of Communities [FP1](/help/communities/deploy-communities.md#latestfeaturepack), the notification channels available are:

* The web channel, accessed using the `Notifications` link.
* The email channel, available when email is properly configured.

Future channels are mobile and desktop.

### Requirements {#requirements}

**Configure Email**

Email must be configured in order for the email channel for notifications to be functional.

For instructions on setting up email, see [Configuring Email](/help/communities/analytics.md).

**Enable Follow**

Components must be configured to enable following. Features that allow following are [blog](/help/communities/blog-feature.md), [forum](/help/communities/forum.md), [QnA](/help/communities/working-with-qna.md), [calendar](/help/communities/calendar.md), [filelibrary](/help/communities/file-library.md), and [comments](/help/communities/comments.md).

**Note**:

* Components used within community [site templates](/help/communities/sites.md) and [group templates](/help/communities/tools-groups.md) may already be configured to follow.

* Member profiles are already configured to allow other memebers to follow.

## Notifications from Following {#notifications-from-following}

![notifications](assets/notifications.png)

The **[!UICONTROL Follow]** button provides a means to follow entries as activities, subscriptions and/or notifications. Each time the **[!UICONTROL Follow]** button is selected, it is possible to toggle on or off a selection. The `Email Subscriptions` selection is only present when configured.

If any method of following is selected, the text of the button changes to **[!UICONTROL Following]**. For convenience, it is possible to select `Unfollow All` to toggle off all methods.

The **[!UICONTROL Follow]** button will appear:

* When viewing another member's profile.
* On a main feature page, such as forums, QnA, and blogs:

  * Follows all activity for that general feature.

* For a specific entry, such as a forum topic, QnA question, or blog article:

  * Follows all activity for that specific entry.

## Managing Notification Settings {#managing-notification-settings}

By selecting the Notification Settings link from the Notifications page, it is possible for each member to manage how notifications are received.

The web channel is always enabled.

![notifications14](assets/notifications1.png)

The email channel, which relies on proper [configuration of email](/help/communities/email.md), provides the same settings as for the web channel.

The email channel is off by default.

![notifications2](assets/notifications2.png)

It may be turned on by a member, but still depends on email being configured.

![notifications3](assets/notifications3.png)

## Viewing Notifications {#viewing-notifications}

### Web Notifications {#web-notifications}

A [wizard created community site](/help/communities/sites-console.md) now includes a link to the `Notifications` feature in the site's header bar above the banner. Unlike messages, notifications are created for every community site, while messages must be enabled during the site creation process.

When visiting the published site, selecting the `Notifications` link will display all notifications for the member.

![notifications4](assets/notifications4.png)

### Email Notifications {#email-notifications}

When the email channel is enabled, the member receives an email which contains a link to the content on the web.

![notifications5](assets/notifications5.png)

## Customize email notifications {#customize-email-notifications}

Organizations can customize the email notifications by [overlaying](/help/communities/client-customize.md#overlays) the templates at **/libs/settings/community/templates/email/html**.

For example, to modify the mentions emails notifications (for a communities component) add an **if** condition for verb **mention** in the templates of the components for which you enabled the **@mentions** support.

To modify the email notifications template for @mention in blog comments, place out of the box template at: **/libs/settings/community/templates/email/html/social.journal.components.hbs.comment/en**

```java
{{#equals this.verb "mention"}}\
    A new mention <a href="{{objectUrl}}">comment</a> {{#if this.target.properties.[jcr:title]}}to the article "{{{target.displayName}}}" {{/if}}was added by {{{user.name}}} on {{dateUtil this.published format="EEE, d MMM yyyy HH:mm:ss z"}}.\n \
{{/equals}}\
```

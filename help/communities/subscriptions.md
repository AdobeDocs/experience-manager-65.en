---
title: Communities Subscriptions
description: Community members interact with other members through email
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
role: Admin
exl-id: 338be220-659a-459c-8e90-55e3a11ddeb0
---
# Communities Subscriptions {#communities-subscriptions}

## Overview {#overview}

As of Communities [FP1](deploy-communities.md#latestfeaturepack), community members may interact with the community through email using a feature referrred to as subscriptions.

Subscriptions are similar to [notifications](notifications.md) as members may subscribe when following blog articles, forum topics or QnA questions.

What distinguishes subscriptions from notifications is:

* Members may not subscribe when following other members.
* The only action for members to take is to select `Email Subscriptions` when following.
* When email reply is configured, members may effectively post content by simply replying to the received email.

### Requirements {#requirements}

**Configure Email**

Email must be configured in order for subscriptions to be functional and for members to reply by email.

For instructions on setting up email, see [Configuring Email](email.md).

**Enable Subscriptions and Follow**

Components must be configured to enable subscriptions *and* following. Features that allow subscriptions are [blog](blog-feature.md), [forum](forum.md) and [QnA](working-with-qna.md).

## Subscriptions from Following {#subscriptions-from-following}

![subscription-following](assets/subscription-following.png)

The **Follow** button provides a means to follow entries as activities, subscriptions and/or notifications. Each time the **Follow** button is selected, it is possible to toggle on or off a selection.

If any method of following is selected, the text of the button changes to **Following**. For convenience, it is possible to select `Unfollow All` to toggle off all methods.

The **Follow** button will include the `Email Subscriptions` option only when a forum, QnA, or blog is configured to enable email subscriptions. This button will appear:

* On the main feature page for the enabled forum, QnA, or blog Will send an email for all activity under that feature.

* For a specific entry, such as a forum topic, QnA question, or blog article Will send an email when there is activity for that specific entry.

## Reply by Email {#reply-by-email}

When email is [configured for replying by email](email.md#configure-polling-importer), the member who subscribed will receive an email with the posted content and a link to the online content.

If they reply to the email, the content they enter in the reply will appear as content online.

![email-reply](assets/email-reply.png)

The amount of time it takes for a reply to be posted is controlled by the [polling importer's update interval](email.md#configure-polling-importer).

![QA](assets/qa.png)

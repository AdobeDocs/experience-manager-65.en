---
title: Member Contribution Limits
seo-title: Member Contribution Limits
description: Contribution limits feature lets you limit the contributions to protect against spam
seo-description: Contribution limits feature lets you limit the contributions to protect against spam
uuid: 99b2a855-3f0d-41a0-9572-517a7f29af9f
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
discoiquuid: d855aac2-f34d-402f-9dc3-c7ad494b45f2
role: Admin
exl-id: d00a8eb2-47ce-425a-a312-f043f82912be
---
# Member Contribution Limits {#member-contribution-limits}

## Overview {#overview}

The contribution limits feature provides the ability to limit the contributions of community members as a means of protecting against spam.

When a member is limited, any post that exceeds the allowed number of contributions will result in an alert that the limit was exceeded and the post is rejected. The community member may then go to the community message center and contact a community manager who can remove the limits if appropriate.

Contribution limits may be enabled individually from the [Members console](members.md) and/or configured to be automatically enabled when site visitors become new members.

Using the Members console, contribution limits can be proactively removed for a member by a community manager at any time, or reactively removed when a member sends a message to a community manager making such a request.

## AEM Communities User Generated Content Contribution Limits Configuration {#aem-communities-user-generated-content-contribution-limits-configuration}

This OSGi configuration:

* Defines the characteristics of the contribution limits (number of posts within a time period).
* Identifies who the member will be able to message when the limit has been reached.
* Identifies domains that need never be constrained.

To reach this OSGi configuration:

* On the primary publisher:
* Sign in with administrator privileges.
* Access the [Web Console](../../help/sites-deploying/configuring-osgi.md).

    * For example, [http://localhost:4503/system/console/configMgr](http://localhost:4503/system/console/configMgr)

* Locate `AEM Communities User Generated Content Contribution Limits Configuration`.
* Select the edit icon.

![configure-limits](assets/configure-limits.png)

* **[!UICONTROL Automatically Apply UGC Contribution Limits]**

  If checked, automatically set contribution limits on users when they register as community members. This is reflected in the community member's profile and may be enabled/disabled from the [members console](members.md). New members with an email address from a allowlist of domains are never constrained.

  Default is unchecked.

* **[!UICONTROL UGC Limit]**

  Maximum number of contributions.

  Default is 10 posts.

* **[!UICONTROL UGC Limit Frequency]**

  The time period constraining the UGC limit.

  Default is 60 minutes.

* **[!UICONTROL Domains]**

  An allowlist list of one or more email domains. Select the + icon to make addtional entries.

  Users with email addresses in the allowlist of domains are not affected when UGC contribution limits are automatically applied. For example, if domain `mycompany.com` is added to the list of domains, then a member with email address `me@mycompany.com` is never restricted from posting.

  Default is an empty allowlist.

* **[!UICONTROL Messaging Recipients]**

  List of one or more authorizable IDs of members able to modify the contribution limits for members. Select the + icon to make addtional entries.

  Members may only reach out to specified members when their limit has been reached.

  Default is no messaging recipients.

Note: The default configuration results in a limit of 10 posts within a period of one hour.

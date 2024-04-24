---
title: Overlay Communities components
description: Learn about overlaying a default component so you can alter the appearance or behavior of a component globally, for all relative references to the component.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
docset: aem65
exl-id: 18376805-c2ed-439a-abc7-e9657afe8baf
solution: Experience Manager
feature: Communities
role: Developer
---
# Overlay Communities components {#overlay-communities-components}

The intention of [overlaying](/help/communities/client-customize.md#overlays) a default component is to alter the appearance or behavior of a component globally, for all relative references to the component. It relies on the nature of sling to resolve to the /apps folder before searching in the /libs folder. Thus the path to the component is identical to the path to the default component, except it is in the /apps folder and not the /libs folder.

## Example {#example}

**Overlay comments component**

Suppose you would like to modify the comment feature so it matches the design of your website, by changing the comment header so it no longer displays the avatar for any comment. The solutions for hiding the avatar are either using CSS, or, as described here, overlaying the header.jsp in the apps folder so the HTML containing the avatar is never sent to the client.

To overlay comments, you must:

1. [Create Comments Page](/help/communities/overlay-create-comments-page.md)
1. [Create Nodes](/help/communities/overlay-create-nodes.md)
1. [Alter the Appearance](/help/communities/overlay-alter-appearance.md)

**Overlay notifications emails**

Suppose you want to customize the message of email notifications, you can do so by [overlaying](/help/communities/client-customize.md#overlays) the templates at `/libs/settings/community/templates/email/html`.

For example, suppose you want to edit the mentions emails notifications (for a specific Communities component where UGC is created). In such cases, add an **if** condition for verb **mention** in the templates of the components for which you enabled the **@mentions** support.

```java
{{#equals this.verb "mention"}}\
    A new mention <a href="{{objectUrl}}">comment</a> {{#if this.target.properties.[jcr:title]}}to the article "{{{target.displayName}}}" {{/if}}was added by {{{user.name}}} on {{dateUtil this.published format="EEE, d MMM yyyy HH:mm:ss z"}}.\n \
{{/equals}}\
```

To modify the email notifications template for @mention in blog comments, place out of the box template at: `/libs/settings/community/templates/email/html/social.journal.components.hbs.comment/en`

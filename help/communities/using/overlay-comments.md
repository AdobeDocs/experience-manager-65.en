---
title: Overlay communities components
seo-title: Overlay communities components
description: Overlay communities components
seo-description: Overlay communities components
uuid: 40982479-9dab-4945-9bf0-e5ca443dd9b1
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: fc20c2bc-1ce4-4327-a359-eea37e8c75bc
index: y
internal: n
snippet: y
---

# Overlay communities components{#overlay-communities-components}

The intention of [overlaying](/communities/using/client-customize.md#overlays) a default component is to alter the appearance or behavior of a component globally, for all relative references to the component. It relies on the nature of sling to resolve to the /apps folder before searching in the /libs folder. Thus the path to the component is identical to the path to the default component, except it is in the /apps folder and not the /libs folder.

### Example {#example}

**Overlay comments component**

Suppose you would like to modify the comment feature so it matches the design of your website, by changing the comment header so it no longer displays the avatar for any comment. The solutions for hiding the avatar are either using CSS, or, as described here, overlaying the header.jsp in the apps folder so the HTML containing the avatar is never sent to the client.

To overlay comments you will need to:

1. [Comments Page](/communities/using/overlay-create-comments-page.md)
1. [Create Nodes](/communities/using/overlay-create-nodes.md)
1. [Alter the Appearance](../../communities/using/overlay-alter-appearance.md)

**Overlay notifications emails**

Suppose you want to customize the message of email notifications, you can do so by [overlaying](/communities/using/client-customize.md#overlays) the templates at **/libs/settings/community/templates/email/html**.

For example, to modify the mentions emails notifications (for a specific communities component where ugc is created) add an** if **condition for verb **mention **in the templates of the components for which you enabled the** @mentions** support.

```java
{{#equals this.verb "mention"}}\
    A new mention <a href="{{objectUrl}}">comment</a> {{#if this.target.properties.[jcr:title]}}to the article "{{{target.displayName}}}" {{/if}}was added by {{{user.name}}} on {{dateUtil this.published format="EEE, d MMM yyyy HH:mm:ss z"}}.\n \
{{/equals}}\
```

To modify the email notifications template for @mention in blog comments, place out of the box template at: **/libs/settings/community/templates/email/html/social.journal.components.hbs.comment/en**

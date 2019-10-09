---
title: Featured Content Feature
seo-title: Featured Content Feature
description: The Featured Content feature lets signed-in site visitors highlight content 
seo-description: The Featured Content feature lets signed-in site visitors highlight content 
uuid: 7a2ff570-01bb-46fb-8d66-3b47e2efa72e
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: authoring
content-type: reference
discoiquuid: ee39435d-80f5-4758-ae01-1ea0d221b00b
---

# Featured Content Feature {#featured-content-feature}

## Introduction {#introduction}

The featured content feature provides an area for signed-in site visitors (community members) in the publish environment to highlight content for

* [Blogs](blog-feature.md)
* [Calendars](calendar.md)
* [Forums](forum.md)
* [Ideas](ideation-feature.md)
* [QnA](working-with-qna.md)

Once content is flagged as featured, it will be listed within this component, which may be placed in specific landing pages or areas that easily catches the attention of community members.

The ability to feature content may be allowed or disallowed per component.

This section of the documentation describes

* Adding featured content to a community site
* Configuration settings for the `Featured Content`component

## Adding Featured Content to a Page {#adding-featured-content-to-a-page}

To add a `Featured Content` component to a page in author mode, use the component browser to locate

* `Communities / Featured Content`

and drag it into place on a page where the featured contentshould appear.

For necessary information, visit [Communities Components Basics](basics.md).

When the [required client-side libraries](essentials-featured.md#essentials-for-client-side) are included, this is how the `Featured Content`component will appear:

![chlimage_1-13](assets/chlimage_1-13.png)

## Configuring Featured Content {#configuring-featured-content}

Select the placed `Featured Content` component to access and select the `Configure` icon which opens the edit dialog.

![chlimage_1-14](assets/chlimage_1-14.png) ![chlimage_1-15](assets/chlimage_1-15.png)

### Settings tab {#settings-tab}

Under the **[!UICONTROL Settings]** tab, identify the content to feature:

* **[!UICONTROL Display Name]** 
  The title for the list of featured content. For example `Featured Questions` or `Featured Ideas`. Default is `Featured Content` if left empty.

* **[!UICONTROL Location of the Featured Content]** 
  *(Required)* Browse to the page containing the content that may be feature (components of that page must be configured to Allow Featured Content). For example, `/content/sites/engage/en/forum`

* **[!UICONTROL Display Limit]** 
  The maximum number of featured content to display. Default is 5.

## Site Visitor Experience {#site-visitor-experience}

The ability to flag content as featured content requires moderator privileges.

When a moderator views posted content, they have access to the in-context moderation flags, which includes the new `Feature` flag.

![chlimage_1-16](assets/chlimage_1-16.png)

Once flagged as feature, the modeartion flag becomes `Unfeature`.

The page containing the `Featured Content` component, will now include this post.

![chlimage_1-17](assets/chlimage_1-17.png)

`Read More` is a link to the actual post.

## Additional Information {#additional-information}

More information may be found on the [Featured Content](essentials-featured.md) page for developers.

For flagging content as featured, see [Moderating User Generated Content](moderate-ugc.md).

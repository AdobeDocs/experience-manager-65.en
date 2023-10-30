---
title: Using Liking
description: Learn how to add and configure the Liking component so that users can express an opinion about a particular piece of content, such as a comment.
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: authoring
content-type: reference
exl-id: 226fa91c-4a12-4586-b694-1a52fa2ba358
---
# Using Liking {#using-liking}

The `Liking` component is a useful tool that allows users to express an opinion about a particular piece of content, such as a comment within a forum. With the `Liking` component, members select the heart icon to indicate a positive opinion.

## Adding Liking to a Page {#adding-liking-to-a-page}

To add a `Liking` component to a page in author mode, use the component browser to locate

* `Communities / Liking`

And drag it into place on a page, such as a position relative to the feature for users to like.

For necessary information, visit [Communities Components Basics](basics.md).

When the [required client-side libraries](essentials-liking.md#essentials-for-client-side) are included, this is how the `Liking` component appears.

![liking-component](assets/liking-component.png)

## Configuring Liking {#configuring-liking}

Select the placed `Liking` component so you can access and select the `Configure` icon which opens the edit dialog.

![configure-new](assets/configure-new.png)

Under the **[!UICONTROL Texts & Labels]** tab, specify the properties used to record likes.

![configure-liking](assets/configure-liking.png)

* **[!UICONTROL Positive Response Label]**
  
  (*Required*) The property name for a positive response.

* **[!UICONTROL Negative Response Label]**
  
  (*Required*) The property name for a negative response.

* **[!UICONTROL Tally Name]**
  
  (*Required*) The internal, identifiable property name for this instance of a voting component.

## Site Visitor Experience {#site-visitor-experience}

### Members {#members}

Members may change their likes at any time.

### Anonymous {#anonymous}

Anonymous liking is not supported. Site visitors must register (become a member) and sign in to participate in liking.

## Additional Information {#additional-information}

More information may be found on the [Liking Essentials](essentials-liking.md) page for developers.

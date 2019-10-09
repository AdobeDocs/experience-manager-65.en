---
title: Using Ratings
seo-title: Using Ratings
description: Adding a Rating component to a page
seo-description: Adding a Rating component to a page
uuid: a986970b-1221-4648-9a69-410f4480e0ae
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: authoring
content-type: reference
discoiquuid: a0e5491e-66bc-47b0-94a5-45a02bc558da
---

# Using Ratings {#using-ratings}

The `Rating`component is used standalone or in conjunction with other Communities features. This component allows signed-in community members to express their opinions by rating content.

## Adding a Rating to a Page {#adding-a-rating-to-a-page}

To add a `Rating`component to a page in author mode, locate the component `Communities / Rating` and drag it into place on a page, such as a position relative to the feature for members to rate.

For necessary information, visit [Communities Components Basics](basics.md).

When the [required client-side libraries](rating-basics.md#essentials-for-client-side) are included, this is how the `Rating` component will appear.

![chlimage_1-493](assets/chlimage_1-493.png)

## Configuring Rating {#configuring-rating}

Select the placed `Rating` component to access and select the `Configure` icon which opens the edit dialog.

![chlimage_1-494](assets/chlimage_1-494.png)

Under the **[!UICONTROL Texts & Labels]** tab you specify the internal identifier for the Rating.

![chlimage_1-495](assets/chlimage_1-495.png)

**[!UICONTROL Tally Name]** 
  (*Required*) A simple name for the `Rating`which uniquely identifies this instance. Must be a valid node name for the repository.

## Site Visitor Experience {#site-visitor-experience}

### Members {#members}

Only one rating per member is allowed. The member may change their rating at any time.

### Anonymous {#anonymous}

Anonymous posting of a rating is not supported. Site visitors must register (become a member) and sign in to participate.

## Additional Information {#additional-information}

More information may be found on the [Rating Essentials](rating-basics.md) page for developers.

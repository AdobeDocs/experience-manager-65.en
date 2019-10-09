---
title: Ideation Feature
seo-title: Ideation Feature
description: Adding and configuring the Ideation feature
seo-description: Adding and configuring the Ideation feature
uuid: b21507da-10c8-4149-9e2c-a4ff5dec582b
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: authoring
content-type: reference
discoiquuid: 7c0a9120-2edb-431b-b460-68398832d5ec
---

# Ideation Feature {#ideation-feature}

## Introduction {#introduction}

The ideation feature provides an area for signed-in site visitors (community members) in the publish environment to:

* Create ideas to share with the community
* View and comment on ideas
* Follow an idea
* Vote on an idea

This section of the documentation describes

* Adding the ideation feature to an AEM site
* Configuration settings for the Ideation component

## Adding a Ideation to a Page {#adding-a-ideation-to-a-page}

To add a `Ideation` component to a page in author mode, use the component browser to locate `Communities / Ideation` and drag it into place on a page where the idea should appear.

For necessary information, visit [Communities Components Basics](basics.md).

When the [required client-side libraries](ideation.md#essentials-for-client-side) are included, this is how the `Ideation`component will appear:

![chlimage_1-29](assets/chlimage_1-29.png)

## Configuring an Ideation {#configuring-an-ideation}

Select the placed `Ideation` component to access and select the `Configure` icon which opens the edit dialog.

![chlimage_1-30](assets/chlimage_1-30.png) ![chlimage_1-31](assets/chlimage_1-31.png)

### Settings tab {#settings-tab}

Under the **[!UICONTROL Settings]** tab, specify settings for ideas and comments:

* **[!UICONTROL Ideation Title]** 
  The display title for the idea. Default is `Ideation`.

* **[!UICONTROL Ideation Description]** 
  A description to display as a sub-title for the idea. Default is no description.

* **[!UICONTROL Topics Per Page]** 
  Defines the number of ideas/posts shown per page. Default is 10.

* **[!UICONTROL Moderated]** 
  If checked, posting of ideas and comments must be approved before they will appear on a publish site. Default is unchecked.

* **[!UICONTROL Closed]** 
  If checked, the ideation forum is closed to new ideas and comments. Default is unchecked.

* **[!UICONTROL Rich Text Editor]** 
  If checked, ideas and comments may be entered with markup. Default is unchecked.

* **[!UICONTROL Allow Tagging]** 
  If checked, allow members to add tag labels to their post (see **[!UICONTROL Tag field]** tab). Default is unchecked.

* **[!UICONTROL Allow File Uploads]** 
  If checked, allow file attachments to be added to the idea or comment. Default is unchecked.

* **[!UICONTROL Max File Size]** 
  Relevant only if `Allow File Uploads` is checked. This field will limit the size (in bytes) of an uploaded file. Default is 104857600 (10 Mb).

* **[!UICONTROL Allowed File Types]** 
  Relevant only if `Allow File Uploads` is checked. A comma separated list of file extensions with the "dot" separater. For example: .jpg, .jpeg, .png, .doc, .docx, .pdf. If any file types are specifed, then those not specified will not be allowed to be uploaded. Default is none specified such that all file types are allowed.

* **[!UICONTROL Max Attach Image File Size]** 
  Relevant only if Allow File Uploads is checked. Maximum number of bytes an uploaded image file may have. Default is 2097152 (2 Mb).

* **[!UICONTROL Allow Replies]** 
  If checked, allow replies to comments posted to the idea. Default is unchecked.

* **[!UICONTROL Allow Users to Delete Comments and Topics]** 
  If checked, allow members to delete the comments and ideas they posted. Default is unchecked.

* **[!UICONTROL Allow Following]** 
  If checked, include the following feature for idea posts, which allows members to be [notified](notifications.md) of new posts. Default is unchecked.

* **[!UICONTROL Allow Email Subscriptions]** 
  If checked, allow members to be notified of new posts by email ([subscription](subscriptions.md)). Requires `Allow Following` to be checked and [email configured](email.md). Default is unchecked.

* **[!UICONTROL Allow Voting]** 
  If checked, allow voting on the comments of an idea. Default is unchecked.

* **[!UICONTROL Display Badges]** 
  If checked, display earned and assigned [badges](implementing-scoring.md) with a member's idea. Default is unchecked.

* **[!UICONTROL Allow Featured Content]** 
  if checked, the idea is able to be identified as [featured content](featured.md). Default is unchecked.

### User Moderation tab {#user-moderation-tab}

Under the **[!UICONTROL User Moderation]** tab, specify how the posted ideas and comments (user generated content) are managed. For more information, see [Moderating User Generated Content](moderate-ugc.md).

* **[!UICONTROL Deny Posts]** 
  If checked, trusted member moderators will be allowed to deny posts and prevent the post from appearing on the public forum. Default is unchecked.

* **[!UICONTROL Close / Reopen Topics]** 
  If checked, trusted member moderators may close a topic to further edits and comments, and may also reopen a topic. Default is unchecked.

* **[!UICONTROL Flag Posts]** 
  If checked, allow members to flag others' topics or comments as inappropriate. Default is unchecked.

* **[!UICONTROL Flag Reason List]** 
  If checked, allow members to choose, from a drop-down list, their reason for flagging a topic or comment as inappropriate. Default is unchecked.

* **[!UICONTROL Custom Flag Reason]** 
  If checked, allow members to enter their own reason for flagging a topic or comment as inappropriate. Default is unchecked.

* **[!UICONTROL Moderation Threshold]** 
  Enter the number of times a topic or comment has to be flagged by members before moderators are notified. Default is 1 ( one time).

* **[!UICONTROL Flagging Limit]** 
  Enter the number of times a topic or comment has to be flagged before it is hidden from public view. If set to -1, the flagged topic or comment is never hidden from public view. Else, this number must be greater than or equal to the Moderation Threshold. Default is 5.

### Tag field tab {#tag-field-tab}

Under the **[!UICONTROL Tag field]** tab, the tags which may be applied, if allowed under the **[!UICONTROL Settings]** tab, are limited according to namespaces chosen.

* **[!UICONTROL Allowed Namespaces]** 
  Relevant if `Allow Tagging` is checked under the **Settings **tab. The tags which may be applied are limited to those within the namespace categories checked. The list of namespaces includes "Standard Tags" (the default namespace) as well as "Include All Tags". Default is none checked, which means all namespaces are allowed.

* **[!UICONTROL Suggestion Limit]** 
  Enter the number of tags to be displayed as a suggestion to the member posting to the forum. A value of **-** 1 means no limit. Default is 0.

### Sort Settings tab {#sort-settings-tab}

Under the **[!UICONTROL Sort Settings]** tab, specify how the posted comments are sorted when displayed.

* **[!UICONTROL Sort By]** 
  Check all allowed sort selections: `Newest, Oldest, Last Updated, Most Viewed, Most Active, Most Followed and Most Liked`. Default is `Newest, Oldest, Last Updated`.

* **[!UICONTROL Set as Default]** 
  Pull down to select one of the checked sort options to appear as the default. Default is `Newest`.

* **[!UICONTROL Select Time Options for Analytics Sorting]** 
  Pull down to select one of `All, Last 24 Hours, Last 7 Days, Last 30 Days`. Default is `All`.

## Site Visitor Experience {#site-visitor-experience}

### Creating Idea {#creating-idea}

As with all Communities features, if not signed in, a site visitor may only read ideas and view others opinions (through comments and voting/liking).

Once signed in, a member may create a new idea.

![chlimage_1-32](assets/chlimage_1-32.png)

Before submitting the idea, it is possible for the member to save a draft.

By selecting the `Save as Draft` button, a draft is saved.

![chlimage_1-33](assets/chlimage_1-33.png)

When viewing saved drafts in the `My Drafts` tab, select `Read More` to re-enter edit mode:

![chlimage_1-34](assets/chlimage_1-34.png)

#### Providing Feedback {#providing-feedback}

Once the idea is published, other members can sign in, open the idea ( `Read More`) and like the idea, thus adding to the vote count, and make comments.

![chlimage_1-35](assets/chlimage_1-35.png)

### Additional Information {#additional-information}

More information may be found on the [Ideation Essentials](ideation.md) page for developers.

For moderation of posted topics and comments, see [Moderating User Generated Content](moderate-ugc.md).

For tagging posted topics and comments, see [Tagging User Generated Content](tag-ugc.md).

---
title: Q&A Forum Feature
seo-title: Q&A Forum Feature
description: Adding the QnA forum feature to a page
seo-description: Adding the QnA forum feature to a page
uuid: 006c0bf0-c230-4890-8080-65651f4b4dac
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: authoring
content-type: reference
discoiquuid: bbbe32bb-9d97-461e-822f-a7ddc6c9f9ef
---

# Q&A Forum Feature {#q-a-forum-feature}

## Introduction {#introduction}

The QnA (questions and answers) forum feature provides an area for community members to ask and answer questions:

* Create new questions
* Inline images (with support for drag and drop)
* View and answer questions
* Search for a question
* Help moderate the QnA content
* Identify best answers
* Move QnA questions from one page to another

This section of the documentation describes

* Adding the QnA forum feature to an AEM site
* Configuration settings for the `QnA`component

## Adding a Q&A Forum to a Page {#adding-a-q-a-forum-to-a-page}

To add a `QnA` component to a page in author mode, use the component browser to locate `Communities / QnA` and drag it into place on a page where the QnA forum should appear.

For necessary information, visit [Communities Components Basics](basics.md).

When the [required client-side libraries](qna-essentials.md#essentials-for-client-side) are included, this is how the `QnA` component will appear:

![chlimage_1-280](assets/chlimage_1-280.png)

### Configuring QnA {#configuring-qna}

Select the placed `QnA` component to access and select the `Configure` icon which opens the edit dialog.

![chlimage_1-281](assets/chlimage_1-281.png) ![chlimage_1-282](assets/chlimage_1-282.png)

#### Settings tab {#settings-tab}

Under the **[!UICONTROL Settings]** tab, specify settings for topics (questions) and replies (answers):

* **[!UICONTROL Topics Per Page]**
  Defines the number of questions/posts shown per page. Default is 10.

* **[!UICONTROL Moderated]**
  If checked, posting of topics and comments must be approved before they will appear on a publish site. Default is unchecked.

* **[!UICONTROL Closed]**
  If checked, the forum is closed to new questions and comments. Default is unchecked.

* **[!UICONTROL Rich Text Editor]**
  If checked, topics and comments may be entered with markup. Default is unchecked.

* **[!UICONTROL Allow Tagging]**
  If checked, allow members to add tag labels to their post (see **[!UICONTROL Tag field]** tab). Default is unchecked.

* **[!UICONTROL Allow File Uploads]**
  If checked, allow file attachments to be added to the question or comment. Default is unchecked.

* **[!UICONTROL Max File Size]**
  Relevant only if `Allow File Uploads` is checked. This field will limit the size (in bytes) of an uploaded file. Default is 104857600 (10 Mb).

* **[!UICONTROL Allowed File Types]**
  Relevant only if `Allow File Uploads` is checked. A comma separated list of file extensions with the "dot" separater. For example: .jpg, .jpeg, .png, .doc, .docx, .pdf. If any file types are specifed, then those not specified will not be allowed to be uploaded. Default is none specified such that all file types are allowed.

* **[!UICONTROL Max Attach Image File Size]**
  Relevant only if Allow File Uploads is checked. Maximum number of bytes an uploaded image file may have. Default is 2097152 (2 Mb).

* **[!UICONTROL Allow Following]**
  If checked, include the following feature for forum posts, which allows members to be [notified](notifications.md) of new posts. Default is unchecked.

* **[!UICONTROL Allow Pinning]**
  If checked, forum topics may be pinned to the top of the list of topics. Default is unchecked.

* **[!UICONTROL Allow Email Subscriptions]**
  If checked, allow members to be notified of new posts by email ([subscription](subscriptions.md)). Requires `Allow Following` to be checked and [email configured](email.md). Default is unchecked.

* **[!UICONTROL Allow Replies]**
  If checked, allow replies to comments posted to the question. Default is unchecked.

* **[!UICONTROL Allow Users to Delete Comments and Topics]**
  If checked, allow members to delete the comments and questions they posted. Default is unchecked.

* **[!UICONTROL Allow Voting]**
  If checked, include the Voting feature with a question. Default is unchecked.

* **[!UICONTROL Move Selected Answer To The Top]**
  If checked, first answer shown is a selected answer. Default is checked.

* **[!UICONTROL Display Badges]**
  If checked, display earned and assigned [badges](implementing-scoring.md) with a member's blog entry. Default is unchecked.

* **[!UICONTROL Allow Featured Content]**
  if checked, the idea is able to be identified as [featured content](featured.md). Default is unchecked.

#### User Moderation tab {#user-moderation-tab}

Under the **[!UICONTROL User Moderation]** tab, specify how the posted topics (quetions) and answers (user generated content) are managed. For more information, see [Moderating User Generated Content](moderate-ugc.md).

* **[!UICONTROL Deny Answers]**
  If checked, trusted member moderators will be allowed to deny posted answers and prevent the answer from appearing on the public Q&A forum. Default is unchecked.

* **[!UICONTROL Close / Reopen Topics]**
  If checked, trusted member moderators may close a question (topic) to further edits and answers, and may also reopen a question. Default is unchecked.

* **[!UICONTROL Move Topics]**
  If checked, allow publish-side moderators to move questions. Default is unchecked.

* **[!UICONTROL Flag Posts]**
  If checked, allow members to flag others' questions or answers as inappropriate. Default is unchecked.

* **[!UICONTROL Flag Reason List]**
  If checked, allow members to choose, from a drop-down list, their reason for flagging a question or answer as inappropriate. Default is unchecked.

* **[!UICONTROL Custom Flag Reason]**
  If checked, allow members to enter their own reason for flagging a question or answer as inappropriate. Default is unchecked.

* **[!UICONTROL Moderation Threshold]**
  Enter the number of times a question or answer has to be flagged by members before moderators are notified. Default is 1 ( one time).

* **[!UICONTROL Flagging Limit]**
  Enter the number of times a question or answer has to be flagged before it is hidden from public view. If set to -1, the flagged question or answer is never hidden from public view. Else, this number must be greater than or equal to the Moderation Threshold. Default is 5.

#### Tag field tab {#tag-field-tab}

Under the **[!UICONTROL Tag field]** tab, the tags which may be applied, if allowed under the **[!UICONTROL Settings]** tab, are limited according to namespaces chosen.

* **[!UICONTROL Allowed Namespaces]**
  Relevant if `Allow Tagging` is checked under the **Settings **tab. The tags which may be applied are limited to those within the namespace categories checked. The list of namespaces includes "Standard Tags" (the default namespace) as well as "Include All Tags". Default is none checked, which means all namespaces are allowed.

* **[!UICONTROL Suggestion Limit]**
  Enter the number of tags to be displayed as a suggestion to the member posting to the forum. A value of `-1` means no limits. Default is 0.

#### Sort Settings tab {#sort-settings-tab}

Under the **[!UICONTROL Sort Settings]** tab, specify how the posted comments are sorted when displayed.

* **[!UICONTROL Sort By]**
  Check all allowed sort selections: `Newest, Oldest, Last Updated, Most Viewed, Most Active, Most Followed and Most Liked`. Default is `Newest, Oldest, Last Updated`.

* **[!UICONTROL Set as Default]**
  Pull down to select one of the checked sort options to appear as the default. Default is `Newest`.

* **[!UICONTROL Select Time Options for Analytics Sorting]**
  Pull down to select one of `All, Last 24 Hours, Last 7 Days, Last 30 Days`. Default is `All`.

## Site Visitor Experience {#site-visitor-experience}

### Identifying Answers {#identifying-answers}

One answer can be marked as a correct or useful answer using the `Select Answer` button. Once a Question is marked as Answered, another answer cannot be selected until the first one has been unselected using the `Unmark Chosen Answer`button.

Once selected as a viable answer, it may be unselected using the `Unmark Chosen Answer` button.

Once an answer is selected as the viable answer, an indication that the question has been `Answered`is displayed next to the question topic on the main QnA page.

### Moderators and Administrators {#moderators-and-administrators}

When the signed in user has moderator or administrator privileges, they are able to perform the moderation tasks permitted by the configuration of the component, regardless of who authored the question or answer.

They also have the ability to identify answers.

### Members {#members}

When the site visitor is signed in, depending on the configuration, they may

* Post a new question
* Edit or delete questions they authored
* May also flag others' questions or answers
* May identify answers for questions they authored

### Anonymous {#anonymous}

Site visitors who are not signed in may only read posted questions and answers, translate them if supported, but may not add neither a question nor answer, nor flag others' posts.

## Additional Information {#additional-information}

More information may be found on the [QnA Essentials](qna-essentials.md) page for developers.

For moderation of posted topics and comments, see [Moderating User Generated Content](moderate-ugc.md).

For tagging posted topics and comments, see [Tagging User Generated Content](tag-ugc.md).

---
title: Community Functions
seo-title: Community Functions
description: Learn how to access the Community Functions console
seo-description: Learn how to access the Community Functions console
uuid: d3d70134-f318-4709-a673-b01a3467d980
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
discoiquuid: 91833914-b811-4355-a97d-e1a9cb7441f1
docset: aem65
role: Admin
exl-id: 2395c895-c611-43ac-abb6-c2bc4b4a41f4
---
# Community Functions{#community-functions}

The type of features expected from a community experience are well known. Community features are available as community functions. Essentially, they are one or more pages pre-wired to implement a community feature which requires more than simply adding a component to a page in author mode. They are the building blocks used to define the structure of a [community site template](/help/communities/sites.md) from which community sites are [created](/help/communities/sites-console.md).

Once a community site is created, content may be added to the resulting pages using the standard [AEM authoring mode](/help/sites-authoring/editing-content.md). Various community functions are available as seen in the community functions console.

>[!NOTE]
>
>The consoles for the creation of [community sites](/help/communities/sites-console.md), [community site templates](/help/communities/sites.md), [community group templates](/help/communities/tools-groups.md), and [community functions](/help/communities/functions.md) are for use only in the author environment.

## Community Functions Console {#community-functions-console}

To reach the community functions console in the author environment:

* Navigate to **[!UICONTROL Tools]** > **[!UICONTROL Communities]** > **[!UICONTROL Community Functions]**.

![community-functions](assets/community-functions.png)

## Pre-built Functions {#pre-built-functions}

Following is a brief description of the functions delivered with AEM Communities. Each function includes one or more AEM pages containing Communities components wired together into a feature that is easily incorporated into a [community site template](/help/communities/sites.md).

A community site template provides the structure for a community site including login, user profiles, notifications, messaging, site menu, search, theming, and branding features.

### Title and URL Settings {#title-and-url-settings}

**Title** and **URL** are properties common to all community functions.

When a community function is added to a community site template or added when [modifying](/help/communities/sites-console.md#modifying-site-properties) the structure of a community site, the function's dialog opens so that the Title and URL may be configured.

#### Configuration Function Details {#configuration-function-details}

![title-url-details](assets/title-url-details.png)

* **Title**
  
  (*Required*) The text which appears in the menu of features for the site

* **URL**
  
  (*Required*) The name used to generate the URI. The name must conform to the [naming conventions](/help/sites-developing/naming-conventions.md) imposed by AEM and JCR.

For example, using the site created from following the [Getting Started](/help/communities/getting-started.md) tutorial, if

* Title = Web Page
* URL = page

Then, the URL to the page is https://localhost:4503/content/sites/engage/en/page.html

and the menu link for the page appears as:

![engage-page](assets/engage-page.png)

### Activity Stream Function {#activity-stream-function}

The activity stream function is a page with an [Activity Streams component](/help/communities/activities.md) with all views selected (all activities, user activities, and following). See also [Activity Stream Essentials](/help/communities/essentials-activities.md) for developers.

When added to a template, the following dialog opens:

#### Configuration Function Details {#configuration-function-details-1}

![function-details](assets/function-details.png)

* [Title and URL Settings](#title-and-url-settings)

* **Show "My Activities" view**
  
  If selected, the Activities page includes a tab which filters activities based on those generated within the community by the current member. Default is selected.

* **Show "All Activities" view**
  
  If selected, the Activities page includes a tab which includes all activities generated within the community to which the current member has access. Default is selected.

* **Show "News Feed" view**
  
  If selected, the Activities pages include a tab which filters activities based on those the current member is following. Default is selected.

### Blog Function {#blog-function}

The blog function is a page with a [Blog component](/help/communities/blog-feature.md) configured for tagging, file uploads, following, members to self-edit, voting, and moderation. See also [Blog Essentials](/help/communities/blog-developer-basics.md) for developers.

When added to a template, the following dialog opens:

![blog-component](assets/blog-component.png)

* [Title and URL Settings](#title-and-url-settings)

* **Allow Privileged Members**
  
  If selected, the blog only allows privileged members to create articles by allowing selection of a [privileged members group](/help/communities/users.md#privileged-members-group). If not selected, all community members are allowed to create. Default is deselected.

* **Allow File Uploads**
  
  If selected, the blog includes the ability for members to upload files. Default is selected.

* **Allow Threaded Replies**
  
  If not selected, the blog allows replies (comments) to an article, but replies to comments are not allowed. Default is selected.

* **Allow Featured Content**
  
  If selected, the blog is identified as [featured content](/help/communities/featured.md). Default is selected.

### Calendar Function {#calendar-function}

The calendar function is a page with a [Calendar component](/help/communities/calendar.md) configured to allow tagging. See also [Calendar Essentials](/help/communities/calendar-basics-for-developers.md) for developers.

When added to a template, the following dialog opens:

![calendar-details](assets/calendar-details.png)

* [Title and URL Settings](#title-and-url-settings)

* **Allow Pinning**
  
  If selected, the forum allows topic replies to be pinned to the beginning of the list of comments. Default is selected.

* **Allow Privileged Members**
  
  If selected, the blog only allows privileged members to create articles by allowing selection of a [privileged members group](/help/communities/users.md#privileged-members-group). If not selected, all community members are allowed to create. Default is deselected.

* **Allow File Uploads**
  
  If selected, the blog includes the ability for members to upload files. Default is selected.

* **Allow Threaded Replies**
  
  If not selected, the blog allows replies (comments) to an article, but replies to comments are not allowed. Default is selected.

* **Allow Featured Content**
  
  If selected, its content is identified as [featured content](/help/communities/featured.md). Default is selected.

### Featured Content Function {#featured-content-function}

The featured content function is a page with a [Featured Content component](/help/communities/featured.md) configured to allow comments to be added and deleted.

The ability to feature content may be allowed or disallowed per component (see [Blog Function](#blog-function), [Calendar Function](#calendar-function), [Forum Function](#forum-function), [Ideation Function](#ideation-function), and [QnA Function](#qna-function)).

When added to a template, the only configuration is for the [Title and URL Settings](#title-and-url-settings).

### File Library Function {#file-library-function}

The file library function is a page with a [File Library component](/help/communities/file-library.md) configured to allow comments to be added and deleted.

When added to a template, the only configuration is for the [Title and URL Settings](#title-and-url-settings).

### Forum Function {#forum-function}

The forum function is a page with a [Forum component](/help/communities/forum.md) configured for tagging, file uploads, following, members to self-edit, voting, and moderation.

When added to a template, the following dialog opens:

#### Configuration Function Details {#configuration-function-details-2}

![forum-component1](assets/forum-component1.png)

* [Title and URL Settings](#title-and-url-settings)

* **Allow Pinning**
  
  If selected, the forum allows topic replies to be pinned to the beginning of the list of comments. Default is selected.

* **Allow Privileged Members**
  
  If selected, the forum only allows privileged members to post topics by allowing selection of a [privileged members group](/help/communities/users.md#privileged-members-group). If not selected, all community members are allowed to post. Default is deselected.

* **Allow File Uploads**
  
  If selected, the forum includes the ability for members to upload files. Default is selected.

* **Allow Threaded Replies**
  
  If not selected, the forum allows comments on a topic, but replies to those comments are not allowed. Default is selected.

* **Allow Featured Content**
  
  If selected, the component's content is identified as [featured content](/help/communities/featured.md). Default is selected.

### Groups Function {#groups-function}

>[!CAUTION]
>
>The groups function must *not* be the *first nor the only* function in a site's structure or in a community site template.
>
>Any other function, such as the [page function](#page-function), must be included and listed first.

The groups function provides the ability for community members to create sub-communities within the community site in the publish environment.

Depending on [settings](/help/communities/sites-console.md#groupmanagement) when the Groups function is included in a [community site template](/help/communities/sites.md), the groups can be public or private and one or more community group templates may be configured to provide a choice of templates when the community group is actually created (such as from the publish environment). A [community group template](/help/communities/tools-groups.md) specifies which Communities features are created for the group pages, such as forums and calendars.

When a community group is created, a member group is dynamically created for the new group, to which members can be assigned or join. For more information, see [Managing Users and User Groups](/help/communities/users.md).

As of Communities [feature pack 1](/help/communities/deploy-communities.md#latestfeaturepack), community groups are created in the author environment using the [Communities Sites' Groups console](/help/communities/groups.md), and may be created in the publish environment when enabled.

When added to a template, the following dialog opens:

![group-template-config](assets/group-template-config.png)

* [Title and URL Settings](#title-and-url-settings)

* **Select Group Templates**
  
  A drop-down that allows selection of one or more enabled group templates from which the future creator of a new community group (in the publish environment) may choose.

* **Allow Privileged Members**
  
  If selected, the forum only allows privileged members to post topics by allowing selection of a [privileged members security group](/help/communities/users.md#privileged-members-group). If not selected, all community members are allowed to post. Default is deselected.

* **Allow Publish Creation**
  
  If selected, authorized community members can create a group in the publish environment. If deselected, new groups (sub-communities) may only be created in the author environment from the Communities Sites' Groups console.
  Default is selected.

### Ideation Function {#ideation-function}

The ideation function is a page with one [Ideation component](/help/communities/ideation-feature.md).

When added to a template, the following dialog opens, which specifies the default Title and URL names, as well as default display settings for the template:

![ideation-function](assets/ideation-function.png)

* [Title and URL Settings](#title-and-url-settings)

* **Allow Privileged Members**
  
  If selected, the forum only allows privileged members to post topics by allowing selection of a [privileged members security group](/help/communities/users.md#privileged-members-group). If not selected, all community members are allowed to post. Default is deselected.

* **Allow File Uploads**
  
  If selected, the idea includes the ability for members to upload files. Default is selected.

* **Allow Threaded Replies**
  
  If not selected, the idea allows replies (comments) to a topic, but replies to comments are not allowed. Default is selected.

* **Allow Featured Content**
  
  If selected, its content is identified as [featured content](/help/communities/featured.md). Default is selected.

### Leaderboard Function {#leaderboard-function}

The leaderboard function is a page with one [Leaderboard component](/help/communities/enabling-leaderboard.md).

**NOTE**: The Leaderboard component needs further configuration *after* a community site is created from a community template which includes the Leaderboard function. Specify the Leaderboard component's [rules](/help/communities/enabling-leaderboard.md#rules-tab), which depend on configuration of [scoring and badges](/help/communities/implementing-scoring.md) for the community site.

When added to a template, the following dialog opens, which specifies the default Title and URL names, as well as default display settings for the template:

![leaderboard-dialog](assets/leaderboard-dialog.png)

* [Title and URL Settings](#title-and-url-settings)

* **Display Badge**
  
  If selected, a column for badge icons is included in the leaderboard.
  Default is deselected.

* **Display Badge Name**
  
  If selected, a column for the badge name is included in the leaderboard.
  Default is deselected.

* **Display Avatar**
  
  If selected, the member's avatar image is included in the leaderboard, next to their name link to their member profile.
  Default is deselected.

### Page Function {#page-function}

The page function adds a blank page to the community site that it is wired into the features of the community site: login, menu, notifications, messaging, theming and branding. Content is added to the page using the [standard AEM authoring mode](/help/sites-authoring/editing-content.md).

When added to a template, the only configuration is for the [Title and URL Settings](#title-and-url-settings).

### QnA Function {#qna-function}

The QnA function is a page with a [QnA component](/help/communities/working-with-qna.md) configured for tagging, file uploads, following, members to self-edit, voting, and moderation.

When added to a template, the configuration allows restriction to privileged members:

![qna-dialog](assets/qna-dialog.png)

* [Title and URL Settings](#title-and-url-settings)

* **Allow Pinning**
  
  If selected, the forum allows topic replies to be pinned to the beginning of the list of comments. Default is selected.

* **Allow Privileged Members**
  
  If selected, the QnA forum only allows privileged members to post questions by allowing selection of a [privileged members group](/help/communities/users.md#privileged-members-group). If not selected, all community members are allowed to post. Default is deselected.

* **Allow File Uploads**
  
  If selected, the QnA forum includes the ability for members to upload files. Default is selected.

* **Allow Threaded Replies**
  
  If not selected, the QnA forum allows for comments (answers) to a posted question, but replies to answers are not allowed. Default is selected.

* **Allow Featured Content**
  
  If selected, its content is identified as [featured content](/help/communities/featured.md). Default is selected.

## Create Community Function {#create-community-function}

The ability to create a community function is reached by selecting the `Create Community Function` icon located at the top of the Community Functions console. Multiple functions based on the same AEM Blueprint may be created and then uniquely customized by opening in author edit mode.

![create-community-function](assets/create-community-function.png)

### Community Function Name {#community-function-name}

![function-name](assets/function-name.png)

On the Community Function Name panel, a name, description and whether the function is enabled or disabled are configured:

* **Community Function Name**
  
  The function name used for display and storage.

* **Community Function Description**
  
  The function description for display.

* **Disabled/Enabled**
  
  A toggle switch controlling whether the function is referenceable.

### AEM Blueprint {#aem-blueprint}

![aem-blueprint](assets/aem-blueprint.png)

On the `AEM Blueprint` panel, it is possible to select the blueprint which is the underlying implementation of the community function.

The community function is a mini site that includes one or more pages, pre-wired for inclusion into a community site including login, user profiles, notifications, messaging, site menu, search, theming, and branding features. Once the function is created, it is possible to [open the function](#open-community-function) in author edit mode and customize the page or component settings.

Since the community function is implemented as a [live copy](/help/sites-administering/msm.md#live-copies) of a [blueprint](/help/sites-administering/msm-livecopy.md#creatingablueprint), it is possible to rollout changes made to a function which affects all community site pages created from the [community site template](/help/communities/sites.md) or [community group template](/help/communities/tools-groups.md) that included the function. It is also possible to disassociate a page from its parent blueprint to make page-level modifications.

See also [Multi Site Manager](/help/sites-administering/msm.md).

### Thumbnail {#thumbnail}

![funtion-thumbnail](assets/funtion-thumbnail.png)

On the Thumbnail panel, an image may be uploaded to display in the [Community Functions console](#community-functions-console).

## Open Community Function {#open-community-function}

![open-function](assets/open-function.png)

Select the `Open Community Function` icon to enter author edit mode for authoring the page content and modifying the configuration of the feature component(s).

### Configuring Components {#configuring-components}

A community function is implemented as a Live Copy of an AEM Blueprint, details of which are documented under [Multi Site Manager](/help/sites-administering/msm.md).

It is possible to not only author page content, but to configure components.

If configuring a component on a page of a created community site, it may be necessary to cancel [inheritance](/help/sites-administering/msm-livecopy.md#changing-live-copy-content) to configure the component. Inheritance should be re-established when configuration is completed.

For configuration details, visit [Communities Components](/help/communities/author-communities.md) for authors.

## Edit Community Function {#edit-community-function}

![edit-function](assets/edit-function.png)

Select the `Edit Community Function` icon to edit the function's properties using the same panels as [creating a community function](#create-community-function), including enabling or disabling the function.

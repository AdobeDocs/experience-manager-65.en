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

---

# Community Functions{#community-functions}

The type of features expected from a community experience are well known. Community features are available as community functions. Essentially, they are one or more pages pre-wired to implement a community feature which requires more than simply adding a component to a page in author mode. They are the building blocks used to define the structure of a [community site template](/communities/using/sites.md) from which community sites are [created](../../communities/using/sites-console.md).

Once a community site is created, content may be added to the resulting pages using the standard [AEM authoring mode](../../sites/authoring/using/editing-content.md). Various community functions are available as seen in the community functions console.

>[!NOTE]
>
>The consoles for the creation of [community sites](../../communities/using/sites-console.md), [community site templates](/communities/using/sites.md), [community group templates](../../communities/using/tools-groups.md), and [community functions](../../communities/using/functions.md) are for use only in the author environment.

## Community Functions Console {#community-functions-console}

In the author environment, to reach the community functions console

* from global navigation: **Tools, Communities, Community Functions**

![](assets/chlimage_1-106.png)

## Pre-built Functions {#pre-built-functions}

Following is a brief description of the functions delivered with AEM Communities. Each function includes one or more AEM pages containing Communities components wired together into a feature that is easily incorporated into a [community site template](/communities/using/sites.md).

A community site template provides the structure for a community site including login, user profiles, notifications, messaging, site menu, search, theming, and branding features.

### Title and URL Settings {#title-and-url-settings}

**Title **and **URL **are properties common to all community functions.

When a community function is added to a community site template or added when [modifying](../../communities/using/sites-console.md#modifying-site-properties) the structure of a community site, the function's dialog opens so that the Title and URL may be configured.

#### Configuration Function Details {#configuration-function-details}

![](assets/chlimage_1-107.png)

* **Title** 
  (*required*) The text which appears in the menu of features for the site

* **URL** 
  (*required*) The name used to generate the URI. The name must conform to the [naming conventions](/sites/developing/using/naming-conventions.md) imposed by AEM and JCR.

For example, using the site created from following the [Getting Started](../../communities/using/getting-started.md) tutorial, if

* Title = Web Page
* URL = page

then the URL to the page is http://localhost:4503/content/sites/engage/en/**page**.html

and the menu link for the page appears as:

![](assets/chlimage_1-108.png)

### Activity Stream Function {#activity-stream-function}

The activity stream function is a page with an [Activity Streams component](../../communities/using/activities.md) with all views selected (all activities, user activities, and following). See also [Activity Stream Essentials](../../communities/using/essentials-activities.md) for developers.

When added to a template, the following dialog opens:

#### Configuration Function Details {#configuration-function-details-1}

![](assets/chlimage_1-109.png)

* [Title and URL Settings](#title-and-url-settings)
* **Show "My Activities" view** 
  If selected, the Activities page includes a tab which filters activities based on those generated within the community by the current member. Default is selected.

* **Show "All Activities" view** 
  If selected, the Activities page includes a tab which includes all activities generated within the community to which the current member has access. Default is selected.

* **Show "News Feed" view** 
  If selected, the Activities pages include a tab which filters activities based on those the current member is following. Default is selected.

### Assignments Function {#assignments-function}

The assignments function is the basic feature which defines a [community site for enablement](../../communities/using/overview.md#enablement-community). It allows for the assignment of enablement resources to community members. See also [Assignments Essentials](../../communities/using/essentials-assignments.md) for developers.

This function is available as a feature of the [enablement add-on](/communities/using/enablement.md). The enablement add-on requires additional licensing for use in a production environment.

When added to a template, the only configuration is for the [Title and URL Settings](#title-and-url-settings).

### Blog Function {#blog-function}

The blog function is a page with a [Blog component](../../communities/using/blog-feature.md) configured for tagging, file uploads, following, members to self-edit, voting, and moderation. See also [Blog Essentials](../../communities/using/blog-developer-basics.md) for developers.

When added to a template, the following dialog opens:

![](assets/chlimage_1-110.png)

* [Title and URL Settings](#title-and-url-settings)
* **Allow Privileged Members** 
  If selected, the blog only allows privileged members to create articles by allowing selection of a [privileged members group](/communities/using/users.md#privileged-members-group). If not selected, all community members are allowed to create. Default is deselected.

* **Allow File Uploads** 
  If selected, the blog includes the ability for members to upload files. Default is selected.

* **Allow Threaded Replies** 
  If not selected, the blog allows replies (comments) to an article, but replies to comments are not allowed. Default is selected.

* **Allow Featured Content** 
  If selected, the blog is identified as [featured content](/communities/using/featured.md). Default is selected.

### Calendar Function {#calendar-function}

The calendar function is a page with a [Calendar component](../../communities/using/calendar.md) configured to allow tagging. See also [Calendar Essentials](/communities/using/calendar-basics-for-developers.md) for developers.

When added to a template, the following dialog opens:

![](assets/chlimage_1-111.png)

* see [Title and URL Settings](#title-and-url-settings)
* **Allow Pinning** 
  If selected, the forum allows topic replies to be pinned to the beginning of the list of comments. Default is selected.

* **Allow Privileged Members** 
  If selected, the blog only allows privileged members to create articles by allowing selection of a [privileged members group](/communities/using/users.md#privileged-members-group). If not selected, all community members are allowed to create. Default is deselected.

* **Allow File Uploads** 
  If selected, the blog includes the ability for members to upload files. Default is selected.

* **Allow Threaded Replies** 
  If not selected, the blog allows replies (comments) to an article, but replies to comments are not allowed. Default is selected.

* **Allow Featured Content** 
  If selected, its content is identified as [featured content](/communities/using/featured.md). Default is selected.

### Catalog Function {#catalog-function}

The catalog function provides the ability for [enablement community](../../communities/using/overview.md#enablement-community) members to browse enablement resources which are not assigned to them. See [Tagging Enablement Resources](/communities/using/tag-resources.md) and [Catalog Essentials](/communities/using/catalog-developer-essentials.md) for developers.

All enablement resources and learning paths for the community site shows in all catalogs if their property, ` [Show in Catalog](/communities/using/resources.md)`, is set to true. To explicitly include resources and learning paths, it is necessary to apply a [pre-filter](/communities/using/catalog-developer-essentials.md#pre-filters) to the catalog.

When added to a template, the configuration allows specifying tag namespace(s) used to configure the tag filter presented to site visitors:

![Catalog function](assets/catalog-function.png)

* [Title and URL Settings](#title-and-url-settings)
* **Select All Namespaces** 
  The selected tag namespaces define which tags are selectable by visitors for filtering the list of enablement resources listed in the catalog.  
  If selected, all tag namespaces allowed for the community site are available.  
  If deselected, it is possible to select one or more namespaces allowed for the community site.  
  Default is selected.

### Featured Content Function {#featured-content-function}

The featured content function is a page with a [Featured Content component](/communities/using/featured.md) configured to allow comments to be added and deleted.

The ability to feature content may be allowed or disallowed per component (see [Blog Function](#blog-function), [Calendar Function](#calendar-function), [Forum Function](#forum-function), [Ideation Function](#ideation-function), and [QnA Function](#qna-function)).

When added to a template, the only configuration is for the [Title and URL Settings](#title-and-url-settings).

### File Library Function {#file-library-function}

The file library function is a page with a [File Library component](../../communities/using/file-library.md) configured to allow comments to be added and deleted.

When added to a template, the only configuration is for the [Title and URL Settings](#title-and-url-settings).

### Forum Function {#forum-function}

The forum function is a page with a [Forum component](../../communities/using/forum.md) configured for tagging, file uploads, following, members to self-edit, voting, and moderation.

When added to a template, the following dialog opens:

#### Configuration Function Details {#configuration-function-details-2}

![](assets/chlimage_1-112.png)

* [Title and URL Settings](#title-and-url-settings)
* **Allow Pinning** 
  If selected, the forum allows topic replies to be pinned to the beginning of the list of comments. Default is selected.

* **Allow Privileged Members** 
  If selected, the forum only allows privileged members to post topics by allowing selection of a [privileged members group](/communities/using/users.md#privileged-members-group). If not selected, all community members are allowed to post. Default is deselected.

* **Allow File Uploads** 
  If selected, the forum includes the ability for members to upload files. Default is selected.

* **Allow Threaded Replies** 
  If not selected, the forum allows comments on a topic, but replies to those comments are not allowed. Default is selected.

* **Allow Featured Content** 
  If selected, the component's content is identified as [featured content](/communities/using/featured.md). Default is selected.

### Groups Function {#groups-function}

>[!CAUTION]
>
>The groups function must *not *be the *first nor the only* function in a site's structure or in a community site template.
>
>Any other function, such as the [page function](#page-function), must be included and listed first.

The groups function provides the ability for community members to create sub-communities within the community site in the publish environment.

Depending on [settings](../../communities/using/sites-console.md#groupmanagement) when the Groups function is included in a [community site template](/communities/using/sites.md), the groups can be public or private and one or more community group templates may be configured to provide a choice of templates when the community group is actually created (such as from the publish environment). A [community group template](../../communities/using/tools-groups.md) specifies which Communities features are created for the group pages, such as forums and calendars.

When a community group is created, a member group is dynamically created for the new group, to which members can be assigned or join. For more information, see [Managing Users and User Groups](/communities/using/users.md).

As of Communities [feature pack 1](../../communities/using/deploy-communities.md#latestfeaturepack), community groups are created in the author environment using the [Communities Sites' Groups console](../../communities/using/groups.md), and may be created in the publish environment when enabled.

When added to a template, the following dialog opens:

![](assets/chlimage_1-113.png)

* [Title and URL Settings](#title-and-url-settings)
* **Select Group Templates** 
  A drop-down that allows selection of one or more enabled group templates from which the future creator of a new community group (in the publish environment) may choose.

* **Allow Privileged Members** 
  If selected, the forum only allows privileged members to post topics by allowing selection of a [privileged members security group](/communities/using/users.md#privileged-members-group). If not selected, all community members are allowed to post. Default is deselected.

* **Allow Publish Creation** 
  If selected, authorized community members can create a group in the publish environment. If deselected, new groups (sub-communities) may only be created in the author environment from the Communities Sites' Groups console.  
  Default is selected.

### Ideation Function {#ideation-function}

The ideation function is a page with one [Ideation component](../../communities/using/ideation-feature.md).

When added to a template, the following dialog opens, which specifies the default Title and URL names, as well as default display settings for the template:

![](assets/chlimage_1-114.png)

* [Title and URL Settings](#title-and-url-settings)
* **Allow Privileged Members** 
  If selected, the forum only allows privileged members to post topics by allowing selection of a [privileged members security group](/communities/using/users.md#privileged-members-group). If not selected, all community members are allowed to post. Default is deselected.

* **Allow File Uploads** 
  If selected, the idea includes the ability for members to upload files. Default is selected.

* **Allow Threaded Replies** 
  If not selected, the idea allows replies (comments) to a topic, but replies to comments are not allowed. Default is selected.

* **Allow Featured Content** 
  If selected, its content is identified as [featured content](/communities/using/featured.md). Default is selected.

### Leaderboard Function {#leaderboard-function}

The leaderboard function is a page with one [Leaderboard component](../../communities/using/enabling-leaderboard.md).

**NOTE**: The Leaderboard component needs further configuration *after* a community site is created from a community template which includes the Leaderboard function. Specify the Leaderboard component's [rules](../../communities/using/enabling-leaderboard.md#rules-tab), which depend on configuration of [scoring and badges](../../communities/using/implementing-scoring.md) for the community site.

When added to a template, the following dialog opens, which specifies the default Title and URL names, as well as default display settings for the template:

![](assets/chlimage_1-115.png)

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

The page function adds a blank page to the community site that it is wired into the features of the community site: login, menu, notifications, messaging, theming and branding. Content is added to the page using the [standard AEM authoring mode](../../sites/authoring/using/editing-content.md).

When added to a template, the only configuration is for the [Title and URL Settings](#title-and-url-settings).

### QnA Function {#qna-function}

The QnA function is a page with a [QnA component](../../communities/using/working-with-qna.md) configured for tagging, file uploads, following, members to self-edit, voting, and moderation.

When added to a template, the configuration allows restriction to privileged members:

![](assets/chlimage_1-116.png)

* [Title and URL Settings](#title-and-url-settings)
* **Allow Pinning** 
  If selected, the forum allows topic replies to be pinned to the beginning of the list of comments. Default is selected.

* **Allow Privileged Members** 
  If selected, the QnA forum only allows privileged members to post questions by allowing selection of a [privileged members group](/communities/using/users.md#privileged-members-group). If not selected, all community members are allowed to post. Default is deselected.

* **Allow File Uploads** 
  If selected, the QnA forum includes the ability for members to upload files. Default is selected.

* **Allow Threaded Replies** 
  If not selected, the QnA forum allows for comments (answers) to a posted question, but replies to answers are not allowed. Default is selected.

* **Allow Featured Content** 
  If selected, its content is identified as [featured content](/communities/using/featured.md). Default is selected.

## Create Community Function {#create-community-function}

The ability to create a community function is reached by selecting the `Create Community Function` icon located at the top of the Community Functions console. Multiple functions based on the same AEM Blueprint may be created and then uniquely customized by opening in author edit mode.

![](assets/chlimage_1-117.png)

#### Community Function Name {#community-function-name}

![](assets/chlimage_1-118.png)

On the Community Function Name panel, a name, description and whether the function is enabled or disabled are configured:

* **Community Function Name ** 
  the function name used for display and storage

* **Community Function Description ** 
  the function description for display

* **Disabled/Enabled ** 
  a toggle switch controlling whether the function is referenceable

#### AEM Blueprint {#aem-blueprint}

![](assets/chlimage_1-119.png)

On the `AEM Blueprint` panel, it is possible to select the blueprint which is the underlying implementation of the community function.

The community function is a mini site that includes one or more pages, pre-wired for inclusion into a community site including login, user profiles, notifications, messaging, site menu, search, theming, and branding features. Once the function is created, it is possible to [open the function](#open-community-function) in author edit mode and customize the page or component settings.

Since the community function is implemented as a [live copy](/sites/administering/using/msm.md#live-copies) of a [blueprint](/sites/administering/using/msm-livecopy.md#creatingablueprint), it is possible to rollout changes made to a function which affects all community site pages created from the [community site template](/communities/using/sites.md) or [community group template](../../communities/using/tools-groups.md) that included the function. It is also possible to disassociate a page from its parent blueprint to make page-level modifications.

See also [Multi Site Manager](/sites/administering/using/msm.md).

#### Thumbnail {#thumbnail}

![](assets/chlimage_1-120.png)

On the Thumbnail panel, an image may be uploaded to display in the [Community Functions console](#community-functions-console).

## Open Community Function {#open-community-function}

![](assets/chlimage_1-121.png)

Select the `Open Community Function` icon to enter author edit mode for authoring the page content and modifying the configuration of the feature component(s).

### Configuring Components {#configuring-components}

A community function is implemented as a Live Copy of an AEM Blueprint, details of which are documented under [Multi Site Manager](/sites/administering/using/msm.md).

It is possible to not only author page content, but to configure components.

If configuring a component on a page of a created community site, it may be necessary to cancel [inheritance](/sites/administering/using/msm-livecopy.md#changing-live-copy-content) to configure the component. Inheritance should be re-established when configuration is completed.

For configuration details, visit [Communities Components](../../communities/using/author-communities.md) for authors.

## Edit Community Function {#edit-community-function}

![](assets/chlimage_1-122.png)

Select the `Edit Community Function` icon to edit the function's properties using the same panels as [creating a community function](#create-community-function), including enabling or disabling the function.

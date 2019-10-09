---
title: Community Groups
seo-title: Community Groups
description: Creating community groups
seo-description: Creating community groups
uuid: 05429b23-9083-498c-9eb3-d49b049d9446
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: authoring
content-type: reference
discoiquuid: 868a3d5d-d505-4ce5-8776-5bbe68a30ccb
---

# Community Groups {#community-groups}

The community groups feature is the ability for a sub-community to be dynamically created within a community site by authorized users (community members and authors) from the publish and author environments.

This ability is present when the [groups function](functions.md#groups-function) is present in the [community site](sites-console.md) structure.

A [community group template](tools-groups.md) provides the design of the community group page when a community group is dynamically created.

One or more group templates are selected for the groups function when the function is added to a community site's structure or to a community site template. This list of group templates is presented to the member or author who dynamically creates a new group from within the community site.

## Creating a New Group {#creating-a-new-group}

The ability to create a new community group relies on the existance of a community site which includes the groups function, such as one created from the ` [Reference Site Template](sites.md)`.

The examples that follow use the community site created from the `Reference Site Template` as described in the [Getting Started with AEM Communities](getting-started.md) tutorial.

This is the page that loads on publish when the **[!UICONTROL Groups]** menu item is selected:

![chlimage_1-236](assets/chlimage_1-236.png)

When you select the **[!UICONTROL New Group]** icon, an edit dialog opens up.

Under the **[!UICONTROL Settings]** tab, you provide the basic features of the group:

![chlimage_1-237](assets/chlimage_1-237.png)

* **[!UICONTROL Group Name]** 
  The title of the group to display on the community site.

* **[!UICONTROL Description]** 
  A description of the group to display on the community site.

* **[!UICONTROL Invite]** 
  A list of members to invite to join the group. Type-ahead search will provide suggestions of community members to invite.

* **[!UICONTROL Group URL Name]** 
  The name for the group page that becomes part of the URL.

* **[!UICONTROL Open Group]** 
  Selecting `Open Group` indicates any anonymous site visitor may view the content, and will de-select `Member Only Group`.

* **[!UICONTROL Member Only Group]** 
  Selecting `Member Only Group` indicates only members of the group may view the content, and will de-select `Open Group`.

Under the **[!UICONTROL Template]** tab is the ability to select from the list of community group templates that were specified when the groups function was included in the community site's structure or in a community site template.

![chlimage_1-238](assets/chlimage_1-238.png)

Under the **[!UICONTROL Image]** tab is the ability to upload an image to display for the group on the community site's Groups page. The default style sheet will size the image to 170 x 90 pixels.

![chlimage_1-239](assets/chlimage_1-239.png)

By selecting the **[!UICONTROL Create Group]** button, the pages for the group are created based on the chosen template, and a user group is created for membership and the Groups page will be updated to show the new sub-community.

For example, the Groups page with a new sub-community titled "Focus Group", for which an image thumbnail was uploaded, will appear as follows (still signed in as a community group administrator):

![chlimage_1-240](assets/chlimage_1-240.png)

Selecting the `Focus Group` link will open the Focus Group page in the browser, which has an initial appearance based on the chosen template, and includes a sub-menu underneath the main community site's menu:

![chlimage_1-241](assets/chlimage_1-241.png)

## Community Group Member List Component {#community-group-member-list-component}

The `Community Group Member List` component is intended for use by developers of group templates.

## Additional Information {#additional-information}

More information may be found on the [Community Group Essentials](essentials-groups.md) page for developers.

For other information related to community groups, visit [Managing Users and User Groups](users.md).

---
title: Group Templates
seo-title: Group Templates
description: How to access the Group Templates console
seo-description: How to access the Group Templates console
uuid: a3c6dfe6-f973-4dcf-9c66-ea52cbe56630
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: administering
content-type: reference
discoiquuid: 9a862756-58e8-47c0-a4b4-5d4aaac021e4
---

# Group Templates {#group-templates}

The Group Templates console is very similar to the [Site Templates](sites.md) console. Both are blueprints for a set of pre-wired pages and features which form a community site. The difference is that a site template is for the main community and a group template is for a community group, a sub-community nested within the main community.

A community group is incorporated into a site template by including the [Groups function](functions.md#groups-function) (which may not be the first nor only function in the template).

As of Communities [feature pack 1](deploy-communities.md#latestfeaturepack), it is possible to nest groups by including the Groups function within a group template.

At the moment the action is taken to create a new community group, the group's template (structure) is selected. The selection depends on how the Groups function was configured when added to the site or group template.

>[!NOTE]
>
>The consoles for the creation of [community sites](sites-console.md), [community site templates](sites.md), [community group templates](tools-groups.md) and [community functions](functions.md) are for use only in the author environment.

## Group Templates Console {#group-templates-console}

In the author environment, to reach the groups templates console

* From global navigation: **[!UICONTROL Tools > Communities > Group Templates]**

This console displays the templates from which a [community site](sites-console.md) can be created and allows new group templates to be created.

![groupstemplate](assets/groupstemplate.png)

## Create Goup Template {#create-goup-template}

To get started creating a new group template, select **[!UICONTROL Create]**

This will bring up the Site Editor panel which contains 3 sub-panels:

### Basic Info {#basic-info}

![chlimage_1-96](assets/chlimage_1-96.png)

On the Basic Info panel, a name, description and whether the template is enabled or disabled are configured:

* **[!UICONTROL New Group Template Name]** 
  The template name id

* **[!UICONTROL Description]** 
  The template description

* **[!UICONTROL Disabled/Enabled]** 
  A toggle switch controlling whether the template is referenceable

### Thumbnail {#thumbnail}

![chlimage_1-97](assets/chlimage_1-97.png)

(Optional) Select the Upload Image icon in order to display a Thumbnail along with the Name and Description to creators of community sites.

### Structure {#structure}

>[!CAUTION]
>
>If working with AEM 6.1 Communities FP4 or earlier, do not add a groups function to a group template.
>
>The nested groups feature is available as of Communities [FP1](communities.md#latestfeaturepack).
>
>It is still not allowed to add a Groups function as the first or only function in a template.

![grptemplateeditor](assets/grptemplateeditor.png)

To add community functions, drag from the right side to the left in the order the site menu links should appear. Styles will be applied to the template during creation of the site.

For example, if you want a forum, drag the forum function from the library and drop under the template builder. This will result in the forum configuration dialog opening. See the [functions console](functions.md) for information about the configuration dialogs.

Continue dragging and dropping any other community functions desired for a sub-community site (group) based on this template.

![dragfunctions](assets/dragfunctions.png)

Once all desired functions have been dropped into the template builder area and configured, select **[!UICONTROL Save]** in the upper right hand corner.

## Edit Group Template {#edit-group-template}

When viewing community groups in the main [Group Templates console](#group-templates-console), it is possible to select an existing group template for edit.

Editing a group template will not affect community sites already created from the template. It is possible to directly [edit a community site](sites-console.md#modify-structure)'s structure instead.

This process provides the same panels as [creating a group template](#create-goup-template).

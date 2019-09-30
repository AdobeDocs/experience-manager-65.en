---
title: Group Templates
seo-title: Group Templates
description: How to access the Group Templates console
seo-description: How to access the Group Templates console
uuid: 4cf20c91-32b0-4051-a98d-44e4eb50a231
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
discoiquuid: e9bfbbce-93fc-455c-a2f7-4ee44e63c03f
docset: aem65

---

# Group Templates{#group-templates}

The Group Templates console is similar to the [Site Templates](/communities/using/sites.md) console. Both are blueprints for a set of pre-wired pages and features which form a community site. The difference is that a site template is for the main community and a group template is for a community group, a sub-community nested within the main community.

A community group is incorporated into a site template by including the [Groups function](../../communities/using/functions.md#groups-function) (which may not be the first nor only function in the template).

As of Communities [feature pack 1](../../communities/using/deploy-communities.md#latestfeaturepack), it is possible to nest groups by including the Groups function within a group template.

The moment an action is taken to create a new community group, the group's template (structure) is selected. The selection depends on how the Groups function was configured when added to the site or group template.

>[!NOTE]
>
>The consoles for the creation of [community sites](../../communities/using/sites-console.md), [community site templates](/communities/using/sites.md), [community group templates](../../communities/using/tools-groups.md) and [community functions](../../communities/using/functions.md) are for use only in the author environment.

## Group Templates Console {#group-templates-console}

To reach the groups templates console in the AEM Author environment:

* Select **Tools | Communities | Group Templates, **from global navigation.

This console displays the templates from which a [community site](../../communities/using/sites-console.md) can be created and allows new group templates to be created.

![Community groups template](assets/groups-template.png)

## Create Group Template {#create-group-template}

To get started creating a new group template, select `Create`

This will bring up the Site Editor panel which contains 3 sub-panels:

#### Basic Info {#basic-info}

![](assets/chlimage_1-137.png)

On the Basic Info panel, a name, description and whether the template is enabled or disabled are configured:

* **New Group Template Name ** 
  the template name id

* **Description** 
  the template description

* **Disabled/Enabled** 
  a toggle switch controlling whether the template is referenceable

#### Thumbnail {#thumbnail}

![](assets/chlimage_1-138.png)

(Optional) Select the Upload Image icon to display a Thumbnail along with the Name and Description to creators of community sites.

#### Structure {#structure}

>[!CAUTION]
>
>If working with AEM 6.1 Communities FP4 or earlier, do not add a groups function to a group template.
>
>The nested groups feature is available as of Communities [FP1](/communities/using/communities.md#latestfeaturepack).
>
>It is still not allowed to add a Groups function as the first or only function in a template.

![Group template editor](assets/template-editor.png)

To add community functions, drag from the right side to the left in the order the site menu links should appear. Styles will be applied to the template during creation of the site.

For example, if you want a forum, drag the forum function from the library and drop under the template builder. This will result in the forum configuration dialog opening. See the [functions console](../../communities/using/functions.md) for information about the configuration dialogs.

Continue drag-and-drop of any other community functions desired for a sub-community site (group) based on this template.

![drag functions](assets/dragfunctions.png)

Once all desired functions have been dropped into the template builder area and configured, select **Save **in the upper right corner.

## Edit Group Template {#edit-group-template}

When viewing community groups in the main [Group Templates console](#group-templates-console), it is possible to select an existing group template for edit.

Editing a group template will not affect community sites already created from the template. It is possible to directly [edit a community site](../../communities/using/sites-console.md#modify-structure)'s structure instead.

This process provides the same panels as [creating a group template](#create-group-template).

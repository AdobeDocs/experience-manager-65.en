---
title: Site Templates
seo-title: Site Templates
description: How to access the Site Templates console
seo-description: How to access the Site Templates console
uuid: d2f7556e-7e43-424e-82f1-41790aeb2d98
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
discoiquuid: 202d7dba-2b34-431d-b10f-87775632807f
role: Administrator
---

# Site Templates {#site-templates}

The Site Templates console is very similar to the [Group Templates](tools-groups.md) console, which is focused on functions of interest to Community groups.

>[!NOTE]
>
>The consoles for the creation of [community sites](sites-console.md), [community site templates](sites.md), [community group templates](tools-groups.md) and [community functions](functions.md) are for use only in the author environment.

## Site Templates Console {#site-templates-console}

In the author environment, to reach the community sites console:

* From global navigation: **[!UICONTROL Tools > Communities > Site Templates]**

This console displays the templates from which a [community site](sites-console.md) can be created and allows new site templates to be created.

![site-template](assets/site-template.png)

## Create Site Template {#create-site-template}

To get started creating a new site template, select `Create`.

This will bring up the Site Editor panel which contains 3 sub-panels:

### Basic info {#basic-info}

![site-template-basicinfo](assets/site-template-basicinfo.png)

On the Basic Info panel, a name, description and whether the template is enabled or disabled are configured:

* **[!UICONTROL Community Site Template Name]**
  
  The template name id.

* **[!UICONTROL Community Site Template Description]**
  
  The template description.

* **[!UICONTROL Disabled/Enabled]**
  
  A toggle switch controlling whether the template is referenceable.

### Thumbnail {#thumbnail}

![site-thumbnail](assets/site-thumbnail.png)

(Optional) Select the Upload Image icon in order to display a thumbnail along with the name and description to creators of community sites.

### Structure {#structure}

![site-structure](assets/site-structure.png)

To add community functions, drag from the right side to the left in the order the site menu links should appear. Styles will be applied to the template during creation of the site.

For example, if you want a home page, drag the Page function from the library and drop under the template builder. This will result in the page configuration dialog opening. See the [functions console](functions.md) for information about the configuration dialogs.

Continue dragging and dropping any other community functions desired for a community site based on this template.

The page function provides an empty page. The groups function provides the ability to create a group site (sub-community) within the community site.

>[!CAUTION]
>
>The groups function must *not* be the *first nor the only* function in the site structure.
>
>Any other function, such as the [page function](functions.md#page-function), must be included and listed first.

![site-editor](assets/site-editor.png)

### Group Templates for Groups Function {#group-templates-for-groups-function}

When including a groups function in the site template, the configuration requires the specification of the group template choices allowed when a new group is created in the publish environment.

>[!CAUTION]
>
>The Groups function must *not* be the *first nor the only* function in the site structure.

![site-functions](assets/site-functions.png)

By selecting two or more community group templates, a choice is provided to the group administrator when actually creating a new group in the community.

![site-function](assets/site-functions1.png)

## Edit Site Template {#edit-site-template}

When viewing site templates in the main [Site Templates console](#site-templates-console), it is possible to select an existing site template for edit.

This process provides the same panels as [creating a site template](#create-site-template).

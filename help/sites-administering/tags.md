---
title: Administering Tags
description: Learn how to manage and administer tags in Adobe Experience Manager.
contentOwner: Chiradeep Majumdar
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: content
content-type: reference
exl-id: ff041ef0-e566-4373-818e-76680ff668d8
solution: Experience Manager, Experience Manager Sites
feature: Administering
role: Admin
---
# Administering Tags {#administering-tags}

Tags are a quick and easy method of classifying content within a website. They can be thought of as keywords or labels (metadata) that allow content to be more quickly found as the result of a search.

In Adobe Experience Manager (AEM), a tag can be a property of

* a content node for a page (see [Using Tags](/help/sites-authoring/tags.md))

* a metadata node for an asset (see [Managing Metadata for Digital Assets](/help/assets/metadata.md))

In addition to pages and assets, tags are used for AEM Communities features

* user generated content (see [Tagging UGC)](/help/communities/tag-ugc.md)

* Enablement Resources (see [Tagging Enablement Resources](/help/communities/functions.md#catalog-function))

## Tag Features {#tag-features}

Some of the features of tags within AEM include:

* Tags can be grouped into various namespaces. Such hierarchies allow taxonomies to be built. These taxonomies are global throughout AEM.
* The main restriction for newly created tags is they must be unique within a specific namespace.
* A tag's title should not include tag path separation chars (nor will they be displayed if present)

    * colon `:` - delimits the namespace tag
    * forward slash `/` - delimits sub-tags

* Tags can be applied by authors and site visitors. Irrespective of their creator, all forms of tags are made available for selection, both when assigning to a page, or when searching.
* Tags can be created and their taxonomy modified by members of the "tag-administrators" group and members who have modification rights to `/content/cq:tags`.

    * A tag that contains child tags is referred to as a container tag
    * A tag that is not a container tag is referred to as a leaf tag
    * A tag namespace is either a leaf tag or container tag

* Tags are used by the [Search component](https://helpx.adobe.com/experience-manager/core-components/using/quick-search.html) to facilitate finding content.
* Tags are used by the [Teaser component](https://helpx.adobe.com/experience-manager/core-components/using/teaser.html), which monitors a user's tag cloud to provide targeted content.
* If tagging is an important aspect of your content

    * make sure to package tags with the pages that use them
    * make sure [tag permissions](#setting-tag-permissions) enable read access

## Tagging Console {#tagging-console}

The Tagging console is used to create and manage tags and their taxonomies. One goal is to avoid having many similar tags relating to basically the same thing : for example, page and pages or footwear and shoes.

Tags are managed by grouping into namespaces, reviewing usage of exiting tags before creating new ones, and re-organizing without disconnecting the tag from currently referenced content.

To access the Tagging console :

* on author
* sign in with administrative privileges
* from global navigation

    * select **`Tools`**
    * select **`General`**
    * select **`Tagging`**

![managing_tags_usingthetagasministrationconsole](assets/managing_tags_usingthetagasministrationconsolea.png)

### Creating a Namespace {#creating-a-namespace}

To create a namespace, select the **`Create Namespace`** icon.

The namespace is itself a tag, and does not to contain any sub-tags. However, to continue creating a taxonomy, [create sub-tags](#creating-tags), which in turn may be either leaf tags or container tags.

![chlimage_1-183](assets/chlimage_1-183a.png) ![creating_tags_andnamespaces](assets/creating_tags_andnamespacesa.png)

* **Title**
  *(required)* A display title for the namespace.

* **Name**
  *(optional)* A name for the namespace. If not specified, a valid node name is created from the Title. See [TagID](/help/sites-developing/framework.md#tagid).

* **Description**
  *(optional)* A description of the namespace.

Once the required information is entered

* select **Create**

### Operations on Tags {#operations-on-tags}

Selecting a namespace or other tag makes available the following operations:

* [View Properties](#viewing-tag-properties)
* [References](#showing-tag-references)
* [Create Tag](#creating-tags)
* [Edit](#editing-tags)
* [Move](#moving-tags)
* [Merge](#merging-tags)
* [Publish](#publishing-tags)
* [Unpublish](#unpublishing-tags)
* [Delete](#deleting-tags)

![chlimage_1-184](assets/chlimage_1-184.png)

When the browser window is not wide enough to display all icons, then the right-most icons are grouped together under a **`... More`** icon, which will display a drop-down list of the hidden operation icons when selected.

![chlimage_1-185](assets/chlimage_1-185.png)

### Selecting a Namespace Tag {#selecting-a-namespace-tag}

When first selected, if the namespace does not contain any tags, then the properties are displayed to the right, else the child tags are displayed. Each tag selected will display either the tags it contains or its properties if it does not have child tags.

To select the tag for operations, and to multi-select, only select the icon next to the title. Selecting the title will only display properties or open the tag to display its contents.

![chlimage_1-186](assets/chlimage_1-186.png) ![chlimage_1-187](assets/chlimage_1-187.png)

### Viewing Tag Properties {#viewing-tag-properties}

![chlimage_1-188](assets/chlimage_1-188.png)

When a namespace or other tag is selected, selecting the **`View Properties`** icon results in the display of information as to the `name`, time of last edit, and number of references. If published, the time it was last published and the id of the publisher are shown. This information will appear in a column to the left of the tag columns.

![chlimage_1-189](assets/chlimage_1-189.png)

### Showing Tag References {#showing-tag-references}

![chlimage_1-190](assets/chlimage_1-190.png)

When a namespace or other tag is selected, selecting the **References** icon will identify the content to which the tag has been applied.

The initial display is a count of tags applied.

![chlimage_1-191](assets/chlimage_1-191.png)

By selecting the arrow to the right of the count, the reference names are listed.

The path to the reference is displayed as a tool tip when hovering over a reference.

![chlimage_1-192](assets/chlimage_1-192.png)

### Creating Tags {#creating-tags}

![chlimage_1-193](assets/chlimage_1-193.png)

When a namespace or other tag is selected (by selecting the icon next to the title), a child tag may be created for the current tag by selecting the **`Create Tag`** icon.

![chlimage_1-194](assets/chlimage_1-194.png)

* **Title**
  *(required) *A display title for the tag.

* **Name**
  *(optional) *A name for the tag. If not specified, a valid node name is created from the Title. See [TagID](/help/sites-developing/framework.md#tagid).

* **Description**
  *(optional) *A description of the tag.

Once the required information is entered

* select **Create**

### Editing Tags {#editing-tags}

![chlimage_1-195](assets/chlimage_1-195.png)

When a namespace or other tag is selected, it is possible to alter the Title, Description, and provide localizations of the Title by selecting the **`Edit`**icon.

After edits are made, select **Save**.

For details about adding language translations, see the section on [Managing Tags in Different Languages](#managing-tags-in-different-languages).

![chlimage_1-196](assets/chlimage_1-196.png)

### Moving Tags {#moving-tags}

![chlimage_1-197](assets/chlimage_1-197.png)

When a namespace or other tag is selected, selecting the **`Move`** icon will allow Tags Administrators and Developers to clean up the taxonomy by moving the tag to a new location or renaming it. When the selected tag is a container tag, moving the tag will move all child tags as well.

>[!NOTE]
>
>It is recommended that Authors only be allowed to [edit](#editing-tags) the tag's `title`, not to move or rename tags.

![chlimage_1-198](assets/chlimage_1-198.png)

* **Path**
  *(readonly)* The current path to the selected tag.

* **Move to**
  Browse to the new path under which to move the tag.

* **Rename to**
  Initially displays the current `name`of the tag. A new `name`may be entered.

* select **Save**

### Merging Tags {#merging-tags}

![chlimage_1-199](assets/chlimage_1-199.png)

Merging tags can be used when a taxonomy has duplicates. When tag A is merged into tag B, all the pages tagged with tag A will be tagged with tag B and tag A is no longer available to authors.

When a namespace or other tag is selected, selecting the **Merge** icon opens a panel where the path to merge into may be selected.

![chlimage_1-200](assets/chlimage_1-200.png)

* **Path**
  *(readonly)* The path of the tag selected to be merged into another tag.

* **Merge into**
  Browse to select the path of the tag to merge into.

>[!NOTE]
>
>After the merge, the **Path** originally selected will (virtually) no longer exist.
>
>When a referenced tag is moved or merged, the tag is not physically deleted such that it is possible to maintain references.

### Publishing Tags {#publishing-tags}

![chlimage_1-201](assets/chlimage_1-201.png)

When a namespace or other tag is selected, selecting the **Publish** icon to activate the tag in the publish environment. Similar to page content, only the selected tag is published, regardless of whether it is a container tag or not.

To publish a taxonomy (a namespace and sub-tags), the best practice is to create a [package](/help/sites-administering/package-manager.md) of the namespace (see [Taxonomy Root Node](/help/sites-developing/framework.md#taxonomy-root-node)). Be sure to [apply permissions](#setting-tag-permissions) to the namespace before creating the package.

### Unpublishing Tags {#unpublishing-tags}

![chlimage_1-202](assets/chlimage_1-202.png)

When a namespace or other tag is selected, selecting the **Unpublish** icon will deactivate the tag in the author environment and remove it from the publish environment. Similar to the `Delete`operation, if the selected tag is a container tag, all of its child tags will be deactivated in the author environment and removed from the publish environment.

### Deleting Tags {#deleting-tags}

![chlimage_1-203](assets/chlimage_1-203.png)

When a namespace or other tag is selected, selecting the **Delete** icon will permanently remove the tag from the author environment. If the tag was published, it is also removed from the publish environment. If the selected tag is a container tag, all of its child tags will be removed as well.

## Setting Tag Permissions {#setting-tag-permissions}

Tag permissions are ['secure (by default)'](/help/sites-administering/production-ready.md); a best practice for the publish environment that requires read permission to be explicitly allowed for tags. Bascially, this is done by creating a package of the Tag Namespace after permissions have been set on author, and installing the package on all publish instances.

* on author instance

    * sign in with administrative privileges
    * access the [Security Console](/help/sites-administering/security.md#accessing-user-administration-with-the-security-console),

        * for example, browse to http://localhost:4502/useradmin

    * in the left pane, select the group (or user) for which [read permission](/help/sites-administering/security.md#permissions) is to be granted
    * in the right pane, locate the **Path **to the Tag Namespace

        * for example, `/content/cq:tags/mycommunity`

    * select the `checkbox`in the **Read** column
    * select **Save**

![chlimage_1-204](assets/chlimage_1-204.png)

* ensure all publish instances have same permissions

    * one approach is to [create a package](/help/sites-administering/package-manager.md#package-manager) of the namespace on author

        * on `Advanced` tab, for `AC Handling` select `Overwrite`

    * replicate the package

        * choose `Replicate` from package manager

## Managing Tags in Different Languages {#managing-tags-in-different-languages}

The `title`property of a tag may be translated into multiple languages. Once translated, the appropriate tag `title`may be displayed according to the user language or to the page language.

### Defining Tag Titles in Multiple Languages {#defining-tag-titles-in-multiple-languages}

The following describes how to translate the `title`of the tag **Animals** from English into German and French.

Start by selecting the tag under the **Stock Photography** namespace and selecting the **`Edit`**icon (see [Editing Tags](#editing-tags) section).

The Edit Tag panel presents the ability to choose languages into which the tag title is to be localized.

As each language is selected, a text entry box appears into which the translated title may be entered.

Once all translations are entered, select **Save** to exit edit mode.

![chlimage_1-205](assets/chlimage_1-205.png)

In general, the language chosen for the tag is taken from the page language, when available. When the [ `tag` widget](/help/sites-developing/building.md#tagging-on-the-client-side) is used in other cases (for example, in forms or in dialog boxes), the tag language depends on the context.

Instead of using the page language setting, the Tagging console uses the user language setting. In the Tagging console, for the 'Animals' tag, 'Animaux' would be displayed for a user who sets the language to French in their user properties.

To add a new language to the dialog, see [Adding a New Language to the Edit Tag Dialog](/help/sites-developing/building.md#adding-a-new-language-to-the-edit-tag-dialog).

>[!NOTE]
>
>The tag cloud and the meta keywords in the standard page component use the localized tag `titles`based on the page language, if available.

## Resources {#resources}

* [Tagging for Developers](/help/sites-developing/tags.md)

  Information about the tagging framework and extending and including tags in custom applications.

* [Classic UI Tagging Console](/help/sites-administering/classic-console.md)

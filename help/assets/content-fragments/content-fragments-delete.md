---
title: Content Fragments - Delete Considerations
seo-title: Content Fragments - Delete Considerations
description: Content Fragments - Delete Considerations
seo-description: Content Fragments - Delete Considerations
uuid: e7ac1809-159f-4d02-ad30-dc6c246e8a04
contentOwner: aheimoz
topic-tags: content-fragments
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
content-type: reference
discoiquuid: ec21237f-9186-49b4-8039-99df4db7c14a
docset: aem65

feature: Content Fragments
role: User, Admin
exl-id: cc212f95-0be0-4705-8dfd-beda9bfb13e0
---
# Content Fragments - Delete Considerations{#content-fragments-delete-considerations}

## Permissions - Delete or Not Delete {#permissions-delete-or-not-delete}

The ability to delete content is powerful, but potentially sensitive, with many industries needing to restrict and control how these privileges are distributed.

With regards to delete permissions, Content Fragments must be considered at two levels:

1. **The Content Fragment as a single entity.**

    * **Use case**: A user who needs to edit/update a content fragment - **and delete an entire fragment**.
    * **Permissions**: The [Delete](/help/sites-administering/security.md#actions) permission can be [assigned through User and/or Group Management](/help/sites-administering/security.md#managing-permissions).

1. **The multiple sub-entities that make up a content fragment; for example, variations, sub-nodes.**

   Basic operation of the content fragment editor requires that such transient sub-elements can be deleted. For example, when manipulating variations; also when editing metadata or managing associated content.

    * **Use case**: A user who needs to edit/update a content fragment - **without being allowed to delete an entire fragment**.
    * **Permissions**: See [Permissions Required for Editor Functionality Only](/help/assets/content-fragments/content-fragments-delete.md#permissions-required-for-editor-functionality-only).

>[!NOTE]
>
>When a user does not have any [Delete](/help/sites-administering/security.md#actions) permissions, the Content Fragment editor operates in *read-only* mode.

>[!NOTE]
>
>See also [How to Audit User Management Operations in AEM](/help/sites-administering/audit-user-management-operations.md).

## Permissions Required for Editor Functionality Only {#permissions-required-for-editor-functionality-only}

For users that need to edit/update a content fragment, **without allowing them to delete an entire fragment**, specific permissions must be assigned, as basic operation of the content fragment editor requires that transient sub-elements can be deleted.

For example, when manipulating variations; also when editing metadata or managing associated content.

>[!NOTE]
>
>The delete permissions, required to edit/update a Content Fragment, are included in the Delete permission [assigned through User and/or Group Management](/help/sites-administering/security.md#managing-permissions).

The permissions needed to edit/update a fragment need to be applied to either the node containing the content fragment, or an appropriate parent node (at any level under `/content/dam`). When assigned to such a parent node, the permissions will be applied to all nodes within that branch.

For example, a folder that will hold all content fragments, such as:

* `/content/dam/contentfragments`

>[!CAUTION]
>
>Setting the permissions on `/content/dam` is also possible, as all content fragments are stored here.
>
>However this action applies the same delete permissions to *all* other asset types as well.

The permissions prerequisite to allowing a specific user and/or group to edit/update a content fragment are:

>[!NOTE]
>
>This list shows all the privileges required, not just the delete privileges.

* For the Content Fragment nodes or folders:

  * `jcr:addChildNodes`, `jcr:modifyProperties`

* For the `jcr:content`node of all Content Fragments:

  * `jcr:addChildNodes`, `jcr:modifyProperties` and `jcr:removeChildNodes`

* For all nodes below `jcr:content` of all Content Fragments:

  * `jcr:addChildNodes`, `jcr:modifyProperties` and `jcr:removeChildNodes`, `jcr:removeNode`

These `remove` privileges must be [administered using Access Control Lists, within CRXDE Lite](/help/sites-administering/user-group-ac-admin.md#access-right-management).

The `add` and `modify` privileges can also be administered in CRXDE Lite, or using the User Management console.

For example, the definition of the `remove` privileges for a group `content-authors-no-delete`:

![cf-delete-03](assets/cf-delete-03.png)

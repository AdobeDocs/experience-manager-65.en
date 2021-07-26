---
title: Tagging User Generated Content
seo-title: Tagging User Generated Content
description: Tagging of user generated content (UGC) is how community members can help other members search for content
seo-description: Tagging of user generated content (UGC) is how community members can help other members search for content
uuid: ce125d7c-6fc1-44c7-9f67-eca6f599d8e3
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
discoiquuid: 1cc8ce66-2c03-44e4-9ddd-8d6944d85c99
role: Admin
exl-id: 1ecb41e5-c959-4380-a5c7-df9fc3a7703a
---
# Tagging User Generated Content {#tagging-user-generated-content}

## Overview {#overview}

Tagging of user generated content (UGC) is the means by which community members can help other members search for content.

Typically, tags are applied by authors and administrators in the author environment. Tagging UGC is unique in that UGC tags are applied by community members in the publish envronment.

The tag namespaces and taxonomies are the same for both applications.

## Communities Features {#communities-features}

The AEM Communities features which can be configured to allow tagging are:

* [Blog](blog-feature.md)
* [Calendar](calendar.md)
* [File Library](file-library.md)
* [Forum](forum.md#configuretheaddedforum)
* [Questions and Answers](working-with-qna.md)

## Administering Tags {#administering-tags}

See [Administering Tags](../../help/sites-administering/tags.md#tagging-console) for creating and managing tag namespaces and taxonomies.

See [Tag Essentials](tag.md) for developer information.

See [Using Social Tag Cloud](tagcloud.md) for adding a Social Tag Cloud component to a page to facilitate searching for posted UGC using the tags applied.

### Tag Permissions {#tag-permissions}

The default permissions are set to not allow tag namespaces to be read by everyone in the publish environment.

Because tags are applied to UGC in the publish environment, read permission needs to be enabled for community members in order for them to be able to select tags to apply.

See [Setting Tag Permissions](../../help/sites-administering/tags.md#setting-tag-permissions).

The following is how it appears in CRXDE when an administrator applies read permissions to `/etc/tag/discussions` for the group `Community Engage Members`.

![tag-permissions](assets/tag-permissions.png)

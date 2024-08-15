---
title: AEM Tagging Framework
description: Tag content and use the AEM Tagging infrastructure
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: platform
content-type: reference
docset: aem65
feature: Developing,Tagging
exl-id: 53a37449-ef87-4fa6-82de-88fdc24cf988
solution: Experience Manager, Experience Manager Sites
role: Developer
---

# AEM Tagging Framework {#aem-tagging-framework}

Tagging allows content to be categorized and organized. Tags can be classified by a namespace and a taxonomy. For detailed information about using tags:

* See the document [Using Tags](/help/sites-authoring/tags.md) for information about tagging content as a content author.
* See the document [Administering Tags](/help/sites-administering/tags.md) for an administrator's perspective about creating and managing tags, and to which content tags have been applied.

This article focuses on the underlying framework which supports tagging in AEM and how to use it as a developer.

## Introduction {#introduction}

To tag content and use the AEM Tagging infrastructure:

* The tag must exist as a node of type `[cq:Tag](#tags-cq-tag-node-type)` under the [taxonomy root node.](#taxonomy-root-node)

* The tagged content node's `NodeType` must include the [`cq:Taggable`](#taggable-content-cq-taggable-mixin) mixin.
* The [`TagID`](#tagid) is added to the content node's [`cq:tags`](#tagged-content-cq-tags-property) property and resolves to a node of type ` [cq:Tag](#tags-cq-tag-node-type)`.

## Tags : cq:Tag Node Type  {#tags-cq-tag-node-type}

The declaration of a tag is captured in the repository in a node of type `cq:Tag`.

A tag can be a simple word (for example, `sky`) or represent a hierarchical taxonomy (for example, `fruit/apple`, meaning both the generic `fruit` and the more specific `apple`).

Tags are identified by a unique TagID.

A tag has optional meta information such as a title, localized titles, and a description. The title should be displayed in user interfaces instead of the TagID, when present.

The tagging framework also provides the ability to restrict authors and site visitors to use only specific, predefined tags.

### Tag Characteristics {#tag-characteristics}

* Node type is `cq:Tag`n
* Node name is a component of the [TagID](#tagid).
* The [TagID](#tagid) always includes a [namespace.](#tag-namespace)
* The `jcr:title` property (the title to display in the UI) is optional.
* The `jcr:description` property is optional.
* When containing child nodes, the tag is referred to as a [container tag.](#container-tags)
* The tag is stored in the repository below a base path called the [taxonomy root node.](#taxonomy-root-node)

Because tags are simply JCR nodes, the node names must abide by the [JCR naming convention.](naming-conventions.md)

### TagID {#tagid}

A TagID identifies a path which resolves to a tag node in the repository.

Typically, the TagID is a shorthand TagID starting with the namespace or it can be an absolute TagID starting from the [taxonomy root node.](#taxonomy-root-node)

When content is tagged, if it does not yet exist, the `[cq:tags](#tagged-content-cq-tags-property)` property is added to the content node and the TagID is added to the property's `String` array value.

The TagID consists of a [namespace](#tag-namespace) followed by the local TagID. [Container tags](#container-tags) have subtags that represent a hierarchical order in the taxonomy. Subtags can be used to reference tags same as any local TagID. For example, tagging content with `fruit` is allowed, even if it is a container tag with subtags, such as `fruit/apple` and `fruit/banana`.

### Taxonomy Root Node {#taxonomy-root-node}

The taxonomy root node is the base path for all tags in the repository. The taxonomy root node must not be a node of type `cq:Tag`.

In AEM, the base path is `/content/cq:tags` and the root node is of type `cq:Folder`.

### Tag Namespace {#tag-namespace}

Namespaces let you group things. The most typical use case is a namespace per site (for example, public, internal, and portal) or per larger application (for example, WCM, Assets, Communities). But namespaces can be used for various other needs. Namespaces are used in the user interface to only show the subset of tags (that is, tags of a certain namespace) that is applicable to the current content.

The tag's namespace is the first level in the taxonomy subtree, which is the node immediately below the [taxonomy root node](#taxonomy-root-node). A namespace is a node of type `cq:Tag` whose parent is not a `cq:Tag` node type.

All tags have a namespace. If no namespace is specified, the tag is assigned to the default namespace, which is TagID `default` with the title `Standard Tags`, that is, `/content/cq:tags/default`.

### Container Tags {#container-tags}

A container tag is a node of type `cq:Tag` containing any number and type of child nodes, which makes it possible to enhance the tag model with custom metadata.

Furthermore, container tags (or super tags) in a taxonomy serve as the subsumption of all subtags. For example, content tagged with `fruit/apple` is considered to be tagged with `fruit` as well. That is, searching for content tagged with `fruit` would also find the content tagged with `fruit/apple`.

### Resolving TagIDs {#resolving-tagids}

If the TagID contains a colon (`:`), the colon separates the namespace from the tag or subtaxonomy, which is further separated with slashes (`/`). If the TagID does not have a colon, the default namespace is implied.

The standard and only location of tags is below `/content/cq:tags`.

Tag referencing non-existing paths or paths that do not point to a `cq:Tag` node are considered invalid and are ignored.

The following table shows some sample TagIDs, their elements, and how the TagID resolves to an absolute path in the repository:

|TagID|Namespace|Local ID|Container Tags|Leaf Tag|Repository Absolute Tag Path|
|---|---|---|---|---|---|
|`dam:fruit/apple/braeburn`|`dam`|`fruit/apple/braeburn`|`fruit`, `apple`|`braeburn`|`/content/cq:tags/dam/fruit/apple/braeburn`|
|`color/red`|`default`|`color/red`|`color`|`red`|`/content/cq:tags/default/color/red`|
|`sky`|`default`|`sky`|None|`sky`|`/content/cq:tags/default/sky`|
|`dam:`|`dam`|None|None|None, the namespace|`/content/cq:tags/dam`|
|`/content/cq:tags/category/car`|`category`|`car`|`car`|`car`|`/content/cq:tags/category/car`|

### Localization of Tag Title {#localization-of-tag-title}

When the tag includes the optional title string ( `jcr:title`), it is possible to localize the title for display by adding the property `jcr:title.<locale>`.

For more details, see the following documents:

* [Tags in Different Languages](/help/sites-developing/building.md#tags-in-different-languages), which describes use of the APIs
* [Managing Tags in Different Languages](/help/sites-administering/tags.md#managing-tags-in-different-languages), which describes use of the tagging console

### Access Control {#access-control}

Tags exist as nodes in the repository under the [taxonomy root node](#taxonomy-root-node). Allowing or denying authors and site visitors to create tags in a given namespace can be achieved by setting appropriate ACLs in the repository.

Also, denying read permissions for certain tags or namespaces controls the ability to apply tags to specific content.

A typical practice includes:

* Allowing the `tag-administrators` group/role write access to all namespaces (add/modify under `/content/cq:tags`). This group comes with AEM out-of-the-box.
* Allowing users/authors read access to all the namespaces that should be readable to them (mostly all).
* Allowing users/authors write access to those namespaces where tags should be freely definable by users/authors (add a node under `/content/cq:tags/some_namespace`)

## Taggable Content : cq:Taggable Mixin {#taggable-content-cq-taggable-mixin}

For application developers to attach tagging to a content type, the node's registration ([CND](https://jackrabbit.apache.org/jcr/node-type-notation.html)) must include the `cq:Taggable` mixin or the `cq:OwnerTaggable` mixin.

The `cq:OwnerTaggable` mixin, which inherits from `cq:Taggable`, is intended to indicate that the content can be classified by the owner/author. In AEM, it is only an attribute of the `cq:PageContent` node. The `cq:OwnerTaggable` mixin is not required by the tagging framework.

>[!NOTE]
>
>It is recommended to only enable tags on the top-level node of an aggregated content item (or on its `jcr:content` node). Examples include:
>
>* Pages (`cq:Page`) where the `jcr:content`node is of type `cq:PageContent` which includes the `cq:Taggable` mixin
>* Assets ( `cq:Asset`) where the `jcr:content/metadata` node always has the `cq:Taggable` mixin
>

### Node Type Notation (CND) {#node-type-notation-cnd}

Node type definitions exist in the repository as CND files. The CND notation is defined as part of the [Jackrabbit documentation](https://jackrabbit.apache.org/jcr/node-type-notation.html).

The essential definitions for the Node Types included in AEM are as follows:

```xml

[cq:Tag] > mix:title, nt:base
    orderable
    - * (undefined) multiple
    - * (undefined)
    + * (nt:base) = cq:Tag version

[cq:Taggable]
    mixin
    - cq:tags (string) multiple

[cq:OwnerTaggable] > cq:Taggable
    mixin

```

## Tagged Content: cq:tags Property {#tagged-content-cq-tags-property}

The `cq:tags` property is a `String` array used to store one or more TagIDs when they are applied to content by authors or site visitors. The property only has meaning when added to a node which is defined with the `[cq:Taggable](#taggable-content-cq-taggable-mixin)` mixin.

>[!NOTE]
>
>To use AEM tagging functionality, custom developed applications should not define tag properties other than `cq:tags`.

## Moving and Merging Tags {#moving-and-merging-tags}

The following is a description of the effects in the repository when moving or merging tags using the [tagging console](/help/sites-administering/tags.md):

* When a tag A is moved or merged into tag B under `/content/cq:tags`:

  * Tag A is not deleted and gets a `cq:movedTo` property.
  * Tag B is created (if there was a move) and gets a `cq:backlinks` property.

* `cq:movedTo` points to tag B.
  
  * This property means that tag A has been moved or merged into tag B. Moving tag B updates this property accordingly. Tag A is thus hidden and is only kept in the repository to resolve tag IDs in content nodes pointing to tag A. The tag garbage collector removes tags like tag A once no more content nodes point to them.
  
  * A special value for the `cq:movedTo` property is `nirvana`. It is applied when the tag is deleted but cannot be removed from the repository because there are subtags with a `cq:movedTo` that must be kept.

  >[!NOTE]
  >
  >The `cq:movedTo` property is only added to the moved or merged tag if either of these conditions are met:
  >
  >1. Tag is used in content (meaning that it has a reference) or
  >1. Tag has children that have already been moved.

* `cq:backlinks` keeps the references in the other direction. That is, it keeps a list of all the tags that have been moved to or merged with tag B. This is mostly required to keep `cq:movedTo` properties up to date when tag B is moved/merged/deleted as well or when tag B is activated, in which case all its backlinks tags must be activated as well.

  >[!NOTE]
  >
  >The `cq:backlinks` property is only added to the moved or merged tag if either of these conditions are met:
  >
  >1. Tag is used in content (meaning that it has a reference) OR
  >1. Tag has children that have already been moved.

* Reading a `cq:tags` property of a content node involves the following resolution:

  1. If there is no match under `/content/cq:tags`, no tag is returned.
  
  1. If the tag has a `cq:movedTo` property set, the referenced tag ID is followed.
  
     * This step is repeated as long as the followed tag has a `cq:movedTo` property.

  1. If the followed tag does not have a `cq:movedTo` property, the tag is read.

* To publish the change when a tag has been moved or merged, the `cq:Tag` node and all its backlinks must be replicated. This is automatically done when the tag is activated in the tag administration console.

* Later updates to the page's `cq:tags` property automatically clean the old references. This is triggered because resolving a moved tag through the API returns the destination tag, thus providing the destination tag ID.

>[!NOTE]
>
>Movement of tags is different from migration of tags.

## Tag Migration {#tags-migration}

Since Adobe Experience Manager 6.4, tags are stored under `/content/cq:tags` whereas previous versions stored tags under `/etc/tags`. 

Whenever upgrading an AEM system from a version prior to 6.4, tags must be migrated to `/content/cq:tags`. See [Common Repository Restructuring in AEM 6.5](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#tags) for more information.

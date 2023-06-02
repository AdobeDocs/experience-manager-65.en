---
title: Building Tagging into an AEM Application
seo-title: Building Tagging into an AEM Application
description: Programmatically work with tags or extending tags within a custom AEM application
seo-description: Programmatically work with tags or extending tags within a custom AEM application
uuid: 0549552e-0d51-4162-b418-babf4ceee046
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: platform
content-type: reference
discoiquuid: 032aea1f-0105-4299-8d32-ba6bee78437f
feature: Tagging
exl-id: d885520d-d0ed-45fa-8511-faa2495d667a
---
# Building Tagging into an AEM Application{#building-tagging-into-an-aem-application}

For programmatically working with tags or extending tags within a custom AEM application, this page describes use of the

* [Tagging API](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/day/cq/tagging/package-summary.html)

That interacts with the

* [Tagging framework](/help/sites-developing/framework.md)

For related information regarding tagging, see :

* [Administering Tags](/help/sites-administering/tags.md) for information about creating and managing tags, and to which content tags have been applied.
* [Using Tags](/help/sites-authoring/tags.md) for information about tagging content.

## Overview of the Tagging API {#overview-of-the-tagging-api}

The implementation of the [tagging framework](/help/sites-developing/framework.md) in AEM allows management of tags and tag content using the JCR API . The TagManager ensures that tags entered as values on the `cq:tags` string array property are not duplicated, it removes TagIDs pointing to non-existing tags and updates TagIDs for moved or merged tags. TagManager uses a JCR observation listener that reverts any incorrect changes. The main classes are in the [com.day.cq.tagging](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/index.html?com/day/cq/tagging/package-summary.html) package:

* JcrTagManagerFactory - returns a JCR-based implementation of a `TagManager`. It is the reference implementation of the Tagging API.
* `TagManager` - allows for resolving and creating tags by paths and names.
* `Tag` - defines the tag object.

### Getting a JCR-based TagManager {#getting-a-jcr-based-tagmanager}

To retrieve a TagManager instance, you must have a JCR `Session` and to call `getTagManager(Session)`:

```java
@Reference
JcrTagManagerFactory jcrTagManagerFactory;

TagManager tagManager = jcrTagManagerFactory.getTagManager(session);
```

In the typical Sling context, you can also adapt to a `TagManager` from the `ResourceResolver`:

```java
TagManager tagManager = resourceResolver.adaptTo(TagManager.class);
```

### Retrieving a Tag object {#retrieving-a-tag-object}

A `Tag` can be retrieved through the `TagManager`, by either resolving an existing tag or creating one:

```java
Tag tag = tagManager.resolve("my/tag"); // for existing tags

Tag tag = tagManager.createTag("my/tag"); // for new tags
```

For the JCR-based implementation, which maps `Tags` onto JCR `Nodes`, you can directly use Sling's `adaptTo` mechanism if you have the resource (for example, such as `/content/cq:tags/default/my/tag`):

```java
Tag tag = resource.adaptTo(Tag.class);
```

While a tag may only be converted *from *a resource (not a node), a tag can be converted *to *both a node and a resource :

```java
Node node = tag.adaptTo(Node.class);
Resource node = tag.adaptTo(Resource.class);
```

>[!NOTE]
>
>Directly adapting from `Node` to `Tag` is not possible, because `Node` does not implement the Sling `Adaptable.adaptTo(Class)` method.

### Getting and Setting Tags {#getting-and-setting-tags}

```java
// Getting the tags of a Resource:
Tag[] tags = tagManager.getTags(resource);

// Setting tags to a Resource:
tagManager.setTags(resource, tags);
```

### Searching for Tags {#searching-for-tags}

```java
// Searching for the Resource objects that are tagged with the tag object:
Iterator<Resource> it = tag.find();

// Retrieving the usage count of the tag object:
long count = tag.getCount();

// Searching for the Resource objects that are tagged with the tagID String:
 RangeIterator<Resource> it = tagManager.find(tagID);
```

>[!NOTE]
>
>The valid `RangeIterator` to use is:
>
>`com.day.cq.commons.RangeIterator`

### Deleting Tags {#deleting-tags}

```java
tagManager.deleteTag(tag);
```

### Replicating Tags {#replicating-tags}

It is possible to use the replication service ( `Replicator`) with tags because tags are of type `nt:hierarchyNode`:

```java
replicator.replicate(session, replicationActionType, tagPath);
```

## Tagging on the Client Side {#tagging-on-the-client-side}

The form widget `CQ.tagging.TagInputField` is for entering tags. It has a popup menu for selecting from existing tags, includes auto-completion and many other features. Its xtype is `tags`.

## The Tag Garbage Collector {#the-tag-garbage-collector}

The tag garbage collector is a background service that cleans up the tags that are hidden and unused. Hidden and unused tags are tags below `/content/cq:tags` that have a `cq:movedTo` property and are not used on a content node - they have a count of zero. By using this lazy deletion process, the content node (that is, the `cq:tags` property) does not have to be updated as part of the move or the merge operation. The references in the `cq:tags` property are automatically updated when the `cq:tags` property is updated, for example, through the page properties dialog.

The tag garbage collector runs by default once a day. You can configure it at:

```xml
http://localhost:4502/system/console/configMgr/com.day.cq.tagging.impl.TagGarbageCollector
```

## Tag Search and Tag Listing {#tag-search-and-tag-listing}

The search for tags and the tag listing work as follows:

* The search for TagID searches for the tags that have the property `cq:movedTo` set to TagID and follows through the `cq:movedTo` TagIDs.

* The search for tag Title only searches the tags that do not have a `cq:movedTo` property.

## Tags in Different Languages {#tags-in-different-languages}

As described in the documentation for administering tags, in the section [Managing Tags in Different Languages](/help/sites-administering/tags.md#managing-tags-in-different-languages), a tag `title`can be defined in different languages. A language sensitive property is then added to the tag node. This property has the format `jcr:title.<locale>`, for example, `jcr:title.fr` for the French translation. The `<locale>` must be a lower case ISO locale string and use "_" instead of "-", for example: `de_ch`.

When the **Animals** tag is added to the **Products** page, the value `stockphotography:animals` is added to the property `cq:tags` of the node /content/geometrixx/en/products/jcr:content. The translation is referenced from the tag node.

The server-side API has localized `title`-related methods:

* [com.day.cq.tagging.Tag](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/index.html?com/day/cq/tagging/Tag.html)

    * getLocalizedTitle(Locale locale)
    * getLocalizedTitlePaths()
    * getLocalizedTitles()
    * getTitle(Locale locale)
    * getTitlePath(Locale locale)

* [com.day.cq.tagging.TagManager](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/index.html?com/day/cq/tagging/TagManager.html)

    * canCreateTagByTitle(String tagTitlePath, Locale locale)
    * createTagByTitle(String tagTitlePath, Locale locale)
    * resolveByTitle(String tagTitlePath, Locale locale)

In AEM, the language can be obtained either from the page language or from the user language:

* to retrieve the page language in a JSP:

    * `currentPage.getLanguage(false)`

* to retrieve the user language in a JSP:

    * `slingRequest.getLocale()`

The `currentPage` and `slingRequest` are available in a JSP through the [&lt;cq:definedObjects&gt;](/help/sites-developing/taglib.md) tag.

For tagging, localization depends on the context as tag `titles`can be displayed in the page language, in the user language, or in any other language.

### Adding a New Language to the Edit Tag Dialog {#adding-a-new-language-to-the-edit-tag-dialog}

The following procedure describes how to add a language (Finnish) to the **Tag Edit** dialog:

1. In **CRXDE**, edit the multi-value property `languages` of the node `/content/cq:tags`.

1. Add `fi_fi` - which represents the Finnish locale - and save the changes.

The new language (Finnish) is now available in the tag dialog of the page properties and in the **Edit Tag** dialog when editing a tag in the **Tagging** console.

>[!NOTE]
>
>The new language must be one of the AEM recognized languages. That is, it must be available as a node below `/libs/wcm/core/resources/languages`.

>[!CAUTION]
>
>Installing a service pack resets the languages property of the /content/cq:tags node to default. Therefore, it is necessary to add it from the properties before installation.

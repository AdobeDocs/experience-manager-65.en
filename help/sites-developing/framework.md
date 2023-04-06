---
title: AEM Tagging Framework
seo-title: AEM Tagging Framework
description: Tag content and leverage the AEM Tagging infrastructure
seo-description: Tag content and leverage the AEM Tagging infrastructure
uuid: f80a2cb1-359f-41dd-a70b-626d92cc3d4c
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: platform
content-type: reference
discoiquuid: f69db472-9f5c-4c0d-9292-2920ef69feeb
docset: aem65
feature: Tagging
exl-id: 53a37449-ef87-4fa6-82de-88fdc24cf988
---
# AEM Tagging Framework {#aem-tagging-framework}

To tag content and leverage the AEM Tagging infrastructure :

* The tag must exist as a node of type ` [cq:Tag](#tags-cq-tag-node-type)` under the [taxonomy root node](#taxonomy-root-node)

* The tagged content node's NodeType must include the [ `cq:Taggable`](#taggable-content-cq-taggable-mixin) mixin
* The [TagID](#tagid) is added to the content node's [ `cq:tags`](#tagged-content-cq-tags-property) property and resolves to a node of type ` [cq:Tag](#tags-cq-tag-node-type)`

## Tags : cq:Tag Node Type  {#tags-cq-tag-node-type}

The declaration of a tag is captured in the repository in a node of type `cq:Tag.`

A tag can be a simple word (e.g. sky) or represent a hierarchical taxonomy (e.g. fruit/apple, meaning both the generic fruit and the more specific apple).

Tags are identified by a unique TagID.

A tag has optional meta information such as a title, localized titles and a description. The title should be displayed in user interfaces instead of the TagID, when present.

The tagging framework also provides the ability to restrict authors and site visitors to use only specific, predefined tags.

### Tag Characteristics {#tag-characteristics}

* node type is `cq:Tag`
* node name is a component of the ` [TagID](#tagid)`
* the ` [TagID](#tagid)` always includes a [namespace](#tag-namespace)

* optional `jcr:title` property (the Title to display in the UI)

* optional `jcr:description` property

* when containing child nodes, is referred to as a [container tag](#container-tags)
* is stored in the repository below a base path called the [taxonomy root node](#taxonomy-root-node)

### TagID {#tagid}

A TagID identifies a path which resolves to a tag node in the repository.

Typically, the TagID is a shorthand TagID starting with the namespace or it can be an absolute TagID starting from the [taxonomy root node](#taxonomy-root-node).

When content is tagged, if it does not yet exist, the ` [cq:tags](#tagged-content-cq-tags-property)` property is added to the content node and the TagID is added to the property's String array value.

The TagID consists of a [namespace](#tag-namespace) followed by the local TagID. [Container tags](#container-tags) have sub-tags that represent a hierarchical order in the taxonomy. Sub-tags can be used to reference tags same as any local TagID. For example tagging content with "fruit" is allowed, even if it is a container tag with sub-tags, such as "fruit/apple" and "fruit/banana".

### Taxonomy Root Node {#taxonomy-root-node}

The taxonomy root node is the base path for all tags in the repository. The taxonomy root node must *not* be a node of type `  cq   :Tag`.

In AEM, the base path is `/content/  cq   :tags` and the root node is of type `  cq   :Folder`.

### Tag Namespace {#tag-namespace}

Namespaces allow to group things. The most typical use-case is to have a namespace per (web)site (for example public, internal, and portal) or per larger application (e.g. WCM, Assets, Communities) but namespaces can be used for various other needs. Namespaces are used in the user interface to only show the subset of tags (i.e. tags of a certain namespace) that is applicable to the current content.

The tag's namespace is the first level in the taxonomy subtree, which is the node immediately below the [taxonomy root node](#taxonomy-root-node). A namespace is a node of type `cq:Tag` whose parent is not a `cq:Tag`node type.

All tags have a namespace. If no namespace is specified, the tag is assigned to the default namespace, which is TagID `default` (Title is `Standard Tags),`that is `/content/cq:tags/default.`

### Container Tags {#container-tags}

A container tag is a node of type `cq:Tag` containing any number and type of child nodes, which makes it possible to enhance the tag model with custom metadata.

Furthermore, container tags (or super-tags) in a taxonomy serve as the sub-summation of all sub-tags: for example content tagged with fruit/apple is considered to be tagged with fruit as well, i.e. searching for content just tagged with fruit would also find the content tagged with fruit/apple.

### Resolving TagIDs {#resolving-tagids}

If the tag ID contains a colon ":", the colon separates the namespace from the tag or sub-taxonomy, which are then separated with normal slashes "/". If the tag ID does not have a colon, the default namespace is implied.

The standard and only location of tags is below /content/cq:tags.

Tag referencing non-existing paths or paths that do not point to a cq:Tag node are considered invalid and are ignored.

The following table shows some sample TagIDs, their elements, and how the TagID resolves to an absolute path in the repository:

The following table shows some sample TagIDs, their elements, and how the TagID resolves to an absolute path in the repository :

<table>
 <tbody>
  <tr>
   <td><strong>TagID<br /> </strong></td>
   <td><strong>Namespace</strong></td>
   <td><strong>Local ID</strong></td>
   <td><strong>Container tag(s)</strong></td>
   <td><strong>Leaf tag</strong></td>
   <td><strong>Repository<br /> Absolute tag path</strong></td>
  </tr>
  <tr>
   <td>dam:fruit/apple/braeburn</td>
   <td>dam</td>
   <td>fruit/apple/braeburn</td>
   <td>fruit, apple</td>
   <td>braeburn</td>
   <td>/content/cq:tags/dam/fruit/apple/braeburn</td>
  </tr>
  <tr>
   <td>color/red</td>
   <td>default</td>
   <td>color/red</td>
   <td>color</td>
   <td>red</td>
   <td>/content/cq:tags/default/color/red</td>
  </tr>
  <tr>
   <td>sky</td>
   <td>default</td>
   <td>sky</td>
   <td>(none)</td>
   <td>sky</td>
   <td>/content/cq:tags/default/sky</td>
  </tr>
  <tr>
   <td>dam:</td>
   <td>dam</td>
   <td>(none)</td>
   <td>(none)</td>
   <td>(none, the namespace)</td>
   <td>/content/cq:tags/dam</td>
  </tr>
  <tr>
   <td>/content/cq:tags/category/car</td>
   <td>category</td>
   <td>car</td>
   <td>car</td>
   <td>car</td>
   <td>/content/cq:tags/category/car</td>
  </tr>
 </tbody>
</table>

### Localization of Tag Title {#localization-of-tag-title}

When the tag includes the optional title string ( `jcr:title`) it is possible to localize the title for display by adding the property `jcr:title.<locale>`.

For more details see

* [Tags in Different Languages](/help/sites-developing/building.md#tags-in-different-languages) - which describes use of the APIs
* [Managing Tags in Different Languages](/help/sites-administering/tags.md#managing-tags-in-different-languages) - which describes use of the Tagging console

### Access Control {#access-control}

Tags exist as nodes in the repository under the [taxonomy root node](#taxonomy-root-node). Allowing or denying authors and site visitors to create tags in a given namespace can be achieved by setting appropiate ACLs in the repository.

Also, denying read permissions for certains tags or namespaces will control the ability to apply tags to specific content.

A typical practice includes:

* Allowing the `tag-administrators` group/role write access to all namespaces (add/modify under `/content/cq:tags`). This group comes with AEM out-of-the-box.

* Allowing users/authors read access to all the namespaces that should be readable to them (mostly all).
* Allowing users/authors write access to those namespaces where tags should be freely definable by users/authors (add_node under `/content/cq:tags/some_namespace`)

## Taggable Content : cq:Taggable Mixin {#taggable-content-cq-taggable-mixin}

In order for application developers to attach tagging to a content type, the node's registration ([CND](https://jackrabbit.apache.org/node-type-notation.html)) must include the `cq:Taggable` mixin or the `cq:OwnerTaggable` mixin.

The `cq:OwnerTaggable` mixin, which inherits from `cq:Taggable`, is intended to indicate that the content can be classified by the owner/author. In AEM, it is only an attribute of the `cq:PageContent` node. The `cq:OwnerTaggable` mixin is not required by the tagging framework.

>[!NOTE]
>
>It is recommended to only enable tags on the top-level node of an aggregated content item (or on its jcr:content node). Examples include:
>
>* pages ( `cq:Page`) where the `jcr:content`node is of type `cq:PageContent` which includes the `cq:Taggable` mixin.
>
>* assets ( `cq:Asset`) where the `jcr:content/metadata` node always has the `cq:Taggable` mixin.
>

### Node Type Notation (CND) {#node-type-notation-cnd}

Node Type definitions exist in the repository as CND files. The CND notation is defined as part of the JCR documentation [here](https://jackrabbit.apache.org/node-type-notation.html).

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

The `cq:tags` property is a String array used to store one or more TagIDs when they are applied to content by authors or site visitors. The property only has meaning when added to a node which is defined with the `[cq:Taggable](#taggable-content-cq-taggable-mixin)` mixin.

>[!NOTE]
>
>To leverage AEM tagging functionality, custom developed applications should not define tag properties other than `cq:tags`.

## Moving and Merging Tags {#moving-and-merging-tags}

The following is a description of the effects in the repository when moving or merging tags using the [Tagging console](/help/sites-administering/tags.md):

* When a tag A is moved or merged into tag B under `/content/cq:tags`:

  * tag A is not deleted and gets a `cq:movedTo` property.
  * tag B is created (in case of a move) and gets a `cq:backlinks` property.

* `cq:movedTo` points to tag B.
  This property means that tag A has been moved or merged into tag B. Moving tag B will update this property accordingly. Tag A is thus hidden and is only kept in the repository to resolve tag IDs in content nodes pointing to tag A. The tag garbage collector removes tags like tag A once no more content nodes point to them.
  A special value for the `cq:movedTo` property is `nirvana`: it is applied when the tag is deleted but cannot be removed from the repository because there are subtags with a `cq:movedTo` that must be kept.

    >[!NOTE]
    >
    >The `cq:movedTo` property is only added to the moved or merged tag if either of these conditions are met:
    >
    >1. Tag is used in content (meaning it has a reference) OR
    >1. Tag has children that have already been moved.

* `cq:backlinks` keeps the references in the other direction, i.e. it keeps a list of all the tags that have been moved to or merged with tag B. This is mostly required to keep `cq:movedTo`properties up to date when tag B is moved/merged/deleted as well or when tag B is activated, in which case all its backlinks tags must be activated as well.

    >[!NOTE]
    >
    >The `cq:backlinks` property is only added to the moved or merged tag if either of these conditions are met:
    >
    >1. Tag is used in content (meaning it has a reference) OR
    >1. Tag has children that have already been moved.

* Reading a `cq:tags` property of a content node involves the following resolving:

    1. If there is no match under `/content/cq:tags`, no tag is returned.
    1. If the tag has a `cq:movedTo` property set, the referenced tag ID is followed.
       This step is repeated as long as the followed tag has a `cq:movedTo` property.

    1. If the followed tag does not have a `cq:movedTo` property, the tag is read.

* To publish the change when a tag has been moved or merged, the `cq:Tag` node and all its backlinks must be replicated: this is automatically done when the tag is activated in the tag administration console.

* Later updates to the page's `cq:tags` property automatically clean up the "old" references. This is triggered because resolving a moved tag through the API returns the destination tag, thus providing the destination tag ID.

>[!NOTE]
>
>Movement of tags is different from migration of tags.

## Tags migration {#tags-migration}

Experience Manager 6.4 onwards tags are stored under `/content/cq:tags`, which were earlier stored under `/etc/tags`. However, in scenarios where Adobe Experience Manager has been upgraded from previous version the tags are still present under the old location `/etc/tags`. In upgraded systems tags need to be migrated under `/content/cq:tags`.

>[!NOTE]
>
>In Page Properties of tags page, it is advised to use tag ID (`geometrixx-outdoors:activity/biking`) instead of hard coding the tag base path (for example, `/etc/tags/geometrixx-outdoors/activity/biking`).
>
>To list tags, `com.day.cq.tagging.servlets.TagListServlet` can be used.

>[!NOTE]
>
>It is advised to use tag manager API as resource.

### If Upgraded AEM instance supports TagManager API {#upgraded-instance-support-tagmanager-api}

1. At the start of component, TagManager API detects whether it is an upgraded AEM instance. In upgraded system, tags are stored under `/etc/tags`.

1. The TagManager API then runs in backward compatibility mode, which means the API uses `/etc/tags` as the base path. If not, it uses new location `/content/cq:tags`.

1. Update the tags location.

1. After migrating tags to the new location, run the following script:

```java

import org.apache.sling.api.resource.*
import javax.jcr.*

ResourceResolverFactory resourceResolverFactory = osgi.getService(ResourceResolverFactory.class);
ResourceResolver resolver = resourceResolverFactory.getAdministrativeResourceResolver(null);
Session session = resolver.adaptTo(Session.class);

def queryManager = session.workspace.queryManager;
def statement = "/jcr:root/content/cq:tags//element(*, cq:Tag)[jcr:contains(@cq:movedTo,\'/etc/tags\') or jcr:contains(@cq:backlinks,\'/etc/tags\')]";
def query = queryManager.createQuery(statement, "xpath");

println "query = ${query.statement}\n";

def tags = query.execute().getNodes();


tags.each { node ->
  def tagPath = node.path;
  println "tag = ${tagPath}";

  if(node.hasProperty("cq:movedTo") && node.getProperty("cq:movedTo").getValue().toString().startsWith("/etc/tags"))
    {
     def movedTo = node.getProperty("cq:movedTo").getValue().toString();

     println "cq:movedTo = ${movedTo} \n";

     movedTo = movedTo.replace("/etc/tags","/content/cq:tags");
     node.setProperty("cq:movedTo",movedTo);
     } else if(node.hasProperty("cq:backlinks")){

     String[] backLinks = node.getProperty("cq:backlinks").getValues();
     int count = 0;

     backLinks.each { value ->
             if(value.startsWith("/etc/tags")){
                     println "cq:backlinks = ${value}\n";
                     backLinks[count] = value.replace("/etc/tags","/content/cq:tags");
    }
             count++;
     }

    node.setProperty("cq:backlinks",backLinks);
  }
}
session.save();

println "---------------------------------Success-------------------------------------"
```

The script fetches all those tags that have `/etc/tags` in the value of `cq:movedTo/cq:backLinks` property. It then iterates through the fetched result set and resolves the `cq:movedTo` and `cq:backlinks` property values to `/content/cq:tags` paths (in the case where `/etc/tags` is detected in the value).

### If upgraded AEM instance runs on Classic UI {#upgraded-instance-runs-classic-ui}

>[!NOTE]
>
>Classic UI is not zero downtime compliant and does not support new tag base path. If you want to use classic UI than `/etc/tags` needs to be created followed by `cq-tagging` component restart.

In case of upgraded AEM instances supported by TagManager API and running in Classic UI:

1. Once references to old tag base path `/etc/tags` are replaced by using tagId or new tag location `/content/cq:tags`, you can migrate tags to the new location `/content/cq:tags` in CRX followed by component restart.

1. After migrating tags to the new location, run the above mentioned script.

---
title: Data Modeling - David Nuescheler's Model
description: David Nuescheler's content modeling recommendations
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: introduction
content-type: reference
exl-id: 6ce6a204-db59-4ed2-8383-00c6afba82b4
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Data Modeling - David Nuescheler's Model{#data-modeling-david-nuescheler-s-model}

## Source {#source}

The following details are ideas and comments expressed by David Nuescheler.

David was co-founder and CTO of Day Software AG, a leading provider of global content management and content infrastructure software, which was acquired by Adobe in 2010. David is now a fellow and VP of Enterprise Technology at Adobe and also leads the development of JSR-170, the Java&trade; Content Repository (JCR) application programming interface (API), the technology standard for content management.

Further updates can also be seen on [https://cwiki.apache.org/confluence/display/jackrabbit/DavidsModel](https://cwiki.apache.org/confluence/display/jackrabbit/DavidsModel).

## Introduction from David {#introduction-from-david}

In various discussions, I found that developers are somewhat at unease with the features and functionalities presented by JCR when content modeling. There is no guide and little experience yet on how to model content in a repository and why one content model is better than the other.

While in the relational world, the software industry has experience on how to model data, it is still at the early stages for the content repository space.

I would like to start filling this void by expressing my opinions on how content should be modeled. My hope is that this could some day graduate into something more meaningful to the developer's community, which is not just "my opinion" but something that is more generally applicable. So consider this my quickly evolving first stab at it.

>[!NOTE]
>
>Disclaimer: These guidelines express my personal, sometimes controversial views. I am looking forward to debating these guidelines and refine them.

## Seven Simple Rules {#seven-simple-rules}

### Rule #1: Data first, structure later. Maybe. {#rule-data-first-structure-later-maybe}

#### Explanation {#explanation-1}

I recommend not to worry about a declared data structure in an ERD sense. Initially.

Learn to love nt:unstructured (& friends) in development.

My bottom line: Structure is expensive and often it is entirely unnecessary to explicitly declare structure to the underlying storage.

There is an implicit contract about structure that your application inherently uses. Let's say I store the modification date of a blog post in a lastModified property. My App automatically knows to read the modification date from that same property again, there is really no need to declare that explicitly.

Further data constraints like mandatory or type and value constraints should only be applied where required for data integrity reasons.

#### Example {#example-1}

The above example of using a `lastModified` Date property on for example, "blog post" node, really does not mean that there is a need for a special node type. I would definitely use `nt:unstructured` for my blog post nodes at least initially. Since in my blogging application, all I am going to do is to display the lastModified date anyway (possibly "order by" it) I barely care if it is a Date at all. Because I implicitly trust my blog-writing application to put a "date" there anyway, there really is no need to declare the presence of a `lastModified` date in the form of a node type.

### Rule #2: Drive the content hierarchy; do not let it happen. {#rule-drive-the-content-hierarchy-don-t-let-it-happen}

#### Explanation {#explanation-2}

The content hierarchy is a valuable asset. Do not let it happen; design it. If you do not have a "good", human-readable name for a node, that's probably something that you should reconsider. Arbitrary numbers are hardly a "good name".

While it may be easy to quickly put an existing relational model into a hierarchical model, one should put some thought in that process.

In my experience, if one thinks of access control and containment as good drivers for the content hierarchy. Think of it as if it was your file system. Maybe even use files and folders to model it on your local disk.

Personally, I prefer hierarchy conventions over the node typing system initially, and introduce the typing later.

>[!CAUTION]
>
>The way a content repository is structured can impact performance as well. For best performance, the number of child nodes attached to individual nodes in a content repository should not exceed 1'000.

#### Example {#example-2}

I would model a simple blogging system as follows. Initially, I do not even care about the respective node types that I use at this point.

```xml
/content/myblog
/content/myblog/posts
/content/myblog/posts/what_i_learned_today
/content/myblog/posts/iphone_shipping

/content/myblog/comments/iphone_shipping/i_like_it_too
/content/myblog/comments/iphone_shipping/i_like_it_too/i_hate_it
```

I think one of the things that becomes apparent is that the structure of the content is understood based on the example without any further explanations.

What may be unexpected initially is why I would not store the "comments" with the "post", which is due to access control which I would like to be applied in a reasonably hierarchical way.

Using the above content model I can easily allow the "anonymous" user to "create" comments, but keep the anonymous user on a read-only basis for the rest of the workspace.

### Rule #3: Workspaces are for clone(), merge(), and update(). {#rule-workspaces-are-for-clone-merge-and-update}

#### Explanation {#explanation-3}

If you do not use `clone()`, `merge()` or `update()` methods in your application a single workspace is probably the way to go.

"Corresponding nodes" is a concept defined in the JCR spec. Essentially, it boils down to nodes that represent the same content, in different so-called workspaces.

JCR introduces the abstract concept of Workspaces which leaves many developers unclear on what to do with them. I would like to propose to put your use of workspaces to the following to test.

If you have a considerable overlap of "corresponding" nodes (essentially the nodes with the same UUID) in multiple workspaces, you probably put workspaces to good use.

If there is no overlap of nodes with the same UUID, you are probably abusing workspaces.

Do not use workspaces for access control. Visibility of content for a particular group of users is not a good argument to separate things into different workspaces. JCR features "Access Control" in the content repository to provide for that.

Workspaces are the boundaries for references and queries.

#### Example {#example-3}

Use workspaces for things like:

* v1.2 of your project vs. a v1.3 of your project
* a "development", "QA" and a "published" state of content

Do not use workspaces for things like:

* user home directories
* distinct content for different target audiences like public, private, local, ...
* mail-inboxes for different users

### Rule #4: Beware of Same Name Siblings. {#rule-beware-of-same-name-siblings}

#### Explanation {#explanation-4}

Same Name Siblings (SNS) has been introduced into the spec to allow compatibility with data structures that are designed for and expressed through XML and, therefore, are valuable to JCR. However, SNS comes with overhead and complexity for the repository.

Any path into the content repository that contains an SNS in one of its path segments becomes much less stable. If an SNS is removed or reordered, it has an impact on the paths of all the other SNS and their children.

For import of XML or interaction with existing XML, SNS maybe necessary and useful, but I have never used SNS (and never intend to) in my "green field" data models.

#### Example {#example-4}

Use

```xml
/content/myblog/posts/what_i_learned_today
/content/myblog/posts/iphone_shipping
```

Instead of

```xml
/content/blog[1]/post[1]
/content/blog[1]/post[2]
```

### Rule #5: References are considered harmful. {#rule-references-considered-harmful}

#### Explanation {#explanation-5}

References imply referential integrity. It is important to understand that references not only add an additional cost for the repository managing the referential integrity, but they are also costly from a content flexibility perspective.

Personally, I only ever use references when I really cannot deal with a dangling reference and otherwise use a path, a name, or a string UUID to refer to another node.

#### Example {#example-5}

Let's assume I allow "references" from a document (a) to another document (b). If I model this relation using reference properties this means that the two documents are linked on a repository level. I cannot export/import document (a) individually, since the reference property's target may not exist. Other operations like merge, update, restore, or clone are affected as well.

So I would either model those references as "weak-references" (in JCR v1.0 this essentially boils down to string properties that contain the uuid of the target node) or simply use a path. Sometimes the path is more meaningful to begin with.

I think there are use cases where a system really cannot work if a reference is dangling, but I just cannot come up with a good "real" yet simple example from my direct experience.

### Rule #6: Files are files. {#rule-files-are-files}

#### Explanation {#explanation-6}

If a content model exposes something that even remotely smells like a file or a folder, I try to use (or extend from) `nt:file`, `nt:folder`, and `nt:resource`.

In my experience, many generic applications allow interaction with nt:folder and nt:files implicitly and know how to handle and display those events if they are enriched with additional meta-information. For example, a direct interaction with file server implementations like CIFS or WebDAV sitting on top of JCR become implicit.

I think as good rule of thumb one could use the following: If you must store the filename and the mime-type then `nt:file`/ `nt:resource` is a good match. If you could have multiple "files" an nt:folder is a good place to store them.

If you must add meta information for your resource, let's say an "author" or a "description" property, extend `nt:resource` not the `nt:file`. I rarely extend nt:file and frequently extend `nt:resource`.

#### Example {#example-6}

Let's assume that someone would like to upload an image to a blog entry at:

```xml
/content/myblog/posts/iphone_shipping
```

And maybe the initial gut reaction would be to add a binary property containing the picture.

While there are good use cases for just using a binary property (let's say the name is irrelevant and the mime-type is implicit), in this case, I recommend the following structure for my blog example.

```xml
/content/myblog/posts/iphone_shipping/attachments [nt:folder]
/content/myblog/posts/iphone_shipping/attachments/front.jpg [nt:file]
/content/myblog/posts/iphone_shipping/attachments/front.jpg/jcr:content [nt:resource]
```

### Rule #7: IDs are evil. {#rule-ids-are-evil}

#### Explanation {#explanation-7}

In relational databases, IDs are a necessary means to express relations, so people tend to use them in content models as well. Mostly for the wrong reasons through.

If your content model is full of properties that end in "Id", you probably are not using the hierarchy properly.

It is true that some nodes need a stable identification throughout their live cycle; fewer than you might think though. But `mix:referenceable` has such a mechanism built into the repository, so there is no need to come up with an extra means of identifying a node in a stable fashion.

Keep also in mind that items can be identified by path. And, as much as "symlinks" make way more sense for most users than hard links in a UNIX&reg; filesystem, a path makes a sense for most applications to refer to a target node.

More importantly, it is **mix**:referenceable which means that it can be applied to a node at the point in time when you actually must reference it.

So, just because you would like to be able to potentially reference a node of type "Document" does not mean that your "Document" node type has to extend from `mix:referenceable` in a static fashion. This is because it can be added to any instance of the "Document" dynamically.

#### Example {#example-7}

Use:

```xml
/content/myblog/posts/iphone_shipping/attachments/front.jpg
```

Instead of:

```xml
[Blog]
-- blogId
-- author
[Post]
-- postId
-- blogId
-- title
-- text
-- date
[Attachment]
-- attachmentId
-- postId
-- filename
+ resource (nt:resource)
```

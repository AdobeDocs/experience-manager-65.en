---
title: Content Architecture
description: Tips for architecting your content (hint - everything is content)
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: best-practices
exl-id: bcebbdb4-20b9-4c2d-8a87-013549d686c1
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Content Architecture{#content-architecture}

## Follow David's Model {#follow-david-s-model}

David's Model was written by David Nuescheler years ago, but the ideas hold true today. The main tenets of David's Model are as follows:

* Data comes first, structure later. Maybe.
* Drive the content hierarchy, do not let it happen.
* Workspaces are for `clone()`, `merge()`, and `update()`.
* Beware of the same name siblings.
* References are considered harmful.
* Files are files.
* IDs are evil.

David's Model can be found on the Jackrabbit wiki at [https://wiki.apache.org/jackrabbit/DavidsModel](https://wiki.apache.org/jackrabbit/DavidsModel).

### Everything is content {#everything-is-content}

Everything should be stored in the repository rather than relying on separate third-party data sources such as databases. This applies to authored content, binary data like images, code, and configurations. This lets us use one set of APIs to manage all content and to manage the promotion of this content through replication. You also gain a single source of backup, logging, and so on.

### Use the "content model first" design principle {#use-the-content-model-first-design-principle}

When building a new feature, always start by designing the JCR content structure first, and then look into reading and writing your content using the default Sling servlets. This lets you ensure that your implementation works well with out of the box access control mechanisms and let you avoid generating unnecessary CRUD-style servlets.

### Be RESTful {#be-restful}

Servlets should be defined based on resourceTypes instead of paths. This makes it possible to use JCR access controls, adhere to REST principles, and use the resource and resource resolver that are provided to us in the request. This also allows us to change the scripts that render URLs on the server side without needing to change any URLs from the client side, while hiding server-side implementation details from the client for added security.

### Avoid defining new node types {#avoid-defining-new-node-types}

Node types work at a low level in the infrastructure layer and most requirements can be met by using a sling:resourceType assigned to an nt:unstructured, oak:Unstructured, sling:Folder or cq:Page node type. Node types equate to schema in the repository and changing node types can be expensive down the road.

### Adhere to naming conventions in the JCR {#adhere-to-naming-conventions-in-the-jcr}

Adhering to naming conventions adds consistency to your code base, lowering the incidence rate of defects and increasing the velocity of developers working in the system. The following conventions are used by Adobe in developing AEM:

* Node names

    * All lower case
    * Word separation using hyphens

* Property names

    * Camel case, starting with a lower case letter

* Components (JSP/HTML)

    * All lower case
    * Word separation using hyphens

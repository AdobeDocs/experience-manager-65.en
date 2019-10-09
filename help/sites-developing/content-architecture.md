---
title: Content Architecture
seo-title: Content Architecture
description: Tips for architecting your content (hint - everything is content)
seo-description: Tips for architecting your content in Adobe Experience Manager (AEM). (hint - everything is content)
uuid: fef2bf0f-70ec-4621-8479-a62b7e1fbc07
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.4/SITES
content-type: reference
topic-tags: best-practices
discoiquuid: ca46b74c-6114-458b-98c0-2a93abffcdc3
---

# Content Architecture{#content-architecture}

## Follow David's Model {#follow-david-s-model}

David’s Model was written by David Nuescheler years ago, but the ideas hold true today. The main tenets of David’s Model are as follows:

* Data comes first, structure later. Maybe.
* Drive the content hierarchy, don’t let it happen.
* Workspaces are for `clone()`, `merge()`, and `update()`.
* Beware of same name siblings.
* References are considered harmful.
* Files are files are files.
* IDs are evil.

David’s Model can be found on the Jackrabbit wiki at [https://wiki.apache.org/jackrabbit/DavidsModel](https://wiki.apache.org/jackrabbit/DavidsModel).

### Everything is content {#everything-is-content}

Everything should be stored in the repository rather than relying on separate third party data sources such as databases. This applies to authored content, binary data like images, code, configurations, etc. This allows us to use one set of APIs to manage all content and to manage the promotion of this content through replication. We also gain a single source of backup, logging, etc.

### Use the "content model first" design principle {#use-the-content-model-first-design-principle}

When building a new feature, always start by designing the JCR content structure first, and then look into reading and writing your content using the default Sling servlets. This will allow you to ensure that your implementation works well with out of the box access control mechanisms and allow you to avoid generating unnecessary CRUD-style servlets.

### Be RESTful {#be-restful}

Servlets should be defined based on resourceTypes instead of paths. This makes it possible to use JCR access controls, adhere to REST principles, and use the resource and resource resolver that are provided to us in the request. This also allows us to change the scripts that render URLs on the server side without needing to change any URLs from the client side, while hiding server-side implementation details from the client for added security.

### Avoid defining new node types {#avoid-defining-new-node-types}

Node types work at a low level in the infrastructure layer and most requirements can be met by using a sling:resourceType assigned to an nt:unstructured, oak:Unstructured, sling:Folder or cq:Page node type. Node types equate to schema in the repository and changing node types can be very expensive down the road.

### Adhere to naming conventions in the JCR {#adhere-to-naming-conventions-in-the-jcr}

Adhering to naming conventions will add consistency to your code base, lowering the incidence rate of defects and increasing the velocity of developers working in the system. The following conventions are used by Adobe in developing AEM:

* Node names

    * All lower case
    * Word separation using hyphens

* Property names

    * Camel case, starting with a lower case letter

* Components (JSP/HTML)

    * All lower case
    * Word separation using hyphens


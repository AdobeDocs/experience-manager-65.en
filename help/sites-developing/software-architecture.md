---
title: Software Architecture
description: Best practices for architecting your software
uuid: a557f6ca-c3f1-486e-a45e-6e1f986fab41
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: best-practices
discoiquuid: 92971747-1c74-4917-b5a0-7b79b3ae1e68
exl-id: cd4f3b4c-5488-4ca7-9c1e-b4c819fda8e8
---
# Software Architecture{#software-architecture}

## Design for upgrades {#design-for-upgrades}

When extending OOTB behaviors, it is important to keep upgrades in mind. Always apply customizations in the /apps directory and either overlay on top of the corresponding nodes in the /libs directory or use sling:resourceSuperType to extend the out of the box behavior. While some modifications may be necessary to support a new AEM version, the new version should not overwrite your customizations if this practice is followed.

### Reuse template and components when possible {#reuse-template-and-components-when-possible}

Doing so allows for the site to maintain a more consistent look and feel and simplify code maintenance. When a new template is needed, make sure to extend from a shared base template so that global requirements such as clientlib inclusion can be coded in one place. When a new component is needed, look for opportunities to extend from an existing component.

### Design template designs {#design-template-designs}

By defining which components can be included in each parsys on the page, the consistency of the look/feel of the site can be controlled. By restricting access to the design on pages, "super authors" can be allowed to modify the allowed components per page without developer intervention while ensuring that the other authors follow the corporate standards.

### Develop a SOLID architecture {#develop-a-solid-architecture}

SOLID is an acronym describing five architectural principles that should be adhered to:

* **S**ingle Responsibility Principle - each module, class, method, and so on, should only have one responsibility.
* **O**pen/Closed Principle - modules should be open for extension and closed for modification.
* **L**iskov Substitution Principle - types should be replaceable by their subtypes.
* **I**nterface Segregation Principle - no client should be forced to depend on methods that it does not use.
* **D**ependency Inversion Principle - High-level modules should not depend on low-level modules. Both should depend on abstractions. Abstractions should not depend on details. Details should depend on abstractions.

Striving for compliance with these five principles should result in a system that has a strict separation of concerns.

>[!TIP]
>
>SOLID is a commonly used concept in object-oriented programming and each element is widely discussed in industry literature.
>
>This information is just a short summary presented for awareness and you are encouraged to familiarize yourself with these concepts in more depth.

### Follow the Robustness Principle {#follow-the-robustness-principle}

The Robustness Principle states that you should be conservative in what you send, but be liberal in what you accept. In other words, when sending messages to a third party, you should completely conform to specifications. However, when you receive messages from a third party, you should accept non-conforming messages as long as the meaning of the message is clear.

### Implement spikes in their own modules {#implement-spikes-in-their-own-modules}

Spikes and test code are a part of any Agile software implementation. However, you want to make sure that they don't make their way into the production code base without the appropriate level of oversight. As a result, it is recommended that spikes are created in their own module.

### Implement data migration scripts in their own module {#implement-data-migration-scripts-in-their-own-module}

Data migration scripts, while production code, are only run once at the initial launch of a site. Therefore, when the site is live, the scripts become dead code. To ensure that you don't build implementation code that depends on the migration scripts, they should be implemented in their own module. Doing so lets us remove and retire this code immediately after launch, eliminating dead code from the system.

### Follow published Maven conventions in POM files {#follow-published-maven-conventions-in-pom-files}

Apache has published style conventions at [https://maven.apache.org/developers/conventions/code.html](https://maven.apache.org/developers/conventions/code.html). It is best to follow these conventions because it makes it easier for new resources to come up to speed quickly.

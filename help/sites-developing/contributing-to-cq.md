---
title: Contributing to AEM
description: AEM is developed following proven methodologies commonly practiced in large open-source projects
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: introduction
content-type: reference
exl-id: 43fb4fa3-269a-4635-b055-4b7d787da21f
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Contributing to AEM{#contributing-to-aem}

## Development Methodology {#development-methodology}

AEM is developed following proven methodologies commonly practiced in large open-source projects. Many core elements in AEM's technology stack are in fact maintained as active open-source projects, such as Sling and Jackrabbit, which were contributed to the Apache Software Foundation. A major aspect of this spirit that is present in AEM is that you are encouraged to use the available mailing lists and online forums for direct interactions with the development team.

If you are contributing to components of AEM, familiarize yourself with AEM as you would when contributing to an open-source project, and communicate with the existing core team as you would when you would intend to contribute to such a project.

## Required Experience {#required-experience}

The HyperText Transfer Protocol (HTTP) is central to everything that we do. Therefore, before contributing to AEM, you should have a deep understanding of HTTP, ideally to the extent where you can write your own Java&trade; implementation of a multithreaded HTTP server with thread-pooling. You should also have an understanding of HTTP/1.1 keep-alive behavior, and you should have an in-depth knowledge of server/client-side interactions with JavaScript, particularly the asynchronous style of interaction represented by AJAX.

Because page dynamism and interactive content are key to the WM experience, it is essential that you have a fairly deep understanding of the Document Object Model and its potential for programmatic manipulation in response to events. You should have some knowledge, for example, of real-time DOM manipulation and drag-and-drop behavior over multiple browser documents (for example, using iframes).

At the highest level, you should have a solid understanding of:

* the [HTTP/1.1 protocol](https://www.ietf.org/rfc/rfc2616.txt)
* HTML (preferably [HTML5](https://html.spec.whatwg.org/))
* Cascading Style Sheets
* Extensible Markup Language (XML)
* Asynchronous JavaScript and XML (AJAX) design patterns
* JavaScript Object Notation (JSON)
* the Document Object Model
* Stateful vs. stateless interactions
* [Uniform Resource Identifiers](https://www.ietf.org/rfc/rfc2396.txt)
* Browser cookies
* and other modern web-development concepts

The technology stack of Adobe Experience Manager is based on the [Apache Felix](https://felix.apache.org/documentation/index.html) OSGI container with the [Apache Sling](https://sling.apache.org/index.html) web framework and embeds a Java&trade; Content Repository ([JCR](https://developer.adobe.com/experience-manager/reference-materials/spec/jcr/2.0/index.html)) based on [Apache Jackrabbit](https://jackrabbit.apache.org/jcr/jcr-api.html). Familiarize yourself with these individual projects, and any other open-source components (for example, Apache Lucene) used in the area where you intend to contribute.

## Tribal Knowledge {#tribal-knowledge}

Certain concepts and guiding principles are deeply ingrained in the former Day culture. This section lists some of the "deeply DNA-embedded" issues that you should be aware of.

### Everything is Content {#everything-is-content}

Content includes not only all the data that the web application persists. The program code, libraries, scripts, templates, HTML, CSS, images, and artifacts of all kinds, anything, and everything is persisted in the Content Repository and imported/exported in the form of packages via Package Manager and Package Share.

### David's Model {#david-s-model}

The way content should be modeled in a Java&trade; Content Repository requires an entirely different way of thinking than what is common practice in the software industry for data modeling in the relational world. Essential reading for any newcomer to content management the JCR way is [David's Model: A guide for content modeling](https://wiki.apache.org/jackrabbit/DavidsModel).

### RESTfulness {#restfulness}

The REST approach is deeply ingrained in what we do. This means, among other things, avoiding stateful interactions and keeping in mind that URIs are definitive addresses for content and services.

REST (REpresentational State Transfer) refers to the software architectural style on which the World Wide Web is based. It describes the key elements that make the Web work, and so provides a set of principles for how web-based software should be designed. When designing an API to be used over the Web, it therefore makes sense to adhere to these "best practices."

Because REST provides the guiding philosophy behind so much of what we do, you should consider it essential to become well versed in the tenets of RESTful design. A good place to start is with [Roy Fielding's dissertation](https://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm).

### Sling Request Resolution {#sling-request-resolution}

A key aspect to understand about AEM is how incoming requests relate to content and application behavior, how content is structured in the content repository and where AEM looks for the application logic to handle the request. Learn about the Apache [Sling URL decomposition](https://sling.apache.org/documentation/the-sling-engine/url-decomposition.html) and the way it enforces the REST architectural style and its stateless, cacheable, and layered system constraints.

Key aspects to understand about Apache Sling's request resolution are how requests primarily map to a specific resource in the Content Repository, how additional properties of the request, together with properties of these content objects, determine which application code is invoked to render the content, and how code in /apps overrides code in /libs.

### Quickstart {#quickstart}

No step three: To install and run, one simply downloads and double-clicks the Quickstart JAR file. There is no step three. Any additional optional functionality should require nothing more than installing the appropriate package from Package Share.

Small Quickstart size: Keep the size of the Quickstart JAR file at a minimum. Make smart, optimized use of libraries, moving optional functionality to Package Share.

Faster startup time: When you make a change that could affect the startup time, be sure it makes it shorter, not longer.

### Lean and Mean {#lean-and-mean}

We favor code and projects that are light, small, fast, and elegant. "Good enough" is not good enough.

Code reuse: Our OSGi-based product architecture and "everything is content" philosophy means that we have unusually good opportunities for reuse of code and artifacts. We try to take advantage of that fact whenever possible to keep features lean-and-mean.

Loose coupling: We favor loosely coupled interactions over tight dependencies and "unwanted intimacy". Loose coupling also enables more code reuse.

### Do not Break the Demo {#don-t-break-the-demo}

Become familiar with demo scripts and product functionalities that are most often shown in demos. Understand that nothing you do should ever break a "demo script" feature. The core product should always be demo-ready, even during development.

### Design for Reliability {#design-for-reliability}

We strive to design and code features in fail-soft fashion, so that (for example) a problem with a single DOM element does not cause a whole page to not render. In other words: Make things that should be fatal, fatal. Make everything else survivable. Make the product "forgiving."

### Abnormal is the New Normal {#abnormal-is-the-new-normal}

Do not depend on shutdown hooks, ensure cleanup on startup. Abnormal termination is normal termination.

`shutdown == kill -9 == power outage`

### Be Ready for Elastic Clustering {#be-ready-for-elastic-clustering}

Always be ready for elastic clustering; always assume that there is clustering. Generally, abiding to everything being in the content repository means built in clustering support.

### Design for Backward Compatibility {#design-for-backward-compatibility}

Nothing you do should break a customer's old code. Consider only `/libs` to contain product code that can be updated during an upgrade. The `/apps` section of the repository is project code, and the `/etc` section contains custom configurations that must be preserved. Generally, do not overwrite anything in `/apps`, `/content`, and `/home`. After an upgrade, old project code, configurations, and content should continue to function as it all did before the upgrade.

Designing for backwards compatibility also ensures that the upgrade experience matches the simplicity of the initial installation. Simply stopping AEM, replacing the Quickstart JAR file, and starting AEM again should be sufficient. With a rapidly growing install base, upgrade efficiency is an increasingly significant advantage.

While existing APIs can and should be marked as deprecated when newer, better functionality replaces them, all APIs that were made public in a previous 5.x release need to remain functional, since they may be in use in custom application code. No such APIs should be removed.

Backwards compatibility should also be kept in mind regarding the general consistency of content structure and user experience.

## Core Concepts {#core-concepts}

**Author instance** - Typically, for security, governance, and other reasons, a production site divides instances of AEM into Author and Publish instances. For more information on deployment architecture (including Author/Publish instances), see documentation about AEM Instances.

**Caching, frying, and baking** - Traditionally, the concepts of baking versus frying are an important distinction between different Web Content Management Systems. In CMS jargon, "baking" refers to the concept of committing data to static files at publish-time, while "frying" refers to the concept of processing data for final presentation at request-time (that is, just in time).

**Clustering and load-balancing** - To increase availability and improve the performance of a Production environment, it is common to combine multiple Author and/or Publish instances (into Clusters), by either making them available to different groups of users or by load-balancing them behind a Dispatcher configuration.

It is also possible to combine multiple instances of the content repository to create a *high-availability* JCR solution, which can then be integrated with your AEM solution to maximize protection against hardware and software failure. See [Recommended Deployments](/help/sites-deploying/recommended-deploys.md#oak-cluster-with-mongomk-failover-for-high-availability-in-a-single-datacenter) for further information.

**Component** - In AEM, a Component is an object type, instances of which can generally be created by dragging and dropping them from, say, the Sidekick. So for example, out-of-the-box components that ship with AEM include the Text, Title, Tag Cloud, Carousel, Image, and List components, all available from the Sidekick at runtime.

**Content Finder** - In authoring mode, the Content Finder is a special panel (frame) on the left-hand side of the page that, depending on the tab you select at the top, displays lists of images, documents, Flash assets, pages, paragraphs, or repository resources that you can drag and drop from the Content Finder into the page you're working on (on the right).

**Digital assets** - In AEM, Digital Assets are (typically) images and rich media files. For further information, see Working with Digital Assets in DAM.

**Dispatcher** - The Dispatcher is both a caching and load-balancing tool, and provides certain security safeguards.

**ExtJS widgets** - Most user-interface elements in AEM use ExtJS, which is a third-party widget library written in JavaScript. ExtJS features high performance, customizable UI widgets and a well-designed and extensible component model.

**JCR, Java&trade; Content Repository** - The Java&trade; Content Repository specification (JSR-283) provides both an abstract data model and an Application Programming Interface for realizing a massively scalable NoSQL data repository that combines features of a file system and an object database. While you do not need to understand JSR-283 in exhaustive detail, you should take time to familiarize yourself with the basic capabilities of JCR and the data model underlying it, because JCR is what makes possible the "everything is content" philosophy of AEM.

In essence, JCR is a system of nodes and properties, in which nodes can inherit from other nodes and all content is stored as property *values*. Note that in addition to ordinary inheritance, JCR allows for a concept of "mixin" nodes, which enables modeling of multiple inheritance.

JCR has several predefined node types and property types, but in general the typing system is flexible, and (indeed) one of the strengths of JCR is that it allows structured and unstructured content to be stored/managed with equal ease. That is, JCR can accommodate highly structured data, but it can also accommodate arbitrary dynamic data structures without schema constraints.

The JavaDoc for JCR's Java&trade; API is available from the [Apache Software Foundation - JCR API](https://jackrabbit.apache.org/jcr/jcr-api.html).

Before attempting to read the JavaDoc or the JCR spec itself, you might want to look at [this high-level explanation](/help/sites-developing/the-basics.md#java-content-repository) of JCR as implemented by Adobe Experience Services.

**Multi-Site Manager (MSM)** - The MSM feature of AEM helps customers handle multilingual and multinational content, enabling them to balance centralized branding with localized content.

**OSGi** - OSGi is the services-based runtime technology that provides the basis for modularized Java&trade; development in AEM. It is a framework that provides not only a highly dynamic (and secure) classloading and execution environment for code resources (known as bundles), but also full control over the visibility and lifecycle of the various services exposed by bundles. A service registry provides a cooperation model for bundles that takes lifecycle dynamics (and version requirements) into account. OSGi solves many of the problems that application servers were intended to solve, but does so in a lightweight, highly dynamic way, making it possible, for example, to hot-deploy services (making the new code immediately available without restarting the server).

**Parsys, Paragraph System** - The paragraph system (parsys) is a compound component that allows authors to add components of different types to a page and contains other paragraph components. Each paragraph type is represented as a component. The paragraph system itself is also a component, which contains the other paragraph components.

**Microkernel** - Every workspace in the repository can be separately configured to store its data through a specific microkernel (a class that manages the reading and writing of the data). Similarly, the repository-wide version store can also be independently configured to use a particular microkernel. Several different microkernels are available, capable of storing data in various file formats or relational databases. (For example, there are persistence managers for MongoDB, DB2&reg;, or Oracle) The default microkernel for AEM is TarMK (see further below).

**Publish instance** - For security, governance, and other reasons, a production site will typically divide instances of AEM into Author and Publish instances. For more information on deployment architecture (including Author/Publish instances), see documentation about AEM Instances.

**Quickstart** - Unlike many other programs, you install AEM by using a single "Quickstart" self-extracting JAR file. When you double-click the JAR file for the first time, everything you need is automatically installed. The quickstart JAR includes all files required for the CRX repository (including administrative facilities), virtual repository services, index and search services, workflow services, security, and a Web server, plus the CQ Servlet Engine (CQSE) and all AEM services. There are no other files to install: the Quickstart is self-contained.

The first time you start the Quickstart, it creates an entire JCR-compliant repository in the background, which can take several minutes. After this initial startup, subsequent startups are much quicker as the repository infrastructure has already been laid down.

Many startup options (such as the active port number and whether the AEM instance in question should be a Publish instance versus an Author instance; and much more) can be controlled by appropriately renaming the Quickstart file. To see a list of options in this regard, run the JAR with "-help" on the command line:

```shell
java -jar <quickstartfilename>.jar -help
```

**Replication agents** - Replication agents are central to AEM as the mechanism used to Publish (activate) content from an author to a publish environment; flush content from the Dispatcher cache; return user-generated content (for example, form input) from the Publish environment to the Author environment.

**Scaffolding** - With scaffolding you can create a form (a scaffold) with fields that reflect the structure you want for your pages and then use this form to easily create pages based on this structure.

**Segmentation** - Site visitors have different interests and objectives when they come to a site. Understanding visitors' goals and fulfilling their expectations is an important success prerequisite for online marketing. Segmentation helps to achieve this by analyzing and characterizing a visitor's details.

**Sidekick** - The Sidekick is a palette-like floating window that appears on the editable page, from which new components can be dragged and actions that apply to the page can be executed.

**Site Catalyst** - SiteCatalyst provides marketers with one place to measure, analyze, and optimize integrated data from all online initiatives across multiple marketing channels. You can use Adobe SiteCatalyst to analyze data from AEM websites.

**Tar Storage (TarMK)** - TarMK is the default persistence system in AEM. Although AEM can be configured to use a different persistence system (such as MongoDB), TarMK has certain advantages in that it is performance-optimized for typical JCR use-cases (therefore, is fast), uses an industry-standard data format, and can be quickly and easily backed up.

**Template** - In AEM, a Template specifies a particular type of page. It defines the structure of a page (while also typically specifying a thumbnail image, and various properties). For example, you may have separate templates for product pages, sitemaps, and contact information.

**Workflow** - The AEM Workflow system allows for creation of automated processes involving pages or assets.

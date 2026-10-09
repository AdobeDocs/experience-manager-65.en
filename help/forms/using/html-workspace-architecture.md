---
title: AEM Forms Workspace Architecture
description: Conceptual information and overview of the architecture of LiveCycle AEM Forms workspace.
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
exl-id: c6f216d4-781c-4356-b9f0-3324903a28e7
solution: Experience Manager, Experience Manager Forms
feature: HTML5 Forms,Adaptive Forms,Mobile Forms
role: User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: 97aafc4b-2598-52d6-9012-295a95969e38
    internal-label: HTML5 Forms
  - id: 59f95943-e802-56ac-990d-21ab923984c1
    internal-label: Mobile Forms
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# AEM Forms Workspace Architecture {#aem-forms-workspace-architecture}

AEM Forms workspace is a web application hosted on CRX™. When workspace is opened in a browser, a CRX resource is accessed, and the application is rendered as HTML page in the browser.

The application accesses AEM Forms server on REST endpoints to do the following:

* Fetch user tasks, process startpoints, process history, and user information
* Perform action on tasks
* Query tasks in database
* Update user preferences and more

The AEM Forms server accesses AEM Forms database over JDBC. The database persists tasks, processes and their instances, users, and related information.

The AEM Forms workspace is designed into modular JavaScript™ components which can be individually customized and reused in other web applications. The components are based on BackBone which is a JavaScript library that gives structure to web applications. A detailed article describing interaction of components with BackBone is [here](/help/forms/using/backbone-interaction.md). The organization of components in the CRX folder structure is discussed in [this](/help/forms/using/folder-structure.md) article.

Packages delivered for AEM Forms workspace:

* `adobe-lc-workspace-pkg-<version>.zip`: It is CRX package, that is, it can be deployed in CRX using the Package Manager.
* `adobe-lc-workspace-<version>-src.zip`: It is an archive that contains complete code of AEM Forms workspace and scripts to create the deploy packages--Ship, Debug, and Dev packages.

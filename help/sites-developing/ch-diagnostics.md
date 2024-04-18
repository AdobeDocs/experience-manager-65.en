---
title: ContextHub Diagnostics
description: ContextHub provides a diagnostics page where you can see an overview of the ContextHub framework
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: personalization
content-type: reference
exl-id: b833c28b-76c6-42a2-b690-3e81ddf91bc2
solution: Experience Manager, Experience Manager Sites
feature: Developing,Personalization
role: Developer
---
# ContextHub Diagnostics {#contexthub-diagnostics}

ContextHub provides a diagnostics page where you can see an overview of the ContextHub framework. To open the page, go to the `contexthub.diagnostics.html` page of your AEM author instance, for example:

`http://<host>:<port>/conf/<tenant>/settings/cloudsettings/default/contexthub.diagnostics.html`

The ContextHub Diagnostics page provides information about the stores and UI modules that have been created, the client library folders that are loaded, and links to useful pages.

>[!NOTE]
>
>In order for diagnostic information to be returned, debug mode must be enabled, otherwise the diagnostics page will be blank. See [this document](ch-configuring.md#debugging-contexthub) for details on how to enable debug mode.

>[!NOTE]
>
>For ContextHub configurations still located under their legacy paths, the locaiton of the diagnostics page is `http://<host>:<port>/libs/settings/cloudsettings/legacy/contexthub.diagnostics.html`.

## Stores {#stores}

The Stores section lists all the ContextHub stores that have been configured. Each item in the list consists of the following information:

* **Title:** The [store type](/help/sites-developing/ch-samplestores.md) that the store is based on.
* **path:** The path to the repository node that holds the configuration.
* **resourceType:** The path of the repository node where the store type is defined.
* **clientlibs:** The categories of the client libraries that are loaded which implement the store type.

## Modules {#modules}

The Modules section lists all the ContextHub UI modules that have been configured. Each item in the list consists of the following information:

* **Title:** The [UI Module type](/help/sites-developing/ch-samplemodules.md) that the UI module is based on.
* **path:** The path to the repository node that holds the configuration.
* **resourceType:** The path of the repository node where the UI module type is defined.
* **clientlibs:** The categories of the client libraries that are loaded which implement the UI module type.

## Clientlibs {#clientlibs}

The Clientlibs section lists all the client library folders that ContextHub has loaded. The client libraries are categorized:

* **kernel.js:** Client libraries that implement the ContextHub framework, the segment engine, and store types.
* **ui.js:** Client libraries that implement the ContextHub UI and UI module types.
* **style.css:** CSS files that are loaded from client libraries.

## URLs {#urls}

The URLs section contains links to ContextHub features:

* **Configuration editor:** Opens the [ContextHub Configuration page](ch-configuring.md) where you can configure stores, UI modes, and UI modules.

* **Configuration of ContextHub modules:** Opens the /etc/cloudsettings/default/contexthub.config.kernel.js file, which contains the JavaScript object representation of the ContextHub store configurations.
* **Configuration of ContextHub UI:** Opens the /etc/cloudsettings/default/contexthub.config.ui.js file, which contains the JavaScript object representation of the ContextHub UI mode configurations.
* **kernel.js:** Opens the /etc/cloudsettings/default/contexthub.kernel.js file, which contains the source code of the client libraries that implement the ContextHub framework, the segment engine, and store types.
* **ui.js:** Opens the /etc/cloudsettings/default/contexthub.ui.js file, which contains the source code of the client libraries that implement the ContextHub UI and UI module types.
* **style.css:** Opens the /etc/cloudsettings/default/contexthub.styles.css file, which contains the CSS styles for the ContextHub UI and UI modules.

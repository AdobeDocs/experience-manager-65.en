---
title: ContextHub Diagnostics
seo-title: ContextHub Diagnostics
description: ContextHub provides a diagnostics page where you can see an overview of the ContextHub framework
seo-description: ContextHub provides a diagnostics page where you can see an overview of the ContextHub framework
uuid: 94ef0696-3977-4781-ad32-9f4f117eb096
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: personalization
content-type: reference
discoiquuid: 6aa88583-5d34-4f77-a932-d47d84785eca
---

# ContextHub Diagnostics{#contexthub-diagnostics}

ContextHub provides a diagnostics page where you can see an overview of the ContextHub framework. To open the page, go to the etc/cloudsettings/default/contexthub.diagnostics.html page of your AEM author instance, for example [http://localhost:4502/etc/cloudsettings/default/contexthub.diagnostics.html](http://localhost:4502/etc/cloudsettings/default/contexthub.diagnostics.html).

The ContextHub Diagnostics page provides information about the stores and UI modules that have been created, the client library folders that are loaded, and links to useful pages.

>[!NOTE]
>
>In order for diagnostic information to be returned, debug mode must be enabled, otherwise the diagnostics page will be blank. Please see [this document](/help/sites-administering/contexthub-config.md#debugging-contexthub) for details on how to enable debug mode.

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

The Clientlibs section lists all of the client library folders that ContextHub has loaded. The client libraries are categorized:

* **kernel.js:** Client libraries that implement the ContextHub framework, the segment engine, and store types.
* **ui.js:** Client libraries that implement the ContextHub UI and UI module types.
* **style.css:** CSS files that are loaded from client libraries.

## URLs {#urls}

The URLs section contains links to ContextHub features:

* **Configuration editor:** Opens the [ContextHub Configuration page](/help/sites-administering/contexthub-config.md) where you can configure stores, UI modes, and UI modules.

* **Configuration of ContextHub modules:** Opens the /etc/cloudsettings/default/contexthub.config.kernel.js file, which contains the the Javascript object representation of the ContextHub store configurations.
* **Configuration of ContextHub UI:** Opens the /etc/cloudsettings/default/contexthub.config.ui.js file, which contains the Javascript object representation of the ContextHub UI mode configurations.
* **kernel.js:** Opens the /etc/cloudsettings/default/contexthub.kernel.js file, which contains the source code of the client libraries that implement the ContextHub framework, the segment engine, and store types.
* **ui.js:** Opens the /etc/cloudsettings/default/contexthub.ui.js file, which contains the source code of the client libraries that implement the ContextHub UI and UI module types.
* **style.css:** Opens the /etc/cloudsettings/default/contexthub.styles.css file, which contains the CSS styles for the ContextHub UI and UI modules.


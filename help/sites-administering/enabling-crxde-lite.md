---
title: Enabling CRXDE Lite in AEM
description: Learn how to enable CRXDE Lite in Adobe Experience Manager.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: Security
content-type: reference
exl-id: bf51def2-1dd4-4bd3-b989-685058f0ead8
solution: Experience Manager, Experience Manager Sites
feature: Administering
role: Admin
---
# Enabling CRXDE Lite in AEM{#enabling-crxde-lite-in-aem}

To ensure that AEM installations are as secure as possible, the security checklist recommends [disabling WebDAV](/help/sites-administering/security-checklist.md#disable-webdav) in production environments.

However, CRXDE Lite depends on the `org.apache.sling.jcr.davex` bundle to function properly, so disabling WebDAV will effectively disable CRXDE Lite as well.

When this happens, browsing to `https://serveraddress:4502/crx/de/index.jsp` will display an empty root node, and all HTTP requests to CRXDE Lite resources will fail:

```xml
404 Resource at '/crx/server/crx.default/jcr:root/.1.json' not found: No resource found
```

While this recommendation is intended to reduce attack surfaces as much as possible, system administrators might sometimes need access to CRXDE Lite to browse content or debug issues on production instances.

You can enable CRXDE Lite with either [OSGi settings](#enabling-crxde-lite-osgi) or with a [cURL command](#enabling-crxde-lite-curl).

>[!WARNING]
>
>Due to slight differences in how these methods operate you should use ***either*** OSGI ***or*** cURL. 
>
>The two methods are ***not*** interchangeable.

## Enabling CRXDE Lite with OSGI {#enabling-crxde-lite-osgi}

If disabled, you can turn CRXDE Lite on by following the below procedure:

1. Go to the OSGi Components console at `http://localhost:4502/system/console/components`
1. Search for the following component:

    * `org.apache.sling.jcr.davex.impl.servlets.SlingDavExServlet`

1. Click the wrench icon next to it to see its configuration options:

   ![chlimage_1-80](assets/chlimage_1-80a.png)

1. Create the following configuration:

    * **Root path:** `/crx/server`
    * Tick the box under **Use absolute URIs**.

1. When finished using CRXDE Lite, make sure you disable WebDAV again.

## Enabling CRXDE Lite with cURL {#enabling-crxde-lite-curl}

You can also enable CRXDE Lite via cURL, by running these two commands:

```shell
curl -u admin:admin 'http://localhost:4502/system/console/configMgr/org.apache.sling.jcr.davex.impl.servlets.SlingDavExServlet' --data-raw 'apply=true&action=ajaxConfigManager&%24location=&dav.create-absolute-uri=true&propertylist=dav.create-absolute-uri'
```

```shell
curl -u admin:admin 'http://localhost:4502/system/console/configMgr/org.apache.sling.jcr.davex.impl.servlets.SlingDavExServlet' --data-raw 'apply=true&action=ajaxConfigManager&%24location=&alias=/crx/server&propertylist=alias'
```

## Other Resources {#other-resources}

For more information on AEM 6 security features, see the following pages:

* [The AEM Security Checklist](/help/sites-administering/security-checklist.md)
* [Running AEM in Production Ready Mode](/help/sites-administering/production-ready.md)

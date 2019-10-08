---
title: Dispatcher Configurations for AEM Screens
seo-title: Dispatcher Configurations for AEM Screens
description: null
seo-description: null
page-status-flag: never-activated
uuid: ea68ca72-bbe7-42d5-9043-97aea7edcd6e
contentOwner: jsyal
discoiquuid: 046ec5ae-600d-422f-aa59-c39f16cf71de
docset: aem65

---

# Dispatcher Configurations for AEM Screens{#dispatcher-configurations-for-aem-screens}

Dispatcher is Adobe Experience Manager's caching and/or load balancing tool.

The following page provides the guidelines for configuring dispatcher for an AEM Screens project.

## Pre-requisites {#pre-requisites}

Before you configure dispatcher for an AEM Screens project, you must have prior knowledge of Dispatcher.

Refer to **[Configuring Dispatcher](https://docs.adobe.com/content/help/en/experience-manager-dispatcher/using/configuring/dispatcher-configuration.html)** for more details.

## Configuring Dispatcher {#configuring-dispatcher}

Follow the steps below to configure dispatcher for an AEM Screens project.

### Step 1: Configuring Client Headers {#step-configuring-client-headers}

Add the following to `/clientheaders` section

**X-Requested-With**

**X-SET-HEARTBEAT**

**X-REQUEST-COMMAND**

### Step 2: Configuring Screens Filters {#step-configuring-screens-filters}

To configure Screens filters, add the following to ***/filter***.

```
## AEM Screens Filters
## # Login, Ping and Device Configurations
/0200 { /type "allow" /method "POST" /url "/libs/granite/core/content/login.validate/j_security_check" }
/0201 { /type "allow" /method "GET" /url "/content/screens/svc.json" }
/0202 { /type "allow" /method "GET" /url "/content/screens/svc.ping.json" }
/0203 { /type "allow" /method "GET" /url "/content/screens/svc.config.json" }
## # Device Dashboard Configurations
/0204 { /type "allow" /method "POST" /url "/home/users/screens/*/devices/*/profile_screens.preferences.json" }
/0205 { /type "allow" /method "POST" /url "/home/users/screens/*/devices/*/profile_screens.logs.json" }
/0206 { /type "allow" /method "POST" /url "/home/users/screens/*/devices/*/profile_screens.statusinfo.json" }
/0207 { /type "allow" /method "POST" /url "/home/users/screens/*/devices/*/profile_screens.screenshot.json" }
## # Content Configurations
/0208 { /type "allow" /method '(GET|HEAD)' /url "/content/screens/*" }
/0209 { /type "allow" /method '(GET|HEAD)' /url "/content/screens/*/jcr:content/*/offline-config_*.zip" }
/0210 { /type "allow" /method '(GET|HEAD)' /url '/var/contentsync/content/screens/.+/jcr:content/.+/offline-config_.*\.[0-9]+\.zip' }
```

### Step 3: Disabling Dispatcher Cache {#step-disabling-dispatcher-cache}

Disable dispatcher caching for ***/content/screens path***.

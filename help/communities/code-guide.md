---
title: Coding Guidelines
seo-title: Coding Guidelines
description: Communities developer guidelines, tips, and tricks
seo-description: Communities developer guidelines, tips, and tricks
uuid: 311ef4f7-7f2c-44c3-bcf2-f68713752623
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: 244cd43c-a573-495d-b80c-b97ba9d19b75
---

# Coding Guidelines {#coding-guidelines}

## Guidelines, Tips and Tricks {#guidelines-tips-and-tricks}

Working with AEM Communities has evolved from being heavily dependant on Java Server Pages to flexibility in the choice of templating scripting languages where business logic, style, and page content are distinct from one another.

Further flexibility in working with user generated content (UGC) is through the SocialResourceProvider API, which eliminates the need for awareness of which [SRP](srp.md) option was chosen for the deployment.

Following are various coding guidelines and best practices for AEM Communities developers:

### Code {#code}

* [Accessing UGC with SRP](accessing-ugc-with-srp.md) - how to avoid writing an application that only works when UGC is stored in JCR (JSRP).
* [SocialUtils Refactoring](socialutils.md) - utility methods for SRP that replace SocialUtils.
* [Naming Conventions](naming-conventions.md) - naming conventions for custom Java classes.

### Scripts {#scripts}

* [Sideloading Communities Components](sideloading.md) - how to dynamically add a component after the page loads.
* [Rich Text Editor Essentials](rte.md) - how to customize the rich text UI provided to members for posting content.

### IDE {#ide}

* [Using Maven for Communities](maven.md) - how to include the Communities API jar.
* [SocialUtils Refactoring](socialutils.md) - utility methods for SRP that replace SocialUtils.


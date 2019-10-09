---
title: Code pitfalls
seo-title: Code pitfalls
description: Common coding pitfalls to avoid when developing for AEM
seo-description: Common coding pitfalls to avoid when developing for AEM
uuid: e7413bdc-4889-45ff-bdcb-b0893d33a3b7
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.4/SITES
content-type: reference
topic-tags: best-practices
discoiquuid: 01362026-a696-4a5d-94e9-ea784eaa6e4b
---

# Code pitfalls{#code-pitfalls}

## Avoid Sling Bindings in Java code {#avoid-sling-bindings-in-java-code}

Sling Bindings are an inappropriate way to get access to a service in 90% of cases. Instead, you should use *@Reference* or *@Inject* annotations.

## Avoid Thread.interrupt in Java code {#avoid-thread-interrupt-in-java-code}

*Thread.interrupt* is dangerous because it can close files, including Lucene files and persistent cache files, when called at the wrong time.

## Avoid mixing Java synchronization with ReadWriteLocks {#avoid-mixing-java-synchronization-with-readwritelocks}

This can lead to a race condition in which the code will eventually deadlock. 

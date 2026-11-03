---
title: Code pitfalls
description: Common coding pitfalls to avoid when developing for AEM
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: best-practices
exl-id: c448c5d5-def8-4c1a-8db4-41eb49d0cd20
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: c45915cf-e157-4af7-a80d-97b905bcb3a5
    internal-label: Experience Manager Sites
feature_v2:
  - id: c5d917df-d8bd-5e97-a117-6dde1e9f7103
    internal-label: Developing
role_v2:
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Code pitfalls{#code-pitfalls}

## Avoid Sling Bindings in Java code {#avoid-sling-bindings-in-java-code}

Sling Bindings are an inappropriate way to get access to a service in 90% of cases. Instead, you should use *@Reference* or *@Inject* annotations.

## Avoid Thread.interrupt in Java code {#avoid-thread-interrupt-in-java-code}

*Thread.interrupt* is dangerous because it can close files, including Lucene files and persistent cache files, when called at the wrong time.

## Avoid mixing Java synchronization with ReadWriteLocks {#avoid-mixing-java-synchronization-with-readwritelocks}

This can lead to a race condition in which the code will eventually deadlock.

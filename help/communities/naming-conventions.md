---
title: Naming conventions in the Java&trade; package name
description: Learn about naming conventions and the use of hyphens in the Java&trade; package name.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: 863900c3-5fe8-41a3-a151-466d0c62eeea
solution: Experience Manager
feature: Communities
role: Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
feature_v2:
  - id: b013f126-a97e-52d1-9f79-cb5bbb12114e
    internal-label: Communities
role_v2:
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Naming Conventions {#naming-conventions}

## Hyphens in Java&trade; Package Name {#hyphens-in-java-package-name}

When creating a location for a Java&trade; class, the package name must match that of the repository folder location with any hyphens in the path properly escaped.

While using hyphens in the names of repository items is a recommended practice in AEM development, hyphens are illegal within Java&trade; package names.

The underlying CRX platform must be able to distinguish between an actual underscore `_ `and a hyphen `-`. Thus, in JCR, the hyphen must be replaced with its Unicode value (u002d) and escaped with an underscore `_`.

For example, if the repository path is **/apps/my-example/component/info/Info.java**, the package name should be `java package apps.my_002dexample.component.info;`

Notice that an underscore must similarly be escaped, such that `_` becomes `_005f`.

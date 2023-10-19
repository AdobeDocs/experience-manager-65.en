---
title: Naming conventions in the Java&trade; package name
description: Learn about naming conventions and the use of hyphens in the Java&trade; package name.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: 863900c3-5fe8-41a3-a151-466d0c62eeea
---
# Naming Conventions {#naming-conventions}

## Hyphens in Java&trade; Package Name {#hyphens-in-java-package-name}

When creating a location for a Java&trade; class, the package name must match that of the repository folder location with any hyphens in the path properly escaped.

While using hyphens in the names of repository items is a recommended practice in AEM development, hyphens are illegal within Java&trade; package names.

The underlying CRX platform must be able to distinguish between an actual underscore `_ `and a hyphen `-`. Thus, in JCR, the hyphen must be replaced with its Unicode value (u002d) and escaped with an underscore `_`.

For example, if the repository path is **/apps/my-example/component/info/Info.java**, the package name should be `java package apps.my_002dexample.component.info;`

Notice that an underscore must similarly be escaped, such that `_` becomes `_005f`.

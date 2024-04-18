---
title: OSGi Bundles
description: Learn some tips for managing your OSGi bundles in Adobe Experience Manager.
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: best-practices
exl-id: e18065c7-75b9-4b37-8294-cf94122a4dcf
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# OSGi Bundles{#osgi-bundles}

## Use semantic versioning {#use-semantic-versioning}

Agreed upon best practices for semantic version numbering can be found at [https://semver.org/](https://semver.org/).

## Do not embed more classes and jars than strictly needed in OSGi bundles {#do-not-embed-more-classes-and-jars-than-strictly-needed-in-osgi-bundles}

Common libraries should be factored out into separate bundles. This allows them to be reused across your bundles. When wrapping a *JAR* in an OSGi bundle, make sure to check online sources to see if someone has already done this before. Some common places to find existing bundle wrappers are: Apache Felix, Apache Sling, Apache Geronimo, Apache ServiceMix, Eclipse Bundle Recipes, and the SpringSource Enterprise Bundle Repository.

## Depend on the lowest needed bundle versions {#depend-on-the-lowest-needed-bundle-versions}

For compile-time dependencies in POM files, always depend on the lowest needed version that exposes the needed API. This allows for higher backwards compatibility and makes backporting fixes to older releases easier.

## Export a minimal set of packages from OSGi bundles {#export-a-minimal-set-of-packages-from-osgi-bundles}

When a package has been exported, an API has been created for others to depend on. Make sure to export as little as possible and make sure that what is being exported is an API. It is much easier to take a private method/class and make it public than it is to take something that was previously exported and make it private.

Always place implementations in a separate *impl* package. By default, the *maven-bundle-plugin* exports anything in the project that does not have an *impl* in its name.

## Always explicitly define a semantic version for each package exported {#always-explicitly-define-a-semantic-version-for-each-package-exported}

This allows consumers of your API to evolve along with you. When doing so, always follow semantic versioning best practices. This allows consumers of your API to know what types of changes to expect in a new version.

## Include metatype information where exposed {#include-metatype-information-where-exposed}

By specifying meaningful metatype information, it makes your services and components easier to understand in the Felix console. A list of SCR annotations and attributes can be found at: [https://felix.apache.org/documentation/subprojects/apache-felix-maven-scr-plugin/scr-annotations.html](https://felix.apache.org/documentation/subprojects/apache-felix-maven-scr-plugin/scr-annotations.html).

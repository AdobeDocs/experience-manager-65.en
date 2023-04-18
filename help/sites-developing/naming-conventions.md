---
title: Naming conventions of nodes in the Jave content repository

description: Nodes in the repository are subject to naming conventions of the Java Content Repository

uuid: 0515c5c5-3e93-4710-983f-c08c146467fc
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: platform
content-type: reference
discoiquuid: 198098c0-432b-4a93-a94e-2552337435dd
exl-id: 01c6bb29-1d2d-4a45-b291-0e8d97c01a08
---
# Naming Conventions{#naming-conventions}

Nodes in the repository are subject to naming conventions of the [Java Content Repository](/help/sites-developing/the-basics.md#java-content-repository). However AEM imposes further conventions for the name of page nodes.

## Naming Conventions for Pages {#naming-conventions-for-pages}

These naming conventions are implemented at various levels:

* JcrUtil: the AEM implementation of the [JCR utilities](#jcr-utilities).
* PageManager: the [Page Manager](#page-manager) provides methods for page level operations.
* According to the UI being used:

    * [Standard, touch-enabled UI](#standard-ui)
    * [Classic UI](#classic-ui)

### JCR Utilities {#jcr-utilities}

[JcrUtil](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/index.html?com/day/cq/commons/jcr/JcrUtil.html) is the AEM implementation of the JCR utilities. Of particular interest to validating names are the character mappings that it controls and the following validations:

* `isValidName`

    * Checks if the name is not empty and contains only valid chars.
    * Can be used to check whether a proposed name is valid.

* `createValidName`

    * This creates a valid label out of an arbitrary string.
    * It can be used to create a name from a title.

### Page Manager {#page-manager}

[PageManager](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/day/cq/wcm/api/PageManager.html) provides methods for page level operations, based on [JCRUtil](#jcr-utilities).

### Standard UI {#standard-ui}

The standard, touch-enabled UI:

* Validates the name according to the restrictions imposed by PageManager when either:

    * a page title is provided for conversion into the node name
    * an explicit node name is provided

### Classic UI {#classic-ui}

The classic UI imposes tighter restrictions:

* Validates the name when an explicit node name when either:

    * a page title is provided for conversion into the node name
    * an explicit node name is provided

* Valid characters (only these characters are actually valid when a page is created from within the classic UI, even though `PageManagerImpl` would allow additional characters):

    * 'a' to 'z'
    * 'A' to 'Z'
    * '0' to '9'
    * _ (underscore)
    * `-` (dash/minus)

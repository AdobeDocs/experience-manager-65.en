---
title: Naming conventions for assets testing
seo-title: Naming conventions for assets
description: Nodes in the repository are subject to naming conventions of the Java Content Repository. However, Adobe Experience Manager imposes further conventions for the name of asset nodes.
seo-description: Nodes in the repository are subject to naming conventions of the Java Content Repository. However, Adobe Experience Manager imposes further conventions for the name of asset nodes.
uuid: 6b622a60-90e8-461e-9b67-42c11c7038f9
contentOwner: Chris Bohnert
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: authoring
content-type: reference
discoiquuid: 55e66c66-0120-4ed4-94c5-d65a434bb59b
---

# Naming conventions for assets testing{#naming-conventions-for-assets-testing}

Nodes in the repository are subject to naming conventions of the [Java Content Repository](/help/sites-developing/the-basics.md#java-content-repository). However, Adobe Experience Manager imposes further conventions for the name of asset nodes.

## Classic UI {#classic-ui}

The classic UI imposes tighter restrictions:

* Validates the asset name when an explicit node name when either:

    * an asset title is provided for conversion into the node name
    * an explicit node name is provided

* Valid characters (only these characters are actually valid when an asset is created from within the classic UI):

    * 'a' to 'z'
    * 'A' to 'Z'
    * '0' to '9'
    * _ (underscore)
    * `-` (dash/minus)


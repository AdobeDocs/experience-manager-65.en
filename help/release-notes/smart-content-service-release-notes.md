---
title: Smart Content Service Release Notes
seo-title: Smart Content Service Release Notes
description: Overview of the Smart Content Service and known issues around the service.
seo-description: Overview of the Smart Content Service and known issues around the service.
uuid: 5f474b36-3451-48ea-8669-b2d793638b06
content-type: reference
products: SG_EXPERIENCEMANAGER
discoiquuid: 9f88c773-ddeb-4c66-ac07-7d3aa196c51b
---

# Smart Content Service Release Notes {#smart-content-service-release-notes}

Overview of the Smart Content Service and known issues around the service.

Organizations require their digital assets to be tagged based on the taxonomy that employees, partners, and customers use to refer to and search digital assets. Compared to generic tags, assets that are tagged based on business taxonomy are more easily identified and retrieved by tag-based searches.

The Smart Content Service uses your business taxonomy of AEM Assets to automatically tag digital assets, which ensures that the most relevant assets appear in searches.

You must train the Smart Content Service on a curated set of AEM assets and tags to recognize your business taxonomy. Once trained, the service can apply these tags on a similar set of assets.

The Smart Content Service is powered by the Adobe Sensei platform, which enables you to train the image recognition algorithm on your business taxonomy. This content intelligence is then used to apply relevant tags on similar assets.

## Key improvements {#key-improvements}

The Smart Content Service includes the following key improvements:

* Algorithm optimizations to further improve model precision, recall values
* Support for resetting model training for all tags at tenant level
* Support for Enhanced Smart Tags namespaces to avoid conflicts
* New model replacement policy to avoid any degradation due to retraining 
* Tenant-wise monitoring for service usage
* Fixes for issues around clustering and connection, which enhance the robustness of service

## Fixed issues {#fixed-issues}

The following issues were fixed in this release:

* Worker processes for tagging and training workflows terminate if unable to connect to the MySQL server. CQ-4242886

* Precision biased score is not calculated properly. CQ-4241797

* Incorrect PR calculation for model. CQ-4241381

* The training workflow misses example assets when processing them from queue CQ-4240901

* Improvements in precision recall. CQ-4239895

* Model replacement policy. CQ-4239886

* Images for men's shirt are tagged with the women jacket tag. CQ-4239650

* Training examples are missed on stage deployment. CQ-4239483

* Validation in training job should happen on a set of assets submitted for training. CQ-4238834

* Model creation fails for negative foraging even if minimum positives/negatives are present for a tag. CQ-4240741

* Misleading entries for negative foraging in trainer logs. CQ-4240738

* Issue with first-time training if tags submitted for training are random negatives of each other. CQ-4240118

* Improvise logs to monitor service usage per tenant. CQ-4239781

## Languages {#languages}

The Smart Content Service is available for following locales:

* English
* German
* French
* Spanish
* Italian
* Portuguese
* Japanese
* Simplified Chinese
* Korean

## Links {#links}

* [Adobe Experience Manager Product Page on adobe.com](https://www.adobe.com/marketing-cloud/experience-manager.html)
* [Enhanced Smart Tags Documentation](/help/assets/enhanced-smart-tags.md)

## Product Access and Support (Restricted Sites) {#product-access-and-support-restricted-sites}

These sites are only available to customers. If you are a customer and require access, contact your Adobe account manager.

* [](https://daycare.day.com) [Product Access](https://login.marketing.adobe.com)

* [Adobe Customer Care](https://helpx.adobe.com/contact/enterprise-support.ec.html)

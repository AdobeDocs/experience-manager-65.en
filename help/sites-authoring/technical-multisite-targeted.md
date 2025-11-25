---
title: How Multisite Management for Targeted Content is Structured

description: A diagram shows how multisite support for targeted content is structured


contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: personalization

exl-id: d8ba91ff-ad6e-4540-baff-a2c0c764a299
solution: Experience Manager, Experience Manager Sites
feature: Authoring,Personalization
role: User,Admin,Developer
---
# How Multisite Management for Targeted Content is Structured{#how-multisite-management-for-targeted-content-is-structured}

The following diagram shows how multisite support for targeted content is structured.

Areas appear underneath **/content/campaigns/&lt;brand&gt;** and by default each brand has a master area, which is created automatically. Each area contains its own set of activities, experiences, and offers.

![chlimage_1-268](assets/chlimage_1-268.png)

To look up targeted content, the pages or sites can map to an area. If there is no area configured, AEM falls back to the master area for this specific brand.

The following diagram is an example of how the logic works for three sites, called site1, site2, and site3.

![chlimage_1-269](assets/chlimage_1-269.png)

* site1 looks up myarea1 for brand1 and otherarea2 for brand2 based on area mapping.
* site2 looks up myarea1 for brand1 and master area for brand2 as only the area mapping for brand1 is defined.
* site3 looks up the master area for brand1 and brand2 as no other area mapping is defined at all for this site.

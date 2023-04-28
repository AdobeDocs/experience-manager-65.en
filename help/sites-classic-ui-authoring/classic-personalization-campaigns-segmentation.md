---
title: Understanding Segmentation
description: Segmentation is a key consideration when creating a campaign. In most cases, you will need to have segments already defined before starting your campaign.
uuid: 609d83b3-df0e-44ad-8e27-90b676d2666b
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: personalization
content-type: reference
discoiquuid: bb75f4ab-d983-45f6-98a3-da8bd9b63751
exl-id: 9092977b-b558-42a3-8092-4615fbc0a08e
---
# Understanding Segmentation{#understanding-segmentation}

Segmentation is a key consideration when creating a campaign. In most cases, you will need to have segments already defined before starting your campaign.

Site visitors have different interests and objectives when they come to a site. Understanding these goals and fulfilling the expectations is an important success factor for online marketing.

Segmentation helps to achieve this by analyzing and characterizing a visitor's:

* activity on the website
* profile
* activity on other websites

Content can then be specifically targeted to the visitor's needs and interests, depending on the segment(s) they match.

## Using Segmentation {#using-segmentation}

Segments are defined in [Configuring Segmentation](/help/sites-administering/campaign-segmentation.md). They are used to steer the actual content seen by a specific target audience.

## Segmentation terminology {#segmentation-terminology}

When discussing segmentation, the following terminology is used:

**Visitor** A visitor is a person visiting a website. That person's visit typically starts from a referring page, then moves on to one or more page views on your own website. A behavioral profile can be created from the details of that person's visit.

**User** A user is a visitor who registers with the website to receive an account profile. To generate their profile they provide additional identification, such as an email address and gender, amongst others. Additional information can also be collected, including community activity and purchase patterns, again amongst others. Based on the information provided in the profile, a demographic profile can be created.

**Trait** A trait is a characteristic or property of a visitor that can be used to determine membership in a specific segment.

**Segment** A segment is a collection of visitors that share certain traits. Segments should be distinctive, with a minimum of overlap with other segments.

**Behavioral Traits** Behavioral traits are those that relate to a visitor's behavior on the website. These include:

* Interest within your website; including pages visited and products bought.
* Interest on the referring website; including search terms used, or adverts clicked on.
* Interest on other sites; determined using tools such as Spyjax.
* Visitor loyality; duration of the visit, frequency of visits.

**Demographic Traits** These are selected population characteristics including:

* Age
* Income
* Family size
* Marital status
* Gender
* Location

**Derived Traits**

Some demographic traits are hard to determine without registration, but can be derived by combining behavioral and demographic traits.

For example, combining the referring URL (as a behavioral trait) with demographic data (acquired from tools such as [Google Ad Planner](https://www.google.com/adplanner/)) allows site owners to derive demographics traits of their visitors.

**Subsegment** A segment can be subdivided into several subsegments. This is done by defining additional traits.

**Teaser Page** A teaser page is directed at a specific audience. It contains re-usable content that can be used in the teaser paragraph.

**Campaign** A campaign is a collection of teaser pages and e-mail marketing pages, such as newsletters or invitations. Typically a campaign runs for a limited period and is superceded by another campaign.

**Teaser Paragraph** This is a paragraph that pulls content from another page dependent on a selection strategy. This selection strategy can take segments and campaigns into consideration.

**List** A list is extracted from a segment of registered users. For example, the location used to steer the contents of the teaser paragraph.

>[!NOTE]
>
>Please see [Segmentation](/help/sites-administering/campaign-segmentation.md) for further information on segments in AEM.

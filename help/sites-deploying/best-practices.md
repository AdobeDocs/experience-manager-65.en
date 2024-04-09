---
title: Deploying Best Practices
description: Learn how to deploy and maintain Adobe Experience Manager (AEM) in the most efficient and effective way possible.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: best-practices
exl-id: 4cbc0a30-d5f6-40ff-b7f6-8d64762e1970
solution: Experience Manager, Experience Manager Sites
feature: Administering
role: Admin
---
# Deploying Best Practices{#deploying-best-practices}

Deploying best practices describe how to deploy or maintain Adobe Experience Manager (AEM) in the most efficient and most effective way possible. This growing list of topics includes various areas in AEM.

The following areas have documentation available concerning deploying and maintaining best practices and recommendations:

* [Oak](#oak)
* [Communities](#communities)
* [UI](#ui)
* [Performance](#performance)

For best practices on administering, developing, or authoring, see one of the following:

* [Administering best practices](/help/sites-administering/administer-best-practices.md)
* [Developing best practices](/help/sites-developing/best-practices.md)
* [Authoring best practices](/help/sites-authoring/best-practices.md)

Specific documents are described and linked to in the tables that follow.

## Oak {#oak}

[Oak](/help/sites-deploying/platform.md) is a scalable and performant hierarchical content repository that is the foundation of AEM.

<table>
 <tbody>
  <tr>
   <td><p>Scalability, Performance, and Disaster Recovery</p> </td>
   <td><a href="/help/sites-deploying/performance.md">Performance &amp; Scalability</a></td>
   <td>Provides a white paper discussing the technical agility, high performance, and sound disaster recovery features</td>
  </tr>
  <tr>
   <td>Recommended Oak deployments</td>
   <td><a href="/help/sites-deploying/recommended-deploys.md">Recommended deployments</a></td>
   <td>Describes deployment scenarios</td>
  </tr>
  <tr>
   <td>Mongo topology</td>
   <td><a href="/help/sites-deploying/recommended-deploys.md">Mongo topology best practices</a></td>
   <td>Describes mongo topology - when to use which topology.</td>
  </tr>
  <tr>
   <td>Datastore options</td>
   <td><a href="/help/sites-deploying/data-store-config.md">Configuring node and data stores</a></td>
   <td>This document explains best practices around storing binary data and content nodes. Includes information on using Amazon S3 data store.</td>
  </tr>
  <tr>
   <td>Search in Oak</td>
   <td><a href="/help/sites-deploying/best-practices-for-queries-and-indexing.md">Best Practices for Queries and Indexing</a><br /> </td>
   <td>Describes best practices on how to index content.</td>
  </tr>
 </tbody>
</table>

## Communities {#communities}

AEM Communities simplifies the creation and management of on-premise Communities. Best practices for AEM Communities are described here:

[Community Content Store](/help/communities/working-with-srp.md) - Discusses the new shared storage feature for user-generated content (UGC) and the considerations for choosing the underlying [topology](/help/communities/topologies.md).

[Recommended deployments for communities](/help/sites-deploying/recommended-deploys.md#considerations-for-aem-communities) - Describes the recommended deployments for Communities. |

## UI {#ui}

Best practices around the user interface are described here:

[User Interface Recommendations for Customers](/help/sites-deploying/ui-recommendations.md)

AEM currently has two UIs: classic and touch-optimized UI in the same release. Therefore customers have to make a decision about which to use during the project implementation. This document is intended to help with finding the right choice.

## Performance {#performance}

Best practices around performance are listed here:

<table>
 <tbody>
  <tr>
   <td>Best Practices for Quality Assurance</td>
   <td><a href="/help/sites-deploying/configuring-performance.md#best-practices-for-quality-assurance">Best Practices for Quality Assurance</a></td>
   <td>A standardized overview of the issues involved with defining a Test Concept specifically for performance tests on your <em>publish</em> environment. This is primarily of interest to QA engineers, project managers, and system administrators.</td>
  </tr>
  <tr>
   <td>Using Dispatcher with a CDN</td>
   <td><a href="https://experienceleague.adobe.com/docs/experience-manager-dispatcher/using/dispatcher.html#using-dispatcher-with-a-cdn">Using Dispatcher with a CDN</a></td>
   <td>A content delivery network (CDN), such as Akamai Edge Delivery or Amazon Cloud Front, deliver content from a location close to the end user.</td>
  </tr>
  <tr>
   <td>Performance Optimization</td>
   <td><a href="/help/sites-deploying/configuring-performance.md">Performance Optimization</a></td>
   <td>A key issue is the time that your website takes to respond to visitor requests.</td>
  </tr>
  <tr>
   <td>Performance Testing</td>
   <td><a href="/help/sites-deploying/best-practices-for-performance-testing.md">Best Practices for Performance Testing</a></td>
   <td>Describes best practices for running performance tests on an AEM deployment.<br /> </td>
  </tr>
 </tbody>
</table>

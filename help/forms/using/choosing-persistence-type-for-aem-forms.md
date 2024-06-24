---
title: Choosing a persistence type for an AEM Forms installation

description: Choose a persistence type wisely. It helps you build an efficient and scalable AEM Forms environment.


content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: installing
geptopics: SG_AEMFORMS/categories/jee

role: Admin
exl-id: 621fe107-f4ac-42b1-8c7b-8abbcaac7380
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,Foundation Components
---
# Choosing a persistence type for an AEM Forms installation {#choosing-a-persistence-type-for-an-aem-forms-installation}

Choose a persistence type wisely. It helps you build an efficient and scalable AEM Forms environment.

Persistence is the method to store content on the physical storages. It defines the actual data structure and storage mechanism for the data. MicroKernels act as persistence managers in AEM Forms. AEM Forms supports persistence (MicroKernals) of type TarMK, MongoMK, and RDBMK. You can choose a persistence type for AEM Forms depending upon the purpose and deployment type (Single-Server, Farm, or Cluster) of an AEM Forms instance.

>[!NOTE]
>
>LiveCycle ES4 SP1 uses TarPM persistence to store content.

The following table lists all the supported persistence types along with various parameters to help you choose a persistence type for your environment:

<table>
 <tbody>
  <tr>
   <th><strong>Installation Type / Cost</strong></th>
   <th><strong>TarMK</strong></th>
   <th><strong>MongoMk</strong></th>
   <th><strong>RDBMK</strong></th>
  </tr>
  <tr>
   <th><strong>Standalone Setup</strong></th>
   <td>Supported<br /> </td>
   <td>Supported</td>
   <td>Supported</td>
  </tr>
  <tr>
   <th><strong>Cluster Setup</strong></th>
   <td>Not Supported</td>
   <td>Supported</td>
   <td>Supported</td>
  </tr>
  <tr>
   <th><strong>License Cost</strong></th>
   <td>Included with AEM </td>
   <td>Separate license required</td>
   <td>Separate license required</td>
  </tr>
 </tbody>
</table>

TarMK is designed for performance, while MongoMK and RDBMK are designed for scalability. Adobe highly recommends TarMK as the default persistence technology for all AEM Forms deployment scenarios, for both Author and Publish instances, except in the use cases outlined in section [Choosing Mongo or a Relational Database Microkernel over TarMK](#p-choosing-mongo-or-a-relational-database-microkernel-over-tarmk-p).

For the list of supported Microkernels, see [AEM Forms on OSGi Technical Requirements](/help/sites-deploying/technical-requirements.md) or [AEM Forms on JEE supported platform combinations](/help/forms/using/aem-forms-jee-supported-platforms.md) articles.

## Choosing Mongo or a Relational Database Microkernel over TarMK {#choosing-mongo-or-a-relational-database-microkernel-over-tarmk}

A scalable (clustered) AEM Forms environment is a set of two or more horizontally configured active author instances. You can choose to run more than one author instance if a single server, supporting all concurrent authoring activities, is no longer sustainable.

Only MongoMK and RDBMK persistence type are supported for a scalable (clustered) AEM Forms on JEE environment. The number of servers or the size of scalable environment varies for every installation. For a list of considerations and examples, see the [Recommended Deployments](/help/sites-deploying/recommended-deploys.md) and or [Architecture and deployment topologies for AEM Forms](/help/forms/using/aem-forms-architecture-deployment.md) article. You can also contact AEM Forms support for detailed information on capacity planning for AEM Forms with RDBMK and TarMK.

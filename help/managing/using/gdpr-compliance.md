---
title: GDPR Readiness
seo-title: AEM and General Data Protection Regulation (GDPR) 
description: Learn about AEM support for the EU General Data Protection Regulation (GDPR) and how to comply when implementing a new AEM project.
seo-description: Learn about AEM support for the EU General Data Protection Regulation (GDPR) and how to comply when implementing a new AEM project.
uuid: 264d5a90-f711-4c36-93a0-d0c42eb15d49
contentOwner: aheimoz
topic-tags: introduction
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/MANAGING
topic-tags: grdp
discoiquuid: 31bae092-cd28-4aba-ba09-f9ad0d5b25e6
index: y
internal: n
snippet: y
---

# GDPR Readiness{#gdpr-readiness}

The European Union's General Data Protection Regulation on data privacy rights takes effect as of May 2018:

"*The EU General Data Protection Regulation (GDPR) replaces the Data Protection Directive 95/46/EC and was designed to harmonize data privacy laws across Europe, to protect and empower all EU citizens data privacy and to reshape the way organizations across the region approach data privacy.*"

The regulation will apply to any company doing business with individuals in the EU.

Adobe recognizes that this presents a new opportunity for companies to strengthen their brand loyalty by focusing on consumer privacy while delivering amazing experiences.

For further information see the [GDPR page at the Adobe Privacy Center](https://www.adobe.com/privacy/general-data-protection-regulation.html).

Adobe Experience Manager (AEM) must be considered as part of a company's GDPR compliance efforts. These considerations can be broken down by module.

## AEM and GDPR - Brief Introduction {#aem-and-gdpr-brief-introduction}

AEM instances, and the custom applications that might process Personal Data, are owned and operated by AEM customers. This means that the Data Subject requests for access and erasure (deletion) as defined in GDPR are both owned and managed by the AEM customer, so AEM 6.4 does not include any out-of-the-box service to handle GDPR requests.

![](assets/gdpr-01.png)

The diagram above illustrates what a GDPR request workflow might look like.

Adobe is providing documentation and procedures (with APIs when available), for the customer privacy administrator or AEM administrator to handle GDPR requests and help our customers be compliant with this regulation. The procedure documented will allow them to execute the GDPR requests manually or by calling into APIs, where available, from an external portal or service. Please see the sections below for GDPR documentation for AEM product areas.

## AEM Foundation {#aem-foundation}

See [Handling GDPR Requests for the AEM Foundation](/sites/administering/using/handling-gdpr-requests-for-aem-platform.md).

## AEM Opting Into Aggregate Usage Statistics Collection {#aem-opting-into-aggregate-usage-statistics-collection}

See [Aggregated Usage Statistics Collection](../../sites/deploying/using/opt-in-aggregated-usage-statistics.md).

<!--
Comment Type: remark
Last Modified By: Alison Heimoz (aheimoz)
Last Modified Date: 2018-05-23T01:27:01.102-0400
<p>see <a href="https://jira.corp.adobe.com/browse/CQ-110592">https://jira.corp.adobe.com/browse/CQ-110592</a></p>
<p>PROPOSED LANGUAGE:</p>
<p>Aggregated Usage Statistics Collection (title of window)</p>
<p>Help us improve Adobe Marketing Cloud by sending us usage statistics about how you interact with Adobe Experience Manager. This information does not contain any data about your company’s site visitors, and will only be used to help us deliver, support, and improve your user experience.</p>
-->

<!--
Comment Type: remark
Last Modified By: Alison Heimoz (aheimoz)
Last Modified Date: 2018-05-23T01:05:21.170-0400
<p>Based on the legal review for the UI.</p>
-->

<!--
Comment Type: draft

<p>The <a href="../../sites/deploying/using/opt-in-aggregated-usage-statistics.md">Aggregated Usage Statistics Collection</a> is GDPR compliant. No Personal Data is stored in AEM in relation to the statistics.</p>
-->

<!--
Comment Type: remark
Last Modified By: Alison Heimoz (aheimoz)
Last Modified Date: 2018-05-23T01:05:03.610-0400
<p>From legal review for GDPR.</p>
-->

<!--
Comment Type: draft

<p><a href="../../sites/deploying/using/opt-in-aggregated-usage-statistics.md">Aggregated Usage Statistics Collection</a> does not use, collect or store Personal Data in relation to the statistics.</p>
-->

## AEM Sites {#aem-sites}

See [AEM Sites - GDPR Readiness.](/sites/administering/using/gdpr-compliance-sites.md)

## AEM Commerce {#aem-commerce}

[See AEM Commerce - GDPR Readiness](/sites/administering/using/gdpr-compliance-commerce.md).

## AEM Mobile {#aem-mobile}

See [AEM Mobile - GDPR Readiness](/mobile/using/aem-mobile-gdpr-compliance.md).

## AEM Integration with Adobe Target & Adobe Analytics {#aem-integration-with-adobe-target-adobe-analytics}

These AEM integrations are with GDPR ready services. No personal data from Adobe Target or Adobe Analytics is stored in AEM in relation to the integrations.

For further information see:

* [Adobe Target - Privacy and General Data Protection Regulation](https://marketing.adobe.com/resources/help/en_US/target/target/privacy-and-general-data-protection-regulation.html)  

* [Adobe Analytics and GDPR](https://marketing.adobe.com/resources/help/en_US/analytics/gdpr/)

## AEM Communities {#aem-communities}

AEM Communities bestows upon the data subjects right to their data portability, right to access, and right to be forgotten by means of [out-of-the-box APIs](../../communities/using/user-ugc-management-service.md). These APIs enable bulk deletion and bulk export of user generated content, and disabling user accounts identified through their authorizable IDs. However, permanent deletion of user account is realizable through deletion of user node in CRXDE Lite, which addresses the need of easy Opt-out from the system.

Additionally, AEM Communities offers privacy by design owing to its Bulk Moderation console, which allows privileged members to find and delete the contributions and details of the users. The Members management console enables limiting to the point of banning a contributor. Moreover, it authorizes the data subjects to delete the contributions authored by them.

## AEM Forms {#aem-forms}

AEM Forms includes components and workflows that capture, process, and store data to orchestrate business processes and complete digital transactions. Different components use different data stores and allow integration with custom data stores as well. The following documentation explains procedures and guidelines for accessing and handling user data to support GDPR workflows for a component.

* [Forms Portal](/forms/using/forms-portal-handling-user-data.md)
* [Correspondence Management](/forms/using/correspondence-management-handling-user-data.md)
* [Integration with Adobe Sign](/forms/using/integration-adobe-sign-handling-user-data.md)
* [Forms-centric workflows on OSGi](/forms/using/forms-workflow-osgi-handling-user-data.md)
* [Forms JEE workflows](/forms/using/forms-workflow-jee-handling-user-data.md) (AEM Forms JEE only)
* [Document Security](/forms/using/document-security-handling-user-data.md) (AEM Forms JEE only)
* [User Management](/forms/using/user-management-handling-user-data.md) (AEM Forms JEE only)


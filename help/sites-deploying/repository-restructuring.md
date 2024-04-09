---
title: Repository Restructuring in AEM 6.5

description: Learn about the basics and reasoning behind the repository restructuring in AEM 6.5


contentOwner: chaikels
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: repo_restructuring

feature: Upgrading
exl-id: 2572aa8d-2a3a-4e5b-ae5f-07e1017ea0f4
solution: Experience Manager, Experience Manager Sites
role: Admin
---
# Repository Restructuring in AEM 6.5{#repository-restructuring-in-aem}

## Introduction {#introduction}

Prior to AEM 6.4, customer code was deployed in unpredictable areas of the JCR that were subject to change on upgrades. Because of this, it was common for formal AEM releases to overwrite custom code, configuration or content. In addition, customer changes sometimes overwrote AEM product code or content, breaking product functionality.

By clearly delineating hierarchies for AEM product code and customer code, these conflicts can be avoided.

To that end, beginning in AEM 6.4 and to be continued in future releases, content is being restructured out of /etc to other folders in the repository, along with guidelines on what content goes where, adhering to the following high-level rules:

* AEM product code will always be placed in /libs, which must not be overwritten by custom code
* Custom code should be placed in /apps, /content, and /conf

## Impact on 6.5 Upgrades {#impact-on-upgrades}

When upgrading to AEM 6.5, a large subset of the content under /etc will be duplicated in other folders in the repository. These new locations are the preferred locations in which the content is referenced. However, every attempt has been made for the AEM 6.5 upgrade to be backwards compatible with the previous locations in the /etc folder and so in most cases the old locations will continue to be referenced by AEM code until changes are actively -- and in many cases manually -- made in a customer's application. From a timeline perspective, there are two categories of changes:

* With 6.5 Upgrade - a handful of the /etc restructuring changes are not backwards compatible and thus modifications should be planned and implemented as part of the AEM 6.5 upgrade.
* Prior to future Upgrade - the vast majority of the /etc restructuring changes can be deferred until some time in the future post-upgrade. As previosuly mentioned, AEM 6.5 code will continue to reference the old locations until the modifications are implemented as part of a customer release. While there is no forced timeline for which the changes should be made, it is recommended that they are made before the future upgrade since future features may rely on the new locations being referenced. Also, documentation for a given feature will by convention reference the new locations and it could thus be confusing if the old locations are still being used.

### Restructuring Guidance {#restructuring-guidance}

While planning for an upgrade to AEM 6.5, the following per-solution pages should be referenced to assess the work effort:

* [Repository restructuring common to all AEM solutions](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md)
* [AEM Sites repository restructuring](/help/sites-deploying/sites-repository-restructuring-in-aem-6-5.md)
* [AEM Assets repository restructuring](/help/sites-deploying/assets-repository-restructuring-in-aem-6-5.md)
* [AEM Assets Dynamic Media repository restructuring](/help/sites-deploying/dynamicmedia-repository-restructuring-in-aem-6-5.md)
* [AEM Forms repository restructuring](/help/sites-deploying/forms-repository-restructuring-in-aem-6-5.md)
* [AEM Communities repository restructuring](/help/sites-deploying/communities-repository-restructuring-in-aem-6-5.md)
* [AEM Commerce repository restructuring](/help/sites-deploying/ecommerce-repository-restructuring-in-aem-6-5.md)

Each page contains two sections corresponding to the urgency of the necessary changes. Anything under the "With 6.5 Upgrade" section should be tackled as part of the AEM 6.5 upgrade project. Anything under the "Prior to Future Upgrade" can be optionally deferred until post upgrade.

Each entry on the page includes a "Restructuring guidance" field, which details the recommended technical strategy for aligning with the new 6.5 repository  model so that the new locations are referenced for content previously located under the /etc folder. An additional "Notes" field provides any additional useful context.

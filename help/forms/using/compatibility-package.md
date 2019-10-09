---
title: Compatibility Package
seo-title: Compatibility Package
description: Installing the Compatibility package on AEM Forms 6.4 allows you to use the Correspondence Management assets from AEM Forms 6.3 and deprecated adaptive forms templates and pages 
seo-description: Installing the Compatibility package on AEM Forms 6.4 allows you to use the Correspondence Management assets from AEM Forms 6.3 and deprecated adaptive forms templates and pages
uuid: e50b1ff9-c357-422a-8da8-a791ff805317
contentOwner: gtalwar
products: SG_EXPERIENCEMANAGER/6.4/FORMS
topic-tags: installing
topic-tags: correspondence-management
geptopics: SG_AEMFORMS/categories/jee
discoiquuid: 38a80992-2eda-4535-89af-0de34b1a9686
---

# Install compatibility Package {#compatibility-package}

Installing the Compatibility package on AEM Forms 6.4 allows you to use the Correspondence Management assets from AEM Forms 6.3 and deprecated adaptive forms templates and pages

## Overview {#overview}

Interactive communication is the default and recommended approach to create customer communications in AEM Forms 6.4. To continue using the letters from AEM 6.3 Forms and AEM 6.2 Forms, you need to install the [AEMFD Compatibility package](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq640/fd/AEM-FORMS-6.4-COMPAT).

The AEMFD Compatibility package allows you to use the following assets from AEM Forms 6.3 and 6.2 on AEM Forms 6.4:

* Document fragments created in AEM Forms 6.3 and 6.2
* Letters
* Data dictionaries
* Adaptive forms deprecated templates and pages

For more information, see [Assets made compatible with AEM Forms 6.4 by installing the Compatibility package](/help/forms/using/compatibility-package.md#assetsmadecompatible).

## Add support for AEM Forms 6.3 and 6.2 assets in AEM Forms 6.4 {#add-support-for-aem-forms-and-assets-in-aem-forms}

After performing an upgrade, do the following to install the AEMFD compatibility package and make your assets compatible with 6.4:

Ensure that you have [AEM Compatibility package](/help/sites-deploying/backward-compatibility.md) pre-installed.

1. Install the [Compatibility package](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq640/fd/AEM-FORMS-6.4-COMPAT).

   For more information on uploading and installing the package, see [How to work with packages](/help/sites-administering/package-manager.md).

1. After the logs are stabilized, restart the server. 
1. Use the migration utility for making your assets compatible with 6.4.

   For more information, see [migration utility](/help/forms/using/migration-utility.md).

## Assets made compatible with AEM Forms 6.4 by installing the Compatibility package {#assetsmadecompatible}

By installing the Compatibility package, you can make the following assets and templates compatible with AEM Forms 6.4:

* Correspondence Management Assets from AEM 6.3 and earlier

    * [Letters](/help/forms/using/create-letter.md)
    * [Data Dictionaries](/help/forms/using/data-dictionary.md)
    * Document Fragments

* Adaptive form deprecated templates

    * /libs/fd/af/templates/blankTemplate2
    * /libs/fd/af/templates/simpleEnrollmentTemplate
    * /libs/fd/af/templates/simpleEnrollmentTemplate2
    * /libs/fd/af/templates/surveyTemplate
    * /libs/fd/af/templates/surveyTemplate2
    * /libs/fd/af/templates/tabbedEnrollmentTemplate
    * /libs/fd/af/templates/tabbedEnrollmentTemplate2
    * /libs/fd/afaddon/templates/advancedEnrollmentTemplate
    * /libs/fd/afaddon/templates/advancedEnrollmentTemplate2

* Adaptive forms deprecated pages:

    * /libs/fd/af/components/page/survey
    * /libs/fd/af/components/page/tabbedenrollment
    * /libs/fd/afaddon/components/page/advancedenrollment


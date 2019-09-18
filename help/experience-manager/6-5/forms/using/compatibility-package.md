---
title: Compatibility Package
seo-title: Compatibility Package
description: Installing the Compatibility package on AEM Forms 6.5 allows you to use the Correspondence Management assets from AEM Forms 6.4 and earlier versions and deprecated adaptive forms templates and pages 
seo-description: Installing the Compatibility package on AEM Forms 6.4 allows you to use the Correspondence Management assets from AEM Forms 6.4 and deprecated adaptive forms templates and pages
uuid: b23baa06-3d56-4726-8d74-818683d0adcc
contentOwner: gtalwar
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: installing
topic-tags: correspondence-management
geptopics: SG_AEMFORMS/categories/jee
discoiquuid: 42c9a17a-1f15-4b29-bceb-57977f90b799
index: y
internal: n
snippet: y
---

# Compatibility Package{#compatibility-package}

## Overview {#overview}

Interactive communication is the default and recommended approach to create customer communications in AEM Forms 6.5. To continue using letters in AEM Forms 6.5, you need to install the latest [AEMFD Compatibility package](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html).

The AEMFD Compatibility package also allows you to [use the following assets from AEM Forms 6.4, 6.3 and 6.2 on AEM Forms 6.5:](../../../6-5/forms/using/compatibility-package.md#add-support-for-aem-forms-and-assets-in-aem-forms)

* Document fragments
* Letters
* Data dictionaries
* Adaptive forms deprecated templates and pages

For more information, see [Assets made compatible with AEM Forms 6.5 by installing the Compatibility package](../../../6-5/forms/using/compatibility-package.md#assetsmadecompatible).

<!--
Comment Type: annotation
Last Modified By: gtalwar
Last Modified Date: 2018-04-11T02:24:20.738-0400
https://chl-author-preview.corp.adobe.com/content/help/en/experience-manager/6-5/sites/deploying/using/backward-compatibility.html
-->

## Add support for AEM Forms 6.4, 6.3 and 6.2 assets in AEM Forms 6.5 {#add-support-for-aem-forms-and-assets-in-aem-forms}

After performing an upgrade, do the following to install the AEMFD compatibility package and make your assets compatible with 6.5:

Ensure that you have [AEM Compatibility package](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) pre-installed.

1. Install the latest 6.5 [Compatibility package](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html).

   For more information on uploading and installing the package, see [How to work with packages](../../../6-5/sites/administering/using/package-manager.md).

   <!--
   Comment Type: annotation
   Last Modified By: gtalwar
   Last Modified Date: 2018-04-16T03:42:19.551-0400
   link to the package share
   -->

1. After the logs are stabilized, restart the server. 
1. Use the migration utility for making your assets compatible with 6.5.

   For more information, see [migration utility](../../../6-5/forms/using/migration-utility.md).

## Assets made compatible with AEM Forms 6.5 by installing the Compatibility package {#assetsmadecompatible}

By installing the Compatibility package, you can make the following assets and templates compatible with AEM Forms 6.5:

* Correspondence Management Assets from AEM 6.4 and earlier:

    * [Letters](../../../6-5/forms/using/create-letter.md)
    * [Data Dictionaries](/6-5/forms/using/data-dictionary.html?cq_ck=1519292756160)
    * Document Fragments

* Adaptive form deprecated templates:

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

<!--
Comment Type: annotation
Last Modified By: gtalwar
Last Modified Date: 2018-04-11T02:43:59.685-0400
doc fragments too
-->


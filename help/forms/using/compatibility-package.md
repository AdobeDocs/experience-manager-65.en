---
title: Compatibility Package

description: Installing the Compatibility package on AEM Forms 6.5 lets you use the Correspondence Management assets from AEM Forms 6.4 and earlier versions and deprecated adaptive forms templates and pages


contentOwner: gtalwar
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: correspondence-management, installing
geptopics: SG_AEMFORMS/categories/jee

docset: aem65

role: "Admin,User"
exl-id: bb16017c-a1bf-40d8-a78d-827c05b7ee2e
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
---
# Compatibility Package{#compatibility-package}

## Overview {#overview}

Interactive communication is the default and recommended approach to create customer communications in AEM Forms 6.5. To continue using letters in AEM Forms 6.5, you need to install the latest [AEMFD Compatibility package](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html).

The AEMFD Compatibility package also lets you [use the following assets from AEM Forms 6.4, 6.3 and 6.2 on AEM Forms 6.5:](../../forms/using/compatibility-package.md#add-support-for-aem-forms-and-assets-in-aem-forms)

* Document fragments
* Letters
* Data dictionaries
* Adaptive forms deprecated templates and pages

For more information, see [Assets made compatible with AEM Forms 6.5 by installing the Compatibility package](../../forms/using/compatibility-package.md#assetsmadecompatible).

## Add support for AEM Forms 6.4, 6.3 and 6.2 assets in AEM Forms 6.5 {#add-support-for-aem-forms-and-assets-in-aem-forms}

After performing an upgrade, do the following to install the AEMFD compatibility package and make your assets compatible with 6.5:

Ensure that you have [AEM Compatibility package](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) pre-installed.

1. Install the latest 6.5 [Compatibility package](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html).

   For more information on uploading and installing the package, see [How to work with packages](/help/sites-administering/package-manager.md).

1. After the logs are stabilized, restart the server.
1. Use the migration utility for making your assets compatible with 6.5.

    >[!NOTE]
    >
    > It is recommended to use the 'Ctrl + C' command to restart the SDK. Restarting the AEM SDK using alternative methods, for example, stopping Java processes, may lead to inconsistencies in the AEM development environment.

   For more information, see [migration utility](../../forms/using/migration-utility.md).

## Assets made compatible with AEM Forms 6.5 by installing the Compatibility package {#assetsmadecompatible}

By installing the Compatibility package, you can make the following assets and templates compatible with AEM Forms 6.5:

* Correspondence Management Assets from AEM 6.4 and earlier:

    * [Letters](../../forms/using/create-letter.md)
    * [Data Dictionaries](/help/forms/using/data-dictionary.md)
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

---
title: Multi Site Manager and Translation
description: Learn how to reuse your content across your project and manage multilingual websites in Adobe Experience Manager.


contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: site-features
content-type: reference

exl-id: 8f11f5de-f5af-4ce7-a448-2b4299de2930
solution: Experience Manager, Experience Manager Sites
feature: Multi Site Manager, Language Copy
role: Admin
---
# Multi Site Manager and Translation {#msm-and-translation}

The following administration tools are available for managing websites and pages:

* Multi Site Manager (MSM) enables you to use the same site content in multiple locations, while allowing for variations:

    * [Reusing Content: Multi Site Manager and Live Copy](/help/sites-administering/msm.md)

* Translation lets you automate the translation of page content, assets, and user-generated content to create and maintain multilingual websites:

    * [Translating Content for Multilingual Sites](/help/sites-administering/translation.md)

* These two features can be combined to cater for websites that are both [Multinational and Multilingual](#multinational-and-multilingual-sites).

## Multinational and Multilingual Sites {#multinational-and-multilingual-sites}

You can efficiently create content for multinational and multilingual sites through the combined use of the Multi Site Manager and the translation workflow. Create a master site in one language, for a specific country, then use that content as a basis for the other sites, using translation where required:

* [Translate](/help/sites-administering/translation.md) the master site into different languages.

* Use [Multi Site Manager](/help/sites-administering/msm.md) to:

    * Re-use content from the master site, and the translations, to create sites for other countries and cultures.
    * Make sure to limit the use of Multi Site Manager to content within one language, for example, English master > English language branches in country sites, French master > French language branches in country sites.
    * Where required, detach elements of the live copies to add localization details.

The following diagram illustrates how the main concepts intersect (but does not show all levels/elements involved):

![Diagram showing main concepts of MSM and Translation](assets/chlimage_1-71a.png)

>[!NOTE]
>
>In this, and comparable, scenarios MSM does not manage the different language versions as such.
>
>* [MSM](/help/sites-administering/msm.md) manages the deployment of translated content from a blueprint (for example, a global master) to the live copies (for example, the local sites), within the boundaries of a language.
>* The [translation](/help/sites-administering/translation.md) integration capabilities of AEM, in conjunction with third-party translation management services, manages the languages and translating content into these different languages.
>
>For more advanced use-cases, MSM may be used across language masters as well.

>[!NOTE]
>
>For all use-cases it is recommended to read the following best practices:
>
>* [Best Practices for MSM](/help/sites-administering/msm-best-practices.md); particularly:
>
>   * [Create Site](/help/sites-administering/msm-best-practices.md#create-site)
>   * [MSM and Multilingual Websites](/help/sites-administering/msm-best-practices.md#msm-and-multilingual-websites)
>
>* [Best Practices for Translation](/help/sites-administering/tc-bp.md)

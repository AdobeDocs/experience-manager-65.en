---
title: Translation Best Practices
description: Find best practices compiled by Adobe engineering and consulting teams to help you get up and running with translation projects.
feature: Language Copy
exl-id: 01a81c4b-cb30-4f7e-b281-7194ebb5fc70
solution: Experience Manager, Experience Manager Sites
role: Admin
---
# Translation Best Practices{#translation-best-practices}

## General {#general}

Creating or expanding a global web presence can be a complex process, but with good forethought and planning AEM can simplify your efforts and support your global business goals.

* **Plan for global expansion** before implementing your first site. Adapting an existing site for global coverage when the site was implemented at short notice is typically harder than planning for global expansion at the beginning:

    * Assess the current state of your organization's localization maturity. Determine whether you have the **tools**, **processes** and **resources** in place to support global expansion.
    * Be aware of **global regulations** and **regional language preferences**. Design flexible content structures and processes that can accommodate a changing global business environment.

* Determine a **governance** model that supports your global business and use AEM mechanisms like MSM and user permissions to enforce your chosen model. For example, determine if content will be centrally authored and "pushed" or "pulled" to regions/countries. Determine what content can be unlocked and altered in the geographies. Determine who is responsible for initiating and managing translations.
* If resources allow, it is best to manage translation activity from a central team who can develop expertise in the necessary tools, processes and vendor relationships.
* **Plan**, **prototype** and **test** your global structure and processes to ensure that they support the business and that you have the required support from stakeholders in the geographies.

## Site Structure {#site-structure}

* When designing your site structure, start by examining your content and determine where and in which language content is authored. This location should be the top-level of your site.
* The best practice is a **language-based structure** with no more than 3 levels between the top-level authoring and country sites.
* Use a language/country site naming convention that follows **W3C standards**.
* Determine how content is distributed by regions and countries. Consider which countries share languages. It is recommended to create language masters, a layer of un-activated pages, where translated content can be reviewed and modified then pushed or pulled to a country site sharing that language.
* There are two approaches to creating language masters: using language copies, and using MSM/live copies.

    * The language copy approach is the one used by AEM's out-of-the-box translation integration framework, and therefore it is the easiest way to get started. The framework provides a user interface that makes it initially easy to propagate and translate content changes from the main language (for example, English) master to language masters. However, as the project grows, workflow automation becomes increasingly necessary to manage the translation of the increased number of pages and/or languages.
    * The MSM/live copy approach may be an alternative for advanced uses cases, where sites are larger and more complex. Strong governance and workflow automation are necessary from the start to handle the complex inheritance relationships between English and language masters, and to reduce the risk of overwriting existing translations. This handling can be accomplished with the help of some translation connectors. See [MSM and Multilingual Sites](/help/sites-administering/msm-best-practices.md#msm-and-multilingual-websites) for more information.

* If your master language has global variations, an option is to use MSM to create a live copy from the global master to use for translation. For example, if global authoring is performed in a US English master, create an International English master as a live copy and basis for translation to other languages.
* Use MSM to create country sites from the translated language masters and to roll out content to sites sharing the same language. For example, the French language master can be rolled out to France, Belgium, and Switzerland sites.
* Plan, prototype and test first, before starting implementation.

## Translation Processes and Methods {#translation-processes-and-methods}

* Engage a **localization service provider (LSP)** with expertise in translation and related localization activities. LSPs can help to scale your global business by providing a breadth of resources and technologies to improve efficiency and save translation costs:

    * Some LSPs are both service and technology providers. There are also standalone technology providers who allow many LSPs to participate in their translation platforms.
    * The **AEM Translation Framework** supports integration with a variety of translation technology providers for both machine and human translation.
    * Learn how to [integrate LSP connectors in your AEM system](/help/sites-administering/translation.md) to automate content translation, or how to manually create, export and import Translation Projects for testing and in cases where there is no LSP or translation technology provider.

* Choose a **translation method** that best suits the content.

    * **Human translation** is best-suited for content where messaging and quality expectations are high and the content will live for some time on the site, such as Marketing pages.
    * **Machine translation** can be a good choice for mass volumes of translation when time to publish is critical, quality expectations are relaxed, or human translation costs are prohibitive. Support knowledge base and user generated content are commonly machine-translated.

* Rely on expertise from localization service providers, Adobe Consulting and System Integrators to plan, prototype and test your multilingual site structure.

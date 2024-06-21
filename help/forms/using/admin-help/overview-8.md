---
title: Overview of output service
description: Output lets you merge XML form data with a form design created in Designer to create a document output stream in various formats.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_output
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: e99b72d0-fbd5-4150-a225-1a91ad4c5867
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Overview of output service {#overview-of-output-service}

Output lets you merge XML form data with a form design created in Designer to create a document output stream in various formats. The output stream can be sent to a network printer, a local printer, or a disk file

You can use the Output page in administration console to administer the Output service. The settings you configure are used at run time when the equivalent settings were not specified through the AEM forms API. Configuration done through the AEM forms SDK overrides the settings configured using administration console.

For additional information about the Output service, see [Services Reference](https://www.adobe.com/go/learn_aemforms_services_61).

On the Output pages in administration console, you can perform several tasks:

* Specify character sets for internationalization. (See [Change the character set](/help/forms/using/admin-help/change-character-set.md#change-the-character-set).)
* Specify absolute and relative paths for URLs, URIs, XCIs, and file locations. (See [Specify file locations for Output](/help/forms/using/admin-help/specify-file-locations-output.md#specify-file-locations-for-output).)
* Configure cache sizes and policies. (See [Specifying the cache mode](/help/forms/using/admin-help/configuring-caching-output.md#specifying-the-cache-mode) and [Configuring cache settings](/help/forms/using/admin-help/configuring-caching-output.md#configuring-cache-settings).)
* Make fonts available on the application server. (See [Make fonts available](/help/forms/using/admin-help/make-fonts-available.md#make-fonts-available).)
* Specify fonts to embed. (See [Specify fonts to embed](/help/forms/using/admin-help/specify-fonts-embed.md#specify-fonts-to-embed).)
* Specify XCI configuration options. (See [Specify XCI configuration options](/help/forms/using/admin-help/specify-xci-configuration-options.md#specify-xci-configuration-options).)
* Specify security settings. (See [Specify security settings](/help/forms/using/admin-help/specify-security-settings.md#specify-security-settings).)

After you change the settings, click Save to apply them to Output. You do not need to restart the server for the changes to take effect, but you may need to restart the Output service when configuring cache settings.

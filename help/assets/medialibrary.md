---
title: Use Media Library for basic digital asset management
description: "[!DNL Experience Manager Assets] and Media Library for asset management."
contentOwner: AG
role: Architect, Leader
feature: Asset Management
exl-id: e10d632d-1d90-4f28-8617-95ee41602997
hide: yes
---

# Use Media Library for basic asset management {#manage-assets-using-media-library}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service  |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/assets/admin/medialibrary.html?lang=en)                  |
| AEM 6.5     | This article         |

[!DNL Adobe Experience Manager] platform provides different capabilities to manage assets. Media Library allows the users to upload a small number of assets to the repository, search and use those in the webpages, and accomplish simple asset management tasks on the assets.

Media Library is a lightweight Digital Asset Management (DAM) solution that comes complimentary with [!DNL Adobe Experience Manager Sites] license. [!DNL Sites] is a Web Content Management (WCM) offering. Media Library works with all capabilities of Experience Manager.

[!DNL Adobe Experience Manager Assets] license is available separately for purchase. [!DNL Experience Manager Assets] allows for robust handling of assets via enterprise use cases, customizations for metadata, schemas, search, and user interface, and many other features beyond what Media Library provides.

## Licensing requirements {#avail-media-library-license}

Customers who have [!DNL Sites] license are entitled to use Media Library. It works with all components of [!DNL Experience Manager].

Media Library gets installed as part of Sites. No additional license or package is required beyond Sites license and installation.

## [!DNL Assets] versus Media Library {#assets-and-media-library}

Experience Manager Assets provides enterprise-grade DAM functionality. Assets functionality is delivered with [!DNL Experience Manager] in one single package. However, users who have not purchased an Assets license are not entitled to use the advanced DAM features. Without Assets license, only [Media Library features](#use-media-library) are available.

If you want to prevent unintended use of [!DNL Assets] features that you have not licensed, then remove all the [!DNL Assets]-specific workflows, components, taxonomies, options and the [!DNL Assets] admin from [!DNL Experience Manager]. Doing so prevents your users from accidentally using [!DNL Assets] features that you did not license.

## Use Media Library {#use-media-library}

Media Library provides basic DAM features for the following use cases:

* Web pages created using [!DNL Adobe Experience Manager Sites].
* Adaptive forms and communications created using [!DNL Adobe Experience Manager Forms].
* Digital screen experiences created using [!DNL Adobe Experience Manager Screens].
* [!DNL Assets] HTTP REST APIs for headless operations.

<!--
 TBD: Remove this after confirmation. May need to merge this list with the list provided by PMs.
* Static renditions

-->

To use the Media Library functionality, you can use the default [!DNL Experience Manager] user interface. Media Library is part of the [!DNL Experience Manager Sites] installation and no separate interface or add-on is required. Using the existing interface, Media Library users are entitled to accomplish the following tasks:

* Create folders to organize assets.
* Upload assets.
* Publish assets.
* Edit, move, and copy assets.
* Browse, filter, and search (includes similarity search) assets.
* Add values to and edit the values in the metadata fields, except Smart Tags field, that are available in the [!UICONTROL Basic] tab of an asset's [!UICONTROL Properties] page by default.
* Add and delete static renditions.
* Download folders, assets, and asset renditions.
* Create asset versions.
* Create and perform review tasks on assets.
* Annotate assets.
* Add assets to [!DNL Sites] pages through Content Finder.
* Use [!DNL Content Fragments].
* Use HTTP REST and GraphQL APIs for [!DNL Content Fragments] and referenced media assets, under Sites license.
* Marketing Cloud integration.
* Customize and extend asset management user interface.
* Access the Query Builder (API) to extend the search functionality.
* Create static tags.
* Author projects and tasks.
* Activity stream (timeline).
* Comments and annotations.

<!-- TBD: Define exactly which basic Assets workflow are available for use with Media Library?

As per PM, we must avoid stating such a list, as we don't have a list that makes sense in Cloud Service.
-->

>[!IMPORTANT]
>
>Many advanced DAM use cases are fulfilled by [!DNL Experience Manager Assets]. Media Library license entitles you to fulfil only the listed use cases using Media Library. If a use case is not listed, do not use it with Media Library license. If you have any queries, contact Adobe Customer Support.

Note that you cannot use smart tags, [!DNL Asset] link, [!DNL Asset] selector, bulk tagging, modify asset workflows, or standard [!DNL Adobe Experience Manager] user interface to access Media Library without [!DNL Assets] license.

<!-- TBD: Add a CTA - how to contact Adobe for queries. -->

>[!MORELIKETHIS]
>
>* [DAM features in [!DNL Experience Manager Assets]](https://experienceleague.adobe.com/docs/experience-manager-65/assets/home.html)
>* [[!DNL Experience Manager] 6.5 Managed Services product description](https://helpx.adobe.com/legal/product-descriptions/adobe-experience-manager-managed-services.html)
>* [[!DNL Experience Manager] 6.5 on-premise product description](https://helpx.adobe.com/legal/product-descriptions/adobe-experience-manager-on-premise.html)

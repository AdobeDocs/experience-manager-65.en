---
title: Configuring your Page for Bulk Editing of Page Properties

description: Bulk editing of page properties lets you edit the properties of multiple pages at once


contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: extending-aem
content-type: reference

exl-id: 1787e643-fc8e-40e0-8e14-97b222a7c320
solution: Experience Manager, Experience Manager Sites
feature: Administering
role: Developer
---
# Configuring your Page for Bulk Editing of Page Properties {#configuring-your-page-for-bulk-editing-of-page-properties}

[Bulk editing of page properties](/help/sites-authoring/editing-page-properties.md#from-the-sites-console-multiple-pages) lets you edit the properties of multiple pages at once.

Due to the possibility of different values, page properties are not enabled for bulk editing as default. They must be explicitily allowed (enabled). When defining the page properties to be available for bulk editing you need to consider certain implications, such as:

* Certain fields are usually unique; for example, a page title. Decide whether it is meaningful to enable such fields for bulk editing, when one value will be applied.
* Certain fields might have multiple values - this needs meaningful representation when rendering.

  For example, a check-box indicating "Ready for Publication". This might have several values before bulk-editing (for example, ready, in-review, in-progress).

>[!CAUTION]
>
>Bulk editing of page properties is:
>
>* Not available in the classic UI.
>* Not available for pages within a live copy.
>* Only available for pages with the same resource type.
>

>[!NOTE]
>
>Bulk editing is also available for Assets. It is very similar, but differs in a few points. See [Editing Properties of Multiple Assets](/help/assets/metadata.md) for full information. You can customize the fields in the Bulk Metadata editor for Assets using the [Schema editor](/help/assets/metadata-schemas.md).

## Enabling a Field {#enabling-a-field}

>[!NOTE]
>
>Certain fields might have multiple values - this needs meaningful representation when rendering. For this reason you should only enable the following field types:
>
>* `/libs/granite/ui/components/foundation/form/textfield`
>* `/libs/granite/ui/components/foundation/form/textarea`
>* `/libs/granite/ui/components/foundation/form/tagspicker`
>* `/libs/granite/ui/components/foundation/form/datepicker`
>* `/libs/granite/ui/components/foundation/form/pathbrowser`
>* `/libs/granite/ui/components/foundation/form/checkbox`
>

Fields are enabled on the page component (*not* on the template):

1. Using CRXDE Lite (or an equivalent method) open your page component.

   For example: `/apps/core/wcm/components/page/v1/page`

   >[!NOTE]
   >
   >This example assumes that the Core Components have been installed on the instance, which is the case if the instance is running with We.Retail sample content. See the [Core Components documentation](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/introduction.html) for more information.

1. Navigate to the required field within the `cq:dialog` definition.
1. Define the following property on the field node:

    * **Name**: `allowBulkEdit`
    * **Type**: `Boolean`
    * **Value**: `true`

   For example, for the standard page [foundation component](/help/sites-authoring/default-components-foundation.md):

   `/libs/foundation/components/page`

   The property would be defined on:

   `cq:dialog/content/items/tabs/items/basic/items/column/items/onofftime/items/ondate`

   >[!CAUTION]
   >
   >You ***must*** not change anything in the `/libs` path.
   >
   >This is because the content of `/libs` is overwritten the next time you upgrade your instance (and may well be overwritten when you apply either a hotfix or feature pack).
   >
   >The recommended method for configuration and other changes is:
   >
   >    1. Recreate the required item (that is, as it exists in `/libs`) under `/apps`
   >    1. Make any changes within `/apps`

1. Select **Save All** to persist your updates.

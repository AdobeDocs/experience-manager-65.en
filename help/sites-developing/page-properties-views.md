---
title: Customizing Views of Page Properties

description: Every page has a set of properties that you can edit as required


contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: extending-aem
content-type: reference

exl-id: 292874bf-2ee6-4638-937c-f8f26c93ca65
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Customizing Views of Page Properties{#customizing-views-of-page-properties}

Every page has a set of [properties](/help/sites-authoring/editing-page-properties.md) that can be viewed and edited by users; some are required when creating the page (create view), others can be viewed and edited (edit view) at a later stage. These page properties are defined and made available by the dialog ( `cq:dialog`) of the appropriate page component.

>[!CAUTION]
>
>Customizing view of page properties is not available in the classic UI.

The default state for every page property is:

* hidden in the create view (for example, **Create Page** wizard)

* available in the edit view (for example, **View Properties**)

Fields must be specifically configured if any change is required. This is done using the appropriate node properties:

* Page property to be available in the create view (for example, **Create Page** wizard):

    * Name: `cq:showOnCreate`
    * Type: `Boolean`

* Page property to be available in the edit view (for example, **View**/**Edit**) **Properties** option):

    * Name: `cq:hideOnEdit`
    * Type: `Boolean`

For example, see the settings for fields grouped under the **More Titles and Description** on the **Basic** tab for the foundation Page component. These are visible in the **Create Page** wizard as `cq:showOnCreate` has been set to `true`:

```xml
/libs/foundation/components/page/cq:dialog/content/items/tabs/items/basic/items/column/items/moretitles
```

>[!TIP]
>
>See the [Extending Page Properties tutorial](https://experienceleague.adobe.com/docs/experience-manager-learn/sites/developing/page-properties-technical-video-develop.html) for a guide to customizing page properties.

## Configuring your Page Properties {#configuring-your-page-properties}

You can also configure the fields available by configuring the dialog of your page component and applying the appropriate node properties.

For example, by default the [**Create Page** wizard](/help/sites-authoring/managing-pages.md#creating-a-new-page) shows the fields grouped under **More Titles and Description**. To hide these you configure:

1. Create your page component under `/apps`.
1. Create an override (using *dialog diff* provided by the [Sling Resource Merger](/help/sites-developing/sling-resource-merger.md)) for the `basic` section of your page component; for example:

   ```xml
   <your-page-component>/cq:dialog/content/items/tabs/items/basic
   ```

   >[!NOTE]
   >
   >As reference, see:
   >
   >&nbsp;&nbsp;&nbsp;&nbsp;`/libs/wcm/foundation/components/basicpage/v1/basicpage/cq:dialog`
   >
   >However, you ***must*** not change anything in the `/libs` path.
   >
   >This is because the content of `/libs` is overwritten the next time you upgrade your instance (and may well be overwritten when you apply either a hotfix or feature pack).
   >
   >The recommended method for configuration and other changes is:
   >
   >1. Recreate the required item (that is, as it exists in `/libs`) under `/apps`
   >1. Make any changes within `/apps`

1. Set the `path` property on `basic` to point to the override of the basic tab (see the next step as well). For example:

   ```xml
   /apps/demos/components/page/tabs/basic
   ```

1. Create an override of the `basic` - `moretitles` section at the corresponding path; for example:

   ```xml
   /apps/demos/components/page/tabs/basic/items/column/items/moretitles
   ```

1. Apply the appropriate node property:

    * **Name**: `cq:showOnCreate`
    * **Type**: `Boolean`
    * **Value**: `false`

   The **More Titles and Description** section will no longer be shown in the **Create Page** wizard.

>[!NOTE]
>
>When configuring page properties for use with live copies see [Configuring MSM Locks on Page Properties](/help/sites-developing/extending-msm.md#configuring-msm-locks-on-page-properties-touch-enabled-ui) for more details.

## Sample Configuration of Page Properties {#sample-configuration-of-page-properties}

This sample demonstrates the dialog diff technique of the [Sling Resource Merger](/help/sites-developing/sling-resource-merger.md); including use of [`sling:orderBefore`](/help/sites-developing/sling-resource-merger.md#properties). It also illustrates use of both `cq:showOnCreate` and `cq:hideOnEdit`.

CODE ON GITHUB

You can find the code of this page on GitHub

* [Open aem-authoring-extension-page-dialog project on GitHub](https://github.com/Adobe-Marketing-Cloud/aem-authoring-extension-page-dialog)

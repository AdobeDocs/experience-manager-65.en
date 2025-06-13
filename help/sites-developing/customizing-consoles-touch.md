---
title: Customizing the Consoles

description: AEM provides various mechanisms to enable you to customize the consoles of your authoring instance


contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: extending-aem
content-type: reference

docset: aem65
exl-id: 6e67f2b3-78b9-45f2-b496-61776b9fd9cc
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Customizing the Consoles {#customizing-the-consoles}

>[!CAUTION]
>
>This document describes how to customize consoles in the modern, touch-enabled UI and does not apply to the classic UI.

AEM provides various mechanisms to enable you to customize the consoles (and the [page authoring functionality](/help/sites-developing/customizing-page-authoring-touch.md)) of your authoring instance.

* Clientlibs
  Clientlibs let you extend the default implementation to realize new functionality, while reusing the standard functions, objects, and methods. When customizing, you can create your own clientlib under `/apps.` For example, it can hold the code required for your custom component.

* Overlays
  Overlays are based on node definitions and let you overlay the standard functionality (in `/libs`) with your own customized functionality (in `/apps`). When creating an overlay a 1:1 copy of the original is not required, as the sling resource merger allows for inheritance.

These can be used in many ways to extend your AEM consoles. A small selection are covered below (at a high level).

>[!NOTE]
>
>For further information see:
>
>* Using and creating [clientlibs](/help/sites-developing/clientlibs.md).
>* Using and creating [overlays](/help/sites-developing/overlays.md).
>* [Granite](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/granite-ui/api/index.html)
>


>[!CAUTION]
>
>You ***must*** not change anything in the `/libs` path.
>
>This is because the content of `/libs` is overwritten the next time you upgrade your instance (and may well be overwritten when you apply either a hotfix or feature pack).
>
>The recommended method for configuration and other changes is:
>
>1. Recreate the required item (that is, as it exists in `/libs`) under `/apps`
>
>1. Make any changes within `/apps`
>

For example, the following location within the `/libs` structure can be overlaid:

* consoles (any consoles based on Granite UI pages); for example:

    * `/libs/wcm/core/content`

>[!NOTE]
>
>See the Knowledge Base article, [Troubleshooting AEM TouchUI issues](https://experienceleague.adobe.com/en/docs/experience-cloud-kcs/kbarticles/ka-16935), for further tips and tools.

## Customizing the Default View for a Console {#customizing-the-default-view-for-a-console}

You can customize the default view (column, card, list) for a console:

1. You can reorder the views by overlaying the required entry from under:

   `/libs/wcm/core/content/sites/jcr:content/views`

   The first entry will be the default.

   The nodes available correlate to the view options available:

    * `column`
    * `card`
    * `list`

1. For example, in a overlay for list:

   `/apps/wcm/core/content/sites/jcr:content/views/list`

   Define the following property:

    * **Name**: `sling:orderBefore`
    * **Type**: `String`
    * **Value**: `column`

### Add New Action to the Toolbar {#add-new-action-to-the-toolbar}

1. You can build your own components and include the corresponding client libraries for custom actions. For example, a **Promote to Twitter** action at:

   `/apps/wcm/core/clientlibs/sites/js/twitter.js`

   This can then be connected to a toolbar item on your console:

   `/apps/<yourProject>/admin/ext/launches`

   For example, in selection mode:

   `content/jcr:content/body/content/header/items/selection/items/twitter`

### Restrict a Toolbar Action to a specific Group {#restrict-a-toolbar-action-to-a-specific-group}

1. You can use a custom rendering condition to overlay the standard action and impose specific conditions that must be fulfilled before it is rendered.

   For example, create a component to control the renderconditions according to group:

   `/apps/myapp/components/renderconditions/group`

1. To apply these to the Create Site action on the Sites console:

   `/libs/wcm/core/content/sites`

   Create the overlay:

   `/apps/wcm/core/content/sites`

1. Then add the rendercondition for the action:

   `jcr:content/body/content/header/items/default/items/create/items/createsite/rendercondition`

   Using properties on this node you can define the `groups` allowed to perform the specific action; for example, `administrators`

### Customizing Columns in the List View {#customizing-columns-in-the-list-view}

>[!NOTE]
>
>This feature is optimized for columns of text fields; for other data types it is possible to overlay `cq/gui/components/siteadmin/admin/listview/columns/analyticscolumnrenderer` in `/apps`.

To customize the columns in the list view:

1. Overlay the list of available columns.

    * On the node:

      ```
             /apps/wcm/core/content/common/availablecolumns
      ```

    * Add your new columns - or remove existing ones.

   See [Using Overlays (and the Sling Resource Merger)](/help/sites-developing/overlays.md) for more information.

1. Optionally:

    * If you want to plug additional data, you need to write a [PageInforProvider](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/day/cq/wcm/api/PageInfoProvider.html) with a
      `pageInfoProviderType` property.

   For example, see the class/bundle attached (from GitHub) below.

1. You can now select the column in the column configurator of list view.

### Filtering Resources {#filtering-resources}

When using a console, a common use case is when the user must select from resources (for example, pages, components, assets, and so on). This can take the form of a list for example, from which the author must choose an item.

To keep the list to a reasonable size and also relevant to the use case, a filter can be implemented in the form of a custom predicate. See [Customizing Page Authoring - Filtering Resources](/help/sites-developing/customizing-page-authoring-touch.md#filtering-resources) for details.

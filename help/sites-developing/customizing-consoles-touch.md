---
title: Customizing the Consoles
seo-title: Customizing the Consoles
description: AEM provides various mechanisms to enable you to customize the consoles of your authoring instance
seo-description: AEM provides various mechanisms to enable you to customize the consoles of your authoring instance
uuid: f10cea87-ef8a-468e-94ca-89a1017dcf44
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: extending-aem
content-type: reference
discoiquuid: 221ed05b-855d-4dc2-9df6-12fdeabb157a
---

# Customizing the Consoles{#customizing-the-consoles}

>[!CAUTION]
>
>This document describes how to customize consoles in the modern, touch-enabled UI and does not apply to the classic UI.

AEM provides various mechanisms to enable you to customize the consoles (and the [page authoring functionality](/help/sites-developing/customizing-page-authoring-touch.md)) of your authoring instance.

* Clientlibs

  Clientlibs allow you to extend the default implementation to realize new functionality, while reusing the standard functions, objects, and methods. When customizing, you can create your own clientlib under `/apps.` For example it can hold the code required for your custom component.  

* Overlays

  Overlays are based on node definitions and allow you to overlay the standard functionality (in `/libs`) with your own customized functionality (in `/apps`). When creating an overlay a 1:1 copy of the original is not required, as the sling resource merger allows for inheritance.

These can be used in many ways to extend your AEM consoles. A small selection are covered below (at a high level).

>[!NOTE]
>
>For further information see:
>
>* Using and creating [clientlibs](/help/sites-developing/clientlibs.md).
>* Using and creating [overlays](/help/sites-developing/overlays.md).
>* [Granite](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/granite-ui/api/index.html) 
>
>This topic is also covered in the [AEM Gems](https://docs.adobe.com/content/ddc/en/gems.html) session - [User interface customization for AEM 6.0](https://docs.adobe.com/content/ddc/en/gems/user-interface-customization-for-aem-6.html).

>[!CAUTION]
>
>You ***must*** not change anything in the `/libs` path.
>
>This is because the content of `/libs` is overwritten the next time you upgrade your instance (and may well be overwritten when you apply either a hotfix or feature pack).
>
>The recommended method for configuration and other changes is:
>
>1. Recreate the required item (i.e. as it exists in `/libs`) under `/apps`  
>
>1. Make any changes within `/apps`
>

For example, the following locations within the `/libs` structure can be overlaid:

* consoles (any consoles based on Granite UI pages); for example:

    * `/libs/wcm/core/content`

<!-- Needs a review by Engineering -->
<!--
* secondary (inner) rails; for example:

    * `/libs/wcm/core/content/search`

* toolbar(s) (dependent on console; for example sites):

    * default 

      `/libs/wcm/core/content/sites/jcr:content/body/content/header/items/default`

    * selection mode

      `/libs/wcm/core/content/sites/jcr:content/body/content/header/items/selection`

* help menu options (dependent on console; for example sites):

    * `/libs/wcm/core/content/sites/jcr:content/body/help`

* information shown on the card view (dependent on console; for example sites):

    * `/libs/wcm/core/content/sites/jcr:content/body/content/content/items/childpages`

-->
>[!NOTE]
>
>See the Knowledge Base article, [Troubleshooting AEM TouchUI issues](https://helpx.adobe.com/experience-manager/kb/troubleshooting-aem-touchui-issues.html), for further tips and tools.

<!-- Needs a review by Engineering -->
<!--
## Code Samples {#code-samples}

Various packages have been made available on Github. These provide code samples related to the tasks covered on this page.

### aem-admin-extension-new-console {#aem-admin-extension-new-console}

`aem-admin-extension-new-console` is a sample package showing how to [create a new AEM 6 console](#create-a-custom-console). This package provides a UI for managing [Launches](/help/sites-authoring/launches.md) and adds a link in the navigation:

CODE ON GITHUB

You can find the code of this page on GitHub

* [Open aem-admin-extension-new-console project on GitHub](https://github.com/Adobe-Marketing-Cloud/aem-admin-extension-new-console)
* Download the project as [a ZIP file](https://github.com/Adobe-Marketing-Cloud/aem-admin-extension-new-console/archive/master.zip)

### aem-admin-extension-customize-sites {#aem-admin-extension-customize-sites}

`aem-admin-extension-customize-sites` is a sample package showing how to customize an existing AEM 6 admin console. This package provides updates to Sites administration:

CODE ON GITHUB

You can find the code of this page on GitHub

* [Open aem-admin-extension-customize-sites project on GitHub](https://github.com/Adobe-Marketing-Cloud/aem-admin-extension-customize-sites)
* Download the project as [a ZIP file](https://github.com/Adobe-Marketing-Cloud/aem-admin-extension-customize-sites/archive/master.zip)
-->

<!-- Needs a review by Engineering -->
<!--
## Create a Custom Console {#create-a-custom-console}

1. You can create a custom console with related actions; for example, Launches at the top level (below Sites):

   This involves:

    * creating the root space definition of your new console ``; for example:

        * `/apps/<yourProject>/admin/ext/launches`

    * this can contain (according to requirements):

        * the corresponding [clientlibs](/help/sites-developing/clientlibs.md) for custom actions and `less`/ `css` definitions

            * `/apps/<yourProject>/admin/ext/launches/clientlibs`

        * components that need to be redefined/adjusted; for example, the breadcrumbs, datasource and the launch

            * `/apps/<yourProject>/admin/ext/launches/components`

        * the Granite UI page resource:

            * `/apps/<yourProject>/admin/ext/launches/content/jcr:content`

              property: `sling:resourceType`

        * the page definition of the console

            * `/apps/<yourProject>/admin/ext/launches/content/jcr:content/head`
            * `/apps/<yourProject>/admin/ext/launches/content/jcr:content/body`

   ![chlimage_1-236](assets/chlimage_1-236.png)

   To use the new console (for example in the [rail for navigation](#add-new-navigation-option-to-rail)) an ID is used, so that it can be explicitly referenced. The ID is used to connect the console and its navigation definition. The ID is defined in the `rail` node of the page; for example, for the Sites console:

    * the rail node is: 

      `/libs/wcm/core/content/sites/jcr:content/body/rail`

        * here the `currentId` property is defined: 

          `currentId` = `cq-sites`

   For the Launches console example:

    * the node is:

        * `/apps/<yourProject>/admin/ext/launches/content/jcr:content/body/rail`

    * with the following properties:

        * `currentId` = `cq-launches`
        * `sling:resourceType` = `granite/ui/components/endor/navcolumns`
        * `srcPath` = `cq/core/content/nav`
-->

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

<!-- Needs a review by Engineering -->
<!--
`aem-admin-extension-customize-sites` is a sample package showing how to customize an existing AEM 6 admin console. This package provides updates to Sites administration:

CODE ON GITHUB

You can find the code of this page on GitHub

* [Open aem-admin-extension-customize-sites project on GitHub](https://github.com/Adobe-Marketing-Cloud/aem-admin-extension-customize-sites)
* Download the project as [a ZIP file](https://github.com/Adobe-Marketing-Cloud/aem-admin-extension-customize-sites/archive/master.zip)
-->

<!-- Needs a review by Engineering -->
<!--
### Add New Navigation Option to Rail {#add-new-navigation-option-to-rail}

1. You can add a navigation entry in the rail (for example, a [custom console](#create-a-custom-console) such as Launches).

   To do this, you create an overlay of:

   `/libs/cq/core/content/nav`

   In the `/apps` overlay:

   `/apps/cq/core/content/nav`

   Create the new nodes and properties:

   ![chlimage_1-237](assets/chlimage_1-237.png)

    * Extend navigation:

        * `/apps/cq/core/content/nav/launches`

    * Specify location in the tree:

        * property: `sling:orderBefore`

    * To create the connection, the `id` property references (i.e. must be the same as) the `currentID` property [for the appropriate console](#create-a-custom-console):

        * property: `id`
        * value: same as for your console (e.g. `cq-launches`) 

          for example: the same value as the `currentId` property on:

          `/apps/<yourProject>/admin/ext/launches/content/jcr:content/body/rail`
-->

## Add New Action to the Toolbar {#add-new-action-to-the-toolbar}

1. You can build your own components and include the corresponding client libraries for custom actions. For example, a **Promote to Twitter** action at:

   `/apps/wcm/core/clientlibs/sites/js/twitter.js`

   This can then be connected to a toolbar item on your console:

   `/apps/<yourProject>/admin/ext/launches`

   For example, in selection mode:

   `content/jcr:content/body/content/header/items/selection/items/twitter`

## Restrict a Toolbar Action to a specific Group {#restrict-a-toolbar-action-to-a-specific-group}

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

<!-- Needs a review by Engineering -->
<!--
## Remove Access to Navigation Option on Rail {#remove-access-to-navigation-option-on-rail}

1. You can rename a navigation entry in the rail by overlaying the required entry from under:

   `/libs/cq/core/content/nav`

   The nodes available correlate to the navigation options in the rail:

    * `projects`
    * `sites`
    * `assets`
    * `apps`
    * `forms`
    * `screens`
    * `personalization`
    * `commerce`
    * `tools`
    * `communities`

1. For example, on a overlay at:

   `/apps/cq/core/content/nav/sites`

   Define the following property:

    * **Name**: `sling:hideResource`
    * **Type**: `String` 
    * **Value**: `true`

`aem-admin-extension-customize-sites` is a sample package showing how to customize an existing AEM 6 admin console. This package provides updates to Sites administration:

CODE ON GITHUB

You can find the code of this page on GitHub

* [Open aem-admin-extension-new-console project on GitHub](https://github.com/Adobe-Marketing-Cloud/aem-admin-extension-new-console)
* Download the project as [a ZIP file](https://github.com/Adobe-Marketing-Cloud/aem-admin-extension-new-console/archive/master.zip)
-->

<!-- Needs a review by Engineering -->
<!--
## Restrict Access to Navigation Option on Rail {#restrict-access-to-navigation-option-on-rail}

You can restrict access to a navigation option using ACLs:

1. Open the [user and/or group management](/help/sites-administering/security.md) and select the user/group you want to restrict access for.

   >[!NOTE]
   >
   >Avoid assigning/restricting permissions on a user-by-user basis. It is [recommended to use groups](/help/sites-administering/security.md#best-practices).

1. Remove access [permissions](/help/sites-administering/security.md#permissions) to the appropriate node(s) under `/libs/cq/core/content/nav/sites`. These correlate to the navigation options in the rail:

    * `projects`
    * `sites`
    * `assets`
    * `apps`
    * `forms`
    * `screens`
    * `personalization`
    * `commerce`
    * `tools`
    * `communities`
-->
 
## Customizing Columns in the List View {#customizing-columns-in-the-list-view}

>[!NOTE]
>
>This feature is optimized for columns of text fields; for other data types it is possible to overlay `cq/gui/components/siteadmin/admin/listview/columns/analyticscolumnrenderer` in `/apps`.

<!-- Needs a review by Engineering -->
<!--
CODE ON GITHUB

You can find the code of this page on GitHub

* [Open aem-sites-extension-listview-columns project on GitHub](https://github.com/Adobe-Marketing-Cloud/aem-sites-extension-listview-columns)
* Download the project as [a ZIP file](https://github.com/Adobe-Marketing-Cloud/aem-sites-extension-listview-columns/archive/master.zip)
-->

To customize the columns in the list view:

1. Overlay the list of available columns.

    * On the node: 

      `/apps/wcm/core/content/common/availablecolumns`

    * Add your new columns - or remove existing ones.

   See [Using Overlays (and the Sling Resource Merger)](/help/sites-developing/overlays.md) for more information.

1. Optionally:

    * If you want to plug additional data, you need to write a ` [PageInforProvider](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/javadoc/com/day/cq/wcm/api/PageInfoProvider.html)` with a 

      `pageInfoProviderType` property.

   For example, see the class/bundle attached (from GitHub) below.

1. You can now select the column in the column configurator of list view.

## Filtering Resources {#filtering-resources}

When using a console, a common use case is when the user must select from resources (e.g. pages, components, assets, etc.). This can take the form of a list for example from which the author must choose an item.

In order to keep the list to a reasonable size and also relevant to the use case, a filter can be implemented in the form of a custom predicate. See [this article](/help/sites-developing/customizing-page-authoring-touch.md#filtering-resources) for details.

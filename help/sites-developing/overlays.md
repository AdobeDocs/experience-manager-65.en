---
title: Overlays
seo-title: Overlays
description: AEM uses the principle of overlays to allow you to extend and customize the consoles and other functionality 
seo-description: AEM uses the principle of overlays to allow you to extend and customize the consoles and other functionality 
uuid: d14c08fe-04c0-4925-8c99-c6644357919d
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: platform
content-type: reference
discoiquuid: 0470b74c-2c34-4327-afed-b95eefb1d521
---

# Overlays{#overlays}

AEM (and prior to that, CQ) has long used the principle of overlays to allow you to extend and customize the [consoles](/help/sites-developing/customizing-consoles-touch.md) and other functionality (for example, [page authoring](/help/sites-developing/customizing-page-authoring-touch.md)).

Overlay is a term that can be used in many contexts. In this context (extending AEM) an overlay means taking the predefined functionality and imposing your own definitions over that (to customize the standard functionality).

In a standard instance the predefined functionality is held under `/libs` and it is recommended practice to define your overlay (customizations) under the `/apps` branch. AEM uses a search path to find a resource, searching first the `/apps` branch and then the `/libs` branch (the [search path can be configured](#configuring-the-search-paths)). This mechanism means that your overlay (and the customizations defined there) will have priority.

Since AEM 6.0, changes have been made to how overlays are implemented and used:

* AEM 6.0 onwards - for [Granite](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/granite-ui/api/index.html)-related overlays (i.e. the touch-enabled UI)

    * Method

        * Reconstruct the appropriate `/libs` structure under `/apps`.

          This does not require a 1:1 copy, the [Sling Resource Merger](/help/sites-developing/sling-resource-merger.md) is used to cross-reference the original definitions that are required. The Sling Resource Merger provides services to access and merge resources by means of diff (differencing) mechanisms.

        * Make any changes under `/apps`.

    * Advantages

        * More robust to changes under `/libs`.
        * Only redefine what is actually required.

* Non-Granite overlays and overlays prior to AEM 6.0

    * Method

        * Copy the content from `/libs` to `/apps`

          You need to copy the entire sub-branch, including properties.

        * Make any changes under `/apps`.

    * Disadvantages

        * Although your changes will not be lost when something changes under `/libs`, you might have to recreate certain changes that occur in your overlay under `/apps`.

>[!CAUTION]
>
>The [Sling Resource Merger](/help/sites-developing/sling-resource-merger.md) and the related methods can only be used with [Granite](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/granite-ui/api/index.html). This means that creating an overlay with a skeleton structure is only appropriate for the standard, touch-enabled UI.
>
>Overlays for other areas (including the classic UI) involve copying the appropriate node and entire sub-structure, then making the required changes.

Overlays are the recommended method for many changes, such as [configuring your consoles](/help/sites-developing/customizing-consoles-touch.md#create-a-custom-console) or [creating your selection category to the asset browser in the side panel](/help/sites-developing/customizing-page-authoring-touch.md#add-new-selection-category-to-asset-browser) (used when authoring pages). They are required as:

* You ***must not* make changes in the `/libs` branch** 
  Any changes you do make may be lost, because this branch is liable to changes whenever you:

    * upgrade on your instance
    * apply a hotfix
    * install a feature pack

* They concentrate your changes in one location; making it easier for you to track, migrate, backup and/or debug your changes as necessary.

## Configuring the Search Paths {#configuring-the-search-paths}

For overlays the resource delivered is an aggregate of the resources and properties retrieved, depending on search paths that can be defined:

* The resource **Resolver Search Path** as defined in the [OSGi configuration](/help/sites-deploying/configuring-osgi.md) for the **Apache Sling Resource Resolver Factory**.

    * The top-down order of search paths indicates their respective priorities.
    * In a standard installation the primary defaults are `/apps`, `/libs` - so the content of `/apps` has a higher priority than that of `/libs` (i.e. it *overlays* it).

* Two service users need JCR:READ access to the location where the scripts are stored. Those users are: components-search-service (used by the com.day.cq.wcm.coreto access/cache components) and sling-scripting (used by org.apache.sling.servlets.resolver to find servlets).
* The following configuration must also be configured according to where you put your scripts (in this example under /etc, /libs or /apps).

    ```
    PID = org.apache.sling.jcr.resource.internal.JcrResourceResolverFactoryImpl
    resource.resolver.searchpath=["/etc","/apps","/libs"]
    resource.resolver.vanitypath.whitelist=["/etc/","/apps/","/libs/","/content/"]
    ```

* Finally the Servlet Resolver must also be configured (in this example to add /etc as well)

    ```
    PID = org.apache.sling.servlets.resolver.SlingServletResolver  
    servletresolver.paths=["/bin/","/libs/","/apps/","/etc/","/system/","/index.servlet","/login.servlet","/services/"]
    ```

## Example of Usage {#example-of-usage}

Some examples are covered when:

* [Customizing the Consoles](/help/sites-developing/customizing-consoles-touch.md)
* [Customizing Page Authoring](/help/sites-developing/customizing-page-authoring-touch.md)


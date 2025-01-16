---
title: Out of the Box App Handlers

description: Follow this page to learn about the out-of-the-box handlers for Adobe PhoneGap Enterprise with AEM.


contentOwner: User
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/MOBILE
topic-tags: developing-adobe-phonegap-enterprise

exl-id: e2ddf5d1-0f5b-4f3b-9666-0f388915730e
solution: Experience Manager
feature: Mobile
role: Admin
---
# Out of the Box App Handlers{#out-of-the-box-app-handlers}

{{ue-over-mobile}}

See the following guidelines for developing Content Sync Handlers:

* Handlers must implement *com.day.cq.contentsync.handler.ContentUpdateHandler* (either directly or extending a class that does)
* Handlers can extend *com.adobe.cq.mobile.platform.impl.contentsync.handler.AbstractSlingResourceUpdateHandler*
* Handler must only report true if they updated the ContentSync cache. Falsely reporting true will allow AEM create an update.
* Handler should only update the cache if the content actually changed. Do not write to the cache if a white is not necessary and avoid an unnecessary update creation.

## Out of the Box Handlers {#out-of-the-box-handlers}

The following lists out-of-the-box app handlers:

**mobileapppages** Renders app pages.

* ***type - String*** - mobileapppages
* ***path - String*** - path to a page
* ***extension - String*** - Extension that should be used in the request. For pages this is almost always *html*, but others are still possible.

* ***selector - String*** - Optional selectors separated by dot. Common examples are *touch* for rendering mobile versions of a page.

* ***deep - Boolean*** - Optional boolean property determining if child pages should be included, as well. The default value is *true.*

* ***includeImages - Boolean*** - Optional boolean property determining if images should be included. The default value is *true*.

  * By default, only image components with a resource type of foundation/components/image are considered for inclusion.

* ***includeVideos - Boolean*** - Optional boolean property determine if videos should be include. The default value is *true*.

* ***includeModifiedPagesOnly - Boolean*** - If false or omitted render all pages and check updates in rendering. If true, base diffs on changes to a pages lastModified.
* ***+ rewrite (node)***
   ***- relativeParentPath - String*** - the path to write all other paths relative to.

>[!NOTE]
>
>The resource type of the image and video components that are affected by this handler is set by configuring the properties of the *com.adobe.cq.mobile.platform.impl.contentsync.handler*.*MobilePagesUpdateHandler OSGi service*.

**mobilepageassets** Collects app page assets.

**mobilecontentlisting** Lists the content of the ContentSync zip. This is used by the client side js on device to do the initial file copy required for AEM apps.

This handler should be added to any AEM Apps ContentSync Config.

* ***type - String - mobilecontentlisting***
* ***path*** - String - keep empty, must be present to be seen as a valid handler but path is inferred to be the current ContentSync cache. This value is ignored.
* ***targetRootDirectory* -** String - the prefix to add to paths as a target root for content update for this handler.
* ***order - Long* -** Order for ContentSync to excute this handler. This number should be set higher than all other handlers such as 100. It should be run after traditional content handlers.

```xml
{
  "files": [
    "config.xml",
    "res/screens/ios/screen-ipad-portrait-2x.png",
    "res/screens/ios/screen-ipad-landscape.png",
    "res/screens/ios/screen-iphone-portrait-2x.png",
    "res/screens/ios/screen-iphone-landscape.png",
    "res/screens/ios/screen-iphone-portrait.png",
    "apps/weretail-app/components/splash-page/clientlibs.css",
    ...
    "pge-content-packages.json"
  ],
  "count": 382,
  "lastModified": 1422902754733
}
```

**mobilecontentpackageslisting** Lists the AEM content package in a given app and the serverURL to make update requests to. This is used the client side js on device to request content updates

The handler should be used on AEM App Shell ContentSync Config (node with pge-type=app-instance)

* ***type - String - mobilecontentpackageslisting***
* ***path** - **String*** - Path to an app shell (node with pge-type=app-instance).
* ***targetRootDirectory - String*** - the prefix to add to paths as a target root for content update for this handler.
* ***order - Long* -** Order for ContentSync to execute this handler. This number should be set higher than all other handlers such as 100. It should be run after traditional content handlers.

>[!NOTE]
>
>The following code block is not an exact implementation and should be used as a reference example:

```xml
{
  "content": [
    {
      "name": "en",
      "title": "We Retail Mobile App - English",
      "type": "CONTENT",
      "path": "/content/phonegap/weretail-outdoors/en",
      "updatePath": "/content/phonegap/weretail/en/jcr:content/pge-app/app-config"
    },
    {
      "name": "shell",
      "title": "We Retail Mobile App",
      "type": "INSTANCE",
      "path": "/content/phonegap/weretail-outdoors/shell",
      "updatePath": "/content/phonegap/weretail/shell/jcr:content/pge-app/app-config"
    }
  ],
  "serverURL": "http://localhost:4503/"
}
```

**widgetconfig** Includes an updated config.xml that merges any edits made via the Command Center with a provided config.xml. If this handler is not included any app details that are changed via the Administration interface will not be included in the cache.

This handler should be used on a AEM App Shell ContentSync config (node with pge-type=[app-instance]).

* ***type - String* - **widgetconfig
* ***path** - **String*** - Path to any app shell child node (node with pge-type=[app-instance]).
* ***targetRootDirectory - String*** - the prefix to add to paths as a target root for content update for this handler.
* ***targetIconDirectory - String*** - the directory to place the icons for the app

**mobileADBMobileConfigJSON** Include the ADBMobileConfig.JSON file if the AMS cloudservice was configured.

This is used at compile time to configure the AMS plugin for analytic support.

The handler should be used on AEM App Shell ContentSync Config (node with pge-type=app-instance)

* ***type - String*** - mobileADBMobileConfigJSON
* ***path - String*** - Path to an app shell (node with pge-type=app-instance or a RT that extends /libs/mobileapps/core/components/instance)
* ***targetRootDirectory - String*** - the prefix to add to paths as a target root for content update for this handler

**notificationsconfig** Extracts notifications configurations required on device. The properties are extracted from the respective push service cloud service configuration associated with the app.

Non-AEM properties in the cloud service's jcr:content node are extracted and added to the **pge-notifications-config.json** JSON file for inclusion in the app content's www root.

AEM properties are those that are name-spaced with "cq", "sling" or "jcr". Other properties may be excluded using the "excludeProperties" property on the content-sync config node.

* ***type - String*** - notificationsconfig
* ***excludeProperties - String[]*** - properties to be excluded

**contentsyncconfigcontent** Collects content from an existing ContentSync config.

* ***type - String*** - contentsyncconfigcontent
* ***path - String*** - Path to one of:

    * another ContentSync config
    * to a Content Package (will be use its phonegap-exportTemplate property to find its ContentSync config)
    * to a Mobile Resource (app-content's will be found under that resource and, if those content packages have a pge-includeInBuild property which is true, the phonegap-exportTemplate is used to find its ContentSync config)

* ***autoCreateFirstUpdateBeforeImport - Boolean*** - if true, create an initial **update** in the target config before importing if once does not exist already

* ***autoFillBeforeImport - Boolean*** - if true, update/fill the target config before importing
* ***configSuffix - String*** - a string to append to the path indicated on the "phonegap-exportTemplate" property of app-content. This can be used to distinguish different export templates. For example, this property can be set to **"-dev"** to indicate that *"/../../../appconfig-dev"* should be used (as opposed to *"/../../../appconfig"*).

**app-assets** Includes all assets associated with an app instance. This handler will include any assets found under the specified path along with any assets referenced by an app instance's appAssetPath property.

* ***type - String*** - app-assets

* ***path** - **String*** - path to a location under an app instance where app assets are stored

**mobileappoffers** A new content sync handler has been introduced for the Personalization use case to render targeted content. The 'mobileappoffers' handler knows how to render the associated target offers that have been created by the content author. The mobileappoffers handler extends the abstract pages update handler therefore many of the properties are similar. The details of the mobileappoffers handler has the following properties.

The mobileappsoffers handler exends the mobileappspages handler and adds the following properties:

* ***locationRoot - String*** - specify the location of the mobile application
* ***includePageTypes - String*** - defaults to support cq/personalization/components/teaserpage and cq/personalization/components/offerproxy
* ***selector - String*** - should be set to tandt
* ***path - String***- the path to the campaign's brand

**mobileappconfig** The mobileappconfig content sync handler provide a way to inject JSON data into the MobileAppsConfig.json. To register a provider class developers will add their MobileAppsInfoProvider class with the list of providers. The handler will iterate over the list of MobileAppsInfoProviders and allow the provider to inject data into the resulting json file. The list of properties which this handler supports are:

* ***path** - **String*** - the path to an app instance node with pge-type=app-instance or a RT that extends /libs/mobileapps/core/components/instance
* ***providers - String*** `[]` - the list of fully qualified MobileAppsInfoProviders
* ***targetRootDirectory - String*** - the directory where to write the MobileAppsConfig.json file to.
* **fileName - String** - optional name of the file to write the JSON to, defaults to MobileAppsConfig.json

It is possible to have multiple mobileappconfig handlers configured each with a unique set of providers writing to different JSON files.

### Testing Content Sync Handlers {#testing-content-sync-handlers}

**Steps for Checking Integrity** Clear cache

* Clear cache
* Run your handler (cache updated)
* Run your handler again (cache should not be updated)

**Steps for Debugging**

* Run your config
* Export your config or review on device
* If rendering fails check for missing *styles/assets/libs* or check for bad paths to *styles/assets/libs*

**Logging** Enable ContentSync Debug logging via OSGI logger configurations on package `com.day.cq.contentsync` This will let you track what handlers ran and whether they updated the cache and reported updating the cache.

## Additional Resources {#additional-resources}

To learn about the roles and responsibilities of an Administrator and Developer, see the resources below:

* [Authoring for Adobe PhoneGap Enterprise with AEM](/help/mobile/phonegap.md)
* [Administering Content for Adobe PhoneGap Enterprise with AEM](/help/mobile/administer-phonegap.md)

>[!NOTE]
>
>To get started with AEM Mobile app development, click [here](/help/mobile/getting-started-aem-mobile.md).

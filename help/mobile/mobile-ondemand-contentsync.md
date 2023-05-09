---
title: Mobile with Content Sync
description: Follow this page to learn about Content Sync. Pages that are authored in AEM can be used as app content, even when the device is offline. Furthermore, because AEM pages are based on web standards, they work cross-platform enabling you to embed them in any native wrapper. This strategy reduces develoment effort and enables you to easily update app content.
uuid: 11f74cc5-99a5-4186-9b60-b19351305432
contentOwner: User
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/MOBILE
topic-tags: developing-on-demand-services-app
discoiquuid: 8fb70ca4-86fc-477d-9773-35b84d5e85a8
exl-id: a6e59334-09e2-4bb8-b445-1868035da556
---
# Mobile with Content Sync{#mobile-with-content-sync}

>[!NOTE]
>
>Adobe recommends using the SPA Editor for projects that require single page application framework-based client-side rendering (e.g. React). [Learn more](/help/sites-developing/spa-overview.md).

Use Content Sync to package content so that it can be used in native mobile applications. Pages that are authored in AEM can be used as app content, even when the device is offline. Furthermore, because AEM pages are based on web standards, they work cross-platform enabling you to embed them in any native wrapper. This strategy reduces development effort and enables you to easily update app content.

The Content Sync framework creates an archive file that contains the web content. The content can be anything from simple pages, images, and PDF files, or entire Web applications. The Content Sync API provides access to the archive file from mobile apps or build processes so that the content can be retrieved and included in the app.

The following sequence of steps illustrates a typical use case for Content Sync:

1. The AEM developer creates a Content Sync configuration that specifies the content to include.
1. The Content Sync framework collects and caches the content.
1. On a mobile device, the mobile application is started and requests content from the server, which is delivered in a ZIP file.
1. The client unpacks the ZIP content to the local file system. The folder structure in the ZIP file simulates the paths that a client (e.g. a browser) would normally request from the server.
1. The client opens the content in an embedded browser or uses it in some other way.
1. Later, the client requests updated content from the server. The Content Sync framework delivers incremental updates to reduce download size and time, which can be important for mobile devices due to limited bandwidth or data volumes.

## Developing the Content Sync Handlers {#developing-the-content-sync-handlers}

Some of the guidelines for developing Content Sync Handlers are as follows:

* Handlers must implement *com.day.cq.contentsync.handler.ContentUpdateHandler* (either directly or extending a class that does)
* Handlers can extend *com.adobe.cq.mobile.platform.impl.contentsync.handler.AbstractSlingResourceUpdateHandler*
* Handler must only report true if they update the ContentSync cache. Falsely reporting true will have AEM create an update when an update didn't actually occur.
* Handler should only update the cache if the content actually changed. Do not write to the cache if a white is not necessary. This results in an unnecessary update being created.

>[!NOTE]
>
>Enable *ContentSync Debug logging* via OSGI logger configurations on package *com.day.cq.contentsync*. This allows to track what handlers ran and whether they updated the cache and reported updating the cache.

## Configuring the Content Sync Content {#configuring-the-content-sync-content}

Create a Content Sync configuration to specify the content of the ZIP file that is delivererd to the client. You can create any number of Content Sync configurations. Each configuration has a name for identification purposes.

To create a Content Sync configuration, add a `cq:ContentSyncConfig` node to the repository, with the `sling:resourceType` property set to `contentsync/config`. The `cq:ContentSyncConfig` node can be located anywhere in the repository, however the node must be accessible to users on the AEM publish instance. Therefore, you should add the node below `/content`.

To specify the content of the Content Sync ZIP file, add child nodes to the cq:ContentSyncConfig node. The following properties of each child node identifies a content item to include and how it is processed when adding it:

* `path`: The location of the content.
* `type`: The name of the configuration type to use for processing the content. Several types are available and are described in section *Configuration Types*.

See *Example Content Sync Configuration* for more information.

After you create the Content Sync configuration, it appears in the Content Sync console.

>[!NOTE]
>
>The Content Sync framework does not check that dependencies of assets and design-related files are included in Content Sync packages. Make sure you include all required files in the ZIP file.

### Configuring Access to Content Sync Downloads {#configuring-access-to-content-sync-downloads}

Specify a user or group that can download from Content Sync. You can configure the default user or group that can download from all Content Sync caches, and you can override the default and configure access for a specific Content Sync configuration.

When AEM is installed, members of the administrators group can download from Content Sync by default.

#### Setting the Default Access for Content Sync Downloads {#setting-the-default-access-for-content-sync-downloads}

The Day CQ Content Sync Manager service controls access to Content Sync. Configure this service to specify the user or group that can download from Content Sync by default.

If you are [configuring the service using the Web Console](/help/sites-deploying/configuring-osgi.md#osgi-configuration-with-the-web-console), type the name of the user or group as the value of the Fallback Cache Authorizable property.

If you are [configuring in the repository](/help/sites-deploying/configuring-osgi.md#osgi-configuration-in-the-repository), use the following information about the service:

* PID: com.day.cq.contentsync.impl.ContentSyncManagerImpl
* Property name: contentsync.fallback.authorizable

#### Overriding Download Access for a Content Sync Cache {#overriding-download-access-for-a-content-sync-cache}

To configure download access for a specific Content Sync configuration, add the following property to the `cq:ContentSyncConfig` node:

* Name: authorizable
* Type: String
* Value: The name of the user or group that can download.

For example, your app enables users to install updates directly from Content Sync. To enable all users to download the update, you set the value of the authorizable property to `everyone`.

If the `cq:ContentSyncConfig` node has no authorizable property, the default user or group that is configured for the Fallback Cache Authorizable property of the Day CQ Content Sync Manager service determines who can download.

### Configuring the User for Updating a Content Sync Cache {#configuring-the-user-for-updating-a-content-sync-cache}

When a user performs an update to the Content Sync cache, a specific user account performs the action on behalf of the user. The anonymous user updates all Content Sync caches by default.

You can override the default user and specify a user or group that upates a specific Content Sync cache.

To override the default user, specify a user or group that performs updates for a specific Content Sync configuration by adding the following property to the cq:ContentSyncConfig node:

* Name: `updateuser`
* Type: `String`
* Value: The name of the user or group that can performs the updates.

If the `cq:ContentSyncConfig` node has no `updateuser` property, the default `anonymous` user updates the cache.

### Configuration types {#configuration-types}

Processing can range from rendering simple JSON to fully fledged rendering of pages including their referenced assets. This section lists the available configuration types and their specific parameters:

**copy** Simply copy files and folders.

* **path** - If the path points to a single file, only the file is copied. If it points to a folder (this includes page nodes), all files and folders below will be copied.

**content** Render content using standard [Sling request processing](/help/sites-developing/the-basics.md#sling-request-processing).

* **path** - Path to resource that should be output.
* **extension** - Extension that should be used in the request. Common examples are *html* and *json*, but any other extension is possible.

* **selector** - Optional selectors separated by dot. Common examples are *touch* for rendering mobile versions of a page or *infinity* for JSON output.

**clientlib** Package a Javascript or CSS client library.

* **path** - Path to the client library's root.
* **extension** - Type of client library. This should be set to either *js* or *css* at the moment.

**assets**

Collect original renditions of assets.

* **path** - Path to an asset folder below /content/dam.

**image** Collect an image.

* **path** - Path to an image resource.

The image type is used to include the We Retail logo in the zip file.

**pages** Render AEM pages and collect referenced assets.

* **path** - Path to a page.
* **extension** - Extension that should be used in the request. For pages this is almost always *html*, but others are still possible.

* **selector** - Optional selectors separated by dot. Common examples are *touch* for rendering mobile versions of a page.

* **deep** - Optional boolean property determining if child pages should be included, as well. The default value is *true.*

* **includeImages** - Optional boolean property determining if images should be included. The default value is *true*.

  By default, only image components with a resource type of foundation/components/image are considered for inclusion. You can add more resource types by configuring the **Day CQ WCM Pages Update Handler** in the Web console.

**rewrite** The rewrite node defines how the links are rewritten in the exported page. The rewritten links can either point to the files included in the zip file or to the resources on the server.

The `rewrite` node needs to be located below the `page` node.

The `rewrite` node can have one or more of the following properties:

* `clientlibs`: rewrites clientlibs paths.

* `images`: rewrites images paths.
* `links`: rewrites links paths.

Each property can have one of the following values:

* `REWRITE_RELATIVE`: rewrites the path with a relative position to the page .html file on the file system.

* `REWRITE_EXTERNAL`: rewrites the path by pointing to the resource on the server, using the AEM [Externalizer service](/help/sites-developing/externalizer.md).

The AEM service called **PathRewriterTransformerFactory** allows you to configure the specific html attributes that will be rewritten. The service can be configured in the Web console and has a configuration for each property of the `rewrite` node: `clientlibs`, `images` and `links`.

This feature was added in AEM 5.5.

### Example Content Sync Configuration {#example-content-sync-configuration}

The listing below shows an example configuration for Content Sync.

```xml
+ weretail_go [cq:ContentSyncConfig]
  - sling:resourceType = "contentsync/config"

  + etc.designs.default [nt:unstructured]
    - path = "/etc/designs/default"
    - type = "copy"

  + etc.designs.mobile [nt:unstructured]
    - path = "/etc/designs/mobile"
    - type = "copy"

  + events.plist [nt:unstructured]
    - path = "/content/weretail_mobile/en/events/jcr:content/par/events"
    - type = "content"
    - extension = "plist"

  + events.touch.html [nt:unstructured]
    - path = "/content/weretail_mobile/en/events"
    - type = "pages"
    - extension = "html"
    - selector = "touch"

  + logo [nt:unstructured]
    - path = "/etc/designs/mobile/jcr:content/mobilecontentpage/logo"
    - type = "logo"

  + manifest [nt:unstructured]
    - indexPage = "/content/weretail_mobile/en/events.touch.html"
    - metadataPlist = "/content/weretail_mobile/en/events/_jcr_content/par/events.plist"

  + ...
```

**etc.designs.default and etc.designs.mobile** The first two entries of the configuration should be quite obvious. As we are going to include a number of mobile pages, we need the related design files below /etc/designs. And since there is no extra processing required, copy is sufficient.

**events.plist** This entry is a bit special. As mentioned in the introduction, the application should provide a map view with markers of the events' locations. We are going to provide the necessary location information as a separate file in PLIST format. For this to work, the event list component that is used on the index page, has a script called plist.jsp. This script is executed when the component's resource is requested with the .plist extension. As usual, the components path is given in the path property and the type is set to content, because we want to leverage [Sling request processing](/help/sites-developing/the-basics.md#sling-request-processing).

**events.touch.html** Next comes the actual pages that will be shown in the app. The path property is set to the events' root page. All event pages below that page will also be included, because the deep property defaults to true. We use pages as configuration type, so that any images or other files that may be referenced from an image or download component on a page, will be included. In addition, setting the touch selector gives us a mobile version of the pages. The configuration in the feature pack contains more entries of this kind, but they are left out for simplicity here.

**logo** The logo configuration type has not been mentioned so far and it is none of the build-in types. However, the Content Sync framework is extensible to some degree and this is an example of that, which will be covered in the next section.

**manifest** It is often desirable to have some kind of metadata included in the zip file, like the start page of your content for example. However, hardcoding such information prevents you from easily changing it later. The Content Sync framework supports this use case by looking for a manifest node in the configuration, which is simply identified by name and does not require a configuration type. Every property defined on that particular node is added to a file, which is also called manifest and resides in the root of the zip file.

In the example, the event listing page is supposed to be the inital page. This information is provided in the **indexPage** property and can thus be easily changed at any time. A second property defines the path of the *events.plist* file. As we will see later, the client application can now read the manifest and act according to it.

As soon as the configuration is setup, the content can be downloaded with a browser or any other HTTP client, or if you are developing for iOS, you can use the dedicated WAppKitSync client library. The download location is made up of the configuration's path and the *.zip* extension, e.g. when working with a local AEM instance: *http://localhost:4502/content/weretail_go.zip*

### The Content Sync Console {#the-content-sync-console}

The Content Sync console lists all the Content Sync configurations in the repository (all nodes of type `cq:ContentSyncConfig`) and for each configuration allows you to do the following:

* Update the cache.
* Clear the cache.
* Download a full zip.
* Download a diff zip between now and a specific date and time.

It can be usefull for development and troubleshooting.

The console can be accessed at:

`http://localhost:4502/libs/cq/contentsync/content/console.html`

It looks as follows:

![chlimage_1-50](assets/chlimage_1-50.png)

### Extending the Content Sync framework {#extending-the-content-sync-framework}

Though the number of configuration options is already quite extensive, it may not cover all the requirements of your specific use case. This section describes the Content Sync framework's extension points and how to create custom configuration types.

For each configuration type, there is a *Content Update Handler*, which is an OSGi component factory that is registered for that specific type. These handlers collect content, process it, and add it to a cache that is maintained by the Content Sync framework. Implement the following interface or abstract base class:

* `com.day.cq.contentsync.handler.ContentUpdateHandler` - Interface that all update handlers need to implement
* `com.day.cq.contentsync.handler.AbstractSlingResourceUpdateHandler` - An abstract class that simplifies the rendering of resources using Sling

Register your class as OSGi component factory and deploy it in the OSGi container in a bundle. This can be done using the [Maven SCR plugin](https://felix.apache.org/documentation/subprojects/apache-felix-maven-scr-plugin/apache-felix-maven-scr-plugin-use.html) either using JavaDoc tags or annotations. The following example shows the JavaDoc version:

```java
/*
 * @scr.component metatype="no"
 * factory="com.day.cq.contentsync.handler.ContentUpdateHandler/customtype"
 */
public class CustomTypeUpdateHandler implements ContentUpdateHandler {
    // add your code here
}

/*
 * @scr.component metatype="no" inherit="true"
 * factory="com.day.cq.contentsync.handler.ContentUpdateHandler/othertype"
 */
public class OtherTypeUpdateHandler extends AbstractSlingResourceUpdateHandler {
    // add your code here
}
```

Notice that the *factory* definition contains the common interface and the custom type separated by slash. This strategy enables the Content Sync framework to find and create an instance of your custom class as it recognizes the custom type in a configuration entry. The next section gives a concrete example of a custom update handler.

>[!CAUTION]
>
>When building upon the AbstractSlingResourceUpdateHandler base class, you must add the *inherit* definition. Otherwise the OSGi container will not set the required references that are declared in the base class.

### Implementing a Custom Update Handler {#implementing-a-custom-update-handler}

Every We.Retail Mobile page contains a logo in the upper-left corner that we would like to include in the zip file, of course. However, for cache optimization, AEM doesn't reference the image file's real location in the repository, which prevents us from simply using the **copy** configuration type. What we need to do instead is to provide our own **logo** configuration type that makes the image available at the location requested by AEM. The following code listing shows the full implementation of the logo update handler:

#### LogoUpdateHandler.java {#logoupdatehandler-java}

```java
package com.day.cq.wcm.apps.weretail.impl;

import javax.jcr.Node;
import javax.jcr.RepositoryException;
import javax.jcr.Session;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceResolver;
import org.apache.sling.jcr.resource.JcrResourceResolverFactory;

import com.day.cq.commons.jcr.JcrUtil;
import com.day.cq.contentsync.config.ConfigEntry;
import com.day.cq.contentsync.handler.ContentUpdateHandler;
import com.day.cq.wcm.foundation.Image;
import com.day.text.Text;

/**
 * The <code>LogoUpdateHandler</code> is used to update the content sync cache
 * with a page logo added using a logo component.
 *
 * @scr.component metatype="no"
 * factory="com.day.cq.contentsync.handler.ContentUpdateHandler/logo"
 */
public class LogoUpdateHandler implements ContentUpdateHandler {

    private static final Logger log = LoggerFactory.getLogger(LogoUpdateHandler.class);

    /** @scr.reference policy="static" */
    protected JcrResourceResolverFactory resolverFactory;

    public boolean updateCacheEntry(ConfigEntry configEntry, Long lastUpdated, String configCacheRoot, Session admin, Session session) {
        ResourceResolver resolver = resolverFactory.getResourceResolver(admin);
        Resource resource = resolver.getResource(configEntry.getContentPath());

        Image img = new Image(resource);
        img.setItemName(Image.NN_FILE, "image");
        img.setItemName(Image.PN_REFERENCE, "imageReference");
        img.setSelector("img");

        try {
            if(img.getLastModified() == null || lastUpdated < img.getLastModified().getTime().getTime()) {
                String src = img.getSrc();
                String parentPath = configCacheRoot + Text.getRelativeParent(src, 1);

                Node parent = JcrUtil.createPath(parentPath, "sling:Folder", admin);
                Node image = resolver.getResource(resource.getPath() + "/image").adaptTo(Node.class);
                JcrUtil.copy(image, parent, Text.getName(src));

                admin.save();

                return true;
            }
        } catch (RepositoryException e) {
            log.error("Unexpected error while updating logo: ", e);
        }

        return false;
    }
}
```

The `LogoUpdateHandler` class implements the `ContentUpdateHandler` interface's `updateCacheEntry(ConfigEntry, Long, String, Session, Session)` method, which takes a number of arguments:

* A `ConfigEntry` instance that provides access to the configuration entry, for which this handler is called, and its properties.
* A `lastUpdated` timestamp indicating the last time the Content Sync updated its cache. Content that hasn't been modified after that timestamp should not be updated by the handler.
* A `configCacheRoot` argument that specifies the root path of the cache. All updated files must be stored below this path to be added to the zip file.
* An administrative session that should be used for all cache related repository operations.
* A user session that can be used to update content in the context of a certain user and thus to provide a kind of personalized content.

To implement the custom handler, first create an instance of the Image class based on the resource that is given in the configuration entry. This is basically the same procedure as the actual logo component on our pages is doing. It makes sure that the target path of the image is the same as the one referenced from a page.

Next, check if the resource was modified since the last update. Custom implementations should avoid unnecessary updates of the cache and return false if nothing changes. If the resource was modified, copy the image to the expected target location relative to the cache root. Finally, `true` is returned to indicate to the framework that the cache was updated.

## Using the content on the client {#using-the-content-on-the-client}

In order to use content in a mobile app provided by Content Sync, you need to request content via a HTTP or HTTPS connection. As a result, retrieved content (packed in a ZIP file) can be extracted and stored locally on the mobile device. Note that content not only refers to data but also to logic, i.e. complete web applications; thereby enabling the mobile user to execute retrieved web applications and corresponding data even without network connectivity.

Content Sync delivers content in an intelligent fashion: Only data changes since a last successful data synchronization are delivered, thereby reducing time required for data transfer. On first run of an application data changes are requested since 1st January 1970, while subsequently only data that changed since last successful synchronization is requested. AEM utilizes a client communication framework for iOS to simplify data communication and transfer so that a minimal amount of native code is required to enable an iOS-based web application.

All transferred data can be extracted into the same directory structure, there are no additional steps (e.g. dependency checks) required when extracting data. In case of iOS, all data is stored in a subfolder within the Documents folder of the iOS App.

Typical execution path of an iOS-based AEM Mobile App:

* User starts app on iOS device.
* App attempts to connect to AEM backend and requests data changes since last run.
* The server retrieves data in question and zips them into a file.
* Data is returned to client device where it is extracted into the documents folder.
* UIWebView component starts/refreshes.

If a connection could not be established previously downloaded data will be displayed.

### Additional Resources {#additional-resources}

To learn about the roles and responsibilities of an Administrator and an Author, see the resources below:

* [Authoring AEM Content for AEM Mobile On-Demand Services](/help/mobile/mobile-apps-ondemand.md)
* [Administering Content to Use AEM Mobile On-Demand Services](/help/mobile/aem-mobile.md)

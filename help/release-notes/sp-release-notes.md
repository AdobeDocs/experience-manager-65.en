---
title: [!DNL Adobe Experience Manager] 6.5 Service Pack Release Notes.
description: Release notes specific to [!DNL Adobe Experience Manager] 6.5 Service Pack 7.
docset: aem65
mini-toc-levels: 1
---

# [!DNL Adobe Experience Manager] 6.5 Service Pack Release Notes {#aem-service-pack-release-notes}

## Release information {#release-information}

| Products | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.7.0                      |
| Type     | Service Pack Release         |
| Date     | November 26, 2020                |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.7.zip) |

<!-- TBD: Update the SD link when SP7 is available. -->

## What's included in [!DNL Adobe Experience Manager] 6.5.7.0 {#what-s-included-in-aem}

[!DNL Adobe Experience Manager] 6.5.7.0 is an important update that includes new features, key customer requested enhancements, and performance, stability, and security improvements, that are released since the availability of 6.5 release in April 2019. The service pack is installed on [!DNL Adobe Experience Manager] 6.5.

The key features and enhancements introduced in [!DNL Adobe Experience Manager] 6.5.7.0 includes:

* Sorting the Live Copy pages available for rollout using the [!UICONTROL Name], [!UICONTROL Last modified date,] and [!UICONTROL Last rollout date] properties.

* Performing the page moves and MSM rollouts as asynchronous operations to reduce their impact on runtime performance.

* Users can sort digital assets in Card and Column views.

* [!DNL Assets] and [!DNL Dynamic Media] provide multiple accessibility enhancements. The enhancements are related to keyboard navigation, use of screen readers, and enabling users to use similar assistive technology (AT). See [[!DNL Assets] enhancements](#assets-6570) and [[!DNL Dynamic Media] enhancements](#dynamic-media-6570).

* The built-in repository (Apache Jackrabbit Oak) is updated to version 1.22.5.

For a complete list of features and enhancements introduced in [!DNL Experience Manager] 6.5.7.0, see [What's new in [!DNL Adobe Experience Manager] 6.5 Service Pack 7](new-features-latest-service-pack.md).

The following is the list of fixes provided in [!DNL Experience Manager] 6.5.7.0 release.

### [!DNL Sites] {#sites-6570}

* When you open the [!UICONTROL Timewrap] option for a page, keep the Timeline side rail option open, and navigate to [!UICONTROL Sites] console, the `Failed to Load` error occurs (NPR-34951).

* The [!UICONTROL Timewrap] option does not display images for the selected date and time range (NPR-34951).

* When a filter calls `getHeader()` from a page containing a Content Fragment, the `java.lang.AbstractMethodError` error occurs (NPR-34942).

* When the path of a page contains multiple content substrings, previews fail to render, and the version compare function also fails (NPR-34740).

* When you set a numeric value for the `String` type label property of a component, you can delete the component and undo the delete operation. However, after undoing the delete, the label property changes from `String` to `Long` (NPR-34739).

* The following exception occurs on adding an Experience Fragment based on a template with a locked layout to a page (NPR-34632):

   ```TXT
   org.apache.sling.api.SlingException: Cannot get DefaultSlingScript: org.apache.sling.api.SlingException: Cannot get DefaultSlingScript: org.mozilla.javascript.EcmaError: TypeError: Cannot call method "getChildren" of null
   ```

* When you move a folder, it results in traversal issues and the following error occurs (NPR-34554):

   ```TXT
   org.apache.sling.api.SlingException: Cannot get DefaultSlingScript. org.apache.jackrabbit.oak.query.RuntimeNodeTraversalException: The query read or traversed more than 100000 nodes. To avoid affecting other tasks, processing was stopped
   ```

* When new assets are created, published, and moved to a new location, the `Request to complete move operation` workflow gets created and results in an Aborted state. Uploading a new asset and executing a `move` operation results in creating the `Request to complete move operation` workflow in pending state (NPR-34543).

* When you export an Experience Fragment from [!DNL Experience Manager] 6.5.2 environment to [!DNL Target] Standard, the API call fails because the workspace property is not available for [!DNL Target] Standard (NPR-34557).

* Users cannot publish pages through the [!UICONTROL manage publication] option because the [!UICONTROL Publish] option disappears (NPR-34542).

* When you add some styles to the text, a `<div>` tag is added to the text, and the style cannot be applied to the text anymore (NPR-34531).

* When you select an item in a pop-up menu and update the required files, it does not allow saving dialog values as the other menu has an empty required field (NPR-34529).

* When you create a page from a custom template and move it within the blueprint hierarchy, components deleted earlier from the page starts showing up on the page within the live copy hierarchy (NPR-34527).

* Once an article style is applied to a content, it cannot be removed (NPR-34486).

* All live copies and copies of an Experience Fragment point to the same [!DNL Adobe Target] offer ID (NPR-34469).

* Bulleted list items are displayed in addition to the numbered list (NPR-34455).

* The compare to source option fails to show the difference between the source page and the edited version of a page (NPR-34285).

* When you delete a page, the versioning details are not configurable (NPR-34159).

* When a user selects the [!UICONTROL Open Selection] dialog option, the keyboard focus moves to the hidden control present on the page (CQ-4307779, CQ-4293601).

* When you move a published folder on the Author, the folder paths are not updated accordingly on the Publish instance (CQ-4305144).

* When a user select the `Enter` key on the [!UICONTROL Select All] option, the keyboard focus does not move to the [!UICONTROL Create Control] option (CQ-4293599).

* When you select the `Esc` key, the focus is not restored to the parent control (CQ-4293593, CQ-4293590).

* Improved WCAG compliance for [!DNL Sites] UI and Core components (CQ-4293448).

* [!UICONTROL Zoom] and [!UICONTROL Scale] functions are disabled for the [!DNL Sites Editor] page (CQ-4282353).

* After you use the Rotate Right option, the screen reader stops narrating the current rotation or flip state (CQ-4282128).

* Done and Cancel Configure dialog buttons have more than one tab-stops (CQ-4274601).

* Moving of pages with a similar name on the same level is not allowed (NPR-35041).

* After selecting the Clear (x) option, the keyboard focus does not move to the [!UICONTROL Filter] field (CQ-4293581).

* When you upgrade to [!DNL Experience Manager] 6.5.6.0, behavior of the inherited paragraph system changes and it does not work properly (NPR-35117).

* Keyboard users are not able to shift the tab focus in an appropriate order after selecting the [!UICONTROL Action] section on an [!DNL AEM Sites] page (CQ-4307786).

* After selecting an option in the link target menu list of the RTE toolbar when editing a content fragment, the content fragment author dialog starts to flicker (CQ-4305532).

* Keyboard users are not able to select the options in the [!UICONTROL Add Component] drop-down list using the Down arrow key (CQ-4295097).

* The tab focus does not shift in an appropriate order when selecting a date from the Calendar menu in the [!UICONTROL Assets] tab of a [!DNL Sites] page (CQ-4293600).

* The tab focus does not shift to the next or previous options for keyboard users after deleting the Link or Text options available when editing a Sites page (CQ-4293597).

* Keyboard users are not able to shift tab focus back to More options in the [!UICONTROL Actions] section after viewing the available options and pressing the `Esc` key (CQ-4293592).

* When you activate the [!UICONTROL Rotate] option for an image in the [!UICONTROL Edit] mode, the tab focus, instead of remaining on Rotate, shifts to the [!UICONTROL Redo] option for the keyboard users (CQ-4293587).

* In the [!UICONTROL Open Selection] dialog available on the [!UICONTROL Link and Actions] tab, the tab focus shifts to hidden elements in the page after the [!UICONTROL Cancel] option (CQ-4293579).

* When keyboard users edit an image, navigate to the [!UICONTROL Finish] option, and press the Enter key, the screen readers do not announce the completion (CQ-4282351).

* The Move up and Move down options available on the [!UICONTROL Link and Actions] dialog are not available to the screen reader and keyboard users (CQ-4281120).

* Keyboard users are not able to restore the tab focus after navigating to the Close (X) option on the [!UICONTROL Properties] page (CQ-4293581, NPR-34653).

### [!DNL Assets] {#assets-6570}

[!DNL Adobe Experience Manager] 6.5.7.0 [!DNL Assets] fixes the following issues and provides the following enhancements.

* The following enhancements are done for accessibility in [!DNL Experience Manager Assets] in this release. For more information, see [accessibility features in [!DNL Assets]](/help/assets/accessibility.md).

  * When navigating timeline using a keyboard, the `Esc` key can collapse the [!UICONTROL Show All] option without losing the focus (CQ-4293598).
  * When navigating using keyboard tab key, after removing the last tag from the added tags, the tag field retains the focus (NPR-35109).
  * [!DNL Experience Manager] components now contain appropriate information for name, role, and value to be used by screen readers (NPR-34255).
  * After you delete the Type/Size combo box, Link combo box, Language combo box, or Text edit box, the keyboard focus returns to the next or the previous user interface elements or to a more relevant user interface element (CQ-4293585).
  * When hovering pointer over various options, the tips such as Select and Download appear. Users who use screen magnification may have difficulty viewing the file thumbnails because of the content displayed due to hovering. It is now possible to preserve the focus, after removing the option using an `Escape` key (CQ-4293554).
  * Upon selecting a grid cell from the grid present in the page, the focus shifts to the action bar that appears on the screen (CQ-4282127).
  * Visual users can differentiate between normal text and a link, as visual clues (underline and chevron icon) are displayed for links to all solutions in [!DNL Experience Manager] home page (CQ-4282072).

* The following user experience enhancement is done in [!DNL Assets]:

  * Enable sorting of assets in card view and column view (NPR-35097).

* After the upgrade to 6.5, if a JSON file is generated using the Assets HTTP API, there are issues with the encoding used in the file (NPR-35129).

* Users of a group that is not provided the permission to create Collections (Create Collection option is unavailable) are still able to create collections by directly accessing the URL `https://[aem_server]:[port]/mnt/overlay/dam/gui/content/collections/createcollectionwizard.html/content/dam/collections?contentPath=/content/dam/collections` (NPR-35115).

* When sorted by name, the searched assets are sorted in case-sensitive manner. This creates two separate sorted lists based on casing that appearing in ordered manner in the search results (NPR-35068).

* When a Content Fragment is opened in the editor, warning messages (`Invalid value specified for a metadata property`) are logged in the error logs (NPR-35012).

* Users without administrator privilege can edit expired assets using [Experience Manager] desktop app. (NPR-34993).

* When the same Asset is dragged on the Assets user interface and a new version is created, the changes in the metadata are not persistent (NPR-34940).

* When editing Collections, a user can delete the title of the Collection and successfully save the changes (NPR-34889).

* When uploading a duplicate image, a delete option is presented. Selecting delete lets the images upload. DAM Update Asset workflow is also triggered (NPR-34744).

* When using [!DNL Adobe Asset Link] with [!DNL Adobe InDesign], the search results do not contain folders and collections but only contain assets (NPR-34699, CQ-4303666).

* Hovering pointer on card view, makes the screen scroll as a result of (automatic) focus on the quick actions available in the card (NPR-34514).

* When editing the properties of multiple assets in bulk, selecting the [!UICONTROL Save] option closes the bulk editor view and redirects to the main [!DNL Assets] page. This behavior is same as the behavior of [!UICONTROL Save & Close] option and is not expected (NPR-34546).

* The smart collection does not present the correct user interface setting after saving. The query is saved properly but the interface always displays the last added Option predicate (NPR-34539).

* When adding assets to [!DNL Experience Manager], the metadata without a namespace does not get imported (NPR-34530).

* When dragging an asset on a folder to move it, the user interface also displays the option to [!UICONTROL Drop in Lightbox] and [!UICONTROL Drop in Collection]. Even if the move operation is canceled, the user interface continues to display the latter two options (NPR-34526).

* The symbol `%>` is displayed on the collections page (NPR-34499).

* In column view, [!DNL Assets] displays duplicate folder and asset names when scrolling upward and downward before all assets get displayed (NPR-34464).

* If you create a private folder immediately after creating a public folder, then the public folder uses the private folder settings (NPR-34415).

* In the card view, the cards are not listed in alphabetical order and cards cannot be sorted alphabetically (NPR-34234).

* When reopening cascading rules, the choices are not maintained on the user interface (CQ-4301452).

#### [!DNL Dynamic Media] {#dynamic-media-6570}

* The following enhancements are done for accessibility in [!DNL Dynamic Media] (CQ-4290306). For details, see [accessibility features in [!DNL Dynamic Media]](/help/assets/accessibility-dm.md).

  * Screen readers (JAWS, Narrator) narrate the name, role, and state for the menu items in the Embed size menu option (CQ-4290927).
  * Users can navigate the Email link dialog using the `Tab` key (CQ-4290926).
  * The workflow to create video encoding profiles is more user-friendly given the screen reader enhancement (CQ-4290623, CQ-4290622).
  * When navigating using `Tab` key, the focus moves to the appropriate user interface elements in the workflow to create an interactive video (CQ-4290621, CQ-4290620, CQ-4290619).
  * The Publish page, Edit Asset page, Edit Smart Crops page, and Image Set Editor page are improved to comply with web standards. Assistive technology (AT) users can now navigate these pages easily and take actions such as cropping images (CQ-4290617, CQ-4290616, CQ-4290613, CQ-4290612, CQ-4290610, CQ-4290614).
  * Viewers are improved to let users navigate using a keyboard (CQ-4290615).
  * The keyboard and screen reader users can use the crop functionality (CQ-4290609).
  * The keyboard users can better manage the hotspots (CQ-4290604, CQ-4290603).

* Remote Imagesets are not editable in [!DNL Experience Manager] if the company name and folder name are the same (NPR-31340).

* The z-index order is incorrect when you try to preview the output after adding a hotspot to a [!DNL Dynamic Media] image or after editing a [!DNL Dynamic Media] video or an [!DNL Experience Fragment] with an image (CQ-4307267).

* [!DNL Dynamic Media] sync fails when mixed media sets are reprocessed (CQ-4307184).

* If an asset is moved to a folder on which auto-synchronization to [!DNL Dynamic Media] is configured, the asset does not synchronize (CQ-4307122).

* [!DNL Dynamic Media] video is not playing on iOS devices with the native HTML5 video controls (CQ-4306977, CQ-4306727).

* Cannot download images on which SmartCrop is applied (CQ-4304558).

* Cannot selectively publish folders to Dynamic Media (CQ-4304526).

* Unpublishing a video file from [!DNL Experience Manager] do not unpublish the Adaptive Video Set from a configured Scene7 deployment (CQ-4304405).

* Adding a panoramic image asset in a panoramic media component and refreshing the page results in `Uncaught ReferenceError: $ is not defined` error (CQ-4302810).

* In the [!UICONTROL Viewer Presets Editor], when editing [!UICONTROL PanoramicImage/PanoramicImage_VR] preset, in the `PanoramicView` component, the `PANORAMICVIEW_AUTOROTATE` modifier label is not available (CQ-4302443).

* Video captions are not displayed if the video is not the first in a MixedMediaSet (CQ-4298161).

* HTML5 eCatalog Viewer on iPhones mobile devices cannot turn the pages or flip the pages (CQ-4296611).

* When scrolling swatches on a mobile device, the swatches scroll to the right and out of the visible area for a few seconds before scrolling back into view (CQ-4296439).

* When a Viewer Preset Master Record is created, the CSS and artwork do not get published and only the viewer preset gets published (CQ-4262205).

* When attempting to link an Experience Fragment for a given hotspot in the [!UICONTROL Interactive Video/Images] component, it does not show the selected Experience Fragment path. Instead, it returns an empty value from the path field (NPR-35146, CQ-4298136).

* Cannot preview an Experience Fragment in IVV Editor (CQ-4308560).

* When adding a hotspot to an image and selecting an Experience Fragment, it is not possible to select the subfolders and the variants of the Experience Fragment (CQ-4307455).

* The non-image assets do not show as published after uploading (CQ-4306415).

#### [!DNL Experience Manager] 3D assets {#three-d-assets-6570}

* `DAM CQ MIME Type` service applies incorrect MIME types to 3D assets leading to incorrect rendering (NPR-34731).

### [!DNL Commerce] {#commerce-6570}

* The Commerce product collection user interface does not list more than 15 products within a collection (NPR-34502).

### Platform {#platform-6570}

* An HTTP session over HTTPS is not invalidated (NPR-35083).
* A `NullPointerException` is returned when starting daily or weekly maintenance tasks from user interface (NPR-34953).
* The W3C validator reports warnings for compliant client library JavaScript files (NPR-34898).
* The `AudienceOmniSearchHandler` function uses a deprecated index (NPR-34870).
* Signing out from Experience Manager does not clear the cookies (NPR-34743).
* The `findByTitle` function of the `TagManager` API does not work if the tag name contains a special character (NPR-34357).
* The process to import user sync package fails (NPR-34399).
* Added support for `ariaLabel` and `ariaLabelledby` properties to the `Coral.Masonry` component (GRANITE-29962).
* Dispatcher cache is not refreshed for pages with content fragments after installing the latest core component packages (CQ-4306788).
* Localized tag names with quotation marks (`"`) are not displayed properly on the user interface (CQ-4305439).

### User Interface {#ui-6570}

* The [!UICONTROL Link to] field in component properties displays autocomplete suggestions that do not match the specified string (NPR-34865).

* AEM displays the following error message when you schedule a daily maintenance window distributed between 2 days (NPR-35280):

   ```TXT
   ERROR The start time must precede (be less than) the end time
   ```

### Integrations {#integrations-6570}

* Editing an existing [!DNL Adobe Launch] configuration fails (NPR-35045).
* Cannot export [!DNL Experience Fragments] to [!DNL Adobe Target] if using IMS configuration and [!DNL Adobe Target Standard] environment (NPR-34555).
* The [!UICONTROL Create] option appears on the [!UICONTROL Audiences] page on navigating from a folder to the [!UICONTROL Audiences] page (NPR-35151).

### Sling {#sling-6570}

* The default login health check validates the credentials of a user that does not exist (NPR-34686).

### Translation Projects {#translation-6570}

* On canceling a translation project in [!DNL Experience Manager], the request to cancel it is not sent to the translation provider (NPR-34433).

### [!DNL Communities] {#communities-6570}

* All the instances of inequitable terminology in the product are replaced with accepted equivalents (NPR-34311).
* [!DNL Google+] is removed from the list of social sharing options (NPR-33877).

### [!DNL Brand Portal] {#brandportal-6570}

* The user interface does not respond on selecting the assets in the [!UICONTROL List View] (NPR-34728).

### [!DNL Forms] {#forms-6570}

>[!NOTE]
>
>[!DNL Experience Manager Forms] releases the add-on packages one week after the scheduled [!DNL Experience Manager] Service Pack release date.

For information on security updates, see [Experience Manager security bulletins page](https://helpx.adobe.com/security/products/experience-manager.html).

## Install 6.5.7.0 {#install}

**Setup requirements and more information**

* AEM 6.5.7.0 requires AEM 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions.
* The service pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html).
* On a deployment with MongoDB and multiple instances, install AEM 6.5.7.0 on one of the Author instances using the Package Manager.

>[!NOTE]
>
>Adobe does not recommend removing or uninstalling the [!DNL Adobe Experience Manager] 6.5.7.0 package.

### Install the Service Pack {#install-service-pack}

Perform the following steps to install the Service Pack on an existing Adobe Experience Manager 6.5 instance:

1. Restart the instance before installation if the instance is in update mode (and this is the case when the instance was updated from an earlier version). Adobe also recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [Experience Manager] instance.

1. Download the service pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.7.zip).

1. Open Package Manager and click **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package and click **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>Dialog on Package Manager UI sometimes exits during the installation of the service pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installations is successful. Typically, this happens on [!DNL Safari] but can intermittently happen on any browser.

**Automatic installation**

There are two ways to automatically install Adobe Experience Manager 6.5.7.0 on a working instance:

A. Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.

B. Use the [HTTP API from Package Manager](https://docs.adobe.com/content/docs/en/crx/2-3/how_to/package_manager.html). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Adobe Experience Manager 6.5.7.0 does not support Bootstrap installation.

**Validate installation**

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.7.0)` under [!UICONTROL Installed Products].

1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.3 or later (Use Web Console: `/system/console/bundles`).

To know the platforms certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

### Install Adobe Experience Manager Forms add-on package {#install-aem-forms-add-on-package}

>[!NOTE]
>
>[!DNL Experience Manager Forms] releases the add-on packages one week after the scheduled [!DNL Experience Manager] Service Pack release date.

>[!NOTE]
>
>Skip if you are not using AEM Forms. Fixes in Adobe Experience Manager Forms are delivered through a separate add-on package.

1. Ensure that you have installed the Adobe Experience Manager Service Pack.
1. Download the corresponding Forms add-on package listed at [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) for your operating system.
1. Install the Forms add-on package as described in [Installing AEM Forms add-on packages](../forms/using/installing-configuring-aem-forms-osgi.md#install-aem-forms-add-on-package).

### Install Adobe Experience Manager Forms on JEE {#install-aem-forms-jee-installer}

>[!NOTE]
>
>Skip if you are not using AEM Forms on JEE. Fixes in Adobe Experience Manager Forms on JEE are delivered through a separate installer.

For information about installing the cumulative installer for Experience Manager Forms on JEE and post-deployment configuration, see the [release notes](jee-patch-installer-65.md).

### UberJar {#uber-jar}

The UberJar for Experience Manager 6.5.7.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.7/).

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM:

```shell
<dependency>
     <groupId>com.adobe.aem</groupId>
     <artifactId>uber-jar</artifactId>
     <version>6.5.7</version>
     <scope>provided</scope>
</dependency>
```

>[!NOTE]
>
>UberJar and the other related artifacts are available on Maven Central Repository instead of Adobe Public Maven repository (`repo.adobe.com`). The main UberJar file is renamed to `uber-jar-<version>.jar`. So, there is no `classifier`, with `apis` as the value, for the `dependency` tag.

## Deprecated features {#removed-deprecated-features}

Below is a list of features and capabilities that are marked as deprecated with [!DNL Experience Manager] 6.5.7.0. Features are marked deprecated initially and later removed in a future release. An alternate option is usually provided.

Review if you use a feature or a capability in a deployment. Also, plan to change the implementation to use an alternate option.

| Area | Feature | Replacement |
|---|---|---|
| Integrations | The **[!UICONTROL AEM Cloud Services Opt-In]** screen is deprecated. With the AEM and Target integration updated in AEM 6.5 to support the Target Standard API, which uses authentication via Adobe IMS and I/O, and the growing role of Adobe Launch for instrumenting AEM pages for analytics and personalization, the Opt-In wizard has become functionally irrelevant. | Configure system connections, Adobe IMS authentication, and Adobe I/O integrations via the respective AEM cloud services. |
| Connectors | The Adobe JCR Connector for Microsoft SharePoint 2010 and Microsoft SharePoint 2013 is deprecated for AEM 6.5. | N/A |

## Known issues {#known-issues}

* Ignore the following errors in the `error.log` file during the installation of Experience Manager 6.5.7.0:

   ```TXT
   com.day.cq.dam.cq-dam-core bundle com.day.cq.dam.cq-dam-core:5.12.276 (331)[com.day.cq.dam.core.impl.collection.CollectionCreationListenerDummy] :  Cannot register component (org.osgi.service.component.ComponentException: The component name 'com.day.cq.dam.core.impl.collection.CollectionCreationListenerDummy' has already been registered by Bundle 331 (com.day.cq.dam.cq-dam-core) as Component of Class com.day.cq.dam.core.impl.collection.CollectionCreationListenerDummy)

   com.day.cq.dam.cq-dam-core bundle com.day.cq.dam.cq-dam-core:5.12.276 (331)[com.day.cq.dam.core.impl.team.MediaPortalShareHandlerDummy(1314)] : Could not load implementation object class com.day.cq.dam.core.impl.team.MediaPortalShareHandlerDummy (java.lang.ClassNotFoundException: com.day.cq.dam.core.impl.team.MediaPortalShareHandlerDummy not found by com.day.cq.dam.cq-dam-core [331])

   com.day.cq.dam.cq-dam-core bundle com.day.cq.dam.cq-dam-core:5.12.276 (331)[com.day.cq.dam.core.impl.collection.CollectionCreationListenerDummy(1316)] : Could not load implementation object class com.day.cq.dam.core.impl.collection.CollectionCreationListenerDummy (java.lang.ClassNotFoundException: com.day.cq.dam.core.impl.collection.CollectionCreationListenerDummy not found by com.day.cq.dam.cq-dam-core [331])

   com.day.cq.dam.cq-dam-core bundle com.day.cq.dam.cq-dam-core:5.12.276 (331)[com.day.cq.dam.core.impl.team.MediaPortaltRoleProviderDummy(1315)] : Could not load implementation object class com.day.cq.dam.core.impl.team.MediaPortaltRoleProviderDummy (java.lang.ClassNotFoundException: com.day.cq.dam.core.impl.team.MediaPortaltRoleProviderDummy not found by com.day.cq.dam.cq-dam-core [331])

   com.day.cq.dam.cq-dam-core bundle com.day.cq.dam.cq-dam-core:5.12.276 (331)BundleComponentActivator : Unexpected failure enabling component holder com.day.cq.dam.core.impl.collection.CollectionCreationListenerDummy (java.lang.IllegalStateException: Could not load implementation object class com.day.cq.dam.core.impl.collection.CollectionCreationListenerDummy)

   com.day.cq.dam.cq-dam-core bundle com.day.cq.dam.cq-dam-core:5.12.276 (331)BundleComponentActivator : Unexpected failure enabling component holder com.day.cq.dam.core.impl.team.MediaPortaltRoleProviderDummy (java.lang.IllegalStateException: Could not load implementation object class com.day.cq.dam.core.impl.team.MediaPortaltRoleProviderDummy)

   com.day.cq.dam.cq-dam-core bundle com.day.cq.dam.cq-dam-core:5.12.276 (331)[com.day.cq.dam.core.impl.team.MediaPortaltRoleProviderDummy] :  Cannot register component (org.osgi.service.component.ComponentException: The component name 'com.day.cq.dam.core.impl.team.MediaPortaltRoleProviderDummy' has already been registered by Bundle 331 (com.day.cq.dam.cq-dam-core) as Component of Class com.day.cq.dam.core.impl.team.MediaPortaltRoleProviderDummy)

   com.day.cq.dam.cq-dam-core bundle com.day.cq.dam.cq-dam-core:5.12.276 (331)[com.day.cq.dam.core.impl.team.MediaPortalShareHandlerDummy] :  Cannot register component (org.osgi.service.component.ComponentException: The component name 'com.day.cq.dam.core.impl.team.MediaPortalShareHandlerDummy' has already been registered by Bundle 331 (com.day.cq.dam.cq-dam-core) as Component of Class com.day.cq.dam.core.impl.team.MediaPortalShareHandlerDummy)

   com.day.cq.dam.cq-dam-core bundle com.day.cq.dam.cq-dam-core:5.12.276 (331)BundleComponentActivator : Unexpected failure enabling component holder com.day.cq.dam.core.impl.team.MediaPortalShareHandlerDummy (java.lang.IllegalStateException: Could not load implementation object class com.day.cq.dam.core.impl.team.MediaPortalShareHandlerDummy)
   ```

* If you are upgrading your [!DNL Experience Manager] instance from 6.5 to 6.5.7.0 version, you can view `RRD4JReporter` exceptions in the `error.log` file. Restart the instance to resolve the issue.

* If you install [!DNL Experience Manager] 6.5 Service Pack 5 or a previous service pack on [!DNL Experience Manager] 6.5, the runtime copy of your assets custom workflow model (created in `/var/workflow/models/dam`) is deleted.
To retrieve your runtime copy, Adobe recommends to synchronize the design-time copy of the custom workflow model with its runtime copy using the HTTP API:
`<designModelPath>/jcr:content.generate.json`.

* Contact Adobe Customer Care if you encounter issues when editing and creating cascading rules in [!UICONTROL Folder Metadata Schema Forms Editor] and [!UICONTROL Metadata Schema Forms Editor] using [!UICONTROL Define Rule] dialog. The rules that are already created and saved are working as expected.

* If a folder in the hierarchy is renamed in [!DNL Experience Manager Assets] and the nested folder containing an asset is published to [!DNL Brand Portal], the title of the folder is not updated in [!DNL Brand Portal] until the root folder is published again.

* When a user selects to configure a field for the first time in an adaptive form, the option to save a configuration does not display in Properties Browser. Selecting to configure some other field of the adaptive form in the same editor resolves the issue.

* If [!UICONTROL Connected assets configuration] wizard returns a 404 error message after installation, manually reinstall the `cq-remotedam-client-ui-content` and `cq-remotedam-client-ui-components` packages using the Package Manager.

* The following errors and warning messages may display during installation of AEM 6.5.x.x:
  * “When the Target integration is configured in AEM using the Target Standard API (IMS authentication), then exporting Experience Fragments to Target results in wrong offer types getting created. Instead of type “Experience Fragment”/source “Adobe Experience Manager,” Target creates several offers with type “HTML”/source “Adobe Target Classic.”
  * `com.adobe.granite.maintenance.impl.TaskScheduler`: No maintenance windows found at granite/operations/maintenance.
  * Adaptive Form server-side validation fails when aggregate functions such as SUM, MAX, and MIN are used. CQ-4274424
  * `com.adobe.granite.maintenance.impl.TaskScheduler` - No maintenance windows found at granite/operations/maintenance.
  * Hotspot in a Dynamic Media interactive image is not visible when previewing the asset through Shoppable Banner viewer.

## OSGi bundles and content packages included {#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in AEM 6.5.7.0:

* [List of OSGi bundles included in AEM 6.5.7.0](assets/6570_bundles.txt)

* [List of Content Packages included in AEM 6.5.7.0](assets/6570_packages.txt)

## Restricted websites {#restricted-sites}

These websites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* See [how to contact customer support](https://experienceleague.adobe.com/docs/customer-one/using/home.html).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] 6.5 release notes](/help/release-notes/release-notes.md)
>* [[!DNL Experience Manager] product page](https://www.adobe.com/marketing/experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/docs/experience-manager-65.html)
>* Subscribe to [Adobe priority product updates](https://www.adobe.com/subscription/priority-product-update.html)

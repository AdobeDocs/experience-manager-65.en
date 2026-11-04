---
title: Release Notes for [!DNL Adobe Experience Manager] 6.5
description: Find release information, what's new, install how-tos, and a detailed change list for [!DNL Adobe Experience Manager] 6.5.
mini-toc-levels: 4
solution: Experience Manager
feature: Release Information
contentOwner: Rick Brough
role: User,Admin,Developer
exl-id: 811fccbc-6f63-4309-93c8-13b7ace07925
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
feature_v2:
  - id: ed762d86-a04b-452b-a08f-86359bb8ff27
    internal-label: Configuration and operations
subfeature_v2:
  - id: c21ccc2b-e0c8-4853-bf41-f12259ed93f8
    internal-label: Release information
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# [!DNL Adobe Experience Manager] 6.5 Latest Service Pack Release Notes {#aem-service-pack-release-notes}

<!-- For an itemized list of all issues found in this release information, see the following spreadsheet: https://adobe-my.sharepoint.com/:x:/r/personal/anujkapo_adobe_com/_layouts/15/Doc.aspx?sourcedoc=%7B3ea81ae4-e605-4153-b132-f2698c86f84e%7D&action=edit&wdinitialsession=d8c7b903-87fc-4f2d-9ef2-542a82169570&wdrldsc=3&wdrldc=1&wdrldr=SessionMemoryQuotaExceededDuringSession -->

<!--
DO NOT DELETE THIS HIDDEN NOTE!      DO NOT DELETE THIS HIDDEN NOTE!
>[!NOTE]
>
>Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the add-on packages release Thursday, May 29, 2025. In addition, a list of Forms fixes and enhancements is added to this section.
-->

## Release summary {#release-information}

| Product | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.26.0 <!-- UPDATE FOR EACH NEW RELEASE -->                     |
| Type     | Service Pack release         |
| Date     | November 19, 2026 <!-- UPDATE FOR EACH NEW RELEASE -->              |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.25.0.zip) <!-- UPDATE FOR EACH NEW RELEASE -->|


<!-- REWRITE AI GENERATED SUMMARY OF NOTES BELOW FOR EACH NEW SERVICE PACK RELEASE -->

Experience Manager 6.5.25.0 includes new features, key customer-requested enhancements, and bug fixes. It also includes performance, stability, and security improvements built on the 6.5 foundation available since April 2019.




<!-- UPDATE FOR EACH NEW RELEASE -->

### Key features and enhancements for Forms



## Fixed issues in Service Pack 25 {#fixed-issues}

<!-- 6.5.25.0 REVIEWERS: WHAT ARE THE KEY FEATURES AND ENHANCEMENTS THAT YOU WANT TO HIGHLIGHT IN THIS RELEASE? -->

<!-- UPDATE BELOW FOR EACH NEW RELEASE --> 


### [!DNL Sites]{#sites-6526}

#### Accessibility {#sites-accessibility-6526}

* (SITES-25359) CRITICAL


* Authors can now see the active Format ("T") button in the Text component inline menu. After authors applied bold or italic formatting, the button icon stayed dark against a dark-grey background and missed the WCAG 2.1 AA minimum contrast ratio of 4.5:1. The updated CSS lightens the icon, which restores the contrast that earlier service packs provided. (SITES-51864) MAJOR


* (SITES-24525)
* (SITES-24650)
* (SITES-24706)
* (SITES-24723)
* (SITES-24732)
* (SITES-24772)
* (SITES-24967)
* (SITES-24986)
* (SITES-24987)
* (SITES-25210)
* (SITES-25213)
* (SITES-25214)
* (SITES-25217)
* (SITES-25253)
* (SITES-25263)
* (SITES-25307)
* (SITES-25308)
* (SITES-25318)
* (SITES-25364)
* (SITES-25367)
* (SITES-25372)
* (SITES-25377)
* (SITES-25523)
* The Components list in the Page Editor side panel no longer takes keyboard focus. Keyboard users select and move components with the controls in the content window, so the side panel list duplicated the function. A note under the component filter tells keyboard users where to find the controls. (SITES-40752)


#### Admin User Interface{#sites-adminui-6526}



#### Classic UI{#sites-classicui-6526}


* Authors can activate pages again in the Classic UI Sites console (`siteadmin.html`). Previously, the Activate Page button displayed a "Loading" spinner indefinitely and never triggered replication, because a failed tracking script halted the click handler. The click handler now runs without error and completes the activation. (SITES-52165)
* The Indonesian language code now displays as ID in the Language Copy properties. Previously, the References rail showed the legacy code IN for pages under the Indonesian language root. The cq-wcm-core bundle update corrects the value, so the code matches the ISO standard. (SITES-44918)




#### Component Console{#sites-component-console-6526}



#### [!DNL Content Fragments]{#sites-contentfragments-6526}



#### [!DNL Content Fragments] - Admin{#sites-admin-6526}



#### [!DNL Content Fragments] - Fragment Editor{#sites-fragments-editor-6526}

* The Edit Content Fragment button appears immediately for each reference in a multifield in the Content Fragment editor. Previously, the button stayed hidden until authors saved the parent fragment, and it did nothing after they opened the Path Browser. The editor now builds the action list on first render, so authors open referenced fragments without extra steps. (SITES-43733) MAJOR



* Chinese, Japanese, and Korean characters no longer display in italics in the placeholder text of the Create Content Fragment dialog. Previously, the italic style applied to CJK characters under **Assets** > **Files**, which made the text hard to read. The updated styles skip italics for CJK languages. (SITES-43548)
* The Content Fragment editor validates fields correctly after the Granite UI update. A recent Granite UI change caused a regression, so the editor client libraries no longer matched the new validation behavior. The adapted libraries and tests resolve the mismatch. (SITES-46650)



#### [!DNL Content Fragments] - GraphQL API {#sites-graphql-api-6526}

* GraphQL queries on content fragments now recognize RemoteRef references to Dynamic Media with OpenAPI assets. Previously, queries failed with a "Persisted Query Validation Error" and returned no asset data when AEM 6.5 Sites consumed AEM as a Cloud Service assets. Responses now include the repository ID and asset ID, so clients can build delivery URLs. (SITES-48507) CRITICAL

* Publish instances stay responsive during heavy GraphQL traffic. Lock contention in GraphQLServiceImpl held request-processing threads at the schema methods, which stalled requests and forced restarts. Improved synchronization removes the bottleneck and keeps sites and mobile apps available. (SITES-48699) MAJOR

* The message on the GraphQL Endpoints page stays localized after you reload the page. Previously, the "No endpoints were found" message appeared in your language when you created and deleted endpoints, but it reverted to English after a reload. The page now loads the translated string on every visit. (SITES-43586)



#### [!DNL Content Fragments] - GraphQL Query Editor{#sites-graphql-query-editor-6526}



#### [!DNL Content Fragments] - Models & Model Editor{#sites-models-model-editor-6526}

* Thumbnails for content fragment models display in **Tools** > **General** > **Content Fragment Models** when the configuration name contains localized characters, such as "español テスト". Previously, the uploaded thumbnail didn't appear because the characters broke the path. The updated handling encodes the name correctly. (SITES-39242) MAJOR



* The Field Label string on the canvas of the Content Fragment Model Editor now appears in the user's language. Previously, the label stayed in English after authors dragged a component onto the canvas, and it translated only after they saved and reopened the model. The label now translates right away, matching the Properties panel. (SITES-45383)



#### [!DNL Content Fragments] - REST API{#sites-restapi-6526}



#### ContextHub{#sites-contexthub-6526}



#### Core Backend{#sites-core-backend-6526}

* Scheduled page activation through On-Off-Time now runs only when needed. `OnOffTriggerProcessor` previously triggered replication and cache invalidation too often, which forced authors to republish content by hand. The backported fix removes the unnecessary processing and restores reliable scheduled publishing. (SITES-48483) MAJOR

* File upload works for remote assets from Next-gen Asset Management in a multifield. Previously, the upload failed when authors picked a remote asset for a field inside a multifield. The Core Components update restores the upload flow, so the field accepts the asset. (SITES-44266)



#### Core Components{#sites-core-components-6526}

* The Remote Asset Picker keeps each multifield item's image separate. Previously, selecting an image in one multifield item applied it to every other item, and the remote asset reference didn't save. Each item now holds its own selection, and the reference persists after you save the dialog box. (SITES-42376) MAJOR


* (SITES-43738)

#### Campaign integration{#sites-campaign-integration-6526}



#### ContentHub {#sites-contenthub-6526}



#### Crosswalk {#sites-crosswalk-6526}



#### Experience Fragments{#sites-experiencefragments-6526}



#### Foundation Components (Legacy){#sites-foundation-components-legacy-6526}



#### Headless - Admin {#sites-headless-admin-6526}


* Enhancement: The Preview view in the Headless Admin now passes the selected variation path to the preview component. This change ensures that previews of content fragments with multiple variations load content from the correct variation. The `draftFragmentIds` array includes the variation parameter. (SITES-42714)



#### Launches{#sites-launches-6526}

* After an upgrade to AEM 6.5 LTS, `error.log` no longer fills with repeated content-type WARN messages from the Page References `livecopy.jsp`. The Sling engine logged a warning each time the include set the `Content-Type` header during `RequestDispatcher.include()`. The updated Granite References core bundle removes the header change, so the log shows only real errors. (SITES-46756) CRITICAL


* (SITES-13389)
* The Select Path of Launch Source placeholder in the Launches filter panel displays in full. Previously, the text was cut off in localized interfaces, such as French, Italian, and Portuguese, because it didn't fit the field. The updated layout shows the complete placeholder. (SITES-42792)
* The Live Date column in Tools > Sites > Launches no longer shows AM or PM in the German, French, Spanish, Italian, Brazilian Portuguese, and Traditional Chinese locales. Previously, the column used a 12-hour format that doesn't match those locales. The column now displays the 24-hour format. (SITES-43178)



#### Link Checker{#sites-link-checker-6526}




#### Localization{#sites-localization-6526}
* ()
* ()
* ()
* (NPR-44840)
* (NPR-44841)
* (NPR-44842)
* (NPR-44843)
* (NPR-44844)
* (NPR-44845)
* (NPR-44846)
* (NPR-44847)
* (NPR-44848)
* (NPR-44942)
* (SITES-7579)
* (SITES-14969)


* (SITES-15058)
* (SITES-15058)
* (SITES-17333)
* (SITES-17475)
* (SITES-21481)
* (SITES-38567)
* The tooltip "to exit text editor press Esc key" now appears in the user's language in the Text component configure dialog box. Previously, the string displayed in English because the localization resources lacked it. The tooltip now translates in all locales. (SITES-43186)
* The STRUCTURE label in the Template Editor now appears in the user's language. Previously, the label stayed in English when authors opened an Adaptive Form template, because the string was missing from the localization resources. The label now translates in all locales. (SITES-43599)



#### MSM - Live Copies{#sites-msm-live-copies-6526}

* The MSM Rollout dialog box loads the live copy list again after an upgrade. Previously, a `NullPointerException` in `AsyncOperationServlet.doGet` stopped the dialog box on a spinner, so authors couldn't select target locales or start the rollout. An updated `com.adobe.granite.jobs.async` bundle handles the missing job data and finishes the request. (SITES-43116) MAJOR
* Rollout from the editable toolbar on a blueprint page works again. The toolbar action failed with "Cannot read properties of undefined (reading 'doRollout')" because the `MSM.Rollout` client library did not load. The updated page now loads the library, so the rollout job starts and changes reach the live copies. (SITES-46052) MAJOR


* Batch deactivation of a blueprint page and its child pages no longer sends duplicate rollout events. When you deactivated a parent and its children in one request, the replication system emitted five events instead of three, and each child page rolled out twice. Deduplication in the rollout manager now submits one rollout per page, so live copies receive no redundant packages. (SITES-44988)



#### Page Editor{#sites-pageeditor-6526}

* (SITES-30874) MAJOR



* Authors can edit pages in Layout mode when parent and child components define different responsive breakpoints. The getResponsiveCssClasses function previously failed with a TypeError on components that omitted the cq:responsive/phone width. The function now falls back to available values and continues rendering. (SITES-46681)
* Custom crop ratios now load in hybrid inline-editing mode for components with multiple image drop targets. Previously, the Image Editor initialized one generic ipeConfig for all drop targets, so the editor showed only the default ratios and ignored each target's aspectRatios. The editor now reads the configuration for the selected drop target, and the crop applies in both inline and fullscreen views. (SITES-45771)

* (SITES-15883)

#### Replication{#sites-replication-6526}



#### Rich Text Editor{#sites-rte-6526}


* Rich Text Editor toolbar buttons, such as Bold, Italic, Underline, and Hyperlink, work in Responsive view and Layout mode. Previously, the buttons highlighted when clicked, but the selection stayed unchanged and no dialog opened. The updated editor script applies the formatting, matching the behavior in Edit mode. (SITES-44233) MAJOR
* Authors can add currency and trademark symbols to Text components without losing them. The Special Characters plug-in inserted the symbols, but they displayed as blanks in both the editor and the published output. The corrected handling renders each symbol as entered. (SITES-46532) MAJOR
* The Full Screen icon in the Rich Text Editor toolbar expands the editor again. Previously, clicking the icon in the Core Text component did nothing, and the editor stayed at its inline size. Authors now get a distraction-free workspace for long-form content in both inline and dialog editing. (SITES-46396) MAJOR



#### Site Admin UI




* Reverting an asset to an earlier version now refreshes its card thumbnail. A URL-encoding change in the Timeline client library caused a path mismatch, so the card lookup failed and the thumbnail stayed stale. Matching the encoded and raw paths restores the refresh. (SITES-46590)



#### Universal editor {#sites-universal-editor-6526}



#### Workflow extensions {#sites-workflow-extensions-6526}

* View Payload now opens the Touch UI package editor for workflows that Manage Publication starts for multiple pages. Previously, the action opened the deprecated Classic UI package editor, even though authors started the workflow in Touch UI. Authors now inspect the payload without leaving Touch UI. (SITES-40928) MAJOR



### [!DNL Assets] {#assets-6526}



#### [!DNL Dynamic Media]{#assets-dm-6526}



### [!DNL Forms]{#forms-6526}



#### Forms JEE {#forms-jee-6526}



#### Forms Designer {#forms-designer-6526}




### Foundation {#foundation-6526}

#### Apache Felix {#foundation-apachefelix-6526}



#### Campaign{#foundation-campaign-6526}



#### Cloud Services{#foundation-cloudservices-6526}



#### Communities {#foundation-communities-6526}



#### Content distribution{#foundation-content-distribution-6526}



#### Adobe CRX {#foundation-crx-6526}



#### Granite{#foundation-granite-6526}



#### Integrations{#foundation-integrations-6526}



#### Jetty{#foundation-jetty-6526}



#### Localization{#foundation-localization-6526}



#### Oak {#foundation-oak-6526}



#### Platform{#foundation-platform-6526}



#### Security{#foundation-security-6526}



#### Sling{#foundation-sling-6526}



#### SPA editor {#foundation-spa-editor-6526}



#### Translation{#foundation-translation-6526}



#### User interface{#foundation-ui-6526}



#### WCM{#foundation-wcm-6526}



#### Workflow{#foundation-workflow-6526}



## Install [!DNL Experience Manager] 6.5.25.0{#install}

<!-- Remaining content from here to bottom stays the same except for version updating as needed as per update team feedback. -->

* [!DNL Experience Manager] 6.5.26.0 requires [!DNL Experience Manager] 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions. <!-- UPDATE FOR EACH NEW RELEASE -->
* The Service Pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.25.0.zip).
* On a deployment with MongoDB and multiple instances, install [!DNL Experience Manager] 6.5.26.0 on one of the Author instances using the Package Manager.<!-- UPDATE FOR EACH NEW RELEASE -->

>[!IMPORTANT]
>
> Adobe does not recommend that you remove or uninstall the [!DNL Experience Manager] 6.5.26.0 package. To roll back if necessary, create a backup of the `crx-repository` before you install the pack. <!-- UPDATE FOR EACH NEW RELEASE -->

<!-- FORMS For instructions to install Service Pack for Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md). -->

### Install the Service Pack on [!DNL Experience Manager] 6.5{#install-service-pack}

1. Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the Service Pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.25.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->

1. Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. For more information, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package, then select **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>The dialog box on the Package Manager UI sometimes exits during the installation of the Service Pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before confirming that the installation is successful. Typically, this issue occurs in the [!DNL Safari] browser but can intermittently occur in any browser.

**Automatic installation**

There are two different methods that you can use to install [!DNL Experience Manager] 6.5.26.0.<!-- UPDATE FOR EACH NEW RELEASE -->

* Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.
* Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Experience Manager 6.5.26.0 does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->

**Validate the installation**

For the platforms that are certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.26.0)` under [!UICONTROL Installed Products]. <!-- UPDATE FOR EACH NEW RELEASE -->

1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.20 or later (Use Web Console: `/system/console/bundles`). <!-- OAK Oak oak VERSION -MAY- NEED TO BE UPDATED FOR EACH NEW RELEASE. CHECK WITH SAMEER DHAWAN -->

### Install Service Pack for [!DNL Experience Manager] Forms{#install-aem-forms-add-on-package}

For instructions to install the Service Pack on Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md).

>[!NOTE]
>
>The Adaptive Forms feature, available in [AEM 6.5 QuickStart](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/implementing/deploying/deploying/deploy), is designed for exploration and evaluation purposes only. For production use, it is essential to obtain a valid license for AEM Forms, as Adaptive Forms functionality requires proper licensing.

### Install GraphQL Index Package for Experience Manager Content Fragments{#install-aem-graphql-index-add-on-package}

Customers using GraphQL must install the [Experience Manager Content Fragment with GraphQL Index Package 1.1.1](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/cfm-graphql-index-def-1.1.1.zip). 

This lets you add the required index definition based on the features used.

Failure to install this package results in slow or failed GraphQL queries.

>[!NOTE]
>
>Only install this package once per instance; it does not need to be reinstalled with every Service Pack.

### UberJar{#uber-jar}

The UberJar for [!DNL Experience Manager] 6.5.26.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.25/). <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM: <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

  ```shell
    <dependency>
    <groupId>com.adobe.aem</groupId>
    <artifactId>uber-jar</artifactId>
    <version>6.5.26</version>
    <scope>provided</scope>          
    </dependency>
  ```

>[!NOTE]
>
>UberJar and the other related artifacts are available on Maven Central Repository instead of Adobe Public Maven repository (`repo.adobe.com`). The main UberJar file is renamed to `uber-jar-<version>.jar`. So, there is no `classifier`, with `apis` as the value, for the `dependency` tag.



## Deprecated and removed features{#removed-deprecated-features}

See [Deprecated and removed features](/help/release-notes/deprecated-removed-features.md) for a detailed list of all features deprecated or removed for AEM 6.5.

### Content Fragment support in the AEM Assets REST API {#cf-support-assets-rest-api}

AEM 6.5 LTS SP2 provides modern OpenAPIs for Content Fragment and Model Management, so the older Content Fragment Support endpoints in the AEM Assets REST API are now deprecated.

Adobe intends to keep these older endpoints available until an end-of-life announcement. Adobe does not plan further enhancements for the deprecated endpoints.

### SPA Editor {#spa-editor}

[The SPA Editor](/help/sites-developing/spa-overview.md) has been deprecated for new projects starting with release 6.5.25 of AEM 6.5. The SPA Editor remains supported for existing projects, but should not be used for new projects.

The preferred editors for managing headless content in AEM are now:

* [The Universal Editor](/help/sites-developing/universal-editor/introduction.md) for visual editing.
* [The Content Fragment Editor](/help/sites-developing/universal-editor/introduction.md) for form-based editing.

## Known issues{#known-issues}

<!-- THESE KNOWN ISSUES CARRY OVER EACH RELEASE. THE "PRODUCT UPDATES TEAM" IS SUPPOSED TO VERIFY EACH ISSUE AND LET YOU KNOW IF ANYTHING NEEDS TO BE ADDED, DELETED, OR CHANGED IN THIS LIST. -->

* **Related to Oak**
  From Service Pack 13 and above, the following error log has begun to appear which affects the persistence cache:

  ```shell
  org.h2.mvstore.MVStoreException: The write format 1 is smaller than the supported format 2 [2.0.202/5]
  at org.h2.mvstore.DataUtils.newMVStoreException(DataUtils.java:1004)
      at org.h2.mvstore.MVStore.getUnsupportedWriteFormatException(MVStore.java:1059)
      at org.h2.mvstore.MVStore.readStoreHeader(MVStore.java:878)
      at org.h2.mvstore.MVStore.<init>(MVStore.java:455)
      at org.h2.mvstore.MVStore$Builder.open(MVStore.java:4052)
      at org.h2.mvstore.db.Store.<init>(Store.java:129)
  ```

  Or

  ```shell
  org.h2.mvstore.MVStoreException: The write format 1 is smaller than the supported format 2 [2.1.214/5].
  ```

  To resolve this exception, do the following:

    1. Delete the following two folders from `crx-quickstart/repository/`

        * `cache`
        * `diff-cache`

    1. Install the Service Pack, or restart Experience Manager as a Cloud Service. 
      New folders of `cache` and `diff-cache` are automatically created and you no longer experience an exception related to `mvstore` in the `error.log`.

* Update your GraphQL queries that used a custom API name for your content model to use the default name of the content model instead.

* A GraphQL query uses the `damAssetLucene` index instead of the `fragments` index. This action results in GraphQL queries that fail or take a long time to run.

  To correct the problem, `damAssetLucene` has to be configured to include the following two properties under `/indexRules/dam:Asset/properties`:

  * `contentFragment`
    * `jcr:primaryType="nt:unstructured"`
    * `name="jcr:content/contentFragment"`
    * `propertyIndex="{Boolean}true"`
    * `type="Boolean"`
  * `model`
    * `jcr:primaryType="nt:unstructured"`
    * `name="jcr:content/data/cq:model"`
    * `ordered="{Boolean}true"`
    * `propertyIndex="{Boolean}true"`
    * `type="String"`

  After the index definition is changed, a reindexing is required (`reindex` = `true`).

  After these steps, the GraphQL queries perform faster.

* When trying to move, delete, or publish either Content Fragments, Sites, or Pages, there is an issue when Content Fragment references are fetched. The background query fails; the functionality does not work.
  To ensure correct operation, you must add the following properties to the index definition node `/oak:index/damAssetLucene` (no reindexing is required):

   ```xml
   "tags": [
       "visualSimilaritySearch"
     ]
   "refresh": true
   ```

* If you upgrade your [!DNL Experience Manager] instance from 6.5.0 - 6.5.4 to the latest Service Pack on Java&trade; 11, you see `RRD4JReporter` exceptions in the `error.log` file. To stop the exceptions, restart your instance of [!DNL Experience Manager]. <!-- THIS BULLET POINT WAS UPDATED AS PER CQDOC-20021, JANUARY 23, 2023 --> 

* Users can rename a folder in [!DNL Assets] and publish a nested folder to [!DNL Brand Portal]. However, the title of the folder is not updated in [!DNL Brand Portal] until the root folder is republished.

* The following errors and warning messages appear during installation of [!DNL Experience Manager] 6.5.x.x:
  * "When the Adobe Target integration is configured in [!DNL Experience Manager] using the Target Standard API (IMS authentication), then exporting Experience Fragments to Target results in wrong offer types getting created. Instead of type "Experience Fragment"/source "Adobe Experience Manager," Target creates several offers with type "HTML"/source "Adobe Target Classic."
  * `com.adobe.granite.maintenance.impl.TaskScheduler`: No maintenance windows found at `granite/operations/maintenance`.
  * Adaptive Form server-side validation fails when aggregate functions such as SUM, MAX, and MIN are used (CQ-4274424).
  * `com.adobe.granite.maintenance.impl.TaskScheduler` : No maintenance windows found at `granite/operations/maintenance`.
  * The hotspot in a Dynamic Media interactive image is not visible when previewing the asset through the Shoppable Banner viewer.
  * `com.adobe.cq.social.cq-social-jcr-provider bundle com.adobe.cq.social.cq-social-jcr-provider:1.3.5 (395)[com.adobe.cq.social.provider.jcr.impl.SpiSocialJcrResourceProviderImpl(2302)]` : Timeout waiting for register change to complete unregistered.

* Starting with AEM 6.5.15, the Rhino JavaScript Engine provided by the `org.apache.servicemix.bundles.rhino` bundle has a new hoisting behavior. Scripts that use the strict mode (`use strict;`) have to declare their correct variables. Otherwise, they do not get run, and end up throwing a runtime error.
 
* Installing tagging related standard content by way of an official update package resets the languages property of the `/content/cq:tags` node to default. This action is true for Service Packs, Security Service Packs, Extended Feature Packs, Cumulative Feature Packs, patches, and so on. Therefore, it is necessary to add it from the properties before installation.

### Known issue for AEM Sites {#known-issues-aem-sites-6526}

Content Fragments-Preview fails due to DoS protection for a large tree of fragments. See the [KB article about Default GraphQL Query Executor configuration options](https://experienceleague.adobe.com/en/docs/experience-cloud-kcs/kbarticles/ka-23945) (SITES-17934)

### Known issues for AEM Forms {#known-issues-aem-forms-6526}

When a form containing a **File Attachment** field that uses `bindref` is submitted to an AEM Workflow with an **Assign Task** step, the attachments are not displayed. As a result, they do not appear when the task is opened from the Inbox. The files are saved correctly to the repository but the Assign Task step UI fails to display the attachments. (FORMS-23722)

* **FORMS-28517** When a digitally signed PDF is attached to a task in AEM Forms JEE Workspace, the upload remains stuck in the uploading state or fails with an "Invalid File" error. As a result, larger, signed PDF attachments cannot be added to the task. This issue is fixed in a later version. For a hotfix on the current/existing version, please contact Adobe Support.

#### Known issues with Hotfixes available {#aem-forms-issues-with-hotfixes}

The following issues have a hotfix available for download and installation. You can [download and install the Hotfix](/help/release-notes/aem-forms-hotfix.md) to resolve these issues:

* After installing AEM 6.5 Service Pack 25 on WAR/JEE deployments (including AEM Forms on JEE), the `com.adobe.cq.screens.sessions` bundle remains in the Installed state and never becomes Active. To resolve this issue, [download and install the hotfix](/help/release-notes/aem-forms-hotfix.md) for AEM Service Pack 6.5.25.0. (NPR-44100)
* After the SOAP SDK authentication hardening, LCM Configuration Manager, Workbench, and Designer fail to connect to the AEM Forms on JEE server with error `ALC-LCM-200-001` because the `/soap/sdk` endpoint rejects unauthenticated requests. To resolve this issue, [download and install the hotfix](/help/release-notes/aem-forms-hotfix.md) for AEM Service Pack 6.5.25.0. (FORMS-26802)
* On AEM Forms Document Security, authentication cookies are dropped after a Microsoft Entra ID (MFA) redirect, causing a "Cookies are not enabled" error when opening policy-protected documents. To resolve this issue, [download and install the hotfix](/help/release-notes/aem-forms-hotfix.md) for AEM Service Pack 6.5.25.0. (FORMS-26679)
* [!DNL AEM Forms] on [!DNL JEE] [!DNL WebLogic] database settings fail with "No suitable driver found" using the Microsoft SQL Server JDBC driver 12.10.0. To resolve this issue, [download and install the hotfix](/help/release-notes/aem-forms-hotfix.md) for AEM Service Pack 6.5.25.0. (FORMS-26617)
* PDFs open slowly after installing the latest AEM Forms 6.5 build. To resolve this issue, [download and install the hotfix](/help/release-notes/aem-forms-hotfix.md) for AEM Service Pack 6.5.25.0. (FORMS-27869)
* CVE-2025-64775, an Apache Struts denial-of-service vulnerability in multipart request processing, affects AEM Forms 6.5.24.0 JEE deployments (JBoss, WebLogic, WebSphere). To resolve this issue, [download and install the hotfix](/help/release-notes/aem-forms-hotfix.md) for AEM Service Pack 6.5.24.0. (FORMS-23491)
* After installing AEM Forms JEE Service Pack 21 (6.5.21.0), if you find duplicate entries of Geode jars `(geode-*-1.15.1.jar and geode-*-1.15.1.2.jar)` under the `<AEM_Forms_Installation>/lib/caching/lib` folder, perform the following steps to resolve the issue (FORMS-14926):

  1. Stop the locators, if they are running.
  2. Stop the AEM Server. 
  3. Go to the `<AEM_Forms_Installation>/lib/caching/lib`. 
  4. Remove all the Geode patch files except `geode-*-1.15.1.2.jar`. Confirm that only the Geode jars with `version 1.15.1.2` are present.
  5. Open the command prompt in admin mode.  
  6. Install the Geode patch using the `geode-*-1.15.1.2.jar` file. 

## OSGi bundles and content packages included{#osgi-bundles-and-content-packages-included}

The following zip files contain the text documents that list the OSGi bundles and Content Packages included in this [!DNL Experience Manager] 6.5 Service Pack release:

* [List of OSGi bundles included in Experience Manager 6.5.26.0](/help/release-notes/assets/65250-bundles.zip) 
<!-- UPDATE FOR EACH NEW RELEASE -->
* [List of Content Packages included in Experience Manager 6.5.26.0](/help/release-notes/assets/65250-packages.zip) 
<!-- UPDATE FOR EACH NEW RELEASE -->

## Restricted websites{#restricted-sites}

These websites are available to customers only. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact Adobe Customer Support](https://experienceleague.adobe.com/en/docs/support-resources/adobe-support-tools-guide/adobe-customer-support-experience#).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] product page](https://business.adobe.com/products/experience-manager/adobe-experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/en/docs/experience-manager-65)
>* [Subscribe to Adobe Priority product updates](https://www.adobe.com/subscription/priority-product-update.html)





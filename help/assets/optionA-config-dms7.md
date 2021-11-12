---
title: OPTION A - Configure Dynamic Media - Scene7 mode
description: Learn how to configure Dynamic Media - Scene7 mode.
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
docset: aem65
role: User, Admin
mini-toc-levels: 3
hide: yes
hidefromtoc: yes
feature: Configuration,Scene7 Mode
exl-id: 
---
# OPTION A - Configure Dynamic Media - Scene7 mode{#configuring-dynamic-media-scene-mode}

>[!NOTE]
>
>OPTION A - THE TWO NEW TOPICS I WROTE ARE DELETED. BUT BEFORE DELETING THE TOPICS, ALL THEIR CONTENT WAS MOVED INTO THIS TOPIC, INTO THE RESPECTIVE AREAS WHERE I ALREADY TALK ABOUT GENERAL SETTINGS AND PUBLISH SETUP.  

If you use Adobe Experience Manager set up for different environments, such as development, staging, and production, configure Dynamic Media Cloud Services for each one of those environments.

## Architecture diagram of Dynamic Media - Scene7 mode {#architecture-diagram-of-dynamic-media-scene-mode}

**RICK: KEEP AS IS**

The following architecture diagram describes how Dynamic Media - Scene7 mode works.

With the new architecture, Experience Manager is responsible for primary source assets and synchs with Dynamic Media for asset processing and publishing:

1. When the primary source asset is uploaded to Experience Manager, it is replicated to Dynamic Media. At that point, Dynamic Media handles all asset processing and rendition generation, such as video encoding and dynamic variants of an image. 
(In Dynamic Media - Scene7 mode, the default upload file size is 2 GB or less. To enable upload file sizes of 2 GB up to 15 GB, see [(Optional) Configure Dynamic Media - Scene7 mode for upload of assets larger than 2 GB](#optional-config-dms7-assets-larger-than-2gb).)
1. After the renditions are generated, Experience Manager can securely access and preview the remote Dynamic Media renditions (no binaries are sent back to the Experience Manager instance).
1. After content is ready to be published and approved, it triggers the Dynamic Media service to push content out to delivery servers and cache content at the CDN (Content Delivery Network).

![chlimage_1-550](assets/chlimage_1-550.png)

>[!IMPORTANT]
>
>The following list of features requires that you use the out-of-the-box CDN that is bundled with Adobe Experience Manager - Dynamic Media. Any other custom CDN is not supported with these features.
>
>* [Smart Imaging](/help/assets/imaging-faq.md)
>* [Cache invalidation](/help/assets/invalidate-cdn-cache-dynamic-media.md)
>* [Hotlink protection](/help/assets/hotlink-protection.md)
>* [HTTP/2 delivery of content](/help/assets/http2.md)
>* URL redirect at the CDN level
>* Akamai ChinaCDN (for optimal delivery in China)

## Enable Dynamic Media in Scene7 mode {#enabling-dynamic-media-in-scene-mode}

**RICK: KEEP AS IS**

[Dynamic Media](https://business.adobe.com/products/experience-manager/assets/dynamic-media.html) is disabled by default. To take advantage of Dynamic Media features, you must enable it.

>[!WARNING]
>
>Dynamic Media - Scene7 mode is for the *Experience Manager Author instance only*. As such, you must configure `runmode=dynamicmedia_scene7` on the Experience Manager Author instance, *not* the Experience Manager Publish instance.

To enable Dynamic Media, you must start up Experience Manager using the `dynamicmedia_scene7` run mode from the command line by entering the following in a terminal window (example port used is 4502):

```shell
java -Xms4096m -Xmx4096m -Doak.queryLimitInMemory=500000 -Doak.queryLimitReads=500000 -jar cq-quickstart-6.5.0.jar -gui -r author,dynamicmedia_scene7 -p 4502
```

## (Optional) Migrate Dynamic Media presets and configurations from 6.3 to 6.5 Zero Downtime {#optional-migrating-dynamic-media-presets-and-configurations-from-to-zero-downtime}

**RICK: KEEP AS IS**

Upgrading Experience Manager Dynamic Media from 6.3 to 6.4 or 6.5 now includes the ability for zero downtime deployments. To migrate all your presets and configurations from `/etc` to `/conf` in CRXDE Lite, be sure you run the following curl command.

>[!NOTE]
>
>If you run your Experience Manager instance in compatibility mode &ndash; that is, you have the compatibility packaged installed &ndash; you do not need to run these commands.

For all upgrades, either with or without the compatibility package, you can copy the default, out-of-the-box viewer presets that originally came with Dynamic Media by running the following Linux® curl command:

`curl -u admin:admin -X POST https://<server_address>:<server_port>/libs/settings/dam/dm/presets/viewer.pushviewerpresets.json`

To migrate any custom viewer presets and configurations that you have created from `/etc` to `/conf`, run the following Linux® curl command:

`curl -u admin:admin -X POST https://<server_address>:<server_port>/libs/settings/dam/dm/presets.migratedmcontent.json`

## Install feature pack 18912 for bulk asset migration {#installing-feature-pack-for-bulk-asset-migration}

**RICK: KEEP AS IS**

The installation of feature pack 18912 is *optional*.

Feature pack 18912 lets you either bulk ingest assets by way of FTP, or migrate assets from either Dynamic Media - Hybrid mode or Dynamic Media Classic into Dynamic Media - Scene7 mode on Experience Manager. It is available from [Adobe Professional Services](https://business.adobe.com/customers/consulting-services/main.html).

See [Install feature pack 18912 for bulk asset migration](/help/assets/bulk-ingest-migrate.md) for more information.

## Create a Dynamic Media Configuration in Cloud Services {#configuring-dynamic-media-cloud-services}

**RICK: KEEP AS IS**

**Before you configure Dynamic Media** - After you receive your provisioning email with Dynamic Media credentials, you must open the [Dynamic Media Classic desktop application](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/getting-started/signing-out.html#getting-started), then sign in to your account to change your password. The password provided in the provisioning email is system-generated and intended to be a temporary password only. It is important that you update the password so that Dynamic Media Cloud Service is set up with the correct credentials.

   ![dynamicmediaconfiguration2updated](assets/dynamicmediaconfiguration2updated.png)

**To create a Dynamic Media Configuration in Cloud Services:**

1. In Experience Manager Author mode, select the Experience Manager logo to access the global navigation console and select the Tools icon, then go to **[!UICONTROL Cloud Services]** > **[!UICONTROL Dynamic Media Configuration]**.
1. On the Dynamic Media Configuration Browser page, in the left pane, select **[!UICONTROL global]** (do not select the folder icon to the left of **[!UICONTROL global]**), then select **[!UICONTROL Create]**.
1. On the **[!UICONTROL Create Dynamic Media Configuration]** page, enter a title, the Dynamic Media account email address, password, then select your region. This information is provided to you by Adobe in the provisioning email. Contact Adobe Customer Support if you did not receive the email.

   Select **[!UICONTROL Connect to Dynamic Media]**.

   >[!NOTE]
   >
   >**RICK: KEEP AS IS??** After you receive your provisioning email with Dynamic Media credentials, open the [Dynamic Media Classic desktop application](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/getting-started/signing-out.html#getting-started), then sign in to your account to change your password. The password provided in the provisioning email is system-generated and intended to be a temporary password only. It is important that you update the password so that Dynamic Media Cloud Service is set up with the correct credentials.

1. When the connection is successful, set the following. Headings with an asterisk (*) are required:

    * **[!UICONTROL Company]** - the name of the Dynamic Media account. You have multiple Dynamic Media accounts. For example, you could have different subbrands, divisions, staging, or production environments.

    * **[!UICONTROL Company Root Folder Path]**

    * **[!UICONTROL Publishing Assets]** - You can choose from the following three options:
      * **[!UICONTROL Immediately]** means that when assets are uploaded, the system ingests the assets and provides the URL/Embed instantly. There is no user intervention necessary to publish assets. 
      * **[!UICONTROL Upon Activation]** means that you must explicitly publish the asset first before a URL/Embed link is provided.<br><!-- CQDOC-17478, Added March 9, 2021-->From Experience Manager 6.5.8 onwards, Experience Manager Publish instance reflects accurate Dynamic Media metadata values, such as `dam:scene7Domain` and `dam:scene7FileStatus` in **[!UICONTROL Upon Activation]** publish mode only. To enable this functionality, install Service Pack 8, then restart Experience Manager. Go to the Sling Config Manager. Find the configuration for `Scene7ActivationJobConsumer Component` or create new one). Select the checkbox **[!UICONTROL Replicate Metadata after Dynamic Media publishing]**, then select **[!UICONTROL Save]**.

         ![Replicate Metadata after Dynamic Media publishing checkbox](assets-dm/replicate-metadata-setting.png)

      * **[!UICONTROL Selective Publish]** This option lets you control which folders are published in Dynamic Media. It lets you use features such as Smart Crop or dynamic renditions, or determine which folders are published exclusively in Experience Manager for previewing. Those same assets are *not* published in Dynamic Media for delivery in the public domain.<br>You can set this option here in the **[!UICONTROL Dynamic Media Cloud Configuration]** or, if you prefer, you can choose to set this option at the folder level, in a folder's **[!UICONTROL Properties]**.<br>See [Work with Selective Publish in Dynamic Media](/help/assets/selective-publishing.md).<br>If you later change this configuration, or you later change it at the folder level, those changes affect only new assets that you upload from that point forward. The publish state of existing assets in the folder remain as-is until you manually change them from either **[!UICONTROL Quick Publish]** or the **[!UICONTROL Manage Publication]** dialog box.

    * **[!UICONTROL Secure Preview Server]** - lets you specify the URL path to your secure renditions preview server. That is, after renditions are generated, Experience Manager can securely access and preview the remote Dynamic Media renditions (no binaries are sent back to the Experience Manager instance).
      Unless you have a special arrangement to use your own company's server or a special server, Adobe recommends that you leave this setting as specified.

    * **[!UICONTROL Sync all content]** - <!-- NEW OPTION, CQDOC-15371, Added March 4, 2020-->Selected by default. Deselect this option if you want to selectively include or exclude assets from the sync to Dynamic Media. Deselecting this option lets you can choose from the following two Dynamic Media sync modes:

    * **[!UICONTROL Dynamic Media sync mode]**
        * **[!UICONTROL Enabled by default]** - The configuration is applied to all folders by default unless you mark a folder specifically for exclusion. <!-- you can then deselect the folders that you do not want the configuration applied to.-->
        * **[!UICONTROL Disabled by default]** - The configuration is not applied to any folder until you explicitly mark a selected folder for sync to Dynamic Media.
        To mark a selected folder for sync to Dynamic Media, select an asset folder, then on the toolbar, select **[!UICONTROL Properties]**. On the **[!UICONTROL Details]** tab, in the **[!UICONTROL Dynamic Media sync mode]** drop-down list, choose from the following three options. When you are done, select **[!UICONTROL Save]**. *Remember: these three options are not available if you selected **[!UICONTROL Sync all content]** earlier.* See also [Work with Selective Publish at the folder level in Dynamic Media](/help/assets/selective-publishing.md).
            * **[!UICONTROL Inherited]** - No explicit sync value on the folder; instead, the folder inherits the sync value from one of its ancestor folders or the default mode in the cloud configuration. The detailed status for inherited shows by way of a tooltip.
            * **[!UICONTROL Enable for subfolders]** -  Include everything in this subtree for sync to Dynamic Media. The folder-specific settings override the default mode in the cloud configuration.
            * **[!UICONTROL Disabled for subfolders]** - Exclude everything in this subtree from syncing to Dynamic Media.

   >[!NOTE]
   >
   >There is no support for versioning in DMS7. Also, delayed activation applies only if **[!UICONTROL Publish Assets]** in the Edit Dynamic Media Configuration page is set to **[!UICONTROL Upon Activation]**, and then only until the first time the asset is activated.
   >
   >
   >After an asset is activated, any updates are immediately published live to S7 Delivery.

1. Select **[!UICONTROL Save]**.
1. To securely preview Dynamic Media content before it gets published, you must "allowlist" the Experience Manager author instance to connect to Dynamic Media:

    * **RICK: LINK TO NEW PUBLISH SETUP TOPIC** Open the [Dynamic Media Classic desktop application](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/getting-started/signing-out.html#getting-started), then sign in to your account. Your credentials and sign-in details were provided by Adobe at the time of provisioning. If you do not have this information, contact Adobe Customer Support.

    * On the navigation bar near the top right of the page, navigate to **[!UICONTROL Setup]** > **[!UICONTROL Application Setup]** > **[!UICONTROL Publish Setup]** > **[!UICONTROL Image Server]**.

    * On the Image Server Publish page, in the Publish Context drop-down list, select **[!UICONTROL Test Image Serving]**.
    * For the Client Address Filter, select **[!UICONTROL Add]**.
    * To enable (turn on) the address, select the check box. Enter the IP address of the Experience Manager Author instance (not Dispatcher IP).
    * Select **[!UICONTROL Save]**.

You are now finished with the basic configuration; you are ready to use Dynamic Media - Scene7 mode.

If you want to further customize your configuration, you can optionally complete any of the tasks under [(Optional) Configure Advanced Settings in Dynamic Media - Scene7 mode](#optional-configuring-advanced-settings-in-dynamic-media-scene-mode).

## (Optional) Configure Advanced Settings in Dynamic Media - Scene7 mode {#optional-configuring-advanced-settings-in-dynamic-media-scene-mode}

**RICK: KEEP AS IS**

If you want to further customize the configuration and setup of Dynamic Media - Scene7 mode, or optimize its performance, you can complete one or more of the following *optional* tasks:

* [(Optional) Configure Dynamic Media - Scene7 mode for upload of assets larger than 2 GB](#optional-config-dms7-assets-larger-than-2gb)

* [(Optional) Setup and configuration of Dynamic Media - Scene7 mode settings](#optional-setup-and-configuration-of-dynamic-media-scene7-mode-settings)

* [(Optional) Tune the performance of Dynamic Media - Scene7 mode](#optional-tuning-the-performance-of-dynamic-media-scene-mode)

* [(Optional) Filter assets for replication](#optional-filtering-assets-for-replication)

### (Optional) Configure Dynamic Media - Scene7 mode for upload of assets larger than 2 GB {#optional-config-dms7-assets-larger-than-2gb}

**RICK: KEEP AS IS**

In Dynamic Media - Scene7 mode, the default asset upload file size is 2 GB or less. However, you can optionally configure upload of assets larger than 2 GB and up to 15 GB.

If you intend to use this feature, be aware of the following prerequisites and points:

* You must be running Experience Manager 6.5 with Service Pack 6.5.4.0 or later in Dynamic Media - Scene7 mode.
* This large upload feature is only supported for [*Managed Services*](https://business.adobe.com/products/experience-manager/managed-services.html) customers.
* Be sure that your Experience Manager instance is configured with Amazon S3 or Microsoft® Azure Blob storage.

   >[!NOTE]
   >
   >Configure the Azure Blob storage with an access key and secret key because this large upload feature is not supported with AzureSas in the Blob storage configuration.

* Oak's [Direct Binary Access download](https://jackrabbit.apache.org/oak/docs/features/direct-binary-access.html) is enabled (Oak's *Direct Binary Access upload* is not required).

    To enable Direct Binary Access download, set property `presignedHttpDownloadURIExpirySeconds > 0` in the datastore configuration. The value should be long enough to download larger binaries and possibly retry.

* Assets larger than 15 GB do not get uploaded. (The size limit is set in step 8 below.)
* When the **[!UICONTROL Dynamic Media Reprocess]** assets workflow is triggered on a folder, it reprocesses any large assets that are already in sync with the Dynamic Media company. However, if any large assets are not yet synced in the folder, it does not upload the asset. Therefore, to sync existing large assets in Dynamic Media, you can run **[!UICONTROL Dynamic Media Reprocess]** assets workflow on individual assets.

**To configure Dynamic Media - Scene7 mode for upload of assets larger than 2 GB:**

1. In Experience Manager, select the Experience Manager logo to access the global navigation console, then navigate to **[!UICONTROL Tools]** > **[!UICONTROL General]** > **[!UICONTROL CRXDE Lite]**.

1. In CRXDE Lite window, do either one of the following:

   * In the left rail, navigate to the following path:

      `/libs/dam/gui/content/assets/jcr:content/actions/secondary/create/items/fileupload`

   * Copy and paste the path above into the CRXDE Lite path field below the toolbar, then press `Enter`.

1. In the left rail, right-click on `fileupload`, then from the pop-up menu, select **[!UICONTROL Overlay Node]**.

   ![Overlay Node option](/help/assets/assets-dm/uploadassets15gb_a.png)

1. On the Overlay Node dialog box, select the **[!UICONTROL Match Node Types]** check box to enable (turn on) the option, then select **[!UICONTROL OK]**.

   ![Overlay Node dialog box](/help/assets/assets-dm/uploadassets15gb_b.png)

1. From the CRXDE Lite window, do either one of the following:

   * In the left rail, navigate to the following overlay node path:

      `/apps/dam/gui/content/assets/jcr:content/actions/secondary/create/items/fileupload`

   * Copy and paste the path above into the CRXDE Lite path field below the toolbar, then press `Enter`.

1. In the **[!UICONTROL Properties]** tab, under the **[!UICONTROL Name]** column, locate `sizeLimit`.
1. To the right of the `sizeLimit` name, under the **[!UICONTROL Value]** column, double-click the value field.
1. Enter the appropriate value in bytes so you can increase the size limit to the maximum desired upload size. For example, to increase the upload asset size limit to 10 GB, enter `10737418240` in the value field.
You can enter a value up to 15 GB (`2013265920` bytes). In this case, uploaded assets that are larger than 15 GB do not get uploaded.


   ![Size limit value](/help/assets/assets-dm/uploadassets15gb_c.png)

1. Near the upper-left corner of the CRXDE Lite window, select **[!UICONTROL Save All]**.

   *Now set the timeout for the Adobe Granite Workflow External Process Job Handler by doing the following:*

1. In Experience Manager, select the Experience Manager logo to access the global navigation console.
1. Do either one of the following:

   * Navigate to the following URL path:

      `localhost:4502/system/console/configMgr/com.adobe.granite.workflow.core.job.ExternalProcessJobHandler`

   * Copy and paste the path above into the URL field of your browser. Be sure you replace `localhost:4502` with your own Experience Manager instance.

1. In the **[!UICONTROL Adobe Granite Workflow External Process Job Handler]** dialog box, in the **[!UICONTROL Max Timeout]** field, set the value to `18000` minutes (five hours). Default is 10800 minutes (three hours).

   ![Max timeout value](/help/assets/assets-dm/uploadassets15gb_d.png)

1. In the lower-right corner of the dialog box, select **[!UICONTROL Save]**.

   *Now set the timeout for the Scene7 Direct Binary Upload process step by doing the following:*

1. In Experience Manager, select the Experience Manager logo to access the global navigation console.
1. Navigate to **[!UICONTROL Tools]** > **[!UICONTROL Workflow]** > **[!UICONTROL Models]**.
1. On the Workflow Models page, select **[!UICONTROL Dynamic Media Encode Video]**.
1. On the toolbar, select **[!UICONTROL Edit]**.
1. On the workflow page, double-click the **[!UICONTROL Scene7 Direct Binary Upload]** process step.
1. In the **[!UICONTROL Step Properties]** dialog box, under the **[!UICONTROL Common]** tab, under the **[!UICONTROL Advanced Settings]** heading, in the **[!UICONTROL Timeout]** field, enter a value of `18000` minutes (five hours). The default is `3600` minutes (one hour).
1. Select **[!UICONTROL OK]**.
1. Select **[!UICONTROL Sync]**.
1. Repeat steps 14-21 for the **[!UICONTROL DAM Update Asset]** workflow model and the **[!UICONTROL Dynamic Media Reprocess]** workflow model.

### (Optional) Configure Dynamic Media Publish Setup {#optional-setup-and-configuration-of-dynamic-media-scene7-mode-settings}

**RICK: ENTIRE CONTENT FROM THE NEW PUBLISH SETUP TOPIC ADDED HERE**

>[!IMPORTANT]
>
>Dynamic Media Publish Setup is only available if:
>
>* You are running Dynamic Media in Scene7 mode.
>* You have an *existing* **[!UICONTROL Dynamic Media Configuration]** (in **[!UICONTROL Cloud Services]**) in Adobe Experience Manager 6.5 or in Experience Manager as a Cloud Service.
>* You are an Experience Manager system administrator with administrator privileges.

The Dynamic Media Publish Setup page settings determine how assets are delivered by default from Adobe Dynamic Media servers to web sites or applications. If no setting is specified, the Adobe Dynamic Media server delivers an asset according to a default setting on a Publish Setup page. For example, a request to deliver an image that does not include a resolution attribute yields an image with the Default Object Resolution setting on the Image Server page.

Administrators can change the default settings on the Image Server, Image Renderer, and Vignette pages to establish default settings for delivering assets from servers.

>[!NOTE]
>
>Dynamic Media Publish Setup is intended for use by experienced web site developers and programmers. Adobe recommends that users who change any of these default publish settings are familiar with Adobe Dynamic Media, HTTP protocol standards and conventions, and basic imaging technology.

**To configure Dynamic Media Publish Setup:**

1. In Experience Manager Author mode, select the Experience Manager logo to access the global navigation console.
1. In the left rail, select the Tools icon, then go to **[!UICONTROL Assets]** > **[!UICONTROL Dynamic Media Publish Setup]**.
1. In the Image Server page, set your Image Server - publish context, and then use the five tabs to configure default publish settings.

   * [Image Server](#image-server)
   * [Security](#security-tab) tab
   * [Catalog Management](#catalog-management-tab) tab
   * [Request Attributes](#request-attributes-tab) tab
   * [Common Thumbnail Attributes](#common-thumbnail-attributes-tab) tab
   * [Color Management Attributes](#color-management-attributes-tab) tab

   ![Dynamic Media Publish Setup page](/help/assets/assets-dm/dm-publish-setup.png)
   *Dynamic Media Publish Setup page, with the **[!UICONTROL Request Attributes]** tab selected.*<br><br>

1. When you are finished, near the upper-right corner of the page, select **[!UICONTROL Save]**.

#### Image Server {#image-server}

The Image Server page establishes default settings for delivering images from image servers. Settings are available in five categories

| Publish Context | Description |
| --- | --- |
| Image Serving | Specifies the context for publish settings. |
| Test Image Serving | Specifies the context for testing publish settings.<br>See [Test assets before making them public](#test-assets-before-making-public). |

#### Security tab {#security-tab}

**[!UICONTROL Client address]** - Lets you specify one or more IP addresses or IP address ranges. When specified, requests to this image catalog that originates from a client at an unlisted IP address is rejected. This rule applies both to delivery of images and rendered images.

#### Catalog Management tab {#catalog-management-tab}

**[!UICONTROL Rule set definition file path]** - Specifies the file that contains the rule set definitions for the image catalog.

See also [RuleSetFile](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-rulesetfile.html) parameter in the Dynamic Media Viewers Reference Guide.

#### Request Attributes tab {#request-attributes-tab}

These settings pertain to the default appearance of images.

| Setting | Description |
| --- | --- |
| **[!UICONTROL Reply image size limit]** | Required.<br>Specifies the maximum reply image width and height that is returned to the client. The server returns an error if a request causes a reply image whose width, or height, or both, is larger than this setting.<br>See also [MaxPix](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-maxpix.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL Request obfuscation mode]** | Enable if you want base64 encoding applied to valid requests.<br>See also [RequestObfuscation](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-requestobfuscation.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL Request locking mode]** | Enable if you want a simple hash lock included in requests.<br>See also [RequestLock](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-requestlock.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL Default Request Attributes]** | |
| **[!UICONTROL Default image file suffix]** | Required.<br>Default data file extension that is appended to the catalog Path and MaskPath field values if the path does not include a file suffix.<br>See also [DefaultExt](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-defaultext.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL Default font face name]** | Specifies which font is used if no font is provided by a text layer request. If specified, it must be a valid font name value in the font map of this image catalog or in the font map of the default catalog.<br>See also [DefaultFont](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-defaultfont.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL Default image]** | Provides a default image to return in response to a request where the requested image is not found.<br>See also [DefaultImage](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-is-cat-defaultimage.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL Default image mode]** | When the slider box is enabled (slider on the right), the **[!UICONTROL Default image]** replaces each missing layer in the source image with the default image and returns the composite as usual. When the slider box is disabled (slider on the left), the default image replaces the entire composite image, even if the missing image is just one of several layers.<br>See also [DefaultImageMode](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-defaultimagemode.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL Default view size]** | Required.<br>The server constrains reply images to be no larger than this width and height, if the request does not specify the view size explicitly using `wid=`, `hei=`, or `scl=`.<br>See also [DefaultPix](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-defaultpix.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL Default thumbnail size]** | Required.<br>Used instead of attribute **[!UICONTROL Default view size]** for thumbnail requests (`req=tmb`). The server constrains reply images to be no larger that this width and height, if a thumbnail request (`req=tmb`) does not specify the size explicitly using `wid=`, `hei=`, or `scl=`.<br>See also [DefaultThumbPix](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-defaultthumbpix.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL Default background color]** | Specifies the RGB value used to fill in any area of a reply image that does not contain actual image data.<br>See also [BkgColor](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-bkgcolor.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL JPEG Encoding Attributes]** |  |
| **[!UICONTROL Quality]** | Specifies the default attributes for JPEG reply images. The **[!UICONTROL Quality]** field is defined in the range of 1 - 100.<br>See also [JpegQuality](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-jpegquality.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL Chromatically downsampling]** | Enable or disable chromatically downsampling which is employed by JPEG encoders. |
| **[!UICONTROL Default resampling mode]** | Specifies the default resampling and interpolation attributes to use for scaling image data. Use when `resMode` is not specified in a request.<br>See also [ResMode](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-is-cat-resmode.html) parameter in the Dynamic Media Viewers Reference Guide. |

#### Common Thumbnail Attributes tab {#common-thumbnail-attributes-tab}

These settings pertain to the default appearance and alignment of thumbnail images.

| Setting | Description |
| --- | --- |
| **[!UICONTROL Default background color for thumbnail]** | Specifies the RGB value used to fill the area of an output thumbnail image that does not contain actual image data. Used only for thumbnail requests (`req=tmb`) and when **[!UICONTROL Default Thumbnail Type]** setting is set to **[!UICONTROL Fit]** or **[!UICONTROL Texture]**.<br>See also [ThumbBkgColor](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-thumbbkgcolor.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL Horizontal alignment]** | Specifies the horizontal alignment of the thumbnail image in the reply image rectangle specified by `wid=` and `hei=` values.<br>Used only for thumbnail requests (`req=tmb`) and when **[!UICONTROL Default Thumbnail Type]** setting is set to **[!UICONTROL Fit]**.<br>There are three horizontal alignments to choose from: **[!UICONTROL Center alignment]**, **[!UICONTROL Left alignment]**, and **[!UICONTROL Right alignment]**.<br>See also [ThumbHorizAlign](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-thumbhorizalign.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL Vertical alignment]** | Specifies the vertical alignment of the thumbnail image in the reply image rectangle specified by `wid=` and `hei=` values. Used only for thumbnail requests (`req=tmb`) and when **[!UICONTROL Default Thumbnail Type]** setting is set to **[!UICONTROL Fit]**.<br>There are three vertical alignments to choose from: **[!UICONTROL Top alignment]**, **[!UICONTROL Center alignment]**, and **[!UICONTROL Bottom alignment]**.<br>See also [ThumbVertAlign](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-thumbvertalign.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL Default cache time to live]** | Provides a default expiration interval in hours in case a particular catalog record does not contain a valid catalog Expiration value. Set to `-1` to mark as never expire. <br>See also [Expiration](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-expiration.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL Default thumbnail type]** | Provides a default for the thumbnail type in case a particular catalog record does not contain a valid catalog ThumbType value. Used only for thumbnail requests (`req=tmb`).<br>There are three thumbnail types to choose from: **[!UICONTROL Crop]**, **[!UICONTROL Fit]**, and **[!UICONTROL Texture]**.<br>See also [ThumbType](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-thumbtype.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL Default thumbnail resolution]** | Provides a default for the thumbnail object resolution in case a particular catalog record does not contain a valid catalog ThumbRes value. Used only for thumbnail requests (`req=tmb`) and when the **[!UICONTROL Default thumbnail type]** setting is set to **[!UICONTROL Texture]**.<br>See also [ThumbRes](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-thumbres.html) parameter in the Dynamic Media Viewers Reference Guide. |

#### Color Management Attributes tab {#color-management-attributes-tab}

These settings determine which ICC color profiles are used for images.

**Color Conversion Rendering Intent**
A color conversion rendering intent permits overriding of the default rendering intent of the working profiles to determine how the source colors are adjusted. Used when:

1. One of the default ICC profiles is the target color space of a color conversion.
1. An output device (printer or monitor) is characterized by this profile.
1. And, the specified rendering intent is valid for this profile.

Different rendering intents use different rules to determine how the source colors are adjusted.

As an example, you could set the **[!UICONTROL RGB default color space]** to **[!UICONTROL sRGB]**, and **[!UICONTROL CMYK default color space]** to **[!UICONTROL WebCoated]**.

Doing so would do the following:

* Enables color correction for RGB and CMYK images.
* RGB images that do not have a color profile are assumed to be in the *sRGB* color space.
* CMYK images that do not have a color profile are assumed to be in *WebCoated* color space.
* Dynamic renditions that return RGB output, return it in the *sRGB* color space.
* Dynamic renditions that return CMYK output, return it in the *WebCoated* color space.

See also [IccRenderIntent](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-iccrenderintent.html) parameter in the Dynamic Media Viewers Reference Guide.

>[!NOTE]
>
>In general, it is best to use the default rendering intent for the selected color setting, which has been tested by Adobe to meet industry standards. For example, if you choose a color setting for North America or Europe, the default color conversion rendering intent is **[!UICONTROL Relative Colormetric]**. If you choose a color setting for Japan, the default color conversion rendering intent is **[!UICONTROL Perceptual]**.

| Setting | Characteristics |
| --- | --- |
| **[!UICONTROL CMYK default color space]** | Specifies the name of the ICC color profile to use as a working profile for CMYK data. If **[!UICONTROL None Specified]** is chosen, color management is disabled for this image catalog when CMYK source images are involved. All CMYK working spaces are device-dependent, meaning that they are based on actual ink and paper combinations. The CMYK working spaces Adobe supplies are based on standard commercial print conditions.<br> See also [IccProfileCMYK](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-iccprofilecmyk.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL Gray-Scale default color space]** | Specifies the name of the ICC color profile to use as a working profile for gray-scale data. If **[!UICONTROL None Specified]** is chosen, color management is disabled for this image catalog when gray-scale source images are involved.<br>See also [IccProfileGray](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-iccprofilegray.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL RGB default color space]** | Specifies the name of the ICC color profile to use as a working profile for RGB data. If **[!UICONTROL None Specified]** is chosen, color management is disabled for this image catalog when RGB sources images are involved. In general, it is best to choose **[!UICONTROL Adobe RGB]** or **[!UICONTROL sRGB]**, rather than the profile for a specific device (such as a monitor profile). **[!UICONTROL sRGB]** is recommended when you prepare images for the web or mobile devices, because it defines the color space of the standard monitor used to view images on the web. **[!UICONTROL sRGB]** is also a good choice when you work with images from consumer-level digital cameras, because most of these cameras use sRGB as their default color space.<br>See also [IccProfileRBG](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/attributes/r-iccprofilergb.html) parameter in the Dynamic Media Viewers Reference Guide. |
| **[!UICONTROL Color conversion rendering intent]** | **[!UICONTROL Perceptual]** &ndash; Aims to preserve the visual relationship between colors so it’s perceived as natural to the human eye, even though the color values themselves may change. This intent is suitable for photographic images with lots of out-of-gamut colors. This setting is the standard rendering intent for the Japanese printing industry. |
|  | **[!UICONTROL Relative Colorimetric]** - Compares the extreme highlight of the source color space to that of the destination color space and shifts all colors accordingly. Out-of-gamut colors are shifted to the closest reproducible color in the destination color space. Relative Colorimetric preserves more of the original colors in an image than Perceptual. This setting is the standard rendering intent for printing in North America and Europe. |
|  | **[!UICONTROL Saturation]** &ndash; Tries to produce vivid colors in an image at the expense of color accuracy. This rendering intent is suitable for business graphics like graphs or charts, where bright saturated colors are more important than the exact relationship between colors. |
|  | **[!UICONTROL Absolute Colorimetric]** &ndash; Leaves colors that fall inside the destination gamut unchanged. Out-of-gamut colors are clipped. No scaling of colors to destination white point is performed. This intent aims to maintain color accuracy at the expense of preserving relationships between colors and is suitable for proofing to simulate the output of a particular device. This intent is useful for previewing how paper color affects printed colors.|

### Test assets before making them public {#test-assets-before-making-public}

Secure Testing helps you define a secure test environment and build a robust business-to-business solution, based on a configurable set of IP address and ranges. This functionality lets you match your Adobe Dynamic Media deployments with the architecture of your content management and business system.

With Secure Testing, you can preview the staging version of the website with unpublished content.

If desired, create a staging environment rather than making assets publicly available for the following reasons:

* Preview websites before public launch (staging website).
* Serve assets that require restricted access, such as eCatalogs that show prices in a B2B web application.
* Use assets behind a firewall as part of product information management system, customer service application, training site, and so on.

>[!NOTE]
>
>Secure Testing does not affect access to Adobe Dynamic Media Classic. Adobe Dynamic Media Classic security remains consistent and requires the usual credentials for access to Adobe Dynamic Media Classic and related web services.

#### How Secure Testing works {#how-test-assets-works}

Most corporations run their Internet behind a firewall. Access to the Internet is possible through certain routes and typically through a limited range of public IP addresses.

From your corporate network, you can figure out your public IP address using websites like [https://www.whatismyip.com](https://www.whatismyip.com/) or request this information from your corporate IT organization.

With Secure Testing, Adobe Dynamic Media establishes a dedicated Image Server for staging environments or internal applications. Any request to this server checks the origin IP address. If the incoming request is not within the approved list of IP addresses, a failure response is returned. The Adobe Dynamic Media Company Administrator configures the approved list of IP addresses for their company’s Secure Testing environment.

Because the location of the original request must be confirmed, the traffic of the Secure Testing service is not routed through a content distribution network like public Dynamic Media Image Server traffic. Requests to the Secure Testing service have a slightly higher latency compared to the public Dynamic Media Image Servers.

Unpublished assets are immediately available from the Secure Testing services, without the need to publish. In this way, you can run a preview before assets are published to their public facing image server.

>[!NOTE]
>
>Secure Testing services use the Catalog Server that is configured with an internal publish context. Therefore, if your company is configured to publish to Secure Testing, any uploaded assets in Adobe Dynamic Media immediately become available on Secure Testing services. This functionality is true regardless of whether the assets are marked for publish on upload.

Secure Testing services currently support the following asset types and functionalities:

* Images.
* Vignettes (Render Server requests).
* Render Server requests (supported, but must be requested explicitly by customer).
* Sets, including image sets, eCatalog, render sets, and media sets.
* Standard Adobe Dynamic Media rich media viewers.
* Adobe Dynamic Media OnDemand JSP pages.
* Static content, such as PDF files and progressively served videos.
* HTTP video streaming.
* Progressive video streaming.

The following asset types and functionalities are currently not supported:

* Adobe Dynamic Media Classic Info or eCatalog search
* RTMP video streaming
* Web-to-print
* UGC (User-Generated Content) services

>[!IMPORTANT]
>
>Support for new or existing UGC vector image assets in Adobe Dynamic Media ended on September 30, 2021.

#### Test the Secure Testing service {#test-secure-testing-service}

To ensure that Secure Testing service works as expected, do the following:

##### Prepare your account

1. Contact Adobe Customer Care and request that they enable Secure Testing on your account.
1. In Adobe Experience Manager, select **[!UICONTROL Tools]** > **[!UICONTROL Assets]** > **[!UICONTROL Dynamic Media Publish Setup]**.
1. On the Image Server page, in the **[!UICONTROL Publish Context]** drop-down list, select **[!UICONTROL Test Image Serving]**.
1. Select the **[!UICONTROL Security]** tab.
1. For the **[!UICONTROL Client address]** filter, select **[!UICONTROL Add]**.
1. In the **[!UICONTROL IP Address]** field, type an IP address.
1. In the **[!UICONTROL Mask]** field, type a net mask.

   >[!NOTE]
   >
   >If you add more than one IP address and net mask, it effectively permits *all* IP addresses to make asset calls, and they all show up.

1. Do one of the following:

   * To add more IP addresses, repeat the previous three steps.
   * Continue to the next step.

1. In the upper right corner of the Image Server page, select **[!UICONTROL Save]**.
1. Upload the desired images to your Adobe Dynamic Media account.

<!--    See [Upload files](uploading-files.md#uploading_files). -->

1. Make sure some of the images are marked for publish and others are unmarked, and then submit the publish job.

<!--    See [Publish files](publishing-files.md#publishing_files). -->

1. Determine the name of your Secure Testing service by going to **[!UICONTROL Tools]** > **[!UICONTROL Assets]** > **[!UICONTROL Dynamic Media General Setting]**. 
1. On the **[!UICONTROL Server]** page, find the server name to the right of **[!UICONTROL Published Server Name]**.

Contact Adobe Care if the server name is missing or the URL to the server does not work.

##### Prepare website variations

You need two variations of a website that links the published and unpublished assets:

* Public version - Link assets using your traditional Adobe Dynamic Media URL syntax.
* Staging version - Link assets using the same syntax but with the Secure Testing site name.

##### Run the tests

Perform the following tests:

1. Check whether assets are visible from within your corporate network.

   From within the corporate network identified by the previously defined IP address range, the staging version of the website displays all images, whether marked for publish or not. As such, you can test without accidentally making images available before preview approval or product launch.

   Confirm that the public version of your site shows published assets as previously experienced with Adobe Dynamic Media.

1. From outside your corporate network, verify that nonpublished assets (that is, unmarked for publish) are protected from third-party access.

   Access your network from outside (such as from your home computer, or over a 4G/5G connection), then verify that the public version of the site shows all published assets but none of the unpublished content.

   Confirm that the staging version does not show any asset because you are accessing the Secure Testing service from an unapproved IP address.

### Configure Dynamic Media General Settings {#configuring-application-general-settings}

>[!IMPORTANT]
>
>Dynamic Media General Setting is only available if:
>
>* You are running Dynamic Media in Scene7 mode.
>* You have an *existing* **[!UICONTROL Dynamic Media Configuration]** (in **[!UICONTROL Cloud Services]**) in Adobe Experience Manager 6.5 or in Experience Manager as a Cloud Service.
>* You are an Experience Manager system administrator with administrator privileges.

On account creation, Adobe Dynamic Media automatically provides the assigned servers for your company. These servers are used to construct URL strings for your web site and applications. These URL calls are specific to your account.

See also [Test the Secure Testing Service](/help/assets/dm-publish-settings.md#test-assets-before-making-public).

**To configure Dynamic Media General Setting:**

1. In Experience Manager Author mode, select the Experience Manager logo to access the global navigation console.
1. In the left rail, select the Tools icon, then go to **[!UICONTROL Assets]** > **[!UICONTROL Dynamic Media General Setting]**.
1. In the Server page, set your **[!UICONTROL Published Server Name]** and **[!UICONTROL Origin Server Name]**, and then use the five tabs to configure default publish settings.

   * [Server](#server-general-setting)
   * [Upload to Application](#upload-to-application)
   * [Image Editing](#image-editing-tab) tab
   * [PostScript](#postscript-tab) tab
   * [Photoshop](#photoshop-tab) tab
   * [PDF](#pdf-tab) tab
   * [Illustrator](#illustrator-tab) tab

   ![Dynamic Media General Settings page](/help/assets/assets-dm/dm-general-settings.png)
   *Dynamic Media General Settings page, with the **[!UICONTROL Image Editing]** tab selected.*<br><br>

1. When you are finished, near the upper-right corner of the page, select **[!UICONTROL Save]**.

#### Server {#server-general-setting}

On account creation, Adobe Dynamic Media automatically provides the assigned servers for your company. These servers are used to construct URL strings for your web site and applications. These URL calls are specific to your account.

| Option | Description |
| --- | --- |
| **[!UICONTROL Published Server Name]** | Required.<br>This server is the live CDN (Content Deliver Network) server used in all system-generated URL calls that are specific to your account. Do not change this server name unless you are instructed to do so by Adobe Technical Support. The name must use `https://` in the path.|
| **[!UICONTROL Origin Server Name]** | Required.<br>This server is used for quality assurance testing only. Do not change this server name unless instructed to do so by Adobe Technical Support. |

#### Upload to Application {#upload-to-application}

* **[!UICONTROL Overwrite Images]**

    Adobe Dynamic Media does not allow two files to have the same name. Each item’s Adobe Dynamic Media ID (the image name minus the filename extension) must be unique. Because of this rule, **[!UICONTROL Upload to Application]** has an overwrite. The exact effect of this option depends on the specified Overwrite Images option you have chosen. These options specify how replacement images are uploaded: whether they replace the original images, or become duplicate images. Duplicate images are renamed with a `-1`. For example, `chair.tif` is renamed `chair-1.tif`. These options affect images uploaded to a different folder than the original or images with a different filename extension from the original, such as JPG, TIF, or PNG.

    | Overwrite Images option | Description |
    | --- | --- |
    | **[!UICONTROL Overwrite in current folder, same base name/extension]** | Default.<br>This option is the strictest rule for replacement. It requires that you upload the replacement image to the same folder as the original, and that the replacement image has the same filename extension as the original. If these requirements are not met, a duplicate is created. |
    | **[!UICONTROL Overwrite in current folder, same base name regardless of extension]** | Requires that you upload the replacement image to the same folder as the original, however the filename extension can be different from the original. For example, chair.tif replaces chair.jpg. |
    | **[!UICONTROL Overwrite in any folder, same base asset name/extension]** | Requires that the replacement image has the same filename extension as the original image (for example, chair.jpg must replace chair.jpg, not chair.tif). However, you can upload the replacement image to a different folder than the original. The updated image resides in the new folder; the file can no longer be found in its original location. |
    | **[!UICONTROL Overwrite in any folder, same base asset name regardless of extension]** | This option is the most inclusive replacement rule. You can upload a replacement image to a different folder than the original, upload a file with a different filename extension, and replace the original file. If the original file is in a different folder, the replacement image resides in the new folder to which it was uploaded. |

* **[!UICONTROL Preserve Crop]**

    Controls the preservation of any existing manual crop definition.

    See also `preserveCrop` in [UploadPostJob](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-production-api/data-types/r-upload-post-job.html) and [ReprocessAssetsJob](https://experienceleague.adobe.com/docs/dynamic-media-developer-resources/image-production-api/data-types/r-reprocess-assets-job.html), both in the Dynamic Media Viewers Reference Guide.

#### Default Upload Options {#default-upload-options}

##### Image Editing tab {#image-editing-tab}

This filter lets you fine-tune a sharpening filter effect on the final downsampled image. It helps you control the intensity of the effect, the radius of the effect (as measured in pixels), and a threshold of contrast that is ignored.

The Unsharp Mask effect uses the same options as Photoshop’s Unsharp Mask filter. Contrary to what the name suggests, Unsharp Mask is a sharpening filter.

| Unsharp Mask options |Description |
| --- | --- |
| **[!UICONTROL Amount]** | Required.<br>Controls the amount of contrast that is applied to edge pixels.<br>Think of it as the intensity of the effect. The main difference between the amount values of Unsharp Mask in Adobe Dynamic Media and the amount values in Adobe Photoshop, is that Photoshop has an amount range of 1% to 500%. Whereas in Adobe Dynamic Media, the value range is `0.0` to `5.0`. A value of 5.0 in Adobe Dynamic Media is the rough equivalent of 500% in Photoshop; a value of 0.9 is the equivalent of 90%, and so on. |
| **[!UICONTROL Radius]** | Required.<br>Controls the radius of the effect.<br>The value range is `0` to `250`. The effect is run on all pixels in an image and radiates out from all pixels in all directions. The radius is measured in pixels. For example, to get a similar sharpening effect for a 2000 x 2000 pixel image and 500 x 500 pixel image, you would set a radius of two pixels on the 2000 x 2000 pixel image. Then set a radius value of one pixel on the 500 x 500 pixel image. A larger value is used for an image that has more pixels. |
| **[!UICONTROL Threshold]** | Required.<br>Threshold is a range of contrast that is ignored when the Unsharp Mask filter is applied. This effect is important so that no "noise" is introduced to an image when this filter is used. The value range is `0` - `255`, which is the number of brightness steps in a grayscale image. `0`=black, `128`=50% gray and `255`=white.<br>A threshold value of `12` ignores slight variations is skin tone brightness to avoid adding noise, but still add edge contrast to contrasty areas such as where eyelashes meet skin.<br>If you have a photo of someone’s face, the Unsharp Mask affects the contrasty parts of the image. For example, where eyelashes and skin meet to create an obvious area of contrast, and the smooth skin itself. Even the smoothest skin exhibits subtle changes in brightness values. If you do not use a threshold value, the filter accentuates these subtle changes in skin pixels. In turn, a noisy and undesirable effect is created while contrast on the eyelashes is increased, enhancing sharpness.<br>To avoid this issue, a threshold value is introduced that tells the filter to ignore pixels that do not change contrast dramatically, like smooth skin.<br>In the zipper graphic shown earlier, notice the texture next to the zippers. Image noise is exhibited because the threshold values were too low to suppress the noise. |
| **[!UICONTROL Monochrome]** | Select to unsharp-mask image brightness (intensity).<br>Deselect to unsharp-mask each color component separately. |

See also [Sharpen images in Adobe Dynamic Media and on Image Server](/help/assets/assets/sharpening_images.pdf).

##### PostScript tab {#postscript-tab}

You can rasterize Adobe PostScript® files, maintain transparent backgrounds, choose a resolution, and choose a color space.

You can use Adobe PostScript® (EPS) files in Adobe Dynamic Media. Adobe Dynamic Media offers commands for configuring these files as you upload them.

When you upload PostScript (EPS) image files, you can format them in various ways. You can rasterize the files, maintain the transparent background, choose a resolution, and choose a color space.

| PostScript option | Description |
| --- | --- |
| **[!UICONTROL Processing]** | Choose Rasterize to convert vector graphics in the file to the bitmap format. |
| **[!UICONTROL Maintain transparent background in rendered images]** | Preserves the background transparency of the file. |
| **[!UICONTROL Resolution (pixel/inch)]** | Determines the resolution setting. This setting determines how many pixels are displayed per inch in the file. |
| **[!UICONTROL Color space]** | &bull; **[!UICONTROL Detect automatically]** - Retains the color space of the file.<br>&bull; **[!UICONTROL Force as RGB]** - Converts to the RGB color space.<br>&bull; **[!UICONTROL Force as CMYK]** - Converts to the CMYK color space.<br>&bull; **[!UICONTROL Force as Grayscale]** - Converts to the Grayscale color space.|

##### Photoshop tab {#photoshop-tab}

You can create templates from Adobe® Photoshop® files, maintain layers, specify how layers are named, extract text, and specify how images are anchored into templates.

| Photoshop option | Description |
| --- | --- |
| **[!UICONTROL Maintain layers]** | Rips the layers in the PSD, if any, into individual assets. The asset layers remain associated with the PSD. You can view them by opening the PSD file in Detail View and selecting the layer panel. See Viewing and editing layers in a PSD file. |
| **[!UICONTROL Create template]** | Creates a template from the layers in the PSD file. |
| **[!UICONTROL Extract text]** | Extracts the text so that users can search for text in a Viewer. |
| **[!UICONTROL Extend layers to background size]** | Extends the size of ripped image layers to the size of the background layer. |
| **[!UICONTROL Layer naming]** | Extends the size of ripped image layers to the size of the background layer.<br>&bull; **[!UICONTROL Layer name]** - Names the images after their layer names in the PSD file. For example, a layer named Price Tag in the original PSD file becomes an image named Price Tag. However, if the layer names in the PSD file are default Photoshop layer names (Background, Layer 1, Layer 2, and so on), the images are named after their layer numbers in the PSD file. <br>&bull; **[!UICONTROL Photoshop and layer number]** - Names the images after their layer numbers in the PSD file, ignoring original layer names. Images are named with the Photoshop filename and an appended layer number. For example, the second layer of a file called `Spring Ad.psd` is named `Spring Ad_2` even if it had a non-default name in Photoshop.<br>&bull; **[!UICONTROL Photoshop and layer name]** - Names the images after the PSD file followed by the layer name or layer number. The layer number is used if the layer names in the PSD file are default Photoshop layer names. For example, a layer named `Price Tag` in a PSD file named `SpringAd` is named `Spring Ad_Price Tag`. A layer with the default name Layer 2 is called `Spring Ad_2`. |
| **[!UICONTROL Anchor]** | Specify how images are anchored in templates that are generated from the layered composition produced from the PSD file. By default, the anchor is the center. A center anchor allows replacement images to best fill the same space, no matter the aspect ratio of the replacement image. Images with a different aspect that replace this image, when referencing the template and using parameter substitution, effectively occupy the same space. Change to a different setting if your application requires the replacement images to fill the allocated space in the template. |

##### PDF tab {#pdf-tab}

You can choose to rasterize the files, extract search words and links, set the resolution, and choose a color space.

| PDF option | Description |
| --- | --- |
| **[!UICONTROL Processing]** | &bull; **[!UICONTROL None]** - No processing of the PDF is done.<br>&bull; **[!UICONTROL Thumbnail]** - Rips each page in the PDF file and converts it to a thumbnail image.<br> &bull; **[!UICONTROL Rasterize]** - Rips the pages in the PDF file and converts vector graphics to bitmap images. To create an eCatalog, choose this option. |
| **[!UICONTROL Extract]** | &bull; **[!UICONTROL None]** - No search words or links are extracted from the PDF.<br>&bull; **[!UICONTROL Search words]** - Extracts search words from the PDF file so that the file can be searched by keyword in an eCatalog Viewer.<br>&bull; **[!UICONTROL Links]** - Extracts links from the PDF files and coverts them to Image Maps that are used in an eCatalog Viewer.<br>&bull; **[!UICONTROL Search words and links]** - Extracts both search words and links for use in an eCatalog viewer. |
| **[!UICONTROL Resolution (pixel/inch)]** | Determines the resolution setting. This setting determines how many pixels are displayed per inch in the PDF file. The default is 150. |
| **[!UICONTROL Color space]** | &bull; **[!UICONTROL Detect automatically]** - Maintains the color space of the PDF file.<br>&bull; **[!UICONTROL Force as RGB]** - Converts to the RGB color space.<br>&bull; **[!UICONTROL Force as CMYK]** - Converts to the CMYK color space.<br>&bull; **[!UICONTROL Force as Grayscale]** - Converts to the Grayscale color space.  |

##### Illustrator tab {#illustrator-tab}

You can rasterize Adobe Illustrator® files, maintain transparent backgrounds, choose a resolution, and choose a color space.

You can use Adobe® Illustrator® (AI) files in Adobe Dynamic Media. Adobe Dynamic Media offers commands for configuring these files as you upload them.

When you upload Illustrator (AI) image files, you can format them in various ways. You can rasterize the files, maintain the transparent background, choose a resolution, and choose a color space. Options for formatting PostScript and Illustrator files are available on the Upload screen under PostScript Options and Illustrator Options in the Upload Job Options box.


| Illustrator option | Description |
| --- | --- |
| **[!UICONTROL Processing]** | Choose Rasterize to convert vector graphics in the file to the bitmap format. |
| **[!UICONTROL Maintain transparent background in rendered images]** | Preserves the background transparency of the file. |
| **[!UICONTROL Resolution (pixel/inch)]** | Determines the resolution setting. This setting determines how many pixels are displayed per inch in the file. |
| **[!UICONTROL Color space]** | &bull; **[!UICONTROL Detect automatically]** - Retains the color space of the file.<br>&bull; **[!UICONTROL Force as RGB]** - Converts to the RGB color space.<br>&bull; **[!UICONTROL Force as CMYK]** - Converts to the CMYK color space.<br>&bull; **[!UICONTROL Force as Grayscale]** - Converts to the Grayscale color space.|


**[!UICONTROL Default Color Profiles]** - See [Configure Color Management](#configuring-color-management) for additional information.

>[!NOTE]
>
>By default, the system shows 15 renditions when you select **[!UICONTROL Renditions]** and 15 viewer presets when you select **[!UICONTROL Viewers]** in the asset's detail view. You can increase this limit. See [Increase the number of image presets that display](/help/assets/managing-image-presets.md#increasing-or-decreasing-the-number-of-image-presets-that-display) or [Increase the number of viewer presets that display](/help/assets/managing-viewer-presets.md#increasing-the-number-of-viewer-presets-that-display).
>

### (Optional) Additional configuration tasks

Optional setup and configuration tasks include the following:

* [Edit MIME types for supported formats](#editing-mime-types-for-supported-formats) **RICK: KEEP?**
* [Add MIME types for unsupported formats](#adding-mime-types-for-unsupported-formats) **RICK: KEEP?**
* [Create batch set presets to auto-generate Image Sets and Spin Sets](#creating-batch-set-presets-to-auto-generate-image-sets-and-spin-sets) **RICK: KEEP?**

* **[!UICONTROL Compatibility Attributes]** - **RICK: STILL NEEDED? WAS IN CLASSIC** This setting enables leading and trailing paragraphs in text layers to be treated as they were in version 3.6 for backwards compatibility.
* **[!UICONTROL Localization Support]** - **RICK: STILL NEEDED? WAS IN CLASSIC** These settings let you manage multiple locale attributes. It also lets you specify a locale map string so you can define which languages you want to support for the various tooltips in Viewers. For more information about setting up **[Localization Support]**, see [Considerations when setting up localization of assets](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/setup/publish-setup.html#considerations-when-setting-up-localization-of-assets).

#### Edit MIME types for supported formats {#editing-mime-types-for-supported-formats}

**RICK: KEEP AS IS??**

You can define which asset types are processed by Dynamic Media and customize advanced asset processing parameters. For example, you can specify asset processing parameters to do the following:

* Convert an Adobe PDF to an eCatalog asset.
* Convert an Adobe Photoshop Document (.PSD) to a banner template asset for personalization.
* Rasterize an Adobe Illustrator file (.AI) or an Adobe Photoshop Encapsulated PostScript® file (.EPS).
* [Video profiles](/help/assets/video-profiles.md) and [Imaging profiles](/help/assets/image-profiles.md) can be used to define processing of videos and images, respectively.

See [Uploading Assets](/help/assets/manage-assets.md#uploading-assets).

**To edit MIME types for supported formats:**

1. In Experience Manager, select the Experience Manager logo to access the global navigation console, then navigate to **[!UICONTROL Tools]** > **[!UICONTROL General]** > **[!UICONTROL CRXDE Lite]**.
1. In the left rail, navigate to the following:

   `/conf/global/settings/cloudconfigs/dmscene7/jcr:content/mimeTypes`

   ![MIME types](assets/mimetypes.png)

1. Under the mimeTypes folder, select a mime type.
1. On the right side of the CRXDE Lite page, in the lower portion:

    * Double-click the **[!UICONTROL enabled]** field. By default all asset mime types are enabled (set to **[!UICONTROL true]**), which means the assets are synched to Dynamic Media for processing. If you wish to exclude this asset mime type from being processed, change this setting to **[!UICONTROL false]**.

    * Double-tap **[!UICONTROL jobParam]** to open its associated text field. See [Supported Mime Types](/help/assets/assets-formats.md#supported-mime-types) for a list of permitted processing parameter values you can use for a given mime type.

1. Do one of the following:

    * Repeat steps 3-4 to edit more MIME types.
    * On the menu bar of the CRXDE Lite page, select **[!UICONTROL Save All]**.

1. In the upper-left corner of the page, select **[!UICONTROL CRXDE Lite]** to return to Experience Manager.

#### Adding MIME types for unsupported formats {#adding-mime-types-for-unsupported-formats}

**RICK: KEEP AS IS??**

You can add custom MIME types for unsupported formats in Experience Manager Assets. Ensure that any new node you add in CRXDE Lite is not deleted by Experience Manager by moving the MIME type before `image_`. Also, be sure that its enabled value is set to **[!UICONTROL false]**.

**To add MIME types for unsupported formats:**

1. From Experience Manager, navigate to **[!UICONTROL Tools]** > **[!UICONTROL Operations]** > **[!UICONTROL Web Console]**.

   ![2019-08-02_16-13-14](assets/2019-08-02_16-13-14.png)

1. A new browser tab opens to the **[!UICONTROL Adobe Experience Manager Web Console Configuration]** page.

   ![2019-08-02_16-17-29](assets/2019-08-02_16-17-29.png)

1. On the page, scroll down to the name *Adobe CQ Scene7 Asset MIME type Service* as seen the following screenshot. To the right of the name, select the **[!UICONTROL Edit the configuration values]** (pencil icon).

   ![2019-08-02_16-44-56](assets/2019-08-02_16-44-56.png)

1. On the **Adobe CQ Scene7 Asset MIME type Service** page, select any plus sign icon &lt;+&gt;. The location in the table where you select the plus sign to add the new mime type is trivial.

   ![2019-08-02_16-27-27](assets/2019-08-02_16-27-27.png)

1. Type `DWG=image/vnd.dwg` in the empty text field that you just added.

   The example `DWG=image/vnd.dwg` is for demonstration purposes only. The MIME type that you add here can be any other unsupported format.

   ![2019-08-02_16-36-36](assets/2019-08-02_16-36-36.png)

1. In the lower-right corner of the page, select **[!UICONTROL Save]**.

   At this point, you can close the browser tab that has the open Adobe Experience Manager Web Console Configuration page.

1. Return to the browser tab that has your open Experience Manager console.
1. From Experience Manager, navigate to **[!UICONTROL Tools]** > **[!UICONTROL General]** > **[!UICONTROL CRXDE Lite]**.

   ![2019-08-02_16-55-41](assets/2019-08-02_16-55-41.png)

1. In the left rail, navigate to the following:

   `conf/global/settings/cloudconfigs/dmscene7/jcr:content/mimeTypes`

1. Drag the mime type `image_vnd.dwg` and drop it directly above `image_` in the tree as seen in the following screenshot.

   ![crxdelite_cqdoc-14627](assets/crxdelite_cqdoc-14627.png)

1. With the mime type `image_vnd.dwg` still selected, from the **[!UICONTROL Properties]** tab, in the **[!UICONTROL enabled]** row, under the **[!UICONTROL Value]** column header, double-tap the value to open the **[!UICONTROL Value]** drop-down list.
1. Type `false` in the field (or select **[!UICONTROL false]** from the drop-down list).

   ![2019-08-02_16-60-30](assets/2019-08-02_16-60-30.png)

1. Near the upper-left corner of the CRXDE Lite page, select **[!UICONTROL Save All]**.

#### Create batch set presets to auto-generate Image Sets and Spin Sets {#creating-batch-set-presets-to-auto-generate-image-sets-and-spin-sets}

**RICK: KEEP AS IS??**

Use batch set presets to automate the creation of image sets or spin sets while assets are uploaded to Dynamic Media.

First, define the naming convention for how assets are grouped in a set. Then create a batch set preset that is a uniquely named, self-contained set of instructions. It must define how to construct the set using images that match the defined naming conventions in the preset recipe.

When you upload files, Dynamic Media automatically creates a set with all files that match the defined naming convention in the active presets.

##### Configure default naming

Create a default naming convention that is used in any batch set preset recipe. The default naming convention selected in the batch set preset definition is likely all that is needed by your company to batch-generate sets. A batch set preset is created to use the default naming convention that you define. You are able to create as many Batch Set presets with alternate, custom naming conventions needed for a particular set of content in cases where there is an exception to the company-defined default naming.

While setting up a default naming convention is not required to use batch set preset functionality, best practice recommends that you use the default naming convention. It lets you define as many elements of your naming convention that you want grouped in a set so you can streamline batch set creation.

As an alternative, you can use **[!UICONTROL View Code]** with no form fields available. In this view, you create your naming convention definitions entirely using regular expressions.

Two elements are available for definition, Match and Base Name. These fields let you define all elements of a naming convention and identify the part of the convention used to name the set in which they are contained. A company’s individual naming convention often uses one or more lines of definition for each of these elements. You can use as many lines for your unique definition and group them into distinct elements, such as for Main Image, Color element, Alternate View element, and Swatch element.

**To configure default naming:**

**RICK: KEEP AS IS??**

1. Open the [Dynamic Media Classic desktop application](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/getting-started/signing-out.html#getting-started), then sign in to your account.

   Your credentials and sign-in details were provided by Adobe at the time of provisioning. If you do not have this information, contact Adobe Customer Support.

1. On the navigation bar near the top of the page, navigate to **[!UICONTROL Setup]** > **[!UICONTROL Application Setup]** > **[!UICONTROL Batch Set Presets]** > **[!UICONTROL Default Naming]**.
1. Select **[!UICONTROL View Form]** or **[!UICONTROL View Code]** to specify how you want to view and enter information about each element.

   You can select the **[!UICONTROL View Code]** check box to view the regular expression value building alongside your form selections. You are able to enter or alter these values to help define the elements of the naming convention, if the form view limits you for any reason. If your values are unable to be parsed in the form view, the form fields become inactive.

   >[!NOTE]
   >
   >De-activated form fields perform no validation that your regular expressions are correct. You see results of the regular expression you are building for each element after the Result line. The complete regular expression is visible at the bottom of the page.

1. Expand each element as necessary and enter the naming conventions you want to use.
1. As necessary, do any of the following:

    * Select **[!UICONTROL Add]** to add another naming convention for an element.
    * Select **[!UICONTROL Remove]** to delete a naming convention for an element.

1. Do one of the following:

    * Select **[!UICONTROL Save As]** and type a name for the preset.
    * Select **[!UICONTROL Save]** if you are editing an existing preset.

##### Create a Batch Set Preset

Dynamic Media uses batch set presets to organize assets into sets of images (alternate images, color options, 360 spin) for display in viewers. The batch set presets automatically run alongside the asset upload processes in Dynamic Media.

You can create, edit, and manage your batch set presets. There are two forms of batch set preset definitions: one for a default naming convention that you can set up, and one for custom naming conventions that you create on the fly.

You can use either the form field method to define a batch set preset or the code method, which lets you use regular expressions. As in Default Naming, you can choose View Code at the same time you are defining in the Form View and use regular expressions to build your definitions. Alternately, you can uncheck either view to use one or the other exclusively.

**To create a Batch Set Preset:**

**RICK: KEEP AS IS??**

1. Open the [Dynamic Media Classic desktop application](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/getting-started/signing-out.html#getting-started), then sign in to your account.

   Your credentials and sign-in details were provided by Adobe at the time of provisioning. If you do not have this information, contact Adobe Customer Support.

1. On the navigation bar near the top of the page, navigate to **[!UICONTROL Setup]** > **[!UICONTROL Application Setup]** > **[!UICONTROL Batch Set Presets]** > **[!UICONTROL Batch Set Preset]**.

   **[!UICONTROL View Form]**, as set in the upper-right corner of the Details page, is the default view.

1. In the Preset List panel, select **[!UICONTROL Add]** to activate the definition fields in the Details panel on the right-hand side of the screen.
1. In the Details panel, in the Preset Name field, type a name for the preset.
1. In the Batch Set Type drop-down menu, select a preset type.
1. Do one of the following:

    * If you are using a default naming convention that you previously set up under **[!UICONTROL Application Setup]** > **[!UICONTROL Batch Set Presets]** > **[!UICONTROL Default Naming]**, expand **[!UICONTROL Asset Naming Conventions]**, and then in the File Naming drop-down list, select **[!UICONTROL Default]**.

    * To define a new naming convention as you set up the preset, expand **[!UICONTROL Asset Naming Conventions]**, and then in the File Naming drop-down list, select **[!UICONTROL Custom]**.

1. For Sequence order, define the order in which images are displayed after the set is grouped in Dynamic Media.

   By default, your assets are ordered alphanumerically. However, you can use a comma-separated list of regular expressions to define the order.

1. For Set Naming and Creation Convention, specify the suffix or prefix to the base name you defined in the Asset Naming Convention. Also, define where the set is created within the Dynamic Media folder structure.

   If you define large numbers of sets, keep the sets separate from the folders that contain the assets themselves. For example, create an Image Sets folder and put generated sets here.

1. In the Details panel, select **[!UICONTROL Save]**.
1. Select **[!UICONTROL Active]** next to the new preset name.

   Activating the preset ensures that when you upload assets to Dynamic Media, the batch set preset is applied to generate the set.

##### Create a Batch Set Preset for the auto-generation of a 2D Spin Set

You can use the Batch Set Type **[!UICONTROL Multi-Axis Spin Set]** to create a recipe that automates the generation of 2D Spin Sets. The grouping of images uses Row and Column regular expressions so that the image assets are properly aligned in the corresponding location in the multi-dimensional array. There is no minimum or maximum number of rows or columns that you must have in a multi-axis spin set.

As an example, suppose you want to create a multi-axis spin set named `spin-2dspin`. You have a set of spin set images that contain three rows, with 12 images per row. The images are named as follows:

```
spin-01-01
 spin-01-02
 …
 spin-01-12
 spin-02-01
 …
 spin-03-12
```

With this information, your Batch Set Type recipe can be created as follows:

![chlimage_1-560](assets/chlimage_1-560.png)

Grouping for the shared asset name part of the spin set is added to the **[!UICONTROL Match]** field (as highlighted). The variable part of the asset name containing the row and column is added to the **[!UICONTROL Row]** and **[!UICONTROL Column]** fields, respectively.

When the Spin Set is uploaded and published, you would activate the name of the 2D Spin Set recipe that is listed under **[!UICONTROL Batch Set Presets]** in the **[!UICONTROL Upload Job Options]** dialog box.

**To create a Batch Set Preset for the auto-generation of a 2D Spin Set:**

**RICK: KEEP AS IS??**

1. Open the [Dynamic Media Classic desktop application](https://experienceleague.adobe.com/docs/dynamic-media-classic/using/getting-started/signing-out.html#getting-started), then sign in to your account.

   Your credentials and sign-in details were provided by Adobe at the time of provisioning. If you do not have this information, contact Adobe Customer Support.

1. On the navigation bar near the top of the page, navigate to **[!UICONTROL Setup]** > **[!UICONTROL Application Setup]** > **[!UICONTROL Batch Set Presets]** > **[!UICONTROL Batch Set Preset]**.

   **[!UICONTROL View Form]**, as set in the upper-right corner of the Details page, is the default view.

1. In the Preset List panel, select **[!UICONTROL Add]** to activate the definition fields in the Details panel on the right-hand side of the screen.
1. In the Details panel, in the Preset Name field, type a name for the preset.
1. In the Batch Set Type drop-down menu, select **[!UICONTROL Asset Set]**.
1. In the Sub Type drop-down list, select **[!UICONTROL Multi-Axis Spin Set]**.
1. Expand **[!UICONTROL Asset Naming Conventions]**, and then in the File Naming drop-down list, select **[!UICONTROL Custom]**.
1. Use the **[!UICONTROL Match]** and, optionally, **[!UICONTROL Base Name]** attributes to define a regular expression for the naming of image assets that make up the grouping.

   For example, your literal Match regular expression can look like the following:

   `(w+)-w+-w+`

1. Expand **[!UICONTROL Row Column Position]**, and then define the name format for the position of the image asset within the 2D Spin Set array.

   Use the parenthesis to embrace the row or column position in the file name.

   For example, for your row regular expression, it can look like the following:

   `\w+-R([0-9]+)-\w+`

   or

   `\w+-(\d+)-\w+`

   For your column regular expression, it can look like the following:

   `\w+-\w+-C([0-9]+)`

   or

   `\w+-\w+-C(\d+)`

   The samples above are for demonstration purposes only. You can create your regular expression however you want to suit your needs.

   >[!NOTE]
   >
   >If the combination of row and column regular expressions is unable to determine the position of the asset within the multi-dimensional spin set array, the asset is not added to the set. An error is also logged.

1. For Set Naming and Creation Convention, specify the suffix or prefix to the base name you defined in the Asset Naming Convention.

   Also, define where the spin set is created within the Dynamic Media Classic folder structure.

   If you define large numbers of sets, keep the sets separate from the folders that contain the assets themselves. For example, create a Spin Sets folder to put generated sets here.

1. In the Details panel, select **[!UICONTROL Save]**.
1. Select **[!UICONTROL Active]** next to the new preset name.

   Activating the preset ensures that when you upload assets to Dynamic Media, the batch set preset is applied to generate the set.

### (Optional) Tune the performance of Dynamic Media - Scene7 mode {#optional-tuning-the-performance-of-dynamic-media-scene-mode}

**RICK: KEEP AS IS??**

To keep Dynamic Media - Scene7 mode running smoothly, Adobe recommends the following synchronization performance/scalability fine-tuning tips:

* Updating the predefined Job parameters for processing of different file formats.
* Updating the predefined Granite workflow (video assets) queue worker threads.
* Updating the predefined Granite transient workflow (images and non-video assets) queue worker threads.
* Updating the maximum upload connections to the Dynamic Media Classic server.

#### Update the predefined Job parameters for processing of different file formats

**RICK: KEEP AS IS??**

You can tune job parameters for faster processing when you upload files. For example, if you upload PSD files, but do not want to process them as templates, you can set layer extraction to false (off). In such case, the tuned job parameter appears as follows: `process=None&createTemplate=false`.

In case you do want to turn on template creation, use the following parameters: `process=MaintainLayers&layerNaming=AppendName&createTemplate=true`.

<!-- THIS PARAGRAPH WAS REPLACED WITH THE TWO PARAGRAPHS DIRECTLY ABOVE BASED ON CQDOC-17657 You can tune job parameters for faster processing when you upload files. For example, if you are uploading PSD files, but do not want to process them as templates, you can set layer extraction to false (off). In such case, the tuned job parameter would appear as `process=None&createTemplate=false`. -->

Adobe recommends using the following "tuned" job parameters for PDF, PostScript®, and PSD files:

<!-- OLD PDF JOB PARAMETERS `pdfprocess=Rasterize&resolution=150&colorspace=Auto&pdfbrochure=false&keywords=false&links=false` -->

<!-- OLD POSTSCRIPT JOB PARAMETERS `psprocess=Rasterize&psresolution=150&pscolorspace=Auto&psalpha=false&psextractsearchwords=false&aiprocess=Rasterize&airesolution=150&aicolorspace=Auto&aialpha=false` -->

| File type | Recommended job parameters |
| ---| ---|
| PDF | `pdfprocess=Thumbnail&resolution=150&colorspace=Auto&pdfbrochure=false&keywords=false&links=false` |
| PostScript® | `psprocess=Rasterize&psresolution=150&pscolorspace=Auto&psalpha=false&psextractsearchwords=false&aiprocess=Thumbnail&airesolution=150&aicolorspace=Auto&aialpha=false` |
| PSD | `process=None&layerNaming=AppendName&anchor=Center&createTemplate=false&extractText=false&extendLayers=false` |

<!-- CQDOC-17657 for PSD entry in table above -->

To update any of these parameters, follow the steps in [Enabling MIME type-based Assets/Dynamic Media Classic upload job parameter support](/help/sites-administering/scene7.md#enabling-mime-type-based-assets-scene-upload-job-parameter-support).

#### Update the Granite transient workflow queue {#updating-the-granite-transient-workflow-queue}

**RICK: KEEP AS IS??**

The Granite Transit Workflow queue is used for the **[!UICONTROL DAM Update Asset]** workflow. In Dynamic Media, it is used for image ingestion and processing.

**To update the Granite transient workflow queue:**

1. Navigate to [https://localhost:4502/system/console/configMgr](https://localhost:4502/system/console/configMgr) and search for **Queue: Granite Transient Workflow Queue**.

   >[!NOTE]
   >
   >A text search is necessary instead of a direct URL because the OSGi PID is dynamically generated.

1. In the **[!UICONTROL Maximum Parallel Jobs]** field, change the number to the desired value.

   You can increase **[!UICONTROL Maximum Parallel Jobs]** to adequately support heavy upload of files to Dynamic Media. The exact value depends on hardware capacity. In certain scenarios &ndash; that is, an initial migration or a one-time bulk upload &ndash; you can use a large value. Be aware, however, that using a large value (such as two times the number of cores) can have negative effects on other concurrent activities. As such, test and adjust the value based on your particular use case.

<!--    By default, the maximum number of parallel jobs depends on the number of available CPU cores. For example, on a 4-core server, it assigns 2 worker threads. (A value between 0.0 and 1.0 is ratio based, or any numbers greater than 1 will assign the number of worker threads.)

   Adobe recommends that 32 **[!UICONTROL Maximum Parallel Jobs]** be configured to adequately support heavy upload of files to Dynamic Media Classic (Scene7). -->

   ![chlimage_1](assets/chlimage_1.jpeg)

1. Select **[!UICONTROL Save]**.

#### Update the Granite workflow queue {#updating-the-granite-workflow-queue}

**RICK: KEEP AS IS??**

The Granite Workflow queue is used for non-transient workflows. In Dynamic Media, it used to process video with the **[!UICONTROL Dynamic Media Encode Video]** workflow.

**To update the Granite workflow queue:**

1. Navigate to `https://<server>/system/console/configMgr` and search for **Queue: Granite Workflow Queue**.

   >[!NOTE]
   >
   >A text search is necessary instead of a direct URL because the OSGi PID is dynamically generated.

1. In the **[!UICONTROL Maximum Parallel Jobs]** field, change the number to the desired value.

   You can increase Maximum Parallel Jobs to adequately support heavy upload of files to Dynamic Media. The exact value depends on hardware capacity. In certain scenarios &ndash; that is, an initial migration or a one-time bulk upload &ndash; you can use a large value. Be aware, however, that using a large value (such as two times the number of cores) can have negative effects on other concurrent activities. As such, test and adjust the value based on your particular use case.

   ![chlimage_1-1](assets/chlimage_1-1.jpeg)

1. Select **[!UICONTROL Save]**.

#### Update the Dynamic Media Classic upload connection {#updating-the-scene-upload-connection}

**RICK: KEEP AS IS??**

The Scene7 Upload Connection setting synchronizes Experience Manager assets to Dynamic Media Classic servers.

**To update the Dynamic Media Classic upload connection:**

1. Navigate to `https://<server>/system/console/configMgr/com.day.cq.dam.scene7.impl.Scene7UploadServiceImpl`
1. In the **[!UICONTROL Number of connections]** field and/or the **[!UICONTROL Active job timeout]** field, change the number as desired.

   The **[!UICONTROL Number of connections]** setting controls the maximum number of HTTP connections allowed for Experience Manager to Dynamic Media upload; typically, the predefined value of ten connections is sufficient.

   The **[!UICONTROL Active job timeout]** setting determines the wait time for uploaded Dynamic Media assets to be published in delivery server. This value is 2100 seconds or 35 minutes by default.

   For most use cases, the setting of 2100 is sufficient.

   ![chlimage_1-2](assets/chlimage_1-2.jpeg)

1. Select **[!UICONTROL Save]**.

### (Optional) Filter assets for replication {#optional-filtering-assets-for-replication}

**RICK: KEEP AS IS**

In non-Dynamic Media deployments, you replicate *all* assets (both images and video) from your Experience Manager author environment to the Experience Manager Publish node. This workflow is necessary because the Experience Manager Publish servers also deliver the assets.

However, in Dynamic Media deployments, because assets are delivered by way of the Cloud Service, there is no need to replicate those same assets to Experience Manager publish nodes. Such a "hybrid publishing" workflow avoids extra storage costs and longer processing times to replicate assets. Other content, such as Site pages, continue to be served from the Experience Manager publish nodes.

The filters provide a way for you to *exclude* assets from being replicated to the Experience Manager publish node.

#### Use default asset filters for replication {#using-default-asset-filters-for-replication}

**RICK: KEEP AS IS**

If you use Dynamic Media for imaging, or video, or both, you can use the default filters that Adobe provides as-is. The following filters are active by default:

|   | Filter | Mime type | Renditions |
| --- | --- | --- | --- |
| Dynamic Media Image Delivery | filter-image<br>filter-sets | Starts with **image/**<br>Contains **applications/** and end with **set**. | The out-of-the-box "filter-images" (applies to single images assets, including interactive images) and "filter-sets" (applies to Spin Sets, Image Sets, Mixed Media Sets, and Carousel Sets) will:<br>&bull; Exclude from replication the original image and static image renditions. |
|Dynamic Media Video Delivery | filter-video | Starts with **video/** | The out-of-the-box "filter video" will:<br>&bull; Exclude from replication the original video and static thumbnail renditions. |

>[!NOTE]
>
>Filters apply to MIME types and cannot be path-specific.

#### Customize asset filters for replication {#customizing-asset-filters-for-replication}

**RICK: KEEP AS IS**

1. In Experience Manager, select the Experience Manager logo to access the global navigation console and navigate to **[!UICONTROL Tools]** > **[!UICONTROL General]** > **[!UICONTROL CRXDE Lite]**.
1. In the left folder tree, navigate to `/etc/replication/agents.author/publish/jcr:content/damRenditionFilters` to review the filters.

   ![chlimage_1-17](assets/chlimage_1-2.png)

1. To define the Mime Type for the filter, you can locate the Mime Type as follows:

   In the left rail, expand `content > dam > <locate_your_asset> > jcr:content > metadata`, and then in the table, locate `dc:format`.

   The following graphic is an example of an asset's path to `dc:format`.

   ![chlimage_1-18](assets/chlimage_1-3.png)

   Notice that the `dc:format` for the asset `Fiji Red.jpg` is `image/jpeg`.

   To have this filter apply to all images, regardless of their format, set the value to `image/*` where `*` is a regular expression that is applied to all images of any format.

   To have the filter apply only to images of the type JPEG, enter a value of `image/jpeg`.

1. Define what renditions you want to include or exclude from replication.

   Characters that you can use to filter for replication include the following:

   | Character to use  | How it filters assets for replication |
   | --- | --- |
   | * | Wildcard character |
   | + | Includes assets for replication |
   | - | Excludes assets from replication |

   Navigate to `content/dam/<locate your asset>/jcr:content/renditions`.

   The following graphic is an example of an asset's renditions.

   ![chlimage_1-4](assets/chlimage_1-4.png)

   If you only wanted to replicate the original, then you would enter `+original`.

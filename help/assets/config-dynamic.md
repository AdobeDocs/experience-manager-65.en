---
title: Configuring Dynamic Media - Hybrid mode
seo-title: Configuring Dynamic Media - Hybrid mode
description: Learn how to configure Dynamic Media - Hybrid mode.
seo-description: Learn how to configure Dynamic Media - Hybrid mode.
uuid: de88f68f-4697-4ff0-8008-3ae6a4684a84
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
discoiquuid: 821eb27e-67c9-4589-9196-30dacb84fa59
---

# Configuring Dynamic Media - Hybrid mode {#configuring-dynamic-media-hybrid-mode}

Dynamic Media &ndash; Hybrid needs to be enabled and configured for use. Depending on your use case, Dynamic Media has several [supported configurations](#supported-dynamic-media-configurations).

>[!NOTE]
>
>If you intend to configure and run Dynamic Media in Scene7 run mode, see [Configuring Dynamic Media - Scene7 mode](config-dms7.md).
>
>If you intend to configure and run Dynamic Media in hybrid run mode, follow the instructions on this page.

Learn more about working with [video](video.md) in Dynamic Media.

If you use Adobe Experience Manager set up for different environments, such as one for development, one for staging, and one for live production, you need to configure Dynamic Media Cloud Services for each one of those environments.

If you are having issues with your Dynamic Media configuration, an important place to look are the log files specific to dynamic media. These are installed automatically when you enable dynamic media:

* `s7access.log`
* `ImageServing.log`

They are documented in [Monitoring and maintaining your AEM instance](/help/sites-deploying/monitoring-and-maintaining.md).

Hybrid publishing and delivery is a core feature of the Dynamic Media addition to Adobe Experience Manager. Hybrid publishing lets you deliver Dynamic Media assets, such as images, sets and video, from the cloud instead of from the AEM publish nodes.

Other content, such as Dynamic Media viewers, Site pages, and static content will continue to be served from the AEM publish nodes.

If you are a customer of Dynamic Media, you are required to use hybrid delivery as the delivery mechanism for all Dynamic Media content.

## Hybrid publishing architecture for videos {#hybrid-publishing-architecture-for-videos}

![chlimage_1-506](assets/chlimage_1-506.png) 

## Hybrid publishing architecture for images {#hybrid-publishing-architecture-for-images}

![chlimage_1-507](assets/chlimage_1-507.png) 

## Supported Dynamic Media configurations {#supported-dynamic-media-configurations}

The configuration tasks that follow reference the following terms:

| **Term** |**Dynamic Media Enabled** |**Description** |
|---|---|---|
| AEM author node |White check mark in a green circle |The author node that you deploy to On-Premise or through Managed Services. |
| AEM publish node |White "X" in a red square. |The publish node that you deploy to On-Premise or through Managed Services. |
| Image Service publish node |White check mark in a green circle. |The publish node that you run on Data Centers that are managed by Adobe. Refers to the image service URL. |

You may choose to implement Dynamic Media only for imaging, only for video, or for both imaging and video. To determine the steps for configuring Dynamic Media for your specific scenario, please reference the following table. 

<table> 
 <tbody> 
  <tr> 
   <td><strong>Scenario</strong></td> 
   <td><strong>How it Works</strong></td> 
   <td><strong>Configuration Steps</strong></td> 
  </tr> 
  <tr> 
   <td>Deliver ONLY images in production</td> 
   <td>Images are delivered through servers in Adobe’s worldwide data centers and then cached by a CDN for scalable performance and global reach.</td> 
   <td> 
    <ol> 
     <li>On the AEM <strong>author</strong> node, <a href="#enabling-dynamic-media">enable dynamic media</a>.</li> 
     <li>Configure imaging in <a href="#configuring-dynamic-media-cloud-services">Dynamic Media Cloud Services</a>.</li> 
     <li><a href="#configuring-image-replication">Configure image replication</a>.</li> 
     <li><a href="#replicating-catalog-settings">Replicate catalog settings</a>.</li> 
     <li><a href="#replicating-viewer-presets">Replicate viewer presets</a>.</li> 
     <li><a href="#using-default-asset-filters-for-replication">Use default asset filters for replication</a>.</li> 
     <li><a href="#configuring-dynamic-media-image-server-settings">Configure Dynamic Media Image Server settings</a>.</li> 
     <li><a href="#delivering-assets">Deliver assets</a>.</li> 
    </ol> </td> 
  </tr> 
  <tr> 
   <td>Deliver ONLY images in pre-production (Dev, QE, Stage, and so on.)</td> 
   <td>Images are delivered through the AEM publish node. In this scenario, since traffic is minimal, there is no need to deliver images to Adobe’s data center. An additional benefit is that this allows for secure preview of content before production launch</td> 
   <td> 
    <ol> 
     <li>On the AEM <strong>author</strong> node, <a href="#enabling-dynamic-media">enable dynamic media</a>.</li> 
     <li>On AEM <strong>publish</strong> node, <a href="#enabling-dynamic-media">enable dynamic media</a>.</li> 
     <li><a href="#replicating-viewer-presets">Replicate viewer presets</a>.</li> 
     <li>Set up <a href="#setting-up-asset-filters-for-imaging-in-non-production-deployments">asset filter for non-production images</a>.</li> 
     <li><a href="#configuring-dynamic-media-image-server-settings">Configure Dynamic Media Image Server settings.</a></li> 
     <li><a href="#delivering-assets">Deliver assets.</a></li> 
    </ol> </td> 
  </tr> 
  <tr> 
   <td>Deliver ONLY video in any environment (Production, Dev, QE, Stage, and so on)</td> 
   <td>Videos are delivered and cached by a CDN for scalable performance and global reach. The video poster image (thumbnail of video which shows before playback initiates) will be delivered by the AEM publish instance.</td> 
   <td> 
    <ol> 
     <li>On the AEM <strong>author</strong> node, <a href="#enabling-dynamic-media">enable dynamic media</a>.</li> 
     <li>On the AEM <strong>publish</strong> node, <a href="#enabling-dynamic-media">enable dynamic media</a> (the publish instance serves the video poster image and provides metadata for video playback).</li> 
     <li>Configure video in <a href="#configuring-dynamic-media-cloud-services">Dynamic Media Cloud Services.</a></li> 
     <li><a href="#replicating-viewer-presets">Replicate viewer presets</a>.</li> 
     <li>Set up <a href="#setting-up-asset-filters-for-video-only-deployments">asset filter for video-only</a>.</li> 
     <li><a href="#delivering-assets">Deliver assets.</a></li> 
    </ol> </td> 
  </tr> 
  <tr> 
   <td>Deliver BOTH images and video in production</td> 
   <td><p>Videos are delivered and cached by a CDN for scalable performance and global reach. Images and video poster images are delivered through servers in Adobe’s worldwide data centers and then cached by a CDN for scalable performance and global reach.</p> <p>Please refer to previous sections to setup image or video in pre-production. </p> </td> 
   <td> 
    <ol> 
     <li>On the AEM <strong>author</strong> node, <a href="#enabling-dynamic-media">enable dynamic media</a>.</li> 
     <li>Configure video in <a href="#configuring-dynamic-media-cloud-services">Dynamic Media Cloud Services.</a></li> 
     <li>Configure imaging in <a href="#configuring-dynamic-media-cloud-services">Dynamic Media Cloud Services.</a></li> 
     <li><a href="#configuring-image-replication">Configure image replication</a>.</li> 
     <li><a href="#replicating-catalog-settings">Replicate catalog settings</a>.</li> 
     <li><a href="#replicating-viewer-presets">Replicate viewer presets</a>.</li> 
     <li><a href="#using-default-asset-filters-for-replication">Use default asset filters for replication.</a></li> 
     <li><a href="#configuring-dynamic-media-image-server-settings">Configure Dynamic Media Image Server settings.</a></li> 
     <li><a href="#delivering-assets">Deliver assets.</a></li> 
    </ol> </td> 
  </tr> 
 </tbody> 
</table>

## Enabling Dynamic Media {#enabling-dynamic-media}

[Dynamic media](https://www.adobe.com/solutions/web-experience-management/dynamic-media.html) is disabled by default. To take advantage of Dynamic Media features, you need to enable dynamic media by using the **[!UICONTROL dynamicmedia]** run mode as you would, for example, **[!UICONTROL publish]** run mode. Before enabling, make sure to review the [technical requirements](/help/sites-deploying/technical-requirements.md#requirements-for-aem-dynamic-media-add-on).

>[!NOTE]
>
>Enabling dynamic media via the run mode replaces the functionality in AEM 6.1 and AEM 6.0 where you enabled dynamic media by setting the **[!UICONTROL dynamicMediaEnabled]** flag to **[!UICONTROL true]**. This flag has no functionality in AEM 6.2 and later. In addition, you do not need to restart the quickstart to enable dynamic media.

By enabling Dynamic Media, the dynamic media features will be available in the UI and every uploaded image asset receives a `cqdam.pyramid.tiff` rendition that is used for fast delivery of dynamic image renditions. Those PTIFFs have significant advantages including (1) the ability to manage only a single master image and generate infinite renditions on-the-fly without any additional storage and (2) the ability to use interactive visualization such as zoom, pan, spin, and so on.

If you want to use Dynamic Media Classic (Scene7) in AEM, you should not enable Dynamic Media unless you are using a [specific scenario](/help/sites-administering/scene7.md#aem-scene-integration-versus-dynamic-media). Dynamic Media is disabled unless you enable dynamic media by way of the runmode.

To enable dynamic media, you must enable the dynamic media runmode either from the command line or from the quickstart file name.

**To enable dynamic media**:

1. On the command line, when launching the quickstart, do the following:

    * Add **[!UICONTROL -r dynamicmedia]** to the end of the command line when starting the jar file.

   ```shell
   java -Xmx4096m -Doak.queryLimitInMemory=500000 -Doak.queryLimitReads=500000 -jar cq-quickstart-6.4.0.jar -r dynamicmedia

   ```

   If you are publishing to s7delivery, then you also need to include the following trustStore arguments:

   ```
   -Djavax.net.ssl.trustStore=<absoluteFilePath>/customerTrustStoreFileName>
  
    -Djavax.net.ssl.trustStorePassword=<passwordForTrustStoreFile>
   ```

1. Request `http://localhost:4502/is/image` and make sure Image Server is now running.

   >[!NOTE]
   >
   >To troubleshoot issues with Dynamic Media, see the following logs in the **[!UICONTROL crx-quickstart/logs/]** directory:
   >
   >* ImageServer-&lt;PortId&gt;-&lt;yyyy&gt;&lt;mm&gt;&lt;dd&gt;.log - The ImageServer log provides statistics and analytical information used for analyzing the behavior of the internal ImageServer process.
   >
   >      Example of an Image Server log file name: `ImageServer-57346-2019-07-25.log`
   >* s7access-&lt;yyyy&gt;&lt;mm&gt;&lt;dd&gt;.log - The s7access log records each request made to Dynamic Media through `/is/image` and `/is/content`.
   >
   >These logs are only used when Dynamic Media is enabled. They are not included in the **Download Full** package that is generated from the **[!UICONTROL system/console/status-Bundlelist]** page; when calling Customer Support if you have a Dynamic Media issue, please append both these logs to the issue.

### If you installed AEM to a different port or context path ... {#if-you-installed-aem-to-a-different-port-or-context-path}

If you are deploying [AEM to an application server](/help/sites-deploying/application-server-install.md) and have Dynamic Media enabled, you need to configure the **self** domain in the externalizer. Otherwise, thumbnail generation for assets will not work properly for dynamic media assets.

In addition, if you run quickstart on a different port or context path, you also have to change the **self** domain.

When Dynamic Media is enabled, the static thumbnail renditions for image assets are generated using Dynamic Media. For thumbnail generation to work properly for dynamic media, AEM must perform a URL request to itself and must know both the port number and the context path.

In AEM:

* The **self** domain in the [externalizer](/help/sites-developing/externalizer.md) is used to retrieve both the port number and context path.
* If no **self** domain is configured, the port number and context path are retrieved from the Jetty HTTP service.

In an AEM QuickStart WAR deployment, the port number and context path cannot be derived, therefore you must configure a **self** domain. See [externalizer documentation](/help/sites-developing/externalizer.md) on how to configure the **self** domain.

>[!NOTE]
>
>In an [AEM Quickstart stand-alone deployment](/help/sites-deploying/deploy.md), a **self** domain generally does not need to be configured because the port number and context path can be auto-configured. However, if all network interfaces are turned off, you need to configure the **self** domain.

## Disabling Dynamic Media  {#disabling-dynamic-media}

Dynamic media is not enabled by default. However, if you have previously enabled dynamic media, you may want to turn it off at a later time.

To disable dynamic media after you have enabled it, you remove the **[!UICONTROL -r dynamicmedia]** run mode flag.

**To disable Dynamic Media after it has been enabled**:

1. On the command line, when launching the quickstart, you can do either of the following:

    * Do not add `-r dynamicmedia` to the command line when starting the JAR file.

   ```shell
   java -Xmx4096m -Doak.queryLimitInMemory=500000 -Doak.queryLimitReads=500000 -jar cq-quickstart-6.4.0.jar

   ```

1. Request `http://localhost:4502/is/image`. You receive a message that Dynamic Media is disabled.

   >[!NOTE]
   >
   >After the Dynamic Media run mode is disabled, the workflow step that generates the `qdam.pyramid.tiff` rendition is skipped automatically. This also disables dynamic rendition support and other Dynamic Media features.
   >
   >Also note that when Dynamic Media run mode is disabled after configuring the AEM server, all assets that were uploaded under that run mode are now invalid.

## (Optional) Migrating Dynamic Media presets and configurations from 6.3 to 6.4 zero downtime {#optional-migrating-dynamic-media-presets-and-configurations-from-to-zero-downtime}

If you are upgrading AEM Dynamic Media from 6.3 to 6.4 &ndash; which now includes the ability for zero downtime (also known as "Opt-in") deployments &ndash; you are required to run the following curl command to migrate all your presets and configurations from `/etc` to `/conf` in CRXDE Lite.

**Note**: If you run your AEM instance in compatibility mode&ndash;that is, you have the compatibility packaged installed&ndash;you do not need to run these commands.  
  
To migrate your custom presets and configurations from `/etc` to `/conf`, run the following Linux curl command:

`curl -u admin:admin http://localhost:4502/libs/settings/dam/dm/presets.migratedmcontent.json`

For all upgrades, either with or without the compatibility package, you can copy the out-of-the-box viewer presets by running the following command:

`curl -u admin:admin http://localhost:4502/libs/settings/dam/dm/presets/viewer.pushviewerpresets`

## Configuring image replication {#configuring-image-replication}

Dynamic Media image delivery works by publishing image assets, including video thumbnails, from AEM Author and replicating them to Adobe's on-demand replication service (the Replication Service URL). Assets are then delivered by way of the on-demand image delivery service (the Image Service URL).

You must do the following:

1. [Set up authentication](#setting-up-authentication). 
1. [Configure the replication agent](#configuring-the-replication-agent).

The Replication Agent publishes Dynamic Media assets such as images, video metadata, and sets to the Adobe-hosted Image Service. The Replication Agent is not enabled by default.

After you have configured the replication agent, you need to [validate and test that it has been successfully set up](#validating-the-replication-agent-for-dynamic-media). This section describes these procedures.

>[!NOTE]
>
>The default memory limit for PTIFF creation is 3 GB across all workflows. For example, you can process one image that requires 3 GB of memory while other workflows are paused, or you can process 10 images in parallel that require 300 MB of memory each.
>
>The memory limit is configurable and should fit the system resource availability and the type of image content being processed. If you have many very large assets and have enough memory on the system, you can increase this limit to ensure that the images are processed in parallel.
>
>An image that requires more than the maximum memory limit will be rejected.
>
>To change the memory limit for PTIFF creation, navigate to **[!UICONTROL Tools > Operations > Web Console > Adobe CQ Scene7 PTiffManager]** and change the `maxMemory` value.

### Setting up Authentication {#setting-up-authentication}

You need to set up replication authentication on author in order to replicate images to the Dynamic Media image delivery service. You do this by obtaining a KeyStore and then saving it under the **[!UICONTROL dynamic-media-replication]** user and configuring it. Your company administrator should have received a welcome email with the KeyStore file and necessary credentials during the provisioning process. If you did not receive this, please contact Customer Care.

**To set up authentication**:

1. Contact Customer Care for your KeyStore file and password if you do not already have this. This is part of provisioning and it will associate the keys to your account.
1. In AEM, tap the AEM logo to access the global navigation console, then tap **[!UICONTROL Tools > Security > Users]**.
1. On the User Management page, navigate to the **[!UICONTROL dynamic-media-replication]** user, then tap to open.

   ![dm-replication](assets/dm-replication.png)

1. In the Edit User Settings For dynamic-media-replication page, tap the **[!UICONTROL Keystore]** tab, then tap **[!UICONTROL Create KeyStore]**.

   ![dm-replication-keystore](assets/dm-replication-keystore.png)

1. Enter a password and confirm the password in the **[!UICONTROL Set KeyStore Access Password]** dialog box.

   >[!NOTE]
   >
   >Remember the password that you enter. You will need to enter it again when you configure the **[!UICONTROL Replication Agent]** later.

   ![chlimage_1-508](assets/chlimage_1-508.png)

1. On the **[!UICONTROL Edit User Settings For dynamic-media-replication]** page, expand the **[!UICONTROL Add Private Key from KeyStore file]** area and add the following (see the images that follow):

   * In the **[!UICONTROL New Alias]** field, enter the name of an alias that you will later use in the replication configuration; for example, **replication**.
   * Tap **[!UICONTROL KeyStore File]**. Navigate to the KeyStore file provided to you by Adobe, select it, then tap **[!UICONTROL Open]**.
   * In the **[!UICONTROL KeyStore File Password]** field, enter the KeyStore File password. This is _not_ the KeyStore password that you created in step 5 but is the KeyStore File password Adobe provides in the Welcome email sent to you during provisioning. Contact Adobe Customer Care if you did not receive a KeyStore File password.
   * In the **[!UICONTROL Private Key Password]** field, enter the private key password (may be the same private key password provided in the previous step). Adobe provides the private key password in the Welcome email sent to you during provisioning. Contact Adobe Customer Care if you did not receive a private key password.
   * In the **[!UICONTROL Private Key Alias]** field, enter the private key alias. For example, `companyname-alias`. Adobe provides the private key alias in the Welcome email sent to you during provisioning. Contact Adobe Customer Care if you did not receive a private key alias.

   ![edit_settings_fordynamic-media-replication2](assets/edit_settings_fordynamic-media-replication2.png)

1. Tap **[!UICONTROL Save & Close]** to save your changes to this user.

   Next, you need to [configure the replication agent.](#configuring-the-replication-agent)

### Configuring the Replication Agent {#configuring-the-replication-agent}

1. In AEM, tap the AEM logo to access the global navigation console, then tap **[!UICONTROL Tools > Deployment > Replication > Agents on author]**.
1. On the Agents on author page, tap **[!UICONTROL Dynamic Media Hybrid Image Replication (s7delivery)]**.
1. Tap **[!UICONTROL Edit]**.
1. Tap the **[!UICONTROL Settings]** tab, then enter the following:

   * **[!UICONTROL Enabled]** - Select this check box to enable the replication agent.
   * **[!UICONTROL Region]** - Set to the appropriate region: North America, Europe, or Asia
   * **[!UICONTROL Tenant ID]** - This value is the name of your company/tenant that is publishing to the Replication Service. This value is the Tenant ID that Adobe provides in the Welcome email sent to you during provisioning. Contact Adobe Customer Care if you did not receive this.
   * **[!UICONTROL Key Store Alias]** - This value is the same as the** New Alias** value set when generating the key in [Setting Up Authentication](#setting-up-authentication); for example, `replication`. (See step 7 in [Setting Up Authentication](#setting-up-authentication).)
   * **[!UICONTROL Key Store Password]** - This is the KeyStore password that was created when you tapped **[!UICONTROL Create KeyStore]**. Adobe does not provide this password. See step 5 of [Setting up Authentication](#setting-up-authentication).

   The following image shows the replication agent with sample data:

   ![chlimage_1-509](assets/chlimage_1-509.png)

1. Tap **[!UICONTROL OK]**.

### Validating the Replication Agent for Dynamic Media {#validating-the-replication-agent-for-dynamic-media}

To validate the replication agent for dynamic media, do the following:

Tap **[!UICONTROL Test Connection]**. Example output is as follows:

```shell
11.03.2016 10:57:55 - Transferring content for ReplicationAction{type=TEST, path[0]='/content/dam', time=1457722675402, userId='admin', revision='null'}
11.03.2016 10:57:55 - * Auth User: replication-receiver
11.03.2016 10:57:55 - * HTTP Version: 1.1
11.03.2016 10:57:55 - * Using OAuth 2.0 Authorization Grants
11.03.2016 10:57:55 - * OAuth 2.0 User: dynamic-media-replication
11.03.2016 10:57:55 - * OAuth 2.0 Token: '*****' initialized
11.03.2016 10:57:55 - Publishing: POST[https://replicate-na.assetsadobe.com:8580/is-publish/publish-receiver?Cmd=Test&RootId=xfpuu-6613]
11.03.2016 10:57:55 - Publish response: OK[]
11.03.2016 10:57:55 - Transfer succeeded in 141 ms for ReplicationAction{type=TEST, path[0]='/content/dam', time=1457722675402, userId='admin', revision='null'}
-------------------------------------------------------------------------------------------------------------------------------
Replication test succeeded
```

>[!NOTE]
>
>You can also check by doing one of the following:
>
>* Check the replication logs to make sure the asset is replicated. 
>* Publish an image. Tap the image and select **[!UICONTROL Viewers]** in drop-down menu. Select a viewer preset, then tap **[!UICONTROL URL]**, and copy and paste the URL in the browser to verify that you can see the image.

### Troubleshooting Authentication {#troubleshooting-authentication}

When setting up authentication, here are some issues you may run into with their solutions. Before checking these, make sure you have set up replication.

#### Problem: HTTP Status Code 401 with Message - Authorization Required {#problem-http-status-code-with-message-authorization-required}

This issue can be caused by a failure to set up the KeyStore for `dynamic-media-replication` user.

```shell
Replication test to s7delivery:https://s7bern.macromedia.com:8580/is-publish/
17.06.2016 18:54:43 - Transferring content for ReplicationAction{type=TEST, path[0]='/content/dam', time=1466214883309, userId='admin', revision='null'}
17.06.2016 18:54:43 - * Auth User: replication-receiver
17.06.2016 18:54:43 - * HTTP Version: 1.1
17.06.2016 18:54:43 - * Using OAuth 2.0 Authorization Grants
17.06.2016 18:54:43 - * OAuth 2.0 User: dynamic-media-replication
17.06.2016 18:54:43 - No OAuth token available. OAuth not initialized
17.06.2016 18:54:43 - * Using Client Auth SSL alias - replication-alias *
17.06.2016 18:54:43 - Publishing: POST[https://<localhost>:8580/is-publish//publish-receiver?Cmd=Test&RootId=brough]
17.06.2016 18:54:43 - Transfer failed for ReplicationAction{type=TEST, path[0]='/content/dam', time=1466214883309, userId='admin', revision='null'}. java.io.IOException: Failed to execute request
'https://<localhost>:8580/is-publish//publish-receiver?Cmd=Test&RootId=brough':
 Server returned status code 401 with message: Authorization required.
17.06.2016 18:54:43 - Error while replicating: com.day.cq.replication.ReplicationException: Transfer failed for ReplicationAction{type=TEST, path[0]='/content/dam', time=1466214883309,
 userId='admin', revision='null'}. java.io.IOException: Failed to execute request
'https://<localhost>:8580/is-publish//publish-receiver?Cmd=Test&RootId=brough':
 Server returned status code 401 with message: Authorization required.
```

**Solution**: Check that the `KeyStore` is saved to **[!UICONTROL dynamic-media-replication]** user and is provided with the correct password.

#### Problem: Could Not Decrypt Key - Could Not Decrypt Data {#problem-could-not-decrypt-key-could-not-decrypt-data}

```xml
Replication test to s7delivery:https://<localhost>:8580/is-publish/
17.06.2016 19:00:16 - Transferring content for ReplicationAction{type=TEST, path[0]='/content/dam', time=1466215216662, userId='admin', revision='null'}
17.06.2016 19:00:16 - * Auth User: replication-receiver
17.06.2016 19:00:16 - * HTTP Version: 1.1
17.06.2016 19:00:16 - * Using OAuth 2.0 Authorization Grants
17.06.2016 19:00:16 - * OAuth 2.0 User: dynamic-media-replication
17.06.2016 19:00:16 - No OAuth token available. OAuth not initialized
17.06.2016 19:00:16 - * Using Client Auth SSL alias - replication-alias *
17.06.2016 19:00:16 - Transfer failed for ReplicationAction{type=TEST, path[0]='/content/dam', time=1466215216662, userId='admin', revision='null'}. java.lang.SecurityException: java.security.UnrecoverableKeyException: Could not decrypt key: Could not decrypt data.
```

**Solution**: Check the password. The password saved in the replication agent is not the same password that was used to create keystore.

#### Problem: InvalidAlgorithmParameterException {#problem-invalidalgorithmparameterexception}

This issue is caused by a configuration error in your AEM Author instance. The java process on the Author is not getting the correct `javax.net.ssl.trustStore`. You see this error in the replication log:

```shell
14.04.2016 09:37:43 - Transfer failed for ReplicationAction{type=TEST, path[0]='/content/dam', time=1460651862089, userId='admin', revision='null'}. java.io.IOException: Failed to execute request 'https://<localhost>:8580/is-publish/publish-receiver?Cmd=Test&RootId=rbrough-osx2': java.lang.RuntimeException: Unexpected error: java.security.InvalidAlgorithmParameterException: the trustAnchors parameter must be non-empty
14.04.2016 09:37:43 - Error while replicating: com.day.cq.replication.ReplicationException: Transfer failed for ReplicationAction{type=TEST, path[0]='/content/dam', time=1460651862089, userId='admin', revision='null'}. java.io.IOException: Failed to execute request 'https://<localhost>:8580/is-publish/publish-receiver?Cmd=Test&RootId=rbrough-osx2': java.lang.RuntimeException: Unexpected error: java.security.InvalidAlgorithmParameterException: the trustAnchors parameter must be non-empty
```

Or the error log:

```shell
07.25.2019 12:00:59.893 *ERROR* [sling-threadpool-db2763bb-bc50-4bb5-bb64-10a09f432712-(apache-sling-job-thread-pool)-90-com_day_cq_replication_job_s7delivery(com/day/cq/replication/job/s7delivery)] com.day.cq.replication.Agent.s7delivery.queue Error during processing of replication.
 
java.io.IOException: Failed to execute request 'https://replicate-na.assetsadobe.com:8580/is-publish/publish-receiver?Cmd=Test&RootId=rbrough-osx': java.lang.RuntimeException: Unexpected error: java.security.InvalidAlgorithmParameterException: the trustAnchors parameter must be non-empty
        at com.scene7.is.catalog.service.publish.atomic.PublishingServiceHttp.executePost(PublishingServiceHttp.scala:195)
```

**Solution**: Make sure the java process on the AEM Author has the system property **-Djavax.net.ssl.trustStore=** set to a valid truststore.

#### Problem: KeyStore is either not set up or it is not initialized {#problem-keystore-is-either-not-set-up-or-it-is-not-initialized}

This issue may be caused by a hot fix, or a feature pack overwriting the **[!UICONTROL dynamic-media-user]** or **[!UICONTROL keystore]** node.

Replication log example:

```shell
Replication test to s7delivery:https://replicate-na.assetsadobe.com/is-publish
02.08.2016 14:37:44 - Transferring content for ReplicationAction{type=TEST, path[0]='/content/dam', time=1470173864834, userId='admin', revision='null'}
02.08.2016 14:37:44 - * Auth User: replication-receiver
02.08.2016 14:37:44 - * HTTP Version: 1.1
02.08.2016 14:37:44 - * Using OAuth 2.0 Authorization Grants
02.08.2016 14:37:44 - * OAuth 2.0 User: dynamic-media-replication
02.08.2016 14:37:44 - Transfer failed for ReplicationAction{type=TEST, path[0]='/content/dam', time=1470173864834, userId='admin', revision='null'}. com.adobe.granite.keystore.KeyStoreNotInitialisedException: Uninitialised key store for user dynamic-media-replication

```

**Solution**:

1. Navigate to the **[!UICONTROL User Management]** page:

   `localhost:4502/libs/granite/security/content/useradmin.html`
1. On the **[!UICONTROL User Management]** page, navigate to the **[!UICONTROL dynamic-media-replication]** user, then tap to open.
1. Tap the **[!UICONTROL KeyStore]** tab. If the **[!UICONTROL Create KeyStore]** button appears, then you need to redo the steps under [Setting up Authentication](#setting-up-authentication) earlier.
1. If you had to redo the **[!UICONTROL KeyStore]** setup, you may need to do [Configuring the Replication Agent](config-dynamic.md#configuring-the-replication-agent) again, as well.

   Reconfigure the s7delivery Replication Agent.

   `localhost:4502/etc/replication/agents.author/s7delivery.html`

1. Tap **[!UICONTROL Test Connection]** to verify the configuration is valid.

#### Problem: Publish Agent is using SSL instead of OAuth {#problem-publish-agent-is-using-ssl-instead-of-oauth}

This issue may be caused by a hot fix or a feature pack that did not install correctly or overwrote the settings.

Replicate log example:

```shell
01.08.2016 18:42:59 - Transferring content for ReplicationAction{type=TEST, path[0]='/content/dam', time=1470073379634, userId='admin', revision='null'}
01.08.2016 18:42:59 - * Auth User: replication-receiver
01.08.2016 18:42:59 - * HTTP Version: 1.1
01.08.2016 18:42:59 - * Using Client Auth SSL alias - replication-receiver *
01.08.2016 18:42:59 - Publishing: POST[https://replicate-eu.assetsadobe2.com:443/is-publish/publish-receiver?Cmd=Test&RootId=altayerstaging]
01.08.2016 18:42:59 - Transfer failed for ReplicationAction{type=TEST, path[0]='/content/dam', time=1470073379634, userId='admin', revision='null'}. java.io.IOException: Failed to execute request 'https://replicate-eu.assetsadobe2.com:443/is-publish/publish-receiver?Cmd=Test&RootId=rbroughstaging': Server returned status code 401 with message: Authorization required.
01.08.2016 18:42:59 - Error while replicating: com.day.cq.replication.ReplicationException: Transfer failed for ReplicationAction{type=TEST, path[0]='/content/dam', time=1470073379634, userId='admin', revision='null'}. java.io.IOException: Failed to execute request 'https://replicate-eu.assetsadobe2.com:443/is-publish/publish-receiver?Cmd=Test&RootId=rbroughstaging': Server returned status code 401 with message: Authorization required.
```

**Solution:**

1. In AEM, tap **[!UICONTROL Tools >  General > CRXDE Lite]**.

   `localhost:4502/crx/de/index.jsp`

1. Navigate to the **[!UICONTROL s7delivery Replication Agent]** node.

   `localhost:4502/crx/de/index.jsp#/etc/replication/agents.author/s7delivery/jcr:content`  

1. Add this setting to the replication agent (Boolean with value set to **[!UICONTROL True]**):

   `enableOauth=true`

1. Near the upper-left corner of the page, tap **[!UICONTROL Save All]**.

### Testing your configuration {#testing-your-configuration}

Adobe recommends that you perform an end-to-end test of the configuration.

Be sure you have already done the following prior to beginning this test:

* Added Image Presets.
* Configure **Dynamic Media Configuration (Pre 6.3)** under **[!UICONTROL Cloud Services]**. The Image Service URL is required for this test

To test your configuration:

1. Upload an image asset. (In Assets, tap **[!UICONTROL Create > Files]** and select the file.)
1. Wait for the workflow to finish.
1. Publish the image asset. (Select the asset and tap **[!UICONTROL Quick Publish]**.)
1. Navigate to the renditions for that image by opening the image, and tapping **[!UICONTROL Renditions]**.

   ![chlimage_1-510](assets/chlimage_1-510.png)

1. Select any dynamic rendition.
1. Tap **[!UICONTROL URL]** to obtain the URL for this asset.
1. Navigate to the selected URL and check whether the image behaves as expected.

Another way to test that your assets were delivered is to append req=exists to your URL.

## Configuring Dynamic Media Cloud Services {#configuring-dynamic-media-cloud-services}

The Dynamic Media Cloud service provides support for cloud services such as hybrid publishing and delivery of images and video, video analytics, and video encoding, among other things.

As part of the configuration, you need to enter a registration ID, video service URL, image service URL, replication service URL and set up authentication. You should have received all this information as part of the account provisioning process. If you did not receive this information, contact your Adobe Experience Manager Administrator or Adobe Technical Support to obtain the information.

>[!NOTE]
>
>Before setting up Dynamic Media Cloud Services, be sure to have your publish instance set up. You must also have replication set up before configuring Dynamic Media Cloud Services.

**To configure dynamic media cloud services**:

1. In AEM, tap the AEM logo to access the global navigation console and tap **[!UICONTROL Tools > Cloud Services > Dynamic Media Configuration (Pre-6.3)]**.
1. On the **[!UICONTROL Dynamic Media Configuration Browser]** page, in the left pane, select **[!UICONTROL global]**, then tap **[!UICONTROL Create]**.
1. In the **[!UICONTROL Create Dynamic Media Configuration]** dialog box, in the **[!UICONTROL Title]** field, type a title.
1. If you are configuring Dynamic Media for video,

    * In the **[!UICONTROL Registration ID]** field, type your registration ID.
    * In the **[!UICONTROL Video Service URL]** field, enter the video service URL for the Dynamic Media Gateway.

1. If you are configuring Dynamic Media for imaging, in the **[!UICONTROL Image Service URL]** field, enter the image service URL for the Dynamic Media Gateway.
1. Tap **[!UICONTROL Save]** to return to the Dynamic Media Configuration Browser page.
1. Tap the AEM logo to access the global navigation console.

## Configuring video reporting {#configuring-video-reporting}

You can configure video reporting across multiple installations of AEM using Dynamic Media &ndash; Hybrid mode.

**When to use:** At the time you configure **[!UICONTROL Dynamic Media Configuration (Pre 6.3)]**, numerous features are started including video reporting. The configuration creates a report suite in a regional Analytics company. If you configure multiple Author nodes, you create a separate report suite for each one. As a result, reporting data is inconsistent among installations. Furthermore, if each Author node refers to the same Hybrid Publish server, the last Author installation changes the destination report suite for all video reporting. This issue overloads the Analytics system with too many report suites.

**Get started:** Configure video reporting by completing the following three tasks.

1. Create a Video Analytics preset package after you configure **[!UICONTROL Dynamic Media Configuration (Pre 6.3)]** on the first Author node. This initial task is important because it allows a new configuration to continue using the same report suite.
1. Install the Video Analytics preset package to any ***new*** Author node ***before*** you configure Dynamic Media Configuration (Pre 6.3).

1. Verify and debug the package installation.

### Creating a Video Analytics preset package after configuring the first Author node {#creating-a-video-analytics-preset-package-after-configuring-the-first-author-node}

When you have finished this task, you will have a package file that contains the Video Analytics presets. These presets contain a report suite, the tracking server, the tracking namespace, and the Marketing Cloud Organization ID, if available.

1. If you have not already done so, configure **[!UICONTROL Dynamic Media Configuration (Pre 6.3)]**.
1. (Optional) View and copy the **[!UICONTROL Report Suite ID]** (you must have access to the JCR). While having the **[!UICONTROL Report Suite ID]** is not required, it makes validation easier.
1. Create a package using **[!UICONTROL Package Manager]**.
1. Edit the package to include a filter.

   In AEM: `/conf/global/settings/dam/dm/presets/analytics/jcr:content/userdata`

1. Build the package.
1. Download or share the Video Analytics preset package so that it can be shared with subsequent new Author nodes.

### Installing the Video Analytics preset package before you configure additional Author nodes {#installing-the-video-analytics-preset-package-before-you-configure-additional-author-nodes}

Be sure that you complete this task _before_ you configure **[!UICONTROL Dynamic Media Configuration (Pre 6.3)]**. Failure to do so results in the creation of another unused report suite. In addition, even though video reporting will continue to work correctly, the gathering of data is not optimized.

Make sure that the Video Analytics preset package from the first Author node is accessible on the new Author node.

1. Upload the Video Analytics preset package that you created eariler to **[!UICONTROL Package Manager]**.
1. Install the Video Analytics preset package.
1. Configure **[!UICONTROL Dynamic Media Configuration (Pre 6.3)]**.

### Verifying and debugging the package installation {#verifying-and-debugging-the-package-installation}

1. Do any one of the following to verify and, if necessary, debug the package installation:

    * **Check the Video Analytics preset by way of the JCR** 
      To check the Video Analytics preset by way of the JCR, you must have access to **[!UICONTROL CRXDE Lite]**.  
  
      AEM - In **[!UICONTROL CRXDE Lite]**, navigate to `/conf/global/settings/dam/dm/presets/analytics/jcr:content/userdata  `
  
      That is `http://localhost:4502/crx/de/index.jsp#/conf/global/settings/dam/dm/presets/analytics/jcr%3Acontent/userdata`  
  
      If you do not have access to **[!UICONTROL CRXDE Lite]** on the Author node, you can check the preset through the Publish server.

    * **Check the Video Analytics preset through the Image Server**

      You can validate the Video Analytics preset directly by making an Image Server `req=userdata` request.

      For example, to see the Analytics preset on the Author node, you can make the following request:  
  
      `http://localhost:4502/is/image/conf/global/settings/dam/dm/presets/analytics?req=userdata`  
  
      To validate the preset on Publish servers, you can make a similar direct request to the Publish server. The responses are the same on Author and Publish nodes. The response looks similar to the following:

      ```
      marketingCloudOrgId=0FC4E86B573F99CC7F000101
       reportSuite=aemaem6397618-2018-05-23
       trackingNamespace=aemvideodal
       trackingServer=aemvideodal.d2.sc.omtrdc.net
      ```

    * **Check the Video Analytics preset through the Video Reporting tool in AEM**

      Tap **[!UICONTROL Tools > Assets > Video Reporting]** `http://localhost:4502/mnt/overlay/dam/gui/content/s7dam/videoreports/videoreport.html`  
  
      If you see the following error message, the report suite is available, but unpopulated. This error is correct--and desired--in a new installation before the system collects any data.

      ![screen_shot_2018-05-23at52254pm](assets/screen_shot_2018-05-23at52254pm.png)

   To generate reporting data, upload and publish one video. Use **[!UICONTROL Copy URL]** and run the video at least one time.  
  
   Be aware that it can take up to 12 hours before the reporting data is populated from Video Viewer usage.  
  
   If there is an error and the report suite is not set correctly, the following alert is displayed.

   ![screen_shot_2018-05-23at52612pm](assets/screen_shot_2018-05-23at52612pm.png)

   This error is also displayed if Video Reporting is run before you configure **[!UICONTROL Dynamic Media Configuration (Pre 6.3)]** services.

### Troubleshooting the video reporting configuration {#troubleshooting-the-video-reporting-configuration}

* During installation, sometimes connections to the Analytics API server times out. The installation retries the connection 20 times, but it still fails. When this situation occurs, the log file records multiple errors. Search for `SiteCatalystReportService`.
* Not installing the Analytics Preset package first can cause the creation of a new report suite.
* Upgrading from AEM 6.3 to AEM 6.4 or AEM 6.4.1, then configuring **[!UICONTROL Dynamic Media Configuration (Pre 6.3)]**, still creates a report suite. This issue is known and slated to be fixed for AEM 6.4.2.

### About the Video Analytics preset {#about-the-video-analytics-preset}

The Video Analytics preset—sometimes known simply as analytics preset--is stored next to the Viewer presets in Dynamic Media. It is basically the same as a Viewer preset but with information used to configure AppMeasurement and Video Heartbeat reporting.

The preset’s properties are the following:

* **[!UICONTROL reportSuite]**
* **[!UICONTROL trackingServer]**
* **[!UICONTROL trackingNamespace]**
* **[!UICONTROL marketingCloudOrgId]** (not present in older AEM versions)

AEM 6.4 and newer versions save this preset at `/conf/global/settings/dam/dm/presets/analytics/jcr:content/userdata`

## Replicating Catalog Settings {#replicating-catalog-settings}

You must publish your own default catalog settings as part of the setup process through the JCR. To replicate catalog settings:

1. In a Terminal window, run the following:

   `curl -u admin:admin localhost:4502/libs/settings/dam/dm/presets/viewer.pushviewerpresets`

1. In AEM, navigate to the following location in **[!UICONTROL CRXDE Lite]** (requires admin privileges):

   `https://<server>:<port>/crx/de/index.jsp#/conf/global/settings/dam/dm/imageserver/`

1. Tap the **[!UICONTROL Replication]** tab.
1. Tap **[!UICONTROL Replicate]**.

## Replicating Viewer Presets {#replicating-viewer-presets}

To deliver an asset with a viewer preset, you must replicate/publish the viewer preset. (All viewer presets must be activated _and_ replicated to obtain the URL or embed code for an asset.) See [Publishing Viewer Presets](managing-viewer-presets.md#publishing-viewer-presets) for more information.

>[!NOTE]
>
>By default, the system shows a variety of renditions when you select **[!UICONTROL Renditions]** and a variety of viewer presets when you select **[!UICONTROL Viewers]** in the asset's detail view. You can increase or decrease the number seen. See [Increasing the number of image presets that display](/help/assets/managing-image-presets.md#increasing-or-decreasing-the-number-of-image-presets-that-display) or [Increasing the number of viewer presets that display](/help/assets/managing-viewer-presets.md#increasing-the-number-of-viewer-presets-that-display).

## Filtering Assets for Replication {#filtering-assets-for-replication}

In non-Dynamic Media deployments, you replicate _all_ assets (both images and video) from your AEM author environment to the AEM publish node. This workflow is necessary because the AEM publish servers also deliver the assets.

However, in Dynamic Media deployments, because assets are delivered by way of the cloud, there is no need to replicate those same assets to AEM publish nodes. Such a "hybrid publishing" workflow avoids extra storage costs and longer processing times to replicate assets. Other content, such as Dynamic Media viewers, Site pages, and static content continue to be served from the AEM publish nodes.

Besides replicating the assets, the following non-assets are also replicated:

* Dynamic Media Delivery configuration: `/conf/global/settings/dam/dm/imageserver/configuration/jcr:content/settings`
* Image Presets: `/conf/global/settings/dam/dm/presets/macros`
* Viewer Presets: `/conf/global/settings/dam/dm/presets/viewer`

The filters provide a way for you to _exclude_ assets from being replicated to the AEM publish node.

### Using default Asset Filters for replication {#using-default-asset-filters-for-replication}

If you are using Dynamic Media for 1) imaging in production _or_ 2) imaging and video, then you can use the default filters that we provide as-is. The following filters are active by default:

<table> 
 <tbody> 
  <tr> 
   <td> </td> 
   <td><strong>Filter</strong></td> 
   <td><strong>Mimetype</strong></td> 
   <td><strong>Renditions</strong></td> 
  </tr> 
  <tr> 
   <td>Dynamic Media Image Delivery</td> 
   <td><p>filter-images</p> <p>filter-sets</p> <p> </p> </td> 
   <td><p>Starts with <strong>image/</strong></p> <p>Contains <strong>application/</strong> and ends with <strong>set</strong>.</p> </td> 
   <td>The out-of-the-box "filter-images" (applies to single images assets, including interactive images) and "filter-sets" (applies to Spin Sets, Image Sets, Mixed Media Sets, and Carousel Sets) will: 
    <ul> 
     <li>Include PTIFF images and Metadata for replication (Any rendition starting with <strong>cqdam</strong>).</li> 
     <li>Exclude from replication the original image and static image renditions.</li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td>Dynamic Media Video Delivery</td> 
   <td>filter-video</td> 
   <td>Starts with <strong>video/</strong></td> 
   <td>The out-of-the-box "filter-video" will: 
    <ul> 
     <li>Include proxy video renditions, video thumbnail/poster image, metadata (both at parent video and video renditions) for replication (Any rendition starting with <strong>cqdam</strong>).</li> 
     <li>Exclude from replication the original video and static thumbnail renditions.<br /> <br /> <strong>Note:</strong> The proxy video renditions do not contain binaries, but instead are just node properties. Hence, there is no impact on publisher repository size.</li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td>Dynamic Media Classic (Scene7) integration</td> 
   <td><p>filter-images</p> <p>filter-sets</p> <p>filter-video</p> </td> 
   <td><p>Starts with <strong>image/</strong></p> <p>Contains <strong>application/</strong> and ends with <strong>set</strong>.</p> <p>Starts with <strong>video/</strong></p> </td> 
   <td><p>You configure the Transport URI to point to your AEM publish server instead of the Adobe Dynamic Media Cloud Replication Service URL. Setting up this filter will allow Dynamic Media Classic to deliver assets instead of the AEM publish instance.</p> <p>The out-of-the-box "filter-images," "filter-sets," and "filter-video" will:</p> 
    <ul> 
     <li>Include PTIFF image, proxy video renditions, and metadata for replication. However, because they do not exist in the JCR-for those running AEM - Dynamic Media Classic integration-it effectively does nothing.</li> 
     <li>Exclude from replication the original image, static image renditions, original video, and static thumbnail renditions. Instead, Dynamic Media Classic will be delivering image and video assets.</li> 
    </ul> </td> 
  </tr> 
 </tbody> 
</table>

>[!NOTE]
>
>Filters apply to mime types and cannot be path specific.

### Setting up Asset Filters for video-only deployments {#setting-up-asset-filters-for-video-only-deployments}

If you are using Dynamic Media for video-only, follow these steps to set up asset filters for replication:

1. In AEM, tap the AEM logo to access the global navigation console and tap **[!UICONTROL Tools > Deployment > Replication > Agents on author]**.
1. On the Agents on author page, tap **[!UICONTROL Default Agent (publish)]**.
1. Tap **[!UICONTROL Edit]**.
1. In the **[!UICONTROL Agent Settings]** dialog box, in the [!UICONTROL Settings] tab, check **[!UICONTROL Enabled]** to turn on the agent.
1. Tap **[!UICONTROL OK]**.
1. In AEM, tap **[!UICONTROL Tools > General > CRXDE Lite]**.
1. In the left folder tree, navigate to `/etc/replication/agents.author/dynamic_media_replication/jcr:content/damRenditionFilters`
1. Locate [!UICONTROL filter-video], right-click it and select **[!UICONTROL Copy]**.
1. In the left folder tree, navigate to `/etc/replication/agents.author/publish`
1. Locate [!UICONTROL jcr:content], right-click it and select **[!UICONTROL Paste]**.

This sets up the AEM publish instance to deliver the video poster image as well as the video metadata required for playback, while the video itself is delivered by the Dynamic Media cloud service. The filter will also exclude from replication the original video and static thumbnail renditions, which are not needed on the publish instance.

### Setting up Asset Filters for Imaging in non-production deployments {#setting-up-asset-filters-for-imaging-in-non-production-deployments}

If you are using Dynamic Media for imaging in non-production deployments, follow these steps to set up asset filters for replication:

1. In AEM, tap the AEM logo to access the global navigation console and tap **[!UICONTROL Tools > Deployment > Replication > Agents on author]**.
1. On the Agents on author page, tap **[!UICONTROL Default Agent (publish)]**.
1. Tap **[!UICONTROL Edit]**.
1. In the **[!UICONTROL Agent Settings]** dialog box, in the **[!UICONTROL Settings]** tab, check **[!UICONTROL Enabled]** to turn on the agent.
1. Tap **[!UICONTROL OK]**.
1. In AEM, tap **[!UICONTROL Tools > General > CRXDE Lite]**.
1. In the left folder tree, navigate to `/etc/replication/agents.author/dynamic_media_replication/jcr:content/damRenditionFilters`

   ![image-2018-01-16-10-22-40-410](assets/image-2018-01-16-10-22-40-410.png)

1. Locate **[!UICONTROL filter-images]**, right-click it and select **[!UICONTROL Copy]**.
1. In the left folder tree, navigate to `/etc/replication/agents.author/publish`
1. Locate **[!UICONTROL jcr:content]**, right-click it and select **[!UICONTROL Create > Create Node]**. Enter the name `damRenditionFilters` of type `nt:unstructured`. 
1. Locate [!UICONTROL `damRenditionFilters`], right-click it and select **[!UICONTROL Paste]**.

This sets up the AEM publish instance to deliver the images to your non-production environment. The filter will also exclude from replication the original image and static renditions, which are not needed on the publish instance.

>[!NOTE]
>
>If there are many different filters in an author, each agent needs a different user assigned to it. The granite code enforces one-filter-per-user model. Always have a different user for each filter set up.
>
>If you are using more than one filter on a server&mdash;for example, one filter for replication to publish and a second filter for s7delivery&mdash;then you need to ensure that these two filters have a different **userId** assigned to them in the **[!UICONTROL jcr:content]** node. See the image that follows:

![image-2018-01-16-10-26-28-465](assets/image-2018-01-16-10-26-28-465.png) 

### Customizing Asset Filters for replication {#customizing-asset-filters-for-replication}

To optionally customize asset filters for replication:

1. In AEM, tap the AEM logo to access the global navigation console and tap **[!UICONTROL Tools > General > CRXDE Lite]**.
1. In the left folder tree, navigate to `/etc/replication/agents.author/dynamic_media_replication/jcr:content/damRenditionFilters` to review the filters.

   ![chlimage_1-511](assets/chlimage_1-511.png)

1. To define the Mime Type for the filter, you can locate the Mime Type as follows:

   In the left rail, expand **[!UICONTROL content > dam > <`locate_your_asset`> > jcr:content > metadata]**, and then in the table, locate `dc:format`.

   The following graphic is an example of an asset's path to `dc:format`.

   ![chlimage_1-512](assets/chlimage_1-512.png)

   Notice that the `dc:format` for the asset `Fiji Red.jpg` is `image/jpeg`.

   To have this filter apply to all images, regardless of their format, set the value to `image/*` where `*` is a regular expression that is applied to all images of any format.

   To have the filter apply only to images of the type JPEG, enter a value of `image/jpeg`.

1. Define what renditions you want to include or exclude from replication.

   Characters that you can use to filter for replication include the following:

<table> 
 <tbody> 
  <tr> 
   <td><strong>Character to use</strong></td> 
   <td><strong>How it filters assets for replication</strong></td> 
  </tr> 
  <tr> 
   <td>*</td> 
   <td>Wildcard character<br /> </td> 
  </tr> 
  <tr> 
   <td>+</td> 
   <td>Includes assets for replication.</td> 
  </tr> 
  <tr> 
   <td>-</td> 
   <td>Excludes assets from replication.</td> 
  </tr> 
 </tbody> 
</table>

   Navigate to `content/dam/<locate_your_asset>/jcr:content/renditions`.

   The following graphic is an example of an asset's renditions.

   ![chlimage_1-513](assets/chlimage_1-513.png)

   Using the example above, if you only wanted to replicate the PTIFF (Pyramid TIFF), then you would enter `+cqdam,*` which includes all the renditions that start with `cqdam`. Inthe example, that rendition is `cqdam.pyramid.tiff`.

   If you only wanted to replicate the original, then you would enter `+original`.

## Configuring Dynamic Media Image Server settings {#configuring-dynamic-media-image-server-settings}

Configuring the Dynamic Media Image Server involves editing the Adobe CQ Scene7 ImageServer bundle and the Adobe CQ Scene7 PlatformServer bundle.

>[!NOTE]
>
>Dynamic Media works out-of-the-box [after it is enabled](#enabling-dynamic-media). However, you can optionally choose to fine tune your installation by configuring Dynamic Media Image Server to meet certain specifications or requirements.

**Prerequisite**: _Before_ you configure Dynamic Media Image Server, ensure that your VM of Windows includes an installation of the Microsoft Visual C++ Libraries. The libraries are necessary to run Dynamic Media Image Server. You can [download the Microsoft Visual C++ 2010 Redistributable Package (x64) here](https://www.microsoft.com/en-us/download/details.aspx?id=14632).

**To configure Dynamic Media Image Server settings**:

1. In the upper-left corner of AEM, tap **[!UICONTROL Adobe Experience Manager]** to access the global navigation console, then tap **[!UICONTROL Tools > Operations > Web Console]**.
1. On the **[!UICONTROL Adobe Experience Manager Web Console Configuration]** page, tap **[!UICONTROL OSGi > Configuration]** to list all the bundles that are currently running within AEM.

   The Dynamic Media Delivery Servers are found under the following names in the list:

    * **[!UICONTROL Adobe CQ Scene7 ImageServer]**
    * **[!UICONTROL Adobe CQ Scene7 PlatformServer]**

1. In the list of bundles, to the right of **[!UICONTROL Adobe CQ Scene7 ImageServer]**, tap the **[!UICONTROL Edit]** icon.
1. In the **[!UICONTROL Adobe CQ Scene7 ImageServer]** dialog box, set the following configuration values:

   >[!NOTE]
   >
   >In most cases, there is no need to change the default values. However, if you do change the default values, you must restart the bundle for the changes to take affect.

<table> 
 <tbody> 
  <tr> 
   <td><strong>Property</strong></td> 
   <td><strong>Default value</strong></td> 
   <td><strong>Description</strong></td> 
  </tr> 
  <tr> 
   <td>TcpPort.name</td> 
   <td><code><em>empty</em></code></td> 
   <td>Port number to use for communication with the ImageServer process. By default free port is automatically detected.</td> 
  </tr> 
  <tr> 
   <td>AllowRemoteAccess.name</td> 
   <td><code><em>empty</em></code></td> 
   <td><p>Allow or disallow remote access to ImageServer process. If false, the image server listens only on localhost.</p> <p>Default externalizer settings that point to the localhost need to specify the actual domain or IP address of the specific VM instance. The reason for this is because the localhost may be pointing to the parent system of the VM.</p> <p>Domains or IP addresses for the VM may need to have a host file entry so that it can resolve itself.</p> </td> 
  </tr> 
  <tr> 
   <td>MaxRenderRgnPixels</td> 
   <td>16 MPixels</td> 
   <td>Maximum size in megapixels that is rendered.</td> 
  </tr> 
  <tr> 
   <td>MaxMessageSize</td> 
   <td>16 MBytes</td> 
   <td>Maximum message size in megabytes that is delivered.</td> 
  </tr> 
  <tr> 
   <td>RandomAccessUrlTimeout</td> 
   <td>20</td> 
   <td>Timeout value for how long in seconds the ImageServer will wait for the JCR to respond to a ranged tile request.</td> 
  </tr> 
  <tr> 
   <td>WorkerThreads</td> 
   <td>10</td> 
   <td>Number of worker threads.</td> 
  </tr> 
 </tbody> 
</table>

1. Tap **[!UICONTROL Save]**.
1. In the list of bundles, to the right of **[!UICONTROL Adobe CQ Scene7 PlatformServer]**, tap the **[!UICONTROL Edit]** icon.
1. In the **[!UICONTROL Adobe CQ Scene7 PlatformServer]** dialog box, set the following default value options:

   >[!NOTE]
   >
   >Dynamic Media Image Server uses its own disk cache to cache responses. The AEM HTTP cache and the Dispacher cannot be used to cache responses from Dynamic Media Image Server.

   | **Property** |**Default value** |**Description** |
   |---|---|---|
   | **[!UICONTROL Cache enabled]** |Checked |Whether or not the response cache is enabled. |
   | **[!UICONTROL Cache roots]** |cache |One or more paths to the response cache folders. Relative paths are resolved against the internal s7imaging bundle folder. |
   | **[!UICONTROL Cache Max Size]** |200000000 |Maximum size of response cache in bytes. |
   | **[!UICONTROL Cache Max Entries]** |100000 |Maximum number of entries allowed in the cache. |

### Default Manifest settings {#default-manifest-settings}

The default manifest lets you configure the defaults that are used to generate the Dynamic Media Delivery responses. You can fine tune quality (JPEG quality, resolution, resampling mode), caching (expiration), and prevent the rendering of images that are too large (defaultpix, defaultthumbpix, maxpix).

The location of the default manifest configuration is taken from the **[!UICONTROL Catalog root]** default value of the **[!UICONTROL Adobe CQ Scene7 PlatformServer]** bundle. By default this value is located at the following path within **[!UICONTROL Tools > General > CRXDE Lite]**:

`/conf/global/settings/dam/dm/imageserver/`

![configimageservercrxdelite](assets/configimageservercrxdelite.png)

You can change the values of the properties, as described in the table below, by entering new values.

When you are finished making changes to the default manifest, in the upper-left corner of the page, tap **[!UICONTROL Save All]**.

Be sure you tap the **[!UICONTROL Access Control]** tab (to the right of the **[!UICONTROL Properties]** tab), then set the access control privileges to `jcr:read` for the everyone and dynamic-media-replication users.

![configimageservercrxdeliteaccesscontroltab](assets/configimageservercrxdeliteaccesscontroltab.png)

Table of Manifest settings and their default values:

<table> 
 <tbody> 
  <tr> 
   <td><strong>Property</strong></td> 
   <td><strong>Default value</strong></td> 
   <td><strong>Description</strong></td> 
  </tr> 
  <tr> 
   <td>bkgcolor</td> 
   <td>FFFFFF</td> 
   <td><p>Default background color. RGB value used to fill in any area of a reply image which does not contain actual image data.</p> <p>See also <a href="https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/image_catalog/r_bkgcolor.html">BkgColor</a> in the Image Serving API.</p> </td> 
  </tr> 
  <tr> 
   <td>defaultpix</td> 
   <td>300,300</td> 
   <td><p>Default view size. The server constrains reply images to be no larger than this width and height, if the request does not specify the view size explicitly using wid=, hei=, or scl=.</p> <p>Specified as two integer numbers, 0 or larger, separated by a comma. Width and height in pixels. Either or both values may be set to 0 to keep them unconstrained. Does not apply to nested/embedded requests.</p> <p>See also <a href="https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/image_catalog/r_defaultpix.html">DefaultPix</a> in the Image Serving API.</p> <p>Usually, however, you are using a viewer preset or image preset to deliver the asset. Defaultpix only applies to an asset that is not using a viewer preset or image preset.</p> </td> 
  </tr> 
  <tr> 
   <td>defaultthumbpix</td> 
   <td>100,100</td> 
   <td><p>Default thumbnail size. Used instead of attribute::DefaultPix for thumbnail requests (req=tmb).</p> <p>The server constrains reply images to be no larger than this width and height, if a thumbnail request (req=tmb) does not specify the size explicitly not specify the view size explicitly using wid=, hei=, or scl=.</p> <p>Specified as two integer numbers, 0 or larger, separated by a comma. Width and height in pixels. Either or both values may be set to 0 to keep them unconstrained. </p> <p>Does not apply to nested/embedded requests.</p> <p>See also <a href="https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/image_catalog/r_defaultthumbpix.html">DefaultThumbPix</a> in the Image Serving API. </p> </td> 
  </tr> 
  <tr> 
   <td>expiration</td> 
   <td>36000000</td> 
   <td><p>Default client cache time to live. Provides a default expiration interval in case a particular catalog record does not contain a valid catalog::Expiration value.</p> <p>Real number, 0 or greater. Number of milliseconds until expiration since the reply data was generated. Set to 0 to always expire the reply image immediately, which effectively disables client caching. By default, this value is set to 10 hours, which means that if a new image is published, it takes 10 hours for the old image to leave the user's cache. Contact Customer Care if you need the cache cleared sooner.</p> <p>See also <a href="https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/image_catalog/r_expiration.html">Expiration</a> in the Image Serving API.</p> </td> 
  </tr> 
  <tr> 
   <td>jpegquality</td> 
   <td>80</td> 
   <td><p>Default JPEG encoding attributes. Specifies the default attributes for JPEG reply images.</p> <p>Integer number and flag, separated by a comma. The first value is in the range 1..100 and defines the quality. The second value may be 0 for normal behavior, or 1 to disable the RGB chromaticity down-sampling usually employed by JPEG encoders.</p> <p>See also <a href="https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/image_catalog/r_jpegquality.html">JpegQuality</a> in the Image Serving API.</p> </td> 
  </tr> 
  <tr> 
   <td>maxpix</td> 
   <td>2000,2000</td> 
   <td><p>Reply image size limit. Maximum reply image width and height that is returned to the client.</p> <p>The server returns an error if a request causes a reply image whose width or height is larger than attribute::MaxPix.</p> <p>See also <a href="https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/image_catalog/r_maxpix.html">MaxPix</a> in the Image Serving API.</p> </td> 
  </tr> 
  <tr> 
   <td>resmode</td> 
   <td>SHARP2</td> 
   <td><p>Default resampling mode. Specifies the default resampling and interpolation attributes to be used for scaling image data.</p> <p>Used when resMode= is not specified in a request.</p> <p>Allowed values include BILIN, BICUB, or SHARP2.</p> <p>Enum. Set to 2 for bilin, 3 for bicub, or 4 for sharp2 interpolation mode. Use sharp2 for best results.</p> <p>See also <a href="https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/image_catalog/r_is_cat_resmode.html">ResMode</a> in the Image Serving API.</p> </td> 
  </tr> 
  <tr> 
   <td>resolution</td> 
   <td>72</td> 
   <td><p>Default object resolution. Provides a default object resolution in case a particular catalog record does not contain a valid catalog::Resolution value.</p> <p>Real number, larger than 0. Typically expressed as pixels per inch, but may also be in other units, such as pixels per meter.</p> <p>See also <a href="https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/image_catalog/r_resolution.html">Resolution</a> in the Image Serving API.</p> </td> 
  </tr> 
  <tr> 
   <td>thumbnailtime</td> 
   <td>1%,11%,21%,31%,41%,51%,61%,71%,81%,91%</td> 
   <td>These values represent a snapshot of video playtime and are passed to <a href="https://encoding.com/">encoding.com</a>. See <a href="/help/assets/video.md#about-video-thumbnails">About video thumbnails</a> for more information.</td> 
  </tr> 
 </tbody> 
</table>

## Configuring Dynamic Media Color Management {#configuring-dynamic-media-color-management}

Dynamic media color management lets you color correct assets for previewing.

With color correction, ingested assets retain their color space (RGB, CMYK, Gray) and embedded color profile in the generated pyramid TIFF rendition. When you request a dynamic rendition, the image color is corrected into the target color space. You configure the output color profile in the dynamic media publish settings in the JCR.

Adobe color management uses ICC profiles, a format defined by the International Color Consortium (ICC).

You can configure dynamic media color management and configure image presets using CMYK, RGB, or Gray output. See [Configuring Image Presets](managing-image-presets.md).

Advanced use cases could use a manual configure **[!UICONTROL icc=]** modifier to explicitly select an output color profile:

* **[!UICONTROL icc]** - [https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/http_ref/r_icc.html](https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/http_ref/r_icc.html)

* **[!UICONTROL iccEmbed]** - [https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/http_ref/r_iccembed.html](https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/http_ref/r_iccembed.html)

>[!NOTE]
>
>The standard set of Adobe color profiles are only available if you have [Feature Pack 12445](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq630/featurepack/cq-6.3.0-featurepack-12445) installed. All feature packs and service packs are available via [Package Share](https://www.adobeaemcloud.com/content/packageshare.html). Feature Pack 12445 provides the Adobe color profiles.

### Installing feature pack 12445 {#installing-feature-pack}

You must install feature pack 12445 to use the dynamic media color management capabilities.

**To install feature pack 12445**:

1. Navigate to [Package Share](https://www.adobeaemcloud.com/content/packageshare.html) and download either `cq-6.3.0-featurepack-12445`.

   See [How to Work with Packages](/help/sites-administering/package-manager.md) for more information on using Package Share and Packages in AEM.

1. Install the feature pack.

### Configuring the default color profiles {#configuring-the-default-color-profiles}

After you install the feature pack, you need to configure the appropriate default color profiles to enable color correction when requesting RGB or CMYK image data.

**To configure the default color profiles**:

1. In **[!UICONTROL Tools > General > CRXDE Lite]**, navigate to `/conf/global/settings/dam/dm/imageserver/configuration/settings` which contains the default Adobe Color Profiles.

   ![chlimage_1-514](assets/chlimage_1-514.png)

1. Add a color correction property by scrolling to the bottom of the **[!UICONTROL Properties]** tab and manually entering the property name, type, and value, which are described in the following tables. After you enter the values, tap **[!UICONTROL Add]** and then **[!UICONTROL Save All]** to save your values.

   Color correction properties are described in the **[!UICONTROL Color Corrections Properties]** table. Values that you can assign to color correction properties are in the **[!UICONTROL Color Profile]** table.

   For example, in **[!UICONTROL Name]**, add `iccprofilecmyk`, select **[!UICONTROL Type]** `String`, and add `WebCoated` as a **[!UICONTROL Value]**. Tap **[!UICONTROL Add]**, then **[!UICONTROL Save All]** to save your values.

   ![chlimage_1-515](assets/chlimage_1-515.png)

    **Color Correction Properties Table**

    <table> 
    <tbody> 
      <tr> 
      <td><strong>Property</strong></td> 
      <td><strong>Type</strong></td> 
      <td><strong>Default</strong></td> 
      <td><strong>Description</strong></td> 
      </tr> 
      <tr> 
      <td><a href="https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/image_catalog/r_iccprofilergb.html">iccprofilergb</a></td> 
      <td>String</td> 
      <td>&lt;empty&gt;</td> 
      <td>Name of the default RGB color profile.</td> 
      </tr> 
      <tr> 
      <td><a href="https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/image_catalog/r_iccprofilecmyk.html">iccprofilecmyk</a></td> 
      <td>String</td> 
      <td>&lt;empty&gt;</td> 
      <td>Name of the default CMYK color profile.</td> 
      </tr> 
      <tr> 
      <td><a href="https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/image_catalog/r_iccprofilegray.html">iccprofilegray</a></td> 
      <td>String</td> 
      <td>&lt;empty&gt;</td> 
      <td>Name of the default Gray color profile.</td> 
      </tr> 
      <tr> 
      <td><a href="https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/image_catalog/r_iccprofilesrcrgb.html">iccprofilesrcrgb</a></td> 
      <td>String</td> 
      <td>&lt;empty&gt;</td> 
      <td>Name of the default RGB color profile used for RGB images that do not have an embedded color profile</td> 
      </tr> 
      <tr> 
      <td><a href="https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/image_catalog/r_iccprofilesrccmyk.html">iccprofilesrccmyk</a></td> 
      <td>String</td> 
      <td>&lt;empty&gt;</td> 
      <td>Name of the default CMYK color profile used for CMYK images that do not have an embedded color profile.</td> 
      </tr> 
      <tr> 
      <td><a href="https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/image_catalog/r_iccprofilesrcgray.html">iccprofilesrcgray</a></td> 
      <td>String</td> 
      <td>&lt;empty&gt;</td> 
      <td>Name of the default Gray color profile used for CMYK images that do not have an embedded color profile.</td> 
      </tr> 
      <tr> 
      <td><a href="https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/image_catalog/r_iccblackpointcompensation.html">iccblackpointcompensation</a></td> 
      <td>Boolean</td> 
      <td>True</td> 
      <td>Specifies whether black point compensation should be done during color correction. Adobe recommends this to be on.</td> 
      </tr> 
      <tr> 
      <td><a href="https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/image_catalog/r_iccdither.html">iccdither</a></td> 
      <td>Boolean</td> 
      <td>False</td> 
      <td>Specifies whether dithering should be done during color correction.</td> 
      </tr> 
      <tr> 
      <td><a href="https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/image_catalog/r_iccrenderintent.html">iccrenderintent</a></td> 
      <td>String</td> 
      <td>relative</td> 
      <td><p>Specifies the render intent. Acceptable values are: <strong>perceptual, relative, saturation, absolute. </strong><i></i>Adobe recommends <strong>relative </strong><i></i>as the default.</p> </td> 
      </tr> 
    </tbody> 
    </table>

   >[!NOTE]
   >
   >Property names are case sensitive and need to be all lowercase.

   **Color Profile Table**

   The following color profiles are installed:

    <table> 
    <tbody> 
      <tr> 
      <th><p>Name</p> </th> 
      <th><p>Colorspace</p> </th> 
      <th><p>Description</p> </th> 
      </tr> 
      <tr> 
      <td>AdobeRGB</td> 
      <td>RGB</td> 
      <td>Adobe RGB (1998)</td> 
      </tr> 
      <tr> 
      <td>AppleRGB</td> 
      <td>RGB</td> 
      <td>Apple RGB</td> 
      </tr> 
      <tr> 
      <td>CIERGB</td> 
      <td>RGB</td> 
      <td>CIE RGB</td> 
      </tr> 
      <tr> 
      <td>CoatedFogra27</td> 
      <td>CMYK</td> 
      <td>Coated FOGRA27 (ISO 12647-2:2004)</td> 
      </tr> 
      <tr> 
      <td>CoatedFogra39</td> 
      <td>CMYK</td> 
      <td>Coated FOGRA39 (ISO 12647-2:2004)</td> 
      </tr> 
      <tr> 
      <td>CoatedGraCol</td> 
      <td>CMYK</td> 
      <td>Coated GRACoL 2006 (ISO 12647-2:2004)</td> 
      </tr> 
      <tr> 
      <td>ColorMatchRGB</td> 
      <td>RGB</td> 
      <td>ColorMatch RGB</td> 
      </tr> 
      <tr> 
      <td>EuropeISOCoated</td> 
      <td>CMYK</td> 
      <td>Europe ISO Coated FOGRA27</td> 
      </tr> 
      <tr> 
      <td>EuroscaleCoated</td> 
      <td>CMYK</td> 
      <td>Euroscale Coated v2</td> 
      </tr> 
      <tr> 
      <td>EuroscaleUncoated</td> 
      <td>CMYK</td> 
      <td>Euroscale Uncoated v2</td> 
      </tr> 
      <tr> 
      <td>JapanColorCoated</td> 
      <td>CMYK</td> 
      <td>Japan Color 2001 Coated</td> 
      </tr> 
      <tr> 
      <td>JapanColorNewspaper</td> 
      <td>CMYK</td> 
      <td>Japan Color 2002 Newspaper</td> 
      </tr> 
      <tr> 
      <td>JapanColorUncoated</td> 
      <td>CMYK</td> 
      <td>Japan Color 2001 Uncoated</td> 
      </tr> 
      <tr> 
      <td>JapanColorWebCoated</td> 
      <td>CMYK</td> 
      <td>Japan Color 2003 Web Coated</td> 
      </tr> 
      <tr> 
      <td>JapanWebCoated</td> 
      <td>CMYK</td> 
      <td>Japan Web Coated (Ad)</td> 
      </tr> 
      <tr> 
      <td>NewsprintSNAP2007</td> 
      <td>CMYK</td> 
      <td>US Newsprint (SNAP 2007)</td> 
      </tr> 
      <tr> 
      <td>NTSC</td> 
      <td>RGB</td> 
      <td>NTSC (1953)</td> 
      </tr> 
      <tr> 
      <td>PAL</td> 
      <td>RGB</td> 
      <td>PAL/SECAM</td> 
      </tr> 
      <tr> 
      <td>ProPhoto</td> 
      <td>RGB</td> 
      <td>ProPhoto RGB</td> 
      </tr> 
      <tr> 
      <td>PS4Default</td> 
      <td>CMYK</td> 
      <td>Photoshop 4 Default CMYK</td> 
      </tr> 
      <tr> 
      <td>PS5Default</td> 
      <td>CMYK</td> 
      <td>Photoshop 5 Default CMYK</td> 
      </tr> 
      <tr> 
      <td>SheetfedCoated</td> 
      <td>CMYK</td> 
      <td>U.S. Sheetfed Coated v2</td> 
      </tr> 
      <tr> 
      <td>SheetfedUncoated</td> 
      <td>CMYK</td> 
      <td>U.S. Sheetfed Uncoated v2</td> 
      </tr> 
      <tr> 
      <td>SMPTE</td> 
      <td>RGB</td> 
      <td>SMPTE-C</td> 
      </tr> 
      <tr> 
      <td>sRGB</td> 
      <td>RGB</td> 
      <td>sRGB IEC61966-2.1</td> 
      </tr> 
      <tr> 
      <td>UncoatedFogra29</td> 
      <td>CMYK</td> 
      <td>Uncoated FOGRA29 (ISO 12647-2:2004)</td> 
      </tr> 
      <tr> 
      <td>WebCoated</td> 
      <td>CMYK</td> 
      <td>U.S. Web Coated (SWOP) v2</td> 
      </tr> 
      <tr> 
      <td>WebCoatedFogra28</td> 
      <td>CMYK</td> 
      <td>Web Coated FOGRA28 (ISO 12647-2:2004)</td> 
      </tr> 
      <tr> 
      <td>WebCoatedGrade3</td> 
      <td>CMYK</td> 
      <td>Web Coated SWOP 2006 Grade 3 Paper</td> 
      </tr> 
      <tr> 
      <td>WebCoatedGrade5</td> 
      <td>CMYK</td> 
      <td>Web Coated SWOP 2006 Grade 5 Paper</td> 
      </tr> 
      <tr> 
      <td>WebUncoated</td> 
      <td>CMYK</td> 
      <td>U.S. Web Uncoated v2</td> 
      </tr> 
      <tr> 
      <td>WideGamutRGB</td> 
      <td>RGB</td> 
      <td>Wide Gamut RGB</td> 
      </tr> 
    </tbody> 
    </table>

1. Tap **[!UICONTROL Save All]**.

For example, you could set **[!UICONTROL iccprofilergb]** to `sRGB`, and **[!UICONTROL iccprofilecmyk]** to `WebCoated`. Doing so would do the following:

* Enables color correction for RGB and CMYK images.
* RGB images that do not have a color profile are assumed to be in the `sRGB` color space.
* CMYK images that do not have a color profile are assumed to be in `WebCoated` color space.
* Dynamic renditions that return RGB output, return it in the `sRGB` color space.
* Dynamic renditions that return CMYK output, return it in the `WebCoated` color space.

## Delivering Assets {#delivering-assets}

After you complete all the tasks above, activated Dynamic Media assets are served from the Image or Video Service. In AEM, this ability shows up in a **[!UICONTROL Copy Image URL]**, **[!UICONTROL Copy Viewer URL]**, **[!UICONTROL Embed Viewer Code]**, and in the WCM.

See [Delivering Dynamic Media Assets](delivering-dynamic-media-assets.md).

<table> 
 <tbody> 
  <tr> 
   <td><strong>When you...</strong></td> 
   <td><strong>Result</strong></td> 
  </tr> 
  <tr> 
   <td>Copy an image URL</td> 
   <td><p>The Copy URL dialog box displays a URL similar to following (URL is for demonstration purposes only):</p> <p><code>https://IMAGESERVICEPUBLISHNODE/is/image/content/dam/path/to/Image.jpg?$preset$</code></p> <p>Where <code>IMAGESERVICEPUBLISHNODE</code> refers to the Image Service URL.</p> <p>See also <a href="/help/assets/delivering-dynamic-media-assets.md">Delivering Dynamic Media Assets</a>.</p> </td> 
  </tr> 
  <tr> 
   <td>Copy a viewer URL</td> 
   <td><p>The Copy URL dialog box displays a URL similar to the following (URL is for demonstration purposes only):</p> <p><code>https://PUBLISHNODE/etc/dam/viewers/s7viewers/html5/BasicZoomViewer.html?asset=/content/dam/path/to/Image.jpg&amp;config=/conf/global/settings/dam/dm/presets/viewer/Zoom_dark&amp;serverUrl=https://IMAGESERVICEPUBLISHNODE/is/image/&amp;contentRoot=%2F</code></p> <p>Where <code>PUBLISHNODE</code> refers to the regular AEM publish node and <code>IMAGESERVICEPUBLISHNODE</code> refers to the Image Service URL.</p> <p>See also <a href="/help/assets/delivering-dynamic-media-assets.md">Delivering Dynamic Media Assets</a>.</p> </td> 
  </tr> 
  <tr> 
   <td>Copy a viewer's embed code</td> 
   <td><p>The Copy Embed Code dialog box displays a code snippet similar to the following (code sample is for demonstration purposes only):</p> <p><code class="code">&lt;style type="text/css"&gt;
       #s7basiczoom_div.s7basiczoomviewer{
       width:100%;
       height:auto;
       }
       &lt;/style&gt;
       &lt;script
       type="text/javascript" src="https://PUBLISHNODE/etc/dam/viewers/s7viewers/html5/js/BasicZoomViewer.js"&gt;&lt;/script&gt;
       &lt;div id="s7basiczoom_div"&gt;&lt;/div&gt;
       &lt;script type="text/javascript"&gt;
       var s7basiczoomviewer = new s7viewers.BasicZoomViewer({
       "containerId" : "s7basiczoom_div",
       "params" : {
       "serverurl" : "https://IMAGESERVICEPUBLISHNODE/is/image/",
       "contenturl" : "https://PUBLISHNODE/",
       "config" : "/conf/global/settings/dam/dm/presets/viewer/Zoom_dark",
       "asset" : "/content/dam/path/to/Image.jpg" }
       }).init();
       &lt;/script&gt;</code></p> <p>Where <code>PUBLISHNODE</code> refers to the regular AEM publish node and <code>IMAGESERVICEPUBLISHNODE</code> refers to the Image Service URL.</p> <p>See also <a href="/help/assets/delivering-dynamic-media-assets.md">Delivering Dynamic Media Assets</a>.</p> </td> 
  </tr> 
 </tbody> 
</table>

### WCM Dynamic Media and Interactive Media Components {#wcm-dynamic-media-and-interactive-media-components}

WCM pages that reference Dynamic Media and Interactive Media components reference the delivery service.

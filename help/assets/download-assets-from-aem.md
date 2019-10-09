---
title: Download assets from AEM
seo-title: Download assets from AEM
description:  Learn how to download assets from AEM and enable or disable the download functionality.
seo-description:  Learn how to download assets from AEM and enable or disable the download functionality.
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
mini-toc-levels: 2
---

# Download assets from AEM {#download-assets-from-aem}

You can download assets including static and dynamic renditions. Alternatively, you can send emails with links to assets directly from AEM Assets. Downloaded assets are bundled in a ZIP file. The compressed ZIP file has a maximum file size of 1 GB for the export job. You are allowed a maximum of 500 total assets per export job.

>[!NOTE]
>
>Recipients of emails must be members of the `dam-users` group to access the ZIP download link in the email message. To be able to download the assets, the members must have permissions to launch workflows that trigger downloading of assets.

To download assets, navigate to an asset, select the asset, and tap/click the Download icon from the toolbar. In the resulting dialog, specify your download options.

The asset types Image Sets, Spin Sets, Mixed Media Sets, and Carousel Sets cannot be downloaded.

![Available options when downloading assets from AEM Assets](assets/asset_download_dialog.png)

The following are the Export/Download options. Dynamic renditions are unique to Dynamic Media and let you generate renditions on-the-fly in addition to the asset you selected - that option is only available if you have Dynamic Media enabled.

|Export/Download options|Descriptions|
|----|----|
|Assets|Select this to download the asset in its original form without any renditions.|
|Renditions|A rendition is the binary representation of an asset. Assets have a primary representation - that of the uploaded file. They can have any number of representations. <br /> With this option, you can select the renditions you want downloaded. The renditions available depend on the asset you select.|
|Dynamic Renditions|A dynamic rendition generates other renditions on-the-fly. When you select this option, you also select the renditions you want to create dynamically by selecting from the [Image Preset](image-presets.md) list. <br />In addition, you can select the size and unit of measurement, format, color space, resolution, and any image modifiers (for example to invert the image)|
|Email|An email notification is sent to the user. Standard emails templates are available at the following locations:<br />* `/libs/settings/dam/workflow/notification/email/downloadasset` <br />* `/libs/settings/dam/workflow/notification/email/transientworkflowcompleted` <br /> Templates that you customize during deployment should be present at these locations: <br />* `/apps/settings/dam/workflow/notification/email/downloadasset`<br /> * `/apps/settings/dam/workflow/notification/email/transientworkflowcompleted` <br /> You can store tenant-specific custom templates at these locations:<br /> * `/conf/<tenant_specific_config_root>/settings/dam/workflow/notification/email/downloadasset`<br /> *`/conf/<tenant_specific_config_root>/settings/dam/workflow/notification/email/transientworkflowcompleted`|
|Create separate folder for each asset|Select this to preserve the folder hierarchy while downloading assets. By default, the folder hierarchy is ignored and all assets are downloaded in one folder in your local system.|

The option renditions option is available if the asset has any renditions. The subassets option is available if the asset includes subassets.

When you select a folder to download, the complete asset hierarchy under the folder is downloaded. To include each asset you download (including assets in child folders nested under the parent folder) in an individual folder, select **[!UICONTROL Create separate folder for each asset]**.

## Enable asset download servlet {#enable-asset-download-servlet}

The default servlet in AEM allows authenticated users to issue arbitrarily-large, concurrent download requests for creating ZIP files of assets visible to them that can overload the server and the network. To mitigate potential DoS risks caused by this feature, AssetDownloadServlet OSGi component is disabled by default for publish instances.

To allow downloading assets from your DAM, say when using something like Asset Share Commons or other portal-like implementation, manually enable the servlet via an OSGi configuration. Adobe recommends setting the permissible download size as low as possible without affecting the day-to-day download requirements. A high value may impact performance.

1. Create a folder with a naming convention that targets the publish runmode, that is `config.publish`:
`/apps/<your-app-name>/config.publish`
See [!UICONTROL Run Modes] for more information on defining configuration properties for a run mode.
1. In the config folder, create a new file of type `nt:file` named `com.day.cq.dam.core.impl.servlet.AssetDownloadServlet.config`.
1. Populate `com.day.cq.dam.core.impl.servlet.AssetDownloadServlet.config` with the following. Sets a maximum size (in bytes) for the download as value of `asset.download.prezip.maxcontentsize`. The below sample configures the maximum size of the ZIP download to not exceed 100 kB.

``` 
enabled=B"true"
asset.download.prezip.maxcontentsize=I"102400"
```

## Disable asset download servlet {#disnable-asset-download-servlet}

The `Asset Download Servlet` can be disabled on an AEM Publish instances by updating the dispatcher configuration to block any asset download requests. The servlet can also be manually disabled via the OSGi console directly.

1. To block asset download requests via a dispatcher configuration edit the `dispatcher.any` configuration and add a new rule to the filter section.

   ```/0100 { /type "deny" /url "*.assetdownload.zip/assets.zip*" }```

1. You can manually disable the OSGi component on a Publish instance, by navigating to the OSGi Console at `<aem-host>/system/console/components`. Locate `com.day.cq.dam.core.impl.servlet.AssetDownloadServlet` and click **[!UICONTROL Disable]**.

>[!MORELIKETHIS]
>
>* [Download DRM protected assets](drm.md)
>* [Download assets using AEM desktop app on Win/Mac desktop](https://helpx.adobe.com/experience-manager/desktop-app/aem-desktop-app.html)
>* [Download assets using Adobe Assets Link from within the supported Creative Cloud apps](https://helpx.adobe.com/enterprise/using/manage-assets-using-adobe-asset-link.html)

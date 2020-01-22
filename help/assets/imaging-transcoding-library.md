---
title: Imaging Transcoding Library
description: Learn how to configure and use Adobe's Imaging Transcoding Library, an image processing solution that can perform core image-handling functions, including encoding, transcoding, image resampling, and image resizing.
uuid: fb0e67a4-ef88-4c08-b1d9-248bb6990ade
contentOwner: AG
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
discoiquuid: beecbadd-d31f-4bc6-a99a-491ca579c8d8
docset: aem65

---

# Imaging Transcoding Library {#imaging-transcoding-library}

<!-- TBD: Add UICONTROL tags. Run spellcheck. -->

Adobe's Imaging Transcoding Library is a proprietary image processing solution that can perform core image-handling functions, including:

* Encoding
* Transcoding (converting supported formats)
* Image resampling, using PS and Intel IPP algorithms
* Bit depth and color profile preservation
* JPEG quality compression
* Image resizing

Imaging Transcoding Library provides CMYK support and full alpha support, except CMYK -Alpha.

In addition to supporting a wide range of file formats and profiles, Imaging Transcoding Library has significant advantages over other third-party solutions when it comes to performance, scalability, and quality. Here are some of the key benefits of using Imaging Transcoding Library:

* **Scales with increasing file size or resolution**: Scaling is primarily achieved by the patented ability of Imaging Transcoding Library to re-size while decoding files. This ability ensures that runtime memory usage is always optimum and is not a quadratic function of increasing file size or resolution megapixels. Imaging Transcoding Library can process larger and high-resolution (containing higher megapixels) files. Third-party tools, such as ImageMagick is unable to handle large files and crashes while processing such files.
* **Photoshop quality compression and resizing algorithms**: Consistency with industry standard in terms of quality of down sampling (smooth, sharp and automatic bicubic) and compression quality. Imaging Transcoding Library further assesses the quality factor of input image, and intelligently uses optimum tables and quality settings for output image. This ability produces files of optimal size without compromising on visual quality.
* **High throughput:** The response time is lower and throughput is consistently higher than ImageMagick. Therefore, Imaging Transcoding Library should decrease the wait time for users and the cost of hosting.
* **Scale better with concurrent load:** Imaging Transcoding Library performs optimally under concurrent load conditions. It provides high throughput with optimum CPU performance, memory usage, and low response time, which helps reduce the cost of hosting.

## Supported MIME types {#supported-mime-types}

See [supported MIME types article](assets-formats.md#supported-image-transcoding-library), for a list of formats that ITL supports.

## Supported platforms {#supported-platforms}

Imaging Transcoding Library is available only for RHEL 7 and CentOS 7 distributions.

>[!NOTE]
>
> Mac OS and other *nix distributions (for example, Debian and Ubuntu) are not supported. Currently, RHEL 7 and CentOS 7 are supported for Linux distros.

## Usage {#usage}

The command line arguments for Imaging Transcoding Library can include the following:

```shell
 -destMime PNG/JPEG: Mime type of output rendition
 -BitDepth 8/16: Preserves Bit Depth. Bitdepth ‘4’ is automatically converted to ‘8’
 -preserveBitDepth: Downscales Bit Depth (No upscaling)
 -preserveCMYK: Preserves CMYK color space
 -jpegQuality: Provides jpeg quality parameter (0-12 , corresponding to Photoshop qualities)
 -ResamplingMethod BiCubic/Lanczos/PSBicubic: Provides resampling methods. PSBicubic is a Photoshop quality resampling method.
 -resize
```

You can configure the following options for the `-resize` `parameter:`

* `X`: `Works similar to AEM. For example -resize 319.`
* `WxH`: `Aspect Ratio will not be maintained, For example -resize 319X319.`
* `Wx`: `Fixes the width and calculates the height maintaining the aspect ratio. For example -resize 319x.`
* `xH`: `Fixes the height and calculates the width maintaining the aspect ratio. For example -resize x319.`

```shell
 -AllowUpsampling (Resizes smaller images)
 -input <fileName>
 -output <fileName>
```

## Configure Imaging Transcoding Library {#configuring-imaging-transcoding-library}

### Create configuration file for extracted bundle {#create-conf-file}

To configure the library, create a .conf file to indicate the libraries using the following steps. You need administrator or root permissions.

1. Download the [Imaging Transcoding Library package](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/aem630/product/assets/aem-assets-imaging-transcoding-library-pkg) and install it using the Package Manager. The package is compatible with AEM 6.5.

1. To know a bundle id for `com.day.cq.dam.cq-dam-switchengine`, log in to the Web Console and tap **[!UICONTROL OSGi > Bundles]**. Alternatively, to open the bundles console, access `https://[aem_server:[port]/system/console/bundles/` URL. Locate `com.day.cq.dam.cq-dam-switchengine` bundle and its ID.

1. Ensure that all the required libraries are extracted, by checking the folder using the command `ls -la /aem65/author/crx-quickstart/launchpad/felix/bundle<id>/data/binaries/`, where the folder name is constructed using the bundle ID. For example, the command will be `ls -la /aem65/author/crx-quickstart/launchpad/felix/bundle588/data/binaries/` if bundle id is `588`.

1. Create `SWitchEngineLibs.conf` file to point to the libraries using the following commands:

    ```
    cd `/etc/ld.so.conf.d`
    touch SWitchEngineLibs.conf
    vi SWitchEngineLibs.conf
    ```

   Add `/aem65/author/crx-quickstart/launchpad/felix/bundle<id>/data/binaries/` path to the conf file using `cat SWitchEngineLibs.conf` command.

1. Execute `ldconfig` command to create the necessary links and cache.

1. In the account that is used to start AEM, edit `.bash_profile` file. Add `LD_LIBRARY_PATH` by adding the following.

   ```
   LD_LIBRARY_PATH=.
   export LD_LIBRARY_PATH
   ```

   To ensure that the value of the path is set to `.`, use `echo $LD_LIBRARY_PATH` command. The output should just be `.`. If the value is not set to "." restart the session.

### Configure DAM Update Assets workflow {#configure-dam-asset-update-workflow}

1. Tap/click the AEM logo, and go to **[!UICONTROL Tools > Workflow > Models]**.

1. From the **[!UICONTROL Workflow Models]** page, open the **[!UICONTROL DAM Update Asset]** workflow model in edit mode.

1. Open the **[!UICONTROL Process Thumbnails]** workflow process step. In the **[!UICONTROL Thumbnails]** tab, add the MIME types for which you want to skip the default thumbnail generation process in the **[!UICONTROL Skip Mime Types]** list.
For example, if you want to create thumbnails for a TIFF image using Imaging Transcoding Library, specify `skip:image/tiff` in the **[!UICONTROL Skip Mime Types]** field.

1. In the **[!UICONTROL Web Enabled Image]** tab, add the MIME types for which you want to skip the default web rendition generation process in **[!UICONTROL Skip List]**. For example, if you skipped MIME type `image/tiff` in the above step, add `image/tiff` to the skip list.

1. Open the **[!UICONTROL EPS thumbnails (powered by ImageMagick)]** step, navigate to the **[!UICONTROL Arguments]** tab. In the **[!UICONTROL Mime Types]** list, add the MIME types you want Imaging Transcoding Library to process. For example, if you skipped the MIME type `image/tiff` in the above step, add `image/jpeg` to the **[!UICONTROL Mime Types]** list.

1. Remove the default commands if any exists.

1. Toggle side panel and from the list of steps add **[!UICONTROL SWitchEngine Handler]**.

1. Add commands to the [!UICONTROL SwitchEngine Handler] based on your custom requirements. Tune the parameters of commands that you specify to meet your requirements. For example, if you want to preserve the color profile of your JPEG image, add the following commands to the **Commands** list:

    * `SWitchEngine -input ${file} -destMime PNG -resize 48 -output ${directory}cq5dam.thumbnail.48.48.png`
    * `SWitchEngine -input ${file} -destMime PNG -resize 140x100 -output ${directory}cq5dam.thumbnail.140.100.png`
    * `SWitchEngine -input ${file} -destMime PNG -resize 319 -output ${directory}cq5dam.thumbnail.319.319.png`
    * `SWitchEngine -input ${file} -destMime JPEG -resize 1280 -preserveCMYK -output ${directory}cq5dam.web.1280.1280.jpeg`

   ![chlimage_1-63](assets/chlimage_1-199.png)

1. (Optional) Generate thumbnails from an intermediate rendition using a single command. The intermediate rendition acts as source to generate static and web renditions. This method is faster than the earlier method. However, you cannot apply custom parameters to thumbnails using this method.

   ![chlimage_1-64](assets/chlimage_1-200.png)

1. To generate web renditions, configure parameters in the **[!UICONTROL Web-Enabled Image]** tab.

1. Sync the updated [!UICONTROL DAM Update Asset] workflow model. Save the workflow.

<!-- Hiding the screenshot for now.
![web_enabled_imagetab](assets/web_enabled_imagetab.png) -->

The verify the configuration, upload a TIFF image and monitor the error.log file. You will notice `INFO` messages with mentions of `SwitchEngineHandlingProcess execute: executing command line`. The logs mention the renditions generated. Once the workflow completes, you can view the new renditions in AEM.

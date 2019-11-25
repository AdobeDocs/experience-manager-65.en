---
title: Integrating AEM Assets with InDesign Server
description: Learn how to integrate AEM Assets with InDesign Server.
uuid: 3b202615-7d8d-484d-83e3-f7eb49b47cc4
contentOwner: AG
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
discoiquuid: 0ed8426d-731a-4bf2-87ef-a1faeb44aae0
docset: aem65

---

# Integrating AEM Assets with InDesign Server {#integrating-aem-assets-with-indesign-server}

Adobe Experience Manager (AEM) Assets uses:

* A proxy to distribute the load of certain processing tasks. A proxy is an AEM instance that communicates with a proxy worker to fulfil a specific task, and other AEM instances to deliver the results.
* A proxy worker to define and manage a specific task.
  These can cover a wide variety of tasks; for example, using an InDesign Server to process files.

To fully upload files to AEM Assets that you have created with Adobe InDesign a proxy is used. This uses a proxy worker to communicate with the Adobe InDesign Server, where [scripts](https://www.adobe.com/devnet/indesign/documentation.html#idscripting) are run to extract metadata and generate various renditions for AEM Assets. The proxy worker enables the two-way communication between the InDesign Server and the AEM instance(s) in a cloud configuration.

>[!NOTE]
>
>Adobe InDesign comes as two products:
>
>* [InDesign](https://www.adobe.com/products/indesign.html)
>  This allows you design page layouts for print and/or digital distribution.
>
>* [InDesign Server](https://www.adobe.com/products/indesignserver.html)
>  This engine enables you to programmatically create automated documents based on what you have created with InDesign. It operates as a service offering an interface to its [ExtendScript](https://www.adobe.com/devnet/scripting.html) engine.
>  The scripts are written in extendscript, which is similar to javascript. For information about Indesign scripts see [https://www.adobe.com/devnet/indesign/documentation.html#idscripting](https://www.adobe.com/devnet/indesign/documentation.html#idscripting).
>

## How the Extraction Works {#how-the-extraction-works}

The Adobe InDesign Server can be integrated with AEM Assets so that INDD files created with InDesign can be uploaded, renditions generated, all media extracted (for example, video) and stored as assets:

>[!NOTE]
>
>Previous versions of AEM were able to extract XMP and the thumbnail, now all media can be extracted.

1. Upload your INDD file to AEM Assets.
1. A framework sends command script(s) to the InDesign Server via SOAP (Simple Object Access Protocol).
   This command script will:

    * Retrieve the INDD file.
    * Execute InDesign Server commands:

        * The structure, text and any media files are extracted.
        * PDF and JPG renditions are generated.
        * HTML and IDML renditions are generated.

    * Post the resulting files back to AEM Assets.

   >[!NOTE]
   >
   >IDML is an XML-based format that renders *everything* in the InDesign file. It is stored as an compressed package using [Zip](https://www.techterms.com/definition/zip) compression.
   >
   >
   >See [Adobe Press - InDesign Interchange Formats INX and IDML](https://www.adobepress.com/articles/article.asp?p=1381880&seqNum=8) for further information.

   >[!CAUTION]
   >
   >If the InDesign Server is not installed or not configured, then you can still upload an INDD file into AEM. However the renditions generated will be limited to PNG and JPEG. You will not be able to generate HTML, .idml, or the page renditions.

1. After the extraction and rendition generation:

    * The structure is replicated to a `cq:Page` (type of rendition).
    * The extracted text and files are stored in AEM Assets.
    * All renditions are stored in AEM Assets, in the asset itself.

## Integrating the InDesign Server with AEM {#integrating-the-indesign-server-with-aem}

To integrate the InDesign Server for use with AEM Assets and after configuring your proxy, you need to:

1. [Install the InDesign Server](#installing-the-indesign-server).
1. If required, [configure the AEM Assets Workflow](#configuring-the-aem-assets-workflow).
   This is only necessary if the default values are not appropriate for your instance.

1. Configure a [proxy worker for the InDesign Server](#configuring-the-proxy-worker-for-indesign-server).

### Installing the InDesign Server {#installing-the-indesign-server}

To install and start the InDesign Server for use with AEM:

1. Download and install the Adobe InDesign Server.

   >[!NOTE]
   >
   >InDesign Server (CS6 and higher).

1. If required, you can customize the configuration of your InDesign Server instance.

1. From the command line, start the server:

   `<*ids-installation-dir*>/InDesignServer.com -port 8080`

   This will start the server with the SOAP plugin listening on port 8080. All log messages and output are written directly to the command window.

   >[!NOTE]
   >
   >If you want to save the output messages to a file then use redirection; for example, under Windows:
   >
   >
   >`<ids-installation-dir>/InDesignServer.com -port 8080 > ~/temp/INDD-logfile.txt 2>&1`

### Configuring the AEM Assets Workflow {#configuring-the-aem-assets-workflow}

AEM Assets has a preconfigured workflow **DAM Update Asset**, that has several process steps specifically for InDesign:

* [Media Extraction](#media-extraction)
* [Page Extraction](#page-extraction)

This workflow is setup with default values that can be adapted for your setup on the various author instances (this is a standard workflow, so further information is available under [Editing a Workflow](/help/sites-developing/workflows-models.md#configuring-a-workflow-step)). If you are using the default values (including the SOAP port), then no configuration is needed.

After the setup, uploading InDesign files into AEM Assets (by any of the usual methods) will trigger the workflow required to process the asset and prepare the various renditions. Test your configuration by uploading an `.indd` file into AEM Assets to confirm that you see the different renditions created by IDS under `<*your_asset*>.indd/Renditions`

#### Media Extraction {#media-extraction}

This step controls the extraction of media from the INDD file.

To customize, you can edit **Arguments** tab of the **Media Extraction** step.

![Media extraction arguments and script paths](assets/media_extraction_arguments_scripts.png)

Media extraction arguments and script paths

* **ExtendScript library**
  This is a simple http get/post method library, required by the other scripts.

* **Extend Scripts**
  You can specify different script combinations here. If you want your own scripts to be executed on the InDesign Server, save the scripts at `/apps/settings/dam/indesign/scripts`.
  For information about Indesign scripts see:
  [https://www.adobe.com/devnet/indesign/documentation.html#idscripting](https://www.adobe.com/devnet/indesign/documentation.html#idscripting)

>[!CAUTION]
>
>Do **not** change the **ExtendScript library**.

>
>This library provides the HTTP functionality required to communicate with Sling. This setting specifies the library to be send to the InDesign Server for use there.

The `ThumbnailExport.jsx` script run by the Media Extraction workflow step generates a thumbnail rendition in .jpg format. This rendition is used by the Process Thumbnails workflow step to generate the static renditions required by AEM.

You can configure the Process Thumbnails workflow step to generate static renditions at different sizes. Ensure that you do not remove the defaults, because they are required by the AEM Assets UI. Finally, the Delete Image Preview Rendition workflow step removes the .jpg thumbnail rendition, as it is no longer needed.

#### Page Extraction {#page-extraction}

This creates an AEM page from the extracted elements. An extraction handler is used to extract data from a rendition (currently HTML or IDML). This data is then used to create a page using the PageBuilder.

To customize, you can edit the **Arguments** tab of the **Page Extraction** step.

![chlimage_1-96](assets/chlimage_1-96.png)

* **Page Extraction Handler**
  From the drop down list, select the handler that you want to use. An extraction handler operates on a specific rendition, chosen by a related `RenditionPicker` (see the `ExtractionHandler` API).
  In a standard AEM installation the following is available:

  * IDML Export Extraction Handler
    Operates on the `IDML` rendition generated in the MediaExtract step.

* **Page Name**
  Specify the name you want to have assigned to the resulting page. If left blank then the name is "page" (or a derivative if "page" already exists).

* **Page Title**
  Specify the title you want to have assigned to the resulting page.

* **Page Root Path**
  The path to the root location of the resulting page.
  If left blank the node holding the asset's renditions will be used.

* **Page Template**
  The template to use when generating the resulting page.

* **Page Design**
  The page design to be used when generating the resulting page.

### Configuring the Proxy Worker for InDesign Server {#configuring-the-proxy-worker-for-indesign-server}

>[!NOTE]
>
>The worker resides on the proxy instance.

1. In the Tools console, expand **Cloud Services Configurations** in the left pane. Then expand **Cloud Proxy Configuration**.

1. Double-click the **IDS worker** to open for configuration.

1. Click **[!UICONTROL Edit]** to open the configuration dialog and define the required settings:

   ![proxy_idsworkerconfig](assets/proxy_idsworkerconfig.png)

    * **IDS Pool**
      The SOAP endpoint(s) to be used for communicating with the InDesign Server. You can add, remove and order items are required.

1. Click OK to save.

### Configuring Day CQ Link Externalizer  {#configuring-day-cq-link-externalizer}

If the InDesign server and AEM run on different hosts or either or both these applications do not run on default ports, configure **Day CQ Link Externalizer** to set the host name, port, and content path for the InDesign server.

1. Access Configuration Manager at the URL `https://[aem_server]:[port]/system/console/configMgr`.
1. Locate the configuration **Day CQ Link Externalizer**, and click the **Edit** icon to open it.
1. Specify the host name and context path for the Indesign server and click **Save**.

   ![chlimage_1-97](assets/chlimage_1-97.png)

### Enabling Parallel Job Processing for InDesign Server(s) {#enabling-parallel-job-processing-for-indesign-server-s}

You can now enable parallel job processing for IDS.

First you need to determine the maximum number of parallel jobs (`x`) an InDesign Server can process:

* On a single multiprocessor machine, the maximum number of parallel jobs (x) that an InDesign Server can process is one less than the number of processors running IDS.
* When you are running IDS on multiple machines you need to count the total number of processors available (ie on all machines) then subtract the total number of machines.

To configure the number of parallel IDS jobs:

1. Open the **Configurations** tab of the Felix Console; for example: `https://[aem_server]:[port]/system/console/configMgr`.

1. Select the IDS processing queue under:

   `Apache Sling Job Queue Configuration`

1. Set:

    * **Type** - `Parallel`
    * **Maximum Parallel Jobs** - `<*x*>` (as calculated above)

1. Save these changes.
1. Enable multisession support for CS6 (and above) by checking the:

   `enable.multisession.name` checkbox

   Under:

   `com.day.cq.dam.ids.impl.IDSJobProcessor.name configuration`

1. Create a [pool of `<*x*>` IDS workers by adding SOAP endpoints to the IDS Worker configuration](#configuring-the-proxy-worker-for-indesign-server).

   If there are multiple machines running InDesign Servers, add SOAP endpoints (number of processors per machine -1) for each machine.

   >[!NOTE]
   >
   >You may choose to enable Blacklisting of IDS workers when working with pool of workers.
   >
   >
   >To do so, enable the "enable.retry.name" checkbox, under the `com.day.cq.dam.ids.impl.IDSJobProcessor.name` configuration, which enables IDS job retrials.
   >
   >
   >Also, under the `com.day.cq.dam.ids.impl.IDSPoolImpl.name` configuration, set a positive value for `max.errors.to.blacklist` parameter which determines number of job retrials before barring an IDS from the job handlers list
   >
   >
   >By default, after the configurable (retry.interval.to.whitelist.name) time in minutes the IDS worker is revalidated. If the worker is found online, it is removed from the blacklist

## Enabling support for InDesign server 10.0 or higher {#enabling-support-for-indesign-server-or-higher}

For InDesign server 10.0 or higher, perform the following steps to enable multi-session support.

1. Open Configuration Manager from your AEM Assets instance `https://[aem_server]:[port]/system/console/configMgr`.
1. Edit the configuration `com.day.cq.dam.ids.impl.IDSJobProcessor.name`.
1. Select the **[!UICONTROL ids.cc.enable]** option, and click **[!UICONTROL Save]**.

>[!NOTE]
>
>For InDesign Server integration with AEM Assets, use a multi-core processor because the Session Support feature necessary for the integration is not supported on single core systems.

## Configure AEM credentials {#configure-aem-credentials}

You can change the default administrator credentials (user name and password) for accessing the InDesign server from your AEM instance without breaking the intergration with the InDesign server.

1. Go to `/etc/cloudservices/proxy.html`.
1. In the dialog, specify the new user name and password.
1. Save the credentials.

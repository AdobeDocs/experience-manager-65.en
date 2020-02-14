---
title: Use Connected Assets to share DAM assets in Adobe Experience Manager Sites authoring workflow
description: Use assets available on a remote Adobe Experience Manager Assets deployment when creating your web pages on another Experience Manager Site deployment.
contentOwner: AG
---

# Use Connected Assets to share DAM assets in AEM Sites {#use-connected-assets-to-share-dam-assets-in-aem-sites}

In large enterprises the infrastructure required to create websites may be distributed. At times the website creation capabilities and digital assets used to create these websites may reside in different deployments. A few reasons can be geographically distributed deployments required to work in tandem; acquisitions leading to heterogenous infrastructure that parent company wants to consolidate; growth leading to such scale that dedicated instance is required for asset management.

AEM Sites offers capabilities to create web pages and AEM Assets is the Digital Asset Management (DAM) system that supplies the required assets for websites. AEM now supports the above use case by integrating AEM Sites and AEM Assets.

## Overview of Connected Assets {#overview-of-connected-assets}

When editing pages in Page Editor, the authors can seamlessly search, browse, and embed assets from a different AEM Assets deployment. To do an AEM administrator do a one-time integration of a local deployment of AEM Sites with a different (remote) deployment of AEM Assets.

For the Sites authors, the remote assets are available as read-only local assets. The functionality supports seamless search and use of a few remote assets at a time. To make many remote assets available on local deployment in one-go, consider migrating the assets in bulk. See [Assets migration guide](/help/assets/assets-migration-guide.md).

### Prerequisites and supported deployments {#prerequisites}

Before you use or configure this capability, ensure the following:

* The users are part of appropriate user groups on each deployment.
* For Adobe Experience Manager deployment types, one of the supported criterion is met. AEM 6.5 Assets works with AEM as a Cloud Service. For more information, see [Connected Assets functionality in AEM as a Cloud Service](https://docs.adobe.com/content/help/en/experience-manager-cloud-service/assets/admin/use-assets-across-connected-assets-instances.html).

  ||AEM Sites as a Cloud Service |AEM 6.5 Sites on AMS| AEM 6.5 Sites on-premise|
  |---|---|---|---|
  |**AEM Assets as a Cloud Service**| Supported | Supported | Supported |
  |**AEM 6.5 Assets on AMS** | Not Supported | Supported | Supported |
  |**AEM 6.5 Assets on-premise** | Not Supported |Not Supported | Not Supported |

### Supported file formats {#mimetypes}

Authors can search for images and the following types of documents in Content Finder and use the searched assets in Page Editor. Documents can be added to the `Download` component and images can be added to the `Image` component. Authors can also add the remote assets in any custom AEM component that extends the default `Download` or `Image` components.

* Microsoft Word (DOC and DOCX)
* Microsoft Excel (XLS and XLSX)
* Microsoft PowerPoint (PPT and PPTX)
* Adobe PDF (PDF)
* OpenDocument Text (ODT)
* Rich Text Format (RTF)
* Plain text (TXT)
* Web pages (HTML)

### Users and groups involved {#users-and-groups-involved}

The various roles that are involved to configure and use the capability and their corresponding user groups are described below. Local scope is used for the use case where a web page is created by an author. Remote scope is used for the DAM deployment hosting the required assets. The Sites author fetches these remote assets.

| Role | Scope | User group | User name in walk-through | Requirement |
|----------------------------------|--------|------------------------------------------------------------------------------|--------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| AEM Sites Administrator | Local | AEM administrator | `admin` | Set up AEM, configure integration with the remote Assets deployment. |
| DAM user | Local | Author | `ksaner` | Used to view and duplicate the fetched assets at `/content/DAM/connectedassets/`. |
| AEM Sites author | Local | Author (with read access on the remote DAM and author access on local Sites) | `ksaner` | End user are Sites authors who use this integration to improve their content velocity. The authors search and browse assets in remote DAM using Content Finder and using the required images in local web pages. The credentials of `ksaner` DAM user are used. |
| AEM Assets administrator | Remote | AEM Administrator | `admin` on remote AEM | Configure Cross-Origin Resource Sharing (CORS). |
| DAM user | Remote | Author | `ksaner` on remote AEM | Author role on the remote AEM deployment. Search and browse assets in Connected Assets using the Content Finder. |
| DAM distributor (technical user) | Remote | package-builders and site authors | `ksaner` on remote AEM | This user present on the remote deployment is used by AEM local server (not the Site author role) to fetch the remote assets, on behalf of Sites author. This role is not same as above two `ksaner` roles and belongs to a different user group. |

## Configure a connection between Sites and Assets deployments {#configure-a-connection-between-sites-and-assets-deployments}

An AEM administrator can create this integration. Once created, the permissions required to use it are established via user groups that are defined on the Sites deployment and on the DAM deployment.

To configure Connected Assets and local Sites connectivity, follow these steps.

1. Access an existing AEM Sites deployment or create a deployment using the following command:

    1. In the folder of the JAR file, execute the following command on a terminal to create each AEM server.
       `java -XX:MaxPermSize=768m -Xmx4096m -jar <quickstart jar filepath> -r samplecontent -p 4502 -nofork -gui -nointeractive &`

    1. After a few minutes, the AEM server starts successfully. Consider this AEM Sites deployment as the local machine for web page authoring, say at `https://[local_sites]:4502`.

1. Ensure that the users and roles with local scope exist on the AEM Sites deployment and on the AEM Assets deployment on AMS. Create a technical user on Assets deployment and add to the user group mentioned in [users and groups involved](/help/assets/use-assets-across-connected-assets-instances.md#users-and-groups-involved).

1. Access the local AEM Sites deployment at `https://[local_sites]:4502`. Click **[!UICONTROL Tools]** > **[!UICONTROL Assets]** > **[!UICONTROL Connected Assets Configuration]** and provide the following values:

    1. AEM Assets location is `https://[assets_servername_ams]:[port]`.
    1. Credentials of a DAM distributor (technical user).
    1. In **[!UICONTROL Mount Point]** field, enter the local AEM path where AEM fetches the assets. For example, `remoteassets` folder.

    1. Adjust the values of **[!UICONTROL Original Binary transfer optimization Threshold]** depending on your network. An asset rendition with a size that is greater than this threshold, is transferred asynchronously.
    1. Select **[!UICONTROL Datastore Shared with Connected Assets]**, if you use a datastore to store your assets and the Datastore is the common storage between both AEM deployments. In this case, the threshold limit does not matter as actual asset binaries reside on the datastore and are not transferred.

   ![A typical configuration for Connected Assets](assets/connected-assets-typical-config.png)

   *Figure: A typical configuration for Connected Assets*

1. As the assets are already processed and the renditions are fetched, disable the workflow launchers. Adjust the launcher configurations on the local (AEM Sites) deployment to exclude the `connectedassets` folder, in which the remote assets are fetched.

    1. On AEM Sites deployment, click **[!UICONTROL Tools]** > **[!UICONTROL Workflow]** > **[!UICONTROL Launchers]**.

    1. Search for Launchers with workflows as **[!UICONTROL DAM Update Asset]** and **[!UICONTROL DAM Metadata Writeback]**.

    1. Select the workflow launcher and click **[!UICONTROL Properties]** on the action bar.

    1. In the Properties wizard, change the **[!UICONTROL Path]** fields as the following mappings to update their regular expressions to exclude the mount point **[!UICONTROL connectedassets]**.

   | Before | After |
   |---|---|
   | /content/dam(/((?!/subassets).)&#42;/)renditions/original |/content/dam(/((?!/subassets)(?!connectedassets).)&#42;/)renditions/original |
   | /content/dam(/.&#42;/)renditions/original |/content/dam(/((?!connectedassets).)&#42;/)renditions/original |
   | /content/dam(/.&#42;)/jcr:content/metadata |/content/dam(/((?!connectedassets).)&#42;/)jcr:content/metadata |

   >[!NOTE]
   >
   >All renditions that are available on the remote AEM deployment are fetched, when authors fetch an asset. If you want to create more renditions of a fetched asset, skip this configuration step. The DAM Update Asset workflow gets triggered and creates more renditions. These renditions are available only on the local Sites deployment and not on the remote DAM deployment.

1. Add the AEM Sites instance as one of the **[!UICONTROL Allowed Origins]** on the remote AEM Assets' CORS configuration.

    1. Login using the administrator credentials. Search for Cross-Origin. Access **[!UICONTROL Tools]** > **[!UICONTROL Operations]** > **[!UICONTROL Web Console]**.

    1. To create a CORS configuration for AEM Sites instance, click ![aem_assets_add_icon](assets/aem_assets_add_icon.png) icon next to **[!UICONTROL Adobe Granite Cross-Origin Resource Sharing Policy]**.

    1. In the field **[!UICONTROL Allowed Origins]**, input the URL of the local Sites, that is, `https://[local_sites]:[port]`. Save the configuration.

## Use remote assets {#use-remote-assets}

The website authors use Content Finder to connect to the DAM instance. The authors can browse, search for, and drag the remote assets in a component. To authenticate to the remote DAM, keep the credentials of the DAM user provided by your administrator handy.

Authors can use the assets available on both, the local DAM and the remote DAM instances, in a single web page. Use the Content Finder to switch between searching the local DAM or searching the remote DAM.

Only those tags of remote assets are fetched that have an exact corresponding tag&mdash;with the same taxonomy hierarchy&mdash;available on the local Sites instance. Any other tags are discarded. Authors can search for remote assets using all the tags present on the remote AEM deployment, as AEM offers a full-text search.

### Walk-through of usage {#walk-through-of-usage}

Use the above setup to try the authoring experience to understand how the functionality works. Use documents or images of your choice on the remote DAM deployment.

1. Navigate to the Assets UI on the remote deployment by accessing **[!UICONTROL Assets]** > **[!UICONTROL Files]** from AEM workspace. Alternatively, access `https://[assets_servername_ams]:[port]/assets.html/content/dam` in a browser. Upload the assets of your choice.
1. On the Sites instance, in the profile activator in the upper-right corner, click **[!UICONTROL Impersonate as]**. Provide `ksaner` as user name, select the option provided, and click **[!UICONTROL OK]**.
1. Open a We.Retail website page at **[!UICONTROL Sites]** > **[!UICONTROL We.Retail]** > **[!UICONTROL us]** > **[!UICONTROL en]**. Edit the page. Alternatively, access `https://[aem_server]:[port]/editor.html/content/we-retail/us/en/men.html` in a browser to edit a page.

   Click **[!UICONTROL Toggle Side Panel]** on upper-left corner of the page.

1. Open the Assets tab and click **[!UICONTROL Log in to Connected Assets]**.
1. Provide the credentials -- `ksaner` as user name and `password` as password. This user has authoring permissions on both the AEM deployments.
1. Search for the asset that you added to DAM. The remote assets are displayed in the left panel. Filter for images or documents and further filter for types of supported documents. Drag the images on an `Image` component and documents on a `Download` component.

   The fetched assets are read-only on the local AEM Sites deployment. You can still use the options provided by your AEM Sites components to edit the fetched asset. The editing by components is non-destructive.

   ![Options to filter document types and images when searching assets on remote DAM](assets/filetypes_filter_connected_assets.png)

   *Figure: Options to filter document types and images when searching assets on remote DAM*

1. A site author is notified if an asset is fetched asynchronously and if any fetch task fails. While authoring or even after authoring, the authors can see detailed information about fetch tasks and errors in the [async jobs](/help/assets/asynchronous-jobs.md) user interface.

   ![Notification about asynchronous fetching of assets that happens in the background.](assets/assets_async_transfer_fails.png)

   *Figure: Notification about asynchronous fetching of assets that happens in the background.*

1. When publishing a page, AEM displays a complete list of assets that are used in the page. Ensure that the remote assets are fetched successfully at the time of publishing. To check the status of each fetched asset, see [async jobs](/help/assets/asynchronous-jobs.md) user interface.

   >[!NOTE]
   >
   >Even if one or more remote assets are not fetched, the page is published. The component using the remote asset is published empty. The AEM notification area displays notification for errors that show in async jobs page.

>[!CAUTION]
>
>Once used in a web page, the fetched remote assets are searchable and usable by anyone who has permissions to access the local folder where the fetched assets are stored (`connectedassets` in the above walk-through). The assets are also searchable and visible in the local repository via [!UICONTROL Content Finder].

The fetched assets can be used as any other local asset, except that the associated metadata cannot be edited.

## Limitations {#limitations}

**Permissions and managing assets**

* Local assets are not synchronized with the original assets on the remote deployment. Any edits, deletions, or revoking of permissions on the DAM deployment are not propagated downstream.
* Local assets are read-only copies. AEM components do non-destructive edits to assets. No other edits are allowed.
* Locally fetched assets are available for authoring purposes only. Asset update workflows cannot be applied and metadata cannot be edited.
* Only images and the listed document formats are supported. Dynamic Media assets, Content Fragments, and Experience Fragments are not supported.
* Metadata schemas are not fetched.
* All Sites Authors have read permissions on the fetched copies, even if they do not have access to the remote DAM deployment.
* No API support to customize the integration.
* The functionality supports seamless search and use of remote assets. To make many remote assets available on local deployment in one-go, consider migrating the assets. See [Assets migration guide](assets-migration-guide.md).
* It is not possible to use a remote asset as a thumbnail for a web page in the [!UICONTROL Thumbnail] tab in [!UICONTROL Page Properties] by clicking [!UICONTROL Select Image].

**Set up and licensing**

* AEM Assets deployment on AMS is supported.
* AEM Sites can connect to a single AEM Assets repository at a time.
* A license of AEM Assets working as remote repository.
* One or more licenses of AEM Sites working as local authoring deployment.

**Usage**

* Only functionality supported is searching for remote assets and dragging the remote assets on local page to author content.
* Fetch operation times out after 5 seconds. Authors can have issues fetching assets, say if there are network issues. Authors can re-attempt by dragging the remote asset from [!UICONTROL Content Finder] to [!UICONTROL Page Editor].
* Simple edits that are non-destructive and the edit supported via the AEM `Image` component, can be done on fetched assets. Assets are read-only.

## Troubleshoot issues {#troubleshoot}

Follow these steps to troubleshoot for the common error scenarios:

* If you cannot search for remote assets from the Content Finder, re-check and ensure that the required roles and permissions are in place.
* An asset fetched from remote dam may not be published on a web page for the following reasons: it doesn't exist on remote; lack of appropriate permissions to fetch it; network failure. Ensure that the asset is not removed from the remote DAM or permissions aren't changed; ensure that appropriate prerequisites are met; retry adding the asset to the page and republish. Check the [list of asynchronous jobs](/help/assets/asynchronous-jobs.md) for errors in asset fetching.

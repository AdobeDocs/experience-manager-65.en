---
title: Use Connected Assets to share DAM assets in AEM Sites
seo-title: Use assets from a Connected Assets instance in your web pages
description: Use assets available on a remote AEM Assets instance when creating your web pages.
seo-description: Use assets available on a remote AEM Assets instance when creating your web pages.
uuid: 6391052b-2b11-4d79-8a07-997d5d9742e7
contentOwner: asgupta
topic-tags: authoring
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
discoiquuid: e3f1bf41-9fe6-482c-b5e4-5d3adc921f13
index: y
internal: n
snippet: y
---

# Use Connected Assets to share DAM assets in AEM Sites{#use-connected-assets-to-share-dam-assets-in-aem-sites}

In large enterprises the infrastructure required to create websites may be distributed. At times the website creation capabilities and digital assets used to create these websites may reside in different deployments. A few reasons can be geographically distributed instances required to work in tandem; acquisitions leading to heterogenous infrastructure that parent company wants to consolidate; growth leading to such scale that dedicated instance is required for asset management.

AEM Sites offers capabilities to create web pages and AEM Assets is the Digital Asset Management (DAM) system that supplies the required assets for websites. AEM now supports the above use case by integrating AEM Sites and AEM Assets.

## Overview of Connected Assets {#overview-of-connected-assets}

AEM now provides capability to use assets from a DAM repository in websites created on separate AEM instances. While editing pages in Page Editor, the authors can seamlessly search, browse, and embed assets from a different AEM Assets instance.

You can integrate your local instances of AEM Sites with a different (remote) deployment of AEM Assets. Your authors can browse, search for, and use assets just as they do for local instance of Assets. AEM Administrators do a one-time integration between the two AEM instances and users continue to use the functionality seamlessly after authentication. For the Sites authors, the remote assets continue to be available and behave as read-only local assets.

The functionality supports seamless search and use of remote assets. To make many remote assets available on local deployment in one-go, consider migrating the assets. See [Assets migration guide](/assets/using/assets-migration-guide.md).

### Prerequisites {#prerequisites}

Before you use or configure this capability, ensure the following:

* An AEM 6.5 Assets instance on AMS.
* AEM 6.5 Sites instance on AMS or an on-premise instance.  
* The users are part of appropriate user groups on each instance.

### Users and groups involved {#users-and-groups-involved}

usersgroups

The various roles that are involved to configure and use the capability and their corresponding user groups are described below. Local scope is used for the use case where a web page is created by an author. Remote scope is used for the DAM instance hosting the required assets. The Sites author fetches these remote assets.

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <th scope="row" style="text-align: center;" valign="middle">Role<br /> </th> 
   <th>Scope</th> 
   <th style="text-align: center;">User group</th> 
   <th>User name in walkthrough</th> 
   <th scope="row" style="text-align: center;" valign="middle">Requirement<br /> </th> 
  </tr> 
  <tr> 
   <td>AEM Sites administrator<br /> </td> 
   <td>Local</td> 
   <td>AEM Administrator</td> 
   <td><span class="code">admin</span></td> 
   <td>Set up AEM, configure integration with the remote Assets instance.</td> 
  </tr> 
  <tr> 
   <td>DAM user</td> 
   <td>Local</td> 
   <td>Author</td> 
   <td><span class="code">ksaner</span></td> 
   <td>Used to view and duplicate the fetched assets at <span class="code">/content/DAM/connectedassets/</span>.</td> 
  </tr> 
  <tr> 
   <td>AEM Sites author</td> 
   <td>Local</td> 
   <td>Author (with read access on the remote DAM and author access on local Sites)</td> 
   <td><span class="code">ksaner</span></td> 
   <td>End user are Sites authors who use this integration to improve their content velocity. The authors search and brows assets in remote DAM using Content Finder and using the required images in local web pages. The credentials of ksaner DAM user are used.</td> 
  </tr> 
  <tr> 
   <td>AEM Assets administrator</td> 
   <td>Remote</td> 
   <td>AEM Administrator</td> 
   <td><span class="code">admin</span> on remote AEM<br /> </td> 
   <td>Configure Cross-Origin Resource Sharing (CORS).</td> 
  </tr> 
  <tr> 
   <td>DAM user<br /> </td> 
   <td>Remote</td> 
   <td>Author</td> 
   <td><span class="code">ksaner</span> on remote AEM<br /> </td> 
   <td>Author role on the remote AEM instance. Search and browse assets in Connected Assets using the Content Finder.</td> 
  </tr> 
  <tr> 
   <td>DAM distributor (technical user)</td> 
   <td>Remote</td> 
   <td>package-builders and site authors</td> 
   <td><span class="code">ksaner</span> on remote AEM<br /> </td> 
   <td>This user present on the remote instance is used by AEM local server (not the Site author role) to fetch the remote assets, on behalf of Sites author. This role is not same as above two <span class="code">ksaner</span> roles and belongs to a different user group.<br /> </td> 
  </tr> 
 </tbody> 
</table>

## Configure a connection between Sites and Assets instances {#configure-a-connection-between-sites-and-assets-instances}

An AEM administrator can create this integration. Once created, the permissions required to use it are established via user groups that are defined on the Sites instances and on the DAM instance.

To configure Connected Assets and local Sites connectivity, follow these steps.

1. Access an existing AEM Sites instance or create an instance using the following command:

    1. In the folder of the JAR file, execute the following command on a terminal to create each AEM instance.  
       `java -XX:MaxPermSize=768m -Xmx4096m -jar <quickstart jar filepath> -r samplecontent -p 4502 -nofork -gui -nointeractive &`
    
    1. After a few minutes, the AEM server starts successfully. Consider this AEM Sites instance as the local machine for web page authoring, say at `http://[local_sites]:4502`.

1. Ensure that the users and roles with local scope exist on the AEM Sites instance and on the AEM Assets instance on AMS. Create a technical user on Assets instance and add to the user group mentioned in [users and groups involved](../../assets/using/use-assets-across-connected-assets-instances.md#usersgroups).  

1. Access the local AEM Sites instance at `http://[local_sites]:4502`. Click **[!UICONTROL Tools]** > **[!UICONTROL Assets]** > **[!UICONTROL Connected Assets Configuration]** and provide the following values:

    1. AEM Assets location is `https://[assets_servername_ams]:[port]`.
    1. Credentials of a DAM distributor (technical user).
    1. In **[!UICONTROL Mount Point]** field, enter the local AEM path where AEM fetches the assets. For example, `remoteassets` folder.
    
    1. Adjust the values of **[!UICONTROL Original Binary transfer optimization Threshold]** depending on your network. An asset rendition with a size that is greater than this threshold, is transferred asynchronously.

   ![A typical configuration for Connected Assets](assets/connected-assets-typical-config.png)

   A typical configuration for Connected Assets

1. As the assets are already processed and the renditions are fetched, disable the workflow launchers. Adjust the launcher configurations on the local (AEM Sites) instance to exclude the **[!UICONTROL connectedassets]** folder, in which the remote assets are fetched.

    1. On AEM Sites instance, click **[!UICONTROL Tools]** > **[!UICONTROL Workflow]** > **[!UICONTROL Launchers]**.
    
    1. Search for Launchers with workflows as **[!UICONTROL DAM Update Asset]** and **[!UICONTROL DAM Metadata Writeback]**.  
    
    1. Select the workflow launcher and click **[!UICONTROL Properties]** on the action bar.  
    
    1. In the Properties wizard, change the **[!UICONTROL Path]** fields as the following mappings to update their regular expressions to exclude the mount point **[!UICONTROL connectedassets]**.

   | **Before** |**After** |
   |---|---|
   | /content/dam(/((?!/subassets).)&#42;/)renditions/original |/content/dam(/((?!/subassets)(?!connectedassets).)&#42;/)renditions/original |
   | /content/dam(/.&#42;/)renditions/original |/content/dam(/((?!connectedassets).)&#42;/)renditions/original |
   | /content/dam(/.&#42;)/jcr:content/metadata |/content/dam(/((?!connectedassets).)&#42;/)jcr:content/metadata |

   >[!NOTE]
   >
   >All renditions available on the remote AEM instance are fetched, when authors fetch an asset. If you want to create more renditions of a fetched asset, skip this configuration step. The DAM Update Asset workflow gets triggered and creates more renditions. These renditions are available only on the local Sites deployment and not on the remote DAM instance.

1. Add the AEM Sites instance as one of the **[!UICONTROL Allowed Origins]** on the remote AEM Assets' CORS configuration.

    1. Login using the administrator credentials. Search for Cross-Origin. Access **[!UICONTROL Tools]** > **[!UICONTROL Operations]** > **[!UICONTROL Web Console]**.  
    
    1. To create a CORS configuration for AEM Sites instance, click ![](assets/aem_assets_add_icon.png) icon next to **[!UICONTROL Adobe Granite Cross-Origin Resource Sharing Policy]**.
    
    1. In the field **[!UICONTROL Allowed Origins]**, input the URL of the local Sites, that is, `http://[local_sites]:[port]`. Save the configuration.

## Use remote assets {#use-remote-assets}

The website authors use Content Finder to connect to the DAM instance. The authors can browse, search for, and drag-and-drop the remote assets in a component. To authenticate to the remote DAM, keep the credentials of the DAM user provided by your administrator handy.

Authors can use the assets available on both, the local DAM and the remote DAM instances, in a single web page. Use the Content Finder to switch between searching the local DAM or searching the remote DAM.

The tags applied on the remote assets are also fetched from Connected Assets and merged with the local taxonomy. When the fetched assets are published, the tags are published on the local Sites instance as well.

### Walk-through of usage {#walk-through-of-usage}

Use the above setup to try this authoring experience using assets of your choice.

1. Navigate to the Assets UI on the remote deployment by accessing **[!UICONTROL Assets]** > **[!UICONTROL Files]** from AEM workspace. Alternatively, access `http://[*assets_servername_ams*]:[*port*]/assets.html/content/dam` in a browser. Upload the assets of your choice.
1. On the Sites instance, in the profile activator in the upper-right corner, click **[!UICONTROL Impersonate as]**. Provide `ksaner` as user name, select the option provided, and click **[!UICONTROL OK]**.
1. Open a We.Retail website page at **[!UICONTROL Sites]** > **[!UICONTROL We.Retail]** > **[!UICONTROL us]** > **[!UICONTROL en]**. Edit the page. Alternatively, access `http://[*server*]:[port]/editor.html/content/we-retail/us/en/men.html` in a browser to edit a page.

   Click **[!UICONTROL Toggle Side Panel]** on upper left.

1. Open the Assets tab and click **[!UICONTROL Log in to Connected Assets]**.
1. Provide the credentials -- `ksaner` as user name and `password` as password. This user has authoring permissions on both the AEM instances.
1. Search for the asset that you added to DAM. The remote assets are displayed in the left panel. Drag-and-drop the asset on an Image component.

   ![Connected Assets search results](assets/connected-assets-tab.png)

   Connected Assets search results are displayed in side panel.

   ![ Drag-and-drop DAM assets from an AEM instance in Sites page on a different AEM instance](assets/connected-assets-drag-and-drop-only.gif)

   Drag-and-drop DAM assets from an AEM instance in Sites page on a different AEM instance

1. While the fetched assets are read-only, you can tweak the options allowed by your Sites components to edit the asset used in the Sites component. Publish the page.

>[!CAUTION]
>
>Once used in a web page, the fetched remote assets are searchable and usable by anyone who has permissions to access the local folder where the fetched assets are stored ( `connectedassets` in the above walk-through). The assets are also searchable and visible in the local repository via Content Finder.

The fetched assets can be used as any other local asset, except that the associated metadata cannot be edited.

## Limitations {#limitations}

**Permissions and managing assets**

* Local assets are not synchronized with the original assets on the remote instance. Any edits, deletions, or revoking of permissions on the DAM instance are not propagated downstream.
* Local assets are read-only copies. AEM components do non-destructive edits to assets. No other edits are allowed.  
* Locally fetched assets are available for authoring purposes only. Asset update workflows cannot be applied and metadata cannot be edited.
* Only image formats are supported. Dynamic Media, documents, content fragments, and experience fragments are not supported.
* Metadata schemas are not fetched.
* All Sites Authors have read permissions on the fetched copies, even if they do not have access to the remote DAM instance.  
* No API support to customize the integration.
* The functionality supports seamless search and use of remote assets. To make many remote assets available on local deployment in one-go, consider migrating the assets. See [Assets migration guide](/assets/using/assets-migration-guide.md).

**Set up**

* An AEM Assets 6.5 instance running on AMS is supported.  
* AEM Sites can connect to a single AEM Assets repository at a time.

**Licensing**

* A license of AEM Assets working as remote repository. 
* One or more licenses of AEM Sites working as local authoring instances.

**Usage**

* Fetch operation times out after 5 seconds. Authors can have issues fetching assets, say if there are network issues. Authors can re-attempt and drag-and-drop the remote asset from Content Finder to Page Editor.
* Simple edits that are non-destructive and the edit supported via the AEM Image component, can be done on fetched assets. Assets are read-only.


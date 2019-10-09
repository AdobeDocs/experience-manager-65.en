---
title: Asset link sharing
seo-title: Asset link sharing
description: This article describes how to share assets, folders, and collections within AEM Assets as a URL to external parties.
seo-description: Share assets, folders, and collections as a URL to external parties without them having to first log in to AEM Assets, thereby securing your asset repository.
uuid: 50fdb81f-7a38-4f61-9c6a-f814e30c63db
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: administering
content-type: reference
discoiquuid: e4f9827f-8283-4215-8a04-e48ecb556443
---

# Asset link sharing {#asset-link-sharing}

Adobe Experience Manager (AEM) Assets lets you share assets, folders, and collections as a URL with members of your organization and external entities, including partners and vendors. Sharing assets through a link is a convenient way of making resources available to external parties without them having to first log in to AEM Assets.

>[!NOTE]
>
>You require Edit ACL permission on the folders and assets that you want to share as a link.

## Share assets {#share-assets}

To generate the URL for assets you want to share with users, use the Link Sharing dialog. Users with administrator privileges or with read permissions at `*`/var/dam/share` location are able to view the links shared with them.

>[!NOTE]
>
>Before you share a link with users, ensure that Day CQ Mail Service is configured. An error occurs if you attempt to share a link without first [configuring Day CQ Mail Service](link-sharing.md#configure-day-cq-mail-service).

1. In the Assets user interface, select the asset to share as a link.
1. From the toolbar, click/tap the **[!UICONTROL Share Link]** ![assets_share](assets/assets_share.png).

   An asset link is auto-created in the **[!UICONTROL Share Link]** field. Copy this link and share it with the users. The default expiration time for the link is one day.

   ![Dialog with the Link Share](assets/chlimage_1-542.png)

   Dialog with the Link Share

   Alternatively, proceed to perform steps 3-7 of this procedure to add email recipients, configure the expiration time for the link, and send it from the dialog.

   >[!NOTE]
   >
   >If you want to share links from your AEM Author instance to external entities, ensure that you only expose the following URLs (which are used for link sharing) for GET requests only:
   >
   >* &lt;AEM Server&gt;/linkshare.html
   >* &lt;AEM Server&gt;/linksharepreview.html
   >* &lt;AEM Server&gt;/linkexpired.html
   > 
   >Block other URLs to ensure that your Author instance is secure.

   >[!NOTE]
   >
   >If a shared asset is moved to a different location, its link stops working. Re-create the link and reshare with the users.

1. From the web console, open the **[!UICONTROL Day CQ Link Externalizer]** configuration and modify the following properties in the **[!UICONTROL Domains]** field with the values mentioned against each:

    * local
    * author
    * publish

   For the `local` and `author` properties, provide the URL for the local and author instance respectively. Both `local` and `author` properties have the same value if you run a single AEM author instance. For `publish`, provide the URL for the publish instance.

1. In the email address box of the **[!UICONTROL Link Sharing]** dialog, type the email ID of the user you want to share the link with. You can also share the link with multiple users.

   If the user is a member of your organization, select the user's email ID from the suggested email IDs that appear in the list below the typing area. For an external user, type the complete email ID and then select it from the list.

   To enable emails to be sent out to users, configure the SMTP server details in [Day CQ Mail Service](link-sharing.md#configure-day-cq-mail-service).

   ![Share links to assets directly from the Link Sharing dialog](assets/chlimage_1-543.png)

   Share links to assets directly from the Link Sharing dialog

   >[!NOTE]
   >
   >If you enter an email ID of a user that is not a member of your organization, the words "External User" are prefixed with the email ID of the user.

1. In the **[!UICONTROL Subject]** box, enter a subject for the asset you want to share.
1. In the **[!UICONTROL Message]** box, enter an optional message.
1. In the **[!UICONTROL Expiration]** field, specify an expiration date and time for the link using the date picker. By default, the expiration date is set for a week from the date you share the link.

   ![chlimage_1-544](assets/chlimage_1-544.png)

1. To let users download the original image along with the renditions, select **[!UICONTROL Allow download of original file]**.

   >[!NOTE]
   >
   >By default, users can only download the renditions of the asset that you share as a link.

1. Click **[!UICONTROL Share]**. A message confirms that the link is shared with the user(s) through an email.
1. To view the shared asset, click/tap the link in the email that is sent to the user. The shared asset is displayed in the **[!UICONTROL Adobe Marketing Cloud]** page.

   ![chlimage_1-545](assets/chlimage_1-545.png)

   To toggle to the list view, click/tap the layout icon on the toolbar.

1. To generate a preview of the asset, click/tap the shared asset. Click/tap **[!UICONTROL Back]** on the toolbar to close the preview and return to the **[!UICONTROL Marketing Cloud]** page. If you have shared a folder, click/tap **[!UICONTROL Parent Folder]** to return to the parent folder.

   ![chlimage_1-546](assets/chlimage_1-546.png)

   >[!NOTE]
   >
   >AEM supports generating the preview of assets of these MIME types: JPG, PNG, GIF, BMP, INDD, PDF, and PPT. You can only download the assets of the other MIME types.

1. To download the shared asset, click/tap the **[!UICONTROL Select]** icon from the toolbar, click/tap the asset, and then click/tap **[!UICONTROL Download]** from the toolbar.

   ![chlimage_1-547](assets/chlimage_1-547.png)

1. To view the assets you shared as links, go to the Assets UI and click/tap the **[!UICONTROL GlobalNav]** icon. Choose **[!UICONTROL Navigation]** from the list to display the Navigation pane.
1. From the Navigation pane, choose **[!UICONTROL Shared Links]** to display a list of shared assets.
1. To unshare an asset, select it and tap/click **[!UICONTROL Unshare]** from the toolbar. A message confirms that you unshared the asset. In addition, the entry for the asset is removed from the list.

## Configure Day CQ mail service {#configure-day-cq-mail-service}

1. Click or tap the AEM logo, and then navigate to **[!UICONTROL Tools > Operations > Web Console]**.
1. From the list of services, locate **[!UICONTROL Day CQ Mail Service]**.
1. Click the **[!UICONTROL Edit]** icon beside the service, and configure the following parameters for **[!UICONTROL Day CQ Mail Service]** with the details mentioned against their names:

    * SMTP server host name: email server host name
    * SMTP server port: email server port
    * SMTP user: email server user name
    * SMTP password: email server password

   ![chlimage_1-548](assets/chlimage_1-548.png)

1. Click/tap **[!UICONTROL Save]**.

## Configure maximum data size {#configure-maximum-data-size}

When you download assets from the link shared using the Link Sharing feature, AEM compresses the entire asset hierarchy from the repository and then returns the asset in a ZIP file. However, in the absence of limits to the amount of data that can be compressed in a ZIP file, huge amounts of data is subjected to compression, which causes out of memory errors in JVM. To secure the system from a potential denial of service attack due to this situation, configure the maximum size using the **[!UICONTROL Max Content Size (uncompressed)]** parameter for **[!UICONTROL Day CQ DAM Adhoc Asset Share Proxy Servlet]** in Configuration Manager. If uncompressed size of the asset exceeds the configured value, asset download requests are rejected. The default value is 100 MB.

1. Click/Tap the AEM logo and then go to **[!UICONTROL Tools > Operations > Web Console]**.
1. From the web console, locate the **[!UICONTROL Day CQ DAM Adhoc Asset Share Proxy Servlet]** configuration.
1. Open the **[!UICONTROL Day CQ DAM Adhoc Asset Share Proxy Servlet]** configuration in edit mode, and modify the value of the **[!UICONTROL Max Content Size (uncompressed)]** parameter.

   ![chlimage_1-549](assets/chlimage_1-549.png)

1. Save the changes.

## Best practices and troubleshooting {#best-practices-and-troubleshooting}

* Asset folders or Collections that contain a whitespace in their name may not get shared.
* If users cannot download the shared assets, check with your AEM administrator what the [download limits](#configure-maximum-data-size) are.
* If you cannot send email with links to shared assets or if the other users cannot receive your email, check with your AEM administrator if the [email service](#configure-day-cq-mail-service) is configured or not.
* If you cannot share assets using link sharing functionality, ensure that you have the appropriate permissions. See [share assets](#share-assets).
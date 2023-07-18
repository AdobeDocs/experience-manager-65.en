---
title: Configure AEM Assets integration with Experience Cloud
description: Learn how to configure AEM Assets integration with Experience Cloud.
contentOwner: AG
feature: Asset Management
role: User, Architect, Admin
exl-id: d167cf97-6829-45a7-ba46-2239d530b060
---
# Configure AEM Assets integration with Experience Cloud {#configure-aem-assets-integration-with-experience-cloud-and-creative-cloud}

If you are an Adobe Experience Cloud customer, you can synchronize your assets within Adobe Experience Manager Assets with Adobe Creative Cloud, and conversely. You can also synchronize your assets with Experience Cloud and conversely. You can set up this synchronization through [!DNL Adobe I/O]. The updated name of [!DNL Adobe Marketing Cloud] is [!DNL Adobe Experience Cloud].

The workflow to set up this integration is:

1. Create an authentication in [!DNL Adobe I/O] using a public gateway and get an application ID.
1. Create a profile on your AEM Assets instance using the application ID.
1. Use this configuration to synchronize your assets.

At the backend, the AEM server authenticates your profile with the gateway and then synchronizes the data between Assets and Experience Cloud.

>[!NOTE]
>
>This feature is deprecated in [!DNL Assets]. Find replacements in [AEM and Creative Cloud Integration best practices](/help/assets/aem-cc-integration-best-practices.md). If you have any queries, [contact Adobe Customer Support](https://www.adobe.com/account/sign-in.supportportal.html).

<!-- Hiding this for now via cqdoc-16834.
![Flow of data when AEM Assets and Creative Cloud are integrated](assets/chlimage_1-48.png)

>[!NOTE]
>
>Sharing assets between Adobe Experience Cloud and Adobe Creative Cloud requires administrator privileges on the AEM instance.
-->

## Create an application {#create-an-application}

1. Access the Adobe Developer gateway interface by logging in at [https://legacy-oauth.cloud.adobe.io](https://legacy-oauth.cloud.adobe.io/).

   >[!NOTE]
   >
   >You require administrator privileges to create an application ID.

1. From the left pane, navigate to **[!UICONTROL Developer Tools]** > **[!UICONTROL Applications]** to view a list of applications.
1. Click **[!UICONTROL Add]** ![aem_assets_addcircle_icon](assets/aem_assets_addcircle_icon.png) to create an application.
1. From the **[!UICONTROL Client Credentials]** list, select **[!UICONTROL Service Account (JWT Assertion)]**, which is a server-to-server communication service for server authentication.

   ![chlimage_1-49](assets/chlimage_1-49.png)

1. Specify a name for the application and an optional description.
1. From the **[!UICONTROL Organization]** list, select the organization for which you want to synchronize assets.
1. From the **[!UICONTROL Scope]** list, select **[!UICONTROL dam-read]**, **[!UICONTROL dam-sync]**, **[!UICONTROL dam-write]**, and **[!UICONTROL cc-share]**.
1. Click **[!UICONTROL Create]**. A message notifies that the application is created.

   ![Notification of successful creation of the application to integrate AEM Assets with Creative Cloud](assets/chlimage_1-50.png)

1. Copy the **[!UICONTROL Application ID]** that is generated for the new application.

   >[!CAUTION]
   >
   >Ensure that you do not inadvertently copy the **[!UICONTROL Application Secret]** instead of the **[!UICONTROL Application ID]**.

## Add a new configuration to Experience Cloud {#add-a-new-configuration}

1. Click the AEM logo on the user interface of your local AEM Assets instance and navigate to **[!UICONTROL Tools]** > **[!UICONTROL Cloud Services]** > **[!UICONTROL Legacy Cloud Services]**.

1. Locate the **[!UICONTROL Adobe Experience Cloud]** service. If no configurations exist, click **[!UICONTROL Configure Now]**. If configurations exist, click **[!UICONTROL Show Configurations]** and click `+` to add a new configuration.

   >[!NOTE]
   >
   >Use an Adobe ID account that has administrator privileges for the organization.

1. In the **[!UICONTROL Create Configuration]** dialog, specify a title and name for the new configuration and click **[!UICONTROL Create]**.

   ![Name a new configuration to integrate AEM Assets and Creative Cloud](assets/aem-ec-integration-config1.png)

1. In the **[!UICONTROL Tenant URL]** field, specify the URL for AEM Assets. In the past, if the URL was defined as `https://<tenant_id>.marketing.adobe.com`, change it to `https://<tenant_id>.experiencecloud.adobe.com`.

   1. Navigate to **Tools &gt; Cloud Services &gt; Legacy Cloud Services**. Under Adobe Experience Cloud, click **Show Configurations**.
   1. Select the existing configuration to edit. Edit the configuration and replace `marketing.adobe.com` to `experiencecloud.adobe.com`.
   1. Save the configuration. Test the MAC-sync replication agents.

1. In the **[!UICONTROL Client ID]** field, paste the application ID you copied at the end of the procedure [create an application](#create-an-application).

   ![Provide the application ID values required to integrate AEM Assets and Creative Cloud](assets/cloudservices_tenant_info.png)

1. Under **[!UICONTROL Synchronization]** select **[!UICONTROL Enabled]** to enable synchronization and click **[!UICONTROL OK]**. If you select **disabled**, the synchronization works in a single direction.

1. From the configuration page, click **[!UICONTROL Display Public Key]** to display the public key generated for your instance. Alternatively, click **[!UICONTROL Download Public Key for OAuth Gateway]** to download the file containing the public key. Then, open the file to display the public key.

## Enable synchronization {#enable-synchronization}

1. Display the public key using one of the following methods mentioned in the last step of the procedure [add a new configuration to Experience Cloud](#add-a-new-configuration). Click **[!UICONTROL Display Public Key]**.

1. Copy the public key and paste it into the **[!UICONTROL Public Key]** field of configuration interface of the application you created in [create an application](#create-an-application).

   ![chlimage_1-53](assets/chlimage_1-53.png)

1. Click **[!UICONTROL Update]**. Synchronize your assets with the AEM Assets instance now.

## Test the synchronization {#test-the-synchronization}

1. Click the AEM logo on the user interface of your local AEM Assets instance and navigate to **[!UICONTROL Tools]**> **[!UICONTROL Deployment]**> **[!UICONTROL Replication]**to locate the replication profiles created for synchronization.
1. On the **[!UICONTROL Replication]** page, click **[!UICONTROL Agents on author]**.
1. From the list of profiles, click the default replication profile for your organization to open it.
1. In the dialog, click **[!UICONTROL Test Connection]**.

   ![Test connection and set the default replication profile for your organization](assets/chlimage_1-54.png)

1. When the replication rest completes, check for a success message at the end of the test results.

## Add users to Experience Cloud {#add-users-to-experience-cloud}

1. Log in to Experience Cloud using administrator credentials.
1. From the rails, go to **[!UICONTROL Administration]** and then click **[!UICONTROL Launch Enterprise Dashboard]**.
1. From the rail, click **[!UICONTROL Users]** to open the **[!UICONTROL User Management]** page.
1. From the toolbar, click **Add** ![aem_assets_add_icon](assets/aem_assets_add_icon.png).
1. Add one or more users that you want to provide the ability to share assets with Creative Cloud.

<!-- TBD: Check.
   >[!NOTE]
   >
   >Only the users that you add to Experience Cloud can share assets from AEM Assets to Creative Cloud.

-->

## Exchange assets between AEM Assets and Experience Cloud {#exchange-assets-between-aem-and-experience-cloud}

1. Log in to AEM Assets.
1. In the Assets console, create a folder and upload some assets to it. For example, create a folder **mc-demo** and upload an asset to it.
1. Select the folder and click **Share** ![assets_share](assets/do-not-localize/assets_share.png).
1. From the menu, select **[!UICONTROL Adobe Experience Cloud]** and the click **[!UICONTROL Share]**. A message notifies that the folder is shared with Experience Cloud.

   >[!NOTE]
   >
   >Sharing an Assets folder of the type `sling:OrderedFolder`, is not supported  in the context of sharing in Adobe Experience Cloud. If you want to share a folder, when creating it in AEM Assets, do not select the **[!UICONTROL Ordered]** option.

1. Refresh the AEM Assets user interface. The folder you created in the Assets console of your local AEM Assets instance is copied to the Experience Cloud user interface. The asset that you upload to the folder in AEM Assets appears in the copy of the folder in Experience Cloud after it is processed by the AEM server.
1. You can also upload an asset in the replicated copy of the folder in Experience Cloud. After it is processed, the asset appears in the shared folder in AEM Assets.

<!-- Removing as per PM guidance via https://jira.corp.adobe.com/browse/CQDOC-16834?focusedCommentId=22881523&page=com.atlassian.jira.plugin.system.issuetabpanels:comment-tabpanel#comment-22881523.

## Exchange assets between AEM Assets and Creative Cloud {#exchange-assets-between-aem-assets-and-creative-cloud}

>[!CAUTION]
>
>The AEM to Creative Cloud Folder Sharing feature is deprecated. Customers are strongly advised to use newer capabilities, like [Adobe Asset Link](https://helpx.adobe.com/enterprise/using/adobe-asset-link.html) or [AEM desktop app](https://helpx.adobe.com/experience-manager/desktop-app/aem-desktop-app.html). Learn more in [AEM and Creative Cloud Integration Best Practices](/help/assets/aem-cc-integration-best-practices.md).

AEM Assets lets you share folders containing assets with Adobe Creative Cloud users.

1. In the Assets console, select the folder to share with Creative Cloud.
1. From the toolbar, click **[!UICONTROL Share]** ![assets_share](assets/do-not-localize/assets_share.png).
1. From the list, select the **[!UICONTROL Adobe Creative Cloud]** option.

   >[!NOTE]
   >
   >The options are available for users with read permissions on the root. Users must have the required permission to access the replication agent information of Marketing Cloud.

1. In the **[!UICONTROL Creative Cloud Sharing]** page, add the user to share the folder with and choose a role for the user. Click **[!UICONTROL Save]** and click **[!UICONTROL OK]**.

1. Log on to Creative Cloud with the credentials of the user you shared the folder with. The shared folder is available in Creative Cloud.

The AEM Assets-Marketing Cloud synchronization is designed in a way that the user machine instance from where the asset is uploaded retains the right to modify the asset. Only these changes are propagated to the other instance.

For example, if an asset is uploaded from an AEM Assets (on premises) instance, the changes to the asset from this instance are propagated to the Marketing Cloud instance. However, the changes done from the Marketing Cloud instance to the same asset aren’t propagated to the AEM instance and conversely for asset uploaded from Marketing Cloud.
-->

>[!MORELIKETHIS]
>
>* [Assets and Creative Cloud integration best practices](/help/assets/aem-cc-integration-best-practices.md)

---
title: Configure AEM Assets with Brand Portal
seo-title: Configure AEM Assets with Brand Portal
description: Learn how to configure AEM Assets with Brand Portal for publishing assets and Collections to Brand Portal.
seo-description: Learn how to configure AEM Assets with Brand Portal for publishing assets and Collections to Brand Portal.
uuid: b95c046e-9988-444c-b50e-ff5ec8cafe14
topic-tags: brand-portal
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
discoiquuid: dca5a2ac-1fc8-4251-b073-730fd6f49b1c
docset: aem65
feature: Brand Portal
role: Admin
exl-id: ae33181c-9eec-421c-be55-4bd019de40b8
hide: yes
---
# Configure AEM Assets with Brand Portal {#configure-integration-65}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service  |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/assets/brand-portal/configure-aem-assets-with-brand-portal.html?lang=en)                  |
| AEM 6.5     | This article         |

Adobe Experience Manager Assets Brand Portal allows you to publish approved brand assets from Adobe Experience Manager Assets to Brand Portal and distribute them to the Brand Portal users.

AEM Assets is configured with Brand Portal via Adobe Developer Console, which procures an Adobe Identity Management Services (IMS) account token for authorization of the Brand Portal tenant.

>[!NOTE]
>
>Configuring AEM Assets with Brand Portal via Adobe Developer Console is supported on AEM 6.5.4.0 and above.
>
>Earlier, Brand Portal was configured via legacy OAuth Gateway, which uses the JSON Web Token (JWT) exchange to obtain an IMS Access token for authorization. 
>
>Configuration via legacy OAuth Gateway is no longer supported from April 6, 2020, and is changed to Adobe Developer Console.

>[!TIP]
>
>***For existing customers only*** 
>
>It is recommended to continue using the existing legacy OAuth Gateway configuration. In case, you encounter problems with legacy OAuth Gateway configuration, delete the existing configuration and create new configuration via Adobe Developer Console.

This help describes the following two use-cases:

* [New configuration](#configure-new-integration-65): If you are a new Brand Portal user and want to configure your AEM Assets author instance with Brand Portal, you can create configuration via Adobe Developer Console. 
* [Upgrade configuration](#upgrade-integration-65): If you are an existing Brand Portal user having configuration on legacy OAuth Gateway, delete the existing configuration and create new configuration via Adobe Developer Console.

The information provided is based on the assumption that anyone reading this Help is familiar with the following technologies:

* Installing, configuring, and administering Adobe Experience Manager and AEM packages.

* Using Linux and Microsoft Windows operating systems.

## Prerequisites {#prerequisites}

You require the following to configure AEM Assets with Brand Portal:

* An up and running AEM Assets author instance with the latest Service Pack
* A Brand Portal tenant URL
* A user with system administrator privileges on the IMS organization of the Brand Portal tenant 

[Download and install AEM 6.5](#aemquickstart)

[Download and install latest AEM Service Pack](#servicepack)

### Download and install AEM 6.5 {#aemquickstart}

It is recommended to have AEM 6.5 to set up an AEM author instance. If you do not have AEM up and running, download it from the following locations:

* If you are an existing AEM customer, download AEM 6.5 from [Adobe Licensing website](https://licensing.adobe.com).

* If you are an Adobe partner, use [Adobe Partner Training Program](https://adobe.allegiancetech.com/cgi-bin/qwebcorporate.dll?idx=82357Q) to request AEM 6.5.

After you download AEM, for instructions to set up an AEM author instance, see [deploying and maintaining](https://experienceleague.adobe.com/docs/experience-manager-65/deploying/deploying/deploy.html#default-local-install).

### Download and install AEM latest Service Pack {#servicepack}

For detailed instructions see, 

* [AEM 6.5 Service Pack Release Notes](https://experienceleague.adobe.com/docs/experience-manager-65/release-notes/service-pack/sp-release-notes.html) 

**Contact Support** if you are unable to find the latest AEM package or Service Pack.

## Create configuration {#configure-new-integration-65}

Configuring AEM Assets with Brand Portal requires configurations in both, AEM Assets author instance as well as Adobe Developer Console.

1. In AEM Assets, create an IMS account and generate a public certificate (public key).
1. In Adobe Developer Console, create a project for your Brand Portal tenant (organization).
1. Under the project, configure an API using the public key to create a service account (JWT) connection.
1. Get the service account credentials and JWT payload information.
1. In AEM Assets, configure the IMS account using the service account credentials and JWT payload.
1. In AEM Assets, configure the Brand Portal cloud service using the IMS account and Brand Portal endpoint (organization URL).
1. Test your configuration by publishing an asset from AEM Assets to Brand Portal.

>[!NOTE]
>
>An AEM Assets author instance shall only be configured with one Brand Portal tenant.

Perform the following steps in the listed sequence if you are configuring AEM Assets with Brand Portal for the first time: 
1. [Obtain public certificate](#public-certificate)
1. [Create service account (JWT) connection](#createnewintegration) 
1. [Configure IMS account](#create-ims-account-configuration)
1. [Configure cloud service](#configure-the-cloud-service)
1. [Test configuration](#test-integration)

### Create IMS configuration {#create-ims-configuration}

The IMS configuration authenticates your AEM Assets author instance with the Brand Portal tenant. 

IMS configuration includes two steps:

* [Obtain public certificate](#public-certificate) 
* [Configure IMS account](#create-ims-account-configuration)

### Obtain public certificate {#public-certificate}

The public key (certificate) authenticates your profile on Adobe Developer Console.

1. Log in to your AEM Assets author instance. The default URL is `http://localhost:4502/aem/start.html`.

1. From the **Tools** ![Tools](assets/do-not-localize/tools.png) panel, navigate to **[!UICONTROL Security]** > **[!UICONTROL Adobe IMS Configurations]**.

1. In Adobe IMS Configurations page, click **[!UICONTROL Create]**. It will redirect to the **[!UICONTROL Adobe IMS Technical Account Configuration]** page. By default, the **Certificate** tab opens.

1. Select **[!UICONTROL Adobe Brand Portal]** in the **[!UICONTROL Cloud Solution]** dropdown list.  

1. Select the **[!UICONTROL Create new certificate]** check box and specify an **alias** for the public key. The alias serves as name of the public key. 

1. Click **[!UICONTROL Create certificate]**. Then, click **[!UICONTROL OK]** to generate the public key.

   ![Create Certificate](assets/ims-config2.png)

1. Click the **[!UICONTROL Download Public Key]** icon and save the public key (.crt) file on your machine. 

   The public key will be used later to configure API for your Brand Portal tenant and generate service account credentials in Adobe Developer Console.

   ![Download Certificate](assets/ims-config3.png)

1. Click **[!UICONTROL Next]**. 

   In the **Account** tab, Adobe IMS account is created which requires the service account credentials that are generated in Adobe Developer Console. Keep this page open for now.

   Open a new tab and [create a service account (JWT) connection in Adobe Developer Console](#createnewintegration) to get the credentials and JWT payload for configuring the IMS account. 

### Create service account (JWT) connection {#createnewintegration}

In Adobe Developer Console, projects and APIs are configured at Brand Portal tenant (organization) level. Configuring an API creates a service account (JWT) connection. There are two methods to configure API, by generating a key pair (private and public keys) or by uploading a public key. To configure AEM Assets with Brand Portal, you must generate a public key (certificate) in AEM Assets and create credentials in Adobe Developer Console by uploading the public key. These credentials are required to configure the IMS account in AEM Assets. Once the IMS account is configured, you can configure the Brand Portal cloud service in AEM Assets.

Perform the following steps to generate the service account credentials and JWT payload:

1. Log in to Adobe Developer Console with system administrator privileges on the IMS organization (Brand Portal tenant). The default URL is [https://www.adobe.com/go/devs_console_ui](https://www.adobe.com/go/devs_console_ui).


   >[!NOTE]
   >
   >Ensure that you have selected the correct IMS organization (Brand Portal tenant) from the dropdown (organization) list located at the upper-right corner.

1. Click **[!UICONTROL Create new project]**. A blank project with a system-generated name is created for your organization. 

   Click **[!UICONTROL Edit project]** to update the **[!UICONTROL Project Title]** and **[!UICONTROL Description]**, and click **[!UICONTROL Save]**.
   
1. In the **[!UICONTROL Project overview]** tab, click **[!UICONTROL Add API]**.

1. In the **[!UICONTROL Add an API window]**, select **[!UICONTROL AEM Brand Portal]** and click **[!UICONTROL Next]**. 

   Ensure that you have access to the AEM Brand Portal service.

1. In the **[!UICONTROL Configure API]** window, click **[!UICONTROL Upload your public key]**. Then, click **[!UICONTROL Select a File]** and upload the public key (.crt file) that you have downloaded in the [obtain public certificate](#public-certificate) section. 

   Click **[!UICONTROL Next]**.

   ![Upload Public Key](assets/service-account3.png)

1. Verify the public key and click **[!UICONTROL Next]**.

1. Select **[!UICONTROL Assets Brand Portal]** as the default product profile and click **[!UICONTROL Save configured API]**. 

   <!-- 
   In Brand Portal, a default profile is created for each organization. The Product Profiles are created in admin console for assigning users to groups (based on the roles and permissions). For configuration with Brand Portal, the OAuth token is created at organization level. Therefore, you must configure the default Product Profile for your organization. 
   -->

   ![Select Product Profile](assets/service-account4.png)

1. Once the API is configured, you are redirected to the API overview page. From the left navigation under **[!UICONTROL Credentials]**, click on the **[!UICONTROL Service Account (JWT)]** option.

   >[!NOTE]
   >
   >You can view the credentials and perform actions such as generate JWT tokens, copy credential details, retrieve client secret, and so on.

1. From the **[!UICONTROL Client Credentials]** tab, copy the **[!UICONTROL client ID]**. 

   Click **[!UICONTROL Retrieve Client Secret]** and copy the **[!UICONTROL client secret]**.

   ![Service Account Credentials](assets/service-account5.png)

1. Navigate to the **[!UICONTROL Generate JWT]** tab and copy the **[!UICONTROL JWT Payload]** information. 

You can now use the client ID (API key), client secret, and JWT payload to [configure the IMS account](#create-ims-account-configuration) in AEM Assets.

<!--
### Create Adobe I/O integration {#createnewintegration}

Adobe I/O integration generates API Key, Client Secret, and Payload (JWT) which is required in setting up the IMS Account configurations.

1. Login to Adobe I/O Console with system administrator privileges on the IMS organization of the Brand Portal tenant.

   Default URL: [https://console.adobe.io/](https://console.adobe.io/) 

1. Click **[!UICONTROL Create Integration]**.

1. Select **[!UICONTROL Access an API]**, and click **[!UICONTROL Continue]**.

   ![Create New Integration](assets/create-new-integration1.png)

1. Create a new integration page opens. 
   
   Select your organization from the drop-down list.

   In **[!UICONTROL Experience Cloud]**, Select **[!UICONTROL AEM Brand Portal]** and click **[!UICONTROL Continue]**. 

   If the Brand Portal option is disabled for you, ensure that you have selected correct organization from the drop-down box above the **[!UICONTROL Adobe Services]** option. If you do not know your organization, contact your administrator.

   ![Create Integration](assets/create-new-integration2.png)

1. Specify a name and description for the integration. Click **[!UICONTROL Select a File from your computer]** and upload the `AEM-Adobe-IMS.crt` file downloaded in the [obtain public certificates](#public-certificate) section.

1. Select the profile of your organization. 

   Or, select the default profile **[!UICONTROL Assets Brand Portal]** and click **[!UICONTROL Create Integration]**. The integration is created.

1. Click **[!UICONTROL Continue to integration details]** to view the integration information. 

   Copy the **[!UICONTROL API Key]** 
   
   Click **[!UICONTROL Retrieve Client Secret]** and copy the Client Secret key.

   ![API Key, Client Secret, and payload information of an integration](assets/create-new-integration3.png)

1. Navigate to **[!UICONTROL JWT]** tab, and copy the **[!UICONTROL JWT payload]**.

   The API Key, Client Secret key, and JWT payload information will be used to create IMS account configuration.
-->

### Configure IMS account {#create-ims-account-configuration}

Ensure that you have performed the following steps:

* [Obtain public certificate](#public-certificate)
* [Create service account (JWT) connection](#createnewintegration)

Perform the following steps to configure the IMS account. 

1. Open the IMS Configuration and navigate to the **[!UICONTROL Account]** tab. You kept the page open while [obtaining the public certificate](#public-certificate).

1. Specify a **[!UICONTROL Title]** for the IMS account.

   In the **[!UICONTROL Authorization Server]** field, specify the URL: [https://ims-na1.adobelogin.com/](https://ims-na1.adobelogin.com/).  

   Specify client ID in the **[!UICONTROL API key]** field, **[!UICONTROL Client Secret]**, and **[!UICONTROL Payload]** (JWT payload) that you have copied while [creating the service account (JWT) connection](#createnewintegration).

   Click **[!UICONTROL Create]**.

   The IMS account is configured. 

   ![IMS Account configuration](assets/create-new-integration6.png)
   
1. Select the IMS account configuration and click **[!UICONTROL Check Health]**.

   Click **[!UICONTROL Check]** in the dialog box. On successful configuration, a message appears that the *Token is retrieved successfully*.

   ![](assets/create-new-integration5.png)

>[!CAUTION]
>
>You must have only one IMS configuration.
>
>Ensure that the IMS configuration passes the health check. If the configuration does not pass the health check, it is invalid. You must delete it and create a new, valid configuration.

### Configure cloud service {#configure-the-cloud-service}

Perform the following steps to configure the Brand Portal cloud service:

1. Log in to your AEM Assets author instance.

1. From the **Tools** ![Tools](assets/do-not-localize/tools.png) panel, navigate to **[!UICONTROL Cloud Services]** > **[!UICONTROL AEM Brand Portal]**.

1. In the Brand Portal Configurations page, click **[!UICONTROL Create]**.

1. Specify a **[!UICONTROL Title]** for the configuration. 

   Select the IMS configuration that you have created while [configuring the IMS account](#create-ims-account-configuration).

   In the **[!UICONTROL Service URL]** field, specify your Brand Portal tenant (organization) URL.   

   ![](assets/create-cloud-service.png)

1. Click **[!UICONTROL Save & Close]**. The cloud configuration is created. 

   Your AEM Assets author instance is now configured with the Brand Portal tenant. 

### Test configuration {#test-integration}

Perform the following steps to validate the configuration:

1. Log in to your AEM Assets cloud instance.

1. From the **Tools** ![Tools](assets/do-not-localize/tools.png) panel, navigate to **[!UICONTROL Deployment]** > **[!UICONTROL Replication]**.

   ![](assets/test-integration1.png)

1. In the Replication page, click **[!UICONTROL Agents on author]**.

   ![](assets/test-integration2.png)

   You can see the four replication agents created for your Brand Portal tenant. 

   Locate the replication agents of your Brand Portal tenant and click on the replication agent URL. 

   ![](assets/test-integration3.png)

   >[!NOTE]
   >
   >The replication agents work in parallel and share the job distribution equally, thereby increasing the publishing speed by four times the original speed. After the cloud service is configured, additional configuration is not required to enable the replication agents that are activated by default to enable parallel publishing of multiple assets.

1. To verify the connection between AEM Assets and Brand Portal, click on the **[!UICONTROL Test Connection]** icon.

   ![](assets/test-integration4.png)

   A message appears that your *test package is successfully delivered*.

   ![](assets/test-integration5.png)

1. Verify the test results on all four replication agents.


   >[!NOTE]
   >
   >Avoid disabling any of the replication agents, as it can cause the replication of the assets (running-in-queue) to fail.
   >
   >Ensure that all the four replication agents are configured to avoid timeout error. See [troubleshoot issues in parallel publishing to Brand Portal](https://experienceleague.adobe.com/docs/experience-manager-brand-portal/using/publish/troubleshoot-parallel-publishing.html#connection-timeout).
   >
   >Do not modify any autogenerated settings.

You can now:

* [Publish assets from AEM Assets to Brand Portal](../assets/brand-portal-publish-assets.md)
* [Publish assets from Brand Portal to AEM Assets](https://experienceleague.adobe.com/docs/experience-manager-brand-portal/using/asset-sourcing-in-brand-portal/brand-portal-asset-sourcing.html) - Asset Sourcing in Brand Portal 
* [Publish folders from AEM Assets to Brand Portal](../assets/brand-portal-publish-folder.md)
* [Publish collections from AEM Assets to Brand Portal](../assets/brand-portal-publish-collection.md) 
* [Publish presets, schemas, and facets to Brand Portal](https://experienceleague.adobe.com/docs/experience-manager-brand-portal/using/publish/publish-schema-search-facets-presets.html)
* [Publish tags to Brand Portal](https://experienceleague.adobe.com/docs/experience-manager-brand-portal/using/publish/brand-portal-publish-tags.html)

See [Brand Portal documentation](https://experienceleague.adobe.com/docs/experience-manager-brand-portal/using/home.html) for more information.


## Upgrade configuration {#upgrade-integration-65}

Perform the following steps in the listed sequence to upgrade your existing configurations to Adobe Developer Console: 
1. [Verify running jobs](#verify-jobs)
1. [Delete existing configurations](#delete-existing-configuration)
1. [Create configuration](#configure-new-integration-65)

### Verify running jobs {#verify-jobs}

Ensure that no publishing job is running on your AEM Assets author instance before you make any modifications. For that, you can verify the status of active jobs on all the four replication agents and ensure that the queues are idle.  

1. Log in to your AEM Assets author instance.

1. From the **Tools** ![Tools](assets/do-not-localize/tools.png) panel, navigate to **[!UICONTROL Deployment]** > **[!UICONTROL Deployment Replication]**.

1. In the Replication page, click **[!UICONTROL Agents on author]**.

   ![](assets/test-integration2.png)

1. Locate the replication agents of your Brand Portal tenant. 
   
   Ensure that the **Queue is Idle** for all the replication agents, no publishing job is active. 

   ![](assets/test-integration3.png)

### Delete existing configurations {#delete-existing-configuration}

You must run the following checklist while deleting the existing configurations:
* Delete all four replication agents
* Delete Brand Portal cloud service
* Delete MAC user 

1. Log in to your AEM Assets author instance and open CRX Lite as an administrator. The default URL is `http://localhost:4502/crx/de/index.jsp`.

1. Navigate to `/etc/replications/agents.author` and delete all the four replication agents of your Brand Portal tenant.

   ![](assets/delete-replication-agent.png)

1. Navigate to `/etc/cloudservices/mediaportal` and delete the Brand Portal cloud service configuration.

   ![](assets/delete-cloud-service.png)

1. Navigate to `/home/users/mac` and delete the **MAC user** of your Brand Portal tenant.

   ![](assets/delete-mac-user.png)


You can now [create configuration](#configure-new-integration-65) via Adobe Developer Console on your AEM 6.5 author instance. 



<!--
   Comment Type: draft

   <li> </li>
   -->

   <!--
   Comment Type: draft

   <li>Step text</li>
   -->

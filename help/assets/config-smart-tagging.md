---
title: Configure asset tagging using the Smart Content Service.
description: Learn how to configure smart tagging and enhanced smart tagging in [!DNL Adobe Experience Manager], using the Smart Content Service.
contentOwner: AG
---

# Configure asset tagging using the Smart Content Service {#configure-asset-tagging-using-the-smart-content-service}

You can integrate [!DNL Adobe Experience Manager] with the Smart Content Service using Adobe Developer Console. Use this configuration to access the Smart Content Service from within [!DNL Experience Manager].

The article details out the following key tasks that are required to configure the Smart Content Service. At the back end, the [!DNL Experience Manager] server authenticates your service credentials with the Adobe Developer Console gateway before forwarding your request to the Smart Content Service.

1. Create a Smart Content Service configuration in [!DNL Experience Manager] to generate a public key. [Obtain public certificate](#obtain-public-certificate) for OAuth integration.
1. [Create an integration in Adobe Developer Console](#create-adobe-i-o-integration) and upload the generated public key.
1. [Configure your deployment](#configure-smart-content-service) using the API key and other credentials from Adobe Developer Console.
1. [Test the configuration](#validate-the-configuration).
1. Optionally, [enable auto-tagging on asset upload](#enable-smart-tagging-in-the-update-asset-workflow-optional).

## Prerequisites {#prerequisites}

Before you can use the Smart Content Service, ensure the following to create an integration on Adobe Developer Console:

* An Adobe ID account that has administrator privileges for the organization.
* The Smart Content Service service is enabled for your organization.

To enable Enhanced Smart Tags, in addition to the above, also install the latest [AEM service pack](https://helpx.adobe.com/experience-manager/aem-releases-updates.html).

## Obtain public certificate {#obtain-public-certificate}

A public certificate allows you to authenticate your profile on Adobe Developer Console.

1. In the [!DNL Experience Manager] user interface, access **[!UICONTROL Tools]** > **[!UICONTROL Cloud Services]** > **[!UICONTROL Legacy Cloud Services]**.

1. In the Cloud Services page, click **[!UICONTROL Configure Now]** under **[!UICONTROL Assets Smart Tags]**.
1. In the **[!UICONTROL Create Configuration]** dialog, specify a title and name for the Smart Tags configuration. Click **[!UICONTROL Create]**.
1. In the **[!UICONTROL AEM Smart Content Service]** dialog, use the following values:

   **[!UICONTROL Service URL]**: `https://mc.adobe.io/marketingcloud/smartcontent`

   **[!UICONTROL Authorization Server]**: `https://ims-na1.adobelogin.com`

   Leave the other fields blank for now (to be provided later). Click **[!UICONTROL OK]**.

   ![Experience Manager Smart Content Service dialog to provide content service URL](assets/aem_scs.png)

   >[!NOTE]
   >
   >The URL provided as [!UICONTROL Service URL] is not accessible via browser and generates a 404 error. The configuration works OK with the same value of the [!UICONTROL Service URL] parameter. For the overall service status and maintenance schedule, see [https://status.adobe.com](https://status.adobe.com).

1. Click **[!UICONTROL Download Public Certificate for OAuth Integration]**, and download the public certificate file `AEM-SmartTags.crt`.

   ![A representation of the settings created for the smart tagging service](assets/smart-tags-download-public-cert.png)

### Reconfigure when a certificate expires {#certrenew}

After a certificate expires, it is no longer trusted. You cannot renew an expired certificate. To add a new certificate, follow these steps.

1. Log in your [!DNL Experience Manager] deployment as an administrator. Click **[!UICONTROL Tools]** > **[!UICONTROL Security]** > **[!UICONTROL Users]**.

1. Locate and click **[!UICONTROL dam-update-service]** user. Click on **[!UICONTROL Keystore]** tab.
1. Delete the existing **[!UICONTROL similaritysearch]** keystore with the expired certificate. Click **[!UICONTROL Save & Close]**.

   ![Delete the existing similaritysearch entry in Keystore to add a new security certificate](assets/smarttags_delete_similaritysearch_keystore.png)

   *Figure: Delete the existing `similaritysearch` entry in Keystore to add a new security certificate.*

1. Navigate to **[!UICONTROL Tools]** > **[!UICONTROL Cloud Services]** > **[!UICONTROL Legacy Cloud Services]**. Click **[!UICONTROL Asset Smart Tags]** > **[!UICONTROL Show Configuration]** > **[!UICONTROL Available Configurations]**. Click the required configuration.  

1. To download a public certificate, click **[!UICONTROL Download Public Certificate for OAuth Integration]**.
1. Access [https://console.adobe.io](https://console.adobe.io) and navigate to the existing Smart Content Services on the **[!UICONTROL Integrations]** page. Upload the new certificate. For more information, see the instructions in [Create Adobe Developer Console integration](#create-adobe-i-o-integration).

## Create Adobe Developer Console integration {#create-adobe-i-o-integration}

To use Smart Content Service APIs, create an integration in Adobe Developer Console to generate API Key, Technical Account Id, Organization Id, and Client Secret.

1. Access [https://console.adobe.io](https://console.adobe.io/) in a browser. Select the appropriate account and verify that the associated organization role is system administrator.
1. Create a project with any desired name. Click **[!UICONTROL Add API]**.
1. On the **[!UICONTROL Add an API]** page, select **[!UICONTROL Experience Cloud]** and select **[!UICONTROL Smart Content]**. Click **[!UICONTROL Next]**.
1. Select **[!UICONTROL Upload your public key]**. Provide the certificate file downloaded from [!DNL Experience Manager]. A message [!UICONTROL Public key(s) uploaded successfully] is displayed. Click **[!UICONTROL Next]**.
1. [!UICONTROL Create a new Service Account (JWT) credential] page displays the public key for the service account just configured. Click **[!UICONTROL Next]**.
1. On the **[!UICONTROL Select product profiles]** page, select **[!UICONTROL Smart Content Services]**. Click **[!UICONTROL Save configured API]**. A page displays more information about the configuration. Keep this page open to copy and add these values in Experience Manager when further configuring Smart Tags in [!DNL Experience Manager].

   ![In the Overview tab, you can review the information provided for integration.](assets/integration_details.png)

## Configure Smart Content Service {#configure-smart-content-service}

To configure the integration, use the values of Technical Account ID, Organization Id, Client Secret, Authorization Server, and API key fields from the Adobe Developer Console integration. Creating a Smart Tags cloud configuration allows authentication of API requests from the [!DNL Experience Manager] deployment.

1. In [!DNL Experience Manager], navigate to **[!UICONTROL Tools > Cloud Service > Legacy Cloud Services]** to open the [!UICONTROL Cloud Services] console.
1. Under the **[!UICONTROL Assets Smart Tags]**, open the configuration created above. On the service settings page, click **[!UICONTROL Edit]**.
1. In the **[!UICONTROL AEM Smart Content Service]** dialog, use the pre-populated values for the **[!UICONTROL Service URL]** and **[!UICONTROL Authorization Server]** fields.
1. For the fields **[!UICONTROL API Key]**, **[!UICONTROL Technical Account Id]**, **[!UICONTROL Organization Id]**, and **[!UICONTROL Client Secret]**, use the values generated above.

## Validate the configuration {#validate-the-configuration}

After you've completed the configuration, you can use a JMX MBean to validate the configuration. To validate, follow these steps.

1. Access your [!DNL Experience Manager] server at `https://[aem_server]:[port]`.
1. Go to **[!UICONTROL Tools > Operations > Web Console]** to open the OSGi console. Click **[!UICONTROL Main > JMX]**.
1. Click **[!UICONTROL com.day.cq.dam.similaritysearch.internal.impl]**. It opens **[!UICONTROL SimilaritySearch Miscellaneous Tasks]**.
1. Click **[!UICONTROL validateConfigs()]**. In the **[!UICONTROL Validate Configurations]** dialog, click **[!UICONTROL Invoke]**.

   The validation result is displayed in the same dialog.

## Enable smart tagging in the DAM Update Asset workflow (Optional) {#enable-smart-tagging-in-the-update-asset-workflow-optional}

1. In [!DNL Experience Manager], go to **[!UICONTROL Tools > Workflow > Models]**.
1. On **[!UICONTROL Workflow Models]** page, select the **[!UICONTROL DAM Update Asset]** workflow model.
1. Click **[!UICONTROL Edit]** from the toolbar.
1. Expand the Side Panel to display the steps. Drag **[!UICONTROL Smart Tag Asset]** step that is available in the DAM Workflow section and place it after the **[!UICONTROL Process Thumbnails]** step.

   ![Add smart tag asset step after the process thumbnail step in the DAM Update Asset workflow](assets/smart-tag-in-dam-update-asset-workflow.png)

   *Figure: Add smart tag asset step after the process thumbnail step in the [!UICONTROL DAM Update Asset] workflow.*

1. Open the step in edit mode. Under **[!UICONTROL Advanced Settings]**, ensure that the **[!UICONTROL Handler Advance]** option is selected.

   ![Configure DAM Update Asset workflow and add smart tag step](assets/smart-tag-step-properties-workflow1.png)

1. In the **[!UICONTROL Arguments]** tab, select **[!UICONTROL Ignore Errors]** if you want the workflow to complete even if the automatic tagging step fails.

   ![Configure DAM Update Asset workflow to add smart tag step and select handler advance](assets/smart-tag-step-properties-workflow2.png)

   To tag assets when they are uploaded irrespective of whether smart tagging is enabled on folders, select **[!UICONTROL Ignore Smart Tag Flag]**.

   ![Configure DAM Update Asset workflow to add smart tag step and select ignore Smart Tag flag](assets/smart-tag-step-properties-workflow3.png)

1. Click **[!UICONTROL OK]** to close the process step, and then save the workflow.

>[!MORELIKETHIS]
>
>* [Manage Smart Tags](managing-smart-tags.md)
>* [Overview of and how to train Smart Tags](enhanced-smart-tags.md)
>* [Guidelines and rules to train the Smart Content Service](smart-tags-training-guidelines.md)
>* [Video tutorial about how to configure smart tags](https://docs.adobe.com/content/help/en/experience-manager-learn/assets/metadata/smart-tags-technical-video-setup.html)

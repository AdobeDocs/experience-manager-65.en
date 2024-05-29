---
title: Integration with Adobe Analytics using IMS
description: Learn about integrating AEM with Adobe Analytics using IMS
exl-id: 2833a6df-ef32-48ab-8395-0f26816f8443
solution: Experience Manager, Experience Manager Sites
feature: Integration
role: Admin
hide: yes
hidefromtoc: yes
index: no
---

# Integration with Adobe Analytics using IMS {#integration-with-adobe-analytics-using-ims}

The integration of AEM with Adobe Analytics via the Analytics Standard API requires the configuration of Adobe IMS (Identity Management System) using the Adobe Developer Console.

>[!NOTE]
>
>Support for the Adobe Analytics Standard API 2.0 is new in AEM 6.5.12.0. This version of the API supports IMS authentication.
>
>Using the Adobe Analytics Classic API 1.4 in AEM is still supported for backward compatibility. The [Analytics Classic API uses user credentials authentication](/help/sites-administering/adobeanalytics-connect.md).
>
>The API selection is driven by the authentication method used for AEM/Analytics integration.
>
>Further information is also available under [Migrating to the 2.0 APIs](https://developer.adobe.com/analytics-apis/docs/2.0/guides/migration/).

## Prerequisites {#prerequisites}

Before starting this procedure:

* [Adobe Support](https://experienceleague.adobe.com/?support-solution=General&support-tab=home#support) must provision your account for:

  * Adobe Console
  * Adobe Developer Console
  * Adobe Analytics and 
  * Adobe IMS (Identity Management System)

* Your organization's System Administrator should use the Admin Console to add the required developers in your organization to the relevant product profiles. 

  * This provides the specific developers with permissions to enable integrations within the Adobe Developer Console. 
  * See [Manage Developers](https://helpx.adobe.com/enterprise/using/manage-developers.html).


## Configuring an IMS Configuration - Generating a Public Key {#configuring-an-ims-configuration-generating-a-public-key}

The first stage of the configuration is to create an IMS Configuration in AEM and generate the Public Key.

1. In AEM open the **Tools** menu.
1. In the **Security** section, select **Adobe IMS Configurations**.
1. Select **Create** to open the **Adobe IMS Technical Account Configuration**.
1. Using the drop-down under **Cloud Configuration**, select **Adobe Analytics**.
1. Activate **Create new certificate** and enter a new alias.
1. Confirm with **Create certificate**.

   ![Adobe IMS Technical Account Configuration wizard](assets/integrate-analytics-io-01.png)

1. Select **Download** (or **Download Public Key**) to download the file to your local drive, so that it is ready for use when [configuring IMS for Adobe Analytics integration with AEM](#configuring-ims-for-adobe-analytics-integration-with-aem).

   >[!CAUTION]
   >
   >Keep this configuration open; it is needed again when [Completing the IMS Configuration in AEM](#completing-the-ims-configuration-in-aem).

   ![Info dialog to add the key to Adobe I/O](assets/integrate-analytics-io-02.png)

## Configuring IMS for Adobe Analytics integration with AEM {#configuring-ims-for-adobe-analytics-integration-with-aem}

Using the Adobe Developer Console, create a Project (integration) with Adobe Analytics (for AEM to use), then assign the required privileges.

### Creating the Project {#creating-the-project}

To create a Project with Adobe Analytics that AEM can use, open the Adobe Developer Console:

>[!CAUTION]
>
>Currently, Adobe only supports the Adobe Developer Console's **Service Account (JWT)** credential type. 
>
>Do not use the **OAuth Server-to-Server** credential type, which will be supported in the future.

1. Open the Adobe Developer Console for Projects:

   [https://developer.adobe.com/console/projects](https://developer.adobe.com/console/projects)

1. Any projects that you have are shown. Select **Create New Project** - the location and usage depends on the following:

   * If you do not have any project yet, **Create new project** is center, bottom. 
     ![Create New Project - First Project](assets/integration-analytics-io-02.png)
   * If you already have existing projects, these are listed and **Create new project** is located upper-right. 
     ![Create New Project - Multiple Projects](assets/integration-analytics-io-03.png)


1. Select **Add to Project** followed by **API**:

   ![Get Started with your new Project](assets/integration-analytics-io-10.png)

1. Select **Adobe Analytics**, then **Next**:

   >[!NOTE]
   >
   >If you are subscribed to Adobe Analytics, but do not see it listed then you should check the [Prerequisites](#prerequisites).

   ![Add an API](assets/integration-analytics-io-12.png)

1. Select **Service Account (JWT)** as the type of authentication, then continue with **Next**:

   ![Select type of authentication](assets/integration-analytics-io-12a.png)

1. **Upload your public key**, and when complete, continue with **Next**:

   ![Upload your public key](assets/integration-analytics-io-13.png)

1. Review the credentials, and continue with **Next**:

   ![Review credentials](assets/integration-analytics-io-15.png)

1. Select the required product profiles, and continue with **Save configured API**:

   ![Select required product profiles](assets/integration-analytics-io-16.png)

1. The configuration is confirmed.

### Assigning privileges to the Integration {#assigning-privileges-to-the-integration}

Now assign the required privileges to the integration:

1. Open the Adobe **Admin Console**:

    * [https://adminconsole.adobe.com](https://adminconsole.adobe.com/)

1. Navigate to **Products** (top toolbar), then select **Adobe Analytics - &lt;*your-tenant-id*&gt;** (from the left panel).
1. Select **Product Profiles**, then your required workspace from the list presented. For example, Default Workspace.
1. Select **API Credentials**, then the required integration configuration.
1. Select **Editor** as the **Product Role**; instead of **Observer**.

## Details stored for the Adobe Developer Console Integration Project {#details-stored-for-the-ims-integration-project}

From the Adobe Developer Projects console you can see a list of all your integration projects:

* [https://developer.adobe.com/console/projects](https://developer.adobe.com/console/projects)

To show further details about the configuration, select a specific project entry. These include:

* Project overview
* Insights
* Credentials
  * Service Account (JWT)
    * Credential details
    * Generate JWT
* APIS
  * For example, Adobe Analytics

Some of these you must complete the integration for Adobe Analytics in AEM.

## Completing the IMS Configuration in AEM {#completing-the-ims-configuration-in-aem}

Returning to AEM, you can complete the IMS configuration by adding the required values from the integration project for Analytics:

1. Return to the [IMS Configuration open in AEM](#configuring-an-ims-configuration-generating-a-public-key).
1. Select **Next**.

1. Here you can use the [Details stored for the Adobe Developer Console Integration Project](#details-stored-for-the-ims-integration-project):

    * **Title**: Your text.
    * **Authorization Server**: Copy/paste this from the `aud` line of the **Payload** section below, for example, `https://ims-na1.adobelogin.com` in the example below
    * **API Key**: Copy this from the **Credentials** section of the [Project overview](#details-stored-for-the-ims-integration-project) 
    * **Client Secret**: Generate this in the [Client Secret tab of the Service Account (JWT) section](#details-stored-for-the-ims-integration-project), and copy
    * **Payload**: Copy this from the [Generate JWT tab of the Service Account (JWT) section](#details-stored-for-the-ims-integration-project) 

    ![AEM IMS COnfiguration details](assets/integrate-analytics-io-10.png)

1. Confirm with **Create**.

1. Your Adobe Analytics configuration is shown in the AEM console.

   ![IMS Configuration](assets/integrate-analytics-io-11.png)

## Confirming the IMS Configuration {#confirming-the-ims-configuration}

To confirm that the configuration is operating as expected:

1. Open:

    * `https://localhost<port>/libs/cq/adobeims-configuration/content/configurations.html`

   For example:

    * `https://localhost:4502/libs/cq/adobeims-configuration/content/configurations.html`

1. Select your configuration.
1. Select **Check Health** from the toolbar, followed by **Check**.

   ![IMS Configuration - Check Health](assets/integrate-analytics-io-12.png)

1. If successful, you see a confirmation message.

## Configuring the Adobe Analytics Cloud Service {#configuring-the-adobe-analytics-cloud-service}

The configuration can now be referenced for a Cloud Service to use the Analytics Standard API:

1. Open the **Tools** menu. Then, within the **Cloud Services** section, select **Legacy Cloud Services**.
1. Scroll down to **Adobe Analytics** and select **Configure now**.

   The **Create Configuration** dialog box opens.

1. Enter a **Title** and, if you want, a **Name** (if left blank it is generated from the title).

   You can also select the required template (if more than one is available).

1. Confirm with **Create**.

   The **Edit Component** dialog box opens.

1. Enter the details in the **Analytics Settings** tab:

    * **Authentication**: IMS

    * **IMS Configuration**: select the name of the IMS Configuration

1. To initialize the connection with Adobe Analytics, click **Connect to Analytics**.

   If the connection is successful, the message **Connection successful** is displayed.

1. Select **OK** on the message.

1. Complete other parameters as required, followed by **OK** on the dialog box so you can confirm the configuration.

1. You can now proceed to [Adding an Analytics Framework](/help/sites-administering/adobeanalytics-connect.md) to configure parameters that are sent to Adobe Analytics.

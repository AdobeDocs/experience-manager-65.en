---
title: Configure Experience Manager Assets for Adobe Asset Link
description: Configure Experience Manager Assets for use with the Adobe Asset Link extension for Creative Cloud applications.
contentOwner: Vishabh Gupta
role: Admin
feature: Asset Management
exl-id: 
---
# Configure Experience Manager Assets for Adobe Asset Link {#adobe-asset-link}

[Adobe Asset Link (AAL)](https://www.adobe.com/creativecloud/business/enterprise/adobe-asset-link.html) streamlines collaboration between creatives and marketers in the content creation process. It connects Adobe Experience Manager Assets with Creative Cloud desktop apps Adobe InDesign, Adobe Photoshop, and Adobe Illustrator. The Adobe Asset Link panel allows creatives to access and modify content stored in AEM Assets without leaving the creative apps they are most familiar with. 

To configure Experience Manager Assets to be used with Asset Link, implement the following tasks. Use Experience Manager administrator account to do the configuration:

1. Install the packages as required. Details are in prerequisites.

1. Configure Experience Manager either manually or using a package.

1. Manage user access control to map Creative Cloud licensed users with Experience Manager users.

1. Create custom query index, configure FPO renditions for InDesign, configure Adobe Stock integration, and configure visual or similarity search. 

## Prerequisites and support for various functionalities {#prerequisites}

Ensure that you install the appropriate service pack and package as necessary. See the following requirements for each Experience Manager version and for specific capabilities.

| Assets capability | Experience Manager version and requirements for support |
|--- |--- |
| Asset Link works by default  | Experience Manager 6.5 and 6.5.2 or later. </br> Experience Manager 6.4.4 and 6.4.6 or later. </br> Adobe recommends installing the latest [Experience Manager service pack (SP)](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/aem-releases-updates.html) before using AAL. |
| Asset Link works after installing a package | For Experience Manager 6.4.0 - 6.4.3, install [adobe-asset-link-support](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq640/featurepack/adobe-asset-link-support) package. |
| Adobe Stock integration | Experience Manager 6.4.2 or later |
| Visual or Similarity search | Experience Manager 6.5.0 or later |


## Configure Experience Manager using the configuration package {#configure-using-package}

Adobe recommends that you install adobe-asset-link-config configuration package to automate most of the configuration tasks, followed by a few manual tasks. Alternatively, you can configure manually.

>[!CAUTION]
>
>If your Experience Manager instance is configured for user login with Adobe IMS accounts, do not use the configuration package. Instead, manually configure your Experience Manager instance.

1. To open Package Manager, in Experience Manager web interface, access **[!UICONTROL Tools]** > **[!UICONTROL Deployment]** > **[!UICONTROL Package Share]**. Install `adobe-asset-link-config` package.

1. Access **[!UICONTROL Tools]** > **[!UICONTROL Operations]** > **[!UICONTROL Web Console]**. Locate **[!UICONTROL Adobe Granite OAuth IMS Provider]** configuration, and click to edit it. 

   Set the following properties and save the changes.

   * [!UICONTROL Group Mappings]: Leave empty unless desired. For details, see Group Mapping.
   * [!UICONTROL Organization]: Enter the organization ID you are using in the Adobe Admin Console. For more information about organization IDs, see Create user group.

1. Locate **[!UICONTROL Adobe Granite Bearer Authentication Handler]** configuration, and click to edit it. 
   
   Add **[!UICONTROL InDesignAem2]** Client IDs to the **[!UICONTROL Allowed OAuth client ids]** configuration property. 


## Manually configure Experience Manager {#configure-manually}

Manually configure Experience Manager if you choose not to use a configuration package or if your Experience Manager deployment is configured to support user login with Adobe IMS accounts. To configure manually, follow these steps.

1. To access the configuration manager, access **[!UICONTROL Tools]** > **[!UICONTROL Operations]** > **[!UICONTROL Web Console]**. Select **[!UICONTROL OSGi]** > **[!UICONTROL Configuration]** from the menu at the top. 

1. Locate the **[!UICONTROL Adobe Granite OAuth IMS Provider]** configuration and click to edit it. 

   Set the following configuration and click **[!UICONTROL Save]**. 

   * [!UICONTROL Authorization Endpoint]: ` https://ims-na1.adobelogin.com/ims/authorize/v1`
   * [!UICONTROL Token Endpoint]: ` https://ims-na1.adobelogin.com/ims/token/v1`
   * [!UICONTROL Profile Endpoint]: ` https://ims-na1.adobelogin.com/ims/profile/v1`
   * [!UICONTROL Validation URL]: ` https://ims-na1.adobelogin.com/ims/validate_token/v1`
   * [!UICONTROL Organization]: Set to the organization ID in the Adobe Admin Console.
   * [!UICONTROL Group Mappings]: Leave empty unless you have a special case. For details, see Group Mapping.

1. Locate **[!UICONTROL Adobe Granite Bearer Authentication Handler]** configuration, and click to edit it.

   Add the following Client IDs to the **[!UICONTROL Allowed OAuth client ids]** configuration property: `InDesignAem2, cc-europa-desktop_0_1, cc-europa-desktop_1_0, cc-europa-desktop_2_0, cc-europa-desktop_3_0, cc-europa-desktop_4_0, cc-europa-desktop_5_0, cc-europa-desktop_6_0, cc-europa-desktop_7_0, cc-europa-desktop_8_0, cc-europa-desktop_9_0, and cc-europa-desktop_10_0`.

   To add each Client ID, click `+`. Click **[!UICONTROL Save]** after adding all IDs.

1. In **[!UICONTROL Adobe Granite OAuth Application and Provider]** configuration, inspect the existing **[!UICONTROL Adobe Granite OAuth Authentication Handler]** instances. If you locate an instance with the `Config ID` value of `ims`, use it for the instructions in this procedure. Otherwise, click `+` to create a configuration instance. Set the following property values and click **[!UICONTROL Save]**. 
  
   * [!UICONTROL Client ID]: Do not change
   * [!UICONTROL Client Secret]: Do not change
   * [!UICONTROL Config ID]: ` ims`
   * [!UICONTROL Scope]: `AdobeID, OpenID, read_organizations` (other values may also be in the configuration)
   * [!UICONTROL Provider ID]: ` ims`
   * [!UICONTROL Create users]: ` Checked`
   * [!UICONTROL User ID Property]: `Email` for newly created configuration. Otherwise, do not change.

1. Locate the **[!UICONTROL Apache Jackrabbit Oak Default Sync Handler]** configuration with the **[!UICONTROL Sync Handler Name]** `ims` and click to edit it.

   Set the following configuration properties, and click **[!UICONTROL Save]**.

   * [!UICONTROL User Expiration Time and User Membership Expiration]: Time in minutes following by 'm' without space. For example, 15m for fifteen minutes. For details, see Group Mapping.
   * [!UICONTROL User auto membership]: Do not change
   * [!UICONTROL User Dynamic Membership]: ` Deslect`

1. Locate the **[!UICONTROL Adobe Granite OAuth Authentication Handler]** configuration and click  to edit it. Without making any changes, click **[!UICONTROL Save]**.

1. To adjust the relative priority of the bearer authentication handler, in CRXDE, navigate to `/apps/system/config`. Locate `com.adobe.granite.auth.oauth.impl.BearerAuthenticationHandler.config` and open its configuration. At the end, add `service.ranking=I"-10"`. Save the changes.

   >[!NOTE]
   >
   >Each request authenticated with a bearer token incurs the overhead of three calls to Adobe IMS, user syncing, and the creation of a login-token in Experience Manager. To overcome this overhead, Adobe Asset Link captures the login-token returned in the response from Experience Manager and sends it with subsequent requests. For this process to work, the relative priority of the bearer authentication handler must be adjusted.

1. (Optional) If the Experience Manager users have uppercase or mixed case domain names in their email IDs, select **[!UICONTROL Change Locking User to Lower Case]** in **[!UICONTROL Adobe Granite ACP Platform Configs]** in Experience Manager Web Console. 

## Additonal configuration after migration to Business Profiles {#configure-migration-activity}

Adobe Asset Link users are able to connect to Experience Manager as you configure to allow IMS login from the main Creative Cloud for Enterprise (CCE) org. Experience Manager users client IDs is to identify the permitted IMS organization. It is now mandatory to configure the Client ID and Secrect Key for the IMS org in  Experience Manager for the Bearer Authentication Handler.

Prerequisites

1. An up and running Experience Manager instance with Bearer Authentication configured for AAL.
1. Contact [!UICONTROL Customer Support] to get the Client ID and Secrect Key for Bearer Authentication of your IMS org.
1. Install the following package on your Experience Manager 6.5 instance.

   [https://artifactory.corp.adobe.com/artifactory/maven-aem-release-local/com/adobe/cq/ims-t2e-package-6.5/1.8/ims-t2e-package-6.5-1.8.zip](https://artifactory.corp.adobe.com/artifactory/maven-aem-release-local/com/adobe/cq/ims-t2e-package-6.5/1.8/ims-t2e-package-6.5-1.8.zip)


Following are the additional configurations that are required after migration to Business Profiles:

1. In **[!UICONTROL Adobe Granite OAuth IMS Configuration Provider]** (`com.adobe.granite.auth.ims.impl.ImsConfigProviderImpl`), set:

   * OAuth Configuration ID (`oauth.configmanager.ims.configid`): `ims` (Verify once, you may have it already configured)

   * IMS Ownning Entity (`ims.owningEntity`): Your IMS org id
   
   ![IMS Config ID](assets/bearer-authentication1.png)

1. Open **[!UICONTROL Bearer Authentication Handler]** configuration and add the Client ID obtained from [!UICONTROL Customer Support] to the list of **[!UICONTROL Allowed OAuth client ids]**.

   ![Add Client ID](assets/add-clientid-bearer-auth.png)

1. Open **[!UICONTROL Adobe Granite OAuth Application and Provider]** configuration and add the **[!UICONTROL Client ID]** and **[!UICONTROL Client Secret]** (Secret Key) obtained from Customer Support. 

   Ensure that the **[!UICONTROL Config ID]** field (`oauth.config.id`) contains the same value as provided in **[!UICONTROL OAuth configuration ID]** field ('oauth.configmanager.ims.configid') above.

   ![Verify Client ID](assets/clientid-secretkey.png)



## Tips and limitations {#tips-limitations}


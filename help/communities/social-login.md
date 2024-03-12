---
title: Social Login with Facebook and Twitter
description: Social login lets site visitors to sign in with their Facebook or Twitter account.
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
role: Admin
exl-id: aed9247c-eb81-470c-9fa4-a98c3df2dcaa
---
# Social Login with Facebook and Twitter {#social-login-with-facebook-and-twitter}

Social login is the capability to present a site visitor the option to sign in with their Facebook or Twitter account. Therefore, including permitted Facebook or Twitter data in their AEM member profile.

![socialloginweretail](assets/socialloginweretail.png)

## Social Login Overview {#social-login-overview}

To include social login, it is *required* to create custom Facebook and Twitter applications.

While the we-retail sample provides sample Facebook and Twitter apps and cloud services, they are not available on a [production website](../../help/sites-administering/production-ready.md).

The required steps are:

1. [Enable OAuth authentication](#adobe-granite-oauth-authentication-handler) on all AEM publish instances.

   Without OAuth enabled, attempts to log in fail.

1. **Create** a social app and cloud service.

   * To support log in with Facebook:

     * Create a [Facebook app](#create-a-facebook-app).
     * Create and publish a [Facebook Connect cloud service](#create-a-facebook-connect-cloud-service).

   * To support log in with Twitter:

     * Create a [Twitter app](#create-a-twitter-app).
     * Create and publish a [Twitter Connect cloud service](#create-a-twitter-connect-cloud-service).

1. [**Enable** social login](#enable-social-login) for a community site.

There are two basic concepts:

1. **Scope** (permissions) specifies the data the app is allowed to request.

   * The Facebook and Twitter [Adobe Granite OAuth Application and Provider](#adobe-granite-oauth-application-and-provider) instances, by default, include the basic app permissions within their scope.

1. **Fields** (params) specifies the actual data requested using URL parameters.

   * These fields are specified in [AEM Communities Facebook OAuth Provider](#aem-communities-facebook-oauth-provider) and [AEM Communities Twitter OAuth Provider](#aem-communities-twitter-oauth-provider).
   * The default fields are sufficient for most use cases but can be modified.

## Facebook Login {#facebook-login}

### Facebook API Version {#facebook-api-version}

Social login and the we-retail Facebook sample were developed when the Facebook Graph API was version 1.0.
As of AEM  6.4  GA and AEM 6.3 SP1 social login  was  updated to work with the newer Facebook Graph API 2.5 version.

>[!NOTE]
>
>For older AEM versions, if you are facing an exception in logs **Cannot extract a token from this**, upgrade to latest CFP for that AEM release.

For the Facebook Graph API version information, see the [Facebook API changelog](https://developers.facebook.com/docs/apps/changelog).

### Create a Facebook App {#create-a-facebook-app}

A properly configured Facebook application is required to enable Facebook social login.

To create Facebook application, follow Facebook's instructions at [https://developers.facebook.com/apps/](https://developers.facebook.com/apps/). Changes to their instructions are not reflected in the following information.

In general, as of Facebook API v2.7:

* *Add a New Facebook App*
  * For *Platform*, choose Website:
    * For *Site URL*, enter `  https://<server>:<port>.`
    * For *Display Name*, enter a title for use as the Title of the Facebook connect service.
    * For *Category*, recommended choosing *Apps for Pages*, but can be anything.
    * *Add  Product:  Facebook Login*
    * For *Valid OAuth redirect URIs*, enter `  https://<server>:<port>.`

>[!NOTE]
>
>For development, http://localhost:4503 will work.

Once the application has been created, locate the **[!UICONTROL App ID]** and **[!UICONTROL App Secret]** settings. This information is required for configuring the [Facebook cloud service](#createafacebookcloudservice).

### Create a Facebook Connect Cloud Service {#create-a-facebook-connect-cloud-service}

The [Adobe Granite OAuth Application and Provider](#adobe-granite-oauth-application-and-provider) instance, instantiated by creating a cloud service configuration, identifies the Facebook application and the member group(s) to which the new users are added.

1. On the AEM author instance, sign in with administrator privileges.
1. From global navigation, select **[!UICONTROL Tools]** > **[!UICONTROL Cloud Services]** > **[!UICONTROL Facebook Social login configuration]**.
1. Select the configuration **[!UICONTROL context path]**.

   **[!UICONTROL Context path]** should be the same as the cloud configuration path that you have selected while creating/editing a community site.

1. Check if your context path is enabled to create cloud services below it.
1. Go to **[!UICONTROL Tools]** > **[!UICONTROL General]** > **[!UICONTROL Configuration Browser]**. Select your context and edit properties. Enable Cloud Configurations if not enabled yet.

   ![config-propertiespng](assets/config-propertiespng.png)

   * See the [Configuration Browser](/help/sites-administering/configurations.md) documentation for more information.

1. **Create/Edit** Facebook cloud service configuration.

   ![fbsocialloginconfigpng](assets/fbsocialloginconfigpng.png)

   * **[!UICONTROL Title]** (*Required*) Enter a display title that identifies the Facebook App. Use the same name entered as the *Display Name* for the Facebook app.
   * **[!UICONTROL App ID/API Key]** (*Required*) Enter the ***App ID*** for the Facebook App. This identifies the [Adobe Granite OAuth Application and Provider](https://helpx.adobe.com/experience-manager/6-3/communities/using/social-login.html#AdobeGraniteOAuthApplicationandProvider) instance created from the dialog.
   * **[!UICONTROL App Secret]** (*Required*) Enter the ***App Secret*** for the Facebook App.
   * **[!UICONTROL Create Users]** If checked, logging in with a Facebook account will create an AEM user entry and add them as a member to the selected user group(s).  Default  is checked (strongly recommended).
   * **[!UICONTROL Mask User IDs]**: Leave deselected.
   * **[!UICONTROL Scope Email]**: email id of  user  should be fetched from Facebook.
   * **[!UICONTROL Add to User Groups]** select Add User Group to choose one or more [member groups](https://helpx.adobe.com/experience-manager/6-3/communities/using/users.html) for the community site to which users will be added.

   >[!NOTE]
   >
   >Groups may be added or removed at any time. But existing users's memberships are not affected. Auto membership only applies to new users being created  post  this field update. For Sites where anonymous users are disabled, chose to add users to corresponding community-members group meant for that closed community site.

    * Select **[!UICONTROL SAVE]**.
    * **[!UICONTROL Publish]**.

The result is an [Adobe Granite OAuth Application and Provider](https://helpx.adobe.com/experience-manager/6-3/communities/using/social-login.html#adobe-granite-oauth-application-and-provider) instance which does not require further modification unless adding additional scope (permissions). The default scope is the standard permissions for Facebook login. If additional scope is desired, it is necessary to edit the OSGI configuration directly. If there are modifications done directly via system/console, avoid editing your cloud service configurations from touch UI to avoid overwriting.

### AEM Communities Facebook OAuth Provider {#aem-communities-facebook-oauth-provider}

The AEM Communities provider extends the [Adobe Granite OAuth Application and Provider](#adobe-granite-oauth-application-and-provider) instance.

This provider will require editing to:

* Allow user updates
* Add additional fields [within scope](#adobe-granite-oauth-application-and-provider)

  * Not all fields permitted by default are included by default.

If editing is necessary, on each AEM publish instance:

1. Sign in with administrator privileges.
1. Navigate to the [Web Console](../../help/sites-deploying/configuring-osgi.md). For example, http://localhost:4503/system/console/configMgr.
1. Locate AEM Communities Facebook OAuth Provider.
1. Select the pencil icon to open for edit.

   ![fboauthprov_png](assets/fboauthprov_png.png)

   * **[!UICONTROL OAuth Provider ID]**

     (*Required*)  Default  value is *soco -facebook*. Do not edit.

   * **[!UICONTROL Cloud Service Config]**

     Default value is `/etc/  cloudservices /  facebookconnect`. Do not edit.

    * **[!UICONTROL OAuth Provider Service Config]**

      Default value is `/apps/social/facebookprovider/config/`. Do not edit.

    * **[!UICONTROL Enable Tags]**
      
      Do not Edit.

    * **[!UICONTROL User Path]**

      Location in the repository where user data is stored. For a community site, to ensure permissions for members to view one another's profile, the path should be the default */home/users/community*.

    * **[!UICONTROL Enable fields]**

      If checked, the Fields listed are specified on the request to Facebook for user authentication and information. The default is deselected.

    * **[!UICONTROL Fields]**

      When Fields are enabled, the following fields are included when calling the Facebook Graph API. The fields must be allowed within the scope defined in the cloud service configuration. Additional fields may require approval by Facebook. Reference the Facebook Login Permissions section of the Facebook documentation. The default fields added as parameters are:

        * id
        * name
        * first_name
        * last_name
        * link
        * locale
        * picture
        * timezone
        * updated_time
        * verified
        * email

   If any field is added or changed, update the corresponding Default Sync handler configuration to correct the mapping.

   * **[!UICONTROL Update User]**
     
     If checked, refreshes user data in the repository on each login to reflect profile changes or additional data requested. Default is deselected.

#### Next Steps {#next-steps}

The next steps are the same for both Facebook and Twitter:

* [Publish the cloud service configurations](#publishcloudservices)
* [Enable for a community site](#enable-social-login)

## Twitter Login {#twitter-login}

### Create a Twitter App {#create-a-twitter-app}

A configured Twitter application is required to enable Twitter social login.

Follow the latest instructions to create a Twitter application at [https://apps.twitter.com](https://apps.twitter.com/).

In general:

1. Enter a *Name* that will identify your Twitter application to the users of your website.
1. Enter a *Description*.
1. For *website* - enter `https://<server>`.
1. For *Callback URL* - enter `https://server`.

   >[!NOTE]
   >
   >It is not necessary to specify the port.
   >
   >For development, https://127.0.0.1/ will work.

1. Once the application has been created, locate the **[!UICONTROL Consumer (API) Key]** and **[!UICONTROL Consumer (API) Secret]**. This information will be needed for configuring the [Twitter cloud service](#createatwittercloudservice).

#### Permissions {#permissions}

In the Twitter application management's permissions section:

* **[!UICONTROL Access]**: Select `Read only`.

  * Other options are not supported

* **[!UICONTROL Additional Permissions]**: Optionally choose `Request email addresses from users`.

  * If not selected, the user profile in AEM will not include their email address.
  * Twitter's instructions note additional steps to take.

The only REST request made for social login is to *[GET account/verify credentials](https://dev.twitter.com/rest/reference/get/account/verify_credentials)*.

### Create a Twitter Connect Cloud Service {#create-a-twitter-connect-cloud-service}

The [Adobe Granite OAuth Application and Provider](#adobe-granite-oauth-application-and-provider) instance, instantiated by creating a cloud service configuration, identifies the Twitter application and the member group(s) to which the new users are added.

1. On the author instance, sign in with administrator privileges.
1. From global navigation, select **[!UICONTROL Tools]** > **[!UICONTROL Cloud Services]** > **[!UICONTROL Twitter Social login configuration]**.
1. Choose the **[!UICONTROL context path]** configuration.

   The Context path should be the same as the cloud configuration path that you selected while creating/editing a community site.

1. Check if your context path is enabled to create cloud services below it.
1. Go to **[!UICONTROL Tools]** > **[!UICONTROL General]** > **[!UICONTROL Configuration Browser]**. Select your context and edit properties. Enable Cloud Configurations if not enabled yet.

   ![twitterconfigproppng](assets/twitterconfigproppng.png)

   * See the [Configuration Browser](/help/sites-administering/configurations.md) documentation for more information.

1. Create/Edit Twitter cloud service configuration.

   ![twittersocialloginpng](assets/twittersocialloginpng.png)

   * **[!UICONTROL Title]** 
   
     (*Required*) Enter a display title that identifies the Twitter App. Use the same name entered as the *Display Name* for the Twitter app.

   * **[!UICONTROL Consumer Key]** 
   
     (*Required*) Enter the **Consumer (API) Key** for the Twitter app. This identifies the [Adobe Granite OAuth Application and Provider](https://helpx.adobe.com/experience-manager/6-3/communities/using/social-login.html#AdobeGraniteOAuthApplicationandProvider) instance created from the dialog.

   * **[!UICONTROL Consumer Secret]**   
   
     (*Required*) Enter the ***Consumer(API) Secret*** for the Twitter App.

   * **[!UICONTROL Create Users]** 
   
     If checked, logging in with a Twitter account will create an AEM user entry and add them as a member to the selected user group(s). Default is checked (strongly recommended).

   * **[!UICONTROL Mask User IDs]** 
   
     Leave deselected.

   * **[!UICONTROL Add to User Groups]** 
   
     Select Add User Group to choose one or more [member groups](https://helpx.adobe.com/experience-manager/6-3/communities/using/users.html) for the community site to which users will be added.

   >[!NOTE]
   >
   >Groups may be added or removed at any time. But existing users' memberships are not affected. Auto membership only applies to new users being created post this field update. For Sites where anonymous users are disabled, add users to corresponding community-members group meant for that closed community site.
   >

1. Select **[!UICONTROL SAVE]** and **[!UICONTROL Publish]**.

The result is an [Adobe Granite OAuth Application and Provider](https://helpx.adobe.com/experience-manager/6-3/communities/using/social-login.html#adobe-granite-oauth-application-and-provider) instance which does not require further modification. The default scope is the standard permissions for Twitter login.

### AEM Communities Twitter OAuth Provider {#aem-communities-twitter-oauth-provider}

The AEM Communities configuration extends the [Adobe Granite OAuth Application and Provider](#adobe-granite-oauth-application-and-provider) instance. This provider will require editing to allow user updates.

If editing is necessary, on each AEM publish instance:

1. Sign in with administrator privileges.
1. Navigate to the [Web Console](../../help/sites-deploying/configuring-osgi.md).

   For example, http://localhost:4503/system/console/configMgr.

1. Locate AEM Communities Twitter OAuth Provider.
1. Select the pencil icon to open for edit.

   ![twitteroauth_png](assets/twitteroauth_png.png)

   * **[!UICONTROL OAuth Provider ID]** 
   
   (*Required*) The default value is *soco -twitter*. Do not edit.

   * **[!UICONTROL Cloud Service Config]**

     The default value is *conf.* Do not edit.

   * **[!UICONTROL OAuth Provider Service Config]**

     The default value is `/apps/social/twitterprovider/config/`. Do not edit.

   * **[!UICONTROL User Path]**

     Location in the repository where user data is stored. For a community site, to ensure permissions for members to view one another's profile, the path should be the default `/home/users/community`.

   * **[!UICONTROL Enable Params]** &ndash; do not edit
   * **[!UICONTROL URL Parameters]** &ndash; do not edit
   * **[!UICONTROL Update User]**

     If checked, refreshes user data in the repository on each login to reflect profile changes or additional data requested. The default is deselected.

#### Next Steps {#next-steps-1}

The next steps are the same for both Facebook and Twitter:

* [Publish the cloud service configurations](#publishcloudservices)
* [Enable for a community site](#enable-social-login)

## Enable Social Login {#enable-social-login}

### AEM Communities Sites Console {#aem-communities-sites-console}

Once a cloud service is configured, it may be enabled for the relevant Social Login setting for a community site using the [User Management](https://helpx.adobe.com/experience-manager/6-3/communities/using/sites-console.html#USERMANAGEMENT) Settings sub-panel during community site [creation](https://helpx.adobe.com/experience-manager/6-3/communities/using/sites-console.html#SiteCreation) or [management](https://helpx.adobe.com/experience-manager/6-3/communities/using/sites-console.html#ModifyingSiteProperties).

1. Choose your site configuration context where you saved your social login configurations.

1. On General tab, set cloud configurations.

   ![managesites_png](assets/managesites_png.png)

1. On Settings tab, enable **[!UICONTROL Social Logins]** and Save.

   ![usermgmt_png](assets/usermgmt_png.png)

## Test Social Login {#test-social-login}

* Ensure [Adobe Granite OAuth Authentication Handler](#adobe-granite-oauth-authentication-handler) has been enabled on all publish instances.
* Ensure the cloud services have been published.
* Ensure the community site has been published.
* Launch the published site in a browser.
  For example, http://localhost:4503/content/sites/engage/en.html
* Select **[!UICONTROL Login In]**.
* Select either **[!UICONTROL Sign in with Facebook]** or **[!UICONTROL Sign in with Twitter]**.
* If not already logged into Facebook or Twitter, log in with the appropriate credentials.
* It may be necessary to grant permission depending on the dialog displayed by the Facebook or Twitter app.
* Notice that the toolbar at the top of the page is updated to reflect the successful login.
* Select **[!UICONTROL Profile]**: the Profile page displays the user's avatar image, first name, and last name. It also displays the information from the Facebook or Twitter profile according to the fields/params permitted.

## AEM Platform OAuth Configurations {#aem-platform-oauth-configurations}

### Adobe Granite OAuth Authentication Handler {#adobe-granite-oauth-authentication-handler}

The `Adobe Granite OAuth Authentication Handler` is not enabled by default and ***must be enabled on all AEM publish instances.***

To enable the authentication handler on publish, simply open the OSGi config and save it:

* Sign in with administrator privileges.
* Navigate to the [Web Console](../../help/sites-deploying/configuring-osgi.md).
  For example, http://localhost:4503/system/console/configMgr
* Locate `Adobe Granite OAuth Authentication Handler`.
* Select to open the configuration for edit.
* Select **[!UICONTROL Save]**.

![graniteoauth](assets/graniteoauth.png)

>[!CAUTION]
>
>Be careful to not confuse the authentication handler with a Facebook or Twitter instance of *Adobe Granite OAuth Application and Provider*.

![graniteoauth1](assets/graniteoauth1.png)

### Adobe Granite OAuth Application and Provider {#adobe-granite-oauth-application-and-provider}

When a cloud service for Facebook or Twitter is created, an instance of `Adobe Granite OAuth Authentication Handler` is created.

To locate the created instance for a Facebook or Twitter app:

1. Sign in with administrator privileges.
1. Navigate to the [Web Console](../../help/sites-deploying/configuring-osgi.md).

   For example, http://localhost:4503/system/console/configMgr.

1. Locate Adobe Granite OAuth Application and Provider.

   * Locate the instance where **[!UICONTROL Client ID]** matches the **[!UICONTROL App ID]**.

     ![graniteoauth2](assets/graniteoauth2.png)

     Except the following properties, leave the other properties of the config  unaltered:

   * **[!UICONTROL Config ID]**

     (*Required*) OAuth configuration IDs must be unique. Auto-generated when cloud service is created.

   * **[!UICONTROL Client ID]**

     (*Required*) The application ID provided when the cloud service was created.

   * **[!UICONTROL Client Secret]**

     (*Required*) The application secret provided when the cloud service was created.

   * **[!UICONTROL Scope]**

     (*Optional*) Additional scope for what is permitted can be asked  from  the provider. The default scope covers the permissions necessary for providing social authentication and profile data.

   * **[!UICONTROL Provider ID]**

     (*Required*) The provider ID for AEM Communities is set when the cloud service was created. Do not edit. For Facebook Connect, the value is *soco -facebook*. For Twitter Connect, the value is *soco -twitter*.

   * **[!UICONTROL Groups]**

     (*Recommended*) One or more member groups to which created users are added. For AEM Communities, it is recommended to list the member group for the community site.

   * **[!UICONTROL Callback URL]**

     (*Optional*) URL configured with the OAuth providers to redirect the client back. Use a relative  url  to use the host of the original request. Leave empty to use the originally requested URL instead. Suffix "/callback/j_security_check" is automatically appended to this  url .

   >[!NOTE]
   >
   >The domain for the callback must be registered with the provider (Facebook or Twitter).

For each OAuth authentication handler configuration, there are two additional configurations created in the instance:

* Apache Jackrabbit Oak Default Sync Handler (org.apache.jackrabbit.oak.spi.security.authentication.external.impl.DefaultSyncHandler) - No edits required there but you can look at the user field mappings how Facebook fields are mapped to a CQ user profile node. Also notice that 'Sync Handler Name' matches the Config Id of OAuth provider configuration.
* Apache Jackrabbit Oak External Login Module (org.apache.jackrabbit.oak.spi.security.authentication.external.impl.ExternalLoginModuleFactory) - No edits required there, but you may notice that 'Identity Provider Name' and 'Sync Handler Name' are same and pointing to corresponding OAuth and sync handler configurations respectively.

For more information, see [Authentication with Apache Oak External Login Module](https://jackrabbit.apache.org/oak/docs/security/authentication/externalloginmodule.html).

## OAuth User Traversal Performance {#oauth-user-traversal-performance}

For community sites that see hundreds of thousands of users register using their Facebook or Twitter login, the traversal performance of the query performed when a site visitor uses their social login can be improved by adding the following Oak index.

If traversal warnings are seen in the logs, it is recommended to add this index.

On an author instance, signed in with administrative privileges:

1. From global navigation: select **Tools, [CRX/DE Lite](../../help/sites-developing/developing-with-crxde-lite.md).**
1. Create an index named ntBaseLucene-oauth from a copy of ntBaseLucene:

   * Under node `/oak:index`
   * Select node `ntBaseLucene`
   * Select **[!UICONTROL Copy]**
   * Select `/oak:index`
   * Select **[!UICONTROL Paste]**
   * Rename Copy of ntBaseLucene to `ntBaseLucene-oauth`

1. Modify the properties of node ntBaseLucene-oauth:

   * **[!UICONTROL indexPath]**: `/oak:index/ntBaseLucene-oauth`
   * **[!UICONTROL name]**: `oauthid-123****`
   * **[!UICONTROL reindex]**: `true`
   * **[!UICONTROL reindexCount]**: `1`

1. Under node /oak:index/ntBaseLucene-oauth/indexRules/nt:base/properties:

   * Delete all child nodes, except for cqTags.
   * Rename cqTags to `oauthid-123****`
   * Modify the properties of node `oauthid-123****`

     * **[!UICONTROL name]**: `oauthid-123****`

   * Select **[!UICONTROL Save All]**.

* For the **name** `oauthid-123`, replace *123* with the Facebook ***App ID*** or Twitter ***Consumer (API) Key*** that is the value of the **Client ID** in the [Adobe Granite OAuth Application and Provider](social-login.md#adobe-granite-oauth-application-and-provider) configuration.

  ![graniteoauth-crxde](assets/graniteoauth-crxde.png)

For additional information and tools, see [Oak Queries and Indexing](../../help/sites-deploying/queries-and-indexing.md).

## Dispatcher Configuration {#dispatcher-configuration}

See [Configuring Dispatcher for Communities](dispatcher.md).

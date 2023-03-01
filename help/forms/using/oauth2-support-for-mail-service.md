---
title: Configure OAuth2-based authentication for Microsoft® Office 365 mail server protocols
description: Configure OAuth2-based authentication for Microsoft® Office 365 mail server protocols
exl-id: cd3da71f-892c-4fde-905f-71a64fb5d4e4
---
# Integrate with Microsoft® Office 365 mail server protocols {#oauth2-support-for-the-microsoft-mail-server-protocols}

To allow organizations to adhere to secure email requirements, AEM Forms offer OAuth 2.0 support for integration with Microsoft® Office 365 mail server protocols. You can use Azure Active Directory (Azure AD) OAuth 2.0 authentication service,  to connect with various protocols such as IMAP, POP or SMTP and access email data for Office 365 users. Below are step-by-step instructions for configuring the Microsoft® Office 365 mail server protocols to authenticate via OAuth 2.0 service:

1. Login [https://portal.azure.com/](https://portal.azure.com/) and search for **Azure Active Directory** in the search bar and click on the result. 
Alternatively, you can browse directly to [https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview)
1. Click **Add** > **App Registration** > **New Registration**

   ![App Registeration](/help/forms/using/assets/outh_outlook_microsoft_azure.png)

1. Fill in the information according to your requirements, then click **Register**.
   ![Supported Account](/help/forms/using/assets/azure_suuportedaccountype.png)
   In the above case, **Accounts in any organizational directory (Any Azure AD directory - Multitenant) and personal Microsoft® accounts (for example, Skype, Xbox)** option is selected. 

   >[!NOTE]
   >
   > * For **Accounts in any organizational directory (Any Azure AD directory - Multitenant)** application, it is recommended to use work account rather than personal email account.
   > * **Personal Microsoft® accounts only** application is not supported.
   > * It is recommended to use **Multi tenant and personal Microsoft® account** application.

1. Next, go to **Certificates and Secrets**, click **New client secret** and follow the on-screen steps to create a secret. Make sure to take note of this value of secret for later use.

    ![Secret Key](/help/forms/using/assets/azure_secretkey.png)

1. For adding permissions, go to the newly created app, and select **API Permissions** > **Add a Permission** > **Microsoft® Graph** > **Delegated Permissions**
1. Select the checkboxes for the below permissions for the app and click **Add Permission**:

   * `IMAP.AccessUser.All` 
   * `Mail.Read`
   * `offline_access`
   * `POP.AccessAsUser.All`
   * `SMTP.Send`
   * `User.Read`

   ![API Permission](/help/forms/using/assets/azure_apipermission.png)

1. Select **Authentication** > **Add a platform** > **Web**, and in the **Redirect Urls** section, add any of the below URIs (Universal Resource Identifier) as:
   * `https://login.microsoftonline.com/common/oauth2/nativeclient`
   * `http://localhost`

   In this case, `https://login.microsoftonline.com/common/oauth2/nativeclient` is used as a redirect URI.

1. Click **Configure** after adding each URL and configure your settings according to your requirements.
   ![Redirect URI](/help/forms/using/assets/azure_redirecturi.png)

   >[!NOTE]
   >
   > It is mandatory to select **Access tokens** and **ID tokens** checkboxes.

1. Click **Overview** in the left-hand pane and copy the values for **Application (client) ID**, **Directory (tenant) ID**, and **Client Secret** for later use.

    ![Overview](/help/forms/using/assets/azure_overview.png)

## Generating the Authorization Code {#generating-the-authorization-code}

Next, you need to generate the authorization code, explained in the following steps:

1. Open the following URL in the browser after replacing `clientID` with the `<client_id>` and `redirect_uri` with the redirect URI of your application: 

    ```https://login.microsoftonline.com/common/oauth2/v2.0/authorize?client_id=[clientid]&scope=IMAP.AccessAsUser.All%20POP.AccessAsUser.All%20SMTP.Send%20User.Read%20Mail.Read%20offline_access&response_type=code&redirect_uri=[redirect_uri]&prompt=login```

   >[!NOTE]
   >
   > In case of the single tenant application, replace `common` with your `[tenantid]` in the following URL for generating authorization code: `https://login.microsoftonline.com/[tenantid]/oauth2/v2.0/authorize?client_id=[[clientid]]&scope=IMAP.AccessAsUser.All%20POP.AccessAsUser.All%20SMTP.Send%20User.Read%20Mail.Read%20openid%20offline_access&response_type=code&redirect_uri=[redirect_uri]&prompt=login`

1. When, you type the above URL, you are redirected to the login screen:
   ![Login Screen](/help/forms/using/assets/azure_loginscreen.png)

1. Enter the email, click **Next** and App permission screen appears:

   ![Allow Permission](/help/forms/using/assets/azure_permission.png)

1. Once you allow permission, you are redirected to a new URL as: `https://login.microsoftonline.com/common/oauth2/nativeclient?code=<code>&session_state=[session_id]`

1. Copy the value of `<code>` from the above URL from `0.ASY...` to `&session_state` in the above URL.

## Generating the Refresh Token {#generating-the-refresh-token}

Next, you need to generate the refresh token, explained in the following steps:

1. Open the command prompt and use the following cURL command to get the refreshToken. 

1. Replace the `clientID`, `client_secret` and `redirect_uri` with the values for your application along with the value of `<code>`:
   
   `curl -H “ContentType application/x-www-form-urlencoded” -d “client_id=[client-id]&scope=https%3A%2F%2Foutlook.office.com%2FIMAP.AccessAsUser.All%20https%3A%2F%2Foutlook.office.com%2FPOP.AccessAsUser.All%20https%3A%2F%2Foutlook.office.com%2FSMTP.Send%20https%3A%2F%2Foutlook.office.com%2FUser.Read%20https%3A%2F%2Foutlook.office.com%2FMail.Read%20offline_access&code=[code]&grant_type=authorization_code&redirect_uri=[redirect_uri]&client_secret=[secretkey_value]” -X POST https://login.microsoftonline.com/common/oauth2/v2.0/token`

   >[!NOTE]
   >
   > In single tenant application, to generate refresh token use the following cURL command and replace `common` with the `[tenantid]` in:
   >`curl -H “ContentType application/x-www-form-urlencoded” -d “client_id=[client-id]&scope=https%3A%2F%2Foutlook.office.com%2FIMAP.AccessAsUser.All%20https%3A%2F%2Foutlook.office.com%2FPOP.AccessAsUser.All%20https%3A%2F%2Foutlook.office.com%2FSMTP.Send%20https%3A%2F%2Foutlook.office.com%2FUser.Read%20https%3A%2F%2Foutlook.office.com%2FMail.Read%20offline_access&code=[code]&grant_type=authorization_code&redirect_uri=[redirect_uri]&client_secret=[secretkey_value]” -X POST https://login.microsoftonline.com/[tenantid]/oauth2/v2.0/token`

1. Make note of the refresh token.

## Configure E-mail Service with OAuth 2.0 Support {#configureemailservice}

 Now, you have to configure e-mail service at latest JEE server by login in Admin UI:

1. Go to **Home** > **Service** > **Application and Services** > **Service Management** > **Email Service**, the **Configuration Email service** window appears, configured for basic authentication.

   >[!NOTE]
   >
   > To enable oAuth 2.0 authentication service, it is mandatory to select **Whether the SMTP server requires authentication (SMTP Authenticate)** checkbox.

1.  Set **oAuth 2.0 Authentication Settings** as `True`.
1. Copy the values of **Client ID** and **Client Secret** from Azure Portal.
1. Copy the value of generated **Refresh Token**.
1. Login in to **Workbench** and search **Email 1.0** from **Activity Picker**.
1. Three options are available under Email 1.0 as:
    * **Send with Document**: Sends Email with single attachments.
    * **Send with Map of Attachments**: Sends Email with multiple attachments.
    * **Receive**: Receives an Email from IMAP.

   >[!NOTE]
   >
   >* Transport Security protocol has valid values as: 'blank', 'SSL' or 'TLS'. You must set values of **SMTP Transport Security** and **Receive Transport Security** to **TLS** for enabling oAuth authentication service.
   >* **POP3 protocol** is not supported for OAuth while using email endpoints.

    ![Connection Settings](/help/forms/using/assets/oauth_connectionsettings.png)
    
1. Test the application by selecting **Send with Document**.
1. Provide **TO** and **From** addresses.
1. Invoke the application and email is sent using the 0Auth 2.0 authentication. 

   >[!NOTE]
   >
   >If you want to change Auth 2.0 authentication setting to basic authentication for a particular process in a workbench, you can set the **OAuth 2.0 Authentication** value as 'False' under **Use Global settings** in the **Connection Settings** tab. 

## To enable oAuth task notifications {#enable_oauth_task}

1. Go to **Home** > **Services** > **Form Workflow** > **Server Settings** > **Email Settings** 
1. To enable oAuth task notifications, select the **Enable oAuth** checkbox.
1. Copy the values of **Client ID** and **Client Secret** from Azure Portal.
1. Copy the value of generated **Refresh Token**.
1. Click **Save** to save the details.

   ![Task Notification](/help/forms/using/assets/task_notification.png)

   >[!NOTE]
   >
   > To know more information related to task notifications, [click here](https://experienceleague.adobe.com/docs/experience-manager-65/forms/administrator-help/manage-endpoints/configuring-email-endpoints.html#create-an-email-endpoint-for-the-complete-task-service).
 
## To configure email endpoint {#configure_email_endpoint}

1. Go to **Home** > **Services** > **Application and Services** > **Endpoint Management** 
1. To configure email endpoint, set **oAuth 2.0 Authentication Settings** as `True`.
1. Copy the values of **Client ID** and **Client Secret** from Azure Portal.
1. Copy the value of generated **Refresh Token**.
1. Click **Save** to save the details.

     ![Connection Settings](/help/forms/using/assets/oauth_emailendpoint.png)

   >[!NOTE]
   >
   > To know more information on configuring email endpoints, click on [Configure an email endpoint](https://experienceleague.adobe.com/docs/experience-manager-65/forms/administrator-help/manage-endpoints/configuring-email-endpoints.html).
 
## Troubleshooting {#troubleshooting}

* If the e-mail service is not working properly. Try to regenerate the `Refresh Token` as described above. It takes a few minutes for the new value to be deployed.

* Error while configuring e-mail server details in email endpoint using Workbench.Try to configure endpoint via Admin UI instead of Workbench.

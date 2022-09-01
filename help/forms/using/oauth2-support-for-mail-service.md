---
title: OAuth2 Support for the Mail Service
description: Oauth2 Support for the Mail Service  
---
# OAuth2 Support for the Mail Service {#oauth2-support-for-the-mail-service}

AEM as a Cloud Service offers OAuth2 support for its integrated Mail Service, in order to allow organizations to adhere to secure email requirements.

You can configure OAuth for multiple email providers. Below are step-by-step instructions for configuring the AEM Mail Service to authenticate via OAuth2 with Microsoft Office 365 Outlook. Other vendors can be configured in a similar manner.

## Microsoft Outlook {#microsoft-outlook}

1. Go to [https://portal.azure.com/](https://portal.azure.com/) and log in.
1. Search for **Azure Active Directory** in the search bar and click on the result. Alternatively, you can browse directly to [https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview)
1. Click on **App Registration** - **New Registration**

   ![](/help/forms/using/assets/outh_outlook.PNG)

1. Fill in the information according to your requirements, then click on **Register**
1. Go to the newly created app, and select **API Permissions** 
1. Go to **Add Permission** - **Graph Permission** - **Delegated Permissions**
1. Select the below permissions for your app, then click **Add Permission**:
   * `SMTP.Send`
   * `Mail.Read`
   * `Mail.Send`
   * `openid`
   * `offline_access`
1. Go to **Authentication** - **Add a platform** - **Web**, and in the **Redirect Urls** section, add the below URLs - one with and one without a forward slash:
   * `http://localhost/`
   * `http://localhost`
1. Press **Configure** after adding each URL and configure your settings according to your requirements
1. Next, go to **Certificates and Secrets**, click on **New client secret** and follow the on-screen steps to create a secret. Make sure to take note of this secret for later use
1. Press **Overview** in the left-hand pane and copy the values for **Application (client) ID** for later use.

To recap, you require the following information to configure OAuth2 for the Mail service on the AEM side:

* The Auth URL in the form: `https://login.microsoftonline.com/<ID>/oauth2/v2.0/authorize`
* The Token URL in the form: `https://login.microsoftonline.com/<ID>/oauth2/v2.0/token`
* The Refresh URLin the form: `https://login.microsoftonline.com/<ID>/oauth2/v2.0/token`
* The Client ID
* The Client Secret

### Generating the Refresh Token {#generating-the-refresh-token}

Next, you need to generate the refresh token, as illustrated in a subsequent step.

You can do this by following these steps:

1. Open the following URL in the browser after replacing `clientID` with the values specific to your account: 

    ```https://login.microsoftonline.com/common/oauth2/v2/authorize?client_id=<client_id>&scope=IMAP.AccessAsUser.A;;%20POP.AccessAsUser.All%20SMTP.Send%20User.Read&response_type=code&redirect-uri=http://loginmicrosoftonline.com/common/outh2/nativeclient&prompt=login```

1. Allow permission, where ever it is required.
1. The URL will redirect to a new location, constructed in this format: `http://localhost/?code=<code>&state=12345&session_state=4f984c6b-cc1f-47b9-81b2-66522ea83f81#`
1. Copy the value of `<code>` in the example above
1. Use the following cURL command to get the refreshToken. Replace the clientID, clientSecret with the values for your account and value for `<code>`:
   
   ```
   curl -H “ContentType application/x-www-form-urlencoded” -d 
   "client_id=<client-id>
   &scope=https%3A%2F%2Foutlook.office.com%2FIMAP.AccessAsUser.All&code=M.R3_BAY.1bf609bf-25b3-2fcd-d910-02e02c53bc
   &grant_type=authorization_code
   &redirect_uri= https://login.microsoftonline.com/common/oauth2/nativeclient
   &client_secret=~1E8Q~cz-m6vgOb9m~SI.eF9jSVTbFUiP5f0” -X POST https://login.microsoftonline.com/common/oauth2/v2.0/token
   ```

1. Make note of the refreshToken and accessToken.

### Validating the Tokens {#validating-the-tokens}

Before proceeding to configure OAuth on the AEM side, make sure to validate both the accessToken and refreshToken with the below procedure:

1. Generate the accessToken by using the refreshToken produced in the previous procedure. You can achieve this with following curl and replacing the values for `<client_id>`,`<client_secret>` along with the `<refreshToken>`:

   ```
   curl -H “ContentType application/x-www-form-urlencoded” -d 
   "client_id=<client_id>
   &scope=https%3A%2F%2Foutlook.office.com%2FIMAP.AccessAsUser.All&code=<code>
   &grant_type=authorization_code
   &redirect_uri= https://login.microsoftonline.com/common/oauth2/nativeclient
   &client_secret=<client_secret>
   &refresh_token=<refresh_token” 
   -X POST https://login.microsoftonline.com/common/oauth2/v2.0/token
   ```

1. Send a mail using the accessToken, to see whether it is working properly.

>[!NOTE]
>
> You can get the Postman API collection from [this location](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-oauth2-auth-code-flow).

### Configure E-mail service with Auth2.0 Support {#configureemailservice}

 Now, you have to configure e-mail service at latest JEE server by login in Admin UI:

 1. Go to **Home** - **Service** - **Application and Services** - **Service Management** - **Email Service**
 1. **Configuration Email service** window appears, configure **SMPT** and **IMP** servers for basic authentication.
 1. To enable Outlook mail authentication service, select **oAuth 2.0 Authentication Settings** checkbox.
 1. Copy the values of **Client ID** and **Client Secret** from Azure Portal.
 1. Copy the value of generated **Refresh Token**.
 1. Click **Save** to save the details. 
1. Login in to workbench and search **Email 1.0** from **Activity Picker**.
1. Three options are available under Email 1.0 as:
    * **Send with Document**: Sends Email with single attachments.
    * **Send with Map of Attachments**: Sends Email with multiple attachments.
    * **Receive**: Receives an Email from POP3 or IMAP.
1. Test the application by selecting **Send with Document**
1. Provide **TO** and **From** addresses.
1. Invoke the application and email is sent using the oAuth2.0 authentication. 

>[!NOTE]
>
> If you want to change Auth 2.0 authentication setting to basic authentication for a particular process in a workbench, you can uncheck the **oAuth2.0 Authentication** checkbox under **Use Global settings** in the **Connection Settings** tab. 

### Troubleshooting {#troubleshooting}

If the mail service is not working properly, regenerate the `refreshToken` as described above. It takes a few minutes for the new value to be deployed.



---
title: Configure SAML service provider settings
description: You can configure SAML service provider settings to allow users to log in and authenticate to AEM forms via a specified third-party identity provider (IDP).
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_user_management
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: dd302cfb-eae1-4189-aa7b-9f2533ebd164
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Configure SAML service provider settings{#configure-saml-service-provider-settings}

Security Assertion Markup Language (SAML) is one of the options that you can select when configuring authorization for an enterprise or hybrid domain. SAML is primarily used to support SSO across multiple domains. When SAML is configured as your authentication provider, users log in and authenticate to AEM forms via a specified third-party identity provider (IDP).

For an explanation of SAML, see [Security Assertion Markup Language (SAML) V2.0 Technical Overview](https://docs.oasis-open.org/security/saml/Post2.0/sstc-saml-tech-overview-2.0.html).

1. In administration console, click Settings &gt; User Management &gt; Configuration &gt; SAML Service Provider Settings.
1. In the Service Provider Entity ID box, type a unique ID to use as an identifier for the AEM forms service provider implementation. You also specify this unique ID when configuring your IDP (for example, `um.lc.com`.) You can also use the URL that is used to access AEM forms (for example, `https://AEMformsserver`).
1. In the Service Provider Base URL box, type the base URL for your Forms Server (for example, `https://AEMformsserver:8080`).
1. (Optional) To enable AEM forms to send signed authentication requests to the IDP, perform the following tasks:

    * Use Trust Manager to import a credential in PKCS #12 format with Document Signing Credential selected as the Trust Store Type. (See [Managing local credentials](/help/forms/using/admin-help/local-credentials.md#managing-local-credentials).)
    * In the Service Provider Credential Key Alias list, select the alias you assigned to the credential in Trust Store.
    * Click Export so you can save the URL contents to a file and then import that file into your IDP.

1. (Optional) In the Service Provider Name ID Policy list, select the name format that the IDP uses to identify the user in a SAML assertion. The options are Unspecified, Email, and Windows Domain Qualified Name.

   >[!NOTE]
   >
   >Name formats are not case-sensitive.

1. (Optional) Select Enable Authentication Prompt For Local Users. When this option is selected, users see two links:

    * a link to the login page of the third-party SAML identity provider, where users who belong to an Enterprise domain can authenticate.
    * a link to the AEM forms login page, where users who belong to a Local domain can authenticate.

   When this option is not selected, users are taken directly to the login page of the third-party SAML identity provider, where users who belong to an Enterprise domain can authenticate.

1. (Optional) Select Enable Artifact Binding to enable artifact binding support. By default, POST binding is used with SAML. But if you have configured Artifact Binding, select this option. When this option is selected, the actual user assertion is not passed through the Browser request. Instead, a pointer to the assertion is passed and the assertion is retrieved using a backend web service call.
1. (Optional) Select Enable Re-Direct Binding to support SAML bindings that use redirects.
1. (Optional) In Custom Properties, specify additional properties. The additional properties are name=value pairs separated by new lines.

    * You can configure AEM forms to issue a SAML assertion for a validity period that matches the validity period of a third-party assertion. To honor the third-party SAML assertion timeout, add the following line in Custom Properties:

      `saml.sp.honour.idp.assertion.expiry=true`

    * Add the following custom property for using RelayState to determine the URL where the user will be redirected after successful authentication.

      `saml.sp.use.relaystate=true`

    * Add the following custom property so you can configure the URL for the custom Java&trade; Server Pages (JSP), which is used to render the registered list of identity providers. If you have not deployed a custom web application, it uses the default User Management page to render the list.

    `saml.sp.discovery.url=/custom/custom.jsp`

1. Click Save.

---
title: Configure extended authentication from external browser for document security
description: Learn how to configure external browser authentication so users can authenticate for policy-protected PDF documents in Acrobat or Reader using the system default web browser.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/working_with_document_security
products: SG_EXPERIENCEMANAGER/6.5/FORMS
feature: Document Security
exl-id: a452674c-aea0-45d6-88cd-438af539d355
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Configure extended authentication from external browser for document security {#configure-external-browser-authentication-document-security}

>[!NOTE]
>
> Ensure that you have administrator privileges to access the AEM Forms administration console.

Extended authentication from an external browser allows users to authenticate for policy-protected PDF documents using the system's default web browser (such as Microsoft Edge or Google Chrome) instead of the embedded browser control within Acrobat or Reader. This enables modern authentication methods such as PassKey, biometric authentication, and other Identity Provider (IDP) features that require a modern browser.

When enabled, opening a policy-protected document in Acrobat or Reader launches the IDP login page in the user's default browser. After authentication, the user is automatically redirected back to Acrobat or Reader and the document is unlocked.

## Prerequisites {#prerequisites}

Before you configure external browser authentication, ensure that the following requirements are met:

* AEM Forms 6.5 on JEE with Service Pack 6.5.25.0 deployed, or Service Pack 6.5.24.0 with the applicable JEE hotfix patch installed on a supported application server (JBoss, WebLogic, or WebSphere). See [Software distribution links for AEM Forms JEE Hotfix2 6.5.24.0](#software-distribution-links).
* Extended authentication (third-party authentication) already enabled and functional with an IDP. See [Server configuration settings](/help/forms/using/admin-help/configuring-client-server-options.md#server-configuration-settings) and [Add the extended authentication provider](/help/forms/using/admin-help/configuring-client-server-options.md#add-the-extended-authentication-provider).
* Adobe Acrobat Pro or Adobe Acrobat Reader (64-bit) installed on the client Windows PC with the latest update

### Software distribution links for AEM Forms JEE Hotfix2 6.5.24.0 {#software-distribution-links}

External browser authentication is available in AEM Forms on JEE Service Pack 6.5.25.0 and later.

If you are on AEM Forms on JEE Service Pack 6.5.24.0 or earlier, do one of the following:

* Upgrade to [AEM Forms on JEE Service Pack 6.5.25.0](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.25.0.zip).
* Install the AEM Forms JEE Hotfix 6.5.24.0 patch for your application server and platform using the links below.

Download and install the AEM Forms JEE Hotfix 6.5.24.0 patch for your platform from [Adobe Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html):

**JBoss**

* Windows: [Hotfix for AEM Service Pack 6.5.24.0 on Windows for JBoss JEE server](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-24-0-hotfix-02/jboss/adobe-aem-forms-jee-hotfix2-6.5.24.0-win-jboss.zip)
* Linux: [Hotfix for AEM Service Pack 6.5.24.0 on Linux for JBoss JEE server](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-24-0-hotfix-02/jboss/adobe-aem-forms-jee-hotfix2-6.5.24.0-linux-jboss.tar.gz)

**WebSphere**

* Windows: [Hotfix for AEM Service Pack 6.5.24.0 on Windows for WebSphere JEE server](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-24-0-hotfix-02/websphere/adobe-aem-forms-jee-hotfix2-6.5.24.0-win-websphere.zip)
* Linux: [Hotfix for AEM Service Pack 6.5.24.0 on Linux for WebSphere JEE server](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-24-0-hotfix-02/websphere/adobe-aem-forms-jee-hotfix2-6.5.24.0-linux-websphere.tar.gz)

**WebLogic**

* Windows: [Hotfix for AEM Service Pack 6.5.24.0 on Windows for WebLogic JEE server](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-24-0-hotfix-02/weblogic/adobe-aem-forms-jee-hotfix2-6.5.24.0-win-weblogic.zip)
* Linux: [Hotfix for AEM Service Pack 6.5.24.0 on Linux for WebLogic JEE server](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-24-0-hotfix-02/weblogic/adobe-aem-forms-jee-hotfix2-6.5.24.0-linux-weblogic.tar.gz)

For installation instructions, see [Install a JEE patch](/help/release-notes/jee-patch-installer-65.md).

## Enable external browser authentication {#enable-external-browser-authentication}

This video shows how to enable external browser authentication on the AEM Forms Document Security server.

>[!VIDEO](https://video.tv.adobe.com/v/3492357/)

1. In the administration console, click **Services** > **Document Security** > **Configuration** > **Server Configuration**.
1. Locate the section **Allow extended authentication from external browser for Adobe client applications**.
1. Select the checkbox for each Adobe client platform you want to enable:
   * **Adobe Acrobat and Reader (64-bit) - Desktop**
   * **Adobe Acrobat Reader (32-bit) - Desktop**
1. Click **OK**.

For the server setting description, see [Server configuration settings](/help/forms/using/admin-help/configuring-client-server-options.md#server-configuration-settings). 

<!--
## Client configuration (Acrobat / Reader) {#client-configuration}

External browser authentication is enabled by default in Acrobat and Reader. No client-side configuration is needed for most deployments. When the server is configured to allow external browser authentication, the client uses it automatically.

To disable external browser authentication on specific client machines (forcing the embedded browser fallback), set the following registry value:

`HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Adobe\Adobe Acrobat\<product_branch>\FeatureLockDown\EDC`

| Setting | Value |
| ------- | ----- |
| Value name | `TPExternalBrowserAuthAdmin` |
| Value type | `REG_DWORD` |
| Value data | `0` (to disable) |

>[!NOTE]
>
> Both the server-side setting and the client-side preference must be enabled for external browser authentication to work. If either is disabled, the client falls back to the embedded browser.
-->

## Verification {#verification}

This video shows how to verify external browser authentication: open a policy-protected PDF in Acrobat, sign in through your default browser, and confirm the document unlocks after authentication.

>[!VIDEO](https://video.tv.adobe.com/v/3492356/)

1. Create a policy-protected PDF document using the Document Security server.
1. On a Windows client machine, open the protected PDF in Acrobat Pro or Acrobat Reader.
1. A consent dialog appears in Acrobat. Click **Sign In**.
1. Verify that the system default browser opens with the IDP login page.
1. Complete authentication.
1. Verify that the protected document opens successfully.

## Troubleshooting {#troubleshooting}

### The embedded browser opens instead of the system browser {#embedded-browser-opens-instead-of-system-browser}

* Verify the server has external browser authentication enabled. See [Enable external browser authentication](#enable-external-browser-authentication).
* Confirm the Acrobat or Reader version supports this feature.

### Authentication succeeds in the browser but the document does not unlock {#authentication-succeeds-but-document-does-not-unlock}

* Ensure Acrobat or Reader is running and not blocked by firewall or security software.
* If the issue persists, reinstall or repair the Acrobat or Reader installation to restore protocol handler registration.

### "We couldn't sign you in" message appears in Acrobat {#we-couldnt-sign-you-in-message}

* The user may have taken too long to complete authentication. Try again.
* Check network connectivity between the browser and the AEM Forms server.

### Authentication option does not appear on the login page {#authentication-option-does-not-appear}

* Authentication methods and options are configured by the IDP, not by AEM Forms or Acrobat. Ensure the IDP supports the authentication method you want to use.
* Verify the login page is loading in the system browser (not the embedded browser).  

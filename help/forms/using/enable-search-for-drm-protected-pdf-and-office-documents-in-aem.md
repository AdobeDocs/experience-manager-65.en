---
title: Enable AEM to search document security protected PDF and Microsoft Office documents

description: Learn how to enable native AEM search to perform full-text search on DRM protected PDF documents.


content-type: reference
geptopics: SG_AEMFORMS/categories/working_with_document_security
products: SG_EXPERIENCEMANAGER/6.5/FORMS

noindex: true
feature: Document Security
exl-id: 91cbd1f1-d53d-455b-8d2c-6918b521db81
solution: Experience Manager, Experience Manager Forms
role: "Admin, User, Developer"
---
# Enable AEM to search document security protected PDF and Microsoft Office documents{#enable-aem-to-search-document-security-protected-pdf-and-microsoft-office-documents}

Adobe Experience Manager provides a user interface to search and locate various assets stored in AEM. The native search is capable of searching and locating AEM assets and performing  text  search on various commonly used document formats such as plain-text files, Microsoft Office documents, and PDF documents. You can also extend and enable the native search to perform  full-text  search on DRM protected PDF and Microsoft Office documents.

Perform the following steps to enable AEM to search document security protected PDF and Microsoft Office documents:

## Before you start {#before-you-start}

* Install and configure AEM Forms document security.
* Add package sun.util.calendar to the allowlist of the **Deserialization Firewall Configuration.** The configuration is listed at `https://'[server]:[port]'/system/console/configMgr`.
* Ensure that all AEM bundles are up and running. The bundles are listed at `https://'[server]:[port]'/system/console/bundles`. If all the bundles are not active, wait, and check the status of the bundles after for a few minutes.

## Establish a secure connection within AEM Forms workflow (AEM Forms on JEE) {#establish-a-secure-connection-within-aem-forms-workflow-aem-forms-on-jee}

A secure connection enables  seamless  flow of information between AEM Forms on JEE and the OSGi services running on the same server. Use one of the following method to establish a secure connection:

* Configure AEM Forms Client SDK Bundle with AEM Forms on JEE admin credentials
* Configure AEM Forms Client SDK Bundle using mutual authentication

### Configure AEM Forms Client SDK Bundle with AEM Forms on JEE admin credentials {#configure-aem-forms-client-sdk-bundle-with-aem-forms-on-jee-admin-credentials}

1. Open AEM configuration manager and login as an administrator. The default URL is https://&lt;serverName&gt;:&lt;port&gt;/lc/system/console/configMgr.
1. Search and open the AEM Forms Client SDK Bundle. Specify value for the following properties:

    * **Server URL:** Specify HTTP URL of AEM Forms on JEE server. To enable communication over https, restart the AEM Forms on JEE server with the -Djavax.net.ssl.trustStore=&lt;path of AEM Forms on JEE  keystore  file&gt; parameter.
    * **Service Name**: Add the RightsManagementService to the list of specified services.
    * **Username:** Specify username of the AEM Forms on JEE account to use to initiate calls from AEM Forms on JEE server. The account specified must have permissions to invoke Document services on the AEM Forms on JEE server.
    * **Password**: Specify password of the AEM Forms on JEE account mentioned in the Username field.

   Click **Save**. AEM is enabled to search document security protected PDF and Microsoft Office documents.

### Configure AEM Forms Client SDK Bundle using mutual authentication {#configure-aem-forms-client-sdk-bundle-using-mutual-authentication}

1. Enable mutual authentication for AEM Forms on JEE. For detailed information, see [CAC and Mutual Authentication](https://helpx.adobe.com/livecycle/kb/cac-mutual-authentication.html).
1. Open AEM configuration manager and login as an administrator. The default URL is https://&lt;serverName&gt;:&lt;port&gt;/lc/system/console/configMgr.
1. Search and open the AEM Forms Client SDK Bundle. Specify value for the following properties:

    * **Server URL:** Specify HTTPS URL of AEM Forms on JEE server. To enable communication over https, restart the AEM Forms on JEE server with the -Djavax.net.ssl.trustStore=&lt;path of AEM Forms on JEE  keystore  file&gt; parameter.
    * **Enable 2-way SSL**: Enable the Enable 2-way SSL option.
    * **KeyStore File URL**: Specify the URL of the  keystore  file.
    * **TrustStore  FIle  URL**: Specify the URL of the  truststore  file.
    * **KeyStore Password**: Specify the password for the  keystore  file.
    * **TrustStorePassword**: Specify the password for the  truststore  file.
    * **Service Name**: Add the RightsManagementService to the list of specified services.

   Click **Save**. AEM is enabled to search document security protected PDF and Microsoft Office documents

    >[!NOTE]
    >
    > It is recommended to use the 'Ctrl + C' command to restart the SDK. Restarting the AEM SDK using alternative methods, for example, stopping Java processes, may lead to inconsistencies in the AEM development environment.

## Index a sample policy-protected PDF or Microsoft Office document {#index-a-sample-policy-protected-pdf-or-microsoft-office-document}

1. Log in to AEM Assets as an administrator.
1. Create a folder in AEM Digital Asset Manager and upload a policy-protected PDF or Microsoft Office document to the newly created folder. Now, search contents of the policy-protected documents using AEM search. It must return the document containing searched text.

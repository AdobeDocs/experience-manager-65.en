---
title: DO NOT PUBLISH Set up Mutual Authentication for AEM Forms on JEE
seo-title: DO NOT PUBLISH Set up Mutual Authentication for AEM Forms on JEE
description: null
seo-description: null
page-status-flag: never-activated
uuid: f88ef6e1-f65c-4f10-a640-63f906dce453
contentOwner: khsingh
discoiquuid: 09311db3-34b6-4463-8a93-8382e7bba5ba
---

# DO NOT PUBLISH Set up Mutual Authentication for AEM Forms on JEE {#do-not-publish-set-up-mutual-authentication-for-aem-forms-on-jee}

Mutual authentication is a security process in which both the clients and server authenticate each other's identities before actual communication occurs. With mutual authentication, a connection can occur only when the client trusts the digital certificate of the server and the server trusts the certificate of the client. In this way, a client and a server are certain that they are connecting with legitimate entities and severing content for legitimate purposes. For more information about mutual authentication, see [an Introduction to Mutual Authentication](https://www.codeproject.com/Articles/326574/An-Introduction-to-Mutual-SSL-Authentication).

You can use mutual authentication in AEM Form to:

* Provide secure communication for logging to AEM Forms on JEE web interfaces like admin console and HTML Workspace.
* Authenticate users using CAC cards to log on to an AEM Forms server.
* Configure Microsoft SharePoint Connector Web to enable authenticate via a system user certificate instead of a pre-configured user name and password
* Secure communication between AEM Forms, Adobe Acrobat, Acrobat Reader, and Microsoft office. For example, securing communication while opening a policy protected documents using Adobe Reader or Adobe Acrobat.
* Allow indexing protected documents in AEM Forms Document Security iFilter.
* Securely logging in to AEM Forms Workbench.

## Configure Mutual Authentication for AEM Forms {#configure-mutual-authentication-for-aem-forms}

Configure application server and AEM Forms on JEE server to provide secure logging and secure communication between AEM Forms, Adobe Acrobat, Acrobat Reader, and Microsoft office.

* [Configure application server](/help/forms/using/wip/setup-mutual-authentication-for-aem-forms-on-jee.md#configure-application-server)
* [Configure AEM Forms on JEE server](https://helpx.adobe.com/livecycle/kb/cac-mutual-authentication.html#p-livecycle-server-configuration-p)

Perform the following additional configurations to enable authenticate via a system user certificate instead of a pre-configured user name and password for Microsoft SharePoint, authenticate users using CAC cards, allow indexing protected documents, securely logging in to AEM Forms Workbench:

* [Configure Microsoft SharePoint Connector Web part changes](https://helpx.adobe.com/livecycle/kb/cac-mutual-authentication.html#p-sharepoint-connector-web-part-changes-p)
* [Configure document security iFilter](https://helpx.adobe.com/livecycle/kb/cac-mutual-authentication.html#main-pars_header_5)
* [Provide access to HTML Workspace through CAC authentication](https://helpx.adobe.com/livecycle/kb/cac-mutual-authentication.html#main-pars_header_29601462)
* Configure Workbench

### Pre-requisites {#pre-requisites}

Before you start,

* Obtain certificates from a trusted certifying authority (CA) or create [self-signed the certificates](/help/forms/using/wip/setup-mutual-authentication-for-aem-forms-on-jee.md#use-openssl-to-create-and-sign-certificates). These certificates are required to identify the server and clients in a mutual authentication environment.  

* Create and deploy the custom user management auth provider (AuthProvider) SPI to enable mutual authentication on the AEM Forms server. For detailed instructions, see [Server Configuration](https://helpx.adobe.com/livecycle/kb/cac-mutual-authentication.html#p-livecycle-server-configuration-p).

### Configure application server {#configure-application-server}

Each application server has a separate set of instructions to enable mutual authentication. See application server documentation to enable **2-way Mutual Authentication.** For AEM 6.4 Forms running on JBoss 7.0.6 application server perform the following steps:

1. Create the server.truststore file:

   Open command line or terminal and run the below commands in listed sequence to generate the server.truststore file at `\Adobe\Adobe_Experience_Manager_Forms\jboss\standalone\configuration`:

    1. `\Adobe\Adobe_Experience_Manager_Forms\Java\jdk<version>\bin\keytool.exe -import -alias server-cert -file <client-certificate>.cer -keystore server.truststore C:\Adobe`
    1. `\Adobe_Experience_Manager_Forms\Java\jdk<version>\bin\keytool.exe -import -alias adobe-cert-auth-root -file <servert-certificate>.cer -keystore server.truststore`

1. Open AEM Forms admin console and whitelist the common name. The default URL of admin console is https://&lt;server&gt;:&lt;port&gt;/adminui.

   In the admin console, navigate to Settings &gt; User Management &gt; Configuration &gt;Configure Allowed Referer URL's. In the **Referer Whitelist** field, type the common name assigned to the certificate. For example, Paul Smith. In the **HTTP port** and **HTTPs port** field, type 0 and click **Add**. 

1. Stop the AEM Forms server.
1. Configure SSL settings:

    1. Open the [AEM Forms on JEE installation Folder]\jboss\standalone\configuration\lc_turnkey.xml file for editing. 
    1. Add the following in the &lt;subsystem xmlns="urn:jboss:domain:undertow:3.1"&gt; tag:

       ```    
       <https-listener name="default-secure" socket-binding="https" security-realm="SSLRealm" verify-client="REQUIRED"/>
       ```

    1. Add the following in the &lt;security-realms&gt; tag:

       ```    
       <security-realm name="SSLRealm">
       <server-identities>
       <ssl>
       <keystore path="C:/Adobe/Adobe_Experience_Manager_Forms/jboss/standalone/configuration/server.keystore" keystore-password="servercert" alias="servercert"/>
       </ssl> 
       </server-identities>
       <authentication> 
       <truststore path="C:/Adobe/Adobe_Experience_Manager_Forms/jboss/standalone/configuration/server.truststore" keystore-password="servercert" />
       </authentication>
       </security-realm>
       
       ```

       >[!NOTE]
       >
       >Modify the path of truststore, keystore, and passwords, if required.

    1. Save and close the file.

1. Restart the JBoss application server.

   After the server restarts, create a [Hybrid Domain](https://helpx.adobe.com/in/experience-manager/6-4/forms/using/admin-help/adding-domains.html#add_a_hybrid_domain). Choose the Auth Provider for the domain as **[!UICONTROL Custom]** and select **[!UICONTROL SSLMutualAuthProvider]**. In the hybrid domain, create a user with the name similar to user created in the previous step. For example, Paul Smith.

1. Configure certificate for the server.

   Open page https://[AEM-Forms-JEE-Server]:8443/ in a browser window. If multiple certificates are installed, a certificate selection pop-up dialog is displayed. Select the appropriate certificate.

1. Add certificates to AEM truststore and keystore:

    1. Login to `https://[server]:[port]/lc/libs/granite/security/content/useradmin.html` as an administrator.
    1. Tap **[!UICONTROL Administrator]**. The **Edit User Settings** page opens.
    1. Tap **[!UICONTROL Create trustStore]** and set an access password for trustStore. For more information, see [Add the IdP Certificate to the AEM TrustStore](https://helpx.adobe.com/experience-manager/6-3/sites/administering/using/saml-2-0-authenticationhandler.html#add-the-idp-certificate-to-the-aem-truststore).
    1. Tap **[!UICONTROL Create keyStore]** and set a password for keyStore. For more information, see [Add the Service Provider key and certificate chain to the AEM keystore](https://helpx.adobe.com/experience-manager/6-3/sites/administering/using/saml-2-0-authenticationhandler.html#add-the-service-provider-key-and-certificate-chain-to-the-aem-keystore).

1. Logout of AEM Forms. Access the workspace with port :8443. You should be able to access the workspace with a CAC card.

## Use OpenSSL to create and sign certificates {#use-openssl-to-create-and-sign-certificates}

You can perform the following steps to create, sign, and export certificates using OpenSSL. The instructions below are for Windows Server 2016. You can perform similar steps for Linux and other versions of Microsoft Windows. To create and sign certificates:

1. Install OpenSSL and prepare directory structure:

    1. Download and install OpenSSL at C:\OpenSSL. Use default settings while installing OpenSSL.   

    1. Create a directory C:\certificate. This directory is working directory to create and sign certificates. Create the following directory structure in C:\certificate:

        * C:\certificate\demoCA
        * C:\certificate\demoCA\newcerts

    1. Create an empty (zero-byte) file, index.txt at C:\certificates\demoCA\
    1. Create a plain ASCII file containing the string "01" on the first line named serial at C:\certificates\demoCA\.

1. Create Root Certificate (CA)

    1. Create a private key. For example, create CA.key:

       `C:\certificates>openssl.exe genrsa -des3 -out CA.key 1024`

       Specify and keep a note of the pass phrase. This procedure assumes pass phrase 123456 is used. You can use any certifying authority.
    
    1. Create the root certificate based on the private key. For example ADOBECERTAUTHROOT.cer

       `C:\certificates>openssl.exe req -new -x509 -days 1001 -key CA.key -out ADOBECERTAUTHROOT.cer -subj "/C=US/ST=California/L=San Jose/O=Adobe Systems Inc./OU=EDBU/CN=ADOBECERTAUTHROOT"`

       Enter the pass phrase, when prompted.
    
    1. Create an end-user certificate and sign the certificate using the issuer certificate. The instructions below assumes that the certificate is being issued for a user named Paul Smith:

        1. Run the below command to create the private key for Paul Smith:  
           `C:\certificates>openssl.exe genrsa -des3 -out Paul.key 1024`  
           Enter the pass phrase, when prompted.
        1. Run the below command to create a Certificate Signing Request (CSR), Paul.csc  
           `C:\certificates>openssl.exe req -new -key Paul.key -out Paul.csr -subj "/C=US/ST=California/L=San Jose/O=Adobe Systems Inc./OU=EDBU/CN=Paul [Smith/emailAddress=paulsmith@adobe.com](mailto:Smith/emailAddress=paulsmith@adobe.com)"`

           Enter the pass phrase, when prompted
        
        1. Sign the certificate request to obtain Paul’s certificate, PaulSmith.cer:

           `C:\certificates>openssl.exe ca -policy policy_anything -cert ADOBECERTAUTHROOT.cer -in paul.csr -keyfile CA.key -days 360 -out PaulSmith.cer -key "123456"`

           Enter Y or Yes, when prompted.
        
        1. Export the certificate in PKCS12 format (PaulSmith.p12):

           `C:\certificates>openssl.exe pkcs12 -export -out PaulSmith.p12 -inkey Paul.key -in PaulSmith.cer`

           Do not specify export password. Your certificate is ready.


---
title: DO NOT PUBLISH Use CAC cards with AEM Forms Document Security
seo-title: DO NOT PUBLISH Use CAC cards with AEM Forms Document Security
description: null
seo-description: null
page-status-flag: never-activated
uuid: 625e4e44-2fa3-45c4-b973-14b370239061
contentOwner: khsingh
geptopics: SG_AEMFORMS/categories/working_with_document_security
discoiquuid: 868a9be4-50ec-4f5e-b4b9-9b8660b7b03b
---

# DO NOT PUBLISH Use CAC cards with AEM Forms Document Security {#do-not-publish-use-cac-cards-with-aem-forms-document-security}

You can use Common Access Cards (CAC) to restrict physical access to controlled locations. Typically, these cards are of a size a credit card. These cards contain information about the holder and type of the access granted to the holder. A CAC card enables access to data or physical location only after a trusted connection is established between the card and the authenticating server.

CAC cards are based on a standard known as [Pkcs#11 Public-Key Cryptography standards](https://en.wikipedia.org/wiki/PKCS_11). Apart from CAC cards, you can also use other hardware security modules (HSM) based on Pkcs#11 Public-Key Cryptography standards for authentication. For example, USB drives.

![A sample Common Access Card (CAC)](do-not-localize/cac_card.png)

A sample Common Access Card (CAC)

![](do-not-localize/hardware_securitymodules.png)

Sample hardware security modules (HSM)

## Enable AEM Forms authentication to use CAC cards {#enable-aem-forms-authentication-to-use-cac-cards}

CAC cards, HSM, and mutual authentication are based-on the same principle. These all enable access to data or physical location only after a trusted connection is established between the server and a client machine. You require the following to set up [mutual authentication](https://www.codeproject.com/Articles/326574/An-Introduction-to-Mutual-SSL-Authentication):

* Client's public key certificate installed on the server
* Server's private key certificate installed on the server
* Server's public key certificate installed on the client  
* Client's private key certificate installed on the client

The only difference between mutual authentication, CAC cards, and HSM based authentication is: CAC cards and HSM modules store authentication information (Client's private key certificate) on a physical device and mutual authentication stores authentication information on the client machine. You require a CAC card reader, both hardware and software, to access client's private key certificate stored on CAC cards. Perform the following steps to set up AEM Forms for CAC card authentication:

1. Install latest available [Cumulative Fix Pack / Service Pack](https://helpx.adobe.com/experience-manager/release-notes--aem-6-3-cumulative-fix-pack.html) available for AEM Forms. 
1. Install the CAC card reader software on the client machine. It is provided with the card reader hardware.  

1. Enable [Mutual Authentication](https://helpx.adobe.com/livecycle/kb/cac-mutual-authentication.html) on AEM Forms server. Setup the following while enabling mutual authentication:

    1. Create a [Hybrid domain](/help/forms/using/admin-help/editing-converting-existing-domains.md#main-pars-heading-1) and add a [hybrid authentication provider](/help/forms/using/admin-help/configuring-authentication-providers.md). If you are using Adobe-user-manager-ssl-dsc.jar for [extended authentication](/help/forms/using/admin-help/configuring-client-server-options.md#server-configuration-settings), create users with User ID identical to cn (common name) mentioned in the client certificate available on CAC cards. 
    1. Add [server's private key certificate](/help/forms/using/admin-help/local-credentials.md) in the keystore of server and [client's public key certificate](/help/forms/using/admin-help/certificates.md) in the truststore of the server.
    1. Create a truststore at client and add server public key certificate in the truststore of client. If you are using Microsoft Windows, you can use Windows Truststore. On linux, you have to create a truststore.  

    1. Create a Java_Home environment variable on the client machine. Set the environment variable to use the /bin folder of Java development Kit (JDK) installed on the client machine.
    1. Download and place [Java Cryptography Extension (JCE) Unlimited Strength](https://www.oracle.com/technetwork/java/javase/downloads/index.html) files at $JAVA_HOME/jre/lib/security on the client machine.

       >[!NOTE]
       >
       >* Ensure that the version of the files matches the version of JDK installed on the client machine.
       >* If you are using IBM JDK, add the following to the [JAVA_HOME]\jre\lib\security\java.security file:
       >
       >ssl.SocketFactory.provider=
       >
       >ssl.ServerSocketFactory.provider=
       >
       >jdk.tls.disabledAlgorithms=SSLv3

1. Install client's private key certificate on the CAC card.

AEM Forms is enabled to use CAC cards for authentication. Now, you can enable a set of users to perform various document security related operations using CAC cards. For example, protecting a document using a certificate stored on a CAC card.

## Use a CAC card with AEM Forms Document Security to protect a document {#use-a-cac-card-with-aem-forms-document-security-to-protect-a-document}

After you enable AEM Forms authentication to use CAC cards, you can perform various document security related operations using CAC cards. For example, protecting a document using a certificate stored on a CAC card.

AEM Forms document security provides a set of APIs to protect, unprotect, and other operations. You create an object of type ServiceClientFactory to connect to AEM Forms server. You set connection properties to invoke AEM Forms when you create ServiceClientFactory object. When setting connection properties, specify whether to invoke services remotely or locally, and specify the connection mode and authentication values. Authentication values are required if service security is enabled. However, if service security is disabled, it is not necessary to specify authentication values. For detailed information about the properties, see [Setting connection properties](https://www.adobe.com/go/learn_aemforms_programming_63).

To successfully invoke an AEM Forms Document Security service with CAC cards authentication, set the following connection properties in addition to setting other [connection properties](https://www.adobe.com/go/learn_aemforms_programming_63):

### PKCS#11 properties {#pkcs-properties}

* **DSC_PKCS11_PROVIDER_NAME** (Optional): Specifies PKCS#11 provider name for CAC card based authentication. For example, pkcs11.
* **DSC_PKCS11_LIBRARY_PATH**: Specifies path to the library or .dll file of CAC card reader software.
* **DSC_PKCS11_SLOT_ID** (Optional): Specifies a slot number of the CAC card to read. A CAC card can have multiple slots and every slot can have multiple client private key certificates.
* **DSC_PKCS11_PIN**: Specifies pkcs11 pin/password for CAC card authentication.
* **DSC_PKCS11_CERT_LIST_CALLBACK_CLASS **(Optional): If your pkcs11 card can have multiple certificates, you can use the option to display a popup to the user to select a certificate.

### Client Truststore properties {#client-truststore-properties}

* **DSC_TRUSTSTORE_URL**: Specifies path to the client truststore file. For example, file:C:/Input/certs/client.truststore
* **DSC_TRUSTSTORE_PASSWORD**: Specifies pin/password of client truststore.

The properties specified above are not mandatory. You can specify a subset of properties and AEM Forms automatically detect the rest of the properties or uses a fall-back mechanism. AEM Forms supports the following combinations:

* (Windows only) If you do not specify pksc11 and client truststore properties, AEM Forms automatically detects all the settings.
* (Windows only) If you install card reader software, specify only client certificate properties, and leave other pksc#11 properties unspecified, AEM Forms automatically detects the card, reads all the available certificates, and displays a dialog box for pkcs#11 pin.
* (Windows only) If you only add the server certificate to the windows certificate manager’s trusted certificates and specify all pksc#11 properties, AEM Forms automatically reads certificates from Windows truststore, and authenticates the CAC card.
* For unix-based operating systems, DSC_PKCS11_LIBRARY_PATH, DSC_PKCS11_PIN, DSC_TRUSTSTORE_URL, and DSC_TRUSTSTORE_PASSWORD are mandatory properties.
* If you specify both pksc11 and client truststore properties, AEM Forms uses the specified information detects a CAC card and related certificates.

The following uses AEM Forms Document Security APIs and a CAC card to protect a document. You can also run the following sample code to verify that AEM Forms is configured properly to use CAC cards:

```java
/* 
* This Java Quick Start uses the SOAP mode and contains the following JAR files 
* in the class path: 
* 1. adobe-rightsmanagement-client.jar 
* 2. adobe-livecycle-client.jar 
* 3. adobe-usermanager-client.jar 
* 4. activation.jar (required for SOAP mode) 
* 5. axis.jar (required for SOAP mode) 
* 6. commons-codec-1.3.jar (required for SOAP mode) 
* 7. commons-collections-3.2.jar  (required for SOAP mode) 
* 8. commons-discovery.jar (required for SOAP mode) 
* 9. commons-logging.jar (required for SOAP mode) 
* 10. dom3-xml-apis-2.5.0.jar (required for SOAP mode) 
* 11. jaxen-1.1-beta-9.jar (required for SOAP mode) 
* 12. jaxrpc.jar (required for SOAP mode) 
* 13. log4j.jar (required for SOAP mode) 
* 14. mail.jar (required for SOAP mode) 
* 15. saaj.jar (required for SOAP mode) 
* 16. wsdl4j.jar (required for SOAP mode) 
* 17. xalan.jar (required for SOAP mode) 
* 18. xbean.jar (required for SOAP mode) 
* 19. xercesImpl.jar (required for SOAP mode) 
* 
* The JBoss files must be kept in the jboss\client folder. You can copy the client folder to  
* 
your local development environment and then include the 3 JBoss JAR files in your class path 
* 
* These JAR files are located in the following path: 
* <install directory>/sdk/client-libs/common 
* 
* 
* <install directory>/jboss/bin/client 
* 
* If you want to invoke a remote forms server instance and there is a 
* firewall between the client application and the server, then it is  
* recommended that you use the SOAP mode. When using the SOAP mode,  
* you have to include additional JAR files located in the following  
* path 
* <install directory>/sdk/client-libs/thirdparty 
* 
* For information about the SOAP  
* mode and the additional JAR files that need to be included,  
* see "Setting connection properties" in Programming  
* with AEM Forms 
* 
* For complete details about the location of the AEM Forms JAR files,  
* see "Including AEM Forms Java library files" in Programming  
* with AEM Forms 
*/ 

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import com.adobe.edc.common.dto.PublishLicenseDTO;
import com.adobe.edc.sdk.SDKException;
import com.adobe.idp.dsc.clientsdk.ServiceClientFactory;
import com.adobe.idp.dsc.clientsdk.ServiceClientFactoryProperties;
import com.adobe.livecycle.rightsmanagement.client.DocumentManager;
import com.adobe.livecycle.rightsmanagement.client.RightsManagementClient2;

public class CACAuthSdkSample3 {

 private static final String POLICY_ID = "320098D3-FC0D-1034-AED9-00000A2A5532";  
 private static final String USERNAME = "administrator";
 private static final String DOMAIN_NAME = "DefaultDom";
 
 private static String unprotectedFileName = "C:\\unprotected.pdf";
 private static String protectedFileName = "C:\\protectedUsingCACAndSDK.pdf";
 
 private static String pkcsDll = "C:/Windows/System32/etpkcs11.dll";
 private static String cacCardPin = "12345678";
 private static int slotId = 0;
 private static String trustStoreFilePath = "file:C:/Input/certs/client.truststore";
 private static String trustStorePassword = "clientcert";
 
    public static void main(String[] args) {
     
     if(args!=null && args.length>0){
      unprotectedFileName = args[0];
      protectedFileName = args[1];
      pkcsDll = args[2];
      cacCardPin = args[3];
      trustStoreFilePath = args[4];
      trustStorePassword = args[5];
      if(args.length>6){
       slotId = Integer.parseInt(args[6]);
      }
     }
     
     try
      {        
         Properties connectionProps = new Properties();
         connectionProps.setProperty(ServiceClientFactoryProperties.DSC_DEFAULT_SOAP_ENDPOINT, "https://mutualauth:8443");
         connectionProps.setProperty(ServiceClientFactoryProperties.DSC_TRANSPORT_PROTOCOL,ServiceClientFactoryProperties.DSC_SOAP_MUTUALAUTH_PROTOCOL);          
         connectionProps.setProperty(ServiceClientFactoryProperties.DSC_SERVER_TYPE, "JBoss");
         
         connectionProps.setProperty(ServiceClientFactoryProperties.DSC_TRUSTSTORE_URL, trustStoreFilePath);
         connectionProps.setProperty(ServiceClientFactoryProperties.DSC_TRUSTSTORE_PASSWORD, trustStorePassword);
         
         //connectionProps.setProperty(ServiceClientFactoryProperties.DSC_PKCS11_PROVIDER_NAME, "pkcs11"); // Optional
      connectionProps.setProperty(ServiceClientFactoryProperties.DSC_PKCS11_LIBRARY_PATH, pkcsDll);
         //connectionProps.setProperty(ServiceClientFactoryProperties.DSC_PKCS11_SLOT_ID, new Integer(slotId).toString()); // Optional
         connectionProps.setProperty(ServiceClientFactoryProperties.DSC_PKCS11_PIN, cacCardPin);
         
            ServiceClientFactory factory = ServiceClientFactory.createInstance(connectionProps);
         RightsManagementClient2 rmClient2 = new RightsManagementClient2(factory);
         DocumentManager documentManager = rmClient2.getDocumentManager();
         
         long startTime = System.currentTimeMillis();
         PublishLicenseDTO license = documentManager.createLicense(POLICY_ID, USERNAME, DOMAIN_NAME, "Out.pdf", true);
         System.out.println("Create License totalTime = " + (System.currentTimeMillis() - startTime));
         
         testProtectPDFDocument(rmClient2, license);
         
      }catch (Exception ex){
        ex.printStackTrace(); 
     }
    }

 private static PublishLicenseDTO testProtectPDFDocument(
   RightsManagementClient2 rmClient2, PublishLicenseDTO license)
   throws SDKException, FileNotFoundException, IOException {
  
        InputStream inputFileStream = new FileInputStream(unprotectedFileName);
  
        long startTime = System.currentTimeMillis();
        InputStream protectPDF = rmClient2.getRightsManagementEncryptionService().protectPDFDocument(inputFileStream, license);
        System.out.println("protectPDFDocument totalTime = " + (System.currentTimeMillis() - startTime));
        
        File myFile = new File(protectedFileName);
    FileOutputStream outputStream = new FileOutputStream(myFile);
   
    int read = 0;
    byte[] bytes = new byte[1024];
   
    while ((read = protectPDF.read(bytes)) != -1) {
     outputStream.write(bytes, 0, read);
    }
       outputStream.close();
       inputFileStream.close();
       
        System.out.println("Document Protected Successfully");
  return license;
 }
}
```

The following sample code displays a popup to the user to select a certificate for a CAC card containing multiple certificates:

```java
package com.adobe.idp.dsc.spi.pkcs11.certListHandler.impl;

import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Scanner;

import com.adobe.idp.dsc.spi.pkcs11.certListHandler.Pkcs11CertListCallbackHandler;

public class DefaultPkcs11CertListCallbackHandler implements Pkcs11CertListCallbackHandler{

 private static Scanner sc =null;
 private static String ekuClientAuth = "1.3.6.1.5.5.7.3.2";
 
 public DefaultPkcs11CertListCallbackHandler(){
  sc=new Scanner(System.in); 
 }
 
 public String handle(Map<String, Certificate> certMap) throws Exception {
  System.out.println("Following is the list of valid certificates: Aliases & Subject Name ");
  int i =1;
  Iterator<Entry<String, Certificate>> certIterator = certMap.entrySet().iterator();
  while (certIterator.hasNext()){
   Map.Entry<String, Certificate> certEntry = certIterator.next();
   X509Certificate cert = ((X509Certificate)certEntry.getValue());
   List<String> ekuList = cert.getExtendedKeyUsage();
   if(ekuList == null || (ekuList != null && ekuList.contains(ekuClientAuth))){
    System.out.println(i++ + " Alias " + certEntry.getKey() 
      + " Subject Name" + cert.getIssuerX500Principal().getName());
   }
  }
  System.out.println("Enter alias which should be used: "); 
  return sc.next();
 }
}

```


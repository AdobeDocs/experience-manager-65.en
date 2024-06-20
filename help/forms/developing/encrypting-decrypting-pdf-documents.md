---
title: Encrypting and Decrypting PDF Documents

description: Use the Encryption service to encrypt and decrypt documents. The Encryption service tasks include encrypting a PDF document with a password, encrypting a PDF document with a certificate, removing password-based encryption from a PDF document, removing certificate-based encryption from a PDF document, unlocking the PDF document so that other service operations can be performed, and determining the encryption type of a secured PDF document.


contentOwner: admin
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations

role: Developer
exl-id: d3cbca7f-9277-4d61-b198-abf4bb008f15
solution: Experience Manager, Experience Manager Forms

---
# Encrypting and Decrypting PDF Documents {#encrypting-and-decrypting-pdf-documents} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

**About the Encryption Service**

The Encryption service lets you encrypt and decrypt documents. When a document is encrypted, its contents become unreadable. An authorized user can decrypt the document to obtain access to the contents. If a PDF document is encrypted with a password, the user must specify the open password before the document can be viewed in Adobe Reader or Adobe Acrobat. Likewise, if a PDF document is encrypted with a certificate, the user must decrypt the PDF document with the public key that corresponds to the certificate (private key) that was used to encrypt the PDF document.

You can accomplish these tasks using the Encryption service:

* Encrypt a PDF document with a password. (See [Encrypting PDF Documents with a Password](encrypting-decrypting-pdf-documents.md#encrypting-pdf-documents-with-a-password).)
* Encrypt a PDF document with a certificate. (See [Encrypting PDF Documents with Certificates](encrypting-decrypting-pdf-documents.md#encrypting-pdf-documents-with-certificates).)
* Remove password-based encryption from a PDF document. (See [Removing Password Encryption](encrypting-decrypting-pdf-documents.md#removing-password-encryption).)
* Remove certificate-based encryption from a PDF document. (See [Removing Certificate Based Encryption](encrypting-decrypting-pdf-documents.md#removing-certificate-based-encryption).)
* Unlock the PDF document so that other service operations can be performed. For example, after a password-encrypted PDF document is unlocked, you can apply a digital signature to it. (See [Unlocking Encrypted PDF Documents](encrypting-decrypting-pdf-documents.md#unlocking-encrypted-pdf-documents).)
* Determine the encryption type of a secured PDF document. (See [Determining Encryption Type](encrypting-decrypting-pdf-documents.md#determining-encryption-type).)

>[!NOTE]
>
>For more information about the Encryption service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

## Encrypting PDF Documents with a Password {#encrypting-pdf-documents-with-a-password}

When you encrypt a PDF document with a password, a user must specify the password to open the PDF document in Adobe Reader or Acrobat. Also, before another AEM Forms operation, such as digitally signing the PDF document, can be performed on the document, a password-encrypted PDF document must be unlocked.

>[!NOTE]
>
>If you upload an encrypted PDF document to the AEM Forms repository, it cannot decrypt the PDF document and extract the XDP content. It is recommended that you do not encrypt a document prior to uploading it to the AEM Forms repository. (See [Writing Resources](/help/forms/developing/aem-forms-repository.md#writing-resources).)

>[!NOTE]
>
>For more information about the Encryption service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary-of-steps}

To encrypt a PDF document with a password, perform the following steps:

1. Include project files.
1. Create an Encryption Client API object.
1. Get a PDF document to encrypt.
1. Set encryption run-time options.
1. Add the password.
1. Save the encrypted PDF document as a PDF file.

**Include project files**

Include necessary files in your development project. If you are creating a client application using Java, include the necessary JAR files. If you are using web services, ensure that you include the proxy files.

The following JAR files must be added to your project’s class path:

* adobe-livecycle-client.jar
* adobe-usermanager-client.jar
* adobe-encryption-client.jar
* adobe-utilities.jar (required if AEM Forms is deployed on JBoss)
* jbossall-client.jar (required if AEM Forms is deployed on JBoss)

**Create an Encryption Client API object**

To programmatically perform an Encryption service operation, you must create an Encryption service client.

**Get a PDF document to encrypt**

Obtain an unencrypted PDF document to encrypt the document with a password. If you attempt to secure a PDF document that is already encrypted, you cause an exception.

**Set encryption run-time options**

To encrypt a PDF document with a password, you specify four values, including two password values. The first password value is used to encrypt the PDF document and must be specified when opening the PDF document. The second password value, named the master password value, is used to remove encryption from the PDF document. Password values are case sensitive, and these two password values cannot be the same values.

Specify the PDF document resources to encrypt. You can encrypt the entire PDF document, everything except for the document’s metadata, or just the document’s attachments. If you encrypt only the document’s attachments, a user is prompted for a password when they attempt to access the file attachments.

When encrypting a PDF document, you can specify permissions that are associated with the secured document. By specifying permissions, you can control the actions that a user who opens a password-encrypted PDF document is allowed to perform. For example, to successfully extract form data, you must set the following permissions:

* PASSWORD_EDIT_ADD
* PASSWORD_EDIT_MODIFY

>[!NOTE]
>
>Permissions are specified as `PasswordEncryptionPermission` enumeration values.

**Add the password**

After you retrieve an unsecured PDF document and set encryption run-time values, you can add a password to the PDF document.

**Save the encrypted PDF document as a PDF file**

You can save the password-encrypted PDF document as a PDF file.

**See also**

[Encrypt a PDF document using the Java API](encrypting-decrypting-pdf-documents.md#encrypt-a-pdf-document-using-the-java-api)

[Encrypting a PDF document using the web service API](encrypting-decrypting-pdf-documents.md#encrypting-a-pdf-document-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Encryption Service API Quick Starts](/help/forms/developing/encryption-service-java-api-quick.md#encryption-service-java-api-quick-start-soap)

[Encrypting PDF Documents with Certificates](encrypting-decrypting-pdf-documents.md#encrypting-pdf-documents-with-certificates)

### Encrypt a PDF document using the Java API {#encrypt-a-pdf-document-using-the-java-api}

Encrypt a PDF document with a password by using the Encryption API (Java):

1. Include project files.

   Include client JAR files, such as adobe-encryption-client.jar, in your Java project’s class path.

1. Create an Encryption Client API.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create an `EncryptionServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Get a PDF document to encrypt.

    * Create a `java.io.FileInputStream` object that represents the PDF document to encrypt by using its constructor and passing a string value that specifies the location of the PDF document.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Set encryption run-time options.

    * Create a `PasswordEncryptionOptionSpec` object by invoking its constructor.
    * Specify the PDF document resources to encrypt by invoking the `PasswordEncryptionOptionSpec` object’s `setEncryptOption` method and passing a `PasswordEncryptionOption` enumeration value that specifies the document resources to encrypt. For example, to encrypt the entire PDF document, including its metadata and its attachments, specify `PasswordEncryptionOption.ALL`.
    * Create a `java.util.List` object that stores the encryption permissions by using the `ArrayList` constructor.
    * Specify a permission by invoking the `java.util.List` object ‘s `add` method and passing an enumeration value that corresponds to the permission that you want to set. For example, to set the permission that lets a user copy data in the PDF document, specify `PasswordEncryptionPermission.PASSWORD_EDIT_COPY`. (Repeat this step for each permission to set).
    * Specify the Acrobat compatibility option by invoking the `PasswordEncryptionOptionSpec` object’s `setCompatability` method and passing an enumeration value that specifies the Acrobat compatibility level. For example, you can specify `PasswordEncryptionCompatability.ACRO_7`.
    * Specify the password value that lets a user open the encrypted PDF document by invoking the `PasswordEncryptionOptionSpec` object’s `setDocumentOpenPassword` method and passing a string value that represents the open password.
    * Specify the master password value that lets a user remove encryption from the PDF document by invoking the `PasswordEncryptionOptionSpec` object’s `setPermissionPassword` method and passing a string value that represents the master password.

1. Add the password.

   Encrypt the PDF document by invoking the `EncryptionServiceClient` object’s `encryptPDFUsingPassword` method and passing the following values:

    * The `com.adobe.idp.Document` object that contains the PDF document to encrypt with the password.
    * The `PasswordEncryptionOptionSpec` object that contains encryption run-time options.

   The `encryptPDFUsingPassword` method returns a `com.adobe.idp.Document` object that contains a password-encrypted PDF document.

1. Save the encrypted PDF document as a PDF file.

    * Create a `java.io.File` object and ensure that the file extension is .pdf.
    * Invoke the `com.adobe.idp.Document` object’s `copyToFile` method to copy the contents of the `com.adobe.idp.Document` object to the file. Ensure that you use the `com.adobe.idp.Document` object that was returned by the `encryptPDFUsingPassword` method.

**See also**

[Summary of steps](encrypting-decrypting-pdf-documents.md#summary-of-steps)

[Quick Start (SOAP mode): Encrypting a PDF document using the Java API](/help/forms/developing/encryption-service-java-api-quick.md#quick-start-soap-mode-encrypting-a-pdf-document-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Encrypting a PDF document using the web service API {#encrypting-a-pdf-document-using-the-web-service-api}

Encrypt a PDF document with a password by using the Encryption API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/EncryptionService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create an Encryption Client API object.

    * Create an `EncryptionServiceClient` object by using its default constructor.
    * Create an `EncryptionServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/EncryptionService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `EncryptionServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object’s `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `EncryptionServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `EncryptionServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.
        * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Get a PDF document to encrypt.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store a PDF document that is encrypted with a password.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the PDF document to encrypt and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object’s `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object’s `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning the contents of the byte array to the `BLOB` object’s `MTOM` data member.

1. Set encryption run-time options.

    * Create a `PasswordEncryptionOptionSpec` object by using its constructor.
    * Specify the PDF document resources to encrypt by assigning a `PasswordEncryptionOption` enumeration value to the `PasswordEncryptionOptionSpec` object’s `encryptOption` data member. To encrypt the entire PDF, including its metadata and its attachments, assign `PasswordEncryptionOption.ALL` to this data member.
    * Specify the Acrobat compatibility option by assigning a `PasswordEncryptionCompatability` enumeration value to the `PasswordEncryptionOptionSpec` object’s `compatability` data member. For example, assign `PasswordEncryptionCompatability.ACRO_7` to this data member.
    * Specify the password value that lets a user open the encrypted PDF document by assigning a string value that represents the open password to the `PasswordEncryptionOptionSpec` object’s `documentOpenPassword` data member.
    * Specify the password value that lets a user remove encryption from the PDF document by assigning a string value that represents the master password to the `PasswordEncryptionOptionSpec` object’s `permissionPassword` data member.

1. Add the password.

   Encrypt the PDF document by invoking the `EncryptionServiceClient` object’s `encryptPDFUsingPassword` method and passing the following values:

    * The `BLOB` object that contains the PDF document to encrypt with the password.
    * The `PasswordEncryptionOptionSpec` object that contains encryption run-time options.

   The `encryptPDFUsingPassword` method returns a `BLOB` object that contains a password-encrypted PDF document.

1. Save the encrypted PDF document as a PDF file.

    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the secured PDF document.
    * Create a byte array that stores the data content of the `BLOB` object that was returned by the `encryptPDFUsingPassword` method. Populate the byte array by getting the value of the `BLOB` object’s `MTOM` data member.
    * Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.
    * Write the contents of the byte array to a PDF file by invoking the `System.IO.BinaryWriter` object’s `Write` method and passing the byte array.

**See also**

[Summary of steps](encrypting-decrypting-pdf-documents.md#summary-of-steps)

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

## Encrypting PDF Documents with Certificates {#encrypting-pdf-documents-with-certificates}

Certificate-based encryption lets you encrypt a document for specific recipients by means of public key technology. Various recipients can be given different permissions for the document. Many aspects of encryption are made possible by public key technology. An algorithm is used to generate two large numbers, known as *keys*, that have the following properties:

* One key is used to encrypt a set of data. Subsequently, only the other key can be used to decrypt the data.
* It is impossible to distinguish one key from the other.

One of the keys acts as a user’s private key. It is important that only the user has access to this key. The other key is the user’s public key, which can be shared with others.

A public key certificate contains a user’s public key and identifying information. The X.509 format is used for storing certificates. Certificates are typically issued and digitally signed by a certificate authority (CA), which is a recognized entity that provides a measure of confidence in the validity of the certificate. Certificates have an expiration date, after which they are no longer valid. In addition, certificate revocation lists (CRLs) provide information about certificates that were revoked prior to their expiration date. CRLs are published periodically by certificate authorities. The revocation status of a certificate can also be retrieved through Online Certificate Status Protocol (OCSP) over the network.

>[!NOTE]
>
>If you upload an encrypted PDF document to the AEM Forms repository, it cannot decrypt the PDF document and extract the XDP content. It is recommended that you do not encrypt a document prior to uploading it to the AEM Forms repository. (See [Writing Resources](/help/forms/developing/aem-forms-repository.md#writing-resources).)

>[!NOTE]
>
>Before you can encrypt a PDF document with a certificate, you must ensure that you add the certificate to AEM Forms. A certificate is added using administration console or programmatically using the Trust Manager API. (See [Importing Credentials by using the Trust Manager API](/help/forms/developing/credentials.md#importing-credentials-by-using-the-trust-manager-api).)

>[!NOTE]
>
>For more information about the Encryption service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-1}

To encrypt a PDF document with a certificate, perform the following steps:

1. Include project files.
1. Create an Encryption Client API object.
1. Get a PDF document to encrypt.
1. Reference the certificate.
1. Set encryption run-time options.
1. Create a certificate-encrypted PDF document.
1. Save the encrypted PDF document as a PDF file.

**Include project files**

Include the necessary files in your development project. If you are creating a client application by using Java, include the necessary JAR files. If you are using web services, ensure that you include the proxy files.

The following JAR files must be added to your project’s class path:

* adobe-livecycle-client.jar
* adobe-usermanager-client.jar
* adobe-encryption-client.jar
* adobe-utilities.jar (required if AEM Forms is deployed on JBoss Application Server)
* jbossall-client.jar (required if AEM Forms is deployed on JBoss Application Server)

**Create an Encryption Client API object**

To programmatically perform an Encryption service operation, you must create an Encryption service client. If you are using the Java Encryption Service API, create an `EncrytionServiceClient` object. If you are using the web service Encryption Service API, create an `EncryptionServiceService` object.

**Get a PDF document to encrypt**

Obtain an unencrypted PDF document to encrypt. If you attempt to secure a PDF document that is already encrypted, an exception is thrown.

**Reference the certificate**

To encrypt a PDF document with a certificate, reference a certificate that is used to encrypt a PDF document. The certificate is a .cer file, a .crt file, or a .pem file. A PKCS#12 file is used to store private keys with corresponding certificates.

When encrypting a PDF document with a certificate, specify permissions that are associated with the secured document. By specifying permissions, you can control the actions that a user who opens a certificate-encrypted PDF document can perform.

**Set encryption run-time options**

Specify the PDF document resources to encrypt. You can encrypt the entire PDF document, everything except the document’s metadata, or only the document’s attachments.

**Create a certificate-encrypted PDF document**

After you retrieve an unsecured PDF document, reference the certificate, and set run-time options, you can create a certificate-encrypted PDF document. After the PDF document is encrypted, you need the corresponding public key to decrypt it.

**Save the encrypted PDF document as a PDF file**

You can save the encrypted PDF document as a PDF file.

**See also**

[Encrypt a PDF document with a certificate using the Java API](encrypting-decrypting-pdf-documents.md#encrypt-a-pdf-document-with-a-certificate-using-the-java-api)

[Encrypt a PDF document with a certificate using the web service API](encrypting-decrypting-pdf-documents.md#encrypt-a-pdf-document-with-a-certificate-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Encryption Service API Quick Starts](/help/forms/developing/encryption-service-java-api-quick.md#encryption-service-java-api-quick-start-soap)

[Encrypting PDF Documents with a Password](encrypting-decrypting-pdf-documents.md#encrypting-pdf-documents-with-a-password)

### Encrypt a PDF document with a certificate using the Java API {#encrypt-a-pdf-document-with-a-certificate-using-the-java-api}

Encrypt a PDF document with a certificate by using the Encryption API (Java):

1. Include project files.

   Include client JAR files, such as adobe-encryption-client.jar, in your Java project’s class path.

1. Create an Encryption Client API object.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create an `EncryptionServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Get a PDF document to encrypt.

    * Create a `java.io.FileInputStream` object that represents the PDF document to encrypt by using its constructor and passing a string value that specifies the location of the PDF document.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Reference the certificate.

    * Create a `java.util.List` object that stores permission information by using its constructor.
    * Specify the permission associated with the encrypted document by invoking the `java.util.List` object’s `add` method and passing a `CertificateEncryptionPermissions` enumeration value that represents the permissions that are granted to the user who opens the secured PDF document. For example, to specify all permissions, pass `CertificateEncryptionPermissions.PKI_ALL_PERM`.
    * Create a `Recipient` object by using its constructor.
    * Create a `java.io.FileInputStream` object that represents the certificate that is used to encrypt the PDF document by using its constructor and passing a string value that specifies the location of the certificate.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object that represents the certificate.
    * Invoke the `Recipient` object’s `setX509Cert` method and pass the `com.adobe.idp.Document` object that contains the certificate. (In addition, the `Recipient`object can have a Truststore certificate alias or LDAP URL as a certificate source.)
    * Create a `CertificateEncryptionIdentity` object that stores permission and certificate information by using its constructor.
    * Invoke the `CertificateEncryptionIdentity` object’s `setPerms` method and pass the `java.util.List` object that stores permission information.
    * Invoke the `CertificateEncryptionIdentity` object’s `setRecipient` method and pass the `Recipient` object that stores certificate information.
    * Create a `java.util.List` object that stores certificate information by using its constructor.
    * Invoke the `java.util.List` object’s add method and pass the `CertificateEncryptionIdentity` object. (This `java.util.List` object is passed as a parameter to the `encryptPDFUsingCertificates` method.)

1. Set encryption run-time options.

    * Create a `CertificateEncryptionOptionSpec` object by invoking its constructor.
    * Specify the PDF document resources to encrypt by invoking the `CertificateEncryptionOptionSpec` object’s `setOption` method and passing a `CertificateEncryptionOption` enumeration value that specifies the document resources to encrypt. For example, to encrypt the entire PDF document, including its metadata and its attachments, specify `CertificateEncryptionOption.ALL`.
    * Specify the Acrobat compatibility option by invoking the `CertificateEncryptionOptionSpec` object’s `setCompat` method and passing a `CertificateEncryptionCompatibility` enumeration value that specifies the Acrobat compatibility level. For example, you can specify `CertificateEncryptionCompatibility.ACRO_7`.

1. Create a certificate-encrypted PDF document.

   Encrypt the PDF document with a certificate by invoking the `EncryptionServiceClient` object’s `encryptPDFUsingCertificates` method and passing the following values:

    * The `com.adobe.idp.Document` object that contains the PDF document to encrypt.
    * The `java.util.List` object that stores certificate information.
    * The `CertificateEncryptionOptionSpec` object that contains encryption run-time options.

   The `encryptPDFUsingCertificates` method returns a `com.adobe.idp.Document` object that contains a certificate-encrypted PDF document.

1. Save the encrypted PDF document as a PDF file.

    * Create a `java.io.File` object and ensure that the file name extension is .pdf.
    * Invoke the `com.adobe.idp.Document` object’s `copyToFile` method to copy the contents of the `com.adobe.idp.Document` object to the file. Ensure that you use the `com.adobe.idp.Document` object that was returned by the `encryptPDFUsingCertificates` method.

**See also**

[Summary of steps](encrypting-decrypting-pdf-documents.md#summary-of-steps)

[Quick Start (SOAP mode): Encrypting a PDF document with a certificate using the Java API](/help/forms/developing/encryption-service-java-api-quick.md#quick-start-soap-mode-encrypting-a-pdf-document-with-a-certificate-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Encrypt a PDF document with a certificate using the web service API {#encrypt-a-pdf-document-with-a-certificate-using-the-web-service-api}

Encrypt a PDF document with a certificate by using the Encryption API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/EncryptionService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create an Encryption Client API object.

    * Create an `EncryptionServiceClient` object by using its default constructor.
    * Create an `EncryptionServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/EncryptionService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `EncryptionServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object’s `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `EncryptionServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `EncryptionServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.
        * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Get a PDF document to encrypt.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store a PDF document that is encrypted with a certificate.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the PDF document to encrypt and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object’s `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object’s `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` property with the contents of the byte array.

1. Reference the certificate.

    * Create a `Recipient` object by using its constructor. This object will store certificate information.
    * Create a `BLOB` object by using its constructor. This `BLOB` object will store the certificate that encrypts the PDF document.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the certificate and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object’s `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object’s `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning the contents of the byte array to the `BLOB` object’s `MTOM` data member.
    * Assign the `BLOB` object that stores the certificate to the `Recipient` object’s `x509Cert` data member.
    * Create a `CertificateEncryptionIdentity` object that stores certificate information by using its constructor.
    * Assign the `Recipient` object that stores the certificate to the `CertificateEncryptionIdentity`object’s recipient data member.
    * Create an `Object` array and assign the `CertificateEncryptionIdentity` object to the first element of the `Object` array. This `Object` array is passed as a parameter to the `encryptPDFUsingCertificates` method.

1. Set encryption run-time options.

    * Create a `CertificateEncryptionOptionSpec` object by using its constructor.
    * Specify the PDF document resources to encrypt by assigning a `CertificateEncryptionOption` enumeration value to the `CertificateEncryptionOptionSpec` object’s `option` data member. To encrypt the entire PDF document, including its metadata and its attachments, assign `CertificateEncryptionOption.ALL` to this data member.
    * Specify the Acrobat compatibility option by assigning a `CertificateEncryptionCompatibility` enumeration value to the `CertificateEncryptionOptionSpec` object’s `compat` data member. For example, assign `CertificateEncryptionCompatibility.ACRO_7` to this data member.

1. Create a certificate-encrypted PDF document.

   Encrypt the PDF document with a certificate by invoking the `EncryptionServiceService` object’s `encryptPDFUsingCertificates` method and passing the following values:

    * The `BLOB` object that contains the PDF document to encrypt.
    * The `Object` array that stores certificate information.
    * The `CertificateEncryptionOptionSpec` object that contains encryption run-time options.

   The `encryptPDFUsingCertificates` method returns a `BLOB` object that contains a certificate-encrypted PDF document.

1. Save the encrypted PDF document as a PDF file.

    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the secured PDF document.
    * Create a byte array that stores the data content of the `BLOB` object that was returned by the `encryptPDFUsingCertificates` method. Populate the byte array by getting the value of the `BLOB` object’s `binaryData` data member.
    * Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.
    * Write the contents of the byte array to a PDF file by invoking the `System.IO.BinaryWriter` object’s `Write` method and passing the byte array.

**See also**

[Summary of steps](encrypting-decrypting-pdf-documents.md#summary-of-steps)

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

## Removing Certificate Based Encryption {#removing-certificate-based-encryption}

Certificate-based encryption can be removed from a PDF document so that users can open the PDF document in Adobe Reader or Acrobat. To remove encryption from a PDF document that is encrypted with a certificate, a public key must be referenced. After encryption is removed from a PDF document, it is no longer secure.

>[!NOTE]
>
>For more information about the Encryption service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-2}

To remove certificate-based encryption from a PDF document, perform the following steps:

1. Include project files.
1. Create an encryption service client.
1. Get the encrypted PDF document.
1. Remove encryption.
1. Save the PDF document as a PDF file.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, include the necessary JAR files. If you are using web services, ensure that you include the proxy files.

The following JAR files must be added to your project’s class path:

* adobe-livecycle-client.jar
* adobe-usermanager-client.jar
* adobe-encryption-client.jar
* adobe-utilities.jar (required if AEM Forms is deployed on JBoss Application Server)
* jbossall-client.jar (required if AEM Forms is deployed on JBoss Application Server)

**Create an encryption service client**

To programmatically perform an Encryption service operation, you must create an Encryption service client. If you are using the Java Encryption Service API, create an `EncrytionServiceClient` object. If you are using the web service Encryption Service API, create an `EncryptionServiceService` object.

**Get the encrypted PDF document**

Obtain an encrypted PDF document to remove certificate-based encryption. If you attempt to remove encryption from a PDF document that is not encrypted, an exception is thrown. Likewise, if you attempt to remove certificate-based encryption from a password-encrypted document, an exception is thrown.

**Remove encryption**

To remove certificate-based encryption from an encrypted PDF document, you require both an encrypted PDF document and the private key that corresponds to the key that was used to encrypt the PDF document. The alias value of the private key is specified when removing certificate-based encryption from an encrypted PDF document. For information about the public key, see [Encrypting PDF Documents with Certificates](encrypting-decrypting-pdf-documents.md#encrypting-pdf-documents-with-certificates).

>[!NOTE]
>
>A private key is stored in the AEM Forms Trust Store. When a certificate is placed there, an alias value is specified.

**Save the PDF document**

After certificate-based encryption is removed from an encrypted PDF document, you can save the PDF document as a PDF file. Users can open the PDF document in Adobe Reader or Acrobat.

**See also**

[Remove certificate-based encryption using the Java API](encrypting-decrypting-pdf-documents.md#remove-certificate-based-encryption-using-the-java-api)

[Remove certificate-based encryption using the web service API](encrypting-decrypting-pdf-documents.md#remove-certificate-based-encryption-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Encryption Service API Quick Starts](/help/forms/developing/encryption-service-java-api-quick.md#encryption-service-java-api-quick-start-soap)

### Remove certificate-based encryption using the Java API {#remove-certificate-based-encryption-using-the-java-api}

Remove certificate-based encryption from a PDF document by using the Encryption API (Java):

1. Include project files.

   Include client JAR files, such as adobe-encryption-client.jar, in your Java project’s class path.

1. Create an encryption service client.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create an `EncryptionServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Get the encrypted PDF document.

    * Create a `java.io.FileInputStream` object that represents the encrypted PDF document by using its constructor and passing a string value that specifies the location of the encrypted PDF document.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Remove encryption.

   Remove certificate-based encryption from the PDF document by invoking the `EncryptionServiceClient` object’s `removePDFCertificateSecurity` method and passing the following values:

    * The `com.adobe.idp.Document` object that contains the encrypted PDF document.
    * A string value that specifies the alias name of the private key that corresponds to the key used to encrypt the PDf document.

   The `removePDFCertificateSecurity` method returns a `com.adobe.idp.Document` object that contains an unsecured PDF document.

1. Save the PDF document.

    * Create a `java.io.File` object and ensure that the file extension is .pdf.
    * Invoke the `com.adobe.idp.Document` object’s `copyToFile` method to copy the contents of the `Document` object to the file. Ensure that you use the `com.adobe.idp.Document` object that was returned by the `removePDFCredentialSecurity` method.

**See also**

[Summary of steps](encrypting-decrypting-pdf-documents.md#summary-of-steps)

[Quick Start (SOAP mode): Removing certificate-based encryption using the Java API](/help/forms/developing/encryption-service-java-api-quick.md#quick-start-soap-mode-removing-certificate-based-encryption-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Remove certificate-based encryption using the web service API {#remove-certificate-based-encryption-using-the-web-service-api}

Remove certificate-based encryption by using the Encryption API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/EncryptionService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create an encryption service client.

    * Create an `EncryptionServiceClient` object by using its default constructor.
    * Create an `EncryptionServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/EncryptionService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `EncryptionServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object’s `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `EncryptionServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `EncryptionServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.
        * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Get the encrypted PDF document.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store the encrypted PDF document.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the encrypted PDF document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object’s `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object’s `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning the contents of the byte array to the `BLOB` object’s `MTOM` data member.

1. Remove encryption.

   Invoke the `EncryptionServiceClient` object’s `removePDFCertificateSecurity` method and pass the following values:

    * The `BLOB` object that contains file stream data that represents an encrypted PDF document.
    * A string value that specifies the alias name of the public key that corresponds to the private key used to encrypt the PDf document.

   The `removePDFCredentialSecurity` method returns a `BLOB` object that contains an unsecured PDF document.

1. Save the PDF document.

    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the unsecured PDF document.
    * Create a byte array that stores the content of the `BLOB` object that was returned by the `removePDFPasswordSecurity` method. Populate the byte array by getting the value of the `BLOB` object’s `MTOM` data member.
    * Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.
    * Write the contents of the byte array to a PDF file by invoking the `System.IO.BinaryWriter` object’s `Write` method and passing the byte array.

**See also**

[Summary of steps](encrypting-decrypting-pdf-documents.md#summary-of-steps)

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

## Removing Password Encryption {#removing-password-encryption}

Password-based encryption can be removed from a PDF document so that users can open the PDF document in Adobe Reader or Acrobat without having to specify a password. After password-based encryption is removed from a PDF document, the document is no longer secure.

>[!NOTE]
>
>For more information about the Encryption service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-3}

To remove password-based encryption from a PDF document, perform the following steps:

1. Include project files
1. Create an encryption service client.
1. Get the encrypted PDF document.
1. Remove the password.
1. Save the PDF document as a PDF file.

**Include project files**

Include the necessary files into your development project. If you are creating a client application using Java, include the necessary JAR files. If you are using web services, make sure that you include the proxy files.

The following JAR files must be added to your project’s class path:

* adobe-livecycle-client.jar
* adobe-usermanager-client.jar
* adobe-encryption-client.jar
* adobe-utilities.jar (required if AEM Forms is deployed on JBoss)
* jbossall-client.jar (required if AEM Forms is deployed on JBoss)

**Create an encryption service client**

To programmatically perform an Encryption service operation, you must create an Encryption service client. If you are using the Java Encryption Service API, create an `EncrytionServiceClient` object. If you are using the web service Encryption Service API, create an `EncryptionServiceService` object.

**Get the encrypted PDF document**

Obtain an encrypted PDF document to remove password-based encryption. If you attempt to remove encryption from a PDF document that is not encrypted, an exception is thrown.

**Remove the password**

To remove password-based encryption from an encrypted PDF document, you require both an encrypted PDF document and a master password value that is used to remove encryption from the PDF document. The password that is used to open a password-encrypted PDF document cannot be used to remove encryption. A master password is specified when the PDF document is encrypted with a password. (See [Encrypting PDF Documents with a Password](encrypting-decrypting-pdf-documents.md#encrypting-pdf-documents-with-a-password).)

**Save the PDF document**

After the Encryption service removes password-based encryption from a PDF document, you can save the PDF document as a PDF file. Users can open the PDF document in Adobe Reader or Acrobat without specifying a password.

**See also**

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Encryption Service API Quick Starts](/help/forms/developing/encryption-service-java-api-quick.md#encryption-service-java-api-quick-start-soap)

[Encrypting PDF Documents with a Password](encrypting-decrypting-pdf-documents.md#encrypting-pdf-documents-with-a-password)

### Remove password-based encryption using the Java API {#remove-password-based-encryption-using-the-java-api}

Remove password-based encryption from a PDF document by using the Encryption API (Java):

1. Include project files.

   Include client JAR files, such as the adobe-encryption-client.jar, in your Java project’s class path.

1. Create an encryption service client.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create an `EncryptionServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Get the encrypted PDF document.

    * Create a `java.io.FileInputStream` object that represents the encrypted PDF document by using its constructor and passing a string value that specifies the location of the PDF document.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Remove the password.

   Remove password-based encryption from the PDF document by invoking the `EncryptionServiceClient` object’s `removePDFPasswordSecurity` method and passing the following values:

    * A `com.adobe.idp.Document` object that contains the encrypted PDF document.
    * A string value that specifies the master password value that is used to remove encryption from the PDF document.

   The `removePDFPasswordSecurity` method returns a `com.adobe.idp.Document` object that contains an unsecured PDF document.

1. Save the PDF document.

    * Create a `java.io.File` object and ensure that the file name extension is .pdf.
    * Invoke the `com.adobe.idp.Document` object’s `copyToFile` method to copy the contents of the `Document` object to the file. Ensure that you use the `Document` object that was returned by the `removePDFPasswordSecurity` method.

**See also**

[Quick Start (SOAP mode): Removing password-based encryption using the Java API](/help/forms/developing/encryption-service-java-api-quick.md#quick-start-soap-mode-removing-password-based-encryption-using-the-java-api)

### Remove password-based encryption using the web service API {#remove-password-based-encryption-using-the-web-service-api}

Remove password-based encryption by using the Encryption API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/EncryptionService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create an encryption service client.

    * Create an `EncryptionServiceClient` object by using its default constructor.
    * Create an `EncryptionServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/EncryptionService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `EncryptionServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object’s `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `EncryptionServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `EncryptionServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.
        * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Get the encrypted PDF document.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store a password-encrypted PDF document.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the encrypted PDF document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object’s `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object’s `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning the contents of the byte array to the `BLOB` object’s `MTOM` data member.

1. Remove the password.

   Invoke the `EncryptionServiceService` object’s `removePDFPasswordSecurity` method and pass the following values:

    * The `BLOB` object that contains file stream data that represents an encrypted PDF document.
    * A string value that specifies the password value that is used to remove encryption from the PDF document. This value is specified when encrypting the PDF document with a password.

   The `removePDFPasswordSecurity` method returns a `BLOB` object that contains an unsecured PDF document.

1. Save the PDF document.

    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the unsecured PDF document.
    * Create a byte array that stores the content of the `BLOB` object that was returned by the `removePDFPasswordSecurity` method. Populate the byte array by getting the value of the `BLOB` object’s `MTOM` data member.
    * Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.
    * Write the contents of the byte array to a PDF file by invoking the `System.IO.BinaryWriter` object’s `Write` method and passing the byte array.

**See also**

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

## Unlocking Encrypted PDF Documents {#unlocking-encrypted-pdf-documents}

A password-encrypted or certificate-encrypted PDF document must be unlocked before another AEM Forms operation can be performed on it. If you attempt to perform an operation on an encrypted PDF document, you will generate an exception. After you unlock an encrypted PDF document, you can perform one or more operations on it. These operations can belong to other services, such as the Acrobat Reader DC extensions Service.

>[!NOTE]
>
>For more information about the Encryption service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-4}

To unlock an encrypted PDF document, perform the following steps:

1. Include project files.
1. Create an encryption service client.
1. Get the encrypted PDF document.
1. Unlock the document.
1. Perform an AEM Forms operation.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, include the necessary JAR files. If you are using web services, make sure that you include the proxy files.

The following JAR files must be added to your project’s class path:

* adobe-livecycle-client.jar
* adobe-usermanager-client.jar
* adobe-encryption-client.jar
* adobe-utilities.jar (required if AEM Forms is deployed on JBoss Application Server)
* jbossall-client.jar (required if AEM Forms is deployed on JBoss Application Server)

**Create an encryption service client**

To programmatically perform an Encryption service operation, you must create an Encryption service client. If you are using the Java Encryption Service API, create an `EncrytionServiceClient` object. If you are using the web service Encryption Service API, create an `EncryptionServiceService` object.

**Get the encrypted PDF document**

Obtain an encrypted PDF document to unlock it. If you attempt to unlock a PDF document that is not encrypted, an exception is thrown.

**Unlock the document**

To unlock a password-encrypted PDF document, you require both an encrypted PDF document and a password value that is used to open a password-encrypted PDF document. This value is specified when encrypting the PDF document with a password. (See [Encrypting PDF Documents with a Password](encrypting-decrypting-pdf-documents.md#encrypting-pdf-documents-with-a-password).)

To unlock a certificate-encrypted PDF document, you require both an encrypted PDF document and the alias value of the public key that corresponds to the private key that was used to encrypt the PDF document.

**Perform an AEM Forms operation**

After an encrypted PDF document is unlocked, you can perform another service operation on it, such as applying usage rights to it. This operation belongs to the Acrobat Reader DC Extensions service.

**See also**

[Unlock an encrypted PDF document using the Java API](encrypting-decrypting-pdf-documents.md#unlock-an-encrypted-pdf-document-using-the-java-api)

[Unlock an encrypted PDF document using the web service API](encrypting-decrypting-pdf-documents.md#unlock-an-encrypted-pdf-document-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Encryption Service API Quick Starts](/help/forms/developing/encryption-service-java-api-quick.md#encryption-service-java-api-quick-start-soap)

### Unlock an encrypted PDF document using the Java API {#unlock-an-encrypted-pdf-document-using-the-java-api}

Unlock an encrypted PDF document by using the Encryption API (Java):

1. Include project files.

   Include client JAR files, such as adobe-encryption-client.jar, in your Java project’s class path.

1. Create an encryption service client.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create an `EncryptionServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Get the encrypted PDF document.

    * Create a `java.io.FileInputStream` object that represents the encrypted PDF document by using its constructor and passing a string value that specifies the location of the encrypted PDF document.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Unlock the document.

   Unlock an encrypted PDF document by invoking the `EncryptionServiceClient` object’s `unlockPDFUsingPassword` or `unlockPDFUsingCredential` method.

   To unlock a PDF document that is encrypted with a password, invoke the `unlockPDFUsingPassword` method and pass the following values:

    * A `com.adobe.idp.Document` object that contains the password-encrypted PDF document.
    * A string value that specifies the password value that is used to open a password-encrypted PDF document. This value is specified when encrypting the PDF document with a password.

   To unlock a PDF document that is encrypted with a certificate, invoke the `unlockPDFUsingCredential` method and pass the following values:

    * A `com.adobe.idp.Document` object that contains the certificate-encrypted PDF document.
    * A string value that specifies the alias name of the public key that corresponds to the private key used to encrypt the PDF document.

   The `unlockPDFUsingPassword` and `unlockPDFUsingCredential` methods both return a `com.adobe.idp.Document` object that you pass to another AEM Forms Java method to perform an operation.

1. Perform a AEM Forms operation.

   Perform a AEM Forms operation on the unlocked PDF document to meet your business requirements. For example, assuming that you want to apply usage rights to an unlocked PDF document, pass the `com.adobe.idp.Document` object that was returned by either the `unlockPDFUsingPassword` or `unlockPDFUsingCredential` methods to the `ReaderExtensionsServiceClient` object’s `applyUsageRights` method.

**See also**

[Summary of steps](encrypting-decrypting-pdf-documents.md#summary-of-steps)

[Quick Start (SOAP mode): Unlocking an encrypted PDF document using the Java API](/help/forms/developing/encryption-service-java-api-quick.md#quick-start-soap-mode-unlocking-an-encrypted-pdf-document-using-the-java-api) (SOAP mode)

[Applying Usage Rights to PDF Documents](/help/forms/developing/assigning-usage-rights.md#applying-usage-rights-to-pdf-documents)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Unlock an encrypted PDF document using the web service API {#unlock-an-encrypted-pdf-document-using-the-web-service-api}

Unlock an encrypted PDF document by using the Encryption API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/EncryptionService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create an encryption service client.

    * Create an `EncryptionServiceClient` object by using its default constructor.
    * Create an `EncryptionServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/EncryptionService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `EncryptionServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object’s `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `EncryptionServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `EncryptionServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.
        * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Get an encrypted PDF document.

    * Create a `BLOB` object by using its constructor.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the encrypted PDF document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object’s `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object’s `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning the contents of the byte array to the `BLOB` object’s `MTOM` data member.

1. Unlock the document.

   Unlock an encrypted PDF document by invoking the `EncryptionServiceClient` object’s `unlockPDFUsingPassword` or `unlockPDFUsingCredential` method.

   To unlock a PDF document that is encrypted with a password, invoke the `unlockPDFUsingPassword` method and pass the following values:

    * A `BLOB` object that contains the password-encrypted PDF document.
    * A string value that specifies the password value that is used to open a password-encrypted PDF document. This value is specified when encrypting the PDF document with a password.

   To unlock a PDF document that is encrypted with a certificate, invoke the `unlockPDFUsingCredential` method and pass the following values:

    * A `BLOB` object that contains the certificate-encrypted PDF document.
    * A string value that specifies the alias name of the public key that corresponds to the private key used to encrypt the PDf document.

   The `unlockPDFUsingPassword` and `unlockPDFUsingCredential` methods both return a `com.adobe.idp.Document` object that you pass to another AEM Forms method to perform an operation.

1. Perform a AEM Forms operation.

   Perform a AEM Forms operation on the unlocked PDF document to meet your business requirements. For example, assuming that you want to apply usage rights to the unlocked PDF document, pass the `BLOB` object that was returned by either the `unlockPDFUsingPassword` or `unlockPDFUsingCredential` methods to the `ReaderExtensionsServiceClient` object’s `applyUsageRights` method.

**See also**

[Summary of steps](encrypting-decrypting-pdf-documents.md#summary-of-steps)

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

## Determining Encryption Type {#determining-encryption-type}

You can programmatically determine the type of encryption that is protecting a PDF document by using the Java Encryption Service API or the web service Encryption Service API. Sometimes it is necessary to dynamically determine whether a PDF document is encrypted and, if so, the encryption type. For example, you can determine whether a PDF document is protected with password-based encryption or a Rights Management policy.

A PDF document can be protected by the following encryption types:

* Password-based encryption
* Certificate-based encryption
* A policy that is created by the Rights Management service
* Another type of encryption

>[!NOTE]
>
>For more information about the Encryption service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-5}

To determine the type of encryption that is protecting a PDF document, perform the following steps:

1. Include project files.
1. Create an encryption service client.
1. Get the encrypted PDF document.
1. Determine the encryption type.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, include the necessary JAR files. If you are using web services, ensure that you include the proxy files.

The following JAR files must be added to your project’s class path:

* adobe-livecycle-client.jar
* adobe-usermanager-client.jar
* adobe-encryption-client.jar
* adobe-utilities.jar (required if AEM Forms is deployed on JBoss Application Server)
* jbossall-client.jar (required if AEM Forms is deployed on JBoss Application Server)

**Create a service client**

To programmatically perform an Encryption service operation, you must create an Encryption service client. If you are using the Java Encryption Service API, create an `EncrytionServiceClient` object. If you are using the web service Encryption Service API, create an `EncryptionServiceService` object.

**Get the encrypted PDF document**

Obtain a PDF document to determine the type of encryption that is protecting it.

**Determine the encryption type**

You can determine the type of encryption that is protecting a PDF document. If the PDF document is not protected, then the Encryption service informs you that the PDF document is not secured.

**See also**

[Determine the encryption type using the Java API](encrypting-decrypting-pdf-documents.md#determine-the-encryption-type-using-the-java-api)

[Determine the encryption type using the web service API](encrypting-decrypting-pdf-documents.md#determine-the-encryption-type-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Encryption Service API Quick Starts](/help/forms/developing/encryption-service-java-api-quick.md#encryption-service-java-api-quick-start-soap)

[Protecting Documents with Policies](/help/forms/developing/protecting-documents-policies.md#protecting-documents-with-policies)

### Determine the encryption type using the Java API {#determine-the-encryption-type-using-the-java-api}

Determine the type of encryption that is protecting a PDF document by using the Encryption API (Java):

1. Include project files.

   Include client JAR files, such as adobe-encryption-client.jar, in your Java project’s class path.

1. Create a service client.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create an `EncryptionServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Get the encrypted PDF document.

    * Create a `java.io.FileInputStream` object that represents the PDF document by using its constructor and passing a string value that specifies the location of the PDF document.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Determine the encryption type.

    * Determine the encryption type by invoking the `EncryptionServiceClient` object’s `getPDFEncryption` method and passing the `com.adobe.idp.Document` object that contains the PDF document. This method returns an `EncryptionTypeResult` object.
    * Invoke the `EncryptionTypeResult` object’s `getEncryptionType` method. This method returns an `EncryptionType` enum value that specifies the encryption type. For example, if the PDF document is protected with password-based encryption, this method returns `EncryptionType.PASSWORD`.

**See also**

[Summary of steps](encrypting-decrypting-pdf-documents.md#summary-of-steps)

[Quick Start (SOAP mode): Determining encryption type using the Java API](/help/forms/developing/encryption-service-java-api-quick.md#quick-start-soap-mode-determining-encryption-type-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Determine the encryption type using the web service API {#determine-the-encryption-type-using-the-web-service-api}

Determine the type of encryption that is protecting a PDF document by using the Encryption API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/EncryptionService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a service client.

    * Create an `EncryptionServiceClient` object by using its default constructor.
    * Create an `EncryptionServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/EncryptionService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `EncryptionServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object’s `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `EncryptionServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `EncryptionServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.
        * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Get the encrypted PDF document.

    * Create a `BLOB` object by using its constructor.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the encrypted PDF document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object’s `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object’s `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning the contents of the byte array to the `BLOB` object’s `MTOM` data member.

1. Determine the encryption type.

    * Invoke the `EncryptionServiceClient` object’s `getPDFEncryption` method and pass the `BLOB` object that contains the PDF document. This method returns an `EncryptionTypeResult` object.
    * Get the value of the `EncryptionTypeResult` object’s `encryptionType` data method. For example, if the PDF document is protected with password-based encryption, the value of this data member is `EncryptionType.PASSWORD`.

**See also**

[Summary of steps](encrypting-decrypting-pdf-documents.md#summary-of-steps)

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

---
title: Assembling Encrypted PDF Documents

description: Assemble encrypted PDF documents using the Java API and Web Service API.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/assembling_pdf_documents
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations

role: Developer
exl-id: 2caaca74-640a-4257-a81b-3e8b295cd182
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,  Document Services
---
# Assembling Encrypted PDF Documents {#assembling-encrypted-pdf-documents} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

You can encrypt a PDF document with a password by using the Assembler service. After a PDF document is encrypted with a password, a user must specify the password to view the PDF document in Adobe Reader or Acrobat. To encrypt a PDF document with a password, the DDX document must contain encryption element values that are required to encrypt a PDF document.

For the purpose of this discussion, assume that the following DDX document is used.

```xml
 <?xml version="1.0" encoding="UTF-8"?>
 <DDX xmlns="https://ns.adobe.com/DDX/1.0/">
        <PDF result="EncryptLoan.pdf" encryption="userProtect">
         <PDF source="inDoc" />
     </PDF>
     <PasswordEncryptionProfile name="userProtect" compatibilityLevel="Acrobat7">
         <OpenPassword>AdobeOpen</OpenPassword>
        </PasswordEncryptionProfile>
 </DDX>
```

Within this DDX document, notice that the source attribute is assigned the value `inDoc`. In situations where only one input PDF document is passed to the Assembler service and one PDF document is returned, and you invoke the `invokeOneDocument` operation, assign the value `inDoc` to the PDF source attribute. When invoking the `invokeOneDocument` operation, the `inDoc` value is a predefined key that must be specified in the DDX document.

In contrast, when passing two or more input PDF documents to the Assembler service, you can invoke the `invokeDDX` operation. In this situation, assign the file name of the input PDF document to the `source` attribute.

The Encryption service does not have to be part of your AEM forms installation to encrypt a PDF document with a password. See [Encrypting and Decrypting PDF Documents](/help/forms/developing/encrypting-decrypting-pdf-documents.md).

>[!NOTE]
>
>For more information about the Assembler service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

>[!NOTE]
>
>For more information about a DDX document, see [Assembler Service and DDX Reference](https://www.adobe.com/go/learn_aemforms_ddx_63).

## Summary of steps {#summary-of-steps}

To assemble an encrypted PDF document, perform the following steps:

1. Include project files.
1. Create a PDF Assembler client.
1. Reference an existing DDX document.
1. Reference an unsecured PDF document.
1. Set run-time options.
1. Encrypt the document.
1. Save the encrypted PDF document.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, include the necessary JAR files. If you are using web services, ensure that you include the proxy files.

The following JAR files must be added to your project's class path:

* adobe-livecycle-client.jar
* adobe-usermanager-client.jar
* adobe-assembler-client.jar
* adobe-utilities.jar (required if AEM Forms is deployed on JBoss)
* jbossall-client.jar (required if AEM Forms is deployed on JBoss)

if AEM Forms is deployed on a supported J2EE application server other than JBoss, you must replace the adobe-utilities.jar and jbossall-client.jar files with JAR files that are specific to the J2EE application server that AEM Forms is deployed on. For information about the location of all AEM Forms JAR files, see [Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files).

**Create an Assembler client**

Before you can programmatically perform an Assembler operation, you must create an Assembler service client.

**Reference an existing DDX document**

A DDX document must be referenced to assemble a PDF document. For example, consider the DDX document that was introduced in this section. To encrypt a PDF document, the DDX document must contain the `PasswordEncryptionProfile` element.

**Reference an unsecured PDF document**

An unsecured PDF document must be referenced and passed to the Assembler service to encrypt it. If you reference a PDF document that is already encrypted, an exception is thrown.

**Set run-time options**

You can set run-time options that control the behaviour of the Assembler service while it performs a job. For example, you can set an option that instructs the Assembler service to continue processing a job if an error is encountered. For information about the run-time options that you can set, see the `AssemblerOptionSpec` class reference in [AEM Forms API Reference](https://www.adobe.com/go/learn_aemforms_javadocs_63_en).

**Encrypt the document**

After you create the Assembler service client, reference the DDX document that contains encryption information, reference an unsecured PDF document, and set run-time options, you can invoke the `invokeOneDocument` operation. Because only one input PDF document is being passed to the Assembler service (and one document is being returned), you can use the `invokeOneDocument` operation instead of the `invokeDDX` operation.

**Save the encrypted PDF document**

If only a single PDF document is being passed to the Assembler service, the Assembler service returns a single document instead of a collection object. That is, when invoking the `invokeOneDocument` operation, a single document is returned. Because the DDX document referenced in this section contains encryption information, the Assembler service returns a PDF document that is encrypted with a password.

**See also**

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Programmatically Assembling PDF Documents](/help/forms/developing/programmatically-assembling-pdf-documents.md)

## Assemble an encrypted PDF document using the Java API {#assemble-an-encrypted-pdf-document-using-the-java-api}

1. Include project files.

   Include client JAR files, such as adobe-assembler-client.jar, in your Java project's class path.

1. Create an Assembler client.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create an `AssemblerServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Reference an existing DDX document.

    * Create a `java.io.FileInputStream` object that represents the DDX document by using its constructor and passing a string value that specifies the location of the DDX file.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Reference an unsecured PDF document.

    * Create a `java.io.FileInputStream` object by using its constructor and passing the location of an unsecured PDF document.
    * Create a `com.adobe.idp.Document` object and pass the `java.io.FileInputStream` object that contains the PDF document. This `com.adobe.idp.Document` object is passed to the `invokeOneDocument` method.

1. Set run-time options.

    * Create an `AssemblerOptionSpec` object that stores run-time options by using its constructor.
    * Set run-time options to meet your business requirements by invoking a method that belongs to the `AssemblerOptionSpec` object. For example, to instruct the Assembler service to continue processing a job when an error occurs, invoke the `AssemblerOptionSpec` object's `setFailOnError` method and pass `false`.

1. Encrypt the document.

   Invoke the `AssemblerServiceClient` object's `invokeOneDocument` method and pass the following values:

    * A `com.adobe.idp.Document` object that represents the DDX document. Ensure that this DDX document contains the value `inDoc` for the PDF source element.
    * A `com.adobe.idp.Document` object that contains the unsecured PDF document.
    * A `com.adobe.livecycle.assembler.client.AssemblerOptionSpec` object that specifies the run-time options, including default font and job log level.

   The `invokeOneDocument` method returns a `com.adobe.idp.Document` object that contains a password-encrypted PDF document.

1. Save the encrypted PDF document.

    * Create a `java.io.File` object and ensure that the file name extension is .pdf.
    * Invoke the `Document` object's `copyToFile` method to copy the contents of the `Document` object to the file. Ensure that you use the `Document` object that the `invokeOneDocument` method returned.

**See also**

[Quick Start (SOAP mode): Assembling an encrypted PDF document using the Java API](/help/forms/developing/assembler-service-java-api-quick.md#quick-start-soap-mode-assembling-an-encrypted-pdf-document-using-the-java-api)

## Assemble an encrypted PDF document using the web service API {#assemble-an-encrypted-pdf-document-using-the-web-service-api}

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition when setting a service reference: `http://localhost:8080/soap/services/AssemblerService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create an Assembler client.

    * Create an `AssemblerServiceClient` object by using its default constructor.
    * Create an `AssemblerServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/AssemblerService?blob=mtom`). You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `AssemblerServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object's `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `AssemblerServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `AssemblerServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.
        * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Reference an existing DDX document.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store the DDX document.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the DDX document and the mode to open the file in.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object's `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` field with the contents of the byte array.

1. Reference an unsecured PDF document.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store the input PDF document. This `BLOB` object is passed to the `invokeOneDocument` as an argument.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the input PDF document and the mode to open the file in.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object's `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` field with the contents of the byte array.

1. Set run-time options.

    * Create an `AssemblerOptionSpec` object that stores run-time options by using its constructor.
    * Set run-time options to meet your business requirements by assigning a value to a data member that belongs to the `AssemblerOptionSpec` object. For example, to instruct the Assembler service to continue processing a job when an error occurs, assign `false` to the `AssemblerOptionSpec` object's `failOnError` data member.

1. Encrypt the document.

   Invoke the `AssemblerServiceClient` object's `invokeOneDocument` method and pass the following values:

    * A `BLOB` object that represents the DDX document
    * A `BLOB` object that represents the unsecured PDF document
    * An `AssemblerOptionSpec` object that specifies run-time options

   The `invokeOneDocument` method returns a `BLOB` object that contains an encrypted PDF document.

1. Save the encrypted PDF document.

    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the encrypted PDF document and the mode to open the file in.
    * Create a byte array that stores the content of the `BLOB` object that the `invokeOneDocument` method returned. Populate the byte array by getting the value of the `BLOB` object's `MTOM` data member.
    * Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.
    * Write the contents of the byte array to a PDF file by invoking the `System.IO.BinaryWriter` object's `Write` method and passing the byte array.

**See also**

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

---
title: Validating DDX Documents

description: Validate a DDX document programmatically using the Java API and the Web Service API.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/assembling_pdf_documents
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations

role: Developer
exl-id: 1f5a2cf3-ef6b-45b4-8fa8-b300e492fee1
solution: Experience Manager, Experience Manager Forms

feature: "Adaptive Forms,Document Services,APIs & Integrations"
---
# Validating DDX Documents {#validating-ddx-documents} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

You can programmatically validate a DDX document that is used by the Assembler service. That is, using the Assembler service API, you can determine whether or not a DDX document is valid. For example, if you upgraded from a previous AEM Forms version and you want to ensure that your DDX document is valid, you can validate it using the Assembler service API.

>[!NOTE]
>
>For more information about the Assembler service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

>[!NOTE]
>
>For more information about a DDX document, see [Assembler Service and DDX Reference](https://www.adobe.com/go/learn_aemforms_ddx_63).

## Summary of steps {#summary-of-steps}

To validate a DDX document, perform the following tasks:

1. Include project files.
1. Create an Assembler client.
1. Reference an existing DDX document.
1. Set run-time options to validate the DDX document.
1. Perform the validation.
1. Save the validation results in a log file.

**Include project files**

Include the necessary files in your development project. If you are creating a client application by using Java, include the necessary JAR files. If you are using web services, ensure that you include the proxy files.

The following JAR files must be added to your project’s class path:

* adobe-livecycle-client.jar
* adobe-usermanager-client.jar
* adobe-assembler-client.jar
* adobe-utilities.jar (required if AEM Forms is deployed on JBoss)
* jbossall-client.jar (required if AEM Forms is deployed on JBoss)

if AEM Forms is deployed on a supported J2EE application server other than JBoss, you must replace the adobe-utilities.jar and jbossall-client.jar files with JAR files that are specific to the J2EE application server that AEM Forms is deployed on.

**Create a PDF Assembler client**

Before you can programmatically perform an Assembler operation, you must create an Assembler service client.

**Reference an existing DDX document**

To validate a DDX document, you must reference an existing DDX document.

**Set run-time options to validate the DDX document**

When validating a DDX document, you must set specific run-time options that instruct the Assembler service to validate the DDX document as opposed to executing it. Also, you can increase the amount of information that the Assembler service writes to the log file.

**Perform the validation**

After you create the Assembler service client, reference the DDX document, and set run-time options, you can invoke the `invokeDDX` operation to validate the DDX document. When validating the DDX document, you can pass `null` as the map parameter (this parameter usually stores PDF documents that the Assembler requires to perform the operation(s) specified in the DDX document).

If validation fails, an exception is thrown and the log file contains details that explains why the DDX document is invalid can be obtained from the `OperationException` instance. Once past the basic XML parsing and schema checking, then the validation against the DDX specification is performed. All errors that are in the DDX document are specified in the log.

**Save the validation results in a log file**

The Assembler service returns the validation results that you can write to an XML log file. The amount of detail that the Assembler service writes to the log file depends on the run-time option that you set.

**See also**

[Validate a DDX document using the Java API](#validate-a-ddx-document-using-the-java-api)

[Validate a DDX document using the web service API](#validate-a-ddx-document-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Programmatically Assembling PDF Documents](/help/forms/developing/programmatically-assembling-pdf-documents.md)

## Validate a DDX document using the Java API {#validate-a-ddx-document-using-the-java-api}

Validate a DDX document by using the Assembler Service API (Java):

1. Include project files.

   Include client JAR files, such as adobe-assembler-client.jar, in your Java project’s class path.

1. Create a PDF Assembler client.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create an `AssemblerServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Reference an existing DDX document.

    * Create a `java.io.FileInputStream` object that represents the DDX document by using its constructor and passing a string value that specifies the location of the DDX file.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Set run-time options to validate the DDX document.

    * Create an `AssemblerOptionSpec` object that stores run-time options by using its constructor.
    * Set the run-time option that instructs the Assembler service to validate the DDX document by invoking the `AssemblerOptionSpec` object’s setValidateOnly method and passing `true`.
    * Set the amount of information that the Assembler service writes to the log file by invoking the `AssemblerOptionSpec` object’s `getLogLevel` method and passing a string value meets your requirements. When validating a DDX document, you want more information written to the log file that will assist in the validation process. As a result, you can pass the value `FINE` or `FINER`.

1. Perform the validation.

   Invoke the `AssemblerServiceClient` object’s `invokeDDX` method and pass the following values:

    * A `com.adobe.idp.Document` object that represents the DDX document.
    * The value `null` for the java.io.Map object that usually stores PDF documents.
    * A `com.adobe.livecycle.assembler.client.AssemblerOptionSpec` object that specifies the run-time options.

   The `invokeDDX` method returns an `AssemblerResult` object that contains information that specifies whether the DDX document is valid.

1. Save the validation results in a log file.

    * Create a `java.io.File` object and ensure that the file name extension is .xml.
    * Invoke the `AssemblerResult` object’s `getJobLog` method. This method returns a `com.adobe.idp.Document` instance that contains validation information.
    * Invoke the `com.adobe.idp.Document` object’s `copyToFile` method to copy the contents of the `com.adobe.idp.Document` object to the file.

   >[!NOTE]
   >
   >If the DDX document is invalid, an `OperationException` is thrown. Within the catch statement, you can invoke the `OperationException` object's `getJobLog` method.

**See also**

[Validating DDX Documents](#validating-ddx-documents)

[Quick Start (SOAP mode): Validating DDX documents using the Java API](/help/forms/developing/assembler-service-java-api-quick.md#quick-start-soap-mode-validating-ddx-documents-using-the-java-api) (SOAP mode)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

## Validate a DDX document using the web service API {#validate-a-ddx-document-using-the-web-service-api}

Validate a DDX document by using the Assembler Service API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/AssemblerService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace localhost with the IP address of the Forms Server.

1. Create a PDF Assembler client.

    * Create an `AssemblerServiceClient` object by using its default constructor.
    * Create an `AssemblerServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/AssemblerService?blob=mtom`). You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `AssemblerServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object’s `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `AssemblerServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `AssemblerServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.
        * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Reference an existing DDX document.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store the DDX document.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the DDX document and the mode to open the file in.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object’s `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object’s `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` property with the contents of the byte array.

1. Set run-time options to validate the DDX document.

    * Create an `AssemblerOptionSpec` object that stores run-time options by using its constructor.
    * Set the run-time option that instructs the Assembler service to validate the DDX document by assigning the value true to the `AssemblerOptionSpec` object’s `validateOnly` data member.
    * Set the amount of information that the Assembler service writes to the log file by assigning a string value to the `AssemblerOptionSpec` object’s `logLevel` data member. method When validating a DDX document, you want more information written to the log file that will assist in the validation process. As a result, you can specify the value `FINE` or `FINER`. For information about the run-time options that you can set, see the `AssemblerOptionSpec` class reference in [AEM Forms API Reference](https://www.adobe.com/go/learn_aemforms_javadocs_63_en).

1. Perform the validation.

   Invoke the `AssemblerServiceClient` object’s `invokeDDX` method and pass the following values:

    * A `BLOB` object that represents the DDX document.
    * The value `null` for the `Map` object that usually stores PDF documents.
    * An `AssemblerOptionSpec` object that specifies run-time options.

   The `invokeDDX` method returns an `AssemblerResult` object that contains information that specifies whether the DDX document is valid.

1. Save the validation results in a log file.

    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the log file and the mode to open the file in. Ensure that the file name extension is .xml.
    * Create a `BLOB` object that stores log information by getting the value of the `AssemblerResult` object’s `jobLog` data member.
    * Create a byte array that stores the content of the `BLOB` object. Populate the byte array by getting the value of the `BLOB` object’s `MTOM` field.
    * Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.
    * Write the contents of the byte array to a PDF file by invoking the `System.IO.BinaryWriter` object’s `Write` method and passing the byte array.

   >[!NOTE]
   >
   >If the DDX document is invalid, an `OperationException` is thrown. Within the catch statement, you can get the value of the `OperationException` object's `jobLog` member.

**See also**

[Validating DDX Documents](#validating-ddx-documents)

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

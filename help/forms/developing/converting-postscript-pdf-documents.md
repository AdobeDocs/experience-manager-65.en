---
title: Converting Postscript to PDF Documents

description: Use the Distiller service to convert PostScript®, Encapsulated PostScript (EPS), and PRN files to compact, reliable, and more secure PDF files over a network. The Distiller service converts large volumes of print documents to electronic documents, such as invoices and statements using the Java API and Web Service API.


contentOwner: admin
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations

role: Developer
exl-id: 744df8b2-0c61-410f-89e9-20b8adddbf45
solution: Experience Manager, Experience Manager Forms

feature: "Adaptive Forms,Document Services,APIs & Integrations"
---
# Converting Postscript to PDF Documents {#converting-postscript-to-pdf-documents} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

## About the Distiller Service {#about-the-distiller-service}

The Distiller® service converts PostScript®, Encapsulated PostScript (EPS), and PRN files to compact, reliable, and more secure PDF files over a network. The Distiller service is frequently used to convert large volumes of print documents to electronic documents, such as invoices and statements. Converting documents to PDF also allows enterprises to send their customers a paper version and an electronic version of a document.

>[!NOTE]
>
>For more information about the Distiller service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

## Converting PostScript to PDF documents {#converting-postscript-to-pdf-documents-inner}

This topic describes how you can use the Distiller Service API (Java and web service) to programmatically convert PostScript (PS), Encapsulated PostScript (EPS), and PRN files to PDF documents.

>[!NOTE]
>
>For more information about the Distiller service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

>[!NOTE]
>
>To convert PostScript files to PDF documents, one of the following needs to be installed on the server hosting AEM Forms: Acrobat 9 or Microsoft Visual C++ 2005 redistributable package.

### Summary of steps {#summary-of-steps}

To convert any of the supported types to a PDF document, perform the following steps:

1. Include project files.
1. Create a Distiller service client.
1. Retrieve the file to convert.
1. Invoke the PDF creation operation.
1. Save the PDF document.

**Include project files**

Include the necessary files in your development project. If you are creating a client application by using Java, include the necessary JAR files. If you are using web services, make sure you include the proxy files.

**Create a Distiller service client**

Before you can programmatically perform a Distiller service operation, you must create a Distiller service client. If you are using the Java API, create a `DistillerServiceClient` object. If you are using the web service API, create a `DistillerServiceService` object.

**Retrieve the file to convert**

Retrieve the file that you want to convert. For example, to convert a PS file to a PDF document, you must retrieve the PS file.

**Invoke the PDF creation operation**

After you create the service client, you can then invoke the PDF creation operation. This operation will need information about the document to be converted, including the path to the target document.

**Save the PDF document**

You can save the PDF document as a PDF file.

**See also**

[Convert a PostScript file to PDF using the Java API](converting-postscript-pdf-documents.md#convert-a-postscript-file-to-pdf-using-the-java-api)

[Converting a PostScript file to PDF using the web service API](converting-postscript-pdf-documents.md#converting-a-postscript-file-to-pdf-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Output Service API Quick Starts](/help/forms/developing/output-service-java-api-quick.md#output-service-java-api-quick-start-soap)

### Convert a PostScript file to PDF using the Java API {#convert-a-postscript-file-to-pdf-using-the-java-api}

Convert a PostScript file to PDF document by using the Distiller Service API (Java):

1. Include project files.

   Include client JAR files, such as adobe-distiller-client.jar, in your Java project’s class path.

1. Create a Distiller service client.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create an `DistillerServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Retrieve the file to convert.

    * Create a `java.io.FileInputStream` object that represents the file to convert by using its constructor and passing a string value that specifies the location of the file.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Invoke the PDF creation operation.

   Invoke the `DistillerServiceClient` object’s `createPDF` method and pass the following values:

    * The `com.adobe.idp.Document` object that represents the PS, EPS, or PRN file to be converted
    * A `java.lang.String` object that contains the name of the file to be converted
    * A `java.lang.String` object that contains the name of the Adobe PDF settings to be used
    * A `java.lang.String` object that contains the name of the security settings to be used
    * An optional `com.adobe.idp.Document` object that contains settings to be applied while generating the PDF document
    * An optional `com.adobe.idp.Document` object that contains metadata information to be applied to the PDF document

   The `createPDF` method returns a `CreatePDFResult` object that contains the new PDF document and a log file that may be generated. The log file typically contains error or warning messages that are generated by the conversion request.

1. Save the PDF document.

   To obtain the newly created PDF document, perform the following actions:

    * Invoke the `CreatePDFResult` object’s `getCreatedDocument` method. This returns a `com.adobe.idp.Document` object.
    * Invoke the `com.adobe.idp.Document` object’s `copyToFile` method to extract the PDF document.

   Similarly, to obtain the log document, perform the following actions.

    * Invoke the `CreatePDFResult` object’s `getLogDocument` method. This returns a `com.adobe.idp.Document` object.
    * Invoke the `com.adobe.idp.Document` object’s `copyToFile` method to extract the log document.

**See also**

[Summary of steps](converting-postscript-pdf-documents.md#summary-of-steps)

[Quick Start (SOAP mode): Converting a PostScript file to a PDF document using the Java API](/help/forms/developing/distiller-service-java-api-quick.md#quick-start-soap-mode-converting-a-postscript-file-to-a-pdf-document-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Converting a PostScript file to PDF using the web service API {#converting-a-postscript-file-to-pdf-using-the-web-service-api}

Convert a PostScript file to PDF document by using the Distiller Service API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/DistillerService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a Distiller service client.

    * Create a `DistillerServiceClient` object by using its default constructor.
    * Create a `DistillerServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/DistillerService?blob=mtom`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference. However, specify `?blob=mtom` to use MTOM.
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `DistillerServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object’s `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `DistillerServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `DistillerServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.
        * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Retrieve the file to convert.

    * Create a `BLOB` object by using its constructor. This `BLOB` object is used to store the file to convert to a PDF document.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location and the mode to open the file in.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object’s `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object’s `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` property with the contents of the byte array.

1. Invoke the PDF creation operation.

   Invoke the `DistillerServiceService` object’s `CreatePDF2` method and pass the following required values:

    * The `BLOB` object that represents the PS file to convert
    * A string that contains the path name of the file to be convert
    * A string object that contains the Adobe PDF settings to be used (for example, `Standard`)
    * A string object that contains the security settings to be used (for example, `No Securit`y)
    * An optional `BLOB` object that contains settings to be applied while generating the PDF document
    * An optional `BLOB` object that contains metadata information to be applied to the PDF document
    * A `BLOB` output parameter used to store the PDF document
    * A `BLOB` output parameter used to store the log

1. Save the PDF document.

    * Create a `System.IO.FileStream` object by invoking its constructor. Pass a string value that represents the file location of the signed PDF document and the mode in which to open the file.
    * Create a byte array that stores the content of the `BLOB` object that was returned by the `CreatePDF2` method (the output parameter). Populate the byte array by getting the value of the `BLOB` object’s `MTOM` data member.
    * Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.
    * Write the contents of the byte array to a PDF file by invoking the `System.IO.BinaryWriter` object’s `Write` method and passing the byte array.

**See also**

[Summary of steps](converting-postscript-pdf-documents.md#summary-of-steps)

<!-- UNRESOLVED LINKS
[Quick Start (MTOM): Converting a PostScript file to a PDF document using the web service API](unresolvedlink-lc-qs-distiller-di.xml#ws624e3cba99b79e12e69a9941333732bac8-7f01.2)

[Quick Start (SwaRef): Converting a PostScript file to a PDF document using the web service API](unresolvedlink-lc-qs-distiller-di.xml#ws624e3cba99b79e12e69a9941333732bac8-7eff.2)
-->

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

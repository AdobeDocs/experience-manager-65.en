---
title: Working with PDF/A Documents

description: Use the  DocConverter service to determine if a PDF document is a PDF/A document and convert PDF documents to PDF/A documents.


contentOwner: admin
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations

role: Developer
exl-id: 966c3554-25df-4467-866e-11c43cc15b58
solution: Experience Manager, Experience Manager Forms

feature: Adaptive Forms,Document Services,APIs & Integrations
---
# Working with PDF/A Documents {#working-with-pdf-a-documents}

**About the DocConverter Service**

The DocConverter service can convert PDF documents to PDA/A documents. You can accomplish these tasks using this service:

* Convert PDF documents to PDF/A documents. (See [Converting Documents to PDF/A Documents](pdf-a-documents.md#converting-documents-to-pdf-a-documents).)
* Determine if PDF documents are PDF/A documents. (See [Programmatically Determining PDF/A Compliancy](pdf-a-documents.md#programmatically-determining-pdf-a-compliancy).)

>[!NOTE]
>
>For more information about the DocConverter service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

## Converting Documents to PDF/A Documents {#converting-documents-to-pdf-a-documents}

You can use the DocConverter service to convert a PDF document to a PDF/A document. Because PDF/A is an archival format for long-term preservation of the document’s content, all fonts are embedded and the file is uncompressed. As a result, a PDF/A document is typically larger than a standard PDF document. Also, a PDF/A document does not contain audio and video content. Before you convert a PDF document to a PDF/A document, ensure that the PDF document is not a PDF/A document.

The PDF/A-1 specification consists of two levels of conformance, namely A and B. The major difference between the two is regarding the logical structure (accessibility) support, which is not required for conformance level B. Regardless of the conformance level, PDF/A-1 dictates that all fonts are embedded within the generated PDF/A document. At this time, only PDF/A-1b is supported in validation (and conversion).

While PDF/A is the standard for archiving PDF documents, it is not mandatory that PDF/A be used for archiving if a standard PDF document meets your company’s requirements. The purpose of the PDF/A standard is to establish a PDF file meant for long-term archiving and document-preservation needs.

>[!NOTE]
>
>For more information about the DocConverter service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary-of-steps}

To convert a PDF document to a PDF/A document, perform the following steps:

1. Include project files.
1. Create a DocConvert client
1. Reference a PDF document to convert to a PDF/A document.
1. Set tracking information.
1. Convert the document.
1. Save the PDF/A document.

**Include project files**

Include the necessary files in your development project. If you are creating a client application by using Java, include the necessary JAR files. If you are using web services, make sure that you include the proxy files.

The following JAR files must be added to your project’s class path:

* adobe-livecycle-client.jar
* adobe-usermanager-client.jar
* adobe-docconverter-client.jar
* adobe-utilities.jar (required if AEM Forms is deployed on JBoss Application Server)
* jbossall-client.jar (required if AEM Forms is deployed on JBoss Application Server)

For information about the location of these JAR files, see [Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files).

**Create a DocConvert client**

Before you can programmatically perform an DocConverter operation, you must create a DocConverter client. If you are using the Java API, create a `DocConverterServiceClient` object. If you are using the DocConverter web service API, create a `DocConverterServiceService` object.

**Reference a PDF document to convert to a PDF/A document**

Retrieve a PDF document to convert to a PDF/A document. If you attempt to convert a PDF document, such as an Acrobat form, to a PDF/A document, you will cause an exception.

**Set tracking information**

You can set a run-time option that determines how much information is tracked during the conversion process. That is, you can set nine different levels that specify how much information the DocConverter service tracks when it converts a PDF document to a PDF/A document.

**Convert the document**

After you create the DocConverter service client, reference the PDF document to convert and set the run-time option that specifies how much information is tracked, you can convert the PDF document to a PDF/A document.

**Save the PDF/A document**

You can save the PDF/A document as a PDF file.

**See also**

[Convert documents to PDF/A documents using the Java API](pdf-a-documents.md#convert-documents-to-pdf-a-documents-using-the-java-api)

[Convert documents to PDF/A documents using the web service API](pdf-a-documents.md#convert-documents-to-pdf-a-documents-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Programmatically Determining PDF/A Compliancy](pdf-a-documents.md#programmatically-determining-pdf-a-compliancy)

### Convert documents to PDF/A documents using the Java API {#convert-documents-to-pdf-a-documents-using-the-java-api}

Convert a PDF document to a PDF/A document by using the Java API:

1. Include project files

   Include client JAR files, such as adobe-docconverter-client.jar, in your Java project’s class path.

1. Create a DocConvert client

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create a `DocConverterServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Reference a PDF document to convert to a PDF/A document

    * Create a `java.io.FileInputStream` object that represents the PDF document to convert by using its constructor and passing a string value that specifies the location of the PDF file.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Set tracking information

    * Create a `PDFAConversionOptionSpec` object by using its constructor.
    * Set the information tracking level by invoking the `PDFAConversionOptionSpec` object’s `setLogLevel` method and passing a string value that specifies the tracking level. For example, pass the value `FINE`. For information about the different values, see the `setLogLevel` method in the [AEM Forms API Reference](https://www.adobe.com/go/learn_aemforms_javadocs_63_en).

1. Convert the document

   Convert the PDF document to a PDF/A document by invoking the `DocConverterServiceClient` object’s `toPDFA` method and passing the following values:

    * The `com.adobe.idp.Document` object that contains the PDF document to convert
    * The `PDFAConversionOptionSpec` object that specifies tracking information

   The `toPDFA` method returns a `PDFAConversionResult` object that contains the PDF/A document.

1. Save the PDF/A document

    * Retrieve the PDF/A document by invoking the `PDFAConversionResult` object’s `getPDFA` method. This method returns a `com.adobe.idp.Document` object that represents the PDF/A document.
    * Create a `java.io.File` object that represents the PDF/A file. Ensure that the file name extension is .pdf.
    * Populate the file with PDF/A data by invoking the `com.adobe.idp.Document` object’s `copyToFile` method and passing the `java.io.File` object.

**See also**

[Working with PDF/A Documents](pdf-a-documents.md#working-with-pdf-a-documents)

[Quick Start (SOAP mode): Converting a document to a PDF/A document using the Java API](/help/forms/developing/docconverter-service-java-api-quick.md#quick-start-soap-mode-converting-a-document-to-a-pdf-a-document-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Convert documents to PDF/A documents using the web service API {#convert-documents-to-pdf-a-documents-using-the-web-service-api}

Convert a PDF document to a PDF/A document by using the DocConverter API (web service):

1. Include project files

    * Create a Microsoft .NET client assembly that consumes the DocConverter WSDL.
    * Reference the Microsoft .NET client assembly.

1. Create a DocConvert client

    * Using the Microsoft .NET client assembly, create a `DocConverterServiceService` object by invoking its default constructor.
    * Set the `DocConverterServiceService` object’s `Credentials` data member with a `System.Net.NetworkCredential` value that specifies the user name and password value.

1. Reference a PDF document to convert to a PDF/A document

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store the PDF document that is converted to a PDF/A document.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the PDF document and the mode to open the file in.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object’s `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object’s `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `binaryData` property with the contents of the byte array.

1. Set tracking information

    * Create a `PDFAConversionOptionSpec` object by using its constructor.
    * Set the information tracking level by assigning a value that specifies the tracking level to the `PDFAConversionOptionSpec` object’s `logLevel` data member. For example, assign the value `FINE` to this data member.

1. Convert the document

   Convert the PDF document to a PDF/A document by invoking the `DocConverterServiceService` object’s `toPDFA` method and passing the following values:

    * The `BLOB` object that contains the PDF document to convert
    * The `PDFAConversionOptionSpec` object that specifies tracking information

   The `toPDFA` method returns a `PDFAConversionResult` object that contains the PDF/A document.

1. Save the PDF/A document

    * Create a `BLOB` object that stores the PDF/A document by getting the value of the `PDFAConversionResult` object’s `PDFADocument` data member.
    * Create a byte array that stores the content of the `BLOB` object that was returned by using the `PDFAConversionResult` object. Populate the byte array by getting the value of the `BLOB` object’s `binaryData` data member.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the PDF/A document.
    * Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.
    * Write the contents of the byte array to a PDF file by invoking the `System.IO.BinaryWriter` object’s `Write` method and passing the byte array.

**See also**

[Working with PDF/A Documents](pdf-a-documents.md#working-with-pdf-a-documents)

[Invoking AEM Forms using Base64 encoding](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-base64-encoding)

[Creating a .NET client assembly that uses Base64 encoding](/help/forms/developing/invoking-aem-forms-using-web.md#creating-a-net-client-assembly-that-uses-base64-encoding)

## Programmatically Determining PDF/A Compliancy {#programmatically-determining-pdf-a-compliancy}

You can use the DocConverter service to determine whether a PDF document is PDF/A-compliant. For information about a PDF/A document and how to convert a PDF document to a PDF/A document, see [Converting Documents to PDF/A Documents](pdf-a-documents.md#converting-documents-to-pdf-a-documents).

>[!NOTE]
>
>For more information about the DocConverter service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-1}

To determine PDF/A compliancy, perform the following steps:

1. Include project files.
1. Create a DocConvert client
1. Reference a PDF document used to determine PDF/A compliancy.
1. Set run-time options.
1. Retrieve information about the PDF document.

**Include project files**

Include the necessary files in your development project. If you are creating a client application by using Java, include the necessary JAR files. If you are using web services, make sure that you include the proxy files.

The following JAR files must be added to your project’s class path:

* adobe-livecycle-client.jar
* adobe-usermanager-client.jar
* adobe-docconverter-client.jar
* adobe-utilities.jar (required if AEM Forms is deployed on JBoss Application Server)
* jbossall-client.jar (required if AEM Forms is deployed on JBoss Application Server)

For information about the location of these JAR files, see [Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files).

**Create a DocConvert client**

Before you can programmatically perform an DocConverter operation, you must create a DocConverter client. If you are using the Java API, create a `DocConverterServiceClient` object. If you are using the DocConverter web service API, create a `DocConverterServiceService` object.

**Reference a PDF document used to determine PDF/A compliancy**

A PDF document must be referenced and passed to the DocConverter service to determine whether the PDF document is PDF/A-compliant.

**Set run-time options**

You can set a run-time option that determines how much information is tracked during the conversion process. That is, you can set nine different level that specify how much information the DocConverter service tracks when it converts a PDF document to a PDF/A document.

**Retrieve information about the PDF document**

After you create the DocConverter service client, reference the PDF document, and set the run-time options, you can determine whether the PDF document is a PDF/A-compliant document.

**See also**

[Determine PDF/A compliancy using the Java API](pdf-a-documents.md#determine-pdf-a-compliancy-using-the-java-api)

[Determine PDF/A compliancy using the web service API](pdf-a-documents.md#determine-pdf-a-compliancy-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Determine PDF/A compliancy using the Java API {#determine-pdf-a-compliancy-using-the-java-api}

Determine PDF/A compliancy by using the Java API:

1. Include project files

   Include client JAR files, such as adobe-docconverter-client.jar, in your Java project’s class path.

1. Create a DocConvert client

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create a `DocConverterServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Reference a PDF document used to determine PDF/A compliancy

    * Create a `java.io.FileInputStream` object that represents the PDF document to convert by using its constructor and passing a string value that specifies the location of the PDF file.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Set run-time options

    * Create a `PDFAValidationOptionSpec` object by using its constructor.
    * Set the compliance level by invoking the `PDFAValidationOptionSpec` object’s `setCompliance` method and passing `PDFAValidationOptionSpec.Compliance.PDFA_1B`.
    * Set the information tracking level by invoking the `PDFAValidationOptionSpec` object’s `setLogLevel` method and passing a string value that specifies the tracking level. For example, pass the value `FINE`. For information about the different values, see the `setLogLevel` method in the [AEM Forms API Reference](https://www.adobe.com/go/learn_aemforms_javadocs_63_en).

1. Retrieve information about the PDF document

   Determine PDF/A compliancy by invoking the `DocConverterServiceClient` object’s `isPDFA` method and passing the following values:

    * The `com.adobe.idp.Document` object that contains the PDF document.
    * The `PDFAValidationOptionSpec` object that specifies run-time options.

   The `isPDFA` method returns a `PDFAValidationResult` object that contains the results of this operation.

**See also**

[Working with PDF/A Documents](pdf-a-documents.md#working-with-pdf-a-documents)

[Quick Start (SOAP mode): Determining PDF/A compliancy using the Java API](/help/forms/developing/docconverter-service-java-api-quick.md#quick-start-soap-mode-determining-pdf-a-compliancy-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Determine PDF/A compliancy using the web service API {#determine-pdf-a-compliancy-using-the-web-service-api}

Determine PDF/A compliancy by using the web service API:

1. Include project files

    * Create a Microsoft .NET client assembly that consumes the DocConverter WSDL.
    * Reference the Microsoft .NET client assembly.

1. Create a DocConvert client

    * Using the Microsoft .NET client assembly, create a `DocConverterServiceService` object by invoking its default constructor.
    * Set the `DocConverterServiceService` object’s `Credentials` data member with a `System.Net.NetworkCredential` value that specifies the user name and password value.

1. Reference a PDF document used to determine PDF/A compliancy

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store the PDF document that is converted to a PDF/A document.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the PDF document and the mode to open the file in.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object’s `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object’s `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `binaryData` property with the contents of the byte array.

1. Set run-time options

    * Create a `PDFAValidationOptionSpec` object by using its constructor.
    * Set the compliance level by assigning the `PDFAValidationOptionSpec` object’s `compliance` data member with the value `PDFAConversionOptionSpec_Compliance.PDFA_1B`.
    * Set the information tracking level by assigning the `PDFAValidationOptionSpec` object’s `resultLevel` data member with the value `PDFAValidationOptionSpec_ResultLevel.DETAILED`.

1. Retrieve information about the PDF document

   Determine PDF/A compliancy by invoking the `DocConverterServiceService` object’s `isPDFA` method and passing the following values:

    * The `BLOB` object that contains the PDF document.
    * The `PDFAValidationOptionSpec` object that contains run-time options.

   The `isPDFA` method returns a `PDFAValidationResult` object that contains the results of this operation.

**See also**

[Working with PDF/A Documents](pdf-a-documents.md#working-with-pdf-a-documents)

[Invoking AEM Forms using Base64 encoding](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-base64-encoding)

[Creating a .NET client assembly that uses Base64 encoding](/help/forms/developing/invoking-aem-forms-using-web.md#creating-a-net-client-assembly-that-uses-base64-encoding)

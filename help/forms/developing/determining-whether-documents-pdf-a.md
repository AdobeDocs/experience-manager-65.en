---
title: Determining Whether Documents Are PDF/A-Compliant

description: Use the Assembler service to determine if a PDF document is PDF/A-compliant using the Java API and Web Service API.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/assembling_pdf_documents
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations

role: Developer
exl-id: 096fd2ac-616f-484a-b093-9d98b2f87093
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,  Document Services, API
---
# Determining Whether Documents Are PDF/A-Compliant {#determining-whether-documents-are-pdf-a-compliant}

You can determine whether a PDF document is PDF/A-compliant by using the Assembler service. A PDF/A document exists as an archival format meant for long-term preservation of the document’s content. The fonts are embedded within the document, and the file is uncompressed. As a result, a PDF/A document is typically larger than a standard PDF document. Also, a PDF/A document does not contain audio and video content.

The PDF/A-1 specification consists of two levels of conformance, namely A and B. The major difference between the two levels is the logical structure (accessibility) support, which is not required for conformance level B. Regardless of the conformance level, PDF/A-1 dictates that all fonts are embedded within the generated PDF/A document. At this time, only PDF/A-1b is supported in validation (and conversion).

For the purpose of this discussion, assume that the following DDX document is used.

```xml
 <?xml version="1.0" encoding="UTF-8"?>
 <DDX xmlns="https://ns.adobe.com/DDX/1.0/">
         <DocumentInformation source="Loan.pdf" result="Loan_result.xml">
         <PDFAValidation compliance="PDF/A-1b" resultLevel="Detailed"                       ignoreUnusedResources="true" allowCertificationSignatures="true" />
     </DocumentInformation>
 </DDX>
```

Within this DDX document, the `DocumentInformation` element instructs the Assembler service to return information about the input PDF document. Within the `DocumentInformation` element, the `PDFAValidation` element instructs the Assembler service to indicate whether the input PDF document is PDF/A-compliant.

The Assembler service returns information that specifies whether the input PDF document is PDF/A-compliant within an XML document that contains a `PDFAConformance` element. If the input PDF document is PDF/A-compliant, the value of the `PDFAConformance` element’s `isCompliant` attribute is `true`. If the PDF document is not PDF/A-compliant, the value of the `PDFAConformance` element’s `isCompliant` attribute is `false`.

>[!NOTE]
>
>Because the DDX document specified in this section contains a `DocumentInformation` element, the Assembler service returns XML data instead of a PDF document. That is, the Assembler service does not assemble or disassemble a PDF document; it returns information about the input PDF document within an XML document.

>[!NOTE]
>
>For more information about the Assembler service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

>[!NOTE]
>
>For more information about a DDX document, see [Assembler Service and DDX Reference](https://www.adobe.com/go/learn_aemforms_ddx_63).

## Summary of steps {#summary-of-steps}

To determine whether a PDF document is PDF/A-compliant, perform the following tasks:

1. Include project files.
1. Create a PDF Assembler client.
1. Reference an existing DDX document.
1. Reference a PDF document used to determine PDF/A compliancy.
1. Set run-time options.
1. Retrieve information about the PDF document.
1. Save the returned XML document.

**Include project files**

Include the necessary files in your development project. If you are creating a client application by using Java, include the necessary JAR files. If you are using web services, ensure that you include the proxy files.

The following JAR files must be added to your project’s class path:

* adobe-livecycle-client.jar
* adobe-usermanager-client.jar
* adobe-assembler-client.jar
* adobe-utilities.jar (required if AEM Forms is deployed on JBoss)
* jbossall-client.jar (required if AEM Forms is deployed on JBoss)

if AEM Forms is deployed on a supported J2EE application server other than JBoss, you must replace the adobe-utilities.jar and jbossall-client.jar files with JAR files that are specific to the J2EE application server that AEM Forms is deployed on. For information about the location of all AEM Forms JAR files, see [Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files).

**Create a PDF Assembler client**

Before you can programmatically perform an Assembler operation, you must create an Assembler service client.

**Reference an existing DDX document**

A DDX document must be referenced to perform an Assembler service operation. To determine whether an input PDF document is PDF/A-compliant, ensure that the DDX document contains the `PDFAValidation` element within a `DocumentInformation` element. The `PDFAValidation` element instructs the Assembler service to return an XML document that specifies whether the input PDF document is PDF/A-compliant.

**Reference a PDF document used to determine PDF/A compliancy**

A PDF document must be referenced and passed to the Assembler service to determine whether the PDF document is PDF/A-compliant.

**Set run-time options**

You can set run-time options that control the behaviour of the Assembler service while it performs a job. For example, you can set an option that instructs the Assembler service to continue processing a job if an error is encountered. For information about the run-time options that you can set, see the `AssemblerOptionSpec` class reference in [AEM Forms API Reference](https://www.adobe.com/go/learn_aemforms_javadocs_63_en).

**Retrieve information about the PDF document**

After you create the Assembler service client, reference the DDX document, reference an interactive PDF document, and set run-time options, you can invoke the `invokeDDX` operation. Because the DDX document contains the `DocumentInformation` element, the Assembler service returns XML data instead of a PDF document.

**Save the returned XML document**

The XML document that the Assembler service returns specifies whether the input PDF document is PDF/A-compliant. For example, if the input PDF document is not PDF/A-compliant, the Assembler service returns an XML document that contains the following element:

```xml
 <PDFAConformance isCompliant="false" compliance="PDF/A-1b" resultLevel="Detailed" ignoreUnusedResources="true" allowCertificationSignatures="true">
```

Save the XML document as an XML file so that you can open the file and view the results.

**See also**

[Determine whether a document is PDF/A compliant using the Java API](/help/forms/developing/determining-whether-documents-pdf-a.md#determine-whether-a-document-is-pdf-a-compliant-using-the-java-api)

[Determine whether a document is PDF/A compliant using the web service API](/help/forms/developing/determining-whether-documents-pdf-a.md#determine-whether-a-document-is-pdf-a-compliant-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Programmatically Assembling PDF Documents](/help/forms/developing/programmatically-assembling-pdf-documents.md)

## Determine whether a document is PDF/A compliant using the Java API {#determine-whether-a-document-is-pdf-a-compliant-using-the-java-api}

Determine whether a PDF document is PDF/A-compliant by using the Assembler Service API (Java):

1. Include project files.

   Include client JAR files, such as adobe-assembler-client.jar, in your Java project’s class path.

1. Create a PDF Assembler client.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create an `AssemblerServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Reference an existing DDX document.

    * Create a `java.io.FileInputStream` object that represents the DDX document by using its constructor and passing a string value that specifies the location of the DDX file. To determine whether the PDF document is PDF/A-compliant, ensure that the DDX document contains the `PDFAValidation` element that is contained within a `DocumentInformation` element.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Reference a PDF document used to determine PDF/A compliancy.

    * Create a `java.io.FileInputStream` object by using its constructor and passing the location of a PDF document that is used to determine PDF/A compliancy.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object that contains the PDF document.
    * Create a `java.util.Map` object that is used to store the input PDF document by using a `HashMap` constructor.
    * Add an entry to the `java.util.Map` object by invoking its `put` method and passing the following arguments:

        * A string value that represents the key name. This value must match the value of the source element specified in the DDX document. For example, the value of the source element in the DDX document that is introduced in this section is Loan.pdf.
        * A `com.adobe.idp.Document` object that contains the input PDF document.

1. Set run-time options.

    * Create an `AssemblerOptionSpec` object that stores run-time options by using its constructor.
    * Set run-time options to meet your business requirements by invoking a method that belongs to the `AssemblerOptionSpec` object. For example, to instruct the Assembler service to continue processing a job when an error occurs, invoke the `AssemblerOptionSpec` object’s `setFailOnError` method and pass `false`.

1. Retrieve information about the PDF document.

   Invoke the `AssemblerServiceClient` object’s `invokeDDX` method and pass the following required values:

    * A `com.adobe.idp.Document` object that represents the DDX document to use
    * A `java.util.Map` object that contains the input PDF file that is used to determine PDF/A compliancy
    * A `com.adobe.livecycle.assembler.client.AssemblerOptionSpec` object that specifies the run-time options

   The `invokeDDX` method returns a `com.adobe.livecycle.assembler.client.AssemblerResult` object that contains XML data that specifies whether the input PDF document is PDF/A-compliant.

1. Save the returned XML document.

   To obtain XML data that specifies whether the input PDF document is a PDF/A document, perform the following actions:

    * Invoke the `AssemblerResult` object’s `getDocuments` method. This returns a `java.util.Map` object.
    * Iterate through the `java.util.Map` object until you find the resultant `com.adobe.idp.Document` object.
    * Invoke the `com.adobe.idp.Document` object’s `copyToFile` method to extract the XML document. Ensure that you save the XML data as an XML file.

**See also**

[Quick Start (SOAP mode): Determining whether a document is PDF/A compliant using the Java API](/help/forms/developing/assembler-service-java-api-quick.md#quick-start-soap-mode-determining-whether-a-document-is-pdf-a-compliant-using-the-java-api) (SOAP mode)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

## Determine whether a document is PDF/A compliant using the web service API {#determine-whether-a-document-is-pdf-a-compliant-using-the-web-service-api}

Determine whether a PDF document is PDF/A-compliant by using the Assembler Service API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/AssemblerService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a PDF Assembler client.

    * Create an `AssemblerServiceClient` object by using its default constructor.
    * Create an `AssemblerServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/AssemblerService?blob=mtom`). You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
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
    * Populate the `BLOB` object by assigning its `MTOM` field with the contents of the byte array.

1. Reference a PDF document used to determine PDF/A compliancy.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store the input PDF document.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the input PDF document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object’s `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object’s `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` property with the contents of the byte array.
    * Create a `MyMapOf_xsd_string_To_xsd_anyType` object. This collection object is used to store the PDF document.
    * Create a `MyMapOf_xsd_string_To_xsd_anyType_Item` object.
    * Assign a string value that represents the key name to the `MyMapOf_xsd_string_To_xsd_anyType_Item` object's `key` field. This value must match the value of the PDF source element specified in the DDX document.
    * Assign the `BLOB` object that stores the PDF document to the `MyMapOf_xsd_string_To_xsd_anyType_Item` object's `value` field.
    * Add the `MyMapOf_xsd_string_To_xsd_anyType_Item` object to the `MyMapOf_xsd_string_To_xsd_anyType` object. Invoke the `MyMapOf_xsd_string_To_xsd_anyType` object' `Add` method and pass the `MyMapOf_xsd_string_To_xsd_anyType` object.

1. Set run-time options.

    * Create an `AssemblerOptionSpec` object that stores run-time options by using its constructor.
    * Set run-time options to meet your business requirements by assigning a value to a data member that belongs to the `AssemblerOptionSpec` object. For example, to instruct the Assembler service to continue processing a job when an error occurs, assign `false` to the `AssemblerOptionSpec` object’s `failOnError` data member.

1. Retrieve information about the PDF document.

   Invoke the `AssemblerServiceService` object’s `invoke` method and pass the following values:

    * A `BLOB` object that represents the DDX document.
    * The `MyMapOf_xsd_string_To_xsd_anyType` object that contains the input PDF document. Its keys must match the names of the PDF source files, and its values must be the `BLOB` object that corresponds to the input PDF file.
    * An `AssemblerOptionSpec` object that specifies run-time options.

   The `invoke` method returns an `AssemblerResult` object that contains XML data that specifies whether the input PDF document is a PDF/A document.

1. Save the returned XML document.

   To obtain XML data that specifies whether the input PDF document is a PDF/A document, perform the following actions:

    * Access the `AssemblerResult` object's `documents` field, which is a `Map` object that contains the XML data that specifies whether the input PDF document is a PDF/A document.
    * Iterate through the `Map` object to obtain each resultant document. Then, cast that array member's value to a `BLOB`.
    * Extract the binary data that represents the XML data by accessing its `BLOB` object's `MTOM` field. This field stores an array of bytes that you can write out to as an XML file.

**See also**

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

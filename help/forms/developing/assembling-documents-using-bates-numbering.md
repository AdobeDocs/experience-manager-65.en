---
title: Assembling Documents Using Bates Numbering

description: Use Bates numbering to assemble PDF documents using the Java and Web Service API. 


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/assembling_pdf_documents
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations

role: Developer
exl-id: 2a4e21c4-f2f5-44cd-b8ed-7b572782a2f1
solution: Experience Manager, Experience Manager Forms
feature: "Adaptive Forms,Document Services"
---
# Assembling Documents Using Bates Numbering {#assembling-documents-using-bates-numbering} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

You can assemble PDF documents that contain unique page identifiers by using Bates numbering. *Bates numbering* is a method of applying unique identifies to a batch of related documents. Each page in the document (or set of documents) is assigned a Bates number that uniquely identifies the page. For example, manufacturing documents that contain bill of material information and are associated with the production of an assembly can contain an identifier. A Bates number contains a sequentially incremented numeric value and an optional prefix and suffix. The prefix + numeric + suffix is referred to as a *bates pattern*.

The following illustration shows a PDF document that contains a unique identifier in the document's header.

![au_au_batesnumber](assets/au_au_batesnumber.png)

For the purpose of this discussion, the unique page identifier is placed in a document's header. Assume that the following DDX document is used.

```xml
 <?xml version="1.0" encoding="UTF-8"?>
 <DDX xmlns="https://ns.adobe.com/DDX/1.0/">
        <PDF result="out.pdf">
        <Header>
         <Center>
             <StyledText>
                 <p font-size="20pt"><BatesNumber/></p>
             </StyledText>
         </Center>
     </Header>
           <PDF source="map.pdf" />
          <PDF source="directions.pdf" />
          </PDF>
 </DDX>
```

This DDX document merges two PDF documents named *map.pdf* and *directions.pdf* into a single PDF document. The resultant PDF document contains a header that consists of a unique page identifier. For example, the document in the above illustration shows 000016.

>[!NOTE]
>
>Before reading this section, it is recommended that you are familiar with assembling PDF documents using the Assembler service. This section does not discuss the concepts, such as creating a collection object that contains input documents, or extracting the results from the returned collection object. (See [Programmatically Assembling PDF Documents](/help/forms/developing/programmatically-assembling-pdf-documents.md).)

>[!NOTE]
>
>For more information about the Assembler service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

>[!NOTE]
>
>For more information about a DDX document, see [Assembler Service and DDX Reference](https://www.adobe.com/go/learn_aemforms_ddx_63).

## Summary of steps {#summary-of-steps}

To assemble a PDF document that contains a unique page identifier (Bates numbering), perform the following tasks:

1. Include project files.
1. Create a PDF Assembler client.
1. Reference an existing DDX document.
1. Reference input PDF documents.
1. Set the initial Bates number value.
1. Assemble the input PDF documents.
1. Extract the results.

**Include project files**

Include the necessary files in your development project. If you are creating a client application by using Java, include the necessary JAR files. If you are using web services, ensure that you include the proxy files.

The following JAR files must be added to your project's class path:

* adobe-livecycle-client.jar
* adobe-usermanager-client.jar
* adobe-assembler-client.jar
* adobe-utilities.jar (required if AEM Forms is deployed on JBoss)
* jbossall-client.jar (required if AEM Forms is deployed on JBoss)

If AEM Forms is deployed on a supported J2EE application server other than JBoss, you must replace the adobe-utilities.jar and jbossall-client.jar files with JAR files that are specific to the J2EE application server on which AEM Forms is deployed. For information about the location of all AEM Forms JAR files, see [Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files).

**Create a PDF Assembler client**

Before you can programmatically perform an Assembler operation, you must create an Assembler service client.

**Reference an existing DDX document**

A DDX document must be referenced to assemble a PDF document. For example, consider the DDX document that was introduced in this section. To assemble a PDF document that contains unique page identifiers, the DDX document must contain the `BatesNumber` element.

**Reference input PDF documents**

Input PDF documents must be referenced to assemble a PDF document. For example, the map.pdf and directions.pdf documents must be referenced to assemble these PDF documents into a single PDF document.

**Set the initial Bates number value**

You can set the initial Bates number value to meet your business requirements. For example, assume that it is a requirement to set the initial value to 000100. If you do not set the initial value, the value of the first page is 000000.

**Assemble the input PDF documents**

After you create the Assembler service client, reference the DDX document that contains `BatesNumber` element information, reference an input PDF document, and set run-time options, you can invoke the `invokeDDX` operation that results in the Assembler service assembling a PDF document that contains unique page identifiers.

**Extract the results**

The Assembler service returns a collection object that contains the job results. You can extract the resultant PDF document and any exceptions that are thrown. In this situation, an encrypted PDF document is located within the collection object.

>[!NOTE]
>
>A collection object is returned if you invoke the `invokeDDX` operation. This operation is used when passing two or more input PDF documents to the Assembler service. However if you pass only one input PDF document to the Assembler service, you should invoke the `invokeOneDocument` operation. For information about using this operation, see [Assembling Encrypted PDF Documents](/help/forms/developing/assembling-encrypted-pdf-documents.md).

**See also**

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Programmatically Assembling PDF Documents](/help/forms/developing/programmatically-assembling-pdf-documents.md)

## Assemble documents with Bates numbering using the Java API {#assemble-documents-with-bates-numbering-using-the-java-api}

Assemble a PDF document that uses unique page identifiers (Bates numbering) by using the Assembler Service API (Java):

1. Include project files.

   Include client JAR files, such as adobe-assembler-client.jar, in your Java project's class path.

1. Create a PDF Assembler client.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create an `AssemblerServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Reference an existing DDX document.

    * Create a `java.io.FileInputStream` object that represents the DDX document by using its constructor and passing a string value that specifies the location of the DDX file.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Reference input PDF documents.

    * Create a `java.util.Map` object used to store input PDF documents by using a `HashMap` constructor.
    * For each input PDF document, create a `java.io.FileInputStream` object by using its constructor and passing the location of the input PDF document. In this situation, pass the location of an unsecured PDF document.
    * For each input PDF document, create a `com.adobe.idp.Document` object and pass the `java.io.FileInputStream` object that contains the PDF document.
    * Add an entry to the `java.util.Map` object by invoking its `put` method and passing the following arguments:

        * A string value that represents the key name. This value must match the value of the PDF source element specified in the DDX document. For example, the name of the PDF source file specified in the DDX document that is introduced in this section is Loan.pdf.
        * A `com.adobe.idp.Document` object that contains the unsecured PDF document.

1. Set the initial Bates number value.

    * Create an `AssemblerOptionSpec` object that stores run-time options by using its constructor.
    * Set the initial Bates number by invoking the `AssemblerOptionSpec` object's `setFirstBatesNumber` and passing a numeric value that specifies the initial value.

1. Assemble the input PDF documents.

   Invoke the `AssemblerServiceClient` object's `invokeDDX` method and pass the following required values:

    * A `com.adobe.idp.Document` object that represents the DDX document.
    * A `java.util.Map` object that contains the input unsecured PDF file.
    * A `com.adobe.livecycle.assembler.client.AssemblerOptionSpec` object that specifies the run-time options, including default font and job log level.

   The `invokeDDX` method returns a `com.adobe.livecycle.assembler.client.AssemblerResult` object that contains a password-encrypted PDF document.

1. Extract the results.

   To obtain the newly created PDF document, perform the following actions:

    * Invoke the `AssemblerResult` object's `getDocuments` method. This action returns a `java.util.Map` object.
    * Iterate through the `java.util.Map` object until you find the `com.adobe.idp.Document` object.
    * Invoke the `com.adobe.idp.Document` object's `copyToFile` method to extract the PDF document.

**See also**

[Quick Start (SOAP mode): Assembling a PDF document with bates numbering using the Java API](/help/forms/developing/assembler-service-java-api-quick.md#quick-start-soap-mode-assembling-a-pdf-document-with-bates-numbering-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

## Assemble documents with Bates numbering using the web service API {#assemble-documents-with-bates-numbering-using-the-web-service-api}

Assemble a PDF document that uses unique page identifiers (Bates numbering) by using the Assembler Service API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/AssemblerService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a PDF Assembler client.

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
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method. Pass the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` field with the contents of the byte array.

1. Reference input PDF documents.

    * For each input PDF document, create a `BLOB` object by using its constructor. The `BLOB` object is used to store the input PDF document.
    * Create a `System.IO.FileStream` object by invoking its constructor. Pass a string value that represents the file location of the input PDF document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object's `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method. Pass the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` property with the contents of the byte array.
    * Create a `MyMapOf_xsd_string_To_xsd_anyType` object. This collection object is used to store the input PDF documents.
    * For each input PDF document, create a `MyMapOf_xsd_string_To_xsd_anyType_Item` object. For example, if two input PDF documents are used, create two `MyMapOf_xsd_string_To_xsd_anyType_Item` objects.
    * Assign a string value that represents the key name to the `MyMapOf_xsd_string_To_xsd_anyType_Item` object's `key` field. This value must match the value of the PDF source element specified in the DDX document. (Perform this task for each input PDF document.)
    * Assign the `BLOB` object that stores the PDF document to the `MyMapOf_xsd_string_To_xsd_anyType_Item` object's `value` field. (Perform this task for each input PDF document.)
    * Add the `MyMapOf_xsd_string_To_xsd_anyType_Item` object to the `MyMapOf_xsd_string_To_xsd_anyType` object. Invoke the `MyMapOf_xsd_string_To_xsd_anyType` object's `Add` method and pass the `MyMapOf_xsd_string_To_xsd_anyType` object. (Perform this task for each input PDF document.)

1. Set the initial Bates number value.

    * Create an `AssemblerOptionSpec` object that stores run-time options by using its constructor.
    * Set the initial Bates number by assigning a numeric value to the `firstBatesNumber` data member that belongs to the `AssemblerOptionSpec` object.

1. Assemble the input PDF documents.

   Invoke the `AssemblerServiceClient` object's `invoke` method and pass the following values:

    * A `BLOB` object that represents the DDX document.
    * The `MyMapOf_xsd_string_To_xsd_anyType` object that contains the input PDF documents. Its keys must match the names of the PDF source files, and its values must be the `BLOB` objects that corresponds to those files.
    * An `AssemblerOptionSpec` object that specifies run-time options.

   The `invoke` method returns an `AssemblerResult` object that contains the results of the job and any exceptions that occurred.

1. Extract the results.

   To obtain the newly created PDF document, perform the following actions:

    * Access the `AssemblerResult` object's `documents` field, which is a `Map` object that contains the result PDF documents.
    * Iterate through the `Map` object until you find the key that matches the name of the resultant document. Then cast that array member's `value` to a `BLOB`.
    * Extract the binary data that represents the PDF document by accessing its `BLOB` object's `MTOM` property. This returns an array of bytes that you can write out to a PDF file.

**See also**

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

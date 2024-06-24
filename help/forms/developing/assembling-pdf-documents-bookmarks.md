---
title: Assembling PDF Documents with Bookmarks

description: Use the Assembler service to modify a PDF document that does contain bookmarks to include bookmarks using the Java API and the Web Service API.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/assembling_pdf_documents
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations

role: Developer
exl-id: 2b938410-f51b-420b-b5d4-2ed13ec29c5a
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,Document Services
---
# Assembling PDF Documents with Bookmarks {#assembling-pdf-documents-with-bookmarks} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

You can assemble a PDF document that contains bookmarks. For example, assume that you have a PDF document that does not contain bookmarks and you want to modify it by providing bookmarks. Using the Assembler service, you can pass it a PDF document that does not contain bookmarks and get back a PDF document that contains bookmarks.

Bookmarks contain the following properties:

* A title that appears as text on the screen.
* An action that specifies what happens when a user clicks on the bookmark. The typical action for a bookmark is to move to another location in the current document or open another PDF document, although other actions can be specified.

For the purpose of this discussion, assume that the following DDX document is used.

```xml
 <?xml version="1.0" encoding="UTF-8"?>
 <DDX xmlns="https://ns.adobe.com/DDX/1.0/">
       <PDF result="FinalDoc.pdf">
          <PDF source="Loan.pdf">
             <Bookmarks source="doc2" />
          </PDF>
       </PDF>
 </DDX>
```

Within this DDX document, notice that the source attribute is assigned the value `Loan.pdf`. This DDX document specifies that a single PDF document is passed to the Assembler service. When assembling a PDF document with bookmarks, you must specify a bookmark XML document that describes the bookmarks in the result document. To specify a bookmark XML document, ensure that the `Bookmarks` element is specified in your DDX document.

In this example DDX document, the `Bookmarks` element specifies `doc2` as the value. This value indicates that the input map passed to the Assembler service contains a key named `doc2`. The value of the `doc2` key is a `com.adobe.idp.Document` value that represents the bookmark XML document. (See "Bookmarks Language" in the [Assembler Service and DDX Reference](https://www.adobe.com/go/learn_aemforms_ddx_63).)

This topic uses the following XML bookmarks language to assemble a PDF document containing bookmarks.

```xml
 <?xml version="1.0" encoding="UTF-8"?>
 <Bookmarks xmlns="https://ns.adobe.com/pdf/bookmarks" version="1.0">
       <Bookmark>
          <Action>
             <Launch NewWindow="true">
                <File Name="C:\Adobe\LoanDetails.pdf" />
             </Launch>
          </Action>
         <Title>Open the Loan document</Title>
       </Bookmark>
 <Bookmark>
          <Action>
             <Launch>
                <Win Name="C:\WINDOWS\notepad.exe" />
             </Launch>
          </Action>
     <Title>Launch NotePad</Title>
       </Bookmark>
 </Bookmarks>
```

Within this bookmark XML document, notice the Action element that defines the action that is performed when a user clicks the bookmark. Under the Action element is the Launch element that launches applications, such as NotePad and opens files, such as PDF files. To open a PDF file, you must use the File element that specifies the file to open. For example, in the bookmark XML file specified in this section, the name of the file that is opened is LoanDetails.pdf.

>[!NOTE]
>
>For complete details about supported actions, see " `Action` element" in the [Assembler Service and DDX Reference](https://www.adobe.com/go/learn_aemforms_ddx_63).

Given the DDX document specified in this section and bookmark XML file as input, the Assembler service assembles a PDF document that contains the following bookmarks.

![aw_aw_bmark](assets/aw_aw_bmark.png)

When a user clicks on the *Open the Loan Details* bookmark, the LoanDetails.pdf is opened. Likewise, when the user clicks on the *Launch NotePad* bookmark, NotePad is started.

>[!NOTE]
>
>Before reading this section, it is recommended that you are familiar with assembling PDF documents using the Assembler service. This section does not discuss concepts, such as creating a collection object that contains input documents or learning how to extract the results from the returned collection object. (See [Programmatically Assembling PDF Documents](/help/forms/developing/programmatically-assembling-pdf-documents.md#programmatically-assembling-pdf-documents).)

>[!NOTE]
>
>For more information about the Assembler service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

>[!NOTE]
>
>For more information about a DDX document, see [Assembler Service and DDX Reference](https://www.adobe.com/go/learn_aemforms_ddx_63).

## Summary of steps {#summary-of-steps}

To assemble a PDF document that contains bookmarks, perform the following tasks:

1. Include project files.
1. Create a PDF Assembler client.
1. Reference an existing DDX document.
1. Reference a PDF document to which bookmarks are added.
1. Reference the bookmark XML document.
1. Add the PDF document and the bookmark XML document to a Map collection.
1. Set run-time options.
1. Assemble the PDF document.
1. Save the PDF document that contains bookmarks.

**Include project files**

Include the necessary files in your development project. If you are creating a client application by using Java, include the necessary JAR files. If you are using web services, ensure that you include the proxy files.

The following JAR files must be added to your project's class path:

* adobe-livecycle-client.jar
* adobe-usermanager-client.jar
* adobe-assembler-client.jar
* adobe-utilities.jar (required if AEM Forms is deployed on JBoss)
* jbossall-client.jar (required if AEM Forms is deployed on JBoss)

if AEM Forms is deployed on a supported J2EE application server other than JBoss, you must replace the adobe-utilities.jar and jbossall-client.jar files with JAR files that are specific to the J2EE application server that AEM Forms is deployed on. For information about the location of all AEM Forms JAR files, see [Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files).

**Create a PDF Assembler client**

Before you can programmatically perform an Assembler operation, you must create an Assembler service client.

**Reference an existing DDX document**

A DDX document must be referenced to assemble a PDF document. This DDX document must contain the `Bookmarks` element, which instructs the Assembler service to assemble a PDF that contains bookmarks. (See the DDX document shown earlier in this section for an example.)

**Reference a PDF document to which bookmarks are added**

Reference a PDF document to which bookmarks are added. It does not matter whether the referenced PDF document already contains bookmarks. If the `Bookmarks` element is a child of the PDF source element, then the Bookmarks will replace those that already exist in the PDF source. However, if you want to keep the existing bookmarks, then ensure that `Bookmarks` is a sibling of the PDF source element. For example, consider the following example:

```xml
 <PDF result="foo">
      <PDF source="inDoc"/>
      <Bookmarks source="doc2"/>
 </PDF>
```

**Reference the bookmark XML document**

To assemble a PDF that contains new bookmarks, you must reference a bookmark XML document. The bookmark XML document is passed to the Assembler service within the Map collection object. (See the bookmark XML document shown earlier in this section for an example.)

>[!NOTE]
>
>See "Bookmarks Language" in the [Assembler Service and DDX Reference](https://www.adobe.com/go/learn_aemforms_ddx_63).

**Add the PDF document and the bookmark XML document to a Map collection**

Add both the PDF document to which bookmarks are added and the bookmark XML document to the Map collection. Therefore the Map collection object contains two elements: a PDF document and the bookmark XML document.

**Set run-time options**

You can set run-time options that control the behavior of the Assembler service while it performs a job. For example, you can set an option that instructs the Assembler service to continue processing a job if an error is encountered. For information about the run-time options that you can set, see the `AssemblerOptionSpec` class reference in [AEM Forms API Reference](https://www.adobe.com/go/learn_aemforms_javadocs_63_en).

**Assemble the PDF document**

To assemble a PDF document that contains new bookmarks, use the Assembler service's `invokeDDX` operation. The reason why you must use the `invokeDDX` operation as opposed to other Assembler service operations such as `invokeOneDocument` is because the Assembler service requires a bookmark XML document that is passed within the Map collection object. This object is a parameter of the `invokeDDX` operation.

**Save the PDF document that contains bookmarks**

Extract the results from the returned map object and save the corresponding PDF document. (See "Extract the results" in [Programmatically Assembling PDF Documents](/help/forms/developing/programmatically-assembling-pdf-documents.md).)

**See also**

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Programmatically Assembling PDF Documents](/help/forms/developing/programmatically-assembling-pdf-documents.md)

## Assemble PDF documents with bookmarks using the Java API {#assemble-pdf-documents-with-bookmarks-using-the-java-api}

Assemble a PDF document with bookmarks by using the Assembler Service API (Java):

1. Include project files.

   Include client JAR files, such as adobe-assembler-client.jar, in your Java project's class path.

1. Create a PDF Assembler client.

    * Create a `ServiceClientFactory` object that contains connection properties. (See [Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties).)
    * Create an `AssemblerServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Reference an existing DDX document.

    * Create a `java.io.FileInputStream` object that represents the DDX document by using its constructor and passing a string value that specifies the location of the DDX file.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Reference a PDF document to which bookmarks are added.

    * Create a `java.io.FileInputStream` object by using its constructor and passing the location of the PDF document.
    * Create a `com.adobe.idp.Document` object by using its constructor and pass the `java.io.FileInputStream` object that contains the PDF document.

1. Reference the bookmark XML document.

    * Create a `java.io.FileInputStream` object by using its constructor and passing the location of the XML file that represents the bookmark XML document.
    * Create a `com.adobe.idp.Document` object and pass the `java.io.FileInputStream` object that contains the PDF document.

1. Add the PDF document and the bookmark XML document to a Map collection.

    * Create a `java.util.Map` object that is used to store both the input PDF document and the bookmark XML document.
    * Add the input PDF document by invoking the `java.util.Map` object's `put` method and passing the following arguments:

        * A string value that represents the key name. This value must match the value of the PDF source element specified in the DDX document.
        * A `com.adobe.idp.Document` object that contains the input PDF document.

    * Add the bookmark XML document by invoking the `java.util.Map` object's `put` method and passing the following arguments:

        * A string value that represents the key name. This value must match the value of the Bookmarks source element specified in the DDX document.
        * A `com.adobe.idp.Document` object that contains the bookmark XML document.

1. Set run-time options.

    * Create an `AssemblerOptionSpec` object that stores run-time options by using its constructor.
    * Set run-time options to meet your business requirements by invoking a method that belongs to the `AssemblerOptionSpec` object. For example, to instruct the Assembler service to continue processing a job when an error occurs, invoke the `AssemblerOptionSpec` object's `setFailOnError` method and pass `false`.

1. Assemble the PDF document.

   Invoke the `AssemblerServiceClient` object's `invokeDDX` method and pass the following required values:

    * A `com.adobe.idp.Document` object that represents the DDX document to be used
    * A `java.util.Map` object that contains both the input PDF document and the bookmark XML document.
    * A `com.adobe.livecycle.assembler.client.AssemblerOptionSpec` object that specifies the run-time options, including default font and job log level

   The `invokeDDX` method returns a `com.adobe.livecycle.assembler.client.AssemblerResult` object that contains the results of the job and any exceptions that occurred.

1. Save the PDF document that contains bookmarks.

   To obtain the newly created PDF document, perform the following actions:

    * Invoke the `AssemblerResult` object's `getDocuments` method. This returns a `java.util.Map` object.
    * Iterate through the `java.util.Map` object until you find the resultant `com.adobe.idp.Document` object. (You can use the PDF result element specified in the DDX document to get the document.)
    * Invoke the `com.adobe.idp.Document` object's `copyToFile` method to extract the PDF document.

**See also**

[Quick Start (SOAP mode): Assembling PDF documents with bookmarks using the Java API](/help/forms/developing/assembler-service-java-api-quick.md#quick-start-soap-mode-assembling-pdf-documents-with-bookmarks-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

## Assemble PDF documents with bookmarks using the web service API {#assemble-pdf-documents-with-bookmarks-using-the-web-service-api}

Assemble a PDF document with bookmarks by using the Assembler Service API (web service):

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
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the DDX document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object's `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` field with the contents of the byte array.

1. Reference a PDF document to which bookmarks are added.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store the input PDF.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the input PDF document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object's `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` field with the contents of the byte array.

1. Reference the bookmark XML document.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store the bookmark XML document.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the input PDF document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object's `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` field with the contents of the byte array.

1. Add the PDF document and the bookmark XML document to a Map collection.

    * Create a `MyMapOf_xsd_string_To_xsd_anyType` object. This collection object is used to store the input PDF documents and the bookmark XML document.
    * For each input PDF document and the bookmark XML document , create a `MyMapOf_xsd_string_To_xsd_anyType_Item` object.
    * Assign a string value that represents the key name to the `MyMapOf_xsd_string_To_xsd_anyType_Item` object's `key` field. This value must match the value of the PDF source element specified in the DDX document.
    * Assign the `BLOB` object that stores the PDF document to the `MyMapOf_xsd_string_To_xsd_anyType_Item` object's `value` field.
    * Add the `MyMapOf_xsd_string_To_xsd_anyType_Item` object to the `MyMapOf_xsd_string_To_xsd_anyType` object. Invoke the `MyMapOf_xsd_string_To_xsd_anyType` object's `Add` method and pass the `MyMapOf_xsd_string_To_xsd_anyType` object. (Perform this task for each input PDF document and the bookmark XML document.)

1. Set run-time options.

    * Create an `AssemblerOptionSpec` object that stores run-time options by using its constructor.
    * Set run-time options to meet your business requirements by assigning a value to a data member that belongs to the `AssemblerOptionSpec` object. For example, to instruct the Assembler service to continue processing a job when an error occurs, assign `false` to the `AssemblerOptionSpec` object's `failOnError` data member.

1. Assemble the PDF document.

   Invoke the `AssemblerServiceClient` object's `invokeDDX` method and pass the following values:

    * A `BLOB` object that represents the DDX document
    * The `MyMapOf_xsd_string_To_xsd_anyType` array that contains the input documents
    * An `AssemblerOptionSpec` object that specifies run-time options

   The `invokeDDX` method returns an `AssemblerResult` object that contains the results of the job and any exceptions that may have occurred.

1. Save the PDF document that contains bookmarks.

   To obtain the newly created PDF document, perform the following actions:

    * Access the `AssemblerResult` object's `documents` field, which is a `Map` object that contains the result PDF documents.
    * Iterate through the `Map` object until you find the key that matches the name of the resultant document. Then cast that array member's `value` to a `BLOB`.
    * Extract the binary data that represents the PDF document by accessing its `BLOB` object's `MTOM` field. This returns an array of bytes that you can write out to a PDF file.

**See also**

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

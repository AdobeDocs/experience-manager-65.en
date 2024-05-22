---
title: Dynamically Creating DDX Documents

description: Create a DDX document dynamically using the Java API and Web Service API. Dynamically creating a DDX document enables you to use values in the DDX document that are obtained during run-time.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/assembling_pdf_documents
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations

role: Developer
exl-id: b3c19c82-e26f-4dc8-b846-6aec705cee08
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,  Document Services, API
---
# Dynamically Creating DDX Documents {#dynamically-creating-ddx-documents} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

You can dynamically create a DDX document that can be used to perform an Assembler operation. Dynamically creating a DDX document enables you to use values in the DDX document that are obtained during run-time. To dynamically create a DDX document, use classes that belong to the programming language that you are using. For example, if you are developing your client application using Java, use classes that belong to the `org.w3c.dom.*`package. Likewise, if you are using Microsoft .NET, use classes that belong to the `System.Xml` namespace.

Before you can pass the DDX document to the Assembler service, convert the XML from an `org.w3c.dom.Document` instance to a `com.adobe.idp.Document` instance. If you are using web services, convert the XML from the data type used to create the XML(for example, `XmlDocument`) to a `BLOB` instance.

For this discussion, assume that the following DDX document is dynamically created.

```xml
 <?xml version="1.0" encoding="UTF-8"?>
 <DDX xmlns="https://ns.adobe.com/DDX/1.0/">
      <PDFsFromBookmarks prefix="stmt">
     <PDF source="AssemblerResultPDF.pdf"/>
 </PDFsFromBookmarks>
 </DDX>
```

This DDX document disassembles a PDF document. It is recommended that you are familiar with disassembling PDF documents.

>[!NOTE]
>
>For more information about the Assembler service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

>[!NOTE]
>
>For more information about a DDX document, see [Assembler Service and DDX Reference](https://www.adobe.com/go/learn_aemforms_ddx_63).

## Summary of steps {#summary-of-steps}

To disassemble a PDF document by using a dynamically created DDX document, perform the following tasks:

1. Include project files.
1. Create a PDF Assembler client.
1. Create the DDX document.
1. Convert the DDX document.
1. Set run-time options.
1. Disassemble the PDF document.
1. Save the disassembled PDF documents.

**Include project files**

Include the necessary files in your development project. If you are creating a client application by using Java, include the necessary JAR files. If you are using web services, ensure that you include the proxy files.

The following JAR files must be added to your project's class path:

* adobe-livecycle-client.jar
* adobe-usermanager-client.jar
* adobe-assembler-client.jar
* adobe-utilities.jar (required if AEM Forms is deployed on JBoss)
* jbossall-client.jar (required if AEM Forms is deployed on JBoss)

**Create a PDF Assembler client**

Before you can programmatically perform an Assembler operation, create an Assembler service client.

**Create the DDX document**

Create a DDX document using the programming language that you are using. To create a DDX document that disassembles a PDF document, ensure that it contains the `PDFsFromBookmarks` element. Convert the data type used to create the DDX document to a `com.adobe.idp.Document` instance if you are using the Java API. If you are using web services, convert the data type to a `BLOB` instance.

**Convert the DDX document**

A DDX document that is created by using `org.w3c.dom` classes must be converted to a `com.adobe.idp.Document` object. To perform this task when using the Java API, use Java XML transform classes. If you are using web services, convert the DDX document to a `BLOB` object.

**Reference a PDF document to disassemble**

To disassemble a PDF document, reference a PDF file that represents the PDF document to disassemble. When passed to the Assembler service, a separate PDF document is returned for each level 1 bookmark in the document.

**Set run-time options**

You can set run-time options that control the behavior of the Assembler service while it performs a job. For example, you can set an option that instructs the Assembler service to continue processing a job if an error is encountered. To set run-time options, you use an `AssemblerOptionSpec` object.

**Disassemble the PDF document**

Disassemble the PDF document by invoking the `invokeDDX` operation. Pass the DDX document that was dynamically created. The Assembler service returns disassembled PDF documents within a collection object.

**Save the disassembled PDF documents**

All disassembled PDF documents are returned within a collection object. Iterate through the collection object and save each PDF document as a PDF file.

**See also**

[Dynamically create a DDX document using the Java API](/help/forms/developing/dynamically-creating-ddx-documents.md#dynamically-create-a-ddx-document-using-the-java-api)

[Dynamically create a DDX document using the web service API](/help/forms/developing/dynamically-creating-ddx-documents.md#dynamically-create-a-ddx-document-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Programmatically Disassembling PDF Documents](/help/forms/developing/programmatically-disassembling-pdf-documents.md#programmatically-disassembling-pdf-documents)

## Dynamically create a DDX document using the Java API {#dynamically-create-a-ddx-document-using-the-java-api}

Dynamically create a DDX document and disassemble a PDF document by using the Assembler Service API (Java):

1. Include project files.

   Include client JAR files, such as adobe-assembler-client.jar, in your Java project's class path.

1. Create a PDF Assembler client.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create an `AssemblerServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Create the DDX document.

    * Create a Java `DocumentBuilderFactory` object by calling the `DocumentBuilderFactory` class' `newInstance` method.
    * Create a Java `DocumentBuilder` object by calling the `DocumentBuilderFactory` object's `newDocumentBuilder` method.
    * Call the `DocumentBuilder` object's `newDocument` method to instantiate a `org.w3c.dom.Document` object.
    * Create the DDX document's root element by invoking the `org.w3c.dom.Document` object's `createElement` method. This method creates an `Element` object that represents the root element. Pass a string value representing the name of the element to the `createElement` method. Cast the return value to `Element`. Next, set a value for the child element by calling its `setAttribute` method. Finally, append the element to the header element by calling the header element's `appendChild` method, and pass the child element object as an argument. The following lines of code show this application logic:
      ` Element root = (Element)document.createElement("DDX");  root.setAttribute("xmlns","https://ns.adobe.com/DDX/1.0/");  document.appendChild(root);`

    * Create the `PDFsFromBookmarks` element by calling the `Document` object's `createElement` method. Pass a string value representing the name of the element to the `createElement` method. Cast the return value to `Element`. Set a value for the `PDFsFromBookmarks` element by calling its `setAttribute` method. Append the `PDFsFromBookmarks` element to the `DDX` element by calling the DDX element's `appendChild` method. Pass the `PDFsFromBookmarks` element object as an argument. The following lines of code show this application logic:

      ` Element PDFsFromBookmarks = (Element)document.createElement("PDFsFromBookmarks");  PDFsFromBookmarks.setAttribute("prefix","stmt");  root.appendChild(PDFsFromBookmarks);`

    * Create a `PDF` element by calling the `Document` object's `createElement` method. Pass a string value that represents the element's name. Cast the return value to `Element`. Set a value for the `PDF` element by calling its `setAttribute` method. Append the `PDF` element to the `PDFsFromBookmarks` element by calling the `PDFsFromBookmarks` element's `appendChild` method. Pass the `PDF` element object as an argument. The following lines of code shows this application logic:

      ` Element PDF = (Element)document.createElement("PDF");  PDF.setAttribute("source","AssemblerResultPDF.pdf");  PDFsFromBookmarks.appendChild(PDF);`

1. Convert the DDX document.

    * Create a `javax.xml.transform.Transformer` object by invoking the `javax.xml.transform.Transformer` object's static `newInstance` method.
    * Create a `Transformer` object by invoking the `TransformerFactory` object's `newTransformer` method.
    * Create a `ByteArrayOutputStream` object by using its constructor.
    * Create a `javax.xml.transform.dom.DOMSource` object by using its constructor. Pass the `org.w3c.dom.Document` object that represents the DDX document.
    * Create a `javax.xml.transform.dom.DOMSource` object by using its constructor and passing the `ByteArrayOutputStream` object.
    * Populate the Java `ByteArrayOutputStream` object by invoking the `javax.xml.transform.Transformer` object's `transform` method. Pass the `javax.xml.transform.dom.DOMSource` and the `javax.xml.transform.stream.StreamResult` objects.
    * Create a byte array and allocate the size of the `ByteArrayOutputStream` object to the byte array.
    * Populate the byte array by invoking the `ByteArrayOutputStream` object's `toByteArray` method.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the byte array.

1. Reference a PDF document to disassemble.

    * Create a `java.util.Map` object that is used to store input PDF documents by using a `HashMap` constructor.
    * Create a `java.io.FileInputStream` object by using its constructor and passing the location of the PDF document to disassemble.
    * Create a `com.adobe.idp.Document` object. Pass the `java.io.FileInputStream` object that contains the PDF document to disassemble.
    * Add an entry to the `java.util.Map` object by invoking its `put` method and passing the following arguments:

        * A string value that represents the key name. This value must match the value of the PDF source element specified in the DDX document. (In the DDX document that is dynamically created, the value is `AssemblerResultPDF.pdf`.)
        * A `com.adobe.idp.Document` object that contains the PDF document to disassemble.

1. Set run-time options.

    * Create an `AssemblerOptionSpec` object that stores run-time options by using its constructor.
    * Set run-time options to meet your business requirements by invoking a method that belongs to the `AssemblerOptionSpec` object. For example, to instruct the Assembler service to continue processing a job when an error occurs, invoke the `AssemblerOptionSpec` object's `setFailOnError` method and pass `false`.

1. Disassemble the PDF document.

   Invoke the `AssemblerServiceClient` object's `invokeDDX` method and pass the following values:

    * A `com.adobe.idp.Document` object that represents the dynamically created DDX document
    * A `java.util.Map` object that contains the PDF document to disassemble
    * A `com.adobe.livecycle.assembler.client.AssemblerOptionSpec` object that specifies the run-time options, including the default font and the job log level

   The `invokeDDX` method returns a `com.adobe.livecycle.assembler.client.AssemblerResult` object that contains the disassembled PDF documents and any exceptions that occurred.

1. Save the disassembled PDF documents.

   To obtain the disassembled PDF documents, perform the following actions:

    * Invoke the `AssemblerResult` object's `getDocuments` method. This method returns a `java.util.Map` object.
    * Iterate through the `java.util.Map` object until you find the resultant `com.adobe.idp.Document` object.
    * Invoke the `com.adobe.idp.Document` object's `copyToFile` method to extract the PDF document.

**See also**

[Quick Start (SOAP mode): Dynamically creating a DDX document using the Java API](/help/forms/developing/assembler-service-java-api-quick.md#quick-start-soap-mode-dynamically-creating-a-ddx-document-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

## Dynamically create a DDX document using the web service API {#dynamically-create-a-ddx-document-using-the-web-service-api}

Dynamically create a DDX document and disassemble a PDF document by using the Assembler Service API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition when setting a service reference: `http://localhost:8080/soap/services/AssemblerService?WSDL&lc_version=9.0.1`.

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

1. Create the DDX document.

    * Create a `System.Xml.XmlElement` object by using its constructor.
    * Create the DDX document's root element by invoking the `XmlElement` object's `CreateElement` method. This method creates an `Element` object that represents the root element. Pass a string value representing the name of the element to the `CreateElement` method. Set a value for the DDX element by calling its `SetAttribute` method. Finally, append the element to the DDX document by calling the `XmlElement` object's `AppendChild` method. Pass the DDX object as an argument. The following lines of code show this application logic:

      ` System.Xml.XmlElement root = ddx.CreateElement("DDX");  root.SetAttribute("xmlns", "https://ns.adobe.com/DDX/1.0/");  ddx.AppendChild(root);`

    * Create the DDX document's `PDFsFromBookmarks` element by calling the `XmlElement` object's `CreateElement` method. Pass a string value representing the name of the element to the `CreateElement` method. Next, set a value for the element by calling its `SetAttribute` method. Append the `PDFsFromBookmarks` element to the root element by calling the `DDX` element's `AppendChild` method. Pass the `PDFsFromBookmarks` element object as an argument. The following lines of code show this application logic:

      ` XmlElement PDFsFromBookmarks = ddx.CreateElement("PDFsFromBookmarks");  PDFsFromBookmarks.SetAttribute("prefix", "stmt");  root.AppendChild(PDFsFromBookmarks);`

    * Create the DDX document's `PDF` element by calling the `XmlElement` object's `CreateElement` method. Pass a string value representing the name of the element to the `CreateElement` method. Next, set a value for the child element by calling its `SetAttribute` method. Append the `PDF` element to the `PDFsFromBookmarks` element by calling the `PDFsFromBookmarks` element's `AppendChild` method. Pass the `PDF` element object as an argument. The following lines of code shows this application logic:

      ` XmlElement PDF = ddx.CreateElement("PDF");  PDF.SetAttribute("source", "AssemblerResultPDF.pdf");  PDFsFromBookmarks.AppendChild(PDF);`

1. Convert the DDX document.

    * Create a `System.IO.MemoryStream` object by using its constructor.
    * Populate the `MemoryStream` object with the DDX document by using the `XmlElement` object that represents the DDX document. Invoke the `XmlElement` object's `Save` method and pass the `MemoryStream` object.
    * Create a byte array and populate it with data in the `MemoryStream` object. The following code shows this application logic:

      ` int bufLen = Convert.ToInt32(stream.Length);  byte[] byteArray = new byte[bufLen];  stream.Position = 0;  int count = stream.Read(byteArray, 0, bufLen);`

    * Create a `BLOB` object. Assign the byte array to the `BLOB` object's `MTOM` field.

1. Reference a PDF document to disassemble.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store the input PDF document. This `BLOB` object is passed to the `invokeOneDocument` as an argument.
    * Create a `System.IO.FileStream` object by invoking its constructor. Pass a string value that represents the file location of the input PDF document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object's `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` property the contents of the byte array.

1. Set run-time options.

    * Create an `AssemblerOptionSpec` object that stores run-time options by using its constructor.
    * Set run-time options to meet your business requirements by assigning a value to a data member that belongs to the `AssemblerOptionSpec` object. For example, to instruct the Assembler service to continue processing a job when an error occurs, assign `false` to the `AssemblerOptionSpec` object's `failOnError` data member.

1. Disassemble the PDF document.

   Invoke the `AssemblerServiceClient` object's `invokeDDX` method and pass the following values:

    * A `BLOB` object that represents the dynamically created DDX document
    * The `mapItem` array that contains the input PDF document
    * An `AssemblerOptionSpec` object that specifies run-time options

   The `invokeDDX` method returns an `AssemblerResult` object that contains the results of the job and any exceptions that occurred.

1. Save the disassembled PDF documents.

   To obtain the newly created PDF documents, perform the following actions:

    * Access the `AssemblerResult` object's `documents` field, which is a `Map` object that contains the disassembled PDF documents.
    * Iterate through the `Map` object to obtain each resultant document. Then, cast that array member's `value` to a `BLOB`.
    * Extract the binary data that represents the PDF document by accessing its `BLOB` object's `MTOM` property. This returns an array of bytes that you can write out to a PDF file.

**See also**

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

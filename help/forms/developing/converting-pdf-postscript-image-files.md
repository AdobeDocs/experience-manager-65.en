---
title: Converting PDF to Postscript andImage Files
description: Use the Convert PDF service to convert PDF documents to PostScript and to several image formats (JPEG, JPEG 2000, PNG, and TIFF) using the Java API and Web Service API.
contentOwner: admin
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations
role: Developer
exl-id: 31730c24-46c3-4111-9391-ccd4342740e9
solution: Experience Manager, Experience Manager Forms
feature: "Adaptive Forms,  Document Services, API"
---
# Converting PDF to Postscript and Image Files {#converting-pdf-to-postscript-andimage-files} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

**About the Convert PDF Service**

The Convert PDF service converts PDF documents to PostScript and to several image formats (JPEG, JPEG 2000, PNG, and TIFF). Converting a PDF document to PostScript is useful for unattended server-based printing on any PostScript printer. Converting a PDF document to a multipage TIFF file is practical when archiving documents in content management systems that do not support PDF documents.

You can accomplish these tasks using the Convert PDF service:

* Convert PDF documents to PostScript.
* Convert PDF documents to image formats.

>[!NOTE]
>
>For more information about the Convert PDF service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

## Converting PDF Documents to PostScript {#converting-pdf-documents-to-postscript}

This topic describes how you can use the Convert PDF Service API (Java and web service) to programmatically convert PDF documents to PostScript files. The PDF document that is converted to a PostScript file must be a non-interactive PDF document. That is, if you attempt to convert an interactive PDF document to a PostScript file, an exception is thrown.

>[!NOTE]
>
>For more information about the Convert PDF service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary-of-steps}

To convert a PDF document to a PostScript file, perform the following steps:

1. Include project files.
1. Create a Convert PDF service client.
1. Reference the PDF document to convert to a PostScript file.
1. Set conversion run-time options.
1. Convert the PDF document to a PostScript file.
1. Save the PostScript file.

**Include project files**

Include the necessary files into your development project. If you are creating a client application by using Java, include the necessary JAR files. If you are using web services, make sure you include the proxy files.

**Create a Convert PDF client**

Before you can programmatically perform a Convert PDF service operation, you must create a Convert PDF service client. If you are using the Java API, create a `ConvertPdfServiceClient` object. If you are using the web service API, create a `ConvertPDFServiceService` object.

This section uses web service functionality that is introduced in AEM Forms. To access new functionality, you have to construct your proxy object using the `lc_version` attribute. (See "Accessing new functionality using web services" in [Invoking AEM Forms using Web Services](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-web-services).)

**Reference the PDF document to convert to a PostScript file**

Reference the PDF document that you want to convert to a PostScript file. As stated earlier in this topic, the PDF document must be a non-interactive PDF document. If you attempt to convert an interactive PDF document to a PostScript file, an exception is thrown.

**Set conversion run-time options**

When converting a PDF document to a PostScript file, you can define run-time options that specify the PostScript type that is created. For example, you can define a level 3 PostScript file.

Typically, the generated PostScript file will reflect the size of input PDF document. If you select the `ShrinkToFit` option (which shrinks the output of the PostScript file to fit the page), you will not see a difference between the input PDF document and the generated PostScript file. The `ShrinkToFit` option takes effect only if you select to print on a smaller page size than the input PDF document. To select a smaller page size, define the `PageSize` option. In addition, it is recommended that you set the `RotateAndCenter` option to `true` to obtain the correct PostScript output.

Likewise, if you select the `ExpandToFit` option (which expands the output of the PostScript file to fit the page), it takes effect only if you select to print on a larger page size than the input PDF document. To select a larger page size, define the `PageSize` option. In addition, it is recommended that you set the `RotateAndCenter` option to `true` to obtain the correct PostScript output.

>[!NOTE]
>
>For information about the run-time values that you can set, see the `ToPSOptionsSpec` class reference in [AEM Forms API Reference](https://www.adobe.com/go/learn_aemforms_javadocs_63_en).

**Convert the PDF document to a PostScript file**

After you create the service client and set run-time options, you can invoke the PostScript conversion operation. This operation will need information about the document to convert, including the preferred PostScript level for the target document.

**Save the PostScript file**

After you convert the PDF document to PostScript, you can save the output as a PostScript file.

**See also**

[Convert a PDF document to PS using the Java API](converting-pdf-postscript-image-files.md#convert-a-pdf-document-to-ps-using-the-java-api)

[Convert a PDF document to PS using the web service API](converting-pdf-postscript-image-files.md#convert-a-pdf-document-to-ps-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Convert PDF Service API Quick Starts](/help/forms/developing/convert-pdf-service-java-api.md#convert-pdf-service-java-api-quick-start-soap)

### Convert a PDF document to PS using the Java API {#convert-a-pdf-document-to-ps-using-the-java-api}

Convert a PDF document to PostScript by using the Convert PDF Service API (Java):

1. Include project files.

   Include client JAR files, such as adobe-convertpdf-client.jar, in your Java project's class path.

1. Create a Convert PDF client.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create a `ConvertPdfServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Reference the PDF document to convert to a PostScript file.

    * Create a `java.io.FileInputStream` object by using its constructor and pass a string value that specifies the location of the PDF document to convert.
    * Create a `com.adobe.idp.Document` object that stores the PDF document by using the `com.adobe.idp.Document` constructor. Pass the `java.io.FileInputStream` object that contains the PDF document.

1. Set conversion run-time options.

    * Create a `ToPSOptionsSpec` object by invoking its constructor.
    * Set run-time options by invoking an appropriate method that belongs to the `ToPSOptionsSpec` object. For example, to define the PostScript level that is created, invoke the `ToPSOptionsSpec` object's `setPsLevel` method and pass a `PSLevel` enumeration value that specifies the PostScript level. For information about all run-time values that you can set, see the `ToPSOptionsSpec` class reference in [AEM Forms API Reference](https://www.adobe.com/go/learn_aemforms_javadocs_63_en).

1. Convert the PDF document to a PostScript file.

   Invoke the `ConvertPdfServiceClient`object's `toPS2` method and pass the following values:

    * A `com.adobe.idp.Document` object that represents the PDF document to convert to a PostScript file.
    * A `ToPSOptionsSpec` object that specifies PostScript run-time options.

   The `toPS2` method returns a `Document` object that contains the new PostScript document.

1. Save the PostScript file.

    * Create a `java.io.File` object and ensure that the file name extension is .ps.
    * Invoke the `Document` object's `copyToFile` method to copy the contents of the `Document` object to the file (ensure that you use the `Document` object that was returned by the `toPS2` method).

**See also**

[Summary of steps](converting-pdf-postscript-image-files.md#summary-of-steps)

[Quick Start (SOAP mode): Converting a PDF document to PostScript using the Java API](/help/forms/developing/convert-pdf-service-java-api.md#quick-start-soap-mode-converting-a-pdf-document-to-postscript-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Convert a PDF document to PS using the web service API {#convert-a-pdf-document-to-ps-using-the-web-service-api}

Convert a PDF document to PostScript by using the Convert PDF Service API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/ConvertPDFService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a Convert PDF client.

    * Create a `ConvertPdfServiceClient` object by using its default constructor.
    * Create a `ConvertPdfServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/ConvertPDFService?blob=mtom`.) You do not need to use the `lc_version` attribute. However, specify `?blob=mtom`.
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `ConvertPdfServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object's `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `ConvertPdfServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `ConvertPdfServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.
        * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Reference the PDF document to convert to a PostScript file.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store a PDF document that is converted to a PostScript file.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the PDF document to convert and the mode to open the file in.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object's `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method and passing the byte array, starting position, and stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` field with the contents of the byte array.

1. Set conversion run-time options.

    * Create a `ToPSOptionsSpec` object by invoking its constructor.
    * Set run-time options by assigning a value to the `ToPSOptionsSpec` object's data member. For example, to define the PostScript level that is created, assign a `PSLevel` enumeration value to the `ToPSOptionsSpec` object's `psLevel` data member.

1. Convert the PDF document to a PostScript file.

   Invoke the `GeneratePDFServiceService` object's `toPS2` method and pass the following values:

    * A `BLOB` object that represents the PDF document to convert to a PostScript file
    * A `ToPSOptionsSpec` object that specifies run-time options

   After the conversion is complete, extract the binary data that represents the PostScript document by accessing its `BLOB` object's `MTOM` property. This returns a byte array that you can write out to a PostScript file.

1. Save the PostScript file.

    * Create a `System.IO.FileStream` object by invoking its constructor. Pass a string value that represents the file location of the PS file.
    * Create a byte array that stores the data content of the `BLOB` object that was returned by the `encryptPDFUsingPassword` method. Populate the byte array by getting the value of the `BLOB` object's `MTOM` field.
    * Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.
    * Write the contents of the byte array to the PostScript file by invoking the `System.IO.BinaryWriter` object's `Write` method and passing the byte array.

**See also**

[Summary of steps](converting-pdf-postscript-image-files.md#summary-of-steps)

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

## Converting PDF Documents to Image Formats {#converting-pdf-documents-to-image-formats}

You can use the Convert PDF service to programmatically convert PDF documents to image formats, which include JPEG, JPEG 2000, TIFF, and PNG. By converting a PDF document to an image file, you can use the PDF document as an image file. For example, you can place the image in an enterprise content management system for storage.

When converting a PDF document to an image, the Convert PDF service creates a separate image for each page in the document. That is, if the document has 20 pages, the Convert PDF service creates 20 image files. When converting a PDF document to an image format, you can create individual images for each page within the PDF document or a single image file for the entire PDF document.

>[!NOTE]
>
>For more information about the Convert PDF service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-1}

To convert a PDF document to any of the supported types, perform the following steps:

1. Include project files.
1. Create a Convert PDF service client.
1. Retrieve the PDF document to convert.
1. Set run-time options.
1. Convert the PDF to an image.
1. Retrieve the image files from a collection.

**Include project files**

Include the necessary files into your development project. If you are creating a client application by using Java, include the necessary JAR files. If you are using web services, make sure you include the proxy files.

**Create a Convert PDF client**

Before you can programmatically perform a Convert PDF service operation, you must create a Convert PDF service client. If you are using the Java API, create a `ConvertPdfServiceClient` object. If you are using the web service API, create a `ConvertPDFServiceService` object.

**Retrieve the PDF document to convert**

Retrieve the PDF document to convert to an image. You cannot convert an interactive PDF document to an image. If you attempt to do so, an exception is thrown. To convert an interactive PDF document to an image file, you must flatten the PDF document before you convert it. (See [Flattening PDF Documents](/help/forms/developing/creating-document-output-streams.md#flattening-pdf-documents).)

**Set run-time options**

Set run-time options such as the image format and the resolution values. For information about the run-time values, see the `ToImageOptionsSpec` class reference in [AEM Forms API Reference](https://www.adobe.com/go/learn_aemforms_javadocs_63_en).

**Convert the PDF to an image**

After you create the service client and set run-time options, you can convert the PDF document to an image. A collection object that contains the images is returned.

**Retrieve the image files from a collection**

You can retrieve image files from a collection object that the Convert PDF service returns. Each element in the collection is a `com.adobe.idp.Document` instance (or a `BLOB` instance if you are using web services) that you can save as an image file, such as a JPG file.

The format of the image file is dependent on the `ImageConvertFormat` run-time option. That is, if you set the `ImageConvertFormat` run-time option to `ImageConvertFormat.JPEG`, you can save image files as JPG files.

**See also**

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Convert PDF Service API Quick Starts](/help/forms/developing/convert-pdf-service-java-api.md#convert-pdf-service-java-api-quick-start-soap)

### Convert a PDF document to image files using the Java API {#convert-a-pdf-document-to-image-files-using-the-java-api}

Convert a PDF document to an image format by using the Convert PDF service API (Java):

1. Include project files.

   Include client JAR files, such as adobe-convertpdf-client.jar, in your Java project's class path.

1. Create a Convert PDF client.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create a `ConvertPdfServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Retrieve the PDF document to convert.

    * Create a `java.io.FileInputStream` object that represents the PDF document to convert by using its constructor and passing a string value that specifies the location of the PDF document.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Set run-time options.

    * Create a `ToImageOptionsSpec` object by using its constructor.
    * Invoke methods that belong to this object as required. For example, set the image type by invoking the `setImageConvertFormat` method and passing an `ImageConvertFormat` enum value that specifies the format type.

   >[!NOTE]
   >
   >Setting the `ImageConvertFormat` enumeration value is mandatory.

1. Convert the PDF to an image.

   Invoke the `ConvertPdfServiceClient` object's `toImage2` method and pass the following values:

    * A `com.adobe.idp.Document` object that represents the PDF file to convert.
    * A `com.adobe.livecycle.converpdfservice.client.ToImageOptionsSpec` object that contains the various preferences about the target image format.

   The `toImage2` method returns a `java.util.List` object that contains images. Each element in the collection is a `com.adobe.idp.Document` instance.

1. Retrieve the image files from a collection.

   Iterate through the `java.util.List` object to determine whether images are present. Each element is a `com.adobe.idp.Document` instance. Save the image by invoking the `com.adobe.idp.Document` object's `copyToFile` method and passing a `java.io.File` object.

**See also**

[Quick Start (SOAP mode): Converting a PDF document to JPEG files using the Java API](/help/forms/developing/convert-pdf-service-java-api.md#quick-start-soap-mode-converting-a-pdf-document-to-jpeg-files-using-the-java-api)

### Convert a PDF document to image files using the web service API {#convert-a-pdf-document-to-image-files-using-the-web-service-api}

Convert a PDF document to an image format by using the Convert PDF Service API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/ConvertPDFService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a convert PDF client.

    * Create a `ConvertPdfServiceClient` object by using its default constructor.
    * Create a `ConvertPdfServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/ConvertPDFService?blob=mtom`.) You do not need to use the `lc_version` attribute. However, specify `?blob=mtom`.
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `ConvertPdfServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object's `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `ConvertPdfServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `ConvertPdfServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.
        * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Retrieve the PDF document to convert.

    * Create a `BLOB` object by using its constructor. This `BLOB` object is used to store the PDF form.
    * Create a `System.IO.FileStream` object by invoking its constructor. Pass a string value that specifies the location of the PDF form and the mode to open the file in.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. Determine the size of the byte array by getting the `System.IO.FileStream` object's `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method. Pass the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` field with the contents of the byte array.

1. Set run-time options.

    * Create a `ToImageOptionsSpec` object by using its constructor.
    * Invoke methods that belong to this object as required. For example, set the image type by invoking the `setImageConvertFormat` method and passing an `ImageConvertFormat` enumeration value that specifies the format type.

   >[!NOTE]
   >
   >Setting the `ImageConvertFormat` enumeration value is mandatory.

1. Convert the PDF to an image.

   Invoke the `ConvertPDFServiceService` object's `toImage2` method and pass the following values:

    * A `BLOB` object that represents the file to be converted
    * A `ToImageOptionsSpec` object that contains the various preferences about the target image format

   The `toImage2` method returns a `MyArrayOfBLOB` object that contains the newly created image files.

1. Retrieve the image files from a collection.

    * Determine the number of elements in the `MyArrayOfBLOB` object by getting the value of its `Count` field. Each element is a `BLOB` object that contains the image.
    * Iterate through the `MyArrayOfBLOB` object and save each image file.

**See also**

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

---
title: Validate a DDX document using theweb service API

description: Use the Assembler Service API to validate a DDX document.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/validating_ddx_documents
products: SG_EXPERIENCEMANAGER/6.5/FORMS

role: Developer
exl-id: 069e5b10-ab93-4492-a70d-6a0d462105a6
solution: Experience Manager, Experience Manager Forms

---
# Validate a DDX document using the web service API {#validate-a-ddx-document-using-theweb-service-api} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

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

[Validating DDX Documents](/help/forms/developing/validating-ddx-documents.md#validating-ddx-documents)

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

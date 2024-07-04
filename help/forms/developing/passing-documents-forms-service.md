---
title: Passing Documents to the FormsService

description: Pass a com.adobe.idp.Document object that contains the form design to the Forms service. The Forms service renders the form design in the com.adobe.idp.Document object. 


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/rendering_forms
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations

role: Developer
exl-id: 29c7ebda-407a-464b-a9db-054163f5b737
solution: Experience Manager, Experience Manager Forms

feature: Adaptive Forms,Document Services,APIs & Integrations
---
# Passing Documents to the Forms Service {#passing-documents-to-the-formsservice} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

The AEM Forms service renders interactive PDF forms to client devices, typically web browsers, to collect information from users. An interactive PDF form is based on a form design that is typically saved as an XDP file and created in Designer. As of AEM Forms, you can pass a `com.adobe.idp.Document` object that contains the form design to the Forms service. The Forms service then renders the form design in the `com.adobe.idp.Document` object.

An advantage of passing a `com.adobe.idp.Document` object to the Forms service is that other service operations return a `com.adobe.idp.Document` instance. That is, you can get a `com.adobe.idp.Document` instance from another service operation and render it. For example, assume that an XDP file is stored in a Content Services (deprecated) node named `/Company Home/Form Designs`, as shown in the following illustration.

You can programmatically retrieve Loan.xdp from Content Services (deprecated) (deprecated) and pass the XDP file to the Forms service within a `com.adobe.idp.Document` object.

>[!NOTE]
>
>For more information about the Forms service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

## Summary of steps {#summary-of-steps}

To pass a document obtained from Content Services (deprecated) (deprecated) to the Forms service, perform the following tasks:

1. Include project files.
1. Create a Forms and a Document Management Client API object.
1. Retrieve the form design from Content Services (deprecated).
1. Render the interactive PDF form.
1. Perform an action with the form data stream.

**Include project files**

Include the necessary files in your development project. If you are creating a client application by using Java, include the necessary JAR files. If you are using web services, include the proxy files.

**Create a Forms and a Document Management Client API object**

Before you can programmatically perform a Forms service API operation, create a Forms Client API object. Also, because this workflow retrieves an XDP file from Content Services (deprecated), create a Document Management API object.

**Retrieve the form design from Content Services (deprecated)**

Retrieve the XDP file from Content Services (deprecated) by using the Java or web service API. The XDP file is returned within a `com.adobe.idp.Document` instance (or a `BLOB` instance if you are using web services). You can then pass the `com.adobe.idp.Document` instance to the Forms service.

**Render an interactive PDF form**

To render an interactive form, pass the `com.adobe.idp.Document` instance that was returned from Content Services (deprecated) to the Forms service.

>[!NOTE]
>
>You can pass a `com.adobe.idp.Document` that contains the form design to the Forms service. Two new methods named `renderPDFForm2` and `renderHTMLForm2` accept a `com.adobe.idp.Document` object that contains a form design.

**Perform an action with the form data stream**

Depending on the type of client application, you can write the form to a client web browser or save the form as a PDF file. A web-based application typically writes the form to web browser. However, a desktop application typically saves the form as a PDF file.

**See also**

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Forms Service API Quick Starts](/help/forms/developing/forms-service-api-quick-starts.md#forms-service-api-quick-starts)

## Pass documents to the Forms Service using the Java API {#pass-documents-to-the-forms-service-using-the-java-api}

Pass a document obtained from Content Services (deprecated) by using the Forms service and Content Services (deprecated) API (Java):

1. Include project files

   Include client JAR files, such as adobe-forms-client.jar and adobe-contentservices-client.jar, in your Java project’s class path.

1. Create a Forms and a Document Management Client API object

    * Create a `ServiceClientFactory` object that contains connection properties. (See [Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties).)
    * Create an `FormsServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.
    * Create a `DocumentManagementServiceClientImpl` object by using its constructor and passing the `ServiceClientFactory` object.

1. Retrieve the form design from Content Services (deprecated)

   Invoke the `DocumentManagementServiceClientImpl` object’s `retrieveContent` method and pass the following values:

    * A string value that specifies the store where the content is added. The default store is `SpacesStore`. This value is a mandatory parameter.
    * A string value that specifies the fully qualified path of the content to retrieve (for example, `/Company Home/Form Designs/Loan.xdp`). This value is a mandatory parameter.
    * A string value that specifies the version. This value is an optional parameter, and you can pass an empty string. In this situation, the latest version is retrieved.

   The `retrieveContent` method returns a `CRCResult` object that contains the XDP file. Obtain a `com.adobe.idp.Document` instance by invoking the `CRCResult` object’s `getDocument` method.

1. Render an interactive PDF form

   Invoke the `FormsServiceClient` object’s `renderPDFForm2` method and pass the following values:

    * A `com.adobe.idp.Document` object that contains the form design retrieved from Content Services (deprecated).
    * A `com.adobe.idp.Document` object that contains data to merge with the form. If you do not want to merge data, pass an empty `com.adobe.idp.Document` object.
    * A `PDFFormRenderSpec` object that stores run-time options. This value is an optional parameter, and you can specify `null` if you do not want to specify run-time options.
    * A `URLSpec` object that contains URI values. This value is an optional parameter, and you can specify `null`.
    * A `java.util.HashMap` object that stores file attachments. This value is an optional parameter, and you can specify `null` if you do not want to attach files to the form.

   The `renderPDFForm` method returns a `FormsResult` object that contains a form data stream that must be written to the client web browser.

1. Perform an action with the form data stream

    * Create a `com.adobe.idp.Document` object by invoking the `FormsResult` object ‘s `getOutputContent` method.
    * Get the content type of the `com.adobe.idp.Document` object by invoking its `getContentType` method.
    * Set the `javax.servlet.http.HttpServletResponse` object’s content type by invoking its `setContentType` method and passing the content type of the `com.adobe.idp.Document` object.
    * Create a `javax.servlet.ServletOutputStream` object used to write the form data stream to the client web browser by invoking the `javax.servlet.http.HttpServletResponse` object’s `getOutputStream` method.
    * Create a `java.io.InputStream` object by invoking the `com.adobe.idp.Document` object’s `getInputStream` method.
    * Create a byte array and populate it with the form data stream by invoking the `InputStream` object’s `read` method. Pass the byte array as an argument.
    * Invoke the `javax.servlet.ServletOutputStream` object’s `write` method to send the form data stream to the client web browser. Pass the byte array to the `write` method.

**See also**

[Quick Start (SOAP mode): Passing documents to the Forms Service using the Java API](/help/forms/developing/forms-service-api-quick-starts.md#quick-start-soap-mode-passing-documents-to-the-forms-service-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

## Pass documents to the Forms Service using the web service API {#pass-documents-to-the-forms-service-using-the-web-service-api}

Pass a document obtained from Content Services (deprecated) by using the Forms service and Content Services (deprecated) API (web service):

1. Include project files

   Create a Microsoft .NET project that uses MTOM. Because this client application invokes two AEM Forms services, create two service references. Use the following WSDL definition for the service reference associated with the Forms service: `http://localhost:8080/soap/services/FormsService?WSDL&lc_version=9.0.1`.

   Use the following WSDL definition for the service reference associated with the Document Management service: `http://localhost:8080/soap/services/DocumentManagementService?WSDL&lc_version=9.0.1`.

   Because the `BLOB` data type is common to both service references, fully qualify the `BLOB` data type when using it. In the corresponding web service quick start, all `BLOB` instances are fully qualified.

   >[!NOTE]
   >
   >Replace `localhost`with the IP address of the server hosting AEM Forms. 

1. Create a Forms and a Document Management Client API object

    * Create a `FormsServiceClient` object by using its default constructor.
    * Create a `FormsServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/FormsService?WSDL`). You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `FormsServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object’s `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `FormsServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `FormsServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.

    * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

   >[!NOTE]
   >
   >Repeat these steps for the `DocumentManagementServiceClient`service client.

1. Retrieve the form design from Content Services (deprecated)

   Retrieve content by invoking the `DocumentManagementServiceClient` object’s `retrieveContent` method and passing the following values:

    * A string value that specifies the store where the content is added. The default store is `SpacesStore`. This value is a mandatory parameter.
    * A string value that specifies the fully qualified path of the content to retrieve (for example, `/Company Home/Form Designs/Loan.xdp`). This value is a mandatory parameter.
    * A string value that specifies the version. This value is an optional parameter, and you can pass an empty string. In this situation, the latest version is retrieved.
    * A string output parameter that stores the browse link value.
    * A `BLOB` output parameter that stores the content. You can use this output parameter to retrieve the content.
    * A `ServiceReference1.MyMapOf_xsd_string_To_xsd_anyType` output parameter that stores content attributes.
    * A `CRCResult` output parameter. Instead of using this object, you can use the `BLOB` output parameter to obtain the content.

1. Render an interactive PDF form

   Invoke the `FormsServiceClient` object’s `renderPDFForm2` method and pass the following values:

    * A `BLOB` object that contains the form design retrieved from Content Services (deprecated).
    * A `BLOB` object that contains data to merge with the form. If you do not want to merge data, pass an empty `BLOB` object.
    * A `PDFFormRenderSpec` object that stores run-time options. This value is an optional parameter, and you can specify `null` if you do not want to specify run-time options.
    * A `URLSpec` object that contains URI values. This value is an optional parameter, and you can specify `null`.
    * A `Map` object that stores file attachments. This value is an optional parameter, and you can specify `null` if you do not want to attach files to the form.
    * A long output parameter that is used to store the page count.
    * A string output parameter that is used to store the locale value.
    * A `FormsResult` output parameter that is used to store the interactrive PDF form `.`

   The `renderPDFForm2` method returns a `FormsResult` object that contains the interactive PDF form.

1. Perform an action with the form data stream

    * Create a `BLOB` object that contains form data by getting the value of the `FormsResult` object’s `outputContent` field.
    * Create a `System.IO.FileStream` object by invoking its constructor. Pass a string value that represents the file location of the interactive PDF document and the mode in which to open the file.
    * Create a byte array that stores the content of the `BLOB` object retrieved from the `FormsResult` object. Populate the byte array by getting the value of the `BLOB` object’s `MTOM` data member.
    * Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.
    * Write the contents of the byte array to a PDF file by invoking the `System.IO.BinaryWriter` object’s `Write` method and passing the byte array.

**See also**

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

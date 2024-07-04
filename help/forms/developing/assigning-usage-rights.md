---
title: Assigning Usage Rights

description: Use the Acrobat Reader DC extensions Java Client API and Web Service API to apply and remove usage rights from PDF documents.


contentOwner: admin
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations

role: Developer
exl-id: 6af148eb-427a-4b54-9c5f-8750736882d8
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,Document Services,Reader Extensions
---
# Assigning Usage Rights {#assigning-usage-rights} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

## About the Acrobat Reader DC extensions Service {#about-the-acrobat-reader-dc-extensions-service}

The Acrobat Reader DC extensions service enables your organization to easily share interactive PDF documents by extending the functionality of Adobe Reader. The Acrobat Reader DC extensions service fully supports any PDF document, up to and including PDF 1.7. It works with Adobe Reader 7.0 and later. The service adds usage rights to a PDF document, activating features that are not usually available when a PDF document is opened using Adobe Reader. Third party users do not require additional software or plug-ins to work with the rights-enabled documents.

You can accomplish these tasks using the Acrobat Reader DC extensions service:

* Apply usage rights to PDF documents. For information, see [Applying Usage Rights to PDF Documents](assigning-usage-rights.md#applying-usage-rights-to-pdf-documents).
* Remove usage rights from PDF documents. For information, see [Removing Usage Rights from PDF Documents](assigning-usage-rights.md#removing-usage-rights-from-pdf-documents).
* Retrieve credential details. For information, see [Retrieving Credential Information](assigning-usage-rights.md#retrieving-credential-information).

>[!NOTE]
>
>For more information about the Acrobat Reader DC extensions service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

## Applying Usage Rights to PDF Documents {#applying-usage-rights-to-pdf-documents}

You can apply usage rights to PDF documents using the Acrobat Reader DC extensions Java Client API and web service. Usage rights pertain to functionality that is available by default in Acrobat but not in Adobe Reader, such as the ability to add comments to a form or to fill in form fields and save the form. PDF documents that have usage rights applied to them are called rights-enabled documents. A user who opens a rights-enabled document in Adobe Reader can perform operations that are enabled for that specific document.

>[!NOTE]
>
>When applying usage rights to PDF documents using the `applyUsageRights` method, which is part of the Java API, you can set the `isModeFinal` parameter of the `ReaderExtensionsOptionSpec` object to `false`. This results in the forms processed counter not being updated and an improvement in performance. If you are not concerned about updating the forms processed counter, it is recommended that you set the `isModeFinal` parameter to `false`.

>[!NOTE]
>
>For more information about the Acrobat Reader DC extensions service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary-of-steps}

To apply usage rights to a PDF document, perform the following steps:

1. Include project files.
1. Create a Acrobat Reader DC extensions Client object.
1. Retrieve a PDF document.
1. Specify usage rights to apply.
1. Apply usage rights to the PDF document.
1. Save the rights-enabled PDF document.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, then include the necessary JAR files. If you are using web services, then make sure that you include the proxy files.

**Create a Acrobat Reader DC extensions Client object**

To programmatically perform a Acrobat Reader DC extensionsservice operation, you must create a Acrobat Reader DC extensions service client object. If you are using the Acrobat Reader DC extensions Java API, create a `ReaderExtensionsServiceClient` object. If you are using the Acrobat Reader DC extensions web service API, create a `ReaderExtensionsServiceService` object.

**Retrieve a PDF document**

Retrieve a PDF document to apply usage rights. Rights-enabled PDF documents contain a usage rights dictionary. When Adobe Reader opens a document containing such a dictionary, it enables the usage rights specified in the dictionary for that document only. If the document does not contain a usage rights dictionary, the Acrobat Reader DC extensions service creates one. If it already contains a dictionary, the Acrobat Reader DC extensions service overwrites existing usage rights with the ones you specify. The dictionary specifies which usage rights are enabled. When a user opens the document in Adobe Reader, only the usage rights specified in the dictionary are permitted.

**Specify usage rights to apply**

The usage rights that you can set are determined by a credential that you purchase from Adobe Systems Incorporated. Credentials typically provide permission to set a group of related usage rights, such as those pertaining to interactive forms. Each credential provides the right to create a certain number of rights-enabled PDF documents. An evaluation credential gives the right to create an unlimited number of draft documents.

>[!NOTE]
>
>If you attempt to assign a usage right that is not permitted by your credential, you will cause an exception.

**Apply usage rights to the PDF document**

To apply usage rights to a PDF document, you reference the alias of the credential that you are using to apply usage rights (a credential is typically installed during the installation of AEM Forms). Also you must specify the PDF document to which usage rights is applied. For information abut configuring a credential, see the installing and deploying guide for your application server.

**Save the rights-enabled PDF document**

After the Acrobat Reader DC extensions service applies usage rights to a PDF document, you can save the rights-enabled PDF document as a PDF file.

**See also**

[Apply usage rights using the Java API](assigning-usage-rights.md#apply-usage-rights-using-the-java-api)

[Apply usage rights using the web service API](assigning-usage-rights.md#apply-usage-rights-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Acrobat Reader DC Extensions Service API Quick Starts](/help/forms/developing/acrobat-reader-dc-extensions-service.md#acrobat-reader-dc-extensions-service-java-api-quick-start-soap)

### Apply usage rights using the Java API {#apply-usage-rights-using-the-java-api}

Apply usage rights to a PDF document by using the Acrobat Reader DC Extensions API (Java):

1. Include project files

   Include client JAR files, such as adobe-reader-extensions-client.jar, in your Java project’s class path.

1. Create a Acrobat Reader DC extensions Client object.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create a `ReaderExtensionsServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Retrieve a PDF document.

    * Create a `java.io.FileInputStream` object that represents the PDF document by using its constructor and passing a string value that specifies the location of the PDF document.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Specify usage rights to apply.

    * Create a `UsageRights` object that represents usage rights by using its constructor.
    * For each usage right to apply, invoke a corresponding method that belongs to the `UsageRights` object. For example, to add the `enableFormFillIn` usage right, invoke the `UsageRights` object’s `enableFormFillIn` method and pass `true`. (Repeat this step for each usage right to apply).

1. Apply usage rights to the PDF document.

    * Create a `ReaderExtensionsOptionSpec` object by using its constructor. This object contains run-time options that are required by the Acrobat Reader DC extensions service. When invoking this constructor, you must specify the following values:

        * The `UsageRights` object that contains the usage rights to apply to the document.
        * A string value that specifies a message that a user sees when the rights-enabled PDF document is opened in Adobe Reader 7.x. This message is not displayed in Adobe Reader 8.0.

    * Apply usage rights to the PDF document by invoking the `ReaderExtensionsServiceClient` object’s `applyUsageRights` method and passing the following values:

        * The `com.adobe.idp.Document` object that contains the PDF document to which usage rights is applied.
        * A string value that specifies the alias of the credential that enables you to apply usage rights.
        * A string value that specifies the corresponding password value. (Currently this parameter is ignored. You can pass `null`.)

    * The `ReaderExtensionsOptionSpec` object that contains run-time options.

   The `applyUsageRights` method returns a `com.adobe.idp.Document` object that contains the rights-enabled PDF document.

1. Save the rights-enabled PDF document.

    * Create a `java.io.File` object and ensure that the file extension is .pdf.
    * Invoke the `com.adobe.idp.Document` object’s `copyToFile` method to copy the contents of the `com.adobe.idp.Document` object to the file (ensure that you use the `com.adobe.idp.Document` object that was returned by the `applyUsageRights` method).

**See also**

[Applying Usage Rights to PDF Documents](assigning-usage-rights.md#applying-usage-rights-to-pdf-documents)

[Quick Start (SOAP mode):Applying usage rights using the Java API](/help/forms/developing/acrobat-reader-dc-extensions-service.md#quick-start-soap-mode-applying-usage-rights-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Apply usage rights using the web service API {#apply-usage-rights-using-the-web-service-api}

Apply usage rights to a PDF document by using the Acrobat Reader DC Extensions API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/ReaderExtensionsService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a Acrobat Reader DC extensions Client object.

    * Create a `ReaderExtensionsServiceClient` object by using its default constructor.
    * Create a `ReaderExtensionsServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/ReaderExtensionsService?blob=mtom`. Ensure you specify `?blob=mtom`.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `ReaderExtensionsServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object’s `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `ReaderExtensionsServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `ReaderExtensionsServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.
        * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Retrieve a PDF document.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store a PDF document to which a usage rights is applied.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the PDF document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object’s `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object’s `Read` method. Pass the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` property with the contents of the byte array.

1. Specify usage rights to apply.

    * Create a `UsageRights` object that represents usage rights by using its constructor.
    * For each usage right to apply, assign the value `true` to the corresponding data member that belongs to the `UsageRights` object. For example, to add the `enableFormFillIn` usage right, assign `true` to the `UsageRights` object’s `enableFormFillIn` data member. (Repeat this step for each usage right to apply).

1. Apply usage rights to the PDF document.

    * Create a `ReaderExtensionsOptionSpec` object by using its constructor. This object contains run-time options that are required by the Acrobat Reader DC extensions service.
    * Assign the `UsageRights` object to the `ReaderExtensionsOptionSpec` object’s `usageRights` data member.
    * Assign a string value that specifies the message that a user sees when the rights-enabled PDF document is opened in Adobe Reader to the `ReaderExtensionsOptionSpec` object’s `message` data member.
    * Apply usage rights to the PDF document by invoking the `ReaderExtensionsServiceClient` object’s `applyUsageRights` method and passing the following values:

        * The `BLOB` object that contains the PDF document to which usage rights is applied.
        * A string value that specifies the alias of the credential that enables you to apply usage rights.
        * A string value that specifies the corresponding password value. (Currently this parameter is ignored. You can pass `null`.)

    * The `ReaderExtensionsOptionSpec` object that contains run-time options.

   The `applyUsageRights` method returns a `BLOB` object that contains the rights-enabled PDF document.

1. Save the rights-enabled PDF document.

    * Create a `System.IO.FileStream` object by invoking its constructor. Pass a string value that represents the file location of the rights-enabled PDF document.
    * Create a byte array that stores the data content of the `BLOB` object that was returned by the `applyUsageRights` method. Populate the byte array by getting the value of the `BLOB` object’s `MTOM` data member.
    * Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.
    * Write the contents of the byte array to a PDF file by invoking the `System.IO.BinaryWriter` object’s `Write` method and passing the byte array.

**See also**

[Applying Usage Rights to PDF Documents](assigning-usage-rights.md#applying-usage-rights-to-pdf-documents)

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

## Removing Usage Rights from PDF Documents {#removing-usage-rights-from-pdf-documents}

You can remove usage rights from a rights-enabled document. Removing usage-rights from a rights-enabled PDF document is also necessary to perform other AEM Forms operations on it. For example, you must digitally sign (or certify) a PDF document before you set usage rights. Therefore if you want to perform operations on a rights-enabled document, you must remove usage rights from the PDF document, perform the other operations, such as digitally signing the document, and then re-apply usage rights to the document.

>[!NOTE]
>
>For more information about the Acrobat Reader DC extensions service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-1}

To remove usage rights from a rights-enabled PDF document, perform the following steps:

1. Include project files.
1. Create a Acrobat Reader DC extensions Client object.
1. Retrieve a rights-enabled PDF document.
1. Remove usage rights from the PDF document.
1. Save the PDF document.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, then include the necessary JAR files. If you are using web services, then make sure that you include the proxy files.

**Create a Acrobat Reader DC extensions Client object**

Before you can programmatically perform a Acrobat Reader DC extensions service operation, you must create a Acrobat Reader DC extensions service client object. If you are using the Java API, create a `ReaderExtensionsServiceClient` object. If you are using the Acrobat Reader DC extensions web service API, create a `ReaderExtensionsServiceService` object.

**Retrieve a rights-enabled PDF document**

Retrieve a rights-enabled PDF document to remove usage rights.

**Remove usage rights from the PDF document**

After you retrieve a rights-enabled PDF document, you can remove usage rights. After you remove usage rights, the PDF document will not have any additional functionality while viewed within Adobe Reader.

**Save the PDF document**

You can save the PDF document that no longer contains usage-rights as a PDF file. Once saved as a PDF file, the PDF document can be viewed in Adobe Reader or Acrobat.

**See also**

[Remove usage rights using the Java API](assigning-usage-rights.md#remove-usage-rights-using-the-java-api)

[Remove usage rights using the web service API](assigning-usage-rights.md#remove-usage-rights-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Acrobat Reader DC Extensions Service API Quick Starts](/help/forms/developing/acrobat-reader-dc-extensions-service.md#acrobat-reader-dc-extensions-service-java-api-quick-start-soap)

[Applying Usage Rights to PDF Documents](assigning-usage-rights.md#applying-usage-rights-to-pdf-documents)

### Remove usage rights using the Java API {#remove-usage-rights-using-the-java-api}

Remove usage rights from a rights-enabled PDF document by using the Acrobat Reader DC extensions API (Java):

1. Include project files.

   Include client JAR files, such as adobe-reader-extensions-client.jar, in your Java project’s class path.

1. Create a Acrobat Reader DC extensions Client object.

   Create a `ReaderExtensionsServiceClient` object by using its constructor and passing a `ServiceClientFactory` object that contains connection properties.

1. Retrieve a PDF document.

    * Create a `java.io.FileInputStream` object that represent the rights-enabled PDF document by using its constructor and passing a string value that specifies the location of the PDF document.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Remove usage rights from the PDF document.

   Remove usage rights from the PDF document by invoking the `ReaderExtensionsServiceClient` object’s `removeUsageRights` method and passing the `com.adobe.idp.Document` object that contains the rights-enabled PDF document. This method returns a `com.adobe.idp.Document` object that contains a PDF document that does not have usage rights.

1. Apply usage rights to the PDF document.

    * Create a `java.io.File` object and ensure that the file extension is .PDF.
    * Invoke the `Document` object’s `copyToFile` method to copy the contents of the `Document` object to the file (ensure that you use the `Document` object that was returned by the `removeUsageRights` method).

**See also**

[Removing Usage Rights from PDF Documents](assigning-usage-rights.md#removing-usage-rights-from-pdf-documents)

[Quick Start (SOAP mode): Removing usage rights from a PDF document using the Java API](/help/forms/developing/acrobat-reader-dc-extensions-service.md#quick-start-soap-mode-removing-usage-rights-from-a-pdf-document-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Remove usage rights using the web service API {#remove-usage-rights-using-the-web-service-api}

Remove usage rights from a rights-enabled PDF document by using the Acrobat Reader DC extensions API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/ReaderExtensionsService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a Acrobat Reader DC extensions Client object.

    * Create a `ReaderExtensionsServiceClient` object by using its default constructor.
    * Create a `ReaderExtensionsServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/ReaderExtensionsService?blob=mtom`. Ensure you specify `?blob=mtom`.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `ReaderExtensionsServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object’s `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `ReaderExtensionsServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `ReaderExtensionsServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.
        * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Retrieve a PDF document.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store the rights-enabled PDF document from which usage rights are removed.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the PDF document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object’s `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object’s `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` property with the contents of the byte array.

1. Remove usage rights from the PDF document.

   Remove usage rights from the PDF document by invoking the `ReaderExtensionsServiceClient` object’s `removeUsageRights` method and passing the `BLOB` object that contains the rights-enabled PDF document. This method returns a `BLOB` object that contains a PDF document that does not have usage rights.

1. Apply usage rights to the PDF document.

    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the PDF file location.
    * Create a byte array that stores the data content of the `BLOB` object that was returned by the `removeUsageRights` method. Populate the byte array by getting the value of the `BLOB` object’s `MTOM` data member.
    * Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.

**See also**

[Removing Usage Rights from PDF Documents](assigning-usage-rights.md#removing-usage-rights-from-pdf-documents)

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

## Retrieving Credential Information {#retrieving-credential-information}

You can retrieve information about the credential that was used to apply usage rights to a rights-enabled PDF document. By retrieving information about a credential, you can obtain information such as the date after which the certificate is no longer valid.

>[!NOTE]
>
>For more information about the Acrobat Reader DC extensions service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-2}

To retrieve information about the credential that was used to apply usage rights to a PDF document, perform the following steps:

1. Include project files.
1. Create a Acrobat Reader DC extensions Client object.
1. Retrieve a rights-enabled PDF document.
1. Retrieve information about the credential.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, then include the necessary JAR files. If you are using web services, then make sure that you include the proxy files.

**Create a Acrobat Reader DC extensions Client object**

Before you can programmatically perform a Acrobat Reader DC extensions service operation, you must create a Acrobat Reader DC extensions service client object. If you are using the Java API, create a `ReaderExtensionsServiceClient` object. If you are using the Acrobat Reader DC extensions web service API, create a `ReaderExtensionsServiceService` object.

**Retrieve a rights-enabled PDF document**

Retrieve a rights-enabled PDF document to retrieve information about the credential. You can also retrieve information about a credential by specifying its alias; however, if you want to retrieve information about a credential that was used to apply usage rights to a specific rights-enabled PDF document, then you must retrieve the document.

**Retrieve information about the credential**

After you retrieve a rights-enabled PDF document, you can obtain information about the credential that was used to apply usage rights to it. You can obtain the following information about the credential:

* The message that is displayed within Adobe Reader when the rights-enabled PDF document is opened.
* The date after which the credential is no longer valid.
* The date before which the credential is not valid.
* The usage rights that were set for this rights-enabled PDF document.
* The number of times that the credential has been used.

**See also**

[Remove usage rights using the Java API](assigning-usage-rights.md#remove-usage-rights-using-the-java-api)

[Remove usage rights using the web service API](assigning-usage-rights.md#remove-usage-rights-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Acrobat Reader DC Extensions Service API Quick Starts](/help/forms/developing/acrobat-reader-dc-extensions-service.md#acrobat-reader-dc-extensions-service-java-api-quick-start-soap)

### Retrieve credential information using the Java API {#retrieve-credential-information-using-the-java-api}

Retrieve credential information by using the Acrobat Reader DC extensions API (Java):

1. Include project files.

   Include client JAR files, such as adobe-reader-extensions-client.jar, in your Java project’s class path.

1. Create a Acrobat Reader DC extensions Client object.

   Create a `ReaderExtensionsServiceClient` object by using its constructor and passing a `ServiceClientFactory` object that contains connection properties.

1. Retrieve a PDF document.

    * Create a `java.io.FileInputStream` object that represent the rights-enabled PDF document by using its constructor and passing a string value that specifies the location of the rights-enabled PDF document.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Remove usage rights from the PDF document.

    * Retrieve information about the credential used to apply usage-rights to the PDF document by invoking the `ReaderExtensionsServiceClient` object’s `getDocumentUsageRights` method and passing the `com.adobe.idp.Document` object that contains the rights-enabled PDF document. This method return a `GetUsageRightsResult` object that contains credential information.
    * Retrieve the date after which the credential is no longer valid by invoking the `GetUsageRightsResult` object’s `getNotAfter` method. This method returns a `java.util.Date` object that represents the date after which the credential is no longer valid.
    * Retrieve the message that is displayed in Adobe Reader when the rights-enabled PDF document is opened by invoking the `GetUsageRightsResult` object’s `getMessage` method. This method returns a string value that represents the message.

**See also**

[Retrieving Credential Information](assigning-usage-rights.md#retrieving-credential-information)

[Quick Start (SOAP mode): Retrieving credential information using the Java API](/help/forms/developing/acrobat-reader-dc-extensions-service.md#quick-start-soap-mode-retrieving-credential-information-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Retrieve credential information using the web service API {#retrieve-credential-information-using-the-web-service-api}

Retrieve credential information using the Acrobat Reader DC extensions API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/ReaderExtensionsService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a Acrobat Reader DC extensions Client object.

    * Create an `ReaderExtensionsServiceClient` object by using its default constructor.
    * Create a `ReaderExtensionsServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/ReaderExtensionsService?blob=mtom`. Ensure you specify `?blob=mtom`.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `ReaderExtensionsServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object’s `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `ReaderExtensionsServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `ReaderExtensionsServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.
        * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Retrieve a PDF document.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store a rights-enabled PDF document.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the rights-enabled PDF document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object’s `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object’s `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` property with the contents of the byte array.

1. Remove usage rights from the PDF document.

    * Retrieve information about the credential used to apply usage-rights to the PDF document by invoking the `ReaderExtensionsServiceClient` object’s `getDocumentUsageRights` method and passing the `com.adobe.idp.Document` object that contains the rights-enabled PDF document. This method returns a `GetUsageRightsResult` object that contains credential information.
    * Retrieve the date after which the credential is no longer valid by getting the value of the `GetUsageRightsResult` object’s `notAfter` data member. The data type of this data member is `System.DateTime`.
    * Retrieve the message that is displayed when the rights-enabled PDF document is opened in Adobe Reader by getting the value of the `GetUsageRightsResult` object’s `message` data member. The data type of this data member is a string.
    * Retrieve the number of times that the credential is used by getting the value of the `GetUsageRightsResult` object’s `useCount` data member. The data type of this data member is an integer.

**See also**

[Retrieving Credential Information](assigning-usage-rights.md#retrieving-credential-information)

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

---
title: Rendering Rights-Enabled Forms

description: Use the Forms service to render forms that have usage rights applied to them. You can render rights-enabled forms using the Java API and Web Service API.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/rendering_forms
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations

role: Developer
exl-id: 012a3a9f-542c-4ed1-a092-572bfccbdf21
solution: Experience Manager, Experience Manager Forms

---
# Rendering Rights-Enabled Forms {#rendering-rights-enabled-forms}

The Forms service can render forms that have usage rights applied to them. Usage rights pertain to functionality that is available by default in Acrobat but not in Adobe Reader, such as the ability to add comments to a form or to fill in form fields and save the form. Forms that have usage rights applied to them are called rights-enabled forms. A user who opens a rights-enabled form in Adobe Reader can perform operations that are enabled for that form.

To apply usage rights to a form, the Acrobat Reader DC extensions service must be part of your AEM forms installation. Also, you must have a valid credential that enables you to apply usage rights to PDF documents. That is, you must properly configure the Acrobat Reader DC extensions service before you can render a rights-enabled form. (See [About the Acrobat Reader DC extensions Service](/help/forms/developing/assigning-usage-rights.md#about-the-acrobat-reader-dc-extensions-service).)

>[!NOTE]
>
>To render a form that contains usage rights, you must use an XDP file as input, not a PDF file. If you use a PDF file as input, the form is still rendered; however, it will not be a rights-enabled form.

>[!NOTE]
>
>You cannot prepopulate a form with XML data when you specify the following usage rights: `enableComments`, `enableCommentsOnline`, `enableEmbeddedFiles`, or `enableDigitalSignatures`. (See [Prepopulating Forms with Flowable Layouts](/help/forms/developing/prepopulating-forms-flowable-layouts.md).)

>[!NOTE]
>
>For more information about the Forms service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

## Summary of steps {#summary-of-steps}

To render a rights-enabled form, perform the following tasks:

1. Include project files.
1. Create a Forms Client API object.
1. Set usage rights run-time options.
1. Render a rights-enabled form.
1. Write the rights-enabled form to the client web browser.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, include the necessary JAR files. If you are using web services, ensure that you include the proxy files.

**Create a Forms Client API object**

Before you can programmatically perform a Forms service Client API operation, you must create a Forms service client.

**Set usage rights run-time options**

Set usage rights run-time options to render a rights-enabled form. Specify the alias of the credential that is used to apply usage rights to a form. After you specify the alias value, you specify each usage right to apply to the form.

**Render a rights-enabled form**

To render a rights-enabled form, you use the same application logic as rendering a form without usage rights. The only difference is that you must ensure that the usage rights run-time options are included in your application logic.

>[!NOTE]
>
>When rendering a rights-enabled form using the Forms web service API, you cannot attach files to the form.

**Write the form data stream to the client web browser**

When the Forms service renders a rights-enabled form, it returns a form data stream that you must write to the client web browser. Once written to the client web browser, the form is visible to the user. A user viewing the rights-enabled form in Adobe Reader is able to perform operations that are enabled for that form.

**See also**

[Render rights-enabled forms using the Java API](#render-rights-enabled-forms-using-the-java-api)

[Render rights-enabled forms using the web service API](#render-rights-enabled-forms-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Forms Service API Quick Starts](/help/forms/developing/forms-service-api-quick-starts.md#forms-service-api-quick-starts)

[Rendering Interactive PDF Forms](/help/forms/developing/rendering-interactive-pdf-forms.md)

[Creating Web Applications that Renders Forms](/help/forms/developing/creating-web-applications-renders-forms.md)

### Render rights-enabled forms using the Java API {#render-rights-enabled-forms-using-the-java-api}

Render a rights-enabled form by using the Forms API (Java):

1. Include project files

   Include client JAR files, such as adobe-forms-client.jar, in your Java project's class path.

1. Create a Forms Client API object

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create an `FormsServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Set usage rights run-time options

    * Create a `ReaderExtensionSpec` object by using its constructor.
    * Specify the alias of the credential by invoking the `ReaderExtensionSpec` object's `setReCredentialAlias` method and specify a string value that represents the alias value.
    * Set each usage right by invoking the corresponding method that belongs to the `ReaderExtensionSpec` object. However, you can only set a usage right if the credential that you reference lets you do so. That is, you cannot set a usage right if the credential does not let you set it. For example. to set the usage right that enables a user to fill in form fields and save the form, invoke the `ReaderExtensionSpec` object's `setReFillIn` method and pass `true`.

   >[!NOTE]
   >
   >It is not necessary to invoke the `ReaderExtensionSpec` object's `setReCredentialPassword` method. This method is not used by the Forms service.

1. Render a rights-enabled form

   Invoke the `FormsServiceClient` object's `renderPDFFormWithUsageRights` method and pass the following values:

    * A string value that specifies the form design name, including the file name extension. If you reference a form design that is part of a Forms application, ensure that you specify the complete path, such as `Applications/FormsApplication/1.0/FormsFolder/Loan.xdp`.
    * A `com.adobe.idp.Document` object that contains data to merge with the form. If you do not want to merge data, pass an empty `com.adobe.idp.Document` object.
    * A `PDFFormRenderSpec` object that stores run-time options.
    * A `ReaderExtensionSpec` object that stores usage rights run-time options.
    * A `URLSpec` object that contains URI values that are required by the Forms service.

   The `renderPDFFormWithUsageRights` method returns a `FormsResult` object that contains a form data stream that must be written to the client web browser.

1. Write the form data stream to the client web browser

    * Create a `com.adobe.idp.Document` object by invoking the `FormsResult` object 's `getOutputContent` method.
    * Get the content type of the `com.adobe.idp.Document` object by invoking its `getContentType` method.
    * Set the `javax.servlet.http.HttpServletResponse` object's content type by invoking its `setContentType` method and passing the content type of the `com.adobe.idp.Document` object.
    * Create a `javax.servlet.ServletOutputStream` object used to write the form data stream to the client web browser by invoking the `javax.servlet.http.HttpServletResponse` object's `getOutputStream` method.
    * Create a `java.io.InputStream` object by invoking the `com.adobe.idp.Document` object's `getInputStream` method.
    * Create a byte array populate it with the form data stream by invoking the `InputStream` object's `read` method and passing the byte array as an argument.
    * Invoke the `javax.servlet.ServletOutputStream` object's `write` method to send the form data stream to the client web browser. Pass the byte array to the `write` method.

**See also**

[Quick Start (SOAP mode): Rendering a rights-enabled form using the Java API](/help/forms/developing/forms-service-api-quick-starts.md#quick-start-soap-mode-rendering-a-rights-enabled-form-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

## Render rights-enabled forms using the web service API {#render-rights-enabled-forms-using-the-web-service-api}

Render a rights-enabled form by using the Forms API (web service):

1. Include project files

    * Create Java proxy classes that consume the Forms service WSDL.
    * Include the Java proxy classes into your class path.

1. Create a Forms Client API object

   Create a `FormsService` object and set authentication values.

1. Set usage rights run-time options

    * Create a `ReaderExtensionSpec` object by using its constructor.
    * Specify the alias of the credential by invoking the `ReaderExtensionSpec` object's `setReCredentialAlias` method and specify a string value that represents the alias value.
    * Set each usage right by invoking the corresponding method that belongs to the `ReaderExtensionSpec` object. However, you can only set a usage right if the credential that you reference lets you do so. That is, you cannot set a usage right if the credential does not let you set it. To set the usage right that enables a user to fill in form fields and save the form, invoke the `ReaderExtensionSpec` object's `setReFillIn` method and pass `true`.

1. Render a rights-enabled form

   Invoke the `FormsService` object's `renderPDFFormWithUsageRights` method and pass the following values:

    * A string value that specifies the form design name, including the file name extension. If you reference a form design that is part of a Forms application, ensure that you specify the complete path, such as `Applications/FormsApplication/1.0/FormsFolder/Loan.xdp`.
    * A `BLOB` object that contains data to merge with the form. If you do not want to merge data with the form, you must pass a `BLOB` object that is based on an empty XML data source. You cannot pass a `BLOB` object that is null; otherwise, an exception is thrown.
    * A `PDFFormRenderSpec` object that stores run-time options.
    * A `ReaderExtensionSpec` object that stores usage rights run-time options.
    * A `URLSpec` object that contains URI values that are required by the Forms service.

   The `renderPDFFormWithUsageRights` method returns a `FormsResult` object that contains a form data stream that must be written to the client web browser.

1. Write the form data stream to the client web browser

    * Create a `BLOB` object that contains form data by invoking the `FormsResult` object's `getOutputContent` method.
    * Get the content type of the `BLOB` object by invoking its `getContentType` method.
    * Set the `javax.servlet.http.HttpServletResponse` object's content type by invoking its `setContentType` method and passing the content type of the `BLOB` object.
    * Create a `javax.servlet.ServletOutputStream` object used to write the form data stream to the client web browser by invoking the `javax.servlet.http.HttpServletResponse` object's `getOutputStream` method.
    * Create a byte array and populate it by invoking the `BLOB` object's `getBinaryData` method. This task assigns the content of the `FormsResult` object to the byte array.
    * Invoke the `javax.servlet.http.HttpServletResponse` object's `write` method to send the form data stream to the client web browser. Pass the byte array to the `write` method.

**See also**

[Rendering Rights-Enabled Forms](#rendering-rights-enabled-forms)

[Invoking AEM Forms using Base64 encoding](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-base64-encoding)

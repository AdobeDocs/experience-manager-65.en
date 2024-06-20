---
title: Rendering Forms at the Client

description: Optimize the delivery of PDF content and improve the Forms service’s ability to handle network load by using the client-side rendering capability of Acrobat or Adobe Reader


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/rendering_forms
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations

role: Developer
exl-id: e485980d-f200-46b7-9284-c9996003aa47
solution: Experience Manager, Experience Manager Forms

---
# Rendering Forms at the Client {#rendering-forms-at-the-client} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

## Rendering Forms at the Client {#rendering-forms-at-the-client-inner}

You can optimize the delivery of PDF content and improve the Forms service’s ability to handle network load by using the client-side rendering capability of Acrobat or Adobe Reader. This process is known as rendering a form at the client. To render a form at the client, the client device (typically a web browser) must use Acrobat 7.0 or Adobe Reader 7.0 or later.

Changes to a form resulting from server-side script execution is not reflected in a form that is rendered at the client unless the root subform contains the `restoreState` attribute that is set to `auto`. For more information about this attribute, see [Forms Designer.](https://www.adobe.com/go/learn_aemforms_designer_63)

>[!NOTE]
>
>For more information about the Forms service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary-of-steps}

To render a form at the client, perform the following tasks:

1. Include project files.
1. Create a Forms Client API object.
1. Set client rendering run-time options.
1. Render a form at the client.
1. Write the form to the client web browser.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, include the necessary JAR files. If you are using web services, ensure that you include the proxy files.

**Create a Forms Client API object**

Before you can programmatically perform a Forms service Client API operation, you must create a Forms service client. If you are using the Java API, create a `FormsServiceClient` object. If you are using the Forms web service API, create a `FormsService` object.

**Set client rendering run-time options**

Set the client rendering run-time option to render a form at the client by setting the `RenderAtClient` run-time option to `true`. This results in the form being delivered to the client device where it is rendered. If `RenderAtClient` is `auto` (the default value), the form design determines whether the form is rendered at the client. The form design must be a form design with a flowable layouyt.

An optional run-time option that you may set is the `SeedPDF` option. The `SeedPDF` option combines the PDF container (seed PDF document) with the form design and the XML data. Both the form design and the XML data are delivered to Acrobat or Adobe Reader, where the form is rendered. The `SeedPDF` option can be used when the client computer does not have fonts that are used in the form, such as when an end user is not licensed to use a font that the form owner is licensed to use.

You can use Designer to create a simple dynamic PDF file for use as a seed PDF file. The following steps are required to perform this task:

1. Determine whether you need to embed any fonts within the seed PDF file. The seed PDF file must contain additional fonts required by the form being rendered. When embedding fonts into the seed PDF file, ensure that you are not violating any font licensing agreements. In Designer, you can determine whether you can legally embed fonts. Upon saving, if there are fonts you cannot embed into the form, Designer displays a message listing the fonts you cannot embed. This message is not displayed in Designer for static PDF documents.
1. If you are creating the seed PDF file in Designer, it is recommended that, at a minimum, you add a text field that contains a message. The message should be directed at users of earlier versions of Adobe Reader stating that they need Acrobat 7.0 or later or Adobe Reader 7.0 or later to view the document.
1. Save the seed PDF file as a dynamic PDF file with the PDF file name extension.

>[!NOTE]
>
>You do not need to define the seed PDF run-time option to render a form on the client. If you do not specify a seed PDF, the Forms service creates a shell pdf which will not contain COS objects but will contain a PDF wrapper with the actual XDP content embedded inside. The steps in this section do not set the seed PDF run-time option. For information about COS objects, see the Adobe PDF Reference guide.

**Render a form at the client**

To render a form at the client, you must ensure that the client rendering run-time options are included in your application logic to render a form.

**Write the form data stream to the client web browser**

The Forms service creates a form data stream that you must write to the client web browser. When written to the client web browser, the form is rendered by Acrobat 7.0 or Adobe Reader 7.0 or later, and is visible to the user.

**See also**

[Render a form at the client using the Java API](#render-a-form-at-the-client-using-the-java-api)

[Render a form at the client using the web service API](#render-a-form-at-the-client-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Forms Service API Quick Starts](/help/forms/developing/forms-service-api-quick-starts.md#forms-service-api-quick-starts)

[Passing Documents to the Forms Service](/help/forms/developing/passing-documents-forms-service.md)

[Creating Web Applications that Renders Forms](/help/forms/developing/creating-web-applications-renders-forms.md)

### Render a form at the client using the Java API {#render-a-form-at-the-client-using-the-java-api}

Render a form at the client by using the Forms API (Java):

1. Include project files

   Include client JAR files, such as adobe-forms-client.jar, in your Java project’s class path.

1. Create a Forms Client API object

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create an `FormsServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Set client rendering run-time options

    * Create a `PDFFormRenderSpec` object by using its constructor.
    * Set the `RenderAtClient` run-time option by invoking the `PDFFormRenderSpec` object’s `setRenderAtClient` method and passing the enum value `RenderAtClient.Yes`.

1. Render a form at the client

   Invoke the `FormsServiceClient` object’s `renderPDFForm` method and pass the following values:

    * A string value that specifies the form design name, including the file name extension. If you reference a form design that is part of a AEM Forms application, ensure that you specify the complete path, such as `Applications/FormsApplication/1.0/FormsFolder/Loan.xdp`.
    * A `com.adobe.idp.Document` object that contains data to merge with the form. If you do not want to merge data, pass an empty `com.adobe.idp.Document` object.
    * A `PDFFormRenderSpec` object that stores run-time options required to render a form at the client.
    * A `URLSpec` object that contains URI values that are required by the Forms service to render a form.
    * A `java.util.HashMap` object that stores file attachments. This is an optional parameter and you can specify `null` if you do not want to attach files to the form.

   The `renderPDFForm` method returns a `FormsResult` object that contains a form data stream that must be written to the client web browser.

1. Write the form data stream to the client web browser

    * Create a `com.adobe.idp.Document` object by invoking the `FormsResult` object ‘s `getOutputContent` method.
    * Get the content type of the `com.adobe.idp.Document` object by invoking its `getContentType` method.
    * Set the `javax.servlet.http.HttpServletResponse` object’s content type by invoking its `setContentType` method and passing the content type of the `com.adobe.idp.Document` object.
    * Create a `javax.servlet.ServletOutputStream` object used to write the form data stream to the client web browser by invoking the `javax.servlet.http.HttpServletResponse` object’s `getOutputStream` method.
    * Create a `java.io.InputStream` object by invoking the `com.adobe.idp.Document` object’s `getInputStream` method.
    * Create a byte array and populate it with the form data stream by invoking the `InputStream` object’s `read` method and passing the byte array as an argument.
    * Invoke the `javax.servlet.ServletOutputStream` object’s `write` method to send the form data stream to the client web browser. Pass the byte array to the `write` method.

**See also**

[Quick Start (SOAP mode): Rendering a form at the client using the Java API](/help/forms/developing/forms-service-api-quick-starts.md#quick-start-soap-mode-rendering-a-form-at-the-client-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Render a form at the client using the web service API {#render-a-form-at-the-client-using-the-web-service-api}

Render a form at the client by using the Forms API (web service):

1. Include project files

    * Create Java proxy classes that consume the Forms service WSDL.
    * Include the Java proxy classes into your class path.

1. Create a Forms Client API object

   Create a `FormsService` object and set authentication values.

1. Set client rendering run-time options

    * Create a `PDFFormRenderSpec` object by using its constructor.
    * Set the `RenderAtClient` run-time option by invoking the `PDFFormRenderSpec` object’s `setRenderAtClient` method and passing the string value `RenderAtClient.Yes`.

1. Render a form at the client

   Invoke the `FormsService` object’s `renderPDFForm` method and pass the following values:

    * A string value that specifies the form design name, including the file name extension. If you reference a form design that is part of a Forms application, ensure that you specify the complete path, such as `Applications/FormsApplication/1.0/FormsFolder/Loan.xdp`.
    * A `BLOB` object that contains data to merge with the form. If you do not want to merge data, pass `null`. (See [Prepopulating Forms with Flowable Layouts](/help/forms/developing/prepopulating-forms-flowable-layouts.md).)
    * A `PDFFormRenderSpec` object that stores run-time options required to render a form at the client.
    * A `URLSpec` object that contains URI values that are required by the Forms service.
    * A `java.util.HashMap` object that stores file attachments. This is an optional parameter and you can specify `null` if you do not want to attach files to the form.
    * An empty `com.adobe.idp.services.holders.BLOBHolder` object that is populated by the method. This parameter is used to store the rendered PDF form.
    * An empty `javax.xml.rpc.holders.LongHolder` object that is populated by the method. (This argument will store the number of pages in the form).
    * An empty `javax.xml.rpc.holders.StringHolder` object that is populated by the method. (This argument will store the locale value).
    * An empty `com.adobe.idp.services.holders.FormsResultHolder` object that will contain the results of this operation.

   The `renderPDFForm` method populates the `com.adobe.idp.services.holders.FormsResultHolder` object that is passed as the last argument value with a form data stream that must be written to the client web browser.

1. Write the form data stream to the client web browser

    * Create a `FormResult` object by getting the value of the `com.adobe.idp.services.holders.FormsResultHolder` object’s `value` data member.
    * Create a `BLOB` object that contains form data by invoking the `FormsResult` object’s `getOutputContent` method.
    * Get the content type of the `BLOB` object by invoking its `getContentType` method.
    * Set the `javax.servlet.http.HttpServletResponse` object’s content type by invoking its `setContentType` method and passing the content type of the `BLOB` object.
    * Create a `javax.servlet.ServletOutputStream` object used to write the form data stream to the client web browser by invoking the `javax.servlet.http.HttpServletResponse` object’s `getOutputStream` method.
    * Create a byte array and populate it by invoking the `BLOB` object’s `getBinaryData` method. This task assigns the content of the `FormsResult` object to the byte array.
    * Invoke the `javax.servlet.http.HttpServletResponse` object’s `write` method to send the form data stream to the client web browser. Pass the byte array to the `write` method.

**See also**

[Rendering Forms at the Client](#rendering-forms-at-the-client)

[Invoking AEM Forms using Base64 encoding](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-base64-encoding)

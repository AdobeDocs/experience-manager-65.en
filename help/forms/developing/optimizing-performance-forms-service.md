---
title: Optimizing the Performance of theForms Service

description: Set run-time options when rendering a form and store XDP files in the repository to optimize the performance of the Forms service.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/rendering_forms
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations

role: Developer
exl-id: 5a746c6c-bf6e-4b25-ba7c-a35edb1f55f3
solution: Experience Manager, Experience Manager Forms

---
# Optimizing the Performance of the Forms Service {#optimizing-the-performance-of-theforms-service} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

## Optimizing the Performance of the Forms Service {#optimizing-the-performance-of-the-forms-service}

When rendering a form, you can set run-time options that will optimize the performance of the Forms service. Another task that you can perform to improve the performance of the Forms service is to store XDP files in the repository. However, this section does not describe how to perform this task. (See [Invoking a service using a Java client library](/help/forms/developing/invoking-aem-forms-using-java.md#invoking-a-service-using-a-java-client-library).)

>[!NOTE]
>
>For more information about the Forms service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary-of-steps}

To optimize the performance of the Forms service while rendering a form, perform the following tasks:

1. Include project files.
1. Create a Forms Client API object.
1. Set performance run-time options.
1. Render the form.
1. Write the form data stream to the client web browser.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, include the necessary JAR files. If you are using web services, ensure that you include the proxy files.

**Create a Forms Client API object**

Before you can programmatically perform a Forms service Client API operation, you must create a Forms service client. If you are using the Java API, create a `FormsServiceClient` object. If you are using the Forms web service API, create a `FormsService` object.

**Set performance run-time options**

You can set the following performance run-time options to improve the performance of the Forms service:

* **Form caching**: You can cache a form that is rendered as PDF in the server cache. Each form is cached after it is generated for the first time. On a subsequent render, if the cached form is newer than the form design’s timestamp, the form is retrieved from the cache. By caching forms, you improve the performance of the Forms service because it does not have to retrieve the form design from a repository.
* Form Guides (deprecated) may take longer to render than other transformation types. It is recommended that you cache form Guides (deprecated) to improve performance.
* **Standalone option**: If you do not require the Forms service to perform server-side calculations, you can set the Standalone option to `true`, which results in forms being rendered without state information. State information is necessary if you want to render an interactive form to an end user who then enters information into the form and submits the form back to the Forms service. The Forms service then performs a calculation operation and renders the form back to the user with the results displayed in the form. If a form without state information is submitted back to the Forms service, only the XML data is available and server-side calculations are not performed.
* **Linearized PDF**: A linearized PDF file is organized to enable efficient incremental access in a network environment. The PDF file is valid PDF in all respects, and is compatible with all existing viewers and other PDF applications. That is, a linearized PDF can be viewed while it is still being downloaded.
* This option does not improve performance when a PDF form is rendered on the client.
* **GuideRSL option**: Enables form Guide (deprecated) generation using run-time shared libraries. This means the first request will download a smaller SWF file, plus larger shared-libraries that are stored in the browser cache. For more information, see RSL in the Flex documentation.
* You can also improve the performance of the Forms service by rendering a form on the client. (See [Rendering Forms at the Client](/help/forms/developing/rendering-forms-client.md).)

**Render the form**

To render the form after setting performance options, you use the same application logic as rendering a form without performance options.

**Write the form data stream to the client web browser**

After the Forms service renders a form, it returns a form data stream that you must write to the client web browser. When written to the client web browser, the form is visible to the user.

**See also**

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Forms Service API Quick Starts](/help/forms/developing/forms-service-api-quick-starts.md#forms-service-api-quick-starts)

[Rendering Interactive PDF Forms](/help/forms/developing/rendering-interactive-pdf-forms.md)

[Rendering Forms as HTML](/help/forms/developing/rendering-forms-html.md)

[Creating Web Applications that Renders Forms](/help/forms/developing/creating-web-applications-renders-forms.md)

### Optimize the performance using the Java API {#optimize-the-performance-using-the-java-api}

Render a form with optimized performance by using the Forms API (Java):

1. Include project files

   Include client JAR files, such as adobe-forms-client.jar, in your Java project’s class path.

1. Create a Forms Client API object

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create an `FormsServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Set performance run-time options

    * Create a `PDFFormRenderSpec` object by using its constructor.
    * Set the form cache option by invoking the `PDFFormRenderSpec` object’s `setCacheEnabled` method and passing `true`.
    * Set the linearized option by invoking the `PDFFormRenderSpec` object’s `setLinearizedPDF` method and passing `true.`

1. Render the form

   Invoke the `FormsServiceClient` object’s `renderPDFForm` method and pass the following values:

    * A string value that specifies the form design name, including the file name extension.
    * A `com.adobe.idp.Document` object that contains data to merge with the form. If you do not want to merge data, pass an empty `com.adobe.idp.Document` object.
    * A `PDFFormRenderSpec` object that stores run-time options to improve performance.
    * A `URLSpec` object that contains URI values that are required by the Forms service.
    * A `java.util.HashMap` object that stores file attachments. This is an optional parameter and you can specify `null` if you do not want to attach files to the form.

   The `renderPDFForm` method returns a `FormsResult` object that contains a form data stream that must be written to the client web browser.

1. Write the form data stream to the client web browser

    * Create a `javax.servlet.ServletOutputStream` object used to send a form data stream to the client web browser.
    * Create a `com.adobe.idp.Document` object by invoking the `FormsResult` object ‘s `getOutputContent` method.
    * Create a `java.io.InputStream` object by invoking the `com.adobe.idp.Document` object’s `getInputStream` method.
    * Create a byte array and populate it with the form data stream by invoking the `InputStream` object’s `read`method and passing the byte array as an argument.
    * Invoke the `javax.servlet.ServletOutputStream` object’s `write` method to send the form data stream to the client web browser. Pass the byte array to the `write` method.

**See also**

[Quick Start (SOAP mode): Optimizing performance using the Java API](/help/forms/developing/forms-service-api-quick-starts.md#quick-start-soap-mode-optimizing-performance-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Optimize the performance using the web service API {#optimize-the-performance-using-the-web-service-api}

Render a form with optimized performance by using the Forms API (web service):

1. Include project files

    * Create Java proxy classes that consume the Forms service WSDL.
    * Include the Java proxy classes into your class path.

1. Create a Forms Client API object

   Create a `FormsService` object and set authentication values.

1. Set performance run-time options

    * Create a `PDFFormRenderSpec` object by using its constructor.
    * Set the form cache option by invoking the `PDFFormRenderSpec` object’s `setCacheEnabled` method and passing true.
    * Set the standalone option by invoking the `PDFFormRenderSpec` object’s `setStandAlone` method and passing true.
    * Set the linearized option by invoking the `PDFFormRenderSpec` object’s `setLinearizedPDF` method and passing true.

1. Render the form

   Invoke the `FormsService` object’s `renderPDFForm` method and pass the following values:

    * A string value that specifies the form design name, including the file name extension.
    * A `BLOB` object that contains data to merge with the form. If you do not want to merge data, pass `null`.
    * A `PDFFormRenderSpecc` object that stores run-time options.
    * A `URLSpec` object that contains URI values that are required by the Forms service.
    * A `java.util.HashMap` object that stores file attachments. This is an optional parameter and you can specify `null` if you do not want to attach files to the form.
    * An empty `com.adobe.idp.services.holders.BLOBHolder` object that is populated by the method. This is used to store the rendered PDF form.
    * An empty `javax.xml.rpc.holders.LongHolder` object that is populated by the method. (This argument will store the number of pages in the form).
    * An empty `javax.xml.rpc.holders.StringHolder` object that is populated by the method. (This argument will store the locale value).
    * An empty `com.adobe.idp.services.holders.FormsResultHolder` object that will contain the results of this operation.

   The `renderPDFForm` method populates the `com.adobe.idp.services.holders.FormsResultHolder` object that is passed as the last argument value with a form data stream that must be written to the client web browser.

1. Write the form data stream to the client web browser

    * Create a `FormResult` object by getting the value of the `com.adobe.idp.services.holders.FormsResultHolder` object’s `value` data member.
    * Create a `javax.servlet.ServletOutputStream` object used to send a form data stream to the client web browser.
    * Create a `BLOB` object that contains form data by invoking the `FormsResult` object’s `getOutputContent` method.
    * Create a byte array and populate it by invoking the `BLOB` object’s `getBinaryData` method. This task assigns the content of the `FormsResult` object to the byte array.
    * Invoke the `javax.servlet.http.HttpServletResponse` object’s `write` method to send the form data stream to the client web browser. Pass the byte array to the `write` method.

**See also**

[Invoking AEM Forms using Base64 encoding](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-base64-encoding)

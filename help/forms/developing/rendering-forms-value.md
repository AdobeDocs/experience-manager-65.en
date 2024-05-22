---
title: Rendering Forms By Value
description: Use the Forms API (Java) to render a form by value using the Java API and Web Service API.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/rendering_forms
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations
role: Developer
exl-id: a3a6a06d-ec90-4147-a5f0-e776a086ee12
solution: Experience Manager, Experience Manager Forms
feature: "Adaptive Forms,  Document Services, API"
---
# Rendering Forms By Value {#rendering-forms-by-value} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

Typically, a form design that is created in Designer is passed by reference to the Forms service. Form designs can be large and, as a result, it is more efficient to pass them by reference to avoid having to marshal form design bytes by value. The Forms service can also cache the form design so that when cached, it does not have to continually read the form design.

If a form design contains a UUID attribute, then it is cached. The UUID value is unique for all form designs and is used to uniquely identify a form. When rendering a form by value, the form should only be cached when it is used repeatedly. However, if the form is not used repeatedly and has to be unique, you can avoid caching the form using caching options that are set using the AEM Forms API.

The Forms service can also resolve the location of linked content within the form design. For example, linked images that are referenced from within the form design are relative URLs. Linked content is always assumed to be relative to the form design location. Therefore, resolving linked content is a matter of determining its location by applying the relative path to the absolute form design location.

Instead of passing a form design by reference, you can pass a form design by value. Passing a form design by value is efficient when a form design is dynamically created; that is, when a client application generates the XML that creates a form design during run-time. In this situation a form design is not stored in a physical repository because it is stored in memory. When dynamically creating a form design at run-time and passing it by value, you can cache the form and improve performance of the Forms service.

**Limitations of passing a form by value**

The following limitations apply when a form design is passed by value:

* No relative linked content can be within the form design. All images and fragments must be embedded inside the form design or referred to absolutely.
* Server-side calculations cannot be performed after the form is rendered. If the form is submitted back to the Forms service, the data is extracted and returned without any server-side calculations.
* Because HTML can only use linked images at run time, it is not possible to generate HTML with embedded images. This is because the Forms service supports embedded images with HTML by retrieving the images from a referenced form design. Because a form design that is passed by value does not have a referenced location, embedded images cannot be extracted when the HTML page is displayed. Therefore, image references must be absolute paths to be rendered in HTML.

>[!NOTE]
>
>Although you can render different types of forms by value (for example, HTML forms or forms that contain usage rights), this section discusses rendering interactive PDF forms.

>[!NOTE]
>
>For more information about the Forms service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

## Summary of steps {#summary-of-steps}

To render a form by value, perform the following steps:

1. Include project files.
1. Create a Forms Client API object.
1. Reference the form design.
1. Render a form by value.
1. Write the form data stream to the client web browser.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, then include the necessary JAR files. If you are using web services, then make sure that you include the proxy files.

**Create a Forms Client API object**

Before you can programmatically import data into a PDF form Client API, you must create a Data Integration service client. When creating a service client, you define connection settings that are required to invoke a service.

**Reference the form design**

When rendering a form by value, you have to create a `com.adobe.idp.Document` object that contains the form design to render. You can reference an existing XDP file or you can dynamically create a form design at run-time and populate a `com.adobe.idp.Document` with that data.

>[!NOTE]
>
>This section and the corresponding quick start references an existing XDP file.

**Render a form by value**

To render a form by value, pass a `com.adobe.idp.Document` instance that contains the form design to the render method's `inDataDoc` parameter (can be any of the `FormsServiceClient` object's render methods such as `renderPDFForm`, `(Deprecated) renderHTMLForm`, and so on). This parameter value is normally reserved for data that is merged with the form. Likewise, pass an empty string value to the `formQuery` parameter. Normally this parameter requires a string value that specifies the name of the form design.

>[!NOTE]
>
>If you want to display data within the form, the data must be specified within the `xfa:datasets` element. For information about XFA architecture, go to [https://www.pdfa.org/norm-refs/XFA-3_3.pdf](https://www.pdfa.org/norm-refs/XFA-3_3.pdf).

**Write the form data stream to the client web browser**

When the Forms service renders a form by value, it returns a form data stream that you must write to the client web browser. When written to the client web browser, the form is visible to the user.

**See also**

[Render a form by value using the Java API](#render-a-form-by-value-using-the-java-api)

[Render a form by value using the web service API](#render-a-form-by-value-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Forms Service API Quick Starts](/help/forms/developing/forms-service-api-quick-starts.md#forms-service-api-quick-starts)

[Passing Documents to the Forms Service](/help/forms/developing/passing-documents-forms-service.md)

[Creating Web Applications that Renders Forms](/help/forms/developing/creating-web-applications-renders-forms.md)

## Render a form by value using the Java API {#render-a-form-by-value-using-the-java-api}

Render a form by value using the Forms API (Java):

1. Include project files

   Include client JAR files, such as adobe-forms-client.jar, in your Java project's class path.

1. Create a Forms Client API object

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create an `FormsServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Reference the form design

    * Create a `java.io.FileInputStream` object that represents the form design to render by using its constructor and passing a string value that specifies the location of the XDP file.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Render a form by value

   Invoke the `FormsServiceClient` object's `renderPDFForm` method and pass the following values:

    * An empty string value. (Normally this parameter requires a string value that specifies the name of the form design.)
    * A `com.adobe.idp.Document` object that contains the form design. Normally this parameter value is reserved for data that is merged with the form.
    * A `PDFFormRenderSpec` object that stores run-time options. This is an optional parameter and you can specify `null` if you do not want to specify run-time options.
    * A `URLSpec` object that contains URI values that are required by the Forms service.
    * A `java.util.HashMap` object that stores file attachments. This is an optional parameter and you can specify `null` if you do not want to attach files to the form.

   The `renderPDFForm` method returns a `FormsResult` object that contains a form data stream that can be written to the client web browser.

1. Write the form data stream to the client web browser

    * Create a `com.adobe.idp.Document` object by invoking the `FormsResult` object 's `getOutputContent` method.
    * Get the content type of the `com.adobe.idp.Document` object by invoking its `getContentType` method.
    * Set the `javax.servlet.http.HttpServletResponse` object's content type by invoking its `setContentType` method and passing the content type of the `com.adobe.idp.Document` object.
    * Create a `javax.servlet.ServletOutputStream` object used to write the form data stream to the client web browser by invoking the `javax.servlet.http.HttpServletResponse` object's `getOutputStream` method.
    * Create a `java.io.InputStream` object by invoking the `com.adobe.idp.Document` object's `getInputStream` method.
    * Create a byte array and allocate the size of the `InputStream` object. Invoke the `InputStream` object's `available` method to obtain the size of the `InputStream` object.
    * Populate the byte array with the form data stream by invoking the `InputStream` object's `read`method and passing the byte array as an argument.
    * Invoke the `javax.servlet.ServletOutputStream` object's `write` method to send the form data stream to the client web browser. Pass the byte array to the `write` method.

**See also**

[Rendering Forms By Value](/help/forms/developing/rendering-forms.md)

[Quick Start (SOAP mode): Rendering by value using the Java API](/help/forms/developing/forms-service-api-quick-starts.md#quick-start-soap-mode-rendering-by-value-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

## Render a form by value using the web service API {#render-a-form-by-value-using-the-web-service-api}

Render a form by value by using the Forms API (web service):

1. Include project files

    * Create Java proxy classes that consume the Forms service WSDL.
    * Include the Java proxy classes into your class path.

1. Create a Forms Client API object

   Create a `FormsService` object and set authentication values.

1. Reference the form design

    * Create a `java.io.FileInputStream` object by using its constructor. Pass a string value that specifies the location of the XDP file.
    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store a PDF document that is encrypted with a password.
    * Create a byte array that stores the content of the `java.io.FileInputStream` object. You can determine the size of the byte array by getting the `java.io.FileInputStream` object's size using its `available` method.
    * Populate the byte array with stream data by invoking the `java.io.FileInputStream` object's `read` method and passing the byte array.
    * Populate the `BLOB` object by invoking its `setBinaryData` method and passing the byte array.

1. Render a form by value

   Invoke the `FormsService` object's `renderPDFForm` method and pass the following values:

    * An empty string value. (Normally this parameter requires a string value that specifies the name of the form design.)
    * A `BLOB` object that contains the form design. Normally this parameter value is reserved for data that is merged with the form.
    * A `PDFFormRenderSpec` object that stores run-time options. This is an optional parameter and you can specify `null` if you do not want to specify run-time options.
    * A `URLSpec` object that contains URI values that are required by the Forms service.
    * A `java.util.HashMap` object that stores file attachments. This is an optional parameter and you can specify `null` if you do not want to attach files to the form.
    * An empty `com.adobe.idp.services.holders.BLOBHolder` object that is populated by the method. This is used to store the rendered PDF form.
    * An empty `javax.xml.rpc.holders.LongHolder` object that is populated by the method. (This argument stores the number of pages in the form.)
    * An empty `javax.xml.rpc.holders.StringHolder` object that is populated by the method. (This argument stores the locale value.)
    * An empty `com.adobe.idp.services.holders.FormsResultHolder` object that will contain the results of this operation.

   The `renderPDFForm` method populates the `com.adobe.idp.services.holders.FormsResultHolder` object that is passed as the last argument value with a form data stream that must be written to the client web browser.

1. Write the form data stream to the client web browser

    * Create a `FormResult` object by getting the value of the `com.adobe.idp.services.holders.FormsResultHolder` object's `value` data member.
    * Create a `BLOB` object that contains form data by invoking the `FormsResult` object's `getOutputContent` method.
    * Get the content type of the `BLOB` object by invoking its `getContentType` method.
    * Set the `javax.servlet.http.HttpServletResponse` object's content type by invoking its `setContentType` method and passing the content type of the `BLOB` object.
    * Create a `javax.servlet.ServletOutputStream` object used to write the form data stream to the client web browser by invoking the `javax.servlet.http.HttpServletResponse` object's `getOutputStream` method.
    * Create a byte array and populate it by invoking the `BLOB` object's `getBinaryData` method. This task assigns the content of the `FormsResult` object to the byte array.
    * Invoke the `javax.servlet.http.HttpServletResponse` object's `write` method to send the form data stream to the client web browser. Pass the byte array to the `write` method.

**See also**

[Rendering Forms By Value](#rendering-forms-by-value)

[Invoking AEM Forms using Base64 encoding](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-base64-encoding)

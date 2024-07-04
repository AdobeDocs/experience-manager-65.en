---
title: Rendering HTML Forms Using Custom CSS Files
description: Use the Forms service to refer to custom CSS files to render HTML forms in response to an HTTP request from a web browser. You can render an HTML form that uses a CSS file using the Java API and Web Service API.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/rendering_forms
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations
role: Developer
exl-id: 5fa385a7-f030-4c0c-8938-0991d02ef361
solution: Experience Manager, Experience Manager Forms

feature: Adaptive Forms,Document Services,APIs & Integrations
---
# Rendering HTML Forms Using Custom CSS Files {#rendering-html-forms-using-custom-css-files} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

The Forms service renders HTML forms in response to an HTTP request from a web browser. When rendering an HTML form, the Forms service can reference a custom CSS file. You can create a custom CSS file to meet your business requirements and reference that CSS file when using the Forms service to render HTML forms.

The Forms service silently parses the custom CSS file. That is, the Forms service does not report errors that may be encountered if the custom CSS file does not comply with CSS standards. In this situation, the Forms service ignores the style and continues with the remaining styles in the CSS file.

The following list specifies styles that are supported in a custom CSS file:

* **Class level selector-style pairs**: If present in a custom CSS file, selectors used in the HTML form as class styles are used. Unused class styles are ignored.
* **Identifier level selector-style pairs**: All identifier styles are used if they are used in the HTML form.
* **Element level selector-style pairs**: All element styles are used if they are used in the HTML form.
* **Style Priority**: Style priority (like important) is supported and can be used in a custom CSS file.
* **Media Type**: One or more selector-style pairs can be wrapped in @media style to define the media type. The Forms service does not check whether the specified media type is supported. The media type specified in the custom CSS file is merged in the HTML form.

You can retrieve a sample CSS file by using the FormsIVS application. Upload the form, select it in the Test Form Design page, and click GenerateCSS. You are not required to set the HTML transformation type before clicking the button. Next select save. You can edit this CSS file to meet your business requirements.

>[!NOTE]
>
>Before rendering an HTML form that uses a custom CSS file, it is important that you have a solid understanding of rendering HTML forms. (See [Rendering Forms as HTML](/help/forms/developing/rendering-forms-html.md).)

>[!NOTE]
>
>For more information about the Forms service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

## Summary of steps {#summary-of-steps}

To render an HTML form that uses a CSS file, perform the following tasks:

1. Include project files.
1. Create a Forms Java API object.
1. Reference the CSS file.
1. Render an HTML form.
1. Write the form data stream to the client web browser.

**Include project files**

Include necessary files in your development project. If you are creating a client application by using Java, include the necessary JAR files. If you are using web services, ensure that you include the proxy files.

**Create a Forms Java API object**

Before you can programmatically perform an operation supported by the Forms service, you must create a Forms client object.

**Reference the CSS file**

To render an HTML form that uses a custom CSS file, ensure that you reference an existing CSS file.

**Render an HTML form**

To render an HTML form, specify a form design that was created in Designer and saved as an XDP file. Select an HTML transformation type. For example, you can specify the HTML transformation type that renders a dynamic HTML for Internet Explorer 5.0 or later.

Rendering an HTML form also requires values, such as URI values needed to render other form types.

**Write the form data stream to the client web browser**

When the Forms service renders an HTML form, it returns a form data stream that you must write to the client web browser to make the HTML form visible to the user.

**See also**

[Render an HTML form that uses a CSS file using the Java API](#render-an-html-form-that-uses-a-css-file-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Forms Service API Quick Starts](/help/forms/developing/forms-service-api-quick-starts.md#forms-service-api-quick-starts)

[Rendering Interactive PDF Forms](/help/forms/developing/rendering-interactive-pdf-forms.md)

[Rendering Forms as HTML](/help/forms/developing/rendering-forms-html.md)

[Creating Web Applications that Renders Forms](/help/forms/developing/creating-web-applications-renders-forms.md)

## Render an HTML form that uses a CSS file using the Java API {#render-an-html-form-that-uses-a-css-file-using-the-java-api}

Render an HTML form that uses a custom CSS file by using the Forms API (Java):

1. Include project files

   Include client JAR files, such as adobe-forms-client.jar, in your Java project's class path.

1. Create a Forms Java API object

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create a `FormsServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Reference the CSS file

    * Create an `HTMLRenderSpec` object by using its constructor.
    * To render the HTML form that uses a custom CSS file, invoke the `HTMLRenderSpec` object's `setCustomCSSURI` method and pass a string value that specifies the location and name of the CSS file.

1. Render an HTML form

   Invoke the `FormsServiceClient` object's `(Deprecated) (Deprecated) renderHTMLForm` method and pass the following values:

    * A string value that specifies the form design name, including the file name extension. If you reference a form design that is part of a Forms application, ensure that you specify the complete path, such as `Applications/FormsApplication/1.0/FormsFolder/Loan.xdp`.
    * A `TransformTo` enum value that specifies the HTML preference type. For example, to render an HTML form that is compatible with dynamic HTML for Internet Explorer 5.0 or later, specify `TransformTo.MSDHTML`.
    * A `com.adobe.idp.Document` object that contains data to merge with the form. If you do not want to merge data, pass an empty `com.adobe.idp.Document` object.
    * The `HTMLRenderSpec` object that stores HTML run-time options.
    * A string value that specifies the `HTTP_USER_AGENT` header value, such as `Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)`.
    * A `URLSpec` object that stores URI values required to render an HTML form.
    * A `java.util.HashMap` object that stores file attachments. This is an optional parameter, and you can specify `null` if you do not want to attach files to the form.

   The `(Deprecated) renderHTMLForm` method returns a `FormsResult` object that contains a form data stream that must be written to the client web browser.

1. Write the form data stream to the client web browser

    * Create a `com.adobe.idp.Document` object by invoking the `FormsResult` object 's `getOutputContent` method.
    * Get the content type of the `com.adobe.idp.Document` object by invoking its `getContentType` method.
    * Set the `javax.servlet.http.HttpServletResponse` object's content type by invoking its `setContentType` method and passing the content type of the `com.adobe.idp.Document` object.
    * Create a `javax.servlet.ServletOutputStream` object used to write the form data stream to the client web browser by invoking the `javax.servlet.h\ttp.HttpServletResponse` object's `getOutputStream` method.
    * Create a `java.io.InputStream` object by invoking the `com.adobe.idp.Document` object's `getInputStream` method.
    * Create a byte array and populate it with the form data stream by invoking the `InputStream` object's `read` method and passing the byte array as an argument.
    * Invoke the `javax.servlet.ServletOutputStream` object's `write` method to send the form data stream to the client web browser. Pass the byte array to the `write` method.

**See also**

[Rendering HTML Forms Using Custom CSS Files](#rendering-html-forms-using-custom-css-files)

[Quick Start (SOAP mode): Rendering an HTML form that uses a CSS file using the Java API](/help/forms/developing/forms-service-api-quick-starts.md#quick-start-soap-mode-rendering-an-html-form-that-uses-a-css-file-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

## Render an HTML form that uses a CSS file using the web service API {#render-an-html-form-that-uses-a-css-file-using-the-web-service-api}

Render an HTML form that uses a custom CSS file by using the Forms API (web service):

1. Include project files

    * Create Java proxy classes that consume the Forms service WSDL.
    * Include the Java proxy classes in your class path.

1. Create a Forms Java API object

   Create a `FormsService` object and set authentication values.

1. Reference the CSS file

    * Create an `HTMLRenderSpec` object by using its constructor.
    * To render the HTML form that uses a custom CSS file, invoke the `HTMLRenderSpec` object's `setCustomCSSURI` method and pass a string value that specifies the location and name of the CSS file.

1. Render an HTML form

   Invoke the `FormsService` object's `(Deprecated) renderHTMLForm` method and pass the following values:

    * A string value that specifies the form design name, including the file name extension. If you reference a form design that is part of a Forms application, ensure that you specify the complete path, such as `Applications/FormsApplication/1.0/FormsFolder/Loan.xdp`.
    * A `TransformTo` enum value that specifies the HTML preference type. For example, to render an HTML form that is compatible with dynamic HTML for Internet Explorer 5.0 or later, specify `TransformTo.MSDHTML`.
    * A `BLOB` object that contains data to merge with the form. If you do not want to merge data, pass `null`. (See [Prepopulating Forms with Flowable Layouts](/help/forms/developing/prepopulating-forms-flowable-layouts.md).)
    * The `HTMLRenderSpec` object that stores HTML run-time options.
    * A string value that specifies the `HTTP_USER_AGENT` header value, such as `Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)`. You can pass an empty string if you do not want to set this value.
    * A `URLSpec` object that stores URI values required to render an HTML form.
    * A `java.util.HashMap` object that stores file attachments. This is an optional parameter, and you can specify `null` if you do not want to attach files to the form.
    * An empty `com.adobe.idp.services.holders.BLOBHolder` object that is populated by the `(Deprecated) renderHTMLForm` method. This parameter value stores the rendered form.
    * An empty `com.adobe.idp.services.holders.BLOBHolder` object that is populated by the `(Deprecated) renderHTMLForm` method. This parameter stores the output XML data.
    * An empty `javax.xml.rpc.holders.LongHolder` object that is populated by the `(Deprecated) renderHTMLForm` method. This argument stores the number of pages in the form.
    * An empty `javax.xml.rpc.holders.StringHolder` object that is populated by the `(Deprecated) renderHTMLForm` method. This argument stores the locale value.
    * An empty `javax.xml.rpc.holders.StringHolder` object that is populated by the `(Deprecated) renderHTMLForm` method. This argument stores the HTML rendering value that is used.
    * An empty `com.adobe.idp.services.holders.FormsResultHolder` object that will contain the results of this operation.

   The `(Deprecated) renderHTMLForm` method populates the `com.adobe.idp.services.holders.FormsResultHolder` object that is passed as the last argument value with a form data stream that must be written to the client web browser.

1. Write the form data stream to the client web browser

    * Create a `FormResult` object by getting the value of the `com.adobe.idp.services.holders.FormsResultHolder` object's `value` data member.
    * Create a `BLOB` object that contains form data by invoking the `FormsResult` object's `getOutputContent` method.
    * Get the content type of the `BLOB` object by invoking its `getContentType` method.
    * Set the `javax.servlet.http.HttpServletResponse` object's content type by invoking its `setContentType` method and passing the content type of the `BLOB` object.
    * Create a `javax.servlet.ServletOutputStream` object used to write the form data stream to the client web browser by invoking the `javax.servlet.http.HttpServletResponse` object's `getOutputStream` method.
    * Create a byte array and populate it by invoking the `BLOB` object's `getBinaryData` method. This task assigns the content of the `FormsResult` object to the byte array.
    * Invoke the `javax.servlet.http.HttpServletResponse` object's `write` method to send the form data stream to the client web browser. Pass the byte array to the `write` method.

**See also**

[Rendering HTML Forms Using Custom CSS Files](#rendering-html-forms-using-custom-css-files)

[Invoking AEM Forms using Base64 encoding](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-base64-encoding)

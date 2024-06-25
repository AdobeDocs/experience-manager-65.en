---
title: Rendering Forms Based on Fragments

description: Use the Forms service to render forms that are based on fragments created using Designer.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/rendering_forms
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations

role: Developer
exl-id: febf5350-3fc5-48c0-8bc5-198daff15936
solution: Experience Manager, Experience Manager Forms

feature: Adaptive Forms,Document Services,APIs & Integrations
---
# Rendering Forms Based on Fragments {#rendering-forms-based-on-fragments} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

## Rendering Forms Based on Fragments {#rendering-forms-based-on-fragments-inner}

The Forms service can render forms that are based on fragments that you create using Designer. A *fragment* is a reusable part of a form and is saved as a separate XDP file that can be inserted into multiple form designs. For example, a fragment can include an address block or legal text.

Using fragments simplifies and speeds up the creation and maintenance of large numbers of forms. When creating a form, you insert a reference to the required fragment and the fragment appears in the form. The fragment reference contains a subform that points to the physical XDP file. For information about creating form designs based on fragments, see [Forms Designer](https://www.adobe.com/go/learn_aemforms_designer_63)

A fragment can include several subforms that are wrapped in a choice subform set. Choice subform sets control the display of subforms based on the flow of data from a data connection. You use conditional statements to determine which subform from within the set appears in the delivered form. For example, each subform in a set can include information for a particular geographic location and the subform that is displayed can be determined based on the location of the user.

A *script fragment* contains reusable JavaScript functions or values that are stored separately from any particular object, such as a date parser or a web service invocation. These fragments include a single script object that appears as a child of variables in the Hierarchy palette. Fragments cannot be created from scripts that are properties of other objects, such as event scripts like validate, calculate, or initialize.

Here are advantages of using fragments:

* **Content reuse**: You can use fragments to reuse content in multiple form designs. When you need to use some of the same content in multiple forms, it is faster and simpler to use a fragment than to copy or re-create the content. Using fragments also ensures that the frequently used parts of a form design have consistent content and appearance in all the referencing forms.
* **Global updates**: You can use fragments to make global changes to multiple forms only once, in one file. You can change the content, script objects, data bindings, layout, or styles in a fragment, and all XDP forms that reference the fragment will reflect the changes.
* For example, a common element across many forms might be an address block that includes a drop-down list object for the country. If you need to update the values for the drop-down list object, you must open many forms to make the changes. If you include the address block in a fragment, you only need to open one fragment file to make the changes.
* To update a fragment in a PDF form, you must resave the form in Designer.
* **Shared form creation**: You can use fragments to share the creation of forms among several resources. Form developers with expertise in scripting or other advanced features of Designer can develop and share fragments that take advantage of scripting and dynamic properties. Form designers can use those fragments to lay out form designs and to ensure that all parts of a form have a consistent appearance and functionality across multiple forms designed by multiple people.

### Assembling a form design assembled using fragments {#assembling-a-form-design-assembled-using-fragments}

You can assemble a form design to pass to the Forms service based on multiple fragments. To assemble multiple fragments, use the Assembler service. To see an example of using the Assemble service to create a form design which is used by another Forms services (the Output service), see [Creating PDF Documents Using Fragments](/help/forms/developing/creating-document-output-streams.md#creating-pdf-documents-using-fragments). Instead of using the Output service, you can perform the same workflow using the Forms service.

When using the Assembler service, you are passing a form design that was assembled using fragments. The form design that was created does not reference other fragments. In contrast, this topic discusses passing a form design that references other fragments to the Forms service. However, the form design was not assembled by Assembler. It was created in Designer.

>[!NOTE]
>
>For more information about the Forms service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

>[!NOTE]
>
>For information about creating a web-based application that renders forms based on fragments, see [Creating Web Applications that Renders Forms](/help/forms/developing/creating-web-applications-renders-forms.md).

### Summary of steps {#summary-of-steps}

To render a form based on fragments, perform the following tasks:

1. Include project files.
1. Create a Forms Client API object.
1. Specify URI values.
1. Render the form.
1. Write the form data stream to the client web browser.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, include the necessary JAR files. If you are using web services, ensure that you include the proxy files.

**Create a Forms Client API object**

Before you can programmatically perform a Forms service Client API operation, you must create a Forms service client.

**Specify URI values**

To successfully render a form based on fragments, you must ensure that the Forms service can locate both the form and the fragments (the XDP files) that the form design references. For example, assume the form is named PO.xdp and this form uses two fragments named FooterUS.xdp and FooterCanada.xdp. In this situation, the Forms service must be able to locate all three XDP files.

You can organize a form and its fragments by placing the form in one location and the fragments in another location, or you can place all XDP files in the same location. For the purposes of this section, assume that all XDP files are in the AEM Forms repository. For information about placing XDP files in the AEM Forms repository, see [Writing Resources](/help/forms/developing/aem-forms-repository.md#writing-resources).

When rendering a form based on fragments, you must reference only the form itself and not the fragments. For example, you must reference PO.xdp and not FooterUS.xdp or FooterCanada.xdp. Ensure that you place the fragments in a location where the Forms service can locate them.

**Render the form**

A form based on fragments can be rendered in the same manner as non-fragmented forms. That is, you can render the form as PDF, HTML, or form Guides (deprecated). The example in this section renders a form based on fragments as an interactive PDF form. (See [Rendering Interactive PDF Forms](/help/forms/developing/rendering-interactive-pdf-forms.md).)

**Write the form data stream to the client web browser**

When the Forms service renders a form, it returns a form data stream that you must write to the client web browser. When written to the client web browser, the form is visible to the user.

**See also**

[Render forms based on fragments using the Java API](#render-forms-based-on-fragments-using-the-java-api)

[Render forms based on fragments using the web service API](#render-forms-based-on-fragments-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Forms Service API Quick Starts](/help/forms/developing/forms-service-api-quick-starts.md#forms-service-api-quick-starts)

[Rendering Interactive PDF Forms](/help/forms/developing/rendering-interactive-pdf-forms.md)

[Creating Web Applications that Renders Forms](/help/forms/developing/creating-web-applications-renders-forms.md)

### Render forms based on fragments using the Java API {#render-forms-based-on-fragments-using-the-java-api}

Render a form based on fragments by using the Forms API (Java):

1. Include project files

   Include client JAR files, such as adobe-forms-client.jar, in your Java project’s class path.

1. Create a Forms Client API object

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create an `FormsServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Specify URI values

    * Create a `URLSpec` object that stores URI values by using its constructor.
    * Invoke the `URLSpec` object’s `setApplicationWebRoot` method and pass a string value that represents the application’s web root.
    * Invoke the `URLSpec` object’s `setContentRootURI` method and pass a string value that specifies the content root URI value. Ensure that the form design and the fragments are in the content root URI. If not, the Forms service throws an exception. To reference the repository, specify `repository://`.
    * Invoke the `URLSpec` object’s `setTargetURL` method and pass a string value that specifies the target URL value to where form data is posted. If you define the target URL in the form design, you can pass an empty string. You can also specify the URL to where a form is sent to perform calculations.

1. Render the form

   Invoke the `FormsServiceClient` object’s `renderPDFForm` method and pass the following values:

    * A string value that specifies the form design name, including the file name extension. If you reference a form design that is part of a Forms application, ensure that you specify the complete path, such as `Applications/FormsApplication/1.0/FormsFolder/Loan.xdp`.
    * A `com.adobe.idp.Document` object that contains data to merge with the form. If you do not want to merge data, pass an empty `com.adobe.idp.Document` object.
    * A `PDFFormRenderSpec` object that stores run-time options.
    * A `URLSpec` object that contains URI values that are required by the Forms service to render a form based on fragments.
    * A `java.util.HashMap` object that stores file attachments. This is an optional parameter and you can specify `null` if you do not want to attach files to the form.

   The `renderPDFForm` method returns a `FormsResult` object that contains a form data stream that must be written to the client web browser.

1. Write the form data stream to the client web browser

    * Create a `com.adobe.idp.Document` object by invoking the `FormsResult` object ‘s `getOutputContent` method.
    * Get the content type of the `com.adobe.idp.Document` object by invoking its `getContentType` method.
    * Set the `javax.servlet.http.HttpServletResponse` object’s content type by invoking its `setContentType` method and passing the content type of the `com.adobe.idp.Document` object.
    * Create a `javax.servlet.ServletOutputStream` object used to write the form data stream to the client web browser by invoking the `javax.servlet.http.HttpServletResponse` object’s `getOutputStream` method.
    * Create a `java.io.InputStream` object by invoking the `com.adobe.idp.Document` object’s `getInputStream` method.
    * Create a byte array populate it with the form data stream by invoking the `InputStream` object’s `read`method and passing the byte array as an argument.
    * Invoke the `javax.servlet.ServletOutputStream` object’s `write` method to send the form data stream to the client web browser. Pass the byte array to the `write` method.

**See also**

[Rendering Forms Based on Fragments](#rendering-forms-based-on-fragments)

[Quick Start (SOAP mode): Rendering a form based on fragments using the Java API](/help/forms/developing/forms-service-api-quick-starts.md#quick-start-soap-mode-rendering-a-form-based-on-fragments-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Render forms based on fragments using the web service API {#render-forms-based-on-fragments-using-the-web-service-api}

Render a form based on fragments using the Forms API (web service):

1. Include project files

    * Create Java proxy classes that consume the Forms service WSDL.
    * Include the Java proxy classes into your class path.

1. Create a Forms Client API object

   Create a `FormsService` object and set authentication values.

1. Specify URI values

    * Create a `URLSpec` object that store URI values by using its constructor.
    * Invoke the `URLSpec` object’s `setApplicationWebRoot` method and pass a string value that represents the application’s web root.
    * Invoke the `URLSpec` object’s `setContentRootURI` method and pass a string value that specifies the content root URI value. Ensure that the form design is in the content root URI. If not, the Forms service throws an exception. To reference the repository, specify `repository://`.
    * Invoke the `URLSpec` object’s `setTargetURL` method and pass a string value that specifies the target URL value to where form data is posted. If you define the target URL in the form design, you can pass an empty string. You can also specify the URL to where a form is sent to perform calculations.

1. Render the form

   Invoke the `FormsService` object’s `renderPDFForm` method and pass the following values:

    * A string value that specifies the form design name, including the file name extension. If you reference a form design that is part of a Forms application, ensure that you specify the complete path, such as `Applications/FormsApplication/1.0/FormsFolder/Loan.xdp`.
    * A `BLOB` object that contains data to merge with the form. If you do not want to merge data, pass `null`.
    * A `PDFFormRenderSpec` object that stores run-time options. The tagged PDF option cannot be set if the input document is a PDF document. If the input file is an XDP file, the tagged PDF option can be set.
    * A `URLSpec` object that contains URI values required by the Forms service.
    * A `java.util.HashMap` object that stores file attachments. This is an optional parameter and you can specify `null` if you do not want to attach files to the form.
    * An empty `com.adobe.idp.services.holders.BLOBHolder` object that is populated by the method. This parameter is used to store the rendered form.
    * An empty `javax.xml.rpc.holders.LongHolder` object that is populated by the method. This argument will store the number of pages in the form.
    * An empty `javax.xml.rpc.holders.StringHolder` object that is populated by the method. This argument will store the locale value.
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

[Rendering Forms Based on Fragments](#rendering-forms-based-on-fragments)

[Invoking AEM Forms using Base64 encoding](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-base64-encoding)

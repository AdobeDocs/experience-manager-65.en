---
title: Rendering Forms

description: Use the Forms service to create interactive data capture client applications that validate, process, transform, and deliver forms typically created in Designer. Form authors can develop a single form design that the Forms service renders in PDF, SWF, or HTML in various browser environments.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/performing_service_operations_using_apis
products: SG_EXPERIENCEMANAGER/6.4/FORMS
topic-tags: operations

role: Developer
exl-id: ec9ccf04-7cec-493a-91ab-0e399a905338
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
---
# Rendering Forms {#rendering-forms} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

**About the Forms service**

The Forms service lets you create interactive data capture client applications that validate, process, transform, and deliver forms typically created in Designer. Form authors can develop a single form design that the Forms service renders in PDF, SWF, or HTML in various browser environments.

When an end-user requests a form, a client application sends the request to the Forms service, which returns the form in an appropriate format. As soon as the Forms service receives a request, it merges data with a form design and then delivers the form in the desired format. The Form service output is an interactive form, typically a PDF document. An interactive form enables users to fill in fields located on the form.

Depending upon the type of client application, you can write the form to a client web browser or save the form as a PDF file. A web-based application can write the form to web browser. A desktop application can save the form as a PDF file. To demonstrate how to write out to a web browser and to a PDF file, the quick starts in the *Rendering Forms* section are organized in the following manner:

* The Java API strongly typed (SOAP mode) examples are a Java servlet.
* The web service (Java Base64) examples are a Java servlet.
* The web service (MTOM) examples are a console application (not all quick starts have an MTOM example).

>[!NOTE]
>
>For information about creating a web application that uses java servlets to invoke the Forms service, see [Creating Web Applications that Renders Forms](/help/forms/developing/creating-web-applications-renders-forms.md).

  You can pass a form design (an XDP file) or a PDF document to the Forms service using one of two ways:

* You can reference the form design using a URL value. This approach involves using a `URLSpec` object. The content root is passed to the Forms service using the `URLSpec` object’s `setContentRootURI` method. The Form design name ( `formQuery`) is passed as a separate parameter. The two values are concatenated to get the absolute reference to the form design. (Most of the quick starts in the *Rendering Forms* section use this approach.)
* You can pass a `com.adobe.idp.Document` that contains the form design to the Forms service. Two new methods named `renderPDFForm2` and `renderHTMLForm2` accept a `com.adobe.idp.Document` object that contains a form design. (See [Passing Documents to the Forms Service](/help/forms/developing/passing-documents-forms-service.md)

You can accomplish these tasks using the Forms service:

* Render interactive PDF forms. (See [Rendering Interactive PDF Forms](/help/forms/developing/rendering-interactive-pdf-forms.md).)
* Render forms at the client. (See [Rendering Forms at the Client](/help/forms/developing/rendering-forms-client.md).)
* Render forms based on fragments. (See [Rendering Forms Based on Fragments](/help/forms/developing/rendering-forms-based-fragments.md).)
* Render rights-enabled forms. (See [Rendering Rights-Enabled Forms](/help/forms/developing/rendering-rights-enabled-forms.md).)
* Render forms as HTML. (See [Rendering Forms as HTML](/help/forms/developing/rendering-forms-html.md).)
* Rendering HTML Forms Using Custom CSS Files ([Rendering HTML Forms Using Custom CSS Files](/help/forms/developing/rendering-html-forms-using-custom.md).)
* Handle submitted forms. (See [Handling Submitted Forms](/help/forms/developing/handling-submitted-forms.md).)
* Creating PDF Documents with Submitted XML Data. (See [Creating PDF Documents with Submitted XML Data](/help/forms/developing/creating-pdf-documents-submitted-xml.md).)
* Prepopulate forms. (See [Prepopulating Forms with Flowable Layouts](/help/forms/developing/prepopulating-forms-flowable-layouts.md).)
* Passing Documents. (See [Passing Documents to the Forms Service](/help/forms/developing/passing-documents-forms-service.md)
* Calculate form data. (See [Calculating Form Data](/help/forms/developing/calculating-form-data.md).)
* Optimize an application. (See [Optimizing the Performance of the Forms Service](/help/forms/developing/optimizing-performance-forms-service.md).)

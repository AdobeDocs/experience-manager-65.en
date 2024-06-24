---
title: Rendering Forms as HTML
description: Use the Forms service to render forms as HTML in response to an HTTP request from a web browser. You can use the Java&trade; API and Web Service API to render forms as HTML.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/rendering_forms
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations
role: Developer
exl-id: e6887e45-a472-41d4-9620-c56fd5b72b4c
solution: Experience Manager, Experience Manager Forms

feature: "Adaptive Forms,Document Services,APIs & Integrations"
---
# Rendering Forms as HTML {#rendering-forms-as-html} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

The Forms service renders forms as HTML in response to an HTTP request from a web browser. A benefit of rendering a form as HTML is that the computer on which the client web browser is located does not require Adobe Reader, Acrobat, or Flash Player (for form Guides (deprecated)).

To render a form as HTML, the form design must be saved as an XDP file. A form design that is saved as a PDF file cannot be rendered as HTML. When developing a form design in Designer that will be rendered as HTML, consider the following criteria:

* Do not use an object's border properties to draw lines, boxes, or grids on your form. Some browsers may not line up borders exactly as they appear in a preview. Objects may appear layered or may push other objects off their expected position.
* You can use lines, rectangles, and circles to define the background.
* Draw text slightly larger than what seems to be required to accommodate the text. Some web browsers do not display the text legibly.

>[!NOTE]
>
>When rendering a form that contains TIFF images using the `FormServiceClient` object's `(Deprecated) renderHTMLForm` and `renderHTMLForm2` methods, the TIFF images are not visible in the rendered HTML form that is displayed in Internet Explorer or Mozilla Firefox browsers. These browsers do not provide native support for TIFF images.

## HTML pages {#html-pages}

When a form design is rendered as an HTML form, each second-level subform is rendered as an HTML page (panel). You can view a subform's hierarchy in Designer. Child subforms that belong to the root subform (the default name of a root subform is form1) are the panel subforms. The following example shows a form design's subforms.

```java
     form1
         Master Pages
         PanelSubform1
             NestedDynamicSubform
                 TextEdit1
         PanelSubform2
             TextEdit1
         PanelSubform3
             TextEdit1
         PanelSubform4
             TextEdit1
```

When form designs are rendered as HTML forms, the panels are not constrained to any particular page size. If you have dynamic subforms, they should be nested within the panel subform. Dynamic subforms are able to expand to an infinite number of HTML pages.

When a form is rendered as an HTML form, page sizes (required for paginating forms rendered as PDF) have no meaning. Because a form with a flowable layout can expand to an infinite number of HTML pages, it is important to avoid footers on the master page. A footer beneath the content area on a master page can overwrite HTML content that flows past a page boundary.

You must explicitly move from panel to panel using the `xfa.host.pageUp` and `xfa.host.pageDown` methods. You change pages by sending a form to the Forms service and having the Forms service render the form back to the client device, typically a web browser.

>[!NOTE]
>
>The process of sending a form to the Forms service and then having the Forms service render the form back to the client device is referred to as round tripping data to the server.

>[!NOTE]
>
>If you want to customize the look of the HTML Digital Signature button on an HTML form, you must change the following properties in the fscdigsig.css file (within the adobe-forms-ds.ear &gt; adobe-forms-ds.war file):

**`.fsc-ds-ssb`**: This style sheet is applicable if there is a blank sign field.

**`.fsc-ds-ssv`**: This style sheet is applicable if there is a Valid sign field.

**`.fsc-ds-ssc`**: This style sheet is applicable if there is a Valid sign field but data has changed.

**`.fsc-ds-ssi`**: This style sheet is applicable if there is a invalid sign field.

**`.fsc-ds-popup-bg`**: This style sheet property is not being used.

**.`fsc-ds-popup-btn`**: This style sheet property is not being used.

## Running scripts {#running-scripts}

A form author specifies whether a script executes on the server or the client. The Forms service creates a distributed, event processing environment for execution of form intelligence that can be distributed between the client and the server by using the `runAt` attribute. For information about this attribute or creating scripts within form designs, see [Forms Designer](https://www.adobe.com/go/learn_aemforms_designer_63)

The Forms service can execute scripts while the form is being rendered. As a result, you can prepopulate a form with data by connecting to a database or to web services that may not be available on the client. You can also set a button's `Click` event to run on the server so that the client will round trip data to the server. This allows the client to run scripts that may require server resources, such as an enterprise database, while a user is interacting with a form. For HTML forms, formcalc scripts can be executed on server only. As a result, you must mark these scripts to run at `server` or `both`.

You can design forms that move between pages (panels) by calling `xfa.host.pageUp` and `xfa.host.pageDown` methods. This script is placed in a button's `Click` event and the `runAt` attribute is set to `Both`. The reason you choose `Both` is so that Adobe Reader or Acrobat (for forms that are rendered as PDF) can change pages without going to the server and HTML forms can change pages by round tripping data to the server. That is, a form is sent to the Forms service, and a form is rendered back as HTML with the new page displayed.

It is recommended that you do not give script variables and form fields the same names such as item. Some web browsers, such as Internet Explorer, may not initialize a variable with the same name as a form field that results in a script error occurring. It is good practice to give form fields and script variables different names.

When rendering HTML forms that contain both page navigation functionality and form scripts (for example, assume that a script retrieves field data from a database each time the form is rendered), ensure that the form script is in the form:calculate event instead in of the form:readyevent.

Form scripts that are in the form:ready event are executed only once during the initial rendering of the form and are not executed for subsequent page retrievals. In contrast, the form:calculate event is executed for each page navigation where the form is rendered.

>[!NOTE]
>
>On a multipage form, changes made by JavaScript to a page are not retained if you move to a different page.

You can invoke custom scripts before submitting a form. This feature works on all available browsers. However, it can be used only when users render the HTML form that has its `Output Type` property set to `Form Body`. It will not work when the `Output Type` is `Full HTML`. Refer to Configuring forms in administration help for steps to configure this feature.

First define a callback function that is called before submitting the form, where the name of the function is `_user_onsubmit`. It is assumed that the function will not throw any exception, or if it does, the exception will be ignored. It is recommended to place the JavaScript function in the head section of the html; however, you can declare it anywhere before the end of the script tags that include `xfasubset.js`.

When formserver renders an XDP that contains a drop-down list, in addition to creating the drop-down list, it also creates two hidden text fields. These text fields store the data of the drop-down list (one stores the display name of the options and other stores the value for the options). Therefore, every time a user submits the form, the entire data of the drop-down list is submitted. Assuming that you do not want to submit that much data everytime, you can write a custom script to disable that. For example: The name of the drop-down list is `drpOrderedByStateProv` and it is wrapped under subform header. The name of the HTML input element will be `header[0].drpOrderedByStateProv[0]`. The name of the hidden fields that store and submit the data of the dropdown have the following names: `header[0].drpOrderedByStateProv_DISPLAYITEMS_[0] header[0].drpOrderedByStateProv_VALUEITEMS_[0]`

You can disable these input elements in the following way if you do not want to post the data. `var __CUSTOM_SCRIPTS_VERSION = 1; //enabling the feature function _user_onsubmit() { var elems = document.getElementsByName("header[0].drpOrderedByStateProv_DISPLAYITEMS_[0]"); elems[0].disabled = true; elems = document.getElementsByName("header[0].drpOrderedByStateProv_VALUEITEMS_[0]"); elems[0].disabled = true; }`

```java
header[0].drpOrderedByStateProv_DISPLAYITEMS_[0] header[0].drpOrderedByStateProv_VALUEITEMS_[0]
```

```java
var __CUSTOM_SCRIPTS_VERSION = 1; //enabling the feature
    function _user_onsubmit() {
    var elems = document.getElementsByName("header[0].drpOrderedByStateProv_DISPLAYITEMS_[0]");
    elems[0].disabled = true;
    elems = document.getElementsByName("header[0].drpOrderedByStateProv_VALUEITEMS_[0]");
    elems[0].disabled = true;
    }
```

## XFA subsets {#xfa-subsets}

When creating form designs to render as HTML, you must restrict your scripting to the XFA subset for scripts inJavaScript language.

Scripts that run on the client or run on both the client and the server must be written within the XFA subset. Scripts that run on the server can use the full XFA scripting model and also use FormCalc. For information about using JavaScript, see [Forms Designer](https://www.adobe.com/go/learn_aemforms_designer_63).

When running scripts on the client, only the current panel being displayed can use script; for example, you cannot script against fields that are in panel A when panel B is displayed. When running scripts on the server, all panels can be accessed.

Be careful when using Scripting Object Model (SOM) expressions within scripts that run on the client. Only a simplified subset of SOM expressions are supported by scripts that run on the client.

## Event timing {#event-timing}

The XFA subset defines the XFA events that are mapped to HTML events. There is a slight difference in behavior on the timing of calculate and validate events. In a web browser, a full calculate event is executed when you exit a field. Calculate events are not automatically executed when you make a change to a field value. You can force a calculate event by calling the `xfa.form.execCalculate` method.

In a web browser, validate events are only executed when exiting a field or submitting a form. You can force a validate event by using the `xfa.form.execValidate` method.

Forms displayed in a web browser (as opposed to Adobe Reader or Acrobat) conform to the XFA null test (errors or warnings) for mandatory fields.

* If the null test produces an error and you exit a field without specifying a value, a message box is displayed and you are repositioned to the field after clicking OK.
* If a null test produces a warning and you exit a field without specifying a value, you are prompted to click either OK or Cancel, giving you the option of proceeding without specifying a value or returning to the field to enter a value.

For more information about a null test, see [Forms Designer](https://www.adobe.com/go/learn_aemforms_designer_63).

## Form buttons {#form-buttons}

Clicking a submit button sends form data to the Forms service and represents the end of form processing. The `preSubmit` event can be set to run on the client or server. The `preSubmit` event runs prior to the form submission if it is configured to run on the client. Otherwise, the `preSubmit` event runs on the server during the form submission. For more information about the `preSubmit` event, see [Forms Designer](https://www.adobe.com/go/learn_aemforms_designer_63).

If a button has no client-side script associated with it, data is submitted to the server, calculations are performed on the server, and the HTML form is regenerated. If a button contains a client-side script, data is not sent to the server and the client-side script is executed in the web browser.

## HTML 4.0 web browser {#html-4-0-web-browser}

A web browser that only supports HTML 4.0 cannot support the XFA subset client-side scripting model. When creating a form design to work in both HTML 4.0 and MSDHTML or CSS2HTML, a script that is marked to run at the client will actually run on the server. For example, assume a user clicks a button that is located on a form displayed in an HTML 4.0 web browser. In this situation, the form data is sent to the server where the client-side script is executed.

It is recommended that you place your form logic in calculate events, which run at the server in HTML 4.0 and on the client for MSDHTML or CSS2HTML.

## Maintaining presentation changes {#maintaining-presentation-changes}

As you move between HTML pages (panels), only the state of the data is maintained. Settings such as background color or mandatory field settings are not maintained (if different from the initial settings). To maintain the presentation state, you must create fields (usually hidden) that represent the presentation state of fields. If you add a script to a field's `Calculate` event that changes the presentation based on hidden field values, you are able to preserve the presentation state as you move back and forth between HTML pages (panels).

The following script maintains the `fillColor` of a field based on the value of `hiddenField`. Assume this script is in a field's `Calculate` event.

```java
     If (hiddenField.rawValue == 1)
         this.fillColor = "255,0,0"
     else
         this.fillColor = "0,255,0"
```

>[!NOTE]
>
>Static objects are not displayed in a rendered HTML form when nested inside a table cell. For example, a circle and rectangle nested inside a table cell are not displayed within a render HTML form. However these same static objects are properly displayed when located outside of the table.

## Digitally signing HTML forms {#digitally-signing-html-forms}

You cannot sign an HTML form that contains a digital signature field if the form is rendered as one of the following HTML transformations:

* AHTML
* HTML4
* StaticHTML
* NoScriptXHTML

For information about digitally signing a document, see [Digitally Signing and Certifying Documents](/help/forms/developing/digitally-signing-certifying-documents.md)

## Rendering an accessibility guidelines-compliant XHTML form {#rendering-an-accessibility-guidelines-compliant-xhtml-form}

You can render a full HTML form that is compliant with accessibility guidelines. That is, the form is rendered within full HTML tags as opposed to the HTML form being rendered within body tags (not a complete HTML page).

## Validating form data {#validating-form-data}

It is recommended that you limit your use of validation rules for form fields when rendering the form as an HTML form. Some validation rules may not be supported for HTML forms. For example, when a validation pattern of MM-DD-YYYY is applied to a `Date/Time` field that is in a form design that is rendered as an HTML form, it does not work properly, even if the date is typed in properly. However, this validation pattern works properly for forms rendered as PDF.

>[!NOTE]
>
>For more information about the Forms service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

## Summary of steps {#summary-of-steps}

To render an HTML form, perform the following steps:

1. Include project files.
1. Create a Forms Client API object.
1. Set HTML run-time options.
1. Render an HTML form.
1. Write the form data stream to the client web browser.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, include the necessary JAR files. If you are using web services, ensure that you include the proxy files.

**Create a Forms Client API object**

Before you can programmatically import data into a PDF formClient API, you must create a Form Data Integration service client. When creating a service client, you define connection settings that are required to invoke a service.

**Set HTML run-time options**

You set HTML run-time options when rendering an HTML form. For example, you can add a toolbar to an HTML form to enable users to select file attachments located on the client computer or to retrieve file attachments that are rendered with the HTML form. By default, an HTML toolbar is disabled. To add a toolbar to an HTML form, you must programmatically set run-time options. By default, an HTML toolbar consists of the following buttons:

* `Home`: Provides a link to the application's web root.
* `Upload`: Provides a user interface to select files to attach to the current form.
* `Download`: Provides a user interface to display the attached files.

When an HTML toolbar appears on an HTML form, a user can select a maximum of ten files to submit along with form data. Once the files are submitted, the Forms service can retrieve the files.

When rendering a form as HTML, you can specify a user-agent value. A user-agent value provides browser and system information. This is an optional value, and you can pass an empty string value. The Rendering an HTML form using the Java API quick start shows how to obtain a user agent value and use it to render a form as HTML.

HTTP URLs to where form data is posted may be specified by setting the target URL using the Forms Service Client API or may be specified in the Submit button contained in the XDP form design. If the target URL is specified in the form design, then do not set a value using the Forms Service Client API.

>[!NOTE]
>
>Rendering an HTML form with a toolbar is optional.

>[!NOTE]
>
>If you render an AHTML form, it is recommended that you do not add a toolbar to the form.

**Render an HTML form**

To render an HTML form, specify a form design that was created in Designer and saved as an XDP file. Select an HTML transformation type. For example, you can specify the HTML transformation type that renders a dynamic HTML for Internet Explorer 5.0 or later.

Rendering an HTML form also requires values, such as URI values that are required to render other form types.

**Write the form data stream to the client web browser**

When the Forms service renders an HTML form, it returns a form data stream that you must write to the client web browser. When written to the client web browser, the HTML form is visible to the user.

**See also**

[Render a form as HTML using the Java API](#render-a-form-as-html-using-the-java-api)

[Render a form as HTML using the web service API](#render-a-form-as-html-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Forms Service API Quick Starts](/help/forms/developing/forms-service-api-quick-starts.md#forms-service-api-quick-starts)

[Rendering Interactive PDF Forms](/help/forms/developing/rendering-interactive-pdf-forms.md)

[Rendering HTML Forms with Custom Toolbars](/help/forms/developing/rendering-html-forms-custom-toolbars.md)

[Creating Web Applications that Renders Forms](/help/forms/developing/creating-web-applications-renders-forms.md)

## Render a form as HTML using the Java API {#render-a-form-as-html-using-the-java-api}

Render an HTML form by using the Forms API (Java):

1. Include project files

   Include client JAR files, such as adobe-forms-client.jar, in your Java project's class path.

1. Create a Forms Client API object

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create an `FormsServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Set HTML run-time options

    * Create an `HTMLRenderSpec` object by using its constructor.
    * To render an HTML form with a toolbar, invoke the `HTMLRenderSpec` object's `setHTMLToolbar` method and pass an `HTMLToolbar` enum value. For example, to display a vertical HTML toolbar, pass `HTMLToolbar.Vertical`.
    * To set the locale value for the HTML form, invoke the `HTMLRenderSpec` object's `setLocale` method and pass a string value that specifies the locale value. (This is an optional setting.)
    * To render the HTML form within full HTML tags, invoke the `HTMLRenderSpec` object's `setOutputType` method and pass `OutputType.FullHTMLTags`. (This is an optional setting.)

   >[!NOTE]
   >
   >Forms are not successfully rendered in HTML when the `StandAlone` option is `true` and the `ApplicationWebRoot` references a server other than the J2EE application server hosting AEM Forms (the `ApplicationWebRoot` value is specified using the `URLSpec` object that is passed to the `FormsServiceClient` object's `(Deprecated) renderHTMLForm` method). When the `ApplicationWebRoot` is another server from the one hosting AEM Forms, the value of the web root URI in the administration console needs to be set as the Form's web application URI value. This can be done by logging in to the administration console, clicking Services &gt; Forms, and setting the Web Root URI as https://server-name:port/FormServer. Then, save your settings.

1. Render an HTML form

   Invoke the `FormsServiceClient` object's `(Deprecated) renderHTMLForm` method and pass the following values:

    * A string value that specifies the form design name, including the file name extension. If you reference a form design that is part of a Forms application, ensure that you specify the complete path, such as `Applications/FormsApplication/1.0/FormsFolder/Loan.xdp`.
    * A `TransformTo` enum value that specifies the HTML preference type. For example, to render an HTML form that is compatible with dynamic HTML for Internet Explorer 5.0 or later, specify `TransformTo.MSDHTML`.
    * A `com.adobe.idp.Document` object that contains data to merge with the form. If you do not want to merge data, pass an empty `com.adobe.idp.Document` object.
    * The `HTMLRenderSpec` object that stores HTML run-time options.
    * A string value that specifies the `HTTP_USER_AGENT` header value; for example, `Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)`.
    * A `URLSpec` object that stores URI values required to render an HTML form.
    * A `java.util.HashMap` object that stores file attachments. This is an optional parameter and you can specify `null` if you do not want to attach files to the form.

   The `(Deprecated) renderHTMLForm` method returns a `FormsResult` object that contains a form data stream that can be written to the client web browser.

1. Write the form data stream to the client web browser

    * Create a `com.adobe.idp.Document` object by invoking the `FormsResult` object 's `getOutputContent` method.
    * Get the content type of the `com.adobe.idp.Document` object by invoking its `getContentType` method.
    * Set the `javax.servlet.http.HttpServletResponse` object's content type by invoking its `setContentType` method and passing the content type of the `com.adobe.idp.Document` object.
    * Create a `javax.servlet.ServletOutputStream` object used to write the form data stream to the client web browser by invoking the `javax.servlet.http.HttpServletResponse` object's `getOutputStream` method.
    * Create a `java.io.InputStream` object by invoking the `com.adobe.idp.Document` object's `getInputStream` method.
    * Create a byte array and populate it with the form data stream by invoking the `InputStream` object's `read` method and passing the byte array as an argument.
    * Invoke the `javax.servlet.ServletOutputStream` object's `write` method to send the form data stream to the client web browser. Pass the byte array to the `write` method.

**See also**

[Rendering Forms as HTML](#rendering-forms-as-html)

[Quick Start (SOAP mode): Rendering an HTML form using the Java API](/help/forms/developing/forms-service-api-quick-starts.md#quick-start-soap-mode-rendering-an-html-form-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

## Render a form as HTML using the web service API {#render-a-form-as-html-using-the-web-service-api}

Render an HTML form by using the Forms API (web service):

1. Include project files

    * Create Java proxy classes that consume the Forms service WSDL.
    * Include the Java proxy classes into your class path.

1. Create a Forms Client API object

   Create a `FormsService` object and set authentication values.

1. Set HTML run-time options

    * Create an `HTMLRenderSpec` object by using its constructor.
    * To render an HTML form with a toolbar, invoke the `HTMLRenderSpec` object's `setHTMLToolbar` method and pass an `HTMLToolbar` enum value. For example, to display a vertical HTML toolbar, pass `HTMLToolbar.Vertical`.
    * To set the locale value for the HTML form, invoke the `HTMLRenderSpec` object's `setLocale` method and pass a string value that specifies the locale value. For more information, see [AEM Forms API Reference](https://www.adobe.com/go/learn_aemforms_javadocs_63_en).
    * To render the HTML form within full HTML tags, invoke the `HTMLRenderSpec` object's `setOutputType` method and pass `OutputType.FullHTMLTags`.

   >[!NOTE]
   >
   >Forms are not successfully rendered in HTML when the `StandAlone` option is `true` and the `ApplicationWebRoot` references a server other than the J2EE application server hosting AEM Forms (the `ApplicationWebRoot` value is specified using the `URLSpec` object that is passed to the `FormsServiceClient` object's `(Deprecated) renderHTMLForm` method). When the `ApplicationWebRoot` is another server from the one hosting AEM Forms, the value of the web root URI in the administration console needs to be set as the Form's web application URI value. This can be done by logging in to the administration console, clicking Services &gt; Forms, and setting the Web Root URI as https://server-name:port/FormServer. Then, save your settings.

1. Render an HTML form

   Invoke the `FormsService` object's `(Deprecated) renderHTMLForm` method and pass the following values:

    * A string value that specifies the form design name, including the file name extension. If you reference a form design that is part of a Forms application, ensure that you specify the complete path, such as `Applications/FormsApplication/1.0/FormsFolder/Loan.xdp`.
    * A `TransformTo` enum value that specifies the HTML preference type. For example, to render an HTML form that is compatible with dynamic HTML for Internet Explorer 5.0 or later, specify `TransformTo.MSDHTML`.
    * A `BLOB` object that contains data to merge with the form. If you do not want to merge data, pass `null`. (See [Prepopulating Forms with Flowable Layouts](/help/forms/developing/prepopulating-forms-flowable-layouts.md#prepopulating-forms-with-flowable-layouts).)
    * The `HTMLRenderSpec` object that stores HTML run-time options.
    * A string value that specifies the `HTTP_USER_AGENT` header value; for example, `Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)`. You can pass an empty string if you do not want to set this value.
    * A `URLSpec` object that stores URI values required to render an HTML form. (See [Specify URI values](/help/forms/developing/rendering-interactive-pdf-forms.md).)
    * A `java.util.HashMap` object that stores file attachments. This is an optional parameter and you can specify `null` if you do not want to attach files to the form. (See [Attach files to the form](/help/forms/developing/rendering-interactive-pdf-forms.md).)
    * An empty `com.adobe.idp.services.holders.BLOBHolder` object that is populated by the method. This parameter value stores the rendered form.
    * An empty `com.adobe.idp.services.holders.BLOBHolder` object that is populated by the method. This parameter will store the output XML data.
    * An empty `javax.xml.rpc.holders.LongHolder` object that is populated by the method. This argument will store the number of pages in the form.
    * An empty `javax.xml.rpc.holders.StringHolder` object that is populated by the method. This argument will store the locale value.
    * An empty `javax.xml.rpc.holders.StringHolder` object that is populated by the method. This argument will store the HTML rendering value that is used.
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

[Rendering Forms as HTML](#rendering-forms-as-html)

[Invoking AEM Forms using Base64 encoding](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-base64-encoding)

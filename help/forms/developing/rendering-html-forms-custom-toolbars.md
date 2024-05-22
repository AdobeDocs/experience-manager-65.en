---
title: Rendering HTML Forms with CustomToolbars

description: Use the Forms service to customize a toolbar that is rendered with an HTML form. You can render an HTML Form with a custom toolbar using the Java API and a Web Service API.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/rendering_forms
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations

role: Developer
exl-id: 0b992b1c-3878-447a-bccc-7034aa3e98bc
solution: Experience Manager, Experience Manager Forms
feature: "Adaptive Forms,  Document Services, API"
---
# Rendering HTML Forms with CustomToolbars {#rendering-html-forms-with-customtoolbars} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

## Rendering HTML Forms with Custom Toolbars {#rendering-html-forms-with-custom-toolbars}

The Forms service lets you customize a toolbar that is rendered with an HTML form. A toolbar can be customized to alter its appearance by overriding default CSS styles and to add dynamic behavior by overriding Java scripts. A toolbar is customized by using an XML file named fscmenu.xml. By default, the Forms service retrieves this file from an internally specified URI location.

>[!NOTE]
>
>This URI location is in the adobe-forms-core.jar file, which is in the adobe-forms-dsc.jar file. The adobe-forms-dsc.jar file is in C:\Adobe\Adobe_Experience_Manager_forms\ folder (C:\ is the installation directory). You can use a file extraction tool, such as Win RAR, to open the adobe.

You can copy the fscmenu.xml from this location, modify it to meet your requirements, and then place it in a custom URI location. Next, using the Forms Service API, set run-time options that result in the Forms service using your fscmenu.xml file from the specified location. These actions result in the Forms service rendering an HTML form that has a custom toolbar.

In addition to the fscmenu.xml file, you also need to obtain the following files:

* fscmenu.js
* fscattachments.js
* fscmenu.css
* fscmenu-v.css
* fscmenu-ie.css
* fscdialog.css

fscJS is the Java script that is associated with each node. It is necessary to supply one for the `div#fscmenu` node and optionally for `ul#fscmenuItem` nodes. The JS files implement core toolbar functionality and the default files work.

fscCSS is a style sheet that is associated with a particular node. The styles in the CSS files specify the toolbar appearance. *fscVCSS* is a style sheet for a vertical toolbar, which is displayed on the left of the rendered HTML form. *fscIECSS* is a style sheet used for HTML forms that are rendered in Internet Explorer.

Ensure that all the above files are referenced in the fscmenu.xml file. That is, in the fscmenu.xml file, specify URI locations to point to these files so that the Forms service can locate them. By default, these files are available at URI locations starting with internal keywords `FSWebRoot` or `ApplicationWebRoot`.

To customize the toolbar, replace the keywords by using the external keyword `FSToolBarURI`. This keyword represents the URI that is passed to the Forms service at run time (this approach is shown later in this section).

You can also specify the absolute locations of these JS and CSS files, such as https://www.mycompany.com/scripts/misc/fscmenu.js. In this situation, you do not need to use the `FSToolBarURI` keyword.

>[!NOTE]
>
>It is not recommended that you mix the ways in which these files are referenced. That is, all URIs should be referenced by using either the `FSToolBarURI` keyword or an absolute location.

You can obtain the JS and CSS files by opening the adobe-forms-&lt;appserver&gt;.ear file. Within this file, open the adobe-forms-res.war. All of these files are in the WAR file. The adobe-forms-&lt;appserver&gt;.ear file is in the AEM forms installation folder (C:\ is the installation directory). You can open the adobe-forms-&lt;appserver&gt;.ear using a file extraction tool such as WinRAR.

The following XML syntax shows an example fscmenu.xml file.

```html
 <div id="fscmenu" fscJS="FSToolBarURI/scripts/fscmenu.js" fscCSS="FSToolBarURI/fscmenu.css" fscVCSS="FSToolBarURI/fscmenu-v.css" fscIECSS="FSToolBarURI/fscmenu-ie.css">
         <ul class="fscmenuItem" id="Home">
             <li>
                 <a href="#" fscTarget="_top" tabindex="1">Home</a>
             </li>
         </ul>
         <ul class="fscmenuItem" id="Upload" fscJS="FSToolBarURI/scripts/fscattachments.js" fscCSS="FSToolBarURI/fscdialog.css">
             <li>
                 <a tabindex="2">Upload Attachments</a>
                 <ul class="fscmenuPopup" id="fscUploadAttachments">
                     <li>
                         <a href="javascript:doUploadDialog();" tabindex="3">Add ...</a>
                     </li>
                     <li>
                         <a href="javascript:doDeleteDialog();" tabindex="4">Delete ...</a>
                     </li>
                 </ul>
             </li>
         </ul>
         <ul class="fscmenuItem" id="Download">
             <li>
                 <a tabindex="100">Download Attachments</a>
                 <ul class="fscmenuPopup">
                     <li>
                         <a tabindex="101">None available</a>
                     </li>
                 </ul>
             </li>
         </ul>
     </div>
```

>[!NOTE]
>
>The bold text represents the URIs to the CSS and JS files that must be referenced.

The following items describe how you can customize a toolbar:

* Change the values of `fscJS`, `fscCSS`, `fscVCSS`, `fscIECSS` attributes (in the fscmenu.xml file) to reflect the custom locations of the referenced files by using one of the methods that are described in this section (for example, `fscJS="FSToolBarURI/scripts/fscmenu.js"`).
* All the CSS and JS files must be specified. If none of the files are modified, provide the default one at the custom location. You can obtain the default files by opening various files as described in this section.
* Providing an absolute reference (for example, https://www.example.com/scripts/custom-vertical-fscmenu.css) for any file is allowed.
* The JS and CSS files that the `div#fscmenu` node requires are essential for toolbar functionality. Individual `ul#fscmenuItem` nodes may or may not have supporting JS or CSS files.

**Changing the local value**

As part of customizing a toolbar, you can change the locale value of the toolbar. That is, you can display it in another language. The following illustration shows a custom toolbar that is displayed in French.

>[!NOTE]
>
>It is not possible to create a custom toolbar in more than one language. Toolbars cannot use different XML files based on the locale settings.

To change the locale value of a toolbar, ensure that the fscmenu.xml file contains the language you want to display. The following XML syntax shows the fscmenu.xml file that is used to display a French toolbar.

```html
 <div id="fscmenu" fscJS="FSToolBarURI/scripts/fscmenu.js" fscCSS="FSToolBarURI/fscmenu.css" fscVCSS="FSToolBarURI/fscmenu-v.css" fscIECSS="FSToolBarURI/fscmenu-ie.css">
         <ul class="fscmenuItem" id="Home">
             <li>
                 <a href="#" fscTarget="_top" tabindex="1">Accueil</a>
             </li>
         </ul>
         <ul class="fscmenuItem" id="Upload" fscJS="FSToolBarURI/scripts/fscattachments.js" fscCSS="FSToolBarURI/fscdialog.css">
             <li>
                 <a tabindex="2">Télécharger les pièces jointes</a>
                 <ul class="fscmenuPopup" id="fscUploadAttachments">
                     <li>
                         <a href="javascript:doUploadDialog();" tabindex="3">Ajouter...</a>
                     </li>
                     <li>
                         <a href="javascript:doDeleteDialog();" tabindex="4">Supprimer...</a>
                     </li>
                 </ul>
             </li>
         </ul>
         <ul class="fscmenuItem" id="Download">
             <li>
                 <a tabindex="100">Télécharger les pièces jointes</a>
                 <ul class="fscmenuPopup">
                     <li>
                         <a tabindex="101">Aucune disponible</a>
                     </li>
                 </ul>
             </li>
         </ul>
     </div>
```

>[!NOTE]
>
>The Quick Starts that are associated with this section use this XML file to display a French custom toolbar, as shown in the previous illustration.

Also, specify a valid locale value by invoking the `HTMLRenderSpec` object’s `setLocale` method and passing a string value that specifies the locale value. For example, pass `fr_FR` to specify French. The Forms service is bundled with localized toolbars.

>[!NOTE]
>
>Before you render an HTML form that uses a custom toolbar, you must know how HTML forms are rendered. (See [Rendering Forms as HTML](/help/forms/developing/rendering-forms-html.md).)

For more information about the Forms service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary-of-steps}

To render an HTML form that contains a custom toolbar, perform these tasks:

1. Include project files.
1. Create a Forms Java API object.
1. Reference a custom fscmenu XML file.
1. Render an HTML form.
1. Write the form data stream to the client web browser.

**Include project files**

Include the necessary files in your development project. If you are creating a client application by using Java, include the necessary JAR files. If you are using web services, include the proxy files.

**Create a Forms Java API object**

Before you can programmatically perform an operation that the Forms service supports, you must create a Forms client object.

**Reference a custom fscmenu XML file**

To render an HTML form that contains a custom toolbar, reference a fscmenu XML file that describes the toolbar. (This section provides two examples of a fscmenu XML file.) Also, ensure that the fscmenu.xml file specifies the locations of all referenced files correctly. As mentioned earlier in this section, ensure that all files are referenced by either the `FSToolBarURI` keyword or their absolute locations.

**Render an HTML form**

To render an HTML form, specify a form design that was created in Designer and saved as an XDP file. Also select an HTML transformation type. For example, you can specify the HTML transformation type that renders a dynamic HTML for Internet Explorer 5.0 or later.

Rendering an HTML form also requires values, such as URI values for rendering other form types.

**Write the form data stream to the client web browser**

When the Forms service renders an HTML form, it returns a form data stream that you must write to the client web browser to make the HTML form visible to users.

**See also**

[Render an HTML Form with a custom toolbar using the Java API](#render-an-html-form-with-a-custom-toolbar-using-the-java-api)

[Rendering an HTML Form with a custom toolbar using the web service API](#rendering-an-html-form-with-a-custom-toolbar-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Forms Service API Quick Starts](/help/forms/developing/forms-service-api-quick-starts.md#forms-service-api-quick-starts)

[Rendering Interactive PDF Forms](/help/forms/developing/rendering-interactive-pdf-forms.md)

[Rendering Forms as HTML](/help/forms/developing/rendering-forms-html.md)

[Creating Web Applications that Renders Forms](/help/forms/developing/creating-web-applications-renders-forms.md)

### Render an HTML Form with a custom toolbar using the Java API {#render-an-html-form-with-a-custom-toolbar-using-the-java-api}

Render an HTML Form that contains a custom toolbar by using the Forms Service API (Java):

1. Include project files

   Include client JAR files, such as adobe-forms-client.jar, in your Java project’s class path.

1. Create a Forms Java API object

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create a `FormsServiceClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Reference a custom fscmenu XML file

    * Create an `HTMLRenderSpec` object by using its constructor.
    * To render an HTML form with a toolbar, invoke the `HTMLRenderSpec` object’s `setHTMLToolbar` method and pass an `HTMLToolbar` enum value. For example, to display a vertical HTML toolbar, pass `HTMLToolbar.Vertical`.
    * Specify the location of the fscmenu XML file by invoking the `HTMLRenderSpec` object’s `setToolbarURI` method and passing a string value that specifies the URI location of the XML file.
    * If applicable, set the locale value by invoking the `HTMLRenderSpec` object’s `setLocale` method and passing a string value that specifies the locale value. The default value is English.

   >[!NOTE]
   >
   >The Quick Starts that are associated with this section sets this value to `fr_FR`*.*

1. Render an HTML form

   Invoke the `FormsServiceClient` object’s `renderHTMLForm` method and pass the following values:

    * A string value that specifies the form design name, including the file name extension. If you reference a form design that is part of a Forms application, ensure that you specify the complete path, such as `Applications/FormsApplication/1.0/FormsFolder/Loan.xdp`.
    * A `TransformTo` enum value that specifies the HTML preference type. For example, to render an HTML form that is compatible with dynamic HTML for Internet Explorer 5.0 or later, specify `TransformTo.MSDHTML`.
    * A `com.adobe.idp.Document` object that contains data to merge with the form. If you do not want to merge data, pass an empty `com.adobe.idp.Document` object.
    * The `HTMLRenderSpec` object that stores HTML run-time options.
    * A string value that specifies the `HTTP_USER_AGENT` header value, such as `Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)`.
    * A `URLSpec` object that stores URI values that are required to render an HTML form.
    * A `java.util.HashMap` object that stores file attachments. This is an optional parameter, and you can specify `null` if you do not want to attach files to the form.

   The `renderHTMLForm` method returns a `FormsResult` object that contains a form data stream that must be written to the client web browser.

1. Write the form data stream to the client web browser

    * Create a `com.adobe.idp.Document` object by invoking the `FormsResult` object ‘s `getOutputContent` method.
    * Get the content type of the `com.adobe.idp.Document` object by invoking its `getContentType` method.
    * Set the `javax.servlet.http.HttpServletResponse` object’s content type by invoking its `setContentType` method and passing the content type of the `com.adobe.idp.Document` object.
    * Create a `javax.servlet.ServletOutputStream` object that is used to write the form data stream to the client web browser by invoking the `javax.servlet.http.HttpServletResponse` object’s `getOutputStream` method.
    * Create a `java.io.InputStream` object by invoking the `com.adobe.idp.Document` object’s `getInputStream` method.
    * Create a byte array and populate it with the form data stream by invoking the `InputStream` object’s `read` method and passing the byte array as an argument.
    * Invoke the `javax.servlet.ServletOutputStream` object’s `write` method to send the form data stream to the client web browser. Pass the byte array to the `write` method.

**See also**

[Quick Start (SOAP mode): Rendering an HTML Form with a custom toolbar using the Java API](/help/forms/developing/forms-service-api-quick-starts.md#quick-start-soap-mode-rendering-an-html-form-with-a-custom-toolbar-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Rendering an HTML Form with a custom toolbar using the web service API {#rendering-an-html-form-with-a-custom-toolbar-using-the-web-service-api}

Render an HTML form that contains a custom toolbar by using the Forms Service API (web service):

1. Include project files

    * Create Java proxy classes that consume the Forms service WSDL.
    * Include the Java proxy classes in your class path.

1. Create a Forms Java API object

   Create a `FormsService` object and set authentication values.

1. Reference a custom fscmenu XML file

    * Create an `HTMLRenderSpec` object by using its constructor.
    * To render an HTML form with a toolbar, invoke the `HTMLRenderSpec` object’s `setHTMLToolbar` method and pass an `HTMLToolbar` enum value. For example, to display a vertical HTML toolbar, pass `HTMLToolbar.Vertical`.
    * Specify the location of the fscmenu XML file by invoking the `HTMLRenderSpec` object’s `setToolbarURI` method and passing a string value that specifies the URI location of the XML file.
    * If applicable, set the locale value by invoking the `HTMLRenderSpec` object’s `setLocale` method and passing a string value that specifies the locale value. The default value is English.

   >[!NOTE]
   >
   >The Quick Starts that are associated with this section sets this value to `fr_FR`*.*

1. Render an HTML form

   Invoke the `FormsService` object’s `renderHTMLForm` method and pass the following values:

    * A string value that specifies the form design name, including the file name extension. If you reference a form design that is part of a Forms application, ensure that you specify the complete path, such as `Applications/FormsApplication/1.0/FormsFolder/Loan.xdp`.
    * A `TransformTo` enum value that specifies the HTML preference type. For example, to render an HTML form that is compatible with dynamic HTML for Internet Explorer 5.0 or later, specify `TransformTo.MSDHTML`.
    * A `BLOB` object that contains data to merge with the form. If you do not want to merge data, pass `null`.
    * The `HTMLRenderSpec` object that stores HTML run-time options.
    * A string value that specifies the `HTTP_USER_AGENT` header value, such as `Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322`). You can pass an empty string if you do not want to set this value.
    * A `URLSpec` object that stores URI values that are required to render an HTML form.
    * A `java.util.HashMap` object that stores file attachments. This parameter is optional, and you can specify `null` if you do not intend to attach files to the form.
    * An empty `com.adobe.idp.services.holders.BLOBHolder` object that is populated by the `renderHTMLForm` method. This parameter value stores the rendered form.
    * An empty `com.adobe.idp.services.holders.BLOBHolder` object that is populated by the `renderHTMLForm` method. This parameter stores the output XML data.
    * An empty `javax.xml.rpc.holders.LongHolder` object that is populated by the `renderHTMLForm` method. This argument stores the number of pages in the form.
    * An empty `javax.xml.rpc.holders.StringHolder` object that is populated by the `renderHTMLForm` method. This argument stores the locale value.
    * An empty `javax.xml.rpc.holders.StringHolder` object that is populated by the `renderHTMLForm` method. This argument stores the HTML rendering value that is used.
    * An empty `com.adobe.idp.services.holders.FormsResultHolder` object that will contain the results of this operation.

   The `renderHTMLForm` method populates the `com.adobe.idp.services.holders.FormsResultHolder` object that is passed as the last argument value with a form data stream that must be written to the client web browser.

1. Write the form data stream to the client web browser

    * Create a `FormResult` object by getting the value of the `com.adobe.idp.services.holders.FormsResultHolder` object’s `value` data member.
    * Create a `BLOB` object that contains form data by invoking the `FormsResult` object’s `getOutputContent` method.
    * Get the content type of the `BLOB` object by invoking its `getContentType` method.
    * Set the `javax.servlet.http.HttpServletResponse` object’s content type by invoking its `setContentType` method and passing the content type of the `BLOB` object.
    * Create a `javax.servlet.ServletOutputStream` object that is used to write the form data stream to the client web browser by invoking the `javax.servlet.http.HttpServletResponse` object’s `getOutputStream` method.
    * Create a byte array and populate it by invoking the `BLOB` object’s `getBinaryData` method. This task assigns the content of the `FormsResult` object to the byte array.
    * Invoke the `javax.servlet.http.HttpServletResponse` object’s `write` method to send the form data stream to the client web browser. Pass the byte array to the `write` method.

**See also**

[Invoking AEM Forms using Base64 encoding](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-base64-encoding)

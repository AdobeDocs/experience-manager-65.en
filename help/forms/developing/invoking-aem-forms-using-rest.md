---
title: Invoking AEM Forms using REST Requests
description: Invoke processes created in Workbench using REST requests.
contentOwner: admin
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: coding
role: Developer
exl-id: 991fbc56-f144-4ae6-b010-8d02f780d347
solution: Experience Manager, Experience Manager Forms

---
# Invoking AEM Forms using REST Requests {#invoking-aem-forms-using-rest-requests} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

Processes created in Workbench can be configured so that you can invoke them through Representational State Transfer (REST) requests. REST requests are sent from HTML pages. That is, you can invoke a Forms process directly from a web page using a REST request. For example, you can open a new instance of a web page. Then you can invoke a Forms process and load a rendered PDF document with data that was sent in an HTTP POST request.

Two types of HTML clients exist. The first HTML client is an AJAX client that is written in JavaScript. The second client is an HTML form that contains a submit button. An HTML-based client application is not the only possible REST client. Any client application that supports HTTP requests can invoke a service using a REST invocation. For example, you can invoke a service by using a REST invocation from a PDF form. (See [Invoking the MyApplication/EncryptDocument process from Acrobat](#rest-invocation-examples).)

When using REST requests, it is recommended that you do not invoke Forms services directly. Instead, invoke processes that were created in Workbench. When creating a process that is meant for REST invocation, use a programmatic start point. In this situation, the REST endpoint is added automatically. For information about creating processes in Workbench, see [Using Workbench](https://www.adobe.com/go/learn_aemforms_workbench_63).

When you invoke a service using REST, you are prompted for an AEM forms user name and password. However, if you do not want to specify a user name and password, you can disable service security.

To invoke a Forms service (a process becomes a service when the process is activated) using REST, configure a REST endpoint. (See "Managing Endpoints" in [administration help](https://www.adobe.com/go/learn_aemforms_admin_63).)

After a REST endpoint is configured, you can invoke a Forms service by using an HTTP GET method or a POST method.

```java
 action="https://hiro-xp:8080/rest/services/[ServiceName]/[OperationName]:[ServiceVersion]" method="post" enctype="multipart/form-data"
```

The mandatory `ServiceName` value is the name of the Forms service to invoke. The optional `OperationName` value is the name of the service's operation. If this value is not specified, this name defaults to `invoke`, which is the operation name that starts the process. The optional `ServiceVersion` value is the version encoded in the X.Y format. If this value is not specified, the most current version is used. The `enctype` value can also be `application/x-www-form-urlencoded`.

## Supported data types {#supported-data-types}

The following data types are supported when invoking AEM Forms services using REST requests:

* Java primitive data types, such as Strings and integers
* `com.adobe.idp.Document` data type
* XML data types such as `org.w3c.Document` and `org.w3c.Element`
* Collection objects such as `java.util.List` and `java.util.Map`

  These data types are commonly accepted as input values to processes created in Workbench.

  If a Froms service is invoked with the HTTP POST method, the arguments are passed inside the HTTP request body. If the AEM Forms service's signature has a string input parameter, the request body can contain the text value of the input parameter. If the service's signature defines multiple string parameters, the request can follow the HTTP's `application/x-www-form-urlencoded` notation with the parameter's names used as the form's field names.

  If a Forms service returns a string parameter, the result is a textual representation of the output parameter. If a service returns multiple string parameters, the result is an XML document encoding the output parameters in the following format:
  ` <result> <output-paramater1>output-parameter-value-as-string</output-paramater1> . . . <output-paramaterN>output-parameter-value-as-string</output-paramaterN> </result>`
  
  >[!NOTE]
  >
  >The `output-paramater1` value represents the output parameter name.  

  If a Forms service requires a `com.adobe.idp.Document` parameter, the service can only be invoked using the HTTP POST method. If the service requires one `com.adobe.idp.Document` parameter, the HTTP request body becomes the content of the input Document object.

  If an AEM Forms service requires multiple input parameters, the HTTP request body must be a multipart MIME message as defined by RFC 1867. (RFC 1867 is a standard used by web browsers to upload files to websites.) Each input parameter must be sent as a separate part of the multipart message and encoded in the `multipart/form-data` format. The name of each part must match the parameter's name.

  Lists and maps are also used as input values to AEM Forms processes created in Workbench. As a result, you can use these data types when using a REST request. Java arrays are not supported because they are not used as an input value to a AEM Forms process.

  If an input parameter is a list, a REST client can send it by specifying the parameter multiple times (once for each item in the list). For example, if A is a list of documents, the input must be a multipart message consisting of multiple parts named A. In this case, each part named A becomes an item in the input list. If B is a list of strings, the input can be an `application/x-www-form-urlencoded` message consisting of multiple fields named B. In this case, each form field named B becomes an item in the input list.

  If an input parameter is a map and it is the services only input parameter, then every part/field of the input message becomes a key/value record in the map. The name of each part/field becomes the record's key. The content of each part/field becomes the record's value.

  If an input map is not the services only input parameter, then each key/value record that belongs to the map can be sent using a parameter named as a concatenation of the parameter name and the record's key. For example, an input map called `attributes` can be sent with a list of the following key/values pairs:

  `attributesColor=red`

  `attributesShape=box`

  `attributesWidth=5`

  This translates into a map of three records: `Color=red`, `Shape=box`, and `Width=5`.

  The output parameters of the list and map types become part of the resultant XML message. The output list is represented in XML as a series of XML elements with one element for each item in the list. Every element is given the same name as the output list parameter. The value of each XML element is one of two things:

* A text representation of the item in the list (if the list consists of string types)
* A URL that points to the content of Document (if the list consists of `com.adobe.idp.Document` objects)

  The following example is an XML message returned by a service that has a single output parameter named *list*, which is a list of integers.
  ` <result>   <list>12345</list>   . . .   <list>67890</list>  </result>`An output map parameter is represented in the resultant XML message as a series of XML elements with one element for each record in the map. Every element is given the same name as the map record's key. The value of each element is either a text representation of the map record's value (if the map consists of records with a string value) or a URL pointing to the Document's content (if the map consists of records with the `com.adobe.idp.Document` value). Below is an example of an XML message returned by a service that has a single output parameter named `map`. This parameter value is a map consisting of records that associate letters with `com.adobe.idp.Document` objects.
  ` <result>   http://localhost:8080/DocumentManager/docm123/4567   . . .   <Z>http://localhost:8080/DocumentManager/docm987/6543</Z>  </result>  `

## Asynchronous invocations {#asynchronous-invocations}

Some AEM Forms services, such as human-centric long-lived processes, require a long time to complete. These services can be invoked asynchronously in a non-blocking manner. (See [Invoking Human-Centric Long-Lived Processes](/help/forms/developing/invoking-human-centric-long-lived.md#invoking-human-centric-long-lived-processes).)

An AEM Forms service can be invoked asynchronously by substituting `services` with `async_invoke` in the invocation URL, as shown in the following example.

```java
 http://localhost:8080/rest/async_invoke/SomeService. SomeOperation?integer_input_variable=123&string_input_variable=abc
```

This URL returns the identifier value (in "text/plain" format) of the job responsible for this invocation.

The status of the asynchronous invocation can be retrieved by using an invocation URL with `services` substituted with `async_status`. The URL must contain a `job_id` parameter specifying the identifier value of the job associated with this invocation. For example:

```java
 http://localhost:8080/rest/async_status/SomeService.SomeOperation?job_id=2345353443366564
```

This URL returns an integer value (in "text/plain" format) encoding the job status according to the Job Manager's specification (for example, 2 means running, 3 means completed, 4 means failed, and so on.)

If the job is completed, the URL returns the same result as if the service was invoked synchronously.

Once the job is completed and the result is retrieved, the job can disposed of by using an invocation URL with `services` is substituted with `async_dispose`. The URL should also contain a `job_id` parameter specifying the identifier value of the job. For example:

```java
 http://localhost:8080/rest/async_dispose/SomeService.SomeOperation?job_id=2345353443366564
```

If the job is successfully disposed of, this URL returns an empty message.

## Error reporting {#error-reporting}

If a synchronous or asynchronous invocation request cannot be completed due to an exception being thrown on the server, the exception is reported as part of the HTTP response message. If the invocation URL (or the `async_result` URL if there is an asynchronous invocation) does not have an .xml suffix, the REST Provider returns the HTTP code `500 Internal Server Error` followed by an exception message.

If the invocation URL (or the `async_result` URL if there is an asynchronous invocation) does have an .xml suffix, the REST Provider returns the HTTP code `200 OK`followed by an XML document describing the exception in the following format.

```xml
 <exception>
       <exception_class_name>[
       <DSCError>
          <componentUID>component_UUD</componentUID>
         <errorCode>error_code</errorCode>
         <minorCode>minor_code</minorCode>
         <message>error_message</message>
       </DSCError>
 ]
       <message>exception_message</message>
     <stackTrace>exception_stack_trace</stackTrace>
       </exception_class_name>
     <exception>
       </exception>
 </exception>
```

The `DSCError` element is optional and present only if the exception is an instance of `com.adobe.idp.dsc.DSCException`.

## Security and authentication {#security-and-authentication}

To provide REST invocations with a secure transport, an AEM forms administrator can enable the HTTPS protocol on the J2EE application server hosting AEM Forms. This configuration is specific to the J2EE application server; it is not part of the Forms Server configuration.

>[!NOTE]
>
>As a Workbench developer that wants to expose your processes through a REST endpoint, keep in mind the XSS vulnerability issue. XSS vulnerabilities can be used to steal or manipulate cookies, modify presentation of content, and compromise confidential information. It is recommended that you extend the process logic with the additional input and output data validation rules if XSS vulnerability is an issue.

## AEM Forms services that support REST invocation {#aem-forms-services-that-support-rest-invocation}

Although it is recommended that you invoke processes created using Workbench as opposed to services directly, there are some AEM Forms services that do support REST invocation. The reason why it is recommended that you invoke a process as opposed to a service directly is because it is more efficient to invoke a process. Consider the following scenario. Assume that you want to create a policy from a REST client. That is, you want the REST client to define values such as the policy name, the offline lease period.

To create a policy, you have to define complex data types such as a `PolicyEntry` object. A `PolicyEntry` object defines attributes such as permissions associated with the policy. (See [Creating Policies](/help/forms/developing/protecting-documents-policies.md#creating-policies).)

Instead of sending a REST request to create a policy (which would include defining complex data types such as a `PolicyEntry` object), create a process that creates a policy using Workbench. Define the process to accept primitive input variables such as a string value that defines the process name or an integer that defines the offline lease period.

This way, you do not have to create a REST invocation request that includes complex data types that required by the operation. The process defines the complex data types and all you do from the REST client is invoke the process and pass primitive data types. For information about invoking a process using REST, see [Invoking the MyApplication/EncryptDocument process using REST](#rest-invocation-examples).

The following lists specifies those AEM Forms services that support direct REST invocation.

* Distiller service
* Rights Management service
* GeneratePDF service
* Generate3dPDF service
* FormDataIntegration

## REST invocation examples {#rest-invocation-examples}

The following REST invocation examples are provided:

* Passing Boolean values to an AEM Forms process
* Passing date values to an AEM Forms process
* Passing documents to an AEM Forms process
* Passing document and text values to an AEM Forms process
* Passing enumeration values to an AEM Forms process
* Invoking the MyApplication/EncryptDocument process using REST
* Invoking the MyApplication/EncryptDocument process from Acrobat

  Each example demonstrates passing different data types to an AEM Forms process

**Passing Boolean values to a process**

The following HTML example passes two `Boolean` values to an AEM Forms process named `RestTest2`. The name of the invocation method is `invoke` and the version is 1.0. Notice that the HTML Post method is used.

```html
 <html>
 <body>
 
 <form name="input" action="http://localhost:9080/rest/services/RestTest2/invoke/1.0" method="post">
 
 Boolean 1: <input type="text" name="inBooleanList" value="true">
 Boolean 2: <input type="text" name="inBooleanList" value="false">
 <input type="submit" value="Submit">
 
 </form>
 
 </body>
 </html>
```

**Passing date values to a process**

The following HTML example passes a date value to an AEM Forms process named `SOAPEchoService`. The name of the invocation method is `echoCalendar`. Notice that the HTML `Post` method is used.

```html
 <html>
 <body>
 
 <form name="input" action="http://localhost:9080/rest/services/SOAPEchoService/echoCalendar" method="post">
 
 Date: <input type="text" name="value-to-echo" value="2009-01-02T12:15:30Z">
 <input type="submit" value="Submit">
 
 </form>
 
 </body>
 </html>
```

**Passing documents to a process**

The following HTML example invokes an AEM Forms process named `MyApplication/EncryptDocument` that requires a PDF document. For information about this process, see [Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom).

```html
 <html>
 <body>
 
 <form name="input" action="http://localhost:9080/rest/services/MyApplication/EncryptDocument/invoke" method="post"
          enctype="multipart/form-data">
 
 File: <input type="file" name="value-to-echo">
 <input type="submit" value="Submit"/>
 
 </form>
 
 </body>
 </html>
```

**Passing document and text values to a process**

The following HTML example invokes an AEM Forms process named `RestTest3` that requires a document and two text values. Notice that the HTML Post method is used.

```html
 <html>
 <body>
 
 <form name="input" action="http://localhost:9080/rest/services/RestTest3" method="post"
          enctype="multipart/form-data">
 
 Doc: <input type="file" name="inDoc">
 String 1: <input type="text" name="inListOfStrings" value="hello">
 String 2: <input type="text" name="inListOfStrings" value="privet">
 <input type="submit" value="Submit"/>
 
 </form>
 
 </body>
 </html>
```

**Passing enumeration values to a process**

The following HTML example invokes an AEM Forms process named `SOAPEchoService` that requires an enumeration value. Notice that the HTML Post method is used.

```html
 <html>
 <body>
 
 <form name="input" action="https://hiro-xp:8080/rest/services/SOAPEchoService/echoEnum" method="post">
 
 Color Enum Value: <input type="text" name="value-to-echo" value="green">
 <input type="submit" value="Submit">
 
 </form>
 
 </body>
 </html>
```

**Invoking the MyApplication/EncryptDocument process using REST**

You can invoke an AEM Forms short-lived process named *MyApplication/EncryptDocument* by using REST.

>[!NOTE]
>
>This process is not based on an existing AEM Forms process. To follow along with the code example, create a process named `MyApplication/EncryptDocument` using workbench. (See [Using Workbench](https://www.adobe.com/go/learn_aemforms_workbench_63).)

When this process is invoked, it performs the following actions:

1. Obtains the unsecured PDF document that is passed to the process. This action is based on the `SetValue` operation. The input parameter for this process is a `document` process variable named `inDoc`.
1. Encrypts the PDF document with a password. This action is based on the `PasswordEncryptPDF` operation. The password encrypted PDF document is returned in a process variable named `outDoc`.

   When this process is invoked using a REST request, the encrypted PDF document is displayed in the web browser. Before you view the PDF document, you specify the password (unless security is disabled). The following HTML code represents a REST invocation request to the `MyApplication/EncryptDocument` process.

   ```html
    <html>
    <body>
    <form action="https://hiro-xp:8080/rest/services/MyApplication/EncryptDocument" method="post" enctype="multipart/form-data">
         <p>Chose a PDF file (.pdf) to send to the EncryptDocument process.</p>
         <p>file:
           <input type="file" name="inDoc" />
         </p>
         <p>
           <input type="submit"/>
         </p>
    </form>
    </body>
   ```

**Invoking the MyApplication/EncryptDocument process from Acrobat** {#invoke-process-acrobat}

You can invoke a Forms process from Acrobat by using a REST request. For example, you can invoke the *MyApplication/EncryptDocument* process. To invoke a Forms process from Acrobat, place a submit button on an XDP file within Designer. (See [Designer Help](https://www.adobe.com/go/learn_aemforms_designer_63).)

Specify the URL to invoke the process within the button's *Submit to URL* field, as shown in the following illustration.

The complete URL to invoke the process is https://hiro-xp:8080/rest/services/MyApplication/EncryptDocument.

If the process requires a PDF document as an input value, ensure that you submit the form as PDF, as shown in the previous illustration. Also, to successfully invoke a process, the process must return a PDF document. Otherwise Acroabt cannot handle the return value and an error occurs. You do not have to specify the name of the input process variable. For example, the *MyApplication/EncryptDocument* process has an input variable named `inDoc`. You do not have to specify inDoc, as long as the form is submited as PDF.

You can also submit form data as XML to a Forms process, To submit XML data, ensure that the `Submit As` drop-down specifies XML. Because the return value of the process must be a PDF document, the PDF document is displayed in Acrobat.

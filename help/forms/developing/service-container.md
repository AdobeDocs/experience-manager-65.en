---
title: Service container

description: AEM Forms services in the service container

contentOwner: admin
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: coding, development-tools

role: Developer
exl-id: 6abf2401-5a87-4f72-9028-74580df5b9de
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
---
# Service container {#service-container} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

AEM Forms services in the service container (including standard servces such as the Encryption service, long-lived, and short-lived processes) can be invoked using various providers, such as an EJB provider. An EJB provider enables AEM Forms services to be invoked over RMI/IIOP. A web service provider exposes services as web services (WSDL Generation) using standards such as SOAP/HTTP and SOAP/JMS.

The following table describes the different ways in which you can programmatically invoke AEM Forms services.

<table>
 <thead>
  <tr>
   <th><p>Invocation method</p></th>
   <th><p>Description</p></th>
  </tr>
 </thead>
 <tbody>
  <tr>
   <td><p>Remote integration</p></td>
   <td><p>Remote integration provides the ability for Flex clients to invoke service operations. (See <a href="/help/forms/developing/invoking-aem-forms-using-remoting.md#invoking-aem-forms-using-remoting">Invoking AEM Forms using (Deprecated for AEM forms) AEM Forms Remoting</a>.)</p></td>
  </tr>
  <tr>
   <td><p>Java API</p></td>
   <td><p>A Java API can invoke an AEM Forms service. The Java API is organized into client libraries and the Java Invocation API. (See <a href="/help/forms/developing/invoking-aem-forms-using-java.md#invoking-aem-forms-using-the-java-api">Invoking AEM Forms using the Java API</a>.)</p></td>
  </tr>
  <tr>
   <td><p>Web services</p></td>
   <td><p>AEM Forms supports web service standards such as SOAP/HTTP. A service can be exposed as a web service, with the WSDL complying to web service standards defined by W3C.</p><p>A service can be invoked from any web service stack, including the .NET Framework and Sun™ Web Services SDK. (See <a href="/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-web-services">Invoking AEM Forms using Web Services</a>.)</p></td>
  </tr>
  <tr>
   <td><p>REST requests</p></td>
   <td><p>AEM Forms supports REST requests. A service can be invoked directly from an HTML page. (See <a href="/help/forms/developing/invoking-aem-forms-using-rest.md#invoking-aem-forms-using-rest-requests">Invoking AEM Forms using REST Requests</a>.)</p></td>
  </tr>
 </tbody>
</table>

The following illustration provides a visual representation of the different ways in which AEM Forms services can be programmatically invoked.

>[!NOTE]
>
>In addition to using the AEM Forms SDK to create client applications that can invoke AEM Forms services, you can also create components that can be deployed to the service container. For example, you can create a Bank component that contains custom data types that can be used in processes. That is, you can create a data type such as `com.adobe.idp.BankAccount`. You can then create `com.adobe.idp.BankAccount` instances in your client applications.

The service container provides the following functionality:

* Allows AEM Forms services to be invoked using different methods. You can configure a service by setting endpoints so that it can be invoked using all methods: Remoting, the Java API, web services, and REST. (See [Programmatically Managing Endpoints](/help/forms/developing/programmatically-endpoints.md#programmatically-managing-endpoints).)
* Converts a message into a normalized format called an invocation request. An invocation request is sent from a client application (or another service) to a service in the service container. An invocation request contains information such as the name of the service to invoke and data values that are required to perform the operation. Many services require a document to perform an operation. Therefore, an invocation request usually contains a document, which can be PDF data, XDP data, XML data, and so on.
* Routes invocation requests to appropriate services (the name of the service to invoke is part of the invocation request).
* Performs tasks such as determining whether the caller has permission to invoke the specified service operation. The invocation request must contain a valid AEM forms user name and password.

  There are different ways to send an invocation request to a service. As well, there are different ways to send required input values to the service. For example, assume that you use the Java API to invoke a service that requires a PDF document. The corresponding Java method contains a parameter that accepts a PDF document. In this situation, the data type of the parameter is `com.adobe.idp.Document`. (See [Passing data to AEM Forms services using the Java API](/help/forms/developing/invoking-aem-forms-using-java.md#passing-data-to-aem-forms-services-using-the-java-api).)

  If you invoke a service using watched folders, then an invocation request is sent when you place a file in a configured watched folder. If you invoke a service using e-mail, then an invocation request is sent to a service when an e-mail message arrives in a configured inbox.

  The service container sends back an invocation response once the operation is performed. An invocation response contains information such as the operation results. For example, if the operation modifies a PDF document, then the invocation response contains the modified PDF document. If the operation was unsuccessful, then the invocation response contains an error message.

  An invocation response can be retrieved in the same way in which an invocation request is sent. That is, if the invocation request is sent using the Java API, then an invocation response can be retrieved using the Java API. Assume, for example, that an operation modifies a PDF document. You can retrieve the modified PDF document by getting the return value of the Java method that invoked the service.

  When a long-lived process is invoked, an invocation response contains an identifier value that is associated with the invocation request. Using this identifier value, you can check the status of the process at a later time. For example, consider the MortgageLoan long-lived service. Using the identifier value, you can check to determine whether the process successfully completed. (See [Invoking Human-Centric Long-Lived Processes](/help/forms/developing/invoking-human-centric-long-lived.md#invoking-human-centric-long-lived-processes).)

  The following diagram shows a client application (that uses the Java API) invoking a service.

  When a client application invokes a service, three events occur:

    1. A client application sends an invocation request to a service.
    1. The service performs the operation that is specified in the invocation request.
    1. The service container returns an invocation response to the client application.

**See also**

[Understanding AEM Forms Processes](/help/forms/developing/aem-forms-processes.md#understanding-aem-forms-processes)

[Invoking AEM Forms using (Deprecated for AEM forms) AEM Forms Remoting](/help/forms/developing/invoking-aem-forms-using-remoting.md#invoking-aem-forms-using-remoting)

[Invoking AEM Forms using the Java API](/help/forms/developing/invoking-aem-forms-using-java.md#invoking-aem-forms-using-the-java-api)

[Invoking AEM Forms using Web Services](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-web-services)

[Invoking Human-Centric Long-Lived Processes](/help/forms/developing/invoking-human-centric-long-lived.md#invoking-human-centric-long-lived-processes)

[Invoking AEM Forms using REST Requests](/help/forms/developing/invoking-aem-forms-using-rest.md#invoking-aem-forms-using-rest-requests)

---
title: Invoking AEM Forms using the JavaAPI
description: Use the AEM Forms Java API for RMI transport protocol for remote invocation, VM transport for local invocation, SOAP for remote invocation, different authentication, such as user name and password, and synchronous and asynchronous invocation requests.
contentOwner: admin
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: coding
role: Developer
exl-id: 036c35c1-1be7-4825-bbb6-ea025e49c6f6
solution: Experience Manager, Experience Manager Forms

feature: "Adaptive Forms,APIs & Integrations"
---
# Invoking AEM Forms using the Java API {#invoking-aem-forms-using-the-javaapi} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

AEM Forms can be invoked by using the AEM Forms Java API. When using the AEM Forms Java API, you can use either the Invocation API or Java client libraries. Java client libraries are available for services such as the Rights Management service. These strongly typed APIs let you develop Java applications that invoke AEM Forms.

The Invocation API are classes that are in the `com.adobe.idp.dsc` package. Using these classes, you can send an invocation request directly to a service and handle an invocation response that is returned. Use the Invocation API to invoke short-lived or long-lived processes that were created by using Workbench.

The recommended way to programmatically invoke a service is to use a Java client library that corresponds to the service as opposed to the Invocation API. For example, to invoke the Encryption service, use the Encryption service client library. To perform an Encryption service operation, invoke a method that belongs to the Encryption service client object. You can encrypt a PDF document with a password by invoking the `EncryptionServiceClient` object's `encryptPDFUsingPassword` method.

The Java API supports the following features:

* RMI transport protocol for remote invocation
* VM transport for local invocation
* SOAP for remote invocation
* Different authentication, such as user name and password
* Synchronous and asynchronous invocation requests

[Including AEM Forms Java library files](#including-aem-forms-java-library-files)

[Invoking Human-Centric Long-Lived Processes](invoking-human-centric-long-lived.md#invoking-human-centric-long-lived-processes)

[Invoking AEM Forms using Web Services](/help/forms/developing/invoking-aem-forms-using-web.md)

[Setting connection properties](#setting-connection-properties)

[Passing data to AEM Forms services using the Java API](#passing-data-to-aem-forms-services-using-the-java-api)

[Invoking a service using a Java client library](#invoking-a-service-using-a-java-client-library)

[Invoking a short-lived process using the Invocation API](#invoking-a-short-lived-process-using-the-invocation-api)

[Creating a Java web application that invokes a human-centric long-lived process](/help/forms/developing/invoking-human-centric-long-lived.md)

## Including AEM Forms Java library files {#including-aem-forms-java-library-files}

To programmatically invoke a AEM Forms service by using the Java API, include required library files (JAR files) in your Java project's classpath. The JAR files that you include in your client application's classpath depend on several factors:

* The AEM Forms service to invoke. A client application can invoke one or more services.
* The mode in which you want to invoke a AEM Forms service. You can use the EJB or SOAP mode. (See [Setting connection properties](invoking-aem-forms-using-java.md#setting-connection-properties).)

>[!NOTE]
>
>(Turnkey Only) Start the AEM Forms server with command `standalone.bat -b <Server IP> -c lc_turnkey.xml` to specify a server IP for EJB

* The J2EE application server on which AEM Forms is deployed.

### Service-specific JAR files {#service-specific-jar-files}

The following table lists the JAR files that are required to invoke AEM Forms services.

<table>
 <thead>
  <tr>
   <th><p>File</p></th>
   <th><p>Description</p></th>
   <th><p>Location</p></th>
  </tr>
 </thead>
 <tbody>
  <tr>
   <td><p>adobe-livecycle-client.jar</p></td>
   <td><p>Must always be included in a Java client application's class path.</p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-usermanager-client.jar</p></td>
   <td><p>Must always be included in a Java client application's class path.</p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-utilities.jar</p></td>
   <td><p>Must always be included in a Java client application's class path.</p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk//client-libs/&lt;app server&gt;</p></td>
  </tr>
  <tr>
   <td><p>adobe-applicationmanager-client-sdk.jar</p></td>
   <td><p>Required to invoke the Application Manager service.</p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-assembler-client.jar</p></td>
   <td><p>Required to invoke the Assembler service. </p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-backup-restore-client-sdk.jar</p></td>
   <td><p>Required to invoke the Backup and Restore service API.</p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-barcodedforms-client.jar</p></td>
   <td><p>Required to invoke the barcoded forms service. </p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-convertpdf-client.jar</p></td>
   <td><p>Required to invoke the Convert PDF service. </p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-distiller-client.jar</p></td>
   <td><p>Required to invoke the Distiller service.</p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-docconverter-client.jar</p></td>
   <td><p>Required to invoke the DocConverter service.</p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-contentservices-client.jar</p></td>
   <td><p>Required to invoke the Document Management service.</p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-encryption-client.jar</p></td>
   <td><p>Required to invoke the Encryption service.</p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-forms-client.jar</p></td>
   <td><p>Required to invoke the Forms service.</p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-formdataintegration-client.jar</p></td>
   <td><p>Required to invoke the Form Data Integration service.</p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-generatepdf-client.jar</p></td>
   <td><p>Required to invoke the Generate PDF service.</p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-generate3dpdf-client.jar</p></td>
   <td><p>Required to invoke the Generate 3D PDF service.</p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-jobmanager-client-sdk.jar</p></td>
   <td><p>Required to invoke the Job Manager service. </p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-output-client.jar</p></td>
   <td><p>Required to invoke the Output service.</p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-pdfutility-client.jar</p></td>
   <td><p>Required to invoke the PDF Utilities or XMP Utilities service.</p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-reader-extensions-client.jar</p></td>
   <td><p>Required to invoke the Acrobat Reader DC extensions service.</p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-repository-client.jar</p><p>commons-codec-1.3.jar</p></td>
   <td><p>Required to invoke the Repository service.</p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p><p>&lt;<i>install directory</i>&gt;/sdk/client-libs\thirdparty</p></td>
  </tr>
  <tr>
   <td>
    <ul>
     <li><p>adobe-rightsmanagement-client.jar</p></li>
     <li><p>namespace.jar</p></li>
     <li><p>jaxb-api.jar</p></li>
     <li><p>jaxb-impl.jar</p></li>
     <li><p>jaxb-libs.jar</p></li>
     <li><p>jaxb-xjc.jar</p></li>
     <li><p>relaxngDatatype.jar</p></li>
     <li><p>xsdlib.jar</p></li>
    </ul></td>
   <td><p>Required to invoke the Rights Management service.</p><p>If AEM Forms is deployed on JBoss, include all these files. </p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p><p>JBoss-specific lib directory</p></td>
  </tr>
  <tr>
   <td><p>adobe-signatures-client.jar</p></td>
   <td><p>Required to invoke the Signature service.</p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-taskmanager-client-sdk.jar</p></td>
   <td><p>Required to invoke the Task Manager service. </p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
  <tr>
   <td><p>adobe-truststore-client.jar</p></td>
   <td><p>Required to invoke the Trust Store service. </p></td>
   <td><p>&lt;<i>install directory</i>&gt;/sdk/client-libs/common</p></td>
  </tr>
 </tbody>
</table>

### Connection mode and J2EE application JAR files {#connection-mode-and-j2ee-application-jar-files}

The following table lists the JAR files that are dependant upon the connection mode and the J2EE application server on which AEM Forms is deployed.

<table>
 <thead>
  <tr>
   <th><p>File</p> </th>
   <th><p>Description</p> </th>
   <th><p>Location</p> </th>
  </tr>
 </thead align="left">
 <tbody>
  <tr>
   <td>
    <ul>
     <li><p>activation.jar</p> </li>
     <li><p>axis.jar</p> </li>
     <li><p>commons-codec-1.3.jar</p> </li>
     <li><p>commons-collections-3.1.jar</p> </li>
     <li><p>commons-discovery.jar</p> </li>
     <li><p>commons-logging.jar</p> </li>
     <li><p>dom3-xml-apis-2.5.0.jar</p> </li>
     <li><p>jaxen-1.1-beta-9.jar</p> </li>
     <li><p>jaxrpc.jar</p> </li>
     <li><p>log4j.jar</p> </li>
     <li><p>mail.jar</p> </li>
     <li><p>saaj.jar</p> </li>
     <li><p>wsdl4j.jar</p> </li>
     <li><p>xalan.jar</p> </li>
     <li><p>xbean.jar</p> </li>
    </ul>
    <ul>
     <li>xercesImpl.jar<br /> </li>
     <li>commons-httpclient-3.1.jar</li>
    </ul> <p> </p> </td>
   <td><p>if AEM Forms is invoked using the SOAP mode, include these JAR files.</p> </td>
   <td><p>&lt;<em>install directory</em>&gt;/sdk/client-libs/thirdparty</p> </td>
  </tr>
  <tr>
   <td><p> jboss-client.jar</p> </td>
   <td><p>if AEM Forms is deployed on JBoss Application Server, include this JAR file.</p> <p>Required classes will not be found by the classloader if jboss-client.jar and the referenced jars are not co-located.</p> </td>
   <td><p>JBoss client lib directory</p> <p>If you deploy your client application on the same J2EE application server, you do not need to include this file.</p> </td>
  </tr>
  <tr>
   <td><p>wlclient.jar</p> </td>
   <td><p>if AEM Forms is deployed on BEA WebLogic Server&reg;, then include this JAR file.</p> </td>
   <td><p>WebLogic-specific lib directory</p> <p>If you deploy your client application on the same J2EE application server, you do not need to include this file.</p> </td>
  </tr>
  <tr>
   <td>
    <ul>
     <li><p>com.ibm.ws.admin.client_6.1.0.jar</p> </li>
     <li><p>com.ibm.ws.webservices.thinclient_6.1.0.jar</p> </li>
    </ul> </td>
   <td>
    <ul>
     <li><p>if AEM Forms is deployed on WebSphere Application Server, include these JAR files.</p> </li>
     <li><p>(com.ibm.ws.webservices.thinclient_6.1.0.jar is required for web service invocation).</p> </li>
    </ul> </td>
   <td><p>WebSphere-specific lib directory (<em>[WAS_HOME]</em>/runtimes)</p> <p>If you deploy your client application on the same J2EE application server, you do not have to include these files.</p> </td>
  </tr>
 </tbody>
</table>

### Invoking scenarios {#invoking-scenarios}

The following table specifies invoking scenarios and lists the required JAR files to successfully invoke AEM Forms.

<table>
 <thead>
  <tr>
   <th><p>Services</p> </th>
   <th><p>Invocation mode</p> </th>
   <th><p>J2EE application server</p> </th>
   <th><p>Required JAR files</p> </th>
  </tr>
 </thead align="left">
 <tbody>
  <tr>
   <td><p>Forms service</p> </td>
   <td><p>EJB</p> </td>
   <td><p>JBoss</p> </td>
   <td>
    <ul>
     <li><p>adobe-livecycle-client.jar</p> </li>
     <li><p>adobe-usermanager-client.jar</p> </li>
    </ul>
    <ul>
     <li>jboss-client.jar</li>
    </ul>
    <ul>
     <li>adobe-forms-client.jar<br /> </li>
     <li>commons-httpclient-3.1.jar</li>
    </ul> </td>
  </tr>
  <tr>
   <td><p>Forms service</p> <p>Acrobat Reader DC extensions service</p> <p>Signature service</p> </td>
   <td><p>EJB</p> </td>
   <td><p>JBoss</p> </td>
   <td>
    <ul>
     <li><p>adobe-livecycle-client.jar</p> </li>
     <li><p>adobe-usermanager-client.jar</p> </li>
    </ul>
    <ul>
     <li>jboss-client.jar<br /> </li>
     <li>commons-httpclient-3.1.jar</li>
    </ul>
    <ul>
     <li><p>adobe-forms-client.jar</p> </li>
     <li><p>adobe-reader-extensions-client.jar</p> </li>
     <li><p>adobe-signatures-client.jar</p> </li>
    </ul> </td>
  </tr>
  <tr>
   <td><p>Forms service</p> </td>
   <td><p>SOAP</p> </td>
   <td><p>WebLogic</p> </td>
   <td>
    <ul>
     <li><p>adobe-livecycle-client.jar</p> </li>
     <li><p>adobe-usermanager-client.jar</p> </li>
     <li><p>wlclient.jar</p> </li>
     <li><p>activation.jar</p> </li>
     <li><p>axis.jar</p> </li>
     <li><p>commons-codec-1.3.jar</p> </li>
     <li><p>commons-collections-3.1.jar</p> </li>
     <li><p>commons-discovery.jar</p> </li>
     <li><p>commons-logging.jar</p> </li>
     <li><p>dom3-xml-apis-2.5.0.jar</p> </li>
     <li><p>jai_imageio.jar</p> </li>
     <li><p>jaxen-1.1-beta-9.jar</p> </li>
     <li><p>jaxrpc.jar</p> </li>
     <li><p>log4j.jar</p> </li>
     <li><p>mail.jar</p> </li>
     <li><p>saaj.jar</p> </li>
     <li><p>wsdl4j.jar</p> </li>
     <li><p>xalan.jar</p> </li>
     <li><p>xbean.jar</p> </li>
     <li><p>xercesImpl.jar</p> </li>
     <li><p>adobe-forms-client.jar</p> </li>
    </ul> </td>
  </tr>
  <tr>
   <td><p>Forms service</p> <p>Acrobat Reader DC extensions service</p> <p>Signature service</p> </td>
   <td><p>SOAP</p> </td>
   <td><p>WebLogic</p> </td>
   <td>
    <ul>
     <li><p>adobe-livecycle-client.jar</p> </li>
     <li><p>adobe-usermanager-client.jar</p> </li>
     <li><p>wlclient.jar</p> </li>
     <li><p>activation.jar</p> </li>
     <li><p>axis.jar</p> </li>
     <li><p>commons-codec-1.3.jar</p> </li>
     <li><p>commons-collections-3.1.jar</p> </li>
     <li><p>commons-discovery.jar</p> </li>
     <li><p>commons-logging.jar</p> </li>
     <li><p>dom3-xml-apis-2.5.0.jar</p> </li>
     <li><p>jai_imageio.jar</p> </li>
     <li><p>jaxen-1.1-beta-9.jar</p> </li>
     <li><p>jaxrpc.jar</p> </li>
     <li><p>log4j.jar</p> </li>
     <li><p>mail.jar</p> </li>
     <li><p>saaj.jar</p> </li>
     <li><p>wsdl4j.jar</p> </li>
     <li><p>xalan.jar</p> </li>
     <li><p>xbean.jar</p> </li>
     <li><p>xercesImpl.jar</p> </li>
     <li><p>adobe-forms-client.jar</p> </li>
     <li><p>adobe-reader-extensions-client.jar</p> </li>
     <li><p>adobe-signatures-client.jar</p> </li>
    </ul> </td>
  </tr> xmp-uti
 </tbody>
</table>

### Upgrading JAR files {#upgrading-jar-files}

If you are upgrading from LiveCycle to AEM Forms, it is recommeded that you include the AEM Forms JAR files in your Java project's class path. For example, if you are using services such as the Rights Management service, you will encounter a compatibility issue if you do not include AEM Forms JAR files in your class path.

Assuming that you are upgrading to AEM Forms. To use a Java application that invokes the Rights Management service, include the AEM Forms versions of the following JAR files:

* adobe-rightsmanagement-client.jar
* adobe-livecycle-client.jar
* adobe-usermanager-client.jar

**See also**

[Invoking AEM Forms using the Java API](invoking-aem-forms-using-java.md#invoking-aem-forms-using-the-java-api)

[Setting connection properties](invoking-aem-forms-using-java.md#setting-connection-properties)

[Passing data to AEM Forms services using the Java API](invoking-aem-forms-using-java.md#passing-data-to-aem-forms-services-using-the-java-api)

[Invoking a service using a Java client library](invoking-aem-forms-using-java.md#invoking-a-service-using-a-java-client-library)

## Setting connection properties {#setting-connection-properties}

You set connection properties to invoke AEM Forms when using the Java API. When setting connection properties, specify whether to invoke services remotely or locally, and also specify the connection mode and authentication values. Authentication values are required if service security is enabled. However, if service security is disabled, it is not necessary to specify authentication values.

The connection mode can either be SOAP or EJB mode. The EJB mode uses the RMI/IIOP protocol, and the performance of the EJB mode is better than the performance of the SOAP mode. The SOAP mode is used to eliminate a J2EE application server dependency or when a firewall is located between AEM Forms and the client application. The SOAP mode uses the https protocol as the underlying transport and can communicate across firewall boundaries. If neither a J2EE application server dependency or a firewall is an issue, it is recommended that you use the EJB mode.

To successfully invoke a AEM Forms service, set the following connection properties:

* **DSC_DEFAULT_EJB_ENDPOINT:** If you are using the EJB connection mode, this value represents the URL of the J2EE application server on which AEM Forms is deployed. To remotely invoke AEM Forms, specify the J2EE application server name on which AEM Forms is deployed. If your client application is located on the same J2EE application server, then you can specify `localhost`. Depending on which J2EE application server AEM Forms is deployed on, specify one of the following values:

    * JBoss: `https://<ServerName>:8080 (default port)`
    * WebSphere: `iiop://<ServerName>:2809 (default port)`
    * WebLogic: `t3://<ServerName>:7001 (default port)`

* **DSC_DEFAULT_SOAP_ENDPOINT**: If you are using the SOAP connection mode, this value represents the endpoint to where an invocation request is sent. To remotely invoke AEM Forms, specify the J2EE application server name on which AEM Forms is deployed. If your client application is located on the same J2EE application server, you can specify `localhost` (for example, `http://localhost:8080`.)

    * The port value `8080` is applicable if the J2EE application is JBoss. If the J2EE application server is IBM&reg; WebSphere&reg;, use port `9080`. Likewise, if the J2EE application server is WebLogic, use port `7001`. (These values are default port values. If you change the port value, use the applicable port number.)

* **DSC_TRANSPORT_PROTOCOL**: If you are using the EJB connection mode, specify `ServiceClientFactoryProperties.DSC_EJB_PROTOCOL` for this value. If you are using the SOAP connection mode, specify `ServiceClientFactoryProperties.DSC_SOAP_PROTOCOL`.
* **DSC_SERVER_TYPE**: Specifies the J2EE application server on which AEM Forms is deployed. Valid values are `JBoss`, `WebSphere`, `WebLogic`.

    * If you set this connection property to `WebSphere`, the `java.naming.factory.initial` value is set to `com.ibm.ws.naming.util.WsnInitCtxFactory`.
    * If you set this connection property to `WebLogic`, the `java.naming.factory.initial` value is set to `weblogic.jndi.WLInitialContextFactory`.
    * Likewise, if you set this connection property to `JBoss`, the `java.naming.factory.initial` value is set to `org.jnp.interfaces.NamingContextFactory`.
    * You can set the `java.naming.factory.initial` property to a value that meets your requirements if you do not want to use the default values.

   >[!NOTE]
   >
   >Instead of using a string to set the `DSC_SERVER_TYPE` connection property, you can use a static member of the `ServiceClientFactoryProperties` class. The following values can be used: `ServiceClientFactoryProperties.DSC_WEBSPHERE_SERVER_TYPE`, `ServiceClientFactoryProperties.DSC_WEBLOGIC_SERVER_TYPE`, or `ServiceClientFactoryProperties.DSC_JBOSS_SERVER_TYPE`.

* **DSC_CREDENTIAL_USERNAME:** Specifies the AEM forms user name. For a user to sucessfully invoke a AEM Forms service, they need the Services User role. A user can also have another role that includes the Service Invoke permission. Otherwise, an exception is thrown when they attempt to invoke a service. If service security is disabled, it is not necessary to specify this connection property.
* **DSC_CREDENTIAL_PASSWORD:** Specifies the corresponding password value. If service security is disabled, it is not necessary to specify this connection property.
* **DSC_REQUEST_TIMEOUT:** The default request timeout limit for the SOAP request is 1200000 milliseconds (20 minutes). Sometime, a request can require longer time to complete the operation. For example, a SOAP request that retrieves a large set of records can require a longer timeout limit. You can use the `ServiceClientFactoryProperties.DSC_REQUEST_TIMEOUT` to increase the request call timeout limit for the SOAP requests.

  **note**: Only SOAP-based invocations support the DSC_REQUEST_TIMEOUT property.

To set connection properties, perform the following tasks:

1. Create a `java.util.Properties` object by using its constructor.
1. To set the `DSC_DEFAULT_EJB_ENDPOINT` connection property, invoke the `java.util.Properties` object's `setProperty` method and pass the following values:

    * The `ServiceClientFactoryProperties.DSC_DEFAULT_EJB_ENDPOINT` enumeration value
    * A string value that specifies the URL of the J2EE application server that hosts AEM Forms

   >[!NOTE]
   >
   >If you are using the SOAP connection mode, specify the `ServiceClientFactoryProperties.DSC_DEFAULT_SOAP_ENDPOINT` enumeration value instead of the `ServiceClientFactoryProperties.DSC_DEFAULT_EJB_ENDPOINT` enumeration value.

1. To set the `DSC_TRANSPORT_PROTOCOL` connection property, invoke the `java.util.Properties` object's `setProperty` method and pass the following values:

    * The `ServiceClientFactoryProperties.DSC_TRANSPORT_PROTOCOL` enumeration value
    * The `ServiceClientFactoryProperties.DSC_EJB_PROTOCOL` enumeration value

   >[!NOTE]
   >
   >If you are using the SOAP connection mode, specify the `ServiceClientFactoryProperties.DSC_SOAP_PROTOCOL`enumeration value instead of the `ServiceClientFactoryProperties.DSC_EJB_PROTOCOL` enumeration value.

1. To set the `DSC_SERVER_TYPE` connection property, invoke the `java.util.Properties` object's `setProperty` method and pass the following values:

    * The `ServiceClientFactoryProperties.DSC_SERVER_TYPE`enumeration value
    * A string value that specifies the J2EE application server that hosts AEM Forms (for example, if AEM Forms is deployed on JBoss, specify `JBoss`).

        1. To set the `DSC_CREDENTIAL_USERNAME` connection property, invoke the `java.util.Properties` object's `setProperty` method and pass the following values:

    * The `ServiceClientFactoryProperties.DSC_CREDENTIAL_USERNAME` enumeration value
    * A string value that specifies the user name required to invoke AEM Forms

        1. To set the `DSC_CREDENTIAL_PASSWORD` connection property, invoke the `java.util.Properties` object's `setProperty` method and pass the following values:

    * The `ServiceClientFactoryProperties.DSC_CREDENTIAL_PASSWORD` enumeration value
    * A string value that specifies the corresponding password value

**Setting the EJB connection mode for JBoss**

The following Java code example sets connection properties to invoke AEM Forms deployed on JBoss and using the EJB connection mode.

```java
 Properties ConnectionProps = new Properties();
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_DEFAULT_EJB_ENDPOINT, "https://<hostname>:8080");
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_TRANSPORT_PROTOCOL,ServiceClientFactoryProperties.DSC_EJB_PROTOCOL);
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_SERVER_TYPE, "JBoss");
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_CREDENTIAL_USERNAME, "administrator");
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_CREDENTIAL_PASSWORD, "password");
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_DOCUMENT_HTTP_ENDPOINT,"https://<hostname>:8080");
```

**Setting the EJB connection mode for WebLogic**

The following Java code example sets connection properties to invoke AEM Forms deployed on WebLogic and using the EJB connection mode.

```java
 Properties ConnectionProps = new Properties();
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_DEFAULT_EJB_ENDPOINT, "t3://localhost:7001");
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_TRANSPORT_PROTOCOL,ServiceClientFactoryProperties.DSC_EJB_PROTOCOL);
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_SERVER_TYPE, "WebLogic");
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_CREDENTIAL_USERNAME, "administrator");
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_CREDENTIAL_PASSWORD, "password");
```

**Setting the EJB connection mode for WebSphere**

The following Java code example sets connection properties to invoke AEM Forms deployed on WebSphere and using the EJB connection mode.

```java
 Properties ConnectionProps = new Properties();
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_DEFAULT_EJB_ENDPOINT, "iiop://localhost:2809");
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_TRANSPORT_PROTOCOL,ServiceClientFactoryProperties.DSC_EJB_PROTOCOL);
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_SERVER_TYPE, "WebSphere");
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_CREDENTIAL_USERNAME, "administrator");
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_CREDENTIAL_PASSWORD, "password");
```

**Setting the SOAP connection mode**

The following Java code example sets connection properties in SOAP mode to invoke AEM Forms deployed on JBoss.

```java
 Properties ConnectionProps = new Properties();
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_DEFAULT_SOAP_ENDPOINT, "http://localhost:8080");
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_TRANSPORT_PROTOCOL,ServiceClientFactoryProperties.DSC_SOAP_PROTOCOL);
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_SERVER_TYPE, "JBoss");
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_CREDENTIAL_USERNAME, "administrator");
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_CREDENTIAL_PASSWORD, "password");
```

>[!NOTE]
>
>If you select the SOAP connection mode, ensure to include additional JAR files in your client application's class path.

**Setting connection properties when service security is disabled**

The following Java code example sets connection properties required to invoke AEM Forms deployed on JBoss Application Server and when service security is disabled.

```java
 Properties ConnectionProps = new Properties();
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_DEFAULT_EJB_ENDPOINT, "jnp://localhost:1099");
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_TRANSPORT_PROTOCOL,ServiceClientFactoryProperties.DSC_EJB_PROTOCOL);
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_SERVER_TYPE, "JBoss");
```

>[!NOTE]
>
>All Java Quick Starts associated with Programming with AEM Forms show both EJB and SOAP connection settings.

**Setting the SOAP connection mode with custom request timeout limit**

```java
 Properties ConnectionProps = new Properties();
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_DEFAULT_SOAP_ENDPOINT, "http://localhost:8080");
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_TRANSPORT_PROTOCOL,ServiceClientFactoryProperties.DSC_SOAP_PROTOCOL);
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_SERVER_TYPE, "JBoss");
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_CREDENTIAL_USERNAME, "administrator");
 ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_CREDENTIAL_PASSWORD, "password");
ConnectionProps.setProperty(ServiceClientFactoryProperties.DSC_REQUEST_TIMEOUT, "1800000"); // Request timeout limit 30 Minutes
```

**Using a Context object to invoke AEM Forms**

You can use a `com.adobe.idp.Context` object to invoke a AEM Forms service with an authenticated user (the `com.adobe.idp.Context` object represents an authenticated user). When using a `com.adobe.idp.Context` object, you do not need to set the `DSC_CREDENTIAL_USERNAME` or `DSC_CREDENTIAL_PASSWORD` properties. You can obtain a `com.adobe.idp.Context` object when authenicating users by using the `AuthenticationManagerServiceClient` object's `authenticate` method.

The `authenticate` method returns an `AuthResult` object that contains the results of the authentication. You can create a `com.adobe.idp.Context` object by invoking its constructor. Then invoke the `com.adobe.idp.Context` object's `initPrincipal` method and pass the `AuthResult` object, as shown in the following code:

```java
 Context myCtx = new Context();
 myCtx.initPrincipal(authResult);
```

Instead of setting the `DSC_CREDENTIAL_USERNAME` or `DSC_CREDENTIAL_PASSWORD` properties, you can invoke the `ServiceClientFactory` object's `setContext` method and pass the `com.adobe.idp.Context` object. When using an AEM forms user to invoke a service, ensure that they have the role named `Services User` that is required to invoke a AEM Forms service.

The following code example shows how to use a `com.adobe.idp.Context` object within connection settings that are used to create an `EncryptionServiceClient` object.

```java
 //Authenticate a user and use the Context object within connection settings
 // Authenticate the user
 String username = "wblue";
 String password = "password";
 AuthResult authResult = authClient.authenticate(username, password.getBytes());
 
 //Set a Content object that represents the authenticated user
 //Use the Context object to invoke the Encryption service
 Context myCtx = new Context();
 myCtx.initPrincipal(authResult);
 
 //Set connection settings
 Properties connectionProps = new Properties();
 connectionProps.setProperty(ServiceClientFactoryProperties.DSC_DEFAULT_EJB_ENDPOINT, "jnp://<server>:1099");
 connectionProps.setProperty(ServiceClientFactoryProperties.DSC_TRANSPORT_PROTOCOL, ServiceClientFactoryProperties.DSC_EJB_PROTOCOL);
 connectionProps.setProperty(ServiceClientFactoryProperties.DSC_SERVER_TYPE, ServiceClientFactoryProperties.DSC_JBOSS_SERVER_TYPE);
 connectionProps.setProperty(ServiceClientFactoryProperties.DSC_DOCUMENT_HTTP_ENDPOINT,"jnp://<server>:1099");

 
 //Create a ServiceClientFactory object
 ServiceClientFactory myFactory = ServiceClientFactory.createInstance(connectionProps);
 myFactory.setContext(myCtx);
 
 //Create an EncryptionServiceClient object
 EncryptionServiceClient encryptClient  = new EncryptionServiceClient(myFactory);
```

>[!NOTE]
>
>For complete details about authenticating a user, see [Authenticating Users](/help/forms/developing/users.md#authenticating-users).

### Invoking scenarios {#invoking_scenarios-1}

The following invoking scenarios are discussed in this section:

* A client application running in its own Java virtual machine (JVM) invokes a stand-alone AEM Forms instance.
* A client application running in its own JVM invokes clustered AEM Forms instances.

### Client application invoking a stand-alone AEM Forms instance {#client-application-invoking-a-stand-alone-aem-forms-instance}

The following diagram shows a client application running in its own JVM and invoking a stand-alone AEM Forms instance.

In this scenario, a client application is running in its own JVM and invokes AEM Forms services.

>[!NOTE]
>
>This scenario is the invoking scenario on which all Quick Starts are based.

### Client application invoking clustered AEM Forms instances {#client-application-invoking-clustered-aem-forms-instances}

The following diagram shows a client application running in its own JVM and invoking AEM Forms instances in a cluster.

This scenario is similar to a client application invoking a stand-alone AEM Forms instance. However, the provider URL is different. If a client application wants to connect to a specific J2EE application server, the application must change the URL to reference the specific J2EE application server.

Referencing a specific J2EE application server is not recommended because the connection between the client application and AEM Forms is terminated if the application server stops. It is recommended that the provider URL reference a cell-level JNDI manager, instead of a specific J2EE application server.

Client applications that use the SOAP connection mode can use the HTTP load balancer port for the cluster. Client applications that use the EJB connection mode can connect to the EJB port of a specific J2EE application server. This action handles the Load Balancing between cluster nodes.

**WebSphere**

The following example shows the contents of a jndi.properties file that is used to connect to AEM Forms that is deployed on WebSphere.

```ini
 java.naming.factory.initial=com.ibm.websphere.naming.
 WsnInitialContextFactory
 java.naming.provider.url=corbaloc::appserver1:9810,:appserver2:9810
```

**WebLogic**

The following example shows the contents of a jndi.properties file that is used to connect to AEM Forms that is deployed on WebLogic.

```ini
 java.naming.factory.initial=weblogic.jndi.WLInitialContextFactory
 java.naming.provider.url=t3://appserver1:8001, appserver2:8001
```

**JBoss**

The following example shows the contents of a jndi.properties file that is used to connect to AEM Forms that is deployed on JBoss.

```ini
 java.naming.factory.initial= org.jnp.interfaces.NamingContextFactory
 java.naming.provider.url= jnp://appserver1:1099, appserver2:1099,
 appserver3:1099
```

>[!NOTE]
>
>Consult your administrator to determine the J2EE application server name and port number.

**See also**

[Including AEM Forms Java library files](invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Passing data to AEM Forms services using the Java API](invoking-aem-forms-using-java.md#passing-data-to-aem-forms-services-using-the-java-api)

[Invoking a service using a Java client library](invoking-aem-forms-using-java.md#invoking-a-service-using-a-java-client-library)

## Passing data to AEM Forms services using the Java API {#passing-data-to-aem-forms-services-using-the-java-api}

AEM Forms service operations typically consume or produce PDF documents. When you invoke a service, sometimes it is necessary to pass a PDF document (or other document types such as XML data) to the service. Likewise sometimes it is necessary to handle a PDF document that is returned from the service. The Java class that enables you to pass data to and from AEM Forms services is `com.adobe.idp.Document`.

AEM Forms services do not accept a PDF document as other data types, such as a `java.io.InputStream` object or a byte array. A `com.adobe.idp.Document` object can also be used to pass other types of data, such as XML data, to services.

A `com.adobe.idp.Document` object is a Java serializable type, so it can be passed over an RMI call. The receiving side can be collocated (same host, same class loader), local (same host, different class loader), or remote (different host). Passing of document content is optimized for each case. For example, if the sender and receiver are located on the same host, the content is passed over a local file system. (In some cases, documents can be passed in memory.)

Depending on the `com.adobe.idp.Document` object size, the data is carried within the `com.adobe.idp.Document` object or stored on the server's file system. Any temporary storage resources occupied by the `com.adobe.idp.Document` object are removed automatically upon the `com.adobe.idp.Document` disposal. (See [Disposing Document objects](invoking-aem-forms-using-java.md#disposing-document-objects).)

Sometimes it is necessary to know the content type of a `com.adobe.idp.Document` object before you can pass it to a service. For example, if an operation requires a specific content type, such as `application/pdf`, it is recommended that you determine the content type. (See [Determining the content type of a document](invoking-aem-forms-using-java.md#determining-the-content-type-of-a-document).)

The `com.adobe.idp.Document` object attempts to determine the content type using the supplied data. If the content type cannot be retrieved from the data supplied (for example, when the data was supplied as a byte array), set the content type. To set the content type, invoke the `com.adobe.idp.Document` object's `setContentType` method. (See [Determining the content type of a document](invoking-aem-forms-using-java.md#determining-the-content-type-of-a-document))

If collateral files reside on the same file system, creating a `com.adobe.idp.Document` object is faster. If collateral files reside on remote file systems, a copy operation must be done, which affects performance.

An application can contain both `com.adobe.idp.Document` and `org.w3c.dom.Document` data types. However, ensure that you fully qualify the `org.w3c.dom.Document` data type. For information about converting a `org.w3c.dom.Document` object to a `com.adobe.idp.Document` object, see [Quick Start (EJB mode): Prepopulating Forms with Flowable Layouts using the Java API](/help/forms/developing/forms-service-api-quick-starts.md#quick-start-soap-mode-prepopulating-forms-with-flowable-layouts-using-the-java-api).

>[!NOTE]
>
>To prevent a memory leak in WebLogic while using a `com.adobe.idp.Document` object, read the document information in chunks of 2048 bytes or less. For example, the following code reads the document information in chunks of 2048 bytes:

```java
        // Set up the chunk size to prevent a potential memory leak
        int buffSize = 2048;
 
        // Determine the total number of bytes to read
        int docLength = (int) inDoc.length();
        byte [] byteDoc = new byte[docLength];
 
        // Set up the reading position
        int pos = 0;
 
        // Loop through the document information, 2048 bytes at a time
        while (docLength > 0) {
      // Read the next chunk of information
            int toRead = Math.min(buffSize, docLength);
            int bytesRead = inDoc.read(pos, byteDoc, pos, toRead);
 
            // Handle the exception in case data retrieval failed
            if (bytesRead == -1) {
 
                inDoc.doneReading();
                inDoc.dispose();
                throw new RuntimeException("Data retrieval failed!");
 
            }
 
             // Update the reading position and number of bytes remaining
             pos += bytesRead;
             docLength -= bytesRead;
 
        }
 
        // The document information has been successfully read
        inDoc.doneReading();
        inDoc.dispose();
```

**See also**

[Invoking AEM Forms using the Java API](invoking-aem-forms-using-java.md#invoking-aem-forms-using-the-java-api)

[Setting connection properties](invoking-aem-forms-using-java.md#setting-connection-properties)

### Creating documents {#creating-documents}

Create a `com.adobe.idp.Document` object before you invoke a service operation that requires a PDF document (or other document types) as an input value. The `com.adobe.idp.Document` class provides constructors that enable you to create a document from the following content types:

* A byte array
* An existing `com.adobe.idp.Document` object
* A `java.io.File` object
* A `java.io.InputStream` object
* A `java.net.URL` object

#### Creating a document based on a byte array {#creating-a-document-based-on-a-byte-array}

The following code example creates a `com.adobe.idp.Document` object that is based on a byte array.

**Creating a Document object that is based on a byte array**

```java
 Document myPDFDocument = new Document(myByteArray);
```

#### Creating a document based on another document {#creating-a-document-based-on-another-document}

The following code example creates a `com.adobe.idp.Document` object that is based on another `com.adobe.idp.Document` object.

**Creating a Document object that is based on another document**

```java
 //Create a Document object based on a byte array
 InputStream is = new FileInputStream("C:\\Map.pdf");
 int len = is.available();
 byte [] myByteArray = new byte[len];
 int i = 0;
 while (i < len) {
       i += is.read(myByteArray, i, len);
 }
 Document myPDFDocument = new Document(myByteArray);
 
 //Create another Document object
 Document anotherDocument = new Document(myPDFDocument);
```

#### Creating a document based on a file {#creating-a-document-based-on-a-file}

The following code example creates a `com.adobe.idp.Document` object that is based on a PDF file named *map.pdf*. This file is in the root of the C hard drive. This constructor attempts to set the MIME content type of the `com.adobe.idp.Document` object using the filename extension.

The `com.adobe.idp.Document` constructor that accepts a `java.io.File` object also accepts a Boolean parameter. By setting this parameter to `true`, the `com.adobe.idp.Document` object deletes the file. This action means that you do not have to remove the file after passing it to the `com.adobe.idp.Document` constructor.

Setting this parameter to `false` means that you retain ownership of this file. Setting this parameter to `true` is more efficient. The reason is because the `com.adobe.idp.Document` object can move the file directly to the local managed area instead of copying it (which is slower).

**Creating a Document object that is based on a PDF file**

```java
 //Create a Document object based on the map.pdf source file
 File mySourceMap = new File("C:\\map.pdf");
 Document myPDFDocument = new Document(mySourceMap,true);
```

#### Creating a document based on an InputStream object {#creating-a-document-based-on-an-inputstream-object}

The following Java code example creates a `com.adobe.idp.Document` object that is based on a `java.io.InputStream` object.

**Creating a document based on an InputStream object**

```java
 //Create a Document object based on an InputStream object
 InputStream is = new FileInputStream("C:\\Map.pdf");
 Document myPDFDocument = new Document(is);
```

#### Creating a document based on content accessible from a URL {#creating-a-document-based-on-content-accessible-from-an-url}

The following Java code example creates a `com.adobe.idp.Document` object that is based on a PDF file named *map.pdf*. This file is located within a web application named `WebApp` that is running on `localhost`. This constructor attempts to set the `com.adobe.idp.Document` object's MIME content type using the content type returned with the URL protocol.

The URL supplied to the `com.adobe.idp.Document` object is always read at the side where the original `com.adobe.idp.Document` object is created, as shown in this example:

```java
     Document doc = new Document(new java.net.URL("file:c:/temp/input.pdf"));
```

The c:/temp/input.pdf file must be located on the client computer (not on the server computer). The client computer is where the URL is read and where the `com.adobe.idp.Document` object was created.

**Creating a document based on content accessible from a URL**

```java
 //Create a Document object based on a java.net.URL object
 URL myURL = new URL("http", "localhost", 8080,"/WebApp/map.pdf");
 
 //Create another Document object
 Document myPDFDocument = new Document(myURL);
```

**See also**

[Invoking AEM Forms using the Java API](invoking-aem-forms-using-java.md#invoking-aem-forms-using-the-java-api)

[Setting connection properties](invoking-aem-forms-using-java.md#setting-connection-properties)

### Handling returned documents {#handling-returned-documents}

Service operations that return a PDF document (or other data types such as XML data) as an output value return a `com.adobe.idp.Document` object. After you receive a `com.adobe.idp.Document` object, you can convert it to the following formats:

* A `java.io.File` object
* A `java.io.InputStream` object
* A byte array

The following line of code converts a `com.adobe.idp.Document` object to a `java.io.InputStream` object. Assume that `myPDFDocument` represents a `com.adobe.idp.Document` object:

```java
     java.io.InputStream resultStream = myDocument.getInputStream();
```

Likewise, you can copy the contents of a `com.adobe.idp.Document` to a local file by performing the following tasks:

1. Create a `java.io.File` object.
1. Invoke the `com.adobe.idp.Document` object's `copyToFile` method and pass the `java.io.File`object.

The following code example copies the contents of a `com.adobe.idp.Document` object to a file named *AnotherMap.pdf*.

**Copying the contents of a document object to a file**

```java
 File outFile = new File("C:\\AnotherMap.pdf");
 myDocument.copyToFile (outFile);
```

**See also**

[Invoking AEM Forms using the Java API](invoking-aem-forms-using-java.md#invoking-aem-forms-using-the-java-api)

[Setting connection properties](invoking-aem-forms-using-java.md#setting-connection-properties)

### Determining the content type of a document {#determining-the-content-type-of-a-document}

Determine the MIME type of a `com.adobe.idp.Document` object by invoking the `com.adobe.idp.Document` object's `getContentType` method. This method returns a string value that specifies the content type of the `com.adobe.idp.Document` object. The following table describes the different content types that AEM Forms returns.

<table>
 <thead>
  <tr>
   <th><p>MIME type</p></th>
   <th><p>Description</p></th>
  </tr>
 </thead>
 <tbody>
  <tr>
   <td><p><code>application/pdf</code></p></td>
   <td><p>PDF document</p></td>
  </tr>
  <tr>
   <td><p><code>application/vnd.adobe.xdp+xml</code></p></td>
   <td><p>XML Data Packaging (XDP), which is used for exported XML Forms Architecture (XFA) forms</p></td>
  </tr>
  <tr>
   <td><p><code>text/xml</code></p></td>
   <td><p>Bookmarks, attachments, or other XML documents</p></td>
  </tr>
  <tr>
   <td><p><code>application/vnd.fdf</code></p></td>
   <td><p>Forms Data Format (FDF), which is used for exported Acrobat forms</p></td>
  </tr>
  <tr>
   <td><p><code>application/vnd.adobe.xfdf</code></p></td>
   <td><p>XML Forms Data Format (XFDF), which is used for exported Acrobat forms</p></td>
  </tr>
  <tr>
   <td><p><code>application/rdf+xml</code></p></td>
   <td><p>Rich data format and XML</p></td>
  </tr>
  <tr>
   <td><p><code>application/octet-stream</code></p></td>
   <td><p>Generic data format</p></td>
  </tr>
  <tr>
   <td><p><code>NULL</code></p></td>
   <td><p>Unspecified MIME type</p></td>
  </tr>
 </tbody>
</table>

The following code example determines the content type of a `com.adobe.idp.Document` object.

**Determining the content type of a Document object**

```java
 //Determine the content type of the Document object
 String ct = myDocument.getContentType();
 System.out.println("The content type of the Document object is " +ct);
```

**See also**

[Invoking AEM Forms using the Java API](invoking-aem-forms-using-java.md#invoking-aem-forms-using-the-java-api)

[Setting connection properties](invoking-aem-forms-using-java.md#setting-connection-properties)

### Disposing Document objects {#disposing-document-objects}

When you no longer require a `Document` object, it is recommended that you dispose of it by invoking its `dispose` method. Each `Document` object consumes a file descriptor and as much as 75 MB of RAM space on your application's host platform. If a `Document` object is not disposed, then the Java Garage collection process disposes it. However, by disposing of it sooner by using the `dispose` method, you can free the memory occupied by the `Document` object.

**See also**

[Invoking AEM Forms using the Java API](invoking-aem-forms-using-java.md#invoking-aem-forms-using-the-java-api)

[Including AEM Forms Java library files](invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Invoking a service using a Java client library](invoking-aem-forms-using-java.md#invoking-a-service-using-a-java-client-library)

## Invoking a service using a Java client library {#invoking-a-service-using-a-java-client-library}

AEM Forms service operations can be invoked by using a service's strongly typed API, which is known as a Java client library. A *Java client library* is a set of concrete classes that provide access to services deployed in the service container. You instantiate a Java object that represents the service to invoke instead of creating an `InvocationRequest` object by using the Invocation API. The Invocation API is used to invoke processes, such as long-lived processes, created in Workbench. (See [Invoking Human-Centric Long-Lived Processes](/help/forms/developing/invoking-human-centric-long-lived.md#invoking-human-centric-long-lived-processes).)

To perform a service operation, invoke a method that belongs to the Java object. A Java client library contains methods that typically map one-to-one with service operations. When using a Java client library, set required connection properties. (See [Setting connection properties](invoking-aem-forms-using-java.md#setting-connection-properties).)

After you set connection properties, create a `ServiceClientFactory` object that is used to instantiate a Java object that lets you invoke a service. Each service that has a Java client library has a corresponding client object. For example, to invoke the Repository service, create a `ResourceRepositoryClient` object by using its constructor and passing the `ServiceClientFactory` object. The `ServiceClientFactory` object is responsible for maintaining connection settings that are required to invoke AEM Forms services.

Although obtaining a `ServiceClientFactory` is typically fast, some overhead is involved when the factory is first used. This object is optimized for reuse and therefore, when possible, use the same `ServiceClientFactory` object when you are creating multiple Java client objects. That is, do not create a separate `ServiceClientFactory` object for each client library object that you create.

There is a User Manager setting that controls the lifetime of the SAML assertion that is inside the `com.adobe.idp.Context` object that affects the `ServiceClientFactory` object. This setting controls all authentication context lifetimes throughout AEM Forms, including all invocations performed by using the Java API. By default, the time period in which a `ServiceCleintFactory` object can be used is two hours.

>[!NOTE]
>
>To explain how to invoke a service by using the Java API, the Repository service's `writeResource` operation is invoked. This operation places a new resource into the repository.

You can invoke the Repository service by using a Java client library and by performing the following steps:

1. Include client JAR files, such as the adobe-repository-client.jar, in your Java project's class path. For information about the location of these files, see [Including AEM Forms Java library files](invoking-aem-forms-using-java.md#including-aem-forms-java-library-files).
1. Set connection properties that are required to invoke a service.
1. Create a `ServiceClientFactory` object by invoking the `ServiceClientFactory` object's static `createInstance` method and passing the `java.util.Properties` object that contains connection properties.
1. Create a `ResourceRepositoryClient` object by using its constructor and passing the `ServiceClientFactory` object. Use the `ResourceRepositoryClient` object to invoke Repository service operations.
1. Create a `RepositoryInfomodelFactoryBean` object by using its constructor and pass `null`. This object lets you create a `Resource` object that represents the content that is added to the repository.
1. Create a `Resource` object by invoking the `RepositoryInfomodelFactoryBean` object's `newImage` method and passing the following values:

    * A unique ID value by specifying `new Id()`.
    * A unique UUID value by specifying `new Lid()`.
    * The name of the resource. You can specify the file name of the XDP file.

   Cast the return value to `Resource`.

1. Create a `ResourceContent` object by invoking the `RepositoryInfomodelFactoryBean` object's `newImage` method and casting the return value to `ResourceContent`. This object represents the content that is added to the repository.
1. Create a `com.adobe.idp.Document` object by passing a `java.io.FileInputStream` object that stores the XDP file to add to the repository. (See [Creating a document based on an InputStream object](invoking-aem-forms-using-java.md#creating-a-document-based-on-an-inputstream-object).)
1. Add the content of the `com.adobe.idp.Document` object to the `ResourceContent` object by invoking the `ResourceContent` object's `setDataDocument` method. Pass the `com.adobe.idp.Document` object.
1. Set the MIME type of the XDP file to add to the repository by invoking the `ResourceContent` object's `setMimeType` method and passing `application/vnd.adobe.xdp+xml`.
1. Add the content of the `ResourceContent` object to the `Resource` object by invoking the `Resource` object 's `setContent` method and passing the `ResourceContent` object.
1. Add a description of the resource by invoking the `Resource` object 's `setDescription` method and passing a string value that represents a description of the resource.
1. Add the form design to the repository by invoking the `ResourceRepositoryClient` object's `writeResource` method and passing the following values:

    * A string value that specifies the path to the resource collection that contains the new resource
    * The `Resource` object that was created

**See also**

[Quick Start (EJB mode): Writing a resource using the Java API](/help/forms/developing/repository-service-api-quick-starts.md#quick-start-soap-mode-writing-a-resource-using-the-java-api)

[Invoking AEM Forms using the Java API](invoking-aem-forms-using-java.md#invoking-aem-forms-using-the-java-api)

[Including AEM Forms Java library files](invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

## Invoking a short-lived process using the Invocation API {#invoking-a-short-lived-process-using-the-invocation-api}

You can invoke a short-lived process using the Java Invocation API. When you invoke a short-lived process using the Invocation API, you pass required parameter values by using a `java.util.HashMap` object. For each parameter to pass to a service, invoke the `java.util.HashMap` object's `put` method and specify the name-value pair that is required by the service to perform the specified operation. Specify the exact name of the parameters that belong to the short-lived process.

>[!NOTE]
>
>For information about invoking a long-lived process, see [Invoking Human-Centric Long-Lived Processes](/help/forms/developing/invoking-human-centric-long-lived.md#invoking-human-centric-long-lived-processes).

The discussion here is about using Invocation API to invoke the following AEM Forms short-lived process named `MyApplication/EncryptDocument`.

>[!NOTE]
>
>This process is not based on an existing AEM Forms process. To follow along with the code example, create a process named `MyApplication/EncryptDocument` using Workbench. (See [Using Workbench](https://www.adobe.com/go/learn_aemforms_workbench_63).)

When this process is invoked, it performs the following actions:

1. Obtains the unsecured PDF document that is passed to the process. This action is based on the `SetValue` operation. The input parameter for this process is a `document` process variable named `inDoc`.
1. Encrypts the PDF document with a password. This action is based on the `PasswordEncryptPDF` operation. The password encrypted PDF document is returned in a process variable named `outDoc`.

### Invoke the MyApplication/EncryptDocument short-lived process using the Java invocation API {#invoke-the-myapplication-encryptdocument-short-lived-process-using-the-java-invocation-api}

Invoke the `MyApplication/EncryptDocument` short-lived process using the Java invocation API:

1. Include client JAR files, such as the adobe-livecycle-client.jar, in your Java project's class path. (See [Including AEM Forms Java library files](invoking-aem-forms-using-java.md#including-aem-forms-java-library-files).)
1. Create a `ServiceClientFactory` object that contains connection properties. (See [Setting connection properties](invoking-aem-forms-using-java.md#setting-connection-properties).)
1. Create a `ServiceClient` object by using its constructor and passing the `ServiceClientFactory` object. A `ServiceClient` object lets you invoke a service operation. It handles tasks such as locating, dispatching, and routing invocation requests.
1. Create a `java.util.HashMap` object by using its constructor.
1. Invoke the `java.util.HashMap` object's `put` method for each input parameter to pass to the long-lived process. Because the `MyApplication/EncryptDocument` short-lived process requires one input parameter of type `Document`, you only have to invoke the `put` method once, as shown in the following example.

   ```java
    //Create a Map object to store the parameter value for inDoc
    Map params = new HashMap();
    InputStream inFile = new FileInputStream("C:\\Adobe\Loan.pdf");
    Document inDoc = new Document(inFile);
    params.put("inDoc", inDoc);
   ```

1. Create an `InvocationRequest` object by invoking the `ServiceClientFactory` object's `createInvocationRequest` method and passing the following values:

    * A string value that specifies the name of the long-lived process to invoke. To invoke the `MyApplication/EncryptDocument` process, specify `MyApplication/EncryptDocument`.
    * A string value that represents the process operation name. Typically the name of a short-lived process operation is `invoke`.
    * The `java.util.HashMap` object that contains the parameter values that the service operation requires.
    * A Boolean value that specifies `true`, which creates a synchronous request (this value is applicable to invoke a short-lived process).

1. Send the invocation request to the service by invoking the `ServiceClient` object's `invoke` method and passing the `InvocationRequest` object. The `invoke` method returns an `InvocationReponse` object.

   >[!NOTE]
   >
   >A long-lived process can be invoked by passing the value `false`as the fourth parameter of the `createInvocationRequest` method. Passing the value `false`*creates an asynchronous request.*

1. Retrieve the process's return value by invoking the `InvocationReponse` object's `getOutputParameter` method and passing a string value that specifies the name of the output parameter. In this situation, specify `outDoc` ( `outDoc` is the name of the output parameter for the `MyApplication/EncryptDocument` process). Cast the return value to `Document`, as shown in the following example.

   ```java
    InvocationResponse response = myServiceClient.invoke(request);
    Document encryptDoc = (Document) response.getOutputParameter("outDoc");
   ```

1. Create a `java.io.File` object and ensure that the file extension is .pdf.
1. Invoke the `com.adobe.idp.Document` object's `copyToFile` method to copy the contents of the `com.adobe.idp.Document` object to the file. Ensure that you use the `com.adobe.idp.Document` object that was returned by the `getOutputParameter` method.

**See also**

[Quick Start: Invoking a short-lived process using the Invocation API](/help/forms/developing/invocation-api-quick-starts.md#quick-start-invoking-a-short-lived-process-using-the-invocation-api)

[Invoking Human-Centric Long-Lived Processes](/help/forms/developing/invoking-human-centric-long-lived.md#invoking-human-centric-long-lived-processes)

[Including AEM Forms Java library files](invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

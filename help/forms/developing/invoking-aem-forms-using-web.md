---
title: Invoking AEM Forms using Web Services
description: Invoke AEM Forms processes using web services with full support for WSDL generation.
contentOwner: admin
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: coding
role: Developer
exl-id: 3139564f-9346-4933-8e39-2e1642bff097
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms, API
---
# Invoking AEM Forms using Web Services {#invoking-aem-forms-using-web-services} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

Most AEM Forms services in the service container are configured to expose a web service, with full support for web service definition language (WSDL) generation. That is, you can create proxy objects that consume the native SOAP stack of an AEM Forms service. As a result, AEM Forms services can exchange and process the following SOAP messages:

* **SOAP request**: Sent to a Forms service by a client application requesting an action.
* **SOAP response**: Sent to a client application by a Forms service after a SOAP request is processed.

Using web services, you can perform the same AEM Forms services operations that you can by using the Java API. A benefit of using web services to invoke AEM Forms services is that you can create a client application in a development environment that supports SOAP. A client application is not bound to a specific development environment or programming language. For example, you can create a client application using Microsoft Visual Studio .NET and C# as the programming language.

AEM Forms services are exposed over the SOAP protocol and are WSI Basic Profile 1.1 compliant. Web Services Interoperability (WSI) is an open standards organization that promotes web service interoperability across platforms. For information, see [https://www.ws-i.org/](https://www.ws-i.org).

AEM Forms supports the following web service standards:

* **Encoding**: Supports only document and literal encoding (which is the preferred encoding according to the WSI Basic Profile). (See [Invoking AEM Forms using Base64 encoding](#invoking-aem-forms-using-base64-encoding).)
* **MTOM**: Represents a way to encode attachments with SOAP requests. (See [Invoking AEM Forms using MTOM](#invoking-aem-forms-using-mtom).)
* **SwaRef**: Represents another way to encode attachments with SOAP requests. (See [Invoking AEM Forms using SwaRef](#invoking-aem-forms-using-swaref).)
* **SOAP with attachments**: Supports both MIME and DIME (Direct Internet Message Encapsulation). These protocols are standard ways of sending attachments over SOAP. Microsoft Visual Studio .NET applications use DIME. (See [Invoking AEM Forms using Base64 encoding](#invoking-aem-forms-using-base64-encoding).)
* **WS-Security**: Supports a user name password token profile, which is a standard way of sending user names and passwords as part of the WS Security SOAP header. AEM Forms also supports HTTP basic authentication. s

To invoke AEM Forms services using a web service, typically you create a proxy library that consumes the service WSDL. The *Invoking AEM Forms using Web Services* section uses JAX-WS to create Java proxy classes to invoke services. (See [Creating Java proxy classes using JAX-WS](#creating-java-proxy-classes-using-jax-ws).)

You can retrieve a service WDSL by specifying the following URL definition (items in brackets are optional):

```java
 https://<your_serverhost>:<your_port>/soap/services/<service_name>?wsdl[&version=<version>][&async=true|false][lc_version=<lc_version>]
```

where:

* *your_serverhost* represents the IP address of the J2EE application server hosting AEM Forms.
* *your_port* represents the HTTP port that the J2EE application server uses.
* *service_name* represents the service name.
* *version* represents the target version of a service (the latest service version is used by default).
* `async` specifies the value `true` to enable additional operations for asynchronous invocation ( `false` by default).
* *lc_version* represents the version of AEM Forms that you want to invoke.

The following table lists service WSDL definitions (assuming that AEM Forms is deployed on the local host and the post is 8080).

<table>
 <thead>
  <tr>
   <th><p>Service</p></th>
   <th><p>WSDL definition</p></th>
  </tr>
 </thead>
 <tbody>
  <tr>
   <td><p>Assembler</p></td>
   <td><p><code>http://localhost:8080/soap/services/ AssemblerService?wsdl</code></p></td>
  </tr>
  <tr>
   <td><p>Back and Restore</p></td>
   <td><p><code>http://localhost:8080/soap/services/BackupService?wsdl</code></p></td>
  </tr>
  <tr>
   <td><p>barcoded forms</p></td>
   <td><p><code>http://localhost:8080/soap/services/ BarcodedFormsService?wsdl</code></p></td>
  </tr>
  <tr>
   <td><p>Convert PDF</p></td>
   <td><p><code>http://localhost:8080/soap/services/ ConvertPDFService?wsdl</code></p></td>
  </tr>
  <tr>
   <td><p>Distiller</p></td>
   <td><p><code>http://localhost:8080/soap/services/ DistillerService?wsdl</code></p></td>
  </tr>
  <tr>
   <td><p>DocConverter </p></td>
   <td><p><code>http://localhost:8080/soap/services/DocConverterService?WSDL</code></p></td>
  </tr>
  <tr>
   <td><p>DocumentManagement</p></td>
   <td><p><code>http://localhost:8080/soap/services/DocumentManagementService?WSDL</code></p></td>
  </tr>
  <tr>
   <td><p>Encryption </p></td>
   <td><p><code>http://localhost:8080/soap/services/EncryptionService?wsdl</code></p></td>
  </tr>
  <tr>
   <td><p>Forms</p></td>
   <td><p><code>http://localhost:8080/soap/services/FormsService?wsdl</code></p></td>
  </tr>
  <tr>
   <td><p>Form Data Integration</p></td>
   <td><p><code>http://localhost:8080/soap/services/FormDataIntegration?wsdl</code></p></td>
  </tr>
  <tr>
   <td><p>Generate PDF</p></td>
   <td><p><code>http://localhost:8080/soap/services/ GeneratePDFService?wsdl</code></p></td>
  </tr>
  <tr>
   <td><p>Generate 3D PDF</p></td>
   <td><p><code>http://localhost:8080/soap/services/Generate3dPDFService?WSDL</code></p></td>
  </tr>
  <tr>
   <td><p>Output</p></td>
   <td><p><code>http://localhost:8080/soap/services/ OutputService?wsdl</code></p></td>
  </tr>
  <tr>
   <td><p>PDF Utilities </p></td>
   <td><p><code>http://localhost:8080/soap/services/ PDFUtilityService?wsdl</code></p></td>
  </tr>
  <tr>
   <td><p>Acrobat Reader DC extensions</p></td>
   <td><p><code>http://localhost:8080/soap/services/ ReaderExtensionsService?wsdl</code></p></td>
  </tr>
  <tr>
   <td><p>Repository</p></td>
   <td><p><code>http://localhost:8080/soap/services/ RepositoryService?wsdl</code></p></td>
  </tr>
  <tr>
   <td><p>Rights Management </p></td>
   <td><p><code>http://localhost:8080/soap/services/ RightsManagementService?wsdl</code></p></td>
  </tr>
  <tr>
   <td><p>Signature </p></td>
   <td><p><code>http://localhost:8080/soap/services/ SignatureService?wsdl</code></p></td>
  </tr>
  <tr>
   <td><p>XMP Utilities</p></td>
   <td><p><code>http://localhost:8080/soap/services/ XMPUtilityService?wsdl</code></p></td>
  </tr>
 </tbody>
</table>

**AEM Forms Process WSDL definitions**

Specify the Application name and the Process name within the WSDL definition to access a WSDL that belongs to a process created in Workbench. Assume that the name of the application is `MyApplication` and the name of the process is `EncryptDocument`. In this situation, specify the following WSDL definition:

```java
 http://localhost:8080/soap/services/MyApplication/EncryptDocument?wsdl
```

>[!NOTE]
>
>For information about the example `MyApplication/EncryptDocument` short-lived process, see [Short lived process example](/help/forms/developing/aem-forms-processes.md).

>[!NOTE]
>
>An Application can contain folder(s). In this case, specify the folder name(s) in the WSDL definition:

```java
 http://localhost:8080/soap/services/MyApplication/[<folderA>/.../<folderZ>/]EncryptDocument?wsdl
```

**Accessing new functionality using web services**

New AEM Forms service functionality can be accessed using web services. For example, in AEM Forms, the ability to encode attachments using MTOM is introduced. (See [Invoking AEM Forms using MTOM](#invoking-aem-forms-using-mtom).)

To access new functionality introduced in AEM Forms, specify the `lc_version` attribute in the WSDL definition. For example, to access new service functionality (including MTOM support), specify the following WSDL definition:

```java
 http://localhost:8080/soap/services/MyApplication/EncryptDocument?wsdl&lc_version=9.0.1
```

>[!NOTE]
>
>When setting the `lc_version` attribute, ensure that you use three digits. For example, 9.0.1 is equal to version 9.0.

**Web service BLOB data type**

AEM Forms service WSDLs define many data types. One of the most important data types exposed in a web service is a `BLOB` type. This data type maps to the `com.adobe.idp.Document` class when working with AEM Forms Java APIs. (See [Passing data to AEM Forms services using the Java API](/help/forms/developing/invoking-aem-forms-using-java.md#passing-data-to-aem-forms-services-using-the-java-api).)

A `BLOB` object sends and retrieves binary data (for example, PDF files, XML data, and so on) to and from AEM Forms services. The `BLOB` type is defined in a service WSDL as follows:

```xml
 <complexType name="BLOB">
     <sequence>
         <element maxOccurs="1" minOccurs="0" name="contentType"
             type="xsd:string"/>
         <element maxOccurs="1" minOccurs="0" name="binaryData"
             type="xsd:base64Binary"/>
         <element maxOccurs="1" minOccurs="0" name="attachmentID"
             type="xsd:string"/>
         <element maxOccurs="1" minOccurs="0" name="remoteURL"
             type="xsd:string"/>
         <element maxOccurs="1" minOccurs="0" name="MTOM"
             type="xsd:base64Binary"
             xmime:expectedContentTypes="*/*"
             xmlns:xmime="https://www.w3.org/2005/05/xmlmime"/>
         <element maxOccurs="1" minOccurs="0" name="swaRef"
             type="tns1:swaRef"/>
         <element maxOccurs="1" minOccurs="0" name="attributes"
             type="impl:MyMapOf_xsd_string_To_xsd_anyType"/>
     </sequence>
 </complexType>
```

The `MTOM` and `swaRef` fields are supported only in AEM Forms. You can use those new fields only if you specify a URL that includes the `lc_version` property.

**Supplying BLOB objects in service requests**

If an AEM Forms service operation requires a `BLOB` type as an input value, create an instance of the `BLOB` type in your application logic. (Many of the web service quick starts in *Programming with AEM forms* show how to work with a BLOB data type.)

Assign values to fields that belong to the `BLOB` instance as follows:

* **Base64**: To pass data as text encoded in a Base64 format, set the data in the `BLOB.binaryData` field and set the data type in the MIME format (for example, `application/pdf`) in the `BLOB.contentType` field. (See [Invoking AEM Forms using Base64 encoding](#invoking-aem-forms-using-base64-encoding).)
* **MTOM**: To pass binary data in an MTOM attachment, set the data in the `BLOB.MTOM` field. This setting attaches the data to the SOAP request using the Java JAX-WS framework or the SOAP framework's native API. (See [Invoking AEM Forms using MTOM](#invoking-aem-forms-using-mtom).)
* **SwaRef**: To pass binary data in an WS-I SwaRef attachment, set the data in the `BLOB.swaRef` field. This setting attaches the data to the SOAP request using the Java JAX-WS framework. (See [Invoking AEM Forms using SwaRef](#invoking-aem-forms-using-swaref).)
* **MIME or DIME attachment**: To pass data in a MIME or DIME attachment, attach the data to the SOAP request using the SOAP framework's native API. Set the attachment identifier in the `BLOB.attachmentID` field. (See [Invoking AEM Forms using Base64 encoding](#invoking-aem-forms-using-base64-encoding).)
* **Remote URL**: If data is hosted on a web server and accessible over an HTTP URL, set the HTTP URL in the `BLOB.remoteURL` field. (See [Invoking AEM Forms using BLOB data over HTTP](#invoking-aem-forms-using-blob-data-over-http).)

**Accessing data in BLOB objects returned from services**

The transmission protocol for returned `BLOB` objects depends on several factors, which are considered in the following order, stopping when the main condition is satisfied:

1. **Target URL specifies transmission protocol**. If the target URL specified at the SOAP invocation contains the parameter `blob="`*BLOB_TYPE*", then *BLOB_TYPE* determines the transmission protocol. *BLOB_TYPE* is a placeholder for base64, dime, mime, http, mtom, or swaref.
1. **Service SOAP endpoint is Smart**. If the following conditions are true, then the output documents are returned using the same transmission protocol as the input documents:

    * Service's SOAP endpoint parameter Default Protocol For Output Blob Objects is set to Smart.

      For each service with a SOAP endpoint, the administration console lets you specify the transmission protocol for any returned blobs. (See [administration help](https://www.adobe.com/go/learn_aemforms_admin_63).)

    * AEM Forms service takes one or more documents as input.

1. **Service SOAP endpoint is not Smart**. The configured protocol determines the document transmission protocol, and the data is returned in the corresponding `BLOB` field. For example, if the SOAP endpoint is set to DIME, then the returned blob is in the `blob.attachmentID` field regardless of the transmission protocol of any input document.
1. **Otherwise**. If a service does not take the document type as input, then the output documents are returned in the `BLOB.remoteURL` field over the HTTP protocol.

As described in the first condition, you can ensure the transmission type for any returned documents by extending the SOAP endpoint URL with a suffix as follows:

```java
     https://<your_serverhost>:<your_port>/soap/services/<service
     name>?blob=base64|dime|mime|http|mtom|swaref
```

Here is the correlation between transmission types and the field from which you obtain the data:

* **Base64 format**: Set the `blob` suffix to `base64` to return the data in the `BLOB.binaryData` field.
* **MIME or DIME attachment**: Set the `blob` suffix to `DIME` or `MIME` to return the data as a corresponding attachment type with the attachment identifier returned in the `BLOB.attachmentID` field. Use the SOAP framework's proprietary API to read the data from the attachment.
* **Remote URL**: Set the `blob` suffix to `http` to keep the data on the application server and return the URL pointing to the data in the `BLOB.remoteURL` field.
* **MTOM or SwaRef**: Set the `blob` suffix to `mtom` or `swaref` to return the data as a corresponding attachment type with the attachment identifier returned in the `BLOB.MTOM` or `BLOB.swaRef` fields. Use the SOAP framework's native API to read the data from the attachment.

>[!NOTE]
>
>It is recommended that you do not exceed 30 MB when populating a `BLOB` object by invoking its `setBinaryData` method. Otherwise, there is a possibility that an `OutOfMemory` exception occurs.

>[!NOTE]
>
>JAX WS-based applications that use the MTOM transmission protocol are limited to 25MB of sent and received data. This limitation is due to a bug in JAX-WS. If the combined size of your sent and received files exceeds 25MB, usetheSwaRef transmission protocol instead of the MTOM one. Otherwise, there is a possibility of an `OutOfMemory` exception.

**MTOM transmission of base64-encoded byte arrays**

In addition to the `BLOB` object, the MTOM protocol supports any byte-array parameter or byte-array field of a complex type. This means that client SOAP frameworks supporting MTOM can send any `xsd:base64Binary` element as an MTOM attachment (instead of a base64-encoded text). AEM Forms SOAP endpoints can read this type of byte-array encoding. However, the AEM Forms service always returns a byte-array type as a base64-encoded text. The output byte-array parameters do not support MTOM.

AEM Forms services that return a large amount of binary data use the Document/BLOB type rather than the byte-array type. The Document type is much more efficient for transmitting large amounts of data.

## Web service data types {#web-service-data-types}

The following table lists Java data types and shows the corresponding web service data type.

<table>
 <thead>
  <tr>
   <th><p>Java data type</p></th>
   <th><p>Web service data type</p></th>
  </tr>
 </thead>
 <tbody>
  <tr>
   <td><p><code>java.lang.byte[]</code></p></td>
   <td><p><code>xsd:base64Binary</code></p></td>
  </tr>
  <tr>
   <td><p><code>java.lang.Boolean</code></p></td>
   <td><p><code>xsd:boolean</code></p></td>
  </tr>
  <tr>
   <td><p><code>java.util.Date</code></p></td>
   <td><p>The <code>DATE</code> type, which is defined in a service WSDL as follows:</p><p><code>&lt;complexType name="DATE"&gt;</code></p><p><code>&lt;sequence&gt;</code></p><p><code>&lt;element maxOccurs="1" minOccurs="0" name="date" </code><code>type="xsd:dateTime" /&gt; </code></p><p><code>&lt;element maxOccurs="1" minOccurs="0" name="calendar" </code><code>type="xsd:dateTime" /&gt; </code></p><p><code>&lt;/sequence&gt;</code></p><p><code>&lt;/complexType&gt;</code></p><p>If a AEM Forms service operation takes a <code>java.util.Date</code> value as input, the SOAP client application must pass the date in the <code>DATE.date</code> field. Setting the <code>DATE.calendar</code> field in this case causes a runtime exception. If the service returns a <code>java.util.Date</code>, the date is retuned in the <code>DATE.date</code> field.</p></td>
  </tr>
  <tr>
   <td><p><code>java.util.Calendar</code></p></td>
   <td><p>The <code>DATE</code> type, which is defined in a service WSDL as follows:</p><p><code>&lt;complexType name="DATE"&gt;</code></p><p><code>&lt;sequence&gt;</code></p><p><code>&lt;element maxOccurs="1" minOccurs="0" name="date" </code><code>type="xsd:dateTime" /&gt; </code></p><p><code>&lt;element maxOccurs="1" minOccurs="0" name="calendar" </code><code>type="xsd:dateTime" /&gt; </code></p><p><code>&lt;/sequence&gt;</code></p><p><code>&lt;/complexType&gt;</code></p><p>If a AEM Forms service operation takes a <code>java.util.Calendar</code> value as input, the SOAP client application must pass the date in the <code>DATE.caledendar</code> field. Setting the <code>DATE.date</code> field in this case causes a run-time exception. If the service returns a <code>java.util.Calendar</code>, then the date is returned in the <code>DATE.calendar</code> field. </p></td>
  </tr>
  <tr>
   <td><p><code>java.math.BigDecimal</code></p></td>
   <td><p><code>xsd:decimal</code></p></td>
  </tr>
  <tr>
   <td><p><code>com.adobe.idp.Document</code></p></td>
   <td><p><code>BLOB</code></p></td>
  </tr>
  <tr>
   <td><p><code>java.lang.Double</code></p></td>
   <td><p><code>xsd:double</code></p></td>
  </tr>
  <tr>
   <td><p><code>java.lang.Float</code></p></td>
   <td><p><code>xsd:float</code></p></td>
  </tr>
  <tr>
   <td><p><code>java.lang.Integer</code></p></td>
   <td><p><code>xsd:int</code></p></td>
  </tr>
  <tr>
   <td><p><code>java.util.List</code></p></td>
   <td><p><code>MyArrayOf_xsd_anyType</code></p></td>
  </tr>
  <tr>
   <td><p><code>java.lang.Long</code></p></td>
   <td><p><code>xsd:long</code></p></td>
  </tr>
  <tr>
   <td><p><code>java.util.Map</code></p></td>
   <td><p>The <code>apachesoap:Map</code>, which is defined in a service WSDL as follows:</p><p><code>&lt;schema elementFormDefault="qualified" targetNamespace="https://xml.apache.org/xml-soap" xmlns="https://www.w3.org/2001/XMLSchema"&gt;</code></p><p><code>&lt;complexType name="mapItem"&gt;</code></p><p><code>&lt;sequence&gt;</code></p><p><code>&lt;element name="key" nillable="true" type="xsd:anyType"/&gt;</code></p><p><code>&lt;element name="value" nillable="true" type="xsd:anyType"/&gt;</code></p><p><code>&lt;/sequence&gt;</code></p><p><code>&lt;/complexType&gt;</code></p><p><code>&lt;complexType name="Map"&gt;</code></p><p><code>&lt;sequence&gt;</code></p><p><code>&lt;element maxOccurs="unbounded" minOccurs="0" name="item" </code><code>type="apachesoap:mapItem"/&gt;</code></p><p><code>&lt;/sequence&gt;</code></p><p><code>&lt;/complexType&gt;</code></p><p><code>&lt;/schema&gt;</code></p><p>The Map is represented as a sequence of key/value pairs.</p></td>
  </tr>
  <tr>
   <td><p><code>java.lang.Object</code></p></td>
   <td><p><code>$1</code></p></td>
  </tr>
  <tr>
   <td><p><code>java.lang.Short</code></p></td>
   <td><p><code>xsd:short</code></p></td>
  </tr>
  <tr>
   <td><p><code>java.lang.String</code></p></td>
   <td><p><code>xsd:string</code></p></td>
  </tr>
  <tr>
   <td><p><code>org.w3c.dom.Document</code></p></td>
   <td><p>The XML type, which is defined in a service WSDL as follows:</p><p><code>&lt;complexType name="XML"&gt;</code></p><p><code>&lt;sequence&gt;</code></p><p><code>&lt;element maxOccurs="1" minOccurs="0" name="document" </code><code>type="xsd:string" /&gt; </code></p><p><code>&lt;element maxOccurs="1" minOccurs="0" name="element" </code><code>type="xsd:string" /&gt; </code></p><p><code>&lt;/sequence&gt;</code></p><p><code>&lt;/complexType&gt;</code></p><p>If an AEM Forms service operation accepts an <code>org.w3c.dom.Document</code> value, pass the XML data in the <code>XML.document</code> field.</p><p>Setting the <code>XML.element</code> field causes a runtime exception. If the service returns an <code>org.w3c.dom.Document</code>, then the XML data is returned in the <code>XML.document</code> field.</p></td>
  </tr>
  <tr>
   <td><p><code>org.w3c.dom.Element</code></p></td>
   <td><p>The XML type, which is defined in a service WSDL as follows:</p><p><code>&lt;complexType name="XML"&gt;</code></p><p><code>&lt;sequence&gt;</code></p><p><code>&lt;element maxOccurs="1" minOccurs="0" name="document" </code><code>type="xsd:string" /&gt; </code></p><p><code>&lt;element maxOccurs="1" minOccurs="0" name="element" </code><code>type="xsd:string" /&gt; </code></p><p><code>&lt;/sequence&gt;</code></p><p><code>&lt;/complexType&gt;</code></p><p>If an AEM Forms service operation takes an <code>org.w3c.dom.Element</code> as input, pass the XML data in the <code>XML.element</code> field.</p><p>Setting the <code>XML.document</code> field causes a runtime exception. If the service returns an <code>org.w3c.dom.Element</code>, then the XML data is retuned in the <code>XML.element</code> field.</p></td>
  </tr>
 </tbody>
</table>

## Creating Java proxy classes using JAX-WS {#creating-java-proxy-classes-using-jax-ws}

You can use JAX-WS to convert a Forms service WSDL to Java proxy classes. These classes enable you to invoke AEM Forms services operations. Apache Ant lets you create a build script that generates Java proxy classes by referencing a AEM Forms service WSDL. You can generate JAX-WS proxy files by performing the following steps:

1. Install Apache Ant on the client computer. (See [https://ant.apache.org/bindownload.cgi](https://ant.apache.org/bindownload.cgi).)

    * Add the bin directory to your class path.
    * Set the `ANT_HOME` environment variable to the directory where you installed Ant.

1. Install JDK 1.6 or later.

    * Add the JDK bin directory to your class path.
    * Add the JRE bin directory to your class path. This bin is in the `[JDK_INSTALL_LOCATION]/jre` directory.
    * Set the `JAVA_HOME` environment variable to the directory where you installed the JDK.

   JDK 1.6 includes the wsimport program used in the build.xml file. JDK 1.5 does not include that program.

1. Install JAX-WS on the client computer. (See [Java API for XML Web Services](https://jax-ws.dev.java.net/jax-ws-ea3/docs/mtom-swaref.html).)
1. Use JAX-WS and Apache Ant to generate Java proxy classes. Create an Ant build script to accomplish this task. The following script is a sample Ant build script named build.xml:

   ```xml
    <?xml version="1.0" encoding="UTF-8"?>
    
    <project basedir="." default="compile">
    
    <property name="port" value="8080" />
    <property name="host" value="localhost" />
    <property name="username" value="administrator" />
    <property name="password" value="password" />
    <property name="tests" value="all" />
    
    <target name="clean" >
           <delete dir="classes" />
    </target>
    
    <target name="wsdl" depends="clean">
           <mkdir dir="classes"/>
           <exec executable="wsimport" failifexecutionfails="false" failonerror="true" resultproperty="foundWSIMPORT">
               <arg line="-keep -d classes https://${host}:${port}/soap/services/EncryptionService?wsdl&lc_version=9.0.1"/>
           </exec>
           <fail unless="foundWSIMPORT">
              !!! Failed to execute JDK's wsimport tool. Make sure that JDK 1.6 (or later) is on your PATH !!!
           </fail>
    </target>
    
    <target name="compile" depends="clean, wsdl" >
         <javac destdir="./classes" fork="true" debug="true">
            <src path="./src"/>
         </javac>
    </target>
    
    <target name="run">
         <java classname="Client" fork="yes" failonerror="true" maxmemory="200M">
            <classpath>
              <pathelement location="./classes"/>
            </classpath>
            <arg value="${port}"/>
            <arg value="${host}"/>
            <arg value="${username}"/>
            <arg value="${password}"/>
            <arg value="${tests}"/>
         </java>
    </target>
    </project>
   ```

   Within this Ant build script, notice that the `url` property is set to reference the Encryption service WSDL running on localhost. The `username` and `password` properties must be set to a valid AEM forms user name and password. Notice that the URL contains the `lc_version` attribute. Without specifying the `lc_version` option, you cannot invoke new AEM Forms service operations.

   >[!NOTE]
   >
   >Replace `EncryptionService`with the AEM Forms service name that you want to invoke using Java proxy classes. For example, to create Java proxy classes for the Rights Management service, specify:

   ```java
    http://localhost:8080/soap/services/RightsManagementService?WSDL&lc_version=9.0.1
   ```

1. Create a BAT file to execute the Ant build script. The following command can be located within a BAT file that is responsible for executing the Ant build script:

   ```java
    ant -buildfile "build.xml" wsdl
   ```

   Place the ANT build script in the C:\Program Files\Java\jaxws-ri\bin directory. The script writes the JAVA files to the ./classes folder. The script generates JAVA files that can invoke the service.

1. Package the JAVA files into a JAR file. If you are working on Eclipse, follow these steps:

    * Create a Java project that is used to package the proxy JAVA files into a JAR file.
    * Create a source folder in the project.
    * Create a `com.adobe.idp.services` package in the Source folder.
    * Select the `com.adobe.idp.services` package and then import the JAVA files from the adobe/idp/services folder into the package.
    * If necessary, create an `org/apache/xml/xmlsoap` package in the Source folder.
    * Select the source folder and then import the JAVA files from the org/apache/xml/xmlsoap folder.
    * Set the Java compiler's compliance level to 5.0 or greater.
    * Build the project.
    * Export the project as a JAR file.
    * Import this JAR file in a client project's class path. In addition, import all the JAR files in &lt;Install Directory&gt;\Adobe\Adobe_Experience_Manager_forms\sdk\client-libs\thirdparty.

   >[!NOTE]
   >
   >All Java web service quick starts (except for the Forms service) in Programming with AEM forms create Java proxy files using JAX-WS. In addition, all Java web service quick starts, use SwaRef. (See [Invoking AEM Forms using SwaRef](#invoking-aem-forms-using-swaref).)

**See also**

[Creating Java proxy classes using Apache Axis](#creating-java-proxy-classes-using-apache-axis)

[Invoking AEM Forms using Base64 encoding](#invoking-aem-forms-using-base64-encoding)

[Invoking AEM Forms using BLOB data over HTTP](#invoking-aem-forms-using-blob-data-over-http)

[Invoking AEM Forms using SwaRef](#invoking-aem-forms-using-swaref)

## Creating Java proxy classes using Apache Axis {#creating-java-proxy-classes-using-apache-axis}

You can use the Apache Axis WSDL2Java tool to convert a Forms service into Java proxy classes. These classes enable you to invoke Forms service operations. Using Apache Ant, you can generate Axis library files from a service WSDL. You can download Apache Axis at the URL [https://ws.apache.org/axis/](https://ws.apache.org/axis/).

>[!NOTE]
>
>The web service quick starts associated with the Forms service use Java proxy classes created using Apache Axis. The Forms web service quick starts also use Base64 as the encoding type. (See [Forms Service API Quick Starts](/help/forms/developing/forms-service-api-quick-starts.md#forms-service-api-quick-starts).)

You can generate Axis Java library files by performing the following steps:

1. Install Apache Ant on the client computer. It is available at [https://ant.apache.org/bindownload.cgi](https://ant.apache.org/bindownload.cgi).

    * Add the bin directory to your class path.
    * Set the `ANT_HOME` environment variable to the directory where you installed Ant.

1. Install Apache Axis 1.4 on the client computer. It is available at [https://ws.apache.org/axis/](https://ws.apache.org/axis/).
1. Set up the class path to use the Axis JAR files in your web service client, as described in the Axis installation instructions at [https://ws.apache.org/axis/java/install.html](https://ws.apache.org/axis/java/install.html).
1. Use the Apache WSDL2Java tool in Axis to generate Java proxy classes. Create an Ant build script to accomplish this task. The following script is a sample Ant build script named build.xml:

   ```java
    <?xml version="1.0"?>
    <project name="axis-wsdl2java">
    
    <path id="axis.classpath">
    <fileset dir="C:\axis-1_4\lib" >
        <include name="**/*.jar" />
    </fileset>
    </path>
    
    <taskdef resource="axis-tasks.properties" classpathref="axis.classpath" />
    
    <target name="encryption-wsdl2java-client" description="task">
    <axis-wsdl2java
        output="C:\JavaFiles"
        testcase="false"
        serverside="false"
        verbose="true"
        username="administrator"
        password="password"
        url="http://localhost:8080/soap/services/EncryptionService?wsdl&lc_version=9.0.1" >
    </axis-wsdl2java>
    </target>
    
    </project>
   ```

   Within this Ant build script, notice that the `url` property is set to reference the Encryption service WSDL running on localhost. The `username` and `password` properties must be set to a valid AEM forms user name and password.

1. Create a BAT file to execute the Ant build script. The following command can be located within a BAT file that is responsible for executing the Ant build script:

   ```java
    ant -buildfile "build.xml" encryption-wsdl2java-client
   ```

   The JAVA files are written to the C:\JavaFiles folder as specified by the `output` property. To successfully invoke the Forms service, import these JAVA files into your class path.

   By default, these files belong to a Java package named `com.adobe.idp.services`. It is recommended that you place these JAVA files into a JAR file. Then import the JAR file into your client application's class path.

   >[!NOTE]
   >
   >There are different ways to put .JAVA files into a JAR. One way is using a Java IDE like Eclipse. Create a Java project and create a `com.adobe.idp.services`package (all .JAVA files belong to this package). Next import all the .JAVA files into the package. Finally, export the project as a JAR file.

1. Amend the URL in the `EncryptionServiceLocator` class to specify the encoding type. For example, to use base64, specify `?blob=base64` to ensure that the `BLOB` object returns binary data. That is, in the `EncryptionServiceLocator` class, locate the following line of code:

   ```java
    http://localhost:8080/soap/services/EncryptionService;
   ```

   and change it to:

   ```java
    http://localhost:8080/soap/services/EncryptionService?blob=base64;
   ```

1. Add the following Axis JAR files to your Java project's class path:

    * activation.jar
    * axis.jar
    * commons-codec-1.3.jar
    * commons-collections-3.1.jar
    * commons-discovery.jar
    * commons-logging.jar
    * dom3-xml-apis-2.5.0.jar
    * jai_imageio.jar
    * jaxen-1.1-beta-9.jar
    * jaxrpc.jar
    * log4j.jar
    * mail.jar
    * saaj.jar
    * wsdl4j.jar
    * xalan.jar
    * xbean.jar
    * xercesImpl.jar

   These JAR files are in the `[install directory]/Adobe/Adobe Experience Manager Forms/sdk/lib/thirdparty` directory.

**See also**

[Creating Java proxy classes using JAX-WS](#creating-java-proxy-classes-using-jax-ws)

[Invoking AEM Forms using Base64 encoding](#invoking-aem-forms-using-base64-encoding)

[Invoking AEM Forms using BLOB data over HTTP](#invoking-aem-forms-using-blob-data-over-http)

## Invoking AEM Forms using Base64 encoding {#invoking-aem-forms-using-base64-encoding}

You can invoke a AEM Forms service using Base64 encoding. Base64 encoding encodes attachments that are sent with a web service invocation request. That is, `BLOB` data is Base64 encoded, not the entire SOAP message.

"Invoking AEM Forms using Base64 encoding" discusses invoking the following AEM Forms short-lived process named `MyApplication/EncryptDocument` by using Base64 encoding.

>[!NOTE]
>
>This process is not based on an existing AEM Forms process. To follow along with the code example, create a process named `MyApplication/EncryptDocument` using Workbench. (See [Using Workbench](https://www.adobe.com/go/learn_aemforms_workbench_63).)

When this process is invoked, it performs the following actions:

1. Obtains the unsecured PDF document that is passed to the process. This action is based on the `SetValue` operation. The input parameter for this process is a `document` process variable named `inDoc`.
1. Encrypts the PDF document with a password. This action is based on the `PasswordEncryptPDF` operation. The password encrypted PDF document is returned in a process variable named `outDoc`.

### Creating a .NET client assembly that uses Base64 encoding {#creating-a-net-client-assembly-that-uses-base64-encoding}

You can create a .NET client assembly to invoke a Forms service from a Microsoft Visual Studio .NET project. To create a .NET client assembly that uses base64 encoding, perform the following steps:

1. Create a proxy class based on an AEM Forms invocation URL.
1. Create a Microsoft Visual Studio .NET project that produces the .NET client assembly.

**Creating a proxy class**

You can create a proxy class that is used to create the .NET client assembly by using a tool that accompanies Microsoft Visual Studio. The name of the tool is wsdl.exe and it is in the Microsoft Visual Studio installation folder. To create a proxy class, open the command prompt and navigate to the folder that contains the wsdl.exe file. For more information about the wsdl.exe tool, see the *MSDN Help*.

Enter the following command at the command prompt:

```java
 wsdl https://hiro-xp:8080/soap/services/MyApplication/EncryptDocument?WSDL&lc_version=9.0.1
```

By default, this tool creates a CS file in the same folder that is based on the name of the WSDL. In this situation, it creates a CS file named *EncryptDocumentService.cs*. You use this CS file to create a proxy object that lets you invoke the service that was specified in the invocation URL.

Amend the URL in the proxy class to include `?blob=base64` to ensure that the `BLOB` object returns binary data. In the proxy class, locate the following line of code:

```java
 "https://hiro-xp:8080/soap/services/MyApplication/EncryptDocument";
```

and change it to:

```java
 "https://hiro-xp:8080/soap/services/MyApplication/EncryptDocument?blob=base64";
```

The *Invoking AEM Forms using Base64 Encoding* section uses `MyApplication/EncryptDocument` as an example. If you are creating a .NET client assembly for another Forms service, ensure that you replace `MyApplication/EncryptDocument` with the name of the service.

**Developing the .NET client assembly**

Create a Visual Studio Class Library project that produces a .NET client assembly. The CS file that you created using wsdl.exe can be imported into this project. This project produces a DLL file (the .NET client assembly) that you can use in other Visual Studio .NET projects to invoke a service.

1. Start Microsoft Visual Studio .NET.
1. Create a Class Library project and name it DocumentService.
1. Import the CS file that you created using wsdl.exe.
1. In the **Project** menu, select **Add Reference**.
1. In the Add Reference dialog box, select **System.Web.Services.dll**.
1. Click **Select** and then click **OK**.
1. Compile and build the project.

>[!NOTE]
>
>This procedure creates a .NET client assembly named DocumentService.dll that you can use to send SOAP requests to the `MyApplication/EncryptDocument` service.

>[!NOTE]
>
>Make sure that you added `?blob=base64` to the URL in the proxy class that is used to create the .NET client assembly. Otherwise, you cannot retrieve binary data from the `BLOB` object.

**Referencing the .NET client assembly**

Place your newly created .NET client assembly on the computer where you are developing your client application. After you place the .NET client assembly in a directory, you can reference it from a project. Also reference the `System.Web.Services` library from your project. If you do not reference this library, you cannot use the .NET client assembly to invoke a service.

1. In the **Project** menu, select **Add Reference**.
1. Click the **.NET** tab.
1. Click **Browse** and locate the DocumentService.dll file.
1. Click **Select** and then click **OK**.

**Invoking a service using a .NET client assembly that uses Base64 encoding**

You can invoke the `MyApplication/EncryptDocument` service (which was built in Workbench) using a .NET client assembly that uses Base64 encoding. To invoke the `MyApplication/EncryptDocument` service, perform the following steps:

1. Create a Microsoft .NET client assembly that consumes the `MyApplication/EncryptDocument` service WSDL.
1. Create a client Microsoft .NET project. Reference the Microsoft .NET client assembly in the client project. Also reference `System.Web.Services`.
1. Using the Microsoft .NET client assembly, create a `MyApplication_EncryptDocumentService` object by invoking its default constructor.
1. Set the `MyApplication_EncryptDocumentService` object's `Credentials` property with a `System.Net.NetworkCredential` object. Within the `System.Net.NetworkCredential` constructor, specify an AEM forms user name and the corresponding password. Set authentication values to enable your .NET client application to successfully exchange SOAP messages with AEM Forms.
1. Create a `BLOB` object by using its constructor. The `BLOB` object is used to store a PDF document pass to the `MyApplication/EncryptDocument` process.
1. Create a `System.IO.FileStream` object by invoking its constructor. Pass a string value that represents the file location of the PDF document and the mode in which to open the file.
1. Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object's `Length` property.
1. Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method. Pass the byte array, the starting position, and the stream length to read.
1. Populate the `BLOB` object by assigning its `binaryData` property with the contents of the byte array.
1. Invoke the `MyApplication/EncryptDocument` process by invoking the `MyApplication_EncryptDocumentService` object's `invoke` method and passing the `BLOB` object that contains the PDF document. This process returns an encrypted PDF document within a `BLOB` object.
1. Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the password-encrypted document.
1. Create a byte array that stores the data content of the `BLOB` object returned by the `MyApplicationEncryptDocumentService` object's `invoke` method. Populate the byte array by getting the value of the `BLOB` object's `binaryData` data member.
1. Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.
1. Write the byte array contents to a PDF file by invoking the `System.IO.BinaryWriter` object's `Write` method and passing the byte array.

### Invoking a service using Java proxy classes and Base64 encoding {#invoking-a-service-using-java-proxy-classes-and-base64-encoding}

You can invoke an AEM Forms service using Java proxy classes and Base64. To invoke the `MyApplication/EncryptDocument` service using Java proxy classes, perform the following steps:

1. Create Java proxy classes using JAX-WS that consumes the `MyApplication/EncryptDocument` service WSDL. Use the following WSDL endpoint:

   `https://hiro-xp:8080/soap/services/MyApplication/EncryptDocument?WSDL&lc_version=9.0.1`

   >[!NOTE]
   >
   >Replace `hiro-xp` *with the IP address of the J2EE application servier hosting AEM Forms.*

1. Package the Java proxy classes created using JAX-WS into a JAR file.
1. Include the Java proxy JAR file and the JAR files in the following path:

   &lt;Install Directory&gt;\Adobe\Adobe_Experience_Manager_forms\sdk\client-libs\thirdparty

   into your Java client project's class path.

1. Create a `MyApplicationEncryptDocumentService` object by using its constructor.
1. Create a `MyApplicationEncryptDocument` object by invoking the `MyApplicationEncryptDocumentService` object's `getEncryptDocument` method.
1. Set the connection values required to invoke AEM Forms by assigning values to the following data members:

    * Assign the WSDL endpoint and the encoding type to the `javax.xml.ws.BindingProvider` object's `ENDPOINT_ADDRESS_PROPERTY` field. To invoke the `MyApplication/EncryptDocument` service using Base64 encoding, specify the following URL value:

      `https://hiro-xp:8080/soap/services/MyApplication/EncryptDocument?blob=base64`

    * Assign the AEM forms user to the `javax.xml.ws.BindingProvider` object's `USERNAME_PROPERTY` field.
    * Assign the corresponding password value to the `javax.xml.ws.BindingProvider` object's `PASSWORD_PROPERTY` field.

   The following code example shows this application logic:

   ```java
    //Set connection values required to invoke AEM Forms
    String url = "https://hiro-xp:8080/soap/services/MyApplication/EncryptDocument?blob=base64";
    String username = "administrator";
    String password = "password";
    ((BindingProvider) encryptDocClient).getRequestContext().put(BindingProvider.ENDPOINT_ADDRESS_PROPERTY, url);
    ((BindingProvider) encryptDocClient).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, username);
    ((BindingProvider) encryptDocClient).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, password);
   ```

1. Retrieve the PDF document to send to the `MyApplication/EncryptDocument` process by creating a `java.io.FileInputStream` object by using its constructor. Pass a string value that specifies the location of the PDF document.
1. Create a byte array and populate it with the contents of the `java.io.FileInputStream` object.
1. Create a `BLOB` object by using its constructor.
1. Populate the `BLOB` object by invoking its `setBinaryData` method and passing the byte array. The `BLOB` object's `setBinaryData` is the method to call when using Base64 encoding. See Supplying BLOB objects in service requests.
1. Invoke the `MyApplication/EncryptDocument` process by invoking the `MyApplicationEncryptDocument` object's `invoke` method. Pass the `BLOB` object that contains the PDF document. The invoke method returns a `BLOB` object that contains the encrypted PDF document.
1. Create a byte array that contains the encrypted PDF document by invoking the `BLOB` object's `getBinaryData` method.
1. Save the encrypted PDF document as a PDF file. Write the byte array to a file.

**See also**

[Quick Start: Invoking a service using Java proxy files and Base64 encoding](/help/forms/developing/invocation-api-quick-starts.md#quick-start-invoking-a-service-using-java-proxy-files-and-base64-encoding)

[Creating a .NET client assembly that uses Base64 encoding](#creating-a-net-client-assembly-that-uses-base64-encoding)

## Invoking AEM Forms using MTOM {#invoking-aem-forms-using-mtom}

You can invoke AEM Forms services by using the web service standard MTOM. This standard defines how binary data, such as a PDF document, is transmitted over the Internet or intranet. A feature of MTOM is the use of the `XOP:Include` element. This element is defined in the XML Binary Optimized Packaging (XOP) specification to reference the binary attachments of a SOAP message.

The discussion here is about using MTOM to invoke the following AEM Forms short-lived process named `MyApplication/EncryptDocument`.

>[!NOTE]
>
>This process is not based on an existing AEM Forms process. To follow along with the code example, create a process named `MyApplication/EncryptDocument` using Workbench. (See [Using Workbench](https://www.adobe.com/go/learn_aemforms_workbench_63).)

When this process is invoked, it performs the following actions:

1. Obtains the unsecured PDF document that is passed to the process. This action is based on the `SetValue` operation. The input parameter for this process is a `document` process variable named `inDoc`.
1. Encrypts the PDF document with a password. This action is based on the `PasswordEncryptPDF` operation. The password encrypted PDF document is returned in a process variable named `outDoc`.

>[!NOTE]
>
>MTOM support was added in AEM Forms, version 9.

>[!NOTE]
>
>JAX WS-based applications that use the MTOM transmission protocol are limited to 25MB of sent and received data. This limitation is due to a bug in JAX-WS. If the combined size of your sent and received files exceeds 25MB, usetheSwaRef transmission protocol instead of the MTOM one. Otherwise, there is a possibility of an `OutOfMemory` exception.

The discussion here is about using MTOM withthin a Microsoft .NET project to invoke AEM Forms services. The .NET framework used is 3.5, and the development environment is Visual Studio 2008. If you have Web Service Enhancements (WSE) installed on your development computer, remove it. The .NET 3.5 framework supports a SOAP framework named Windows Communication Foundation (WCF). When invoking AEM Forms by using MTOM, only WCF (not WSE) is supported.

### Creating a .NET project that invokes a service using MTOM {#creating-a-net-project-that-invokes-a-service-using-mtom}

You can create a Microsoft .NET project that can invoke a AEM Forms service using web services. First, create a Microsoft .NET project by using Visual Studio 2008. To invoke a AEM Forms service, create a Service Reference to the AEM Forms service that you want to invoke within your project. When you create a Service Reference, specify a URL to the AEM Forms service:

```java
 http://localhost:8080/soap/services/MyApplication/EncryptDocument?WSDL&lc_version=9.0.1
```

Replace `localhost` with the IP address of the J2EE application server hosting AEM Forms. Replace `MyApplication/EncryptDocument` with the name of the AEM Forms service to invoke. For example, to invoke a Rights Management operation, specify:

`http://localhost:8080/soap/services/RightsManagementService?WSDL&lc_version=9.0.1`

The `lc_version` option ensures that AEM Forms functionality, such as MTOM, is available. Without specifying the `lc_version` option, you cannot invoke AEM Forms using MTOM.

After you create a Service Reference, data types associated with the AEM Forms service are available for use within your .NET project. To create a .NET project that invokes an AEM Forms service, perform the following steps:

1. Create a .NET project using Microsoft Visual Studio 2008.
1. In the **Project** menu, select **Add Service Reference**.
1. In the **Address** dialog box, specify the WSDL to the AEM Forms service. For example,

   ```java
    http://localhost:8080/soap/services/MyApplication/EncryptDocument?WSDL&lc_version=9.0.1
   ```

1. Click **Go** and then click **OK**.

### Invoking a service using MTOM in a .NET project {#invoking-a-service-using-mtom-in-a-net-project}

Consider the `MyApplication/EncryptDocument` process that accepts an unsecured PDF document and returns a password-encrypted PDF document. To invoke the `MyApplication/EncryptDocument` process (which was built in Workbench) by using MTOM, perform the following steps:

1. Create a Microsoft .NET project.
1. Create a `MyApplication_EncryptDocumentClient` object by using its default constructor.
1. Create a `MyApplication_EncryptDocumentClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service and the encoding type:

   ```java
    https://hiro-xp:8080/soap/services/MyApplication/EncryptDocument?blob=mtom
   ```

   You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference. However, ensure that you specify `?blob=mtom`.

   >[!NOTE]
   >
   >Replace `hiro-xp` *with the IP address of the J2EE application servier hosting AEM Forms.*

1. Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `EncryptDocumentClient.Endpoint.Binding` data member. Cast the return value to `BasicHttpBinding`.
1. Set the `System.ServiceModel.BasicHttpBinding` object's `MessageEncoding` data member to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
1. Enable basic HTTP authentication by performing the following tasks:

    * Assign the AEM forms user name to the data member `MyApplication_EncryptDocumentClient.ClientCredentials.UserName.UserName`.
    * Assign the corresponding password value to the data member `MyApplication_EncryptDocumentClient.ClientCredentials.UserName.Password`.
    * Assign the constant value `HttpClientCredentialType.Basic` to the data member `BasicHttpBindingSecurity.Transport.ClientCredentialType`.
    * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the data member `BasicHttpBindingSecurity.Security.Mode`.

   The following code example shows these tasks.

   ```java
    //Enable BASIC HTTP authentication
    encryptProcess.ClientCredentials.UserName.UserName = "administrator";
    encryptProcess.ClientCredentials.UserName.Password = "password";
    b.Security.Transport.ClientCredentialType = HttpClientCredentialType.Basic;
    b.Security.Mode = BasicHttpSecurityMode.TransportCredentialOnly;
    b.MaxReceivedMessageSize = 4000000;
    b.MaxBufferSize = 4000000;
    b.ReaderQuotas.MaxArrayLength = 4000000;
   ```

1. Create a `BLOB` object by using its constructor. The `BLOB` object is used to store a PDF document to pass to the `MyApplication/EncryptDocument` process.
1. Create a `System.IO.FileStream` object by invoking its constructor. Pass a string value that represents the file location of the PDF document and the mode in which to open the file.
1. Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object's `Length` property.
1. Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method. Pass the byte array, the starting position, and the stream length to read.
1. Populate the `BLOB` object by assigning its `MTOM` data member with the contents of the byte array.
1. Invoke the `MyApplication/EncryptDocument` process by invoking the `MyApplication_EncryptDocumentClient` object's `invoke` method. Pass the `BLOB` object that contains the PDF document. This process returns an encrypted PDF document within a `BLOB` object.
1. Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the secured PDF document.
1. Create a byte array that stores the data content of the `BLOB` object that was returned by the `invoke` method. Populate the byte array by getting the value of the `BLOB` object's `MTOM` data member.
1. Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.
1. Write the contents of the byte array to a PDF file by invoking the `System.IO.BinaryWriter` object's `Write` method and passing the byte array.

>[!NOTE]
>
>Most AEM Forms service operations have an MTOM quick start. You can view these quick starts in a service's corresponding quick start section. For example, to see the Output quick start section, see [Output Service API Quick Starts](/help/forms/developing/output-service-java-api-quick.md#output-service-java-api-quick-start-soap).

**See also**

[Quick Start: Invoking a service using MTOM in a .NET project](/help/forms/developing/invocation-api-quick-starts.md#quick-start-invoking-a-service-using-mtom-in-a-net-project)

[Accessing multiple services using web services](#accessing-multiple-services-using-web-services)

[Creating an ASP.NET web application that invokes a human-centric long-lived process](/help/forms/developing/invoking-human-centric-long-lived.md#creating-an-asp-net-web-application-that-invokes-a-human-centric-long-lived-process)

## Invoking AEM Forms using SwaRef {#invoking-aem-forms-using-swaref}

You can invoke AEM Forms services using SwaRef. The content of the `wsi:swaRef` XML element is sent as an attachment inside a SOAP body that stores the reference to the attachment. When invoking a Forms service by using SwaRef, create Java proxy classes by using the Java API for XML Web Services (JAX-WS). (See [Java API for XML Web Services](https://jax-ws.dev.java.net/jax-ws-ea3/docs/mtom-swaref.html).)

The discussion here is about invoking the following Forms short-lived process named `MyApplication/EncryptDocument` by using SwaRef.

>[!NOTE]
>
>This process is not based on an existing AEM Forms process. To follow along with the code example, create a process named `MyApplication/EncryptDocument` using Workbench. (See [Using Workbench](https://www.adobe.com/go/learn_aemforms_workbench_63).)

When this process is invoked, it performs the following actions:

1. Obtains the unsecured PDF document that is passed to the process. This action is based on the `SetValue` operation. The input parameter for this process is a `document` process variable named `inDoc`.
1. Encrypts the PDF document with a password. This action is based on the `PasswordEncryptPDF` operation. The password encrypted PDF document is returned in a process variable named `outDoc`.

>[!NOTE]
>
>SwaRef support added in AEM Forms

The discussion below is about how to invoke Forms services by using SwaRef within a Java client application. The Java application uses proxy classes created by using JAX-WS.

### Invoke a service using JAX-WS library files that use SwaRef {#invoke-a-service-using-jax-ws-library-files-that-use-swaref}

To invoke the `MyApplication/EncryptDocument` process by using Java proxy files created using JAX-WS and SwaRef, perform the following steps:

1. Create Java proxy classes using JAX-WS that consumes the `MyApplication/EncryptDocument` service WSDL. Use the following WSDL endpoint:

   ```java
    https://hiro-xp:8080/soap/services/MyApplication/EncryptDocument?WSDL&lc_version=9.0.1
   ```

   For information, see [Creating Java proxy classes using JAX-WS](#creating-java-proxy-classes-using-jax-ws).

   >[!NOTE]
   >
   >Replace `hiro-xp` *with the IP address of the J2EE application server hosting AEM Forms.*

1. Package the Java proxy classes created using JAX-WS into a JAR file.
1. Include the Java proxy JAR file and the JAR files in the following path:

   &lt;Install Directory&gt;\Adobe\Adobe_Experience_Manager_forms\sdk\client-libs\thirdparty

   into your Java client project's class path.

1. Create a `MyApplicationEncryptDocumentService` object by using its constructor.
1. Create a `MyApplicationEncryptDocument` object by invoking the `MyApplicationEncryptDocumentService` object's `getEncryptDocument` method.
1. Set the connection values required to invoke AEM Forms by assigning values to the following data members:

    * Assign the WSDL endpoint and the encoding type to the `javax.xml.ws.BindingProvider` object's `ENDPOINT_ADDRESS_PROPERTY` field. To invoke the `MyApplication/EncryptDocument` service using SwaRef encoding, specify the following URL value:

      ` https://hiro-xp:8080/soap/services/MyApplication/EncryptDocument?blob=swaref`

    * Assign the AEM forms user to the `javax.xml.ws.BindingProvider` object's `USERNAME_PROPERTY` field.
    * Assign the corresponding password value to the `javax.xml.ws.BindingProvider` object's `PASSWORD_PROPERTY` field.

   The following code example shows this application logic:

   ```java
    //Set connection values required to invoke AEM Forms
    String url = "https://hiro-xp:8080/soap/services/MyApplication/EncryptDocument?blob=swaref";
    String username = "administrator";
    String password = "password";
    ((BindingProvider) encryptDocClient).getRequestContext().put(BindingProvider.ENDPOINT_ADDRESS_PROPERTY, url);
    ((BindingProvider) encryptDocClient).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, username);
    ((BindingProvider) encryptDocClient).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, password);
   ```

1. Retrieve the PDF document to send to the `MyApplication/EncryptDocument` process by creating a `java.io.File` object by using its constructor. Pass a string value that specifies the location of the PDF document.
1. Create a `javax.activation.DataSource` object by using the `FileDataSource` constructor. Pass the `java.io.File` object.
1. Create a `javax.activation.DataHandler` object by using its constructor and passing the `javax.activation.DataSource` object.
1. Create a `BLOB` object by using its constructor.
1. Populate the `BLOB` object by invoking its `setSwaRef` method and passing the `javax.activation.DataHandler` object.
1. Invoke the `MyApplication/EncryptDocument` process by invoking the `MyApplicationEncryptDocument` object's `invoke` method and passing the `BLOB` object that contains the PDF document. The invoke method returns a `BLOB` object that contains an encrypted PDF document.
1. Populate a `javax.activation.DataHandler` object by invoking the `BLOB` object's `getSwaRef` method.
1. Convert the `javax.activation.DataHandler` object to a `java.io.InputSteam` instance by invoking the `javax.activation.DataHandler` object's `getInputStream` method.
1. Write the `java.io.InputSteam` instance to a PDF file that represents the encrypted PDF document.

>[!NOTE]
>
>Most AEM Forms service operations have a SwaRef quick start. You can view these quick starts in a service's corresponding quick start section. For example, to see the Output quick start section, see [Output Service API Quick Starts](/help/forms/developing/output-service-java-api-quick.md#output-service-java-api-quick-start-soap).

**See also**

[Quick Start: Invoking a service using SwaRef in a Java project](/help/forms/developing/invocation-api-quick-starts.md#quick-start-invoking-a-service-using-swaref-in-a-java-project)

## Invoking AEM Forms using BLOB data over HTTP {#invoking-aem-forms-using-blob-data-over-http}

You can invoke AEM Forms services using web services and passing BLOB data over HTTP. Passing BLOB data over HTTP is an alternative technique instead of using base64 encoding, DIME, or MIME. For example, you can pass data over HTTP in a Microsoft .NET project that uses Web Service Enhancement 3.0, which does not support DIME or MIME. When using BLOB data over HTTP, input data is uploaded before the AEM Forms service is invoked.

"Invoking AEM Forms using BLOB Data over HTTP" discusses invoking the following AEM Forms short-lived process named `MyApplication/EncryptDocument` by passing BLOB data over HTTP.

>[!NOTE]
>
>This process is not based on an existing AEM Forms process. To follow along with the code example, create a process named `MyApplication/EncryptDocument` using Workbench. (See [Using Workbench](https://www.adobe.com/go/learn_aemforms_workbench_63).)

When this process is invoked, it performs the following actions:

1. Obtains the unsecured PDF document that is passed to the process. This action is based on the `SetValue` operation. The input parameter for this process is a `document` process variable named `inDoc`.
1. Encrypts the PDF document with a password. This action is based on the `PasswordEncryptPDF` operation. The password encrypted PDF document is returned in a process variable named `outDoc`.

>[!NOTE]
>
>It is recommended that you are familiar with Invoking AEM Forms using SOAP. (See [Invoking AEM Forms using Web Services](#invoking-aem-forms-using-web-services).)

### Creating a .NET client assembly that uses data over HTTP {#creating-a-net-client-assembly-that-uses-data-over-http}

To create a client assembly that uses data over HTTP, follow the process specified in [Invoking AEM Forms using Base64 encoding](#invoking-aem-forms-using-base64-encoding). However, amend the URL in the proxy class to include `?blob=http` instead of `?blob=base64`. This action ensures that data is passed over HTTP. In the proxy class, locate the following line of code:

```java
 "http://localhost:8080/soap/services/MyApplication/EncryptDocument";
```

and change it to:

```java
 "http://localhost:8080/soap/services/MyApplication/EncryptDocument?blob=http";
```

**Referencing the .NET clienMyApplication/EncryptDocumentt assembly**

Place your new .NET client assembly on the computer where you are developing your client application. After you place the .NET client assembly in a directory, you can reference it from a project. Reference the `System.Web.Services` library from your project. If you do not reference this library, you cannot use the .NET client assembly to invoke a service.

1. In the **Project** menu, select **Add Reference**.
1. Click the **.NET** tab.
1. Click **Browse** and locate the DocumentService.dll file.
1. Click **Select** and then click **OK**.

**Invoking a service using a .NET client assembly that uses BLOB data over HTTP**

You can invoke the `MyApplication/EncryptDocument` service (which was built in Workbench) using a .NET client assembly that uses data over HTTP. To invoke the `MyApplication/EncryptDocument` service, perform the following steps:

1. Create the .NET client assembly.
1. Reference the Microsoft .NET client assembly. Create a client Microsoft .NET project. Reference the Microsoft .NET client assembly in the client project. Also reference `System.Web.Services`.
1. Using the Microsoft .NET client assembly, create a `MyApplication_EncryptDocumentService` object by invoking its default constructor.
1. Set the `MyApplication_EncryptDocumentService` object's `Credentials` property with a `System.Net.NetworkCredential` object. Within the `System.Net.NetworkCredential` constructor, specify an AEM forms user name and the corresponding password. Set authentication values to enable your .NET client application to successfully exchange SOAP messages with AEM Forms.
1. Create a `BLOB` object by using its constructor. The `BLOB` object is used to pass data to the `MyApplication/EncryptDocument` process.
1. Assign a string value to the `BLOB` object's `remoteURL` data member that specifies the URI location of a PDF document to pass to the `MyApplication/EncryptDocument`service.
1. Invoke the `MyApplication/EncryptDocument` process by invoking the `MyApplication_EncryptDocumentService` object's `invoke` method and passing the `BLOB` object. This process returns an encrypted PDF document within a `BLOB` object.
1. Create a `System.UriBuilder` object by using its constructor and passing the value of the returned `BLOB` object's `remoteURL` data member.
1. Convert the `System.UriBuilder` object to a `System.IO.Stream` object. (The C# Quick Start that follows this list illustrates how to perform this task.)
1. Create a byte array and populate it with the data in the `System.IO.Stream` object.
1. Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.
1. Write the byte array contents to a PDF file by invoking the `System.IO.BinaryWriter` object's `Write` method and passing the byte array.

### Invoking a service using Java proxy classes and BLOB data over HTTP {#invoking-a-service-using-java-proxy-classes-and-blob-data-over-http}

You can invoke an AEM Forms service using Java proxy classes and BLOB data over HTTP. To invoke the `MyApplication/EncryptDocument` service using Java proxy classes, perform the following steps:

1. Create Java proxy classes using JAX-WS that consumes the `MyApplication/EncryptDocument` service WSDL. Use the following WSDL endpoint:

   ```java
    https://hiro-xp:8080/soap/services/MyApplication/EncryptDocument?WSDL&lc_version=9.0.1
   ```

   For information, see [Creating Java proxy classes using JAX-WS](#creating-java-proxy-classes-using-jax-ws).

   >[!NOTE]
   >
   >Replace `hiro-xp` *with the IP address of the J2EE application server hosting AEM Forms.*

1. Package the Java proxy classes created using JAX-WS into a JAR file.
1. Include the Java proxy JAR file and the JAR files in the following path:

   &lt;Install Directory&gt;\Adobe\Adobe_Experience_Manager_forms\sdk\client-libs\thirdparty

   into your Java client project's class path.

1. Create a `MyApplicationEncryptDocumentService` object by using its constructor.
1. Create a `MyApplicationEncryptDocument` object by invoking the `MyApplicationEncryptDocumentService` object's `getEncryptDocument` method.
1. Set the connection values required to invoke AEM Forms by assigning values to the following data members:

    * Assign the WSDL endpoint and the encoding type to the `javax.xml.ws.BindingProvider` object's `ENDPOINT_ADDRESS_PROPERTY` field. To invoke the `MyApplication/EncryptDocument` service using BLOB over HTTP encoding, specify the following URL value:

      `https://hiro-xp:8080/soap/services/MyApplication/EncryptDocument?blob=http`

    * Assign the AEM forms user to the `javax.xml.ws.BindingProvider` object's `USERNAME_PROPERTY` field.
    * Assign the corresponding password value to the `javax.xml.ws.BindingProvider` object's `PASSWORD_PROPERTY` field.

   The following code example shows this application logic:

   ```java
    //Set connection values required to invoke AEM Forms
    String url = "https://hiro-xp:8080/soap/services/MyApplication/EncryptDocument?blob=http";
    String username = "administrator";
    String password = "password";
    ((BindingProvider) encryptDocClient).getRequestContext().put(BindingProvider.ENDPOINT_ADDRESS_PROPERTY, url);
    ((BindingProvider) encryptDocClient).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, username);
    ((BindingProvider) encryptDocClient).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, password);
   ```

1. Create a `BLOB` object by using its constructor.
1. Populate the `BLOB` object by invoking its `setRemoteURL` method. Pass a string value that specifies the URI location of a PDF document to pass to the `MyApplication/EncryptDocument` service.
1. Invoke the `MyApplication/EncryptDocument` process by invoking the `MyApplicationEncryptDocument` object's `invoke` method and passing the `BLOB` object that contains the PDF document. This process returns an encrypted PDF document within a `BLOB` object.
1. Create a byte array to store the data stream that represents the encrypted PDF document. Invoke the `BLOB` object's `getRemoteURL` method (use the `BLOB` object returned by the `invoke` method).
1. Create a `java.io.File` object by using its constructor. This object represents the encrypted PDF document.
1. Create a `java.io.FileOutputStream` object by using its constructor and passing the `java.io.File` object.
1. Invoke the `java.io.FileOutputStream` object's `write` method. Pass the byte array that contains the data stream that represents the encrypted PDF document.

## Invoking AEM Forms using DIME {#invoking-aem-forms-using-dime}

You can invoke AEM Forms services using SOAP with attachments. AEM Forms supports both MIME and DIME web service standards. DIME lets you send binary attachments, such as PDF documents, along with invocation requests instead of encoding the attachment. The *Invoking AEM Forms using DIME* section discusses invoking the following AEM Forms short-lived process named `MyApplication/EncryptDocument` using DIME.

When this process is invoked, it performs the following actions:

1. Obtains the unsecured PDF document that is passed to the process. This action is based on the `SetValue` operation. The input parameter for this process is a `document` process variable named `inDoc`.
1. Encrypts the PDF document with a password. This action is based on the `PasswordEncryptPDF` operation. The password encrypted PDF document is returned in a process variable named `outDoc`.

This process is not based on an existing AEM Forms process. To follow along with the code examples, create a process named `MyApplication/EncryptDocument` using Workbench. (See [Using Workbench](https://www.adobe.com/go/learn_aemforms_workbench_63).)

>[!NOTE]
>
>Invoking AEM Forms service operations using DIME is deprecated. It is recommended that you use MTOM. (See [Invoking AEM Forms using MTOM](#invoking-aem-forms-using-mtom).)

### Creating a .NET project that uses DIME {#creating-a-net-project-that-uses-dime}

To create a .NET project that can invoke a Forms service using DIME, perform the following tasks:

* Install Web Services Enhancements 2.0 on your development computer.
* From within your .NET project, create a web reference to the FormsAEM Forms service.

**Installing Web Services Enhancements 2.0**

Install Web Services Enhancements 2.0 on your development computer and integrate it with Microsoft Visual Studio .NET. You can download Web Services Enhancements 2.0 from the [Microsoft Download Center.](https://www.microsoft.com/downloads/search.aspx)

From this web page, search for Web Services Enhancements 2.0 and download it onto your development computer. This download places a file named Microsoft WSE 2.0 SPI.msi on your computer. Run the installation program and follow the online directions.

>[!NOTE]
>
>Web Services Enhancements 2.0 supports DIME. The supported version of Microsoft Visual Studio is 2003 when working with Web Services Enhancements 2.0. Web Services Enhancements 3.0 does not support DIME; however, it supports MTOM.

**Creating a web reference to an AEM Forms service**

After you install Web Services Enhancements 2.0 on your development computer and create a Microsoft .NET project, create a web reference to the Forms service. For example, to create a web reference to the `MyApplication/EncryptDocument` process and assuming that Forms is installed on the local computer, specify the following URL:

```java
     http://localhost:8080/soap/services/MyApplication/EncryptDocument?WSDL
```

After you create a web reference, the following two proxy data types are available for you to use within your .NET project: `EncryptDocumentService` and `EncryptDocumentServiceWse`. To invoke the `MyApplication/EncryptDocument` process using DIME, use the `EncryptDocumentServiceWse` type.

>[!NOTE]
>
>Before creating a web reference to the Forms service, ensure that you reference Web Services Enhancements 2.0 in your project. (See "Installing Web Services Enhancements 2.0".)

**Reference the WSE library**

1. In the Project menu, select Add Reference.
1. In the Add Reference dialog box, select Microsoft.Web.Services2.dll.
1. Select System.Web.Services.dll.
1. Click Select and then click OK.

**Create a web reference to a Forms service**

1. In the Project menu, select Add Web Reference.
1. In the URL dialog box, specify the URL to the Forms service.
1. Click Go and then click Add Reference.

>[!NOTE]
>
>Ensure that you enable your .NET project to use the WSE library. From within the Project Explorer, right-click the project name and select Enable WSE 2.0. Ensure that the check box on the dialog box that appears is selected.

**Invoking a service using DIME in a .NET project**

You can invoke a Forms service using DIME. Consider the `MyApplication/EncryptDocument` process that accepts an unsecured PDF document and returns a password-encrypted PDF document. To invoke the `MyApplication/EncryptDocument` process using DIME, perform the following steps:

1. Create a Microsoft .NET project that enables you to invoke a Forms service using DIME. Ensure that you include Web Services Enhancements 2.0 and create a web reference to the AEM Forms service.
1. After setting a web reference to the `MyApplication/EncryptDocument` process, create an `EncryptDocumentServiceWse` object by using its default constructor.
1. Set the `EncryptDocumentServiceWse` object's `Credentials` data member with a `System.Net.NetworkCredential` value that specifies the AEM forms user name and password value.
1. Create a `Microsoft.Web.Services2.Dime.DimeAttachment` object by using its constructor and passing the following values:

    * A string value that specifies a GUID value. You can obtain a GUID value by invoking the `System.Guid.NewGuid.ToString` method.
    * A string value that specifies the content type. Because this process requires a PDF document, specify `application/pdf`.
    * A `TypeFormat` enumeration value. Specify `TypeFormat.MediaType`.
    * A string value that specifies the location of the PDF document to pass to the AEM Forms process.

1. Create a `BLOB` object by using its constructor.
1. Add the DIME attachment to the `BLOB` object by assigning the `Microsoft.Web.Services2.Dime.DimeAttachment` object's `Id` data member value to the `BLOB` object's `attachmentID` data member.
1. Invoke the `EncryptDocumentServiceWse.RequestSoapContext.Attachments.Add` method and pass the `Microsoft.Web.Services2.Dime.DimeAttachment` object.
1. Invoke the `MyApplication/EncryptDocument` process by invoking the `EncryptDocumentServiceWse` object's `invoke` method and passing the `BLOB` object that contains the DIME attachment. This process returns an encrypted PDF document within a `BLOB` object.
1. Obtain the attachment identifier value by getting the value of the returned `BLOB` object's `attachmentID` data member.
1. Iterate through the attachments in `EncryptDocumentServiceWse.ResponseSoapContext.Attachments` and use the attachment identifier value to obtain the encrypted PDF document.
1. Obtain a `System.IO.Stream` object by getting the value of the `Attachment` object's `Stream` data member.
1. Create a byte array and pass that byte array to the `System.IO.Stream` object's `Read` method. This method populates the byte array with a data stream that represents the encrypted PDF document.
1. Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents a PDF file location. This object represents the encrypted PDF document.
1. Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.
1. Write the contents of the byte array to the PDF file by invoking the `System.IO.BinaryWriter` object's `Write` method and passing the byte array.

### Creating Apache Axis Java proxy classes that use DIME {#creating-apache-axis-java-proxy-classes-that-use-dime}

You can use the Apache Axis WSDL2Java tool to convert a service WSDL into Java proxy classes so that you can invoke service operations. Using Apache Ant, you can generate Axis library files from a AEM Forms service WSDL that lets you invoke the service. (See [Creating Java proxy classes using Apache Axis](#creating-java-proxy-classes-using-apache-axis).)

The Apache Axis WSDL2Java tool generates JAVA files that contain methods that are used to send SOAP requests to a service. SOAP requests received by a service are decoded by the Axis-generated libraries and turned back into the methods and arguments.

To invoke the `MyApplication/EncryptDocument` service (which was built in Workbench) using Axis-generated library files and DIME, perform the following steps:

1. Create Java proxy classes that consume the `MyApplication/EncryptDocument` service WSDL using Apache Axis. (See [Creating Java proxy classes using Apache Axis](#creating-java-proxy-classes-using-apache-axis).)
1. Include the Java proxy classes into your class path.
1. Create a `MyApplicationEncryptDocumentServiceLocator` object by using its constructor.
1. Create a `URL` object by using its constructor and passing a string value that specifies the AEM Forms service WSDL definition. Ensure that you specify `?blob=dime` at the end of the SOAP endpoint URL. For example, use

   ```java
    https://hiro-xp:8080/soap/services/MyApplication/EncryptDocument?blob=dime.
   ```

1. Create an `EncryptDocumentSoapBindingStub` object by invoking its constructor and passing the `MyApplicationEncryptDocumentServiceLocator`object and the `URL` object.
1. Set the AEM forms user name and password value by invoking the `EncryptDocumentSoapBindingStub` object's `setUsername` and `setPassword` methods.

   ```java
    encryptionClientStub.setUsername("administrator");
    encryptionClientStub.setPassword("password");
   ```

1. Retrieve the PDF document to send to the `MyApplication/EncryptDocument` service by creating a `java.io.File` object. Pass a string value that specifies the PDF document location.
1. Create a `javax.activation.DataHandler` object by using its constructor and passing a `javax.activation.FileDataSource` object. The `javax.activation.FileDataSource` object can be created by using its constructor and passing the `java.io.File` object that represents the PDF document.
1. Create an `org.apache.axis.attachments.AttachmentPart` object by using its constructor and passing the `javax.activation.DataHandler` object.
1. Attach the attachment by invoking the `EncryptDocumentSoapBindingStub` object's `addAttachment` method and passing the `org.apache.axis.attachments.AttachmentPart` object.
1. Create a `BLOB` object by using its constructor. Populate the `BLOB` object with the attachment identifier value by invoking the `BLOB` object's `setAttachmentID` method and passing the attachment identifier value. This value can be obtained by invoking the `org.apache.axis.attachments.AttachmentPart` object's `getContentId` method.
1. Invoke the `MyApplication/EncryptDocument` process by invoking the `EncryptDocumentSoapBindingStub` object's `invoke` method. Pass the `BLOB` object that contains the DIME attachment. This process returns an encrypted PDF document within a `BLOB` object.
1. Obtain the attachment identifier value by invoking the returned `BLOB` object's `getAttachmentID` method. This method returns a string value that represents the identifier value of the returned attachment.
1. Retrieve the attachments by invoking the `EncryptDocumentSoapBindingStub` object's `getAttachments` method. This method returns an array of `Objects` that represent the attachments.
1. Iterate through the attachments (the `Object` array) and use the attachment identifier value to obtain the encrypted PDF document. Each element is an `org.apache.axis.attachments.AttachmentPart` object.
1. Obtain the `javax.activation.DataHandler` object associated with the attachment by invoking the `org.apache.axis.attachments.AttachmentPart` object's `getDataHandler` method.
1. Obtain a `java.io.FileStream` object by invoking the `javax.activation.DataHandler` object's `getInputStream` method.
1. Create a byte array and pass that byte array to the `java.io.FileStream` object's `read` method. This method populates the byte array with a data stream that represents the encrypted PDF document.
1. Create a `java.io.File` object by using its constructor. This object represents the encrypted PDF document.
1. Create a `java.io.FileOutputStream` object by using its constructor and passing the `java.io.File` object.
1. Invoke the `java.io.FileOutputStream` object's `write` method and pass the byte array that contains the data stream that represents the encrypted PDF document.

**See also**

[Quick Start: Invoking a service using DIME in a Java project](/help/forms/developing/invocation-api-quick-starts.md#quick-start-invoking-a-service-using-dime-in-a-java-project)

## Using SAML-based authentication {#using-saml-based-authentication}

AEM Forms supports various web service authentication modes when invoking services. One authentication mode is specifying both a user name and password value using a basic authorization header in the web service call. AEM Forms also supports SAML assertion-based authentication. When a client application invokes an AEM Forms service using a web service, the client application can provide authentication information in one of the following ways:

* Passing credentials as part of Basic Authorization
* Passing username token as part of WS-Security header
* Passing a SAML assertion as part of WS-Security header
* Passing Kerberos token as part of WS-Security header

AEM Forms does not support standard certificate-based authentication but it does support certificate-based authentication in a different form.

>[!NOTE]
>
>The web service quick starts in Programming with AEM Forms specify user name and password values to perform authorization.

The identity of AEM forms users can be represented through a SAML assertion signed using a secret key. The following XML code shows an example of a SAML assertion.

```xml
 <Assertion xmlns="urn:oasis:names:tc:SAML:1.0:assertion"
     xmlns:saml="urn:oasis:names:tc:SAML:1.0:assertion"
     xmlns:samlp="urn:oasis:names:tc:SAML:1.0:protocol"
     AssertionID="fd4bd0c87302780e0d9bbfa8726d5bc0" IssueInstant="2008-04-17T13:47:00.720Z" Issuer="LiveCycle"
     MajorVersion="1" MinorVersion="1">
     <Conditions NotBefore="2008-04-17T13:47:00.720Z" NotOnOrAfter="2008-04-17T15:47:00.720Z">
     </Conditions>
     <AuthenticationStatement
         AuthenticationInstant="2008-04-17T13:47:00.720Z"
         AuthenticationMethod="urn:oasis:names:tc:SAML:1.0:am:unspecified">
         <Subject>
             <NameIdentifier NameQualifier="DefaultDom">administrator</NameIdentifier>
             <SubjectConfirmation>
                 <ConfirmationMethod>urn:oasis:names:tc:SAML:1.0:cm:sender-vouches</ConfirmationMethod>
             </SubjectConfirmation>
         </Subject>
     </AuthenticationStatement>
     <ds:Signature >
         <ds:SignedInfo>
             <ds:CanonicalizationMethod Algorithm="https://www.w3.org/2001/10/xml-exc-c14n#"></ds:CanonicalizationMethod>
             <ds:SignatureMethod    Algorithm="https://www.w3.org/2000/09/xmldsig#hmac-sha1"></ds:SignatureMethod>
             <ds:Reference URI="#fd4bd0c87302780e0d9bbfa8726d5bc0">
                 <ds:Transforms>
                     <ds:Transform Algorithm="https://www.w3.org/2000/09/xmldsig#enveloped-signature"></ds:Transform>
                     <ds:Transform Algorithm="https://www.w3.org/2001/10/xml-exc-c14n#">
                         <ec:InclusiveNamespaces
                             PrefixList="code ds kind rw saml samlp typens #default">
                         </ec:InclusiveNamespaces>
                     </ds:Transform>
                 </ds:Transforms>
                 <ds:DigestMethod Algorithm="https://www.w3.org/2000/09/xmldsig#sha1"></ds:DigestMethod>
                 <ds:DigestValue>hVrtqjWr+VzaVUIpQx0YI9lIjaY=</ds:DigestValue>
             </ds:Reference>
         </ds:SignedInfo>
         <ds:SignatureValue>UMbBb+cUcPtcWDCIhXes4n4FxfU=</ds:SignatureValue>
     </ds:Signature>
 </Assertion>
```

This example assertion is issued for an administrator user. This assertion contains the following noticeable items:

* It is valid for certain duration.
* It is issued for a particular user.
* It is digitally signed. So any modification done to it would break the signature.
* It can be presented to AEM Forms as a token of user's identity similar to user name and password.

A client application can retrieve the assertion from any AEM Forms AuthenticationManager API which returns an `AuthResult` object. You can obtain an `AuthResult` instance by performing one of the following two methods:

* Authenticating the user using any of the authenticate methods exposed by AuthenticationManager API. Typically, one would use the user name and password; however, you can also use the certificate authentication.
* Using the `AuthenticationManager.getAuthResultOnBehalfOfUser` method. This method lets a client application get an `AuthResult` object for any AEM forms user.

An AEM forms user can be authenticated using a SAML token that is obtained. This SAML assertion (xml fragment) can be send as part of the WS-Security header with the web service call for user authentication. Typically, a client application has authenticated a user but has not stored the user credentials. (Or the user has logged on to that client through a mechanism other than using a user name and password.) In this situation, the client application has to invoke AEM Forms and impersonate a specific user which is allowed to invoke AEM Forms.

To impersonate a specific user, invoke the `AuthenticationManager.getAuthResultOnBehalfOfUser` method using a web service. This method returns an `AuthResult` instance which contains the SAML assertion for that user.

Next, use that SAML assertion to invoke any service that requires authentication. This action involves sending the assertion as part of the SOAP header. When a web service call is made with this assertion, AEM Forms identifies the user as the one represented by that assertion. That is, the user specified in the assertion is the user who is invoking the service.

### Using Apache Axis classes and SAML-based authentication {#using-apache-axis-classes-and-saml-based-authentication}

You can invoke an AEM Forms service by Java proxy classes that were created using the Axis library. (See [Creating Java proxy classes using Apache Axis](#creating-java-proxy-classes-using-apache-axis).)

When using AXIS that uses SAML-based authentication, register the request and response handler with Axis. Apache Axis invokes the handler before sending an invocation request to AEM Forms. To register a handler, create a Java class that extends `org.apache.axis.handlers.BasicHandler`.

**Create an AssertionHandler with Axis**

The following Java class, named `AssertionHandler.java`, shows an example of a Java class that extends `org.apache.axis.handlers.BasicHandler`.

```java
 public class AssertionHandler extends BasicHandler {
        public void invoke(MessageContext ctx) throws AxisFault {
            String assertion = (String) ctx.getProperty(LC_ASSERTION);
 
            //no assertion hence nothing to insert
            if(assertion == null) return;
 
            try {
                MessageElement samlElement = new MessageElement(convertToXML(assertion));
                SOAPHeader header = (SOAPHeader) ctx.getRequestMessage().getSOAPHeader();
                //Create the wsse:Security element which would contain the SAML element
                SOAPElement wsseHeader = header.addChildElement("Security", "wsse", WSSE_NS);
                wsseHeader.appendChild(samlElement);
                //remove the actor attribute as in LC we do not specify any actor. This would not remove the actor attribute though
                //it would only remove it from the soapenv namespace
                wsseHeader.getAttributes().removeNamedItem("actor");
            } catch (SOAPException e) {
                throw new AxisFault("Error occured while adding the assertion to the SOAP Header",e);
            }
        }
 }
```

**Register the handler**

To register a handler with Axis, create a client-config.wsdd file. By default, Axis looks for a file with this name. The following XML code is an example of a client-config.wsdd file. See Axis documentation for more information.

```xml
 <deployment xmlns="https://xml.apache.org/axis/wsdd/" xmlns:java="https://xml.apache.org/axis/wsdd/providers/java">
     <transport name="http" pivot="java:org.apache.axis.transport.http.HTTPSender"/>
      <globalConfiguration >
       <requestFlow >
        <handler type="java:com.adobe.idp.um.example.AssertionHandler" />
       </requestFlow >
      </globalConfiguration >
 </deployment>
 
```

**Invoke an AEM Forms service**

The following code example invokes an AEM Forms service using SAML-based authentication.

```java
 public class ImpersonationExample {
        . . .
        public void  authenticateOnBehalf(String superUsername,String password,
                String canonicalName,String domainName) throws UMException, RemoteException{
            ((org.apache.axis.client.Stub) authenticationManager).setUsername(superUsername);
            ((org.apache.axis.client.Stub) authenticationManager).setPassword(password);
 
            //Step 1 - Invoke the Auth manager api to get an assertion for the user to be impersonated
            AuthResult ar = authenticationManager.getAuthResultOnBehalfOfUser(canonicalName, domainName, null);
            String assertion = ar.getAssertion();
            //Step 2 - Setting the assertion here to be picked later by the AssertionHandler. Note that stubs are not threadSafe
            //hence should not be reused. For this simple example we have made them instance variable but care should be taken
            //regarding the thread safety
            ((javax.xml.rpc.Stub) authorizationManager)._setProperty(AssertionHandler.LC_ASSERTION, assertion);
        }
 
        public Role findRole(String roleId) throws UMException, RemoteException{
            //This api would be invoked under bob's user rights
            return authorizationManager.findRole(roleId);
        }
 
        public static void main(String[] args) throws Exception {
            ImpersonationExample ie = new ImpersonationExample("http://localhost:5555");
            //Get the SAML assertion for the user to impersonate and store it in stub
            ie.authenticateOnBehalf(
                    "administrator", //The Super user which has the required impersonation permission
                    "password", // Password of the super user as referred above
                    "bob", //Cannonical name of the user to impersonate
                    "testdomain" //Domain of the user to impersonate
                    );
 
            Role r = ie.findRole("BASIC_ROLE_ADMINISTRATOR");
            System.out.println("Role "+r.getName());
        }
 }
```

### Using a .NET client assembly and SAML-based authentication {#using-a-net-client-assembly-and-saml-based-authentication}

You can invoke a Forms service by using a .NET client assembly and SAML-based authentication. To do so, you must use the Web Service Enhancements 3.0 (WSE). For information about creating a .NET client assembly that uses WSE, see [Creating a .NET project that uses DIME](#creating-a-net-project-that-uses-dime).

>[!NOTE]
>
>The DIME section uses WSE 2.0. To use SAML-based authentication, follow the same instructions that are specified in the DIME topic. However, replace WSE 2.0 with WSE 3.0. Install Web Services Enhancements 3.0 on your development computer and integrate it with Microsoft Visual Studio .NET. You can download Web Services Enhancements 3.0 from the [Microsoft Download Center](https://www.microsoft.com/downloads/search.aspx).

The WSE architecture uses Policies, Assertions, and SecurityToken data types. Briefly, for a web service call, specify a policy. A policy can have multiple assertions. Each assertion can contain filters. A filter is invoked at certain stages in a web service call and, at that time, they can modify the SOAP request. For full details, see the Web Service Enhancements 3.0 documentation.

**Create the Assertion and Filter**

The following C# code example creates filter and assertion classes. This code example creates a SamlAssertionOutputFilter. This filter is invoked by the WSE framework before the SOAP request is sent to AEM Forms.

```java
 class LCSamlPolicyAssertion : Microsoft.Web.ServicES4.Design.PolicyAssertion
 {
        public override Microsoft.Web.ServicES4.SoapFilter CreateClientOutputFilter(FilterCreationContext context)
        {
           return new SamlAssertionOutputFilter();
        }
        . . .
 }
 
 
 class SamlAssertionOutputFilter : SendSecurityFilter
 {
        public override void SecureMessage(SoapEnvelope envelope, Security security)
        {
           // Get the SamlToken from the SessionState
           SamlToken samlToken = envelope.Context.Credentials.UltimateReceiver.GetClientToken<SamlToken>();
           security.Tokens.Add(samlToken);
        }
 }
```

**Create the SAML Token**

Create a class to represent the SAML assertion. The main task that this class performs is convert data values from string to xml and preserve white space. This assertion xml is later imported into the SOAP request.

```java
 class SamlToken : SecurityToken
 {
        public const string SAMLAssertion = "https://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV1.1";
        private XmlElement _assertionElement;
 
        public SamlToken(string assertion)
             : base(SAMLAssertion)
        {
           XmlDocument xmlDoc = new XmlDocument();
           //The white space has to be preserved else the digital signature would get broken
           xmlDoc.PreserveWhitespace = true;
           xmlDoc.LoadXml(assertion);
           _assertionElement = xmlDoc.DocumentElement;
         }
 
         public override XmlElement GetXml(XmlDocument document)
         {
            return (XmlElement)document.ImportNode(_assertionElement, true);
         }
        . . .
 }
```

**Invoke an AEM Forms service**

The following C# code example invokes a Forms service by using SAML-based authentication.

```java
 public class ImpersonationExample
 {
        . . .
        public void AuthenticateOnBehalf(string superUsername, string password, string canonicalName, string domainName)
        {
            //Create a policy for UsernamePassword Token
            Policy usernamePasswordPolicy = new Policy();
            usernamePasswordPolicy.Assertions.Add(new UsernameOverTransportAssertion());
 
            UsernameToken token = new UsernameToken(superUsername, password, PasswordOption.SendPlainText);
            authenticationManager.SetClientCredential(token);
            authenticationManager.SetPolicy(usernamePasswordPolicy);
 
            //Get the SAML assertion for impersonated user
            AuthClient.AuthenticationManagerService.AuthResult ar
                = authenticationManager.getAuthResultOnBehalfOfUser(canonicalName, domainName, null);
            System.Console.WriteLine("Received assertion " + ar.assertion);
 
            //Create a policy for inserting SAML assertion
            Policy samlPolicy = new Policy();
            samlPolicy.Assertions.Add(new LCSamlPolicyAssertion());
            authorizationManager.SetPolicy(samlPolicy);
            //Set the SAML assertion obtained previously as the token
            authorizationManager.SetClientCredential(new SamlToken(ar.assertion));
        }
 
        public Role findRole(string roleId)
        {
            return authorizationManager.findRole(roleId);
        }
 
        static void Main(string[] args)
        {
            ImpersonationExample ie = new ImpersonationExample("http://localhost:5555");
            ie.AuthenticateOnBehalf(
                 "administrator", //The Super user which has the required impersonation permission
                 "password", // Password of the super user as referred above
                 "bob", //Cannonical name of the user to impersonate
                 "testdomain" //Domain of the user to impersonate
                 );
 
         Role r = ie.findRole("BASIC_ROLE_ADMINISTRATOR");
            System.Console.WriteLine("Role "+r.name);
     }
 }
```

## Related considerations when using web services {#related-considerations-when-using-web-services}

Sometimes issues occur when invoking certain AEM Forms services operations by using web services. The objective of this discussion is to identify those issues and provide a solution, if one is available.

### Invoking service operations asynchronously {#invoking-service-operations-asynchronously}

If you attempt to asynchronously invoke an AEM Forms service operation, such as the Generate PDF's `htmlToPDF` operation, a `SoapFaultException` occurs. To resolve this issue, create a custom-binding XML file that maps the `ExportPDF_Result` element and other elements into different classes. The following XML represents a custom binding file.

```xml
 <bindings
        xmlns:xsd="https://www.w3.org/2001/XMLSchema"
        xmlns:jxb="https://java.sun.com/xml/ns/jaxb" jxb:version="1.0"
        xmlns:wsdl="https://schemas.xmlsoap.org/wsdl/"
      wsdlLocation="http://localhost:8080/soap/services/GeneratePDFService?wsdl&async=true&lc_version=9.0.0"
        xmlns="https://java.sun.com/xml/ns/jaxws">
        <enableAsyncMapping>false</enableAsyncMapping>
        <package name="external_customize.client"/>
        <enableWrapperStyle>true</enableWrapperStyle>
        <bindings node="/wsdl:definitions/wsdl:types/xsd:schema[@targetNamespace='https://adobe.com/idp/services']/xsd:element[@name='ExportPDF_Result']">
            <jxb:class name="ExportPDFAsyncResult">
            </jxb:class>
        </bindings>
        <bindings node="/wsdl:definitions/wsdl:types/xsd:schema[@targetNamespace='https://adobe.com/idp/services']/xsd:element[@name='CreatePDF_Result']">
            <jxb:class name="CreatePDFAsyncResult">
            </jxb:class>
        </bindings>
        <bindings node="/wsdl:definitions/wsdl:types/xsd:schema[@targetNamespace='https://adobe.com/idp/services']/xsd:element[@name='HtmlToPDF_Result']">
            <jxb:class name="HtmlToPDFAsyncResult">
            </jxb:class>
        </bindings>
        <bindings node="/wsdl:definitions/wsdl:types/xsd:schema[@targetNamespace='https://adobe.com/idp/services']/xsd:element[@name='OptimizePDF_Result']">
            <jxb:class name="OptimizePDFAsyncResult">
            </jxb:class>
        </bindings>
        <!--bindings node="//wsdl:portType[@name='GeneratePDFService']/wsdl:operation[@name='HtmlToPDF_Result']">
            <jxb:class name="HtmlToPDFAsyncResult"/>
        </bindings-->
 </bindings>
```

Use this XML file when creating Java proxy files by using JAX-WS. (See [Creating Java proxy classes using JAX-WS](#creating-java-proxy-classes-using-jax-ws).)

Reference this XML file when executing the JAX-WS tool (wsimport.exe) by using the - `b` command line option. Update the `wsdlLocation` element in the binding XML file to specify the URL of AEM Forms.

To ensure that asynchronous invocation works, modify the end point URL value and specify `async=true`. For example, for Java proxy files that are created with JAX-WS, specify the following for the `BindingProvider.ENDPOINT_ADDRESS_PROPERTY`.

`https://server:port/soap/services/ServiceName?wsdl&async=true&lc_version=9.0.0`

The following list specifies other services that need a custom binding file when invoked asynchronously:

* PDFG3D
* Task Manager
* Application Manager
* Directory Manager
* Distiller
* Rights Management
* Document Management

### Differences in J2EE application servers {#differences-in-j2ee-application-servers}

Sometimes a proxy library created using a specific J2EE application server does not successfully invoke AEM Forms that is hosted on a different J2EE application server. Consider a proxy library that is generated using AEM Forms that is deployed on WebSphere. This proxy library cannot successfully invoke AEM Forms services that are deployed on the JBoss Application Server.

Some AEM Forms complex data types, such as `PrincipalReference`, are defined differently when AEM Forms is deployed on WebSphere as compared to the JBoss Application Server. Differences in the JDKs used by the different J2EE application services are the reason why there are differences in WSDL definitions. As a result, use proxy libraries that are generated from the same J2EE application server.

### Accessing multiple services using web services {#accessing-multiple-services-using-web-services}

Due to namespace conflicts, data objects cannot be shared between multiple service WSDLs. Different services can share data types and, therefore the services share the definition of these types in the WSDLs. For example, you cannot add two .NET client assemblies that contain a `BLOB` data type to the same .NET client project. If you attempt to do so, a compile error occurs.

The following list specifies data types that cannot be shared between multiple service WSDLs:

* `User`
* `Principals`
* `PrincipalReference`
* `Groups`
* `Roles`
* `BLOB`

To avoid this problem, it is recommended that you fully qualify the data types. For example, consider a .NET application that references both the Forms service and Signature service using a service reference. Both service references will contain a `BLOB` class. To use a `BLOB` instance, fully qualify the `BLOB` object when you declare it. This approach is shown in the following code example. For information about this code exampe, see [Digitally Signing Interactive Forms](/help/forms/developing/digitally-signing-certifying-documents.md#digitally-signing-interactive-forms).

The following C# code example signs an interactive form that is rendered by the Forms service. The client application has two service references. The `BLOB` instance that is associated with the Forms service belongs to the `SignInteractiveForm.ServiceReference2` namespace. Likewise, the `BLOB` instance that is associated with the Signature service belongs to the `SignInteractiveForm.ServiceReference1` namespace. The signed interactive form is saved as a PDF file named *LoanXFASigned.pdf*.

```csharp
 ???/**
     * Ensure that you create a .NET project that uses
     * MS Visual Studio 2008 and version 3.5 of the .NET
     * framework. This is required to invoke a
     * AEM Forms service using MTOM.
     *
     * For information, see "Invoking AEM Forms using MTOM" in Programming with AEM forms
     */
 using System;
 using System.Collections.Generic;
 using System.Linq;
 using System.Text;
 using System.ServiceModel;
 using System.IO;
 
 //A reference to the Signature service
 using SignInteractiveForm.ServiceReference1;
 
 //A reference to the Forms service
 using SignInteractiveForm.ServiceReference2;
 
 namespace SignInteractiveForm
 {
        class Program
        {
            static void Main(string[] args)
            {
                try
                {
                    //Because BLOB objects are used in both service references
                    //it is necessary to fully qualify the BLOB objects
 
                    //Retrieve the form -- invoke the Forms service
                    SignInteractiveForm.ServiceReference2.BLOB formData = GetForm();
 
                    //Create a BLOB object associated with the Signature service
                    SignInteractiveForm.ServiceReference1.BLOB sigData = new SignInteractiveForm.ServiceReference1.BLOB();
 
                    //Transfer the byte stream from one Forms BLOB object to the
                    //Signature BLOB object
                    sigData.MTOM = formData.MTOM;
 
                    //Sign the Form -- invoke the Signature service
                    SignForm(sigData);
                }
                catch (Exception ee)
                {
                    Console.WriteLine(ee.Message);
                }
            }
 
            //Creates an interactive PDF form based on a XFA form - invoke the Forms service
            private static SignInteractiveForm.ServiceReference2.BLOB GetForm()
            {
 
                try
                {
                    //Create a FormsServiceClient object
                    FormsServiceClient formsClient = new FormsServiceClient();
                    formsClient.Endpoint.Address = new System.ServiceModel.EndpointAddress("https://hiro-xp:8080/soap/services/FormsService?blob=mtom");
 
                    //Enable BASIC HTTP authentication
                    BasicHttpBinding b = (BasicHttpBinding)formsClient.Endpoint.Binding;
                    b.MessageEncoding = WSMessageEncoding.Mtom;
                    formsClient.ClientCredentials.UserName.UserName = "administrator";
                    formsClient.ClientCredentials.UserName.Password = "password";
                    b.Security.Transport.ClientCredentialType = HttpClientCredentialType.Basic;
                    b.Security.Mode = BasicHttpSecurityMode.TransportCredentialOnly;
                    b.MaxReceivedMessageSize = 2000000;
                    b.MaxBufferSize = 2000000;
                    b.ReaderQuotas.MaxArrayLength = 2000000;
 
                    //Create a BLOB to store form data
                    SignInteractiveForm.ServiceReference2.BLOB formData = new SignInteractiveForm.ServiceReference2.BLOB();
                    SignInteractiveForm.ServiceReference2.BLOB pdfForm = new SignInteractiveForm.ServiceReference2.BLOB();
 
                    //Specify an XML form data
                    string path = "C:\\Adobe\Loan.xml";
                    FileStream fs = new FileStream(path, FileMode.Open);
 
                    //Get the length of the file stream
                    int len = (int)fs.Length;
                    byte[] ByteArray = new byte[len];
 
                    fs.Read(ByteArray, 0, len);
                    formData.MTOM = ByteArray;
 
                    //Specify an XML form data
                    string path2 = "C:\\Adobe\LoanSigXFA.pdf";
                    FileStream fs2 = new FileStream(path2, FileMode.Open);
 
                    //Get the length of the file stream
                    int len2 = (int)fs2.Length;
                    byte[] ByteArray2 = new byte[len2];
 
                    fs2.Read(ByteArray2, 0, len2);
                    pdfForm.MTOM = ByteArray2;
 
                    PDFFormRenderSpec renderSpec = new PDFFormRenderSpec();
                    renderSpec.generateServerAppearance = true;
 
                    //Set out parameter values
                    long pageCount = 1;
                    String localValue = "en_US";
                    FormsResult result = new FormsResult();
 
                    //Render an interactive PDF form
                    formsClient.renderPDFForm2(
                        pdfForm,
                        formData,
                        renderSpec,
                        null,
                        null,
                        out pageCount,
                        out localValue,
                        out result);
 
                    //Write the data stream to the BLOB object
                    SignInteractiveForm.ServiceReference2.BLOB outForm = result.outputContent;
                    return outForm;
                }
                catch (Exception ee)
                {
                    Console.WriteLine(ee.Message);
                }
                return null;
            }
 
            //Sign the form -- invoke the Signature service
            private static void SignForm(SignInteractiveForm.ServiceReference1.BLOB inDoc)
            {
 
                try
                {
                    //Create a SignatureServiceClient object
                    SignatureServiceClient signatureClient = new SignatureServiceClient();
                    signatureClient.Endpoint.Address = new System.ServiceModel.EndpointAddress("https://hiro-xp:8080/soap/services/SignatureService?blob=mtom");
 
                    //Enable BASIC HTTP authentication
                    BasicHttpBinding b = (BasicHttpBinding)signatureClient.Endpoint.Binding;
                    b.MessageEncoding = WSMessageEncoding.Mtom;
                    signatureClient.ClientCredentials.UserName.UserName = "administrator";
                    signatureClient.ClientCredentials.UserName.Password = "password";
                    b.Security.Transport.ClientCredentialType = HttpClientCredentialType.Basic;
                    b.Security.Mode = BasicHttpSecurityMode.TransportCredentialOnly;
                    b.MaxReceivedMessageSize = 2000000;
                    b.MaxBufferSize = 2000000;
                    b.ReaderQuotas.MaxArrayLength = 2000000;
 
                    //Specify the name of the signature field
                    string fieldName = "form1[0].grantApplication[0].page1[0].SignatureField1[0]";
 
                    //Create a Credential object
                    Credential myCred = new Credential();
                    myCred.alias = "secure";
 
                    //Specify the reason to sign the document
                    string reason = "The document was reviewed";
 
                    //Specify the location of the signer
                    string location = "New York HQ";
 
                    //Specify contact information
                    string contactInfo = "Tony Blue";
 
                    //Create a PDFSignatureAppearanceOptions object
                    //and show date information
                    PDFSignatureAppearanceOptionSpec appear = new PDFSignatureAppearanceOptionSpec();
                    appear.showDate = true;
 
                    //Sign the PDF document
                    SignInteractiveForm.ServiceReference1.BLOB signedDoc = signatureClient.sign(
                        inDoc,
                        fieldName,
                        myCred,
                        HashAlgorithm.SHA1,
                        reason,
                        location,
                        contactInfo,
                        appear,
                        true,
                        null,
                        null,
                        null);
 
                    //Populate a byte array with BLOB data that represents the signed form
                    byte[] outByteArray = signedDoc.MTOM;
 
                    //Save the signed PDF document
                    string fileName = "C:\\Adobe\LoanXFASigned.pdf";
                    FileStream fs2 = new FileStream(fileName, FileMode.OpenOrCreate);
 
                    //Create a BinaryWriter object
                    BinaryWriter w = new BinaryWriter(fs2);
                    w.Write(outByteArray);
                    w.Close();
                    fs2.Close();
                }
 
                catch (Exception ee)
                {
                    Console.WriteLine(ee.Message);
                }
            }
        }
 }
 
 
```

### Services starting with the letter I produce invalid proxy files {#services-starting-with-the-letter-i-produce-invalid-proxy-files}

The name of some AEM Forms generated proxy classes are incorrect when using Microsoft .Net 3.5 and WCF. This issue occurs when proxy classes are created for the IBMFilenetContentRepositoryConnector, IDPSchedulerService or any other service whose name starts with the letter I. For example, the name of the generated client if there is IBMFileNetContentRepositoryConnector is `BMFileNetContentRepositoryConnectorClient`. The letter I is missing in the generated proxy class.

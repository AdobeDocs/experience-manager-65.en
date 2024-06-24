---
title: Barcoded Forms Service
description: Use AEM Forms Barcoded Forms service to extract data from electronic images of barcodes.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: document_services
docset: aem65
feature: Document Services,Assembler,Barcoded Forms
exl-id: d4b5cacd-0bac-48b5-a8a6-0f58883136d7
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# Barcoded Forms Service{#barcoded-forms-service}

## Overview {#overview}

The Barcoded Forms service extracts data from electronic images of barcodes. The service accepts TIFF and PDF files that include one or more barcodes as input and extracts the barcode data. Barcode data can be formatted in various ways, including XML, delimited string, or any custom format created with JavaScript.

The Barcoded Forms service supports the following **two-dimensional (2D)** symbologies supplied as scanned TIFF or PDF documents:

* PDF417
* Data Matrix
* QR Code

The service also supports the following **one-dimensional** symbologies supplied as scanned TIFF or PDF documents:

* Codabar
* Code128
* Code 3 of 9
* EAN13
* EAN8

You can use the Barcoded Forms service to accomplish the following tasks:

* Extract barcode data from barcode images (TIFF or PDF). The data is stored as delimited text.
* Convert delimited text data to XML (XDP or XFDF). XML data is easier to parse than delimited text. Also, data in XDP or XFDF format can be used as input for other services in AEM Forms.

For each barcode in an image, the Barcoded Forms service locates the barcode, decodes it, and extracts the data. The service returns the barcode data (using entity encoding where required) in a content element of an XML document. For example, the following scanned TIFF image of a form contains two barcodes:

![example](assets/example.png)

The Barcoded Forms service returns the following XML document after decoding the barcodes:

```xml
<?xml version="1.0" encoding="UTF-8" ?>  
<xb:scanned_image xmlns:xb="https://decoder.barcodedforms.adobe.com/xmlbeans"     path="tiff" version="1.0"> 
    <xb:decode> 
        <xb:date>2007-05-11T15:07:49.965-04:00</xb:date>  
        <xb:host_name>myhost.adobe.com</xb:host_name>  
        <xb:status type="success"> 
            <xb:message />  
        </xb:status> 
    </xb:decode> 
    <xb:barcode id="1"> 
        <xb:header symbology="pdf417"> 
            <xb:location page_no="1"> 
                <xb:coordinates> 
                    <xb:point x="0.119526625" y="0.60945123" />  
                    <xb:point x="0.44457594" y="0.60945123" />  
                    <xb:point x="0.44457594" y="0.78445125" />  
                    <xb:point x="0.119526625" y="0.78445125" />  
                </xb:coordinates> 
            </xb:location> 
        </xb:header> 
        <xb:body> 
            <xb:content encoding="utf-8">t_SID t_FirstName t_MiddleName t_LastName t_nFirstName t_nMiddleName t_nLastName 90210 Patti Y Penne Patti P Prosciutto</xb:content>  
        </xb:body> 
    </xb:barcode> 
    <xb:barcode id="2"> 
        <xb:header symbology="pdf417"> 
            <xb:location page_no="1"> 
                <xb:coordinates> 
                    <xb:point x="0.119526625" y="0.825" />  
                    <xb:point x="0.44457594" y="0.825" />  
                    <xb:point x="0.44457594" y="0.9167683" />  
                    <xb:point x="0.119526625" y="0.9167683" />  
                </xb:coordinates> 
            </xb:location> 
         </xb:header> 
        <xb:body> 
            <xb:content encoding="utf-8">t_FormType t_FormVersion ChangeName 20061128</xb:content>  
         </xb:body> 
    </xb:barcode> 
</xb:scanned_image>

```

## Considerations for the service {#considerations}

### Workflows that use barcoded forms {#workflows-that-use-barcoded-forms}

Form authors create interactive barcoded forms by using Designer. (See [Designer Help](https://www.adobe.com/go/learn_aemforms_designer_63).) When a user fills a barcoded form by using Adobe Reader or Acrobat, the barcode is updated automatically to encode the form data.

The Barcoded Forms service is useful for converting data that exists on paper to electronic format. For example, when a barcoded form is filled and printed, the printed copy can be scanned and used as input to the Barcoded Forms service.

Watched folder endpoints are typically used to start applications that use the Barcoded Forms service. For example, document scanners can save TIFF or PDF images of barcoded forms in a watched folder. The watched folder endpoint passes the images to the service for decoding.

### Recommended encoding and decoding formats {#recommended-encoding-and-decoding-formats}

Barcoded form authors are encouraged to use a simple, delimited format (such as tab-delimited) when encoding data in barcodes. Also, avoid using Carriage Return as the field delimiter. Designer provides a selection of delimited encodings that automatically generate JavaScript script to encode barcodes. The decoded data has the field names on the first line and their values on the second line, with tabs between each field.

When decoding barcodes, specify the character that is used to delimit fields. The character specified for decoding must be the same character that was used for encoding the barcode. For example, on using the recommended tab-delimited format, the Extract to XML operation must use the default value of Tab for the field delimiter.

### User-specified character sets {#user-specified-character-sets}

When form authors add barcode objects to their forms by using Designer, they can specify a character encoding. The recognized encodings are UTF-8, ISO-8859-1, ISO-8859-2, ISO-8859-7, Shift-JIS, KSC-5601, Big-Five, GB-2312, UTF-16. By default, all data is encoded in barcodes as UTF-8.

When decoding barcodes, you can specify the character set encoding to use. To guarantee that all data is decoded correctly, specify the same character set that the form author specified when the form was designed.

### API Limitations {#api-limitations}

When you use the BCF APIs, consider the following limitations:

* Dynamic forms are not supported.
* Interactive forms are not decoded correctly, unless they are flattened.
* 1-D barcodes must contain only alphanumeric values (if supported). 1-D barcodes containing special symbols are not decoded.

### Other limitations {#other-limitations}

Also, consider the following limitations when using the Barcoded Forms service:

* The service fully supports AcroForms and static forms containing 2D barcodes that are saved using Adobe Reader or Acrobat. However, for 1D barcodes, either flatten the form or supply it as scanned PDF or TIFF document.
* Dynamic XFA forms are not fully supported. To properly decode 1D and 2D barcodes in a dynamic form, either flatten the form or supply it as scanned PDF or TIFF document.

In addition, the service can decode any barcode that uses supported symbology if the above limitations are observed. For more information on how to create interactive barcoded forms, see [Designer Help](https://www.adobe.com/go/learn_aemforms_designer_63).

## Configure properties of the service &nbsp; {#configureproperties}

You can use the **AEMFD Barcoded Forms Service** in AEM Console to configure properties for this service. The default URL of AEM console is `https://[host]:'port'/system/console/configMgr`.

## Using the service {#using}

Barcoded Forms Service provides the following two APIs:

* **[decode](https://helpx.adobe.com/experience-manager/6-3/forms/javadocs/com/adobe/fd/bcf/api/BarcodedFormsService.html#decode)**: Decodes all the barcodes available in an input PDF document or tiff image. It returns another XML document that contains data that was retrieved from all the barcodes available in the input document or image.  

* **[extractToXML](https://helpx.adobe.com/experience-manager/6-3/forms/javadocs/com/adobe/fd/bcf/api/BarcodedFormsService.html#decode)**: Convert data decoded using decode API to XML data. This XML data can be merged with an XFA Form. It returns a list of XML documents, one for each barcode.

### Using BCF Service with a JSP or Servlets {#using-bcf-service-with-a-jsp-or-servlets}

The following sample code decodes a barcode in a document and saves the output XML to the disk.

```jsp
<%@ page import="java.util.List,
                com.adobe.fd.bcf.api.BarcodedFormsService,
                com.adobe.fd.bcf.api.CharSet,
                com.adobe.fd.bcf.api.Delimiter,
                com.adobe.fd.bcf.api.XMLFormat,
                com.adobe.aemfd.docmanager.Document,
                javax.xml.transform.Transformer,
                javax.xml.transform.TransformerFactory,
                java.io.StringWriter,
                javax.xml.transform.stream.StreamResult,
                javax.xml.transform.dom.DOMSource,
                javax.servlet.jsp.JspWriter,
                org.apache.commons.lang.StringEscapeUtils" %><%
%><%@taglib prefix="sling" uri="https://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects/><%

 // Get reference to BarcodedForms OSGi service.
 // Within an OSGi bundle @Reference annotation 
 // can be used to retrieve service reference

 BarcodedFormsService bcfService = sling.getService(BarcodedFormsService.class);

 // Path to image containing barcodes in AEM repository. 
 // Replace this with path to image in your repository
 String documentPath = "/content/dam/TestImage-010.tif";

 // Create a Docmanager Document object for 
 // the tiff file containing barcode
 // See Docmanager Document javadoc for
 // more details
 Document inputDoc = new Document(documentPath);

 // Invoke decode operation of barcoded forms service 
 // Second parameter is set to true to decode PDF417 barcode symbology
 // See javadoc for details of parameters

 org.w3c.dom.Document result = bcfService.decode(inputDoc, // Input Document Object
                                                    true, 
                                                    false,  
                                                    false,
                                                    false,
                                                    false,
                                                    false,
                                                    false,
                                                    false,
                                                    CharSet.UTF_8);// use UTF-8 character encoding 

 out.println("<h2> Output Returned from decode operation </h2>");
 printDoc(result,out);

 // Invoke extractToXML to convert Carriage 
 // return / Tab delimited data to XML 

 List<org.w3c.dom.Document> listResult = bcfService.extractToXML(result, // w3c document from the output of decode operation
                                                                    Delimiter.Carriage_Return, // Lines are separated using "\r"
                                                                    Delimiter.Tab, // Fields are separated using "\t" 
                                                                    XMLFormat.XDP); // wraps generated XML in <xdp:xdp> packet

 out.println("<h2> Output returned from extractToXML </h2>");
 printDoc(listResult.get(0),out);

%><%!

 // helper function to convert w3c document to string

 String convertToString(org.w3c.dom.Document inputDoc) throws Exception {
   TransformerFactory tf = TransformerFactory.newInstance();
   Transformer tr = tf.newTransformer();
   StringWriter sw = new StringWriter();
   StreamResult sr = new StreamResult(sw);
   tr.transform(new DOMSource(inputDoc), sr);
   return sw.toString();
 }

 // helper function to render XML to response

 void printDoc(org.w3c.dom.Document inputDoc,JspWriter out) throws Exception {
   String escapedString = StringEscapeUtils.escapeHtml(convertToString(inputDoc));
   out.println(escapedString);
 }

%>
```

### Using the BCF service with AEM Workflows {#using-the-bcf-service-with-aem-workflows}

Running Barcoded Forms service from a workflow is similar to running the service from JSP/Servlet. The only difference is on running the service from JSP/Servlet the document object automatically retrieves an instance of ResourceResolver object from the ResourceResolverHelper object. This automatic mechanism does not work when the code is called from a workflow.

For a workflow, explicitly pass an instance of the ResourceResolver object to the Document class constructor. Then, the Document object uses provided ResourceResolver object to read content from the repository.

The following sample workflow process decodes a barcode in a document and saves the result to disk. The code is written in ECMAScript and the document is passed as workflow payload:

```javascript
/*
 * Imports 
 */
var BarcodedFormsService = Packages.com.adobe.fd.bcf.api.BarcodedFormsService;
var CharSet = Packages.com.adobe.fd.bcf.api.CharSet;

var Document = Packages.com.adobe.aemfd.docmanager.Document;
var File = Packages.java.io.File;
var FileOutputStream = Packages.java.io.FileOutputStream;
var TransformerFactory = Packages.javax.xml.transform.TransformerFactory;
var Transformer = Packages.javax.xml.transform.Transformer;
var StreamResult = Packages.javax.xml.transform.stream.StreamResult;
var DOMSource = Packages.javax.xml.transform.dom.DOMSource;

var ResourceResolverFactory = Packages.org.apache.sling.api.resource.ResourceResolverFactory;

// get reference to BarcodedFormsService
var bcfService = sling.getService(BarcodedFormsService);

/*
 * workflow payload and path to it
 */
var payload = graniteWorkItem.getWorkflowData().getPayload();
var payload_path = payload.toString();

/* Create resource resolver using current session 
 * this resource resolver needs to be passed to Document
 * object constructor when file is to be read from 
 * crx repository. 
 */

/* get ResourceResolverFactory service reference , used 
 * to construct resource resolver
 */
var resourceResolverFactory = sling.getService(ResourceResolverFactory);

var authInfo = {
    "user.jcr.session":graniteWorkflowSession.getSession()
};

var resourceResolver = resourceResolverFactory.getResourceResolver(authInfo);

// Create Document object from payload_path 
var inputDocument = new Document(payload_path, resourceResolver);

// invoke decode operation to decode barcodes in inputDocument
var decodedBarcode = bcfService.decode(inputDocument, true, false, false, false, false, false, false, false, CharSet.UTF_8);

// save decoded barcode data to disk
saveW3CDocument(decodedBarcode, "C:/temp/decoded.xml");

/*
 * Helper function to save W3C Document
 * to a file on disk
 */
function saveW3CDocument(inputDoc, filePath) {
   var tf = TransformerFactory.newInstance();
   var tr = tf.newTransformer();
   var os = new FileOutputStream(filePath);
   var sr = new StreamResult(os);
   tr.transform(new DOMSource(inputDoc), sr);
   os.close();
}
```

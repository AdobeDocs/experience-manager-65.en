---
title: Working with barcoded forms

description: Decode data from a PDF form or an image that contains a barcode using the Java API and Web Service API.


contentOwner: admin
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations

role: Developer
exl-id: dd32808e-b773-48a2-90e1-7a277d349493
solution: Experience Manager, Experience Manager Forms

feature: "Adaptive Forms,APIs & Integrations,Barcoded Forms"
---
# Working with barcoded forms {#working-with-barcoded-forms} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

## About the barcoded forms Service {#about-the-barcoded-forms-service}

The barcoded forms service automates the capture of data from fill-and-print forms and integrates captured information into an organization's core IT systems.

Using the barcoded forms service, you can add one-dimensional and two-dimensional barcodes to interactive PDF forms. You can then publish the barcoded forms to a website or distribute them by email or CD. When a user fills a barcoded form by using Adobe Reader, Acrobat Professional, or Acrobat Standard, the barcode is updated automatically to encode the user-supplied form data. The user can submit the form electronically, or print it to paper and submit it by mail, fax, or hand. You can later extract the user-supplied data as part of an automated workflow, routing the data among approval processes and business systems.

For more information about the barcoded forms service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

## Decoding Barcoded Form Data {#decoding-barcoded-form-data}

You can use the barcoded forms service API to decode data from a PDF form or an image that contains a barcode. Decoding form data means extracting data that is in the barcode. Before data can be decoded from a PDF form (or image), a user has to populate the form with data.

>[!NOTE]
>
>For more information about the barcoded forms service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary-of-steps}

To decode data from a PDF form, perform the following steps:

1. Include project files.
1. Create a barcoded formsClient API object.
1. Get a PDF form that contains barcoded data.
1. Decode the data from PDF form.
1. Convert the data to an XML data source.
1. Process the decoded data.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, then include the necessary JAR files. If you are using web services, then make sure that you include the proxy files.

The following JAR files must be added to your project's classpath:

* adobe-livecycle-client.jar
* adobe-usermanager-client.jar
* adobe-barcodedforms-client.jar
* adobe-utilities.jar (Required if AEM Forms is deployed on JBoss)
* jbossall-client.jar (Required if AEM Forms is deployed on JBoss)
* xercesImpl.jar (in &lt;install directory&gt;/Adobe/Adobe_Experience_Manager_forms/sdk/client-libs\thirdparty)

If AEM Forms is deployed on a supported J2EE application server that is not JBOSS, then you must replace adobe-utilities.jar and jbossall-client.jar with JAR files that are specific to the J2EE application server on which AEM Forms is deployed. For information about the location of all AEM Forms JAR files, see [Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files).

**Create a barcoded forms Client API object**

Before you can programmatically perform a barcoded forms service operation, you must create a Barcoded Forms service client. If you are using the Java API, create a `BarcodedFormsServiceClient` object. If you are using the barcoded forms web service API, create a `BarcodedFormsServiceService` object.

**Get a PDF form that contains barcoded data**

Obtain a PDF form that contains a barcode that has been populated with user data.

**Decode the data from the PDF form**

After you obtain a PDF form (or image) that contains a barcode, you can decode data. The Barcoded Forms service supports the following types of barcodes:

* PDF417 barcodes.
* Data matrix barcodes.
* QR code barcodes.
* Codabar barcodes.
* Code 128 barcodes.
* Code 39 barcodes.
* EAN-13 barcodes.
* EAN-8 barcodes.

Character set input as hex in the decode API implies that the content of the barcode is encoded as a hex string. For example, if UTF-8 is specified as the Character encoding in the form and Hex is specified in the decode operation, the content of the barcode is encoded as a Hex string in the < `xb:content`&gt; element in the decoded output. You can convert this Hex value to get the original content by creating application logic in your client application.

**Convert the data to an XML data source**

After you decode form data, you can convert it to XDP or XFDF data. For example, assume that you want to import the data into another form. To import the data into an XFA form, then you have to convert the data to XDP data. For information, see [Importing Form Data](/help/forms/developing/importing-exporting-data.md#importing-form-data).

**Process the decoded data**

You can process the converted data to meet your business requirements. For example, after you decode and convert the data, you can save it to a file, store it in an enterprise database, populate another form, and so on. This section discusses how to save the converted data as an XML file.

>[!NOTE]
>
>The barcoded forms service fails to decode barcode data when the line delimiter and field delimiter parameters have the same value

**See also**

[Decode barcoded form data using the Java API](barcoded-forms.md#decode-barcoded-form-data-using-the-java-api)

[Decode barcoded form data using the web service API](barcoded-forms.md#decode-barcoded-form-data-using-the-web-service-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Decode barcoded form data using the Java API {#decode-barcoded-form-data-using-the-java-api}

Decode form data by using the barcoded forms API(Java):

1. Include project files

   Include client JAR files in your Java project's class path.

1. Create a barcoded forms Client API object

   Create a `BarcodedFormsServiceClient` object by using its constructor and passing a `ServiceClientFactory` object that contains connection properties.

1. Get a PDF form that contains barcoded data

    * Create a `java.io.FileInputStream` object that represents the PDF form that contains barcoded data by using its constructor and passing a string value that specifies the location of the PDF document.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Decode the data from the PDF form

   Decode the form data by invoking the `BarcodedFormsServiceClient` object's `decode` method and passing the following values:

    * The `com.adobe.idp.Document` object that contains the PDF form.
    * A `java.lang.Boolean` object that specifies whether to decode a PDF417 barcode.
    * A `java.lang.Boolean` object that specifies whether to decode a data matrix barcode.
    * A `java.lang.Boolean` object that specifies whether to decode a QR code barcode.
    * A `java.lang.Boolean` object that specifies whether to decode a codabar barcode.
    * A `java.lang.Boolean` object that specifies whether to decode a code 128 barcode.
    * A `java.lang.Boolean` object that specifies whether to decode a code 39 barcode.
    * A `java.lang.Boolean` object that specifies whether to decode an EAN-13 barcode.
    * A `java.lang.Boolean` object that specifies whether to decode an EAN-8 barcode.
    * A `com.adobe.livecycle.barcodedforms.CharSet` enumeration value that specifies the character set encoding value used in the barcode.

   The `decode` method returns an `org.w3c.dom.Document` object that contains decoded form data.

1. Convert the data to an XML data source

   Convert the decoded data into either XDP or XFDF data by invoking the `BarcodedFormsServiceClient` object's `extractToXML` method and passing the following values:

    * The `org.w3c.dom.Document` object that contains decoded data (ensure that you use the `decode` method's return value).
    * A `com.adobe.livecycle.barcodedforms.Delimiter` enumeration value that specifies the line delimiter. It is recommended that you specify `Delimiter.Carriage_Return`.
    * A `com.adobe.livecycle.barcodedforms.Delimiter` enumeration value that specifies the field delimiter. For example, specify `Delimiter.Tab`.
    * A `com.adobe.livecycle.barcodedforms.XMLFormat` enumeration value that specifies whether to convert the barcode data into XDP or XFDF XML data. For example, specify `XMLFormat.XDP` to convert the data to XDP data.

   >[!NOTE]
   >
   >Do not specify the same values for the line delimiter and field delimiter parameters.

   The `extractToXML` method returns a `java.util.List` object where each element is an `org.w3c.dom.Document` object. There is a separate element for each barcode that is located on the form. That is, if there are four barcodes on the form, then there are four elements in the returned `java.util.List` object.

1. Process the decoded data

    * Iterate through the `java.util.List` object to get each `org.w3c.dom.Document` object that is in the list.
    * For each element in the list, convert the `org.w3c.dom.Document` object to a `com.adobe.idp.Document` object. (The application logic that converts a `org.w3c.dom.Document` object into a `com.adobe.idp.Document` object is shown in the Decoding barcoded form data using the Java API example).
    * Save the XML data as an XML file by invoking the `com.adobe.idp.Document` object's `copyToFile`, and passing a File object that represents the XML file.

**See also**

[Quick Start (SOAP mode): Decoding barcoded form data using the Java API](/help/forms/developing/barcoded-forms-service-java-api.md#quick-start-soap-mode-decoding-barcoded-form-data-using-the-java-api)

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Decode barcoded form data using the web service API {#decode-barcoded-form-data-using-the-web-service-api}

Decode form data by using the barcoded forms API(web service):

1. Include project files

    * Create a Microsoft .NET client assembly that consumes the barcoded forms service WSDL. For information, see [Invoking AEM Forms using Base64 encoding](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-base64-encoding).
    * Reference the Microsoft .NET client assembly. For information, see "Referencing the .NET client assembly" in [Invoking AEM Forms using Base64 encoding](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-base64-encoding).

1. Create a barcoded forms Client API object

   Using the Microsoft .NET client assembly that consumes the barcoded forms service WSDL, create an `BarcodedFormsServiceService` object by invoking its default constructor.

1. Get a PDF form that contains barcoded data

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store a PDF document that contains a barcode.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the PDF document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object's `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `binaryData` property with the contents of the byte array.

1. Decode the data from the PDF form

   Decode the form data by invoking the `BarcodedFormsServiceService` object's `decode` method and passing the following values:

    * The `BLOB` object that contains the PDF form.
    * A `Boolean` object that specifies whether to decode a PDF417 barcode.
    * A `Boolean` object that specifies whether to decode a data matrix barcode.
    * A `Boolean` object that specifies whether to decode a QR code barcode.
    * A `Boolean` object that specifies whether to decode a codabar barcode.
    * A `Boolean` object that specifies whether to decode a code 128 barcode.
    * A `Bolean` object that specifies whether to decode a code 39 barcode.
    * A `Boolean` object that specifies whether to decode an EAN-13 barcode.
    * A `Boolean` object that specifies whether to decode an EAN-8 barcode.
    * A `CharSet` enumeration value that specifies the character set encoding value used in the barcode.

   The `decode` method returns a string value that contains decoded form data.

1. Convert the data to an XML data source

   Convert the decoded data into either XDP or XFDF data by invoking the `BarcodedFormsServiceService` object's `extractToXML` method and passing the following values:

    * A string value that contains decoded data (ensure that you use the `decode` method's return value).
    * A `Delimiter` enumeration value that specifies the line delimiter. It is recommended that you specify `Delimiter.Carriage_Return`.
    * A `Delimiter` enumeration value that specifies the field delimiter. For example, specify `Delimiter.Tab`.
    * A `XMLFormat` enumeration value that specifies whether to convert the barcode data into XDP or XFDF XML data. For example, specify `XMLFormat.XDP` to convert the data to XDP data.

   >[!NOTE]
   >
   >Do not specify the same values for the line delimiter and field delimiter parameters.

   The `extractToXML` method returns an `Object` array where each element is an `BLOB` instance. There is a separate element for each barcode that is located on the form. That is, if there are four barcodes on the form, then there are four elements in the returned `Object` array.

1. Process the decoded data

    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the secured PDF document.
    * Create a byte array that stores the data content of the `BLOB` object that was returned by the `encryptPDFUsingPassword` method. Populate the byte array by getting the value of the `BLOB` object's `binaryData` data member.
    * Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.
    * Write the contents of the byte array to a PDF file by invoking the `System.IO.BinaryWriter` object's `Write` method and passing the byte array.

**See also**

[Invoking AEM Forms using Base64 encoding](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-base64-encoding)

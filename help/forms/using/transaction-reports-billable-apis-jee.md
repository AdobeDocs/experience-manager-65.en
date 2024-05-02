---
title: Transaction Reports Billable APIs for AEM Forms on JEE.
description: List of all the APIs that are accounted as transactions for AEM Forms on JEE.
topic-tags: forms-manager
feature: Transaction Reports
exl-id: dbb22369-c0a2-4cf6-b01b-096b4de13a14
role: Admin, User, Developer
---
# Transaction reporting Billable APIs for AEM Forms on JEE {#transaction-reports-billable-apis}

AEM Forms on JEE provide several APIs to submit, process, and render documents. Some APIs are accounted as transactions and others are free to use. This document provides a list of all the APIs that are accounted as transactions. Here are a few common scenarios where a billable API is used:

* Converting a document from one format to another
* Flattening a dynamic PDF document
* Merging an interactive PDF document with another PDF document

Billing APIs does not account for the number of pages, the length of a document or form, or final format of the rendered document.
<!--

* **Forms Submitted:** When data is submitted from any type of form created with AEM Forms and the data is submitted to any data storage repository or database is considered form submission. For example, submitting an HTML5 Form, PDF Forms are accounted as forms submitted. Each form in a form set is considered a submission. For example, if a form set has 5 forms, when the form set is submitted, transaction reporting service counts it as 5 submissions.

* **Documents Rendered:** Generating a document by combining a template and data, digitally signing or certifying a document, using a billable document services API for document services, or converting a document from one format to another are accounted as documents rendered.

-->

Below is the list of JEE billable APIs. Find the list of [billable APIs for AEM Forms on OSGi](/help/forms/using/transaction-reports-billable-apis.md).

## Billable Document Services APIs {#billable-document-services-apis}

### Generate PDF Service {#generate-pdf-service}

<table>
 <tbody>
  <tr>
   <td><p>API</p> </td>
   <td>Description</td>
   <td>Transaction report category</td>
  </tr>
   <tr>
   <td><a>CreatePDF</a></td>
   <td>Creates Adobe PDF to supported file types.</td>
   <td>Conversion<br /> </td>
  </tr>
  <tr>
   <td><a>CreatePDF3</a></td>
   <td>Creates Adobe PDF to supported file types. </td>
   <td>Conversion<br /> </td>
  </tr>
  <tr>
   <td><a> HtmlToPDF</a></td>
   <td>Converts HTML file to Adobe PDF. </td>
   <td>Conversion<br /> </td>
  </tr>
  <tr>
   <td><a>ExportPDF</a></td>
   <td>Exports PDF to supported file types. </td>
   <td>Conversion<br /> </td>
  </tr>
  <tr>
   <td><a>ExportPDF2</a></td>
   <td><p>Exports PDF to supported file types.</p> </td>
   <td>Conversion<br /> </td>
  </tr>
  <tr>
   <td><a>ExportPDF3</a></td>
   <td>Exports PDF to supported file types.</td>
   <td>Conversion<br /> </td>
  </tr>
  <tr>
   <td><a>HtmlFileToPDF</a></td>
   <td>Converts HTML file to PDF.</td>
   <td>Conversion<br /> </td>
  </tr>
  <tr>
   <td><a>HtmlToPDF2</a></td>
   <td>Converts HTML file to PDF.</td>
   <td>Conversion<br /> </td>
  </tr>
  <tr>
   <td><a>OptimizePDF</a></td>
   <td>Optimizes PDF to reduce file size by stripping unnecessary metadata without affecting the quality.</td>
   <td>Conversion<br /> </td>
  </tr>
 </tbody>
</table>

### DocAssurance Service {#DocAssurance-Service}

<table>
 <tbody>
  <tr>
   <td><p>API</p> </td>
   <td>Description</td>
   <td>Transaction report category</td>
  </tr>
  <tr>
   <td><a>Sign/Certify</a><br /> </td>
   <td>This API enables you to secure your document. You can use the API to sign and certify a PDF document.</td>
   <td>Conversion</td>
  </tr>
 </tbody>
</table>


### Distiller Service {#distiller-service}

<table>
 <tbody>
  <tr>
   <td><p>API</p> </td>
   <td>Description</td>
   <td>Transaction report category</td>
  </tr>
  <tr>
  <tr>
   <td><a>CreatePDF</a></td>
   <td>Creates Adobe PDF from supported file types.</td>
   <td>Conversion</td>
  </tr>
  <tr>
   <td><a>CreatePDF2</a></td>
   <td>Creates Adobe PDF from supported file types.</td>
   <td>Conversion</td>
  </tr>
 </tbody>
</table>

<!--

### Document of Record Service (DoR Service) {#document-of-record-service-dor-service}

<table>
 <tbody>
  <tr>
   <td><p>API</p> </td>
   <td>Description</td>
   <td>Transaction report category</td>
   <td>Additional Information</td>
  </tr>
  <tr>
   <td><a href="https://helpx.adobe.com/experience-manager/6-5/forms/javadocs/com/adobe/aemds/guide/addon/dor/DoRService.html#render-com.adobe.aemds.guide.addon.dor.DoROptions-" target="_blank">render</a></td>
   <td>Invokes the specified render method to generate a document of record using provided parameters.</td>
   <td>Documents Processed</td>
   <td> </td>
  </tr>
 </tbody>
</table>

-->

### Output Service {#output-service}

<table>
 <tbody>
  <tr>
   <td><p>API</p> </td>
   <td>Description</td>
   <td>Transaction report category</td>
  </tr>
  <tr>
   <td><a>generateOutput</a></td>
   <td>Merges data and templates to create a PDF document.</td>
   <td>Documents Rendered</td>
  </tr>
  <tr>
   <td><a>generatePDFOutput</a></td>
   <td>Merges data and templates to create a PDF document.</td>
   <td>Documents Rendered</td>
  </tr>
  <tr>
   <td><a>generatePDFOutput2</a></td>
   <td>Merges data and templates to create a PDF document.</td>
   <td>Documents Rendered</td>
  </tr>
  <tr>
   <td><a>generatePrintedOutput</a></td>
   <td>Converts XDP and PDF documents to PostScript (PS), Printer Command Language (PCL), and ZPL file formats. </td>
   <td>Documents Rendered</td>
  </tr>
  <tr>
   <td><a>generatePrintedOutput2</a></td>
   <td>Converts XDP and PDF documents to PostScript (PS), Printer Command Language (PCL), and ZPL file formats. </td>
   <td>Documents Rendered</td>
  </tr>
  <tr>
   <td><a>transformPDF</a></td>
   <td>Converts a set of XDP and PDF documents to a set of PostScript (PS), Printer Command Language (PCL), and ZPL file formats. </td>
   <td>Documents Conversion</td>
  </tr>
 </tbody>
</table>

<!-- ### Forms Service {#forms-service}

<table>
 <tbody>
  <tr>
   <td><p>API</p> </td>
   <td>Description</td>
   <td>Transaction report category</td>
   <td>Additional Information</td>
  </tr>
  <tr>
   <td><a href="https://helpx.adobe.com/experience-manager/6-5/forms/javadocs/com/adobe/fd/forms/api/FormsService.html#renderPDFForm-java.lang.String-com.adobe.aemfd.docmanager.Document-com.adobe.fd.forms.api.PDFFormRenderOptions-" target="_blank">renderPDFForm</a></td>
   <td>Renders PDF Form from XDP templates. The XDP templates are created in Forms Designer.</td>
   <td>Documents Processed</td>
   <td> </td>
  </tr>
  <tr>
   <td><a href="https://helpx.adobe.com/experience-manager/6-5/forms/javadocs/com/adobe/fd/forms/api/FormsService.html#exportData-com.adobe.aemfd.docmanager.Document-com.adobe.fd.forms.api.DataFormat-" target="_blank">exportData</a></td>
   <td>Extracts data from a PDF Form or XDP templates</td>
   <td>Documents Processed</td>
   <td> </td>
  </tr>
 </tbody>
</table>

-->

### Convert PDF Service {#convert-pdf-service}

<table>
 <tbody>
  <tr>
   <td><p>API</p> </td>
   <td>Description</td>
   <td>Transaction report category</td>
  </tr>
  <tr>
   <td><a>toImage2</a></td>
   <td>Converts a PDF document to a list of image documents. Supported image formats are JPEG, JPEG2K, PNG, and TIFF.</td>
   <td>Documents Conversion</td>
  </tr>
  <tr>
   <td><a>toPS2</a></td>
   <td>Converts a Flat PDF file to PostScript format using the options specified in the option spec.</td>
   <td>Documents Conversion</td>
  </tr>
  <tr>
   <td><a>toSWF</a></td>
   <td>Converts a Flat PDF file to SWF format using the options specified in the option spec.</td>
   <td>Documents Conversion</td>
  </tr>
 </tbody>
</table>

### Barcoded Forms Service {#barcoded-forms-service}

<table>
 <tbody>
  <tr>
   <td><p>API</p> </td>
   <td>Description</td>
   <td>Transaction report category</td>
  </tr>
  <tr>
   <td><a>decode</a></td>
   <td>Decodes all the barcodes in a Document object and returns an org.w3c.dom.Document object that contains data that was retrieved from the barcode.</td>
   <td>Documents Conversion</td>
  </tr>
 </tbody>
</table>

### Assembler Service {#assembler-service}

<table>
 <tbody>
  <tr>
   <td><p>API</p> </td>
   <td>Description</td>
   <td>Transaction report category</td>
  </tr>
  <tr>
   <td><a>invoke</a></td>
   <td>Executes the specified DDX document and returns an AssemblerResult object containing the resultant documents. </td>
   <td>Documents Conversion</td>
  </tr>
  <tr>
   <td><a>invokeDDX</a></td>
   <td>Executes the specified DDX document and returns an AssemblerResult object containing the resultant documents. </td>
   <td>Documents Conversion</td>
  </tr>
  <tr>
   <td><a>invokeOneDocument</a></td>
   <td>Convert a specified document to PDF/A using the options specified.</td>
   <td>Documents Conversion</td>
  </tr>
  <tr>
   <td><a>invokeDDXOneDocument</a></td>
   <td>Convert a specified document to PDF/A using the options specified.</td>
   <td>Documents Conversion</td>
  </tr>
  <tr>
   <td><a>toPDFA</a></td>
   <td>Convert a specified document to PDF/A using the options specified.</td>
   <td>Documents Conversion</td>
  </tr>
 </tbody>
</table>

The invoke API's usage is counted as a transaction, when you perform one or more of the following operations:
1. Conversion from non-PDF formats to PDF formats. For instance, the conversion from XDP format to PDF format.<!-- catering to both interactive and non-interactive forms of communication, and the conversion from Word to PDF.-->
1. Conversion from PDF format to PDF/A format.
1. Conversion from PDF format to non-PDF formats. Examples encompass the transformation from PDF to Image format or the conversion from PDF to Text format.

>[!NOTE]
>
>* The invoke API of the assembler service can internally call a billable API of another service depending on the input. So, the `invoke API` can be accounted as none, single, or multiple transactions. The number of transactions counted depends upon the input and the internal APIs invoked.
>* A single PDF document produced using assembler service such as `invoke` and `invokeDDX`, can be accounted as none, single, or multiple transactions. The number of transactions counted depends upon the supplied <!--DDX--> code.

<!--
### PDF Utility Service  {#pdf-utility-service}

<table>
 <tbody>
  <tr>
   <td><p>API</p> </td>
   <td>Description</td>
   <td>Transaction report category</td>
   <td>Additional Information</td>
  </tr>
  <tr>
   <td><a>convertPDFtoXDP</a></td>
   <td>Converts a PDF document into an XDP file. For a PDF document to be successfully converted to an XDP file, the PDF document must contain an XFA stream in the AcroForm dictionary.</td>
   <td>Documents Conversion</td>
   <td> </td>
  </tr>
 </tbody>
</table>

-->

## Billable Data Capture APIs {#billable-data-capture-apis}

<!--All the submission events of Forms, HTML5 Forms, and form set are accounted as transactions. By default, submission of a PDF Form is not accounted as a transaction. Use the provided [transaction recorder API](record-transaction-custom-implementation.md) to record a PDF Forms submission as a transaction.-->

<!--
### Adaptive Forms {#adaptive-forms}

<table>
 <tbody>
  <tr>
   <td><p>Use Case</p> </td>
   <td>Description</td>
   <td>Transaction report category</td>
   <td>Additional Information</td>
  </tr>
  <tr>
   <td>Submitting an adaptive form</td>
   <td>Submits an adaptive form to configured submit action. </td>
   <td>Forms Submitted</td>
   <td>
    <ul>
     <li>Successful submissions account for single or two transactions. The number of transactions counted depends upon the type of submit action used for submission. For example, sending PDF through email submit action accounts for two counts of transactions. One transaction for form submission and another for PDF generated using the Document of Record (DOR) service. </li>
     <li>Using the adaptive form within an adaptive form (Adaptive form formset) accounts only single transaction. You can have any number of adaptive forms within an adaptive form.</li>
    </ul> </td>
  </tr>
 </tbody>
</table>

-->

<!--### HTML5 Forms {#html-forms}

<table>
 <tbody>
  <tr>
   <td><p>Use Case</p> </td>
   <td>Description </td>
   <td>Transaction report category</td>
   <td>Additional Information</td>
  </tr>
  <tr>
   <td>Submitting an HTML5 Form</td>
   <td>Submits an HTML5 Form to submit URL configured in the form.</td>
   <td>Forms Submitted</td>
   <td> </td>
  </tr>
 </tbody>
</table>

-->

### Forms {#form-set}

<table>
 <tbody>
  <tr>
   <td><p>API</p> </td>
   <td>Description</td>
   <td>Transaction report category</td>
  </tr>
  <tr>
   <td>exportData</td>
   <td>Submits form.</td>
   <td>Forms Submitted</td>
  </tr>
  <tr>
   <td>exportData2</td>
   <td>Submits form.</td>
   <td>Forms Submitted</td>
  </tr>
  <tr>
   <td>renderForm</td>
   <td>Submits form.</td>
   <td>Forms Rendered</td>
  </tr>
  <tr>
   <td>renderHTMLForm</td>
   <td>Submits form.</td>
   <td>Forms Rendered</td>
  </tr>
  <tr>
   <td>renderHTMLForm2</td>
   <td>Submits form.</td>
   <td>Forms Rendered</td>
  </tr>
  <tr>
   <td>renderPDFForm</td>
   <td>Submits form.</td>
   <td>Forms Rendered</td>
  </tr>
  <tr>
   <td>renderPDFForm2</td>
   <td>Submits form.</td>
   <td>Forms Rendered</td>
  </tr>
  <tr>
   <td>renderPDFFormWithUsageRights</td>
   <td>Submits form.</td>
   <td>Forms Rendered</td>
  </tr>
 </tbody>
</table>

<!-- ## Billable Interactive Communication and Form-centric AEM Workflows on OSGi APIs {#billable-interactive-communication-and-form-centric-aem-workflows-on-osgi-apis}

Assign task and document services steps of Form-centric AEM Workflows on OSGi and all the renditions of interactive communication and are accounted as transactions. Previewing an interactive communication on the author instance and previewing on the publish instance using Agent UI are not accounted as transactions. If a workflow step accounts a transaction and the workflow fails to complete, the transaction count is not reversed.

<!--

### Interactive Communication - Web Channel {#interactive-communication-web-channel}

<table>
 <tbody>
  <tr>
   <td><p>API</p> </td>
   <td>Description</td>
   <td>Transaction report category</td>
   <td>Additional Information</td>
  </tr>
  <tr>
   <td>Rendering a web channel</td>
   <td>Opens the web version of an interactive communication.</td>
   <td>Documents Rendered</td>
   <td>
    <div>
    </div> </td>
  </tr>
 </tbody>
</table>

### Interactive Communication - Print Channel {#interactive-communication-print-channel}

<table>
 <tbody>
  <tr>
   <td><p>API</p> </td>
   <td>Description</td>
   <td>Transaction report category</td>
   <td>Additional Information</td>
  </tr>
  <tr>
   <td><a href="https://helpx.adobe.com/experience-manager/6-5/forms/javadocs/com/adobe/fd/ccm/channels/print/api/model/PrintChannel.html" target="_blank">render</a> (convert to PDF)</td>
   <td>Generates the PDF version of an interactive communication.</td>
   <td>Documents Rendered</td>
   <td>
    <div>
    </div> </td>
  </tr>
 </tbody>
</table>

-->


<!--
### Form-centric AEM Workflows on OSGi  {#form-centric-aem-workflows-on-osgi}

<table>
 <tbody>
  <tr>
   <td><p>Use case</p> </td>
   <td>Transaction report category</td>
   <td>Additional Information</td>
  </tr>
  <tr>
   <td>Submitting an Assign Task step</td>
   <td>Forms Submitted</td>
   <td>
    <div>
    </div> </td>
  </tr>
  <tr>
   <td>Submitting a workflow application startpoint </td>
   <td>Forms Submitted</td>
   <td> </td>
  </tr>
  <tr>
   <td>Submitting an interactive communication (Print Channel) from the Agent UI to a workflow</td>
   <td>Documents Rendered</td>
   <td> </td>
  </tr>
 </tbody>
</table>

-->


<!--

WILL ADD THIS ONE - 

## Recording billable APIs as transactions for custom code {#recording-billable-apis-as-transactions-for-custom-code}

Actions like submitting a PDF Form, using Agent UI to preview an interactive communication, using non-standard form submission, and custom implementations are not accounted as transactions. AEM Forms provides an API to record such actions as transactions. You can call the API from your custom implementations to [record a transaction](/help/forms/using/record-transaction-custom-implementation.md).

## Related Articles {#related-articles}

* [Transaction Reports Overview](../../forms/using/transaction-reports-overview.md)
* [Viewing and Understanding a Transaction Reports](../../forms/using/viewing-and-understanding-transaction-reports.md)
* [Record a transaction for custom implementations](/help/forms/using/record-transaction-custom-implementation.md)

-->

## Related Articles

* [Enabling and viewing transaction report for AEM Forms on JEE](/help/forms/using/transaction-report-overview-jee.md)
* [Record a transaction for custom component APIs for AEM Forms on JEE](/help/forms/using/record-transaction-custom-component-jee.md)

---
title: Overview of AEM Document Services
seo-title: Overview of AEM Document Services
description: AEM Document Services are a set of OSGi Services for creating, assembling, and securing PDF Documents.
seo-description: AEM Document Services are a set of OSGi Services for creating, assembling, and securing PDF Documents.
uuid: 6114e9f9-dd4f-4829-ab63-44e3d4e71eb8
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: document_services
discoiquuid: c31d6b79-8958-421d-a8ad-2e4f7093ef98
index: y
internal: n
snippet: y
---

# Overview of AEM Document Services{#overview-of-aem-document-services}

AEM Document Services are a set of OSGi Services for creating, assembling, and securing PDF Documents. Document Services contain following services:

<!--
Comment Type: draft

<h2>Forms Service</h2>
-->

<!--
Comment Type: draft

<p>The Forms service enables you to create interactive data capture client applications that validate, process, transform, and deliver forms typically created in Designer. Form authors develop a single form design that the Forms service renders as PDF, HTML, or as Guides (deprecated) in various browser environments that support Adobe Flash Player.</p>
-->

<!--
Comment Type: draft

<p>The Forms service renders interactive PDF forms. An interactive form contains one or more fields for collecting information interactively from a user. An interactive form design produces a form that can be filled online or (in the case of PDF forms) offline. Users can open the form in Acrobat, Adobe Reader, or an HTML browser and enter information into the form’s fields. An interactive form can include buttons or commands for common tasks, such as saving data to a file or printing. It can also include drop-down lists, calculations, and validations.</p>
<p>When an end user requests a form, a client application such as a Java servlet sends the request to the Forms service. The Forms service returns the form in an appropriate format to the end user. When the Forms service receives a request for a form, it uses a set of transformations to merge data with a form design. It then delivers the form in a format that best matches the presentation and form-filling capabilities of the target browser. For example, if the end user requests a PDF form, the Forms service renders an interactive PDF form.</p>
<p>The Forms service performs the following functions:</p>
<ul>
<li><p>Provides server-side execution of the intelligence that is in the form design. The Forms service executes the validations and calculations included in the form design and returns the resultant data to the browser.</p> </li>
<li><p>Detects whether form design scripts should run on the client or the server. For clients that support client-side scripting such as Internet Explorer 5.0 and later, an appropriate scripting model is loaded into the device so that the scripts can run directly on the client computer. </p> </li>
<li><p>Dynamically generates PDF, SWF, or HTML content based the user's preference for a specific form design with or without data. An HTML form can deliver multipage forms page by page. However, a PDF form delivers all the pages at once. In Designer, the form author can script the current page number in the form design. The Forms service can merge one page of data that is submitted at a time or merge only the single page into the form design.</p> </li>
<li><p>Supports subforms created in Designer. The Forms service adds extra fields and boilerplate as a result of merging the form design with data or as a result of scripting. With HTML, the added subforms can grow to unlimited page lengths. With PDF, the added subforms paginate at the page lengths that are specified in the form design.</p> </li>
<li><p>Renders forms based on fragments. Fragments allow you to share form and script objects that are external to form designs. You can design parts of a form once and reuse them when designing collections of related forms. When creating a form for the collection, you simply insert a reference to the fragment. When a form author updates a fragment, all forms that contain a reference to the fragment reflect the changes (when the form is rerendered).</p> </li>
<li><p>Validates data entry by performing calculations, accessing databases, or enforcing business rules on field-level data.</p> </li>
<li><p>Renders forms with file attachments. Also, the Forms service can process form submissions that contain file attachments.</p> </li>
<li><p>Displays validation errors in different ways (split frame left, top, right, bottom; no frame left, top, right, bottom; or no UI). The errors are displayed without maintaining any state on the server. The validation errors are also made available in the XML-based validation error document.</p> </li>
<li><p>Maintains the state of any pass-through data that the application passed in. <em>Pass-through data</em> is data that does not have corresponding fields in the form design being processed. The pass-through data is passed back to the calling application after the target device submits the data.</p> </li>
<li><p>Enables a non-technical user to amend a form design by using Designer to meet ongoing business requirements. In contrast, a web application that displays HTML pages requires a user to modify HTML or XML source code to change the web page.</p> </li>
</ul>
-->

## Output Service {#output-service}

The Output service lets you create documents in different formats, including PDF, laser printer formats, and label printer formats. Laser printer formats are PostScript and Printer Control Language (PCL). The following list specifies label printer formats:

* Zebra (ZPL)
* Intermec (IPL)
* Datamax (DPL)
* TecToshiba (TPCL)

A document can be sent to a network printer, a local printer, or a file on the file system. The Output service merges XML form data with a form design to generate a document. The Output service can generate a document without merging XML form data into the document. However, the primary workflow is merging data into the document.

>[!NOTE]
>
>A form design is typically created by using Designer. For information about creating form designs for the Output service, see Designer Help.

When using the Output service to merge XML data with a form design, the result is a non-interactive PDF document. A non-interactive PDF document does not let users enter data into its fields. In contrast, you can use the Forms service to create an interactive PDF form that lets users enter data into its fields.

The following four Output service operations are available for use:

* **generatePDFOuput**: Merges a form design with data to generate a PDF document
* **generatePrintedOutput**: Merges a form design with form data to generate a document to send to either a laser or a label network printer

* **generatePDFOutputBatch**: Merges multiple templates with multiple records of data in a single invocation to generate a batch of PDF files. There is also option of generating a single PDF by commbining all the PDFs
* **generatePrintedOutputBatch**: Merges multiple templates with multiple records of data in a single invocation to generate a batch of print documents (PS,PCL,ZPL,DPL,IPL,TPCL). There is also option of generating a single print document.

## Assembler Service {#assembler-service}

The Assembler service lets you combine, rearrange, and augment PDF and XDP documents and obtain information about PDF documents. Each job submitted to the Assembler service includes a Document Description XML (DDX) document, source documents, and external resources (strings and graphics). The DDX document provides instructions on how to use the source documents to produce a set of resultant documents.

Apart from above mentioned capabilities, the Assembler service:

* Converts PDF documents to PDF/A standard. 
* Transforms PDF forms, XML forms (created in Designer), and PDF forms (created in Acrobat) to PDF/A-1b, PDF/A-2b, and PDFA/A-3b. 
* Converts signed or unsigned PDF documents (Digital Signatures required). 
* Validates the compliance of a PDF/A file and converts it if necessary.

### About DDX {#about-ddx}

When using the Assembler service, use an XML-based language called Document Description XML (DDX) to describe the output you want. DDX is a declarative markup language whose elements represent building blocks of documents. These building blocks include PDF documents, XDP documents, XDP form fragments, and other elements such as comments, bookmarks, and styled text.

DDX document can specify resultant documents with these characteristics:

* PDF document that is assembled from multiple PDF documents  
* Multiple PDF documents that are broken apart from a single PDF document  
* PDF Portfolio that includes a self-contained user interface and multiple PDF and non-PDF documents  
* XDP document that is assembled from multiple XDP documents  
* XDP document that contains XML fragments that are dynamically inserted into an XDP document  
* PDF document that packages an XDP document  
* XML files that report on the characteristics of a PDF document. The reported characteristics include text, comments, form data, file attachments, files used in PDF Portfolios, bookmarks, and PDF properties. PDF properties include form properties, page rotation, and document author.

You can use DDX to augment PDF documents as part of document assembly or disassembly. You can specify any combination of the following effects:

* Add or remove watermarks or backgrounds on selected pages.  
* Add or remove headers and footers on selected pages.  
* Removes the structure and navigational capabilities of a PDF Package or PDF Portfolio. The result is a single PDF file.  
* Renumber page labels. Page labels are typically used for page numbering.  
* Import metadata from another source document.  
* Add or remove file attachments, bookmarks, links, comments, and JavaScript.  
* Set initial view characteristics and optimize for viewing on the web.  
* Set permissions for encrypted PDF.  
* Rotate pages or rotate and shift content on pages.  
* Change the size of selected pages.  
* Merge data with a PDF that is XFA-based.

You can use a simple input map to specify the locations of source and resultant documents. You can also use the following external data URL types:

* File  
* FTP
* HTTP/HTTPS

<!--
Comment Type: draft

<p>For more information, see <a href="../../../6-5/forms/using/assembler-service.md" target="_blank">Using Assembler service</a>.</p>
-->

## Doc Assurance Service {#doc-assurance-service}

The Doc Assurance Service helps you to encrypt and decrypt documents, extend the functionality of Adobe Reader with additional usage rights, and add digital signatures to your documents. Your users can easily interact with PDF forms and documents, while your organization improves security, archiving, and compliance.

The Doc Assurance service contains three services: signature, encryption, and reader extension.

### Signature Service {#signature-service}

The Signature service lets you work with digital signatures and documents on the AEM server. For example, the Signature service is typically used in the following situations:

* The AEM server certifies a form before it is sent to a user to open by using Acrobat or Adobe Reader.
* The AEM server validates a signature that was added to a form by using Acrobat or Adobe Reader.
* The AEM server signs a form on behalf of a public notary.

The Signature service accesses certificates and credentials that are stored in the trust store.

### Encryption Service {#encryption-service}

The Encryption service enables you to encrypt and decrypt documents. When a document is encrypted, its contents become unreadable. You can encrypt the entire PDF document (including its content, metadata, and attachments), everything other than its metadata, or only the attachments. An authorized user can decrypt the document to obtain access to its contents. If a PDF document is encrypted with a password, the user must specify the open password before the document can be viewed in Adobe Reader or Acrobat. If a PDF document is encrypted with a certificate, the user must decrypt the PDF document with a private key (certificate). The private key used to decrypt the PDF document must correspond to the public key used to encrypt it.

### Reader Extension Service {#reader-extension-service}

The Reader Extensions service enables your organization to easily share interactive PDF documents by extending the functionality of Adobe Reader with additional usage rights. The Reader Extensions service works with Adobe Reader 7.0 or later. The service adds usage rights to a PDF document. This action activates features that are not usually available when a PDF document is opened using Adobe Reader, such as adding comments to a document, filling forms, and saving the document. Third-party users do not require additional software or plug-ins to work with rights-enabled documents.

When PDF documents have the appropriate usage rights added, recipients can do the following activities from within Adobe Reader:

* Complete PDF documents and forms online or offline, allowing recipients to save copies locally for their records and still keep added information intact
* Save PDF documents to a local hard drive to retain the original document and any additional comments, data, or attachments
* Attach files and media clips to PDF documents
* Sign, certify, and authenticate PDF documents by applying digital signatures using industry-standard public key infrastructure (PKI) technologies
* Submit completed or annotated PDF documents electronically
* Use PDF documents and forms as an intuitive development front end to internal databases and web services
* Share PDF documents with others so that reviewers can add comments by using intuitive markup tools. These tools include electronic sticky notes, stamps, highlights, and text strikethrough. The same functions are available in Acrobat.
* Support barcoded forms decoding.

These special user capabilities are automatically activated when a rights-enabled PDF document is opened within Adobe Reader. When the user has finished working with a rights-enabled document, those functions are again disabled in Adobe Reader. They remain disabled until the user receives another rights-enabled PDF document.

Out of the box, the DocAssurance service is not available for use. To configure the DocAssurance service, see [Installing and Configuring Configuring Document Services](../../../6-5/forms/using/install-configure-document-services.md).

## Send To Printer Service {#send-to-printer-service}

Send To Printer Service provides API to Send documents to specified printer for printing.

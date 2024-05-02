---
title: Overview of AEM Document Services
description: AEM Document Services are a set of OSGi Services for creating, assembling, and securing PDF Documents.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: document_services
docset: aem65
feature: Document Services
exl-id: 4c8a3877-1a3c-410d-ad1f-69c73ba4fcc1
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# Overview of AEM Document Services{#overview-of-aem-document-services}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/using-communications/aem-forms-cloud-service-communications-introduction.html)                  |
| AEM 6.5     | This article         |


AEM Document Services are a set of OSGi Services for creating, assembling, and securing PDF Documents. Document Services contain following services:

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

Out of the box, the DocAssurance service is not available for use. To configure the DocAssurance service, see [Installing and Configuring Configuring Document Services](../../forms/using/install-configure-document-services.md).

## Send To Printer Service {#send-to-printer-service}

Send To Printer Service provides API to Send documents to specified printer for printing.

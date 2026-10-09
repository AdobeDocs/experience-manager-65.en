---
title: Output Service
description: Describes Output Service, which is part of AEM Document Services
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: document_services
docset: aem65
feature: Document Services,Output Service
exl-id: 82b0293a-711f-4769-9b11-b4cff4fec021
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: 9cc5e18e-2002-58a1-befa-285122cf6653
    internal-label: Output Service
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: f19cff18-c8cc-4a4b-adad-85dd2fa3dbe2
    internal-label: Document Services
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Output Service{#output-service}

## Overview {#overview}

Output service is an OSGi service that is part of AEM Document Services. Output service supports various output formats and output design features of AEM Forms Designer. Output service can convert XFA templates and XML data to generate print documents in various formats.

Output service enables you to create applications that let you:

* Generate final form documents by populating template files with XML data.
* Generate output forms in various formats, including non-interactive PDF, PostScript, PCL, and ZPL print streams.
* Generate print PDFs from XFA form PDFs.
* Generate PDF, PostScript, PCL and ZPL documents in bulk by merging multiple sets of data with supplied templates.

>[!NOTE]
>
>Output service is a 32-bit application. On Microsoft Windows, a 32-bit application is allowed to use a maximum of 2 GB of memory. The limit applies to the output service also.

## Creating non-interactive form documents {#creating-non-interactive-form-documents}

![usingoutput_modified](assets/usingoutput_modified.png)

Typically, you create templates using AEM Forms Designer. The `generatePDFOutput` and `generatePrintedOutput` APIs of the Output service let you directly convert these templates to various formats, including PDF, PostScript, ZPL, and PCL.

The `generatePDFOutput` operation generates PDFs, while the `generatePrintedOutput` operation generates PostScript, ZPL, and PCL formats. The first parameter of both the operations accept either the name of the template file (for example, `ExpenseClaim.xdp`) or a Document object that contains the template. When you specify the name of the template file, also specify the content root as the path to the folder that contains the template. You can specify content root using either the `PDFOutputOptions` or the `PrintedOutputOptions` parameter. See Javadoc for details of other options you can specify using these parameters.

The second parameter accepts an XML document that is merged with the template while generating the output document.

The `generatePDFOutput` operation can also accept an XFA-based PDF form as input and return a non-interactive version of the PDF form as output.

## Generating non-interactive form documents {#generating-non-interactive-form-documents}

Consider a scenario where you have one or more templates and multiple records of XML data for each template.

Use the `generatePDFOutputBatch` and `generatePrintedOutputBatch` operations of the Output service to generate a print document for each record.

You can also combine the records into a single document. Both the operations take four parameters.

The first parameter is a Map that contains an arbitrary string as the key and the name of the template file as value.

The second parameter is a different Map whose value is a Document object that contains XML data. The key is the same as that you specify for the first parameter.

The third parameter for `generatePDFOutputBatch` or `generatePrintedOutputBatch` is of type `PDFOutputOptions` or `PrintedOutputOptions` respectively.

The parameter types are the same as types of the parameters for the `generatePDFOutput` and `generatePrintedOutput` operations and have the same effect.

The fourth parameter is of type `BatchOptions`, which you use to specify whether a separate file can be generated for each record. The default value of this parameter is false.

Both `generatePrintedOutputBatch` and `generatePDFOutputBatch` return a value of type `BatchResult`. The value contains a list of documents generated. It also contains a metadata document in XML format that contains information related to each document that is generated.

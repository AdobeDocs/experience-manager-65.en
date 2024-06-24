---
title: Forms Service
description: The article describes Forms service and the form-related tasks you can perform using Forms service.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: document_services
feature: Document Services,Forms Service,PDF Generator
exl-id: 6580fe6f-3cdb-45ec-8ba3-51dc60d1965e
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# Forms Service {#forms-service}

## Overview {#overview}

The Forms service lets you create interactive data capture client applications that validate, process, transform, and deliver forms that are typically created in Designer. The Forms service renders as PDF documents any form design that you develop.

Forms service also enables organizations to extend their intelligent data capture processes by deploying electronic forms as Adobe PDFs. You can also use the service to import and export data to and from existing PDF forms respectively.

Use the Forms service to do the following:

* Render PDF forms based on template and XML data.
* Enable form data integration to import data into and extract data from PDF forms.
* Render forms based on fragments.

## Creating PDF forms&nbsp; {#creating-pdf-forms-nbsp}

Use Form service to create PDF Forms for data capture. Typically, you start with an AEM Forms Designer template. Use the `renderPDFForm` (link to Javadoc) operation of the Forms service to convert this template to a PDF form.

The first parameter of the `renderPDFForm` operation is the name of the template file (for example, `ExpenseClaim.xdp`). You can store the template file in a local file system, CRX repository, or at an HTTP or FTP location. You can specify the location of the template file by setting the content root in the `PDFFormRenderOptions` parameter of the `renderPDFForm` operation. See Javadoc for details of other options that you can specify for the `PDFFormRenderOptions` parameter.

The `renderPDFForm` operation can also accept XML data. The XML data is merged with the template when creating a PDF Form so that the generated PDF form contains the specified data. The second parameter for the `renderPDFForm` operation can accept a Document (Javadoc) object that contains XML data.

## Extracting data from PDF forms&nbsp; {#extracting-data-from-pdf-forms-nbsp}

Use the `exportData` (Javadoc) operation of the Forms service to extract data XML from a PDF form. This operation accepts a document as its first parameter. You can export the data either as an XDP document or an XML file. If you export the data as an XML file, the exported data removes the XDP envelope and returns a plain XML file. You can specify this arrangement using the second parameter.

## Importing data into PDF forms {#importing-data-into-pdf-forms}

Forms service also lets you merge a PDF form created using either AEM Forms Designer or the `renderPDFForm` operation with XML data. The `importData` (Javadoc) operation of Forms service accepts the PDF form and XML data and returns a PDF form with data XML.

## Rendering forms based on fragments {#rendering-forms-based-on-fragments}

Forms service can render forms based on fragments that you create using AEM Forms Designer. A fragment is a reusable part of a form. It is saved as a separate XDP file that can be inserted into multiple form designs. For example, a fragment can include an address block or legal text.

Using fragments simplifies and accelerates the creation and maintenance of large numbers of forms. When creating a form, insert a reference to the required fragment for the fragment to appear in the form. The fragment reference contains a subform that points to the physical XDP file.

The following are the advantages of using fragments:

* **Content reuse**: You can reuse content in multiple form designs. To quickly reuse parts of the same content in multiple forms, create a fragment. Copying or re-creating the content takes a longer time. Using fragments also ensures that the frequently used parts of a form design have consistent content and appearance in all the referencing forms.
* **Global updates**: You can make global changes to multiple forms only once in a file. You can change the content, script objects, data bindings, layout, or styles in a fragment. All XDP forms that reference the fragment reflect the changes.
* **Shared form creation**: You can share the creation of forms among several resources. Form developers with expertise in scripting or other advanced features of AEM Forms Designer can develop and share fragments that use scripting and dynamic properties. Form designers can use the fragments to design forms. In addition, they can use the fragments to ensure that all parts of a form have a consistent appearance and functionality across multiple forms.

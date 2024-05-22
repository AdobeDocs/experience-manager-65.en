---
title: Initiate Document Services APIs from AEM Workflow
description: Learn how to invoke AEM Document services on DDX or supplied inputs. Also see hwo to convert PDF to PDF/A
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: document_services
exl-id: 123087a2-9d09-4579-9185-2ccd7d25bf8d
solution: Experience Manager, Experience Manager Forms
feature: Interactive Communication
role: User, Developer
---
# Initiate Document Services APIs from AEM Workflow  {#initiate-document-services-apis-from-aem-workflow}

## Assembler {#assembler}

AEM Forms provides custom workflows to invoke the following Assembler service APIs:

* **invoke**: Invokes operations specified in input DDX on supplied inputs.
* **toPDFA**: Converts input PDF document to PDF/A document.

### Invoke DDX workflow {#invoke-ddx-workflow}

The **Invoke DDX** workflow invokes the `Invoke` Assembler service API, which you can use to assemble or disassemble documents, add watermark to a PDF, and so on.

1. Drag the **[!UICONTROL Invoke DDX]** workflow step under the Forms Workflow tab in Sidekick.
1. Double-click the added workflow step to edit the component.
1. In the Edit component dialog, configure input documents, environment options, and output documents, and click **[!UICONTROL OK]**.

#### Input documents {#input-documents}

The Invoke DDX workflow requires the following input documents:

* **DDX**: It is a mandatory input for the Invoke DDX workflow step and can be specified by selecting one of the following options from the DDX input drop-down.

    * *Relative To Payload*: The DDX input file is relative to the payload folder for the workflow item.
    * *Use Payload*: The payload for the workflow item is used as the input DDX document.
    * *Absolute Path*: The absolute path to the DDX document in the CRX repository.

* **Create Map from PayLoad**: When selected, all documents under the payload folder are added to Input Document's Map for the `invoke` API in Assembler. The node name for each document is used as a key in the map.

* **Input Document's Map**: Specifies the Input Document's Map. You can add any number of entries, where each entry specifies the document's key in the map and the source of the document.

#### Environment options {#environment-options}

The Environment Options tab lets you set various processing options for the invoke API.

* *Job Log Level*: Specifies the log level for the processing logs.
* *Validate Only*: Checks the validity of the input DDX.

* *Fail On Error*: Specifies whether the call to Assembler service should fail if there is an error. The default value is False.

#### Output documents {#output-documents}

Depending on the input DDX, the invoke API can produce multiple output documents. The Output Documents tab lets you select where output document will be saved.

1. *Save Output in Payload*: Saves output documents under the payload folder, or overwrites the payload, if payload is a file.
1. *Output Document's Map*: Lets you explicitly specify where to save each output document by adding one entry per output document. Each entry specifies the document and where to save it. An output document can overwrite the payload or saved under the payload folder. It is useful when there are multiple output documents.

1. *Job Log*: Specifies where to save the job log document, which is helpful in troubleshooting failures.

### Convert to PDF/A workflow {#convert-to-pdf-a-workflow}

The Convert to PDF/A workflow step invokes the `toPDFA` Assembler service API. It is used for converting PDF documents to PDF/A compliant documents.

1. Drag the **[!UICONTROL ConvertToPDFA]** workflow step under the Forms Workflow tab in Sidekick.

1. Double-click the added workflow step to edit the component.
1. In the Edit component dialog, configure input documents, conversion options, and output documents, and click **[!UICONTROL OK]**.

#### Input documents {#input-documents-1}

Specify the source of the document to convert to a PDF/A compliant document in one of the following ways.

* *Relative To Payload*: The input document is relative to the payload folder for the workflow item.
* *Use Payload*: The payload for the workflow item is used as the input document.
* *Absolute Path*: The absolute path of the input document in the CRX repository.

#### Conversion options {#conversion-options}

Conversion Options let you specify options that alter the process of PDF/A conversion.

* *Compliance* : Specifies the PDF/A standard to which the output PDF/A must comply.
* *Result Level* : Specifies the log level to be used for PDF/A conversion logs.
* *Signatures* : Specifies how the signatures in input document must be processed during conversion.
* *Color Space* : Specifies the predefined color space to be used for output PDF/A document.
* *Verify* Conversion: Specifies whether the converted PDF/A document should be verified for PDF/A compliance after conversion.
* *Job Log Level* : Specifies the log level to be used for processing logs.

* *Metadata Extension Schema* : Specifies the path to the metadata extension schema to be used for XMP properties in PDF document's metadata.

#### Output documents {#output-documents-1}

The Output Documents tab lets you specify the destination for the output documents

* *PDFA Document*: Specifies the location where the converted PDF/A document is saved. It can either overwrite the payload document or saved under the payload folder.
* *Conversion Log*: Specifies the location where the conversion logs are saved. It can either overwrite the payload document or can be saved under the payload folder.

## Forms {#forms}

The Render PDF Form workflow is a wrapper around `renderPDFForm` Forms service API to create a PDF form using an XDP template and data xml.

### Render PDF Form workflow {#render-pdf-form-workflow}

1. Drag the Render PDF Form workflow step under the Forms Workflow tab in Sidekick.
1. Double-click the added workflow step to edit the component.
1. In the Edit component dialog, configure input documents, output documents, and additional parameters, and click **[!UICONTROL OK]**.

#### Input documents {#input-documents-2}

* *Template File*: Specifies the location of the XDP template. It is a mandatory field.

* *Data Document*: Specifies the location of data xml that needs to be merged with the template.

#### Output documents {#output-documents-2}

* *Output Document*: - Specifies the name of the generated PDF form.

#### Additional Parameters {#additional-parameters}

* *Content Root*: Specifies the path to the folder in the repository where fragments or images used in the input XDP template are stored.
* *Submit Url*: Specifies the default submit URL for generated PDF form.
* *Locale*: Specifies the default locale for the generated PDF form.
* *Acrobat Version*: Specifies the targeted Acrobat version for the generated PDF form.
* *Tagged PDF*: Specifies whether to make the generated PDF accessible.
* *XCI document*: Specifies the path to the XCI file.

## Output {#output}

The Generate Non Interactive PDF Workflow is a wrapper around `generatePDFOutput` Output service API. It is used to generate non-interactive PDF documents from XDP template and data xml.

### Generate Non Interactive PDF Output workflow &nbsp; {#generate-non-interactive-pdf-output-workflow-nbsp}

1. Drag the Generate Non Interactive PDF Output workflow under the Forms Workflow tab in Sidekick.
1. Double-click the added workflow step to edit the component.
1. In the Edit component dialog, configure input documents, output documents, and additional parameters, and click **[!UICONTROL OK]**.

#### Input documents {#input-documents-3}

* *Template File*: Specifies the location of the XDP template. It is a mandatory field.

* *Data Document*: Specifies the location of the data xml that needs to be merged with the template.

#### Output document {#output-document}

*Output Document*: Specifies the name of the generated PDF form.

#### Additional parameters {#additional-parameters-1}

* *Content Root*: Specifies the path to the folder in the repository where fragments or images used in the input XDP template are stored.
* *Locale*: Specifies the default locale for generated PDF form.
* *Acrobat Version*: Specifies the targeted Acrobat version for the generated PDF form.
* Linearized PDF: Specifies whether to optimize the generated PDF for web viewing.
* *Tagged PDF*: Specifies whether to make the generated PDF accessible.
* *XCI document*: Specifies the path to the XCI file.

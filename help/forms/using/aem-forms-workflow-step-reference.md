---
title: Forms-centric workflow on OSGi - Step Reference
seo-title: Forms-centric workflow on OSGi - Step Reference
description: Forms-centric workflow on OSGi steps allow you rapidly build adaptive forms based workflows.
seo-description: Forms-centric workflow on OSGi steps allow you rapidly build adaptive forms based workflows.
uuid: 57c872d6-c6ca-4f78-a98c-f9487f1d673c
contentOwner: aheimoz
discoiquuid: f2bd4d96-55a5-4fbd-bede-1747c2ec63c8
---

# Forms-centric workflow on OSGi - Step Reference {#forms-centric-workflow-on-osgi-step-reference}

## Forms Workflow Steps {#forms-workflow-steps}

Forms workflow steps perform AEM Forms-specific operations in an AEM workflow. These steps allow you rapidly build adaptive forms based Forms-centric workflow on OSGi. These workflows can be used for developing basic review- and approval-workflows, internal- and acros- the-firewall business processes. You can also use Forms Workflow steps to start document services, integrate with Adobe Sign signature workflow, and perform other AEM Forms operations. You require [AEM Forms add-on](https://www.adobe.com/go/learn_aemforms_documentation_63) to use these steps in a workflow.

## Assign task step {#assign-task-step}

The assign task step creates a task and assigns it to a user or group. Along with assigning the task, the component also specifies the adaptive form or non-interactive PDF for the task. The adaptive form is required to accept input from users and non-interactive PDF or a read-only adaptive form is used for review only workflows.

You can also use the component to control the behavior of the task. For example, creating an automatic document of record, assigning the task to a specific user or group, specifying the path of the submitted data, specifying the path of data to be pre-populated, and specifying default actions. The Assign Task step has the following properties:

* **Title:** Title of the task. The title is displayed in AEM Inbox.
* **Description:** Explanation of the operations being performed in the task. This information is useful for other process developers when you are working in a shared development environment.  

* **Thumbnail Path:** Path of the task thumbnail. If no path is specified, for an adaptive form default thumbnail is displayed and for Document of Record, a default icon is displayed.
* **Workflow Stage: **A workflow can have multiple stages. These stages are displayed in the AEM Inbox. You can define these stages in the properties of the model (Sidekick &gt; Page &gt; Page Properties &gt; Stages).
* **Priority: **Selected priority is displayed in the AEM Inbox. The available options are High, Medium, and Low. The default value is Medium.
* **Due Date:** Specify the number of days or hours after which the task is marked overdue. If you select **Off**, then the task is never marked overdue. You can also specify a time-out handler to perform specific tasks after the task is overdue.

* **Days: **The number of days before which the task is to be completed. The number of days are counted after the task is assigned to a user. If a task is not complete and crosses the number of days specifies in the Days field, then, if selected, a timeout handler is triggered after the due date.
* **Hours:** The number of hours before which the task is to be completed. The number of hours are counted after the task is assigned to a user. If a task is not complete and crosses the number of hours specifies in the Hours field, then, if selected, a timeout handler is triggered after the due hours.
* **Time-out after Due Date: **Select this option to enable the Timeout Handler selection field.
* **Timeout Handler: **Select the script to be executed when the assign task step crosses the due date. Scripts placed in the CRX-repository at [apps]/fd/dashboard/scripts/timeoutHandler are available for selection. The specified path does not exist in crx-repository. An administrator creates the path before using it.
* **Highlight the action and comment from the last task in Task Details: **Select this option to display the last action that was taken and comment received on the task details section of a task.
* **Type: **Choose the type of document to be filled when the workflow is started. You can choose an adaptive form, read-only adaptive form, or a non-interactive PDF document.
* **Use Adaptive Form:** Specify the method to locate the input adaptive form. You can use the adaptive form available at an absolute path, submitted as payload to the workflow, or available at a path calculated using a variable. You can use a variable of type String to specify the path.
* **Adaptive Form Path**: Specify the path of the adaptive form. The field is available when you use the an adaptive form or read-only adaptive form option in the Type field in conjunction with absolute path option the Use Adaptive Form field.
* **PDF Path: **Specify the path of a non-interactive PDF document. The field is available when you choose a non-interactive PDF document in the Type field. The path is always relative to the payload. For example, [Payload_Directory]/Workflow/PDF/credit-card.pdf. The path does not exist in crx-repository. An administrator creates the path before using it. You require a Document of Record option enabled or form template based adaptive forms for using the PDF Path option.
* **For completed task, render the adaptive form as**: When a task is marked complete, you can render the adaptive form as a read-only adaptive form or a PDF document. You require a Document of Record option enabled or form template based adaptive forms for rendering the adaptive form as Document of Record.
* **Information to be pre-populated:** The following fields listed below serve as inputs to the task: 

    * **Data File Path:** Path of input data file (.json or .xml). The path is always relative to the payload. For example, the file contains the data submitted for the form through an AEM Inbox application. An example path is [Payload_Directory]/workflow/data.
    * **Attachment Path: **Attachments available at the location are attached to the form associated with the task. The path is always relative to the payload. An example path is [Payload_Directory]/attachments/

* **Submitted information:** The following fields listed below serve as output locations to the task: 

    * **Data File Path:** Path of data file (.json or .xml). The data file contains information submitted through the associated form. The path is always relative to the payload. For example, [Payload_Directory]/Workflow/data, where data is a file.
    * **Attachment Path: **Path to save the form attachments provide in a task.
    * **Document of Record Path: **Path to save a Document of Record file. For example, [Payload_Directory]/DocumentofRecord/credit-card.pdf. The Document of Record is not generated if the path field is left empty. The path is always relative to the payload.

* **Assign options:** Specify the method to assign the task to a user. You can dynamically assign the task to a user or a group using the Participant Chooser script or assign the task to a specific AEM user or group.
* **Participant Chooser:** The option is available when the **Dynamically to a user or group** option is selected in the Assign options field. You can use an ECMAScript or a service to dynamically select a user or a group. For more information, see [Dynamically assign a workflow to the users](https://helpx.adobe.com/experience-manager/kb/HowToAssignAWorkflowDynamicallyToParticipants.html) and [Creating a custom Adobe Experience Manager Dynamic Participant step.](https://helpx.adobe.com/experience-manager/using/dynamic-steps.html)

* **Participants:** The field is available when the **[!UICONTROL com.adobe.granite.workflow.core.process.RandomParticipantChooser]** option is selected in the Participant Chooser field. The field allows you to select users or groups for the RandomParticipantChooser option.

* **Arguments: **The field is available when a script other than the RandomParticipantChoose script is selected in the Participant Chooser field. The field allows you to provide a list of a comma separated arguments for the script selected in the Participant Chooser field.  

* **User or Group:** The task is assigned to selected user or group. The option is available when the **To a specific user or group option** is selected in the Assign options field. The field lists all the users and groups of the workflow-users group.

* **Notify Assignee by Email:** Select this option to send email notifications to the assignee. These notifications are sent when a task is assigned to a user. Before using the option, enable the notifications from AEM Web Console. For step-by-step instructions, see [configure email notifications for the assign task step](/help/forms/using/aem-forms-workflow.md)

* **HTML Email Template**: Select email template for the notification email. To edit a template, modify the file located at /libs/fd/dashboard/templates/email/htmlEmailTemplate.txt in crx-repository.
* **Allow Delegation To:** AEM Inbox provides an option to the logged in user to delegate the assigned workflow to another user. You are allowed to delegate within the same group or to the workflow user of another group. If the task is assigned to a single user and the **allow delegation to members of the assignee group** option is selected, then it is not possible to delegate the task to another user or group.

* **Default Actions:** Out of the box, Submit, Save, and Reset actions are available. All the default actions are enabled, by default. 
* **Route Variable:** Name of the route variable. The route variable captures custom actions that a user selects in AEM Inbox.
* **Routes:** A task can branch to different routes. When selected in AEM Inbox, the route returns a value and the workflow branches based on the selected route.
* **Title**: Specify the title for the route. It is displayed in AEM Inbox.
* **Coral Icon**: Specify HTML attribute of a coral icon. Adobe CorelUI library provides a vast set of touch-first icons. You can choose and use an icon for the route. It is displayed along with the title in AEM Inbox.
* **Allow assignee to add comment**: Select this option to enable comments for the task. An assignee can add the comments from within AEM Inbox at the time of task submission.
* **Allow assignee to add attachment(s) to the task**: Select this option to enable attachments for the task. An assignee can add the attachments from within AEM Inbox at the time of task submission.
* **Output path of task attachments**: Specify the location of attachment folder. The location is relative to the payload.
* **Use custom metadata:** Select this option to enable the custom metadata field. Custom metadata is used in email templates.
* **Custom Metadata: **Select a custom metadata for the email templates. The custom metadata is available in crx-repository at apps/fd/dashboard/scripts/metadataScripts. The specified path does not exist in crx-repository. An administrator creates the path before using it. You can also use a service for the custom metadata. You can also extend the `WorkitemUserMetadataService` interface to provide custom metadata.

* **Show Data from Previous Steps**: Select this option to enable assignees to view previous assignees, action already taken on the task, comments added to the task, and document of record of the completed task, if available. 
* **Show Data from Subsequent Steps: **Select this option to enable the current assignee to view the action taken and comments added to task by subsequent assignees. It also allows the current assignee to view a document of record of the completed task, if available.
* **Visibility of data type:** By default, an assignee can view a Document of Record, assignees, action taken, and comments that previous and subsequent assignees have added. Use the visibility of data type option to limit the type of data visible to the assignees.

## Send Email Step {#send-email-step}

Use the email step to send an email, for example an email with a document of record, link of an adaptive form, link of an interactive communication, or with an attached PDF document. Send Email step supports [HTML email](https://en.wikipedia.org/wiki/HTML_email). HTML emails are responsive and adapt to the recipients' email client and screen size. You can use an HTML email template to define appearance, color-scheme, and behavior of the of the email.

The email step uses Day CQ Mail Service to send emails. Before using the email step, ensure that the [email service](/help/forms/using/aem-forms-workflow.md) is configured. The email step has the following properties:

**Title:** Title of the step helps identify the step in the workflow editor.

**Description: **Explanation is useful for other process developers when you are working in a shared development environment.

**Email Subject:** Subject can be retrieved from a workflow metadata or specified manually. Select the **Literal** option to manually specify a subject or select the **Retrieve from Workflow metadata** option to retrieve the subject from a metadata property.

**HTML Email Template**: HTML template for the email. You can specify variables in an email template. The Email Step extracts and displays all the variables included in a template for inputs.

**Email Template Metadata:** Value of the email template variables can be a user-specified value, the path of an asset on the author or the publish server, image, or a workflow metadata property.

* **Literal:** Use the option when you know the exact value to specify. For example, [example@example.com](mailto:example@example.com).

* **Workflow Metadata:** Use the option when the value to use is saved in a workflow metadata property. After selecting the option, enter the metadata property name in the empty text box below the Workflow Metadata option. For example, emailAddress.
* **Asset URL:** Use the option to embed a web link of an interactive communication to the email. After selecting the option, browse and choose the interactive communication to embed. The asset can reside on the author or the publish server.
* **Image:** Use the option to embed an image to the email. After selecting the option, browse and choose the image. The image option is available only for the image tags (&lt;img src="&ast;"/&gt;) available in the email template.

**Sender’s / Recipient's Email Address:** Select the **Literal** option to manually specify an email address or select the **Retrieve from Workflow metadata** option to retrieve the email address from a metadata property. You can also specify a list of metadata property arrays for the **Retrieve from Workflow metadata** option.

**File Attachment Path:** The asset available at the specified location is attached to the email. The path of the asset can be relative to the payload or absolute path. An example path is [Payload_Directory]/attachments/

**File Name:** Name of the email attachment file. The Email Step changes the original file name of the attachment to the specified file name. The name can be specified manually or retrieved from a workflow metadata property. Use the **Literal** option when you know the exact value to specify. Use the **Retrieve from a Workflow Metadata** option when the value to use is saved in a workflow metadata property.

## Generate Document of Record step {#generate-document-of-record-step}

When a form is filled or submitted, you can keep a record of the form, in print or in document format. This is referred to as a Document of Record (DoR). You can use the Generate Document of record step to create a read-only or interactive PDF version of an adaptive form. The PDF version contains information filled-in to the form along with the layout of the adaptive form.

The Document of Record step has the following properties:

**Use Adaptive Form**: Specify the method to locate the input adaptive form. You can use the adaptive form available at an absolute path, submitted as payload to the workflow, or available at a path calculated using a variable. You can use a variable of type String to specify the path.

**Adaptive Form Path**: Specify the path of the adaptive form. The field is available when you use the an adaptive form or read-only adaptive form option in the Type field in conjunction with absolute path option the Use Adaptive Form field.

**Input Data Path:** Path of the input data for the adaptive form. You can keep the data at a location relative to the payload or specify an absolute path of the data. The input data is merged with the adaptive form to create a document of record.

**Input Attachement Path:** Input Attachment Path: Path of the attachments. These attachments are included in the Document of Record. You can keep the attachments at a location relative to the payload or specify an absolute path of the attachments.

If you specify the path of a folder, for example, attachments, all the files directly available in the folder are attached to Document of Record. If any files are available in the folders directly available in the specified attachment path, the files are included in Document of Record as attachments. If there are any folders in directly available folders, those are skipped.

**Generated Document of Record Path: **Specify the location to keep a document of record file. You can choose to overwrite the payload folder or place document of record at a location within the payload directory.

**Locale**: Specify the language of the document of record.

## Invoke Form Data Model Service step {#invoke-form-data-model-service-step}

You can use [AEM Forms Data Integration](/help/forms/using/data-integration.md) to configure and connect to disparate data sources. These data sources can be a database, web service, REST service, OData service, and CRM solution. AEM Forms Data Integration allows you to create a form data model encompassing various services to perform data retrieval, addition, updating operations on the configured database. You can use the **Invoke Data Model Service step** to select a form data model (FDM) and use the services of the FDM to retrieve, update, or add data to disparate data sources.

To explain inputs for fields of the step, the following database table and JSON file are used as an example :

**Sample CustomerDetails table**

<table> 
 <tbody> 
  <tr> 
   <td>Property</td> 
   <td>Value<br /> </td> 
  </tr> 
  <tr> 
   <td>FirstName<br /> </td> 
   <td>Sarah<br /> </td> 
  </tr> 
  <tr> 
   <td>LastName</td> 
   <td>Rose</td> 
  </tr> 
  <tr> 
   <td>Customer ID</td> 
   <td>1</td> 
  </tr> 
  <tr> 
   <td>Email Address<br /> </td> 
   <td>srose@we.info</td> 
  </tr> 
 </tbody> 
</table>

**Sample JSON file**

```
{ 
  customer: { 
   firstName: "Sarah", 
   lastName:"Rose", 
   customerId: "1", 
   emailAddress:"srose@we.info" 
 }, 
  insurance: {
   customerId: "1", 
  policyType: "Premium,
  policyNumber: "Premium-521499",
  customerDetails: { 
   firstName: "Sarah",
   lastName: "Rose",
   customerId: "1",
   emailAddress: "srose@we.info" 
  }
 }
}

```

The Invoke Form Data Model Service step has the below listed fields to facilitate form data model operations:

* **Title:** Title of the step. It helps identify the step in the workflow editor.
* **Description:** Explanation useful for other process developers when you are working in a shared development environment.  

* **Form Data Model Path**: Browse and select a form data model present on the server.  

* **Service**: List of the services that the selected form data model provides.
* **Input for services &gt; Provide input data using literal, workflow metadata, and a JSON file**: A service can have multiple arguments. Select the option to obtain the value of the service arguments from a workflow metadata property, a JSON object, or directly enter the value in the provided text box:

    * **Literal:** Use the option when you know the exact value to specify. For example, srose@we.info.
    * **Retrieve from Workflow Metadata:** Use the option when the value to use is saved in a workflow metadata property. For example, emailAddress.
    * **JSON Dot Notation:** Use the option when the value to use is in a JSON file. For example, insurance.customerDetails.emailAddress.The JSON Dot Notation option is available only if Map input fields from input JSON option is selected.
    * **Map input fields from input JSON:** Specify path of a JSON file to obtain input value of some service arguments from the JSON file. Path of the JSON file can be relative to the payload or an absolute path.

* **Input for services &gt; Provide input data using a JSON file:** Select the option to obtain values for all the arguments from a JSON file.
* **Input JSON File Path**: Path of the JSON file containing values for all the service arguments. Path of the JSON file can be** relative to the payload** or an** absolute path**.

* **JSON Dot Notation:** Leave the field blank to use all the objects of the specified JSON file as input for service arguments. To read a specific JSON object from the specified JSON file as input for service arguments, specify dot notation for the JSON object, for example, If you have a JSON similar to the one listed at the start of the section, specify insurance.customerDetails to provide all the details of a customer as input to the service.
* **Output of service &gt; Map and write output values to metadata: **Select the option to save the output values as properties of the workflow instance metadata node in crx-repository. Specify the name of the metadata property and select the corresponding service output attribute to be mapped with metadata property, for example, map the phone_number returned by output service with the phone_number property of workflow metadata.
* **Output of service &gt; Save output as JSON: **Select the option to save the output values in a JSON file.
* **Output JSON File Path: **Path to save the save the output JSON file. The path of the output JSON file can be relative to the payload or an absolute path.

## Sign Document step {#sign-document-step}

The Sign Document step enables you to use Adobe Sign to sign documents. The Sign Document step has the following properties:

* **Agreement Name:** Specify the title of the agreement. The agreement name becomes part of the subject and body text of the email sent to the signers.
* **Locale:** Specify the language for the email and verification options.
* **Adobe Sign Cloud Configuration**: Choose an Adobe Sign Cloud Configuration. If you have not configured Adobe Sign for AEM Forms, see [Integrate Adobe Sign with AEM Forms](/help/forms/using/adobe-sign-integration-adaptive-forms.md). 

* **Document to be Signed:** You can choose a document from a location relative to the payload, use payload as the document, or specify an absolute path of the document.
* **Days Until Deadline:** A document is marked due (passed deadline) after there is no activity on the task for the number of days specifies in the **Days Until Deadline** field. The number of days are counted after the documented is assigned to a user for signing.

* **Reminder Email Frequency:** You can send a reminder email at daily or weekly interval. The week is counted from the day the documented is assigned to a user for signing.
* **Signature Process:** You can choose to sign a document in a sequential or a parallel order. In sequential order, one signer receives the document at a time for signing. After the first signer completes signing the document, then the document is sent to the second signer, and so on. In parallel order, multiple signers can sign a document at a time.  

* **Redirection URL:** Specify a redirection URL. After the document is signed, you can redirect the assignee to a URL. Usually, this URL contains a thank you message or further instructions.
* **Workflow Stage:** A workflow can have multiple stages. These stages are displayed in the AEM Inbox. You can define these stages in the properties of the model (Sidekick &gt; Page &gt; Page Properties &gt; Stages).
* **Select Signers:** Specify the method to choose signers for the document. You can dynamically assign the workflow to a user or a group or manually add details of a signer.
* **Script or service to select signers:** The option is available only if the Dynamically option is selected in the Select Signers field. You can specify an ECMAScript or a service to choose signers and verification options for a document.  

* **Signer Details:** The option is available only if the Manually option is selected in the Select Signers field. Specify email address and choose an optional verification mechanism. Before selecting a 2-step verification mechanism, ensure that the corresponding verification option is enabled for the configured Adobe Sign account.
* **Status Variable:** An Adobe Sign enabled document stores signing status of the document in a variable. Specify the name of the status variable (adobeSignStatus). A status variable of an instance is available in CRXDE at /etc/workflow/instances/&lt;server&gt;/&lt;date-time&gt;/&lt;instance of workflow model&gt;/workItems/&lt;node&gt;/metaData contains status of a variable.
* **Signed Document Path:** Specify the location to keep signed documents. You can choose to overwrite the payload file or place the signed document at a location within the payload directory.

## Document Services steps {#document-services-steps}

AEM Document services are a set of services for creating, assembling, and securing PDF Documents. AEM Forms provides a seperate AEM Workflow step for each document service:

### Apply Document Time Stamp step {#apply-document-time-stamp-step}

Add time stamp to a document. You provide document details such as input document path, input document name, location to store exported data. You may choose to overwrite existing payload file or choose a different file name to store data in a different file under payload folder.

### Convert to image step {#convert-to-image-step}

Converts a PDF document to an image file. Supported image formats are JPEG, JPEG2000, PNG, and TIFF. The following information applies to conversions to TIFF images:

* A multi-page TIFF file is generated.
* Some annotations are not included in TIFF images. Annotations that require Acrobat to generate their appearance are not included.

### Convert to PDF/A step {#convert-to-pdf-a-step}

Converts a PDF document to PDF/A format using the options provided. The PDF/A version of Portable Document Format (PDF) is specialized for archiving and long-term preservation of documents.

### Convert to PS step {#convert-to-ps-step}

Convert PDF documents to PostScript. When converting to PostScript, you can use the conversion operation to specify the source document and whether to convert to PostScript level 2 or 3. The PDF document you convert to a PostScript file must be non-interactive.

### Create PDF from specified type step {#create-pdf-from-specified-type-step}

Generate a PDF document from an input file. The input document can be relative to the payload, have an absolute path, or can be payload itself.

### Create PDF from URL/HTML/ZIP step {#create-pdf-from-url-html-zip-step}

Generates a PDF document from supplied URL, HTML, and ZIP file.

### Export Data step {#export-data-step}

Exports data from a PDF forms or XDP file. It requires you to enter the file path of Input Document and the Export Data Format. The options for Export Data Format are Auto, XDP and XmlData.

### Export PDF to specified type step {#export-pdf-to-specified-type-step}

Converts a PDF document to a selected format.

### Generate Non-Interactive PDF step {#generate-non-interactive-pdf-step}

Generate a Non-Interactive PDF. It provides various customization options.

### Import Data step {#import-data-step}

Merges form data into a PDF form. You can import form data into a PDF form.

### Invoke DDX step {#invoke-ddx-step}

Executes the DDX file on the specified map of input documents and returns the manipulated PDF documents.

### Optimize PDF step {#optimize-pdf-step}

Optimizes PDF files by reducing their size. The result of this conversion is PDF files that may be smaller than their original versions. This operation also converts PDF documents to the PDF version specified in the optimization parameters.

Optimization settings specify how files are optimized. Here are example settings:

* Target PDF version
* Discarding objects such as JavaScript actions and embedded page thumbnails
* Discarding user data such as comments and file attachments
* Discarding invalid or unused settings
* Compressing uncompressed data or using more efficient compression algorithms
* Removing embedded fonts
* Setting transparency values

### Render PDF Form step {#render-pdf-form-step}

Renders a form created in Form Designer (XDP) to a PDF form.

### Secure Document step {#secure-document-step}

Encrypt, Sign, and certify a document. AEM Forms supports both password based and certificate base encryption. You can also choose between various algorithms for signing documents. For example, SHA-256 and SH-512. You can also use the workflow step to reader extend PDF documents. The workflow step provides option to enable barcode decoding, digital signatures, import and export of PDF data, and other options.

### Send to Printer step {#send-to-printer-step}

Send a document directly to a printer. It supports the following printing access mechanisms:

* **Direct accessible printer**: A printer that is installed on the same computer is called a direct accessible printer, and the computer is named printer host. This type of printer can be a local printer that is connected to the computer directly.
* **Indirect accessible printer**: The printer that is installed on a print server is accessed from other computers. Technologies such as the common UNIX® printing system (CUPS) and the Line Printer Daemon (LPD) protocol are available to connect to a network printer. To access an indirect accessible printer, specify the print server’s IP or host name. Using this mechanism, you can send a document to an LPD URI when the network has an LPD running. The mechanism lets you route the document to any printer that is connected to the network that has an LPD running.


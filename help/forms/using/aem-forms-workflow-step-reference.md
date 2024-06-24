---
title: Forms-centric workflow on OSGi - Step Reference
description: Forms-centric workflow on OSGi steps let you rapidly build adaptive forms based workflows.
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: publish
docset: aem65
exl-id: 470fcfda-dfde-437c-b539-d5af1e13a7d6
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,Foundation Components
role: User, Developer
---
# Forms-centric workflow on OSGi - Step Reference {#forms-centric-workflow-on-osgi-step-reference}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/create-form-centric-workflows/aem-forms-workflow-step-reference.html)                  |
| AEM 6.5     | This article         |

You use workflow models to convert a business logic to automated repetitive process. A model helps you define and execute a series of steps. You can also define model properties, such as whether the workflow is transient or uses multiple resources. You can [include various AEM Workflow steps in a model to achieve the business logic](/help/sites-developing/workflows-models.md#extending-aem).

## Forms Workflow Steps {#forms-workflow-steps}

Forms Workflow steps perform AEM Forms-specific operations in an AEM workflow. These steps let you rapidly build adaptive forms based Forms-centric workflow on OSGi. These workflows can be used for developing basic review- and approval-workflows, internal- and across- the-firewall business processes. You can also use Forms Workflow steps to start document services, integrate with Adobe Sign signature workflow, and perform other AEM Forms operations. You require [AEM Forms add-on](https://www.adobe.com/go/learn_aemforms_documentation_63) to use these steps in a workflow.

Forms-centric workflow steps perform AEM Forms-specific operations in an AEM Workflow. These steps let you rapidly build Adaptive Forms based Forms-centric workflow on OSGi. These workflows can be used for developing basic review- and approval-workflows, internal and across- the-firewall business processes.

>[!NOTE]
>
>If the workflow model is marked for an external storage, then for all the Forms Workflow steps, you can select only the variable option to store or retrieve data files and attachments.

## Assign task step {#assign-task-step}

The assign task step creates a task and assigns it to a user or group. Along with assigning the task, the component also specifies the adaptive form or non-interactive PDF for the task. The adaptive form is required to accept input from users and non-interactive PDF or a read-only adaptive form is used for review only workflows.

You can also use the component to control the behavior of the task. For example, creating an automatic document of record, assigning the task to a specific user or group, specifying the path of the submitted data, specifying the path of data to be pre-populated, and specifying default actions. The Assign Task step has the following properties:

* **Title:** Title of the task. The title is displayed in AEM Inbox.
* **Description:** Explanation of the operations being performed in the task. This information is useful for other process developers when you are working in a shared development environment.  

* **Thumbnail Path:** Path of the task thumbnail. If no path is specified, for an adaptive form default thumbnail is displayed and for Document of Record, a default icon is displayed.
* **Workflow Stage:** A workflow can have multiple stages. These stages are displayed in the AEM Inbox. You can define these stages in the properties of the model (Sidekick &gt; Page &gt; Page Properties &gt; Stages).
* **Priority:** Selected priority is displayed in the AEM Inbox. The available options are High, Medium, and Low. The default value is Medium.
* **Due Date:** Specify the number of days or hours after which the task is marked overdue. If you select **Off**, then the task is never marked overdue. You can also specify a time-out handler to perform specific tasks after the task is overdue.

* **Days:** The number of days before which the task is to be completed. The number of days are counted after the task is assigned to a user. If a task is not complete and crosses the number of days specifies in the Days field then, if selected, a timeout handler is triggered after the due date.
* **Hours:** The number of hours before which the task is to be completed. The number of hours are counted after the task is assigned to a user. If a task is not complete and crosses the number of hours specifies in the Hours field then, if selected, a timeout handler is triggered after the due hours.
* **Time-out after Due Date:** Select this option to enable the Timeout Handler selection field.
* **Timeout Handler:** Select the script to be executed when the assign task step crosses the due date. Scripts placed in the CRX-repository at [apps]/fd/dashboard/scripts/timeoutHandler are available for selection. The specified path does not exist in crx-repository. An administrator creates the path before using it.
* **Highlight the action and comment from the last task in Task Details:** Select this option to display the last action that was taken and comment received on the task details section of a task.
* **Type:** Choose the type of document to be filled when the workflow is started. You can choose an adaptive form, read-only adaptive form, a non-interactive PDF document, Interactive Communication Agent UI, or Interactive Communication Web Channel Document.
* **Use Adaptive Form:** Specify the method to locate the input adaptive form. This option is available if you select Adaptive form or Read-only adaptive form from the Type drop-down list. You can use the adaptive form submitted to the workflow, available at an absolute path, or available at a path in a variable. You can use a variable of type String to specify the path.  
  You can associate multiple adaptive forms with a workflow. As a result, you can specify an adaptive form on the runtime using the available input methods.

* **Use Interactive Communication:** Specify the method to locate the input interactive communication. You can use the interactive communication submitted to the workflow, available at an absolute path, or available at a path in a variable. You can use a variable of type String to specify the path. This option is available if you select Interactive Communication Agent UI or Interactive Communication Web Channel Document from the Type drop-down list.

>[!NOTE]
>
>You must have cm-agent-users and workflow-users group assignments to access Interactive Communications Agent UI in AEM Inbox.  

* **Adaptive Form or Interactive Communication Path**: Specify the path of the adaptive form or Interactive Communication. You can use the adaptive form or interactive communication that is submitted to the workflow, available at an absolute path, or retrieve the adaptive form from a path stored in a variable of string data type.
* **Select input PDF using:** Specify the path of a non-interactive PDF document. The field is available when you choose a non-interactive PDF document in the Type field. You can select the input PDF using the path that is relative to the payload, saved at an absolute path, or using a variable of Document data type. For example, [Payload_Directory]/Workflow/PDF/credit-card.pdf. The path does not exist in crx-repository. An administrator creates the path before using it. You require a Document of Record option enabled or form template based adaptive forms for using the PDF Path option.
* **For completed task, render the adaptive form as**: When a task is marked complete, you can render the adaptive form as a read-only adaptive form or a PDF document. You require a Document of Record option enabled or form template based adaptive forms for rendering the adaptive form as Document of Record.
* **Pre-populated:** The following fields listed below serve as inputs to the task:

  * **[!UICONTROL Select input data file using]**: Path of input data file (.json, .xml, .doc, or form data model). You can retrieve the input data file using a path that is relative to the payload or retrieve the file stored in a variable of Document, XML, or JSON data type. For example, the file contains the data submitted for the form through an AEM Inbox application. An example path is [Payload_Directory]/workflow/data.
  
  * **Select input attachments using:** Attachments available at the location are attached to the form associated with the task. The path can be relative to the payload or retrieve the attachments stored in a variable of the type ArrayList of Document. An example path is [Payload_Directory]/attachments/. You can specify attachments placed relative to the payload or use a document type (Array list > Document) variable to specify an input attachment for the Adaptive Form.
  
    * **Choose input JSON:** Select an input JSON file using a path that is relative to payload or stored in a variable of Document, JSON, or Form Data Model data type. This option is available if you select Interactive Communication Agent UI or Interactive Communication Web Channel Document from the Type drop-down list.
    * **Choose a custom prefill service:** Select the prefill service to retrieve the data and prefill the Interactive Communication Web channel document or the Agent UI.
    * **Use the prefill service of the interactive communication selected above:** Use this option to use the prefill service of the Interactive Communication defined in the Use Interactive Communication drop-down list.
    * **Request Attribute Mapping:** Use the Request Attribute Mapping section to define the [name and value of the request attribute](../../forms/using/work-with-form-data-model.md#bindargument). Retrieve the details from the data source based on the attribute name and value specified in the request. You can define a request attribute value using a literal value or a variable of String data type.  
      The prefill service and request attribute mapping options are available only if you select Interactive Communication Agent UI or Interactive Communication Web Channel Document from the Type drop-down list.

* **Submitted information:** The following fields listed below serve as output locations to the task:

    * **Save output data file using:** Save the data file (.json,. xml, .doc, or form data model). The data file contains information submitted through the associated form. You can save the output data file using a path that is relative to the payload or store it in a variable of Document, XML, or JSON data type. For example, [Payload_Directory]/Workflow/data, where data is a file.
    * **Save attachments using:** Save the form attachments provide in a task. You can save the attachments using a path that is relative to the payload or store it in a variable of array of Document data type.
    * **Save Document of Record using:** Path to save a Document of Record file. For example, [Payload_Directory]/DocumentofRecord/credit-card.pdf. You can save the Document of Record using a path that is relative to the payload or store it in a variable of Document data type. If you select **Relative to Payload** option, The Document of Record is not generated if the path field is left empty. This option is available only if you select Adaptive form from the Type drop-down list.
    
    * **Save Web Channel data using:** Save the Web Channel data file using a path that is relative to the payload or store it in a variable of Document, JSON, or Form Data Model data type. This option is available only if you select Interactive Communication Agent UI from the Type drop-down list.
    * **Save PDF document using:** Save the PDF document using a path that is relative to the payload or store it in a variable of Document data type. This option is available only if you select Interactive Communication Agent UI from the Type drop-down list.
    * **Save layout template using:** Save the layout template using a path that is relative to the payload or store it in a variable of Document data type. The [layout template](../../forms/using/layout-design-details.md) refers to an XDP file that you create using Forms Designer. This option is available only if you select Interactive Communication Agent UI from the Type drop-down list.

* **Assignee &gt; Assign options:** Specify the method to assign the task to a user. You can dynamically assign the task to a user or a group using the Participant Chooser script or assign the task to a specific AEM user or group.
* **Participant Chooser:** The option is available when the **Dynamically to a user or group** option is selected in the Assign options field. You can use an ECMAScript or a service to dynamically select a user or a group. For more information, see [Dynamically assign a workflow to the users](https://helpx.adobe.com/experience-manager/kb/HowToAssignAWorkflowDynamicallyToParticipants.html) and [Creating a custom Adobe Experience Manager Dynamic Participant step.](https://experienceleague.adobe.com/docs/experience-manager-learn/getting-started-wknd-tutorial-develop/overview.html?lang=en&CID=RedirectAEMCommunityKautuk)

* **Participants:** The field is available when the **[!UICONTROL com.adobe.granite.workflow.core.process.RandomParticipantChooser]** option is selected in the **Participant Chooser** field. The field lets you select users or groups for the RandomParticipantChooser option.

* **Assignee:** The field is available when the **[!UICONTROL com.adobe.fd.workspace.step.service.VariableParticipantChooser]** is selected in the **Participant Chooser** field. The field lets you select a variable of String data type to define the assignee.

* **Arguments:** The field is available when a script other than the RandomParticipantChoose script is selected in the Participant Chooser field. The field lets you provide a list of a comma separated arguments for the script selected in the Participant Chooser field.  

* **User or Group:** The task is assigned to selected user or group. The option is available when the **To a specific user or group option** is selected in the **Assign options** field. The field lists all the users and groups of the workflow-users group.  
  The **User or Group** drop-down menu lists the users and groups that the logged-in user has access to. The username display depends on if you have access permissions on the **users** node in crx-repository for that particular user. 

* **[!UICONTROL Send Notification Email]**: Select this option to send email notifications to the assignee. These notifications are sent when a task is assigned to a user or a group. You can use the **[!UICONTROL Recipient Email Address]** option to specify the mechanism to retrieve the email address.

* **[!UICONTROL Recipient Email Address]**: You can store email address in a variable, use a literal to specify a permanent email address, or use default email address of the assignee specified in the profile of the assignee. You can use the literal or a variable to specify email address of a group. The variable option is helpful in dynamically retrieving and using an email address. The **[!UICONTROL Use default email address of the assignee]** option is only for a single assignee. In this case, email address stored in assignees user profile is used.

* **HTML Email Template**: Select email template for the notification email. To edit a template, modify the file located at /libs/fd/dashboard/templates/email/htmlEmailTemplate.txt in crx-repository.
* **Allow Delegation To:** AEM Inbox provides an option to the logged in user to delegate the assigned workflow to another user. You are allowed to delegate within the same group or to the workflow user of another group. If the task is assigned to a single user and the **allow delegation to members of the assignee group** option is selected, then it is not possible to delegate the task to another user or group.
* **Share Settings:** AEM Inbox provides options to share a single or all the tasks in the inbox with another users:
    * When the **Allow assignee to share explicitly in inbox** option is selected, the user can click the task and share it with another AEM user. 
    * When the **Allow assignee to share via inbox sharing** option is selected and a user shares his Inbox items or allows other users to access his Inbox items, only tasks with aforementioned option enabled are shared with other users.

* **Actions &gt; Default Actions:** Out of the box, Submit, Save, and Reset actions are available. All the default actions are enabled, by default. 
* **Route Variable:** Name of the route variable. The route variable captures custom actions that a user selects in AEM Inbox.
* **Routes:** A task can branch to different routes. When selected in AEM Inbox, the route returns a value and the workflow branches based on the selected route. You can either store routes in a variable of array of String data type or select **Literal** to add routes manually.

* **Title**: Specify the title for the route. It is displayed in AEM Inbox.
* **Coral Icon**: Specify HTML attribute of a coral icon. Adobe CorelUI library provides a vast set of touch-first icons. You can choose and use an icon for the route. It is displayed along with the title in AEM Inbox. If you store the routes in a variable, the routes use a default 'Tags' coral icon.
* **Allow assignee to add comment**: Select this option to enable comments for the task. An assignee can add the comments from within AEM Inbox at the time of task submission.
* **Save comment in variable:** Save the comment in a variable of String data type. This option displays only if you select the **Allow assignee to add comment** checkbox.

* **Allow assignee to add attachment(s) to the task**: Select this option to enable attachments for the task. An assignee can add the attachments from within AEM Inbox at the time of task submission.
* **Save output task attachments using**: Specify the location of attachment folder. You can save output task attachments using a path relative to payload or in a variable of array of document data type. This option displays only if you select the **Allow assignee to add attachment(s) to the task** checkbox and select **Adaptive form**, **Read-only adaptive form**, or **Non-interactive PDF document** from the **Type** drop-down list in the **Form/Document** tab.

>[!NOTE]
>
>Use the Attachments tab in Agent UI during runtime to associate the attachments to an Interactive Communication. The associated attachments display as task attachments in the sidekick after opening the work item in a Complete state.

* **Use custom metadata:** Select this option to enable the custom metadata field. Custom metadata is used in email templates.
* **Custom Metadata:** Select a custom metadata for the email templates. The custom metadata is available in crx-repository at apps/fd/dashboard/scripts/metadataScripts. The specified path does not exist in crx-repository. An administrator creates the path before using it. You can also use a service for the custom metadata. You can also extend the WorkitemUserMetadataService interface to provide custom metadata.
* **Show Data from Previous Steps**: Select this option to enable assignees to view previous assignees, action already taken on the task, comments added to the task, and document of record of the completed task, if available. 
* **Show Data from Subsequent Steps:** Select this option to enable the current assignee to view the action taken and comments added to task by subsequent assignees. It also allows the current assignee to view a document of record of the completed task, if available.
* **Visibility of data type:** By default, an assignee can view a Document of Record, assignees, action taken, and comments that previous and subsequent assignees have added. Use the visibility of data type option to limit the type of data visible to the assignees.

>[!NOTE]
>
>The options to save the Assign Task step as draft and to retrieve the history of the Assign Task step are disabled when you configure an [!DNL Adobe Experience Manager] workflow model for external data storage. Also, in Inbox, the option to save is disabled.

## Send Email Step {#send-email-step}

Use the email step to send an email, for example, an email with a document of record, link of an adaptive form, link of an interactive communication, or with an attached PDF document. Send Email step supports [HTML email](https://en.wikipedia.org/wiki/HTML_email). HTML emails are responsive and adapt to the recipients' email client and screen size. You can use an HTML email template to define appearance, color-scheme, and behavior of the email.

The email step uses Day CQ Mail Service to send emails. Before using the email step, ensure that the [email service](../../forms/using/aem-forms-workflow.md) is configured. The email step has the following properties:

**Title:** Title of the step helps identify the step in the workflow editor.

**Description:** Explanation is useful for other process developers when you are working in a shared development environment.

**Email Subject:** Subject can be retrieved from a workflow metadata, specified manually, or retrieved from the value stored in a variable. Select from the following options:

* **Literal -** Manually specify a subject.
* **Retrieve from Workflow metadata** - Retrieve the subject from a metadata property.
* **Variable** - Retrieve the subject from the value stored in a variable of string data type.

**HTML Email Template**: HTML template for the email. You can specify variables in an email template. The Email Step extracts and displays all the variables included in a template for inputs.

**Email Template Metadata:** Value of the email template variables can be a user-specified value, the path of an asset on the author or the publish server, image, or a workflow metadata property.

* **Literal:** Use the option when you know the exact value to specify. For example, [example@example.com](mailto:example@example.com).

* **Workflow Metadata:** Use the option when the value to use is saved in a workflow metadata property. After selecting the option, enter the metadata property name in the empty text box below the Workflow Metadata option. For example, emailAddress.
* **Asset URL:** Use the option to embed a web link of an interactive communication to the email. After selecting the option, browse and choose the interactive communication to embed. The asset can reside on the author or the publish server.
* **Image:** Use the option to embed an image to the email. After selecting the option, browse and choose the image. The image option is available only for the image tags (&lt;img src="&#42;"/&gt;) available in the email template.

**Sender's / Recipient's Email Address:** Select the **Literal** option to manually specify an email address or select the **Retrieve from Workflow metadata** option to retrieve the email address from a metadata property. You can also specify a list of metadata property arrays for the **Retrieve from Workflow metadata** option. Select the **Variable** option to retrieve the e-mail address from the value stored in a variable of string data type.

**File Attachment:** The asset available at the specified location is attached to the email. The path of the asset can be relative to the payload or absolute path. An example path is [Payload_Directory]/attachments/.

Select the **Variable** option to retrieve the file attachment stored in a variable of Document, XML, or JSON data type.

**File Name:** Name of the email attachment file. The Email Step changes the original file name of the attachment to the specified file name. The name can be specified manually or retrieved from a workflow metadata property or a variable. Use the **Literal** option when you know the exact value to specify. Use the **Variable** option to retrieve the file name from the value stored in a variable of string data type. Use the **Retrieve from a Workflow Metadata** option when the value to use is saved in a workflow metadata property.

## Generate Document of Record step {#generate-document-of-record-step}

When a form is filled or submitted, you can keep a record of the form, in print or in document format. This is referred to as a Document of Record (DoR). You can use the Generate Document of record step to create a read-only or interactive PDF version of an adaptive form. The PDF version contains information filled-in to the form along with the layout of the adaptive form.

The Document of Record step has the following properties:

**Use Adaptive Form**: Specify the method to locate the input adaptive form. You can use the adaptive form submitted to the workflow, available at an absolute path, or available at a path in a variable. You can use a variable of String data type to specify the path in the **Select variable to resolve** field.  
You can associate multiple adaptive forms with a workflow. As a result, you can specify an adaptive form on the runtime using the available input methods.

**Adaptive Form Path**: Specify the path of the adaptive form. The field is available when you select the **Available at an absolute path** option from the **Use Adaptive Form** field.

**Select Input data using:** Path of the input data for the adaptive form. You can keep the data at a location relative to the payload, specify an absolute path of the data, or retrieve data stored in a variable of Document, JSON, or XML data type. The input data is merged with the adaptive form to create a document of record.

**Select Input attachment path using:** Path of the attachments. These attachments are included in the Document of Record. You can keep the attachments at a location relative to the payload, specify an absolute path of the attachments, or retrieve attachments stored in a variable of array of Document data type.

If you specify the path of a folder, for example, attachments, all the files directly available in the folder are attached to Document of Record. If any files are available in the folders directly available in the specified attachment path, the files are included in Document of Record as attachments. If there are any folders in directly available folders, those are skipped.

**Save Generated Document of Record using below options:** Specify the location to keep a document of record file. You can choose to overwrite the payload folder, place document of record at a location within the payload directory, or store the document of record in a variable of Document data type.

**Locale**: Specify the language of the document of record. Select **Literal** to select the locale from a drop-down list or select **Variable** to retrieve the locale from the value stored in a variable of string data type. Define the locale code while storing the value for the locale in a variable. For example, specify **en_US** for English and **fr_FR** for French.

## Invoke Form Data Model Service step {#invoke-form-data-model-service-step}

You can use [AEM Forms Data Integration](../../forms/using/data-integration.md) to configure and connect to disparate data sources. These data sources can be a database, web service, REST service, OData service, and CRM solution. AEM Forms Data Integration lets you create a form data model encompassing various services to perform data retrieval, addition, updating operations on the configured database. You can use the **Invoke Data Model Service step** to select a form data model (FDM) and use the services of the FDM to retrieve, update, or add data to disparate data sources.

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

```json
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
* **Input for services &gt; Provide input data using literal, variable, or workflow metadata, and a JSON file**: A service can have multiple arguments. Select the option to obtain the value of the service arguments from a workflow metadata property, a JSON object, a variable, or directly enter the value in the provided text box:

    * **Literal:** Use the option when you know the exact value to specify. For example, srose@we.info.
    * **Variable:** Use the option to retrieve the value stored in a variable.
    * **Retrieve from Workflow Metadata:** Use the option when the value to use is saved in a workflow metadata property. For example, emailAddress.
    * **[!UICONTROL Relative to Payload]**: Use the option to retrieve the file attachment saved at a path relative to payload. Select the option and specify either the folder name which includes the file attachment or specify the file attachment name in the text box.
  
      For example, if the Relative to Payload folder in the CRX repository includes a file attachment at the `attachment\attachment-folder` location, specify `attachment\attachment-folder` in the text box after selecting the **[!UICONTROL Relative to Payload]** option.
    * **JSON Dot Notation:** Use the option when the value to use is in a JSON file. For example, insurance.customerDetails.emailAddress. The JSON Dot Notation option is available only if Map input fields from input JSON option is selected.
    * **Map input fields from input JSON:** Specify path of a JSON file to obtain input value of some service arguments from the JSON file. Path of the JSON file can be relative to the payload, an absolute path, or you can select an input JSON document using a variable of JSON or Form Data Model type.

* **Input for services &gt; Provide input data using variable or a JSON file:** Select the option to obtain values for all the arguments from a JSON file saved at an absolute path, at a path relative to payload, or in a variable.
* **Select Input JSON document using**: The JSON file containing values for all the service arguments. Path of the JSON file can be **relative to the payload** or an **absolute path.** You can also retrieve the input JSON document using a variable of JSON or Form Data Model data type.

* **JSON Dot Notation:** Leave the field blank to use all the objects of the specified JSON file as input for service arguments. To read a specific JSON object from the specified JSON file as input for service arguments, specify dot notation for the JSON object, for example, If you have a JSON similar to the one listed at the start of the section, specify insurance.customerDetails to provide all the details of a customer as input to the service.
* **Output of service &gt; Map and write output values to variable or metadata:** Select the option to save the output values as properties of the workflow instance metadata node in crx-repository. Specify the name of the metadata property and select the corresponding service output attribute to be mapped with metadata property, for example, map the phone_number returned by output service with the phone_number property of workflow metadata. Similarly, you can store the output in a variable of Long data type. When you select a property for the **[!UICONTROL Service output attribute to be mapped]** option, only variables capable of storing data of the selected property are populated for the **[!UICONTROL Save the output to]** option.

* **Output of service &gt; Save output to variable or a JSON file:** Select the option to save the output values in a JSON file at an absolute path, at a path relative to payload, or in a variable . 
* **Save Output JSON document using below options:** Save the output JSON file. The path of the output JSON file can be relative to the payload or an absolute path. You can also save the output JSON file using a variable of JSON or Form Data Model data type.

## Sign Document step {#sign-document-step}

The Sign Document step enables you to use Adobe Sign to sign documents. The Sign Document step has the following properties:

* **Agreement Name:** Specify the title of the agreement. The agreement name becomes part of the subject and body text of the email sent to the recipients. You can either store the name in a variable of String data type or select **Literal** to add the name manually.

* **Locale:** Specify the language for the email and verification options. You can either store the locale in a variable of String data type or select **Literal** to choose the locale from the list of available options. Define the locale code while storing the value for the locale in a variable. For example, specify **en_US** for English and **fr_FR** for French.

* **Adobe Sign Cloud Configuration**: Choose an Adobe Sign Cloud Configuration. If you have not configured Adobe Sign for AEM Forms, see [Integrate Adobe Sign with AEM Forms](../../forms/using/adobe-sign-integration-adaptive-forms.md). 

* **Select Document to be signed using:** You can choose a document from a location relative to the payload, use payload as the document, specify an absolute path of the document, or retrieve the document stored in a variable of Document data type.


* **Select Input Attachment Path using:** Path of the attachments. These attachments are included in the Signing Document. You can keep the attachments at a location relative to the payload, specify an absolute path of the attachments, or retrieve attachments stored in a variable of array of Document data type.
  
  
  If you specify the path of a folder, for example, attachments, all the files directly available in the folder are attached to Signing Document. If any files are available in the folders directly available in the specified attachment path, the files are included in Signing Document as attachments. If there are any folders in directly available folders, those are skipped.

* **Days Until Deadline:** A document is marked due (passed deadline) after there is no activity on the task for the number of days specifies in the **Days Until Deadline** field. The number of days are counted after the documented is assigned to a user for signing.
* **Reminder Email Frequency:** You can send a reminder email at daily or weekly interval. The week is counted from the day the document is assigned to a user for signing.
* **Signature Process:** You can choose to sign a document in a sequential or a parallel order. In sequential order, one recipient receives the document at a time for signing. After the first recipient completes signing the document, the document is sent to the second recipient, and so on. In parallel order, multiple recipients can sign a document at a time.
* **Redirection URL:** Specify a redirection URL. After the document is signed, you can redirect the assignee to a URL. Usually, this URL contains a thank you message or further instructions.
* **Workflow Stage:** A workflow can have multiple stages. These stages are displayed in the AEM Inbox. You can define these stages in the properties of the model (Sidekick &gt; Page &gt; Page Properties &gt; Stages).
* **Select Recipients:** Specify the method to choose recipient for the document. You can dynamically assign the workflow to a user or a group or manually add details of a recipient. When you select Manually in the dropdown, you add recipient details such as Email, Role, and Authentication method.

    >[!NOTE]
    >
    >* In the Role section, you can specify the recipient role as Signer, Approver, Acceptor, Certified Recipient, Form Filler, and Delegator.
    >* If you select Delegator in the Role option, the Delegator can assign the sign task to another recipients.
    >* If you have configured an authentication method for [!DNL Adobe Sign], based on your configuration you select an authentication method such as Phone based authentication, Social Identity based authentication, Knowledge based authentication, Government Identity based authentication.


* **Script or service to select recipients:** The option is available only if you select Dynamically option in the Select Recipients field. You can specify an ECMAScript or a service to choose recipients and verification options for a document.
* **Recipient Details:** The option is available only if the Manually option is selected in the Select Recipients field. Specify email address and choose an optional verification mechanism. Before selecting a 2-step verification mechanism, ensure that the corresponding verification option is enabled for the configured Adobe Sign account. You can use a variable of String data type to define values for **[!UICONTROL Email]**, **[!UICONTROL Country Code]**, and **[!UICONTROL Phone Number]** fields. The **[!UICONTROL Country Code]** and **[!UICONTROL Phone Number]** fields display only if you select **[!UICONTROL Phone Verification]** from the **[!UICONTROL 2-step verification]** drop-down list.
* **Status Variable:** An Adobe Sign enabled document stores signing status of the document in a variable of String data type. Specify the name of the status variable (adobeSignStatus). A status variable of an instance is available in CRXDE at /etc/workflow/instances/&lt;server&gt;/&lt;date-time&gt;/&lt;instance of workflow model&gt;/workItems/&lt;node&gt;/metaData contains status of a variable.
* **[!UICONTROL Signed Document]**: You can save the status of the Signed Document to Variable. To add electronic signature audit trail for greater security and legality to your Signed Document, you can Include Audit Report. You can save the Signed Document using Variable or Payload folder.
    >[!NOTE]
    >
    > The Audit Report is appended to the last page of the signed document.
<!--
* **Save signed document using below options:** Specify the location to keep signed documents. You can choose to overwrite the payload file, place the signed document at a location within the payload directory, or store the signed document in a variable of Document type.
-->

## Document Services steps {#document-services-steps}

AEM Document services are a set of services for creating, assembling, and securing PDF Documents. AEM Forms provides a separate AEM Workflow step for each document service.

Similar to other AEM Forms Workflow steps, such as Assign Task, Send Email, and Sign Document, you can use variables in all AEM Document services steps. For more information on creating and managing variables, see [Variables in AEM workflows](../../forms/using/variable-in-aem-workflows.md).

### Apply Document Time Stamp step {#apply-document-time-stamp-step}

Add time stamp to a document. You provide document details such as input document path, input document name, location to store exported data. You may choose to overwrite existing payload file, choose a different file name to store data in a different file under payload folder, provide an absolute path to the data, or store data in a variable of Document data type.

### Convert to image step {#convert-to-image-step}

Converts a PDF document to list of images. Supported image formats are JPEG, JPEG2000, PNG, and TIFF. The following information applies to conversions to TIFF images:

* A multi-page TIFF file is generated.
* Some annotations are not included in TIFF images. Annotations that require Acrobat to generate their appearance are not included.

### Convert to PDF/A step {#convert-to-pdf-a-step}

Converts a PDF document to PDF/A format using the options provided. The PDF/A version of Portable Document Format (PDF) is specialized for archiving and long-term preservation of documents.

### Convert to PS step {#convert-to-ps-step}

Convert PDF documents to PostScript. When converting to PostScript, you can use the conversion operation to specify the source document and whether to convert to PostScript level 2 or 3. The PDF document you convert to a PostScript file must be non-interactive.

### Create PDF from specified type step {#create-pdf-from-specified-type-step}

Generate a PDF document from an input file. The input document can be relative to the payload, have an absolute path, can be payload itself, or stored in a variable of Document data type.

### Create PDF from URL/HTML/ZIP step {#create-pdf-from-url-html-zip-step}

Generates a PDF document from supplied URL, HTML, and ZIP file.

### Export Data step {#export-data-step}

Exports data from a PDF forms or XDP file. It requires you to enter the file path of Input Document and the Export Data Format. The options for Export Data Format are Auto, XDP, and XmlData.

### Export PDF to specified type step {#export-pdf-to-specified-type-step}

Converts a PDF document to a selected format.

### Generate Non-Interactive PDF step {#generatenoninteractive}

Generate a Non-Interactive PDF. It provides various customization options.

>[!NOTE]
>
>You can use variables to specify the template file for input documents. Store the path of the template file in a variable of String data type.

### Import Data step {#import-data-step}

Merges form data into a PDF form. You can import form data into a PDF form.

### Invoke DDX step {#invokeddx}

Executes the DDX file on the specified map of input documents and returns the manipulated PDF documents.

>[!NOTE]
>
>You can use variables to specify the DDX file for input documents. Store the DDX file in a variable of Document or XML data type.

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

### Render PDF Form step {#renderpdf}

Renders a form created in Form Designer (XDP) to a PDF form.

>[!NOTE]
>
>You can use variables to specify the template file for input documents. Store the path of the template file in a variable of String data type.

### Secure Document step {#secure-document-step}

Encrypt, Sign, and certify a document. AEM Forms supports both password based and certificate base encryption. You can also choose between various algorithms for signing documents. For example, SHA-256 and SH-512. You can also use the workflow step to reader extend PDF documents. The workflow step provides option to enable barcode decoding, digital signatures, import and export of PDF data, and other options.

### Send to Printer step {#send-to-printer-step}

Send a document directly to a printer. It supports the following printing access mechanisms:

* **Direct accessible printer**: A printer that is installed on the same computer is called a direct accessible printer, and the computer is named printer host. This type of printer can be a local printer that is connected to the computer directly.
* **Indirect accessible printer**: The printer that is installed on a print server is accessed from other computers. Technologies such as the common UNIX&reg; printing system (CUPS) and the Line Printer Daemon (LPD) protocol are available to connect to a network printer. To access an indirect accessible printer, specify the print server's IP or host name. Using this mechanism, you can send a document to an LPD URI when the network has an LPD running. The mechanism lets you route the document to any printer that is connected to the network that has an LPD running.

### Generate Printed Output Step {#generatePrintedOutput}

The step generates a PCL, PostScript, ZPL, IPL, TPCL, or DPL output given a form design and data file. The data file is merged with the form design and formatted for printing. The output generated by this step can be sent directly to a printer or saved as file. It is recommended that you use this step when you want to use form designs or data from an application. If your form designs or form designs are located on the network, local file system, or HTTP location, use the generatePrintedOutput operation.

For example, your application requires that you merge a form design with a data file. The data contains hundreds of records. In addition, it requires the output is sent to a printer that supports ZPL. The form design and your input data are in an application. Use the generatePrintedOutput operation to merge each record with a form design and send the output to a printer that supports ZPL.

The Generate Printed Output step has the following properties:

**Input properties**

* **[!UICONTROL Select template file using]**: Specify the path of the template file. You can select the template file using the path that is relative to the payload, saved at an absolute path, or using a variable of Document data type. For example, [Payload_Directory]/Workflow/data.xml. If the path does not exist in crx-repository, an administrator can create the path before using it. Moreover, you can also accept payload as the input data file.

* **[!UICONTROL Select data document using]**: Specify the path of an input data file. You can select the input data file using the path that is relative to the payload, saved at an absolute path, or using a variable of Document data type. For example, [Payload_Directory]/Workflow/data.xml. If the path does not exist in crx-repository, an administrator can create the path before using it.

* **[!UICONTROL Printer Format]**: A Print Format value that specifies the page description language to use, when an XDC file is not provided, to generate the output stream. If you provide a literal value, select one of these values:

  * **[!UICONTROL Custom PCL]**: Use the option to specify a custom XDC file for PCL.
  * **[!UICONTROL Custom PostScript]**: Use the option to specify a custom XDC file for PostScript.
  * **[!UICONTROL Custom ZPL]**: Use the option to specify a custom XDC file for ZPL.
  * **[!UICONTROL Generic Color PCL (5c)]**: Use a generic color PCL (5c).
  * **[!UICONTROL Generic PostScript Level3]**: Use generic PostScript Level 3.
  * **[!UICONTROL ZPL 300 DPI]**: Use ZPL 300 DPI. The zpl300.xdc is used.
  * **[!UICONTROL ZPL 600 DPI]**: Use ZPL 600 DPI. The zpl600.xdc file is used.
  * **[!UICONTROL Custom IPL]**: Use the option to specify a custom XDC file for IPL.
  * **[!UICONTROL IPL 300 DPI]**: Use IPL 300 DPI. The ipl300.xdc is used.
  * **[!UICONTROL IPL 400 DPI]**: Use IPL 400 DPI. The ipl400.xdc file is used.
  * **[!UICONTROL Custom TPCL]**: Use the option to specify a custom XDC file for TPCL.
  * **[!UICONTROL TPCL 305 DPI]**: Use TPCL 300 DPI. The tpcl305.xdc file is used.
  * **[!UICONTROL PCL 600 DPI]**: Use TPCL 600 DPI. The tpcl600.xdc file is used.
  * **[!UICONTROL Custom DPL]**: Use the option to specify a custom XDC file DPL.
  * **[!UICONTROL DPL300DPI]**: Use DPL 300 DPI. The dpl300.xdc file is used.
  * **[!UICONTROL DPL406DPI]**: Use DPL 400 DPI. The dpl406.xdc is used.
  * **[!UICONTROL DPL600DPI]**: Use DPL 600 DPI. The dpl600.xdc is used.

**Output Properties**

* **[!UICONTROL Save output document using]**: Specify the location to save the output file. You can save the output file at a location  which is relative to the payload, in a variable, or specify an absolute location to save the output file. If the path does not exist in crx-repository, an administrator can create the path before using it.

**Advanced Properties**

* **[!UICONTROL Select Content Root location using]**: Content root is a string value that specifies the URI, absolute reference, or location in the repository to retrieve relative assets used by the form design. For example, if the form design references an image relatively, such as ../myImage.gif, myImage.gif must be located at repository://. The default value is repository://, which points to the root level of the repository.

  When you pick an asset from your application, the Content Root URI path must have the correct structure. For example, if a form is picked from an application named SampleApp, and is placed at SampleApp/1.0/forms/Test.xdp, the Content Root URI must be specified as repository://administrator@password/Applications/SampleApp/1.0/forms/, or repository:/Applications/SampleApp/1.0/forms/ (when authority is null). When the Content Root URI is specified this way, the paths of all referenced assets in the form will be resolved against this URI.

* **[!UICONTROL Select XCI file using]**: XCI files are used to describe fonts and other properties that are used for form design elements. You can keep an XCI file relative to the payload, at an absolute path, or using a variable of Document data type.

* **[!UICONTROL Locale]**: Specifies the language used for generating the PDF document. If you provide a literal value, select a language from the list or select one of these values:
  * **To use server default**:
    (Default) Use the Locale setting configured on the AEM Forms Server. The Locale setting is configured using Administration Console. (See [Designer Help](https://www.adobe.com/go/learn_aemforms_designer_65).)

  * **To use custom value**:
    Type the Locale code in the literal box or select a string variable containing the locale code. For a complete list of supported locale codes, see https://java.sun.com/j2se/1.5.0/docs/guide/intl/locale.doc.html.

* **[!UICONTROL Copies]**: An integer value that specifies the number of copies to generate for the output. The default value is 1.

* **[!UICONTROL Duplex Printing]**:  A Pagination value that specifies whether to use two-sided or single-sided printing. Printers that support PostScript and PCL use this value. If you provide a literal value, select one of these values:
    * **[!UICONTROL Duplex Long Edge]**: Use two-sided printing and print using long-edge pagination. 
    * **[!UICONTROL Duplex Short Edge]**: Use two-sided printing and print using short-edge pagination. 
    * **[!UICONTROL Simplex]**: Use single-sided printing.
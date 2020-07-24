---
title: Configuring the Submit action
seo-title: Configuring the Submit action
description: AEM Forms allows you to configure a submit action to define how an adaptive form is processed after submission. You can use built-in submit actions or write your own from scratch.
seo-description: AEM Forms allows you to configure a submit action to define how an adaptive form is processed after submission. You can use built-in submit actions or write your own from scratch.
uuid: 4368d648-88ea-4f84-a051-46296a1a084e
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: author
discoiquuid: 9d8d7044-ffce-4ab4-9543-a2d2f9da31e3
docset: aem65

---

# Configuring the Submit action{#configuring-the-submit-action}

## Introduction to submit actions {#introduction-to-submit-actions}

A submit action is triggered when a user clicks the Submit button on an adaptive form. You can configure the submit action on adaptive form. Adaptive forms provide a few out of the box submit actions. You can copy and extend the default submit actions to create you own submit action. However, based on your requirements, you can write and register your own submit action to process data in the submitted form. The submit action can use [synchronous or asynchronous submission](../../forms/using/asynchronous-submissions-adaptive-forms.md).

You can configure a submit action in the **Submission** section of the Adaptive Form Container properties, in the sidebar.

![Configure Submit Action](assets/thank-you-setting.png)

Configure Submit Action

The default submit actions available with adaptive forms are:

* Submit to REST endpoint
* Send Email
* Send PDF via Email
* Invoke a Forms Workflow
* Submit using Form Data Model
* Forms Portal Submit Action
* Invoke an AEM Workflow

>[!NOTE]
>
>Send PDF via Email submit action is applicable only to adaptive forms that use XFA template as form model.

>[!NOTE]
>
>Ensure that the [AEM_Installation_Directory]\crx-quickstart\temp\datamanager\ASM folder
>exists. The directory is required to temporarily store attachments. If the directory does not exist, create it.

>[!CAUTION]
>
>If you [prefill](../../forms/using/prepopulate-adaptive-form-fields.md) a form template, form data model, or schema based adaptive form with XML or JSON data complaint to a schema (XML schema, JSON schema, form template, or form data model) that is data does not contain &lt;afData&gt;, &lt;afBoundData&gt;, and &lt;/afUnboundData&gt; tags, then the data of unbounded fields (Unbounded fields are adaptive form fields without [bindref](../../forms/using/prepopulate-adaptive-form-fields.md) property) of the adaptive form is lost.

You can write a custom submit action for adaptive forms to fulfil your use case. For more information, see [Writing custom Submit action for adaptive forms](../../forms/using/custom-submit-action-form.md).

## Submit to REST endpoint {#submit-to-rest-endpoint}

The **Submit to REST endpoint** submit option passes the data filled in the form to a configured confirmation page as part of the HTTP GET request. You can add the name of the fields to request. The format of the request is:

`{fieldName}={request parameter name}`

As shown in the image below, `param1` and `param2` are passed as parameters with values copied from the **textbox** and **numericbox** fields for the next action.

You can also **Enable POST request** and provide a URL to post the request. To submit data to the AEM server hosting the form, use a relative path corresponding to the root path of the AEM server. For example, /content/forms/af/SampleForm.html. To submit data to any other server, use absolute path.

![Configuring Rest Endpoint Submit Action](assets/action-config.png)

Configuring Rest Endpoint Submit Action

>[!NOTE]
>
>To pass the fields as parameters in a REST URL, all the fields must have different element names, even if the fields are placed on different panels.

### Post submitted data to a resource or external rest end point&nbsp; {#post-submitted-data-to-a-resource-or-external-rest-end-point-nbsp}

Use the **Submit to REST Endpoint** action to post the submitted data to a rest URL. The URL can be of an internal (the server on which the form is rendered) or an external server.

To post data to an internal server, provide path of the resource. The data is posted the path of the resource. For example, /content/restEndPoint. For such post requests, the authentication information of the submit request is used.

To post data to an external server, provide a URL. The format of the URL is https://host:port/path_to_rest_end_point. Ensure that you configure the path to handle the POST request anonymously.

![Mapping for field values passed as Thank You Page parameters](assets/post-enabled-actionconfig.png)

In the example above, user entered information in `textbox` is captured using parameter `param1`. Syntax to post data captured using `param1` is:

`String data=request.getParameter("param1");`

Similarly, paramenters that you use for posting XML data and attachments are `dataXml` and `attachments`.

For example, you use these two parameters in your script to parse data to a rest end point. You use the following syntax to store and parse the data:

`String data=request.getParameter("dataXml");`
`String att=request.getParameter("attachments");`

In this example, `data` stores the XML data, and `att` stores attachment data.

## Send Email {#send-email}

The **Send Email** submit action sends an email to one or more recipients on successful submission of the form. The email generated can contain form data in a predefined format.

>[!NOTE]
>
>All the form fields must have different element names, even if they are placed on different panels), for including form data in an email.

## Send PDF via Email {#send-pdf-via-email}

The **Send PDF via Email** submit action sends an email with a PDF containing form data, to one or more recipients on successful submission of the form.

>[!NOTE]
>
>This submit action is available for XFA-based adaptive forms and XSD-based adaption forms that have the Document of Record template.

## Invoke a forms workflow {#invoke-a-forms-workflow}

The **Submit to Forms workflow** submit option sends a data xml and file attachments (if any) to an existing Adobe LiveCycle or AEM Forms on JEE process.

For information about how to configure the Submit to forms workflow submit action, see [Submitting and processing your form data using forms workflows](../../forms/using/submit-form-data-livecycle-process.md).

## Submit using Form Data Model {#submit-using-form-data-model}

The **Submit using Form Data Model** submit action writes submitted adaptive form data for the specified data model object in a form data model to its data source. When configuring the submit action, you can choose a data model object whose submitted data you want to write back to its data source.

In addition, you can submit a form attachment using a form data model and a Document of Record (DoR) to the data source.

For information about form data model, see [AEM Forms Data Integration](../../forms/using/data-integration.md).

## Forms Portal Submit Action {#forms-portal-submit-action}

The **Forms Portal Submit Action** option makes form data available through an AEM Forms portal.

For more information about the Forms Portal and submit action, see [Drafts and submissions component](../../forms/using/draft-submission-component.md).

## Invoke an AEM Workflow {#invoke-an-aem-workflow}

The **Invoke an AEM Workflow** submit action associates an adaptive form with an AEM Workflow. When a form is submitted, the associated workflow starts automatically on the processing node. Moreover, it places data file, attachments, and document of Record, if applicable, at the payload location of the workflow.

Before using the **Invoke an AEM Workflow** submit action, [configure the AEM DS settings](../../forms/using/configuring-the-processing-server-url-.md). For information about creating an AEM Workflow, see [Form-centric workflows on OSGi](../../forms/using/aem-forms-workflow.md).

## Server-Side Revalidation in Adaptive Form {#server-side-revalidation-in-adaptive-form}

Typically, in any online data capture system, developers place someJavaScript validations on client side to enforce a few business rules. But in modern browsers, end users have way to bypass those validations and manually do submissions using various techniques, Such as Web Browser DevTools Console. Such techniques are also valida for adaptive forms. A forms developer can create various validation logics, but technically, end users can bypass those validation logics and submit invalid data to the server. Invalid data would break the business rules that a forms author has enforced.

The server-side revalidation feature provides the ability to also run the validations that an adaptive forms author has provided while designing an adaptive form on the server. It prevents any possible compromise of data submissions and business rules violations represented in terms of form validations.

### What to validate on Server? {#what-to-validate-on-server-br}

All out of the box (OOTB) field validations of an adaptive form thate are rerun at the server are:

* Required
* Validation Picture Clause
* Validation Expression

### Enabling Server-side Validation {#enabling-server-side-validation-br}

Use the **Revalidate on server** under Adaptive Form Container in the sidebar to enable or disable server-side validation for the current form.

![Enabling Server-Side Validation](assets/revalidate-on-server.png)

Enabling Server-Side Validation

If end-user bypass those validations and submit the forms, the server again performs the validation. If the validation fails at server end, then the submit transaction is stopped. The end user is presented with the orignal form again. The captured data and submitted data are presented to the user as an error.

### Supporting Custom functions in Validation Expressions {#supporting-custom-functions-in-validation-expressions-br}

At times, in case of **complex validation rules**, the exact validation script reside in custom functions and author calls these custom functions from field validation expression. To make this custom function library known and available while performing server-side validations, the form author can configure the name of AEM client library under the **Basic** tab of Adaptive Form Container properties as shown below.

![Supporting Custom functions in Validation Expressions](assets/clientlib-cat.png)

Supporting Custom functions in Validation Expressions

Author can configure customJavaScript library per adaptive form. In the library, only keep the reusable functions, which has dependency on jquery and underscore.js third-party libraries.

## Error handling on submit action {#error-handling-on-submit-action}

As a part of AEM security and hardening guidelines, configure custom error pages such as 404.jsp and 500.jsp. These handlers are called, when on submitting a form 404 or 500 errors appear. The handlers are also called when these error codes are triggered on the Publish node.

For more information, see [Customizing Pages shown by the Error Handler](/help/sites-developing/customizing-errorhandler-pages.md).

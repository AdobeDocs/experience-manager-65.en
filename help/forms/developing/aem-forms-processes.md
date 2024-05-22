---
title: Understanding AEM Forms Processes
description: Learn how AEM Forms processes encompass form creation, submission, data handling, validation, integration, workflow automation, and output management.
contentOwner: admin
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: development-tools, coding
role: Developer
exl-id: 434ac316-8a01-43a6-844b-1b792f60fa21
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
---
# Understanding AEM Forms Processes {#understanding-aem-forms-processes} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

A common use case is for a set of AEM Forms services to operate on a single document. You can send a request to the service container by creating a process using Workbench. A process represents a business process that you are automating. For information about creating processes, see [Using Workbench](https://www.adobe.com/go/learn_aemforms_workbench_63).

Once a process is activated, it becomes a service and can be invoked like other services. One difference between a standard service, such as the Encryption service and a service that originated from a process, is that the latter has one operation that performs many actions. In contrast, a standard service has many operations. Each operation typically performs one action, such as applying a policy to a document or encrypting a document.

Processes can be short-lived or long-lived. A short-lived process is an operation that is performed synchronously and on the same execution thread from which it was invoked. Short-lived operations are comparable to the standard behavior found in most programming languages, where a client application calls a method and waits for a return value.

However, there are situations where a process cannot be completed synchronously due to factors such as these:

* A process can span a significant amount of time.
* A process can span organizational boundaries.
* A process needs external input for it to finish. For example, consider a situation where a form is sent to a manager who is out of the office. In this situation, the process is not complete until the manager returns and fills out the form.

  These types of processes are known as long-lived processes. A long-lived process is performed asynchronously, allowing for systems to interact as resources permit and allowing for the tracking and monitoring of the operation. When a long-lived process is invoked, AEM Forms creates an invocation identifier value as part of a record that tracks the long-lived process status. The record is stored in the AEM Forms database. You can purge long-lived process records when they are no longer required.

>[!NOTE]
>
>AEM Forms does not create a record when a short-lived process is invoked.
  
  Using the invocation identifier value, you can track the status of the long-lived process. For example, you can use the process invocation identifier value to perform Process Manager operations such as terminating a running process instance.

**Short-lived process example**

The following illustration is an example of a short-lived process named *MyApplication/EncryptDocument*.

>[!NOTE]
>
>This process is not based on an existing AEM Forms process. To follow along with the code examples that discuss how to invoke this process, create a process named `MyApplication/EncryptDocument` using Workbench. (See [Using Workbench](https://www.adobe.com/go/learn_aemforms_workbench_63).)

When this short-lived process is invoked, it performs the following actions:

1. Obtains the unsecured PDF document that is passed to the process as an input value.
1. Encrypts the PDF document with a password. The name of the input parameter for this process is `inDoc` and the data type is document.
1. Saves the password-encrypted PDF document as a PDF file to the local file system. This process returns the encrypted PDF document as an output value. The name of the output parameter for this process is `outDoc` and the data type is document.

   This process is completed synchronously on the same execution thread from which it was invoked. The name of this short-lived process is `MyApplication/EncryptDocument`and its operation is `invoke`.

   >[!NOTE]
   >
   >Typically a short-lived process consists of more than three actions. You create a process using Workbench. (See [Using Workbench](https://www.adobe.com/go/learn_aemforms_workbench_63).)

   *Programming with AEM forms* describes the following ways in which you can programmatically invoke this short-lived process:

    * [Invoking a short-lived process by passing an unsecure document using AEM Forms Remoting](/help/forms/developing/invoking-aem-forms-using-remoting.md#invoking-a-short-lived-process-by-passing-an-unsecure-document-using-remoting) (Using a Flex application)
    * [Invoking a short-lived process using the Invocation API](/help/forms/developing/invoking-aem-forms-using-java.md#invoking-a-short-lived-process-using-the-invocation-api) (Java&trade; Invocation API)
    * [Invoking AEM Forms using Base64 encoding](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-base64-encoding) (web service example)
    * [Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom) (web service example)
    * [Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref) (web service example)
    * [Invoking AEM Forms using BLOB data over HTTP](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-blob-data-over-http) (web service example)
    * [Invoking AEM Forms using DIME](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-dime) (web service example)
    * [Invoking the MyApplication/EncryptDocument process using REST](/help/forms/developing/invoking-aem-forms-using-rest.md)

**Long-lived process example**

The following illustration is an example of a long-lived process.

This process is invoked when an applicant submits a loan form. The process is not complete until a loan officer approves or rejects the loan request. The name of this long-lived process is *FirstAppSolution/PreLoanProcess* and its operation is `invoke_Async`. This process must be invoked asynchronously. For information about programmatically invoking this long-lived process, see [Invoking Human-Centric Long-Lived Processes](/help/forms/developing/invoking-human-centric-long-lived.md#invoking-human-centric-long-lived-processes).

>[!NOTE]
>
>This process can be created by following the tutorial specified in [Creating Your First AEM Forms Application](https://www.adobe.com/go/learn_aemforms_firstapp_ds_63).

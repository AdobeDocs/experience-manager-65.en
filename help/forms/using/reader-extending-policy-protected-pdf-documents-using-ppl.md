---
title: Reader extending policy-protected PDF documents using Portable Protection Library

description: Reader extensions enable interactive features in Adobe PDF documents through Acrobat Reader. You can use the Portable Protection Library (PPL) to reader extend the DRM protected PDF documents.


contentOwner: khsingh
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: document_services

feature: Document Security
exl-id: fe5d83e8-5e36-4146-a20a-dab2213055e2
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# Reader extending policy-protected PDF documents using Portable Protection Library {#reader-extending-policy-protected-pdf-documents-using-portable-protection-library}

Be familiar with concepts of document security, reader extension, and Java Programming language to reader-extend the document security policy-protected PDF documents.

You can use document security to restrict access of specific PDF documents to only authorized users. You can also determine how a recipient can use a protected document. For example, you can specify whether recipients can print, copy, or edit text of a document security policy-protected document. To learn more about document security, see [about document security](/help/forms/using/admin-help/document-security.md).

You can use reader extensions to enable interactive features in Adobe PDF document through Acrobat Reader. These interactive features that are normally available only through Adobe Acrobat Professional and Standard. To learn about the interactive features that reader extension can enable, see [Adobe Experience Manager Forms DocAssurance service](/help/forms/using/overview-aem-document-services.md)**.**

You can use the portable protection library to apply policies on the document without the need of document traveling over the network. Only security credentials and protection-policy details travel over the network. The actual document never leaves the client and protection-policies are applied locally on the client.

## Reader extending document security policy-protected PDF documents {#reader-extending-document-security-policy-protected-pdf-documents}

The policy-protected documents are encrypted documents. You cannot use standard reader-extension APIs to apply, remove, and retrieve usage rights of a policy-protected PDF documents. Only Reader Extensions service of Portable Protection Library provides APIs to apply, remove, and retrieve usage rights of a document security policy-protected PDF documents.

### Reader Extensions service {#reader-extensions-service}

The reader extension service adds usage rights to a policy-protected PDF document, activating features that are not normaly available when a PDF document is opened using Adobe Acrobat Reader. It also has APIs to remove and retrieve usage rights of a policy-protected document.

The Reader Extensions service fully supports PDF documents based on PDF standard 1.6 and later. Apart from Acrobat Reader, third-party users do not require any additional software or plug-ins to use the policy-protected PDF documents.

You can accomplish the following tasks with the Reader Extensions service:

* Apply usage rights to a policy-protected PDF document.
* Remove usage rights of a policy-protected PDF document.
* Retrieve usage rights applied to a policy-protected PDF document.

### Apply usage rights to a document security policy-protected PDF document {#apply-usage-rights-to-a-document-security-policy-protected-pdf-document}

You can use the `applyUsageRights`Java API to apply usage rights to policy-protected PDF documents. Usage rights pertain to functionality that is available by default in Acrobat but not in Adobe Reader, such as the ability to add comments to a form or to fill in form fields and save the form. PDF documents that have usage rights applied to them are called rights-enabled documents. A user who opens a rights-enabled document in Adobe Reader can perform operations that are enabled for that specific document.

**Syntax:** `InputStream applyUsageRights(InputStream inputFile, File certFile, String credentialPassword, UsageRights usageRights)`

<table>
 <tbody>
  <tr>
   <td><p><strong>Parameter</strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p>inputFile</p> </td>
   <td><p>Specify InputStream that represents the PDF document to which usage rights are to be applied. You can use LiveCycle Rights Management or AEM Forms document security protected documents.</p> </td>
  </tr>
  <tr>
   <td><p>certFile</p> </td>
   <td><p>Specify File object that represents a .jks file. The .jks file is a keystore file. It points to a certificate that grants usage rights.</p> </td>
  </tr>
  <tr>
   <td><p>credentialPassword</p> </td>
   <td><p>Specify password of the keystore. </p> </td>
  </tr>
  <tr>
   <td><p>usageRights</p> </td>
   <td><p>Specifies an object of type <a href="https://help.adobe.com/en_US/livecycle/11.0/ProgramLC/javadoc/com/adobe/livecycle/readerextensions/client/UsageRights.html" target="_blank">UsageRights</a>. The usageRights object represents individual rights that can be applied to a policy-protected PDF document.</p> </td>
  </tr>
 </tbody>
</table>

### Retrieve usage rights applied to a policy-protected PDF document. &nbsp; {#retrieve-usage-rights-applied-to-a-policy-protected-pdf-document-nbsp}

You can use the `getDocumentUsageRights`Java API to retrieve the reader extension usage rights applied to a policy-protected PDF document. By retrieving information about usage rights, you can learn about the features reader extension has enabled for the policy-protected PDF document.

**Syntax:** `public GetUsageRightsResult getDocumentUsageRights(InputStream inDoc)`

<table>
 <tbody>
  <tr>
   <td><p><strong>Parameter</strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p>inDoc</p> </td>
   <td><p>Specify InputStream that represents the PDF document from which usage rights are to be retrieved. You can use LiveCycle Rights Management or AEM Forms document security protected documents.</p> </td>
  </tr>
 </tbody>
</table>

#### Code Sample {#code-sample}

```java
//Create a ServiceClientFactory instance
ServiceClientFactory factory = ServiceClientFactory.createInstance(connectionProps);
//Create a RightsManagementClient object
RightsManagementClient2 rmClient2= new RightsManagementClient2(factory);

String inputFileName = "C:\\Sample\\protected.pdf"; //Input file can be RM protected or unprotected pdf file
File certFile = new File("C:\\Sample\\cert.jks"); //RE certificate file
String password = "password"; //password for RE certificate
UsageRights usageRights = getUsageRights(true,true,false,false,true,true,false,false,false,false,true);

//RE rights to be applied on the file : FormFillIn, FormDataImportExport, SubmitStandalone, OnlineForms, DynamicFormField, DynamicFormPages, BarcodeDecoding, DigitalSignatures, Comments, CommentsOnline, EmbeddedFiles

InputStream inputFileStream = new FileInputStream(inputFileName);
InputStream output = rmClient2.getRightsManagementReaderExtensionService().applyUsageRights(inputFileStream, certFile, credentialPassword, rights);

String outputFileName = "C:\\Sample\\ReAdded.pdf";
//Save the PDF document
File myFile = new File(outputFileName);
FileOutputStream outputStream = new FileOutputStream(myFile);

int read = 0;
byte[] bytes = new byte[1024];

while ((read = output.read(bytes)) != -1) {

    outputStream.write(bytes, 0, read);
}

System.out.println("UsageRights applied successfully to the document. ");
 outputStream.close();
inputFileStream.close();

//Get Usage Rights for the output pdf document
InputStream fileWithRe = new FileInputStream(myFile);

GetUsageRightsResult usageRights = rmClient2.getRightsManagementReaderExtensionService().getDocumentUsageRights(fileWithRe);

UsageRights rights = usageRights.getRights();
String right1 = rights1.toString();
System.out.println("RE rights for the file are :\n"+right1);
 fileWithRe.close();

```

### Remove usage rights of a policy-protected PDF document {#remove-usage-rights-of-a-policy-protected-pdf-document}

You can use the `removeUsageRights`Java API to remove usage rights from a policy-protected document. Removing usage rights from a policy-protected PDF document is necessary to perform other AEM Forms operations on the document. For example, you must digitally sign (or certify) a PDF document before you set usage rights. Therefore, if you want to perform operations on a policy-protected document, you must remove usage rights from the PDF document, perform the other operations, such as digitally signing the document, and then re-apply usage rights to the document.

**Syntax:** `InputStream removeUsageRights(InputStream inputFile)`

<table>
 <tbody>
  <tr>
   <td><p><strong>Parameter</strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p> </p> <p>inputFile</p> </td>
   <td>Specify InputStream that represents the PDF document from which usage<br /> rights are to be removed. You can use LiveCycle Rights Management or AEM Forms document security protected documents.</td>
  </tr>
 </tbody>
</table>

#### Code Sample {#code-sample-1}

```java
//Create a ServiceClientFactory instance
ServiceClientFactory factory = ServiceClientFactory.createInstance(connectionProps);
//Create a RightsManagementClient object
RightsManagementClient2 rmClient2= new RightsManagementClient2(factory);

String inputFileName = "C:\\Sample\\fileWithRe.pdf"; //Input file can be RM protected or unprotected pdf file
InputStream inputFileStream = new FileInputStream(inputFileName);

InputStream fileStream = rmClient2.getRightsManagementReaderExtensionService().removeUsageRights(inputFileStream);

String outputFileName = "C:\\Sample\\ReRemoveded.pdf";
//Save the PDF document
File myFile = new File(outputFileName);
FileOutputStream outputStream = new FileOutputStream(myFile);

int read = 0;
byte[] bytes = new byte[1024];

while ((read = fileStream.read(bytes)) != -1) {

    outputStream.write(bytes, 0, read);
}
System.out.println("RE rights removed successfully from the document.");
outputStream.close();
inputFileStream.close();

```

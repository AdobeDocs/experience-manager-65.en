---
title: Controlling access to policy-protected documents
description: See how you can view, manage and control the access to your policy-protected documents.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/working_with_document_security
products: SG_EXPERIENCEMANAGER/6.5/FORMS
feature: Document Security
exl-id: 0eb6e769-97c1-41ee-8d12-91bece984947
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Controlling access to policy-protected documents {#controlling-access-to-policy-protected-documents}

You can control the way in which recipients use your policy-protected documents no matter how widely you distribute them.

Using the Documents page you can do these tasks:

* Search for and view the details of policy-protected documents. You can see information about the document name, publisher name, policy name, and date the policy was applied. If the policy that protected a document is deleted, you can also see the deleted policy ID under the policy name. Users can view and manage their own policy-protected documents. Administrators can view and manage all policy-protected documents.
* Change the details of the policy that is applied to a document. Users can edit their own policies, administrators can edit shared and personal policies, and policy set coordinators can edit shared policies in the policy sets they have permissions for. You can access the policy that is associated with a document directly from the Document Detail page.
* Revoke and reinstate access to a policy-protected document. Administrators can revoke and reinstate access to any document. Policy set coordinators (who have permission to manage documents) can revoke and reinstate access to policy-protected documents that use shared policies from their policy sets. Users can revoke access to their policy-protected documents if they created the policy that is protecting the document or if the policy is a shared one that permits this capability.
* Switch the policy that is applied to a document. Users who apply policies to documents can switch a policy if they created it or if it is a shared policy that enables this capability. Policy set coordinators can switch policies from their policy sets. Administrators can switch policies that are applied to any document.

When a document is protected by a policy and you revoke access privileges or switch the applied policy, the changes take effect as follows:

* If the document is online, changes are applied immediately unless the user has the document open. In this case, the user must close the document for the changes to take effect.
* If a recipient is using the document offline (for example, on a laptop), the changes take effect the next time the recipient synchronizes with document security by opening any policy-protected document.

## View information about a document {#view-information-about-a-document}

For each document that is listed on the Documents page, you can see the document name, publisher name, policy name, and date the document was protected. If the policy that protected a document has been deleted, the policy ID is listed under Policy Name.

You can also view more details, which are described below, about a particular document on the Document Detail page:

>[!NOTE]
>
>Use the Policy Name link on the Document Detail page to access policies that are auto-generated in Microsoft Outlook for recipients of a document that is attached to an email message. These policies do not appear on the policies page.

**Document Name:** The name of the selected document.

**Document ID:** A unique identifier that document security assigns when a policy is applied to the document. document security uses this number to track the document.

**Document Status:** Status of the document (for example, active or revoked.)

**Publisher:** Name of the user who attached the policy to the document.

**Policy Name:** The name of the policy that is used to protect the document. You can click the name to open the policy. Use this link to access policies that Acrobat generates for recipients of a document that is attached to an email message in Outlook. Those policies do not appear on the Policies page.

**Policy Type:** The type of policy that was applied to the document.

**Date Published:** The date the policy was applied to the document.

**Related Iterations:** If the document has related iterations, this item also appears in the list. Click the link to view the list of related iterations for the document.

Users can view information about their protected documents. Administrators can view information about documents that any user has protected with a policy. Policy set coordinators can view information about documents that are protected by policies from their policy sets.

1. On the document security page, click Documents.
1. In the list of documents, click the appropriate document. The Document Detail page opens, displaying detailed information about the document. This page also provides options for revoking document access, switching the policy, and viewing events that are related to this document.

## View related iterations for a document {#view-related-iterations-for-a-document}

If tracking related iterations is enabled, you can track versions of a document that various users have saved. This feature is supported only by certain applications, such as PTC Pro/ENGINEER Wildfire.

This feature is useful when multiple users are collaborating and are saving different versions of the same document. document security can keep track of the various iterations; therefore, you can easily view document information for the different versions.

If this feature is enabled, you can view the related iterations of a document from the Documents page.

1. View the Document Detail page for a document. (See [View information about a document](controlling-access-policy-protected-documents.md#view-information-about-a-document).)
1. Click View Related Iterations. The option is available only if the feature is enabled. The list of related iterations appears. For each iteration, you can view the following information:

    * **Iteration:** The filename. It may be different from the original filename and it has a version number appended to the end of it.
    * **Publisher:** The publisher of the original document.
    * **Created By:** The user who saved the iteration.
    * **Date Created:** The date and time that the Iteration was saved.
    * **Policy:** The policy that protects the iteration. Different iterations may be protected by different policies.

1. To display the Document Detail page for that iteration, click the filename of an iteration.

## Revoking and reinstating access to documents {#revoking-and-reinstating-access-to-documents}

You can revoke and reinstate access to policy-protected documents:

**Users:** Can revoke or reinstate access to documents that they protect with their own personal policies or with shared policies for which the revoke capability is enabled for the user who applies the policy. Users who cannot revoke access to a document or switch a policy need to contact the administrator.

**Administrators:** Can revoke or reinstate access privileges to any policy-protected document, including those protected by personal or shared policies. If an administrator revokes access to a document that is protected with a shared policy, only an administrator can reinstate access privileges for that document.

**Policy set coordinators:** Can revoke or reinstate access privileges for documents that policies from their policy sets protect.

When you revoke or reinstate document access privileges, the change takes effect at these times:

* If the document is online and closed, the change takes effect the next time the recipient synchronizes with document security by opening a policy-protected document.
* If the document is online and open, the change takes effect when the recipient closes the document.
* If the document is offline&mdash;that is, in use without an Internet connection, such as on a laptop&mdash;the change takes effect the next time the recipient synchronizes with document security.

**Revoke access to a policy-protected document**

1. On the document security page, click Documents.
1. Select the check box beside the appropriate document and click Revoke. You can revoke access to multiple documents at a time.
1. Select a message to display to users who attempt to open the document after it is revoked:

    * **General Message:** Indicates that the author revoked the document
    * **Document Terminated:** Indicates that the author terminated the document
    * **Document Revised**: Indicates that the author revised the document

1. (Optional) If a newer version of the document is available, enter the URL and click Test to verify the URL.
1. Click OK, and then click OK again to return to the Documents page.

**Reinstate document access privileges**

1. On the document security page, click Documents.
1. In the list of documents, click the appropriate document.
1. Click Unrevoke and then click OK.

## Switch a policy that is applied to a document {#switch-a-policy-that-is-applied-to-a-document}

Users, policy set coordinators, and administrators can switch the policy that is applied to a policy-protected document (you can apply only one policy at a time to a document). Users can switch policies that are applied to their own policy-protected documents if they created the policy or if the policy is a shared one that has this capability enabled. Otherwise, the administrator or policy set coordinator must switch the policy. Administrators can switch policies for any user's policy-protected documents. Policy set coordinators can switch policies from their policy sets.

When you switch a policy, the new policy is enforced as follows:

* If the document is online and closed, the change takes effect the next time the recipient synchronizes with document security by opening any policy-protected document online.
* If document is online and open, the change takes effect when the user closes the document.
* If the document is offline (in use without an active Internet or network connection, such as on a laptop), the change is applied the next time the user synchronizes with document security by opening a policy-protected document online.

>[!NOTE]
>
>To permit anonymous access to a policy-protected document that currently does not have this access, remove the existing policy in the client application and then apply a policy that permits anonymous access. If you switch the policy, users still must log in to access the document.

1. On the document security page, click Documents.
1. In the list of documents, click the appropriate document.
1. Click Switch Policy. A list of up to 100 policies appears.
1. If the policy you want is not displayed, select Policy Name or Policy ID from the Find list, type the name or ID, and click Find.
1. Click a new policy in the list.
1. Click Switch Policy, and then click OK to return to the Documents page.

## Search for a document {#search-for-a-document}

You can search for documents on the Documents page by using a combination of date range criteria and the search criteria that are available in the list. These criteria include the document name, policy name, or all documents.

Some additional search options are only available to administrators:

**Document ID:** Unique ID number that document security assigns to the document when the policy is applied.

**Document name:** Name of the document.

**Publisher name:** Name of the user who attached the policy to the document. You can select the user from all domains or a specified domain.

**Policy ID:** ID number of the policy that is attached to the document.

**Policy name:** Name of the policy that is attached to the document.

**All documents:** All documents protected by administrators and users. Using the All Documents option to search may return a long list of documents.

1. On the document security page, click Documents.
1. In the Find list, select the required search criteria.

   You can specify the criteria as document ID, document name, publisher name, policy ID, policy name, or all documents.

   If you specify publisher name, click the Address Book icon and specify the domain where you want to search the user, and click OK to return to the Documents search page.

1. (Optional) In the Date list, select a date range option. If you select Custom Dates, type the date in format yyyy/mm/dd in the boxes that appear or use the Date Picker to specify the date range:

    * Click the calendar to open the Date Picker.
    * Use the arrows to find a year and month.
    * Click a day of the month on the calendar.
    * Click OK to close the Date Picker.

1. Click Find.

## Sort the document list {#sort-the-document-list}

You can sort the list of documents by column heading. Triangle icons next to the column heading indicate which column is currently used to sort. An upward-pointing triangle indicates ascending order, while a downward-pointing triangle indicates descending order.

1. On the document security page, click Documents.
1. Click the appropriate column heading.
1. To change the sort order, click the column again.

## Add cover page to policy protected documents {#add-cover-page-to-policy-protected-documents}

If there are most non-Adobe PDF viewers, if you open a document security protected document either the first page is displayed as a blank page or the application aborts without opening the document.

You can use the Page 0 (Wrapper Document) support to allow non-Adobe PDF viewers to open a protected document and display a cover page in the document.

>[!NOTE]
>
>When viewing such documents (containing a Page 0) in Adobe Reader/Acrobat or Mobile Reader, the protected document is opened by default.

**To add cover page to a policy protected document**

Use the following processes in workbench:

**Protect&#xA;Document With Cover Page:** Secures a PDF document with the specified policy, and adds a cover page to the document

**Extract Protected Document:** Extracts the policy-protected PDF document from the PDF document with cover page

Use the following document security APIs:

**protectDocumentWithCoverPage:** Secures a given PDF with the specified policy, and returns a document with a cover page and the protected document as an attachment
`//Create a ServiceClientFactory instance ServiceClientFactory factory = ServiceClientFactory.createInstance(connectionProps); //Create a RightsManagementClient object RightsManagementClient rightsClient = new RightsManagementClient(factory); //Reference a PDF document to which a policy is applied FileInputStream fileInputStream = new FileInputStream("C:\\testFile.pdf"); Document inPDF = new Document(fileInputStream); //Reference a Cover Page document FileInputStream coverPageInputStream = new FileInputStream("C:\\CoverPage.pdf"); Document inCoverDoc = new Document(coverPageInputStream); //Create a Document Manager object DocumentManager documentManager = rightsClient.getDocumentManager(); //Apply a policy to the PDF document RMSecureDocumentResult rmSecureDocument = documentManager.protectDocumentWithCoverPage( inPDF, "ProtectedPDF.pdf", "PolicySetName", "PolicyName", null, null, inCoverDoc, true); //Retrieve the policy-protected PDF document Document protectPDF = rmSecureDocument.getProtectedDoc(); //Save the policy-protected PDF document File myFile = new File("C:\\PolicyProtectedDoc.pdf"); protectPDF.copyToFile(myFile);` **extractProtectedDocument:** Extracts the protected document which is an attachment in the document with cover page. The document with the cover page can be created using protectDocumentWithCoverPage method
`//Create a ServiceClientFactory instance ServiceClientFactory factory = ServiceClientFactory.createInstance(connectionProps); //Create a RightsManagementClient object RightsManagementClient rightsClient = new RightsManagementClient(factory); //Reference a protected PDF document with a Cover Page FileInputStream fileInputStream = new FileInputStream("C:\\policyProtectedDocWithCoverPage.pdf"); Document inPDF = new Document(fileInputStream); //Create a Document Manager object DocumentManager documentManager = rightsClient.getDocumentManager(); //Apply a policy to the PDF document Document extractedDoc = documentManager.extractProtectedDocument(inPDF); //Save the policy-protected PDF document File myFile = new File("C:\\PolicyProtectedDoc.pdf"); extractedDoc.copyToFile(myFile);`

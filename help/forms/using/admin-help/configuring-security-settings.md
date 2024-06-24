---
title: Configuring security settings
description: Learn how to configure security settings. You can protect PDF documents by limiting the access. You can encrypt, certify or password-protect the document. 

contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/working_with_pdf_generator
products: SG_EXPERIENCEMANAGER/6.5/FORMS

feature: "PDF Generator,Document Security"
exl-id: be076477-2681-4570-953d-6c44d3c30843
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Configuring security settings{#configuring-security-settings}

You can limit access to PDF documents by setting passwords and by restricting certain features, such as printing and editing. When a PDF document has restricted features, tools and menu items that are related to those features are dimmed. You can also use other methods to create secure documents, such as encrypting or certifying a document. A security setting contains the password and specific options to use for certain PDF conversions.

On the Security Settings page, you can do the following tasks:

## Create or edit a security setting {#create-or-edit-a-security-setting}

A *security setting* controls the security and permissions for files that are converted with that security setting.

1. In administration console, click Services &gt; PDF Generator &gt; Security Settings.
1. Click New or click the name of a security setting.
1. On the New/Edit Security Setting page, complete the required information for the security setting. (See [Configuring file type settings](/help/forms/using/admin-help/configuring-file-type-settings.md#configuring-file-type-settings).)
1. Click Save and, in the dialog box that appears, type a name for the setting and then click OK.

### Security settings {#security-settings}

These settings configure the compatibility and encryption. For instructions about accessing the fonts settings, see [Create or edit a security setting](configuring-security-settings.md#create-or-edit-a-security-setting).

**Compatibility:** Sets the type of encryption for opening a password-protected document. The Acrobat 3.0 And Later option uses a low encryption level, but the other options use a high encryption level:

**Acrobat 3.0 And Later:** Uses low encryption (40-bit RC4).

**Acrobat 5.0 And Later:** Uses high encryption (128-bit RC4).

**Acrobat 6.0 And Later:** Uses high encryption (128-bit RC4). This option lets you enable metadata for searching.

**Acrobat 7.0 And Later:** Uses high encryption (128-bit AES). This option lets you enable metadata for searching and encrypt only file attachments.

**Acrobat 9.0 And Later:** Uses high encryption (256-bit AES). This option lets you enable metadata for searching and encrypt only file attachments.

An earlier version of Acrobat cannot open a PDF document that has a higher compatibility setting. For example, if you select the Acrobat 7.0 And Later option, you cannot open the document in Acrobat 6.0 or earlier.

Ensure that the compatibility level is consistent with the PDF compatibility level for the same source. For example, if you have a watched folder configured to use the Standard PDF setting, which is compatible with Acrobat 5.0 or later, your security compatibility level must not be higher than Acrobat 5.0.

**Document Restriction:** The document restrictions that are available depend on the Compatibility option you selected.

**No Encryption:** Does not encrypt any part of the document.

**Encrypt All Document Contents:** Encrypts the document and the document metadata. When this option is selected, search engines cannot access the document metadata.

**Encrypt All Document Contents Except Metadata (Acrobat&#xA;6 And Later Compatible):** Encrypts the contents of a document but still allows search engines to access the document metadata. This option is available only when the Compatibility option is set to Acrobat 6.0 or later, Acrobat 7.0 or later, or Acrobat 9.0 or later.

**Encrypt Only File Attachments (Acrobat 7 And Later&#xA;Compatible):** Users can open the document without a password but must enter a password to open file attachments. This option is available only when the Compatibility option is set to Acrobat 7.0 or later or to Acrobat 9.0 or later.

These settings configure the password security:

>[!NOTE]
>
>If you forget a password, it cannot be recovered from the document. It is recommended that you store passwords in another secure location in case you forget them. Also, keep a backup copy of the document that is not password-protected.

**Require A Password To Open The Document:** Enables the password options.

**Document Open Password:** Prevents users from opening the document unless they type the password you specify. Passwords are case sensitive. Acrobat uses the RC4 method of security from RSA Security Inc. to password-protect PDF documents. If you are restricting printing and editing, it is recommended that you add a document open password to enhance security.

**Retype Document Open Password:** Ensures that the document open password is correct.

**Require A Password To Open File Attachments:** Enables the password options. This option is available only when the Compatibility option is set to Acrobat 7.0 or later or to Acrobat 9.0 or later, and the Document restriction option is set to Encrypt Only File Attachments.

**File Attachment Open Password:** Ensures that a password is required to open a file attachment. Users can open the document without a password. This option is available only when the Compatibility option is set to Acrobat 7.0 or later or to Acrobat 9.0 or later, and the Document restriction option is set to Encrypt Only File Attachments.

**Retype File Attachment:** Ensures that the password is correct. This option is available only when the Compatibility option is set to Acrobat 7.0 or later or to Acrobat 9.0 or later, and the Document restriction option is set to Encrypt Only File Attachments.

These options configure the permissions:

**Use A Password To Restrict Printing And Editing Of&#xA;The Document And Its Security Settings:** Enables restrictions on permissions.

**Permissions Password:** Restricts users from printing and editing. Users cannot change these security settings unless they type the password you specify. You cannot use the same password that is used for Document Open Password. When you set a permissions password, only those people who type that password can change security settings. If the PDF document has both types of passwords, either password opens it. However, a user can only set or change the restricted features with the permissions password. If the PDF document has only the permission password or if a user opens the document by using the document open password, the password prompt appears when the user tries to change security settings.

**Retype Permissions Password:** Ensures that the permissions password is correct.

**Printing Allowed:** Specifies the quality of printing for the PDF document:

**None:** Prevents users from printing the document.

**Low Resolution (150 dpi):** Lets users print the document at no higher than 150-dpi resolution. Printing may be slower because each page is printed as a bitmap image. This option is available only if a high encryption level (Acrobat 5.0, 6.0, 7.0, or 9.0) is selected.

**High Resolution:** Lets users print at any resolution, directing high-quality vector output to PostScript and other printers that support advanced high-quality printing features.

**Changes Allowed:** Defines which editing actions are allowed in the PDF document:

**None:** Prevents users from changing the document, including filling signature and form fields.

**Inserting, Deleting, And Rotating Pages:** Lets users insert, delete, and rotate pages, and create bookmarks and thumbnail pages. This option is available only if a high encryption level (Acrobat 5.0, 6.0, 7.0, or 9.0) is selected.

**Filling In Form Fields And Signing Existing Signature&#xA;Fields:** Lets users fill forms and add digital signatures. However, users cannot add comments or create form fields. This option is available only if a high encryption level (Acrobat 5.0, 6.0, 7.0, or 9.0) is selected.

**Commenting, Filling In Form Fields, And Signing Existing&#xA;Signature Fields:** Lets users fill forms and add digital signatures and comments.

**Page Layout, Touch-up, Filling In Form Fields And Signing&#xA;Existing Signature Fields:** Lets users insert, rotate, or delete pages and create bookmarks or thumbnail images, fill out forms, and add digital signatures. This option does not allow users to create form fields. This option is available only if a low encryption level (Acrobat 3.0) is selected.

**Any Except Extracting Pages:** Lets users change the document by using any method in the Changes Allowed list, except remove pages.

**Enable Copying Of Text, Images, And Other Content:** Lets users select and copy the contents of the PDF document. It also lets utilities that need access to the contents of a PDF file, such as Acrobat Catalog, access those contents. This option is available only if a high encryption level is selected.

**Enable Text Access Of Screen Reader Devices For The&#xA;Visually Impaired:** Lets users with vision impairment read the document by using screen readers. However, users cannot copy or extract the document contents. This option is available only if a high encryption level is selected.

## Delete a security setting {#delete-a-security-setting}

You can delete a security setting if it is no longer required. However, preconfigured security settings cannot be deleted.

1. In administration console, click **[!UICONTROL Services > PDF Generator > Security Settings]**.
1. Select the check box beside the setting to delete. You can select multiple settings.
1. Click **[!UICONTROL Delete]** and on the **[!UICONTROL Delete Confirmation]** page, click **[!UICONTROL Delete]** again.

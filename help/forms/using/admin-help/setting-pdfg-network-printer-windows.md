---
title: Setting up a PDFG Network Printer (Windows only)
description: Learn how to set up a PDFG Network Printer ( Windows only )
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/working_with_pdf_generator
products: SG_EXPERIENCEMANAGER/6.5/FORMS
feature: PDF Generator
exl-id: c3fc159e-2677-4b71-b0b2-2feaf69e1a32
solution: Experience Manager, Experience Manager Forms
role: "User, Developer"
---
# Setting up a PDFG Network Printer (Windows only) {#setting-up-a-pdfg-network-printer-windows-only}

PDFG Network Printer allows users to generate a PDF document from any application that supports printing. After a user installs the PDFG Network Printer, a new printer named *PDF generator* appears in the Printers section of the Windows Control Panel. If a printer with the same name already exists, the user is prompted to provide another name.

Printing to this printer from any application sends the document (in PostScript format) to PDF Generator, which converts the PostScript file to PDF. Depending on how you configured PDF Generator, it sends the PDF document to the user as an attachment to an email message, forwards the PDF document to a specified AEM forms service or process, or performs both actions.

The following steps are required to set up a PDFG Network Printer:

1. Configure email settings. (See [Configure email settings for PDFG Network Printer](setting-pdfg-network-printer-windows.md#configure-email-settings-for-pdfg-network-printer).)
1. In administration console, configure the PDFG Network Printer settings. (See [Configure the PDFG Network Printer settings](setting-pdfg-network-printer-windows.md#configure-the-pdfg-network-printer-settings).)
1. Ensure that your users are configured with a valid email address in the AEM forms database and assign the PDFGUserPermission to each user. <!-- Fix broken link See Setting up and organizing users -->
1. Ensure that 32-bit JRE6 is installed on your users' computers.
1. Install the printer on your users' computers. (See [Install PDFG Network Printer on a user's computer](setting-pdfg-network-printer-windows.md#install-pdfg-network-printer-on-a-user-s-computer).)

## Configure email settings for PDFG Network Printer {#configure-email-settings-for-pdfg-network-printer}

1. In administration console, click Services &gt; Applications and Services &gt; Service Management.
1. On the Service Management page, click provider.email_sendmail_service, specify the SMTP settings, and click Save.

## Configure the PDFG Network Printer settings {#configure-the-pdfg-network-printer-settings}

1. In administration console, click Services &gt; PDF Generator &gt; PDFG Network Printer
1. In the Adobe PDF Settings and the Security Settings lists, select the options to apply to the generated PDF. For details on these settings, see [Configuring Adobe PDF settings](/help/forms/using/admin-help/configuring-pdf-settings.md#configuring-adobe-pdf-settings) and [Configuring security settings](/help/forms/using/admin-help/configuring-security-settings.md#configuring-security-settings).
1. To send the converted PDFs back to users, select the Email The Converted PDF File Back To The User option and specify the following information:

    * The email address to use to send PDFs to the users
    * The subject of the email message
    * The header, body, and footer of the email message. In the email message, &lt;receiverName&gt; is replaced with the full name of the user who printed the document.

1. To send the converted PDFs to an AEM forms service or process, select the Forward The Converted PDF To The Specified AEM forms Service Or Process option and specify the following information:

    * The name of the service to invoke
    * The name of the operation of the service to invoke
    * The name of the input parameter, as specified in the component.xml file of the service or process. The PDF document is used as a value for that input parameter.

1. Click Save.

If you want to revert to the original default email text, click Restore E-Mail Contents.

## Install PDFG Network Printer on a user's computer {#install-pdfg-network-printer-on-a-user-s-computer}

Users who have either the PDFG Administrator or PDFG User role can install a PDFG Network Printer. You must have a 32-bit JDK installed on the computer.

1. (PDFG Administrators) In administration console, click Services &gt; PDF Generator &gt; PDFG Network Printer.

   (PDFG Users) Go to `http(s)://[host]:'port'/pdfgui` and click the link under PDFG Network Printer Installation.

1. Under PDFG Network Printer Installation, click the link. When prompted for user account information, specify the user name and password that you used in step 1 to log in. A message appears, stating that the printer has been successfully installed.

   ***note**: If the user' password changes, then users must reinstall the PDFG Network Printer on their computers. You cannot update the password from administration console.*

1. Click OK.

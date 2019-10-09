---
title: Recognizing valid and expired certificates in PDF documents
seo-title: Recognizing valid and expired certificates in PDF documents
description: Learn how to recognize valid and expired certificates in PDF documents.
seo-description: Learn how to recognize valid and expired certificates in PDF documents.
uuid: ceeff57a-586f-4f7b-852f-2a637f003d7e
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_acrobat_reader_dc_extensions
products: SG_EXPERIENCEMANAGER/6.4/FORMS
discoiquuid: 4559218a-65ba-4577-ad26-7721e28971bc
---

# Recognizing valid and expired certificates in PDF documents {#recognizing-valid-and-expired-certificates-in-pdf-documents}

When a PDF document that has usage rights applied by Reader Extensions is opened in Adobe Reader, a status bar appears that describes the specific usage rights enabled in the PDF document.

When the digital certificate that specifies the usage rights for a PDF document expires and the PDF document is opened in Adobe Reader, a dialog box appears advising the user that the PDF document has usage rights, but these rights are disabled. Although the message indicates that the PDF document was altered or tampered with, this is not necessarily the case. Adobe Reader displays this message when a certificate expires or a document is modified. In Adobe Reader 7.0.x or later, you cannot determine which case is currently the issue.

After you close the dialog box, Adobe Reader opens the PDF document. The usage rights that were applied using Acrobat Reader DC extensions are not available, as expected. If the PDF document is an interactive form, the form fields are locked and the user cannot change the form data.

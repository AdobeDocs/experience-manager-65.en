---
title: Enable multi-threaded file conversions
description: Learn how to enable multi-threaded file conversions.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/working_with_pdf_generator
products: SG_EXPERIENCEMANAGER/6.5/FORMS
feature: PDF Generator
exl-id: 402c1fd4-c6c8-494e-b452-b56a91c4a397
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Enable multi-threaded file conversions {#enabling-multi-threaded-file-conversions}

PDF Generator can run multiple file conversions concurrently to improve conversion throughput. Choose the applicable conversion mode:

| Conversion mode | Applications that support concurrent conversions | User account model |
|---|---|---|
| Multi-user mode | OpenOffice | A separate user account runs each OpenOffice instance. |
| Single-user mode | Microsoft&reg; Word and Microsoft&reg; Excel | One user account runs multiple Word and Excel instances. PowerPoint conversions remain serialized. |

Before enabling either mode, complete the [PDF Generator pre-installation configuration](/help/forms/using/install-configure-document-services.md#preinstallationconfigurations) for the applications and operating system that you use. For supported application versions, see [Software support for PDF Generator](/help/forms/using/aem-forms-jee-supported-platforms.md#software-support-for-pdf-generator).

## Multi-user mode {#multi-user-mode}

In multi-user mode, PDF Generator launches each OpenOffice instance under a separate user account. Configure enough valid administrative user accounts for the number of concurrent conversions that you require. In a cluster, configure the same accounts on every node.

On Windows, ensure that the PDF Generator users have the [Replace a process level token privilege](/help/forms/using/install-configure-document-services.md#grant-the-replace-a-process-level-token-privilege) and complete the applicable User Account Control configuration described in [Configure Document Services](/help/forms/using/install-configure-document-services.md#disable-user-account-control-uac).

### OpenOffice conversions {#openoffice-conversions}

Configure one PDF Generator user account for each OpenOffice instance that can run concurrently. Install OpenOffice in a location that every configured user can access, and dismiss the initial OpenOffice activation dialogs for each user.

For UNIX-based systems, complete the OpenOffice installation and user-permission requirements in [Configure Document Services](/help/forms/using/install-configure-document-services.md#preinstallationconfigurations).

## Single-user mode on Windows {#single-user-mode-on-windows}

Single-user mode lets PDF Generator run concurrent conversions under one configured user account.

In this mode, multiple instances of Microsoft&reg; Word (DOC and DOCX) and Excel (XLS and XLSX) run under the same user. Microsoft&reg; PowerPoint (PPT and PPTX) does not support single-user mode. PDF Generator launches only one PowerPoint instance at a time, so PowerPoint conversions are serialized.

To enable single-user mode for Word and Excel conversions:

1. In the administration console, navigate to **Home &gt; Services &gt; Applications and Services &gt; Service Management**.
1. Filter for **PDF Generator** and select **GeneratePDFService**.
1. On the **Configuration** tab, configure the following options:

   * Set **Enable Single User Mode For PDFMaker** to **true**.
   * Set **PDFMaker Pool Size** to the maximum number of Word instances that can run conversions concurrently.
   * Set **Enable Single User Mode For Native2PDF** to **true**.
   * Set **Native2PDF Pool Size** to the maximum number of Excel instances that can run conversions concurrently.

1. Restart the AEM Forms server.

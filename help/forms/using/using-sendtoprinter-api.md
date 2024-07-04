---
title: Using the sendToPrinter API
description: Using the sendToPrinter service to send a document to printer.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: document_services
feature: Document Services,APIs & Integrations
exl-id: 585d4053-1056-4d2b-a9df-9516775afe50
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# Using the sendToPrinter API {#using-the-sendtoprinter-api}

## Overview {#overview}

In AEM Forms, you can use the SendToPrinter service to send a document to printer. The SendToPrinter service supports the following printing access mechanisms:

* **Direct accessible printer** `: A printer that is installed on the same computer is called a direct accessible printer, and the computer is named printer host. This type of printer can be a local printer that is connected to the computer directly.`

* **Indirect accessible printer** `: The printer that is installed on a print server is accessed from other computers. Technologies such as the common UNIX® printing system (CUPS) and the Line Printer Daemon (LPD) protocol are available to connect to a network printer. To access an indirect accessible printer, specify the print server’s IP or host name. Using this mechanism, you can send a document to an LPD URI when the network has an LPD running. The mechanism lets you route the document to any printer that is connected to the network that has an LPD running.`

  When you send a document to a printer, specify one of these printing protocols:

    * **CUPS** `: A printing protocol named common UNIX printing system. This protocol is used for UNIX operating systems and enables a computer to function as a print server. The print server accepts print requests from client applications, processes them, and sends them to configured printers. On the IBM AIX® operating system, usage of CUPS is not recommended.`
    * ``**DirectIP** `: A standard protocol for remote printing and managing print jobs. This protocol can be used locally or remotely. Print queues are not required.`
    * ``**LPD** `: A printing protocol named Line Printer Daemon protocol or Line Printer Remote (LPR) protocol. This protocol provides network print server functionality for UNIX-based systems.`
    * **SharedPrinter** `: A printing protocol that enables a computer to use a printer that is configured for that computer.`
    * **CIFS**: The Output service supports the Common Internet File System (CIFS) printing protocol.

## Using SendToPrinter Service {#using-sendtoprinter-service}

The table below lists:

* information about the printerName or printServer to use for various protocols.
* value or exception a printer returns for various combinations of Printer Server URI and Name of the printer

|Protocol (Access Mechanism)|Print Server URI (PrinterSpec.printServer)|Name of the printer (PrinterSpec.printerName)|Result|
|--- |--- |--- |--- |
|SharedPrinter|Any|Empty|Exception: Required argument sPrinterName cannot be empty.|
|SharedPrinter|Any|Invalid|An exception states that the printer cannot be found.|
|SharedPrinter|Any|Valid|Successful print job.|
|LPD|Empty|Any|an exception stating that the required argument sPrintServerUri cannot be empty.|
|LPD|Invalid|Empty|an exception stating that the required argument sPrinterName cannot be empty.|
|LPD|Invalid|Not empty|an exception stating that sPrintServerUri is not found.|
|LPD|Valid|Invalid|an exception stating that the printer cannot be found.|
|LPD|Valid|Valid|A successful print job.|
|CUPS|Empty|Any|an exception stating that the required argument sPrintServerUri cannot be empty.|
|CUPS|Invalid|Any|an exception stating that the printer cannot be found.|
|CUPS|Valid|Any|Successful print job.|
|DirectIP|Empty|Any|an exception stating that the required argument sPrintServerUri cannot be empty.|
|DirectIP|Invalid|Any|an exception stating that the printer cannot be found.|
|DirectIP|Valid|Any|Successful print job.|
|CIFS|Valid|Empty|Successful print job.|
|CIFS|Invalid|Any|an unknown error while printing using CIFS.|
|CIFS|Empty|Any|an exception stating that the required argument sPrintServerUri cannot be empty.|

## Authentication Support {#authentication-support}

Authentication is supported only for CIFS printing. To authenticate, provide the username/password/domain in PrinterSpec. You can encrypt a password using AEM Granite CyprtoSupport Service by performing the following steps:

1. Go to https://&lt;server&gt;:&lt;port&gt;/system/console.

1. Go to **[!UICONTROL Main]** > **[!UICONTROL Crypto Support]**.

1. Enter some Plain text, and click **[!UICONTROL Protect]**.

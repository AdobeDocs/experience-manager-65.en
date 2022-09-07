---
title: Disable UAC for PDFG Configuration applicable to both JEE and OSGI
description: Steps to disable UAC for PDFG Configuration   
---
# Unable to convert Word and Excel files to PDF on Windows Server 2016 {#unable-to-convert-word-excel-files-PDF}

## Issue {#issue}

When user tries to convert Word and Excel files to PDF on Windows Server 2016, the following error is encountered as:

`Error message from the primary converter -
ALC-PDG-015-003-The system cannot open the input file. Please submit your file again or contact your system administrator.`

## Solution {#solution}

Perform the following steps to resolve the issue:
1. Navigate to `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system`. 
1. Ensure value of **EnableLUA** is set to 0 (zero). If the value is not 0, change the value to 0. 
1. Close the registry editor.

## Applies To {#appliesto}

This solution applies to the following:
* AEM Forms on JEE Server
* AEM Forms on OSGi Server
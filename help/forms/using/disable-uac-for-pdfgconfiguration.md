---
title: Disable UAC for PDFG Configuration applicable to both JEE and OSGI
description: Learn the steps on how you can disable UAC for PDFG Configuration to fix Word to PDF conversion.
exl-id: 785b7bb4-7158-45ea-a1e5-eebf3dc3ebc3
solution: Experience Manager, Experience Manager Forms
feature: "Adaptive Forms,Document Services"
role: User, Developer
---
# Unable to convert Word or Excel file to PDF on Windows Server {#unable-to-convert-word-excel-files-PDF}

## Issue {#issue}

When user tries to convert Word or Excel files to PDF on Microsoft&reg; Windows Server, the following error is encountered as:

*Error message from the primary converter:*
*ALC-PDG-015-003-The system cannot open the input file. Submit your file again or contact your system administrator.*


## Solution {#solution}

Do the following:

1. To access the System Configuration Utility, go to **[!UICONTROL Start &gt; Run]** and then enter **[!UICONTROL MSCONFIG]**.
1. Click the **[!UICONTROL Tools]** tab and scroll down and select **[!UICONTROL Change UAC Settings]**. Click **[!UICONTROL Launch]** so you can run the command in a new window.
1. Adjust the slider to the Never notify level. When finished, close the command window and close the System Configuration window.
1. Verify that registry setting for UAC is set to 0 (zero). Perform the following steps to verify:

    1. Microsoft&reg; recommends backing up the registry before you modify it. For detailed steps, see [How to back up and restore the registry in Windows](https://support.microsoft.com/en-us/help/322756).
    1. Open Microsoft&reg; Windows Registry editor. To open registry editor, go to Start &gt; Run, type regedit, and click OK.
    1. Navigate to `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system\`. Ensure the value of EnableLUA is set to 0 (zero).
    1. Ensure value of **EnableLUA** is set to 0 (zero). If the value is not 0, change the value to 0. Close the registry editor.

1. Restart your computer.

## Applies To {#appliesto}

This solution applies to AEM Forms on JEE Server and AEM Forms on OSGi Server.

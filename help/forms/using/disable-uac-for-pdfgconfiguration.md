---
title: Disable UAC for PDFG Configuration applicable to both JEE and OSGI
description: Learn the steps on how you can disable UAC for PDFG Configuration to fix Word to PDF conversion.
exl-id: 785b7bb4-7158-45ea-a1e5-eebf3dc3ebc3
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,Document Services
role: User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
  - id: f19cff18-c8cc-4a4b-adad-85dd2fa3dbe2
    internal-label: Document Services
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
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

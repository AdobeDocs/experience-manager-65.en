---
title: This article includes the instruction to uninstall the Forms add-on package using CRX Package Manager.
description: Learn the steps to uninstall the Forms add-on package using CRX Package Manager.
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---

# Uninstall AEM Forms Add-on Package from AEM Instance

This article outlines the steps required to properly uninstall the AEM Forms add-on package from an AEM Forms SDK instance. Following these steps to ensure removal of the Forms add-on package, preventing potential issues with your AEM environment.

## Pre-requisites

Ensure to take backup of forms and data to avoid data loss.

## To uninstall AEM Forms Add-on Package

To uninstall the AEM Forms Add-on Package, perform the following steps:

1. **Uninstall the AEM Forms Add-on package:**
   1. Navigate to the `http://[host]:[port]/crx/de/index.jsp`.
   1. Locate and uninstall the `AEM Forms add-on package`.
   
   ![Uninstall package](/help/forms/using/assets/uninstall-aem-forms-package.png)

1. **Delete the native folder from CRXDE:**
   1. Navigate to the `http://[host]:[port]/crx/de/index.jsp`.
   1. Go to `/libs/fd/native/install` and delete `native` folder in CRXDE.
   
   ![Delete native node from CRX/de](/help/forms/using/assets/native-install-folder-crxde.png)


1. **Stop the AEM Forms SDK:**
   1. Stop the AEM Forms SDK instance by using the 'Ctrl + C' command.

1. **Check for the install and bedrock folders in crx-quickstart folder**
     1. Navigate to `..author\crx-quickstart` folder in the AEM Forms SDK instance.
     2. Search for folders named `bedrock` and `install`.
   If found, ensure they are deleted from the `crx-quickstart` folder in the AEM Forms SDK instance.

   >[!NOTE]
   >
   > The `bedrock` folder is created again automatically when you restart the AEM Forms SDK instance. 
  
1. **Restart the AEM Instance:**
   1. Once all the previous steps are completed, [restart the AEM Forms SDK instance](/help/forms/using/restart-aem-sdk.md).
   






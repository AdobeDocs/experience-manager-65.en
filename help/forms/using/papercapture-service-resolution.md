---
title: Troubleshooting Article to Resolve the Issue When the PaperCapture Service Fails to Perform OCR (Optical Character Recognition) Operations on PDFs.
description: Learn the steps to resolve the issue where the PaperCapture service fails to perform OCR (Optical Character Recognition) operations on PDFs.
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---

# PaperCature Service fails to perform OCR on PDFs

## Issue

After upgrading to AEM Forms Service Pack 6.5.21.0, the `PaperCapture` service fails to perform OCR (Optical Character Recognition) operations on PDFs. The service does not generate output in the form of a PDF or a log file.

## Solution 

1. Download the [hotfix](https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fexperience.adobe.com%2F%23%2Fdownloads%2Fcontent%2Fsoftware-distribution%2Fen%2Faem.html%3Fpackage%3D%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Fadobe%2Fpackages%2Fcq650%2Fhotfix%2FPaperCaptureSvc.zip&data=05%7C02%7Cruchitas%40adobe.com%7Ca285aedf27094c9e8d9b08dc91e26aa7%7Cfa7b1b5a7b34438794aed2c178decee1%7C0%7C0%7C638545648843177070%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=uWk0PsSSDjLRxqEMGMW%2BbD%2Fv4egR4vWL%2B0mfKpXdrKQ%3D&reserved=0) from the Software Distribution portal. 
1. Extract and copy the content of the downloaded folder.
1. Navigate to the paths below for the respective application servers:
    * **jboss**: 
  `..\Adobe\Adobe_Experience_Manager_Forms\jboss\standalone\svcnative\PaperCaptureSvc`
    * **weblogic**: 
    `..\Adobe\Adobe_Experience_Manager_Forms\crx-repository\bedrock\svcnative\PaperCaptureSvc`
    * **websphere**:      
    `..\Adobe\Adobe_Experience_Manager_Forms\crx-repository\bedrock\svcnative\PaperCaptureSvc`
    * **OSGi setup**:  
    `..\quickstart\crx-quickstart\bedrock\svcnative\PaperCaptureSvc`
1. Replace the existing contents of the `PaperCaptureSvc` folder with the copied content.
1. [Restart the AEM instance](/help/forms/using/restart-aem-sdk.md).



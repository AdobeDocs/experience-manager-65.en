---
title: Connection issues with Output, Forms, and (Document of Record) DoR Services
description: Resolve AEM Forms connection errors post SP19. Stop, install Microsoft Visual C++, restart server for a seamless solution. Troubleshoot Output, Forms, DoR services.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
docset: aem65
role: Admin
exl-id: bd58099c-08cd-4056-afb6-a5935454429a
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms, Troubleshooting
---
# Unable to use Output service, Forms service, or Document of Record (DoR) service {#unable-to-use-output-service-forms-service-or-document-of-record-service}

## Issue

After installing AEM Forms 6.5 Service Pack 19, attempting to use the Output service, Forms service, or Document of Record (DoR) service may result in a `Connection to failed service` error.

## Solution 

To solve the issue:

1. Stop your AEM 6.5 Forms instance.
1. Download and install the [64-bit version of Microsoft Visual C++ Redistributable packages for Visual Studio 2015, 2017, 2019, and 2022](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170#visual-studio-2015-2017-2019-and-2022) on the computer where AEM 6.5 Forms is installed.
1. Restart the AEM Forms server. 

    >[!NOTE]
    >
    > It is recommended to use the 'Ctrl + C' command to restart the SDK. Restarting the AEM SDK using alternative methods, for example, stopping Java processes, may lead to inconsistencies in the AEM development environment.


>[!NOTE]
>
>
> Ensure that you install the Redistributable, even if a previous version is installed.

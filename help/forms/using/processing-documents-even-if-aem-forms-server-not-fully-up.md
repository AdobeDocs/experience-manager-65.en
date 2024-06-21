---
title: AEM Forms Server starts processing the documents even before all the services are up and running.
description: AEM Forms Server starts processing the documents even before all the services are up and running on JEE Server and OSGi Server.
exl-id: 1a1bc1cb-e0ce-49a0-9b05-ae59f900cfb2
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms, Troubleshooting
role: User, Developer
---
# AEM Forms Server starts processing the documents even before all the services are up and running{#aem-forms-server-start-processing-documents-even-if-it-is-not-fully-up}

## Issue {#issue}

<!--When user restarts AEM Forms server, the current calling processes or services still continue such as rendering PDF documents and more. It causes the restart of the AEM Forms server to not startup correctly.-->

Before the AEM Forms Server is fully up and all the applications are up and running, AEM Forms Server starts processing the documents.


## Applies to {#applies-to}

The solution applies to AEM Forms on JEE Server and AEM Forms on OSGi Server.

## Solution {#solution}

To resolve the issue, add an argument `Dcom.adobe.livecycle.dsc.deferServiceStart=true` to the [batch file](https://experienceleague.adobe.com/docs/experience-manager-65/deploying/deploying/command-line-start-and-stop.html#windows-platform-start-bat-script-example) during server startup.

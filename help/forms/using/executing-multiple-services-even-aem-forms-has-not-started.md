---
title: Executing multiple services despite AEM Forms has not started.
description: Even if the AEM Forms has not started fully, it processes multiple services.
exl-id: 4ec40412-15b1-434b-a919-2cf23f48077c
---
# Executing multiple services despite AEM Forms has not started completely{#steps-to-resolve-error-after-installing-service-pack}


## Issue {#issue}

When user restarts AEM Forms, the current calling processes still continue such as rendering PDF documents and more. It causes the restart of the AEM Forms server to not start-up correctly.

## Applies to {#applies-to}

The solution applies to AEM Forms on JEE Server and AEM Forms on OSGi Server.

## Solution {#solution}

To resolve the issue, users add an argument `Dcom.adobe.livecycle.dsc.deferServiceStart=true` to [batch file](https://experienceleague.adobe.com/docs/experience-manager-65/deploying/deploying/command-line-start-and-stop.html#windows-platform-start-bat-script-example) during server startup.

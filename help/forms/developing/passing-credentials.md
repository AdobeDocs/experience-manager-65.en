---
title: Pass credentials using WS-security headers
description: Learn how to pass credentials using WS-security headers
exl-id: 519d57ad-81ab-4caf-ae25-4390ae2eee13
---
# Passing credentials using WS-Security headers {#using-execute-script-service-aem-forms-jee-workbench}

When invoking an AEM Forms on JEE service using web services, you can use WS-Security headers to pass client authentication information that is required by AEM Forms on JEE. WS-Security defines SOAP extensions to implement client authentication, message confidentiality, and message integrity. As a result, you can invoke AEM Forms on JEE services when AEM Forms on JEE is deployed as stand-alone server or within a clustered environment.

How you pass WS-Security headers to AEM Forms on JEE depends on whether you are using Axis-generated Java classes or a .NET client assembly that consumes a service's native SOAP stack.

>[!NOTE]
>
>As an example of invoking a service using WS-Security headers, this topic encrypts a PDF document with a password by invoking the Encryption service.

This document covers the following topics:

* Passing client authentication using Axis-generated Java classes

* Generating Axis library files required to invoke the Encryption service

* Invoking the Encryption service using a WS-Security header

* Passing client authentication using a .NET client assembly

* Invoking the Encryption service using a WS-Security header


## Requirements {#requirements}

In order to make the most of this document, you need to have a solid understanding of the AEM Forms on JEE software.

>[!MORELIKETHIS]
>
>* [Passing credentials using WS-Security headers](assets/passing-credentials-using-ws-security-headers.pdf)

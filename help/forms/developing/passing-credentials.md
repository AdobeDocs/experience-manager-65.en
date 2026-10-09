---
title: Pass credentials using WS-security headers
description: Learn how to pass credentials using WS-security headers
exl-id: 519d57ad-81ab-4caf-ae25-4390ae2eee13
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,Document Security
role: User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: 50158d81-1c06-57f7-8bd7-e8ff76a93f85
    internal-label: Document Security
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
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

To make the most of this document, you need to have a solid understanding of the AEM Forms on JEE software.

>[!MORELIKETHIS]
>
>* [Passing credentials using WS-Security headers](assets/passing-credentials-using-ws-security-headers.pdf)

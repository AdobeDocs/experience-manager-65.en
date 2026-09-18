---
title: Mitigating SOAP Service SSRF and Remote Code Execution Vulnerabilities for AEM Forms on JEE
description: Learn about the server-side request forgery (SSRF), arbitrary file read, and remote code execution vulnerabilities affecting SOAP services in AEM Forms on JEE, and how to resolve them.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: Security
geptopics: SG_AEMFORMS/categories/jee
role: Admin
solution: Experience Manager, Experience Manager Forms
release-date: 2026-09-18
---
# Mitigating SOAP Service SSRF and Remote Code Execution Vulnerabilities for AEM Forms on JEE {#mitigating-soap-service-vulnerabilities-aem-forms}

## Quick Reference

| **Impact Level** | **Affected Versions** | **Recommended Action** |
|---|---|---|
| **Critical** | AEM 6.5 Forms on JEE Service Pack 25 (6.5.25.0) and earlier | [Install the latest hotfix](#resolution) |
| **Not Affected** | AEM Forms on OSGi, AEM Forms as a Cloud Service | No action required |

## Overview

A set of vulnerabilities was identified in the SOAP web services exposed by AEM Forms on JEE. In each case, a request to an affected SOAP service can cause the server to access unintended resources, such as local files or internal network endpoints, or to execute code. The latest hotfix hardens these services by validating the protocols and inputs they accept and by enforcing authentication on the affected endpoints.

### What's Affected

| Vulnerability | Impact | Affected Capability |
|---|---|---|
| Arbitrary file read and server-side request forgery (SSRF) | An authenticated user can cause the server to read local files or send outbound requests to internal endpoints, and receive the results. | Assembler Service |
| Server-side request forgery (SSRF) leading to remote code execution | An authenticated user can trigger outbound LDAP or RMI lookups that can lead to remote code execution. | Forms Service |
| Remote code execution through PostScript injection | An authenticated administrator can inject PostScript that runs operating-system commands during PDF conversion. | PDF Generator (Distiller) |
| Arbitrary file read, SSRF, and unauthenticated document exposure | An authenticated user can cause the server to read local files, and generated documents can be retrievable without authentication. | Output Service and Document Manager |

### What's Not Affected

- Experience Manager Forms on OSGi (all versions)
- Experience Manager Forms as a Cloud Service

Experience Manager Forms Workbench is not affected by these vulnerabilities. However, applying the hotfix requires you to update to the latest Workbench installer. For details, see [AEM Forms hotfixes](/help/release-notes/aem-forms-hotfix.md).

## Resolution {#resolution}

To resolve these vulnerabilities:

1. [Download and install the AEM Forms on JEE hotfix](/help/release-notes/aem-forms-hotfix.md) for AEM Service Pack 6.5.25.0, and follow the standard [AEM Forms JEE patch installation instructions](/help/release-notes/jee-patch-installer-65.md).
1. Install the vulnerability fix bundle. For the download link and installation steps, see [AEM Forms hotfixes](/help/release-notes/aem-forms-hotfix.md).
1. Update to the latest AEM Forms Workbench installer. For details, see [AEM Forms hotfixes](/help/release-notes/aem-forms-hotfix.md).
1. If your projects use AEM Forms client library files such as `adobe-livecycle-client.jar`, use the updated version after installing the hotfix and bundle. For details, see [Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files).

The hotfix is cumulative, so you can apply it on Service Pack 25 (6.5.25.0) or an earlier Service Pack without installing Service Pack 25 first.

## References

- [CWE-918: Server-Side Request Forgery (SSRF)](https://cwe.mitre.org/data/definitions/918.html)
- [CWE-94: Improper Control of Generation of Code ('Code Injection')](https://cwe.mitre.org/data/definitions/94.html)
- [CWE-306: Missing Authentication for Critical Function](https://cwe.mitre.org/data/definitions/306.html)
- [OWASP Server Side Request Forgery Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Server_Side_Request_Forgery_Prevention_Cheat_Sheet.html)
- [Adobe Experience Manager Forms Security Best Practices](https://experienceleague.adobe.com/docs/experience-manager-65/administering/security/security.html)

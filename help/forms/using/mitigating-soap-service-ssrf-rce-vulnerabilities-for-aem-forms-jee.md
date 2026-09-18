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
| **Critical** | AEM 6.5 Forms on JEE Service Pack 25 (6.5.25.0) | [Install the latest hotfix](#resolution) |
| **Critical** | AEM 6.5 Forms on JEE Service Pack 24 (6.5.24.0) and earlier | Upgrade to a supported Service Pack, then install the latest hotfix |
| **Not Affected** | AEM Forms on OSGi, Workbench, AEM Forms as a Cloud Service | No action required |

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
- Experience Manager Forms Workbench (all versions)
- Experience Manager Forms as a Cloud Service

## Resolution {#resolution}

To resolve these vulnerabilities:

1. [Download and install the AEM Forms on JEE hotfix](/help/release-notes/aem-forms-hotfix.md) for AEM Service Pack 6.5.25.0.
1. Follow the standard [AEM Forms JEE patch installation instructions](/help/release-notes/jee-patch-installer-65.md).

>[!IMPORTANT]
>
>This hotfix includes a vulnerability fix bundle that you must install after applying the patch. For the download link and installation steps, see [AEM Forms hotfixes](/help/release-notes/aem-forms-hotfix.md).

If you are on AEM 6.5 Forms on JEE Service Pack 24 (6.5.24.0) or earlier, [upgrade to a supported Service Pack version](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md) before installing the hotfix.

## References

- [CWE-918: Server-Side Request Forgery (SSRF)](https://cwe.mitre.org/data/definitions/918.html)
- [CWE-94: Improper Control of Generation of Code ('Code Injection')](https://cwe.mitre.org/data/definitions/94.html)
- [CWE-306: Missing Authentication for Critical Function](https://cwe.mitre.org/data/definitions/306.html)
- [OWASP Server Side Request Forgery Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Server_Side_Request_Forgery_Prevention_Cheat_Sheet.html)
- [Adobe Experience Manager Forms Security Best Practices](https://experienceleague.adobe.com/docs/experience-manager-65/administering/security/security.html)
